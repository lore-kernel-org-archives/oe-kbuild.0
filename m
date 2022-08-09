Content-Type: multipart/mixed; boundary="===============4442938243831364265=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/opp/core.c:901:23: warning: Parameter 'regulators' can be declared with const [constParameter]
Date: Wed, 10 Aug 2022 07:21:18 +0800
Message-ID: <202208100737.D6o6BhWR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4442938243831364265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/o=
pp/core.c:901:23: warning: Parameter 'regulators' can be declared with cons=
t [constParameter]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   15205c2829ca2cbb5ece5ceaafe1171a8470e62b
commit: c522ce8a08066b44539e0dd0998b8e3b277a759b OPP: Make _generic_set_opp=
_regulator() a config_regulators() interface
date:   5 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 weeks ago
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c522ce8a08066b44539e0dd0998b8e3b277a759b
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/opp/core.c:901:23: warning: Parameter 'regulators' can be declar=
ed with const [constParameter]
      struct regulator **regulators, unsigned int count)
                         ^
   drivers/opp/core.c:2636:27: warning: Parameter 'src_opp' can be declared=
 with const [constParameter]
          struct dev_pm_opp *src_opp)
                             ^
   drivers/opp/core.c:64:26: warning: Uninitialized variables: opp_table.no=
de, opp_table.lazy, opp_table.head, opp_table.dev_list, opp_table.opp_list,=
 opp_table.kref, opp_table.lock, opp_table.np, opp_table.clock_latency_ns_m=
ax, opp_table.voltage_tolerance_v1, opp_table.parsed_static_opps, opp_table=
.shared_opp, opp_table.current_rate, opp_table.current_opp, opp_table.suspe=
nd_opp, opp_table.genpd_virt_dev_lock, opp_table.genpd_virt_devs, opp_table=
.required_opp_tables, opp_table.required_opp_count, opp_table.supported_hw,=
 opp_table.supported_hw_count, opp_table.prop_name, opp_table.clk_configure=
d, opp_table.clk, opp_table.config_regulators, opp_table.regulators, opp_ta=
ble.regulator_count, opp_table.paths, opp_table.path_count, opp_table.enabl=
ed, opp_table.genpd_performance_state, opp_table.is_genpd, opp_table.set_op=
p, opp_table.sod_supplies, opp_table.set_opp_data [uninitvar]
     if (_find_opp_dev(dev, opp_table)) {
                            ^
   drivers/opp/core.c:369:12: warning: Uninitialized variable: opp->availab=
le [uninitvar]
     if (opp->available)
              ^
   drivers/opp/core.c:446:17: warning: Uninitialized variable: temp_opp->av=
ailable [uninitvar]
     if (temp_opp->available =3D=3D available &&
                   ^
   drivers/opp/core.c:436:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:446:17: note: Uninitialized variable: temp_opp->avail=
able
     if (temp_opp->available =3D=3D available &&
                   ^
   drivers/opp/core.c:471:17: warning: Uninitialized variable: temp_opp->av=
ailable [uninitvar]
     if (temp_opp->available && temp_opp->rate >=3D *freq) {
                   ^
   drivers/opp/core.c:671:17: warning: Uninitialized variable: temp_opp->le=
vel [uninitvar]
     if (temp_opp->level =3D=3D level) {
                   ^
   drivers/opp/core.c:661:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:671:17: note: Uninitialized variable: temp_opp->level
     if (temp_opp->level =3D=3D level) {
                   ^
   drivers/opp/core.c:719:17: warning: Uninitialized variable: temp_opp->av=
ailable [uninitvar]
     if (temp_opp->available && temp_opp->level >=3D *level) {
                   ^
   drivers/opp/core.c:709:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:719:17: note: Uninitialized variable: temp_opp->avail=
able
     if (temp_opp->available && temp_opp->level >=3D *level) {
                   ^
   drivers/opp/core.c:1614:13: warning: Uninitialized variable: iter->rate =
[uninitvar]
     if (iter->rate =3D=3D freq) {
               ^
   drivers/opp/core.c:1608:12: note: Assuming condition is false
    if (IS_ERR(opp_table))
              ^
   drivers/opp/core.c:1614:13: note: Uninitialized variable: iter->rate
     if (iter->rate =3D=3D freq) {
               ^
   drivers/opp/core.c:1648:14: warning: Uninitialized variable: temp->remov=
ed [uninitvar]
     if (!temp->removed && dynamic =3D=3D temp->dynamic) {
                ^
   drivers/opp/core.c:1796:39: warning: Uninitialized variables: opp.node, =
opp.kref, opp.available, opp.dynamic, opp.turbo, opp.suspend, opp.removed, =
opp.pstate, opp.rate, opp.level, opp.supplies, opp.bandwidth, opp.clock_lat=
ency_ns, opp.required_opps, opp.opp_table, opp.np [uninitvar]
     opp_cmp =3D _opp_compare_key(new_opp, opp);
                                         ^
   drivers/opp/core.c:2808:16: warning: Uninitialized variable: tmp_opp->ra=
te [uninitvar]
     if (tmp_opp->rate =3D=3D freq) {
                  ^
   drivers/opp/core.c:2798:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:2808:16: note: Uninitialized variable: tmp_opp->rate
     if (tmp_opp->rate =3D=3D freq) {
                  ^
   drivers/opp/core.c:2879:16: warning: Uninitialized variable: tmp_opp->ra=
te [uninitvar]
     if (tmp_opp->rate =3D=3D freq) {
                  ^
   drivers/opp/core.c:2869:12: note: Assuming condition is false
    if (IS_ERR(opp_table)) {
              ^
   drivers/opp/core.c:2879:16: note: Uninitialized variable: tmp_opp->rate
     if (tmp_opp->rate =3D=3D freq) {
                  ^
   drivers/opp/core.c:64:26: warning: Uninitialized variables: opp_table.no=
de, opp_table.lazy, opp_table.head, opp_table.dev_list, opp_table.opp_list,=
 opp_table.kref, opp_table.lock, opp_table.np, opp_table.clock_latency_ns_m=
ax, opp_table.voltage_tolerance_v1, opp_table.parsed_static_opps, opp_table=
.shared_opp, opp_table.current_rate, opp_table.current_opp, opp_table.suspe=
nd_opp, opp_table.genpd_virt_dev_lock, opp_table.genpd_virt_devs, opp_table=
.required_opp_tables, opp_table.required_opp_count, opp_table.supported_hw,=
 opp_table.supported_hw_count, opp_table.prop_name, opp_table.clk_configure=
d, opp_table.clk, opp_table.config_regulators, opp_table.regulators, opp_ta=
ble.regulator_count, opp_table.paths, opp_table.path_count, opp_table.enabl=
ed, opp_table.genpd_performance_state, opp_table.is_genpd, opp_table.set_op=
p, opp_table.sod_supplies, opp_table.set_opp_data, opp_table.dentry [uninit=
var]
     if (_find_opp_dev(dev, opp_table)) {
                            ^
   drivers/opp/core.c:1796:39: warning: Uninitialized variables: opp.node, =
opp.kref, opp.available, opp.dynamic, opp.turbo, opp.suspend, opp.removed, =
opp.pstate, opp.rate, opp.level, opp.supplies, opp.bandwidth, opp.clock_lat=
ency_ns, opp.required_opps, opp.opp_table, opp.np, opp.dentry, opp.of_name =
[uninitvar]
     opp_cmp =3D _opp_compare_key(new_opp, opp);
                                         ^

vim +/regulators +901 drivers/opp/core.c

947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  89=
8  =

c522ce8a08066b drivers/opp/core.c            Viresh Kumar    2022-05-31  89=
9  static int _opp_config_regulator_single(struct device *dev,
c522ce8a08066b drivers/opp/core.c            Viresh Kumar    2022-05-31  90=
0  			struct dev_pm_opp *old_opp, struct dev_pm_opp *new_opp,
c522ce8a08066b drivers/opp/core.c            Viresh Kumar    2022-05-31 @90=
1  			struct regulator **regulators, unsigned int count)
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  90=
2  {
c522ce8a08066b drivers/opp/core.c            Viresh Kumar    2022-05-31  90=
3  	struct regulator *reg =3D regulators[0];
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  90=
4  	int ret;
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  90=
5  =

947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  90=
6  	/* This function only supports single regulator per device */
c522ce8a08066b drivers/opp/core.c            Viresh Kumar    2022-05-31  90=
7  	if (WARN_ON(count > 1)) {
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  90=
8  		dev_err(dev, "multiple regulators are not supported\n");
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  90=
9  		return -EINVAL;
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  91=
0  	}
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  91=
1  =

c522ce8a08066b drivers/opp/core.c            Viresh Kumar    2022-05-31  91=
2  	ret =3D _set_opp_voltage(dev, reg, new_opp->supplies);
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  91=
3  	if (ret)
c522ce8a08066b drivers/opp/core.c            Viresh Kumar    2022-05-31  91=
4  		return ret;
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  91=
5  =

8d45719caaf56c drivers/opp/core.c            Kamil Konieczny 2019-07-19  91=
6  	/*
8d45719caaf56c drivers/opp/core.c            Kamil Konieczny 2019-07-19  91=
7  	 * Enable the regulator after setting its voltages, otherwise it breaks
8d45719caaf56c drivers/opp/core.c            Kamil Konieczny 2019-07-19  91=
8  	 * some boot-enabled regulators.
8d45719caaf56c drivers/opp/core.c            Kamil Konieczny 2019-07-19  91=
9  	 */
c522ce8a08066b drivers/opp/core.c            Viresh Kumar    2022-05-31  92=
0  	if (unlikely(!new_opp->opp_table->enabled)) {
8d45719caaf56c drivers/opp/core.c            Kamil Konieczny 2019-07-19  92=
1  		ret =3D regulator_enable(reg);
8d45719caaf56c drivers/opp/core.c            Kamil Konieczny 2019-07-19  92=
2  		if (ret < 0)
8d45719caaf56c drivers/opp/core.c            Kamil Konieczny 2019-07-19  92=
3  			dev_warn(dev, "Failed to enable regulator: %d", ret);
8d45719caaf56c drivers/opp/core.c            Kamil Konieczny 2019-07-19  92=
4  	}
8d45719caaf56c drivers/opp/core.c            Kamil Konieczny 2019-07-19  92=
5  =

947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  92=
6  	return 0;
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  92=
7  }
947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar    2016-12-01  92=
8  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4442938243831364265==--

