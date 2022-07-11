Content-Type: multipart/mixed; boundary="===============2498845465126563735=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5859/8914] drivers/devfreq/mtk-cci-devfreq.c:135 mtk_ccifreq_target() warn: variable dereferenced before check 'drv' (see line 130)
Date: Mon, 11 Jul 2022 09:31:53 +0800
Message-ID: <202207110939.SC3SbyPy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2498845465126563735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Johnson Wang <johnson.wang@mediatek.com>
CC: Chanwoo Choi <cw00.choi@samsung.com>
CC: "Jia-Wei Chang" <jia-wei.chang@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f2528c29385819a84480cacef4886b049761e2c5
commit: b615b00c42da1ea59aefbd6c98b08b1afabb9d1e [5859/8914] PM / devfreq: =
mediatek: Introduce MediaTek CCI devfreq driver
:::::: branch date: 3 days ago
:::::: commit date: 11 days ago
config: microblaze-randconfig-m031-20220706 (https://download.01.org/0day-c=
i/archive/20220711/202207110939.SC3SbyPy-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/devfreq/mtk-cci-devfreq.c:135 mtk_ccifreq_target() warn: variable d=
ereferenced before check 'drv' (see line 130)

vim +/drv +135 drivers/devfreq/mtk-cci-devfreq.c

b615b00c42da1e Johnson Wang 2022-06-07  125  =

b615b00c42da1e Johnson Wang 2022-06-07  126  static int mtk_ccifreq_target(=
struct device *dev, unsigned long *freq,
b615b00c42da1e Johnson Wang 2022-06-07  127  			      u32 flags)
b615b00c42da1e Johnson Wang 2022-06-07  128  {
b615b00c42da1e Johnson Wang 2022-06-07  129  	struct mtk_ccifreq_drv *drv =
=3D dev_get_drvdata(dev);
b615b00c42da1e Johnson Wang 2022-06-07 @130  	struct clk *cci_pll =3D clk_g=
et_parent(drv->cci_clk);
b615b00c42da1e Johnson Wang 2022-06-07  131  	struct dev_pm_opp *opp;
b615b00c42da1e Johnson Wang 2022-06-07  132  	unsigned long opp_rate;
b615b00c42da1e Johnson Wang 2022-06-07  133  	int voltage, pre_voltage, int=
er_voltage, target_voltage, ret;
b615b00c42da1e Johnson Wang 2022-06-07  134  =

b615b00c42da1e Johnson Wang 2022-06-07 @135  	if (!drv)
b615b00c42da1e Johnson Wang 2022-06-07  136  		return -EINVAL;
b615b00c42da1e Johnson Wang 2022-06-07  137  =

b615b00c42da1e Johnson Wang 2022-06-07  138  	if (drv->pre_freq =3D=3D *fre=
q)
b615b00c42da1e Johnson Wang 2022-06-07  139  		return 0;
b615b00c42da1e Johnson Wang 2022-06-07  140  =

b615b00c42da1e Johnson Wang 2022-06-07  141  	inter_voltage =3D drv->inter_=
voltage;
b615b00c42da1e Johnson Wang 2022-06-07  142  =

b615b00c42da1e Johnson Wang 2022-06-07  143  	opp_rate =3D *freq;
b615b00c42da1e Johnson Wang 2022-06-07  144  	opp =3D devfreq_recommended_o=
pp(dev, &opp_rate, 1);
b615b00c42da1e Johnson Wang 2022-06-07  145  	if (IS_ERR(opp)) {
b615b00c42da1e Johnson Wang 2022-06-07  146  		dev_err(dev, "failed to find=
 opp for freq: %ld\n", opp_rate);
b615b00c42da1e Johnson Wang 2022-06-07  147  		return PTR_ERR(opp);
b615b00c42da1e Johnson Wang 2022-06-07  148  	}
b615b00c42da1e Johnson Wang 2022-06-07  149  =

b615b00c42da1e Johnson Wang 2022-06-07  150  	mutex_lock(&drv->reg_lock);
b615b00c42da1e Johnson Wang 2022-06-07  151  =

b615b00c42da1e Johnson Wang 2022-06-07  152  	voltage =3D dev_pm_opp_get_vo=
ltage(opp);
b615b00c42da1e Johnson Wang 2022-06-07  153  	dev_pm_opp_put(opp);
b615b00c42da1e Johnson Wang 2022-06-07  154  =

b615b00c42da1e Johnson Wang 2022-06-07  155  	pre_voltage =3D regulator_get=
_voltage(drv->proc_reg);
b615b00c42da1e Johnson Wang 2022-06-07  156  	if (pre_voltage < 0) {
b615b00c42da1e Johnson Wang 2022-06-07  157  		dev_err(dev, "invalid vproc =
value: %d\n", pre_voltage);
b615b00c42da1e Johnson Wang 2022-06-07  158  		ret =3D pre_voltage;
b615b00c42da1e Johnson Wang 2022-06-07  159  		goto out_unlock;
b615b00c42da1e Johnson Wang 2022-06-07  160  	}
b615b00c42da1e Johnson Wang 2022-06-07  161  =

b615b00c42da1e Johnson Wang 2022-06-07  162  	/* scale up: set voltage firs=
t then freq. */
b615b00c42da1e Johnson Wang 2022-06-07  163  	target_voltage =3D max(inter_=
voltage, voltage);
b615b00c42da1e Johnson Wang 2022-06-07  164  	if (pre_voltage <=3D target_v=
oltage) {
b615b00c42da1e Johnson Wang 2022-06-07  165  		ret =3D mtk_ccifreq_set_volt=
age(drv, target_voltage);
b615b00c42da1e Johnson Wang 2022-06-07  166  		if (ret) {
b615b00c42da1e Johnson Wang 2022-06-07  167  			dev_err(dev, "failed to sca=
le up voltage\n");
b615b00c42da1e Johnson Wang 2022-06-07  168  			goto out_restore_voltage;
b615b00c42da1e Johnson Wang 2022-06-07  169  		}
b615b00c42da1e Johnson Wang 2022-06-07  170  	}
b615b00c42da1e Johnson Wang 2022-06-07  171  =

b615b00c42da1e Johnson Wang 2022-06-07  172  	/* switch the cci clock to in=
termediate clock source. */
b615b00c42da1e Johnson Wang 2022-06-07  173  	ret =3D clk_set_parent(drv->c=
ci_clk, drv->inter_clk);
b615b00c42da1e Johnson Wang 2022-06-07  174  	if (ret) {
b615b00c42da1e Johnson Wang 2022-06-07  175  		dev_err(dev, "failed to re-p=
arent cci clock\n");
b615b00c42da1e Johnson Wang 2022-06-07  176  		goto out_restore_voltage;
b615b00c42da1e Johnson Wang 2022-06-07  177  	}
b615b00c42da1e Johnson Wang 2022-06-07  178  =

b615b00c42da1e Johnson Wang 2022-06-07  179  	/* set the original clock to =
target rate. */
b615b00c42da1e Johnson Wang 2022-06-07  180  	ret =3D clk_set_rate(cci_pll,=
 *freq);
b615b00c42da1e Johnson Wang 2022-06-07  181  	if (ret) {
b615b00c42da1e Johnson Wang 2022-06-07  182  		dev_err(dev, "failed to set =
cci pll rate: %d\n", ret);
b615b00c42da1e Johnson Wang 2022-06-07  183  		clk_set_parent(drv->cci_clk,=
 cci_pll);
b615b00c42da1e Johnson Wang 2022-06-07  184  		goto out_restore_voltage;
b615b00c42da1e Johnson Wang 2022-06-07  185  	}
b615b00c42da1e Johnson Wang 2022-06-07  186  =

b615b00c42da1e Johnson Wang 2022-06-07  187  	/* switch the cci clock back =
to the original clock source. */
b615b00c42da1e Johnson Wang 2022-06-07  188  	ret =3D clk_set_parent(drv->c=
ci_clk, cci_pll);
b615b00c42da1e Johnson Wang 2022-06-07  189  	if (ret) {
b615b00c42da1e Johnson Wang 2022-06-07  190  		dev_err(dev, "failed to re-p=
arent cci clock\n");
b615b00c42da1e Johnson Wang 2022-06-07  191  		mtk_ccifreq_set_voltage(drv,=
 inter_voltage);
b615b00c42da1e Johnson Wang 2022-06-07  192  		goto out_unlock;
b615b00c42da1e Johnson Wang 2022-06-07  193  	}
b615b00c42da1e Johnson Wang 2022-06-07  194  =

b615b00c42da1e Johnson Wang 2022-06-07  195  	/*
b615b00c42da1e Johnson Wang 2022-06-07  196  	 * If the new voltage is lowe=
r than the intermediate voltage or the
b615b00c42da1e Johnson Wang 2022-06-07  197  	 * original voltage, scale do=
wn to the new voltage.
b615b00c42da1e Johnson Wang 2022-06-07  198  	 */
b615b00c42da1e Johnson Wang 2022-06-07  199  	if (voltage < inter_voltage |=
| voltage < pre_voltage) {
b615b00c42da1e Johnson Wang 2022-06-07  200  		ret =3D mtk_ccifreq_set_volt=
age(drv, voltage);
b615b00c42da1e Johnson Wang 2022-06-07  201  		if (ret) {
b615b00c42da1e Johnson Wang 2022-06-07  202  			dev_err(dev, "failed to sca=
le down voltage\n");
b615b00c42da1e Johnson Wang 2022-06-07  203  			goto out_unlock;
b615b00c42da1e Johnson Wang 2022-06-07  204  		}
b615b00c42da1e Johnson Wang 2022-06-07  205  	}
b615b00c42da1e Johnson Wang 2022-06-07  206  =

b615b00c42da1e Johnson Wang 2022-06-07  207  	drv->pre_freq =3D *freq;
b615b00c42da1e Johnson Wang 2022-06-07  208  	mutex_unlock(&drv->reg_lock);
b615b00c42da1e Johnson Wang 2022-06-07  209  =

b615b00c42da1e Johnson Wang 2022-06-07  210  	return 0;
b615b00c42da1e Johnson Wang 2022-06-07  211  =

b615b00c42da1e Johnson Wang 2022-06-07  212  out_restore_voltage:
b615b00c42da1e Johnson Wang 2022-06-07  213  	mtk_ccifreq_set_voltage(drv, =
pre_voltage);
b615b00c42da1e Johnson Wang 2022-06-07  214  =

b615b00c42da1e Johnson Wang 2022-06-07  215  out_unlock:
b615b00c42da1e Johnson Wang 2022-06-07  216  	mutex_unlock(&drv->reg_lock);
b615b00c42da1e Johnson Wang 2022-06-07  217  	return ret;
b615b00c42da1e Johnson Wang 2022-06-07  218  }
b615b00c42da1e Johnson Wang 2022-06-07  219  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2498845465126563735==--

