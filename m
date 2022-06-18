Content-Type: multipart/mixed; boundary="===============1187613642430789145=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/renesas/r9a07g044-cpg.c:136:3: warning: Signed integer overflow for expression '0xBE8<<20'. [integerOverflow]
Date: Sun, 19 Jun 2022 06:33:09 +0800
Message-ID: <202206190643.04yL0TZq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1187613642430789145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/c=
lk/renesas/r9a07g044-cpg.c:136:3: warning: Signed integer overflow for expr=
ession '0xBE8<<20'. [integerOverflow]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 60191843db7812dba4fdd2790a2d646721e13b21 clk: renesas: r9a07g044: A=
dd M1 clock support
date:   6 weeks ago
:::::: branch date: 26 hours ago
:::::: commit date: 6 weeks ago
compiler: microblaze-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 60191843db7812dba4fdd2790a2d646721e13b21
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/renesas/r9a07g044-cpg.c:136:3: warning: Signed integer overf=
low for expression '0xBE8<<20'. [integerOverflow]
     DEF_PLL5_4_MUX(".sel_pll5_4", CLK_SEL_PLL5_4, SEL_PLL5_4,
     ^

vim +136 drivers/clk/renesas/r9a07g044-cpg.c

70a4af3662e073 Biju Das      2021-09-22   87  =

a1bcf50a99dd1e Biju Das      2022-02-05   88  static const struct {
60191843db7812 Biju Das      2022-04-30   89  	struct cpg_core_clk common[4=
8];
a1bcf50a99dd1e Biju Das      2022-02-05   90  #ifdef CONFIG_CLK_R9A07G054
a1bcf50a99dd1e Biju Das      2022-02-05   91  	struct cpg_core_clk drp[0];
a1bcf50a99dd1e Biju Das      2022-02-05   92  #endif
a1bcf50a99dd1e Biju Das      2022-02-05   93  } core_clks __initconst =3D {
a1bcf50a99dd1e Biju Das      2022-02-05   94  	.common =3D {
17f0ff3d49ff1a Lad Prabhakar 2021-06-09   95  		/* External Clock Inputs */
17f0ff3d49ff1a Lad Prabhakar 2021-06-09   96  		DEF_INPUT("extal", CLK_EXTA=
L),
17f0ff3d49ff1a Lad Prabhakar 2021-06-09   97  =

17f0ff3d49ff1a Lad Prabhakar 2021-06-09   98  		/* Internal Core Clocks */
17f0ff3d49ff1a Lad Prabhakar 2021-06-09   99  		DEF_FIXED(".osc", R9A07G044=
_OSCCLK, CLK_EXTAL, 1, 1),
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  100  		DEF_FIXED(".osc_div1000", C=
LK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  101  		DEF_SAMPLL(".pll1", CLK_PLL=
1, CLK_EXTAL, PLL146_CONF(0)),
b289cdecc7c3e2 Lad Prabhakar 2021-12-23  102  		DEF_FIXED(".pll2", CLK_PLL2=
, CLK_EXTAL, 200, 3),
b289cdecc7c3e2 Lad Prabhakar 2021-12-23  103  		DEF_FIXED(".pll3", CLK_PLL3=
, CLK_EXTAL, 200, 3),
f294a0ea9d12a6 Lad Prabhakar 2021-09-28  104  		DEF_FIXED(".pll3_400", CLK_=
PLL3_400, CLK_PLL3, 1, 4),
f294a0ea9d12a6 Lad Prabhakar 2021-09-28  105  		DEF_FIXED(".pll3_533", CLK_=
PLL3_533, CLK_PLL3, 1, 3),
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  106  =

70a4af3662e073 Biju Das      2021-09-22  107  		DEF_FIXED(".pll5", CLK_PLL5=
, CLK_EXTAL, 125, 1),
70a4af3662e073 Biju Das      2021-09-22  108  		DEF_FIXED(".pll5_fout3", CL=
K_PLL5_FOUT3, CLK_PLL5, 1, 6),
70a4af3662e073 Biju Das      2021-09-22  109  =

70a4af3662e073 Biju Das      2021-09-22  110  		DEF_FIXED(".pll6", CLK_PLL6=
, CLK_EXTAL, 125, 6),
70a4af3662e073 Biju Das      2021-09-22  111  =

17f0ff3d49ff1a Lad Prabhakar 2021-06-09  112  		DEF_FIXED(".pll2_div2", CLK=
_PLL2_DIV2, CLK_PLL2, 1, 2),
373bd6f487562e Biju Das      2021-10-07  113  		DEF_FIXED(".clk_800", CLK_P=
LL2_800, CLK_PLL2, 1, 2),
373bd6f487562e Biju Das      2021-10-07  114  		DEF_FIXED(".clk_533", CLK_P=
LL2_SDHI_533, CLK_PLL2, 1, 3),
373bd6f487562e Biju Das      2021-10-07  115  		DEF_FIXED(".clk_400", CLK_P=
LL2_SDHI_400, CLK_PLL2_800, 1, 2),
373bd6f487562e Biju Das      2021-10-07  116  		DEF_FIXED(".clk_266", CLK_P=
LL2_SDHI_266, CLK_PLL2_SDHI_533, 1, 2),
373bd6f487562e Biju Das      2021-10-07  117  =

dc446cba4301bb Biju Das      2021-11-10  118  		DEF_FIXED(".pll2_div2_8", C=
LK_PLL2_DIV2_8, CLK_PLL2_DIV2, 1, 8),
dc446cba4301bb Biju Das      2021-11-10  119  		DEF_FIXED(".pll2_div2_10", =
CLK_PLL2_DIV2_10, CLK_PLL2_DIV2, 1, 10),
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  120  =

17f0ff3d49ff1a Lad Prabhakar 2021-06-09  121  		DEF_FIXED(".pll3_div2", CLK=
_PLL3_DIV2, CLK_PLL3, 1, 2),
98ee8b2f66ebff Biju Das      2021-12-03  122  		DEF_FIXED(".pll3_div2_2", C=
LK_PLL3_DIV2_2, CLK_PLL3_DIV2, 1, 2),
fd8c3f6c36eb09 Biju Das      2021-06-26  123  		DEF_FIXED(".pll3_div2_4", C=
LK_PLL3_DIV2_4, CLK_PLL3_DIV2, 1, 4),
668756f7299d2d Biju Das      2021-06-26  124  		DEF_FIXED(".pll3_div2_4_2",=
 CLK_PLL3_DIV2_4_2, CLK_PLL3_DIV2_4, 1, 2),
f294a0ea9d12a6 Lad Prabhakar 2021-09-28  125  		DEF_MUX(".sel_pll3_3", CLK_=
SEL_PLL3_3, SEL_PLL3_3,
f294a0ea9d12a6 Lad Prabhakar 2021-09-28  126  			sel_pll3_3, ARRAY_SIZE(sel=
_pll3_3), 0, CLK_MUX_READ_ONLY),
f294a0ea9d12a6 Lad Prabhakar 2021-09-28  127  		DEF_DIV("divpl3c", CLK_DIV_=
PLL3_C, CLK_SEL_PLL3_3,
f294a0ea9d12a6 Lad Prabhakar 2021-09-28  128  			DIVPL3C, dtable_1_32, CLK_=
DIVIDER_HIWORD_MASK),
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  129  =

70a4af3662e073 Biju Das      2021-09-22  130  		DEF_FIXED(".pll5_250", CLK_=
PLL5_250, CLK_PLL5_FOUT3, 1, 2),
70a4af3662e073 Biju Das      2021-09-22  131  		DEF_FIXED(".pll6_250", CLK_=
PLL6_250, CLK_PLL6, 1, 2),
7ef9c45a23a907 Biju Das      2021-12-03  132  		DEF_MUX(".sel_gpu2", CLK_SE=
L_GPU2, SEL_GPU2,
7ef9c45a23a907 Biju Das      2021-12-03  133  			sel_gpu2, ARRAY_SIZE(sel_g=
pu2), 0, CLK_MUX_READ_ONLY),
60191843db7812 Biju Das      2022-04-30  134  		DEF_PLL5_FOUTPOSTDIV(".pll5=
_foutpostdiv", CLK_PLL5_FOUTPOSTDIV, CLK_EXTAL),
60191843db7812 Biju Das      2022-04-30  135  		DEF_FIXED(".pll5_fout1ph0",=
 CLK_PLL5_FOUT1PH0, CLK_PLL5_FOUTPOSTDIV, 1, 2),
60191843db7812 Biju Das      2022-04-30 @136  		DEF_PLL5_4_MUX(".sel_pll5_4=
", CLK_SEL_PLL5_4, SEL_PLL5_4,
60191843db7812 Biju Das      2022-04-30  137  			       sel_pll5_4, ARRAY_S=
IZE(sel_pll5_4)),
70a4af3662e073 Biju Das      2021-09-22  138  =

17f0ff3d49ff1a Lad Prabhakar 2021-06-09  139  		/* Core output clk */
d6dabaf6789717 Biju Das      2021-11-12  140  		DEF_DIV("I", R9A07G044_CLK_=
I, CLK_PLL1, DIVPL1A, dtable_1_8,
d6dabaf6789717 Biju Das      2021-11-12  141  			CLK_DIVIDER_HIWORD_MASK),
dc446cba4301bb Biju Das      2021-11-10  142  		DEF_DIV("P0", R9A07G044_CLK=
_P0, CLK_PLL2_DIV2_8, DIVPL2A,
e93c1373613fb2 Biju Das      2021-06-26  143  			dtable_1_32, CLK_DIVIDER_H=
IWORD_MASK),
d28b1e03dc8d10 Lad Prabhakar 2021-07-19  144  		DEF_FIXED("P0_DIV2", R9A07G=
044_CLK_P0_DIV2, R9A07G044_CLK_P0, 1, 2),
dc446cba4301bb Biju Das      2021-11-10  145  		DEF_FIXED("TSU", R9A07G044_=
CLK_TSU, CLK_PLL2_DIV2_10, 1, 1),
fd8c3f6c36eb09 Biju Das      2021-06-26  146  		DEF_DIV("P1", R9A07G044_CLK=
_P1, CLK_PLL3_DIV2_4,
e93c1373613fb2 Biju Das      2021-06-26  147  			DIVPL3B, dtable_1_32, CLK_=
DIVIDER_HIWORD_MASK),
eb829e549ba65e Biju Das      2021-06-26  148  		DEF_FIXED("P1_DIV2", CLK_P1=
_DIV2, R9A07G044_CLK_P1, 1, 2),
668756f7299d2d Biju Das      2021-06-26  149  		DEF_DIV("P2", R9A07G044_CLK=
_P2, CLK_PLL3_DIV2_4_2,
668756f7299d2d Biju Das      2021-06-26  150  			DIVPL3A, dtable_1_32, CLK_=
DIVIDER_HIWORD_MASK),
70a4af3662e073 Biju Das      2021-09-22  151  		DEF_FIXED("M0", R9A07G044_C=
LK_M0, CLK_PLL3_DIV2_4, 1, 1),
70a4af3662e073 Biju Das      2021-09-22  152  		DEF_FIXED("ZT", R9A07G044_C=
LK_ZT, CLK_PLL3_DIV2_4_2, 1, 1),
70a4af3662e073 Biju Das      2021-09-22  153  		DEF_MUX("HP", R9A07G044_CLK=
_HP, SEL_PLL6_2,
70a4af3662e073 Biju Das      2021-09-22  154  			sel_pll6_2, ARRAY_SIZE(sel=
_pll6_2), 0, CLK_MUX_HIWORD_MASK),
f294a0ea9d12a6 Lad Prabhakar 2021-09-28  155  		DEF_FIXED("SPI0", R9A07G044=
_CLK_SPI0, CLK_DIV_PLL3_C, 1, 2),
f294a0ea9d12a6 Lad Prabhakar 2021-09-28  156  		DEF_FIXED("SPI1", R9A07G044=
_CLK_SPI1, CLK_DIV_PLL3_C, 1, 4),
373bd6f487562e Biju Das      2021-10-07  157  		DEF_SD_MUX("SD0", R9A07G044=
_CLK_SD0, SEL_SDHI0,
373bd6f487562e Biju Das      2021-10-07  158  			   sel_shdi, ARRAY_SIZE(se=
l_shdi)),
373bd6f487562e Biju Das      2021-10-07  159  		DEF_SD_MUX("SD1", R9A07G044=
_CLK_SD1, SEL_SDHI1,
373bd6f487562e Biju Das      2021-10-07  160  			   sel_shdi, ARRAY_SIZE(se=
l_shdi)),
373bd6f487562e Biju Das      2021-10-07  161  		DEF_FIXED("SD0_DIV4", CLK_S=
D0_DIV4, R9A07G044_CLK_SD0, 1, 4),
373bd6f487562e Biju Das      2021-10-07  162  		DEF_FIXED("SD1_DIV4", CLK_S=
D1_DIV4, R9A07G044_CLK_SD1, 1, 4),
7ef9c45a23a907 Biju Das      2021-12-03  163  		DEF_DIV("G", R9A07G044_CLK_=
G, CLK_SEL_GPU2, DIVGPU, dtable_1_8,
7ef9c45a23a907 Biju Das      2021-12-03  164  			CLK_DIVIDER_HIWORD_MASK),
60191843db7812 Biju Das      2022-04-30  165  		DEF_FIXED("M1", R9A07G044_C=
LK_M1, CLK_PLL5_FOUTPOSTDIV, 1, 1),
a1bcf50a99dd1e Biju Das      2022-02-05  166  	},
a1bcf50a99dd1e Biju Das      2022-02-05  167  #ifdef CONFIG_CLK_R9A07G054
a1bcf50a99dd1e Biju Das      2022-02-05  168  	.drp =3D {
a1bcf50a99dd1e Biju Das      2022-02-05  169  	},
a1bcf50a99dd1e Biju Das      2022-02-05  170  #endif
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  171  };
17f0ff3d49ff1a Lad Prabhakar 2021-06-09  172  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1187613642430789145==--

