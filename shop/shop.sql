/*
Navicat MySQL Data Transfer

Source Server         : apitest
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-05-06 16:32:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sh_admin
-- ----------------------------
DROP TABLE IF EXISTS `sh_admin`;
CREATE TABLE `sh_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户名id',
  `admin_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `admin_password` varchar(35) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户密码',
  `password_confirm` varchar(35) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码确认',
  `token` int(11) NOT NULL COMMENT '操作时间',
  `email` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `pid` int(11) DEFAULT NULL COMMENT '所属用户组',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_admin
-- ----------------------------
INSERT INTO `sh_admin` VALUES ('12', '王彬', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '5', '1530215484@qq.com', null);

-- ----------------------------
-- Table structure for sh_article
-- ----------------------------
DROP TABLE IF EXISTS `sh_article`;
CREATE TABLE `sh_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `article_title` varchar(60) NOT NULL COMMENT '文章标题',
  `article_keywords` varchar(100) NOT NULL COMMENT '关键词',
  `article_logo` varchar(255) NOT NULL COMMENT '缩略图',
  `article_author` varchar(30) NOT NULL COMMENT '作者',
  `article_click` mediumint(9) NOT NULL COMMENT '点击数',
  `article_content` text NOT NULL COMMENT '文章描述',
  `article_zan` mediumint(9) NOT NULL COMMENT '点赞数',
  `article_time` int(11) NOT NULL COMMENT '发布时间',
  `pid` mediumint(9) NOT NULL COMMENT '所属栏目',
  `article_description` text NOT NULL COMMENT '简单描述',
  `satus` tinyint(1) DEFAULT '0' COMMENT '是否显示：0不显示，1显示',
  `article_url` varchar(50) DEFAULT NULL COMMENT '外链',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_article
-- ----------------------------
INSERT INTO `sh_article` VALUES ('110', '售后流程 	', '售后流程 	', '', '王彬', '0', '<p style=\"line-height: 150%\"><strong style=\"color: rgb(255, 0, 0);font-size: 18px;line-height: 150%\"><span style=\"line-height: 150%;font-family: 宋体\">一、退货流程</span></strong><br/></p><p style=\"line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">为了我们更愉快的合作，请在申请退货之前<strong>确认</strong>是否符合以下退货条件：</span></p><p style=\"line-height: 150%\"><span style=\"font-size: 12px;line-height: 150%;font-family: 宋体\">&nbsp; &nbsp;<span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\"> &nbsp;1.<span style=\"font-stretch: normal;line-height: normal;font-family: &#39;Times New Roman&#39;\">&nbsp;&nbsp;&nbsp; </span>收到货物后7日内出现质量问题；</span></span></p><p style=\"line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">&nbsp; &nbsp; 2.<span style=\"font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;;font-stretch: normal\">&nbsp;&nbsp;&nbsp; </span>产品包装完整；</span></p><p style=\"line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">&nbsp; &nbsp; 3.<span style=\"font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;;font-stretch: normal\">&nbsp;&nbsp;&nbsp; </span>包装清单上的物品齐全，无破损；</span></p><p style=\"line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">&nbsp; &nbsp; 4.<span style=\"font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;;font-stretch: normal\">&nbsp;&nbsp;&nbsp; </span>产品无人为损坏，如摔裂、划痕等，以及不属于本政策后附的免责条款的；</span></p><p style=\"line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">&nbsp; &nbsp; 5.<span style=\"font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;;font-stretch: normal\">&nbsp;&nbsp;&nbsp; </span>您要求退货的商品是否从征途商城（shop.zhengtugps.com）购买的。</span></p><p style=\"line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体;color: rgb(255, 0, 0)\">经确认符合以上5个条件后,方可通过联系我们的客服办理退货手续！</span></p><p style=\"line-height: 150%\"><span style=\"font-size: 16px;font-family: 宋体;line-height: 150%\">申明：请您将全部产品、各类配件、含发票（如有）等，发快递至客服指定的退货地址，并将退货的快递单号一同告知在线客服即可</span><span style=\"font-size: 12px;font-family: 宋体;line-height: 150%\">。<br/></span></p><p style=\"line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\"><br/></span></p><p style=\"line-height: 150%\"><span style=\"font-size: 18px;color: rgb(255, 0, 0)\"><strong><span style=\"font-size: 18px;line-height: 150%;font-family: 宋体\">二、换机程序</span></strong></span></p><p><span style=\"font-family: 宋体;font-size: 18px;line-height: 27px\"><span style=\"color:#ff0000\"><strong>&nbsp; &nbsp;</strong></span></span><span style=\"line-height: 150%;font-family: 宋体\">1:</span><span style=\"line-height: normal;font-family: &#39;Times New Roman&#39;;font-stretch: normal\">&nbsp; </span><span style=\"line-height: 150%;font-family: 宋体\">用户将符合保换条件的不良机器的机身编码、购机凭证（或征途商城订单号）告知在线客服，并申报机器故障部分与故障现象。</span></p><p style=\"line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">&nbsp; &nbsp; 2：换货快递至客服指定的退货地址，并将退货的快递单号一同告知在线客服即可。</span></p><p style=\"line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">&nbsp; &nbsp; 3：经本公司检查确认实属不良机器，给予换货寄回！</span></p><p style=\"line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">&nbsp;</span></p><p style=\"line-height: 150%\"><span style=\"font-size: 18px;color: rgb(255, 0, 0)\"><strong><span style=\"font-size: 18px;line-height: 150%;font-family: 宋体\">三、维修程序</span></strong></span></p><p class=\"MsoListParagraph\" style=\"margin-left: 28px;line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">1.<span style=\"line-height: normal;font-family: &#39;Times New Roman&#39;;font-stretch: normal\">&nbsp;&nbsp;&nbsp; </span>向在线客服提出维修申请，请将原机器寄回客服指定维修地址，等待公司维修。</span></p><p class=\"MsoListParagraph\" style=\"margin-left: 28px;line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">2.<span style=\"font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;;font-stretch: normal\">&nbsp;&nbsp;&nbsp; </span>在保修期内的产品，不收取任何维修费用。</span></p><p class=\"MsoListParagraph\" style=\"margin-left: 28px;line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">3.<span style=\"font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;;font-stretch: normal\">&nbsp;&nbsp;&nbsp; </span>过保修期的产品，需按照公司维修价目表收取一定的维修费用和上门拆装费用。</span></p><p style=\"line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">&nbsp;</span></p><p style=\"line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\"><br/></span></p><p style=\"line-height: 150%\"><span style=\"font-size: 18px;color: rgb(255, 0, 0)\"><strong><span style=\"font-size: 18px;line-height: 150%;font-family: 宋体\">四、换机与维修的注意事项</span></strong></span></p><p class=\"MsoListParagraph\" style=\"margin-left: 28px;line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">1.<span style=\"line-height: normal;font-family: &#39;Times New Roman&#39;;font-stretch: normal\">&nbsp;&nbsp;&nbsp; </span>您要求换货或维修的产品必须确认是从征途商城平台（shop.zhengtugps.com）购买的。</span></p><p class=\"MsoListParagraph\" style=\"margin-left: 28px;line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">2.<span style=\"font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;;font-stretch: normal\">&nbsp;&nbsp;&nbsp; </span>主机坏换主机，配件坏换配件，包装附件不更换。</span></p><p class=\"MsoListParagraph\" style=\"margin-left: 28px;line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">3.<span style=\"font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;;font-stretch: normal\">&nbsp;&nbsp;&nbsp; </span>对于外观有损伤的机器，不予更换，但予以保修。</span></p><p class=\"MsoListParagraph\" style=\"margin-left: 28px;line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">4.<span style=\"font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;;font-stretch: normal\">&nbsp;&nbsp;&nbsp; </span>已停产无机更换的，更换同档次新机。</span></p><p class=\"MsoListParagraph\" style=\"margin-left: 28px;line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">5.<span style=\"font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;;font-stretch: normal\">&nbsp;&nbsp;&nbsp; </span>随机赠送的配件、促销品等不在保修、包换范围内。</span></p><p class=\"MsoListParagraph\" style=\"margin-left: 28px;line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">6.<span style=\"font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;;font-stretch: normal\">&nbsp;&nbsp;&nbsp; </span>如果您购买的产品需要维修或检测，请及时备份机器内的数据。征途商城不对因数据丢失所造成的损失负责。</span></p><p class=\"MsoListParagraph\" style=\"margin-left: 28px;line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">7.<span style=\"font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;;font-stretch: normal\">&nbsp;&nbsp;&nbsp; </span>购买产品的保修卡、登记的机身编码、征途商城购物记录等是您获得服务的重要凭证，请您妥善保管，在每次接受服务时务必提供！</span></p><p class=\"MsoListParagraph\" style=\"margin-left: 28px;line-height: 150%\"><span style=\"font-size: 16px;line-height: 150%;font-family: 宋体\">8.<span style=\"font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;;font-stretch: normal\">&nbsp;&nbsp;&nbsp; </span>如您不能提供上述信息，或所记载的信息与故障产品不符合，或被涂改、模糊不清、无法辨认，则该故障产品将无法由征途商城平台提供售后服务，需联系产品品牌厂商负责售后处理。</span></p><p><br/></p>', '0', '1537148297', '35', '售后流程 	', '1', 'http://');
INSERT INTO `sh_article` VALUES ('111', '购物流程', '购物流程', '', '王彬', '0', '<p style=\"text-align:left;line-height:2em;\"><strong><span style=\"color:#00b050\"><span style=\"color:#00b050;font-size:14px\">1.购物流程图</span></span></strong></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><img src=\"/ueditor/php/upload/image/20180917/1537148427139586.jpg\" width=\"502\" height=\"382\"/><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:2em;margin-top:0px;margin-bottom:0px;\"><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:2em;margin-top:0px;margin-bottom:0px;\"><strong style=\"margin:0px;padding:0px;\"><span style=\"color:#00b050\"><span style=\"font-size:14px\">2.操作说明</span></span></strong></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><strong style=\"margin:0px;padding:0px;\"><span style=\"color:#00b050\"><br/></span></strong></p><p style=\"padding:0px;list-style-type:none;border:0px;margin-top:0px;margin-bottom:0px;\"><strong style=\"margin:0px;padding:0px;\">注册登录</strong></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\">第一步：点击当当首页顶部<span style=\"font-size:14px;font-family:calibri, sans-serif\"><a href=\"https://login.dangdang.com/Register.aspx?returnurl=http%3A//www.dangdang.com/\" style=\"margin:0px;padding:0px;color:#404040;text-decoration:none;\"><span style=\"font-family:宋体, simsun;font-size:12px;color:#00b0f0\">成为会员</span></a></span>进入注册页面。</p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><img src=\"/ueditor/php/upload/image/20180917/1537148427122726.png\" width=\"604\" height=\"170\"/><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"margin:0px;padding:0px;\"><br/></span></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\">第二步：您可通手机号码进行注册，按照提示填写准确信息，点击提交“立即注册”。</p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><img src=\"/ueditor/php/upload/image/20180917/1537148427884130.png\" width=\"730\" height=\"351\"/><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;background-color:white;margin-top:0px;margin-bottom:0px;\"><span style=\"color:#3f3f3f;font-size:12px\">注：请务必填写正确有效的手机号，找回密码时需要到手机号获取验证信息。</span><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;background-color:white;margin-top:0px;margin-bottom:0px;\"><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\">第三步：注册完成后，点击当当首页顶部“登录”正常登录账户即可。</p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><img src=\"/ueditor/php/upload/image/20180917/1537148427590051.png\" width=\"562\" height=\"175\"/><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;margin-top:0px;margin-bottom:0px;\"><strong style=\"margin:0px;padding:0px;\"><span style=\"font-family:宋体;color:#3f3f3f;font-size:12px\">搜索商品</span></strong></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"color:#3f3f3f\"></span><span style=\"font-family:宋体;color:#3f3f3f;font-size:12px\">您可在当当首页搜索框内输入关键字搜索商品，也可点击高级搜索-</span><a href=\"http://help.dangdang.com/details/page113\" target=\"_self\" style=\"margin:0px;padding:0px;color:#404040;text-decoration:none;\"><span style=\"font-family:宋体, simsun;color:#00b0f0;font-size:12px\">批量搜索</span></a><span style=\"font-family:宋体;color:#3f3f3f;font-size:12px\">进行搜索商品，还可以点击首页左侧的分类导航查找</span><span style=\"font-family:宋体;color:#3f3f3f;font-size:12px\">您需要的商品</span>。</p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><img src=\"/ueditor/php/upload/image/20180917/1537148427512852.jpg\" width=\"580\" height=\"272\"/></p><p style=\"padding:0px;list-style-type:none;border:0px;margin-top:0px;margin-bottom:0px;\"><strong style=\"margin:0px;padding:0px;\"><span style=\"background-color:white;font-family:宋体, simsun;color:#3f3f3f;font-size:12px\">一键购买</span></strong><span style=\"font-size:14px;font-family:微软雅黑, sans-serif\"></span></p><p style=\"margin:0px 0cm;padding:0px;list-style-type:none;border:0px;line-height:24px;\"><span style=\"background-color:white;font-family:宋体, simsun;color:#3f3f3f;font-size:12px\">在搜索页或单品页面点击“一键购买”快速提交订单，详情点击</span><a href=\"http://help.dangdang.com/detaisl/page110\" target=\"_self\" style=\"margin:0px;padding:0px;color:#404040;text-decoration:none;\">一键购买详情查看</a><span style=\"color:black;background-color:white;font-family:宋体, simsun;font-size:12px\">。</span></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><img src=\"/ueditor/php/upload/image/20180917/1537148428294509.jpg\" width=\"580\" height=\"220\"/><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;margin-top:0px;margin-bottom:0px;\"><strong style=\"margin:0px;padding:0px;\">放入购物车</strong></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\">在搜索页或单品页面点击“加入购物车”商品会添加到购物车中，您还可以继续挑选商品放入购物车，一起结算。</p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"margin:0px;padding:0px;\"><img src=\"/ueditor/php/upload/image/20180917/1537148428414223.png\" width=\"620\" height=\"276\"/><br/></span></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"margin:0px;padding:0px;\"></span>1）在购物车中，系统默认每件商品的订购数量为1件，如果您想购买多件商品，可修改购买数量。<br/></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"color:#3f3f3f;font-size:12px\">2</span><span style=\"font-size:12px\">）</span><span style=\"color:#3f3f3f;font-size:12px\">在购物车中，您可以将商品移入收藏，或是选择删除，或可以进行清空购物车的操作，重新挑选。</span></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"color:#3f3f3f;font-size:12px\">3</span><span style=\"font-size:12px\">）</span><span style=\"color:#3f3f3f;font-size:12px\">在购物车中，您可以直接查看到商品的优惠折和参加促销活动的商品名称、促销主题等。</span></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"color:#3f3f3f;font-size:12px\">4</span><span style=\"font-size:12px\">）</span><span style=\"color:#3f3f3f;font-size:12px\">购物车页面下方的商品依次为：</span>根据购物车中的商品为您推荐、推广商品、推荐商品及“我的收藏”若有您需要的商品，点击“放入购物车”即可。<span style=\"color:#3f3f3f;font-size:12px\"></span></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><img src=\"/ueditor/php/upload/image/20180917/1537148428425842.jpg\" width=\"580\" height=\"220\"/><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"color:#3f3f3f;font-size:12px\">5</span><span style=\"font-size:12px\">）</span><span style=\"color:#3f3f3f;font-size:12px\">自2013年10月1号之后，若未登陆账户，放入购物车的商品将保留30天；若已登陆账户，放入购物车的商品将永久保留。</span></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"margin:0px;padding:0px;\"><br/></span></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"margin:0px;padding:0px;\"></span><strong style=\"margin:0px;padding:0px;\">温馨提示：</strong></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"color:#3f3f3f;font-size:12px\">1</span><span style=\"font-size:12px\">）</span><span style=\"color:#3f3f3f;font-size:12px\">商品价格会不定期调整，最终价格以您提交订单后订单中的价格为准。</span></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"color:#3f3f3f;font-size:12px\">2</span><span style=\"font-size:12px\">）</span><span style=\"color:#3f3f3f;font-size:12px\">优惠政策、配送时间、运费收取标准等都有可能进行调整，最终成交信息以您提交订单时网站公布的最新信息为准。</span></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"color:#3f3f3f;font-size:12px\">3</span><span style=\"font-size:12px\">）</span><span style=\"color:#3f3f3f;font-size:12px\">账户登录状态下放入购物车的商品，更换电脑后仍可看到购物车中的商品；账户未登录状态下放入购物车的商品，更换电脑后将无法看到购物车中的商品。</span></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;margin-top:0px;margin-bottom:0px;\"><strong style=\"margin:0px;padding:0px;\">提交订单</strong></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"color:#262626;font-size:12px\">详细填写收货人信息、送货方式、支付方式、发票信息、是否作为礼品赠送他人等信息，确认无误后点 击“提交订单”，生成新订单号码。您可进入“</span><span style=\"color:#00b0f0;text-decoration:none;font-size:12px\"><a href=\"http://orderb.dangdang.com/myallorders.aspx\" target=\"_self\" style=\"margin:0px;padding:0px;color:#404040;text-decoration:none;\">我的订单</a>”</span><span style=\"color:#262626;font-size:12px\">查看订单详细信息。</span></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><img src=\"/ueditor/php/upload/image/20180917/1537148428154053.jpg\" width=\"580\" height=\"260\"/><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;margin-top:0px;margin-bottom:0px;\"><strong style=\"margin:0px;padding:0px;\">收货后评论</strong></p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"color:#3f3f3f\"></span>收货后可以在“<a href=\"http://orderb.dangdang.com/myallorders.aspx\" target=\"_self\" style=\"line-height:24px;margin:0px;padding:0px;color:#404040;text-decoration:none;\"><span style=\"color:#00b0f0;font-size:12px\">我的订单</span></a>”中对购买的商品和本次购买商品过程中的服务进行评论。</p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:24px;margin-top:0px;margin-bottom:0px;\"><img src=\"/ueditor/php/upload/image/20180917/1537148428586953.jpg\" width=\"580\" height=\"140\"/></p><p style=\"text-align:left;line-height:2em;\"><br/></p><p style=\"text-align:left;line-height:2em;\"><strong><span style=\"color:#00b050\"><span style=\"color:#00b050;font-size:14px\">3.常见问题</span></span></strong><br/></p><table width=\"100%\"><tbody style=\"margin:0px;padding:0px;\"><tr style=\"margin:0px;padding:0px;\" class=\"firstRow\"><td style=\"margin: 0px; padding: 0px;\" width=\"561\"><p style=\"padding:0px;list-style-type:none;border:0px;margin-top:0px;margin-bottom:0px;\"><strong style=\"margin:0px;padding:0px;\"><span style=\"margin:0px;padding:0px;\">Q:</span></strong><span style=\"margin:0px;padding:0px;\">为什么要完成邮箱验证？</span><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;margin-top:0px;margin-bottom:0px;\">为了确保您的账户安全，且能够享受到更周到的服务。</p><p style=\"padding:0px;list-style-type:none;border:0px;margin-top:0px;margin-bottom:0px;\">例:1）及时准确地接收到订单处理通知信；2）随时了解顾客评论；3）参与评论投票；4）给其他用户留言</p><p style=\"padding:0px;list-style-type:none;border:0px;line-height:normal;margin-top:0px;margin-bottom:0px;\"><br/></p></td></tr></tbody></table><p style=\"padding:0px;list-style-type:none;border:0px;font-size:12px;color:#404040;font-family:宋体, arial, helvetica, sans-serif;line-height:24px;margin-top:0px;margin-bottom:0px;\"><strong style=\"margin:0px;padding:0px;\">Q:</strong>我的邮箱收不到当当的邮件是什么原因？<br/></p><table width=\"100%\"><tbody style=\"margin:0px;padding:0px;\"><tr style=\"margin:0px;padding:0px;\" class=\"firstRow\"><td style=\"margin: 0px; padding: 0px;\" width=\"561\"><p style=\"margin:0cm 0cm 0px 28px;padding:0px;list-style-type:none;border:0px;text-indent:-28px;line-height:20px;\"><span style=\"color:#3f3f3f\">1）邮箱自动归为垃圾邮件，请您检查垃圾箱，是否已收到邮件。</span></p><p style=\"margin:0cm 0cm 0px 28px;padding:0px;list-style-type:none;border:0px;text-indent:-28px;line-height:20px;\">2）将当当设为了黑名单，请您检查黑名单，取消黑名单，将当当邮箱加入通讯录联系人或白名单。</p><p style=\"margin:0cm 0cm 0px 28px;padding:0px;list-style-type:none;border:0px;text-indent:-28px;line-height:20px;\">3）若以上办法均无效，请换时段尝试接收。</p><p style=\"margin:0cm 0cm 0px 28px;padding:0px;list-style-type:none;border:0px;text-indent:-28px;line-height:20px;\"><br/></p></td></tr></tbody></table><p style=\"padding:0px;list-style-type:none;border:0px;font-size:12px;color:#404040;font-family:宋体, arial, helvetica, sans-serif;line-height:24px;margin-top:0px;margin-bottom:0px;\"><strong style=\"margin:0px;padding:0px;\"><span style=\"background-color:#ffffff;color:#3f3f3f\"><strong style=\"margin:0px;padding:0px;color:#404040;\"><strong style=\"margin:0px;padding:0px;\"><span style=\"margin:0px;padding:0px;\">Q:</span></strong></strong></span></strong><span style=\"background-color:#ffffff;color:#3f3f3f\">为什么在登录时系统总提示“Email地址昵称或密码输入错误，请重新填写”？</span></p><p style=\"padding:0px;list-style-type:none;border:0px;font-size:12px;color:#404040;font-family:宋体, arial, helvetica, sans-serif;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"background-color:#ffffff;color:#3f3f3f\">1）您输入的邮箱地址或昵称有误；若您曾修改过邮箱地址或是昵称</span><span style=\"background-color:#ffffff;color:#3f3f3f\">，</span><span style=\"background-color:#ffffff;color:#3f3f3f\">请用修改后的信息登录。</span></p><p style=\"padding:0px;list-style-type:none;border:0px;font-size:12px;color:#404040;font-family:宋体, arial, helvetica, sans-serif;line-height:24px;margin-top:0px;margin-bottom:0px;\">2）您输入的密码有误；若您曾修改过注册密码，请用修改后的密码登录；如忘记密码，请点击<a href=\"https://login.dangdang.com/Lostpassword.aspx\" target=\"_self\" style=\"margin:0px;padding:0px;color:#404040;text-decoration:none;\"><span style=\"color:#00b0f0\">找回密码</span></a><span style=\"color:#00b0f0\"></span><span style=\"color:#000000\">。</span></p><p style=\"padding:0px;list-style-type:none;border:0px;font-size:12px;color:#404040;font-family:宋体, arial, helvetica, sans-serif;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"margin:0px;padding:0px;\"><br/></span></p><p style=\"padding:0px;list-style-type:none;border:0px;font-size:12px;color:#404040;font-family:宋体, arial, helvetica, sans-serif;line-height:24px;margin-top:0px;margin-bottom:0px;\"><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;font-size:12px;color:#404040;font-family:宋体, arial, helvetica, sans-serif;line-height:24px;margin-top:0px;margin-bottom:0px;\"><strong style=\"margin:0px;padding:0px;\">Q:</strong>账户总是无法登录是怎么回事？<br/></p><table width=\"100%\"><tbody style=\"margin:0px;padding:0px;\"><tr style=\"margin:0px;padding:0px;\" class=\"firstRow\"><td style=\"margin: 0px; padding: 0px;\" width=\"561\"><p style=\"padding:0px;list-style-type:none;border:0px;margin-top:0px;margin-bottom:0px;\"><span style=\"color:#3f3f3f\"><span style=\"font-family:宋体, simsun;color:#3f3f3f\">如账户总是无法登录请点击</span></span><a href=\"http://help.dangdang.com/details/page54\" target=\"_self\" style=\"margin:0px;padding:0px;color:#404040;text-decoration:none;\"><span style=\"color:#00b0f0\">登录帮助</span></a><span style=\"color:#3f3f3f\"><span style=\"font-family:宋体, simsun;color:#3f3f3f\">查看。</span></span></p></td></tr></tbody></table><p style=\"padding:0px;list-style-type:none;border:0px;font-size:12px;color:#404040;font-family:宋体, arial, helvetica, sans-serif;line-height:24px;margin-top:0px;margin-bottom:0px;\"><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;font-size:12px;color:#404040;font-family:宋体, arial, helvetica, sans-serif;line-height:24px;margin-top:0px;margin-bottom:0px;\"><strong style=\"margin:0px;padding:0px;\"><span style=\"color:#3f3f3f\">Q:</span></strong><span style=\"color:#3f3f3f\">刚下的订单怎么在“我的订单”中没找到？</span><br/></p><p style=\"padding:0px;list-style-type:none;border:0px;font-size:12px;color:#404040;font-family:宋体, arial, helvetica, sans-serif;line-height:24px;margin-top:0px;margin-bottom:0px;\"><span style=\"color:#c00000;font-size:14px\"><span style=\"font-size:12px;color:#3f3f3f\"><span style=\"color:#c00000;font-size:14px\"><span style=\"font-size:12px;color:#3f3f3f\"><span style=\"font-size:14px;color:#1f497d\"><span style=\"color:#3f3f3f;font-size:12px\"></span></span></span></span></span></span></p><p style=\"padding:0px;list-style-type:none;border:0px;margin-top:0px;margin-bottom:0px;\"><span style=\"color:#3f3f3f\">订单提交高峰时段，新的订单可能会一段时间后在</span><a href=\"http://myhome.dangdang.com/\" target=\"_self\" style=\"margin:0px;padding:0px;color:#404040;text-decoration:none;\"><span style=\"color:#00b0f0\">我的订单</span></a><span style=\"color:#3f3f3f\">中显示。如您在“我的当当”中暂未找到最新订单，请您耐</span>心等待。</p><p><br/></p>', '0', '1537148417', '35', '购物流程', '1', 'http://');
INSERT INTO `sh_article` VALUES ('112', '订购方式', '订购方式', '', '王彬', '0', '<p style=\"orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体; text-align: left\"><strong><span style=\"color: rgb(68, 68, 68)\"><em><span style=\"font-size: 14px\"><span style=\"font-family: simsun\">一、在线订购 &nbsp;</span></span></em></span></strong></p><p style=\"font-size: 16px; orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体\"><span style=\"font-size: 12px\"><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-family: simsun\">Step1.</span></span></span></p><p style=\"font-size: 16px; orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体\"><span style=\"font-size: 12px\"><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-family: simsun\">登录第五大道奢侈品网官方网站，点击网站右上角“免费注册”按钮，进入注册页面；老用户直接登陆。<span style=\"line-height: 2em\">&nbsp;</span></span></span></span></p><p style=\"font-size: 16px; orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体\"><span style=\"font-size: 12px\"><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-family: simsun\">Step2.</span></span></span></p><p style=\"font-size: 16px; orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体\"><span style=\"font-size: 12px\"><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-family: simsun\">在注册页面中详细填写个人信息，点击“注册”按钮。或可直接通过新浪微博、支付宝、360、人人网和QQ五种网络帐号登录第五大道。<span style=\"line-height: 2em\">&nbsp;</span></span></span></span></p><p style=\"font-size: 16px; orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体\"><span style=\"font-size: 12px\"><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-family: simsun\">Step3.</span></span></span></p><p style=\"font-size: 16px; orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体\"><span style=\"font-size: 12px\"><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-family: simsun\"><span style=\"line-height: 1.5\">在看中合适商品时，可以随时点击“立即购买”或“加入收藏”，将商品放入第五大道的虚拟购物车中。&nbsp;</span></span></span></span></p><p><span style=\"font-size: 12px\"><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-family: simsun\">您随时可以查看您的购物车，并可以对放入购物车的商品进行数量调整或者取消某些商品。&nbsp;</span></span></span></p><p><span style=\"font-size: 12px\"><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-family: simsun\"> &nbsp;<br/></span></span></span></p><p><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-size: 14px\"><span style=\"font-family: simsun\"><span style=\"font-size: 12px\">第五大道奢侈品网支持多种方式搜索和浏览商品：&nbsp;<br/>按照商品品牌浏览&nbsp;<br/>按照商品种类浏览&nbsp;</span><br/><span style=\"font-size: 12px\">按关键词搜索&nbsp;</span></span></span></span></p><p style=\"font-size: 16px; orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体\"><span style=\"font-size: 12px\"><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-family: simsun\"><span style=\"line-height: 1.5\">按照价格、热销产品、推荐产品、优惠产品等多种排行方式进行浏览&nbsp;</span></span></span></span></p><p style=\"font-size: 16px; orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体\"><span style=\"font-size: 12px\"><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-family: simsun\"><span style=\"line-height: 2em\">Step4.</span></span></span></span></p><p style=\"font-size: 16px; orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体\"><span style=\"font-size: 12px\"><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-family: simsun\">选中心仪的商品一同放入购物袋后，点击“立即结算”按钮。<span style=\"line-height: 2em\">&nbsp;</span></span></span></span></p><p style=\"font-size: 16px; orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体\"><span style=\"font-size: 12px\"><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-family: simsun\"><span style=\"line-height: 2em\">Step5.</span></span></span></span></p><p style=\"font-size: 16px; orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体\"><span style=\"font-size: 12px\"><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-family: simsun\">进入填写订单信息页面填写相关信息。包括填写个人信息、选择支付及配送方式、选择优惠信息、查看商品清单、核对结算信息、选择是否需要开具发票，后点击“提交订单”按钮。</span></span></span></p><p style=\"font-size: 16px; orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体\"><span style=\"font-size: 12px\"><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-family: simsun\"><span style=\"line-height: 2em\">Step6.</span></span></span></span></p><p style=\"font-size: 16px; orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体\"><span style=\"font-size: 12px\"><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-family: simsun\">订单生成。好啦~此刻您已完成了整套的购物流程，只需在家坐等宝贝上门！祝您在第五大道奢侈品网购物愉快！</span></span></span></p><p style=\"font-size: 16px; orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体\"><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-size: 14px\"><span style=\"font-family: simsun\"><br/></span></span></span></p><p style=\"font-size: 16px; orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体\"><strong><em><span style=\"color: rgb(68, 68, 68)\"><span style=\"font-size: 14px\"><span style=\"font-family: simsun\">二、电话订购 &nbsp;</span></span></span></em></strong></p><p style=\"font-size: 16px; orphans: 2; widows: 2; min-height: 1.5em; word-wrap: break-word; line-height: 2em; color: rgb(62, 62, 62); font-family: 宋体\"><span style=\"text-decoration:underline;\"><em><span style=\"color: rgb(68, 68, 68)\"><span style=\"font-size: 14px\"><span style=\"font-family: simsun\"></span></span></span></em></span></p><p><span style=\"font-family: simsun\"><span style=\"font-size: 12px\"><span style=\"color: rgb(0, 0, 0)\">&nbsp; &nbsp; 您可以通过拨打我们的订购热线来订购您喜欢的商品，只要告知您所需商品的编号或者名称，并留下您的联络方式，我们的客服代表会为您下单，在收到您支付的款项后会即时发货。<br/>全国电话订购热线: 4008676738（免长途话费，周一至周五早9：00-晚19：00；周六日以及法定节假日10:00-22:00）&nbsp;</span></span></span></p><p><span style=\"color: rgb(0, 0, 0)\"><span style=\"font-size: 14px\"><span style=\"font-family: simsun\"><span style=\"font-size: 12px\"><span style=\"line-height: 1.5\">团购、批发订购热线: 010-85900599-812</span> <br/></span></span></span></span></p><p><br/></p>', '0', '1537148477', '35', '订购方式', '1', 'http://');
INSERT INTO `sh_article` VALUES ('113', '货到付款区域', '货到付款区域', '', '王彬', '0', '<p class=\"f_yellow\">温馨提示：</p><p>快递公司支持货到付款的配送范围会不定期进行更新，所以会出现之前支持货到付款的地区现在无法支持货到付款的情况，如遇到此问题建议您使用网上支付，可配送至全国各地区（香港、澳门、台湾除外）。\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p><br/></p>', '0', '1537148537', '34', '', '1', 'http://');
INSERT INTO `sh_article` VALUES ('114', '配送支付智能查询', '配送支付智能查询', '', '王彬', '0', '', '0', '1537148537', '34', '', '1', 'http://');
INSERT INTO `sh_article` VALUES ('115', '支付方式说明', '支付方式说明', '', '王彬', '0', '', '0', '1537148597', '34', '', '1', 'http://');
INSERT INTO `sh_article` VALUES ('116', '资金管理', '资金管理', '', '资金管理', '0', '', '0', '1537148597', '36', '', '1', 'http://');
INSERT INTO `sh_article` VALUES ('117', '我的收藏', '我的收藏', '', '我的收藏', '0', '', '0', '1537148597', '36', '', '1', 'http://');
INSERT INTO `sh_article` VALUES ('118', '我的订单', '我的订单', '', '我的订单', '0', '', '0', '1537148597', '36', '', '1', 'http://');
INSERT INTO `sh_article` VALUES ('119', '退换货原则', '退换货原则', '', '退换货原则', '0', '', '0', '1537148657', '37', '', '1', 'http://');
INSERT INTO `sh_article` VALUES ('120', '售后服务保证', '售后服务保证', '', '售后服务保证', '0', '', '0', '1537148657', '37', '', '1', 'http://');
INSERT INTO `sh_article` VALUES ('121', '产品质量保证', '产品质量保证', '', '产品质量保证', '0', '', '0', '1537148657', '37', '', '1', 'http://');
INSERT INTO `sh_article` VALUES ('122', '网站故障报告', '网站故障报告', '', '网站故障报告', '0', '', '0', '1537148657', '38', '', '1', 'http://');
INSERT INTO `sh_article` VALUES ('123', '选机咨询', '选机咨询', '', '选机咨询', '0', '', '0', '1537148717', '38', '', '1', 'http://');
INSERT INTO `sh_article` VALUES ('124', '投诉与建议', '投诉与建议', '', '投诉与建议', '0', '', '0', '1537148717', '38', '', '1', 'http://');
INSERT INTO `sh_article` VALUES ('125', '隐私保护', '隐私保护', '', '王彬', '0', '<p>隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护隐私保护</p>', '0', '1540778009', '4', '隐私保护', '1', 'http://www.baidu.com');
INSERT INTO `sh_article` VALUES ('126', ' 联系我们 ', ' 联系我们 ', '', ' 联系我们 ', '0', '<p>&nbsp;联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们 <br/>&nbsp;联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们 <br/>&nbsp;联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联系我们&nbsp; 联<br/></p>', '0', '1540778069', '4', ' 联系我们  联系我们  联系我们  联系我们  联系我们  联系我们  联系我们  联系我们  联系我们  联系我们  联系我们  联系我们  联系我们  联系我们 ', '1', 'http://');
INSERT INTO `sh_article` VALUES ('127', ' 免责条款', ' 免责条款', '', ' 免责条款', '0', '<p>&nbsp;免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款&nbsp;免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款&nbsp;免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款&nbsp;免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款&nbsp;免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款&nbsp;免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款&nbsp;免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款&nbsp;免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款&nbsp;免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款&nbsp;免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款&nbsp;免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款&nbsp;免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款&nbsp;免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款&nbsp;免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款&nbsp;免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款&nbsp;免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款</p>', '0', '1540778069', '4', ' 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款 免责条款', '1', 'http://');
INSERT INTO `sh_article` VALUES ('128', '公司简介', '公司简介', '', '公司简介', '0', '<p>公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介</p>', '0', '1540778129', '4', '公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介', '1', 'http://');
INSERT INTO `sh_article` VALUES ('129', ' 意见反馈', ' 意见反馈', '', ' 意见反馈', '0', '<p>&nbsp;意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈&nbsp;意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈&nbsp;意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈&nbsp;意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈&nbsp;意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈&nbsp;意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈&nbsp;意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈&nbsp;意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈&nbsp;意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈&nbsp;意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈&nbsp;意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈&nbsp;意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈&nbsp;意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈&nbsp;意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈<br/></p>', '0', '1540778129', '4', ' 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈 意见反馈', '1', 'http://');

-- ----------------------------
-- Table structure for sh_brand
-- ----------------------------
DROP TABLE IF EXISTS `sh_brand`;
CREATE TABLE `sh_brand` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '品牌名称',
  `brand_url` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '品牌地址',
  `brand_img` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '品牌logo',
  `brand_description` text COLLATE utf8_unicode_ci COMMENT '品牌描述',
  `brand_sort` tinyint(30) DEFAULT NULL COMMENT '品牌排序',
  `brand_satus` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '是否影藏，0表示影藏，1表示显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_brand
-- ----------------------------
INSERT INTO `sh_brand` VALUES ('1', '北极绒', 'http://www.baidu.com', '20181120\\870040714cb5fdbfbe674675e57569aa.jpg', '奔腾', null, '1');
INSERT INTO `sh_brand` VALUES ('2', '爱萝莉', 'http://www.baidu.com', '20181120\\4cf114dd11302828c91ef3d0d296f3d3.jpg', '爱萝莉', null, '1');
INSERT INTO `sh_brand` VALUES ('3', '李宁', 'http://', '20181121\\30df09e56c5e62a86bb3b46b7f54bf95.jpg', '李宁', null, '1');
INSERT INTO `sh_brand` VALUES ('4', '苹果', 'http://', '20181121\\afee8cc31c85d04ead81b669f5be056c.jpg', '苹果', null, '1');
INSERT INTO `sh_brand` VALUES ('5', '华为', 'http://', '20181121\\2573cb11324fadde50f3a356eadd9724.jpg', '华为', null, '1');
INSERT INTO `sh_brand` VALUES ('6', '小米', 'http://', '20181121\\e1a202c87c84d9f925b6522e74086f4a.jpg', '小米', null, '1');

-- ----------------------------
-- Table structure for sh_cate
-- ----------------------------
DROP TABLE IF EXISTS `sh_cate`;
CREATE TABLE `sh_cate` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '栏目名称',
  `cate_type` tinyint(1) DEFAULT '5' COMMENT '栏目类型 1：系统分类，2：帮助分类，3.网店帮助，4.网店信息，5.普通分类',
  `keywords` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '描述',
  `show_nav` tinyint(1) DEFAULT '1' COMMENT '是否显示在顶部,1:显示，0：不显示',
  `sort` tinyint(255) NOT NULL COMMENT '排序',
  `pid` tinyint(1) DEFAULT NULL COMMENT '上级栏目',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_cate
-- ----------------------------
INSERT INTO `sh_cate` VALUES ('1', '系统栏目', '1', '系统', '这是一个不允许被修改的系统栏目', '0', '0', '0');
INSERT INTO `sh_cate` VALUES ('39', '站内快讯', '0', '站内快讯', '站内快讯', '0', '0', '5');
INSERT INTO `sh_cate` VALUES ('2', '帮助分类', '2', '帮助分类', '帮助分类', '0', '0', '1');
INSERT INTO `sh_cate` VALUES ('3', '网店帮助', '3', '网店帮助', '网店帮助', '0', '0', '1');
INSERT INTO `sh_cate` VALUES ('4', '网店信息', '4', '网店信息', '网店信息', '0', '0', '1');
INSERT INTO `sh_cate` VALUES ('36', '会员中心', '2', '会员中心', '会员中心', '0', '0', '2');
INSERT INTO `sh_cate` VALUES ('37', '服务保证 ', '2', '服务保证 ', '服务保证 ', '0', '0', '2');
INSERT INTO `sh_cate` VALUES ('38', '联系我们', '2', '联系我们', '联系我们', '0', '0', '2');
INSERT INTO `sh_cate` VALUES ('34', '配送与支付', '2', '配送与支付', '配送与支付', '0', '0', '2');
INSERT INTO `sh_cate` VALUES ('5', '普通分类', '5', '普通分类', '普通分类', '0', '0', '0');
INSERT INTO `sh_cate` VALUES ('35', '新手上路', '2', '新手上路', '新手上路', '0', '0', '2');
INSERT INTO `sh_cate` VALUES ('40', '商城公告', '5', '商城公告', '商城公告', '0', '0', '5');
INSERT INTO `sh_cate` VALUES ('41', '商家入驻流程说明', '5', '商家入驻流程说明', '商家入驻流程说明', '0', '0', '5');
INSERT INTO `sh_cate` VALUES ('42', 'App', '5', 'App', 'App', '0', '0', '5');
INSERT INTO `sh_cate` VALUES ('43', 'ios', '42', 'ios', 'ios', '0', '0', '42');
INSERT INTO `sh_cate` VALUES ('44', 'Android', '42', 'Android', 'Android', '0', '0', '42');
INSERT INTO `sh_cate` VALUES ('45', '发票问题', '5', '发票问题', '发票问题', '0', '0', '5');
INSERT INTO `sh_cate` VALUES ('46', '公告', '5', '公告', '公告', '0', '0', '5');
INSERT INTO `sh_cate` VALUES ('47', '促销', '5', '促销', '促销', '0', '0', '5');
INSERT INTO `sh_cate` VALUES ('48', '微分销', '5', '微分销', '微分销', '0', '0', '5');

-- ----------------------------
-- Table structure for sh_category
-- ----------------------------
DROP TABLE IF EXISTS `sh_category`;
CREATE TABLE `sh_category` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cate_name` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品分类名称',
  `cate_img` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品分类logo',
  `sort` mediumint(9) NOT NULL DEFAULT '50' COMMENT '排序',
  `pid` tinyint(4) NOT NULL COMMENT '上级分类',
  `keywords` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '关建字',
  `show_nav` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否显示导航栏：1显示，0不显示',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_category
-- ----------------------------
INSERT INTO `sh_category` VALUES ('1', '男装，女装，内衣', '20181129\\c7b3509800287a288e4e2810964fc73b.jpg', '50', '0', '衣着服饰', '1');
INSERT INTO `sh_category` VALUES ('2', '男装', '20181129\\c887104451d4b5e65058a0e17130dd09.jpg', '50', '1', '精品男装', '1');
INSERT INTO `sh_category` VALUES ('3', '女装', '20181129\\6ec8ef77047239bc9d25ae554e111611.jpg', '50', '1', '精品女装', '1');
INSERT INTO `sh_category` VALUES ('4', '鞋靴、箱包、钟表、奢侈品', '20181029\\c1ae7168039a1007414c21f67cd7b670.png', '50', '0', '奢侈品', '0');
INSERT INTO `sh_category` VALUES ('5', '手拉箱', '20181029\\7dbbb2616b5a2eb353e8353f0ea6a4a2.png', '50', '4', '手拉箱', '0');
INSERT INTO `sh_category` VALUES ('6', '奢侈品', '', '50', '4', '奢侈品', '0');
INSERT INTO `sh_category` VALUES ('7', '功能箱包', '', '50', '4', '箱包', '0');
INSERT INTO `sh_category` VALUES ('8', '家用电器', '', '50', '0', '电器', '0');
INSERT INTO `sh_category` VALUES ('9', '大家电', '', '50', '8', '生活家电', '0');
INSERT INTO `sh_category` VALUES ('10', '生活电器', '', '50', '8', '电器', '0');
INSERT INTO `sh_category` VALUES ('11', '电脑\\办公', '', '50', '0', '数码', '0');
INSERT INTO `sh_category` VALUES ('12', '外设产品', '', '50', '11', '智能', '0');
INSERT INTO `sh_category` VALUES ('13', '数码配件', '', '50', '11', '配件', '0');
INSERT INTO `sh_category` VALUES ('14', '手机数码', '', '50', '0', '手机数码', '0');
INSERT INTO `sh_category` VALUES ('107', '游戏手机', '', '50', '100', '游戏手机', '1');
INSERT INTO `sh_category` VALUES ('106', '手机', '', '50', '100', '手机', '1');
INSERT INTO `sh_category` VALUES ('59', '内衣', '', '50', '1', '内衣配件', '1');
INSERT INTO `sh_category` VALUES ('60', '文胸', '20181129\\203e3d50388805fdad1ff1e2637dc605.jpg', '50', '59', '文胸', '1');
INSERT INTO `sh_category` VALUES ('20', '连衣裙', '20181129\\a37947fd070d93d2827264c021aa1f67.jpg', '50', '3', '连衣裙', '1');
INSERT INTO `sh_category` VALUES ('21', '蕾丝/雪纺衫', '20181129\\d009ac48e72d2c37431281fe46cb6f5e.jpg', '50', '3', '蕾丝/雪纺衫', '1');
INSERT INTO `sh_category` VALUES ('22', '衬衫', '', '50', '0', '衬衫', '0');
INSERT INTO `sh_category` VALUES ('23', 'T恤', '20181129\\78613e74c6200c8f452e85893b01560e.jpg', '50', '3', 'T恤', '1');
INSERT INTO `sh_category` VALUES ('24', '半身裙', '20181129\\822b88fc0fe64b6e14b2c3ca704a50ba.jpg', '50', '3', '半身裙', '1');
INSERT INTO `sh_category` VALUES ('25', '休闲裤', '', '50', '0', '休闲裤', '0');
INSERT INTO `sh_category` VALUES ('26', '短裤', '20181129\\8a613c612b2c6c5b7990171290d96ee2.jpg', '50', '3', '短裤', '1');
INSERT INTO `sh_category` VALUES ('27', '休闲裤', '', '50', '3', '休闲裤', '1');
INSERT INTO `sh_category` VALUES ('28', '牛仔裤', '', '50', '3', '牛仔裤', '1');
INSERT INTO `sh_category` VALUES ('29', '针织衫', '', '50', '3', '针织衫', '1');
INSERT INTO `sh_category` VALUES ('30', '吊带/背心', '', '50', '3', '吊带/背心', '1');
INSERT INTO `sh_category` VALUES ('31', '打底衫', '', '50', '3', '打底衫', '1');
INSERT INTO `sh_category` VALUES ('32', '打底裤', '', '50', '3', '打底裤', '1');
INSERT INTO `sh_category` VALUES ('33', '马甲', '', '50', '3', '马甲', '1');
INSERT INTO `sh_category` VALUES ('34', '风衣', '', '50', '3', '风衣', '0');
INSERT INTO `sh_category` VALUES ('35', '羊毛衫', '', '50', '3', '羊毛衫', '1');
INSERT INTO `sh_category` VALUES ('36', '羊毛绒', '', '50', '3', '羊毛绒', '0');
INSERT INTO `sh_category` VALUES ('37', 'T恤', '20181129\\a96b9121b644e82c8c63f7472917148d.jpg', '50', '2', 'T恤', '0');
INSERT INTO `sh_category` VALUES ('38', '裤子', '20181129\\16b8f51d618c62a776a22c62777b637d.jpg', '50', '2', '裤子', '0');
INSERT INTO `sh_category` VALUES ('39', 'POLO衫', '20181129\\efd39c234777f49b66661ce2f4112e36.jpg', '50', '2', 'POLO衫', '0');
INSERT INTO `sh_category` VALUES ('40', '针织衫', '20181129\\77f7692a52744bc1808fc357d11f4a34.jpg', '50', '2', '针织衫', '0');
INSERT INTO `sh_category` VALUES ('41', '夹克', '20181205\\80906154a21b41a94144ea8dd5559fee.jpg', '50', '2', '夹克', '0');
INSERT INTO `sh_category` VALUES ('42', '卫衣', '', '50', '2', '卫衣', '0');
INSERT INTO `sh_category` VALUES ('43', '风衣', '', '50', '2', '风衣', '0');
INSERT INTO `sh_category` VALUES ('44', '马甲/背心', '', '50', '2', '马甲/背心', '0');
INSERT INTO `sh_category` VALUES ('45', '配件', '', '50', '1', '配件', '1');
INSERT INTO `sh_category` VALUES ('46', '配饰', '20181129\\185aa99a5985019ad9295341836ecf89.jpg', '50', '45', '配饰', '0');
INSERT INTO `sh_category` VALUES ('47', '光学镜架', '20181129\\34a24bb595525fa863c18d296c3f2edb.jpg', '50', '45', '光学镜架', '0');
INSERT INTO `sh_category` VALUES ('48', '防辐射眼镜', '20181129\\fe8fe2f6ff754cbb330467bdacc11321.jpg', '50', '45', '防辐射眼镜', '0');
INSERT INTO `sh_category` VALUES ('49', '女士丝巾/围巾', '20181129\\23a83255ff08022e06106c5bab750c25.jpg', '50', '45', '女士丝巾/围巾', '0');
INSERT INTO `sh_category` VALUES ('50', '棒球帽', '20181205\\0b32adc010b1b34dbde58a812c61227d.jpg', '50', '45', '棒球帽', '0');
INSERT INTO `sh_category` VALUES ('51', '棒球帽', '', '50', '45', '棒球帽', '0');
INSERT INTO `sh_category` VALUES ('52', '遮阳伞/雨', '', '50', '45', '遮阳伞/雨', '0');
INSERT INTO `sh_category` VALUES ('53', '运动户外', '', '50', '0', '户外', '1');
INSERT INTO `sh_category` VALUES ('58', '配饰', '', '50', '13', '配饰', '1');
INSERT INTO `sh_category` VALUES ('56', '运动户外', '', '50', '2', '', '1');
INSERT INTO `sh_category` VALUES ('61', '内衣配件', '20181129\\bb483f9aac0e18b958bae019976537ef.jpg', '50', '59', '内衣配件', '1');
INSERT INTO `sh_category` VALUES ('62', '睡衣/家居', '20181129\\581b8b578574a50d45d427c36de061f5.jpg', '50', '59', '睡衣/家居', '1');
INSERT INTO `sh_category` VALUES ('63', '情侣睡衣', '20181129\\e53113ea2cf1637869900912f4826f7e.jpg', '50', '59', '情侣睡衣', '1');
INSERT INTO `sh_category` VALUES ('64', '文胸套装', '20181129\\4e24e4ad67e076abbbe5f2672b688d62.jpg', '50', '59', '文胸套装', '1');
INSERT INTO `sh_category` VALUES ('65', '少女文胸', '', '50', '59', '少女文胸', '1');
INSERT INTO `sh_category` VALUES ('66', '运动户外', '', '50', '53', '运动户外', '1');
INSERT INTO `sh_category` VALUES ('67', '跑步运动', '', '50', '66', '跑步运动', '1');
INSERT INTO `sh_category` VALUES ('68', '室内健身', '', '50', '66', '室内健身', '1');
INSERT INTO `sh_category` VALUES ('69', '自行车运动', '', '50', '66', '自行车运动', '1');
INSERT INTO `sh_category` VALUES ('70', '轮滑运动', '', '50', '66', '轮滑运动', '1');
INSERT INTO `sh_category` VALUES ('71', '羽毛球/网', '', '50', '66', '羽毛球/网', '1');
INSERT INTO `sh_category` VALUES ('72', '足球/篮球', '', '50', '66', '足球/篮球', '1');
INSERT INTO `sh_category` VALUES ('73', '电脑整机', '', '50', '11', '电脑整机', '1');
INSERT INTO `sh_category` VALUES ('74', '笔记本', '20181129\\1ac4c7cfa8aeacc5e28f4836ba0cc78f.jpg', '50', '73', '笔记本', '1');
INSERT INTO `sh_category` VALUES ('75', '平板电脑', '20181129\\c412f4a5afcffb4e0c920988c10d0d1f.jpg', '50', '73', '平板电脑', '1');
INSERT INTO `sh_category` VALUES ('76', '平板电脑配件', '20181129\\06f1ddad4fa48c2df68204289f460856.jpg', '50', '73', '平板电脑配件', '1');
INSERT INTO `sh_category` VALUES ('77', '台式机', '', '50', '73', '台式机', '1');
INSERT INTO `sh_category` VALUES ('78', '一体机', '', '50', '73', '一体机', '1');
INSERT INTO `sh_category` VALUES ('79', '服务器/工作站', '', '50', '73', '服务器/工作站', '1');
INSERT INTO `sh_category` VALUES ('80', '笔记本配件', '', '50', '73', '笔记本配件', '1');
INSERT INTO `sh_category` VALUES ('81', '显示器', '', '50', '13', '显示器', '1');
INSERT INTO `sh_category` VALUES ('82', 'cpu', '', '50', '13', 'cpu', '1');
INSERT INTO `sh_category` VALUES ('83', '主板', '', '50', '13', '主板', '1');
INSERT INTO `sh_category` VALUES ('84', '显卡', '', '50', '13', '显卡', '1');
INSERT INTO `sh_category` VALUES ('85', '硬盘', '', '50', '13', '硬盘', '1');
INSERT INTO `sh_category` VALUES ('86', '内存', '', '50', '13', '内存', '1');
INSERT INTO `sh_category` VALUES ('87', '鼠标', '', '50', '12', '鼠标', '1');
INSERT INTO `sh_category` VALUES ('88', '键盘', '', '50', '12', '键盘', '1');
INSERT INTO `sh_category` VALUES ('89', '键鼠套装', '', '50', '12', '键鼠套装', '1');
INSERT INTO `sh_category` VALUES ('90', '网络仪表仪器', '', '50', '12', '网络仪表仪器', '1');
INSERT INTO `sh_category` VALUES ('91', 'U盘', '', '50', '12', 'U盘', '1');
INSERT INTO `sh_category` VALUES ('92', '机箱', '', '50', '12', '机箱', '1');
INSERT INTO `sh_category` VALUES ('93', '电源', '', '50', '12', '电源', '1');
INSERT INTO `sh_category` VALUES ('94', '散热器', '', '50', '12', '散热器', '1');
INSERT INTO `sh_category` VALUES ('95', '刻录机/光驱', '', '50', '12', '刻录机/光驱', '1');
INSERT INTO `sh_category` VALUES ('96', '声卡/扩展卡', '', '50', '12', '声卡/扩展卡', '1');
INSERT INTO `sh_category` VALUES ('97', '装机配件', '', '50', '12', '装机配件', '1');
INSERT INTO `sh_category` VALUES ('98', 'SSD硬盘', '', '50', '12', 'SSD硬盘', '1');
INSERT INTO `sh_category` VALUES ('99', 'UPS电源', '', '50', '12', 'UPS电源', '1');
INSERT INTO `sh_category` VALUES ('100', '手机通讯', '', '50', '14', '手机通讯', '1');
INSERT INTO `sh_category` VALUES ('101', '运营商', '', '50', '14', '运营商', '1');
INSERT INTO `sh_category` VALUES ('102', '手机配件', '', '50', '14', '手机配件', '1');
INSERT INTO `sh_category` VALUES ('103', '摄像摄影', '', '50', '14', '摄像摄影', '1');
INSERT INTO `sh_category` VALUES ('104', '影音娱乐', '', '50', '14', '影音娱乐', '1');
INSERT INTO `sh_category` VALUES ('105', '智能设备', '', '50', '14', '智能设备', '1');
INSERT INTO `sh_category` VALUES ('108', '老人机', '', '50', '100', '老人机', '1');
INSERT INTO `sh_category` VALUES ('109', '对讲机', '', '50', '100', '对讲机', '1');
INSERT INTO `sh_category` VALUES ('110', '以旧换新', '', '50', '100', '以旧换新', '1');
INSERT INTO `sh_category` VALUES ('111', '手机维修', '', '50', '100', '手机维修', '1');
INSERT INTO `sh_category` VALUES ('112', '合约机', '', '50', '101', '合约机', '1');
INSERT INTO `sh_category` VALUES ('113', '选号码', '', '50', '101', '选号码', '1');
INSERT INTO `sh_category` VALUES ('114', '固话宽带', '', '50', '101', '固话宽带', '1');
INSERT INTO `sh_category` VALUES ('115', '办套餐', '', '50', '101', '办套餐', '1');
INSERT INTO `sh_category` VALUES ('116', '充话费/流量', '', '50', '101', '充话费/流量', '1');
INSERT INTO `sh_category` VALUES ('117', '中国电信', '', '50', '101', '中国电信', '1');

-- ----------------------------
-- Table structure for sh_category_brands
-- ----------------------------
DROP TABLE IF EXISTS `sh_category_brands`;
CREATE TABLE `sh_category_brands` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `brands_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT '关联品牌id',
  `pro_img` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '关联图标',
  `pro_url` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '关联地址',
  `category_id` tinyint(4) NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_category_brands
-- ----------------------------
INSERT INTO `sh_category_brands` VALUES ('9', '1,2,3,4', '', 'http://', '1');
INSERT INTO `sh_category_brands` VALUES ('8', '1,2', '', 'http://www.baidu.com', '4');
INSERT INTO `sh_category_brands` VALUES ('10', '4,5,6', '', 'http://', '11');
INSERT INTO `sh_category_brands` VALUES ('12', '4,5,6', '', 'http://', '14');

-- ----------------------------
-- Table structure for sh_category_word
-- ----------------------------
DROP TABLE IF EXISTS `sh_category_word`;
CREATE TABLE `sh_category_word` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` tinyint(4) DEFAULT NULL COMMENT '关联栏目',
  `words` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联词',
  `link_url` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_category_word
-- ----------------------------
INSERT INTO `sh_category_word` VALUES ('1', '1', '嘟嘟嘟', 'http://www.baidu.com');
INSERT INTO `sh_category_word` VALUES ('2', '1', '哒哒哒', 'http://www.baidu.com');
INSERT INTO `sh_category_word` VALUES ('3', '1', '踢踢踢', 'http://www.baidu.com');
INSERT INTO `sh_category_word` VALUES ('5', '1', '啦啦啦', 'http://www.baidu.com');
INSERT INTO `sh_category_word` VALUES ('6', '1', '哗哗哗', 'http://www.360.com');
INSERT INTO `sh_category_word` VALUES ('7', '1', '耶耶耶', 'http://www.360.com');
INSERT INTO `sh_category_word` VALUES ('8', '11', '玩3C', 'http://');
INSERT INTO `sh_category_word` VALUES ('9', '11', '企业采购', 'http://');
INSERT INTO `sh_category_word` VALUES ('10', '11', '装机大师', 'http://');
INSERT INTO `sh_category_word` VALUES ('11', '11', 'GAME+', 'http://');
INSERT INTO `sh_category_word` VALUES ('12', '11', '私人订制', 'http://');

-- ----------------------------
-- Table structure for sh_code_msg
-- ----------------------------
DROP TABLE IF EXISTS `sh_code_msg`;
CREATE TABLE `sh_code_msg` (
  `phone_num` varchar(11) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机号码',
  `email` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT '邮箱地址',
  `code` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT '验证码',
  `number` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '发送次数',
  `allnumber` tinyint(4) NOT NULL COMMENT '累计发送次数',
  `time` datetime NOT NULL COMMENT '发送时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_code_msg
-- ----------------------------
INSERT INTO `sh_code_msg` VALUES ('', '1530215484@qq.com', '202310', '', '0', '2018-11-27 12:12:21');
INSERT INTO `sh_code_msg` VALUES ('18171266309', '', '720562', '', '0', '2018-11-27 13:29:50');
INSERT INTO `sh_code_msg` VALUES ('15810985370', '', '579772', '', '0', '2018-11-27 13:37:38');

-- ----------------------------
-- Table structure for sh_conf
-- ----------------------------
DROP TABLE IF EXISTS `sh_conf`;
CREATE TABLE `sh_conf` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ename` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '英文名字',
  `cname` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '中文名字',
  `from_type` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '表单类型',
  `conf_type` tinyint(4) NOT NULL COMMENT '配置类型，1表示店铺配置，2表示商品配置',
  `values` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '可选值',
  `value` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '默认值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_conf
-- ----------------------------
INSERT INTO `sh_conf` VALUES ('2', 'sitename', '站点名称', 'input', '1', '', '嘟嘟嘟');
INSERT INTO `sh_conf` VALUES ('3', 'site_keywords', '站点关键字', 'input', '1', '', '商城');
INSERT INTO `sh_conf` VALUES ('4', 'site_description', '站点描述', 'textarea', '1', '', '商城');
INSERT INTO `sh_conf` VALUES ('5', 'close_site', '关闭站点', 'radio', '1', '是,否', '否');
INSERT INTO `sh_conf` VALUES ('6', 'logo', '网站logo', 'file', '1', '', '');
INSERT INTO `sh_conf` VALUES ('7', 'reg', '会员注册', 'selected', '1', '开启,关闭', '开启');
INSERT INTO `sh_conf` VALUES ('8', 'checkes', '多选测试', 'checked', '1', 'test1,test2,test3,test4', '');
INSERT INTO `sh_conf` VALUES ('9', 'test', '测试多选操作', 'checked', '1', 'value1,value2,value3,value4', 'value2,value3');
INSERT INTO `sh_conf` VALUES ('10', 'testinput', '测试input', 'input', '2', '', '测试数据');
INSERT INTO `sh_conf` VALUES ('11', 'testradio', '测试radio', 'radio', '2', '是,否', '是');
INSERT INTO `sh_conf` VALUES ('12', 'testchecked', '测试checked', 'checked', '2', 'checked1,checked2', 'checked1,checked2');
INSERT INTO `sh_conf` VALUES ('13', 'testselected', '测试selected', 'selected', '2', 'selected1,selected2,selected3,', 'selected2');
INSERT INTO `sh_conf` VALUES ('14', 'testtextarea', '测试textarea', 'textarea', '2', '', '');
INSERT INTO `sh_conf` VALUES ('15', 'testfile', '测试file', 'file', '2', '', '');
INSERT INTO `sh_conf` VALUES ('16', 'search_keywords', '搜索关键词', 'textarea', '1', '', '小彬,周大福,女装,连衣裙');
INSERT INTO `sh_conf` VALUES ('17', 'seach', '默认搜索', 'textarea', '1', '', '嘟嘟嘟');
INSERT INTO `sh_conf` VALUES ('18', 'Spike', '秒杀结束时间', 'input', '1', '', '2019-1-4');

-- ----------------------------
-- Table structure for sh_goods
-- ----------------------------
DROP TABLE IF EXISTS `sh_goods`;
CREATE TABLE `sh_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `goods_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名称',
  `goods_keywords` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品关键字',
  `goods_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品编号',
  `og_thumb` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品主图',
  `sm_thumb` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品小图',
  `big_thumb` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品大图',
  `marke_price` decimal(10,2) DEFAULT NULL COMMENT '市场价格',
  `shop_price` decimal(10,2) DEFAULT NULL COMMENT '当前价格',
  `on_sale` tinyint(1) DEFAULT '0' COMMENT '是否在售,0表示未在售，1表示在售',
  `category_id` tinyint(1) DEFAULT NULL COMMENT '所属栏目',
  `brand_id` tinyint(1) DEFAULT NULL COMMENT '商品品牌',
  `type_id` tinyint(1) DEFAULT NULL COMMENT '商品类型',
  `goods_desc` text COLLATE utf8_unicode_ci NOT NULL COMMENT '商品描述',
  `goods_weight` double DEFAULT '0' COMMENT '商品重量',
  `goods_unit` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单位',
  `goods_rec` tinyint(1) DEFAULT '1' COMMENT '表示的是商品',
  `goods_rec_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '属于哪个热搜',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`) USING BTREE COMMENT '栏目',
  KEY `brand_id` (`brand_id`) COMMENT '品牌',
  KEY `type_id` (`type_id`) COMMENT '类型'
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_goods
-- ----------------------------
INSERT INTO `sh_goods` VALUES ('28', '美少女连衣裙', '美少女连衣裙2号', '154088611083582', '20181121\\80d44403765e4188a0e467d92b524538.jpg', '20181121\\sm_80d44403765e4188a0e467d92b524538.jpg', '20181121\\big_80d44403765e4188a0e467d92b524538.jpg', '99.00', '30.00', '1', '2', '1', '1', '<p>美少女连衣裙2号</p>', '1', 'Kg', '1', '4,3,9');
INSERT INTO `sh_goods` VALUES ('27', '美少女连衣裙', '连衣裙', '154088347736319', '20181121\\e8fb4fac99ae7e611ab2f82564c3885d.jpg', '20181121\\sm_e8fb4fac99ae7e611ab2f82564c3885d.jpg', '20181121\\big_e8fb4fac99ae7e611ab2f82564c3885d.jpg', '99.00', '99.00', '1', '2', '1', '1', '<p>美少女连衣裙美少女连衣裙美少女连衣裙美少女连衣裙美少女连衣裙美少女连衣裙美少女连衣裙美少女连衣裙美少女连衣裙美少女连衣裙</p>', '1', 'Kg', '1', '4,3,9');
INSERT INTO `sh_goods` VALUES ('31', '丁阁仕A6L家用全身按摩椅 零重力太空舱全自动音乐按摩椅沙发 双SL导轨 深V零重力 泰式拉筋', '按摩椅', '154285012889252', '20181122\\4152002b5009b97a0d840964c12f99dd.jpg', '20181122\\sm_4152002b5009b97a0d840964c12f99dd.jpg', '20181122\\big_4152002b5009b97a0d840964c12f99dd.jpg', '7198.00', '3413.00', '1', '67', '6', '2', '<p>丁阁仕A6L家用全身按摩椅 零重力太空舱全自动音乐按摩椅沙发 双SL导轨 深V零重力 泰式拉筋</p>', '10', 'Kg', '1', '4,3');
INSERT INTO `sh_goods` VALUES ('32', '超级无敌大美女', '超级无敌大美女', '154285246692762', '20181122\\61024a9774102e064fa1f1321cce8098.jpg', '20181122\\sm_61024a9774102e064fa1f1321cce8098.jpg', '20181122\\big_61024a9774102e064fa1f1321cce8098.jpg', '198.00', '88.00', '1', '30', '2', '1', '<p>超级无敌大美女</p>', '1', 'Kg', '1', '3,9');
INSERT INTO `sh_goods` VALUES ('33', '韩版卫衣', '韩版卫衣', '154337683111260', '20181128\\271e186ba039e9f12c9a2ed7e27c1b97.jpg', '20181128\\sm_271e186ba039e9f12c9a2ed7e27c1b97.jpg', '20181128\\big_271e186ba039e9f12c9a2ed7e27c1b97.jpg', '888.00', '666.00', '1', '42', '1', '1', '<p>韩版卫衣韩版卫衣韩版卫衣韩版卫衣韩版卫衣韩版卫衣韩版卫衣韩版卫衣韩版卫衣韩版卫衣韩版卫衣韩版卫衣韩版卫衣韩版卫衣</p>', '1', 'Kg', '1', null);
INSERT INTO `sh_goods` VALUES ('36', '外套', '外套', '154337751438628', '20181128\\d46b43c8c7fc0ad9700db4a883eba6db.jpg', '20181128\\sm_d46b43c8c7fc0ad9700db4a883eba6db.jpg', '20181128\\big_d46b43c8c7fc0ad9700db4a883eba6db.jpg', '7198.00', '3413.00', '1', '39', '1', '1', '<p>341334133413341334133413341334133413341334133413341334133413341334133413341334133413341334133413341334133413341334133413</p>', '1', 'Kg', '1', null);
INSERT INTO `sh_goods` VALUES ('37', '内衣', '内衣', '154337770621440', '20181128\\dcd2289fda1d5310d1e1cd6adc915729.jpg', '20181128\\sm_dcd2289fda1d5310d1e1cd6adc915729.jpg', '20181128\\big_dcd2289fda1d5310d1e1cd6adc915729.jpg', '7198.00', '3413.00', '1', '44', '1', '1', '<p>内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣v</p>', '1', 'Kg', '1', null);
INSERT INTO `sh_goods` VALUES ('38', '内衣', '内衣', '154337777159442', '20181128\\822064dae1343d9e7c7b666e5cb41f1b.jpg', '20181128\\sm_822064dae1343d9e7c7b666e5cb41f1b.jpg', '20181128\\big_822064dae1343d9e7c7b666e5cb41f1b.jpg', '7198.00', '3413.00', '1', '44', '1', '1', '<p>内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣内衣v</p>', '1', 'Kg', '1', null);
INSERT INTO `sh_goods` VALUES ('39', '连衣裙', '连衣裙', '154337783589143', '20181128\\821fa1e4612ab72c2dd23b9398481881.jpg', '20181128\\sm_821fa1e4612ab72c2dd23b9398481881.jpg', '20181128\\big_821fa1e4612ab72c2dd23b9398481881.jpg', '7198.00', '3413.00', '1', '20', '2', '1', '<p>连衣裙连衣裙连衣裙连衣裙连衣裙连衣裙连衣裙连衣裙连衣裙v</p>', '1', 'Kg', '1', null);

-- ----------------------------
-- Table structure for sh_goodsattr
-- ----------------------------
DROP TABLE IF EXISTS `sh_goodsattr`;
CREATE TABLE `sh_goodsattr` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `attr_name` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT '属性名称',
  `attr_type` tinyint(4) NOT NULL COMMENT '属性类型；1表示唯一，2表示多选',
  `attr_values` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '属性值',
  `type_id` tinyint(4) NOT NULL COMMENT '所属类型',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_goodsattr
-- ----------------------------
INSERT INTO `sh_goodsattr` VALUES ('1', '布料', '2', '涤纶,棉麻,尼龙', '1');
INSERT INTO `sh_goodsattr` VALUES ('3', '颜色', '2', '橙色,绿色,栏色,黄色', '1');
INSERT INTO `sh_goodsattr` VALUES ('5', '内存', '2', '256g,500g,1T', '2');
INSERT INTO `sh_goodsattr` VALUES ('8', '重量', '1', '重量', '3');
INSERT INTO `sh_goodsattr` VALUES ('9', '颜色', '2', '白色,黑色', '3');

-- ----------------------------
-- Table structure for sh_goodsattr_price
-- ----------------------------
DROP TABLE IF EXISTS `sh_goodsattr_price`;
CREATE TABLE `sh_goodsattr_price` (
  `attr_id` int(11) NOT NULL COMMENT '属性id',
  `attr_value` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '属性值',
  `attr_price` decimal(10,0) NOT NULL COMMENT '属性价格',
  `attr_goodsid` int(11) NOT NULL,
  KEY `attr_id` (`attr_id`),
  KEY `attr_goodsid` (`attr_goodsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_goodsattr_price
-- ----------------------------
INSERT INTO `sh_goodsattr_price` VALUES ('1', '棉麻', '98', '27');
INSERT INTO `sh_goodsattr_price` VALUES ('1', '尼龙', '98', '27');
INSERT INTO `sh_goodsattr_price` VALUES ('3', '绿色', '98', '27');
INSERT INTO `sh_goodsattr_price` VALUES ('1', '涤纶', '98', '28');
INSERT INTO `sh_goodsattr_price` VALUES ('1', '棉麻', '98', '28');
INSERT INTO `sh_goodsattr_price` VALUES ('3', '橙色', '98', '28');
INSERT INTO `sh_goodsattr_price` VALUES ('5', '256g', '3413', '31');
INSERT INTO `sh_goodsattr_price` VALUES ('1', '棉麻', '88', '32');
INSERT INTO `sh_goodsattr_price` VALUES ('3', '绿色', '88', '32');
INSERT INTO `sh_goodsattr_price` VALUES ('1', '棉麻', '666', '33');
INSERT INTO `sh_goodsattr_price` VALUES ('3', '绿色', '666', '33');
INSERT INTO `sh_goodsattr_price` VALUES ('3', '绿色', '3413', '36');
INSERT INTO `sh_goodsattr_price` VALUES ('1', '棉麻', '3413', '36');
INSERT INTO `sh_goodsattr_price` VALUES ('1', '棉麻', '1', '37');
INSERT INTO `sh_goodsattr_price` VALUES ('3', '绿色', '1', '37');
INSERT INTO `sh_goodsattr_price` VALUES ('1', '棉麻', '1', '38');
INSERT INTO `sh_goodsattr_price` VALUES ('3', '绿色', '1', '38');
INSERT INTO `sh_goodsattr_price` VALUES ('1', '尼龙', '3413', '39');
INSERT INTO `sh_goodsattr_price` VALUES ('1', '棉麻', '3413', '39');
INSERT INTO `sh_goodsattr_price` VALUES ('3', '橙色', '3413', '39');

-- ----------------------------
-- Table structure for sh_goodsphoto
-- ----------------------------
DROP TABLE IF EXISTS `sh_goodsphoto`;
CREATE TABLE `sh_goodsphoto` (
  `id` int(11) DEFAULT NULL,
  `goods_id` int(255) DEFAULT NULL COMMENT '商品id',
  `sm_photo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小图',
  `mid_photo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '中图',
  `big_photo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '大图',
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_goodsphoto
-- ----------------------------

-- ----------------------------
-- Table structure for sh_goodstype
-- ----------------------------
DROP TABLE IF EXISTS `sh_goodstype`;
CREATE TABLE `sh_goodstype` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '类型',
  `isavailable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用：0不可用，1可用',
  `entity` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否是实体：0不是实体，1是实体',
  `keywords` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_goodstype
-- ----------------------------
INSERT INTO `sh_goodstype` VALUES ('1', '衣服', '1', '1', '衣服');
INSERT INTO `sh_goodstype` VALUES ('2', '电子产品', '1', '1', '电子产品');
INSERT INTO `sh_goodstype` VALUES ('3', '家用电器', '1', '1', '家用电器');
INSERT INTO `sh_goodstype` VALUES ('4', '数码产品', '1', '1', '数码产品');

-- ----------------------------
-- Table structure for sh_goods_photo
-- ----------------------------
DROP TABLE IF EXISTS `sh_goods_photo`;
CREATE TABLE `sh_goods_photo` (
  `id` int(11) NOT NULL,
  `og_photo` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `sm_photo` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '小图',
  `mid_photo` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '中图',
  `big_photo` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '大图',
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_goods_photo
-- ----------------------------

-- ----------------------------
-- Table structure for sh_goods_rec
-- ----------------------------
DROP TABLE IF EXISTS `sh_goods_rec`;
CREATE TABLE `sh_goods_rec` (
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `rec_id` int(3) DEFAULT NULL COMMENT '热卖推荐',
  `attr_id` int(3) DEFAULT NULL COMMENT '栏目推荐',
  `category_id` int(11) DEFAULT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_goods_rec
-- ----------------------------
INSERT INTO `sh_goods_rec` VALUES ('38', '9', null, null);
INSERT INTO `sh_goods_rec` VALUES ('38', '3', null, null);
INSERT INTO `sh_goods_rec` VALUES ('38', '4', null, null);
INSERT INTO `sh_goods_rec` VALUES ('39', '9', null, null);
INSERT INTO `sh_goods_rec` VALUES ('39', '3', null, null);
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '58');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '14');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '107');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '106');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '58');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '61');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '59');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '20');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '21');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '22');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '1');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '3');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '4');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '5');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '6');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '7');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '8');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '9');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '10');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '11');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '12');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '13');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '23');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '24');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '25');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '26');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '27');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '28');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '29');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '30');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '31');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '33');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '32');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '34');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '35');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '36');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '37');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '38');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '39');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '40');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '41');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '42');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '43');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '44');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '45');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '46');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '47');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '48');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '49');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '50');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '51');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '52');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '53');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '54');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '60');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '2');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '62');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '63');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '64');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '65');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '66');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '67');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '68');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '69');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '70');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '71');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '72');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '73');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '74');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '75');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '76');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '77');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '78');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '79');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '80');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '81');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '82');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '83');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '84');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '85');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '86');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '87');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '88');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '89');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '90');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '91');
INSERT INTO `sh_goods_rec` VALUES (null, null, '5', '100');
INSERT INTO `sh_goods_rec` VALUES (null, null, '1', '112');
INSERT INTO `sh_goods_rec` VALUES ('31', '3', null, null);
INSERT INTO `sh_goods_rec` VALUES ('32', '9', null, null);
INSERT INTO `sh_goods_rec` VALUES ('32', '3', null, null);
INSERT INTO `sh_goods_rec` VALUES ('32', '4', null, null);

-- ----------------------------
-- Table structure for sh_goods_stock
-- ----------------------------
DROP TABLE IF EXISTS `sh_goods_stock`;
CREATE TABLE `sh_goods_stock` (
  `id` mediumint(9) NOT NULL COMMENT 'id',
  `goods_id` mediumint(9) NOT NULL COMMENT '商品id',
  `goods_attr` varchar(11) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品属性',
  `goods_num` int(11) NOT NULL COMMENT '商品数量',
  `goods_attrvalue` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_goods_stock
-- ----------------------------
INSERT INTO `sh_goods_stock` VALUES ('0', '27', '1,3', '100', '');
INSERT INTO `sh_goods_stock` VALUES ('0', '27', '1,3', '100', '');

-- ----------------------------
-- Table structure for sh_link
-- ----------------------------
DROP TABLE IF EXISTS `sh_link`;
CREATE TABLE `sh_link` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `link_url` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接地址',
  `link_logo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接logo',
  `description` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型：1：文字，2：图片',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态：0：禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_link
-- ----------------------------

-- ----------------------------
-- Table structure for sh_member
-- ----------------------------
DROP TABLE IF EXISTS `sh_member`;
CREATE TABLE `sh_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_lever` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '会员等级',
  `bom_point` mediumint(5) DEFAULT NULL COMMENT '积分下限',
  `top_point` mediumint(5) DEFAULT NULL COMMENT '积分上限',
  `rate` tinyint(3) DEFAULT NULL COMMENT '折扣率',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_member
-- ----------------------------
INSERT INTO `sh_member` VALUES ('1', '白银会员', '0', '99', '100');
INSERT INTO `sh_member` VALUES ('2', '黄金会员', '100', '500', '80');
INSERT INTO `sh_member` VALUES ('3', '铂金会员', '501', '800', '70');
INSERT INTO `sh_member` VALUES ('4', '钻石会员', '801', '9999', '60');

-- ----------------------------
-- Table structure for sh_member_price
-- ----------------------------
DROP TABLE IF EXISTS `sh_member_price`;
CREATE TABLE `sh_member_price` (
  `mprice` decimal(10,2) NOT NULL COMMENT '会员价格',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `mlevel_id` int(11) NOT NULL COMMENT '会员id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_member_price
-- ----------------------------
INSERT INTO `sh_member_price` VALUES ('69.00', '27', '4');
INSERT INTO `sh_member_price` VALUES ('99.00', '28', '1');
INSERT INTO `sh_member_price` VALUES ('99.00', '27', '3');
INSERT INTO `sh_member_price` VALUES ('99.00', '27', '2');
INSERT INTO `sh_member_price` VALUES ('99.00', '27', '1');
INSERT INTO `sh_member_price` VALUES ('3413.00', '31', '4');
INSERT INTO `sh_member_price` VALUES ('3413.00', '31', '3');
INSERT INTO `sh_member_price` VALUES ('3413.00', '31', '2');
INSERT INTO `sh_member_price` VALUES ('3413.00', '31', '1');
INSERT INTO `sh_member_price` VALUES ('88.00', '32', '4');
INSERT INTO `sh_member_price` VALUES ('88.00', '32', '3');
INSERT INTO `sh_member_price` VALUES ('88.00', '32', '2');
INSERT INTO `sh_member_price` VALUES ('88.00', '32', '1');
INSERT INTO `sh_member_price` VALUES ('666.00', '33', '1');
INSERT INTO `sh_member_price` VALUES ('666.00', '33', '2');
INSERT INTO `sh_member_price` VALUES ('666.00', '33', '3');
INSERT INTO `sh_member_price` VALUES ('600.00', '33', '4');
INSERT INTO `sh_member_price` VALUES ('3413.00', '37', '1');
INSERT INTO `sh_member_price` VALUES ('3413.00', '36', '3');
INSERT INTO `sh_member_price` VALUES ('3413.00', '36', '2');
INSERT INTO `sh_member_price` VALUES ('3413.00', '36', '1');
INSERT INTO `sh_member_price` VALUES ('3413.00', '38', '2');
INSERT INTO `sh_member_price` VALUES ('3413.00', '38', '1');
INSERT INTO `sh_member_price` VALUES ('3413.00', '37', '3');
INSERT INTO `sh_member_price` VALUES ('3413.00', '37', '2');
INSERT INTO `sh_member_price` VALUES ('3413.00', '38', '3');
INSERT INTO `sh_member_price` VALUES ('3413.00', '39', '1');
INSERT INTO `sh_member_price` VALUES ('3413.00', '39', '2');
INSERT INTO `sh_member_price` VALUES ('3413.00', '39', '3');

-- ----------------------------
-- Table structure for sh_nav
-- ----------------------------
DROP TABLE IF EXISTS `sh_nav`;
CREATE TABLE `sh_nav` (
  `nav_scort` tinyint(3) NOT NULL COMMENT '排序',
  `nav_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '导航名称',
  `nav_url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '导航地址',
  `nav_open` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1表示顶部，2表示中部，3表示底部',
  `id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_nav
-- ----------------------------
INSERT INTO `sh_nav` VALUES ('3', '聚划算', '', '1', '12');
INSERT INTO `sh_nav` VALUES ('1', '王彬', 'www.baidu.com', '1', '8');
INSERT INTO `sh_nav` VALUES ('2', '男人柜', 'www.baidu.com', '1', '9');
INSERT INTO `sh_nav` VALUES ('4', '品牌专区', '', '1', '11');
INSERT INTO `sh_nav` VALUES ('5', '积分商城', '', '1', '14');

-- ----------------------------
-- Table structure for sh_recommend
-- ----------------------------
DROP TABLE IF EXISTS `sh_recommend`;
CREATE TABLE `sh_recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '推荐位名称',
  `rec_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '推荐位类型:1表示商品，2表示分类',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_recommend
-- ----------------------------
INSERT INTO `sh_recommend` VALUES ('9', '热卖商品', '1');
INSERT INTO `sh_recommend` VALUES ('3', '热卖抢购', '1');
INSERT INTO `sh_recommend` VALUES ('4', '最新商品', '1');
INSERT INTO `sh_recommend` VALUES ('5', '热卖栏目', '2');
INSERT INTO `sh_recommend` VALUES ('6', '促销栏目', '2');
INSERT INTO `sh_recommend` VALUES ('1', '不上推荐', '2');
INSERT INTO `sh_recommend` VALUES ('2', '不上热卖', '1');

-- ----------------------------
-- Table structure for sh_user
-- ----------------------------
DROP TABLE IF EXISTS `sh_user`;
CREATE TABLE `sh_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `email` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone_num` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号',
  `token` tinyint(1) DEFAULT NULL,
  `email_token` tinyint(1) DEFAULT '0' COMMENT '邮箱验证：0否，1是',
  `phone_token` tinyint(1) DEFAULT '0' COMMENT '手机验证：0否，1是',
  `register_type` tinyint(1) DEFAULT '0' COMMENT '登陆状态',
  `time` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sh_user
-- ----------------------------
INSERT INTO `sh_user` VALUES ('6', '王彬', 'e10adc3949ba59abbe56e057f20f883e', '1530215484@qq.com', '', null, '0', '0', '0', '0000-00-00 00:00:00');
