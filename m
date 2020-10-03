Content-Type: multipart/mixed; boundary="===============5253473996454142096=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/huawei/hinic/hinic_ethtool.c:463:26: warning: Undefined behavior: Variable 'set_link_str' is used as parameter and destination in
Date: Sat, 03 Oct 2020 17:11:28 +0800
Message-ID: <202010031726.z6bnXFoC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5253473996454142096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Luo bin <luobin9@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d3d45f8220d60a0b2aaaacf8fb2be4e6ffd9008e
commit: 01f2b3dac8c4bebeb0ec15c4b7b59993766493cc hinic: add link_ksettings =
ethtool_ops support
date:   5 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +/set_link_str +463 drivers/net/ethernet/huawei/hinic/hinic_ethtool.c

01f2b3dac8c4beb Luo bin 2020-05-11  441  =

01f2b3dac8c4beb Luo bin 2020-05-11  442  static int hinic_set_settings_to_h=
w(struct hinic_dev *nic_dev,
01f2b3dac8c4beb Luo bin 2020-05-11  443  				    u32 set_settings, u8 auton=
eg, u32 speed)
01f2b3dac8c4beb Luo bin 2020-05-11  444  {
01f2b3dac8c4beb Luo bin 2020-05-11  445  	struct hinic_link_ksettings_info =
settings =3D {0};
01f2b3dac8c4beb Luo bin 2020-05-11  446  	char set_link_str[SET_LINK_STR_MA=
X_LEN] =3D {0};
01f2b3dac8c4beb Luo bin 2020-05-11  447  	struct net_device *netdev =3D nic=
_dev->netdev;
01f2b3dac8c4beb Luo bin 2020-05-11  448  	enum nic_speed_level speed_level =
=3D 0;
01f2b3dac8c4beb Luo bin 2020-05-11  449  	int err;
01f2b3dac8c4beb Luo bin 2020-05-11  450  =

01f2b3dac8c4beb Luo bin 2020-05-11  451  	err =3D snprintf(set_link_str, SE=
T_LINK_STR_MAX_LEN, "%s",
01f2b3dac8c4beb Luo bin 2020-05-11  452  		       (set_settings & HILINK_LI=
NK_SET_AUTONEG) ?
01f2b3dac8c4beb Luo bin 2020-05-11  453  		       (autoneg ? "autong enable=
 " : "autong disable ") : "");
01f2b3dac8c4beb Luo bin 2020-05-11  454  	if (err < 0 || err >=3D SET_LINK_=
STR_MAX_LEN) {
01f2b3dac8c4beb Luo bin 2020-05-11  455  		netif_err(nic_dev, drv, netdev, =
"Failed to snprintf link state, function return(%d) and dest_len(%d)\n",
01f2b3dac8c4beb Luo bin 2020-05-11  456  			  err, SET_LINK_STR_MAX_LEN);
01f2b3dac8c4beb Luo bin 2020-05-11  457  		return -EFAULT;
01f2b3dac8c4beb Luo bin 2020-05-11  458  	}
01f2b3dac8c4beb Luo bin 2020-05-11  459  =

01f2b3dac8c4beb Luo bin 2020-05-11  460  	if (set_settings & HILINK_LINK_SE=
T_SPEED) {
01f2b3dac8c4beb Luo bin 2020-05-11  461  		speed_level =3D hinic_ethtool_to=
_hw_speed_level(speed);
01f2b3dac8c4beb Luo bin 2020-05-11  462  		err =3D snprintf(set_link_str, S=
ET_LINK_STR_MAX_LEN,
01f2b3dac8c4beb Luo bin 2020-05-11 @463  			       "%sspeed %d ", set_link_=
str, speed);
01f2b3dac8c4beb Luo bin 2020-05-11  464  		if (err <=3D 0 || err >=3D SET_L=
INK_STR_MAX_LEN) {
01f2b3dac8c4beb Luo bin 2020-05-11  465  			netif_err(nic_dev, drv, netdev,=
 "Failed to snprintf link speed, function return(%d) and dest_len(%d)\n",
01f2b3dac8c4beb Luo bin 2020-05-11  466  				  err, SET_LINK_STR_MAX_LEN);
01f2b3dac8c4beb Luo bin 2020-05-11  467  			return -EFAULT;
01f2b3dac8c4beb Luo bin 2020-05-11  468  		}
01f2b3dac8c4beb Luo bin 2020-05-11  469  	}
01f2b3dac8c4beb Luo bin 2020-05-11  470  =

01f2b3dac8c4beb Luo bin 2020-05-11  471  	settings.func_id =3D HINIC_HWIF_F=
UNC_IDX(nic_dev->hwdev->hwif);
01f2b3dac8c4beb Luo bin 2020-05-11  472  	settings.valid_bitmap =3D set_set=
tings;
01f2b3dac8c4beb Luo bin 2020-05-11  473  	settings.autoneg =3D autoneg;
01f2b3dac8c4beb Luo bin 2020-05-11  474  	settings.speed =3D speed_level;
01f2b3dac8c4beb Luo bin 2020-05-11  475  =

01f2b3dac8c4beb Luo bin 2020-05-11  476  	err =3D hinic_set_link_settings(n=
ic_dev->hwdev, &settings);
01f2b3dac8c4beb Luo bin 2020-05-11  477  	if (err !=3D HINIC_MGMT_CMD_UNSUP=
PORTED) {
01f2b3dac8c4beb Luo bin 2020-05-11  478  		if (err)
01f2b3dac8c4beb Luo bin 2020-05-11  479  			netif_err(nic_dev, drv, netdev,=
 "Set %s failed\n",
01f2b3dac8c4beb Luo bin 2020-05-11  480  				  set_link_str);
01f2b3dac8c4beb Luo bin 2020-05-11  481  		else
01f2b3dac8c4beb Luo bin 2020-05-11  482  			netif_info(nic_dev, drv, netdev=
, "Set %s successfully\n",
01f2b3dac8c4beb Luo bin 2020-05-11  483  				   set_link_str);
01f2b3dac8c4beb Luo bin 2020-05-11  484  =

01f2b3dac8c4beb Luo bin 2020-05-11  485  		return err;
01f2b3dac8c4beb Luo bin 2020-05-11  486  	}
01f2b3dac8c4beb Luo bin 2020-05-11  487  =

01f2b3dac8c4beb Luo bin 2020-05-11  488  	return set_link_settings_separate=
_cmd(nic_dev, set_settings, autoneg,
01f2b3dac8c4beb Luo bin 2020-05-11  489  					      speed);
01f2b3dac8c4beb Luo bin 2020-05-11  490  }
01f2b3dac8c4beb Luo bin 2020-05-11  491  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5253473996454142096==--

