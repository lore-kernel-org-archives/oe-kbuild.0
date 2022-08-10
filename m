Content-Type: multipart/mixed; boundary="===============2561324139687840039=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/opp/core.c:1742:50: warning: Uninitialized variables: opp.node, opp.kref, opp.available, opp.dynamic, opp.turbo, opp.suspend, opp.removed, opp.pstate, opp.rates, opp.level, opp.supplies, opp.bandwidth, opp.clock_latency_ns, opp.required_opps, opp....
Date: Wed, 10 Aug 2022 08:32:54 +0800
Message-ID: <202208100834.32YuEOLO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2561324139687840039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/o=
pp/core.c:1742:50: warning: Uninitialized variables: opp.node, opp.kref, op=
p.available, opp.dynamic, opp.turbo, opp.suspend, opp.removed, opp.pstate, =
opp.rates, opp.level, opp.supplies, opp.bandwidth, opp.clock_latency_ns, op=
p.required_opps, opp.opp_table, opp.np [uninitvar]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Viresh Kumar <viresh.kumar@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   15205c2829ca2cbb5ece5ceaafe1171a8470e62b
commit: 2083da24eb56ce622332946800a67a7449d85fe5 OPP: Allow multiple clocks=
 for a device
date:   4 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 weeks ago
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 2083da24eb56ce622332946800a67a7449d85fe5
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/opp/core.c:818:23: warning: Parameter 'regulators' can be declar=
ed with const [constParameter]
      struct regulator **regulators, unsigned int count)
                         ^
   drivers/opp/core.c:2542:27: warning: Parameter 'src_opp' can be declared=
 with const [constParameter]
          struct dev_pm_opp *src_opp)
                             ^
   drivers/opp/core.c:64:26: warning: Uninitialized variables: opp_table.no=
de, opp_table.lazy, opp_table.head, opp_table.dev_list, opp_table.opp_list,=
 opp_table.kref, opp_table.lock, opp_table.np, opp_table.clock_latency_ns_m=
ax, opp_table.voltage_tolerance_v1, opp_table.parsed_static_opps, opp_table=
.shared_opp, opp_table.rate_clk_single, opp_table.current_opp, opp_table.su=
spend_opp, opp_table.genpd_virt_dev_lock, opp_table.genpd_virt_devs, opp_ta=
ble.required_opp_tables, opp_table.required_opp_count, opp_table.supported_=
hw, opp_table.supported_hw_count, opp_table.prop_name, opp_table.config_clk=
s, opp_table.clks, opp_table.clk, opp_table.clk_count, opp_table.config_reg=
ulators, opp_table.regulators, opp_table.regulator_count, opp_table.paths, =
opp_table.path_count, opp_table.enabled, opp_table.genpd_performance_state,=
 opp_table.is_genpd [uninitvar]
     if (_find_opp_dev(dev, opp_table)) {
                            ^
   drivers/opp/core.c:394:12: warning: Uninitialized variable: opp->availab=
le [uninitvar]
     if (opp->available)
              ^
   drivers/opp/core.c:491:17: warning: Uninitialized variable: temp_opp->av=
ailable [uninitvar]
     if (temp_opp->available =3D=3D available) {
                   ^
   drivers/opp/core.c:1527:13: warning: Uninitialized variable: iter->rates=
 [uninitvar]
     if (iter->rates[0] =3D=3D freq) {
               ^
   drivers/opp/core.c:1521:12: note: Assuming condition is false
    if (IS_ERR(opp_table))
              ^
   drivers/opp/core.c:1527:13: note: Uninitialized variable: iter->rates
     if (iter->rates[0] =3D=3D freq) {
               ^
   drivers/opp/core.c:1561:14: warning: Uninitialized variable: temp->remov=
ed [uninitvar]
     if (!temp->removed && dynamic =3D=3D temp->dynamic) {
                ^
>> drivers/opp/core.c:1742:50: warning: Uninitialized variables: opp.node, =
opp.kref, opp.available, opp.dynamic, opp.turbo, opp.suspend, opp.removed, =
opp.pstate, opp.rates, opp.level, opp.supplies, opp.bandwidth, opp.clock_la=
tency_ns, opp.required_opps, opp.opp_table, opp.np [uninitvar]
     opp_cmp =3D _opp_compare_key(opp_table, new_opp, opp);
                                                    ^
   drivers/opp/core.c:2714:16: warning: Uninitialized variable: tmp_opp->ra=
tes [uninitvar]
     if (tmp_opp->rates[0] =3D=3D freq) {
                  ^
   drivers/opp/core.c:2704:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:2714:16: note: Uninitialized variable: tmp_opp->rates
     if (tmp_opp->rates[0] =3D=3D freq) {
                  ^
   drivers/opp/core.c:2785:16: warning: Uninitialized variable: tmp_opp->ra=
tes [uninitvar]
     if (tmp_opp->rates[0] =3D=3D freq) {
                  ^
   drivers/opp/core.c:2775:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:2785:16: note: Uninitialized variable: tmp_opp->rates
     if (tmp_opp->rates[0] =3D=3D freq) {
                  ^
   drivers/opp/core.c:64:26: warning: Uninitialized variables: opp_table.no=
de, opp_table.lazy, opp_table.head, opp_table.dev_list, opp_table.opp_list,=
 opp_table.kref, opp_table.lock, opp_table.np, opp_table.clock_latency_ns_m=
ax, opp_table.voltage_tolerance_v1, opp_table.parsed_static_opps, opp_table=
.shared_opp, opp_table.rate_clk_single, opp_table.current_opp, opp_table.su=
spend_opp, opp_table.genpd_virt_dev_lock, opp_table.genpd_virt_devs, opp_ta=
ble.required_opp_tables, opp_table.required_opp_count, opp_table.supported_=
hw, opp_table.supported_hw_count, opp_table.prop_name, opp_table.config_clk=
s, opp_table.clks, opp_table.clk, opp_table.clk_count, opp_table.config_reg=
ulators, opp_table.regulators, opp_table.regulator_count, opp_table.paths, =
opp_table.path_count, opp_table.enabled, opp_table.genpd_performance_state,=
 opp_table.is_genpd, opp_table.dentry [uninitvar]
     if (_find_opp_dev(dev, opp_table)) {
                            ^
   drivers/opp/core.c:1742:50: warning: Uninitialized variables: opp.node, =
opp.kref, opp.available, opp.dynamic, opp.turbo, opp.suspend, opp.removed, =
opp.pstate, opp.rates, opp.level, opp.supplies, opp.bandwidth, opp.clock_la=
tency_ns, opp.required_opps, opp.opp_table, opp.np, opp.dentry, opp.of_name=
 [uninitvar]
     opp_cmp =3D _opp_compare_key(opp_table, new_opp, opp);
                                                    ^

vim +1742 drivers/opp/core.c

6c591eec67cbb4 drivers/opp/core.c            Saravana Kannan 2020-05-12  17=
25  =

a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  17=
26  static int _opp_is_duplicate(struct device *dev, struct dev_pm_opp *new=
_opp,
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  17=
27  			     struct opp_table *opp_table,
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  17=
28  			     struct list_head **head)
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
29  {
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
30  	struct dev_pm_opp *opp;
6c591eec67cbb4 drivers/opp/core.c            Saravana Kannan 2020-05-12  17=
31  	int opp_cmp;
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
32  =

23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
33  	/*
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
34  	 * Insert new OPP in order of increasing frequency and discard if
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
35  	 * already present.
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
36  	 *
2c2709dc6921c5 drivers/base/power/opp/core.c Viresh Kumar    2016-02-16  17=
37  	 * Need to use &opp_table->opp_list in the condition part of the 'for'
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
38  	 * loop, don't replace it with head otherwise it will become an infini=
te
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
39  	 * loop.
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
40  	 */
052c6f19141dd1 drivers/base/power/opp/core.c Viresh Kumar    2017-01-23  17=
41  	list_for_each_entry(opp, &opp_table->opp_list, node) {
2083da24eb56ce drivers/opp/core.c            Viresh Kumar    2022-06-10 @17=
42  		opp_cmp =3D _opp_compare_key(opp_table, new_opp, opp);
6c591eec67cbb4 drivers/opp/core.c            Saravana Kannan 2020-05-12  17=
43  		if (opp_cmp > 0) {
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  17=
44  			*head =3D &opp->node;
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
45  			continue;
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
46  		}
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
47  =

6c591eec67cbb4 drivers/opp/core.c            Saravana Kannan 2020-05-12  17=
48  		if (opp_cmp < 0)
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  17=
49  			return 0;
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
50  =

23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
51  		/* Duplicate OPPs */
064416586190cb drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
52  		dev_warn(dev, "%s: duplicate OPPs detected. Existing: freq: %lu, volt=
: %lu, enabled: %d. New: freq: %lu, volt: %lu, enabled: %d\n",
2083da24eb56ce drivers/opp/core.c            Viresh Kumar    2022-06-10  17=
53  			 __func__, opp->rates[0], opp->supplies[0].u_volt,
2083da24eb56ce drivers/opp/core.c            Viresh Kumar    2022-06-10  17=
54  			 opp->available, new_opp->rates[0],
dfbe4678d709e2 drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  17=
55  			 new_opp->supplies[0].u_volt, new_opp->available);
23dacf6d2e9935 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  17=
56  =

dfbe4678d709e2 drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  17=
57  		/* Should we compare voltages for all regulators here ? */
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  17=
58  		return opp->available &&
7f8538ebaefc07 drivers/base/power/opp/core.c Viresh Kumar    2017-01-02  17=
59  		       new_opp->supplies[0].u_volt =3D=3D opp->supplies[0].u_volt ? -=
EBUSY : -EEXIST;
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  17=
60  	}
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  17=
61  =

a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  17=
62  	return 0;
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  17=
63  }
a1e8c13600bfd9 drivers/opp/core.c            Viresh Kumar    2018-04-06  17=
64  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2561324139687840039==--

