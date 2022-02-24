/*
 Navicat Premium Data Transfer

 Source Server         : 10.1.2.162
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : 10.1.2.162:3306
 Source Schema         : mu_music

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 24/02/2022 16:34:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`
(
    `ID`    int(11)                                                 NOT NULL AUTO_INCREMENT,
    `Login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `Pwd`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin`
VALUES (1, 'admin', '123456');

-- ----------------------------
-- Table structure for t_ding
-- ----------------------------
DROP TABLE IF EXISTS `t_ding`;
CREATE TABLE `t_ding`
(
    `ID`       int(11) NOT NULL AUTO_INCREMENT,
    `Thing_ID` int(11) NULL DEFAULT NULL,
    `User_ID`  int(11) NULL DEFAULT NULL,
    `type`     int(11) NULL DEFAULT NULL,
    PRIMARY KEY (`ID`) USING BTREE,
    INDEX `t_ding_ibfk_2` (`User_ID`) USING BTREE,
    INDEX `t_ding_ibfk_1` (`Thing_ID`) USING BTREE,
    CONSTRAINT `t_ding_ibfk_1` FOREIGN KEY (`Thing_ID`) REFERENCES `t_thing` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `t_ding_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `t_user` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_ding
-- ----------------------------

-- ----------------------------
-- Table structure for t_introduce
-- ----------------------------
DROP TABLE IF EXISTS `t_introduce`;
CREATE TABLE `t_introduce`
(
    `ID`      int(11)                                                NOT NULL AUTO_INCREMENT,
    `Type`    varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `Content` text CHARACTER SET utf8 COLLATE utf8_general_ci        NULL,
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_introduce
-- ----------------------------
INSERT INTO `t_introduce`
VALUES (1, '关于我们', '胶章音乐诞生于2019');
INSERT INTO `t_introduce`
VALUES (2, '联系我们', 'QQ：1007760854@qq.com');

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news`
(
    `ID`          int(11)                                                NOT NULL AUTO_INCREMENT,
    `Title`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `Content`     text CHARACTER SET utf8 COLLATE utf8_general_ci        NULL,
    `in_time`     datetime                                               NULL DEFAULT NULL,
    `NewsType_ID` int(11)                                                NULL DEFAULT NULL,
    PRIMARY KEY (`ID`) USING BTREE,
    INDEX `NewsType_ID` (`NewsType_ID`) USING BTREE,
    CONSTRAINT `t_news_ibfk_1` FOREIGN KEY (`NewsType_ID`) REFERENCES `t_newstype` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news`
VALUES (1, '陕西汉中：在青山绿水间走上富民路',
        '<p><span>2018年12月27日至28日，由中国记协、全国三教办组织的“改革开放陕西行新闻战线强四力”主题采访活动记者团，先后走进陕西汉中留坝县、宁强县、洋县，采访生态旅游发展，探寻“林业+旅游”融合发展，了解“绿水青山就是金山银山”发展理念为群众带来的新变化。</span><br></p><p>从滥砍滥伐到停伐造林，从伐木工人转身为森林卫士；从卖木为生到吃生态饭，从荒山秃岭变为旅游胜地……作为全域旅游示范区之一，近年来，汉中充分利用林地资源和林荫空间优势，引领城乡居民全域参与森林景观旅游开发，推动林下经济集约化发展，形成了“林上采、林下种、林中养、林间游”的立体林旅融合发展模式，在青山绿水间走上了兴林富民之路。</p><p><strong>留坝县：万亩荒山变绿水青山</strong></p><p>作为秦岭腹地的一个山区县，留坝县具备天然生态优势，森林覆盖率为90.8%，旅游资源独具特色。20世纪80年代，“靠山吃山、靠水吃水”,通过砍木头、卖石头（开矿）也曾有过人均存款“全省第一”的辉煌。然而，这些都没能让留坝走多远，很快山被砍秃了、挖烂了，富民强县的目标也没有实现。</p><p>“实践告诉我们，对生态资源掠夺式的开发带来的只有恶果，青山绿水才是留坝最宝贵的生存资源，也是留坝发展最宝贵的后发优势。”留坝县委书记许秋雯告诉记者，2000年，留坝县委、县政府痛定思痛，确定了“生态立县、药菌兴县、旅游强县”的发展战略，统筹推进生态文明建设与旅游产业发展，探索出了一条以全域旅游引领县域经济社会协调发展的新路子。</p><p>“我们充分利用林场地域和资源优势，大力发展森林旅游和旅游配套产业，不断激发林业经济新活力。”留坝县林业局相关负责人介绍，留坝依托留侯镇庙台子林场和张良庙周边良好的生态、人文景观资源，把旅游、研学、科普、养生有机融合，积极推动建设由木工学堂、青年旅舍、森林小木屋和生态体验4个部分组成的张良庙研学旅游基地。2015年以来投入资金600余万元，对闸口石林场进行全面改造，装修标准间96套，日接待能力达180余人；建成餐饮楼3层、1200平方米，有效提升了紫柏山森林公园和国际滑雪场旅游配套设施和服务水平。</p><p>“在全域旅游发展模式下，通过产品的开发、产业链的拉长，不仅改善了留坝群众的生产生活条件，也让4.7万老百姓都能参与旅游发展、参与旅游服务，都能从旅游产业发展中受益，有获得感，共享旅游发展的红利。”留坝县旅游发展委员会主任谢建斌说，绿色发展带来的不仅仅是产业转型，还让群众在参与其中时得到实惠，越来越多的群众感受到绿水青山就是金山银山。</p>',
        '2019-01-03 00:00:00', 1);
INSERT INTO `t_news`
VALUES (2, '独家', '这是独家新闻！', '2022-02-24 00:00:00', 1);
INSERT INTO `t_news`
VALUES (3, '独家O', '这是独家新闻！', '2022-02-23 00:00:00', 1);
INSERT INTO `t_news`
VALUES (4, '独家新闻-jiao', '这是独家新闻！', '2022-02-24 00:00:00', 1);
INSERT INTO `t_news`
VALUES (5, '独家新闻2-jiao', '这是独家新闻2！', '2022-02-24 00:00:00', 1);
INSERT INTO `t_news`
VALUES (6, '独家新闻3-jiao', '这是独家新闻3！', '2022-02-24 15:00:55', 1);
INSERT INTO `t_news`
VALUES (7, '独家新闻4-jiao', '这是独家新闻4！', '2022-02-24 15:03:10', 1);

-- ----------------------------
-- Table structure for t_newstype
-- ----------------------------
DROP TABLE IF EXISTS `t_newstype`;
CREATE TABLE `t_newstype`
(
    `ID`   int(11)                                                 NOT NULL AUTO_INCREMENT,
    `Type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_newstype
-- ----------------------------
INSERT INTO `t_newstype`
VALUES (1, '资讯中心');
INSERT INTO `t_newstype`
VALUES (2, '娱乐资讯');
INSERT INTO `t_newstype`
VALUES (3, '国际资讯');

-- ----------------------------
-- Table structure for t_singer
-- ----------------------------
DROP TABLE IF EXISTS `t_singer`;
CREATE TABLE `t_singer`
(
    `ID`       int(11)                                                 NOT NULL AUTO_INCREMENT,
    `Name`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `Abbr`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `City`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `Height`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `Weight`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `Birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `Img`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `Content`  text CHARACTER SET utf8 COLLATE utf8_general_ci         NULL,
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_singer
-- ----------------------------
INSERT INTO `t_singer`
VALUES (2, '周杰伦 ', 'Jay Chou', '香港', '175cm', '65kg', '1979年1月18日', 'file/hut0r6jfd7ag40ta3pzm.jpg',
        '<div>\r\n周杰伦出生于台湾省新北市，祖籍福建省永春县[24]&nbsp;。周杰伦4岁的<br><img src=\"file:///https://gss3.bdstatic.com/7po3dsag_xi4khgkpowk1hf6hhy/baike/s=220/sign=2f6a3e64bb3eb13540c7b0b9961fa8cb/38dbb6fd5266d016a6448ca4902bd40734fa35d8.jpg\"><br>周杰伦小时候(17张)<br>时候，母亲叶惠美把他送到淡江山叶幼儿音乐班学习钢琴[25]&nbsp;。周杰伦读初中二年级时，他的父母因性格不合离婚，而周杰伦则归母亲叶惠美抚养[26]&nbsp;。中考时，周杰伦没有考上普通高中；同年，他因为擅长钢琴而被淡江中学第一届音乐班录取。高中毕业以后，他两次报考台北大学音乐系均没有被录取，于是他开始在一家餐馆打工[25]&nbsp;。<br>1997年9月，周杰伦在母亲的鼓励下报名参加了台北星光电视台的娱乐节目《超级新人王》，并在节目中邀人演唱了自己创作的歌曲《梦有翅膀》。当主持人吴宗宪看到这首歌曲的曲谱后，就邀请周杰伦到阿尔发音乐公司担任音乐助理[25]&nbsp;。1998年，他创作了歌曲《眼泪知道》，在公司把这首歌曲给刘德华以后却被退歌；而他为张惠妹创作的歌曲《双截棍》也被退回[27]&nbsp;。<br>\r\n</div>');
INSERT INTO `t_singer`
VALUES (3, '周深', '卡布、卡布叻', '中国内地', '161cm', '55kg', '1992年09月29日 ', 'file/8kt7pn7awmcd56szvjcx.jpg',
        '<p><br>周深， 内地男歌手。1992年9月29日生，贵州贵阳人。2016年6月毕业于乌克兰利沃夫国立音乐学院，美声专业 [1-2]&nbsp; 。2017年11月发行个人首张专辑《深的深》 [3-5]&nbsp; 。<br>2014年参加浙江卫视《中国好声音》第三季，盲选以《欢颜》获导师们赞赏；凭借《贝加尔湖畔》获得“中国好声音”年度金曲 [6]&nbsp; 。2015年春节北京卫视春晚献唱多语版《Let it go》支持北京申办冬奥会 [7]&nbsp; 。8月发行个人全新单曲《玫瑰与小鹿》 [8]&nbsp; 并获得2016年东方风云榜最佳新人 [9]&nbsp; 。2016.5.18献唱动画电影《大鱼海棠》印象曲《大鱼》 [10]&nbsp; 。2016.9.27在亚洲新歌榜2016年度盛典上，周深所演唱的《玫瑰与小鹿》和《大鱼》双双获得年度十大金曲 [11-12]&nbsp; 。10月参加江苏卫视《蒙面唱将猜猜猜》，演唱《身骑白马》等 [13-14]&nbsp; 。12月获《音乐先锋榜》2016年度网上最具人气先锋男歌手 [15-16]&nbsp; 。<br>2017年2月周深为电视剧《那片星空那片海》演唱官方片尾曲《回声》 [17-18]&nbsp; 。3月获得第24届东方风云榜全民选择男歌手 [19-20]&nbsp; ，作品《大鱼》获得年度十大金曲。4月凭《大鱼》获第17届音乐风云榜“年度最佳电影歌曲奖” [21-22]&nbsp; 。6月献唱电影《绣春刀·修罗战场》宣传主题曲《浓情淡如你》 [23-25]&nbsp; 和动画电影《大护法》概念曲《不说话》 [26-28]&nbsp; 。10月再度献唱《那片星空那片海2》片尾曲《曾经沧海》 [29-30]&nbsp; 。<br>2018年3月，周深献唱奥斯卡最佳影片《水形物语》同名推广曲 [31]&nbsp; ，获第25届东方风云榜年度飞跃歌手 [32]&nbsp; 。8月献唱电视剧《如懿传》片尾曲《梅香如故》 [33]&nbsp; ，获全球华人歌曲排行榜2018年度最佳新人和年度金曲两个奖项 [34]&nbsp; 。9月发行首支原创单曲《可它爱着这个世界》 [35]&nbsp; 。<br><br></p>');
INSERT INTO `t_singer`
VALUES (4, '王琪', '君玉', '中国内地', '175', '65', '1900-01-01', 'file/7eo9cxuy0hnbbd0tb5sh.jpg',
        '<p>王琪，字君玉，华阳（今四川 \r\n成都）人，徙舒（今安徽庐江）。王罕之子，王珪从兄。进士及第，曾任江都主簿。天圣三年（1025）上时务十事，得仁宗嘉许，命试学士院，调入京城任馆阁校勘，授大理评事、馆阁校勘、集贤校理，知制诰。嘉佑中，守平江府，数临东南诸州。任姑苏郡守时，修建官衙，向转运使司借款数千缗，无力偿还，政尚简静。嘉祐四年（1059年），王琪增订刊刻王洙之《杜工部集》于苏州，并撰写《后记》，在序中对杜甫的“博闻稽古”加以肯定。《杜工部集》一次印一万部，“每部为直千钱，士人争买之，富室或买十许部”。有《谪仙长短句》，已佚。《宋史》附传王珪。今有周泳先辑《谪仙长短句》一辑。《全宋词》录其词十一首。他是著名的豪放派词人。以礼部侍郎致仕，年七十二卒。墓葬真州（今江苏仪征县）。</p>');
INSERT INTO `t_singer`
VALUES (5, '李荣浩', '小眼哥哥', '上海', '178', '60', '1990-1-2', 'file/u1tdm51b0h5q50k1sncq.png', '独家介绍');

-- ----------------------------
-- Table structure for t_thing
-- ----------------------------
DROP TABLE IF EXISTS `t_thing`;
CREATE TABLE `t_thing`
(
    `ID`           int(11)                                                 NOT NULL AUTO_INCREMENT,
    `Title`        varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `Singer_ID`    int(11)                                                 NULL DEFAULT NULL,
    `Content`      text CHARACTER SET utf8 COLLATE utf8_general_ci         NULL,
    `Img`          varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `ThingType_ID` int(11)                                                 NULL DEFAULT NULL,
    PRIMARY KEY (`ID`) USING BTREE,
    INDEX `ThingType_ID` (`ThingType_ID`) USING BTREE,
    INDEX `Singer_ID` (`Singer_ID`) USING BTREE,
    CONSTRAINT `t_thing_ibfk_1` FOREIGN KEY (`ThingType_ID`) REFERENCES `t_thingtype` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `t_thing_ibfk_2` FOREIGN KEY (`Singer_ID`) REFERENCES `t_singer` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_thing
-- ----------------------------
INSERT INTO `t_thing`
VALUES (1, '大渔海堂', 3,
        '[ti:大鱼]\r\n[ar:周深]\r\n[al:]\r\n[by:果果1314]\r\n\r\n[00:00.00]周深 - 大鱼(唱片版)\r\n[00:03.00]作词：尹约\r\n[00:06.00]作曲：钱雷\r\n[00:09.00]制作人：尹约\r\n[00:12.00]钢琴编曲：钱雷\r\n[00:15.00]人声录音师：Stanley Blu Springer III\r\n[00:19.00]混音：Stanley Blu Springer III\r\n[00:23.00]人声录音棚：Yin Music(洛杉矶)\r\n[00:27.00]母带：周天澈\r\n[00:30.00]插画：Lost7\r\n[00:33.00]歌词编辑：果果\r\n[00:36.00]QQ:765708831\r\n[00:39.00]Lrc歌词网：www.90lrc.cn\r\n[00:42.00]\r\n[00:43.04]海浪无声将夜幕深深淹没\r\n[00:49.80]漫过天空尽头的角落\r\n[00:56.26]大鱼在梦境的缝隙里游过\r\n[01:03.52]凝望你沉睡的轮廓\r\n[01:09.55]看海天一色 听风起雨落\r\n[01:16.24]执子手吹散苍茫茫烟波\r\n[01:23.30]大鱼的翅膀 已经太辽阔\r\n[01:30.97]我松开时间的绳索\r\n[01:36.98]怕你飞远去 怕你离我而去\r\n[01:43.55]更怕你永远停留在这里\r\n[01:50.44]每一滴泪水 都向你流淌去\r\n[01:58.31]倒流进天空的海底\r\n[02:03.54]\r\n[02:19.13]海浪无声将夜幕深深淹没\r\n[02:25.84]漫过天空尽头的角落\r\n[02:32.67]大鱼在梦境的缝隙里游过\r\n[02:39.36]凝望你沉睡的轮廓\r\n[02:45.47]看海天一色 听风起雨落\r\n[02:52.33]执子手吹散苍茫茫烟波\r\n[02:59.26]大鱼的翅膀 已经太辽阔\r\n[03:06.95]我松开时间的绳索\r\n[03:12.85]看你飞远去 看你离我而去\r\n[03:19.69]原来你生来就属于天际\r\n[03:26.48]每一滴泪水 都向你流淌去\r\n[03:34.24]倒流回最初的相遇\r\n[03:39.94]',
        'file/9qc16xuysqoahw4eq1fh.mp3', 2);
INSERT INTO `t_thing`
VALUES (2, '月光', 4,
        '<p>[ti:月光]<br>[ar:王心凌]<br>[al:]<br>[by:]<br>[offset:500]<br>[00:03.67]愤怒的猫头鹰制作<br>[01:44.85][00:04.43]弯弯月光下<br>[01:47.06][00:06.78]蒲公英在游荡<br>[01:49.40][00:09.34]像烟花闪着微亮的光芒<br>[01:54.21][00:14.55]趁着夜晚<br>[01:56.02][00:16.38]找寻幸福方向<br>[02:00.00][00:20.97]难免会受伤<br>[02:03.89][00:25.20]弯弯小路上<br>[02:06.08][00:27.42]蒲公英在歌唱<br>[02:08.51][00:29.90]星星照亮在起风的地方<br>[02:13.21][00:34.57]乘着微风<br>[02:15.03][00:36.38]飘向未知远方<br>[02:18.79][00:40.22]幸福也许漫长<br>[02:24.79][00:46.28]难过的时候<br>[02:26.95][00:48.08]谁在身边<br>[02:29.87][00:51.08]陪我掉眼泪<br>[02:34.66][00:55.65]失败无所谓<br>[02:36.72][00:58.22]你在左右<br>[02:39.12][01:00.43]月光多美<br>[02:42.31][01:03.72]弯弯月光下<br>[02:44.35][01:06.02]我轻轻在歌唱<br>[02:46.97][01:08.36]从今以后<br>[02:48.76][01:10.05]不会再悲伤<br>[02:51.87][01:13.14]闭上双眼<br>[02:53.52][01:14.98]感觉你在身旁<br>[02:57.74][01:18.72]你是温暖月光<br>[03:02.32][01:23.58]你是幸福月光<br>[03:11.18]白：我在月光下歌唱<br>[03:14.44]闭上双眼<br>[03:16.44]感觉你在身旁<br>[03:24.12]弯弯月光下<br>[03:26.21]我轻轻在歌唱<br>[03:28.78]从今以后<br>[03:30.62]不会再悲伤<br>[03:33.62]闭上双眼<br>[03:35.41]感觉你在身旁<br>[03:39.08]你是温暖月光<br>[03:44.35]你是幸福月光</p>',
        'file/a0zgbu1v7klf4jk76wu6.mp3', 2);
INSERT INTO `t_thing`
VALUES (3, '老街', 5, '老街歌词', 'file/gh6ed7xaki862zu5cnh8.mp3', 2);

-- ----------------------------
-- Table structure for t_thingtype
-- ----------------------------
DROP TABLE IF EXISTS `t_thingtype`;
CREATE TABLE `t_thingtype`
(
    `ID`   int(11)                                                NOT NULL AUTO_INCREMENT,
    `Type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_thingtype
-- ----------------------------
INSERT INTO `t_thingtype`
VALUES (2, '流行');
INSERT INTO `t_thingtype`
VALUES (3, '电子');
INSERT INTO `t_thingtype`
VALUES (4, '摇滚');
INSERT INTO `t_thingtype`
VALUES (5, '民谣');
INSERT INTO `t_thingtype`
VALUES (6, '古典');
INSERT INTO `t_thingtype`
VALUES (7, '爵士');
INSERT INTO `t_thingtype`
VALUES (8, '抖音热歌');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`
(
    `ID`      int(11)                                                NOT NULL AUTO_INCREMENT,
    `login`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `pwd`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `name`    varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `sex`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `tel`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `mail`    varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user`
VALUES (1, 'h', 'h', 'h', '男', '15951447844', ' 南海', '4554844@qq.com');
INSERT INTO `t_user`
VALUES (2, 'jiao', 'jiao', 'jiao', '男', '18312345678', ' 南海', '1007760851@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
