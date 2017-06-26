DROP DATABASE IF EXISTS interests;
CREATE DATABASE interests;

\c interests;

CREATE TABLE quiz (
    quiz_id SMALLINT PRIMARY KEY,
    question VARCHAR
);

CREATE TABLE persons (
    person_id VARCHAR(16) PRIMARY KEY,
    first_name VARCHAR(24), 
    last_name VARCHAR(24),
    profile_pic VARCHAR(36),
    role_status VARCHAR(24)
);

CREATE TABLE attributes (
    attribute_id VARCHAR(16) PRIMARY KEY,
    attribute_name VARCHAR(36),
    attribute_desc VARCHAR(99),
    attribute_value INTEGER
);

CREATE TABLE pictures (
    picture_id SMALLINT PRIMARY KEY,
    image_url VARCHAR
);

CREATE TABLE quiz_picture_attributes (
    quiz_attr_id SMALLINT PRIMARY KEY,
    quiz_id SMALLINT references quiz,
    picture_id SMALLINT references pictures
);

CREATE TABLE picture_attributes (
    picture_attributes_id SMALLINT PRIMARY KEY,
    attribute_id VARCHAR(16) references attributes,
    att_cat_value SMALLINT,
    quiz_attr_id SMALLINT references quiz_picture_attributes
);

CREATE TABLE samples (
    sample_id SMALLINT PRIMARY KEY,
    date_created DATE,
    person_id VARCHAR references persons,
    quiz_id SMALLINT references quiz
);

CREATE TABLE answers (
    answer_id SMALLINT PRIMARY KEY,
    date_completed TIMESTAMP,
    person_id VARCHAR references persons,
    sample_id SMALLINT references samples,
    voting TEXT[]
);

INSERT INTO quiz VALUES
    ('2001', 'Would you use this near your home?');


INSERT INTO persons VALUES 
    ('007', 'James', 'Bond', 0, 'Civilian'),
    ('23', 'Michael', 'Jordan', 0, 'Civilian'),
	('3416', 'Clyde', 'Pabro', 0, 'Employee');

INSERT INTO attributes VALUES 
    ( 'A1', 'LDT', 'Low Density Trees', '0'),
    ( 'A2', 'MDT', 'Medium Density Trees', '0'),
    ( 'A3', 'HDT', 'High Density Trees', '0'),
    ( 'A4', 'LDP','Low Density Playground', '0'),
    ( 'A5', 'HDP','High Density Playground', '0'),
    ( 'A6', 'TRL','Walking Trails', '0'),
    ( 'A7', 'TBL','TABLES', '0'),
    ( 'A8', 'BBF','Baseball Field', '0'),
    ( 'A9', 'BKC','Basketball Courts', '0'),
    ( 'A10', 'SCC','Soccer Field', '0');

INSERT INTO pictures VALUES 
    ( '100', 'https://s3-us-west-1.amazonaws.com/cows-app-pictures/images/park1.jpg'),
    ( '101', 'https://s3-us-west-1.amazonaws.com/cows-app-pictures/images/park2.jpg'),
    ( '102', 'https://s3-us-west-1.amazonaws.com/cows-app-pictures/images/park3.jpg'),
    ( '103', 'https://s3-us-west-1.amazonaws.com/cows-app-pictures/images/park4.jpg'),
    ( '104', 'https://s3-us-west-1.amazonaws.com/cows-app-pictures/images/park5.jpg'),
    ( '105', 'https://s3-us-west-1.amazonaws.com/cows-app-pictures/images/park6.jpg'),
    ( '106', 'https://s3-us-west-1.amazonaws.com/cows-app-pictures/images/park7.jpg'),
    ( '107', 'https://s3-us-west-1.amazonaws.com/cows-app-pictures/images/park8.jpg'),
    ( '108', 'https://s3-us-west-1.amazonaws.com/cows-app-pictures/images/park9.jpg'),
    ( '109', 'https://s3-us-west-1.amazonaws.com/cows-app-pictures/images/park10.jpg'),
    ( '110', 'https://s3-us-west-1.amazonaws.com/cows-app-pictures/images/park11.jpg'),
    ( '111', 'https://s3-us-west-1.amazonaws.com/cows-app-pictures/images/park12.jpg'),
    ( '112', 'https://s3-us-west-1.amazonaws.com/cows-app-pictures/images/park13.jpg'),
    ( '113', 'https://s3-us-west-1.amazonaws.com/cows-app-pictures/images/park14.jpg'),
    ( '114', 'https://s3-us-west-1.amazonaws.com/cows-app-pictures/images/park15.jpg');

INSERT INTO quiz_picture_attributes VALUES 
    ( '200', '2001', '100'),
    ( '201', '2001', '101'),
    ( '202', '2001', '102'),
    ( '203', '2001', '103'),
    ( '204', '2001', '104'),
    ( '205', '2001', '105'),
    ( '206', '2001', '106'),
    ( '207', '2001', '107'),
    ( '208', '2001', '108'),
    ( '209', '2001', '109'),
    ( '210', '2001', '110'),
    ( '211', '2001', '111'),
    ( '212', '2001', '112'),
    ( '213', '2001', '113'),
    ( '214', '2001', '114');

INSERT INTO picture_attributes VALUES
    ( '401', 'A5', '1', '200'),
    ( '402', 'A4', '1', '201'),
    ( '403', 'A9', '1', '202'),
    ( '404', 'A7', '1', '202'),
    ( '405', 'A5', '1', '203'),
    ( '406', 'A4', '1', '204'),
    ( '407', 'A4', '1', '205'),
    ( '408', 'A7', '1', '205'),
    ( '409', 'A7', '1', '206'),
    ( '410', 'A6', '1', '207'),
    ( '411', 'A7', '1', '207'),
    ( '412', 'A6', '1', '208'),
    ( '413', 'A3', '1', '209'),
    ( '414', 'A1', '1', '210'),
    ( '415', 'A7', '1', '211'),
    ( '416', 'A6', '1', '212'),
    ( '417', 'A7', '1', '213'),
    ( '418', 'A6', '1', '214');

INSERT INTO samples
   VALUES ( '3001', 'March 20, 2017', '007', '2001');
