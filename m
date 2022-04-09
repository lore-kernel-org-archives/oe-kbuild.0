Content-Type: multipart/mixed; boundary="===============3238333948694892875=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 11/22] clk: Skip set_rate_range if our clock is orphan
Date: Sat, 09 Apr 2022 09:36:48 +0800
Message-ID: <202204090942.TPcGLjZX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3238333948694892875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220408091037.2041955-12-maxime@cerno.tech>
References: <20220408091037.2041955-12-maxime@cerno.tech>
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
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-randconfig-m031-20220408 (https://download.01.org/0day-ci/arc=
hive/20220409/202204090942.TPcGLjZX-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/clk/clk_test.c:801 clk_test_orphan_transparent_multiple_parent_mux_=
set_range_set_parent_get_rate() warn: ignoring unreachable code.

Old smatch warnings:
drivers/clk/clk_test.c:929 clk_test_single_parent_mux_set_range_disjoint_ch=
ild_last() warn: ignoring unreachable code.
drivers/clk/clk_test.c:959 clk_test_single_parent_mux_set_range_disjoint_pa=
rent_last() warn: ignoring unreachable code.

vim +801 drivers/clk/clk_test.c

d61deb9e36bc91 Maxime Ripard 2022-04-08  780  =

2f0b8e802c7321 Maxime Ripard 2022-04-08  781  /*
2f0b8e802c7321 Maxime Ripard 2022-04-08  782   * Test that, for a mux that =
started orphan, was assigned and rate and
2f0b8e802c7321 Maxime Ripard 2022-04-08  783   * then got switched to a val=
id parent, its rate is eventually within
2f0b8e802c7321 Maxime Ripard 2022-04-08  784   * range.
2f0b8e802c7321 Maxime Ripard 2022-04-08  785   *
2f0b8e802c7321 Maxime Ripard 2022-04-08  786   * FIXME: Even though we upda=
te the rate as part of clk_set_parent(), we
2f0b8e802c7321 Maxime Ripard 2022-04-08  787   * don't evaluate whether tha=
t new rate is within range and needs to be
2f0b8e802c7321 Maxime Ripard 2022-04-08  788   * adjusted.
2f0b8e802c7321 Maxime Ripard 2022-04-08  789   */
2f0b8e802c7321 Maxime Ripard 2022-04-08  790  static void
2f0b8e802c7321 Maxime Ripard 2022-04-08  791  clk_test_orphan_transparent_m=
ultiple_parent_mux_set_range_set_parent_get_rate(struct kunit *test)
2f0b8e802c7321 Maxime Ripard 2022-04-08  792  {
2f0b8e802c7321 Maxime Ripard 2022-04-08  793  	struct clk_multiple_parent_c=
tx *ctx =3D test->priv;
2f0b8e802c7321 Maxime Ripard 2022-04-08  794  	struct clk_hw *hw =3D &ctx->=
hw;
2f0b8e802c7321 Maxime Ripard 2022-04-08  795  	struct clk *clk =3D hw->clk,=
 *parent;
2f0b8e802c7321 Maxime Ripard 2022-04-08  796  	unsigned long rate;
2f0b8e802c7321 Maxime Ripard 2022-04-08  797  	int ret;
2f0b8e802c7321 Maxime Ripard 2022-04-08  798  =

2f0b8e802c7321 Maxime Ripard 2022-04-08  799  	kunit_skip(test, "This needs=
 to be fixed in the core.");
2f0b8e802c7321 Maxime Ripard 2022-04-08  800  =

2f0b8e802c7321 Maxime Ripard 2022-04-08 @801  	parent =3D clk_hw_get_clk(&c=
tx->parents_ctx[1].hw, NULL);
2f0b8e802c7321 Maxime Ripard 2022-04-08  802  	KUNIT_ASSERT_NOT_ERR_OR_NULL=
(test, parent);
2f0b8e802c7321 Maxime Ripard 2022-04-08  803  =

2f0b8e802c7321 Maxime Ripard 2022-04-08  804  	ret =3D clk_set_rate_range(c=
lk, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
2f0b8e802c7321 Maxime Ripard 2022-04-08  805  	KUNIT_ASSERT_EQ(test, ret, 0=
);
2f0b8e802c7321 Maxime Ripard 2022-04-08  806  =

2f0b8e802c7321 Maxime Ripard 2022-04-08  807  	ret =3D clk_set_parent(clk, =
parent);
2f0b8e802c7321 Maxime Ripard 2022-04-08  808  	KUNIT_ASSERT_EQ(test, ret, 0=
);
2f0b8e802c7321 Maxime Ripard 2022-04-08  809  =

2f0b8e802c7321 Maxime Ripard 2022-04-08  810  	rate =3D clk_get_rate(clk);
2f0b8e802c7321 Maxime Ripard 2022-04-08  811  	KUNIT_ASSERT_GT(test, rate, =
0);
2f0b8e802c7321 Maxime Ripard 2022-04-08  812  	KUNIT_EXPECT_GE(test, rate, =
DUMMY_CLOCK_RATE_1);
2f0b8e802c7321 Maxime Ripard 2022-04-08  813  	KUNIT_EXPECT_LE(test, rate, =
DUMMY_CLOCK_RATE_2);
2f0b8e802c7321 Maxime Ripard 2022-04-08  814  =

2f0b8e802c7321 Maxime Ripard 2022-04-08  815  	clk_put(parent);
2f0b8e802c7321 Maxime Ripard 2022-04-08  816  }
2f0b8e802c7321 Maxime Ripard 2022-04-08  817  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3238333948694892875==--

