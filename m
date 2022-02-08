Content-Type: multipart/mixed; boundary="===============4417301793271357723=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/socfpga/clk-periph-s10.c:113 s10_register_periph() warn: possible memory leak of 'periph_clk'
Date: Wed, 09 Feb 2022 04:57:32 +0800
Message-ID: <202202090402.hvCZnqEv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4417301793271357723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   555f3d7be91a873114c9656069f1a9fa476ec41a
commit: 1e688dd2a3d6759d416616ff07afc4bb836c4213 powerpc/bug: Provide bette=
r flexibility to WARN_ON/__WARN_FLAGS() with asm goto
date:   6 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 months ago
config: powerpc-randconfig-m031-20220208 (https://download.01.org/0day-ci/a=
rchive/20220209/202202090402.hvCZnqEv-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/clk/socfpga/clk-periph-s10.c:113 s10_register_periph() warn: possib=
le memory leak of 'periph_clk'
drivers/clk/socfpga/clk-periph-s10.c:149 n5x_register_periph() warn: possib=
le memory leak of 'periph_clk'
drivers/clk/socfpga/clk-periph-s10.c:184 s10_register_cnt_periph() warn: po=
ssible memory leak of 'periph_clk'
drivers/clk/bcm/clk-iproc-armpll.c:253 iproc_armpll_setup() warn: possible =
memory leak of 'pll'
drivers/usb/gadget/udc/aspeed-vhub/ep0.c:155 ast_vhub_ep0_handle_setup() er=
ror: we previously assumed 'ep->dev' could be null (see line 130)
drivers/clk/socfpga/clk-pll-s10.c:201 s10_register_pll() warn: possible mem=
ory leak of 'pll_clk'
drivers/clk/socfpga/clk-pll-s10.c:241 agilex_register_pll() warn: possible =
memory leak of 'pll_clk'
drivers/clk/socfpga/clk-pll-s10.c:280 n5x_register_pll() warn: possible mem=
ory leak of 'pll_clk'
kernel/rcu/update.c:546 early_boot_test_call_rcu() warn: possible memory le=
ak of 'rhp'
drivers/clk/bcm/clk-iproc-pll.c:745 iproc_pll_clk_setup() warn: possible me=
mory leak of 'pll'
drivers/clk/bcm/clk-iproc-pll.c:868 iproc_pll_clk_setup() warn: possible me=
mory leak of 'clk_data'
drivers/clk/bcm/clk-iproc-asiu.c:198 iproc_asiu_setup() warn: possible memo=
ry leak of 'asiu'
net/kcm/kcmsock.c:645 kcm_write_msgs() error: we previously assumed 'psock'=
 could be null (see line 585)
sound/soc/samsung/i2s.c:576 i2s_set_sysclk() warn: passing zero to 'PTR_ERR'
drivers/mmc/host/meson-gx-mmc.c:467 meson_mmc_clk_init() warn: passing zero=
 to 'PTR_ERR'
drivers/mmc/host/meson-mx-sdio.c:603 meson_mx_mmc_register_clks() warn: pas=
sing zero to 'PTR_ERR'
drivers/clk/imx/clk-imx8mm.c:420 imx8mm_clocks_probe() warn: passing zero t=
o 'PTR_ERR'
drivers/clk/imx/clk-imx8mq.c:399 imx8mq_clocks_probe() warn: passing zero t=
o 'PTR_ERR'
drivers/iio/adc/meson_saradc.c:676 meson_sar_adc_clk_init() warn: passing z=
ero to 'PTR_ERR'

Old smatch warnings:
drivers/mmc/host/meson-gx-mmc.c:490 meson_mmc_clk_init() warn: passing zero=
 to 'PTR_ERR'
drivers/mmc/host/meson-mx-sdio.c:624 meson_mx_mmc_register_clks() warn: pas=
sing zero to 'PTR_ERR'
drivers/clk/imx/clk-imx8mm.c:636 imx8mm_clocks_probe() warn: 'base' not rel=
eased on lines: 326,636.
drivers/clk/imx/clk-imx8mq.c:611 imx8mq_clocks_probe() warn: 'base' not rel=
eased on lines: 312,611.
drivers/iio/adc/meson_saradc.c:695 meson_sar_adc_clk_init() warn: passing z=
ero to 'PTR_ERR'

vim +/periph_clk +113 drivers/clk/socfpga/clk-periph-s10.c

07afb8db7340f9 Dinh Nguyen 2018-03-21  100  =

ba7e258425acd8 Dinh Nguyen 2021-03-02  101  struct clk_hw *s10_register_per=
iph(const struct stratix10_perip_c_clock *clks,
8c0e783d2c7be2 Dinh Nguyen 2020-01-14  102  				void __iomem *reg)
07afb8db7340f9 Dinh Nguyen 2018-03-21  103  {
ba7e258425acd8 Dinh Nguyen 2021-03-02  104  	struct clk_hw *hw_clk;
07afb8db7340f9 Dinh Nguyen 2018-03-21  105  	struct socfpga_periph_clk *per=
iph_clk;
07afb8db7340f9 Dinh Nguyen 2018-03-21  106  	struct clk_init_data init;
8c0e783d2c7be2 Dinh Nguyen 2020-01-14  107  	const char *name =3D clks->nam=
e;
8c0e783d2c7be2 Dinh Nguyen 2020-01-14  108  	const char *parent_name =3D cl=
ks->parent_name;
ba7e258425acd8 Dinh Nguyen 2021-03-02  109  	int ret;
07afb8db7340f9 Dinh Nguyen 2018-03-21  110  =

07afb8db7340f9 Dinh Nguyen 2018-03-21  111  	periph_clk =3D kzalloc(sizeof(=
*periph_clk), GFP_KERNEL);
07afb8db7340f9 Dinh Nguyen 2018-03-21  112  	if (WARN_ON(!periph_clk))
07afb8db7340f9 Dinh Nguyen 2018-03-21 @113  		return NULL;
07afb8db7340f9 Dinh Nguyen 2018-03-21  114  =

8c0e783d2c7be2 Dinh Nguyen 2020-01-14  115  	periph_clk->hw.reg =3D reg + c=
lks->offset;
07afb8db7340f9 Dinh Nguyen 2018-03-21  116  =

07afb8db7340f9 Dinh Nguyen 2018-03-21  117  	init.name =3D name;
07afb8db7340f9 Dinh Nguyen 2018-03-21  118  	init.ops =3D &peri_c_clk_ops;
8c0e783d2c7be2 Dinh Nguyen 2020-01-14  119  	init.flags =3D clks->flags;
07afb8db7340f9 Dinh Nguyen 2018-03-21  120  =

8c0e783d2c7be2 Dinh Nguyen 2020-01-14  121  	init.num_parents =3D clks->num=
_parents;
762d961aee4042 Dinh Nguyen 2020-05-12  122  	init.parent_names =3D parent_n=
ame ? &parent_name : NULL;
762d961aee4042 Dinh Nguyen 2020-05-12  123  	if (init.parent_names =3D=3D N=
ULL)
762d961aee4042 Dinh Nguyen 2020-05-12  124  		init.parent_data =3D clks->pa=
rent_data;
07afb8db7340f9 Dinh Nguyen 2018-03-21  125  =

07afb8db7340f9 Dinh Nguyen 2018-03-21  126  	periph_clk->hw.hw.init =3D &in=
it;
ba7e258425acd8 Dinh Nguyen 2021-03-02  127  	hw_clk =3D &periph_clk->hw.hw;
07afb8db7340f9 Dinh Nguyen 2018-03-21  128  =

ba7e258425acd8 Dinh Nguyen 2021-03-02  129  	ret =3D clk_hw_register(NULL, =
hw_clk);
ba7e258425acd8 Dinh Nguyen 2021-03-02  130  	if (ret) {
07afb8db7340f9 Dinh Nguyen 2018-03-21  131  		kfree(periph_clk);
ba7e258425acd8 Dinh Nguyen 2021-03-02  132  		return ERR_PTR(ret);
07afb8db7340f9 Dinh Nguyen 2018-03-21  133  	}
ba7e258425acd8 Dinh Nguyen 2021-03-02  134  	return hw_clk;
07afb8db7340f9 Dinh Nguyen 2018-03-21  135  }
07afb8db7340f9 Dinh Nguyen 2018-03-21  136  =

ba7e258425acd8 Dinh Nguyen 2021-03-02  137  struct clk_hw *n5x_register_per=
iph(const struct n5x_perip_c_clock *clks,
a0f9819cbe9952 Dinh Nguyen 2021-02-12  138  				void __iomem *regbase)
a0f9819cbe9952 Dinh Nguyen 2021-02-12  139  {
ba7e258425acd8 Dinh Nguyen 2021-03-02  140  	struct clk_hw *hw_clk;
a0f9819cbe9952 Dinh Nguyen 2021-02-12  141  	struct socfpga_periph_clk *per=
iph_clk;
a0f9819cbe9952 Dinh Nguyen 2021-02-12  142  	struct clk_init_data init;
a0f9819cbe9952 Dinh Nguyen 2021-02-12  143  	const char *name =3D clks->nam=
e;
a0f9819cbe9952 Dinh Nguyen 2021-02-12  144  	const char *parent_name =3D cl=
ks->parent_name;
ba7e258425acd8 Dinh Nguyen 2021-03-02  145  	int ret;
a0f9819cbe9952 Dinh Nguyen 2021-02-12  146  =

a0f9819cbe9952 Dinh Nguyen 2021-02-12  147  	periph_clk =3D kzalloc(sizeof(=
*periph_clk), GFP_KERNEL);
a0f9819cbe9952 Dinh Nguyen 2021-02-12  148  	if (WARN_ON(!periph_clk))
a0f9819cbe9952 Dinh Nguyen 2021-02-12 @149  		return NULL;
a0f9819cbe9952 Dinh Nguyen 2021-02-12  150  =

a0f9819cbe9952 Dinh Nguyen 2021-02-12  151  	periph_clk->hw.reg =3D regbase=
 + clks->offset;
a0f9819cbe9952 Dinh Nguyen 2021-02-12  152  	periph_clk->shift =3D clks->sh=
ift;
a0f9819cbe9952 Dinh Nguyen 2021-02-12  153  =

a0f9819cbe9952 Dinh Nguyen 2021-02-12  154  	init.name =3D name;
a0f9819cbe9952 Dinh Nguyen 2021-02-12  155  	init.ops =3D &n5x_peri_c_clk_o=
ps;
a0f9819cbe9952 Dinh Nguyen 2021-02-12  156  	init.flags =3D clks->flags;
a0f9819cbe9952 Dinh Nguyen 2021-02-12  157  =

a0f9819cbe9952 Dinh Nguyen 2021-02-12  158  	init.num_parents =3D clks->num=
_parents;
a0f9819cbe9952 Dinh Nguyen 2021-02-12  159  	init.parent_names =3D parent_n=
ame ? &parent_name : NULL;
a0f9819cbe9952 Dinh Nguyen 2021-02-12  160  =

a0f9819cbe9952 Dinh Nguyen 2021-02-12  161  	periph_clk->hw.hw.init =3D &in=
it;
ba7e258425acd8 Dinh Nguyen 2021-03-02  162  	hw_clk =3D &periph_clk->hw.hw;
a0f9819cbe9952 Dinh Nguyen 2021-02-12  163  =

ba7e258425acd8 Dinh Nguyen 2021-03-02  164  	ret =3D clk_hw_register(NULL, =
hw_clk);
ba7e258425acd8 Dinh Nguyen 2021-03-02  165  	if (ret) {
a0f9819cbe9952 Dinh Nguyen 2021-02-12  166  		kfree(periph_clk);
ba7e258425acd8 Dinh Nguyen 2021-03-02  167  		return ERR_PTR(ret);
a0f9819cbe9952 Dinh Nguyen 2021-02-12  168  	}
ba7e258425acd8 Dinh Nguyen 2021-03-02  169  	return hw_clk;
a0f9819cbe9952 Dinh Nguyen 2021-02-12  170  }
a0f9819cbe9952 Dinh Nguyen 2021-02-12  171  =

ba7e258425acd8 Dinh Nguyen 2021-03-02  172  struct clk_hw *s10_register_cnt=
_periph(const struct stratix10_perip_cnt_clock *clks,
8c0e783d2c7be2 Dinh Nguyen 2020-01-14  173  				    void __iomem *regbase)
07afb8db7340f9 Dinh Nguyen 2018-03-21  174  {
ba7e258425acd8 Dinh Nguyen 2021-03-02  175  	struct clk_hw *hw_clk;
07afb8db7340f9 Dinh Nguyen 2018-03-21  176  	struct socfpga_periph_clk *per=
iph_clk;
07afb8db7340f9 Dinh Nguyen 2018-03-21  177  	struct clk_init_data init;
8c0e783d2c7be2 Dinh Nguyen 2020-01-14  178  	const char *name =3D clks->nam=
e;
8c0e783d2c7be2 Dinh Nguyen 2020-01-14  179  	const char *parent_name =3D cl=
ks->parent_name;
ba7e258425acd8 Dinh Nguyen 2021-03-02  180  	int ret;
07afb8db7340f9 Dinh Nguyen 2018-03-21  181  =

07afb8db7340f9 Dinh Nguyen 2018-03-21  182  	periph_clk =3D kzalloc(sizeof(=
*periph_clk), GFP_KERNEL);
07afb8db7340f9 Dinh Nguyen 2018-03-21  183  	if (WARN_ON(!periph_clk))
07afb8db7340f9 Dinh Nguyen 2018-03-21 @184  		return NULL;

:::::: The code at line 113 was first introduced by commit
:::::: 07afb8db7340f9b6051a26c5c28f2ce74148f6b5 clk: socfpga: stratix10: ad=
d clock driver for Stratix10 platform

:::::: TO: Dinh Nguyen <dinguyen@kernel.org>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4417301793271357723==--

