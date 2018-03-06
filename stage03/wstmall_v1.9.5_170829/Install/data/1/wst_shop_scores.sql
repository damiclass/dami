SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `wst_shop_scores`
-- ----------------------------
DROP TABLE IF EXISTS `wst_shop_scores`;
CREATE TABLE `wst_shop_scores` (
  `scoreId` int(11) NOT NULL AUTO_INCREMENT,
  `shopId` int(11) NOT NULL,
  `totalScore` int(11) NOT NULL DEFAULT '0',
  `totalUsers` int(11) NOT NULL DEFAULT '0',
  `goodsScore` int(11) NOT NULL DEFAULT '0',
  `goodsUsers` int(11) NOT NULL DEFAULT '0',
  `serviceScore` int(11) NOT NULL DEFAULT '0',
  `serviceUsers` int(11) NOT NULL DEFAULT '0',
  `timeScore` int(11) NOT NULL DEFAULT '0',
  `timeUsers` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`scoreId`),
  UNIQUE KEY `shopId` (`shopId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wst_shop_scores
-- ----------------------------
 INSERT INTO `wst_shop_scores` VALUES('1', '4', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('2', '5', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('3', '6', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('4', '7', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('5', '8', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('6', '9', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('7', '10', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('8', '11', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('9', '12', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('10', '13', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('11', '14', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('12', '15', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('13', '16', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('14', '17', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('15', '18', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('16', '19', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('17', '20', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('18', '21', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('19', '22', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('20', '23', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('21', '24', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('22', '25', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('23', '26', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('24', '27', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('25', '28', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('26', '29', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('27', '30', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('28', '31', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('29', '32', '0', '0', '0', '0', '0', '0', '0', '0'),
 ('30', '33', '0', '0', '0', '0', '0', '0', '0', '0');
