Content-Type: multipart/mixed; boundary="===============5632727311956966720=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [linux-arm:cex7 97/97] drivers/net/phy/qsfp.c:653 qsfp_hwmon_read_str() error: buffer overflow 'qsfp_hwmon_curr_labels' 4 <= 4
Date: Wed, 05 Feb 2020 13:36:53 +0300
Message-ID: <20200205103652.GA24804@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5632727311956966720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.armlinux.org.uk/~rmk/linux-arm cex7
head:   2f8726526ed0fd189f8a945c06f8b9850777a5ca
commit: 2f8726526ed0fd189f8a945c06f8b9850777a5ca [97/97] net: add qsfp supp=
ort                              [*experimental*]

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/phy/qsfp.c:653 qsfp_hwmon_read_str() error: buffer overflow 'qs=
fp_hwmon_curr_labels' 4 <=3D 4
drivers/net/phy/qsfp.c:659 qsfp_hwmon_read_str() error: buffer overflow 'qs=
fp_hwmon_power_labels' 8 <=3D 8
drivers/net/phy/qsfp.c:1229 qsfp_sm_mod_present() warn: curly braces intend=
ed?
drivers/net/phy/qsfp.c:1299 qsfp_sm_power_up() warn: impossible condition '=
(qsfp->module_power_class >=3D 8) =3D> (0-1 >=3D 8)'

Old smatch warnings:
drivers/net/phy/qsfp.c:1097 qsfp_sm_mod_print() warn: format string contain=
s non-ascii character '\xc2'
drivers/net/phy/qsfp.c:1097 qsfp_sm_mod_print() warn: format string contain=
s non-ascii character '\xb5'
drivers/net/phy/qsfp.c:1100 qsfp_sm_mod_print() warn: format string contain=
s non-ascii character '\xc2'
drivers/net/phy/qsfp.c:1100 qsfp_sm_mod_print() warn: format string contain=
s non-ascii character '\xb5'
drivers/net/phy/qsfp.c:1103 qsfp_sm_mod_print() warn: format string contain=
s non-ascii character '\xc2'
drivers/net/phy/qsfp.c:1103 qsfp_sm_mod_print() warn: format string contain=
s non-ascii character '\xb5'
drivers/net/phy/qsfp.c:1106 qsfp_sm_mod_print() warn: format string contain=
s non-ascii character '\xc2'
drivers/net/phy/qsfp.c:1106 qsfp_sm_mod_print() warn: format string contain=
s non-ascii character '\xb5'
drivers/net/phy/qsfp.c:1109 qsfp_sm_mod_print() warn: format string contain=
s non-ascii character '\xc2'
drivers/net/phy/qsfp.c:1109 qsfp_sm_mod_print() warn: format string contain=
s non-ascii character '\xb5'

git remote add linux-arm git://git.armlinux.org.uk/~rmk/linux-arm
git remote update linux-arm
git checkout 2f8726526ed0fd189f8a945c06f8b9850777a5ca
vim +/qsfp_hwmon_curr_labels +653 drivers/net/phy/qsfp.c

2f8726526ed0fd Russell King 2019-10-04  644  =

2f8726526ed0fd Russell King 2019-10-04  645  static int qsfp_hwmon_read_str=
(struct device *dev, enum hwmon_sensor_types type,
2f8726526ed0fd Russell King 2019-10-04  646  			       u32 attr, int channe=
l, const char **str)
2f8726526ed0fd Russell King 2019-10-04  647  {
2f8726526ed0fd Russell King 2019-10-04  648  	switch (type) {
2f8726526ed0fd Russell King 2019-10-04  649  	case hwmon_curr:
2f8726526ed0fd Russell King 2019-10-04  650  		if (attr !=3D hwmon_curr_lab=
el || channel < 0 ||
2f8726526ed0fd Russell King 2019-10-04  651  		    channel > ARRAY_SIZE(qsf=
p_hwmon_curr_labels))
                                                                    ^
Off by one

2f8726526ed0fd Russell King 2019-10-04  652  			break;
2f8726526ed0fd Russell King 2019-10-04 @653  		*str =3D qsfp_hwmon_curr_lab=
els[channel];
2f8726526ed0fd Russell King 2019-10-04  654  		return 0;
2f8726526ed0fd Russell King 2019-10-04  655  	case hwmon_power:
2f8726526ed0fd Russell King 2019-10-04  656  		if (attr !=3D hwmon_power_la=
bel || channel < 0 ||
2f8726526ed0fd Russell King 2019-10-04  657  		    channel > ARRAY_SIZE(qsf=
p_hwmon_power_labels))
                                                                    ^

2f8726526ed0fd Russell King 2019-10-04  658  			break;
2f8726526ed0fd Russell King 2019-10-04 @659  		*str =3D qsfp_hwmon_power_la=
bels[channel];
2f8726526ed0fd Russell King 2019-10-04  660  		return 0;
2f8726526ed0fd Russell King 2019-10-04  661  	default:
2f8726526ed0fd Russell King 2019-10-04  662  		break;
2f8726526ed0fd Russell King 2019-10-04  663  	}
2f8726526ed0fd Russell King 2019-10-04  664  	return -EOPNOTSUPP;
2f8726526ed0fd Russell King 2019-10-04  665  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============5632727311956966720==--

