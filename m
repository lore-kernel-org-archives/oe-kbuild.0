Content-Type: multipart/mixed; boundary="===============7608712692069727320=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [krzk-github:n/qcom-ufs-opp-v2 14/16] drivers/opp/core.c:1740:39: warning: Uninitialized variables: opp.node, opp.kref, opp.available, opp.dynamic, opp.turbo, opp.suspend, opp.removed, opp.pstate, opp.rate, opp.level, opp.rates, opp.supplies, opp.bandwidth, opp.clock_latency_ns, opp.required_...
Date: Sat, 09 Apr 2022 15:24:30 +0800
Message-ID: <202204091553.7jhIlJFk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7608712692069727320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/qcom-ufs-opp-v2
head:   a75f8b79ea63e60950b6a52fdab3564d90b42839
commit: a67d7c4895d92ab2c8327828551caae31c061472 [14/16] PM wip
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
compiler: sparc64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a67d7c4895d92ab2c8327828551caae31c061472
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/opp/core.c:2625:27: warning: Parameter 'src_opp' can be declared=
 with const [constParameter]
          struct dev_pm_opp *src_opp)
                             ^
   drivers/opp/core.c:60:26: warning: Uninitialized variables: opp_table.no=
de, opp_table.lazy, opp_table.head, opp_table.dev_list, opp_table.opp_list,=
 opp_table.kref, opp_table.lock, opp_table.np, opp_table.clock_latency_ns_m=
ax, opp_table.voltage_tolerance_v1, opp_table.parsed_static_opps, opp_table=
.shared_opp, opp_table.version, opp_table.current_rate, opp_table.current_o=
pp, opp_table.suspend_opp, opp_table.genpd_virt_dev_lock, opp_table.genpd_v=
irt_devs, opp_table.required_opp_tables, opp_table.required_opp_count, opp_=
table.supported_hw, opp_table.supported_hw_count, opp_table.prop_name, opp_=
table.clks, opp_table.clk_count, opp_table.regulators, opp_table.regulator_=
count, opp_table.paths, opp_table.path_count, opp_table.enabled, opp_table.=
genpd_performance_state, opp_table.is_genpd, opp_table.set_opp, opp_table.s=
od_supplies, opp_table.set_opp_data [uninitvar]
     if (_find_opp_dev(dev, opp_table)) {
                            ^
   drivers/opp/core.c:380:12: warning: Uninitialized variable: opp->availab=
le [uninitvar]
     if (opp->available)
              ^
   drivers/opp/core.c:457:17: warning: Uninitialized variable: temp_opp->av=
ailable [uninitvar]
     if (temp_opp->available =3D=3D available &&
                   ^
   drivers/opp/core.c:447:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:457:17: note: Uninitialized variable: temp_opp->avail=
able
     if (temp_opp->available =3D=3D available &&
                   ^
   drivers/opp/core.c:506:17: warning: Uninitialized variable: temp_opp->le=
vel [uninitvar]
     if (temp_opp->level =3D=3D level) {
                   ^
   drivers/opp/core.c:496:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:506:17: note: Uninitialized variable: temp_opp->level
     if (temp_opp->level =3D=3D level) {
                   ^
   drivers/opp/core.c:554:17: warning: Uninitialized variable: temp_opp->av=
ailable [uninitvar]
     if (temp_opp->available && temp_opp->level >=3D *level) {
                   ^
   drivers/opp/core.c:544:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:554:17: note: Uninitialized variable: temp_opp->avail=
able
     if (temp_opp->available && temp_opp->level >=3D *level) {
                   ^
   drivers/opp/core.c:579:17: warning: Uninitialized variable: temp_opp->av=
ailable [uninitvar]
     if (temp_opp->available && temp_opp->rate >=3D *freq) {
                   ^
   drivers/opp/core.c:1558:12: warning: Uninitialized variable: opp->rate [=
uninitvar]
     if (opp->rate =3D=3D freq) {
              ^
   drivers/opp/core.c:1552:12: note: Assuming condition is false
    if (IS_ERR(opp_table))
              ^
   drivers/opp/core.c:1558:12: note: Uninitialized variable: opp->rate
     if (opp->rate =3D=3D freq) {
              ^
   drivers/opp/core.c:1592:14: warning: Uninitialized variable: temp->remov=
ed [uninitvar]
     if (!temp->removed && dynamic =3D=3D temp->dynamic) {
                ^
>> drivers/opp/core.c:1740:39: warning: Uninitialized variables: opp.node, =
opp.kref, opp.available, opp.dynamic, opp.turbo, opp.suspend, opp.removed, =
opp.pstate, opp.rate, opp.level, opp.rates, opp.supplies, opp.bandwidth, op=
p.clock_latency_ns, opp.required_opps, opp.opp_table, opp.np [uninitvar]
     opp_cmp =3D _opp_compare_key(new_opp, opp);
                                         ^
   drivers/opp/core.c:2798:16: warning: Uninitialized variable: tmp_opp->ra=
te [uninitvar]
     if (tmp_opp->rate =3D=3D freq) {
                  ^
   drivers/opp/core.c:2788:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:2798:16: note: Uninitialized variable: tmp_opp->rate
     if (tmp_opp->rate =3D=3D freq) {
                  ^
   drivers/opp/core.c:2869:16: warning: Uninitialized variable: tmp_opp->ra=
te [uninitvar]
     if (tmp_opp->rate =3D=3D freq) {
                  ^
   drivers/opp/core.c:2859:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:2869:16: note: Uninitialized variable: tmp_opp->rate
     if (tmp_opp->rate =3D=3D freq) {
                  ^
   drivers/opp/core.c:60:26: warning: Uninitialized variables: opp_table.no=
de, opp_table.lazy, opp_table.head, opp_table.dev_list, opp_table.opp_list,=
 opp_table.kref, opp_table.lock, opp_table.np, opp_table.clock_latency_ns_m=
ax, opp_table.voltage_tolerance_v1, opp_table.parsed_static_opps, opp_table=
.shared_opp, opp_table.version, opp_table.current_rate, opp_table.current_o=
pp, opp_table.suspend_opp, opp_table.genpd_virt_dev_lock, opp_table.genpd_v=
irt_devs, opp_table.required_opp_tables, opp_table.required_opp_count, opp_=
table.supported_hw, opp_table.supported_hw_count, opp_table.prop_name, opp_=
table.clks, opp_table.clk_count, opp_table.regulators, opp_table.regulator_=
count, opp_table.paths, opp_table.path_count, opp_table.enabled, opp_table.=
genpd_performance_state, opp_table.is_genpd, opp_table.set_opp, opp_table.s=
od_supplies, opp_table.set_opp_data, opp_table.dentry [uninitvar]
     if (_find_opp_dev(dev, opp_table)) {
                            ^
   drivers/opp/core.c:1740:39: warning: Uninitialized variables: opp.node, =
opp.kref, opp.available, opp.dynamic, opp.turbo, opp.suspend, opp.removed, =
opp.pstate, opp.rate, opp.level, opp.rates, opp.supplies, opp.bandwidth, op=
p.clock_latency_ns, opp.required_opps, opp.opp_table, opp.np, opp.dentry, o=
pp.of_name [uninitvar]
     opp_cmp =3D _opp_compare_key(new_opp, opp);
                                         ^

vim +1740 drivers/opp/core.c

6c591eec67cbb4d drivers/opp/core.c            Saravana Kannan 2020-05-12  1=
723  =

a1e8c13600bfd96 drivers/opp/core.c            Viresh Kumar    2018-04-06  1=
724  static int _opp_is_duplicate(struct device *dev, struct dev_pm_opp *ne=
w_opp,
a1e8c13600bfd96 drivers/opp/core.c            Viresh Kumar    2018-04-06  1=
725  			     struct opp_table *opp_table,
a1e8c13600bfd96 drivers/opp/core.c            Viresh Kumar    2018-04-06  1=
726  			     struct list_head **head)
23dacf6d2e99355 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
727  {
23dacf6d2e99355 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
728  	struct dev_pm_opp *opp;
6c591eec67cbb4d drivers/opp/core.c            Saravana Kannan 2020-05-12  1=
729  	int opp_cmp;
23dacf6d2e99355 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
730  =

23dacf6d2e99355 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
731  	/*
23dacf6d2e99355 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
732  	 * Insert new OPP in order of increasing frequency and discard if
23dacf6d2e99355 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
733  	 * already present.
23dacf6d2e99355 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
734  	 *
2c2709dc6921c5d drivers/base/power/opp/core.c Viresh Kumar    2016-02-16  1=
735  	 * Need to use &opp_table->opp_list in the condition part of the 'for'
23dacf6d2e99355 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
736  	 * loop, don't replace it with head otherwise it will become an infin=
ite
23dacf6d2e99355 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
737  	 * loop.
23dacf6d2e99355 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
738  	 */
052c6f19141dd13 drivers/base/power/opp/core.c Viresh Kumar    2017-01-23  1=
739  	list_for_each_entry(opp, &opp_table->opp_list, node) {
6c591eec67cbb4d drivers/opp/core.c            Saravana Kannan 2020-05-12 @1=
740  		opp_cmp =3D _opp_compare_key(new_opp, opp);
6c591eec67cbb4d drivers/opp/core.c            Saravana Kannan 2020-05-12  1=
741  		if (opp_cmp > 0) {
a1e8c13600bfd96 drivers/opp/core.c            Viresh Kumar    2018-04-06  1=
742  			*head =3D &opp->node;
23dacf6d2e99355 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
743  			continue;
23dacf6d2e99355 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
744  		}
23dacf6d2e99355 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
745  =

6c591eec67cbb4d drivers/opp/core.c            Saravana Kannan 2020-05-12  1=
746  		if (opp_cmp < 0)
a1e8c13600bfd96 drivers/opp/core.c            Viresh Kumar    2018-04-06  1=
747  			return 0;
23dacf6d2e99355 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
748  =

23dacf6d2e99355 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
749  		/* Duplicate OPPs */
064416586190cb0 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
750  		dev_warn(dev, "%s: duplicate OPPs detected. Existing: freq: %lu, vol=
t: %lu, enabled: %d. New: freq: %lu, volt: %lu, enabled: %d\n",
dfbe4678d709e25 drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  1=
751  			 __func__, opp->rate, opp->supplies[0].u_volt,
dfbe4678d709e25 drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  1=
752  			 opp->available, new_opp->rate,
dfbe4678d709e25 drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  1=
753  			 new_opp->supplies[0].u_volt, new_opp->available);
23dacf6d2e99355 drivers/base/power/opp.c      Viresh Kumar    2015-07-29  1=
754  =

dfbe4678d709e25 drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  1=
755  		/* Should we compare voltages for all regulators here ? */
a1e8c13600bfd96 drivers/opp/core.c            Viresh Kumar    2018-04-06  1=
756  		return opp->available &&
7f8538ebaefc075 drivers/base/power/opp/core.c Viresh Kumar    2017-01-02  1=
757  		       new_opp->supplies[0].u_volt =3D=3D opp->supplies[0].u_volt ? =
-EBUSY : -EEXIST;
a1e8c13600bfd96 drivers/opp/core.c            Viresh Kumar    2018-04-06  1=
758  	}
a1e8c13600bfd96 drivers/opp/core.c            Viresh Kumar    2018-04-06  1=
759  =

a1e8c13600bfd96 drivers/opp/core.c            Viresh Kumar    2018-04-06  1=
760  	return 0;
a1e8c13600bfd96 drivers/opp/core.c            Viresh Kumar    2018-04-06  1=
761  }
a1e8c13600bfd96 drivers/opp/core.c            Viresh Kumar    2018-04-06  1=
762  =


:::::: The code at line 1740 was first introduced by commit
:::::: 6c591eec67cbb4db988ab35b944f5cf9013c0714 OPP: Add helpers for readin=
g the binding properties

:::::: TO: Saravana Kannan <saravanak@google.com>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7608712692069727320==--

