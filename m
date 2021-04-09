Content-Type: multipart/mixed; boundary="===============7968979653457889746=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xlnx:master 59/60] drivers/mtd/spi-nor/spi-nor.c:2642:3-19: duplicated argument to & or |
Date: Sat, 10 Apr 2021 05:35:58 +0800
Message-ID: <202104100555.YzMPh82U-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7968979653457889746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Vishal Sagar <vishal.sagar@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Hyun Kwon <hyun.kwon@xilinx.com>

Hi Vishal,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/Xilinx/linux-xlnx master
head:   043f8a226a752a1dd11f7ff64cee6dbe7334d394
commit: c0b33b8ccd38096c815f2dd39746044d0aa079d3 [59/60] staging: xlnxsync:=
 Fix the uapi header license
:::::: branch date: 11 months ago
:::::: commit date: 11 months ago
config: i386-randconfig-c001-20210409 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/mtd/spi-nor/spi-nor.c:2642:3-19: duplicated argument to & or |

vim +2642 drivers/mtd/spi-nor/spi-nor.c

48e4d973aefeea Boris Brezillon           2019-08-24  2447  =

b199489d37b21c Huang Shijie              2014-02-24  2448  /* NOTE: double =
check command sets and memory organization when you add
b199489d37b21c Huang Shijie              2014-02-24  2449   * more nor chip=
s.  This current list focusses on newer chips, which
b199489d37b21c Huang Shijie              2014-02-24  2450   * have been con=
verging on command sets which including JEDEC ID.
c19900edff983c Rafa=C5=82 Mi=C5=82ecki             2015-04-25  2451   *
c19900edff983c Rafa=C5=82 Mi=C5=82ecki             2015-04-25  2452   * All=
 newly added entries should describe *hardware* and should use SECT_4K
c19900edff983c Rafa=C5=82 Mi=C5=82ecki             2015-04-25  2453   * (or=
 SECT_4K_PMC) if hardware supports erasing 4 KiB sectors. For usage
c19900edff983c Rafa=C5=82 Mi=C5=82ecki             2015-04-25  2454   * sce=
narios excluding small sectors there is config option that can be
c19900edff983c Rafa=C5=82 Mi=C5=82ecki             2015-04-25  2455   * dis=
abled: CONFIG_MTD_SPI_NOR_USE_4K_SECTORS.
c19900edff983c Rafa=C5=82 Mi=C5=82ecki             2015-04-25  2456   * For=
 historical (and compatibility) reasons (before we got above config) some
c19900edff983c Rafa=C5=82 Mi=C5=82ecki             2015-04-25  2457   * old=
 entries may be missing 4K flag.
b199489d37b21c Huang Shijie              2014-02-24  2458   */
06bb6f5a69dfc5 Rafa=C5=82 Mi=C5=82ecki             2015-08-10  2459  static=
 const struct flash_info spi_nor_ids[] =3D {
b199489d37b21c Huang Shijie              2014-02-24  2460  	/* Atmel -- som=
e are (confusingly) marketed as "DataFlash" */
b199489d37b21c Huang Shijie              2014-02-24  2461  	{ "at25fs010", =
 INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2462  	{ "at25fs040", =
 INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2463  =

b199489d37b21c Huang Shijie              2014-02-24  2464  	{ "at25df041a",=
 INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K) },
b08618c929b289 Jagan Teki                2016-07-26  2465  	{ "at25df321", =
 INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2466  	{ "at25df321a",=
 INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2467  	{ "at25df641", =
 INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2468  =

b199489d37b21c Huang Shijie              2014-02-24  2469  	{ "at26f004",  =
 INFO(0x1f0400, 0, 64 * 1024,  8, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2470  	{ "at26df081a",=
 INFO(0x1f4501, 0, 64 * 1024, 16, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2471  	{ "at26df161a",=
 INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2472  	{ "at26df321", =
 INFO(0x1f4700, 0, 64 * 1024, 64, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2473  =

b199489d37b21c Huang Shijie              2014-02-24  2474  	{ "at45db081d",=
 INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2475  =

b199489d37b21c Huang Shijie              2014-02-24  2476  	/* EON -- en25x=
xx */
b199489d37b21c Huang Shijie              2014-02-24  2477  	{ "en25f32",   =
 INFO(0x1c3116, 0, 64 * 1024,   64, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2478  	{ "en25p32",   =
 INFO(0x1c2016, 0, 64 * 1024,   64, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2479  	{ "en25q32b",  =
 INFO(0x1c3016, 0, 64 * 1024,   64, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2480  	{ "en25p64",   =
 INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2481  	{ "en25q64",   =
 INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
08326d8a9472c0 Frieder Schrempf          2019-02-18  2482  	{ "en25q80a",  =
 INFO(0x1c3014, 0, 64 * 1024,   16,
08326d8a9472c0 Frieder Schrempf          2019-02-18  2483  			SECT_4K | SPI=
_NOR_DUAL_READ) },
771ff17e82fac5 YuheiOKAWA                2018-05-17  2484  	{ "en25qh32",  =
 INFO(0x1c7016, 0, 64 * 1024,   64, 0) },
30a2c8aa3c520d Roger Pueyo Centelles     2019-02-07  2485  	{ "en25qh64",  =
 INFO(0x1c7017, 0, 64 * 1024,  128,
30a2c8aa3c520d Roger Pueyo Centelles     2019-02-07  2486  			SECT_4K | SPI=
_NOR_DUAL_READ) },
a41595b34ba40f Sergey Ryazanov           2014-06-12  2487  	{ "en25qh128", =
 INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2488  	{ "en25qh256", =
 INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
c19900edff983c Rafa=C5=82 Mi=C5=82ecki             2015-04-25  2489  	{ "en=
25s64",	INFO(0x1c3817, 0, 64 * 1024,  128, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2490  =

b199489d37b21c Huang Shijie              2014-02-24  2491  	/* ESMT */
fcf690a22b2bd7 Victor Shyba              2017-01-02  2492  	{ "f25l32pa", I=
NFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
ca1fa1a8a6dae3 L. D. Pinney              2017-02-14  2493  	{ "f25l32qa", I=
NFO(0x8c4116, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
ca1fa1a8a6dae3 L. D. Pinney              2017-02-14  2494  	{ "f25l64qa", I=
NFO(0x8c4117, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_LOCK) },
b199489d37b21c Huang Shijie              2014-02-24  2495  =

b199489d37b21c Huang Shijie              2014-02-24  2496  	/* Everspin */
282e45dc64d183 Philipp Puschmann         2017-10-19  2497  	{ "mr25h128", C=
AT25_INFO( 16 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
b199489d37b21c Huang Shijie              2014-02-24  2498  	{ "mr25h256", C=
AT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
b199489d37b21c Huang Shijie              2014-02-24  2499  	{ "mr25h10",  C=
AT25_INFO(128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
edd0c8f4932dbf IWAMOTO Masahiko          2016-10-05  2500  	{ "mr25h40",  C=
AT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
b199489d37b21c Huang Shijie              2014-02-24  2501  =

ce56ce7da31591 Rostislav Lisovy          2014-10-29  2502  	/* Fujitsu */
ce56ce7da31591 Rostislav Lisovy          2014-10-29  2503  	{ "mb85rs1mt", =
INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
ce56ce7da31591 Rostislav Lisovy          2014-10-29  2504  =

b199489d37b21c Huang Shijie              2014-02-24  2505  	/* GigaDevice */
e9cf64dec1067e Kamal Dasu                2017-01-20  2506  	{
e9cf64dec1067e Kamal Dasu                2017-01-20  2507  		"gd25q16", INF=
O(0xc84015, 0, 64 * 1024,  32,
e9cf64dec1067e Kamal Dasu                2017-01-20  2508  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
e9cf64dec1067e Kamal Dasu                2017-01-20  2509  			SPI_NOR_HAS_L=
OCK | SPI_NOR_HAS_TB)
e9cf64dec1067e Kamal Dasu                2017-01-20  2510  	},
595f0e101d4c25 Brian Norris              2016-07-01  2511  	{
595f0e101d4c25 Brian Norris              2016-07-01  2512  		"gd25q32", INF=
O(0xc84016, 0, 64 * 1024,  64,
595f0e101d4c25 Brian Norris              2016-07-01  2513  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
595f0e101d4c25 Brian Norris              2016-07-01  2514  			SPI_NOR_HAS_L=
OCK | SPI_NOR_HAS_TB)
595f0e101d4c25 Brian Norris              2016-07-01  2515  	},
5a0682835ca270 Klaus Goger               2017-09-13  2516  	{
5a0682835ca270 Klaus Goger               2017-09-13  2517  		"gd25lq32", IN=
FO(0xc86016, 0, 64 * 1024, 64,
5a0682835ca270 Klaus Goger               2017-09-13  2518  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
5a0682835ca270 Klaus Goger               2017-09-13  2519  			SPI_NOR_HAS_L=
OCK | SPI_NOR_HAS_TB)
5a0682835ca270 Klaus Goger               2017-09-13  2520  	},
595f0e101d4c25 Brian Norris              2016-07-01  2521  	{
595f0e101d4c25 Brian Norris              2016-07-01  2522  		"gd25q64", INF=
O(0xc84017, 0, 64 * 1024, 128,
595f0e101d4c25 Brian Norris              2016-07-01  2523  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
595f0e101d4c25 Brian Norris              2016-07-01  2524  			SPI_NOR_HAS_L=
OCK | SPI_NOR_HAS_TB)
595f0e101d4c25 Brian Norris              2016-07-01  2525  	},
595f0e101d4c25 Brian Norris              2016-07-01  2526  	{
595f0e101d4c25 Brian Norris              2016-07-01  2527  		"gd25lq64c", I=
NFO(0xc86017, 0, 64 * 1024, 128,
595f0e101d4c25 Brian Norris              2016-07-01  2528  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
595f0e101d4c25 Brian Norris              2016-07-01  2529  			SPI_NOR_HAS_L=
OCK | SPI_NOR_HAS_TB)
595f0e101d4c25 Brian Norris              2016-07-01  2530  	},
595f0e101d4c25 Brian Norris              2016-07-01  2531  	{
595f0e101d4c25 Brian Norris              2016-07-01  2532  		"gd25q128", IN=
FO(0xc84018, 0, 64 * 1024, 256,
595f0e101d4c25 Brian Norris              2016-07-01  2533  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
595f0e101d4c25 Brian Norris              2016-07-01  2534  			SPI_NOR_HAS_L=
OCK | SPI_NOR_HAS_TB)
595f0e101d4c25 Brian Norris              2016-07-01  2535  	},
65153846b18c48 Andy Yan                  2017-08-28  2536  	{
65153846b18c48 Andy Yan                  2017-08-28  2537  		"gd25q256", IN=
FO(0xc84019, 0, 64 * 1024, 512,
65153846b18c48 Andy Yan                  2017-08-28  2538  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
65153846b18c48 Andy Yan                  2017-08-28  2539  			SPI_NOR_4B_OP=
CODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
48e4d973aefeea Boris Brezillon           2019-08-24  2540  			.fixups =3D &=
gd25q256_fixups,
65153846b18c48 Andy Yan                  2017-08-28  2541  	},
b199489d37b21c Huang Shijie              2014-02-24  2542  =

b199489d37b21c Huang Shijie              2014-02-24  2543  	/* Intel/Numony=
x -- xxxs33b */
b199489d37b21c Huang Shijie              2014-02-24  2544  	{ "160s33b",  I=
NFO(0x898911, 0, 64 * 1024,  32, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2545  	{ "320s33b",  I=
NFO(0x898912, 0, 64 * 1024,  64, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2546  	{ "640s33b",  I=
NFO(0x898913, 0, 64 * 1024, 128, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2547  =

b79c332fb283c1 Gabor Juhos               2015-04-07  2548  	/* ISSI */
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2549  	{ "is25wp080d",=
 INFO(0x9d7014, 0, 64 * 1024, 32, SECT_4K |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2550  		SPI_NOR_DUAL_R=
EAD | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK) },
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2551  	{ "is25wp016d",=
 INFO(0x9d7015, 0, 64 * 1024, 32, SECT_4K |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2552  		SPI_NOR_DUAL_R=
EAD | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK) },
b79c332fb283c1 Gabor Juhos               2015-04-07  2553  	{ "is25cd512", =
 INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
ded8a0447f49d7 Sean Nyekjaer             2017-12-15  2554  	{ "is25lq040b",=
 INFO(0x9d4013, 0, 64 * 1024,   8,
ded8a0447f49d7 Sean Nyekjaer             2017-12-15  2555  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
b422847877e35d Fabrizio Castro           2018-11-08  2556  	{ "is25lp016d",=
 INFO(0x9d6015, 0, 64 * 1024,  32,
b422847877e35d Fabrizio Castro           2018-11-08  2557  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
17407ec3354d29 Romain Porte              2017-12-28  2558  	{ "is25lp080d",=
 INFO(0x9d6014, 0, 64 * 1024,  16,
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2559  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2560  			SPI_NOR_HAS_L=
OCK) },
4cc106f8f245ba Uwe Kleine-K=C3=B6nig          2018-11-21  2561  	{ "is25lp0=
32",  INFO(0x9d6016, 0, 64 * 1024,  64,
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2562  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_HAS_LOCK) },
4cc106f8f245ba Uwe Kleine-K=C3=B6nig          2018-11-21  2563  	{ "is25lp0=
64",  INFO(0x9d6017, 0, 64 * 1024, 128,
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2564  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_HAS_LOCK) },
34354d4bf845c8 Angelo Dureghello         2017-11-19  2565  	{ "is25lp128", =
 INFO(0x9d6018, 0, 64 * 1024, 256,
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2566  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_HAS_LOCK) },
c7aa1b77f96f35 Marek Vasut               2018-04-07  2567  	{ "is25lp256", =
 INFO(0x9d6019, 0, 64 * 1024, 512,
d05e21e3cfc7f2 Liu Xiang                 2018-11-14  2568  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2569  			SPI_NOR_4B_OP=
CODES | SPI_NOR_HAS_LOCK)
cf580a92400584 Liu Xiang                 2019-06-25  2570  			.fixups =3D &=
is25lp256_fixups },
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2571  	{ "is25wp256d",=
 INFO(0x9d7019, 0, 64 * 1024, 512,
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2572  			SECT_4K | SPI=
_NOR_DUAL_READ |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2573  			SPI_NOR_QUAD_=
READ | SPI_NOR_HAS_LOCK |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2574  			SPI_NOR_4B_OP=
CODES) },
d616f81cdd2a21 Kimmo Rautkoski           2018-05-14  2575  	{ "is25wp032", =
 INFO(0x9d7016, 0, 64 * 1024,  64,
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2576  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2577  			SPI_NOR_HAS_L=
OCK) },
d616f81cdd2a21 Kimmo Rautkoski           2018-05-14  2578  	{ "is25wp064", =
 INFO(0x9d7017, 0, 64 * 1024, 128,
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2579  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2580  			 | SPI_NOR_HA=
S_LOCK) },
d616f81cdd2a21 Kimmo Rautkoski           2018-05-14  2581  	{ "is25wp128", =
 INFO(0x9d7018, 0, 64 * 1024, 256,
d616f81cdd2a21 Kimmo Rautkoski           2018-05-14  2582  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2583  	{ "is25lp512m",=
 INFO(0x9d601a, 0, 64 * 1024, 1024,
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2584  			SECT_4K | SPI=
_NOR_DUAL_READ |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2585  			SPI_NOR_QUAD_=
READ | SPI_NOR_HAS_LOCK) },
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2586  	{ "is25wp512m",=
 INFO(0x9d701a, 0, 64 * 1024, 1024,
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2587  			SECT_4K | SPI=
_NOR_DUAL_READ |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2588  			SPI_NOR_QUAD_=
READ | SPI_NOR_HAS_LOCK |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2589  			SPI_NOR_4B_OP=
CODES) },
b79c332fb283c1 Gabor Juhos               2015-04-07  2590  =

b199489d37b21c Huang Shijie              2014-02-24  2591  	/* Macronix */
660b5b07cfbc39 Gabor Juhos               2015-04-07  2592  	{ "mx25l512e", =
  INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2593  	{ "mx25l2005a",=
  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2594  	{ "mx25l4005a",=
  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2595  	{ "mx25l8005", =
  INFO(0xc22014, 0, 64 * 1024,  16, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2596  	{ "mx25l1606e",=
  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
0501f2e5ff28a0 Andreas Fenkart           2015-11-05  2597  	{ "mx25l3205d",=
  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2598  	{ "mx25l3255e",=
  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
0501f2e5ff28a0 Andreas Fenkart           2015-11-05  2599  	{ "mx25l6405d",=
  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
9f3cd4537da071 Alexander Kurz            2017-03-11  2600  	{ "mx25u2033e",=
  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
748df6d831871c Andr=C3=A9 Valentin            2019-01-30  2601  	{ "mx25u32=
35f",	 INFO(0xc22536, 0, 64 * 1024,  64,
748df6d831871c Andr=C3=A9 Valentin            2019-01-30  2602  			 SECT_4K=
 | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
9f3cd4537da071 Alexander Kurz            2017-03-11  2603  	{ "mx25u4035", =
  INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
9f3cd4537da071 Alexander Kurz            2017-03-11  2604  	{ "mx25u8035", =
  INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
81a1209c90914c Mika Westerberg           2015-02-05  2605  	{ "mx25u6435f",=
  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2606  	{ "mx25l12805d"=
, INFO(0xc22018, 0, 64 * 1024, 256, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2607  	{ "mx25l12855e"=
, INFO(0xc22618, 0, 64 * 1024, 256, 0) },
81554171373018 Alexander Sverdlin        2018-07-13  2608  	{ "mx25u12835f"=
, INFO(0xc22538, 0, 64 * 1024, 256,
81554171373018 Alexander Sverdlin        2018-07-13  2609  			 SECT_4K | SP=
I_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
2bffa65da43e39 Boris Brezillon           2018-12-06  2610  	{ "mx25l25635e"=
, INFO(0xc22019, 0, 64 * 1024, 512,
2bffa65da43e39 Boris Brezillon           2018-12-06  2611  			 SPI_NOR_DUAL=
_READ | SPI_NOR_QUAD_READ)
2bffa65da43e39 Boris Brezillon           2018-12-06  2612  			 .fixups =3D =
&mx25l25635_fixups },
b0fcb4b4130283 Mathias Kresin            2017-04-13  2613  	{ "mx25u25635f"=
, INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_4B_OPCODES) },
e36bb65e5d0cf3 Frieder Schrempf          2019-02-18  2614  	{ "mx25v8035f",=
  INFO(0xc22314, 0, 64 * 1024,  16,
e36bb65e5d0cf3 Frieder Schrempf          2019-02-18  2615  			 SECT_4K | SP=
I_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
b199489d37b21c Huang Shijie              2014-02-24  2616  	{ "mx25l25655e"=
, INFO(0xc22619, 0, 64 * 1024, 512, 0) },
d342b6a973af45 Roman Yeryomin            2017-09-18  2617  	{ "mx66l51235l"=
, INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ =
| SPI_NOR_4B_OPCODES) },
af18ba48420e39 Alexander Sverdlin        2017-06-22  2618  	{ "mx66u51235f"=
, INFO(0xc2253a, 0, 64 * 1024, 1024, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_=
QUAD_READ | SPI_NOR_4B_OPCODES) },
ce398a8141b485 C=C3=A9dric Le Goater          2017-04-19  2619  	{ "mx66l1g=
45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_DUAL_READ | SPI=
_NOR_QUAD_READ) },
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2620  	{ "mx66u1g45g",=
  INFO(0xc2253b, 0, 64 * 1024, 2048, SECT_4K |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2621  			SPI_NOR_DUAL_=
READ | SPI_NOR_QUAD_READ) },
b199489d37b21c Huang Shijie              2014-02-24  2622  	{ "mx66l1g55g",=
  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
b199489d37b21c Huang Shijie              2014-02-24  2623  =

0005aad094538e Yogesh Narayan Gaur       2018-10-12  2624  	/* Micron <--> =
ST Micro */
61e4611864b396 Moritz Fischer            2016-07-15  2625  	{ "n25q016a",	 =
INFO(0x20bb15, 0, 64 * 1024,   32, SECT_4K | SPI_NOR_QUAD_READ) },
548cd3ab54da10 Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo  2014-12-17  2=
626) 	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
f9bcb6dc8013d4 Aurelien Chanot           2015-10-07  2627  	{ "n25q032a",	 =
INFO(0x20bb16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
0db7fae2736d0d Alexey Firago             2015-06-30  2628  	{ "n25q064",   =
  INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
2a06c7b1fd2389 Mika Westerberg           2015-08-27  2629  	{ "n25q064a",  =
  INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2630  	{ "n25q128a11",=
  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2631  			SPI_NOR_QUAD_=
READ | SPI_NOR_HAS_LOCK) },
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2632  	{ "n25q128a13",=
  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2633  			SPI_NOR_QUAD_=
READ | SPI_NOR_HAS_LOCK) },
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2634  	{ "n25q256a",  =
  INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2635  			SPI_NOR_DUAL_=
READ | SPI_NOR_QUAD_READ | USE_FSR |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2636  			SPI_NOR_HAS_L=
OCK) },
835ed7bf12609c Nobuhiro Iwamatsu         2017-03-23  2637  	{ "n25q256ax1",=
  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2638  	{ "n25q512ax3",=
  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2639  			USE_FSR | SPI=
_NOR_QUAD_READ | SPI_NOR_HAS_LOCK) },
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2640  	{ "n25q00",    =
  INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2641  			USE_FSR | SPI=
_NOR_QUAD_READ | NO_CHIP_ERASE |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19 @2642  			SPI_NOR_HAS_L=
OCK | SPI_NOR_HAS_LOCK) },
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2643  	{ "n25q00a",   =
  INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2644  			USE_FSR | SPI=
_NOR_QUAD_READ | NO_CHIP_ERASE |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2645  			SPI_NOR_HAS_L=
OCK) },
21ed90acd17868 Andrey Smirnov            2019-05-12  2646  	{ "mt25ql02g", =
  INFO(0x20ba22, 0, 64 * 1024, 4096,
21ed90acd17868 Andrey Smirnov            2019-05-12  2647  			      SECT_4K=
 | USE_FSR | SPI_NOR_QUAD_READ |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2648  			      NO_CHIP=
_ERASE | SPI_NOR_HAS_LOCK) },
9607af6f857ff0 Ashish Kumar              2019-08-29  2649  	{ "mt25qu512a (=
n25q512a)", INFO(0x20bb20, 0, 64 * 1024, 1024,
9607af6f857ff0 Ashish Kumar              2019-08-29  2650  					SECT_4K | U=
SE_FSR | SPI_NOR_DUAL_READ |
9607af6f857ff0 Ashish Kumar              2019-08-29  2651  					SPI_NOR_QUA=
D_READ |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2652  					SPI_NOR_HAS=
_LOCK) },
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2653  	{ "mt25qu02g", =
  INFO(0x20bb22, 0, 64 * 1024, 4096, SECT_4K |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2654  			USE_FSR | SPI=
_NOR_QUAD_READ | NO_CHIP_ERASE |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2655  			SPI_NOR_HAS_L=
OCK) },
b199489d37b21c Huang Shijie              2014-02-24  2656  =

a98086e00420ad Yogesh Narayan Gaur       2018-10-12  2657  	/* Micron */
a98086e00420ad Yogesh Narayan Gaur       2018-10-12  2658  	{
a98086e00420ad Yogesh Narayan Gaur       2018-10-12  2659  		"mt35xu512aba"=
, INFO(0x2c5b1a, 0, 128 * 1024, 512,
2bda2f811b36cb Yogesh Narayan Gaur       2019-01-15  2660  			SECT_4K | USE=
_FSR | SPI_NOR_OCTAL_READ |
606a7db700558f Sai Krishna Potthuri      2019-12-26  2661  			SPI_NOR_OCTAL=
_WRITE | SPI_NOR_4B_OPCODES)
a98086e00420ad Yogesh Narayan Gaur       2018-10-12  2662  	},
aba8d95e112099 Sai Krishna Potthuri      2019-12-26  2663  	{ "mt35xu01g", =
 INFO(0x2c5b1b, 0, 128 * 1024, 1024,
aba8d95e112099 Sai Krishna Potthuri      2019-12-26  2664  			    SECT_4K |=
 USE_FSR | SPI_NOR_OCTAL_READ |
aba8d95e112099 Sai Krishna Potthuri      2019-12-26  2665  			    SPI_NOR_O=
CTAL_WRITE | SPI_NOR_4B_OPCODES) },
173c3d47736e31 Ashish Kumar              2019-08-29  2666  	{ "mt35xu02g", =
 INFO(0x2c5b1c, 0, 128 * 1024, 2048,
173c3d47736e31 Ashish Kumar              2019-08-29  2667  			     SECT_4K =
| USE_FSR | SPI_NOR_OCTAL_READ |
606a7db700558f Sai Krishna Potthuri      2019-12-26  2668  			     SPI_NOR_=
OCTAL_WRITE | SPI_NOR_4B_OPCODES) },
a98086e00420ad Yogesh Narayan Gaur       2018-10-12  2669  =

b199489d37b21c Huang Shijie              2014-02-24  2670  	/* PMC */
b199489d37b21c Huang Shijie              2014-02-24  2671  	{ "pm25lv512", =
  INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
b199489d37b21c Huang Shijie              2014-02-24  2672  	{ "pm25lv010", =
  INFO(0,        0, 32 * 1024,    4, SECT_4K_PMC) },
b199489d37b21c Huang Shijie              2014-02-24  2673  	{ "pm25lq032", =
  INFO(0x7f9d46, 0, 64 * 1024,   64, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2674  =

0074a8f3b30302 Rafael Gago               2017-12-21  2675  	/* Spansion/Cyp=
ress -- single (large) sector size only, at least
b199489d37b21c Huang Shijie              2014-02-24  2676  	 * for the chip=
s listed here (without boot sectors).
b199489d37b21c Huang Shijie              2014-02-24  2677  	 */
9ab86995ed07f5 Geert Uytterhoeven        2014-04-22  2678  	{ "s25sl032p", =
 INFO(0x010215, 0x4d00,  64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_R=
EAD) },
0f12a27b47284e Joachim Eastwood          2015-08-14  2679  	{ "s25sl064p", =
 INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_R=
EAD) },
50685024f27358 Ahmet Celenk              2019-02-12  2680  	{ "s25fl128s0",=
 INFO6(0x012018, 0x4d0080, 256 * 1024, 64,
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2681  			SPI_NOR_DUAL_=
READ | SPI_NOR_QUAD_READ | USE_CLSR |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2682  			SPI_NOR_HAS_L=
OCK) },
50685024f27358 Ahmet Celenk              2019-02-12  2683  	{ "s25fl128s1",=
 INFO6(0x012018, 0x4d0180, 64 * 1024, 256,
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2684  			SPI_NOR_DUAL_=
READ | SPI_NOR_QUAD_READ | USE_CLSR |
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2685  			SPI_NOR_HAS_L=
OCK) },
c4b3eacc1dfef5 Alexander Sverdlin        2017-07-17  2686  	{ "s25fl256s0",=
 INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
c4b3eacc1dfef5 Alexander Sverdlin        2017-07-17  2687  	{ "s25fl256s1",=
 INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_R=
EAD | USE_CLSR) },
dcb4b22eeaf44f Jonas Bonn                2019-03-20  2688  	{ "s25fl512s", =
 INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
dcb4b22eeaf44f Jonas Bonn                2019-03-20  2689  			SPI_NOR_DUAL_=
READ | SPI_NOR_QUAD_READ |
e7023898034ea3 Jungseung Lee             2019-07-13  2690  			SPI_NOR_HAS_L=
OCK | USE_CLSR) },
dfd2b74530e908 Sergei Shtylyov           2019-01-16  2691  	{ "s25fs512s", =
 INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUA=
D_READ | USE_CLSR) },
b199489d37b21c Huang Shijie              2014-02-24  2692  	{ "s70fl01gs", =
 INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2693  	{ "s25sl12800",=
 INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2694  	{ "s25sl12801",=
 INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
c4b3eacc1dfef5 Alexander Sverdlin        2017-07-17  2695  	{ "s25fl129p0",=
 INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_R=
EAD | USE_CLSR) },
c4b3eacc1dfef5 Alexander Sverdlin        2017-07-17  2696  	{ "s25fl129p1",=
 INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_R=
EAD | USE_CLSR) },
b199489d37b21c Huang Shijie              2014-02-24  2697  	{ "s25sl004a", =
 INFO(0x010212,      0,  64 * 1024,   8, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2698  	{ "s25sl008a", =
 INFO(0x010213,      0,  64 * 1024,  16, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2699  	{ "s25sl016a", =
 INFO(0x010214,      0,  64 * 1024,  32, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2700  	{ "s25sl032a", =
 INFO(0x010215,      0,  64 * 1024,  64, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2701  	{ "s25sl064a", =
 INFO(0x010216,      0,  64 * 1024, 128, 0) },
7c748f5774cb74 Sean Nyekjaer             2015-10-13  2702  	{ "s25fl004k", =
 INFO(0xef4013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ | SPI_=
NOR_QUAD_READ) },
adf508c347c3a5 Joachim Eastwood          2015-07-09  2703  	{ "s25fl008k", =
 INFO(0xef4014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ | SPI_=
NOR_QUAD_READ) },
adf508c347c3a5 Joachim Eastwood          2015-07-09  2704  	{ "s25fl016k", =
 INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_=
NOR_QUAD_READ) },
b199489d37b21c Huang Shijie              2014-02-24  2705  	{ "s25fl064k", =
 INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
c08266794926a9 Sascha Hauer              2016-02-11  2706  	{ "s25fl116k", =
 INFO(0x014015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_=
NOR_QUAD_READ) },
c19900edff983c Rafa=C5=82 Mi=C5=82ecki             2015-04-25  2707  	{ "s2=
5fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
413780d7d7040c Rafa=C5=82 Mi=C5=82ecki             2015-04-25  2708  	{ "s2=
5fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
aada20cd2b1af7 Sean Nyekjaer             2015-10-13  2709  	{ "s25fl204k", =
 INFO(0x014013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ) },
022a400f90ceeb Sean Nyekjaer             2016-10-05  2710  	{ "s25fl208k", =
 INFO(0x014014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ) },
d8b494a32889ea Harry Chou                2017-06-23  2711  	{ "s25fl064l", =
 INFO(0x016017,      0,  64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_=
NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
0074a8f3b30302 Rafael Gago               2017-12-21  2712  	{ "s25fl128l", =
 INFO(0x016018,      0,  64 * 1024, 256, SECT_4K | SPI_NOR_DUAL_READ | SPI_=
NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
0074a8f3b30302 Rafael Gago               2017-12-21  2713  	{ "s25fl256l", =
 INFO(0x016019,      0,  64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_=
NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2714  	{ "sst26wf016B"=
, INFO(0xbf2651, 0, 64 * 1024, 32,
d2c139cd25f72b Amit Kumar Mahapatra      2020-01-19  2715  			SECT_4K | SST=
_GLOBAL_PROT_UNLK) },
b199489d37b21c Huang Shijie              2014-02-24  2716  =

b199489d37b21c Huang Shijie              2014-02-24  2717  	/* SST -- large=
 erase sizes are "overlays", "sectors" are 4K */
b199489d37b21c Huang Shijie              2014-02-24  2718  	{ "sst25vf040b"=
, INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
b199489d37b21c Huang Shijie              2014-02-24  2719  	{ "sst25vf080b"=
, INFO(0xbf258e, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
b199489d37b21c Huang Shijie              2014-02-24  2720  	{ "sst25vf016b"=
, INFO(0xbf2541, 0, 64 * 1024, 32, SECT_4K | SST_WRITE) },
b199489d37b21c Huang Shijie              2014-02-24  2721  	{ "sst25vf032b"=
, INFO(0xbf254a, 0, 64 * 1024, 64, SECT_4K | SST_WRITE) },
b199489d37b21c Huang Shijie              2014-02-24  2722  	{ "sst25vf064c"=
, INFO(0xbf254b, 0, 64 * 1024, 128, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2723  	{ "sst25wf512",=
  INFO(0xbf2501, 0, 64 * 1024,  1, SECT_4K | SST_WRITE) },
b199489d37b21c Huang Shijie              2014-02-24  2724  	{ "sst25wf010",=
  INFO(0xbf2502, 0, 64 * 1024,  2, SECT_4K | SST_WRITE) },
b199489d37b21c Huang Shijie              2014-02-24  2725  	{ "sst25wf020",=
  INFO(0xbf2503, 0, 64 * 1024,  4, SECT_4K | SST_WRITE) },
a1d97ef96e3899 Alexis Ballier            2015-08-14  2726  	{ "sst25wf020a"=
, INFO(0x621612, 0, 64 * 1024,  4, SECT_4K) },
c887be71cc3984 Yao Yuan                  2015-09-16  2727  	{ "sst25wf040b"=
, INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2728  	{ "sst25wf040",=
  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
f02985b78550f5 Harini Katakam            2014-10-21  2729  	{ "sst25wf080",=
  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
6dc944db29ba9c Eugeniy Paltsev           2019-07-18  2730  	{ "sst26wf016b"=
, INFO(0xbf2651, 0, 64 * 1024, 32, SECT_4K |
6dc944db29ba9c Eugeniy Paltsev           2019-07-18  2731  			      SPI_NOR=
_DUAL_READ | SPI_NOR_QUAD_READ) },
4b265184095df6 Amit Kumar Mahapatra      2020-02-20  2732  	{ "sst26vf016b"=
, INFO(0xbf2641, 0, 64 * 1024, 32,
4b265184095df6 Amit Kumar Mahapatra      2020-02-20  2733  			      SECT_4K=
 | SST_GLOBAL_PROT_UNLK) },
18f7ce2f449504 Claudiu Beznea            2017-08-22  2734  	{ "sst26vf064b"=
, INFO(0xbf2643, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_Q=
UAD_READ) },
b199489d37b21c Huang Shijie              2014-02-24  2735  =

b199489d37b21c Huang Shijie              2014-02-24  2736  	/* ST Microelec=
tronics -- newer production may have feature updates */
b199489d37b21c Huang Shijie              2014-02-24  2737  	{ "m25p05",  IN=
FO(0x202010,  0,  32 * 1024,   2, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2738  	{ "m25p10",  IN=
FO(0x202011,  0,  32 * 1024,   4, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2739  	{ "m25p20",  IN=
FO(0x202012,  0,  64 * 1024,   4, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2740  	{ "m25p40",  IN=
FO(0x202013,  0,  64 * 1024,   8, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2741  	{ "m25p80",  IN=
FO(0x202014,  0,  64 * 1024,  16, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2742  	{ "m25p16",  IN=
FO(0x202015,  0,  64 * 1024,  32, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2743  	{ "m25p32",  IN=
FO(0x202016,  0,  64 * 1024,  64, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2744  	{ "m25p64",  IN=
FO(0x202017,  0,  64 * 1024, 128, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2745  	{ "m25p128", IN=
FO(0x202018,  0, 256 * 1024,  64, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2746  =

b199489d37b21c Huang Shijie              2014-02-24  2747  	{ "m25p05-nonje=
dec",  INFO(0, 0,  32 * 1024,   2, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2748  	{ "m25p10-nonje=
dec",  INFO(0, 0,  32 * 1024,   4, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2749  	{ "m25p20-nonje=
dec",  INFO(0, 0,  64 * 1024,   4, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2750  	{ "m25p40-nonje=
dec",  INFO(0, 0,  64 * 1024,   8, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2751  	{ "m25p80-nonje=
dec",  INFO(0, 0,  64 * 1024,  16, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2752  	{ "m25p16-nonje=
dec",  INFO(0, 0,  64 * 1024,  32, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2753  	{ "m25p32-nonje=
dec",  INFO(0, 0,  64 * 1024,  64, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2754  	{ "m25p64-nonje=
dec",  INFO(0, 0,  64 * 1024, 128, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2755  	{ "m25p128-nonj=
edec", INFO(0, 0, 256 * 1024,  64, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2756  =

b199489d37b21c Huang Shijie              2014-02-24  2757  	{ "m45pe10", IN=
FO(0x204011,  0, 64 * 1024,    2, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2758  	{ "m45pe80", IN=
FO(0x204014,  0, 64 * 1024,   16, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2759  	{ "m45pe16", IN=
FO(0x204015,  0, 64 * 1024,   32, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2760  =

b199489d37b21c Huang Shijie              2014-02-24  2761  	{ "m25pe20", IN=
FO(0x208012,  0, 64 * 1024,  4,       0) },
b199489d37b21c Huang Shijie              2014-02-24  2762  	{ "m25pe80", IN=
FO(0x208014,  0, 64 * 1024, 16,       0) },
b199489d37b21c Huang Shijie              2014-02-24  2763  	{ "m25pe16", IN=
FO(0x208015,  0, 64 * 1024, 32, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2764  =

b199489d37b21c Huang Shijie              2014-02-24  2765  	{ "m25px16",   =
 INFO(0x207115,  0, 64 * 1024, 32, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2766  	{ "m25px32",   =
 INFO(0x207116,  0, 64 * 1024, 64, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2767  	{ "m25px32-s0",=
 INFO(0x207316,  0, 64 * 1024, 64, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2768  	{ "m25px32-s1",=
 INFO(0x206316,  0, 64 * 1024, 64, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2769  	{ "m25px64",   =
 INFO(0x207117,  0, 64 * 1024, 128, 0) },
f2fabe16b819cd Thomas Petazzoni          2014-07-27  2770  	{ "m25px80",   =
 INFO(0x207114,  0, 64 * 1024, 16, 0) },
b199489d37b21c Huang Shijie              2014-02-24  2771  =

b199489d37b21c Huang Shijie              2014-02-24  2772  	/* Winbond -- w=
25x "blocks" are 64K, "sectors" are 4KiB */
40d19ab69c79da Gabor Juhos               2015-03-26  2773  	{ "w25x05", INF=
O(0xef3010, 0, 64 * 1024,  1,  SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2774  	{ "w25x10", INF=
O(0xef3011, 0, 64 * 1024,  2,  SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2775  	{ "w25x20", INF=
O(0xef3012, 0, 64 * 1024,  4,  SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2776  	{ "w25x40", INF=
O(0xef3013, 0, 64 * 1024,  8,  SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2777  	{ "w25x80", INF=
O(0xef3014, 0, 64 * 1024,  16, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2778  	{ "w25x16", INF=
O(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
ace3cbdd23dc49 Neil Armstrong            2017-08-28  2779  	{
ace3cbdd23dc49 Neil Armstrong            2017-08-28  2780  		"w25q16dw", IN=
FO(0xef6015, 0, 64 * 1024,  32,
ace3cbdd23dc49 Neil Armstrong            2017-08-28  2781  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
ace3cbdd23dc49 Neil Armstrong            2017-08-28  2782  			SPI_NOR_HAS_L=
OCK | SPI_NOR_HAS_TB)
ace3cbdd23dc49 Neil Armstrong            2017-08-28  2783  	},
b199489d37b21c Huang Shijie              2014-02-24  2784  	{ "w25x32", INF=
O(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
88489c29de6078 Robert Marko              2019-05-18  2785  	{
88489c29de6078 Robert Marko              2019-05-18  2786  		"w25q16jv-im/j=
m", INFO(0xef7015, 0, 64 * 1024,  32,
88489c29de6078 Robert Marko              2019-05-18  2787  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
88489c29de6078 Robert Marko              2019-05-18  2788  			SPI_NOR_HAS_L=
OCK | SPI_NOR_HAS_TB)
88489c29de6078 Robert Marko              2019-05-18  2789  	},
34fc99dbf32d8c Alexander Kurz            2017-03-11  2790  	{ "w25q20cl", I=
NFO(0xef4012, 0, 64 * 1024,  4, SECT_4K) },
34fc99dbf32d8c Alexander Kurz            2017-03-11  2791  	{ "w25q20bw", I=
NFO(0xef5012, 0, 64 * 1024,  4, SECT_4K) },
34fc99dbf32d8c Alexander Kurz            2017-03-11  2792  	{ "w25q20ew", I=
NFO(0xef6012, 0, 64 * 1024,  4, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2793  	{ "w25q32", INF=
O(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
9648388fc77373 Brian Norris              2016-01-29  2794  	{
9648388fc77373 Brian Norris              2016-01-29  2795  		"w25q32dw", IN=
FO(0xef6016, 0, 64 * 1024,  64,
9648388fc77373 Brian Norris              2016-01-29  2796  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
9648388fc77373 Brian Norris              2016-01-29  2797  			SPI_NOR_HAS_L=
OCK | SPI_NOR_HAS_TB)
9648388fc77373 Brian Norris              2016-01-29  2798  	},
7fccf56ea4faef Stephen Douthit           2018-03-07  2799  	{
7fccf56ea4faef Stephen Douthit           2018-03-07  2800  		"w25q32jv", IN=
FO(0xef7016, 0, 64 * 1024,  64,
7fccf56ea4faef Stephen Douthit           2018-03-07  2801  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
7fccf56ea4faef Stephen Douthit           2018-03-07  2802  			SPI_NOR_HAS_L=
OCK | SPI_NOR_HAS_TB)
7fccf56ea4faef Stephen Douthit           2018-03-07  2803  	},
b199489d37b21c Huang Shijie              2014-02-24  2804  	{ "w25x64", INF=
O(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2805  	{ "w25q64", INF=
O(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
9648388fc77373 Brian Norris              2016-01-29  2806  	{
9648388fc77373 Brian Norris              2016-01-29  2807  		"w25q64dw", IN=
FO(0xef6017, 0, 64 * 1024, 128,
9648388fc77373 Brian Norris              2016-01-29  2808  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
9648388fc77373 Brian Norris              2016-01-29  2809  			SPI_NOR_HAS_L=
OCK | SPI_NOR_HAS_TB)
9648388fc77373 Brian Norris              2016-01-29  2810  	},
9648388fc77373 Brian Norris              2016-01-29  2811  	{
9648388fc77373 Brian Norris              2016-01-29  2812  		"w25q128fw", I=
NFO(0xef6018, 0, 64 * 1024, 256,
9648388fc77373 Brian Norris              2016-01-29  2813  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
9648388fc77373 Brian Norris              2016-01-29  2814  			SPI_NOR_HAS_L=
OCK | SPI_NOR_HAS_TB)
9648388fc77373 Brian Norris              2016-01-29  2815  	},
d720a43333b0c2 Robert Marko              2018-06-25  2816  	{
d720a43333b0c2 Robert Marko              2018-06-25  2817  		"w25q128jv", I=
NFO(0xef7018, 0, 64 * 1024, 256,
d720a43333b0c2 Robert Marko              2018-06-25  2818  			SECT_4K | SPI=
_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
d720a43333b0c2 Robert Marko              2018-06-25  2819  			SPI_NOR_HAS_L=
OCK | SPI_NOR_HAS_TB)
d720a43333b0c2 Robert Marko              2018-06-25  2820  	},
b199489d37b21c Huang Shijie              2014-02-24  2821  	{ "w25q80", INF=
O(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2822  	{ "w25q80bl", I=
NFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
b199489d37b21c Huang Shijie              2014-02-24  2823  	{ "w25q128", IN=
FO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
d7c9ade2e31dba C=C3=A9dric Le Goater          2017-04-19  2824  	{ "w25q256=
", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_=
QUAD_READ) },
3123db1d265185 Avi Fishman               2019-07-30  2825  	{ "w25q256jvm",=
 INFO(0xef7019, 0, 64 * 1024, 512,
3123db1d265185 Avi Fishman               2019-07-30  2826  			     SECT_4K =
| SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
0cbef932bd8285 Benjamin Herrenschmidt    2017-06-21  2827  	{ "w25m512jv", =
INFO(0xef7119, 0, 64 * 1024, 1024,
0cbef932bd8285 Benjamin Herrenschmidt    2017-06-21  2828  			SECT_4K | SPI=
_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
b199489d37b21c Huang Shijie              2014-02-24  2829  =

b199489d37b21c Huang Shijie              2014-02-24  2830  	/* Catalyst / O=
n Semiconductor -- non-JEDEC */
b199489d37b21c Huang Shijie              2014-02-24  2831  	{ "cat25c11", C=
AT25_INFO(  16, 8, 16, 1, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
b199489d37b21c Huang Shijie              2014-02-24  2832  	{ "cat25c03", C=
AT25_INFO(  32, 8, 16, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
b199489d37b21c Huang Shijie              2014-02-24  2833  	{ "cat25c09", C=
AT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
b199489d37b21c Huang Shijie              2014-02-24  2834  	{ "cat25c17", C=
AT25_INFO( 256, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
b199489d37b21c Huang Shijie              2014-02-24  2835  	{ "cat25128", C=
AT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
e99ca98f1d7190 Ricardo Ribalda Delgado   2016-12-02  2836  =

e99ca98f1d7190 Ricardo Ribalda Delgado   2016-12-02  2837  	/* Xilinx S3AN =
Internal Flash */
e99ca98f1d7190 Ricardo Ribalda Delgado   2016-12-02  2838  	{ "3S50AN", S3A=
N_INFO(0x1f2200, 64, 264) },
e99ca98f1d7190 Ricardo Ribalda Delgado   2016-12-02  2839  	{ "3S200AN", S3=
AN_INFO(0x1f2400, 256, 264) },
e99ca98f1d7190 Ricardo Ribalda Delgado   2016-12-02  2840  	{ "3S400AN", S3=
AN_INFO(0x1f2400, 256, 264) },
e99ca98f1d7190 Ricardo Ribalda Delgado   2016-12-02  2841  	{ "3S700AN", S3=
AN_INFO(0x1f2500, 512, 264) },
e99ca98f1d7190 Ricardo Ribalda Delgado   2016-12-02  2842  	{ "3S1400AN", S=
3AN_INFO(0x1f2600, 512, 528) },
ce5013ff3bec05 Hauke Mehrtens            2018-04-18  2843  =

ce5013ff3bec05 Hauke Mehrtens            2018-04-18  2844  	/* XMC (Wuhan X=
inxin Semiconductor Manufacturing Corp.) */
ce5013ff3bec05 Hauke Mehrtens            2018-04-18  2845  	{ "XM25QH64A", =
INFO(0x207017, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUA=
D_READ) },
ce5013ff3bec05 Hauke Mehrtens            2018-04-18  2846  	{ "XM25QH128A",=
 INFO(0x207018, 0, 64 * 1024, 256, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QU=
AD_READ) },
b199489d37b21c Huang Shijie              2014-02-24  2847  	{ },
b199489d37b21c Huang Shijie              2014-02-24  2848  };
b199489d37b21c Huang Shijie              2014-02-24  2849  =


:::::: The code at line 2642 was first introduced by commit
:::::: d2c139cd25f72b5ba2f6927fcce17c69f0a8fab7 mtd: spi-nor: Update flags =
for serial NOR flash devices

:::::: TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7968979653457889746==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7968979653457889746==--

