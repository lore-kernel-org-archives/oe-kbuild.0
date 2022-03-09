Content-Type: multipart/mixed; boundary="===============3089663419388942445=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10110/11353] drivers/clk/imx/clk-pll14xx.c:166:2: warning: Value stored to 'pll_div_ctl1' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 09 Mar 2022 18:47:14 +0800
Message-ID: <202203091812.RuvpyY0C-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3089663419388942445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
CC: Abel Vesa <abel.vesa@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   cb153b68ff91cbc434f3de70ac549e110543e1bb
commit: b09c68dc57c9d44071d83bb935b733f53ea2b2b4 [10110/11353] clk: imx: pl=
l14xx: Support dynamic rates
:::::: branch date: 26 hours ago
:::::: commit date: 5 days ago
config: riscv-randconfig-c006-20220307 (https://download.01.org/0day-ci/arc=
hive/20220309/202203091812.RuvpyY0C-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Db09c68dc57c9d44071d83bb935b733f53ea2b2b4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b09c68dc57c9d44071d83bb935b733f53ea2b2b4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~
   fs/jfs/xattr.c:681:2: note: Taking false branch
           if (xattr_size) {
           ^
   fs/jfs/xattr.c:699:7: note: 'found' is 0
           if (!found) {
                ^~~~~
   fs/jfs/xattr.c:699:2: note: Taking true branch
           if (!found) {
           ^
   fs/jfs/xattr.c:700:7: note: Assuming the condition is false
                   if (flags & XATTR_REPLACE) {
                       ^~~~~~~~~~~~~~~~~~~~~
   fs/jfs/xattr.c:700:3: note: Taking false branch
                   if (flags & XATTR_REPLACE) {
                   ^
   fs/jfs/xattr.c:704:7: note: Assuming 'value' is not equal to NULL
                   if (value =3D=3D NULL) {
                       ^~~~~~~~~~~~~
   fs/jfs/xattr.c:704:3: note: Taking false branch
                   if (value =3D=3D NULL) {
                   ^
   fs/jfs/xattr.c:709:6: note: 'value' is non-null
           if (value)
               ^~~~~
   fs/jfs/xattr.c:709:2: note: Taking true branch
           if (value)
           ^
   fs/jfs/xattr.c:712:6: note: Assuming 'new_size' is <=3D field 'max_size'
           if (new_size > ea_buf.max_size) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/xattr.c:712:2: note: Taking false branch
           if (new_size > ea_buf.max_size) {
           ^
   fs/jfs/xattr.c:727:6: note: 'found' is 0
           if (found) {
               ^~~~~
   fs/jfs/xattr.c:727:2: note: Taking false branch
           if (found) {
           ^
   fs/jfs/xattr.c:736:6: note: 'value' is non-null
           if (value) {
               ^~~~~
   fs/jfs/xattr.c:736:2: note: Taking true branch
           if (value) {
           ^
   fs/jfs/xattr.c:737:7: note: 'xattr_size' is equal to 0
                   if (xattr_size =3D=3D 0)
                       ^~~~~~~~~~
   fs/jfs/xattr.c:737:3: note: Taking true branch
                   if (xattr_size =3D=3D 0)
                   ^
   fs/jfs/xattr.c:749:7: note: Assuming the condition is false
                   if (value_len >=3D USHRT_MAX) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/xattr.c:749:3: note: Taking false branch
                   if (value_len >=3D USHRT_MAX) {
                   ^
   fs/jfs/xattr.c:754:3: note: Null pointer value stored to 'ea'
                   ea =3D (struct jfs_ea *) ((char *) ealist + xattr_size);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/xattr.c:755:12: note: Access to field 'flag' results in a derefer=
ence of a null pointer (loaded from variable 'ea')
                   ea->flag =3D 0;
                   ~~       ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/clk/imx/clk-pll14xx.c:166:2: warning: Value stored to 'pll_div_c=
tl1' is never read [clang-analyzer-deadcode.DeadStores]
           pll_div_ctl1 =3D readl_relaxed(pll->base + DIV_CTL1);
           ^
   drivers/clk/imx/clk-pll14xx.c:166:2: note: Value stored to 'pll_div_ctl1=
' is never read
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/clk/ingenic/cgu.c:512:10: warning: Division by zero [clang-analy=
zer-core.DivideZero]
                   rate =3D DIV_ROUND_UP(parent_rate, div);
                          ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   drivers/clk/ingenic/cgu.c:510:6: note: Assuming the condition is true
           if (clk_info->type & CGU_CLK_DIV) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:510:2: note: Taking true branch
           if (clk_info->type & CGU_CLK_DIV) {
           ^
   drivers/clk/ingenic/cgu.c:511:9: note: Calling 'ingenic_clk_calc_div'
                   div =3D ingenic_clk_calc_div(hw, clk_info, parent_rate, =
req_rate);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/ingenic/cgu.c:443:6: note: Assuming the condition is false
           if (clk_info->div.bypass_mask & BIT(parent))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:443:2: note: Taking false branch
           if (clk_info->div.bypass_mask & BIT(parent))
           ^
   drivers/clk/ingenic/cgu.c:449:6: note: Assuming field 'div_table' is non=
-null
           if (clk_info->div.div_table) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:449:2: note: Taking true branch
           if (clk_info->div.div_table) {
           ^
   drivers/clk/ingenic/cgu.c:450:12: note: Calling 'ingenic_clk_calc_hw_div'
                   hw_div =3D ingenic_clk_calc_hw_div(clk_info, div);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:417:18: note: 'best_i' initialized to 0
           unsigned int i, best_i =3D 0, best =3D (unsigned int)-1;
                           ^~~~~~
   drivers/clk/ingenic/cgu.c:419:14: note: Assuming the condition is true
           for (i =3D 0; i < (1 << clk_info->div.bits)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:419:14: note: Left side of '&&' is true
   drivers/clk/ingenic/cgu.c:419:2: note: Loop condition is false. Executio=
n continues on line 431
           for (i =3D 0; i < (1 << clk_info->div.bits)
           ^
   drivers/clk/ingenic/cgu.c:431:2: note: Returning zero (loaded from 'best=
_i')
           return best_i;
           ^~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:450:12: note: Returning from 'ingenic_clk_calc=
_hw_div'
                   hw_div =3D ingenic_clk_calc_hw_div(clk_info, div);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:450:3: note: The value 0 is assigned to 'hw_di=
v'
                   hw_div =3D ingenic_clk_calc_hw_div(clk_info, div);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:452:3: note: Returning zero
                   return clk_info->div.div_table[hw_div];
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:511:9: note: Returning from 'ingenic_clk_calc_=
div'
                   div =3D ingenic_clk_calc_div(hw, clk_info, parent_rate, =
req_rate);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/ingenic/cgu.c:511:3: note: The value 0 is assigned to 'div'
                   div =3D ingenic_clk_calc_div(hw, clk_info, parent_rate, =
req_rate);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/ingenic/cgu.c:512:10: note: Division by zero
                   rate =3D DIV_ROUND_UP(parent_rate, div);
                          ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   kernel/bpf/btf.c:6739:3: warning: Address of stack memory associated wit=
h local variable 'local_cand' returned to caller [clang-analyzer-core.Stack=
AddressEscape]
                   return ERR_CAST(cands);
                   ^
   kernel/bpf/btf.c:6789:20: note: Assuming field 'kind' is not equal to BP=
F_CORE_TYPE_ID_LOCAL
           bool need_cands =3D relo->kind !=3D BPF_CORE_TYPE_ID_LOCAL;
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/pll_div_ctl1 +166 drivers/clk/imx/clk-pll14xx.c

b09c68dc57c9d44 Sascha Hauer 2022-03-04  128  =

b09c68dc57c9d44 Sascha Hauer 2022-03-04  129  static void imx_pll14xx_calc_=
settings(struct clk_pll14xx *pll, unsigned long rate,
b09c68dc57c9d44 Sascha Hauer 2022-03-04  130  				      unsigned long prate=
, struct imx_pll14xx_rate_table *t)
b09c68dc57c9d44 Sascha Hauer 2022-03-04  131  {
b09c68dc57c9d44 Sascha Hauer 2022-03-04  132  	u32 pll_div_ctl0, pll_div_ct=
l1;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  133  	int mdiv, pdiv, sdiv, kdiv;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  134  	long fvco, rate_min, rate_ma=
x, dist, best =3D LONG_MAX;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  135  	const struct imx_pll14xx_rat=
e_table *tt;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  136  =

b09c68dc57c9d44 Sascha Hauer 2022-03-04  137  	/*
b09c68dc57c9d44 Sascha Hauer 2022-03-04  138  	 * Fractional PLL constrains:
b09c68dc57c9d44 Sascha Hauer 2022-03-04  139  	 *
b09c68dc57c9d44 Sascha Hauer 2022-03-04  140  	 * a) 6MHz <=3D prate <=3D 2=
5MHz
b09c68dc57c9d44 Sascha Hauer 2022-03-04  141  	 * b) 1 <=3D p <=3D 63 (1 <=
=3D p <=3D 4 prate =3D 24MHz)
b09c68dc57c9d44 Sascha Hauer 2022-03-04  142  	 * c) 64 <=3D m <=3D 1023
b09c68dc57c9d44 Sascha Hauer 2022-03-04  143  	 * d) 0 <=3D s <=3D 6
b09c68dc57c9d44 Sascha Hauer 2022-03-04  144  	 * e) -32768 <=3D k <=3D 327=
67
b09c68dc57c9d44 Sascha Hauer 2022-03-04  145  	 *
b09c68dc57c9d44 Sascha Hauer 2022-03-04  146  	 * fvco =3D (m * 65536 + k) =
* prate / (p * 65536)
b09c68dc57c9d44 Sascha Hauer 2022-03-04  147  	 */
b09c68dc57c9d44 Sascha Hauer 2022-03-04  148  =

b09c68dc57c9d44 Sascha Hauer 2022-03-04  149  	/* First try if we can get t=
he desired rate from one of the static entries */
b09c68dc57c9d44 Sascha Hauer 2022-03-04  150  	tt =3D imx_get_pll_settings(=
pll, rate);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  151  	if (tt) {
b09c68dc57c9d44 Sascha Hauer 2022-03-04  152  		pr_debug("%s: in=3D%ld, wan=
t=3D%ld, Using PLL setting from table\n",
b09c68dc57c9d44 Sascha Hauer 2022-03-04  153  			 clk_hw_get_name(&pll->hw)=
, prate, rate);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  154  		t->rate =3D tt->rate;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  155  		t->mdiv =3D tt->mdiv;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  156  		t->pdiv =3D tt->pdiv;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  157  		t->sdiv =3D tt->sdiv;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  158  		t->kdiv =3D tt->kdiv;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  159  		return;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  160  	}
b09c68dc57c9d44 Sascha Hauer 2022-03-04  161  =

b09c68dc57c9d44 Sascha Hauer 2022-03-04  162  	pll_div_ctl0 =3D readl_relax=
ed(pll->base + DIV_CTL0);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  163  	mdiv =3D FIELD_GET(MDIV_MASK=
, pll_div_ctl0);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  164  	pdiv =3D FIELD_GET(PDIV_MASK=
, pll_div_ctl0);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  165  	sdiv =3D FIELD_GET(SDIV_MASK=
, pll_div_ctl0);
b09c68dc57c9d44 Sascha Hauer 2022-03-04 @166  	pll_div_ctl1 =3D readl_relax=
ed(pll->base + DIV_CTL1);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  167  =

b09c68dc57c9d44 Sascha Hauer 2022-03-04  168  	/* Then see if we can get th=
e desired rate by only adjusting kdiv (glitch free) */
b09c68dc57c9d44 Sascha Hauer 2022-03-04  169  	rate_min =3D pll14xx_calc_ra=
te(pll, mdiv, pdiv, sdiv, KDIV_MIN, prate);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  170  	rate_max =3D pll14xx_calc_ra=
te(pll, mdiv, pdiv, sdiv, KDIV_MAX, prate);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  171  =

b09c68dc57c9d44 Sascha Hauer 2022-03-04  172  	if (rate >=3D rate_min && ra=
te <=3D rate_max) {
b09c68dc57c9d44 Sascha Hauer 2022-03-04  173  		kdiv =3D pll1443x_calc_kdiv=
(mdiv, pdiv, sdiv, rate, prate);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  174  		pr_debug("%s: in=3D%ld, wan=
t=3D%ld Only adjust kdiv %ld -> %d\n",
b09c68dc57c9d44 Sascha Hauer 2022-03-04  175  			 clk_hw_get_name(&pll->hw)=
, prate, rate,
b09c68dc57c9d44 Sascha Hauer 2022-03-04  176  			 FIELD_GET(KDIV_MASK, pll_=
div_ctl1), kdiv);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  177  		fvco =3D pll14xx_calc_rate(=
pll, mdiv, pdiv, sdiv, kdiv, prate);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  178  		t->rate =3D (unsigned int)f=
vco;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  179  		t->mdiv =3D mdiv;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  180  		t->pdiv =3D pdiv;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  181  		t->sdiv =3D sdiv;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  182  		t->kdiv =3D kdiv;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  183  		return;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  184  	}
b09c68dc57c9d44 Sascha Hauer 2022-03-04  185  =

b09c68dc57c9d44 Sascha Hauer 2022-03-04  186  	/* Finally calculate best va=
lues */
b09c68dc57c9d44 Sascha Hauer 2022-03-04  187  	for (pdiv =3D 1; pdiv <=3D 7=
; pdiv++) {
b09c68dc57c9d44 Sascha Hauer 2022-03-04  188  		for (sdiv =3D 0; sdiv <=3D =
6; sdiv++) {
b09c68dc57c9d44 Sascha Hauer 2022-03-04  189  			/* calc mdiv =3D round(rat=
e * pdiv * 2^sdiv) / prate) */
b09c68dc57c9d44 Sascha Hauer 2022-03-04  190  			mdiv =3D DIV_ROUND_CLOSEST=
(rate * (pdiv << sdiv), prate);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  191  			mdiv =3D clamp(mdiv, 64, 1=
023);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  192  =

b09c68dc57c9d44 Sascha Hauer 2022-03-04  193  			kdiv =3D pll1443x_calc_kdi=
v(mdiv, pdiv, sdiv, rate, prate);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  194  			fvco =3D pll14xx_calc_rate=
(pll, mdiv, pdiv, sdiv, kdiv, prate);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  195  =

b09c68dc57c9d44 Sascha Hauer 2022-03-04  196  			/* best match */
b09c68dc57c9d44 Sascha Hauer 2022-03-04  197  			dist =3D abs((long)rate - =
(long)fvco);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  198  			if (dist < best) {
b09c68dc57c9d44 Sascha Hauer 2022-03-04  199  				best =3D dist;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  200  				t->rate =3D (unsigned int=
)fvco;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  201  				t->mdiv =3D mdiv;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  202  				t->pdiv =3D pdiv;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  203  				t->sdiv =3D sdiv;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  204  				t->kdiv =3D kdiv;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  205  =

b09c68dc57c9d44 Sascha Hauer 2022-03-04  206  				if (!dist)
b09c68dc57c9d44 Sascha Hauer 2022-03-04  207  					goto found;
b09c68dc57c9d44 Sascha Hauer 2022-03-04  208  			}
b09c68dc57c9d44 Sascha Hauer 2022-03-04  209  		}
b09c68dc57c9d44 Sascha Hauer 2022-03-04  210  	}
b09c68dc57c9d44 Sascha Hauer 2022-03-04  211  found:
b09c68dc57c9d44 Sascha Hauer 2022-03-04  212  	pr_debug("%s: in=3D%ld, want=
=3D%ld got=3D%d (pdiv=3D%d sdiv=3D%d mdiv=3D%d kdiv=3D%d)\n",
b09c68dc57c9d44 Sascha Hauer 2022-03-04  213  		 clk_hw_get_name(&pll->hw),=
 prate, rate, t->rate, t->pdiv, t->sdiv,
b09c68dc57c9d44 Sascha Hauer 2022-03-04  214  		 t->mdiv, t->kdiv);
b09c68dc57c9d44 Sascha Hauer 2022-03-04  215  }
b09c68dc57c9d44 Sascha Hauer 2022-03-04  216  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3089663419388942445==--

