Content-Type: multipart/mixed; boundary="===============3582136897550278372=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [krzk-github:n/qcom-ufs-opp-v3 15/16] drivers/opp/core.c:1852:39: warning: Uninitialized variables: opp.node, opp.kref, opp.available, opp.dynamic, opp.turbo, opp.suspend, opp.removed, opp.pstate, opp.rate, opp.level, opp.supplies, opp.rates, opp.bandwidth, opp.clock_latency_ns, opp.required_...
Date: Tue, 17 May 2022 08:39:55 +0800
Message-ID: <202205170827.tyh8MhK5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3582136897550278372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/qcom-ufs-opp-v3
head:   00fbe567c9dc48a8d0c625f3955587a7a21aca8e
commit: d7df0def3ee070b7c8f309eb1547e22d1ea6c343 [15/16] PM: opp: parse mul=
tiple frequencies in each OPP
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: xtensa-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d7df0def3ee070b7c8f309eb1547e22d1ea6c343
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/opp/core.c:2736:27: warning: Parameter 'src_opp' can be declared=
 with const [constParameter]
          struct dev_pm_opp *src_opp)
                             ^
   drivers/opp/core.c:60:26: warning: Uninitialized variables: opp_table.no=
de, opp_table.lazy, opp_table.head, opp_table.dev_list, opp_table.opp_list,=
 opp_table.kref, opp_table.lock, opp_table.np, opp_table.clock_latency_ns_m=
ax, opp_table.voltage_tolerance_v1, opp_table.parsed_static_opps, opp_table=
.shared_opp, opp_table.current_rate, opp_table.current_opp, opp_table.suspe=
nd_opp, opp_table.genpd_virt_dev_lock, opp_table.genpd_virt_devs, opp_table=
.required_opp_tables, opp_table.required_opp_count, opp_table.supported_hw,=
 opp_table.supported_hw_count, opp_table.prop_name, opp_table.clks, opp_tab=
le.clk_count, opp_table.regulators, opp_table.regulator_count, opp_table.pa=
ths, opp_table.path_count, opp_table.enabled, opp_table.genpd_performance_s=
tate, opp_table.is_genpd, opp_table.set_opp, opp_table.sod_supplies, opp_ta=
ble.set_opp_data [uninitvar]
     if (_find_opp_dev(dev, opp_table)) {
                            ^
   drivers/opp/core.c:377:12: warning: Uninitialized variable: opp->availab=
le [uninitvar]
     if (opp->available)
              ^
   drivers/opp/core.c:454:17: warning: Uninitialized variable: temp_opp->av=
ailable [uninitvar]
     if (temp_opp->available =3D=3D available &&
                   ^
   drivers/opp/core.c:444:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:454:17: note: Uninitialized variable: temp_opp->avail=
able
     if (temp_opp->available =3D=3D available &&
                   ^
   drivers/opp/core.c:479:17: warning: Uninitialized variable: temp_opp->av=
ailable [uninitvar]
     if (temp_opp->available && temp_opp->rate >=3D *freq) {
                   ^
   drivers/opp/core.c:679:17: warning: Uninitialized variable: temp_opp->le=
vel [uninitvar]
     if (temp_opp->level =3D=3D level) {
                   ^
   drivers/opp/core.c:669:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:679:17: note: Uninitialized variable: temp_opp->level
     if (temp_opp->level =3D=3D level) {
                   ^
   drivers/opp/core.c:727:17: warning: Uninitialized variable: temp_opp->av=
ailable [uninitvar]
     if (temp_opp->available && temp_opp->level >=3D *level) {
                   ^
   drivers/opp/core.c:717:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:727:17: note: Uninitialized variable: temp_opp->avail=
able
     if (temp_opp->available && temp_opp->level >=3D *level) {
                   ^
   drivers/opp/core.c:1664:13: warning: Uninitialized variable: iter->rate =
[uninitvar]
     if (iter->rate =3D=3D freq) {
               ^
   drivers/opp/core.c:1658:12: note: Assuming condition is false
    if (IS_ERR(opp_table))
              ^
   drivers/opp/core.c:1664:13: note: Uninitialized variable: iter->rate
     if (iter->rate =3D=3D freq) {
               ^
   drivers/opp/core.c:1698:14: warning: Uninitialized variable: temp->remov=
ed [uninitvar]
     if (!temp->removed && dynamic =3D=3D temp->dynamic) {
                ^
>> drivers/opp/core.c:1852:39: warning: Uninitialized variables: opp.node, =
opp.kref, opp.available, opp.dynamic, opp.turbo, opp.suspend, opp.removed, =
opp.pstate, opp.rate, opp.level, opp.supplies, opp.rates, opp.bandwidth, op=
p.clock_latency_ns, opp.required_opps, opp.opp_table, opp.np [uninitvar]
     opp_cmp =3D _opp_compare_key(new_opp, opp);
                                         ^
   drivers/opp/core.c:2909:16: warning: Uninitialized variable: tmp_opp->ra=
te [uninitvar]
     if (tmp_opp->rate =3D=3D freq) {
                  ^
   drivers/opp/core.c:2899:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:2909:16: note: Uninitialized variable: tmp_opp->rate
     if (tmp_opp->rate =3D=3D freq) {
                  ^
   drivers/opp/core.c:2980:16: warning: Uninitialized variable: tmp_opp->ra=
te [uninitvar]
     if (tmp_opp->rate =3D=3D freq) {
                  ^
   drivers/opp/core.c:2970:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:2980:16: note: Uninitialized variable: tmp_opp->rate
     if (tmp_opp->rate =3D=3D freq) {
                  ^
   drivers/opp/core.c:60:26: warning: Uninitialized variables: opp_table.no=
de, opp_table.lazy, opp_table.head, opp_table.dev_list, opp_table.opp_list,=
 opp_table.kref, opp_table.lock, opp_table.np, opp_table.clock_latency_ns_m=
ax, opp_table.voltage_tolerance_v1, opp_table.parsed_static_opps, opp_table=
.shared_opp, opp_table.current_rate, opp_table.current_opp, opp_table.suspe=
nd_opp, opp_table.genpd_virt_dev_lock, opp_table.genpd_virt_devs, opp_table=
.required_opp_tables, opp_table.required_opp_count, opp_table.supported_hw,=
 opp_table.supported_hw_count, opp_table.prop_name, opp_table.clks, opp_tab=
le.clk_count, opp_table.regulators, opp_table.regulator_count, opp_table.pa=
ths, opp_table.path_count, opp_table.enabled, opp_table.genpd_performance_s=
tate, opp_table.is_genpd, opp_table.set_opp, opp_table.sod_supplies, opp_ta=
ble.set_opp_data, opp_table.dentry [uninitvar]
     if (_find_opp_dev(dev, opp_table)) {
                            ^
   drivers/opp/core.c:1852:39: warning: Uninitialized variables: opp.node, =
opp.kref, opp.available, opp.dynamic, opp.turbo, opp.suspend, opp.removed, =
opp.pstate, opp.rate, opp.level, opp.supplies, opp.rates, opp.bandwidth, op=
p.clock_latency_ns, opp.required_opps, opp.opp_table, opp.np, opp.dentry, o=
pp.of_name [uninitvar]
     opp_cmp =3D _opp_compare_key(new_opp, opp);
                                         ^

vim +1852 drivers/opp/core.c

6c591eec67cbb4 drivers/opp/core.c            Saravana Kannan 2020-05-12  18=
35  =

a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  18=
36  static int _opp_is_duplicate(struct device *dev, struct dev_pm_opp *new=
_opp,
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  18=
37  			     struct opp_table *opp_table,
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  18=
38  			     struct list_head **head)
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
39  {
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
40  	struct dev_pm_opp *opp;
6c591eec67cbb4 drivers/opp/core.c            Saravana Kannan 2020-05-12  18=
41  	int opp_cmp;
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
42  =

23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
43  	/*
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
44  	 * Insert new OPP in order of increasing frequency and discard if
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
45  	 * already present.
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
46  	 *
2c2709dc6921c5 drivers/base/power/opp/core.c Viresh Kumar    2016-02-16  18=
47  	 * Need to use &opp_table->opp_list in the condition part of the 'for'
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
48  	 * loop, don't replace it with head otherwise it will become an infini=
te
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
49  	 * loop.
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
50  	 */
052c6f19141dd1 drivers/base/power/opp/core.c Viresh Kumar    2017-01-23  18=
51  	list_for_each_entry(opp, &opp_table->opp_list, node) {
6c591eec67cbb4 drivers/opp/core.c            Saravana Kannan 2020-05-12 @18=
52  		opp_cmp =3D _opp_compare_key(new_opp, opp);
6c591eec67cbb4 drivers/opp/core.c            Saravana Kannan 2020-05-12  18=
53  		if (opp_cmp > 0) {
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  18=
54  			*head =3D &opp->node;
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
55  			continue;
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
56  		}
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
57  =

6c591eec67cbb4 drivers/opp/core.c            Saravana Kannan 2020-05-12  18=
58  		if (opp_cmp < 0)
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  18=
59  			return 0;
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
60  =

23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
61  		/* Duplicate OPPs */
064416586190cb drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
62  		dev_warn(dev, "%s: duplicate OPPs detected. Existing: freq: %lu, volt=
: %lu, enabled: %d. New: freq: %lu, volt: %lu, enabled: %d\n",
dfbe4678d709e2 drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  18=
63  			 __func__, opp->rate, opp->supplies[0].u_volt,
dfbe4678d709e2 drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  18=
64  			 opp->available, new_opp->rate,
dfbe4678d709e2 drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  18=
65  			 new_opp->supplies[0].u_volt, new_opp->available);
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  18=
66  =

dfbe4678d709e2 drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  18=
67  		/* Should we compare voltages for all regulators here ? */
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  18=
68  		return opp->available &&
7f8538ebaefc07 drivers/base/power/opp/core.c Viresh Kumar    2017-01-02  18=
69  		       new_opp->supplies[0].u_volt =3D=3D opp->supplies[0].u_volt ? -=
EBUSY : -EEXIST;
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  18=
70  	}
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  18=
71  =

a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  18=
72  	return 0;
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  18=
73  }
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  18=
74  =


:::::: The code at line 1852 was first introduced by commit
:::::: 6c591eec67cbb4db988ab35b944f5cf9013c0714 OPP: Add helpers for readin=
g the binding properties

:::::: TO: Saravana Kannan <saravanak@google.com>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3582136897550278372==--

