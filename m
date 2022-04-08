Content-Type: multipart/mixed; boundary="===============2409319711306645722=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 05/22] clk: tests: Add tests for single parent mux
Date: Sat, 09 Apr 2022 07:44:32 +0800
Message-ID: <202204090701.gn2xYLz9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2409319711306645722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220408091037.2041955-6-maxime@cerno.tech>
References: <20220408091037.2041955-6-maxime@cerno.tech>
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
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm-randconfig-c002-20220408 (https://download.01.org/0day-ci/archi=
ve/20220409/202204090701.gn2xYLz9-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51=
b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/ee06381ea0434df359c=
060e90364d2890909da8e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-More-clock-rate-=
fixes-and-tests/20220408-171635
        git checkout ee06381ea0434df359c060e90364d2890909da8e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ov490_read_reg(dev, OV490_ODS_CTRL, &val);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/rdacm21.c:244:6: note: 'ret' is not equal to 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:244:2: note: Taking true branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:245:3: note: Returning without writing to '*=
val'
                   return ret;
                   ^
   drivers/media/i2c/rdacm21.c:422:3: note: Returning from 'ov490_read_reg'
                   ov490_read_reg(dev, OV490_ODS_CTRL, &val);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/rdacm21.c:423:11: note: The left operand of '=3D=3D' i=
s a garbage value
                   if (val =3D=3D OV490_ODS_CTRL_FRAME_OUTPUT_EN)
                       ~~~ ^
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/dma/ti/omap-dma.c:1847:6: note: Assuming field 'may_lose_context=
' is 0
           if (od->cfg->may_lose_context)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1847:2: note: Taking false branch
           if (od->cfg->may_lose_context)
           ^
   drivers/dma/ti/omap-dma.c:1850:6: note: Assuming field 'of_node' is null
           if (pdev->dev.of_node)
               ^~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1850:2: note: Taking false branch
           if (pdev->dev.of_node)
           ^
   drivers/dma/ti/omap-dma.c:1858:6: note: Assuming field 'legacy' is true
           if (!od->legacy) {
               ^~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1858:2: note: Taking false branch
           if (!od->legacy) {
           ^
   drivers/dma/ti/omap-dma.c:1863:6: note: Assuming field 'll123_supported'=
 is false
           if (od->ll123_supported)
               ^~~~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1863:2: note: Taking false branch
           if (od->ll123_supported)
           ^
   drivers/dma/ti/omap-dma.c:1866:2: note: Calling 'omap_dma_free'
           omap_dma_free(od);
           ^~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1515:2: note: Loop condition is true.  Enterin=
g loop body
           while (!list_empty(&od->ddev.channels)) {
           ^
   drivers/dma/ti/omap-dma.c:1521:3: note: Memory is released
                   kfree(c);
                   ^~~~~~~~
   drivers/dma/ti/omap-dma.c:1515:2: note: Loop condition is true.  Enterin=
g loop body
           while (!list_empty(&od->ddev.channels)) {
           ^
   drivers/dma/ti/omap-dma.c:1519:3: note: Calling 'list_del'
                   list_del(&c->vc.chan.device_node);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/dma/xilinx/zynqmp_dma.c:356:2: warning: Value stored to 'val' is=
 never read [clang-analyzer-deadcode.DeadStores]
           val =3D readl(chan->regs + ZYNQMP_DMA_IRQ_SRC_ACCT);
           ^
   drivers/dma/xilinx/zynqmp_dma.c:356:2: note: Value stored to 'val' is ne=
ver read
   drivers/dma/xilinx/zynqmp_dma.c:357:2: warning: Value stored to 'val' is=
 never read [clang-analyzer-deadcode.DeadStores]
           val =3D readl(chan->regs + ZYNQMP_DMA_IRQ_DST_ACCT);
           ^
   drivers/dma/xilinx/zynqmp_dma.c:357:2: note: Value stored to 'val' is ne=
ver read
   1 warning generated.
   drivers/soc/aspeed/aspeed-lpc-ctrl.c:73:17: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct device *dev =3D file->private_data;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/soc/aspeed/aspeed-lpc-ctrl.c:73:17: note: Value stored to 'dev' =
during its initialization is never read
           struct device *dev =3D file->private_data;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   1 warning generated.
   drivers/clk/clk.c:1972:3: warning: Value stored to 'best_parent_rate' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   best_parent_rate =3D parent->rate;
                   ^                  ~~~~~~~~~~~~
   drivers/clk/clk.c:1972:3: note: Value stored to 'best_parent_rate' is ne=
ver read
                   best_parent_rate =3D parent->rate;
                   ^                  ~~~~~~~~~~~~
   2 warnings generated.
>> drivers/clk/clk_test.c:425:14: warning: Value stored to 'clk' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct clk *clk =3D hw->clk;
                       ^~~   ~~~~~~~
   drivers/clk/clk_test.c:425:14: note: Value stored to 'clk' during its in=
itialization is never read
           struct clk *clk =3D hw->clk;
                       ^~~   ~~~~~~~
   drivers/clk/clk_test.c:455:14: warning: Value stored to 'clk' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct clk *clk =3D hw->clk;
                       ^~~   ~~~~~~~
   drivers/clk/clk_test.c:455:14: note: Value stored to 'clk' during its in=
itialization is never read
           struct clk *clk =3D hw->clk;
                       ^~~   ~~~~~~~
   4 warnings generated.
   drivers/clk/clk-divider.c:330:9: warning: Division by zero [clang-analyz=
er-core.DivideZero]
                   now =3D DIV_ROUND_UP_ULL((u64)parent_rate, i);
                         ^
   include/linux/math.h:42:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^
   include/linux/math.h:39:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^
   include/asm-generic/div64.h:235:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                                         ^
   drivers/clk/clk-divider.c:455:6: note: Assuming the condition is false
           if (divider->flags & CLK_DIVIDER_READ_ONLY) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-divider.c:455:2: note: Taking false branch
           if (divider->flags & CLK_DIVIDER_READ_ONLY) {
           ^
   drivers/clk/clk-divider.c:466:9: note: Calling 'divider_determine_rate'
           return divider_determine_rate(hw, req, divider->table, divider->=
width,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/clk/clk-divider.c:352:8: note: Calling 'clk_divider_bestdiv'
           div =3D clk_divider_bestdiv(hw, req->best_parent_hw, req->rate,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-divider.c:299:6: note: Assuming 'rate' is 0
           if (!rate)
               ^~~~~
   drivers/clk/clk-divider.c:299:2: note: Taking true branch
           if (!rate)
           ^
   drivers/clk/clk-divider.c:302:11: note: Calling '_get_maxdiv'
           maxdiv =3D _get_maxdiv(table, width, flags);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-divider.c:71:6: note: Assuming the condition is false
           if (flags & CLK_DIVIDER_ONE_BASED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-divider.c:71:2: note: Taking false branch
           if (flags & CLK_DIVIDER_ONE_BASED)
           ^
   drivers/clk/clk-divider.c:73:6: note: Assuming the condition is false
           if (flags & CLK_DIVIDER_POWER_OF_TWO)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-divider.c:73:2: note: Taking false branch
           if (flags & CLK_DIVIDER_POWER_OF_TWO)
           ^
   drivers/clk/clk-divider.c:75:6: note: Assuming 'table' is non-null, whic=
h participates in a condition later
           if (table)
               ^~~~~
   drivers/clk/clk-divider.c:75:2: note: Taking true branch
           if (table)
           ^
   drivers/clk/clk-divider.c:302:11: note: Returning from '_get_maxdiv'
           maxdiv =3D _get_maxdiv(table, width, flags);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-divider.c:304:6: note: Assuming the condition is false
           if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-divider.c:304:2: note: Taking false branch
           if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
           ^
   drivers/clk/clk-divider.c:316:11: note: '__UNIQUE_ID___x159' is >=3D '__=
UNIQUE_ID___y160'
           maxdiv =3D min(ULONG_MAX / rate, maxdiv);
                    ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/clk/clk-divider.c:316:11: note: '?' condition is false
           maxdiv =3D min(ULONG_MAX / rate, maxdiv);
                    ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'

vim +/clk +425 drivers/clk/clk_test.c

ee06381ea0434d Maxime Ripard 2022-04-08  410  =

ee06381ea0434d Maxime Ripard 2022-04-08  411  /*
ee06381ea0434d Maxime Ripard 2022-04-08  412   * Test that for a clock that=
 can't modify its rate and with a single
ee06381ea0434d Maxime Ripard 2022-04-08  413   * parent, if we set disjoint=
s range on the parent and then the child,
ee06381ea0434d Maxime Ripard 2022-04-08  414   * the second will return an =
error.
ee06381ea0434d Maxime Ripard 2022-04-08  415   *
ee06381ea0434d Maxime Ripard 2022-04-08  416   * FIXME: clk_set_rate_range(=
) only considers the current clock when
ee06381ea0434d Maxime Ripard 2022-04-08  417   * evaluating whether ranges =
are disjoints and not the upstream clocks
ee06381ea0434d Maxime Ripard 2022-04-08  418   * ranges.
ee06381ea0434d Maxime Ripard 2022-04-08  419   */
ee06381ea0434d Maxime Ripard 2022-04-08  420  static void
ee06381ea0434d Maxime Ripard 2022-04-08  421  clk_test_single_parent_mux_se=
t_range_disjoint_child_last(struct kunit *test)
ee06381ea0434d Maxime Ripard 2022-04-08  422  {
ee06381ea0434d Maxime Ripard 2022-04-08  423  	struct clk_single_parent_ctx=
 *ctx =3D test->priv;
ee06381ea0434d Maxime Ripard 2022-04-08  424  	struct clk_hw *hw =3D &ctx->=
hw;
ee06381ea0434d Maxime Ripard 2022-04-08 @425  	struct clk *clk =3D hw->clk;
ee06381ea0434d Maxime Ripard 2022-04-08  426  	struct clk *parent;
ee06381ea0434d Maxime Ripard 2022-04-08  427  	int ret;
ee06381ea0434d Maxime Ripard 2022-04-08  428  =

ee06381ea0434d Maxime Ripard 2022-04-08  429  	kunit_skip(test, "This needs=
 to be fixed in the core.");
ee06381ea0434d Maxime Ripard 2022-04-08  430  =

ee06381ea0434d Maxime Ripard 2022-04-08  431  	parent =3D clk_get_parent(cl=
k);
ee06381ea0434d Maxime Ripard 2022-04-08  432  	KUNIT_ASSERT_PTR_NE(test, pa=
rent, NULL);
ee06381ea0434d Maxime Ripard 2022-04-08  433  =

ee06381ea0434d Maxime Ripard 2022-04-08  434  	ret =3D clk_set_rate_range(p=
arent, 1000, 2000);
ee06381ea0434d Maxime Ripard 2022-04-08  435  	KUNIT_ASSERT_EQ(test, ret, 0=
);
ee06381ea0434d Maxime Ripard 2022-04-08  436  =

ee06381ea0434d Maxime Ripard 2022-04-08  437  	ret =3D clk_set_rate_range(c=
lk, 3000, 4000);
ee06381ea0434d Maxime Ripard 2022-04-08  438  	KUNIT_EXPECT_LT(test, ret, 0=
);
ee06381ea0434d Maxime Ripard 2022-04-08  439  }
ee06381ea0434d Maxime Ripard 2022-04-08  440  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2409319711306645722==--

