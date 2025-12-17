const express = require('express');  
const router = express.Router();

// 使用已有的连接池  位置在本目录下的db.js
const pool = require('./db');

// 遍历 location
router.get('/toGetAllProvinces', (req, res) => {
    pool.query("SELECT locationinfo.locationInfoProvinces FROM locationinfo GROUP BY locationInfoProvinces", (error, results, fields) => {  
      if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
    });
});

router.get('/toGetAllCitiesByProvinces', (req, res) => {
    const activityLocation = req.query.locationInfoProvinces; 
    pool.query("SELECT locationinfo.locationInfoCities, locationinfo.locationInfoCounties FROM locationinfo WHERE locationInfoProvinces = ? GROUP BY locationInfoCities,locationinfo.locationInfoCounties", [activityLocation], (error, results, fields) => {  
      if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
    });
});

router.get('/selectLocation', (req, res) => {
  pool.query("SELECT * FROM `locationinfo`", (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
}); 

module.exports = router;