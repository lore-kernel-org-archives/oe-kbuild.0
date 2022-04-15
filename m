Content-Type: multipart/mixed; boundary="===============6396947025849780071=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [krzk-github:n/qcom-ufs-opp-v2 14/16] drivers/opp/core.c:1215 dev_pm_opp_set_rate() error: uninitialized symbol 'ret'.
Date: Fri, 15 Apr 2022 09:34:09 +0800
Message-ID: <202204150900.qnJMf3Gu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6396947025849780071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/qcom-ufs-opp-v2
head:   bf7d30c9329c87f06dff42b303a9bcfd2e1f54eb
commit: be46c855d54f763bfb95424e5204fe7496e2ee5f [14/16] PM: opp: allow con=
trol of multiple clocks
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
415/202204150900.qnJMf3Gu-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/opp/core.c:1215 dev_pm_opp_set_rate() error: uninitialized symbol '=
ret'.

Old smatch warnings:
drivers/opp/core.c:1197 dev_pm_opp_set_rate() warn: passing a valid pointer=
 to 'PTR_ERR'
drivers/opp/core.c:2813 _opp_set_availability() warn: passing a valid point=
er to 'PTR_ERR'
drivers/opp/core.c:2884 dev_pm_opp_adjust_voltage() warn: passing a valid p=
ointer to 'PTR_ERR'

vim +/ret +1215 drivers/opp/core.c

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1143  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1144  /**
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1145   * dev_pm_opp_set_rate() - Configure new OPP based on frequency
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1146   * @dev:	 device for which we do this operation
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1147   * @target_freq: frequency to achieve
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1148   *
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1149   * This configures the power-supplies to the levels specified by th=
e OPP
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1150   * corresponding to the target_freq, and programs the clock to a va=
lue <=3D
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1151   * target_freq, as rounded by clk_round_rate(). Device wanting to r=
un@fmax
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1152   * provided by the opp, should have already rounded to the target O=
PP's
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1153   * frequency.
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1154   */
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1155  int dev_pm_opp_set_rate(struct device *dev, unsigned long target_fr=
eq)
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1156  {
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1157  	struct opp_table *opp_table;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1158  	unsigned long freq =3D 0, temp_freq;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1159  	struct dev_pm_opp *opp =3D NULL;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1160  	int ret;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1161  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1162  	opp_table =3D _find_opp_table(dev);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1163  	if (IS_ERR(opp_table)) {
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1164  		dev_err(dev, "%s: device's opp table doesn't exist\n", __func__);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1165  		return PTR_ERR(opp_table);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1166  	}
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1167  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1168  	if (target_freq) {
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1169  		/*
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1170  		 * For IO devices which require an OPP on some platforms/SoCs
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1171  		 * while just needing to scale the clock on some others
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1172  		 * we look for empty OPP tables with just a clock handle and
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1173  		 * scale only the clk. This makes dev_pm_opp_set_rate()
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1174  		 * equivalent to a clk_set_rate()
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1175  		 */
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1176  		if (!_get_opp_count(opp_table)) {
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1177  			if (opp_table->clks)
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1178  				ret =3D _generic_set_opp_clk_only(dev,
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1179  								opp_table->clks[0],
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1180  								target_freq);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1181  			goto put_opp_table;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1182  		}
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1183  =

be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1184  		if (opp_table->clks)
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1185  			freq =3D clk_round_rate(opp_table->clks[0], target_freq);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1186  		if ((long)freq <=3D 0)
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1187  			freq =3D target_freq;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1188  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1189  		/*
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1190  		 * The clock driver may support finer resolution of the
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1191  		 * frequencies than the OPP table, don't update the frequency we
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1192  		 * pass to clk_set_rate() here.
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1193  		 */
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1194  		temp_freq =3D freq;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1195  		opp =3D _find_freq_ceil(opp_table, &temp_freq);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1196  		if (IS_ERR(opp)) {
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1197  			ret =3D PTR_ERR(opp);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1198  			dev_err(dev, "%s: failed to find OPP for freq %lu (%d)\n",
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1199  				__func__, freq, ret);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1200  			goto put_opp_table;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1201  		}
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1202  		/*
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1203  		 * opp->rates are used for scaling clocks, so be sure accurate
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1204  		 * 'freq' is used, instead what was defined via e.g. Devicetree.
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1205  		 */
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1206  		opp->rates[0] =3D freq;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1207  	}
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1208  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1209  	ret =3D _set_opp(dev, opp_table, opp, freq);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1210  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1211  	if (target_freq)
8a31d9d94297b1 drivers/base/power/opp/core.c Viresh Kumar        2017-01-23=
  1212  		dev_pm_opp_put(opp);
052c6f19141dd1 drivers/base/power/opp/core.c Viresh Kumar        2017-01-23=
  1213  put_opp_table:
5b650b388844f2 drivers/base/power/opp/core.c Viresh Kumar        2017-01-23=
  1214  	dev_pm_opp_put_opp_table(opp_table);
052c6f19141dd1 drivers/base/power/opp/core.c Viresh Kumar        2017-01-23=
 @1215  	return ret;
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar        2016-02-09=
  1216  }
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar        2016-02-09=
  1217  EXPORT_SYMBOL_GPL(dev_pm_opp_set_rate);
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar        2016-02-09=
  1218  =


:::::: The code at line 1215 was first introduced by commit
:::::: 052c6f19141dd13f266cc465fde6f38ddc93d5fb PM / OPP: Move away from RC=
U locking

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6396947025849780071==--

