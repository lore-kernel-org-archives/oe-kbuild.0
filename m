Content-Type: multipart/mixed; boundary="===============8251834689786412260=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [krzk-github:n/qcom-ufs-opp-v3 10/13] drivers/opp/core.c:1335 dev_pm_opp_set_rate() error: uninitialized symbol 'ret'.
Date: Tue, 10 May 2022 10:27:19 +0800
Message-ID: <202205101034.m9Hf56oV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8251834689786412260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/qcom-ufs-opp-v3
head:   22a49fd92d5e31234d4174cdf1fdade79f38ae3d
commit: ff3c34983e1cca80d8c081ea99e0117c5c38c6c3 [10/13] PM: opp: allow con=
trol of multiple clocks
:::::: branch date: 16 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-m001-20220509 (https://download.01.org/0day-ci/ar=
chive/20220510/202205101034.m9Hf56oV-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/opp/core.c:1335 dev_pm_opp_set_rate() error: uninitialized symbol '=
ret'.

vim +/ret +1335 drivers/opp/core.c

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1263  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1264  /**
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1265   * dev_pm_opp_set_rate() - Configure new OPP based on frequency
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1266   * @dev:	 device for which we do this operation
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1267   * @target_freq: frequency to achieve
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1268   *
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1269   * This configures the power-supplies to the levels specified by th=
e OPP
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1270   * corresponding to the target_freq, and programs the clock to a va=
lue <=3D
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1271   * target_freq, as rounded by clk_round_rate(). Device wanting to r=
un@fmax
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1272   * provided by the opp, should have already rounded to the target O=
PP's
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1273   * frequency.
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1274   */
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1275  int dev_pm_opp_set_rate(struct device *dev, unsigned long target_fr=
eq)
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1276  {
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1277  	struct opp_table *opp_table;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1278  	unsigned long freq =3D 0, temp_freq;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1279  	struct dev_pm_opp *opp =3D NULL;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1280  	int ret;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1281  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1282  	opp_table =3D _find_opp_table(dev);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1283  	if (IS_ERR(opp_table)) {
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1284  		dev_err(dev, "%s: device's opp table doesn't exist\n", __func__);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1285  		return PTR_ERR(opp_table);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1286  	}
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1287  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1288  	if (target_freq) {
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1289  		/*
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1290  		 * For IO devices which require an OPP on some platforms/SoCs
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1291  		 * while just needing to scale the clock on some others
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1292  		 * we look for empty OPP tables with just a clock handle and
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1293  		 * scale only the clk. This makes dev_pm_opp_set_rate()
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1294  		 * equivalent to a clk_set_rate()
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1295  		 */
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1296  		if (!_get_opp_count(opp_table)) {
ff3c34983e1cca drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1297  			if (opp_table->clks)
ff3c34983e1cca drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1298  				ret =3D _generic_set_opp_clk_only(dev,
ff3c34983e1cca drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1299  								opp_table->clks[0],
ff3c34983e1cca drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1300  								target_freq);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1301  			goto put_opp_table;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1302  		}
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1303  =

ff3c34983e1cca drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1304  		if (opp_table->clks)
ff3c34983e1cca drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1305  			freq =3D clk_round_rate(opp_table->clks[0], target_freq);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1306  		if ((long)freq <=3D 0)
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1307  			freq =3D target_freq;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1308  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1309  		/*
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1310  		 * The clock driver may support finer resolution of the
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1311  		 * frequencies than the OPP table, don't update the frequency we
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1312  		 * pass to clk_set_rate() here.
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1313  		 */
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1314  		temp_freq =3D freq;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1315  		opp =3D _find_freq_ceil(opp_table, &temp_freq);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1316  		if (IS_ERR(opp)) {
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1317  			ret =3D PTR_ERR(opp);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1318  			dev_err(dev, "%s: failed to find OPP for freq %lu (%d)\n",
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1319  				__func__, freq, ret);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1320  			goto put_opp_table;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1321  		}
ff3c34983e1cca drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1322  		/*
ff3c34983e1cca drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1323  		 * opp->rates are used for scaling clocks, so be sure accurate
ff3c34983e1cca drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1324  		 * 'freq' is used, instead what was defined via e.g. Devicetree.
ff3c34983e1cca drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1325  		 */
ff3c34983e1cca drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1326  		opp->rates[0] =3D freq;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1327  	}
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1328  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1329  	ret =3D _set_opp(dev, opp_table, opp, freq);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1330  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1331  	if (target_freq)
8a31d9d94297b1 drivers/base/power/opp/core.c Viresh Kumar        2017-01-23=
  1332  		dev_pm_opp_put(opp);
052c6f19141dd1 drivers/base/power/opp/core.c Viresh Kumar        2017-01-23=
  1333  put_opp_table:
5b650b388844f2 drivers/base/power/opp/core.c Viresh Kumar        2017-01-23=
  1334  	dev_pm_opp_put_opp_table(opp_table);
052c6f19141dd1 drivers/base/power/opp/core.c Viresh Kumar        2017-01-23=
 @1335  	return ret;
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar        2016-02-09=
  1336  }
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar        2016-02-09=
  1337  EXPORT_SYMBOL_GPL(dev_pm_opp_set_rate);
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar        2016-02-09=
  1338  =


:::::: The code at line 1335 was first introduced by commit
:::::: 052c6f19141dd13f266cc465fde6f38ddc93d5fb PM / OPP: Move away from RC=
U locking

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8251834689786412260==--

