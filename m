Content-Type: multipart/mixed; boundary="===============8854832158405439225=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xlnx:master 59/60] drivers/mtd/spi-nor/spi-nor.c:2642:3-19: duplicated argument to & or |
Date: Sat, 05 Dec 2020 18:26:59 +0800
Message-ID: <202012051858.q3Tcd80f-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8854832158405439225==
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
:::::: branch date: 7 months ago
:::::: commit date: 7 months ago
config: i386-randconfig-c001-20201204 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


"coccinelle warnings: (new ones prefixed by >>)"
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

--===============8854832158405439225==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8854832158405439225==--

