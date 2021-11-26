Content-Type: multipart/mixed; boundary="===============3825507869027531496=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mmc/host/sdhci-of-aspeed.c:247 aspeed_sdhci_set_clock() error: uninitialized symbol 'bus'.
Date: Fri, 26 Nov 2021 10:18:22 +0800
Message-ID: <202111261031.rcI6URj1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3825507869027531496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andrew Jeffery <andrew@aj.id.au>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ced7ca3570333998ad2088d5a6275701970e28e
commit: 0c53dc321a507c78fdd15a682f42175a131b1763 mmc: sdhci-of-aspeed: Add =
AST2600 bus clock support
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
config: ia64-randconfig-m031-20211122 (https://download.01.org/0day-ci/arch=
ive/20211126/202111261031.rcI6URj1-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mmc/host/sdhci-of-aspeed.c:247 aspeed_sdhci_set_clock() error: unin=
itialized symbol 'bus'.

vim +/bus +247 drivers/mmc/host/sdhci-of-aspeed.c

2fc88f92359df75 Andrew Jeffery 2021-01-14  199  =

bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  200  static void aspeed_sdhci_se=
t_clock(struct sdhci_host *host, unsigned int clock)
bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  201  {
0a0e8d7501cda79 Andrew Jeffery 2019-09-02  202  	struct sdhci_pltfm_host *p=
ltfm_host;
2fc88f92359df75 Andrew Jeffery 2021-01-14  203  	unsigned long parent, bus;
0c53dc321a507c7 Andrew Jeffery 2021-01-14  204  	struct aspeed_sdhci *sdhci;
bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  205  	int div;
bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  206  	u16 clk;
bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  207  =

0a0e8d7501cda79 Andrew Jeffery 2019-09-02  208  	pltfm_host =3D sdhci_priv(=
host);
0c53dc321a507c7 Andrew Jeffery 2021-01-14  209  	sdhci =3D sdhci_pltfm_priv=
(pltfm_host);
0c53dc321a507c7 Andrew Jeffery 2021-01-14  210  =

0a0e8d7501cda79 Andrew Jeffery 2019-09-02  211  	parent =3D clk_get_rate(pl=
tfm_host->clk);
0a0e8d7501cda79 Andrew Jeffery 2019-09-02  212  =

bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  213  	sdhci_writew(host, 0, SDHC=
I_CLOCK_CONTROL);
bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  214  =

bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  215  	if (clock =3D=3D 0)
bf290432a4d7d79 Andrew Jeffery 2019-09-02  216  		return;
bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  217  =

0a0e8d7501cda79 Andrew Jeffery 2019-09-02  218  	if (WARN_ON(clock > host->=
max_clk))
0a0e8d7501cda79 Andrew Jeffery 2019-09-02  219  		clock =3D host->max_clk;
0a0e8d7501cda79 Andrew Jeffery 2019-09-02  220  =

0c53dc321a507c7 Andrew Jeffery 2021-01-14  221  	/*
0c53dc321a507c7 Andrew Jeffery 2021-01-14  222  	 * Regarding the AST2600:
0c53dc321a507c7 Andrew Jeffery 2021-01-14  223  	 *
0c53dc321a507c7 Andrew Jeffery 2021-01-14  224  	 * If (EMMC12C[7:6], EMMC1=
2C[15:8] =3D=3D 0) then
0c53dc321a507c7 Andrew Jeffery 2021-01-14  225  	 *   period of SDCLK =3D p=
eriod of SDMCLK.
0c53dc321a507c7 Andrew Jeffery 2021-01-14  226  	 *
0c53dc321a507c7 Andrew Jeffery 2021-01-14  227  	 * If (EMMC12C[7:6], EMMC1=
2C[15:8] !=3D 0) then
0c53dc321a507c7 Andrew Jeffery 2021-01-14  228  	 *   period of SDCLK =3D p=
eriod of SDMCLK * 2 * (EMMC12C[7:6], EMMC[15:8])
0c53dc321a507c7 Andrew Jeffery 2021-01-14  229  	 *
0c53dc321a507c7 Andrew Jeffery 2021-01-14  230  	 * If you keep EMMC12C[7:6=
] =3D 0 and EMMC12C[15:8] as one-hot,
0c53dc321a507c7 Andrew Jeffery 2021-01-14  231  	 * 0x1/0x2/0x4/etc, you wi=
ll find it is compatible to AST2400 or AST2500
0c53dc321a507c7 Andrew Jeffery 2021-01-14  232  	 *
0c53dc321a507c7 Andrew Jeffery 2021-01-14  233  	 * Keep the one-hot behavi=
our for backwards compatibility except for
0c53dc321a507c7 Andrew Jeffery 2021-01-14  234  	 * supporting the value 0 =
in (EMMC12C[7:6], EMMC12C[15:8]), and capture
0c53dc321a507c7 Andrew Jeffery 2021-01-14  235  	 * the 0-value capability =
in clk_div_start.
0c53dc321a507c7 Andrew Jeffery 2021-01-14  236  	 */
0c53dc321a507c7 Andrew Jeffery 2021-01-14  237  	for (div =3D sdhci->pdata-=
>clk_div_start; div < 256; div *=3D 2) {
2fc88f92359df75 Andrew Jeffery 2021-01-14  238  		bus =3D parent / div;
2fc88f92359df75 Andrew Jeffery 2021-01-14  239  		if (bus <=3D clock)
bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  240  			break;
bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  241  	}
2fc88f92359df75 Andrew Jeffery 2021-01-14  242  =

bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  243  	div >>=3D 1;
bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  244  =

bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  245  	clk =3D div << SDHCI_DIVID=
ER_SHIFT;
bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  246  =

2fc88f92359df75 Andrew Jeffery 2021-01-14 @247  	aspeed_sdhci_configure_pha=
se(host, bus);
2fc88f92359df75 Andrew Jeffery 2021-01-14  248  =

bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  249  	sdhci_enable_clk(host, clk=
);
bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  250  }
bb7b8ec62dfb9b2 Andrew Jeffery 2019-08-07  251  =


:::::: The code@line 247 was first introduced by commit
:::::: 2fc88f92359df753fc892f3b3d0e1d69ef6c620c mmc: sdhci-of-aspeed: Expos=
e clock phase controls

:::::: TO: Andrew Jeffery <andrew@aj.id.au>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3825507869027531496==--

