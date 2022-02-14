Content-Type: multipart/mixed; boundary="===============2597048145691717687=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:251 inno_dsidphy_pll_calc_rate() warn: 'tmp' 123456789 can't fit into 65535 '_fbdiv'
Date: Tue, 15 Feb 2022 04:54:47 +0800
Message-ID: <202202150413.GDbtzyhF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2597048145691717687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Masahiro,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d567f5db412ed52de0b3b3efca4a451263de6108
commit: ea29b20a828511de3348334e529a3d046a180416 init/Kconfig: make COMPILE=
_TEST depend on HAS_IOMEM
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-m031-20220214 (https://download.01.org/0day-ci/arch=
ive/20220215/202202150413.GDbtzyhF-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:251 inno_dsidphy_pll_calc_=
rate() warn: 'tmp' 123456789 can't fit into 65535 '_fbdiv'
drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:1957 mx23_boot_init() warn: shou=
ld 'block << chip->phys_erase_shift' be a 64 bit type?

vim +251 drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c

b7535a3bc0bac7 Wyon Bi        2019-10-24  218  =

f0684c1a836770 Heiko Stuebner 2019-11-08  219  static unsigned long inno_ds=
idphy_pll_calc_rate(struct inno_dsidphy *inno,
f0684c1a836770 Heiko Stuebner 2019-11-08  220  						unsigned long rate)
b7535a3bc0bac7 Wyon Bi        2019-10-24  221  {
f0684c1a836770 Heiko Stuebner 2019-11-08  222  	unsigned long prate =3D clk=
_get_rate(inno->ref_clk);
f0684c1a836770 Heiko Stuebner 2019-11-08  223  	unsigned long best_freq =3D=
 0;
f0684c1a836770 Heiko Stuebner 2019-11-08  224  	unsigned long fref, fout;
f0684c1a836770 Heiko Stuebner 2019-11-08  225  	u8 min_prediv, max_prediv;
f0684c1a836770 Heiko Stuebner 2019-11-08  226  	u8 _prediv, best_prediv =3D=
 1;
f0684c1a836770 Heiko Stuebner 2019-11-08  227  	u16 _fbdiv, best_fbdiv =3D =
1;
f0684c1a836770 Heiko Stuebner 2019-11-08  228  	u32 min_delta =3D UINT_MAX;
f0684c1a836770 Heiko Stuebner 2019-11-08  229  =

f0684c1a836770 Heiko Stuebner 2019-11-08  230  	/*
f0684c1a836770 Heiko Stuebner 2019-11-08  231  	 * The PLL output frequency=
 can be calculated using a simple formula:
f0684c1a836770 Heiko Stuebner 2019-11-08  232  	 * PLL_Output_Frequency =3D=
 (FREF / PREDIV * FBDIV) / 2
f0684c1a836770 Heiko Stuebner 2019-11-08  233  	 * PLL_Output_Frequency: it=
 is equal to DDR-Clock-Frequency * 2
f0684c1a836770 Heiko Stuebner 2019-11-08  234  	 */
f0684c1a836770 Heiko Stuebner 2019-11-08  235  	fref =3D prate / 2;
f0684c1a836770 Heiko Stuebner 2019-11-08  236  	if (rate > 1000000000UL)
f0684c1a836770 Heiko Stuebner 2019-11-08  237  		fout =3D 1000000000UL;
f0684c1a836770 Heiko Stuebner 2019-11-08  238  	else
f0684c1a836770 Heiko Stuebner 2019-11-08  239  		fout =3D rate;
f0684c1a836770 Heiko Stuebner 2019-11-08  240  =

f0684c1a836770 Heiko Stuebner 2019-11-08  241  	/* 5Mhz < Fref / prediv < 4=
0MHz */
f0684c1a836770 Heiko Stuebner 2019-11-08  242  	min_prediv =3D DIV_ROUND_UP=
(fref, 40000000);
f0684c1a836770 Heiko Stuebner 2019-11-08  243  	max_prediv =3D fref / 50000=
00;
f0684c1a836770 Heiko Stuebner 2019-11-08  244  =

f0684c1a836770 Heiko Stuebner 2019-11-08  245  	for (_prediv =3D min_prediv=
; _prediv <=3D max_prediv; _prediv++) {
f0684c1a836770 Heiko Stuebner 2019-11-08  246  		u64 tmp;
f0684c1a836770 Heiko Stuebner 2019-11-08  247  		u32 delta;
f0684c1a836770 Heiko Stuebner 2019-11-08  248  =

f0684c1a836770 Heiko Stuebner 2019-11-08  249  		tmp =3D (u64)fout * _predi=
v;
f0684c1a836770 Heiko Stuebner 2019-11-08  250  		do_div(tmp, fref);
f0684c1a836770 Heiko Stuebner 2019-11-08 @251  		_fbdiv =3D tmp;
f0684c1a836770 Heiko Stuebner 2019-11-08  252  =

f0684c1a836770 Heiko Stuebner 2019-11-08  253  		/*
f0684c1a836770 Heiko Stuebner 2019-11-08  254  		 * The possible settings o=
f feedback divider are
f0684c1a836770 Heiko Stuebner 2019-11-08  255  		 * 12, 13, 14, 16, ~ 511
f0684c1a836770 Heiko Stuebner 2019-11-08  256  		 */
f0684c1a836770 Heiko Stuebner 2019-11-08  257  		if (_fbdiv =3D=3D 15)
f0684c1a836770 Heiko Stuebner 2019-11-08  258  			continue;
f0684c1a836770 Heiko Stuebner 2019-11-08  259  =

f0684c1a836770 Heiko Stuebner 2019-11-08  260  		if (_fbdiv < 12 || _fbdiv =
> 511)
f0684c1a836770 Heiko Stuebner 2019-11-08  261  			continue;
f0684c1a836770 Heiko Stuebner 2019-11-08  262  =

f0684c1a836770 Heiko Stuebner 2019-11-08  263  		tmp =3D (u64)_fbdiv * fref;
f0684c1a836770 Heiko Stuebner 2019-11-08  264  		do_div(tmp, _prediv);
f0684c1a836770 Heiko Stuebner 2019-11-08  265  =

f0684c1a836770 Heiko Stuebner 2019-11-08  266  		delta =3D abs(fout - tmp);
f0684c1a836770 Heiko Stuebner 2019-11-08  267  		if (!delta) {
f0684c1a836770 Heiko Stuebner 2019-11-08  268  			best_prediv =3D _prediv;
f0684c1a836770 Heiko Stuebner 2019-11-08  269  			best_fbdiv =3D _fbdiv;
f0684c1a836770 Heiko Stuebner 2019-11-08  270  			best_freq =3D tmp;
f0684c1a836770 Heiko Stuebner 2019-11-08  271  			break;
f0684c1a836770 Heiko Stuebner 2019-11-08  272  		} else if (delta < min_del=
ta) {
f0684c1a836770 Heiko Stuebner 2019-11-08  273  			best_prediv =3D _prediv;
f0684c1a836770 Heiko Stuebner 2019-11-08  274  			best_fbdiv =3D _fbdiv;
f0684c1a836770 Heiko Stuebner 2019-11-08  275  			best_freq =3D tmp;
f0684c1a836770 Heiko Stuebner 2019-11-08  276  			min_delta =3D delta;
f0684c1a836770 Heiko Stuebner 2019-11-08  277  		}
f0684c1a836770 Heiko Stuebner 2019-11-08  278  	}
f0684c1a836770 Heiko Stuebner 2019-11-08  279  =

f0684c1a836770 Heiko Stuebner 2019-11-08  280  	if (best_freq) {
f0684c1a836770 Heiko Stuebner 2019-11-08  281  		inno->pll.prediv =3D best_=
prediv;
f0684c1a836770 Heiko Stuebner 2019-11-08  282  		inno->pll.fbdiv =3D best_f=
bdiv;
f0684c1a836770 Heiko Stuebner 2019-11-08  283  		inno->pll.rate =3D best_fr=
eq;
f0684c1a836770 Heiko Stuebner 2019-11-08  284  	}
f0684c1a836770 Heiko Stuebner 2019-11-08  285  =

f0684c1a836770 Heiko Stuebner 2019-11-08  286  	return best_freq;
b7535a3bc0bac7 Wyon Bi        2019-10-24  287  }
b7535a3bc0bac7 Wyon Bi        2019-10-24  288  =


:::::: The code at line 251 was first introduced by commit
:::::: f0684c1a836770afba7a7097e61935edd69693bf phy/rockchip: inno-dsidphy:=
 generalize parameter handling

:::::: TO: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
:::::: CC: Kishon Vijay Abraham I <kishon@ti.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2597048145691717687==--

