/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80035
 Source Host           : localhost:3306
 Source Schema         : zhuxiyang

 Target Server Type    : MySQL
 Target Server Version : 80035
 File Encoding         : 65001

 Date: 17/05/2026 16:18:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `activeid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动id',
  `starttime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `overtime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `activeaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `activestatus` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '志愿者id',
  `number` int(0) NOT NULL COMMENT '参与人数，根据状态不同修改人数',
  `activetext` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动简介',
  `activename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名',
  PRIMARY KEY (`activeid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('20d3abf966b011efb0', '2024-09-18 13:00:00', '2024-09-18 17:00:00', '辽宁省铁岭市开原市龙翔社区', '2', '006', 30, '比拼厨艺技能', '厨艺大赛');
INSERT INTO `activity` VALUES ('6c81e25f678411efb0', '2024-10-12 08:00:00', '2024-10-12 16:00:00', '辽宁省铁岭市开原市龙翔社区', '1', '007', 108, '象棋比赛提高智力', '象棋比赛');
INSERT INTO `activity` VALUES ('a79252fc7c1e11efb7', '2024-10-01 23:45:59', '2024-10-04 23:46:05', '辽宁省铁岭市清河区安丰社区', '2', '006', 21, '下棋活动', '下棋');
INSERT INTO `activity` VALUES ('b0ed77eb667111efb0', '2024-09-20 09:00:00', '2024-09-23 16:00:00', '辽宁省铁岭市开原市龙翔社区', '2', '006', 200, '在这个阳光明媚、充满生机与活力的日子里，我们欢聚一堂，共同迎来了这场意义非凡的老年运动会。首先，请允许我代表组委会，向所有积极参与、热情筹备此次运动会的老年朋友们表示最热烈的欢迎和最诚挚的感谢！您们的到来，不仅为这场运动会增添了无限的光彩，更是展现了新时代老年人积极向上、健康乐观的精神风貌。', '运动会');
INSERT INTO `activity` VALUES ('c34b5dae683111efb0', '2024-09-01 08:00:00', '2024-12-01 16:00:00', '辽宁省铁岭市开原市龙翔社区', '1', '004', 60, '国际象棋比赛', '国际象棋');
INSERT INTO `activity` VALUES ('c6e9c73d660d11efb0', '2024-08-15 21:49:52', '2024-08-17 21:49:55', '辽宁省铁岭市开原市龙翔社区', '1', '006', 66, '简介', '活动');

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `administratorid` int(0) NOT NULL,
  `accounts` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`administratorid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator
-- ----------------------------

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告编号',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fromtime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('004', '科学家发现新型环保材料，有望大幅降低建筑能耗，推动绿色建筑行业革新。', '2024-4-2 08:00:01', '高隔热与保温性能\r\n传统建筑材料在隔热和保温方面往往存在不足，导致建筑在冬季需要消耗大量能源来供暖，在夏季则需要大量空调制冷。新型环保材料通过创新的结构设计或材料组合，能够显著提高隔热性能，减少室内外热量交换，从而在保持室内舒适温度的同时，显著降低能源消耗。\r\n\r\n自然光利用\r\n一些新型环保材料还具备优异的透光性，能够允许自然光充分进入室内，减少人工照明的需求。这不仅能够降低建筑能耗，还能提升居住者的舒适度和幸福感。同时，合理的自然光利用还有助于改善室内环境，促进人体健康。\r\n\r\n自我清洁与空气净化\r\n部分新型环保材料还具备自我清洁或净化空气的功能。例如，某些材料表面能够吸附并分解空气中的有害物质，如甲醛、苯等挥发性有机化合物（VOCs），从而改善室内空气质量。这种功能对于提高居住者的健康水平具有重要意义。');

-- ----------------------------
-- Table structure for errorform
-- ----------------------------
DROP TABLE IF EXISTS `errorform`;
CREATE TABLE `errorform`  (
  `helpid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `helperid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `helptime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `formtext` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`helpid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of errorform
-- ----------------------------
INSERT INTO `errorform` VALUES ('1', '1', '1', '1');
INSERT INTO `errorform` VALUES ('6QfEY6MUifYOwYtFHDv', '007', '1', '反馈');
INSERT INTO `errorform` VALUES ('BDnsDKRasEYpztM7pgF', '006', '3', '1111111');
INSERT INTO `errorform` VALUES ('LwpcDHXnyrfOfJ6KPn5', '007', '1', '没看见线下反馈，点击送到了但是没有给我，请求审核，并且另派人手帮助我');

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum`  (
  `forumid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '论坛发表编号',
  `userid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `forumdate` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `forumtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `forumtext` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`forumid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES ('002', '211282200604162417', '2024-02-14 14:12:24', '全球科学家携手合作，成功研发出新型新冠疫苗加强针', '在全球抗击新冠疫情的持续努力中，一个由多国科学家组成的国际研究团队宣布了一项重大突破。经过数月的紧密合作与不懈努力，他们成功研发出一种新型新冠疫苗加强针，该疫苗旨在进一步增强人体对新冠病毒的免疫保护，特别是针对当前流行的变异株。这款新型加强针基于最新的病毒基因组学研究成果，针对包括德尔塔（Delta）和奥密克戎（Omicron）在内的多种已知和潜在的高传播性、高致病性变异株进行了优化设计。通过采用先进的mRNA（信使核糖核酸）技术，疫苗能够更高效地诱导人体产生广泛的中和抗体和T细胞反应，从而提供更为全面和持久的免疫屏障。');
INSERT INTO `forum` VALUES ('003', '211282200302142410', '2024-02-15 12:12:24', '全球科技巨头联手推动可持续发展，共同发布绿色创新计划', '在全球气候变化和环境保护日益成为全球共识的背景下，今日，多家国际知名科技公司在[虚构城市]联合宣布了一项名为“绿色未来共创计划”的重大合作项目。该项目旨在通过技术创新与合作，加速全球向低碳、环保、可持续的未来发展转型。参与此次合作的公司包括科技巨头XYZ公司、绿色能源领导者ABC能源、智能城市解决方案提供商DEF智能、以及环保材料创新者GHI环保等，它们覆盖了从清洁能源、智能制造、智慧城市到循环经济等多个关键领域。');
INSERT INTO `forum` VALUES ('005', '211282200604162417', '2024-05-16 14:12:24', '太空探索新突破，多国联合发射深空探测器', '在人类对宇宙的无尽探索中，又一个重要里程碑即将诞生。今日，来自多个国家的航天机构在[虚构发射中心]联合宣布，将共同发射一枚名为“星际探索者”的深空探测器，旨在探索太阳系边缘的未知领域，寻找外星生命的迹象。搭载了先进的科学仪器，包括高分辨率相机、光谱分析仪、生命探测雷达等，能够对目标天体进行详尽的观测和分析。此次任务不仅是对人类科技实力的一次大考，也是国际合作精神的体现。');
INSERT INTO `forum` VALUES ('3c03ee057c9311ef86', '006', '2024-09-27 13:42:08', '这是一个测试帖', '我是内容');
INSERT INTO `forum` VALUES ('b14921735aff11ef91', '211282200802012428', '2024-08-15 20:12:50', '手机上测试是否成功', '手机上也很成功呀');
INSERT INTO `forum` VALUES ('daf8425a5a5911ef91', '211282200302142410', '2024-08-15 00:25:44', '真成功了这回，要睡觉了', '晚安');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goodsid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `goodsinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`goodsid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('001', '鸡蛋');
INSERT INTO `goods` VALUES ('002', '豆油');
INSERT INTO `goods` VALUES ('003', '豆腐');
INSERT INTO `goods` VALUES ('004', '葱');
INSERT INTO `goods` VALUES ('005', '西红柿');
INSERT INTO `goods` VALUES ('006', '苹果');

-- ----------------------------
-- Table structure for helpinfo
-- ----------------------------
DROP TABLE IF EXISTS `helpinfo`;
CREATE TABLE `helpinfo`  (
  `helpid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `helptype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '求助类型',
  `helptext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `helperid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `helptime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `orderid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`helpid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of helpinfo
-- ----------------------------
INSERT INTO `helpinfo` VALUES ('6QfEY6MUifYOwYtFHDv', '代购', '再带一袋味素', '006', '007', '1', 'wAtmpdTzM4ujDRoTtiU');
INSERT INTO `helpinfo` VALUES ('BDnsDKRasEYpztM7pgF', '护理', '', '007', '006', '3', 'JxV0Ug4XKeZYG5p3m2I');
INSERT INTO `helpinfo` VALUES ('J2J1tD99dEWKfDLJXlk', '代购', '备注', '006', '', '1', 'BzjdXSTx1osXC7C9pMd');
INSERT INTO `helpinfo` VALUES ('L8XXCTP4rZNbTm3q6WF', '护理', '', '006', '', '5', 'eS1oznLgKi3DHFDOJ1W');
INSERT INTO `helpinfo` VALUES ('LwpcDHXnyrfOfJ6KPn5', '代购', '带一瓶酱油', '006', '007', '1', 'RS1SnwtM8U2yrhlQEke');
INSERT INTO `helpinfo` VALUES ('obk05Odzih4xqgg68hU', '代购', '无', '007', '006', '1', 'FSaiS1EeNlD7f0XpLPT');
INSERT INTO `helpinfo` VALUES ('YZDxb6rACCXjJspCZX8', '护理', '康复按摩', '006', '', '2', '81L2fi57FW0Nf8MTEoN');

-- ----------------------------
-- Table structure for helpstatus
-- ----------------------------
DROP TABLE IF EXISTS `helpstatus`;
CREATE TABLE `helpstatus`  (
  `helpid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` int(0) NOT NULL,
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`helpid`, `status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of helpstatus
-- ----------------------------
INSERT INTO `helpstatus` VALUES ('6QfEY6MUifYOwYtFHDv', 3, NULL);
INSERT INTO `helpstatus` VALUES ('BDnsDKRasEYpztM7pgF', 4, '');
INSERT INTO `helpstatus` VALUES ('L8XXCTP4rZNbTm3q6WF', 0, NULL);
INSERT INTO `helpstatus` VALUES ('LwpcDHXnyrfOfJ6KPn5', 1, '');
INSERT INTO `helpstatus` VALUES ('obk05Odzih4xqgg68hU', 2, NULL);

-- ----------------------------
-- Table structure for ideasbox
-- ----------------------------
DROP TABLE IF EXISTS `ideasbox`;
CREATE TABLE `ideasbox`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ideatext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '意见箱'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ideasbox
-- ----------------------------
INSERT INTO `ideasbox` VALUES ('11', '002', '测试');
INSERT INTO `ideasbox` VALUES ('12', '211282200302142410', '在静谧的午后，阳光透过稀疏的云层，斑驳地洒在古老的街道上，给这平凡的一天披上了一层温暖的金色外衣。街角的老书店里，书页轻轻翻动的声音与偶尔传来的咖啡香交织在一起，营造出一种时光静好的氛围。人们或坐或立，沉浸在各自的世界里，有的低头阅读，有的则凝视窗外，似乎在寻找着那些被岁月遗忘的故事。这样的场景，让人不由自主地放慢了脚步，想要在这份宁静中多停留片刻，让心灵得到一次温柔的洗礼。生活，在这一刻，变得简单而纯粹，仿佛所有的烦恼都随着那轻轻摇曳的光影，逐渐消散在了无垠的蓝天之下。');
INSERT INTO `ideasbox` VALUES ('s6dYg11qHEQ3jrp4K5', '211282200302142410', '我的意见');

-- ----------------------------
-- Table structure for joinform
-- ----------------------------
DROP TABLE IF EXISTS `joinform`;
CREATE TABLE `joinform`  (
  `activeid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `text` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`activeid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of joinform
-- ----------------------------
INSERT INTO `joinform` VALUES ('20d3abf966b011efb0', '004', '1212');

-- ----------------------------
-- Table structure for joins
-- ----------------------------
DROP TABLE IF EXISTS `joins`;
CREATE TABLE `joins`  (
  `activeid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参与者与负责人',
  `stage` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `starttime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `overtime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`activeid`, `userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of joins
-- ----------------------------
INSERT INTO `joins` VALUES ('20d3abf966b011efb0', '004', '3', '3', '2024-09-18 13:00:00', '2024-09-18 17:00:00');
INSERT INTO `joins` VALUES ('20d3abf966b011efb0', '006', '2', '3', NULL, NULL);
INSERT INTO `joins` VALUES ('50815fe16b7b11ef9c', '006', '1', '0', NULL, NULL);
INSERT INTO `joins` VALUES ('6c81e25f678411efb0', '004', '3', '0', '2024-10-12 08:00:00', '2024-10-12 16:00:00');
INSERT INTO `joins` VALUES ('6c81e25f678411efb0', '007', '2', '1', NULL, NULL);
INSERT INTO `joins` VALUES ('a79252fc7c1e11efb7', '006', '1', '0', NULL, NULL);
INSERT INTO `joins` VALUES ('b0ed77eb667111efb0', '004', '3', '3', '2024-09-20 21:36:53', '2024-09-20 21:36:53');
INSERT INTO `joins` VALUES ('b0ed77eb667111efb0', '006', '2', '3', NULL, NULL);
INSERT INTO `joins` VALUES ('c34b5dae683111efb0', '004', '2', '2', NULL, NULL);

-- ----------------------------
-- Table structure for likeforum
-- ----------------------------
DROP TABLE IF EXISTS `likeforum`;
CREATE TABLE `likeforum`  (
  `userid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `forumid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`userid`, `forumid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of likeforum
-- ----------------------------
INSERT INTO `likeforum` VALUES ('006', '003');
INSERT INTO `likeforum` VALUES ('006', 'b14921735aff11ef91');
INSERT INTO `likeforum` VALUES ('211282200302142410', '002');
INSERT INTO `likeforum` VALUES ('211282200302142410', 'a5f048887c1b11efb7');
INSERT INTO `likeforum` VALUES ('211282200302142410', 'b14921735aff11ef91');
INSERT INTO `likeforum` VALUES ('211282200302142410', 'daf8425a5a5911ef91');
INSERT INTO `likeforum` VALUES ('211282200604162417', 'b14921735aff11ef91');
INSERT INTO `likeforum` VALUES ('211282200604162417', 'daf8425a5a5911ef91');
INSERT INTO `likeforum` VALUES ('211282200802012428', 'b14921735aff11ef91');
INSERT INTO `likeforum` VALUES ('211282200802012428', 'daf8425a5a5911ef91');

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location`  (
  `userid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `locationtime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `locationinfo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `activeid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`, `locationtime`, `activeid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES ('004', '2024-09-26 23:53:10', '', '20d3abf966b011efb0', '1');
INSERT INTO `location` VALUES ('004', '2024-09-26 23:53:10', '', 'b0ed77eb667111efb0', '1');
INSERT INTO `location` VALUES ('004', '2024-09-27 14:01:35', '', '20d3abf966b011efb0', '1');
INSERT INTO `location` VALUES ('004', '2024-09-27 14:01:35', '', 'b0ed77eb667111efb0', '1');
INSERT INTO `location` VALUES ('004', '2024-09-27 14:01:35', '123.71523405564952,41.841115926375025', 'c34b5dae683111efb0', '1');
INSERT INTO `location` VALUES ('006', '2024-09-18 18:40:04', '139.8174521,35.6727748', '20d3abf966b011efb0', '3');
INSERT INTO `location` VALUES ('006', '2024-09-26 23:47:48', '', 'b0ed77eb667111efb0', '3');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `orderid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `goodsid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `goodsnum` int(0) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ordertext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('wAtmpdTzM4ujDRoTtiU', '001', 3, '2', '006', '再带一袋味素');
INSERT INTO `order` VALUES ('wAtmpdTzM4ujDRoTtiU', '002', 2, '2', '006', '再带一袋味素');
INSERT INTO `order` VALUES ('RS1SnwtM8U2yrhlQEke', '001', 2, '2', '006', '带一瓶酱油');
INSERT INTO `order` VALUES ('RS1SnwtM8U2yrhlQEke', '005', 4, '2', '006', '带一瓶酱油');
INSERT INTO `order` VALUES ('RS1SnwtM8U2yrhlQEke', '004', 1, '2', '006', '带一瓶酱油');
INSERT INTO `order` VALUES ('FSaiS1EeNlD7f0XpLPT', '002', 1, '2', '007', '无');
INSERT INTO `order` VALUES ('FSaiS1EeNlD7f0XpLPT', '005', 2, '2', '007', '无');
INSERT INTO `order` VALUES ('BzjdXSTx1osXC7C9pMd', '001', 2, '2', '006', '备注');
INSERT INTO `order` VALUES ('BzjdXSTx1osXC7C9pMd', '002', 1, '2', '006', '备注');
INSERT INTO `order` VALUES ('poGMQ6Ua6M2Qy87680Y', '003', 1, '1', '006', '暂无');
INSERT INTO `order` VALUES ('poGMQ6Ua6M2Qy87680Y', '004', 1, '1', '006', '暂无');

-- ----------------------------
-- Table structure for othertype
-- ----------------------------
DROP TABLE IF EXISTS `othertype`;
CREATE TABLE `othertype`  (
  `orderid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `othertypetext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `typename` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `helptime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of othertype
-- ----------------------------
INSERT INTO `othertype` VALUES ('81L2fi57FW0Nf8MTEoN', '2', '006', '康复按摩', '护理', '2');
INSERT INTO `othertype` VALUES ('eS1oznLgKi3DHFDOJ1W', '2', '006', '需要帮忙照看老年痴呆症患者', '护理', '5');
INSERT INTO `othertype` VALUES ('FlFzrf91B4cjboUiK2d', '2', '006', '修水管', '维修', '2');
INSERT INTO `othertype` VALUES ('JxV0Ug4XKeZYG5p3m2I', '2', '007', '帮助我理疗', '护理', '3');
INSERT INTO `othertype` VALUES ('QtxH6IU0RfiGRMozQYQ', '1', '006', '水管维修', '维修', '2');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `forumid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `forumdate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `review` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `touserid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('b14921735aff11ef91', '211282200604162417', '2024-08-15 20:12:50', '测试', '211282200802012428');
INSERT INTO `review` VALUES ('b14921735aff11ef91', '211282200302142410', '2024-08-16 20:12:50', '是吗', '211282200604162417');
INSERT INTO `review` VALUES ('b14921735aff11ef91', '211282200302142410', '2024-08-26 20:23:37', '我的还是不好使', '211282200802012428');
INSERT INTO `review` VALUES ('b14921735aff11ef91', '211282200302142410', '2024-08-26 20:25:45', '这次好使了，谢谢你的帮助啦，谢谢啦', '211282200802012428');
INSERT INTO `review` VALUES ('b14921735aff11ef91', '211282200802012428', '2024-08-26 20:29:32', '我的也好使了', '211282200302142410');
INSERT INTO `review` VALUES ('a5f048887c1b11efb7', '211282200302142410', '2024-09-26 23:26:28', '评论一下', '211282200302142410');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `userid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户编号',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `sex` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '男、女、不方便透露',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '+86',
  `birthday` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` int(0) NOT NULL COMMENT '身份：管理员、志愿者、老人',
  `applydate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `applytext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '申请正文300字之内',
  `accounts` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('000', '游客', '游客', '男', '100', '1979/1/1', 4, '2024-08-05 20:23:29', '1', '100', '100');
INSERT INTO `users` VALUES ('002', '用户2', '用户2', '女', '13648965896', '1999/1/4', 2, '2024-08-05 22:57:04', '123', '200', '200');
INSERT INTO `users` VALUES ('003', '志愿者1', '志愿者1', '女', '18211111111', '2003/01/01', 3, '2024-08-05 22:57:04', NULL, '300', '300');
INSERT INTO `users` VALUES ('004', '志愿者2', '志愿者2', '男', '18888888888', '1942/01/01', 6, '', NULL, '400', '400');
INSERT INTO `users` VALUES ('005', '老人1', '老人1', '女', '18741100144', '1939/01/01', 5, '', '', '500', '500');
INSERT INTO `users` VALUES ('006', '老人志愿者1', '老人志愿者1', '男', '18360391653', '1944/01/01', 6, '', '', '600', '600');
INSERT INTO `users` VALUES ('007', '老人志愿者2', '老人志愿者2', '女', '13641066666', '1949/01/01', 6, '', '', '700', '700');
INSERT INTO `users` VALUES ('123', '213', '321', '男', '123', '111', 1, NULL, NULL, '123', '123');
INSERT INTO `users` VALUES ('211282200302142410', 'Nemophilist', '关佳旺', '男', '15041059657', '2003/02/14', 2, '', '', '15041059652', '123');
INSERT INTO `users` VALUES ('211282200302142411', '管理员', '关佳旺', '男', '15041059652', '2003/02/14', 1, NULL, NULL, '15041059652', '123');
INSERT INTO `users` VALUES ('211282200802012428', 'xiaoxin', '关思源', '女', '15041059653', '2008/02/01', 2, '', '', '15041059653', '123');

-- ----------------------------
-- Table structure for volunteer
-- ----------------------------
DROP TABLE IF EXISTS `volunteer`;
CREATE TABLE `volunteer`  (
  `userid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `volunteertime` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of volunteer
-- ----------------------------
INSERT INTO `volunteer` VALUES ('004', '10');
INSERT INTO `volunteer` VALUES ('005', '10');
INSERT INTO `volunteer` VALUES ('006', '9985.5');
INSERT INTO `volunteer` VALUES ('007', '5006');
INSERT INTO `volunteer` VALUES ('211282200302142410', '2.5');

SET FOREIGN_KEY_CHECKS = 1;
