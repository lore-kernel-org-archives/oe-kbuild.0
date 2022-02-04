Content-Type: multipart/mixed; boundary="===============1195075465041464344=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 859/872] drivers/mtd/spi-nor/micron-st.c:183:3-19: duplicated argument to & or |
Date: Fri, 04 Feb 2022 23:46:26 +0800
Message-ID: <202202042317.LwqTt3yu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1195075465041464344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   1183ce490adb103e5e569b8ebd74c50c885ddc05
commit: 9017c359329cadeafe05e7eb38c5345b7e13eeb3 [859/872] mtd: spi-nor: Up=
date flash properties in flash_info table
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: xtensa-randconfig-c004-20220130 (https://download.01.org/0day-ci/ar=
chive/20220204/202202042317.LwqTt3yu-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/mtd/spi-nor/micron-st.c:183:3-19: duplicated argument to & or |

vim +183 drivers/mtd/spi-nor/micron-st.c

15f5c7e54e658a Boris Brezillon      2020-03-13  141  =

08f7e8e4dc3b95 Amit Kumar Mahapatra 2022-01-25  142  static struct flash_in=
fo st_parts[] =3D {
15f5c7e54e658a Boris Brezillon      2020-03-13  143  	{ "n25q016a",	 INFO(0=
x20bb15, 0, 64 * 1024,   32,
15f5c7e54e658a Boris Brezillon      2020-03-13  144  			      SECT_4K | SPI=
_NOR_QUAD_READ) },
15f5c7e54e658a Boris Brezillon      2020-03-13  145  	{ "n25q032",	 INFO(0x=
20ba16, 0, 64 * 1024,   64,
15f5c7e54e658a Boris Brezillon      2020-03-13  146  			      SPI_NOR_QUAD_=
READ) },
15f5c7e54e658a Boris Brezillon      2020-03-13  147  	{ "n25q032a",	 INFO(0=
x20bb16, 0, 64 * 1024,   64,
15f5c7e54e658a Boris Brezillon      2020-03-13  148  			      SPI_NOR_QUAD_=
READ) },
15f5c7e54e658a Boris Brezillon      2020-03-13  149  	{ "n25q064",     INFO=
(0x20ba17, 0, 64 * 1024,  128,
15f5c7e54e658a Boris Brezillon      2020-03-13  150  			      SECT_4K | SPI=
_NOR_QUAD_READ) },
15f5c7e54e658a Boris Brezillon      2020-03-13  151  	{ "n25q064a",    INFO=
(0x20bb17, 0, 64 * 1024,  128,
15f5c7e54e658a Boris Brezillon      2020-03-13  152  			      SECT_4K | SPI=
_NOR_QUAD_READ) },
9017c359329cad Amit Kumar Mahapatra 2022-01-25  153  	{ "n25q128a11",  INFO=
(0x20bb18, 0, 64 * 1024,  256, SECT_4K |
9017c359329cad Amit Kumar Mahapatra 2022-01-25  154  			SPI_NOR_QUAD_READ |=
 USE_FSR | SPI_NOR_HAS_LOCK) },
9017c359329cad Amit Kumar Mahapatra 2022-01-25  155  	{ "n25q128a13",  INFO=
(0x20ba18, 0, 64 * 1024,  256, SECT_4K |
9017c359329cad Amit Kumar Mahapatra 2022-01-25  156  			SPI_NOR_QUAD_READ |=
 SPI_NOR_HAS_LOCK) },
9017c359329cad Amit Kumar Mahapatra 2022-01-25  157  	{ "n25q256a",    INFO=
(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
9017c359329cad Amit Kumar Mahapatra 2022-01-25  158  			SPI_NOR_DUAL_READ |=
 SPI_NOR_QUAD_READ | USE_FSR |
9017c359329cad Amit Kumar Mahapatra 2022-01-25  159  			SPI_NOR_HAS_LOCK) },
15f5c7e54e658a Boris Brezillon      2020-03-13  160  	{ "n25q256a",    INFO=
(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
15f5c7e54e658a Boris Brezillon      2020-03-13  161  			      USE_FSR | SPI=
_NOR_DUAL_READ |
15f5c7e54e658a Boris Brezillon      2020-03-13  162  			      SPI_NOR_QUAD_=
READ) },
15f5c7e54e658a Boris Brezillon      2020-03-13  163  	{ "mt25qu256a",  INFO=
6(0x20bb19, 0x104400, 64 * 1024,  512,
15f5c7e54e658a Boris Brezillon      2020-03-13  164  			       SECT_4K | US=
E_FSR | SPI_NOR_DUAL_READ |
15f5c7e54e658a Boris Brezillon      2020-03-13  165  			       SPI_NOR_QUAD=
_READ | SPI_NOR_4B_OPCODES) },
15f5c7e54e658a Boris Brezillon      2020-03-13  166  	{ "n25q256ax1",  INFO=
(0x20bb19, 0, 64 * 1024,  512,
15f5c7e54e658a Boris Brezillon      2020-03-13  167  			      SECT_4K | USE=
_FSR | SPI_NOR_QUAD_READ) },
15f5c7e54e658a Boris Brezillon      2020-03-13  168  	{ "mt25ql512a",  INFO=
6(0x20ba20, 0x104400, 64 * 1024, 1024,
15f5c7e54e658a Boris Brezillon      2020-03-13  169  			       SECT_4K | US=
E_FSR | SPI_NOR_DUAL_READ |
15f5c7e54e658a Boris Brezillon      2020-03-13  170  			       SPI_NOR_QUAD=
_READ | SPI_NOR_4B_OPCODES) },
9017c359329cad Amit Kumar Mahapatra 2022-01-25  171  	{ "n25q512ax3",  INFO=
(0x20ba20, 0, 64 * 1024, 1024, SECT_4K |
9017c359329cad Amit Kumar Mahapatra 2022-01-25  172  			USE_FSR | SPI_NOR_Q=
UAD_READ | SPI_NOR_HAS_LOCK) },
15f5c7e54e658a Boris Brezillon      2020-03-13  173  	{ "mt25qu512a",  INFO=
6(0x20bb20, 0x104400, 64 * 1024, 1024,
15f5c7e54e658a Boris Brezillon      2020-03-13  174  			       SECT_4K | US=
E_FSR | SPI_NOR_DUAL_READ |
9017c359329cad Amit Kumar Mahapatra 2022-01-25  175  			       SPI_NOR_QUAD=
_READ | SPI_NOR_4B_OPCODES |
9017c359329cad Amit Kumar Mahapatra 2022-01-25  176  				   SPI_NOR_HAS_LOC=
K) },
15f5c7e54e658a Boris Brezillon      2020-03-13  177  	{ "n25q512a",    INFO=
(0x20bb20, 0, 64 * 1024, 1024,
f3f2b7eb2f1c58 Jungseung Lee        2020-03-18  178  			      SECT_4K | USE=
_FSR | SPI_NOR_QUAD_READ |
f3f2b7eb2f1c58 Jungseung Lee        2020-03-18  179  			      SPI_NOR_HAS_L=
OCK | SPI_NOR_HAS_TB |
f3f2b7eb2f1c58 Jungseung Lee        2020-03-18  180  			      SPI_NOR_4BIT_=
BP | SPI_NOR_BP3_SR_BIT6) },
9017c359329cad Amit Kumar Mahapatra 2022-01-25  181  	{ "n25q00",      INFO=
(0x20ba21, 0, 64 * 1024, 2048, SECT_4K |
9017c359329cad Amit Kumar Mahapatra 2022-01-25  182  			USE_FSR | SPI_NOR_Q=
UAD_READ | NO_CHIP_ERASE |
9017c359329cad Amit Kumar Mahapatra 2022-01-25 @183  			SPI_NOR_HAS_LOCK | =
SPI_NOR_HAS_LOCK) },
9017c359329cad Amit Kumar Mahapatra 2022-01-25  184  	{ "n25q00a",     INFO=
(0x20bb21, 0, 64 * 1024, 2048, SECT_4K |
9017c359329cad Amit Kumar Mahapatra 2022-01-25  185  			USE_FSR | SPI_NOR_Q=
UAD_READ | NO_CHIP_ERASE |
9017c359329cad Amit Kumar Mahapatra 2022-01-25  186  			SPI_NOR_HAS_LOCK) },
15f5c7e54e658a Boris Brezillon      2020-03-13  187  	{ "mt25ql02g",   INFO=
(0x20ba22, 0, 64 * 1024, 4096,
15f5c7e54e658a Boris Brezillon      2020-03-13  188  			      SECT_4K | USE=
_FSR | SPI_NOR_QUAD_READ |
9017c359329cad Amit Kumar Mahapatra 2022-01-25  189  			      NO_CHIP_ERASE=
 | SPI_NOR_HAS_LOCK) },
15f5c7e54e658a Boris Brezillon      2020-03-13  190  	{ "mt25qu02g",   INFO=
(0x20bb22, 0, 64 * 1024, 4096,
1371a80cac33d5 David Clear          2020-07-20  191  			      SECT_4K | USE=
_FSR | SPI_NOR_DUAL_READ |
9017c359329cad Amit Kumar Mahapatra 2022-01-25  192  			      SPI_NOR_QUAD_=
READ | NO_CHIP_ERASE |
9017c359329cad Amit Kumar Mahapatra 2022-01-25  193  				  SPI_NOR_HAS_LOCK=
) },
15f5c7e54e658a Boris Brezillon      2020-03-13  194  =

15f5c7e54e658a Boris Brezillon      2020-03-13  195  	{ "m25p05",  INFO(0x2=
02010,  0,  32 * 1024,   2, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  196  	{ "m25p10",  INFO(0x2=
02011,  0,  32 * 1024,   4, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  197  	{ "m25p20",  INFO(0x2=
02012,  0,  64 * 1024,   4, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  198  	{ "m25p40",  INFO(0x2=
02013,  0,  64 * 1024,   8, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  199  	{ "m25p80",  INFO(0x2=
02014,  0,  64 * 1024,  16, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  200  	{ "m25p16",  INFO(0x2=
02015,  0,  64 * 1024,  32, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  201  	{ "m25p32",  INFO(0x2=
02016,  0,  64 * 1024,  64, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  202  	{ "m25p64",  INFO(0x2=
02017,  0,  64 * 1024, 128, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  203  	{ "m25p128", INFO(0x2=
02018,  0, 256 * 1024,  64, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  204  =

15f5c7e54e658a Boris Brezillon      2020-03-13  205  	{ "m25p05-nonjedec", =
 INFO(0, 0,  32 * 1024,   2, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  206  	{ "m25p10-nonjedec", =
 INFO(0, 0,  32 * 1024,   4, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  207  	{ "m25p20-nonjedec", =
 INFO(0, 0,  64 * 1024,   4, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  208  	{ "m25p40-nonjedec", =
 INFO(0, 0,  64 * 1024,   8, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  209  	{ "m25p80-nonjedec", =
 INFO(0, 0,  64 * 1024,  16, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  210  	{ "m25p16-nonjedec", =
 INFO(0, 0,  64 * 1024,  32, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  211  	{ "m25p32-nonjedec", =
 INFO(0, 0,  64 * 1024,  64, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  212  	{ "m25p64-nonjedec", =
 INFO(0, 0,  64 * 1024, 128, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  213  	{ "m25p128-nonjedec",=
 INFO(0, 0, 256 * 1024,  64, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  214  =

15f5c7e54e658a Boris Brezillon      2020-03-13  215  	{ "m45pe10", INFO(0x2=
04011,  0, 64 * 1024,    2, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  216  	{ "m45pe80", INFO(0x2=
04014,  0, 64 * 1024,   16, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  217  	{ "m45pe16", INFO(0x2=
04015,  0, 64 * 1024,   32, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  218  =

15f5c7e54e658a Boris Brezillon      2020-03-13  219  	{ "m25pe20", INFO(0x2=
08012,  0, 64 * 1024,  4,       0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  220  	{ "m25pe80", INFO(0x2=
08014,  0, 64 * 1024, 16,       0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  221  	{ "m25pe16", INFO(0x2=
08015,  0, 64 * 1024, 32, SECT_4K) },
15f5c7e54e658a Boris Brezillon      2020-03-13  222  =

15f5c7e54e658a Boris Brezillon      2020-03-13  223  	{ "m25px16",    INFO(=
0x207115,  0, 64 * 1024, 32, SECT_4K) },
15f5c7e54e658a Boris Brezillon      2020-03-13  224  	{ "m25px32",    INFO(=
0x207116,  0, 64 * 1024, 64, SECT_4K) },
15f5c7e54e658a Boris Brezillon      2020-03-13  225  	{ "m25px32-s0", INFO(=
0x207316,  0, 64 * 1024, 64, SECT_4K) },
15f5c7e54e658a Boris Brezillon      2020-03-13  226  	{ "m25px32-s1", INFO(=
0x206316,  0, 64 * 1024, 64, SECT_4K) },
15f5c7e54e658a Boris Brezillon      2020-03-13  227  	{ "m25px64",    INFO(=
0x207117,  0, 64 * 1024, 128, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  228  	{ "m25px80",    INFO(=
0x207114,  0, 64 * 1024, 16, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  229  };
15f5c7e54e658a Boris Brezillon      2020-03-13  230  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1195075465041464344==--

