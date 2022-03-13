Content-Type: multipart/mixed; boundary="===============8423059520159771447=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/regulator/ti-abb-regulator.c:485:15: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Sun, 13 Mar 2022 17:48:35 +0800
Message-ID: <202203131744.ts0cBsdO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8423059520159771447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cai Huoqing <caihuoqing@baidu.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aad611a868d16cdc16a7d4a764cef955293e47e3
commit: b36061c2ea5bdacf51305f8bc79f29595b343eb6 regulator: ti-abb: Kconfig=
: Add helper dependency on COMPILE_TEST
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220312 (https://download.01.org/0day-ci/archi=
ve/20220313/202203131744.ts0cBsdO-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db36061c2ea5bdacf51305f8bc79f29595b343eb6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b36061c2ea5bdacf51305f8bc79f29595b343eb6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   net/sched/sch_qfq.c:1116:14: note: Assuming field 'qlen' is not equal to=
 0
                   } else if (sch->q.qlen =3D=3D 0) { /* no aggregate to se=
rve */
                              ^~~~~~~~~~~~~~~~
   net/sched/sch_qfq.c:1116:10: note: Taking false branch
                   } else if (sch->q.qlen =3D=3D 0) { /* no aggregate to se=
rve */
                          ^
   net/sched/sch_qfq.c:1125:3: note: Null pointer value stored to 'in_serv_=
agg'
                   in_serv_agg =3D q->in_serv_agg =3D qfq_choose_next_agg(q=
);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_qfq.c:1126:22: note: Passing null pointer value via 1st pa=
rameter 'agg'
                   skb =3D qfq_peek_skb(in_serv_agg, &cl, &len);
                                      ^~~~~~~~~~~
   net/sched/sch_qfq.c:1126:9: note: Calling 'qfq_peek_skb'
                   skb =3D qfq_peek_skb(in_serv_agg, &cl, &len);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_qfq.c:994:8: note: Access to field 'next' results in a der=
eference of a null pointer
           *cl =3D list_first_entry(&agg->active, struct qfq_class, alist);
                 ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   net/sched/sch_qfq.c:1140:15: warning: Access to field 'budget' results i=
n a dereference of a null pointer (loaded from variable 'in_serv_agg') [cla=
ng-analyzer-core.NullDereference]
           if (unlikely(in_serv_agg->budget < len))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/sched/sch_qfq.c:1085:6: note: Assuming 'in_serv_agg' is not equal to=
 NULL
           if (in_serv_agg =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~
   net/sched/sch_qfq.c:1085:2: note: Taking false branch
           if (in_serv_agg =3D=3D NULL)
           ^
   net/sched/sch_qfq.c:1088:6: note: Assuming the condition is false
           if (!list_empty(&in_serv_agg->active))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_qfq.c:1088:2: note: Taking false branch
           if (!list_empty(&in_serv_agg->active))
           ^
   net/sched/sch_qfq.c:1096:6: note: 'len' is equal to 0
           if (len =3D=3D 0 || in_serv_agg->budget < len) {
               ^~~
   net/sched/sch_qfq.c:1096:15: note: Left side of '||' is true
           if (len =3D=3D 0 || in_serv_agg->budget < len) {
                        ^
   net/sched/sch_qfq.c:1103:7: note: Assuming the condition is true
                   if (!list_empty(&in_serv_agg->active)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_qfq.c:1103:3: note: Taking true branch
                   if (!list_empty(&in_serv_agg->active)) {
                   ^
   net/sched/sch_qfq.c:1125:3: note: Null pointer value stored to 'in_serv_=
agg'
                   in_serv_agg =3D q->in_serv_agg =3D qfq_choose_next_agg(q=
);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_qfq.c:1128:6: note: Assuming 'skb' is non-null
           if (!skb)
               ^~~~
   net/sched/sch_qfq.c:1128:2: note: Taking false branch
           if (!skb)
           ^
   net/sched/sch_qfq.c:1140:15: note: Access to field 'budget' results in a=
 dereference of a null pointer (loaded from variable 'in_serv_agg')
           if (unlikely(in_serv_agg->budget < len))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/regulator/ti-abb-regulator.c:485:15: warning: Division by zero [=
clang-analyzer-core.DivideZero]
           cycle_rate =3D DIV_ROUND_CLOSEST(clock_cycles * 10, clk_rate);
                        ^
   include/linux/math.h:92:26: note: expanded from macro 'DIV_ROUND_CLOSEST'
                   (((__x) + ((__d) / 2)) / (__d)) :       \
                    ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/regulator/ti-abb-regulator.c:427:8: note: Calling 'of_property_r=
ead_u32'
           ret =3D of_property_read_u32(dev->of_node, pname, &abb->settling=
_time);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/of.h:1256:9: note: Calling 'of_property_read_u32_array'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:504:12: note: Value assigned to field 'settling_time'=
, which participates in a condition later
           int ret =3D of_property_read_variable_u32_array(np, propname, ou=
t_values,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/of.h:506:6: note: Assuming 'ret' is >=3D 0
           if (ret >=3D 0)
               ^~~~~~~~
   include/linux/of.h:506:2: note: Taking true branch
           if (ret >=3D 0)
           ^
   include/linux/of.h:507:3: note: Returning zero, which participates in a =
condition later
                   return 0;
                   ^~~~~~~~
   include/linux/of.h:1256:9: note: Returning from 'of_property_read_u32_ar=
ray'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1256:2: note: Returning zero, which participates in a=
 condition later
           return of_property_read_u32_array(np, propname, out_value, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/ti-abb-regulator.c:427:8: note: Returning from 'of_pro=
perty_read_u32'
           ret =3D of_property_read_u32(dev->of_node, pname, &abb->settling=
_time);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/regulator/ti-abb-regulator.c:428:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/regulator/ti-abb-regulator.c:428:2: note: Taking false branch
           if (ret) {
           ^
   drivers/regulator/ti-abb-regulator.c:434:6: note: Assuming field 'settli=
ng_time' is not equal to 0
           if (!abb->settling_time) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/regulator/ti-abb-regulator.c:434:2: note: Taking false branch
           if (!abb->settling_time) {
           ^
   drivers/regulator/ti-abb-regulator.c:440:8: note: Calling 'of_property_r=
ead_u32'
           ret =3D of_property_read_u32(dev->of_node, pname, &clock_cycles);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1256:9: note: Calling 'of_property_read_u32_array'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:504:12: note: Value assigned to 'clock_cycles', which=
 participates in a condition later
           int ret =3D of_property_read_variable_u32_array(np, propname, ou=
t_values,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/of.h:506:6: note: Assuming 'ret' is >=3D 0
           if (ret >=3D 0)
               ^~~~~~~~
   include/linux/of.h:506:2: note: Taking true branch
           if (ret >=3D 0)
           ^
   include/linux/of.h:507:3: note: Returning zero, which participates in a =
condition later
                   return 0;
                   ^~~~~~~~
   include/linux/of.h:1256:9: note: Returning from 'of_property_read_u32_ar=
ray'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1256:2: note: Returning zero, which participates in a=
 condition later
           return of_property_read_u32_array(np, propname, out_value, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/ti-abb-regulator.c:440:8: note: Returning from 'of_pro=
perty_read_u32'
           ret =3D of_property_read_u32(dev->of_node, pname, &clock_cycles);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/ti-abb-regulator.c:441:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/regulator/ti-abb-regulator.c:441:2: note: Taking false branch
           if (ret) {
           ^
   drivers/regulator/ti-abb-regulator.c:446:6: note: Assuming 'clock_cycles=
' is not equal to 0
           if (!clock_cycles) {
               ^~~~~~~~~~~~~
   drivers/regulator/ti-abb-regulator.c:446:2: note: Taking false branch
           if (!clock_cycles) {
           ^
   drivers/regulator/ti-abb-regulator.c:452:6: note: Calling 'IS_ERR'
           if (IS_ERR(abb->clk)) {
               ^~~~~~~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/ti-abb-regulator.c:452:6: note: Returning from 'IS_ERR'
           if (IS_ERR(abb->clk)) {
               ^~~~~~~~~~~~~~~~
   drivers/regulator/ti-abb-regulator.c:452:2: note: Taking false branch
           if (IS_ERR(abb->clk)) {
           ^
   drivers/regulator/ti-abb-regulator.c:482:13: note: Left side of '||' is =
true
           clk_rate =3D DIV_ROUND_CLOSEST(clk_get_rate(abb->clk), 1000000);
                      ^
   include/linux/math.h:89:23: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \

vim +485 drivers/regulator/ti-abb-regulator.c

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  410  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  411  /**
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  412   * ti_abb_init_timings()=
 - setup ABB clock timing for the current platform
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  413   * @dev:	device
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  414   * @abb:	pointer to the =
abb instance
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  415   *
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  416   * Return: 0 if timing i=
s updated, else returns error result.
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  417   */
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  418  static int ti_abb_init_t=
imings(struct device *dev, struct ti_abb *abb)
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  419  {
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  420  	u32 clock_cycles;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  421  	u32 clk_rate, sr2_wt_cn=
t_val, cycle_rate;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  422  	const struct ti_abb_reg=
 *regs =3D abb->regs;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  423  	int ret;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  424  	char *pname =3D "ti,set=
tling-time";
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  425  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  426  	/* read device tree pro=
perties */
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  427  	ret =3D of_property_rea=
d_u32(dev->of_node, pname, &abb->settling_time);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  428  	if (ret) {
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  429  		dev_err(dev, "Unable t=
o get property '%s'(%d)\n", pname, ret);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  430  		return ret;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  431  	}
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  432  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  433  	/* ABB LDO cannot be se=
ttle in 0 time */
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  434  	if (!abb->settling_time=
) {
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  435  		dev_err(dev, "Invalid =
property:'%s' set as 0!\n", pname);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  436  		return -EINVAL;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  437  	}
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  438  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  439  	pname =3D "ti,clock-cyc=
les";
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  440  	ret =3D of_property_rea=
d_u32(dev->of_node, pname, &clock_cycles);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  441  	if (ret) {
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  442  		dev_err(dev, "Unable t=
o get property '%s'(%d)\n", pname, ret);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  443  		return ret;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  444  	}
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  445  	/* ABB LDO cannot be se=
ttle in 0 clock cycles */
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  446  	if (!clock_cycles) {
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  447  		dev_err(dev, "Invalid =
property:'%s' set as 0!\n", pname);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  448  		return -EINVAL;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  449  	}
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  450  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  451  	abb->clk =3D devm_clk_g=
et(dev, NULL);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  452  	if (IS_ERR(abb->clk)) {
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  453  		ret =3D PTR_ERR(abb->c=
lk);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  454  		dev_err(dev, "%s: Unab=
le to get clk(%d)\n", __func__, ret);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  455  		return ret;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  456  	}
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  457  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  458  	/*
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  459  	 * SR2_WTCNT_VALUE is t=
he settling time for the ABB ldo after a
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  460  	 * transition and must =
be programmed with the correct time at boot.
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  461  	 * The value programmed=
 into the register is the number of SYS_CLK
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  462  	 * clock cycles that ma=
tch a given wall time profiled for the ldo.
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  463  	 * This value depends o=
n:
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  464  	 * settling time of ldo=
 in micro-seconds (varies per OMAP family)
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  465  	 * # of clock cycles pe=
r SYS_CLK period (varies per OMAP family)
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  466  	 * the SYS_CLK frequenc=
y in MHz (varies per board)
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  467  	 * The formula is:
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  468  	 *
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  469  	 *                     =
 ldo settling time (in micro-seconds)
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  470  	 * SR2_WTCNT_VALUE =3D =
------------------------------------------
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  471  	 *                   (#=
 system clock cycles) * (sys_clk period)
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  472  	 *
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  473  	 * Put another way:
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  474  	 *
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  475  	 * SR2_WTCNT_VALUE =3D =
settling time / (# SYS_CLK cycles / SYS_CLK rate))
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  476  	 *
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  477  	 * To avoid dividing by=
 zero multiply both "# clock cycles" and
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  478  	 * "settling time" by 1=
0 such that the final result is the one we want.
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  479  	 */
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  480  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  481  	/* Convert SYS_CLK rate=
 to MHz & prevent divide by zero */
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  482  	clk_rate =3D DIV_ROUND_=
CLOSEST(clk_get_rate(abb->clk), 1000000);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  483  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  484  	/* Calculate cycle rate=
 */
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02 @485  	cycle_rate =3D DIV_ROUN=
D_CLOSEST(clock_cycles * 10, clk_rate);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  486  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  487  	/* Calulate SR2_WTCNT_V=
ALUE */
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  488  	sr2_wt_cnt_val =3D DIV_=
ROUND_CLOSEST(abb->settling_time * 10, cycle_rate);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  489  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  490  	dev_dbg(dev, "%s: Clk_r=
ate=3D%ld, sr2_cnt=3D0x%08x\n", __func__,
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  491  		clk_get_rate(abb->clk)=
, sr2_wt_cnt_val);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  492  =

6127daa85094e2 Nishanth Menon     2014-01-23  493  	ti_abb_rmw(regs->sr2_wt=
cnt_value_mask, sr2_wt_cnt_val, abb->setup_reg);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  494  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  495  	return 0;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  496  }
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  497  =


:::::: The code at line 485 was first introduced by commit
:::::: 40b1936efebdb9c31d9ed6fe59055f71ea366509 regulator: Introduce TI Ada=
ptive Body Bias(ABB) on-chip LDO driver

:::::: TO: Andrii.Tseglytskyi <andrii.tseglytskyi@ti.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8423059520159771447==--

