Content-Type: multipart/mixed; boundary="===============0599664200515961069=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.10 730/1981] drivers/mtd/spi-nor/micron-st.c:61:3-19: duplicated argument to & or |
Date: Sat, 18 Dec 2021 00:49:57 +0800
Message-ID: <202112180053.vQI0Y0PV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0599664200515961069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: P L Sai Krishna <lakshmis@xilinx.com>
CC: Anurag Kumar Vulisha <anuragku@xilinx.com>
CC: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
CC: Tejas Prajapati Rameshchandra <tejaspra@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.10
head:   87ec9a2d98a7a7dfc98b57348a0ec310fd170e4b
commit: 69da6b404536626df93a8b4b5b4e48884cba87ca [730/1981] mtd: spi-nor: U=
pdate flags for serial NOR flash devices
:::::: branch date: 3 days ago
:::::: commit date: 7 months ago
config: microblaze-randconfig-c004-20211216 (https://download.01.org/0day-c=
i/archive/20211218/202112180053.vQI0Y0PV-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/mtd/spi-nor/micron-st.c:61:3-19: duplicated argument to & or |

vim +61 drivers/mtd/spi-nor/micron-st.c

15f5c7e54e658a Boris Brezillon      2020-03-13   19  =

15f5c7e54e658a Boris Brezillon      2020-03-13   20  static const struct fl=
ash_info st_parts[] =3D {
15f5c7e54e658a Boris Brezillon      2020-03-13   21  	{ "n25q016a",	 INFO(0=
x20bb15, 0, 64 * 1024,   32,
15f5c7e54e658a Boris Brezillon      2020-03-13   22  			      SECT_4K | SPI=
_NOR_QUAD_READ) },
15f5c7e54e658a Boris Brezillon      2020-03-13   23  	{ "n25q032",	 INFO(0x=
20ba16, 0, 64 * 1024,   64,
15f5c7e54e658a Boris Brezillon      2020-03-13   24  			      SPI_NOR_QUAD_=
READ) },
15f5c7e54e658a Boris Brezillon      2020-03-13   25  	{ "n25q032a",	 INFO(0=
x20bb16, 0, 64 * 1024,   64,
15f5c7e54e658a Boris Brezillon      2020-03-13   26  			      SPI_NOR_QUAD_=
READ) },
15f5c7e54e658a Boris Brezillon      2020-03-13   27  	{ "n25q064",     INFO=
(0x20ba17, 0, 64 * 1024,  128,
15f5c7e54e658a Boris Brezillon      2020-03-13   28  			      SECT_4K | SPI=
_NOR_QUAD_READ) },
15f5c7e54e658a Boris Brezillon      2020-03-13   29  	{ "n25q064a",    INFO=
(0x20bb17, 0, 64 * 1024,  128,
15f5c7e54e658a Boris Brezillon      2020-03-13   30  			      SECT_4K | SPI=
_NOR_QUAD_READ) },
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   31  	{ "n25q128a11",  INFO=
(0x20bb18, 0, 64 * 1024,  256, SECT_4K |
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   32  			SPI_NOR_QUAD_READ |=
 SPI_NOR_HAS_LOCK) },
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   33  	{ "n25q128a13",  INFO=
(0x20ba18, 0, 64 * 1024,  256, SECT_4K |
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   34  			SPI_NOR_QUAD_READ |=
 SPI_NOR_HAS_LOCK) },
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   35  	{ "n25q256a",    INFO=
(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   36  			SPI_NOR_DUAL_READ |=
 SPI_NOR_QUAD_READ | USE_FSR |
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   37  			SPI_NOR_HAS_LOCK) },
15f5c7e54e658a Boris Brezillon      2020-03-13   38  	{ "n25q256a",    INFO=
(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
15f5c7e54e658a Boris Brezillon      2020-03-13   39  			      USE_FSR | SPI=
_NOR_DUAL_READ |
15f5c7e54e658a Boris Brezillon      2020-03-13   40  			      SPI_NOR_QUAD_=
READ) },
15f5c7e54e658a Boris Brezillon      2020-03-13   41  	{ "mt25qu256a",  INFO=
6(0x20bb19, 0x104400, 64 * 1024,  512,
15f5c7e54e658a Boris Brezillon      2020-03-13   42  			       SECT_4K | US=
E_FSR | SPI_NOR_DUAL_READ |
15f5c7e54e658a Boris Brezillon      2020-03-13   43  			       SPI_NOR_QUAD=
_READ | SPI_NOR_4B_OPCODES) },
15f5c7e54e658a Boris Brezillon      2020-03-13   44  	{ "n25q256ax1",  INFO=
(0x20bb19, 0, 64 * 1024,  512,
15f5c7e54e658a Boris Brezillon      2020-03-13   45  			      SECT_4K | USE=
_FSR | SPI_NOR_QUAD_READ) },
15f5c7e54e658a Boris Brezillon      2020-03-13   46  	{ "mt25ql512a",  INFO=
6(0x20ba20, 0x104400, 64 * 1024, 1024,
15f5c7e54e658a Boris Brezillon      2020-03-13   47  			       SECT_4K | US=
E_FSR | SPI_NOR_DUAL_READ |
15f5c7e54e658a Boris Brezillon      2020-03-13   48  			       SPI_NOR_QUAD=
_READ | SPI_NOR_4B_OPCODES) },
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   49  	{ "n25q512ax3",  INFO=
(0x20ba20, 0, 64 * 1024, 1024, SECT_4K |
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   50  			USE_FSR | SPI_NOR_Q=
UAD_READ | SPI_NOR_HAS_LOCK) },
15f5c7e54e658a Boris Brezillon      2020-03-13   51  	{ "mt25qu512a",  INFO=
6(0x20bb20, 0x104400, 64 * 1024, 1024,
15f5c7e54e658a Boris Brezillon      2020-03-13   52  			       SECT_4K | US=
E_FSR | SPI_NOR_DUAL_READ |
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   53  			       SPI_NOR_QUAD=
_READ | SPI_NOR_4B_OPCODES |
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   54  				   SPI_NOR_HAS_LOC=
K) },
15f5c7e54e658a Boris Brezillon      2020-03-13   55  	{ "n25q512a",    INFO=
(0x20bb20, 0, 64 * 1024, 1024,
f3f2b7eb2f1c58 Jungseung Lee        2020-03-18   56  			      SECT_4K | USE=
_FSR | SPI_NOR_QUAD_READ |
f3f2b7eb2f1c58 Jungseung Lee        2020-03-18   57  			      SPI_NOR_HAS_L=
OCK | SPI_NOR_HAS_TB |
f3f2b7eb2f1c58 Jungseung Lee        2020-03-18   58  			      SPI_NOR_4BIT_=
BP | SPI_NOR_BP3_SR_BIT6) },
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   59  	{ "n25q00",      INFO=
(0x20ba21, 0, 64 * 1024, 2048, SECT_4K |
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   60  			USE_FSR | SPI_NOR_Q=
UAD_READ | NO_CHIP_ERASE |
69da6b40453662 Amit Kumar Mahapatra 2020-01-19  @61  			SPI_NOR_HAS_LOCK | =
SPI_NOR_HAS_LOCK) },
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   62  	{ "n25q00a",     INFO=
(0x20bb21, 0, 64 * 1024, 2048, SECT_4K |
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   63  			USE_FSR | SPI_NOR_Q=
UAD_READ | NO_CHIP_ERASE |
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   64  			SPI_NOR_HAS_LOCK) },
15f5c7e54e658a Boris Brezillon      2020-03-13   65  	{ "mt25ql02g",   INFO=
(0x20ba22, 0, 64 * 1024, 4096,
15f5c7e54e658a Boris Brezillon      2020-03-13   66  			      SECT_4K | USE=
_FSR | SPI_NOR_QUAD_READ |
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   67  			      NO_CHIP_ERASE=
 | SPI_NOR_HAS_LOCK) },
15f5c7e54e658a Boris Brezillon      2020-03-13   68  	{ "mt25qu02g",   INFO=
(0x20bb22, 0, 64 * 1024, 4096,
1371a80cac33d5 David Clear          2020-07-20   69  			      SECT_4K | USE=
_FSR | SPI_NOR_DUAL_READ |
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   70  			      SPI_NOR_QUAD_=
READ | NO_CHIP_ERASE |
69da6b40453662 Amit Kumar Mahapatra 2020-01-19   71  				  SPI_NOR_HAS_LOCK=
) },
15f5c7e54e658a Boris Brezillon      2020-03-13   72  =

15f5c7e54e658a Boris Brezillon      2020-03-13   73  	{ "m25p05",  INFO(0x2=
02010,  0,  32 * 1024,   2, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   74  	{ "m25p10",  INFO(0x2=
02011,  0,  32 * 1024,   4, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   75  	{ "m25p20",  INFO(0x2=
02012,  0,  64 * 1024,   4, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   76  	{ "m25p40",  INFO(0x2=
02013,  0,  64 * 1024,   8, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   77  	{ "m25p80",  INFO(0x2=
02014,  0,  64 * 1024,  16, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   78  	{ "m25p16",  INFO(0x2=
02015,  0,  64 * 1024,  32, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   79  	{ "m25p32",  INFO(0x2=
02016,  0,  64 * 1024,  64, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   80  	{ "m25p64",  INFO(0x2=
02017,  0,  64 * 1024, 128, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   81  	{ "m25p128", INFO(0x2=
02018,  0, 256 * 1024,  64, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   82  =

15f5c7e54e658a Boris Brezillon      2020-03-13   83  	{ "m25p05-nonjedec", =
 INFO(0, 0,  32 * 1024,   2, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   84  	{ "m25p10-nonjedec", =
 INFO(0, 0,  32 * 1024,   4, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   85  	{ "m25p20-nonjedec", =
 INFO(0, 0,  64 * 1024,   4, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   86  	{ "m25p40-nonjedec", =
 INFO(0, 0,  64 * 1024,   8, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   87  	{ "m25p80-nonjedec", =
 INFO(0, 0,  64 * 1024,  16, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   88  	{ "m25p16-nonjedec", =
 INFO(0, 0,  64 * 1024,  32, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   89  	{ "m25p32-nonjedec", =
 INFO(0, 0,  64 * 1024,  64, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   90  	{ "m25p64-nonjedec", =
 INFO(0, 0,  64 * 1024, 128, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   91  	{ "m25p128-nonjedec",=
 INFO(0, 0, 256 * 1024,  64, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   92  =

15f5c7e54e658a Boris Brezillon      2020-03-13   93  	{ "m45pe10", INFO(0x2=
04011,  0, 64 * 1024,    2, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   94  	{ "m45pe80", INFO(0x2=
04014,  0, 64 * 1024,   16, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   95  	{ "m45pe16", INFO(0x2=
04015,  0, 64 * 1024,   32, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   96  =

15f5c7e54e658a Boris Brezillon      2020-03-13   97  	{ "m25pe20", INFO(0x2=
08012,  0, 64 * 1024,  4,       0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   98  	{ "m25pe80", INFO(0x2=
08014,  0, 64 * 1024, 16,       0) },
15f5c7e54e658a Boris Brezillon      2020-03-13   99  	{ "m25pe16", INFO(0x2=
08015,  0, 64 * 1024, 32, SECT_4K) },
15f5c7e54e658a Boris Brezillon      2020-03-13  100  =

15f5c7e54e658a Boris Brezillon      2020-03-13  101  	{ "m25px16",    INFO(=
0x207115,  0, 64 * 1024, 32, SECT_4K) },
15f5c7e54e658a Boris Brezillon      2020-03-13  102  	{ "m25px32",    INFO(=
0x207116,  0, 64 * 1024, 64, SECT_4K) },
15f5c7e54e658a Boris Brezillon      2020-03-13  103  	{ "m25px32-s0", INFO(=
0x207316,  0, 64 * 1024, 64, SECT_4K) },
15f5c7e54e658a Boris Brezillon      2020-03-13  104  	{ "m25px32-s1", INFO(=
0x206316,  0, 64 * 1024, 64, SECT_4K) },
15f5c7e54e658a Boris Brezillon      2020-03-13  105  	{ "m25px64",    INFO(=
0x207117,  0, 64 * 1024, 128, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  106  	{ "m25px80",    INFO(=
0x207114,  0, 64 * 1024, 16, 0) },
15f5c7e54e658a Boris Brezillon      2020-03-13  107  };
15f5c7e54e658a Boris Brezillon      2020-03-13  108  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0599664200515961069==--

