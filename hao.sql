/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50150
Source Host           : localhost:3306
Source Database       : hao

Target Server Type    : MYSQL
Target Server Version : 50150
File Encoding         : 65001

Date: 2014-05-27 15:58:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `buygoods`
-- ----------------------------
DROP TABLE IF EXISTS `buygoods`;
CREATE TABLE `buygoods` (
  `id` int(10) NOT NULL DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `history` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of buygoods
-- ----------------------------
INSERT INTO `buygoods` VALUES ('10', '\'yushasha@zwx.com\'', '1');
INSERT INTO `buygoods` VALUES ('7', '\'zhangsan@zwx.com\'', '0');
INSERT INTO `buygoods` VALUES ('24', '\'lulu@zwx.com\'', '1');
INSERT INTO `buygoods` VALUES ('12', '\'qingjie@zwx.com\'', '1');

-- ----------------------------
-- Table structure for `count`
-- ----------------------------
DROP TABLE IF EXISTS `count`;
CREATE TABLE `count` (
  `value` int(40) DEFAULT NULL,
  `name` varchar(40) CHARACTER SET gb2312 NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of count
-- ----------------------------
INSERT INTO `count` VALUES ('28', 'c');
INSERT INTO `count` VALUES ('24', '5');
INSERT INTO `count` VALUES ('7', 'S');
INSERT INTO `count` VALUES ('9', '电');
INSERT INTO `count` VALUES ('11', '月');
INSERT INTO `count` VALUES ('15', 'java');
INSERT INTO `count` VALUES ('11', '券');
INSERT INTO `count` VALUES ('12', '算法');
INSERT INTO `count` VALUES ('1', '设计');
INSERT INTO `count` VALUES ('1', 'javascript');
INSERT INTO `count` VALUES ('4', '人月');
INSERT INTO `count` VALUES ('12', '人');
INSERT INTO `count` VALUES ('18', 'h');
INSERT INTO `count` VALUES ('17', 'su');
INSERT INTO `count` VALUES ('26', '基');
INSERT INTO `count` VALUES ('23', '礼');
INSERT INTO `count` VALUES ('16', '青年');
INSERT INTO `count` VALUES ('25', '曲奇');
INSERT INTO `count` VALUES ('14', '传');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) NOT NULL DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `goodsname` varchar(40) DEFAULT NULL,
  `detail` longtext,
  `picture` longtext,
  `price` float(10,0) DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL,
  `exist` int(10) DEFAULT NULL,
  `ordernumber` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'lulu@zwx.com', 'python', 'python基础教程', 'lulu@hao.comefbade9100000001 .jpg<#', '19', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('2', 'lulu@zwx.com', '电脑', '华硕品质，坚若磐石。', 'lulu@zwx.comefbade9100000002.jpg<#lulu@zwx.comefbade9100000003.jpg<#', '1999', '电脑', '2', '1');
INSERT INTO `goods` VALUES ('3', 'qingjie@zwx.com', '微软Surface', 'WCDMA，联通 操作系统Windows phone8', 'qingjie@zwx.comefbade9100000004.jpg<#qingjie@zwx.comefbade9100000005.jpg<#qingjie@zwx.comefbade9100000006.jpg<#', '6432', '手机', '2', '1');
INSERT INTO `goods` VALUES ('4', 'qingjie@zwx.com', '佳能5D', '佳能EOS 5D Mark III，作为佳能2012年度的最新单品旗舰单反，该机配备了一块2200万像素的全画幅CMOS传感器，6帧每秒的连拍能力，并且可以录制24、25或者30fps的1080p全高清视频。佳能EOS 5D Mark III使用了和EOS-1D X相同的61点自动对焦系统以及63区测光系统，提高了对焦速度和测光的精度。', 'qingjie@zwx.comefbade9100000007.jpg<#qingjie@zwx.comefbade9100000008.jpg<#', '18000', '相机', '2', '1');
INSERT INTO `goods` VALUES ('5', 'qingjie@zwx.com', '礼服', '面料 欧根纱 五分好评+晒图 联系客服返现五元', 'qingjie@zwx.comefbade9100000009.jpg<#qingjie@zwx.comefbade9100000010.jpg<#qingjie@zwx.comefbade9100000011.jpg<#qingjie@zwx.comefbade9100000012.jpg<#', '199', '服装', '2', '1');
INSERT INTO `goods` VALUES ('6', 'qingjie@zwx.com', '女士香水', ' Armani阿玛尼印记女士香水三件套（香水50ml+体乳75ml+沐浴露75ml)\r\n灵感开始于Armani先生的梦和梦幻的花朵图案，如同神秘、繁复、令人着迷的刺绣一般… ', 'qingjie@zwx.comefbade9100000013.jpg<#qingjie@zwx.comefbade9100000014.jpg<#qingjie@zwx.comefbade9100000015.jpg<#', '599', '日用', '2', '1');
INSERT INTO `goods` VALUES ('7', 'qingjie@zwx.com', '曲奇', '新鲜牛油+优质面粉融合，奶香浓郁，色泽诱人，令人回味无穷，丹麦曲奇的经典从创始至今一直坚持使用全手工精致而成！', 'qingjie@zwx.comefbade9100000016.jpg<#qingjie@zwx.comefbade9100000017.jpg<#qingjie@zwx.comefbade9100000018.jpg<#', '154', '食品', '2', '1');
INSERT INTO `goods` VALUES ('8', 'xuzifan@zwx.com', '篮球', 'STAR世达 高级耐磨PU 篮球 9皮片 室内外两用 BB427', 'xuzifan@zwx.comefbade9100000019.jpg<#xuzifan@zwx.comefbade9100000020.jpg<#xuzifan@zwx.comefbade9100000021.jpg<#xuzifan@zwx.comefbade9100000022.jpg<#', '139', '体育用品', '2', '1');
INSERT INTO `goods` VALUES ('9', 'xuzifan@zwx.com', '网球拍', '拍子里是不加线的，但买拍子的人都要上线的，所以就大概说明一下球线的情况。\r\n\r\n现在主要是尼龙线/合成线等、聚脂线、天然肠线这三类。\r\n\r\n合成线、尼龙线或是说仿肠线，都是为了节省成本，在一定程度上追求肠线的效果，所以都有一个通病，不禁打。大力选手用这类线最易断。\r\n\r\n聚脂线也就是大家通称的硬线，以力士浪的为典型代表，非有一定水平的选手，是不会把这种线打走的。好处不用说了，不用理线，不爱断，力量足，坏处也众人皆知，水平不济者，用它会反而伤手。\r\n\r\n天然肠线，用这线能打出网球肘的人目前没听说过。三头牛的肠衣才能做出一条天然肠线，贵就一个字，爽也就一个字。有钱人追求手感舒适者必选。专业选手的不二选择。如果说硬线让大家第一个反应到的就是力士浪系列线的话，天然肠线则是Babolat最大的王牌。', 'xuzifan@zwx.comefbade9100000023.jpg<#xuzifan@zwx.comefbade9100000024.jpg<#xuzifan@zwx.comefbade9100000025.jpg<#xuzifan@zwx.comefbade9100000026.jpg<#', '398', '体育用品', '2', '1');
INSERT INTO `goods` VALUES ('10', 'xuzifan@zwx.com', '篮球', '比赛用篮球球内气压的测量方法为：以从球底部量起约1.8米的高度落到比赛场地上，其反弹高度，从球的顶部量起不得低于1.2米，或高于1.4米。', 'xuzifan@zwx.comefbade9100000027.jpg<#xuzifan@zwx.comefbade9100000028.jpg<#xuzifan@zwx.comefbade9100000029.jpg<#xuzifan@zwx.comefbade9100000030.jpg<#', '356', '体育用品', '2', '1');
INSERT INTO `goods` VALUES ('11', 'xuzifan@zwx.com', '携程优惠券', '查看及使用：查看：凭卡号（即用户名）和密码登录携程个人帐户后，您可以在“我的携程－我的票券”中查看您的抵用券信息，包括金额、有效期、使用范围、是否限额等。使用：使用电子抵用券预订旅游产品时，“填写度假预订单---填写信息”这一步会有抵用券的选项，您在兑换金额前选择使用抵用券份数即可，系统会自动显示扣除抵用券的金额\r\n\r\n\r\n本文来自：买下吧http://www.maixiaba.com详细出处参考:http://www.maixiaba.com/team/9113.html', 'xuzifan@zwx.comefbade9100000031.jpg<#xuzifan@zwx.comefbade9100000032.jpg<#', '20', '卡券', '2', '1');
INSERT INTO `goods` VALUES ('12', 'xuzifan@zwx.com', '肯德基优惠券', '此券只可以在有此产品供应的中国大陆肯德基餐厅使用，但不适用于肯德基宅急送、肯德基精选店及机场店。\r\n此券的有效期：2014年4月1日-2014年5月31日，仅限正餐时段（9:30-23:00）使用。\r\n此券需打印使用，复印有效，请在点餐前出示此券。每次消费仅限使用1张。不做现金使用，且不能与其他优惠同时使用。\r\n产品和包装以餐厅实际供应为准。\r\n关于“每次消费仅限使用1张”的补充说明：指每次消费，一张优惠券只可对应一种产品或套餐；即买多少产品就需要打印多少张优惠券。 ', 'xuzifan@zwx.comefbade9100000033.jpg<#', '9', '卡券', '2', '1');
INSERT INTO `goods` VALUES ('13', 'xuzifan@zwx.com', '人月神话', '人月神话》内容简介：在软件领域，很少能有像《人月神话》一样具有深远影响力并且畅销不衰的著作。Brooks博士为人们管理复杂项目提供了最具洞察力的见解。既有很多发人深省的观点，又有大量软件工程的实践。《人月神话》内容来自Brooks博士在IBM公司System/360家族和OS/360中的项目管理经验。该书英文原版一经面世，即引起业内人士的强烈反响，后又译为德、法、日、俄中等多种语言，全球销量数百万册。确立了其在行业内的经典地位。\r\n在《人月神话》第一次出版32年后的今天，我们重新整理了Brooks博士的经典内容，并将国内软件开发领域先行者们对《人月神话》中的实践及系统理论的使用经验和心得集结成册与大家共享，更使《人月神话》成为国内从业者的必读经典之一。', 'xuzifan@zwx.comefbade9100000034.jpg<#', '48', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('14', 'dapeng@zwx.com', '编译原理', '《编译原理》全面、深入地探讨了编译器设计方面的重要主题，包括词法分析、语法分析、语法制导定义和语法制导翻译、运行时刻环境、目标代码生成、代码优化技术、并行性检测以及过程间分析技术，并在相关章节中给出大量的实例。与上一版相比，《编译原理》进行了全面修订，涵盖了编译器开发方面最新进展。每章中都提供了大量的实例及参考文献。\r\n　　《编译原理》是编译原理课程方面的经典教材，内容丰富，适合作为高等院校计算机及相关专业本科生及研究生的编译原理课程的教材，也是广大技术人员的极佳参考读物。', 'dapeng@zwx.comefbade9100000035.jpg<#dapeng@zwx.comefbade9100000036.jpg<#', '48', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('15', 'dapeng@zwx.com', 'JavaScript', '《JavaScript权威指南(第6版)》要讲述的内容涵盖JavaScript语言本身，以及Web浏览器所实现的JavaScript API。本书第6版涵盖了 HTML5 和 ECMAScript 5，很多章节完全重写，增加了当今 Web 开发的最佳实践的内容，新增的章节包括 jQuery 、服务器端 JavaScript、图形编程以及JavaScript式的面向对象。本书不仅适合初学者系统学习，也适合有经验的 JavaScript 开发者随手翻阅。\r\n《JavaScript权威指南(第6版)》是程序员学习核心JavaScript语言和由Web浏览器定义的JavaScript API的指南和综合参考手册。\r\n第6版涵盖HTML5和ECMAScript 5。很多章节完全重写，以便与时俱进，紧跟当今的最佳Web开发实践。本书新增章节描述了jQuery和服务器端JavaScript。 本书适合那些希望学习Web编程语言的初、中级程序员和希望精通JavaScript的程序员阅读。', 'dapeng@zwx.comefbade9100000037.jpg<#', '85', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('16', 'dapeng@zwx.com', '算法导论', 'Thomas H. Cormen （托马斯?科尔曼）达特茅斯学院计算机科学系教授、系主任。目前的研究兴趣包括：算法工程、并行计算、具有高延迟的加速计算。他分别于1993年、1986年获得麻省理工学院电子工程和计算机科学博士、硕士学位，师从Charles E. Leiserson教授。由于他在计算机教育领域的突出贡献，Cormen教授荣获2009年ACM杰出教员奖。\r\n    Charles E. Leiserson（查尔斯?雷瑟尔森）麻省理工学院计算机科学与电气工程系教授，Margaret MacVicar Faculty Fellow。他目前主持MIT超级计算技术研究组，并是MIT计算机科学和人工智能实验室计算理论研究组的成员。他的研究兴趣集中在并行和分布式计算的理论原理，尤其是与工程现实相关的技术研究。Leiserson教授拥有卡内基?梅隆大学计算机科学博士学位，还是ACM、IEEE和SIAM的会士。\r\n', 'dapeng@zwx.comefbade9100000038.jpg<#dapeng@zwx.comefbade9100000039.jpg<#dapeng@zwx.comefbade9100000040.jpg<#dapeng@zwx.comefbade9100000041.jpg<#', '185', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('17', 'dapeng@zwx.com', '青年文摘', 'Thomas H. Cormen （托马斯?科尔曼）达特茅斯学院计算机科学系教授、系主任。目前的研究兴趣包括：算法工程、并行计算、具有高延迟的加速计算。他分别于1993年、1986年获得麻省理工学院电子工程和计算机科学博士、硕士学位，师从Charles E. Leiserson教授。由于他在计算机教育领域的突出贡献，Cormen教授荣获2009年ACM杰出教员奖。\r\n    Charles E. Leiserson（查尔斯?雷瑟尔森）麻省理工学院计算机科学与电气工程系教授，Margaret MacVicar Faculty Fellow。他目前主持MIT超级计算技术研究组，并是MIT计算机科学和人工智能实验室计算理论研究组的成员。他的研究兴趣集中在并行和分布式计算的理论原理，尤其是与工程现实相关的技术研究。Leiserson教授拥有卡内基?梅隆大学计算机科学博士学位，还是ACM、IEEE和SIAM的会士。\r\n', 'dapeng@zwx.comefbade9100000042.jpg<#', '5', '杂志', '2', '1');
INSERT INTO `goods` VALUES ('18', 'dapeng@zwx.com', '读者', '《读者》杂志创刊于1981年1月，是甘肃人民出版社主办的一份综合类文摘杂志。原名《读者文摘》，1981年创刊时的《读者文摘》只有48页，而且是双月刊，新闻纸黑白印刷，售价三角。杂志创刊一年，发行量达到16万。', 'dapeng@zwx.comefbade9100000043.jpg<#', '5', '杂志', '2', '1');
INSERT INTO `goods` VALUES ('19', 'dapeng@zwx.com', '意林', '《意林》杂志创刊于2003年8月，和《读者》《青年文摘》一样是目前中国目前最有影响力的杂志之一。《意林》的内容风格现实温暖，通常用一些故事和生活经历来吸引读者。在价值观的宣传上，《意林》强调励志和人文关怀，是我国杂志类中的佼佼者。', 'dapeng@zwx.comefbade9100000044.jpg<#', '5', '杂志', '2', '1');
INSERT INTO `goods` VALUES ('20', 'yushasha@zwx.com', '拿破仑传', '拿破仑不仅是一个杰出的军事家，而且也是欧洲史上最伟大的人物之一，他不仅是创造了法国历史，而且也创造了所有欧洲各国的历史。他于1804年加冕为法兰西皇帝，从此他的名字就和他无数战争的胜利联系在一起。为了废黜这个巨人，1815年6月18日，全欧洲列强不得不在滑铁卢战场联合起来对付他……', 'yushasha@zwx.comefbade9100000045.jpg<#', '19', '传记', '2', '1');
INSERT INTO `goods` VALUES ('21', 'yushasha@zwx.com', '乔布斯传', '乔布斯传由上海财经大学出版社有限公司出版，全面讲述了从乔布斯青年时期到苹果发布最新的iCloud云计算模式的整个创新历程。', 'yushasha@zwx.comefbade9100000046.jpg<#yushasha@zwx.comefbade9100000047.jpg<#', '55', '传记', '2', '1');
INSERT INTO `goods` VALUES ('22', 'yushasha@zwx.com', '简?奥斯丁书信集', '《简?奥斯丁书信集》（Jane Austen’s Letters）由迪尔德丽?勒费（Deirdre Le Faye）整理编辑（首版于1995年，后来有更新版），提供了一个非凡的窗口，使我们了解到简?奥斯丁是怎样的一位女性。简?奥斯丁的书信，曾经被她姐姐卡桑德拉（或许还有其他人）过滤过，也许是出于对于家族声誉极其敏感，也许是要维护简圣人般的形象。\r\n　　感谢《企鹅人生》（Penguin Lives）传记丛书的编辑詹姆斯?阿特拉斯（James Atlas）以及我的众多好友，他们就简?奥斯丁与我进行了长时间的、耐心的讨论，向我提供他们的意见、理解和鼓励。我欠简?奥斯丁本人的恩情则无法估量。\r\n　　本书借鉴了许多其他有关简?奥斯丁的传记作品。帕克?霍南（Park Honan）的作品（1987）、约翰?霍尔珀林（John Halperin）的作品（1984）和海伦?勒弗罗伊（Helen Lefroy）的《简?奥斯丁》（Jane Austen，1997），都给我带来了新的视角。西尔维亚?沃纳（Sylvia Townsend Warner）短短29页的《简?奥斯丁》（Jane Austen，1951），以活泼的散文风格，描绘了简?奥斯丁辉煌的一生，显示出小型传记作品的巨大魅力。每一位作家，无论是功成名就的还是渴望成功的，都应该读一读这本不可思议的小书。最近出版的两部传记作品，不但再次提升了简?奥斯丁研究的学术水准，同时也让阅读传记作品成为一件难得的乐事。克莱尔?托马琳（Claire Tomalin）的《简?奥斯丁的人生》（Jane Austen, A Life，1997），以优雅宽容的文笔带来了崭新的心理学见解和评论。我们时常好奇于简?奥斯丁生平是否还有挖掘的空间，而托马琳已经发现了情感的细微差别，并巧妙地将其解读出来。戴维?诺克斯（David Nokes）的《简?奥斯丁》（Jane Austen，1997），在介绍她时既注重细节也强调戏剧效果，以令人羡慕的博学，勾勒出了那个时代的社会背景。\r\n', 'yushasha@zwx.comefbade9100000048.jpg<#', '55', '传记', '2', '1');
INSERT INTO `goods` VALUES ('23', 'yushasha@zwx.com', '斯诺登档案', '斯诺登档案：世界最大泄密事件内幕揭秘（斯诺登授权、唯一全程爆料媒体《卫报》出品。谍杀、窃密、监听、黑客爱情、亡命天涯……尽现“全球英雄”传奇人生和内心独白。关于斯诺登的一切，你不可能知道得更多了！）', 'yushasha@zwx.comefbade9100000049.jpg<#', '67', '传记', '2', '1');
INSERT INTO `goods` VALUES ('24', 'lulu@zwx.com', '代码大全', '代码大全(第2版)是著名Ⅱ畅销书作者、《IEEESoftware》杂志前主编、具有20年编程与项目管理经验的SteveMcConneU十余年前的经典著作的全新演绎：第2版做了全面的更新，增加了很多与时俱进的内容，包括对新语言、新的开发过程与方法论的讨论，等等。这是一本百科全书式的软件构建手册，涵盖了软件构建活动的方方面面，尤其强调提高软件质量的种种实践方法。\r\n    作者特别注重源代码的可读性，详细讨论了类和函数命名、变量命名、数据类型和控制结构、代码布局等编程的最基本要素，也讨论了防御式编程、表驱动法、协同构建、开发者测试、性能优化等有效开发实践，这些都服务于软件的首要技术使命：管理复杂度。为了培养程序员编写高质量代码的习惯，书中展示了大量高质量代码示例(以及用作对比的低质量代码)，提高软件质量是降低开发成本的重要途径。除此之外，本书归纳总结了来自专家的经验、业界研究以及学术成果，列举了大量软件开发领域的真实案例与统计数据，提高本书的说服力。\r\n    本书中所论述的技术不仅填补了初级与高级编程实践之间的空白，而且也为程序员们提供了一个有关软件开发技术的信息来源。本书对经验丰富的程序员、技术带头人、自学的程序员及没有太多编程经验的学生都是大有裨益的。可以说，只要您具有一定的编程基础，想成为一名优秀的程序员，阅读本书都不会让您失望。 ', 'lulu@zwx.comefbade9100000050.jpg<#', '45', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('25', 'lulu@zwx.com', 'J2EE', '这是一本反映了当前J2EE企业应用开发最新技术水平的实用参考书。作者从实践的角度，对于每一个主要的J2EE API技术都进行了专门的介绍，并通过例子进行了详尽的解释。最后，作者通过一个完整的电子商务应用的例子，详细说明了怎样利用每一种J2EE技术开发企业Web应用。读者可以以此为基础，经过适当的剪裁和补充，开发出自己的应用。BEA系统（中国）有限公司在译著出版中所做的工作，保证了本书技术上的正确性和权威性。 本书是一本开发分布式企业Web应用的综合性教材，可以满足广大开发人员开发企业应用的需要。', 'lulu@zwx.comefbade9100000051.jpg<#', '66', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('26', 'lulu@zwx.com', 'Java Web', '本书围绕Java Web相关技术从三方面全面深入地进行阐述。首先介绍前端知识，主要介绍JavaWeb开发中涉及的一些基本知识，包括Web请求过程、HTTP协议、DNS技术和CDN技术。其次深入介绍Java技术，包括I/O技术、中文编码问题、Javac编译原理、class文件结构解析、ClassLoader工作机制及JVM的内存管理等。最后介绍Java服务端技术，主要包括Servlet、Session与Cookie、Tomcat与Jetty服务器、Spring容器、Ibatis框架和Velocity框架等原理介绍。本书不仅介绍这些技术和框架的工作原理，而且结合示例来讲解，通过通俗易懂的文字和丰富生动的配图，让读者充分并深入理解它们的内部工作原理，同时还结合了设计模式来介绍这些技术背后的架构思维。', 'lulu@zwx.comefbade9100000052.jpg<#', '56', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('27', 'lulu@zwx.com', '设计模式', '本书荣获2005年第十五届Jolt通用类图书震撼大奖。\r\n本书英文影印版被《程序员》等机构评选为2006年最受读者喜爱的十大IT图书之一 。\r\n本书趋近完美，因为它在提供专业知识的同时，仍然具有相当高的可读性。叙述权威、文笔优美。\r\n本书共有14章，每章都介绍了几个设计模式，完整地涵盖了四人组版本全部23个设计模式。前言先介绍这本书的用法；第1章到第11章陆续介绍的设计模式为Strategy、Observer、Decorator、Abstract　Factory、Factory　Method、Singleton、Command、Adapter、Facade、TemplatMethod、Iterator、Composite、State、Proxy。最后三章比较特别。第12章介绍如何将两个以上的设计模式结合起来成为新的设计模式（例如著名的MVC模式），作者称其为复合设计模式（这是作者自创的名称，并非四人组的标准名词），第13章介绍如何进一步学习设计模式，如何发觉新的设计模式等主题，至于第14章则很快地浏览尚未介绍的设计模式，包括Bridge、Builder、Chainof　Responsibility、Flyweight、Interpreter、Mediator、Memento、Prototype、Visitor。第1章还介绍了四个OO基本概念（抽象、封装、继承、多态），而第１章到第9章也陆续介绍了九个OO原则（Principle）。千万不要轻视这些OO原则，因为每个设计模式背后都包含了几个OO原则的概念。很多时候，在设计时有两难的情况，这时候我们必须回归到OO原则，以方便判断取舍。可以这么说：OO原则是我们的目标，而设计模式是我们的做法。', 'lulu@zwx.comefbade9100000053.jpg<#', '67', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('28', 'lulu@zwx.com', '代码整洁之道', '作者Martin是软件工程领域的大师级人物，是《敏捷软件开发：原则、模式与实践》、《敏捷软件开发：原则、模式与实践(C#版)》、《极限编程实践》等国内引进的畅销书的作者，其中第一本原著荣获美国《软件开发》第13届震憾（Jolt）大奖，Martin的敏捷系列书是软件工程界的权威书籍。\r\n《代码整洁之道》是他的又一最新力作。\r\nMartin在书中对代码具有革命性的解读\r\n阐述了整洁代码的最佳敏捷实践的方法\r\n书中介绍规则均来自Martin多年的经验，拥有很高的借鉴价值 ', 'lulu@zwx.comefbade9100000054.jpg<#', '78', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('29', 'lulu@zwx.com', '网页制作', '采用图解方式诠释HTML、CSS、JavaScript最新技术。 \r\n\r\n   汇集作者精心整理的网页制作技巧、便于读者解决实际问题，快速成为网页制作高手。 \r\n\r\n   实例典型、轻松易学：通过实例学习是最好的学习方式，《HTML、CSS、JavaScript网页制作从入门到精通》采用实例方式，详尽地讲诉了实际开发中所需的各类知识。 \r\n\r\n 每章都提供“习题”，让读者通过解答习题的方式重新回顾、熟悉所学的知识，达到举一反三的效果。 \r\n\r\n\r\n\r\n', 'lulu@zwx.comefbade9100000055.jpg<#', '78', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('30', 'lulu@zwx.com', '锋利的jQuery', '《锋利的jQuery(第2版)》是《锋利的jQuery》全新升级版，例子采用全新的UI，代码更符合语义化；增加jQuery Mobile的章节；增加jQuery版本变化的章节；增加jQuery性能优化和技巧的章节\r\n', 'lulu@zwx.comefbade9100000056.jpg<#', '56', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('31', 'lulu@zwx.com', 'DOM编程艺术', 'JavaScript是Web开发中最重要的一门语言，它强大而优美。无论是桌面开发，还是移动应用。JavaScript都是必须掌握的技术。W3C的DOM标准是开发Web应用的基石。已经得到所有现代浏览器的支持，这使得跨平台Web开发成了一件轻松惬意的事。\r\n　　本书是超级畅销书的升级版，由倡导Web标准的领军人物执笔，揭示了前端开发的真谛，是学习JavaScript和DOM开发的必读之作。\r\n　　本书在简洁明快地讲述JavaScript和DOM的基本知识之后，通过几个实例演示了专业水准的网页开发技术，透彻阐述了平稳退化等一批至关重要的JavaScript编程原则和最佳实践，并全面探讨了HTML5以及jQuery等JavaScript库。读者将看到JavaScript、HTML5和CSS如何协作来创建易用的、与标准兼容的Web设计，掌握使用JavaScript和DOM通过客户端动态效果和用户控制的动画来加强Web页面的必备技术；同时，还将对如何利用库提高开发效率有全面深入的理解。', 'lulu@zwx.comefbade9100000057.jpg<#', '56', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('32', 'lulu@zwx.com', 'Objective-C', '通过《Objective-C开发范例代码大全》成为开发专家!本书采用“先提出问题，后提供解决方案”的方式讲解objective-c编程中的核心内容， 是ios开发人员手中不可或缺的参考指南。《Objective-C开发范例代码大全》作者Matthew Campbell在培训ios开发新手方面拥有非常丰富的经验，本书将向你展示如何使用objective-c语言的独有特性以及foundation框架的众多特性。此外，书中广泛提供了 多种问题的解决方案，包括： 使用xcode进行应用开发使用字符串、数字与对象集合 使用nsarray、nsstring、nsdata等foundation类 使用线程、多核处理与异步处理构建使用了日期、定时器与内存管理的应用 如何在其他平台上使用objective-c凭借深入的代码示例与清晰的解释说明，本书将帮助你轻松解决ios开 发人员每天都会面临的挑战。通过使用书中介绍的知识与技能，读者能够快速且高效地构建出功能完备的应用。通过《Objective-C开发范例代码大全》成为开发专家!本书采用“先提出问题，后提供解决方案”的方式讲解objective-c编程中的核心内容， 是ios开发人员手中不可或缺的参考指南。《Objective-C开发范例代码大全》作者Matthew Campbell在培训ios开发新手方面拥有非常丰富的经验，本书将向你展示如何使用objective-c语言的独有特性以及foundation框架的众多特性。此外，书中广泛提供了 多种问题的解决方案，包括： 使用xcode进行应用开发使用字符串、数字与对象集合 使用nsarray、nsstring、nsdata等foundation类 使用线程、多核处理与异步处理构建使用了日期、定时器与内存管理的应用 如何在其他平台上使用objective-c凭借深入的代码示例与清晰的解释说明，本书将帮助你轻松解决ios开 发人员每天都会面临的挑战。通过使用书中介绍的知识与技能，读者能够快速且高效地构建出功能完备的应用。', 'lulu@zwx.comefbade9100000058.jpg<#', '78', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('33', 'lulu@zwx.com', 'C程序设计', '这是一本Objective-C编程领域最畅销的书籍，内容涵盖Xcode4．2和自 动引用计数(ARC)。 美国Stephen G.Kochan编著的《Objective-C程序设计》详细介绍了Objective-C和苹果iOS、Mac平台面向对象程序编程的知识。本书作者假设读者没有面向对象程序语言或者C语言(Objective-C基础)编程经验。因此，初学者和有经验的程序员都可以使用这本书学习Objective-C。读者不需要 先学习底层的C语言编程，就可以了解面向对象编程。本书结合独特的学习方法，在每章都编写有大量的小程序例子和练习， 使Objective-C程序设计适合于课堂教学和自学。《Objective-C程序设计》已经为iOS 5和Xcode4．2中的重大变更做了全面更新，最大的改动是引入了自动引用计数(ARC)，并详细说明了如何在Objective．c编程过程中使用ARC提升和简化内存管理。', 'lulu@zwx.comefbade9100000059.jpg<#', '78', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('34', 'lulu@zwx.com', 'C 和指针', '《C和指针》通过对指针的基础知识和高级特性的探讨，帮助程序员把指针的强大功能融入到自己的程序中去。\r\n全书共18章，覆盖了数据、语句、操作符和表达式、指针、函数、数组、字符串、结构和联合等几乎所有重要的C编程话题。 \r\n《C和指针》适合C语言初学者和初级c程序员阅读，也可作为计算机专业学生学习C语言的参考。 ', 'lulu@zwx.comefbade9100000060.jpg<#', '97', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('35', 'lulu@zwx.com', 'C语言深度', '《C语言深度解剖（第2版）：解开程序员面试笔试的秘密》由作者结合自身多年嵌入式C语言开发经验和平时讲解C语言的心得体会整理而成，其中有很多作者独特的见解或看法。由于并不是从头到尾讲解C语言的基础知识，所以本书并不适用于C语言零基础的读者，其内容要比一般的C语言图书深得多、细致得多，其中有很多问题是各大公司的面试或笔试题。第2版中新增加了部分编程规范的内容。\r\n　　本书适合广大计算机系学生、初级程序员参考学习，也适合计算机系教师、中高级程序员参考使用。', 'lulu@zwx.comefbade9100000061.jpg<#', '67', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('36', 'lulu@zwx.com', '理解C指针 ', '指针是C语言的一项核心特性，对于指针的掌握程度是区分C语言新手与老手的重要标志。《深入理解C指针》专门研究指针，旨在提供比其他图书更全面和深入的C 指针和内存管理知识。全书巨细靡遗地为读者展现了C语言编程中最重要的话题：C的动态内存管理、指针和函数、指针和数组、指针和字符串、指针和结构体。作者还专门用一章篇幅讲解了安全问题和指针误用，让读者对指针的认识又深入一层。全书每章都穿插了使用指针的注意事项和潜在陷阱，及时贴心地提示读者在编程中避开此类问题。\r\n　　《深入理解C指针》适合C和C++程序员和开发人员阅读，也可作为计算机专业学生学习C语言的参考图书。\r\n', 'lulu@zwx.comefbade9100000062.jpg<#', '56', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('37', 'lulu@zwx.com', '算法精解', '本书是数据结构和算法领域的经典之作，十余年来，畅销不衰！全书共分为三部分：第一部分首先介绍了数据结构和算法的概念，以及使用它们的原因和意义，然后讲解了数据结构和算法中最常用的技术??指针和递归，最后还介绍了算法的分析方法，旨在为读者学习这本书打下坚实的基础；第二部分对链表、栈、队列、集合、哈希表、堆、图等常用数据结构进行了深入阐述；第三部分对排序、搜索数值计算、数据压缩、数据加密、图算法、几何算法等经典算法进行了精辟的分析和讲解。\r\n   本书的众多特色使得它在同类书中独树一帜：具体实现都采用正式的C语言代码而不是伪代码，在很多数据结构和算法的实现过程中，有大量细节问题是伪代码不能解决的；每一章都有精心组织的主题和应用；全部示例来自真实的应用，不只是一般的练习；对每种数据结构、算法和示例都进行了详细分析；每一章的末尾都会有一系列问题和对应的回答，旨在强调这一章的重要思想……\r\n   本书中的代码尤为值得强调：所有实现都采用C语言编写，所有代码都优先用于教学目的，所有代码都在4种平台上经过完整测试，头文件记录了所有公共的接口，命名规则适用于全书所有的代码，所有的代码都包含大量注释……', 'lulu@zwx.comefbade9100000063.jpg<#', '67', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('38', 'lulu@zwx.com', '具体数学', '被世界多所知名大学采纳为教材\r\n　　当代计算机科学方面的一部重要著作，TAOCP的前奏曲\r\n　　不仅讲述数学问题和技巧，更侧重教导解决问题的方法\r\n　　或平淡、或深刻、或严肃、或幽默的涂鸦，让你在轻松愉悦的心境下体会数学的美妙\r\n　　第二作者、图灵奖得主计算机科学泰斗Donald E. Knuth（高德纳）在接受图灵社区的访谈时如是说：\r\n　　“《具体数学》是一份‘纲领’，它的内容是我对于数学诸多方面应该如何教与学的思考。熟练掌握代数公式的基础技能，对我来说始终都是关键所在。这些内容在TAOCP里都有讨论，但只能是蜻蜓点水；在斯坦福大学的课程中，我得以深入更多的细节，而那些课程都被囊括在这本书中了。”', 'lulu@zwx.comefbade9100000064.jpg<#', '78', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('39', 'lulu@zwx.com', '编程之美', '梦想改变世界，据说编程的人都怀揣着一个改变世界的梦想：编程神奇而充满力量。无数的年轻人投身其中，用梦想和思考改变世界。\r\n　　本书是来自微软技术人员的杰作，他们和你有同样的梦想。', 'lulu@zwx.comefbade9100000065.jpg<#', '45', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('40', 'lulu@zwx.com', '算法', '《算法（第4版）》全面讲述算法和数据结构的必备知识，具有以下几大特色。\r\n　　 1、 算法领域的经典参考书：Sedgewick畅销著作的最新版，反映了经过几十年演化而成的算法核心知识体系\r\n　　 2、内容全面：全面论述排序、搜索、图处理和字符串处理的算法和数据结构，涵盖每位程序员应知应会的50种算法\r\n　　 3、全新修订的代码：全新的Java实现代码，采用模块化的编程风格，所有代码均可供读者使用\r\n　　 4、与实际应用相结合：在重要的科学、工程和商业应用环境下探讨算法，给出了算法的实际代码，而非同类著作常用的伪代码\r\n　　5、富于智力趣味性：简明扼要的内容，用丰富的视觉元素展示的示例，精心设计的代码，详尽的历史和科学背景知识，各种难度的练习，这一切都将使读者手不释卷\r\n　　 6、科学的方法：用合适的数学模型精确地讨论算法性能，这些模型是在真实环境中得到验证的\r\n　　7、与网络相结合：配套网站algs4.cs.princeton.edu提供了本书内容的摘要及相关的代码、测试数据、编程练习、教学课件等资源', 'lulu@zwx.comefbade9100000066.jpg<#', '97', '计算机书籍', '2', '1');
INSERT INTO `goods` VALUES ('41', 'zhangsan@zwx.com', '玻璃碗', '适用于装水果。', 'zhangsan@zwx.comefbade9100000067.jpg<#', '20', '日用', '2', '1');

-- ----------------------------
-- Table structure for `salegoods`
-- ----------------------------
DROP TABLE IF EXISTS `salegoods`;
CREATE TABLE `salegoods` (
  `id` int(10) NOT NULL DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `history` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of salegoods
-- ----------------------------
INSERT INTO `salegoods` VALUES ('1', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('2', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('3', 'qingjie@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('4', 'qingjie@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('5', 'qingjie@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('6', 'qingjie@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('7', 'qingjie@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('8', 'xuzifan@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('9', 'xuzifan@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('10', 'xuzifan@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('11', 'xuzifan@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('12', 'xuzifan@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('13', 'xuzifan@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('14', 'dapeng@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('15', 'dapeng@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('16', 'dapeng@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('17', 'dapeng@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('18', 'dapeng@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('19', 'dapeng@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('20', 'yushasha@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('21', 'yushasha@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('22', 'yushasha@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('23', 'yushasha@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('24', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('25', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('26', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('27', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('28', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('29', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('30', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('31', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('32', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('33', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('34', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('35', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('36', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('37', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('38', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('39', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('40', 'lulu@zwx.com', '2');
INSERT INTO `salegoods` VALUES ('41', 'zhangsan@zwx.com', '1');

-- ----------------------------
-- Table structure for `showlist`
-- ----------------------------
DROP TABLE IF EXISTS `showlist`;
CREATE TABLE `showlist` (
  `email` varchar(40) CHARACTER SET gb2312 NOT NULL DEFAULT '',
  `showlist` longtext CHARACTER SET gb2312,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of showlist
-- ----------------------------
INSERT INTO `showlist` VALUES ('lulu@zwx.com', '14,15,14,1,1,1,1,1,1,1,13,13,13,13,');
INSERT INTO `showlist` VALUES ('zwx@zwx.com', '18,17,18');
INSERT INTO `showlist` VALUES ('zyw@zwx.com', '21,17');
INSERT INTO `showlist` VALUES ('zhangsan@zwx.com', '7,7,41,40,4');
INSERT INTO `showlist` VALUES ('yushasha@zwx.com', '18,17');
INSERT INTO `showlist` VALUES ('xuzifan@zwx.com', '5,5,3');
INSERT INTO `showlist` VALUES ('qingjie@zwx.com', '3,12,12,12,11');
INSERT INTO `showlist` VALUES ('anni@zwx.com', '3,3,11,10,6,3');
INSERT INTO `showlist` VALUES ('dapeng@zwx.com', '4,4,10');

-- ----------------------------
-- Table structure for `timecount`
-- ----------------------------
DROP TABLE IF EXISTS `timecount`;
CREATE TABLE `timecount` (
  `email` varchar(40) CHARACTER SET gb2312 NOT NULL DEFAULT '',
  `id` longtext CHARACTER SET gb2312,
  `time` longtext CHARACTER SET gb2312,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of timecount
-- ----------------------------
INSERT INTO `timecount` VALUES ('dapeng@zwx.com', '4,4,10', '14.757,9.47,2.333');
INSERT INTO `timecount` VALUES ('lulu@zwx.com', '13,13,13,13', '156.105,2.367,10.447,156.129');
INSERT INTO `timecount` VALUES ('anni@zwx.com', '3,3,11,10,3', '5.485,1.369,2.887,1.997,1.42');
INSERT INTO `timecount` VALUES ('qingjie@zwx.com', '3,12,12,12', '4.361,2.178,4.446,2.926');
INSERT INTO `timecount` VALUES ('xuzifan@zwx.com', '5,5,3', '27.267,3.776,13.208');
INSERT INTO `timecount` VALUES ('yushasha@zwx.com', '18,17', '3.308,19.093');
INSERT INTO `timecount` VALUES ('zhangsan@zwx.com', '7,7,41,40,4', '3.477,3.715,19.451,6.196,26.336');
INSERT INTO `timecount` VALUES ('zyw@zwx.com', '21', '18.964');
INSERT INTO `timecount` VALUES ('zwx@zwx.com', '18,17,18', '10.165,27.294,31.223');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `email` varchar(40) NOT NULL DEFAULT '',
  `password` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `class` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('anni@zwx.com', '123', '安妮', '电脑');
INSERT INTO `user` VALUES ('qingjie@zwx.com', '123', '清洁', '卡券');
INSERT INTO `user` VALUES ('xuzifan@zwx.com', '123', '徐子凡', '服装');
INSERT INTO `user` VALUES ('dapeng@zwx.com', '123', '大鹏', '相机');
INSERT INTO `user` VALUES ('yushasha@zwx.com', '123', '于莎莎', '杂志');
INSERT INTO `user` VALUES ('lulu@zwx.com', '123', '露露', '计算机书籍');
INSERT INTO `user` VALUES ('zhangsan@zwx.com', '123', '张三', '食品');
INSERT INTO `user` VALUES ('zyw@zwx.com', '123', '转易网', '传记');
INSERT INTO `user` VALUES ('zwx@zwx.com', '123', '周万玺', '杂志');

-- ----------------------------
-- Table structure for `usermessage`
-- ----------------------------
DROP TABLE IF EXISTS `usermessage`;
CREATE TABLE `usermessage` (
  `sex` char(2) DEFAULT NULL,
  `age` int(10) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `email` varchar(40) NOT NULL DEFAULT '',
  `name` varchar(40) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of usermessage
-- ----------------------------
INSERT INTO `usermessage` VALUES ('女', '1992', '13123233333', 'anni@zwx.com', '安妮', '1050373544');
INSERT INTO `usermessage` VALUES ('女', '1992', '122345245', 'xuzifan@zwx.com', '徐子凡', '120394888598');
INSERT INTO `usermessage` VALUES ('男', '1879', '1934345', 'qingjie@zwx.com', '清洁', '123123324546');
INSERT INTO `usermessage` VALUES ('男', '1986', '1753686', 'dapeng@zwx.com', '大鹏', '108465535435');
INSERT INTO `usermessage` VALUES ('女', '1987', '1874465', 'yushasha@zwx.com', '于莎莎', '1956525435');
INSERT INTO `usermessage` VALUES ('女', '1990', '13242343', 'lulu@zwx.com', '露露', '104395829');
INSERT INTO `usermessage` VALUES ('男', '1992', '12345678', 'zhangsan@zwx.com', '张三', '12345678');
INSERT INTO `usermessage` VALUES ('男', '1986', '143656778555', 'zyw@zwx.com', '转易网', '156345678645');
INSERT INTO `usermessage` VALUES ('男', '1992', '15126060106', 'zwx@zwx.com', '周万玺', '1050373525');

-- ----------------------------
-- Table structure for `usersearchkeyword`
-- ----------------------------
DROP TABLE IF EXISTS `usersearchkeyword`;
CREATE TABLE `usersearchkeyword` (
  `email` varchar(40) CHARACTER SET gb2312 NOT NULL DEFAULT '',
  `searchkeyword` longtext CHARACTER SET gb2312,
  `searchkeywordclass` longtext CHARACTER SET gb2312,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of usersearchkeyword
-- ----------------------------
INSERT INTO `usersearchkeyword` VALUES ('dapeng@zwx.com', '5', '相机');
INSERT INTO `usersearchkeyword` VALUES ('lulu@zwx.com', 'c,人,h', '手机,计算机书籍,计算机书籍');
INSERT INTO `usersearchkeyword` VALUES ('anni@zwx.com', 'su,电', '手机,电脑');
INSERT INTO `usersearchkeyword` VALUES ('qingjie@zwx.com', '基', '卡券');
INSERT INTO `usersearchkeyword` VALUES ('xuzifan@zwx.com', '礼', '服装');
INSERT INTO `usersearchkeyword` VALUES ('yushasha@zwx.com', '青年', '杂志');
INSERT INTO `usersearchkeyword` VALUES ('zhangsan@zwx.com', '曲奇', '食品');
INSERT INTO `usersearchkeyword` VALUES ('zyw@zwx.com', '传', '传记');
INSERT INTO `usersearchkeyword` VALUES ('zwx@zwx.com', '青年', '杂志');
