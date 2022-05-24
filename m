Content-Type: multipart/mixed; boundary="===============4657542875454799303=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [krzk-github:n/qcom-bwmon-v3 18/22] drivers/opp/core.c:1162 _set_opp() warn: if statement not indented
Date: Wed, 25 May 2022 05:25:46 +0800
Message-ID: <202205250514.5udea6OJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4657542875454799303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/qcom-bwmon-v3
head:   f595f77c2d91820ce85df16e278315e522172710
commit: 9dcc827f8b0062cea637d4a5cc449f2b88134266 [18/22] debug
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
525/202205250514.5udea6OJ-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/opp/core.c:1162 _set_opp() warn: if statement not indented

Old smatch warnings:
drivers/opp/core.c:1275 dev_pm_opp_set_rate() warn: passing a valid pointer=
 to 'PTR_ERR'
drivers/opp/core.c:2811 _opp_set_availability() warn: passing a valid point=
er to 'PTR_ERR'
drivers/opp/core.c:2882 dev_pm_opp_adjust_voltage() warn: passing a valid p=
ointer to 'PTR_ERR'

vim +1162 drivers/opp/core.c

f3364e17d5716a drivers/opp/core.c            Viresh Kumar        2020-08-13=
  1139  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1140  static int _set_opp(struct device *dev, struct opp_table *opp_table,
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1141  		    struct dev_pm_opp *opp, unsigned long freq)
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar        2016-02-09=
  1142  {
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1143  	struct dev_pm_opp *old_opp;
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1144  	int scaling_down, ret;
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar        2016-02-09=
  1145  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1146  	if (unlikely(!opp))
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1147  		return _disable_opp_table(dev, opp_table);
aca48b61f96386 drivers/opp/core.c            Rajendra Nayak      2020-04-08=
  1148  =

81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar        2021-01-20=
  1149  	/* Find the currently set OPP if we don't know already */
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar        2021-01-20=
  1150  	if (unlikely(!opp_table->current_opp))
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar        2021-01-20=
  1151  		_find_current_opp(dev, opp_table);
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar        2016-02-09=
  1152  =

81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar        2021-01-20=
  1153  	old_opp =3D opp_table->current_opp;
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar        2021-01-20=
  1154  =

81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar        2021-01-20=
  1155  	/* Return early if nothing to do */
de04241ab87afc drivers/opp/core.c            Jonathan Marek      2021-02-16=
  1156  	if (old_opp =3D=3D opp && opp_table->current_rate =3D=3D freq &&
de04241ab87afc drivers/opp/core.c            Jonathan Marek      2021-02-16=
  1157  	    opp_table->enabled) {
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar        2021-01-20=
  1158  		dev_dbg(dev, "%s: OPPs are same, nothing to do\n", __func__);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1159  		return 0;
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar        2016-02-09=
  1160  	}
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar        2016-02-09=
  1161  =

9dcc827f8b0062 drivers/opp/core.c            Krzysztof Kozlowski 2022-05-24=
 @1162  	if (old_opp->bandwidth && old_opp->bandwidth[0].peak)
9dcc827f8b0062 drivers/opp/core.c            Krzysztof Kozlowski 2022-05-24=
  1163  	dev_err(dev, "%s: switching OPP: Freq %lu -> %lu Hz, Level %u -> %=
u, Bw %u -> %u\n",
de04241ab87afc drivers/opp/core.c            Jonathan Marek      2021-02-16=
  1164  		__func__, opp_table->current_rate, freq, old_opp->level,
de04241ab87afc drivers/opp/core.c            Jonathan Marek      2021-02-16=
  1165  		opp->level, old_opp->bandwidth ? old_opp->bandwidth[0].peak : 0,
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1166  		opp->bandwidth ? opp->bandwidth[0].peak : 0);
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1167  =

f0b88fa4559525 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1168  	scaling_down =3D _opp_compare_key(old_opp, opp);
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1169  	if (scaling_down =3D=3D -1)
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1170  		scaling_down =3D 0;
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar        2016-12-01=
  1171  =

ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar        2018-06-14=
  1172  	/* Scaling up? Configure required OPPs before frequency */
f0b88fa4559525 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1173  	if (!scaling_down) {
2c59138c22f17c drivers/opp/core.c            Stephan Gerhold     2020-07-30=
  1174  		ret =3D _set_required_opps(dev, opp_table, opp, true);
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1175  		if (ret) {
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1176  			dev_err(dev, "Failed to set required opps: %d\n", ret);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1177  			return ret;
ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar        2018-06-14=
  1178  		}
ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar        2018-06-14=
  1179  =

870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1180  		ret =3D _set_opp_bw(opp_table, opp, dev);
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1181  		if (ret) {
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1182  			dev_err(dev, "Failed to set bw: %d\n", ret);
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1183  			return ret;
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1184  		}
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1185  	}
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1186  =

7e535993fa4f67 drivers/opp/core.c            Viresh Kumar        2018-06-12=
  1187  	if (opp_table->set_opp) {
509e4777ca41d3 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1188  		ret =3D _set_opp_custom(opp_table, dev, opp, freq);
7e535993fa4f67 drivers/opp/core.c            Viresh Kumar        2018-06-12=
  1189  	} else if (opp_table->regulators) {
3f62670fcca4af drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1190  		ret =3D _generic_set_opp_regulator(opp_table, dev, opp, freq,
3f62670fcca4af drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1191  						 scaling_down);
c74b32fadc00f2 drivers/base/power/opp/core.c Viresh Kumar        2017-05-23=
  1192  	} else {
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar        2016-12-01=
  1193  		/* Only frequency scaling */
1d3c42cabbd351 drivers/opp/core.c            Viresh Kumar        2021-01-20=
  1194  		ret =3D _generic_set_opp_clk_only(dev, opp_table->clk, freq);
c74b32fadc00f2 drivers/base/power/opp/core.c Viresh Kumar        2017-05-23=
  1195  	}
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar        2016-02-09=
  1196  =

870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1197  	if (ret)
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1198  		return ret;
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1199  =

ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar        2018-06-14=
  1200  	/* Scaling down? Configure required OPPs after frequency */
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1201  	if (scaling_down) {
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1202  		ret =3D _set_opp_bw(opp_table, opp, dev);
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1203  		if (ret) {
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1204  			dev_err(dev, "Failed to set bw: %d\n", ret);
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1205  			return ret;
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1206  		}
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1207  =

2c59138c22f17c drivers/opp/core.c            Stephan Gerhold     2020-07-30=
  1208  		ret =3D _set_required_opps(dev, opp_table, opp, false);
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1209  		if (ret) {
ca1b5d77b1c69d drivers/opp/core.c            Viresh Kumar        2018-06-14=
  1210  			dev_err(dev, "Failed to set required opps: %d\n", ret);
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1211  			return ret;
870d5d963972dd drivers/opp/core.c            Viresh Kumar        2021-01-28=
  1212  		}
c74b32fadc00f2 drivers/base/power/opp/core.c Viresh Kumar        2017-05-23=
  1213  	}
052c6f19141dd1 drivers/base/power/opp/core.c Viresh Kumar        2017-01-23=
  1214  =

72f80ce4ef9b75 drivers/opp/core.c            Viresh Kumar        2020-08-13=
  1215  	opp_table->enabled =3D true;
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar        2021-01-20=
  1216  	dev_pm_opp_put(old_opp);
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar        2021-01-20=
  1217  =

81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar        2021-01-20=
  1218  	/* Make sure current_opp doesn't get freed */
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar        2021-01-20=
  1219  	dev_pm_opp_get(opp);
81c4d8a3c41488 drivers/opp/core.c            Viresh Kumar        2021-01-20=
  1220  	opp_table->current_opp =3D opp;
de04241ab87afc drivers/opp/core.c            Jonathan Marek      2021-02-16=
  1221  	opp_table->current_rate =3D freq;
fe2af40250bfc3 drivers/opp/core.c            Georgi Djakov       2020-05-12=
  1222  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1223  	return ret;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1224  }
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1225  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4657542875454799303==--

