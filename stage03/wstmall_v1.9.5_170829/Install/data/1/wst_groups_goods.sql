
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `wst_groups_goods`;
CREATE TABLE `wst_groups_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL DEFAULT '0',
  `shopId` int(11) NOT NULL DEFAULT '0',
  `goodsId` int(11) NOT NULL DEFAULT '0',
  `groupMoney` decimal(11,2) NOT NULL DEFAULT '0.00',
  `goodsStock` int(11) NOT NULL DEFAULT '0',
  `virtualBuyCnt` int(11) NOT NULL DEFAULT '0',
  `saleCnt` int(11) NOT NULL DEFAULT '0',
  `goodsStatus` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` datetime DEFAULT NULL,
  `dataFlag` tinyint(4) NOT NULL DEFAULT '1',
  `sortNo` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
