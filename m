Content-Type: multipart/mixed; boundary="===============8215267302009120940=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/ux500/u8500_of_clk.c:548 u8500_clk_init() warn: possible memory leak of 'rstc'
Date: Mon, 02 May 2022 11:35:13 +0800
Message-ID: <202205021108.NpjPDRkt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8215267302009120940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Linus Walleij <linus.walleij@linaro.org>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   672c0c5173427e6b3e2a9bbb7be51ceeec78093a
commit: b14cbdfd467d1e505ad8e03f94e18b3cffc37043 clk: ux500: Add driver for=
 the reset portions of PRCC
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-m031-20220427 (https://download.01.org/0day-ci/archi=
ve/20220502/202205021108.NpjPDRkt-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/ux500/u8500_of_clk.c:548 u8500_clk_init() warn: possible memory=
 leak of 'rstc'

vim +/rstc +548 drivers/clk/ux500/u8500_of_clk.c

b4bdc81b5b234b Lee Jones     2013-07-22   48  =

269f1aac1410d2 Arnd Bergmann 2016-06-20   49  static void u8500_clk_init(st=
ruct device_node *np)
82b0f4b7c576d2 Lee Jones     2013-09-17   50  {
82b0f4b7c576d2 Lee Jones     2013-09-17   51  	struct prcmu_fw_version *fw_=
version;
dec759d8ef01b3 Lee Jones     2013-09-17   52  	struct device_node *child =
=3D NULL;
82b0f4b7c576d2 Lee Jones     2013-09-17   53  	const char *sgaclk_parent =
=3D NULL;
4e33466095e045 Lee Jones     2013-09-17   54  	struct clk *clk, *rtc_clk, *=
twd_clk;
5dc0fe199b3589 Linus Walleij 2015-07-30   55  	u32 bases[CLKRST_MAX];
b14cbdfd467d1e Linus Walleij 2021-09-21   56  	struct u8500_prcc_reset *rst=
c;
5dc0fe199b3589 Linus Walleij 2015-07-30   57  	int i;
82b0f4b7c576d2 Lee Jones     2013-09-17   58  =

b14cbdfd467d1e Linus Walleij 2021-09-21   59  	/*
b14cbdfd467d1e Linus Walleij 2021-09-21   60  	 * We allocate the reset con=
troller here so that we can fill in the
b14cbdfd467d1e Linus Walleij 2021-09-21   61  	 * base addresses properly a=
nd pass to the reset controller init
b14cbdfd467d1e Linus Walleij 2021-09-21   62  	 * function later on.
b14cbdfd467d1e Linus Walleij 2021-09-21   63  	 */
b14cbdfd467d1e Linus Walleij 2021-09-21   64  	rstc =3D kzalloc(sizeof(*rst=
c), GFP_KERNEL);
b14cbdfd467d1e Linus Walleij 2021-09-21   65  	if (!rstc)
b14cbdfd467d1e Linus Walleij 2021-09-21   66  		return;
b14cbdfd467d1e Linus Walleij 2021-09-21   67  =

5dc0fe199b3589 Linus Walleij 2015-07-30   68  	for (i =3D 0; i < ARRAY_SIZE=
(bases); i++) {
5dc0fe199b3589 Linus Walleij 2015-07-30   69  		struct resource r;
5dc0fe199b3589 Linus Walleij 2015-07-30   70  =

5dc0fe199b3589 Linus Walleij 2015-07-30   71  		if (of_address_to_resource(=
np, i, &r))
5dc0fe199b3589 Linus Walleij 2015-07-30   72  			/* Not much choice but to =
continue */
5dc0fe199b3589 Linus Walleij 2015-07-30   73  			pr_err("failed to get CLKR=
ST %d base address\n",
5dc0fe199b3589 Linus Walleij 2015-07-30   74  			       i + 1);
5dc0fe199b3589 Linus Walleij 2015-07-30   75  		bases[i] =3D r.start;
b14cbdfd467d1e Linus Walleij 2021-09-21   76  		rstc->phy_base[i] =3D r.sta=
rt;
5dc0fe199b3589 Linus Walleij 2015-07-30   77  	}
dec759d8ef01b3 Lee Jones     2013-09-17   78  =

82b0f4b7c576d2 Lee Jones     2013-09-17   79  	/* Clock sources */
82b0f4b7c576d2 Lee Jones     2013-09-17   80  	clk =3D clk_reg_prcmu_gate("=
soc0_pll", NULL, PRCMU_PLLSOC0,
66f4ae777d0c2c Stephen Boyd  2016-03-01   81  				CLK_IGNORE_UNUSED);
f9fcb8e8c8f40c Lee Jones     2013-09-17   82  	prcmu_clk[PRCMU_PLLSOC0] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17   83  =

82b0f4b7c576d2 Lee Jones     2013-09-17   84  	clk =3D clk_reg_prcmu_gate("=
soc1_pll", NULL, PRCMU_PLLSOC1,
66f4ae777d0c2c Stephen Boyd  2016-03-01   85  				CLK_IGNORE_UNUSED);
f9fcb8e8c8f40c Lee Jones     2013-09-17   86  	prcmu_clk[PRCMU_PLLSOC1] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17   87  =

82b0f4b7c576d2 Lee Jones     2013-09-17   88  	clk =3D clk_reg_prcmu_gate("=
ddr_pll", NULL, PRCMU_PLLDDR,
66f4ae777d0c2c Stephen Boyd  2016-03-01   89  				CLK_IGNORE_UNUSED);
f9fcb8e8c8f40c Lee Jones     2013-09-17   90  	prcmu_clk[PRCMU_PLLDDR] =3D =
clk;
82b0f4b7c576d2 Lee Jones     2013-09-17   91  =

82b0f4b7c576d2 Lee Jones     2013-09-17   92  	/* FIXME: Add sys, ulp and i=
nt clocks here. */
82b0f4b7c576d2 Lee Jones     2013-09-17   93  =

d625a730675dec Lee Jones     2013-09-17   94  	rtc_clk =3D clk_register_fix=
ed_rate(NULL, "rtc32k", "NULL",
66f4ae777d0c2c Stephen Boyd  2016-03-01   95  				CLK_IGNORE_UNUSED,
82b0f4b7c576d2 Lee Jones     2013-09-17   96  				32768);
82b0f4b7c576d2 Lee Jones     2013-09-17   97  =

82b0f4b7c576d2 Lee Jones     2013-09-17   98  	/* PRCMU clocks */
82b0f4b7c576d2 Lee Jones     2013-09-17   99  	fw_version =3D prcmu_get_fw_=
version();
82b0f4b7c576d2 Lee Jones     2013-09-17  100  	if (fw_version !=3D NULL) {
82b0f4b7c576d2 Lee Jones     2013-09-17  101  		switch (fw_version->project=
) {
82b0f4b7c576d2 Lee Jones     2013-09-17  102  		case PRCMU_FW_PROJECT_U8500=
_C2:
9050ad816f5205 Linus Walleij 2021-08-02  103  		case PRCMU_FW_PROJECT_U8500=
_SSG1:
82b0f4b7c576d2 Lee Jones     2013-09-17  104  		case PRCMU_FW_PROJECT_U8520:
82b0f4b7c576d2 Lee Jones     2013-09-17  105  		case PRCMU_FW_PROJECT_U8420:
248fdcc77a35df Linus Walleij 2019-12-17  106  		case PRCMU_FW_PROJECT_U8420=
_SYSCLK:
9050ad816f5205 Linus Walleij 2021-08-02  107  		case PRCMU_FW_PROJECT_U8500=
_SSG2:
82b0f4b7c576d2 Lee Jones     2013-09-17  108  			sgaclk_parent =3D "soc0_pl=
l";
82b0f4b7c576d2 Lee Jones     2013-09-17  109  			break;
82b0f4b7c576d2 Lee Jones     2013-09-17  110  		default:
82b0f4b7c576d2 Lee Jones     2013-09-17  111  			break;
82b0f4b7c576d2 Lee Jones     2013-09-17  112  		}
82b0f4b7c576d2 Lee Jones     2013-09-17  113  	}
82b0f4b7c576d2 Lee Jones     2013-09-17  114  =

82b0f4b7c576d2 Lee Jones     2013-09-17  115  	if (sgaclk_parent)
82b0f4b7c576d2 Lee Jones     2013-09-17  116  		clk =3D clk_reg_prcmu_gate(=
"sgclk", sgaclk_parent,
82b0f4b7c576d2 Lee Jones     2013-09-17  117  					PRCMU_SGACLK, 0);
82b0f4b7c576d2 Lee Jones     2013-09-17  118  	else
66f4ae777d0c2c Stephen Boyd  2016-03-01  119  		clk =3D clk_reg_prcmu_gate(=
"sgclk", NULL, PRCMU_SGACLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  120  	prcmu_clk[PRCMU_SGACLK] =3D =
clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  121  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  122  	clk =3D clk_reg_prcmu_gate("=
uartclk", NULL, PRCMU_UARTCLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  123  	prcmu_clk[PRCMU_UARTCLK] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  124  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  125  	clk =3D clk_reg_prcmu_gate("=
msp02clk", NULL, PRCMU_MSP02CLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  126  	prcmu_clk[PRCMU_MSP02CLK] =
=3D clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  127  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  128  	clk =3D clk_reg_prcmu_gate("=
msp1clk", NULL, PRCMU_MSP1CLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  129  	prcmu_clk[PRCMU_MSP1CLK] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  130  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  131  	clk =3D clk_reg_prcmu_gate("=
i2cclk", NULL, PRCMU_I2CCLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  132  	prcmu_clk[PRCMU_I2CCLK] =3D =
clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  133  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  134  	clk =3D clk_reg_prcmu_gate("=
slimclk", NULL, PRCMU_SLIMCLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  135  	prcmu_clk[PRCMU_SLIMCLK] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  136  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  137  	clk =3D clk_reg_prcmu_gate("=
per1clk", NULL, PRCMU_PER1CLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  138  	prcmu_clk[PRCMU_PER1CLK] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  139  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  140  	clk =3D clk_reg_prcmu_gate("=
per2clk", NULL, PRCMU_PER2CLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  141  	prcmu_clk[PRCMU_PER2CLK] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  142  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  143  	clk =3D clk_reg_prcmu_gate("=
per3clk", NULL, PRCMU_PER3CLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  144  	prcmu_clk[PRCMU_PER3CLK] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  145  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  146  	clk =3D clk_reg_prcmu_gate("=
per5clk", NULL, PRCMU_PER5CLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  147  	prcmu_clk[PRCMU_PER5CLK] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  148  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  149  	clk =3D clk_reg_prcmu_gate("=
per6clk", NULL, PRCMU_PER6CLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  150  	prcmu_clk[PRCMU_PER6CLK] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  151  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  152  	clk =3D clk_reg_prcmu_gate("=
per7clk", NULL, PRCMU_PER7CLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  153  	prcmu_clk[PRCMU_PER7CLK] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  154  =

82b0f4b7c576d2 Lee Jones     2013-09-17  155  	clk =3D clk_reg_prcmu_scalab=
le("lcdclk", NULL, PRCMU_LCDCLK, 0,
66f4ae777d0c2c Stephen Boyd  2016-03-01  156  				CLK_SET_RATE_GATE);
f9fcb8e8c8f40c Lee Jones     2013-09-17  157  	prcmu_clk[PRCMU_LCDCLK] =3D =
clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  158  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  159  	clk =3D clk_reg_prcmu_opp_ga=
te("bmlclk", NULL, PRCMU_BMLCLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  160  	prcmu_clk[PRCMU_BMLCLK] =3D =
clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  161  =

82b0f4b7c576d2 Lee Jones     2013-09-17  162  	clk =3D clk_reg_prcmu_scalab=
le("hsitxclk", NULL, PRCMU_HSITXCLK, 0,
66f4ae777d0c2c Stephen Boyd  2016-03-01  163  				CLK_SET_RATE_GATE);
f9fcb8e8c8f40c Lee Jones     2013-09-17  164  	prcmu_clk[PRCMU_HSITXCLK] =
=3D clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  165  =

82b0f4b7c576d2 Lee Jones     2013-09-17  166  	clk =3D clk_reg_prcmu_scalab=
le("hsirxclk", NULL, PRCMU_HSIRXCLK, 0,
66f4ae777d0c2c Stephen Boyd  2016-03-01  167  				CLK_SET_RATE_GATE);
f9fcb8e8c8f40c Lee Jones     2013-09-17  168  	prcmu_clk[PRCMU_HSIRXCLK] =
=3D clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  169  =

82b0f4b7c576d2 Lee Jones     2013-09-17  170  	clk =3D clk_reg_prcmu_scalab=
le("hdmiclk", NULL, PRCMU_HDMICLK, 0,
66f4ae777d0c2c Stephen Boyd  2016-03-01  171  				CLK_SET_RATE_GATE);
f9fcb8e8c8f40c Lee Jones     2013-09-17  172  	prcmu_clk[PRCMU_HDMICLK] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  173  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  174  	clk =3D clk_reg_prcmu_gate("=
apeatclk", NULL, PRCMU_APEATCLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  175  	prcmu_clk[PRCMU_APEATCLK] =
=3D clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  176  =

a6ae41b54cb077 Linus Walleij 2015-04-20  177  	clk =3D clk_reg_prcmu_scalab=
le("apetraceclk", NULL, PRCMU_APETRACECLK, 0,
66f4ae777d0c2c Stephen Boyd  2016-03-01  178  				CLK_SET_RATE_GATE);
f9fcb8e8c8f40c Lee Jones     2013-09-17  179  	prcmu_clk[PRCMU_APETRACECLK]=
 =3D clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  180  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  181  	clk =3D clk_reg_prcmu_gate("=
mcdeclk", NULL, PRCMU_MCDECLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  182  	prcmu_clk[PRCMU_MCDECLK] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  183  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  184  	clk =3D clk_reg_prcmu_opp_ga=
te("ipi2cclk", NULL, PRCMU_IPI2CCLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  185  	prcmu_clk[PRCMU_IPI2CCLK] =
=3D clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  186  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  187  	clk =3D clk_reg_prcmu_gate("=
dsialtclk", NULL, PRCMU_DSIALTCLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  188  	prcmu_clk[PRCMU_DSIALTCLK] =
=3D clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  189  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  190  	clk =3D clk_reg_prcmu_gate("=
dmaclk", NULL, PRCMU_DMACLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  191  	prcmu_clk[PRCMU_DMACLK] =3D =
clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  192  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  193  	clk =3D clk_reg_prcmu_gate("=
b2r2clk", NULL, PRCMU_B2R2CLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  194  	prcmu_clk[PRCMU_B2R2CLK] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  195  =

82b0f4b7c576d2 Lee Jones     2013-09-17  196  	clk =3D clk_reg_prcmu_scalab=
le("tvclk", NULL, PRCMU_TVCLK, 0,
66f4ae777d0c2c Stephen Boyd  2016-03-01  197  				CLK_SET_RATE_GATE);
f9fcb8e8c8f40c Lee Jones     2013-09-17  198  	prcmu_clk[PRCMU_TVCLK] =3D c=
lk;
82b0f4b7c576d2 Lee Jones     2013-09-17  199  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  200  	clk =3D clk_reg_prcmu_gate("=
sspclk", NULL, PRCMU_SSPCLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  201  	prcmu_clk[PRCMU_SSPCLK] =3D =
clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  202  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  203  	clk =3D clk_reg_prcmu_gate("=
rngclk", NULL, PRCMU_RNGCLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  204  	prcmu_clk[PRCMU_RNGCLK] =3D =
clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  205  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  206  	clk =3D clk_reg_prcmu_gate("=
uiccclk", NULL, PRCMU_UICCCLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  207  	prcmu_clk[PRCMU_UICCCLK] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  208  =

66f4ae777d0c2c Stephen Boyd  2016-03-01  209  	clk =3D clk_reg_prcmu_gate("=
timclk", NULL, PRCMU_TIMCLK, 0);
f9fcb8e8c8f40c Lee Jones     2013-09-17  210  	prcmu_clk[PRCMU_TIMCLK] =3D =
clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  211  =

689a318c166774 Linus Walleij 2017-01-13  212  	clk =3D clk_reg_prcmu_gate("=
ab8500_sysclk", NULL, PRCMU_SYSCLK, 0);
689a318c166774 Linus Walleij 2017-01-13  213  	prcmu_clk[PRCMU_SYSCLK] =3D =
clk;
689a318c166774 Linus Walleij 2017-01-13  214  =

82b0f4b7c576d2 Lee Jones     2013-09-17  215  	clk =3D clk_reg_prcmu_opp_vo=
lt_scalable("sdmmcclk", NULL, PRCMU_SDMMCCLK,
66f4ae777d0c2c Stephen Boyd  2016-03-01  216  					100000000, CLK_SET_RATE_=
GATE);
f9fcb8e8c8f40c Lee Jones     2013-09-17  217  	prcmu_clk[PRCMU_SDMMCCLK] =
=3D clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  218  =

82b0f4b7c576d2 Lee Jones     2013-09-17  219  	clk =3D clk_reg_prcmu_scalab=
le("dsi_pll", "hdmiclk",
82b0f4b7c576d2 Lee Jones     2013-09-17  220  				PRCMU_PLLDSI, 0, CLK_SET_=
RATE_GATE);
f9fcb8e8c8f40c Lee Jones     2013-09-17  221  	prcmu_clk[PRCMU_PLLDSI] =3D =
clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  222  =

82b0f4b7c576d2 Lee Jones     2013-09-17  223  	clk =3D clk_reg_prcmu_scalab=
le("dsi0clk", "dsi_pll",
82b0f4b7c576d2 Lee Jones     2013-09-17  224  				PRCMU_DSI0CLK, 0, CLK_SET=
_RATE_GATE);
f9fcb8e8c8f40c Lee Jones     2013-09-17  225  	prcmu_clk[PRCMU_DSI0CLK] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  226  =

82b0f4b7c576d2 Lee Jones     2013-09-17  227  	clk =3D clk_reg_prcmu_scalab=
le("dsi1clk", "dsi_pll",
82b0f4b7c576d2 Lee Jones     2013-09-17  228  				PRCMU_DSI1CLK, 0, CLK_SET=
_RATE_GATE);
f9fcb8e8c8f40c Lee Jones     2013-09-17  229  	prcmu_clk[PRCMU_DSI1CLK] =3D=
 clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  230  =

82b0f4b7c576d2 Lee Jones     2013-09-17  231  	clk =3D clk_reg_prcmu_scalab=
le("dsi0escclk", "tvclk",
82b0f4b7c576d2 Lee Jones     2013-09-17  232  				PRCMU_DSI0ESCCLK, 0, CLK_=
SET_RATE_GATE);
f9fcb8e8c8f40c Lee Jones     2013-09-17  233  	prcmu_clk[PRCMU_DSI0ESCCLK] =
=3D clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  234  =

82b0f4b7c576d2 Lee Jones     2013-09-17  235  	clk =3D clk_reg_prcmu_scalab=
le("dsi1escclk", "tvclk",
82b0f4b7c576d2 Lee Jones     2013-09-17  236  				PRCMU_DSI1ESCCLK, 0, CLK_=
SET_RATE_GATE);
f9fcb8e8c8f40c Lee Jones     2013-09-17  237  	prcmu_clk[PRCMU_DSI1ESCCLK] =
=3D clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  238  =

82b0f4b7c576d2 Lee Jones     2013-09-17  239  	clk =3D clk_reg_prcmu_scalab=
le("dsi2escclk", "tvclk",
82b0f4b7c576d2 Lee Jones     2013-09-17  240  				PRCMU_DSI2ESCCLK, 0, CLK_=
SET_RATE_GATE);
f9fcb8e8c8f40c Lee Jones     2013-09-17  241  	prcmu_clk[PRCMU_DSI2ESCCLK] =
=3D clk;
82b0f4b7c576d2 Lee Jones     2013-09-17  242  =

82b0f4b7c576d2 Lee Jones     2013-09-17  243  	clk =3D clk_reg_prcmu_scalab=
le_rate("armss", NULL,
66f4ae777d0c2c Stephen Boyd  2016-03-01  244  				PRCMU_ARMSS, 0, CLK_IGNOR=
E_UNUSED);
257015a20c92a4 Lee Jones     2013-09-18  245  	prcmu_clk[PRCMU_ARMSS] =3D c=
lk;
82b0f4b7c576d2 Lee Jones     2013-09-17  246  =

4e33466095e045 Lee Jones     2013-09-17  247  	twd_clk =3D clk_register_fix=
ed_factor(NULL, "smp_twd", "armss",
82b0f4b7c576d2 Lee Jones     2013-09-17  248  				CLK_IGNORE_UNUSED, 1, 2);
82b0f4b7c576d2 Lee Jones     2013-09-17  249  =

82b0f4b7c576d2 Lee Jones     2013-09-17  250  	/*
82b0f4b7c576d2 Lee Jones     2013-09-17  251  	 * FIXME: Add special handle=
d PRCMU clocks here:
82b0f4b7c576d2 Lee Jones     2013-09-17  252  	 * 1. clkout0yuv, use PRCMU =
as parent + need regulator + pinctrl.
82b0f4b7c576d2 Lee Jones     2013-09-17  253  	 * 2. ab9540_clkout1yuv, see=
 clkout0yuv
82b0f4b7c576d2 Lee Jones     2013-09-17  254  	 */
82b0f4b7c576d2 Lee Jones     2013-09-17  255  =

82b0f4b7c576d2 Lee Jones     2013-09-17  256  	/* PRCC P-clocks */
5dc0fe199b3589 Linus Walleij 2015-07-30  257  	clk =3D clk_reg_prcc_pclk("p=
1_pclk0", "per1clk", bases[CLKRST1_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  258  				BIT(0), 0);
2d0803001f0736 Lee Jones     2013-09-17  259  	PRCC_PCLK_STORE(clk, 1, 0);
82b0f4b7c576d2 Lee Jones     2013-09-17  260  =

5dc0fe199b3589 Linus Walleij 2015-07-30  261  	clk =3D clk_reg_prcc_pclk("p=
1_pclk1", "per1clk", bases[CLKRST1_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  262  				BIT(1), 0);
2d0803001f0736 Lee Jones     2013-09-17  263  	PRCC_PCLK_STORE(clk, 1, 1);
82b0f4b7c576d2 Lee Jones     2013-09-17  264  =

5dc0fe199b3589 Linus Walleij 2015-07-30  265  	clk =3D clk_reg_prcc_pclk("p=
1_pclk2", "per1clk", bases[CLKRST1_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  266  				BIT(2), 0);
2d0803001f0736 Lee Jones     2013-09-17  267  	PRCC_PCLK_STORE(clk, 1, 2);
82b0f4b7c576d2 Lee Jones     2013-09-17  268  =

5dc0fe199b3589 Linus Walleij 2015-07-30  269  	clk =3D clk_reg_prcc_pclk("p=
1_pclk3", "per1clk", bases[CLKRST1_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  270  				BIT(3), 0);
2d0803001f0736 Lee Jones     2013-09-17  271  	PRCC_PCLK_STORE(clk, 1, 3);
82b0f4b7c576d2 Lee Jones     2013-09-17  272  =

5dc0fe199b3589 Linus Walleij 2015-07-30  273  	clk =3D clk_reg_prcc_pclk("p=
1_pclk4", "per1clk", bases[CLKRST1_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  274  				BIT(4), 0);
2d0803001f0736 Lee Jones     2013-09-17  275  	PRCC_PCLK_STORE(clk, 1, 4);
82b0f4b7c576d2 Lee Jones     2013-09-17  276  =

5dc0fe199b3589 Linus Walleij 2015-07-30  277  	clk =3D clk_reg_prcc_pclk("p=
1_pclk5", "per1clk", bases[CLKRST1_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  278  				BIT(5), 0);
2d0803001f0736 Lee Jones     2013-09-17  279  	PRCC_PCLK_STORE(clk, 1, 5);
82b0f4b7c576d2 Lee Jones     2013-09-17  280  =

5dc0fe199b3589 Linus Walleij 2015-07-30  281  	clk =3D clk_reg_prcc_pclk("p=
1_pclk6", "per1clk", bases[CLKRST1_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  282  				BIT(6), 0);
2d0803001f0736 Lee Jones     2013-09-17  283  	PRCC_PCLK_STORE(clk, 1, 6);
82b0f4b7c576d2 Lee Jones     2013-09-17  284  =

5dc0fe199b3589 Linus Walleij 2015-07-30  285  	clk =3D clk_reg_prcc_pclk("p=
1_pclk7", "per1clk", bases[CLKRST1_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  286  				BIT(7), 0);
2d0803001f0736 Lee Jones     2013-09-17  287  	PRCC_PCLK_STORE(clk, 1, 7);
82b0f4b7c576d2 Lee Jones     2013-09-17  288  =

5dc0fe199b3589 Linus Walleij 2015-07-30  289  	clk =3D clk_reg_prcc_pclk("p=
1_pclk8", "per1clk", bases[CLKRST1_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  290  				BIT(8), 0);
2d0803001f0736 Lee Jones     2013-09-17  291  	PRCC_PCLK_STORE(clk, 1, 8);
82b0f4b7c576d2 Lee Jones     2013-09-17  292  =

5dc0fe199b3589 Linus Walleij 2015-07-30  293  	clk =3D clk_reg_prcc_pclk("p=
1_pclk9", "per1clk", bases[CLKRST1_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  294  				BIT(9), 0);
2d0803001f0736 Lee Jones     2013-09-17  295  	PRCC_PCLK_STORE(clk, 1, 9);
82b0f4b7c576d2 Lee Jones     2013-09-17  296  =

5dc0fe199b3589 Linus Walleij 2015-07-30  297  	clk =3D clk_reg_prcc_pclk("p=
1_pclk10", "per1clk", bases[CLKRST1_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  298  				BIT(10), 0);
2d0803001f0736 Lee Jones     2013-09-17  299  	PRCC_PCLK_STORE(clk, 1, 10);
82b0f4b7c576d2 Lee Jones     2013-09-17  300  =

5dc0fe199b3589 Linus Walleij 2015-07-30  301  	clk =3D clk_reg_prcc_pclk("p=
1_pclk11", "per1clk", bases[CLKRST1_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  302  				BIT(11), 0);
2d0803001f0736 Lee Jones     2013-09-17  303  	PRCC_PCLK_STORE(clk, 1, 11);
82b0f4b7c576d2 Lee Jones     2013-09-17  304  =

5dc0fe199b3589 Linus Walleij 2015-07-30  305  	clk =3D clk_reg_prcc_pclk("p=
2_pclk0", "per2clk", bases[CLKRST2_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  306  				BIT(0), 0);
2d0803001f0736 Lee Jones     2013-09-17  307  	PRCC_PCLK_STORE(clk, 2, 0);
82b0f4b7c576d2 Lee Jones     2013-09-17  308  =

5dc0fe199b3589 Linus Walleij 2015-07-30  309  	clk =3D clk_reg_prcc_pclk("p=
2_pclk1", "per2clk", bases[CLKRST2_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  310  				BIT(1), 0);
2d0803001f0736 Lee Jones     2013-09-17  311  	PRCC_PCLK_STORE(clk, 2, 1);
82b0f4b7c576d2 Lee Jones     2013-09-17  312  =

5dc0fe199b3589 Linus Walleij 2015-07-30  313  	clk =3D clk_reg_prcc_pclk("p=
2_pclk2", "per2clk", bases[CLKRST2_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  314  				BIT(2), 0);
2d0803001f0736 Lee Jones     2013-09-17  315  	PRCC_PCLK_STORE(clk, 2, 2);
82b0f4b7c576d2 Lee Jones     2013-09-17  316  =

5dc0fe199b3589 Linus Walleij 2015-07-30  317  	clk =3D clk_reg_prcc_pclk("p=
2_pclk3", "per2clk", bases[CLKRST2_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  318  				BIT(3), 0);
2d0803001f0736 Lee Jones     2013-09-17  319  	PRCC_PCLK_STORE(clk, 2, 3);
82b0f4b7c576d2 Lee Jones     2013-09-17  320  =

5dc0fe199b3589 Linus Walleij 2015-07-30  321  	clk =3D clk_reg_prcc_pclk("p=
2_pclk4", "per2clk", bases[CLKRST2_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  322  				BIT(4), 0);
2d0803001f0736 Lee Jones     2013-09-17  323  	PRCC_PCLK_STORE(clk, 2, 4);
82b0f4b7c576d2 Lee Jones     2013-09-17  324  =

5dc0fe199b3589 Linus Walleij 2015-07-30  325  	clk =3D clk_reg_prcc_pclk("p=
2_pclk5", "per2clk", bases[CLKRST2_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  326  				BIT(5), 0);
2d0803001f0736 Lee Jones     2013-09-17  327  	PRCC_PCLK_STORE(clk, 2, 5);
82b0f4b7c576d2 Lee Jones     2013-09-17  328  =

5dc0fe199b3589 Linus Walleij 2015-07-30  329  	clk =3D clk_reg_prcc_pclk("p=
2_pclk6", "per2clk", bases[CLKRST2_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  330  				BIT(6), 0);
2d0803001f0736 Lee Jones     2013-09-17  331  	PRCC_PCLK_STORE(clk, 2, 6);
82b0f4b7c576d2 Lee Jones     2013-09-17  332  =

5dc0fe199b3589 Linus Walleij 2015-07-30  333  	clk =3D clk_reg_prcc_pclk("p=
2_pclk7", "per2clk", bases[CLKRST2_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  334  				BIT(7), 0);
2d0803001f0736 Lee Jones     2013-09-17  335  	PRCC_PCLK_STORE(clk, 2, 7);
82b0f4b7c576d2 Lee Jones     2013-09-17  336  =

5dc0fe199b3589 Linus Walleij 2015-07-30  337  	clk =3D clk_reg_prcc_pclk("p=
2_pclk8", "per2clk", bases[CLKRST2_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  338  				BIT(8), 0);
2d0803001f0736 Lee Jones     2013-09-17  339  	PRCC_PCLK_STORE(clk, 2, 8);
82b0f4b7c576d2 Lee Jones     2013-09-17  340  =

5dc0fe199b3589 Linus Walleij 2015-07-30  341  	clk =3D clk_reg_prcc_pclk("p=
2_pclk9", "per2clk", bases[CLKRST2_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  342  				BIT(9), 0);
2d0803001f0736 Lee Jones     2013-09-17  343  	PRCC_PCLK_STORE(clk, 2, 9);
82b0f4b7c576d2 Lee Jones     2013-09-17  344  =

5dc0fe199b3589 Linus Walleij 2015-07-30  345  	clk =3D clk_reg_prcc_pclk("p=
2_pclk10", "per2clk", bases[CLKRST2_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  346  				BIT(10), 0);
2d0803001f0736 Lee Jones     2013-09-17  347  	PRCC_PCLK_STORE(clk, 2, 10);
82b0f4b7c576d2 Lee Jones     2013-09-17  348  =

5dc0fe199b3589 Linus Walleij 2015-07-30  349  	clk =3D clk_reg_prcc_pclk("p=
2_pclk11", "per2clk", bases[CLKRST2_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  350  				BIT(11), 0);
f5ff9a115ec633 Linus Walleij 2013-10-18  351  	PRCC_PCLK_STORE(clk, 2, 11);
82b0f4b7c576d2 Lee Jones     2013-09-17  352  =

5dc0fe199b3589 Linus Walleij 2015-07-30  353  	clk =3D clk_reg_prcc_pclk("p=
2_pclk12", "per2clk", bases[CLKRST2_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  354  				BIT(12), 0);
2d0803001f0736 Lee Jones     2013-09-17  355  	PRCC_PCLK_STORE(clk, 2, 12);
82b0f4b7c576d2 Lee Jones     2013-09-17  356  =

5dc0fe199b3589 Linus Walleij 2015-07-30  357  	clk =3D clk_reg_prcc_pclk("p=
3_pclk0", "per3clk", bases[CLKRST3_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  358  				BIT(0), 0);
2d0803001f0736 Lee Jones     2013-09-17  359  	PRCC_PCLK_STORE(clk, 3, 0);
82b0f4b7c576d2 Lee Jones     2013-09-17  360  =

5dc0fe199b3589 Linus Walleij 2015-07-30  361  	clk =3D clk_reg_prcc_pclk("p=
3_pclk1", "per3clk", bases[CLKRST3_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  362  				BIT(1), 0);
2d0803001f0736 Lee Jones     2013-09-17  363  	PRCC_PCLK_STORE(clk, 3, 1);
82b0f4b7c576d2 Lee Jones     2013-09-17  364  =

5dc0fe199b3589 Linus Walleij 2015-07-30  365  	clk =3D clk_reg_prcc_pclk("p=
3_pclk2", "per3clk", bases[CLKRST3_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  366  				BIT(2), 0);
2d0803001f0736 Lee Jones     2013-09-17  367  	PRCC_PCLK_STORE(clk, 3, 2);
82b0f4b7c576d2 Lee Jones     2013-09-17  368  =

5dc0fe199b3589 Linus Walleij 2015-07-30  369  	clk =3D clk_reg_prcc_pclk("p=
3_pclk3", "per3clk", bases[CLKRST3_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  370  				BIT(3), 0);
2d0803001f0736 Lee Jones     2013-09-17  371  	PRCC_PCLK_STORE(clk, 3, 3);
82b0f4b7c576d2 Lee Jones     2013-09-17  372  =

5dc0fe199b3589 Linus Walleij 2015-07-30  373  	clk =3D clk_reg_prcc_pclk("p=
3_pclk4", "per3clk", bases[CLKRST3_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  374  				BIT(4), 0);
2d0803001f0736 Lee Jones     2013-09-17  375  	PRCC_PCLK_STORE(clk, 3, 4);
82b0f4b7c576d2 Lee Jones     2013-09-17  376  =

5dc0fe199b3589 Linus Walleij 2015-07-30  377  	clk =3D clk_reg_prcc_pclk("p=
3_pclk5", "per3clk", bases[CLKRST3_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  378  				BIT(5), 0);
2d0803001f0736 Lee Jones     2013-09-17  379  	PRCC_PCLK_STORE(clk, 3, 5);
82b0f4b7c576d2 Lee Jones     2013-09-17  380  =

5dc0fe199b3589 Linus Walleij 2015-07-30  381  	clk =3D clk_reg_prcc_pclk("p=
3_pclk6", "per3clk", bases[CLKRST3_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  382  				BIT(6), 0);
2d0803001f0736 Lee Jones     2013-09-17  383  	PRCC_PCLK_STORE(clk, 3, 6);
82b0f4b7c576d2 Lee Jones     2013-09-17  384  =

5dc0fe199b3589 Linus Walleij 2015-07-30  385  	clk =3D clk_reg_prcc_pclk("p=
3_pclk7", "per3clk", bases[CLKRST3_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  386  				BIT(7), 0);
2d0803001f0736 Lee Jones     2013-09-17  387  	PRCC_PCLK_STORE(clk, 3, 7);
82b0f4b7c576d2 Lee Jones     2013-09-17  388  =

5dc0fe199b3589 Linus Walleij 2015-07-30  389  	clk =3D clk_reg_prcc_pclk("p=
3_pclk8", "per3clk", bases[CLKRST3_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  390  				BIT(8), 0);
2d0803001f0736 Lee Jones     2013-09-17  391  	PRCC_PCLK_STORE(clk, 3, 8);
82b0f4b7c576d2 Lee Jones     2013-09-17  392  =

5dc0fe199b3589 Linus Walleij 2015-07-30  393  	clk =3D clk_reg_prcc_pclk("p=
5_pclk0", "per5clk", bases[CLKRST5_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  394  				BIT(0), 0);
2d0803001f0736 Lee Jones     2013-09-17  395  	PRCC_PCLK_STORE(clk, 5, 0);
82b0f4b7c576d2 Lee Jones     2013-09-17  396  =

5dc0fe199b3589 Linus Walleij 2015-07-30  397  	clk =3D clk_reg_prcc_pclk("p=
5_pclk1", "per5clk", bases[CLKRST5_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  398  				BIT(1), 0);
2d0803001f0736 Lee Jones     2013-09-17  399  	PRCC_PCLK_STORE(clk, 5, 1);
82b0f4b7c576d2 Lee Jones     2013-09-17  400  =

5dc0fe199b3589 Linus Walleij 2015-07-30  401  	clk =3D clk_reg_prcc_pclk("p=
6_pclk0", "per6clk", bases[CLKRST6_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  402  				BIT(0), 0);
2d0803001f0736 Lee Jones     2013-09-17  403  	PRCC_PCLK_STORE(clk, 6, 0);
82b0f4b7c576d2 Lee Jones     2013-09-17  404  =

5dc0fe199b3589 Linus Walleij 2015-07-30  405  	clk =3D clk_reg_prcc_pclk("p=
6_pclk1", "per6clk", bases[CLKRST6_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  406  				BIT(1), 0);
2d0803001f0736 Lee Jones     2013-09-17  407  	PRCC_PCLK_STORE(clk, 6, 1);
82b0f4b7c576d2 Lee Jones     2013-09-17  408  =

5dc0fe199b3589 Linus Walleij 2015-07-30  409  	clk =3D clk_reg_prcc_pclk("p=
6_pclk2", "per6clk", bases[CLKRST6_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  410  				BIT(2), 0);
2d0803001f0736 Lee Jones     2013-09-17  411  	PRCC_PCLK_STORE(clk, 6, 2);
82b0f4b7c576d2 Lee Jones     2013-09-17  412  =

5dc0fe199b3589 Linus Walleij 2015-07-30  413  	clk =3D clk_reg_prcc_pclk("p=
6_pclk3", "per6clk", bases[CLKRST6_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  414  				BIT(3), 0);
2d0803001f0736 Lee Jones     2013-09-17  415  	PRCC_PCLK_STORE(clk, 6, 3);
82b0f4b7c576d2 Lee Jones     2013-09-17  416  =

5dc0fe199b3589 Linus Walleij 2015-07-30  417  	clk =3D clk_reg_prcc_pclk("p=
6_pclk4", "per6clk", bases[CLKRST6_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  418  				BIT(4), 0);
2d0803001f0736 Lee Jones     2013-09-17  419  	PRCC_PCLK_STORE(clk, 6, 4);
82b0f4b7c576d2 Lee Jones     2013-09-17  420  =

5dc0fe199b3589 Linus Walleij 2015-07-30  421  	clk =3D clk_reg_prcc_pclk("p=
6_pclk5", "per6clk", bases[CLKRST6_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  422  				BIT(5), 0);
2d0803001f0736 Lee Jones     2013-09-17  423  	PRCC_PCLK_STORE(clk, 6, 5);
82b0f4b7c576d2 Lee Jones     2013-09-17  424  =

5dc0fe199b3589 Linus Walleij 2015-07-30  425  	clk =3D clk_reg_prcc_pclk("p=
6_pclk6", "per6clk", bases[CLKRST6_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  426  				BIT(6), 0);
2d0803001f0736 Lee Jones     2013-09-17  427  	PRCC_PCLK_STORE(clk, 6, 6);
82b0f4b7c576d2 Lee Jones     2013-09-17  428  =

5dc0fe199b3589 Linus Walleij 2015-07-30  429  	clk =3D clk_reg_prcc_pclk("p=
6_pclk7", "per6clk", bases[CLKRST6_INDEX],
82b0f4b7c576d2 Lee Jones     2013-09-17  430  				BIT(7), 0);
2d0803001f0736 Lee Jones     2013-09-17  431  	PRCC_PCLK_STORE(clk, 6, 7);
82b0f4b7c576d2 Lee Jones     2013-09-17  432  =

82b0f4b7c576d2 Lee Jones     2013-09-17  433  	/* PRCC K-clocks
82b0f4b7c576d2 Lee Jones     2013-09-17  434  	 *
82b0f4b7c576d2 Lee Jones     2013-09-17  435  	 * FIXME: Some drivers requi=
res PERPIH[n| to be automatically enabled
82b0f4b7c576d2 Lee Jones     2013-09-17  436  	 * by enabling just the K-cl=
ock, even if it is not a valid parent to
82b0f4b7c576d2 Lee Jones     2013-09-17  437  	 * the K-clock. Until driver=
s get fixed we might need some kind of
82b0f4b7c576d2 Lee Jones     2013-09-17  438  	 * "parent muxed join".
82b0f4b7c576d2 Lee Jones     2013-09-17  439  	 */
82b0f4b7c576d2 Lee Jones     2013-09-17  440  =

82b0f4b7c576d2 Lee Jones     2013-09-17  441  	/* Periph1 */
82b0f4b7c576d2 Lee Jones     2013-09-17  442  	clk =3D clk_reg_prcc_kclk("p=
1_uart0_kclk", "uartclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  443  			bases[CLKRST1_INDEX], BIT(=
0), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  444  	PRCC_KCLK_STORE(clk, 1, 0);
82b0f4b7c576d2 Lee Jones     2013-09-17  445  =

82b0f4b7c576d2 Lee Jones     2013-09-17  446  	clk =3D clk_reg_prcc_kclk("p=
1_uart1_kclk", "uartclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  447  			bases[CLKRST1_INDEX], BIT(=
1), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  448  	PRCC_KCLK_STORE(clk, 1, 1);
82b0f4b7c576d2 Lee Jones     2013-09-17  449  =

82b0f4b7c576d2 Lee Jones     2013-09-17  450  	clk =3D clk_reg_prcc_kclk("p=
1_i2c1_kclk", "i2cclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  451  			bases[CLKRST1_INDEX], BIT(=
2), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  452  	PRCC_KCLK_STORE(clk, 1, 2);
82b0f4b7c576d2 Lee Jones     2013-09-17  453  =

82b0f4b7c576d2 Lee Jones     2013-09-17  454  	clk =3D clk_reg_prcc_kclk("p=
1_msp0_kclk", "msp02clk",
5dc0fe199b3589 Linus Walleij 2015-07-30  455  			bases[CLKRST1_INDEX], BIT(=
3), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  456  	PRCC_KCLK_STORE(clk, 1, 3);
82b0f4b7c576d2 Lee Jones     2013-09-17  457  =

82b0f4b7c576d2 Lee Jones     2013-09-17  458  	clk =3D clk_reg_prcc_kclk("p=
1_msp1_kclk", "msp1clk",
5dc0fe199b3589 Linus Walleij 2015-07-30  459  			bases[CLKRST1_INDEX], BIT(=
4), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  460  	PRCC_KCLK_STORE(clk, 1, 4);
82b0f4b7c576d2 Lee Jones     2013-09-17  461  =

82b0f4b7c576d2 Lee Jones     2013-09-17  462  	clk =3D clk_reg_prcc_kclk("p=
1_sdi0_kclk", "sdmmcclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  463  			bases[CLKRST1_INDEX], BIT(=
5), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  464  	PRCC_KCLK_STORE(clk, 1, 5);
82b0f4b7c576d2 Lee Jones     2013-09-17  465  =

82b0f4b7c576d2 Lee Jones     2013-09-17  466  	clk =3D clk_reg_prcc_kclk("p=
1_i2c2_kclk", "i2cclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  467  			bases[CLKRST1_INDEX], BIT(=
6), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  468  	PRCC_KCLK_STORE(clk, 1, 6);
82b0f4b7c576d2 Lee Jones     2013-09-17  469  =

82b0f4b7c576d2 Lee Jones     2013-09-17  470  	clk =3D clk_reg_prcc_kclk("p=
1_slimbus0_kclk", "slimclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  471  			bases[CLKRST1_INDEX], BIT(=
8), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  472  	PRCC_KCLK_STORE(clk, 1, 8);
82b0f4b7c576d2 Lee Jones     2013-09-17  473  =

82b0f4b7c576d2 Lee Jones     2013-09-17  474  	clk =3D clk_reg_prcc_kclk("p=
1_i2c4_kclk", "i2cclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  475  			bases[CLKRST1_INDEX], BIT(=
9), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  476  	PRCC_KCLK_STORE(clk, 1, 9);
82b0f4b7c576d2 Lee Jones     2013-09-17  477  =

82b0f4b7c576d2 Lee Jones     2013-09-17  478  	clk =3D clk_reg_prcc_kclk("p=
1_msp3_kclk", "msp1clk",
5dc0fe199b3589 Linus Walleij 2015-07-30  479  			bases[CLKRST1_INDEX], BIT(=
10), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  480  	PRCC_KCLK_STORE(clk, 1, 10);
82b0f4b7c576d2 Lee Jones     2013-09-17  481  =

82b0f4b7c576d2 Lee Jones     2013-09-17  482  	/* Periph2 */
82b0f4b7c576d2 Lee Jones     2013-09-17  483  	clk =3D clk_reg_prcc_kclk("p=
2_i2c3_kclk", "i2cclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  484  			bases[CLKRST2_INDEX], BIT(=
0), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  485  	PRCC_KCLK_STORE(clk, 2, 0);
82b0f4b7c576d2 Lee Jones     2013-09-17  486  =

82b0f4b7c576d2 Lee Jones     2013-09-17  487  	clk =3D clk_reg_prcc_kclk("p=
2_sdi4_kclk", "sdmmcclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  488  			bases[CLKRST2_INDEX], BIT(=
2), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  489  	PRCC_KCLK_STORE(clk, 2, 2);
82b0f4b7c576d2 Lee Jones     2013-09-17  490  =

82b0f4b7c576d2 Lee Jones     2013-09-17  491  	clk =3D clk_reg_prcc_kclk("p=
2_msp2_kclk", "msp02clk",
5dc0fe199b3589 Linus Walleij 2015-07-30  492  			bases[CLKRST2_INDEX], BIT(=
3), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  493  	PRCC_KCLK_STORE(clk, 2, 3);
82b0f4b7c576d2 Lee Jones     2013-09-17  494  =

82b0f4b7c576d2 Lee Jones     2013-09-17  495  	clk =3D clk_reg_prcc_kclk("p=
2_sdi1_kclk", "sdmmcclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  496  			bases[CLKRST2_INDEX], BIT(=
4), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  497  	PRCC_KCLK_STORE(clk, 2, 4);
82b0f4b7c576d2 Lee Jones     2013-09-17  498  =

82b0f4b7c576d2 Lee Jones     2013-09-17  499  	clk =3D clk_reg_prcc_kclk("p=
2_sdi3_kclk", "sdmmcclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  500  			bases[CLKRST2_INDEX], BIT(=
5), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  501  	PRCC_KCLK_STORE(clk, 2, 5);
82b0f4b7c576d2 Lee Jones     2013-09-17  502  =

82b0f4b7c576d2 Lee Jones     2013-09-17  503  	/* Note that rate is receive=
d from parent. */
82b0f4b7c576d2 Lee Jones     2013-09-17  504  	clk =3D clk_reg_prcc_kclk("p=
2_ssirx_kclk", "hsirxclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  505  			bases[CLKRST2_INDEX], BIT(=
6),
82b0f4b7c576d2 Lee Jones     2013-09-17  506  			CLK_SET_RATE_GATE|CLK_SET_=
RATE_PARENT);
89da2dfafc9ffc Lee Jones     2013-09-17  507  	PRCC_KCLK_STORE(clk, 2, 6);
89da2dfafc9ffc Lee Jones     2013-09-17  508  =

82b0f4b7c576d2 Lee Jones     2013-09-17  509  	clk =3D clk_reg_prcc_kclk("p=
2_ssitx_kclk", "hsitxclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  510  			bases[CLKRST2_INDEX], BIT(=
7),
82b0f4b7c576d2 Lee Jones     2013-09-17  511  			CLK_SET_RATE_GATE|CLK_SET_=
RATE_PARENT);
89da2dfafc9ffc Lee Jones     2013-09-17  512  	PRCC_KCLK_STORE(clk, 2, 7);
82b0f4b7c576d2 Lee Jones     2013-09-17  513  =

82b0f4b7c576d2 Lee Jones     2013-09-17  514  	/* Periph3 */
82b0f4b7c576d2 Lee Jones     2013-09-17  515  	clk =3D clk_reg_prcc_kclk("p=
3_ssp0_kclk", "sspclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  516  			bases[CLKRST3_INDEX], BIT(=
1), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  517  	PRCC_KCLK_STORE(clk, 3, 1);
82b0f4b7c576d2 Lee Jones     2013-09-17  518  =

82b0f4b7c576d2 Lee Jones     2013-09-17  519  	clk =3D clk_reg_prcc_kclk("p=
3_ssp1_kclk", "sspclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  520  			bases[CLKRST3_INDEX], BIT(=
2), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  521  	PRCC_KCLK_STORE(clk, 3, 2);
82b0f4b7c576d2 Lee Jones     2013-09-17  522  =

82b0f4b7c576d2 Lee Jones     2013-09-17  523  	clk =3D clk_reg_prcc_kclk("p=
3_i2c0_kclk", "i2cclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  524  			bases[CLKRST3_INDEX], BIT(=
3), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  525  	PRCC_KCLK_STORE(clk, 3, 3);
82b0f4b7c576d2 Lee Jones     2013-09-17  526  =

82b0f4b7c576d2 Lee Jones     2013-09-17  527  	clk =3D clk_reg_prcc_kclk("p=
3_sdi2_kclk", "sdmmcclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  528  			bases[CLKRST3_INDEX], BIT(=
4), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  529  	PRCC_KCLK_STORE(clk, 3, 4);
82b0f4b7c576d2 Lee Jones     2013-09-17  530  =

82b0f4b7c576d2 Lee Jones     2013-09-17  531  	clk =3D clk_reg_prcc_kclk("p=
3_ske_kclk", "rtc32k",
5dc0fe199b3589 Linus Walleij 2015-07-30  532  			bases[CLKRST3_INDEX], BIT(=
5), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  533  	PRCC_KCLK_STORE(clk, 3, 5);
82b0f4b7c576d2 Lee Jones     2013-09-17  534  =

82b0f4b7c576d2 Lee Jones     2013-09-17  535  	clk =3D clk_reg_prcc_kclk("p=
3_uart2_kclk", "uartclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  536  			bases[CLKRST3_INDEX], BIT(=
6), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  537  	PRCC_KCLK_STORE(clk, 3, 6);
82b0f4b7c576d2 Lee Jones     2013-09-17  538  =

82b0f4b7c576d2 Lee Jones     2013-09-17  539  	clk =3D clk_reg_prcc_kclk("p=
3_sdi5_kclk", "sdmmcclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  540  			bases[CLKRST3_INDEX], BIT(=
7), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  541  	PRCC_KCLK_STORE(clk, 3, 7);
82b0f4b7c576d2 Lee Jones     2013-09-17  542  =

82b0f4b7c576d2 Lee Jones     2013-09-17  543  	/* Periph6 */
82b0f4b7c576d2 Lee Jones     2013-09-17  544  	clk =3D clk_reg_prcc_kclk("p=
3_rng_kclk", "rngclk",
5dc0fe199b3589 Linus Walleij 2015-07-30  545  			bases[CLKRST6_INDEX], BIT(=
0), CLK_SET_RATE_GATE);
89da2dfafc9ffc Lee Jones     2013-09-17  546  	PRCC_KCLK_STORE(clk, 6, 0);
dec759d8ef01b3 Lee Jones     2013-09-17  547  =

dec759d8ef01b3 Lee Jones     2013-09-17 @548  	for_each_child_of_node(np, c=
hild) {

:::::: The code at line 548 was first introduced by commit
:::::: dec759d8ef01b3edd5ceb9832ce2338c6c396d11 clk: ux500: Provide u8500_c=
lk with skeleton Device Tree support

:::::: TO: Lee Jones <lee.jones@linaro.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8215267302009120940==--

