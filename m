Content-Type: multipart/mixed; boundary="===============6179507093092697312=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v13 5/9] clk: Add Sunplus SP7021 clock driver
Date: Tue, 12 Apr 2022 09:11:49 +0800
Message-ID: <202204120913.030IYppv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6179507093092697312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <c66c84f1c834a16ca0cba6272b73644946a4d09b.1649659095.git.qinji=
an@cqplus1.com>
References: <c66c84f1c834a16ca0cba6272b73644946a4d09b.1649659095.git.qinjia=
n@cqplus1.com>
TO: Qin Jian <qinjian@cqplus1.com>
TO: krzysztof.kozlowski(a)linaro.org
CC: robh+dt(a)kernel.org
CC: mturquette(a)baylibre.com
CC: sboyd(a)kernel.org
CC: tglx(a)linutronix.de
CC: maz(a)kernel.org
CC: p.zabel(a)pengutronix.de
CC: linux(a)armlinux.org.uk
CC: arnd(a)arndb.de
CC: linux-arm-kernel(a)lists.infradead.org
CC: devicetree(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-clk(a)vger.kernel.org
CC: Qin Jian <qinjian@cqplus1.com>

Hi Qin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pza/reset/next]
[also build test WARNING on clk/clk-next tip/irq/core linus/master v5.18-rc=
2 next-20220411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Qin-Jian/Add-Sunplus=
-SP7021-SoC-Support/20220411-145949
base:   https://git.pengutronix.de/git/pza/linux reset/next
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arc-randconfig-m031-20220411 (https://download.01.org/0day-ci/archi=
ve/20220412/202204120913.030IYppv-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/clk-sp7021.c:199 plltv_integer_div() error: uninitialized symbo=
l 'n'.
drivers/clk/clk-sp7021.c:591 sp_pll_register() warn: passing devm_ allocate=
d variable to kfree. 'pll'

vim +/n +199 drivers/clk/clk-sp7021.c

813495df844458 Qin Jian 2022-04-11  162  =

813495df844458 Qin Jian 2022-04-11  163  static long plltv_integer_div(stru=
ct sp_pll *clk, unsigned long freq)
813495df844458 Qin Jian 2022-04-11  164  {
813495df844458 Qin Jian 2022-04-11  165  	/* valid m values: 27M must be di=
visible by m, 0 means end */
813495df844458 Qin Jian 2022-04-11  166  	static const u32 m_table[] =3D {
813495df844458 Qin Jian 2022-04-11  167  		1, 2, 3, 4, 5, 6, 8, 9, 10, 12, =
15, 16, 18, 20, 24, 25, 27, 30, 32, 0
813495df844458 Qin Jian 2022-04-11  168  	};
813495df844458 Qin Jian 2022-04-11  169  	u32 m, n, r;
813495df844458 Qin Jian 2022-04-11  170  	unsigned long fvco, nf;
813495df844458 Qin Jian 2022-04-11  171  =

813495df844458 Qin Jian 2022-04-11  172  	freq =3D clamp(freq, F_MIN, F_MAX=
);
813495df844458 Qin Jian 2022-04-11  173  =

813495df844458 Qin Jian 2022-04-11  174  	/* DIVR 0~3 */
813495df844458 Qin Jian 2022-04-11  175  	for (r =3D 0; r <=3D 3; r++) {
813495df844458 Qin Jian 2022-04-11  176  		fvco =3D freq << r;
813495df844458 Qin Jian 2022-04-11  177  		if (fvco <=3D FVCO_MAX)
813495df844458 Qin Jian 2022-04-11  178  			break;
813495df844458 Qin Jian 2022-04-11  179  	}
813495df844458 Qin Jian 2022-04-11  180  =

813495df844458 Qin Jian 2022-04-11  181  	/* DIVM */
813495df844458 Qin Jian 2022-04-11  182  	for (m =3D 0; m_table[m]; m++) {
813495df844458 Qin Jian 2022-04-11  183  		nf =3D fvco * m_table[m];
813495df844458 Qin Jian 2022-04-11  184  		n =3D nf / F_27M;
813495df844458 Qin Jian 2022-04-11  185  		if ((n * F_27M) =3D=3D nf)
813495df844458 Qin Jian 2022-04-11  186  			break;
813495df844458 Qin Jian 2022-04-11  187  	}
813495df844458 Qin Jian 2022-04-11  188  	m =3D m_table[m];
813495df844458 Qin Jian 2022-04-11  189  =

813495df844458 Qin Jian 2022-04-11  190  	if (!m) {
813495df844458 Qin Jian 2022-04-11  191  		pr_err("%s: %s freq:%lu not foun=
d a valid setting\n",
813495df844458 Qin Jian 2022-04-11  192  		       __func__, clk_hw_get_name=
(&clk->hw), freq);
813495df844458 Qin Jian 2022-04-11  193  		return -EINVAL;
813495df844458 Qin Jian 2022-04-11  194  	}
813495df844458 Qin Jian 2022-04-11  195  =

813495df844458 Qin Jian 2022-04-11  196  	/* save parameters */
813495df844458 Qin Jian 2022-04-11  197  	clk->p[SEL_FRA] =3D 0;
813495df844458 Qin Jian 2022-04-11  198  	clk->p[DIVR]    =3D r;
813495df844458 Qin Jian 2022-04-11 @199  	clk->p[DIVN]    =3D n;
813495df844458 Qin Jian 2022-04-11  200  	clk->p[DIVM]    =3D m;
813495df844458 Qin Jian 2022-04-11  201  =

813495df844458 Qin Jian 2022-04-11  202  	return freq;
813495df844458 Qin Jian 2022-04-11  203  }
813495df844458 Qin Jian 2022-04-11  204  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6179507093092697312==--

