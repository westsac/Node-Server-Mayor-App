var express = require('express');
var cors = require('cors');
var router = express.Router();

var db = require('../queries');

var whitelist = ['https://ancient-forest-34366.herokuapp.com', 'http://herokuapp.com']
var corsOptions = {
  origin: function (origin, callback) {
    if (whitelist.indexOf(origin) !== -1) {
      callback(null, true)
    } else {
      callback(new Error('Not allowed by CORS'))
    }
  }
}


router.get('/api/interests', db.getAllInterests);
router.post('/api/answers', db.createInterests);

router.get('/api/interests/:id', db.getSingleInterests);
router.put('/api/answers/:id', db.updateInterests);
router.delete('/api/interests/:id', db.removeInterests);

/* GET home page. */
router.get('/', cors(), function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;
