Content-Type: multipart/mixed; boundary="===============9045629997696021217=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 2/2] clk: ingenic-tcu: Fix missing TCU clock for X1000 SoCs
Date: Tue, 12 Apr 2022 18:41:28 +0800
Message-ID: <202204121856.LxK9kEyg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9045629997696021217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220411154241.50834-3-aidanmacdonald.0x0@gmail.com>
References: <20220411154241.50834-3-aidanmacdonald.0x0@gmail.com>
TO: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
TO: paul(a)crapouillou.net
TO: robh+dt(a)kernel.org
TO: krzk+dt(a)kernel.org
TO: tsbogend(a)alpha.franken.de
TO: mturquette(a)baylibre.com
TO: sboyd(a)kernel.org
CC: linux-mips(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-clk(a)vger.kernel.org

Hi Aidan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on clk/clk-next linus/master linux/master v5.18-rc=
2 next-20220412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Aidan-MacDonald/Fix-=
missing-TCU-clock-for-X1000-X1830-SoCs/20220411-234531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arc-randconfig-m031-20220411 (https://download.01.org/0day-ci/archi=
ve/20220412/202204121856.LxK9kEyg-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/ingenic/tcu.c:456 ingenic_tcu_probe() error: uninitialized symb=
ol 'ret'.

vim +/ret +456 drivers/clk/ingenic/tcu.c

4f89e4b8f1215c1 Paul Cercueil   2019-07-24  336  =

4f89e4b8f1215c1 Paul Cercueil   2019-07-24  337  static int __init ingenic_=
tcu_probe(struct device_node *np)
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  338  {
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  339  	const struct of_device_id=
 *id =3D of_match_node(ingenic_tcu_of_match, np);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  340  	struct ingenic_tcu *tcu;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  341  	struct regmap *map;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  342  	unsigned int i;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  343  	int ret;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  344  =

4f89e4b8f1215c1 Paul Cercueil   2019-07-24  345  	map =3D device_node_to_re=
gmap(np);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  346  	if (IS_ERR(map))
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  347  		return PTR_ERR(map);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  348  =

4f89e4b8f1215c1 Paul Cercueil   2019-07-24  349  	tcu =3D kzalloc(sizeof(*t=
cu), GFP_KERNEL);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  350  	if (!tcu)
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  351  		return -ENOMEM;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  352  =

4f89e4b8f1215c1 Paul Cercueil   2019-07-24  353  	tcu->map =3D map;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  354  	tcu->soc_info =3D id->dat=
a;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  355  =

4f89e4b8f1215c1 Paul Cercueil   2019-07-24  356  	if (tcu->soc_info->has_tc=
u_clk) {
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  357  		tcu->clk =3D of_clk_get_=
by_name(np, "tcu");
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  358  		if (IS_ERR(tcu->clk)) {
8c04eee82a9d67a Aidan MacDonald 2022-04-11  359  			/*
8c04eee82a9d67a Aidan MacDonald 2022-04-11  360  			 * Old device trees for=
 some SoCs did not include the
8c04eee82a9d67a Aidan MacDonald 2022-04-11  361  			 * TCU clock because th=
is driver (incorrectly) didn't
8c04eee82a9d67a Aidan MacDonald 2022-04-11  362  			 * use it. In this case=
 we complain loudly and attempt
8c04eee82a9d67a Aidan MacDonald 2022-04-11  363  			 * to continue without =
the clock, which might work if
8c04eee82a9d67a Aidan MacDonald 2022-04-11  364  			 * booting with workaro=
unds like "clk_ignore_unused".
8c04eee82a9d67a Aidan MacDonald 2022-04-11  365  			 */
8c04eee82a9d67a Aidan MacDonald 2022-04-11  366  			if (tcu->soc_info->allo=
w_missing_tcu_clk &&
8c04eee82a9d67a Aidan MacDonald 2022-04-11  367  			    PTR_ERR(tcu->clk) =
=3D=3D -EINVAL) {
8c04eee82a9d67a Aidan MacDonald 2022-04-11  368  				pr_warn("TCU clock mis=
sing from device tree, please update your device tree\n");
8c04eee82a9d67a Aidan MacDonald 2022-04-11  369  				tcu->clk =3D NULL;
8c04eee82a9d67a Aidan MacDonald 2022-04-11  370  			} else {
8c04eee82a9d67a Aidan MacDonald 2022-04-11  371  				pr_crit("Cannot get TC=
U clock from device tree\n");
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  372  				goto err_free_tcu;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  373  			}
8c04eee82a9d67a Aidan MacDonald 2022-04-11  374  		} else {
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  375  			ret =3D clk_prepare_ena=
ble(tcu->clk);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  376  			if (ret) {
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  377  				pr_crit("Unable to ena=
ble TCU clock\n");
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  378  				goto err_put_clk;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  379  			}
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  380  		}
8c04eee82a9d67a Aidan MacDonald 2022-04-11  381  	}
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  382  =

e620a1e061c4738 Stephen Kitt    2019-09-27  383  	tcu->clocks =3D kzalloc(s=
truct_size(tcu->clocks, hws, TCU_CLK_COUNT),
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  384  			      GFP_KERNEL);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  385  	if (!tcu->clocks) {
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  386  		ret =3D -ENOMEM;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  387  		goto err_clk_disable;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  388  	}
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  389  =

4f89e4b8f1215c1 Paul Cercueil   2019-07-24  390  	tcu->clocks->num =3D TCU_=
CLK_COUNT;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  391  =

4f89e4b8f1215c1 Paul Cercueil   2019-07-24  392  	for (i =3D 0; i < tcu->so=
c_info->num_channels; i++) {
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  393  		ret =3D ingenic_tcu_regi=
ster_clock(tcu, i, TCU_PARENT_EXT,
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  394  						 &ingenic_tcu_clk_in=
fo[i],
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  395  						 tcu->clocks);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  396  		if (ret) {
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  397  			pr_crit("cannot registe=
r clock %d\n", i);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  398  			goto err_unregister_tim=
er_clocks;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  399  		}
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  400  	}
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  401  =

4f89e4b8f1215c1 Paul Cercueil   2019-07-24  402  	/*
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  403  	 * We set EXT as the defa=
ult parent clock for all the TCU clocks
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  404  	 * except for the watchdo=
g one, where we set the RTC clock as the
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  405  	 * parent. Since the EXT =
and PCLK are much faster than the RTC clock,
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  406  	 * the watchdog would kic=
k after a maximum time of 5s, and we might
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  407  	 * want a slower kicking =
time.
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  408  	 */
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  409  	ret =3D ingenic_tcu_regis=
ter_clock(tcu, TCU_CLK_WDT, TCU_PARENT_RTC,
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  410  					 &ingenic_tcu_watchdo=
g_clk_info,
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  411  					 tcu->clocks);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  412  	if (ret) {
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  413  		pr_crit("cannot register=
 watchdog clock\n");
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  414  		goto err_unregister_time=
r_clocks;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  415  	}
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  416  =

4f89e4b8f1215c1 Paul Cercueil   2019-07-24  417  	if (tcu->soc_info->has_os=
t) {
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  418  		ret =3D ingenic_tcu_regi=
ster_clock(tcu, TCU_CLK_OST,
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  419  						 TCU_PARENT_EXT,
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  420  						 &ingenic_tcu_ost_cl=
k_info,
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  421  						 tcu->clocks);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  422  		if (ret) {
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  423  			pr_crit("cannot registe=
r ost clock\n");
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  424  			goto err_unregister_wat=
chdog_clock;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  425  		}
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  426  	}
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  427  =

4f89e4b8f1215c1 Paul Cercueil   2019-07-24  428  	ret =3D of_clk_add_hw_pro=
vider(np, of_clk_hw_onecell_get, tcu->clocks);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  429  	if (ret) {
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  430  		pr_crit("cannot add OF c=
lock provider\n");
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  431  		goto err_unregister_ost_=
clock;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  432  	}
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  433  =

4f89e4b8f1215c1 Paul Cercueil   2019-07-24  434  	ingenic_tcu =3D tcu;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  435  =

4f89e4b8f1215c1 Paul Cercueil   2019-07-24  436  	return 0;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  437  =

4f89e4b8f1215c1 Paul Cercueil   2019-07-24  438  err_unregister_ost_clock:
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  439  	if (tcu->soc_info->has_os=
t)
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  440  		clk_hw_unregister(tcu->c=
locks->hws[i + 1]);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  441  err_unregister_watchdog_cl=
ock:
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  442  	clk_hw_unregister(tcu->cl=
ocks->hws[i]);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  443  err_unregister_timer_clock=
s:
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  444  	for (i =3D 0; i < tcu->cl=
ocks->num; i++)
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  445  		if (tcu->clocks->hws[i])
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  446  			clk_hw_unregister(tcu->=
clocks->hws[i]);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  447  	kfree(tcu->clocks);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  448  err_clk_disable:
8c04eee82a9d67a Aidan MacDonald 2022-04-11  449  	if (tcu->clk)
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  450  		clk_disable_unprepare(tc=
u->clk);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  451  err_put_clk:
8c04eee82a9d67a Aidan MacDonald 2022-04-11  452  	if (tcu->clk)
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  453  		clk_put(tcu->clk);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  454  err_free_tcu:
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  455  	kfree(tcu);
4f89e4b8f1215c1 Paul Cercueil   2019-07-24 @456  	return ret;
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  457  }
4f89e4b8f1215c1 Paul Cercueil   2019-07-24  458  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9045629997696021217==--

