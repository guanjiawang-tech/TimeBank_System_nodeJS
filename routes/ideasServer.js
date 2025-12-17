const express = require('express');  
const router = express.Router();

// 使用已有的连接池  位置在本目录下的db.js
const pool = require('./db');

// 全部遍历ideas ,降序
router.get('/getIdeasAll', (req, res) => {
    pool.query("SELECT `ideasbox`.*, users.username FROM `ideasbox` JOIN users ON (ideasbox.userid = users.userId) ORDER BY `dateInfo` DESC", (error, results, fields) => {  
      if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
    });  
});

// 添加 ideas
router.get('/addIdea', (req, res) => {
  const dateInfo = req.query.dateInfo
  const userid = req.query.userid
  const ideatext = req.query.ideatext
  pool.query("INSERT INTO `ideasbox` VALUES (?,?,?)", [dateInfo,userid,ideatext], (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
});

module.exports = router;