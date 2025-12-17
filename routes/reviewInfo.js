const express = require('express');  
const router = express.Router();

// 使用已有的连接池  位置在本目录下的db.js
const pool = require('./db');

// 添加回复信息


// 删除回复信息 
router.get('/deleteReview', (req, res) => {
    const forumid = req.query.forumid
    const userid = req.query.userid
    const forumdate = req.query.forumdate
    const touserid = req.query.touserid
    pool.query("DELETE FROM review WHERE forumid=? AND userid = ? AND forumdate = ? AND touserid = ?", [forumid,userid,forumdate,touserid], (error, results, fields) => {  
        if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
        }  
        res.json(results);  
    });  
});

module.exports = router; 