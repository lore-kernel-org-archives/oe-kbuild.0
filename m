Content-Type: multipart/mixed; boundary="===============1560613102758528356=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/soundwire/cadence_master.c:1379:0: warning: Same expression used in consecutive assignments of 'target_num' and 'source_num'. [duplicateAssignExpression]
Date: Tue, 01 Feb 2022 03:03:42 +0800
Message-ID: <202202010259.w2oyudqm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1560613102758528356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Rander Wang <rander.wang@intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: dd81e7c3f0bb4fbe48b770b389ab6ccb95058dab soundwire: cadence: overri=
de PDI configurations to create loopback
date:   6 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 6 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/soundwire/cadence_master.c:1379:0: warning: Same expression used=
 in consecutive assignments of 'target_num' and 'source_num'. [duplicateAss=
ignExpression]
    int target_num =3D p_params->num;
   ^
   drivers/soundwire/cadence_master.c:1380:0: note: Same expression used in=
 consecutive assignments of 'target_num' and 'source_num'.
    int source_num =3D p_params->num;
   ^
   drivers/soundwire/cadence_master.c:1379:0: note: Same expression used in=
 consecutive assignments of 'target_num' and 'source_num'.
    int target_num =3D p_params->num;
   ^
>> drivers/soundwire/cadence_master.c:1429:0: warning: Same expression used=
 in consecutive assignments of 'source_num' and 'target_num'. [duplicateAss=
ignExpression]
    int source_num =3D t_params->port_num;
   ^
   drivers/soundwire/cadence_master.c:1430:0: note: Same expression used in=
 consecutive assignments of 'source_num' and 'target_num'.
    int target_num =3D t_params->port_num;
   ^
   drivers/soundwire/cadence_master.c:1429:0: note: Same expression used in=
 consecutive assignments of 'source_num' and 'target_num'.
    int source_num =3D t_params->port_num;
   ^

vim +1379 drivers/soundwire/cadence_master.c

07abeff1ef1ae8 Vinod Koul           2018-04-26  1372  =

07abeff1ef1ae8 Vinod Koul           2018-04-26  1373  static int cdns_port_=
params(struct sdw_bus *bus,
07abeff1ef1ae8 Vinod Koul           2018-04-26  1374  			    struct sdw_por=
t_params *p_params, unsigned int bank)
07abeff1ef1ae8 Vinod Koul           2018-04-26  1375  {
07abeff1ef1ae8 Vinod Koul           2018-04-26  1376  	struct sdw_cdns *cdn=
s =3D bus_to_cdns(bus);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1377  	int dpn_config_off_s=
ource;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1378  	int dpn_config_off_t=
arget;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14 @1379  	int target_num =3D p=
_params->num;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1380  	int source_num =3D p=
_params->num;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1381  	bool override =3D fa=
lse;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1382  	int dpn_config;
07abeff1ef1ae8 Vinod Koul           2018-04-26  1383  =

dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1384  	if (target_num =3D=
=3D cdns->pdi_loopback_target &&
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1385  	    cdns->pdi_loopba=
ck_source !=3D -1) {
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1386  		source_num =3D cdns=
->pdi_loopback_source;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1387  		override =3D true;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1388  	}
07abeff1ef1ae8 Vinod Koul           2018-04-26  1389  =

dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1390  	if (bank) {
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1391  		dpn_config_off_sour=
ce =3D CDNS_DPN_B1_CONFIG(source_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1392  		dpn_config_off_targ=
et =3D CDNS_DPN_B1_CONFIG(target_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1393  	} else {
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1394  		dpn_config_off_sour=
ce =3D CDNS_DPN_B0_CONFIG(source_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1395  		dpn_config_off_targ=
et =3D CDNS_DPN_B0_CONFIG(target_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1396  	}
07abeff1ef1ae8 Vinod Koul           2018-04-26  1397  =

dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1398  	dpn_config =3D cdns_=
readl(cdns, dpn_config_off_source);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1399  =

dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1400  	/* use port params i=
f there is no loopback, otherwise use source as is */
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1401  	if (!override) {
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1402  		u32p_replace_bits(&=
dpn_config, p_params->bps - 1, CDNS_DPN_CONFIG_WL);
714db045cf30f7 Vinod Koul           2020-09-17  1403  		u32p_replace_bits(&=
dpn_config, p_params->flow_mode, CDNS_DPN_CONFIG_PORT_FLOW);
714db045cf30f7 Vinod Koul           2020-09-17  1404  		u32p_replace_bits(&=
dpn_config, p_params->data_mode, CDNS_DPN_CONFIG_PORT_DAT);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1405  	}
07abeff1ef1ae8 Vinod Koul           2018-04-26  1406  =

dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1407  	cdns_writel(cdns, dp=
n_config_off_target, dpn_config);
07abeff1ef1ae8 Vinod Koul           2018-04-26  1408  =

07abeff1ef1ae8 Vinod Koul           2018-04-26  1409  	return 0;
07abeff1ef1ae8 Vinod Koul           2018-04-26  1410  }
07abeff1ef1ae8 Vinod Koul           2018-04-26  1411  =

07abeff1ef1ae8 Vinod Koul           2018-04-26  1412  static int cdns_trans=
port_params(struct sdw_bus *bus,
07abeff1ef1ae8 Vinod Koul           2018-04-26  1413  				 struct sdw_trans=
port_params *t_params,
07abeff1ef1ae8 Vinod Koul           2018-04-26  1414  				 enum sdw_reg_ban=
k bank)
07abeff1ef1ae8 Vinod Koul           2018-04-26  1415  {
07abeff1ef1ae8 Vinod Koul           2018-04-26  1416  	struct sdw_cdns *cdn=
s =3D bus_to_cdns(bus);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1417  	int dpn_config;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1418  	int dpn_config_off_s=
ource;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1419  	int dpn_config_off_t=
arget;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1420  	int dpn_hctrl;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1421  	int dpn_hctrl_off_so=
urce;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1422  	int dpn_hctrl_off_ta=
rget;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1423  	int dpn_offsetctrl;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1424  	int dpn_offsetctrl_o=
ff_source;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1425  	int dpn_offsetctrl_o=
ff_target;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1426  	int dpn_samplectrl;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1427  	int dpn_samplectrl_o=
ff_source;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1428  	int dpn_samplectrl_o=
ff_target;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14 @1429  	int source_num =3D t=
_params->port_num;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1430  	int target_num =3D t=
_params->port_num;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1431  	bool override =3D fa=
lse;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1432  =

dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1433  	if (target_num =3D=
=3D cdns->pdi_loopback_target &&
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1434  	    cdns->pdi_loopba=
ck_source !=3D -1) {
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1435  		source_num =3D cdns=
->pdi_loopback_source;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1436  		override =3D true;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1437  	}
07abeff1ef1ae8 Vinod Koul           2018-04-26  1438  =

07abeff1ef1ae8 Vinod Koul           2018-04-26  1439  	/*
07abeff1ef1ae8 Vinod Koul           2018-04-26  1440  	 * Note: Only full d=
ata port is supported on the Master side for
07abeff1ef1ae8 Vinod Koul           2018-04-26  1441  	 * both PCM and PDM =
ports.
07abeff1ef1ae8 Vinod Koul           2018-04-26  1442  	 */
07abeff1ef1ae8 Vinod Koul           2018-04-26  1443  =

07abeff1ef1ae8 Vinod Koul           2018-04-26  1444  	if (bank) {
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1445  		dpn_config_off_sour=
ce =3D CDNS_DPN_B1_CONFIG(source_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1446  		dpn_hctrl_off_sourc=
e =3D CDNS_DPN_B1_HCTRL(source_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1447  		dpn_offsetctrl_off_=
source =3D CDNS_DPN_B1_OFFSET_CTRL(source_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1448  		dpn_samplectrl_off_=
source =3D CDNS_DPN_B1_SAMPLE_CTRL(source_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1449  =

dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1450  		dpn_config_off_targ=
et =3D CDNS_DPN_B1_CONFIG(target_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1451  		dpn_hctrl_off_targe=
t =3D CDNS_DPN_B1_HCTRL(target_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1452  		dpn_offsetctrl_off_=
target =3D CDNS_DPN_B1_OFFSET_CTRL(target_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1453  		dpn_samplectrl_off_=
target =3D CDNS_DPN_B1_SAMPLE_CTRL(target_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1454  =

07abeff1ef1ae8 Vinod Koul           2018-04-26  1455  	} else {
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1456  		dpn_config_off_sour=
ce =3D CDNS_DPN_B0_CONFIG(source_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1457  		dpn_hctrl_off_sourc=
e =3D CDNS_DPN_B0_HCTRL(source_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1458  		dpn_offsetctrl_off_=
source =3D CDNS_DPN_B0_OFFSET_CTRL(source_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1459  		dpn_samplectrl_off_=
source =3D CDNS_DPN_B0_SAMPLE_CTRL(source_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1460  =

dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1461  		dpn_config_off_targ=
et =3D CDNS_DPN_B0_CONFIG(target_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1462  		dpn_hctrl_off_targe=
t =3D CDNS_DPN_B0_HCTRL(target_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1463  		dpn_offsetctrl_off_=
target =3D CDNS_DPN_B0_OFFSET_CTRL(target_num);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1464  		dpn_samplectrl_off_=
target =3D CDNS_DPN_B0_SAMPLE_CTRL(target_num);
07abeff1ef1ae8 Vinod Koul           2018-04-26  1465  	}
07abeff1ef1ae8 Vinod Koul           2018-04-26  1466  =

dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1467  	dpn_config =3D cdns_=
readl(cdns, dpn_config_off_source);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1468  	if (!override) {
714db045cf30f7 Vinod Koul           2020-09-17  1469  		u32p_replace_bits(&=
dpn_config, t_params->blk_grp_ctrl, CDNS_DPN_CONFIG_BGC);
714db045cf30f7 Vinod Koul           2020-09-17  1470  		u32p_replace_bits(&=
dpn_config, t_params->blk_pkg_mode, CDNS_DPN_CONFIG_BPM);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1471  	}
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1472  	cdns_writel(cdns, dp=
n_config_off_target, dpn_config);
07abeff1ef1ae8 Vinod Koul           2018-04-26  1473  =

dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1474  	if (!override) {
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1475  		dpn_offsetctrl =3D =
0;
714db045cf30f7 Vinod Koul           2020-09-17  1476  		u32p_replace_bits(&=
dpn_offsetctrl, t_params->offset1, CDNS_DPN_OFFSET_CTRL_1);
714db045cf30f7 Vinod Koul           2020-09-17  1477  		u32p_replace_bits(&=
dpn_offsetctrl, t_params->offset2, CDNS_DPN_OFFSET_CTRL_2);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1478  	} else {
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1479  		dpn_offsetctrl =3D =
cdns_readl(cdns, dpn_offsetctrl_off_source);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1480  	}
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1481  	cdns_writel(cdns, dp=
n_offsetctrl_off_target,  dpn_offsetctrl);
07abeff1ef1ae8 Vinod Koul           2018-04-26  1482  =

dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1483  	if (!override) {
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1484  		dpn_hctrl =3D 0;
714db045cf30f7 Vinod Koul           2020-09-17  1485  		u32p_replace_bits(&=
dpn_hctrl, t_params->hstart, CDNS_DPN_HCTRL_HSTART);
714db045cf30f7 Vinod Koul           2020-09-17  1486  		u32p_replace_bits(&=
dpn_hctrl, t_params->hstop, CDNS_DPN_HCTRL_HSTOP);
714db045cf30f7 Vinod Koul           2020-09-17  1487  		u32p_replace_bits(&=
dpn_hctrl, t_params->lane_ctrl, CDNS_DPN_HCTRL_LCTRL);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1488  	} else {
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1489  		dpn_hctrl =3D cdns_=
readl(cdns, dpn_hctrl_off_source);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1490  	}
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1491  	cdns_writel(cdns, dp=
n_hctrl_off_target, dpn_hctrl);
07abeff1ef1ae8 Vinod Koul           2018-04-26  1492  =

dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1493  	if (!override)
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1494  		dpn_samplectrl =3D =
t_params->sample_interval - 1;
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1495  	else
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1496  		dpn_samplectrl =3D =
cdns_readl(cdns, dpn_samplectrl_off_source);
dd81e7c3f0bb4f Pierre-Louis Bossart 2021-07-14  1497  	cdns_writel(cdns, dp=
n_samplectrl_off_target, dpn_samplectrl);
07abeff1ef1ae8 Vinod Koul           2018-04-26  1498  =

07abeff1ef1ae8 Vinod Koul           2018-04-26  1499  	return 0;
07abeff1ef1ae8 Vinod Koul           2018-04-26  1500  }
07abeff1ef1ae8 Vinod Koul           2018-04-26  1501  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1560613102758528356==--

