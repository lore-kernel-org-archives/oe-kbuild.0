Content-Type: multipart/mixed; boundary="===============2691251530120103942=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] UPSTREAM: media: ov8856: skip OTP read in non-zero ACPI D state
Date: Fri, 13 May 2022 11:48:58 +0800
Message-ID: <202205131109.giBGpLnO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2691251530120103942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220510151241.12435-1-jimmy.su@intel.com>
References: <20220510151241.12435-1-jimmy.su@intel.com>
TO: Jimmy Su <jimmy.su@intel.com>
TO: linux-media(a)vger.kernel.org
CC: sakari.ailus(a)linux.intel.com
CC: andy.yeh(a)intel.com
CC: jimmy.su(a)intel.com
CC: yhuang(a)ovt.com
CC: akeem.chen(a)ovt.com

Hi Jimmy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18-rc6 next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jimmy-Su/UPSTREAM-me=
dia-ov8856-skip-OTP-read-in-non-zero-ACPI-D-state/20220510-232606
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: nios2-randconfig-m031-20220512 (https://download.01.org/0day-ci/arc=
hive/20220513/202205131109.giBGpLnO-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/i2c/ov8856.c:1715 ov8856_identify_module() warn: maybe use &&=
 instead of &

vim +1715 drivers/media/i2c/ov8856.c

879347f0c258cf Ben Kao    2019-01-15  1693  =

0e014f1a8d546f Bingbu Cao 2021-12-15  1694  static int ov8856_identify_modu=
le(struct ov8856 *ov8856)
0e014f1a8d546f Bingbu Cao 2021-12-15  1695  {
0e014f1a8d546f Bingbu Cao 2021-12-15  1696  	struct i2c_client *client =3D =
v4l2_get_subdevdata(&ov8856->sd);
0e014f1a8d546f Bingbu Cao 2021-12-15  1697  	int ret;
25bf233398211c Jimmy Su   2022-05-10  1698  	u32 val, width;
0e014f1a8d546f Bingbu Cao 2021-12-15  1699  =

0e014f1a8d546f Bingbu Cao 2021-12-15  1700  	if (ov8856->identified)
0e014f1a8d546f Bingbu Cao 2021-12-15  1701  		return 0;
0e014f1a8d546f Bingbu Cao 2021-12-15  1702  =

0e014f1a8d546f Bingbu Cao 2021-12-15  1703  	ret =3D ov8856_read_reg(ov8856=
, OV8856_REG_CHIP_ID,
0e014f1a8d546f Bingbu Cao 2021-12-15  1704  			      OV8856_REG_VALUE_24BIT=
, &val);
0e014f1a8d546f Bingbu Cao 2021-12-15  1705  	if (ret)
0e014f1a8d546f Bingbu Cao 2021-12-15  1706  		return ret;
0e014f1a8d546f Bingbu Cao 2021-12-15  1707  =

0e014f1a8d546f Bingbu Cao 2021-12-15  1708  	if (val !=3D OV8856_CHIP_ID) {
0e014f1a8d546f Bingbu Cao 2021-12-15  1709  		dev_err(&client->dev, "chip i=
d mismatch: %x!=3D%x",
0e014f1a8d546f Bingbu Cao 2021-12-15  1710  			OV8856_CHIP_ID, val);
0e014f1a8d546f Bingbu Cao 2021-12-15  1711  		return -ENXIO;
0e014f1a8d546f Bingbu Cao 2021-12-15  1712  	}
0e014f1a8d546f Bingbu Cao 2021-12-15  1713  =

25bf233398211c Jimmy Su   2022-05-10  1714  	width =3D ov8856->cur_mode->wi=
dth;
25bf233398211c Jimmy Su   2022-05-10 @1715  	if (ov8856->acpi_skip_otp & ((=
width =3D=3D 3280) | (width =3D=3D 1640)))
25bf233398211c Jimmy Su   2022-05-10  1716  		goto otp_skip;
25bf233398211c Jimmy Su   2022-05-10  1717  =

0e014f1a8d546f Bingbu Cao 2021-12-15  1718  	ret =3D ov8856_write_reg(ov885=
6, OV8856_REG_MODE_SELECT,
0e014f1a8d546f Bingbu Cao 2021-12-15  1719  			       OV8856_REG_VALUE_08BI=
T, OV8856_MODE_STREAMING);
0e014f1a8d546f Bingbu Cao 2021-12-15  1720  	if (ret)
0e014f1a8d546f Bingbu Cao 2021-12-15  1721  		return ret;
0e014f1a8d546f Bingbu Cao 2021-12-15  1722  =

0e014f1a8d546f Bingbu Cao 2021-12-15  1723  	ret =3D ov8856_write_reg(ov885=
6, OV8856_OTP_MODE_CTRL,
0e014f1a8d546f Bingbu Cao 2021-12-15  1724  			       OV8856_REG_VALUE_08BI=
T, OV8856_OTP_MODE_AUTO);
0e014f1a8d546f Bingbu Cao 2021-12-15  1725  	if (ret) {
0e014f1a8d546f Bingbu Cao 2021-12-15  1726  		dev_err(&client->dev, "failed=
 to set otp mode");
0e014f1a8d546f Bingbu Cao 2021-12-15  1727  		return ret;
0e014f1a8d546f Bingbu Cao 2021-12-15  1728  	}
0e014f1a8d546f Bingbu Cao 2021-12-15  1729  =

0e014f1a8d546f Bingbu Cao 2021-12-15  1730  	ret =3D ov8856_write_reg(ov885=
6, OV8856_OTP_LOAD_CTRL,
0e014f1a8d546f Bingbu Cao 2021-12-15  1731  			       OV8856_REG_VALUE_08BI=
T,
0e014f1a8d546f Bingbu Cao 2021-12-15  1732  			       OV8856_OTP_LOAD_CTRL_=
ENABLE);
0e014f1a8d546f Bingbu Cao 2021-12-15  1733  	if (ret) {
0e014f1a8d546f Bingbu Cao 2021-12-15  1734  		dev_err(&client->dev, "failed=
 to enable load control");
0e014f1a8d546f Bingbu Cao 2021-12-15  1735  		return ret;
0e014f1a8d546f Bingbu Cao 2021-12-15  1736  	}
0e014f1a8d546f Bingbu Cao 2021-12-15  1737  =

0e014f1a8d546f Bingbu Cao 2021-12-15  1738  	ret =3D ov8856_read_reg(ov8856=
, OV8856_MODULE_REVISION,
0e014f1a8d546f Bingbu Cao 2021-12-15  1739  			      OV8856_REG_VALUE_08BIT=
, &val);
0e014f1a8d546f Bingbu Cao 2021-12-15  1740  	if (ret) {
0e014f1a8d546f Bingbu Cao 2021-12-15  1741  		dev_err(&client->dev, "failed=
 to read module revision");
0e014f1a8d546f Bingbu Cao 2021-12-15  1742  		return ret;
0e014f1a8d546f Bingbu Cao 2021-12-15  1743  	}
0e014f1a8d546f Bingbu Cao 2021-12-15  1744  =

0e014f1a8d546f Bingbu Cao 2021-12-15  1745  	dev_info(&client->dev, "OV8856=
 revision %x (%s) at address 0x%02x\n",
0e014f1a8d546f Bingbu Cao 2021-12-15  1746  		 val,
0e014f1a8d546f Bingbu Cao 2021-12-15  1747  		 val =3D=3D OV8856_2A_MODULE =
? "2A" :
0e014f1a8d546f Bingbu Cao 2021-12-15  1748  		 val =3D=3D OV8856_1B_MODULE =
? "1B" : "unknown revision",
0e014f1a8d546f Bingbu Cao 2021-12-15  1749  		 client->addr);
0e014f1a8d546f Bingbu Cao 2021-12-15  1750  =

0e014f1a8d546f Bingbu Cao 2021-12-15  1751  	ret =3D ov8856_write_reg(ov885=
6, OV8856_REG_MODE_SELECT,
0e014f1a8d546f Bingbu Cao 2021-12-15  1752  			       OV8856_REG_VALUE_08BI=
T, OV8856_MODE_STANDBY);
0e014f1a8d546f Bingbu Cao 2021-12-15  1753  	if (ret) {
0e014f1a8d546f Bingbu Cao 2021-12-15  1754  		dev_err(&client->dev, "failed=
 to exit streaming mode");
0e014f1a8d546f Bingbu Cao 2021-12-15  1755  		return ret;
0e014f1a8d546f Bingbu Cao 2021-12-15  1756  	}
0e014f1a8d546f Bingbu Cao 2021-12-15  1757  =

0e014f1a8d546f Bingbu Cao 2021-12-15  1758  	ov8856->identified =3D true;
0e014f1a8d546f Bingbu Cao 2021-12-15  1759  =

25bf233398211c Jimmy Su   2022-05-10  1760  	return 0;
25bf233398211c Jimmy Su   2022-05-10  1761  =

25bf233398211c Jimmy Su   2022-05-10  1762  otp_skip:
25bf233398211c Jimmy Su   2022-05-10  1763  	ov8856->identified =3D true;
25bf233398211c Jimmy Su   2022-05-10  1764  =

0e014f1a8d546f Bingbu Cao 2021-12-15  1765  	return 0;
0e014f1a8d546f Bingbu Cao 2021-12-15  1766  }
0e014f1a8d546f Bingbu Cao 2021-12-15  1767  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2691251530120103942==--

