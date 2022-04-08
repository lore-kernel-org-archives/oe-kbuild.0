Content-Type: multipart/mixed; boundary="===============6797107958518527677=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 05/22] clk: tests: Add tests for single parent mux
Date: Sat, 09 Apr 2022 06:22:32 +0800
Message-ID: <202204090628.uppbnylz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6797107958518527677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: riscv-randconfig-m031-20220408 (https://download.01.org/0day-ci/arc=
hive/20220409/202204090628.uppbnylz-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/clk_test.c:431 clk_test_single_parent_mux_set_range_disjoint_ch=
ild_last() warn: ignoring unreachable code.
drivers/clk/clk_test.c:461 clk_test_single_parent_mux_set_range_disjoint_pa=
rent_last() warn: ignoring unreachable code.

vim +431 drivers/clk/clk_test.c

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
ee06381ea0434d Maxime Ripard 2022-04-08  425  	struct clk *clk =3D hw->clk;
ee06381ea0434d Maxime Ripard 2022-04-08  426  	struct clk *parent;
ee06381ea0434d Maxime Ripard 2022-04-08  427  	int ret;
ee06381ea0434d Maxime Ripard 2022-04-08  428  =

ee06381ea0434d Maxime Ripard 2022-04-08  429  	kunit_skip(test, "This needs=
 to be fixed in the core.");
ee06381ea0434d Maxime Ripard 2022-04-08  430  =

ee06381ea0434d Maxime Ripard 2022-04-08 @431  	parent =3D clk_get_parent(cl=
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

ee06381ea0434d Maxime Ripard 2022-04-08  441  /*
ee06381ea0434d Maxime Ripard 2022-04-08  442   * Test that for a clock that=
 can't modify its rate and with a single
ee06381ea0434d Maxime Ripard 2022-04-08  443   * parent, if we set disjoint=
s range on the child and then the parent,
ee06381ea0434d Maxime Ripard 2022-04-08  444   * the second will return an =
error.
ee06381ea0434d Maxime Ripard 2022-04-08  445   *
ee06381ea0434d Maxime Ripard 2022-04-08  446   * FIXME: clk_set_rate_range(=
) only considers the current clock when
ee06381ea0434d Maxime Ripard 2022-04-08  447   * evaluating whether ranges =
are disjoints and not the downstream clocks
ee06381ea0434d Maxime Ripard 2022-04-08  448   * ranges.
ee06381ea0434d Maxime Ripard 2022-04-08  449   */
ee06381ea0434d Maxime Ripard 2022-04-08  450  static void
ee06381ea0434d Maxime Ripard 2022-04-08  451  clk_test_single_parent_mux_se=
t_range_disjoint_parent_last(struct kunit *test)
ee06381ea0434d Maxime Ripard 2022-04-08  452  {
ee06381ea0434d Maxime Ripard 2022-04-08  453  	struct clk_single_parent_ctx=
 *ctx =3D test->priv;
ee06381ea0434d Maxime Ripard 2022-04-08  454  	struct clk_hw *hw =3D &ctx->=
hw;
ee06381ea0434d Maxime Ripard 2022-04-08  455  	struct clk *clk =3D hw->clk;
ee06381ea0434d Maxime Ripard 2022-04-08  456  	struct clk *parent;
ee06381ea0434d Maxime Ripard 2022-04-08  457  	int ret;
ee06381ea0434d Maxime Ripard 2022-04-08  458  =

ee06381ea0434d Maxime Ripard 2022-04-08  459  	kunit_skip(test, "This needs=
 to be fixed in the core.");
ee06381ea0434d Maxime Ripard 2022-04-08  460  =

ee06381ea0434d Maxime Ripard 2022-04-08 @461  	parent =3D clk_get_parent(cl=
k);
ee06381ea0434d Maxime Ripard 2022-04-08  462  	KUNIT_ASSERT_PTR_NE(test, pa=
rent, NULL);
ee06381ea0434d Maxime Ripard 2022-04-08  463  =

ee06381ea0434d Maxime Ripard 2022-04-08  464  	ret =3D clk_set_rate_range(c=
lk, 1000, 2000);
ee06381ea0434d Maxime Ripard 2022-04-08  465  	KUNIT_ASSERT_EQ(test, ret, 0=
);
ee06381ea0434d Maxime Ripard 2022-04-08  466  =

ee06381ea0434d Maxime Ripard 2022-04-08  467  	ret =3D clk_set_rate_range(p=
arent, 3000, 4000);
ee06381ea0434d Maxime Ripard 2022-04-08  468  	KUNIT_EXPECT_LT(test, ret, 0=
);
ee06381ea0434d Maxime Ripard 2022-04-08  469  }
ee06381ea0434d Maxime Ripard 2022-04-08  470  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6797107958518527677==--

