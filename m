Content-Type: multipart/mixed; boundary="===============2103043886022631590=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/renesas/rzg2l-cpg.c:303 rzg2l_cpg_register_core_clk() warn: passing zero to 'PTR_ERR'
Date: Sat, 23 Apr 2022 14:08:49 +0800
Message-ID: <202204231432.MrTANJNQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2103043886022631590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c00c5e1d157bec0ef0b0b59aa5482eb8dc7e8e49
commit: 0aae437ac5c264e8e2cb6c3fead20b44d2fa31d1 clk: renesas: Rename renes=
as-rzg2l-cpg.[ch] to rzg2l-cpg.[ch]
date:   9 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 9 months ago
config: xtensa-randconfig-m031-20220422 (https://download.01.org/0day-ci/ar=
chive/20220423/202204231432.MrTANJNQ-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/renesas/rzg2l-cpg.c:303 rzg2l_cpg_register_core_clk() warn: pas=
sing zero to 'PTR_ERR'

vim +/PTR_ERR +303 drivers/clk/renesas/rzg2l-cpg.c

ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  247  =

ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  248  static void __init
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  249  rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  250  			    const struct rzg2l_cpg_info *info,
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  251  			    struct rzg2l_cpg_priv *priv)
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  252  {
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  253  	struct clk *clk =3D ERR_PTR(-EOPNOTSUPP), *parent;
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  254  	struct device *dev =3D priv->dev;
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  255  	unsigned int id =3D core->id, div =3D core->div;
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  256  	const char *parent_name;
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  257  =

ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  258  	WARN_DEBUG(id >=3D priv->num_core_clks);
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  259  	WARN_DEBUG(PTR_ERR(priv->clks[id]) !=3D -ENOENT);
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  260  =

ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  261  	if (!core->name) {
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  262  		/* Skip NULLified clock */
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  263  		return;
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  264  	}
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  265  =

ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  266  	switch (core->type) {
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  267  	case CLK_TYPE_IN:
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  268  		clk =3D of_clk_get_by_name(priv->dev->of_node, core->name);
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  269  		break;
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  270  	case CLK_TYPE_FF:
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  271  		WARN_DEBUG(core->parent >=3D priv->num_core_clks);
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  272  		parent =3D priv->clks[core->parent];
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  273  		if (IS_ERR(parent)) {
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  274  			clk =3D parent;
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  275  			goto fail;
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  276  		}
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  277  =

ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  278  		parent_name =3D __clk_get_name(parent);
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  279  		clk =3D clk_register_fixed_factor(NULL, core->name,
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  280  						parent_name, CLK_SET_RATE_PARENT,
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  281  						core->mult, div);
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  282  		break;
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  283  	case CLK_TYPE_SAM_PLL:
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  284  		clk =3D rzg2l_cpg_pll_clk_register(core, priv->clks,
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  285  						 priv->base, priv);
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  286  		break;
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  287  	case CLK_TYPE_DIV:
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  288  		clk =3D rzg2l_cpg_div_clk_register(core, priv->clks,
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  289  						 priv->base, priv);
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  290  		break;
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  291  	default:
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  292  		goto fail;
d42d57fe86e98c drivers/clk/renesas/renesas-rzg2l-cpg.c Yang Li       2021-0=
6-15  293  	}
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  294  =

ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  295  	if (IS_ERR_OR_NULL(clk))
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  296  		goto fail;
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  297  =

ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  298  	dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(cl=
k));
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  299  	priv->clks[id] =3D clk;
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  300  	return;
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  301  =

ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  302  fail:
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09 @303  	dev_err(dev, "Failed to register %s clock %s: %ld\n", "core",
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  304  		core->name, PTR_ERR(clk));
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  305  }
ef3c613ccd68a7 drivers/clk/renesas/renesas-rzg2l-cpg.c Lad Prabhakar 2021-0=
6-09  306  =


:::::: The code at line 303 was first introduced by commit
:::::: ef3c613ccd68a78727b817c3dacf4a68d1ffc67f clk: renesas: Add CPG core =
wrapper for RZ/G2L SoC

:::::: TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
:::::: CC: Geert Uytterhoeven <geert+renesas@glider.be>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2103043886022631590==--

