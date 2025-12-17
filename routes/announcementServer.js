const express = require('express');  
const router = express.Router();

// 使用已有的连接池  位置在本目录下的db.js
const pool = require('./db');

// 查询第一条公告
router.get('/getAnnouncementFirst', (req, res) => {
    pool.query("SELECT * FROM announcement ORDER BY announcement.announcementFromtime DESC LIMIT 1", (error, results, fields) => {  
      if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
    });  
});  

// 遍历公告
router.get('/getAnnouncementAll', (req, res) => {
    pool.query("SELECT *  FROM announcement ORDER BY announcement.announcementFromtime DESC", (error, results, fields) => {  
      if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
    });  
});  

// 添加 公告  INSERT INTO announcement VALUES (?,?,?,?)
router.get('/addAnnouncement', (req, res) => {
  const announcementId = req.query.announcementId
  const announcementTitle = req.query.announcementTitle
  const announcementFromtime = req.query.announcementFromtime
  const announcementText = req.query.announcementText

  pool.query("INSERT INTO announcement VALUES (?,?,?,?)", [announcementId, announcementTitle, announcementFromtime, announcementText], (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
}); 

module.exports = router;