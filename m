Content-Type: multipart/mixed; boundary="===============1497063437214066089=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [xlnx:xlnx_rebase_v5.4 67/1297] drivers/misc/xilinx_flex_pm.c:356:22: error: 'struct xflex_dev_info' has no member named 'lock'
Date: Tue, 12 May 2020 17:11:07 +0800
Message-ID: <202005121704.uwWz90pB%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1497063437214066089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.4
head:   22b71b41620dac13c69267d2b7898ebfb14c954e
commit: dca3c6831fc7bdc1e021e7608da3a0becd20cd25 [67/1297] misc: xilinx_fle=
x: Add support for the flex noc Performance Monitor
config: um-allmodconfig (attached as .config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        git checkout dca3c6831fc7bdc1e021e7608da3a0becd20cd25
        # save the attached .config to linux build tree
        make ARCH=3Dum =

:::::: branch date: 4 hours ago
:::::: commit date: 4 weeks ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

Note: the xlnx/xlnx_rebase_v5.4 HEAD 22b71b41620dac13c69267d2b7898ebfb14c95=
4e builds fine.
      It only hurts bisectibility.

All errors (new ones prefixed by >>):

drivers/misc/xilinx_flex_pm.c: In function 'xflex_sysfs_cmd':
>> drivers/misc/xilinx_flex_pm.c:356:22: error: 'struct xflex_dev_info' has=
 no member named 'lock'
mutex_unlock(&flexpm->lock);
^~
In file included from include/linux/kernfs.h:12:0,
from include/linux/sysfs.h:16,
from include/linux/kobject.h:20,
from include/linux/device.h:16,
from include/linux/firmware/xlnx-zynqmp.h:16,
from drivers/misc/xilinx_flex_pm.c:7:
drivers/misc/xilinx_flex_pm.c: In function 'xflex_probe':
drivers/misc/xilinx_flex_pm.c:604:20: error: 'struct xflex_dev_info' has no=
 member named 'lock'
mutex_init(&flexpm->lock);
^
include/linux/mutex.h:108:16: note: in definition of macro 'mutex_init'
__mutex_init((mutex), #mutex, &__key);                       ^~~~~

# https://github.com/Xilinx/linux-xlnx/commit/dca3c6831fc7bdc1e021e7608da3a=
0becd20cd25
git remote add xlnx https://github.com/Xilinx/linux-xlnx
git remote update xlnx
git checkout dca3c6831fc7bdc1e021e7608da3a0becd20cd25
vim +356 drivers/misc/xilinx_flex_pm.c

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  151  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  152  /**
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  153   * xflex_sysfs_cmd - Imp=
lements sysfs operations
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  154   * @dev: Device structure
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  155   * @buf: Value to write
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  156   * @cmd: sysfs cmd
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  157   *
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  158   * Return: value read fr=
om the sysfs cmd on success and negative error code
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  159   *		otherwise.
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  160   */
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  161  static int xflex_sysfs_c=
md(struct device *dev, const char *buf,
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  162  			   enum xflex_sysfs_c=
md_codes cmd)
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  163  {
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  164  	struct xflex_dev_info *=
flexpm =3D to_xflex_dev_info(dev);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  165  	u32 domain, src, offset=
, reg, val, counter;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  166  	int ret;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  167  	const struct zynqmp_eem=
i_ops *eemi_ops =3D zynqmp_pm_get_eemi_ops();
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  168  	u32 rdval =3D 0;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  169  	u32 pm_api_ret[4] =3D {=
0, 0, 0, 0};
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  170  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  171  	if (IS_ERR_OR_NULL(eemi=
_ops))
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  172  		return PTR_ERR(eemi_op=
s);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  173  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  174  	if (!eemi_ops->ioctl)
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  175  		return -ENOTSUPP;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  176  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  177  	switch (cmd) {
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  178  	case XFLEX_GET_COUNTER_=
LPD_WRRSP:
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  179  		reg =3D flexpm->counte=
rid_lpd | FPM_WRRSP_L | FPM_VAL;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  180  		ret =3D eemi_ops->ioct=
l(FPM_LPD, IOCTL_PROBE_COUNTER_READ,
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  181  				      reg, 0, &pm_ap=
i_ret[0]);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  182  		if (ret < 0) {
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  183  			dev_err(dev, "Counter=
 read error %d\n", ret);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  184  			goto exit_unlock;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  185  		}
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  186  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  187  		rdval =3D pm_api_ret[1=
];
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  188  		break;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  189  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  190  	case XFLEX_GET_COUNTER_=
LPD_WRREQ:
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  191  		reg =3D flexpm->counte=
rid_lpd | FPM_WRREQ_L | FPM_VAL;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  192  		ret =3D eemi_ops->ioct=
l(FPM_LPD, IOCTL_PROBE_COUNTER_READ,
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  193  				      reg, 0, &pm_ap=
i_ret[0]);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  194  		if (ret < 0) {
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  195  			dev_err(dev, "Counter=
 read error %d\n", ret);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  196  			goto exit_unlock;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  197  		}
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  198  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  199  		rdval =3D pm_api_ret[1=
];
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  200  		break;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  201  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  202  	case XFLEX_GET_COUNTER_=
LPD_RDRSP:
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  203  		reg =3D flexpm->counte=
rid_lpd | FPM_RDRSP_L | FPM_VAL;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  204  		ret =3D eemi_ops->ioct=
l(FPM_LPD, IOCTL_PROBE_COUNTER_READ,
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  205  				      reg, 0, &pm_ap=
i_ret[0]);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  206  		if (ret < 0) {
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  207  			dev_err(dev, "Counter=
 read error %d\n", ret);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  208  			goto exit_unlock;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  209  		}
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  210  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  211  		rdval =3D pm_api_ret[1=
];
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  212  		break;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  213  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  214  	case XFLEX_GET_COUNTER_=
LPD_RDREQ:
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  215  		reg =3D flexpm->counte=
rid_lpd | FPM_RDREQ_L | FPM_VAL;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  216  		ret =3D eemi_ops->ioct=
l(FPM_LPD, IOCTL_PROBE_COUNTER_READ,
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  217  				      reg, 0, &pm_ap=
i_ret[0]);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  218  		if (ret < 0) {
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  219  			dev_err(dev, "Counter=
 read error %d\n", ret);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  220  			goto exit_unlock;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  221  		}
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  222  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  223  		rdval =3D pm_api_ret[1=
];
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  224  		break;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  225  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  226  	case XFLEX_SET_COUNTER_=
LPD:
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  227  		ret =3D kstrtou32(buf,=
 0, &val);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  228  		if (ret < 0)
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  229  			goto exit_unlock;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  230  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  231  		flexpm->counterid_lpd =
=3D val;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  232  		reset_default(dev, val=
, FPM_LPD);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  233  		break;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  234  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  235  	case XFLEX_SET_PORT_COU=
NTER_FPD:
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  236  		ret =3D kstrtou32(buf,=
 0, &val);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  237  		if (ret < 0)
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  238  			goto exit_unlock;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  239  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  240  		counter =3D flexpm->co=
unterid_fpd * FPM_COUNTER_OFFSET;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  241  		offset =3D FPM_PORT_SE=
L_OFFSET + counter * FPM_COUNTER_OFFSET;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  242  		fpm_reg(flexpm->basefp=
d, val, offset);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  243  		break;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  244  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  245  	case XFLEX_SET_PORT_COU=
NTER_LPD:
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  246  		ret =3D kstrtou32(buf,=
 0, &val);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  247  		if (ret < 0)
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  248  			goto exit_unlock;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  249  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  250  		counter =3D flexpm->co=
unterid_lpd * FPM_COUNTER_OFFSET;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  251  		offset =3D FPM_PORT_SE=
L_OFFSET + counter * FPM_COUNTER_OFFSET;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  252  		fpm_reg(flexpm->baselp=
d, val, offset);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  253  		break;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  254  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  255  	case XFLEX_SET_SRC_COUN=
TER_LPD:
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  256  		reg =3D flexpm->counte=
rid_lpd;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  257  		domain =3D FPM_LPD;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  258  		ret =3D kstrtou32(buf,=
 0, &val);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  259  		if (ret < 0)
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  260  			goto exit_unlock;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  261  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  262  		for (src =3D 0; src < =
FPM_NUM_COUNTERS; src++) {
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  263  			reg =3D reg | FPM_SRC=
 | (src << FPM_PROBE_SHIFT);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  264  			ret =3D eemi_ops->ioc=
tl(domain, IOCTL_PROBE_COUNTER_WRITE,
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  265  					      reg, val, NUL=
L);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  266  			if (ret < 0) {
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  267  				dev_err(dev, "Counte=
r write error %d\n", ret);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  268  				goto exit_unlock;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  269  			}
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  270  		}
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  271  		break;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  272  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  273  	case XFLEX_SET_SRC_COUN=
TER_FPD:
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  274  		reg =3D flexpm->counte=
rid_fpd;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  275  		domain =3D FPM_FPD;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  276  		ret =3D kstrtou32(buf,=
 0, &val);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  277  		if (ret < 0)
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  278  			goto exit_unlock;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  279  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  280  		for (src =3D 0; src < =
FPM_NUM_COUNTERS; src++) {
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  281  			reg =3D reg | FPM_SRC=
 | (src << FPM_PROBE_SHIFT);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  282  			ret =3D eemi_ops->ioc=
tl(domain, IOCTL_PROBE_COUNTER_WRITE,
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  283  					      reg, val, NUL=
L);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  284  			if (ret < 0) {
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  285  				dev_err(dev, "Counte=
r write error %d\n", ret);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  286  				goto exit_unlock;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  287  			}
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  288  		}
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  289  		break;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  290  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  291  	case XFLEX_SET_COUNTER_=
FPD:
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  292  		ret =3D kstrtou32(buf,=
 0, &val);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  293  		if (ret < 0)
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  294  			goto exit_unlock;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  295  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  296  		flexpm->counterid_fpd =
=3D val;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  297  		reset_default(dev, val=
, FPM_FPD);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  298  		break;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  299  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  300  	case XFLEX_GET_COUNTER_=
FPD_WRRSP:
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  301  		reg =3D flexpm->counte=
rid_fpd | FPM_WRRSP_L | FPM_VAL;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  302  		ret =3D eemi_ops->ioct=
l(FPM_FPD, IOCTL_PROBE_COUNTER_READ,
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  303  				      reg, 0, &pm_ap=
i_ret[0]);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  304  		if (ret < 0) {
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  305  			dev_err(dev, "Counter=
 read error %d\n", ret);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  306  			goto exit_unlock;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  307  		}
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  308  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  309  		rdval =3D pm_api_ret[1=
];
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  310  		break;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  311  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  312  	case XFLEX_GET_COUNTER_=
FPD_WRREQ:
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  313  		reg =3D flexpm->counte=
rid_fpd | FPM_WRREQ_L | FPM_VAL;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  314  		ret =3D eemi_ops->ioct=
l(FPM_FPD, IOCTL_PROBE_COUNTER_READ,
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  315  				      reg, 0, &pm_ap=
i_ret[0]);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  316  		if (ret < 0) {
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  317  			dev_err(dev, "Counter=
 read error %d\n", ret);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  318  			goto exit_unlock;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  319  		}
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  320  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  321  		rdval =3D pm_api_ret[1=
];
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  322  		break;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  323  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  324  	case XFLEX_GET_COUNTER_=
FPD_RDRSP:
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  325  		reg =3D flexpm->counte=
rid_fpd | FPM_RDRSP_L | FPM_VAL;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  326  		ret =3D eemi_ops->ioct=
l(FPM_FPD, IOCTL_PROBE_COUNTER_READ,
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  327  				      reg, 0, &pm_ap=
i_ret[0]);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  328  		if (ret < 0) {
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  329  			dev_err(dev, "Counter=
 read error %d\n", ret);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  330  			goto exit_unlock;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  331  		}
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  332  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  333  		rdval =3D pm_api_ret[1=
];
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  334  		break;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  335  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  336  	case XFLEX_GET_COUNTER_=
FPD_RDREQ:
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  337  		reg =3D flexpm->counte=
rid_fpd | FPM_RDREQ_L | FPM_VAL;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  338  		ret =3D eemi_ops->ioct=
l(FPM_FPD, IOCTL_PROBE_COUNTER_READ,
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  339  				      reg, 0, &pm_ap=
i_ret[0]);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  340  		if (ret < 0) {
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  341  			dev_err(dev, "Counter=
 read error %d\n", ret);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  342  			goto exit_unlock;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  343  		}
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  344  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  345  		rdval =3D pm_api_ret[1=
];
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  346  		break;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  347  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  348  	default:
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  349  		dev_err(dev, "Invalid =
option\n");
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  350  		break;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  351  	}
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  352  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  353  	return rdval;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  354  =

dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  355  exit_unlock:
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03 @356  	mutex_unlock(&flexpm->l=
ock);
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  357  	return ret;
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  358  }
dca3c6831fc7bd Shubhrajyoti Datta 2019-12-03  359  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1497063437214066089==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1497063437214066089==--

