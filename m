Content-Type: multipart/mixed; boundary="===============8425259107303611151=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.4 17/44] drivers/media/i2c/ov13858.c:1786:30: warning: Uninitialized variable: mi_id_offs [uninitvar]
Date: Wed, 11 Aug 2021 21:58:58 +0800
Message-ID: <202108112148.MNwJzf2h-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8425259107303611151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.4
head:   0276965d27c25c68b87c278475c86e205f01f615
commit: 999b23a714d6e5fe1db8d6a33f17cafd636ae65c [17/44] CHROMIUM: media: o=
v13858: Expose vendor ID in sysfs
:::::: branch date: 32 hours ago
:::::: commit date: 2 days ago
compiler: h8300-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/i2c/ov13858.c:1786:30: warning: Uninitialized variable: mi=
_id_offs [uninitvar]
             OV13858_OTP_SRAM + mi_id_offs,
                                ^

vim +1786 drivers/media/i2c/ov13858.c

5fcf092e0c9fb4 Hyungwoo Yang 2017-06-13  1704  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1705  static int ov13858_read_otp(=
struct ov13858 *ov13858)
999b23a714d6e5 Tomasz Figa   2017-11-02  1706  {
999b23a714d6e5 Tomasz Figa   2017-11-02  1707  	struct i2c_client *client =
=3D v4l2_get_subdevdata(&ov13858->sd);
999b23a714d6e5 Tomasz Figa   2017-11-02  1708  	u32 otp_mode_ctrl, isp_ctrl=
_0, flag_basic;
999b23a714d6e5 Tomasz Figa   2017-11-02  1709  	unsigned int mi_id_offs;
999b23a714d6e5 Tomasz Figa   2017-11-02  1710  	int ret =3D 0;
999b23a714d6e5 Tomasz Figa   2017-11-02  1711  	int i;
999b23a714d6e5 Tomasz Figa   2017-11-02  1712  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1713  	mutex_lock(&ov13858->mutex);
999b23a714d6e5 Tomasz Figa   2017-11-02  1714  	if (ov13858->otp_read)
999b23a714d6e5 Tomasz Figa   2017-11-02  1715  		goto out_unlock;
999b23a714d6e5 Tomasz Figa   2017-11-02  1716  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1717  	ret =3D pm_runtime_get_sync=
(&client->dev);
999b23a714d6e5 Tomasz Figa   2017-11-02  1718  	if (ret < 0) {
999b23a714d6e5 Tomasz Figa   2017-11-02  1719  		pm_runtime_put_noidle(&cli=
ent->dev);
999b23a714d6e5 Tomasz Figa   2017-11-02  1720  		goto out_unlock;
999b23a714d6e5 Tomasz Figa   2017-11-02  1721  	}
999b23a714d6e5 Tomasz Figa   2017-11-02  1722  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1723  	if (!ov13858->streaming) {
999b23a714d6e5 Tomasz Figa   2017-11-02  1724  		ret =3D ov13858_start_stre=
aming(ov13858);
999b23a714d6e5 Tomasz Figa   2017-11-02  1725  		if (ret)
999b23a714d6e5 Tomasz Figa   2017-11-02  1726  			goto out_runtime_put;
999b23a714d6e5 Tomasz Figa   2017-11-02  1727  	}
999b23a714d6e5 Tomasz Figa   2017-11-02  1728  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1729  	ret =3D ov13858_read_reg(ov=
13858,
999b23a714d6e5 Tomasz Figa   2017-11-02  1730  			       OV13858_REG_ISP_CT=
RL_0,
999b23a714d6e5 Tomasz Figa   2017-11-02  1731  			       OV13858_REG_VALUE_=
08BIT, &isp_ctrl_0);
999b23a714d6e5 Tomasz Figa   2017-11-02  1732  	if (ret)
999b23a714d6e5 Tomasz Figa   2017-11-02  1733  		goto out_standby;
999b23a714d6e5 Tomasz Figa   2017-11-02  1734  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1735  	ret =3D ov13858_write_reg(o=
v13858,
999b23a714d6e5 Tomasz Figa   2017-11-02  1736  				OV13858_REG_ISP_CTRL_0,
999b23a714d6e5 Tomasz Figa   2017-11-02  1737  				OV13858_REG_VALUE_08BIT,
999b23a714d6e5 Tomasz Figa   2017-11-02  1738  				isp_ctrl_0 & ~OV13858_IS=
P_OTP_ENABLE);
999b23a714d6e5 Tomasz Figa   2017-11-02  1739  	if (ret)
999b23a714d6e5 Tomasz Figa   2017-11-02  1740  		goto out_standby;
999b23a714d6e5 Tomasz Figa   2017-11-02  1741  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1742  	ret =3D ov13858_read_reg(ov=
13858,
999b23a714d6e5 Tomasz Figa   2017-11-02  1743  			       OV13858_REG_OTP_MO=
DE_CTRL,
999b23a714d6e5 Tomasz Figa   2017-11-02  1744  			       OV13858_REG_VALUE_=
08BIT, &otp_mode_ctrl);
999b23a714d6e5 Tomasz Figa   2017-11-02  1745  	if (ret)
999b23a714d6e5 Tomasz Figa   2017-11-02  1746  		goto out_isp_otp_enable;
999b23a714d6e5 Tomasz Figa   2017-11-02  1747  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1748  	otp_mode_ctrl |=3D OV13858_=
OTP_PROGRAM_DISABLE;
999b23a714d6e5 Tomasz Figa   2017-11-02  1749  	otp_mode_ctrl &=3D ~OV13858=
_OTP_MANUAL_MODE;
999b23a714d6e5 Tomasz Figa   2017-11-02  1750  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1751  	ret =3D ov13858_write_reg(o=
v13858,
999b23a714d6e5 Tomasz Figa   2017-11-02  1752  				OV13858_REG_OTP_MODE_CTR=
L,
999b23a714d6e5 Tomasz Figa   2017-11-02  1753  				OV13858_REG_VALUE_08BIT,=
 otp_mode_ctrl);
999b23a714d6e5 Tomasz Figa   2017-11-02  1754  	if (ret)
999b23a714d6e5 Tomasz Figa   2017-11-02  1755  		goto out_isp_otp_enable;
999b23a714d6e5 Tomasz Figa   2017-11-02  1756  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1757  	ret =3D ov13858_write_reg(o=
v13858,
999b23a714d6e5 Tomasz Figa   2017-11-02  1758  				OV13858_REG_OTP_LOAD_CTR=
L,
999b23a714d6e5 Tomasz Figa   2017-11-02  1759  				OV13858_REG_VALUE_08BIT,
999b23a714d6e5 Tomasz Figa   2017-11-02  1760  				OV13858_OTP_LOAD_ENABLE);
999b23a714d6e5 Tomasz Figa   2017-11-02  1761  	if (ret)
999b23a714d6e5 Tomasz Figa   2017-11-02  1762  		goto out_isp_otp_enable;
999b23a714d6e5 Tomasz Figa   2017-11-02  1763  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1764  	usleep_range(10000, 11000);
999b23a714d6e5 Tomasz Figa   2017-11-02  1765  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1766  	ret =3D ov13858_read_reg(ov=
13858,
999b23a714d6e5 Tomasz Figa   2017-11-02  1767  			       OV13858_OTP_SRAM +=
 OV13858_FLAG_BASIC_OFFSET,
999b23a714d6e5 Tomasz Figa   2017-11-02  1768  			       OV13858_REG_VALUE_=
08BIT, &flag_basic);
999b23a714d6e5 Tomasz Figa   2017-11-02  1769  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1770  	for (i =3D 0; i < OV13858_N=
UM_OTP_GROUP; ++i) {
999b23a714d6e5 Tomasz Figa   2017-11-02  1771  		u8 flag;
999b23a714d6e5 Tomasz Figa   2017-11-02  1772  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1773  		flag =3D (flag_basic >> OV=
13858_OTP_GROUP_FLAG_SHIFT(i))
999b23a714d6e5 Tomasz Figa   2017-11-02  1774  					& OV13858_OTP_GROUP_FLA=
G_MASK;
999b23a714d6e5 Tomasz Figa   2017-11-02  1775  		if (flag =3D=3D OV13858_OT=
P_GROUP_FLAG_VALID) {
999b23a714d6e5 Tomasz Figa   2017-11-02  1776  			mi_id_offs =3D OV13858_OT=
P_MI_ID_OFFSET(i);
999b23a714d6e5 Tomasz Figa   2017-11-02  1777  			break;
999b23a714d6e5 Tomasz Figa   2017-11-02  1778  		}
999b23a714d6e5 Tomasz Figa   2017-11-02  1779  	}
999b23a714d6e5 Tomasz Figa   2017-11-02  1780  	if (i =3D=3D OV13858_NUM_OT=
P_GROUP) {
999b23a714d6e5 Tomasz Figa   2017-11-02  1781  		ret =3D -EFAULT;
999b23a714d6e5 Tomasz Figa   2017-11-02  1782  		goto out_isp_otp_enable;
999b23a714d6e5 Tomasz Figa   2017-11-02  1783  	}
999b23a714d6e5 Tomasz Figa   2017-11-02  1784  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1785  	ret =3D ov13858_read_reg(ov=
13858,
999b23a714d6e5 Tomasz Figa   2017-11-02 @1786  			       OV13858_OTP_SRAM +=
 mi_id_offs,
999b23a714d6e5 Tomasz Figa   2017-11-02  1787  			       OV13858_REG_VALUE_=
08BIT, &ov13858->vendor_id);
999b23a714d6e5 Tomasz Figa   2017-11-02  1788  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1789  out_isp_otp_enable:
999b23a714d6e5 Tomasz Figa   2017-11-02  1790  	ov13858_write_reg(ov13858,
999b23a714d6e5 Tomasz Figa   2017-11-02  1791  			  OV13858_REG_ISP_CTRL_0,
999b23a714d6e5 Tomasz Figa   2017-11-02  1792  			  OV13858_REG_VALUE_08BIT,
999b23a714d6e5 Tomasz Figa   2017-11-02  1793  			  isp_ctrl_0);
999b23a714d6e5 Tomasz Figa   2017-11-02  1794  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1795  out_standby:
999b23a714d6e5 Tomasz Figa   2017-11-02  1796  	if (!ov13858->streaming)
999b23a714d6e5 Tomasz Figa   2017-11-02  1797  		ov13858_stop_streaming(ov1=
3858);
999b23a714d6e5 Tomasz Figa   2017-11-02  1798  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1799  out_runtime_put:
999b23a714d6e5 Tomasz Figa   2017-11-02  1800  	pm_runtime_put(&client->dev=
);
999b23a714d6e5 Tomasz Figa   2017-11-02  1801  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1802  out_unlock:
999b23a714d6e5 Tomasz Figa   2017-11-02  1803  	if (!ret)
999b23a714d6e5 Tomasz Figa   2017-11-02  1804  		ov13858->otp_read =3D true;
999b23a714d6e5 Tomasz Figa   2017-11-02  1805  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1806  	mutex_unlock(&ov13858->mute=
x);
999b23a714d6e5 Tomasz Figa   2017-11-02  1807  =

999b23a714d6e5 Tomasz Figa   2017-11-02  1808  	return ret;
999b23a714d6e5 Tomasz Figa   2017-11-02  1809  }
999b23a714d6e5 Tomasz Figa   2017-11-02  1810  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8425259107303611151==--

