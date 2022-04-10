Content-Type: multipart/mixed; boundary="===============0903037264587737606=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 19/22] clk: Stop forwarding clk_rate_requests to the parent
Date: Sun, 10 Apr 2022 17:30:07 +0800
Message-ID: <202204101750.HBf16Mxv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0903037264587737606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220408091037.2041955-20-maxime@cerno.tech>
References: <20220408091037.2041955-20-maxime@cerno.tech>
TO: Maxime Ripard <maxime@cerno.tech>
TO: Mike Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: linux-clk(a)vger.kernel.org
CC: Naresh Kamboju <naresh.kamboju@linaro.org>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Marek Szyprowski <m.szyprowski@samsung.com>
CC: Tony Lindgren <tony@atomide.com>
CC: Jerome Brunet <jbrunet@baylibre.com>
CC: Yassine Oudjana <y.oudjana@protonmail.com>
CC: Neil Armstrong <narmstrong@baylibre.com>
CC: Maxime Ripard <maxime@cerno.tech>

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v5.18-rc1 next-20220408]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/clk-Mo=
re-clock-rate-fixes-and-tests/20220408-171635
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220409 (https://download.01.org/0day-ci/archi=
ve/20220410/202204101750.HBf16Mxv-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9fdd25=
848a79892eaacc5414d5aef18555b79919)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/09996dda67af2c68d79=
e0c27380e72014b78d734
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-More-clock-rate-=
fixes-and-tests/20220408-171635
        git checkout 09996dda67af2c68d79e0c27380e72014b78d734
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                             ^
   drivers/clk/clk.c:1576:6: note: Assuming 'clk' is non-null
           if (!clk)
               ^~~~
   drivers/clk/clk.c:1576:2: note: Taking false branch
           if (!clk)
           ^
   drivers/clk/clk.c:1581:6: note: Assuming field 'exclusive_count' is 0
           if (clk->exclusive_count)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1581:2: note: Taking false branch
           if (clk->exclusive_count)
           ^
   drivers/clk/clk.c:1586:8: note: Calling 'clk_core_round_rate_nolock'
           ret =3D clk_core_round_rate_nolock(clk->core, &req);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1486:2: note: Assuming 'debug_locks' is 0
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
   drivers/clk/clk.c:1486:2: note: Left side of '&&' is false
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
   drivers/clk/clk.c:1486:2: note: Loop condition is false.  Exiting loop
           lockdep_assert_held(&prepare_lock);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   drivers/clk/clk.c:1488:7: note: 'core' is non-null
           if (!core) {
                ^~~~
   drivers/clk/clk.c:1488:2: note: Taking false branch
           if (!core) {
           ^
   drivers/clk/clk.c:1493:6: note: Assuming the condition is false
           if (clk_core_can_round(core))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1493:2: note: Taking false branch
           if (clk_core_can_round(core))
           ^
   drivers/clk/clk.c:1496:6: note: Assuming the condition is true
           if (core->flags & CLK_SET_RATE_PARENT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1496:2: note: Taking true branch
           if (core->flags & CLK_SET_RATE_PARENT) {
           ^
   drivers/clk/clk.c:1499:3: note: Calling 'clk_core_forward_rate_req'
                   clk_core_forward_rate_req(core, core->parent, req, &pare=
nt_req);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/clk.c:579:14: note: Assuming the condition is false
           if (WARN_ON(!clk_core_has_parent(core, parent)))
                       ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/clk/clk.c:579:2: note: Taking false branch
           if (WARN_ON(!clk_core_has_parent(core, parent)))
           ^
   drivers/clk/clk.c:582:2: note: Calling 'clk_core_init_rate_req'
           clk_core_init_rate_req(parent, req, old_req->rate);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1440:15: note: 'core' is null
           if (WARN_ON(!core || !req))
                        ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/clk/clk.c:1440:20: note: Left side of '||' is true
           if (WARN_ON(!core || !req))
                             ^
   drivers/clk/clk.c:1440:2: note: Taking true branch
           if (WARN_ON(!core || !req))
           ^
   drivers/clk/clk.c:1441:3: note: Returning without writing to 'req->min_r=
ate'
                   return;
                   ^
   drivers/clk/clk.c:582:2: note: Returning from 'clk_core_init_rate_req'
           clk_core_init_rate_req(parent, req, old_req->rate);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:584:20: note: The left operand of '<' is a garbage val=
ue
           if (req->min_rate < old_req->min_rate)
               ~~~~~~~~~~~~~ ^
>> drivers/clk/clk.c:1408:14: warning: Assigned value is garbage or undefin=
ed [clang-analyzer-core.uninitialized.Assign]
           req->rate =3D clamp(req->rate, req->min_rate, req->max_rate);
                       ^
   include/linux/minmax.h:89:45: note: expanded from macro 'clamp'
   #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
                                               ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:31:3: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                   ^
   drivers/clk/clk.c:1576:6: note: Assuming 'clk' is non-null
           if (!clk)
               ^~~~
   drivers/clk/clk.c:1576:2: note: Taking false branch
           if (!clk)
           ^
   drivers/clk/clk.c:1581:6: note: Assuming field 'exclusive_count' is 0
           if (clk->exclusive_count)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1581:2: note: Taking false branch
           if (clk->exclusive_count)
           ^
   drivers/clk/clk.c:1584:2: note: Calling 'clk_core_init_rate_req'
           clk_core_init_rate_req(clk->core, &req, rate);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1440:14: note: Assuming 'core' is non-null
           if (WARN_ON(!core || !req))
                       ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/clk/clk.c:1440:14: note: Left side of '||' is false
           if (WARN_ON(!core || !req))
                       ^
   drivers/clk/clk.c:1440:2: note: Taking false branch
           if (WARN_ON(!core || !req))
           ^
   drivers/clk/clk.c:1447:6: note: Assuming 'parent' is null
           if (parent) {
               ^~~~~~
   drivers/clk/clk.c:1447:2: note: Taking false branch
           if (parent) {
           ^
   drivers/clk/clk.c:1584:2: note: Returning from 'clk_core_init_rate_req'
           clk_core_init_rate_req(clk->core, &req, rate);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1586:8: note: Calling 'clk_core_round_rate_nolock'
           ret =3D clk_core_round_rate_nolock(clk->core, &req);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1486:2: note: Assuming 'debug_locks' is 0
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
   drivers/clk/clk.c:1486:2: note: Left side of '&&' is false
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
   drivers/clk/clk.c:1486:2: note: Loop condition is false.  Exiting loop
           lockdep_assert_held(&prepare_lock);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   drivers/clk/clk.c:1488:7: note: 'core' is non-null
           if (!core) {
                ^~~~
   drivers/clk/clk.c:1488:2: note: Taking false branch
           if (!core) {
           ^
   drivers/clk/clk.c:1493:6: note: Calling 'clk_core_can_round'
           if (clk_core_can_round(core))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1478:9: note: Assuming field 'determine_rate' is null
           return core->ops->determine_rate || core->ops->round_rate;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1478:9: note: Left side of '||' is false
   drivers/clk/clk.c:1478:2: note: Returning without writing to 'core->pare=
nt', which participates in a condition later
           return core->ops->determine_rate || core->ops->round_rate;
           ^
   drivers/clk/clk.c:1493:6: note: Returning from 'clk_core_can_round'

vim +1408 drivers/clk/clk.c

7ec986efed0208c Dong Aisheng       2016-06-30  1397  =

0f6cc2b8e94da54 Jerome Brunet      2017-12-01  1398  static int clk_core_de=
termine_round_nolock(struct clk_core *core,
0817b62cc037a56 Boris Brezillon    2015-07-07  1399  					   struct clk_rat=
e_request *req)
b2476490ef11134 Mike Turquette     2012-03-15  1400  {
0817b62cc037a56 Boris Brezillon    2015-07-07  1401  	long rate;
4dff95dc9477a34 Stephen Boyd       2015-04-30  1402  =

4dff95dc9477a34 Stephen Boyd       2015-04-30  1403  	lockdep_assert_held(&=
prepare_lock);
b2476490ef11134 Mike Turquette     2012-03-15  1404  =

d6968fca789700a Stephen Boyd       2015-04-30  1405  	if (!core)
4dff95dc9477a34 Stephen Boyd       2015-04-30  1406  		return 0;
b2476490ef11134 Mike Turquette     2012-03-15  1407  =

948fb0969eae856 Maxime Ripard      2022-02-25 @1408  	req->rate =3D clamp(r=
eq->rate, req->min_rate, req->max_rate);
948fb0969eae856 Maxime Ripard      2022-02-25  1409  =

55e9b8b7b806ec3 Jerome Brunet      2017-12-01  1410  	/*
e27453adcadd7be Geert Uytterhoeven 2021-03-26  1411  	 * At this point, cor=
e protection will be disabled
55e9b8b7b806ec3 Jerome Brunet      2017-12-01  1412  	 * - if the provider =
is not protected at all
55e9b8b7b806ec3 Jerome Brunet      2017-12-01  1413  	 * - if the calling c=
onsumer is the only one which has exclusivity
55e9b8b7b806ec3 Jerome Brunet      2017-12-01  1414  	 *   over the provider
55e9b8b7b806ec3 Jerome Brunet      2017-12-01  1415  	 */
e55a839a7a1c561 Jerome Brunet      2017-12-01  1416  	if (clk_core_rate_is_=
protected(core)) {
e55a839a7a1c561 Jerome Brunet      2017-12-01  1417  		req->rate =3D core->=
rate;
e55a839a7a1c561 Jerome Brunet      2017-12-01  1418  	} else if (core->ops-=
>determine_rate) {
0817b62cc037a56 Boris Brezillon    2015-07-07  1419  		return core->ops->de=
termine_rate(core->hw, req);
0817b62cc037a56 Boris Brezillon    2015-07-07  1420  	} else if (core->ops-=
>round_rate) {
0817b62cc037a56 Boris Brezillon    2015-07-07  1421  		rate =3D core->ops->=
round_rate(core->hw, req->rate,
0817b62cc037a56 Boris Brezillon    2015-07-07  1422  					     &req->best_p=
arent_rate);
0817b62cc037a56 Boris Brezillon    2015-07-07  1423  		if (rate < 0)
0817b62cc037a56 Boris Brezillon    2015-07-07  1424  			return rate;
0817b62cc037a56 Boris Brezillon    2015-07-07  1425  =

0817b62cc037a56 Boris Brezillon    2015-07-07  1426  		req->rate =3D rate;
0817b62cc037a56 Boris Brezillon    2015-07-07  1427  	} else {
0f6cc2b8e94da54 Jerome Brunet      2017-12-01  1428  		return -EINVAL;
0f6cc2b8e94da54 Jerome Brunet      2017-12-01  1429  	}
0f6cc2b8e94da54 Jerome Brunet      2017-12-01  1430  =

0f6cc2b8e94da54 Jerome Brunet      2017-12-01  1431  	return 0;
0f6cc2b8e94da54 Jerome Brunet      2017-12-01  1432  }
0f6cc2b8e94da54 Jerome Brunet      2017-12-01  1433  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0903037264587737606==--

