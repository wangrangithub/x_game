/*
Navicat MySQL Data Transfer

Source Server         : 192.168.99.90
Source Server Version : 50632
Source Host           : 192.168.99.90:3306
Source Database       : dead_gm

Target Server Type    : MYSQL
Target Server Version : 50632
File Encoding         : 65001

Date: 2017-09-20 18:41:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `rolefunmenurel`
-- ----------------------------
DROP TABLE IF EXISTS `rolefunmenurel`;
CREATE TABLE `rolefunmenurel` (
  `relId` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) DEFAULT NULL,
  `funId` int(11) DEFAULT NULL,
  PRIMARY KEY (`relId`),
  KEY `FK_Reference_2` (`roleId`),
  KEY `FK_Reference_3` (`funId`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`roleId`) REFERENCES `roleinfo` (`roleId`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`funId`) REFERENCES `functionmenu` (`funId`)
) ENGINE=InnoDB AUTO_INCREMENT=10294 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rolefunmenurel
-- ----------------------------
INSERT INTO `rolefunmenurel` VALUES ('6421', '25', '22');
INSERT INTO `rolefunmenurel` VALUES ('6422', '25', '23');
INSERT INTO `rolefunmenurel` VALUES ('6423', '25', '24');
INSERT INTO `rolefunmenurel` VALUES ('6424', '25', '25');
INSERT INTO `rolefunmenurel` VALUES ('6425', '25', '26');
INSERT INTO `rolefunmenurel` VALUES ('6426', '25', '27');
INSERT INTO `rolefunmenurel` VALUES ('6427', '25', '28');
INSERT INTO `rolefunmenurel` VALUES ('6428', '25', '29');
INSERT INTO `rolefunmenurel` VALUES ('6429', '25', '33');
INSERT INTO `rolefunmenurel` VALUES ('6430', '25', '34');
INSERT INTO `rolefunmenurel` VALUES ('6431', '25', '141');
INSERT INTO `rolefunmenurel` VALUES ('6432', '25', '30');
INSERT INTO `rolefunmenurel` VALUES ('6433', '25', '32');
INSERT INTO `rolefunmenurel` VALUES ('6434', '25', '35');
INSERT INTO `rolefunmenurel` VALUES ('6435', '25', '36');
INSERT INTO `rolefunmenurel` VALUES ('6436', '25', '37');
INSERT INTO `rolefunmenurel` VALUES ('6437', '25', '38');
INSERT INTO `rolefunmenurel` VALUES ('6438', '25', '142');
INSERT INTO `rolefunmenurel` VALUES ('6439', '25', '153');
INSERT INTO `rolefunmenurel` VALUES ('6440', '25', '31');
INSERT INTO `rolefunmenurel` VALUES ('6441', '25', '39');
INSERT INTO `rolefunmenurel` VALUES ('6442', '25', '40');
INSERT INTO `rolefunmenurel` VALUES ('6443', '25', '41');
INSERT INTO `rolefunmenurel` VALUES ('6444', '25', '42');
INSERT INTO `rolefunmenurel` VALUES ('6445', '25', '43');
INSERT INTO `rolefunmenurel` VALUES ('6446', '25', '44');
INSERT INTO `rolefunmenurel` VALUES ('6447', '25', '45');
INSERT INTO `rolefunmenurel` VALUES ('6448', '25', '46');
INSERT INTO `rolefunmenurel` VALUES ('6449', '25', '47');
INSERT INTO `rolefunmenurel` VALUES ('6450', '25', '48');
INSERT INTO `rolefunmenurel` VALUES ('6451', '25', '49');
INSERT INTO `rolefunmenurel` VALUES ('6452', '25', '50');
INSERT INTO `rolefunmenurel` VALUES ('6453', '25', '51');
INSERT INTO `rolefunmenurel` VALUES ('6454', '25', '52');
INSERT INTO `rolefunmenurel` VALUES ('6455', '25', '53');
INSERT INTO `rolefunmenurel` VALUES ('6456', '25', '54');
INSERT INTO `rolefunmenurel` VALUES ('6457', '25', '55');
INSERT INTO `rolefunmenurel` VALUES ('6458', '25', '56');
INSERT INTO `rolefunmenurel` VALUES ('6459', '25', '57');
INSERT INTO `rolefunmenurel` VALUES ('6460', '25', '58');
INSERT INTO `rolefunmenurel` VALUES ('6461', '25', '59');
INSERT INTO `rolefunmenurel` VALUES ('6462', '25', '60');
INSERT INTO `rolefunmenurel` VALUES ('6463', '25', '61');
INSERT INTO `rolefunmenurel` VALUES ('6464', '25', '62');
INSERT INTO `rolefunmenurel` VALUES ('6465', '25', '63');
INSERT INTO `rolefunmenurel` VALUES ('6466', '25', '64');
INSERT INTO `rolefunmenurel` VALUES ('6467', '25', '65');
INSERT INTO `rolefunmenurel` VALUES ('6468', '25', '66');
INSERT INTO `rolefunmenurel` VALUES ('6469', '25', '67');
INSERT INTO `rolefunmenurel` VALUES ('6470', '25', '68');
INSERT INTO `rolefunmenurel` VALUES ('6471', '25', '69');
INSERT INTO `rolefunmenurel` VALUES ('6472', '25', '70');
INSERT INTO `rolefunmenurel` VALUES ('6473', '25', '71');
INSERT INTO `rolefunmenurel` VALUES ('6474', '25', '72');
INSERT INTO `rolefunmenurel` VALUES ('6475', '25', '73');
INSERT INTO `rolefunmenurel` VALUES ('6476', '25', '74');
INSERT INTO `rolefunmenurel` VALUES ('6477', '25', '75');
INSERT INTO `rolefunmenurel` VALUES ('6478', '25', '76');
INSERT INTO `rolefunmenurel` VALUES ('6479', '25', '77');
INSERT INTO `rolefunmenurel` VALUES ('6480', '25', '78');
INSERT INTO `rolefunmenurel` VALUES ('6481', '25', '79');
INSERT INTO `rolefunmenurel` VALUES ('6482', '25', '109');
INSERT INTO `rolefunmenurel` VALUES ('6483', '25', '80');
INSERT INTO `rolefunmenurel` VALUES ('6484', '25', '81');
INSERT INTO `rolefunmenurel` VALUES ('6485', '25', '83');
INSERT INTO `rolefunmenurel` VALUES ('6486', '25', '95');
INSERT INTO `rolefunmenurel` VALUES ('6487', '25', '96');
INSERT INTO `rolefunmenurel` VALUES ('6488', '25', '84');
INSERT INTO `rolefunmenurel` VALUES ('6489', '25', '85');
INSERT INTO `rolefunmenurel` VALUES ('6490', '25', '86');
INSERT INTO `rolefunmenurel` VALUES ('6491', '25', '102');
INSERT INTO `rolefunmenurel` VALUES ('6492', '25', '87');
INSERT INTO `rolefunmenurel` VALUES ('6493', '25', '110');
INSERT INTO `rolefunmenurel` VALUES ('6494', '25', '111');
INSERT INTO `rolefunmenurel` VALUES ('6495', '25', '88');
INSERT INTO `rolefunmenurel` VALUES ('6496', '25', '103');
INSERT INTO `rolefunmenurel` VALUES ('6497', '25', '89');
INSERT INTO `rolefunmenurel` VALUES ('6498', '25', '112');
INSERT INTO `rolefunmenurel` VALUES ('6499', '25', '113');
INSERT INTO `rolefunmenurel` VALUES ('6500', '25', '90');
INSERT INTO `rolefunmenurel` VALUES ('6501', '25', '114');
INSERT INTO `rolefunmenurel` VALUES ('6502', '25', '91');
INSERT INTO `rolefunmenurel` VALUES ('6503', '25', '92');
INSERT INTO `rolefunmenurel` VALUES ('6504', '25', '93');
INSERT INTO `rolefunmenurel` VALUES ('6505', '25', '94');
INSERT INTO `rolefunmenurel` VALUES ('6506', '25', '97');
INSERT INTO `rolefunmenurel` VALUES ('6507', '25', '98');
INSERT INTO `rolefunmenurel` VALUES ('6508', '25', '99');
INSERT INTO `rolefunmenurel` VALUES ('6509', '25', '100');
INSERT INTO `rolefunmenurel` VALUES ('6510', '25', '101');
INSERT INTO `rolefunmenurel` VALUES ('6511', '25', '104');
INSERT INTO `rolefunmenurel` VALUES ('6512', '25', '105');
INSERT INTO `rolefunmenurel` VALUES ('6513', '25', '106');
INSERT INTO `rolefunmenurel` VALUES ('6514', '25', '107');
INSERT INTO `rolefunmenurel` VALUES ('6515', '25', '108');
INSERT INTO `rolefunmenurel` VALUES ('6516', '25', '135');
INSERT INTO `rolefunmenurel` VALUES ('6517', '25', '136');
INSERT INTO `rolefunmenurel` VALUES ('6518', '25', '137');
INSERT INTO `rolefunmenurel` VALUES ('6519', '25', '140');
INSERT INTO `rolefunmenurel` VALUES ('6520', '25', '143');
INSERT INTO `rolefunmenurel` VALUES ('6521', '25', '144');
INSERT INTO `rolefunmenurel` VALUES ('6522', '25', '145');
INSERT INTO `rolefunmenurel` VALUES ('6523', '25', '146');
INSERT INTO `rolefunmenurel` VALUES ('6524', '25', '147');
INSERT INTO `rolefunmenurel` VALUES ('6525', '25', '148');
INSERT INTO `rolefunmenurel` VALUES ('6526', '25', '149');
INSERT INTO `rolefunmenurel` VALUES ('6527', '25', '150');
INSERT INTO `rolefunmenurel` VALUES ('6528', '25', '154');
INSERT INTO `rolefunmenurel` VALUES ('6529', '25', '155');
INSERT INTO `rolefunmenurel` VALUES ('6530', '25', '158');
INSERT INTO `rolefunmenurel` VALUES ('6531', '25', '159');
INSERT INTO `rolefunmenurel` VALUES ('6532', '25', '160');
INSERT INTO `rolefunmenurel` VALUES ('6533', '25', '156');
INSERT INTO `rolefunmenurel` VALUES ('6534', '25', '157');
INSERT INTO `rolefunmenurel` VALUES ('6535', '25', '139');
INSERT INTO `rolefunmenurel` VALUES ('6536', '26', '22');
INSERT INTO `rolefunmenurel` VALUES ('6537', '26', '23');
INSERT INTO `rolefunmenurel` VALUES ('6538', '26', '24');
INSERT INTO `rolefunmenurel` VALUES ('6539', '26', '25');
INSERT INTO `rolefunmenurel` VALUES ('6540', '26', '26');
INSERT INTO `rolefunmenurel` VALUES ('6541', '26', '27');
INSERT INTO `rolefunmenurel` VALUES ('6542', '26', '28');
INSERT INTO `rolefunmenurel` VALUES ('6543', '26', '29');
INSERT INTO `rolefunmenurel` VALUES ('6544', '26', '33');
INSERT INTO `rolefunmenurel` VALUES ('6545', '26', '34');
INSERT INTO `rolefunmenurel` VALUES ('6546', '26', '141');
INSERT INTO `rolefunmenurel` VALUES ('6547', '26', '30');
INSERT INTO `rolefunmenurel` VALUES ('6548', '26', '32');
INSERT INTO `rolefunmenurel` VALUES ('6549', '26', '35');
INSERT INTO `rolefunmenurel` VALUES ('6550', '26', '36');
INSERT INTO `rolefunmenurel` VALUES ('6551', '26', '37');
INSERT INTO `rolefunmenurel` VALUES ('6552', '26', '38');
INSERT INTO `rolefunmenurel` VALUES ('6553', '26', '142');
INSERT INTO `rolefunmenurel` VALUES ('6554', '26', '153');
INSERT INTO `rolefunmenurel` VALUES ('6555', '26', '31');
INSERT INTO `rolefunmenurel` VALUES ('6556', '26', '39');
INSERT INTO `rolefunmenurel` VALUES ('6557', '26', '40');
INSERT INTO `rolefunmenurel` VALUES ('6558', '26', '41');
INSERT INTO `rolefunmenurel` VALUES ('6559', '26', '42');
INSERT INTO `rolefunmenurel` VALUES ('6560', '26', '43');
INSERT INTO `rolefunmenurel` VALUES ('6561', '26', '44');
INSERT INTO `rolefunmenurel` VALUES ('6562', '26', '45');
INSERT INTO `rolefunmenurel` VALUES ('6563', '26', '46');
INSERT INTO `rolefunmenurel` VALUES ('6564', '26', '47');
INSERT INTO `rolefunmenurel` VALUES ('6565', '26', '48');
INSERT INTO `rolefunmenurel` VALUES ('6566', '26', '49');
INSERT INTO `rolefunmenurel` VALUES ('6567', '26', '50');
INSERT INTO `rolefunmenurel` VALUES ('6568', '26', '51');
INSERT INTO `rolefunmenurel` VALUES ('6569', '26', '52');
INSERT INTO `rolefunmenurel` VALUES ('6570', '26', '53');
INSERT INTO `rolefunmenurel` VALUES ('6571', '26', '54');
INSERT INTO `rolefunmenurel` VALUES ('6572', '26', '55');
INSERT INTO `rolefunmenurel` VALUES ('6573', '26', '56');
INSERT INTO `rolefunmenurel` VALUES ('6574', '26', '57');
INSERT INTO `rolefunmenurel` VALUES ('6575', '26', '58');
INSERT INTO `rolefunmenurel` VALUES ('6576', '26', '59');
INSERT INTO `rolefunmenurel` VALUES ('6577', '26', '60');
INSERT INTO `rolefunmenurel` VALUES ('6578', '26', '61');
INSERT INTO `rolefunmenurel` VALUES ('6579', '26', '62');
INSERT INTO `rolefunmenurel` VALUES ('6580', '26', '63');
INSERT INTO `rolefunmenurel` VALUES ('6581', '26', '64');
INSERT INTO `rolefunmenurel` VALUES ('6582', '26', '65');
INSERT INTO `rolefunmenurel` VALUES ('6583', '26', '66');
INSERT INTO `rolefunmenurel` VALUES ('6584', '26', '67');
INSERT INTO `rolefunmenurel` VALUES ('6585', '26', '68');
INSERT INTO `rolefunmenurel` VALUES ('6586', '26', '69');
INSERT INTO `rolefunmenurel` VALUES ('6587', '26', '70');
INSERT INTO `rolefunmenurel` VALUES ('6588', '26', '71');
INSERT INTO `rolefunmenurel` VALUES ('6589', '26', '72');
INSERT INTO `rolefunmenurel` VALUES ('6590', '26', '73');
INSERT INTO `rolefunmenurel` VALUES ('6591', '26', '74');
INSERT INTO `rolefunmenurel` VALUES ('6592', '26', '75');
INSERT INTO `rolefunmenurel` VALUES ('6593', '26', '76');
INSERT INTO `rolefunmenurel` VALUES ('6594', '26', '77');
INSERT INTO `rolefunmenurel` VALUES ('6595', '26', '78');
INSERT INTO `rolefunmenurel` VALUES ('6596', '26', '79');
INSERT INTO `rolefunmenurel` VALUES ('6597', '26', '109');
INSERT INTO `rolefunmenurel` VALUES ('10062', '1', '6');
INSERT INTO `rolefunmenurel` VALUES ('10063', '1', '7');
INSERT INTO `rolefunmenurel` VALUES ('10064', '1', '8');
INSERT INTO `rolefunmenurel` VALUES ('10065', '1', '20');
INSERT INTO `rolefunmenurel` VALUES ('10066', '1', '21');
INSERT INTO `rolefunmenurel` VALUES ('10067', '1', '9');
INSERT INTO `rolefunmenurel` VALUES ('10068', '1', '15');
INSERT INTO `rolefunmenurel` VALUES ('10069', '1', '17');
INSERT INTO `rolefunmenurel` VALUES ('10070', '1', '18');
INSERT INTO `rolefunmenurel` VALUES ('10071', '1', '19');
INSERT INTO `rolefunmenurel` VALUES ('10072', '1', '22');
INSERT INTO `rolefunmenurel` VALUES ('10073', '1', '23');
INSERT INTO `rolefunmenurel` VALUES ('10074', '1', '24');
INSERT INTO `rolefunmenurel` VALUES ('10075', '1', '25');
INSERT INTO `rolefunmenurel` VALUES ('10076', '1', '26');
INSERT INTO `rolefunmenurel` VALUES ('10077', '1', '27');
INSERT INTO `rolefunmenurel` VALUES ('10078', '1', '28');
INSERT INTO `rolefunmenurel` VALUES ('10079', '1', '29');
INSERT INTO `rolefunmenurel` VALUES ('10080', '1', '33');
INSERT INTO `rolefunmenurel` VALUES ('10081', '1', '34');
INSERT INTO `rolefunmenurel` VALUES ('10082', '1', '141');
INSERT INTO `rolefunmenurel` VALUES ('10083', '1', '30');
INSERT INTO `rolefunmenurel` VALUES ('10084', '1', '32');
INSERT INTO `rolefunmenurel` VALUES ('10085', '1', '35');
INSERT INTO `rolefunmenurel` VALUES ('10086', '1', '36');
INSERT INTO `rolefunmenurel` VALUES ('10087', '1', '37');
INSERT INTO `rolefunmenurel` VALUES ('10088', '1', '38');
INSERT INTO `rolefunmenurel` VALUES ('10089', '1', '142');
INSERT INTO `rolefunmenurel` VALUES ('10090', '1', '153');
INSERT INTO `rolefunmenurel` VALUES ('10091', '1', '163');
INSERT INTO `rolefunmenurel` VALUES ('10092', '1', '164');
INSERT INTO `rolefunmenurel` VALUES ('10093', '1', '165');
INSERT INTO `rolefunmenurel` VALUES ('10094', '1', '166');
INSERT INTO `rolefunmenurel` VALUES ('10095', '1', '167');
INSERT INTO `rolefunmenurel` VALUES ('10096', '1', '168');
INSERT INTO `rolefunmenurel` VALUES ('10097', '1', '174');
INSERT INTO `rolefunmenurel` VALUES ('10098', '1', '176');
INSERT INTO `rolefunmenurel` VALUES ('10099', '1', '177');
INSERT INTO `rolefunmenurel` VALUES ('10100', '1', '178');
INSERT INTO `rolefunmenurel` VALUES ('10101', '1', '31');
INSERT INTO `rolefunmenurel` VALUES ('10102', '1', '39');
INSERT INTO `rolefunmenurel` VALUES ('10103', '1', '40');
INSERT INTO `rolefunmenurel` VALUES ('10104', '1', '41');
INSERT INTO `rolefunmenurel` VALUES ('10105', '1', '42');
INSERT INTO `rolefunmenurel` VALUES ('10106', '1', '43');
INSERT INTO `rolefunmenurel` VALUES ('10107', '1', '44');
INSERT INTO `rolefunmenurel` VALUES ('10108', '1', '45');
INSERT INTO `rolefunmenurel` VALUES ('10109', '1', '46');
INSERT INTO `rolefunmenurel` VALUES ('10110', '1', '47');
INSERT INTO `rolefunmenurel` VALUES ('10111', '1', '48');
INSERT INTO `rolefunmenurel` VALUES ('10112', '1', '49');
INSERT INTO `rolefunmenurel` VALUES ('10113', '1', '50');
INSERT INTO `rolefunmenurel` VALUES ('10114', '1', '51');
INSERT INTO `rolefunmenurel` VALUES ('10115', '1', '52');
INSERT INTO `rolefunmenurel` VALUES ('10116', '1', '53');
INSERT INTO `rolefunmenurel` VALUES ('10117', '1', '54');
INSERT INTO `rolefunmenurel` VALUES ('10118', '1', '55');
INSERT INTO `rolefunmenurel` VALUES ('10119', '1', '56');
INSERT INTO `rolefunmenurel` VALUES ('10120', '1', '57');
INSERT INTO `rolefunmenurel` VALUES ('10121', '1', '58');
INSERT INTO `rolefunmenurel` VALUES ('10122', '1', '59');
INSERT INTO `rolefunmenurel` VALUES ('10123', '1', '60');
INSERT INTO `rolefunmenurel` VALUES ('10124', '1', '61');
INSERT INTO `rolefunmenurel` VALUES ('10125', '1', '62');
INSERT INTO `rolefunmenurel` VALUES ('10126', '1', '63');
INSERT INTO `rolefunmenurel` VALUES ('10127', '1', '64');
INSERT INTO `rolefunmenurel` VALUES ('10128', '1', '65');
INSERT INTO `rolefunmenurel` VALUES ('10129', '1', '66');
INSERT INTO `rolefunmenurel` VALUES ('10130', '1', '67');
INSERT INTO `rolefunmenurel` VALUES ('10131', '1', '68');
INSERT INTO `rolefunmenurel` VALUES ('10132', '1', '69');
INSERT INTO `rolefunmenurel` VALUES ('10133', '1', '70');
INSERT INTO `rolefunmenurel` VALUES ('10134', '1', '71');
INSERT INTO `rolefunmenurel` VALUES ('10135', '1', '72');
INSERT INTO `rolefunmenurel` VALUES ('10136', '1', '73');
INSERT INTO `rolefunmenurel` VALUES ('10137', '1', '74');
INSERT INTO `rolefunmenurel` VALUES ('10138', '1', '75');
INSERT INTO `rolefunmenurel` VALUES ('10139', '1', '76');
INSERT INTO `rolefunmenurel` VALUES ('10140', '1', '77');
INSERT INTO `rolefunmenurel` VALUES ('10141', '1', '78');
INSERT INTO `rolefunmenurel` VALUES ('10142', '1', '79');
INSERT INTO `rolefunmenurel` VALUES ('10143', '1', '109');
INSERT INTO `rolefunmenurel` VALUES ('10144', '1', '181');
INSERT INTO `rolefunmenurel` VALUES ('10145', '1', '182');
INSERT INTO `rolefunmenurel` VALUES ('10146', '1', '183');
INSERT INTO `rolefunmenurel` VALUES ('10147', '1', '184');
INSERT INTO `rolefunmenurel` VALUES ('10148', '1', '185');
INSERT INTO `rolefunmenurel` VALUES ('10149', '1', '186');
INSERT INTO `rolefunmenurel` VALUES ('10150', '1', '187');
INSERT INTO `rolefunmenurel` VALUES ('10151', '1', '188');
INSERT INTO `rolefunmenurel` VALUES ('10152', '1', '189');
INSERT INTO `rolefunmenurel` VALUES ('10153', '1', '193');
INSERT INTO `rolefunmenurel` VALUES ('10154', '1', '194');
INSERT INTO `rolefunmenurel` VALUES ('10155', '1', '80');
INSERT INTO `rolefunmenurel` VALUES ('10156', '1', '81');
INSERT INTO `rolefunmenurel` VALUES ('10157', '1', '83');
INSERT INTO `rolefunmenurel` VALUES ('10158', '1', '95');
INSERT INTO `rolefunmenurel` VALUES ('10159', '1', '96');
INSERT INTO `rolefunmenurel` VALUES ('10160', '1', '84');
INSERT INTO `rolefunmenurel` VALUES ('10161', '1', '85');
INSERT INTO `rolefunmenurel` VALUES ('10162', '1', '86');
INSERT INTO `rolefunmenurel` VALUES ('10163', '1', '102');
INSERT INTO `rolefunmenurel` VALUES ('10164', '1', '87');
INSERT INTO `rolefunmenurel` VALUES ('10165', '1', '110');
INSERT INTO `rolefunmenurel` VALUES ('10166', '1', '111');
INSERT INTO `rolefunmenurel` VALUES ('10167', '1', '88');
INSERT INTO `rolefunmenurel` VALUES ('10168', '1', '103');
INSERT INTO `rolefunmenurel` VALUES ('10169', '1', '89');
INSERT INTO `rolefunmenurel` VALUES ('10170', '1', '112');
INSERT INTO `rolefunmenurel` VALUES ('10171', '1', '113');
INSERT INTO `rolefunmenurel` VALUES ('10172', '1', '90');
INSERT INTO `rolefunmenurel` VALUES ('10173', '1', '114');
INSERT INTO `rolefunmenurel` VALUES ('10174', '1', '91');
INSERT INTO `rolefunmenurel` VALUES ('10175', '1', '92');
INSERT INTO `rolefunmenurel` VALUES ('10176', '1', '93');
INSERT INTO `rolefunmenurel` VALUES ('10177', '1', '94');
INSERT INTO `rolefunmenurel` VALUES ('10178', '1', '97');
INSERT INTO `rolefunmenurel` VALUES ('10179', '1', '98');
INSERT INTO `rolefunmenurel` VALUES ('10180', '1', '99');
INSERT INTO `rolefunmenurel` VALUES ('10181', '1', '100');
INSERT INTO `rolefunmenurel` VALUES ('10182', '1', '101');
INSERT INTO `rolefunmenurel` VALUES ('10183', '1', '104');
INSERT INTO `rolefunmenurel` VALUES ('10184', '1', '105');
INSERT INTO `rolefunmenurel` VALUES ('10185', '1', '106');
INSERT INTO `rolefunmenurel` VALUES ('10186', '1', '107');
INSERT INTO `rolefunmenurel` VALUES ('10187', '1', '108');
INSERT INTO `rolefunmenurel` VALUES ('10188', '1', '115');
INSERT INTO `rolefunmenurel` VALUES ('10189', '1', '116');
INSERT INTO `rolefunmenurel` VALUES ('10190', '1', '121');
INSERT INTO `rolefunmenurel` VALUES ('10191', '1', '122');
INSERT INTO `rolefunmenurel` VALUES ('10192', '1', '123');
INSERT INTO `rolefunmenurel` VALUES ('10193', '1', '171');
INSERT INTO `rolefunmenurel` VALUES ('10194', '1', '117');
INSERT INTO `rolefunmenurel` VALUES ('10195', '1', '118');
INSERT INTO `rolefunmenurel` VALUES ('10196', '1', '124');
INSERT INTO `rolefunmenurel` VALUES ('10197', '1', '125');
INSERT INTO `rolefunmenurel` VALUES ('10198', '1', '119');
INSERT INTO `rolefunmenurel` VALUES ('10199', '1', '120');
INSERT INTO `rolefunmenurel` VALUES ('10200', '1', '192');
INSERT INTO `rolefunmenurel` VALUES ('10201', '1', '135');
INSERT INTO `rolefunmenurel` VALUES ('10202', '1', '136');
INSERT INTO `rolefunmenurel` VALUES ('10203', '1', '137');
INSERT INTO `rolefunmenurel` VALUES ('10204', '1', '140');
INSERT INTO `rolefunmenurel` VALUES ('10205', '1', '145');
INSERT INTO `rolefunmenurel` VALUES ('10206', '1', '146');
INSERT INTO `rolefunmenurel` VALUES ('10207', '1', '147');
INSERT INTO `rolefunmenurel` VALUES ('10208', '1', '148');
INSERT INTO `rolefunmenurel` VALUES ('10209', '1', '149');
INSERT INTO `rolefunmenurel` VALUES ('10210', '1', '150');
INSERT INTO `rolefunmenurel` VALUES ('10211', '1', '161');
INSERT INTO `rolefunmenurel` VALUES ('10212', '1', '162');
INSERT INTO `rolefunmenurel` VALUES ('10213', '1', '173');
INSERT INTO `rolefunmenurel` VALUES ('10214', '1', '154');
INSERT INTO `rolefunmenurel` VALUES ('10215', '1', '155');
INSERT INTO `rolefunmenurel` VALUES ('10216', '1', '158');
INSERT INTO `rolefunmenurel` VALUES ('10217', '1', '159');
INSERT INTO `rolefunmenurel` VALUES ('10218', '1', '160');
INSERT INTO `rolefunmenurel` VALUES ('10219', '1', '156');
INSERT INTO `rolefunmenurel` VALUES ('10220', '1', '157');
INSERT INTO `rolefunmenurel` VALUES ('10221', '1', '169');
INSERT INTO `rolefunmenurel` VALUES ('10222', '1', '170');
INSERT INTO `rolefunmenurel` VALUES ('10223', '1', '172');
INSERT INTO `rolefunmenurel` VALUES ('10224', '1', '190');
INSERT INTO `rolefunmenurel` VALUES ('10225', '1', '191');
INSERT INTO `rolefunmenurel` VALUES ('10226', '1', '139');
INSERT INTO `rolefunmenurel` VALUES ('10227', '27', '45');
INSERT INTO `rolefunmenurel` VALUES ('10228', '27', '46');
INSERT INTO `rolefunmenurel` VALUES ('10229', '27', '47');
INSERT INTO `rolefunmenurel` VALUES ('10230', '27', '48');
INSERT INTO `rolefunmenurel` VALUES ('10231', '27', '49');
INSERT INTO `rolefunmenurel` VALUES ('10232', '27', '50');
INSERT INTO `rolefunmenurel` VALUES ('10233', '27', '51');
INSERT INTO `rolefunmenurel` VALUES ('10234', '27', '52');
INSERT INTO `rolefunmenurel` VALUES ('10235', '27', '53');
INSERT INTO `rolefunmenurel` VALUES ('10236', '27', '54');
INSERT INTO `rolefunmenurel` VALUES ('10237', '27', '55');
INSERT INTO `rolefunmenurel` VALUES ('10238', '27', '56');
INSERT INTO `rolefunmenurel` VALUES ('10239', '27', '57');
INSERT INTO `rolefunmenurel` VALUES ('10240', '27', '58');
INSERT INTO `rolefunmenurel` VALUES ('10241', '27', '59');
INSERT INTO `rolefunmenurel` VALUES ('10242', '27', '60');
INSERT INTO `rolefunmenurel` VALUES ('10243', '27', '61');
INSERT INTO `rolefunmenurel` VALUES ('10244', '27', '62');
INSERT INTO `rolefunmenurel` VALUES ('10245', '27', '63');
INSERT INTO `rolefunmenurel` VALUES ('10246', '27', '64');
INSERT INTO `rolefunmenurel` VALUES ('10247', '27', '65');
INSERT INTO `rolefunmenurel` VALUES ('10248', '27', '66');
INSERT INTO `rolefunmenurel` VALUES ('10249', '27', '67');
INSERT INTO `rolefunmenurel` VALUES ('10250', '27', '68');
INSERT INTO `rolefunmenurel` VALUES ('10251', '27', '69');
INSERT INTO `rolefunmenurel` VALUES ('10252', '27', '70');
INSERT INTO `rolefunmenurel` VALUES ('10253', '27', '71');
INSERT INTO `rolefunmenurel` VALUES ('10254', '27', '72');
INSERT INTO `rolefunmenurel` VALUES ('10255', '27', '73');
INSERT INTO `rolefunmenurel` VALUES ('10256', '27', '74');
INSERT INTO `rolefunmenurel` VALUES ('10257', '27', '75');
INSERT INTO `rolefunmenurel` VALUES ('10258', '27', '76');
INSERT INTO `rolefunmenurel` VALUES ('10259', '27', '77');
INSERT INTO `rolefunmenurel` VALUES ('10260', '27', '78');
INSERT INTO `rolefunmenurel` VALUES ('10261', '27', '79');
INSERT INTO `rolefunmenurel` VALUES ('10262', '27', '109');
INSERT INTO `rolefunmenurel` VALUES ('10263', '27', '181');
INSERT INTO `rolefunmenurel` VALUES ('10264', '27', '182');
INSERT INTO `rolefunmenurel` VALUES ('10265', '27', '183');
INSERT INTO `rolefunmenurel` VALUES ('10266', '27', '184');
INSERT INTO `rolefunmenurel` VALUES ('10267', '27', '185');
INSERT INTO `rolefunmenurel` VALUES ('10268', '27', '186');
INSERT INTO `rolefunmenurel` VALUES ('10269', '27', '187');
INSERT INTO `rolefunmenurel` VALUES ('10270', '27', '188');
INSERT INTO `rolefunmenurel` VALUES ('10271', '27', '189');
INSERT INTO `rolefunmenurel` VALUES ('10272', '27', '193');
INSERT INTO `rolefunmenurel` VALUES ('10273', '27', '194');
INSERT INTO `rolefunmenurel` VALUES ('10274', '29', '23');
INSERT INTO `rolefunmenurel` VALUES ('10275', '29', '30');
INSERT INTO `rolefunmenurel` VALUES ('10276', '29', '32');
INSERT INTO `rolefunmenurel` VALUES ('10277', '29', '35');
INSERT INTO `rolefunmenurel` VALUES ('10278', '29', '36');
INSERT INTO `rolefunmenurel` VALUES ('10279', '29', '37');
INSERT INTO `rolefunmenurel` VALUES ('10280', '29', '38');
INSERT INTO `rolefunmenurel` VALUES ('10281', '29', '142');
INSERT INTO `rolefunmenurel` VALUES ('10282', '29', '153');
INSERT INTO `rolefunmenurel` VALUES ('10283', '29', '163');
INSERT INTO `rolefunmenurel` VALUES ('10284', '29', '164');
INSERT INTO `rolefunmenurel` VALUES ('10285', '29', '165');
INSERT INTO `rolefunmenurel` VALUES ('10286', '29', '166');
INSERT INTO `rolefunmenurel` VALUES ('10287', '29', '167');
INSERT INTO `rolefunmenurel` VALUES ('10288', '29', '168');
INSERT INTO `rolefunmenurel` VALUES ('10289', '29', '174');
INSERT INTO `rolefunmenurel` VALUES ('10290', '29', '176');
INSERT INTO `rolefunmenurel` VALUES ('10291', '29', '177');
INSERT INTO `rolefunmenurel` VALUES ('10292', '29', '178');
INSERT INTO `rolefunmenurel` VALUES ('10293', '29', '22');

-- ----------------------------
-- Table structure for `roleinfo`
-- ----------------------------
DROP TABLE IF EXISTS `roleinfo`;
CREATE TABLE `roleinfo` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(20) NOT NULL,
  `roleDesc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roleinfo
-- ----------------------------
INSERT INTO `roleinfo` VALUES ('1', '超级管理员', 'ok');
INSERT INTO `roleinfo` VALUES ('25', '运营管理', null);
INSERT INTO `roleinfo` VALUES ('26', '发行管理', null);
INSERT INTO `roleinfo` VALUES ('27', '日志管理', null);
INSERT INTO `roleinfo` VALUES ('29', '统计员', null);

-- ----------------------------
-- Table structure for `adminuser`
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) DEFAULT NULL,
  `adminName` varchar(20) NOT NULL,
  `adminPass` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  KEY `FK_Reference_4` (`roleId`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`roleId`) REFERENCES `roleinfo` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES ('1', '1', 'admin', '123456', 'zhangsan@qq.com');
INSERT INTO `adminuser` VALUES ('23', '25', 'yunying', '123', null);
INSERT INTO `adminuser` VALUES ('24', '26', 'faxing', '123', null);
INSERT INTO `adminuser` VALUES ('25', '27', 'rizhi', '123', null);
INSERT INTO `adminuser` VALUES ('26', '1', 'admin123', '123', null);

-- ----------------------------
-- Table structure for `functionmenu`
-- ----------------------------
DROP TABLE IF EXISTS `functionmenu`;
CREATE TABLE `functionmenu` (
  `funId` int(11) NOT NULL AUTO_INCREMENT,
  `funName` varchar(20) NOT NULL,
  `funUrl` varchar(100) DEFAULT NULL,
  `displayAsMenu` tinyint(1) DEFAULT NULL,
  `parentFunId` int(11) DEFAULT NULL,
  `funNumber` int(11) DEFAULT NULL COMMENT '菜单排序',
  PRIMARY KEY (`funId`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of functionmenu
-- ----------------------------
INSERT INTO `functionmenu` VALUES ('6', '组织管理', null, '1', null, null);
INSERT INTO `functionmenu` VALUES ('7', '员工管理', '/adminuser/list.do', '1', '6', null);
INSERT INTO `functionmenu` VALUES ('8', '新增员工', 'btnAddEmp', '1', '7', null);
INSERT INTO `functionmenu` VALUES ('9', '权限管理', null, '1', null, null);
INSERT INTO `functionmenu` VALUES ('15', '权限管理', '/jurisdiction/list.do', '1', '9', null);
INSERT INTO `functionmenu` VALUES ('17', '新增权限', 'btnAddDiction', '1', '15', null);
INSERT INTO `functionmenu` VALUES ('18', '修改权限', 'btnUpdateDiction', '1', '15', null);
INSERT INTO `functionmenu` VALUES ('19', '删除权限', 'btnDeleteDiction', '1', '15', null);
INSERT INTO `functionmenu` VALUES ('20', '修改员工', 'btnUpdateEmp', '1', '7', null);
INSERT INTO `functionmenu` VALUES ('21', '删除员工', 'btnDeleteEmp', '1', '7', null);
INSERT INTO `functionmenu` VALUES ('22', '日常统计数据总览', null, '1', null, null);
INSERT INTO `functionmenu` VALUES ('23', '全平台统计', '/SortCount/overview', '1', '22', null);
INSERT INTO `functionmenu` VALUES ('24', 'iOS平台统计', null, '1', '22', null);
INSERT INTO `functionmenu` VALUES ('25', 'Android平台统计', null, '1', '22', null);
INSERT INTO `functionmenu` VALUES ('26', '美国地区统计', null, '1', '22', null);
INSERT INTO `functionmenu` VALUES ('27', '香港地区统计', null, '1', '22', null);
INSERT INTO `functionmenu` VALUES ('28', '台湾地区统计', null, '1', '22', null);
INSERT INTO `functionmenu` VALUES ('29', '实时统计', null, '1', null, null);
INSERT INTO `functionmenu` VALUES ('30', '分类统计', null, '1', null, null);
INSERT INTO `functionmenu` VALUES ('31', '关键统计', null, '1', null, null);
INSERT INTO `functionmenu` VALUES ('32', '新增用户统计', '/SortCount/userRegister', '1', '30', '1');
INSERT INTO `functionmenu` VALUES ('33', '实时付费额度', '/SortCount/realtime_paymoney', '1', '29', null);
INSERT INTO `functionmenu` VALUES ('34', '实时在线用户数', '/SortCount/online_num', '1', '29', null);
INSERT INTO `functionmenu` VALUES ('35', '点付费率统计', '/SortCount/pointmoney', '1', '30', '7');
INSERT INTO `functionmenu` VALUES ('36', 'LTV', '/SortCount/ltvmoney', '1', '30', '5');
INSERT INTO `functionmenu` VALUES ('37', '用户留存统计', '/SortCount/retention', '1', '30', '4');
INSERT INTO `functionmenu` VALUES ('38', '付费排行统计', '/SortCount/payCountRanking', '1', '30', '3');
INSERT INTO `functionmenu` VALUES ('39', '产销统计(钻石)', '/SortCount/countDiamond', '1', '31', null);
INSERT INTO `functionmenu` VALUES ('40', '产销统计(材料)', '/SortCount/countMaterial', '1', '31', null);
INSERT INTO `functionmenu` VALUES ('41', '每日商品销售统计', '/SortCount/shoCount', '1', '31', null);
INSERT INTO `functionmenu` VALUES ('42', '每日战斗统计', '/SortCount/countBattlend', '1', '31', null);
INSERT INTO `functionmenu` VALUES ('43', '每日抽将统计', '/SortCount/recruitHero', '1', '31', null);
INSERT INTO `functionmenu` VALUES ('44', '每日任务统计', '/SortCount/stageStatistics', '1', '31', null);
INSERT INTO `functionmenu` VALUES ('45', '日志查询', null, '1', null, null);
INSERT INTO `functionmenu` VALUES ('46', '用户登录日志', '/journal/commonJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('47', '新增用户日志', '/journal/userReJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('48', '任务日志', '/journal/taskReJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('49', '道具日志', '/journal/itemJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('50', '资源日志', '/journal/resourseJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('51', '装备合成日志', '/journal/equipSynJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('52', '装备穿戴日志', '/journal/equipAddJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('53', '符文日志', '/journal/runeJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('54', '战斗结束日志', '/journal/battleendJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('55', '竞技场战斗消耗日志', '/journal/areaFightJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('56', '付费日志', '/journal/moneyPayJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('57', '商城日志', '/journal/shopJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('58', '神秘商城刷新日志', '/journal/mysteryShopInfoJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('59', '神秘商城购买日志', '/journal/mysteryShopBuyJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('60', '房间收集日志', '/journal/roomCollectJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('61', '房间升级日志', '/journal/roomLevelUpJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('62', '招募日志', '/journal/recruitJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('63', '招募武将日志', '/journal/recruitHeroJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('64', '招募道具日志', '/journal/recruitItemJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('65', '武将获得日志', '/journal/heroGetJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('66', '武将升阶日志', '/journal/heroLevelJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('67', '武将升级日志', '/journal/heroLevelUpJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('68', '武将觉醒日志', '/journal/heroWakeJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('69', '技能日志', '/journal/skillJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('70', '邮件收取日志', '/journal/emailReceiveJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('71', '邮件奖励日志', '/journal/emailRewardJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('72', '剧情副本日志', '/journal/plotJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('73', '好友日志', '/journal/friendJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('74', 'cdk日志', '/journal/cdkJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('75', '校验异常日志', '/journal/battleerrorJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('76', '联盟贡献日志', '/journal/devoteJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('77', '联盟升级日志', '/journal/allianceLvUpJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('78', '联盟boss日志', '/journal/allianceBossJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('79', '仓库分配日志', '/journal/depotAllocateJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('80', '角色管理', null, '1', null, null);
INSERT INTO `functionmenu` VALUES ('81', 'openID查询', '/rolesearch/openIDsearch', '1', '80', null);
INSERT INTO `functionmenu` VALUES ('83', '黑名单', '/rolesearch/black', '1', '80', null);
INSERT INTO `functionmenu` VALUES ('84', '封禁列表', '/rolesearch/userbanned', '1', '80', null);
INSERT INTO `functionmenu` VALUES ('85', '昵称查询', '/rolesearch/nicksearch', '1', '80', null);
INSERT INTO `functionmenu` VALUES ('86', '角色查询', '/rolesearch/rolesearch', '1', '80', null);
INSERT INTO `functionmenu` VALUES ('87', '武将查询', '/rolesearch/herosearch', '1', '80', null);
INSERT INTO `functionmenu` VALUES ('88', '符文查询', '/rolesearch/runesearch', '1', '80', null);
INSERT INTO `functionmenu` VALUES ('89', '道具查询', '/rolesearch/itemsearch', '1', '80', null);
INSERT INTO `functionmenu` VALUES ('90', '符文管理', '/rolesearch/runeManager', '1', '80', null);
INSERT INTO `functionmenu` VALUES ('91', 'uid修改', '/rolesearch/uidManager', '1', '80', null);
INSERT INTO `functionmenu` VALUES ('92', '联盟查询', '/rolesearch/alliSearch', '1', '80', null);
INSERT INTO `functionmenu` VALUES ('93', 'ugc', '/rolesearch/ugcManage', '1', '80', null);
INSERT INTO `functionmenu` VALUES ('94', '白名单', '/rolesearch/white', '1', '80', null);
INSERT INTO `functionmenu` VALUES ('95', '删除黑名单', 'btnDeleteBlack', '1', '83', null);
INSERT INTO `functionmenu` VALUES ('96', '新增黑名单', 'btnAddBlack', '1', '83', null);
INSERT INTO `functionmenu` VALUES ('97', '新增白名单', 'btnAddWhite', '1', '94', null);
INSERT INTO `functionmenu` VALUES ('98', '删除白名单', 'btnDeleteWhite', '1', '94', null);
INSERT INTO `functionmenu` VALUES ('99', '封禁用户', '/rolesearch/userBlock', '1', '80', null);
INSERT INTO `functionmenu` VALUES ('100', '解封用户', '/rolesearch/userUnBlock', '1', '80', null);
INSERT INTO `functionmenu` VALUES ('101', '添加资源', '/rolesearch/addResource', '1', '80', null);
INSERT INTO `functionmenu` VALUES ('102', '修改角色', 'btnUpdateRole', '1', '86', null);
INSERT INTO `functionmenu` VALUES ('103', '删除符文', 'btnDeleteRune', '1', '88', null);
INSERT INTO `functionmenu` VALUES ('104', '公告管理', null, '1', null, null);
INSERT INTO `functionmenu` VALUES ('105', '公告列表', '/notice/comNotice', '1', '104', null);
INSERT INTO `functionmenu` VALUES ('106', '删除公告', 'btnDeleteNotice', '1', '105', null);
INSERT INTO `functionmenu` VALUES ('107', '新增公告', 'btnAddNotice', '1', '105', null);
INSERT INTO `functionmenu` VALUES ('108', '预约公告', 'btnPublishNotice', '1', '105', null);
INSERT INTO `functionmenu` VALUES ('109', '房间合成日志', '/journal/roomMixJournal', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('110', '修改武将信息', 'btnUpdateHero', '1', '87', null);
INSERT INTO `functionmenu` VALUES ('111', '删除武将信息', 'btnDeleteHero', '1', '87', null);
INSERT INTO `functionmenu` VALUES ('112', '修改道具信息', 'btnUpdateItem', '1', '89', null);
INSERT INTO `functionmenu` VALUES ('113', '删除道具信息', 'btnDeleteItem', '1', '89', null);
INSERT INTO `functionmenu` VALUES ('114', '修改符文信息', 'btnUpdateRune', '1', '90', null);
INSERT INTO `functionmenu` VALUES ('115', '服务器', null, '1', null, null);
INSERT INTO `functionmenu` VALUES ('116', '服务器列表', '/gameServer/gameServer', '1', '115', null);
INSERT INTO `functionmenu` VALUES ('117', ' 防火墙', '/gameServer/fireServer', '1', '115', null);
INSERT INTO `functionmenu` VALUES ('118', '功能开关', '/gameServer/function', '1', '115', null);
INSERT INTO `functionmenu` VALUES ('119', 'redis清缓存', '/gameServer/redis', '1', '115', null);
INSERT INTO `functionmenu` VALUES ('120', 'ugc全清档', '/gameServer/ugc', '1', '115', null);
INSERT INTO `functionmenu` VALUES ('121', '新增服', 'btnAddSer', '1', '116', null);
INSERT INTO `functionmenu` VALUES ('122', '编辑服', 'btnUpdateSer', '1', '116', null);
INSERT INTO `functionmenu` VALUES ('123', '删除服', 'btnDeleteSer', '1', '116', null);
INSERT INTO `functionmenu` VALUES ('124', '开启', 'btnOpenF', '1', '118', null);
INSERT INTO `functionmenu` VALUES ('125', '关闭', 'btnCloseF', '1', '118', null);
INSERT INTO `functionmenu` VALUES ('135', 'cdk活动', '/Cdk/cdkList', '1', '139', null);
INSERT INTO `functionmenu` VALUES ('136', '删除', 'btnDeleteCdk', '1', '135', null);
INSERT INTO `functionmenu` VALUES ('137', '导出CVS', 'btnExport', '1', '135', null);
INSERT INTO `functionmenu` VALUES ('139', '活动管理', '/SortCount/realtim', '1', null, null);
INSERT INTO `functionmenu` VALUES ('140', '新增', 'btnAddCdk', '1', '135', null);
INSERT INTO `functionmenu` VALUES ('141', '实时新增用户', '/SortCount/realtimeRegister', '1', '29', null);
INSERT INTO `functionmenu` VALUES ('142', '活跃用户统计', '/SortCount/userActive', '1', '30', '2');
INSERT INTO `functionmenu` VALUES ('143', '上架商品列表', '/shop/onList', '1', '139', null);
INSERT INTO `functionmenu` VALUES ('144', '预约商品列表', '/shop/preList', '1', '139', null);
INSERT INTO `functionmenu` VALUES ('145', '商城商品列表', '/shop/offList', '1', '139', null);
INSERT INTO `functionmenu` VALUES ('146', '下架', 'btnAdd', '1', '145', null);
INSERT INTO `functionmenu` VALUES ('147', '编辑', 'btnUpdateoff', '1', '145', null);
INSERT INTO `functionmenu` VALUES ('148', '删除', 'btnDeleteoff', '1', '145', null);
INSERT INTO `functionmenu` VALUES ('149', '推送服务器', 'btnViewo', '1', '145', null);
INSERT INTO `functionmenu` VALUES ('150', '添加', 'btnAddShop', '1', '145', null);
INSERT INTO `functionmenu` VALUES ('153', '滞留等级分布统计', '/SortCount/retention_level', '1', '30', '11');
INSERT INTO `functionmenu` VALUES ('154', '邮件相关', null, '1', null, null);
INSERT INTO `functionmenu` VALUES ('155', '邮件列表', '/email/email', '1', '154', null);
INSERT INTO `functionmenu` VALUES ('156', '邮件发送', '/email/emailSend', '1', '154', null);
INSERT INTO `functionmenu` VALUES ('157', '邮件活动发送', '/email/emailallSend', '1', '154', null);
INSERT INTO `functionmenu` VALUES ('158', '重发', 'btnAddEmail', '1', '155', null);
INSERT INTO `functionmenu` VALUES ('159', '删除', 'btnDeleteEmail', '1', '155', null);
INSERT INTO `functionmenu` VALUES ('160', '详情', null, '1', '155', null);
INSERT INTO `functionmenu` VALUES ('161', '全局buff', '/balance/buffList', '1', '139', null);
INSERT INTO `functionmenu` VALUES ('162', '删除', 'btnUpdateBuff', '1', '161', null);
INSERT INTO `functionmenu` VALUES ('163', '服活跃用户统计', '/SortCount/userServerActive', '1', '30', '12');
INSERT INTO `functionmenu` VALUES ('164', '服LTV', '/SortCount/ltvServermoney', '1', '30', '13');
INSERT INTO `functionmenu` VALUES ('165', '服用户留存统计', '/SortCount/retentionServer', '1', '30', '14');
INSERT INTO `functionmenu` VALUES ('166', '服新增用户统计', '/SortCount/userRegisterServer', '1', '30', '15');
INSERT INTO `functionmenu` VALUES ('167', '服点付费率统计', '/SortCount/pointmoneyServer', '1', '30', '16');
INSERT INTO `functionmenu` VALUES ('168', '服付费统计', '/SortCount/payCountDayServer', '1', '30', '17');
INSERT INTO `functionmenu` VALUES ('169', '精彩活动', null, '1', null, null);
INSERT INTO `functionmenu` VALUES ('170', '普通精彩活动', '/activity/activityList', '1', '169', null);
INSERT INTO `functionmenu` VALUES ('171', '批量改状态', 'btnUpdateSta', '1', '116', null);
INSERT INTO `functionmenu` VALUES ('172', '普通精彩活动已推送列表', '/activity/havePush', '1', '169', null);
INSERT INTO `functionmenu` VALUES ('173', '商品已推送列表', '/shop/havePush', '1', '139', null);
INSERT INTO `functionmenu` VALUES ('174', '付费统计', '/SortCount/payCountDay', '1', '30', '6');
INSERT INTO `functionmenu` VALUES ('176', '新手礼包统计', '/SortCount/newUserGuideGift', '1', '30', '8');
INSERT INTO `functionmenu` VALUES ('177', '新手剧情通关统计', '/SortCount/newUserSplot', '1', '30', '9');
INSERT INTO `functionmenu` VALUES ('178', '客户端通用统计', '/SortCount/clientCommonCount', '1', '30', '10');
INSERT INTO `functionmenu` VALUES ('181', '小服竞技场战斗日志', '/journal/smallArenaBattleLog', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('182', '小服竞技场购买日志', '/journal/smallArenaBuyLog', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('183', '小服竞技场排行日志', '/journal/smallArenaMaxRankLog', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('184', '小服竞技场扫荡日志', '/journal/smallArenaSweepLog', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('185', '小服竞技场晋升日志', '/journal/smallArenaPromoteLog', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('186', '小服竞技场点赞日志', '/journal/smallArenaDoLikeLog', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('187', '联盟战日志', '/journal/allianceWarLog', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('188', '联盟战排行日志', '/journal/allianceWarRankLog', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('189', '联盟战个人战斗日志', '/journal/allianceFightLog', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('190', '特殊精彩活动', '/activity/theGodOfWealthBettingActivityList', '1', '169', null);
INSERT INTO `functionmenu` VALUES ('191', '特殊精彩活动已推送列表', '/activity/limithavePush', '1', '169', null);
INSERT INTO `functionmenu` VALUES ('192', '支付渠道开关', '/gameServer/payfunctionSwitch', '1', '115', null);
INSERT INTO `functionmenu` VALUES ('193', '财神活动日志', '/journal/betGodActivityLog', '1', '45', null);
INSERT INTO `functionmenu` VALUES ('194', '收据日志', '/journal/voucherLogList', '1', '45', null);