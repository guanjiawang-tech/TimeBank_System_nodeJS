const express = require('express');  
const router = express.Router();

// 使用已有的连接池  位置在本目录下的db.js
const pool = require('./db');

// 添加评论
router.get('/insertReview', (req, res) => {
    const forumid = req.query.forumid
    const userid = req.query.userid
    const review = req.query.review
    const touserid = req.query.touserid
    pool.query("INSERT INTO review VALUES (?,?,NOW(),?,?)", [forumid, userid, review, touserid], (error, results, fields) => {  
        if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
        }  
        res.json(results);  
    });  
});

// 添加社区论坛信息
router.get('/insertForum', (req, res) => {
    const userid = req.query.userid
    const forumtitle = req.query.forumtitle
    const forumtext = req.query.forumtext
    pool.query("INSERT INTO forum VALUES (LEFT(REPLACE(UUID(), '-', ''), 18),?,NOW(),?,?)", [userid, forumtitle, forumtext], (error, results, fields) => {  
        if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
        }  
        res.json(results);  
    });  
});

// 查询社区论坛信息
router.get('/selectForum', (req, res) => {
    pool.query("SELECT forum.forumid,forum.userId,forumdate,forumtitle,forumtext,users.username,COUNT(likeforum.userid) AS likenumber FROM forum JOIN users ON (forum.userId = users.userid) LEFT JOIN likeforum ON (forum.forumid = likeforum.forumid) GROUP BY forum.forumid,forum.userid,  forum.forumdate,forum.forumtitle,forum.forumtext,users.username ORDER BY forumdate DESC", (error, results, fields) => {  
        if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
        }  
        res.json(results);  
    });  
});

// 查询评论
router.get('/selectReview', (req, res) => {
    const forumid = req.query.forumid
    // b14921735aff11ef91
    pool.query("SELECT forumid,review.userid,forumdate,review,touserid,u1.username,u2.username AS tonickname FROM review JOIN users u1 ON (review.userid = u1.userId) JOIN users u2 ON (review.touserid = u2.userId) WHERE forumid = ? ORDER BY forumdate", [forumid], (error, results, fields) => {  
        if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
        }  
        res.json(results);  
    });  
});

// 点赞操作
router.get('/insertLikeForum', (req, res) => {
    const userid = req.query.userid
    const forumid = req.query.forumid
    pool.query("INSERT INTO likeforum VALUES (?,?)", [userid,forumid], (error, results, fields) => {  
        if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
        }  
        res.json(results);  
    });  
});

// 取消点赞操作
router.get('/deleteLikeForum', (req, res) => {
    const userid = req.query.userid
    const forumid = req.query.forumid
    pool.query("DELETE FROM likeforum WHERE userid = ? AND forumid = ?", [userid,forumid], (error, results, fields) => {  
        if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
        }  
        res.json(results);  
    });  
});

// 查询点赞操作
router.get('/selectLikeForum', (req, res) => {
    const userid = req.query.userid
    pool.query("SELECT forumid FROM likeforum WHERE userid = ?", [userid], (error, results, fields) => {  
        if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
        }  
        res.json(results);  
    });  
});

// 点赞个数操作
router.get('/selectLikeNum', (req, res) => {
    const forumid = req.query.forumid
    pool.query("SELECT COUNT(*) AS likenumber FROM likeforum WHERE forumid = ?", [forumid], (error, results, fields) => {  
        if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
        }  
        res.json(results);  
    });  
});

// 删除操作
router.get('/deleteForum', (req, res) => {
    const forumid = req.query.forumid
    pool.query("DELETE FROM forum WHERE forumid = ?", [forumid], (error, results, fields) => {  
        if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
        }  
        res.json(results);  
    });  
});

module.exports = router;