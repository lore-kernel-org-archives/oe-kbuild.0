Content-Type: multipart/mixed; boundary="===============6055043257695095019=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 3/3] clkdev: Simplify devm_clk_hw_register_clkdev() function
Date: Fri, 24 Jun 2022 06:48:33 +0800
Message-ID: <202206240629.anWwARKz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6055043257695095019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220623115719.52683-3-andriy.shevchenko@linux.intel.com>
References: <20220623115719.52683-3-andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: linux-clk(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
TO: linux-arm-kernel(a)lists.infradead.org
CC: Michael Turquette <mturquette@baylibre.com>
CC: Russell King <linux@armlinux.org.uk>

Hi Andy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v5.19-rc3 next-20220623]
[cannot apply to rmk-arm/clkdev]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/clk-=
Remove-never-used-devm_of_clk_del_provider/20220623-195830
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20624/202206240629.anWwARKz-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/clkdev.c:379 devm_clk_hw_register_clkdev() error: uninitialized=
 symbol 'cl'.

vim +/cl +379 drivers/clk/clkdev.c

3eee6c7d119cd8 Matti Vaittinen 2018-12-07  353  =

3eee6c7d119cd8 Matti Vaittinen 2018-12-07  354  /**
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  355   * devm_clk_hw_register_clk=
dev - managed clk lookup registration for clk_hw
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  356   * @dev: device this lookup=
 is bound
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  357   * @hw: struct clk_hw to as=
sociate with all clk_lookups
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  358   * @con_id: connection ID s=
tring on device
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  359   * @dev_id: format string d=
escribing device name
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  360   *
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  361   * con_id or dev_id may be =
NULL as a wildcard, just as in the rest of
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  362   * clkdev.
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  363   *
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  364   * To make things easier fo=
r mass registration, we detect error clk_hws
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  365   * from a previous clk_hw_r=
egister_*() call, and return the error code for
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  366   * those.  This is to permi=
t this function to be called immediately
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  367   * after clk_hw_register_*(=
).
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  368   */
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  369  int devm_clk_hw_register_cl=
kdev(struct device *dev, struct clk_hw *hw,
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  370  				const char *con_id, con=
st char *dev_id)
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  371  {
0771f0e490e55d Andy Shevchenko 2022-06-23  372  	struct clk_lookup *cl;
0771f0e490e55d Andy Shevchenko 2022-06-23  373  	int rval;
0771f0e490e55d Andy Shevchenko 2022-06-23  374  =

0771f0e490e55d Andy Shevchenko 2022-06-23  375  	rval =3D do_clk_register_c=
lkdev(hw, &cl, con_id, dev_id);
0771f0e490e55d Andy Shevchenko 2022-06-23  376  	if (rval)
3eee6c7d119cd8 Matti Vaittinen 2018-12-07  377  		return rval;
0771f0e490e55d Andy Shevchenko 2022-06-23  378  =

0771f0e490e55d Andy Shevchenko 2022-06-23 @379  	return devm_add_action_or_=
reset(dev, devm_clkdev_release, cl);

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6055043257695095019==--

