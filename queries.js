var promise = require('bluebird');

var options = {
    //Initialization options
    promiseLib: promise
};

var pgp = require('pg-promise')(options);
var connectionString = 'postgres://ihnahrcxsglfvy:d72d1752340ac302a356637fdb0b104628c9b3e1c967e901a6a8160a780de958@ec2-54-235-92-236.compute-1.amazonaws.com:5432/ddpb5i2a5pd1o1';
var db = pgp(connectionString);


// get all photo/picture information with statistics
function getAllInterests(req, res, next) {
    db.any('select * from samples s, quiz q, pictures p, quiz_picture_attributes qpa inner join picture_attributes pa on (qpa.quiz_attr_id = pa.quiz_attr_id) where p.picture_id = qpa.picture_id;')
        .then(function(data) {
            res.status(200)
            .json({
                status: 'success',
                data: data, 
                message: 'Retreived all interests'
            });
        })
        .catch(function(err) {
            return next(err);
        });
}

// get a single instance of a photo with id
function getSingleInterests(req, res, next) {
  var interestID = parseInt(req.params.id);
  db.any('select * from pictures p, quiz_picture_attributes qpa, picture_attributes pa where p.picture_id = $1 and p.picture_id = qpa.picture_id and qpa.quiz_attr_id = pa.quiz_attr_id;', interestID)
    .then(function (data) {
      res.status(200)
        .json({
          status: 'success',
          data: data,
          message: 'Retrieved ONE Interests'
        });
    })
    .catch(function (err) {
      return next(err);
    });
}

// create a new sample with photos and categories
function createInterests(req, res, next) {
  req.body.age = parseInt(req.body.age);
  db.any('insert into answers( answer_id, person_id, sample_id, date_completed, voting) ' +
      'values(${answer_id}, ${person_id}, ${sample_id}, ${date_completed}, ${voting});',
    req.body)
    .then(function () {
      res.status(200)
        .json({
          status: 'success',
          message: 'Inserted one Interests'
        });
    })
    .catch(function (err) {
      return next(err);
    });
}

// update answers with user choices
function updateInterests(req, res, next) {
  db.any('update answers set answer_id=$1, date_completed=$2, person_id=$3, sample_id=$4 where id=$5;',
    [parseInt(req.params.answer_id), parseInt(req.params.date_completed), parseInt(req.body.person_id),
       parseInt(req.params.sample_id)])
    .then(function () {
      res.status(200)
        .json({
          status: 'success',
          message: 'Updated Answers'
        });
    })
    .catch(function (err) {
      return next(err);
    });
}

// delete interests/quiz 
function removeInterests(req, res, next) {
  var interestID = parseInt(req.params.id);
  db.result('delete from answers where answer_id = $1;', interestID)
    .then(function (result) {
      /* jshint ignore:start */
      res.status(200)
        .json({
          status: 'success',
          message: `Removed ${result.rowCount} Interests`
        });
      /* jshint ignore:end */
    })
    .catch(function (err) {
      return next(err);
    });
}

//add query functions
module.exports = {
    getAllInterests: getAllInterests,
    getSingleInterests: getSingleInterests,
    createInterests: createInterests,
    updateInterests: updateInterests,
    removeInterests: removeInterests
};

