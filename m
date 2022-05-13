Content-Type: multipart/mixed; boundary="===============1974062250136846550=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 22/28] clk: Stop forwarding clk_rate_requests to the parent
Date: Fri, 13 May 2022 20:04:36 +0800
Message-ID: <202205131941.J8EMbNIW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1974062250136846550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220512160412.1317123-23-maxime@cerno.tech>
References: <20220512160412.1317123-23-maxime@cerno.tech>
TO: Maxime Ripard <maxime@cerno.tech>
TO: Mike Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: linux-clk(a)vger.kernel.org
CC: Naresh Kamboju <naresh.kamboju@linaro.org>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Jerome Brunet <jbrunet@baylibre.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Marek Szyprowski <m.szyprowski@samsung.com>
CC: Yassine Oudjana <y.oudjana@protonmail.com>
CC: Tony Lindgren <tony@atomide.com>
CC: Neil Armstrong <narmstrong@baylibre.com>
CC: Maxime Ripard <maxime@cerno.tech>

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v5.18-rc6 next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/clk-Mo=
re-clock-rate-fixes-and-tests/20220513-001815
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: riscv-randconfig-c006-20220512 (https://download.01.org/0day-ci/arc=
hive/20220513/202205131941.J8EMbNIW-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9519da=
cab7b8afd537811fc2abaceb4d14f4e16a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/2034099e179a2af8cd5=
752935973b61236748c0c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-More-clock-rate-=
fixes-and-tests/20220513-001815
        git checkout 2034099e179a2af8cd5752935973b61236748c0c
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                             ^
   drivers/clk/clk.c:1607:6: note: Assuming 'clk' is non-null
           if (!clk)
               ^~~~
   drivers/clk/clk.c:1607:2: note: Taking false branch
           if (!clk)
           ^
   drivers/clk/clk.c:1612:6: note: Assuming field 'exclusive_count' is 0
           if (clk->exclusive_count)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1612:2: note: Taking false branch
           if (clk->exclusive_count)
           ^
   drivers/clk/clk.c:1617:8: note: Calling 'clk_core_round_rate_nolock'
           ret =3D clk_core_round_rate_nolock(clk->core, &req);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1517:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&prepare_lock);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:310:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/clk/clk.c:1517:2: note: Left side of '&&' is false
           lockdep_assert_held(&prepare_lock);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   drivers/clk/clk.c:1517:2: note: Loop condition is false.  Exiting loop
           lockdep_assert_held(&prepare_lock);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   drivers/clk/clk.c:1519:7: note: 'core' is non-null
           if (!core) {
                ^~~~
   drivers/clk/clk.c:1519:2: note: Taking false branch
           if (!core) {
           ^
   drivers/clk/clk.c:1524:6: note: Assuming the condition is false
           if (clk_core_can_round(core))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1524:2: note: Taking false branch
           if (clk_core_can_round(core))
           ^
   drivers/clk/clk.c:1527:6: note: Assuming the condition is true
           if (core->flags & CLK_SET_RATE_PARENT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1527:2: note: Taking true branch
           if (core->flags & CLK_SET_RATE_PARENT) {
           ^
   drivers/clk/clk.c:1530:3: note: Calling 'clk_core_forward_rate_req'
                   clk_core_forward_rate_req(core, req, core->parent, &pare=
nt_req, req->rate);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:573:14: note: Assuming the condition is false
           if (WARN_ON(!clk_core_has_parent(core, parent)))
                       ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/clk/clk.c:573:2: note: Taking false branch
           if (WARN_ON(!clk_core_has_parent(core, parent)))
           ^
   drivers/clk/clk.c:576:2: note: Calling 'clk_core_init_rate_req'
           clk_core_init_rate_req(parent, req, parent_rate);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1446:15: note: 'core' is null
           if (WARN_ON(!core || !req))
                        ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/clk/clk.c:1446:20: note: Left side of '||' is true
           if (WARN_ON(!core || !req))
                             ^
   drivers/clk/clk.c:1446:2: note: Taking true branch
           if (WARN_ON(!core || !req))
           ^
   drivers/clk/clk.c:1447:3: note: Returning without writing to 'req->min_r=
ate'
                   return;
                   ^
   drivers/clk/clk.c:576:2: note: Returning from 'clk_core_init_rate_req'
           clk_core_init_rate_req(parent, req, parent_rate);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:578:20: note: The left operand of '<' is a garbage val=
ue
           if (req->min_rate < old_req->min_rate)
               ~~~~~~~~~~~~~ ^
>> drivers/clk/clk.c:1410:6: warning: Branch condition evaluates to a garba=
ge value [clang-analyzer-core.uninitialized.Branch]
           if (!req->min_rate && !req->max_rate)
               ^
   drivers/clk/clk.c:1607:6: note: Assuming 'clk' is non-null
           if (!clk)
               ^~~~
   drivers/clk/clk.c:1607:2: note: Taking false branch
           if (!clk)
           ^
   drivers/clk/clk.c:1612:6: note: Assuming field 'exclusive_count' is 0
           if (clk->exclusive_count)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1612:2: note: Taking false branch
           if (clk->exclusive_count)
           ^
   drivers/clk/clk.c:1615:2: note: Calling 'clk_core_init_rate_req'
           clk_core_init_rate_req(clk->core, &req, rate);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1446:14: note: Assuming 'core' is non-null
           if (WARN_ON(!core || !req))
                       ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/clk/clk.c:1446:14: note: Left side of '||' is false
           if (WARN_ON(!core || !req))
                       ^
   drivers/clk/clk.c:1446:2: note: Taking false branch
           if (WARN_ON(!core || !req))
           ^
   drivers/clk/clk.c:1453:6: note: Assuming 'parent' is null
           if (parent) {
               ^~~~~~
   drivers/clk/clk.c:1453:2: note: Taking false branch
           if (parent) {
           ^
   drivers/clk/clk.c:1615:2: note: Returning from 'clk_core_init_rate_req'
           clk_core_init_rate_req(clk->core, &req, rate);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1617:8: note: Calling 'clk_core_round_rate_nolock'
           ret =3D clk_core_round_rate_nolock(clk->core, &req);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1517:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&prepare_lock);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:310:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/clk/clk.c:1517:2: note: Left side of '&&' is false
           lockdep_assert_held(&prepare_lock);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   drivers/clk/clk.c:1517:2: note: Loop condition is false.  Exiting loop
           lockdep_assert_held(&prepare_lock);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   drivers/clk/clk.c:1519:7: note: 'core' is non-null
           if (!core) {
                ^~~~
   drivers/clk/clk.c:1519:2: note: Taking false branch
           if (!core) {
           ^
   drivers/clk/clk.c:1524:6: note: Calling 'clk_core_can_round'
           if (clk_core_can_round(core))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1509:9: note: Assuming field 'determine_rate' is null
           return core->ops->determine_rate || core->ops->round_rate;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1509:9: note: Left side of '||' is false
   drivers/clk/clk.c:1509:2: note: Returning without writing to 'core->pare=
nt', which participates in a condition later
           return core->ops->determine_rate || core->ops->round_rate;
           ^
   drivers/clk/clk.c:1524:6: note: Returning from 'clk_core_can_round'
           if (clk_core_can_round(core))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1524:6: note: Assuming the condition is false
           if (clk_core_can_round(core))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1524:2: note: Taking false branch
           if (clk_core_can_round(core))
           ^
   drivers/clk/clk.c:1527:6: note: Assuming the condition is true
           if (core->flags & CLK_SET_RATE_PARENT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1527:2: note: Taking true branch

vim +1410 drivers/clk/clk.c

7ec986efed0208 Dong Aisheng       2016-06-30  1391  =

0f6cc2b8e94da5 Jerome Brunet      2017-12-01  1392  static int clk_core_det=
ermine_round_nolock(struct clk_core *core,
0817b62cc037a5 Boris Brezillon    2015-07-07  1393  					   struct clk_rate=
_request *req)
b2476490ef1113 Mike Turquette     2012-03-15  1394  {
0817b62cc037a5 Boris Brezillon    2015-07-07  1395  	long rate;
4dff95dc9477a3 Stephen Boyd       2015-04-30  1396  =

4dff95dc9477a3 Stephen Boyd       2015-04-30  1397  	lockdep_assert_held(&p=
repare_lock);
b2476490ef1113 Mike Turquette     2012-03-15  1398  =

d6968fca789700 Stephen Boyd       2015-04-30  1399  	if (!core)
4dff95dc9477a3 Stephen Boyd       2015-04-30  1400  		return 0;
b2476490ef1113 Mike Turquette     2012-03-15  1401  =

8f3363af8a3536 Maxime Ripard      2022-05-12  1402  	/*
8f3363af8a3536 Maxime Ripard      2022-05-12  1403  	 * Some clock provider=
s hand-craft their clk_rate_requests and
8f3363af8a3536 Maxime Ripard      2022-05-12  1404  	 * might not fill min_=
rate and max_rate.
8f3363af8a3536 Maxime Ripard      2022-05-12  1405  	 *
8f3363af8a3536 Maxime Ripard      2022-05-12  1406  	 * If it's the case, c=
lamping the rate is equivalent to setting
8f3363af8a3536 Maxime Ripard      2022-05-12  1407  	 * the rate to 0 which=
 is bad. Skip the clamping but complain so
8f3363af8a3536 Maxime Ripard      2022-05-12  1408  	 * that it gets fixed,=
 hopefully.
8f3363af8a3536 Maxime Ripard      2022-05-12  1409  	 */
8f3363af8a3536 Maxime Ripard      2022-05-12 @1410  	if (!req->min_rate && =
!req->max_rate)
8f3363af8a3536 Maxime Ripard      2022-05-12  1411  		pr_warn("%s: %s: clk_=
rate_request has initialized min or max rate.\n",
8f3363af8a3536 Maxime Ripard      2022-05-12  1412  			__func__, core->name=
);
8f3363af8a3536 Maxime Ripard      2022-05-12  1413  	else
948fb0969eae85 Maxime Ripard      2022-02-25  1414  		req->rate =3D clamp(r=
eq->rate, req->min_rate, req->max_rate);
948fb0969eae85 Maxime Ripard      2022-02-25  1415  =

55e9b8b7b806ec Jerome Brunet      2017-12-01  1416  	/*
e27453adcadd7b Geert Uytterhoeven 2021-03-26  1417  	 * At this point, core=
 protection will be disabled
55e9b8b7b806ec Jerome Brunet      2017-12-01  1418  	 * - if the provider i=
s not protected at all
55e9b8b7b806ec Jerome Brunet      2017-12-01  1419  	 * - if the calling co=
nsumer is the only one which has exclusivity
55e9b8b7b806ec Jerome Brunet      2017-12-01  1420  	 *   over the provider
55e9b8b7b806ec Jerome Brunet      2017-12-01  1421  	 */
e55a839a7a1c56 Jerome Brunet      2017-12-01  1422  	if (clk_core_rate_is_p=
rotected(core)) {
e55a839a7a1c56 Jerome Brunet      2017-12-01  1423  		req->rate =3D core->r=
ate;
e55a839a7a1c56 Jerome Brunet      2017-12-01  1424  	} else if (core->ops->=
determine_rate) {
0817b62cc037a5 Boris Brezillon    2015-07-07  1425  		return core->ops->det=
ermine_rate(core->hw, req);
0817b62cc037a5 Boris Brezillon    2015-07-07  1426  	} else if (core->ops->=
round_rate) {
0817b62cc037a5 Boris Brezillon    2015-07-07  1427  		rate =3D core->ops->r=
ound_rate(core->hw, req->rate,
0817b62cc037a5 Boris Brezillon    2015-07-07  1428  					     &req->best_pa=
rent_rate);
0817b62cc037a5 Boris Brezillon    2015-07-07  1429  		if (rate < 0)
0817b62cc037a5 Boris Brezillon    2015-07-07  1430  			return rate;
0817b62cc037a5 Boris Brezillon    2015-07-07  1431  =

0817b62cc037a5 Boris Brezillon    2015-07-07  1432  		req->rate =3D rate;
0817b62cc037a5 Boris Brezillon    2015-07-07  1433  	} else {
0f6cc2b8e94da5 Jerome Brunet      2017-12-01  1434  		return -EINVAL;
0f6cc2b8e94da5 Jerome Brunet      2017-12-01  1435  	}
0f6cc2b8e94da5 Jerome Brunet      2017-12-01  1436  =

0f6cc2b8e94da5 Jerome Brunet      2017-12-01  1437  	return 0;
0f6cc2b8e94da5 Jerome Brunet      2017-12-01  1438  }
0f6cc2b8e94da5 Jerome Brunet      2017-12-01  1439  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1974062250136846550==--

