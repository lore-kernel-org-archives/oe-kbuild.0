Content-Type: multipart/mixed; boundary="===============4590813837862532313=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/renesas/pfc-r8a779a0.c:135:0: warning: failed to expand 'PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorErrorDirective]
Date: Tue, 28 Dec 2021 15:32:58 +0800
Message-ID: <202112281515.PVpFgC2f-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4590813837862532313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ulrich Hecht <uli+renesas@fpond.eu>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a8ad9a2434dc7967ab285437f443cae633b6fc1c
commit: 741a7370fc3b8b549ac69886be161a99109b78b6 pinctrl: renesas: Initial =
R8A779A0 (V3U) PFC support
date:   12 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 months ago
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pinctrl/renesas/pfc-r8a779a0.c:135:0: warning: failed to expand =
'PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorErro=
rDirective]
   #define GPSR1_30 F_(GP1_30, IP3SR1_27_24)
   ^

vim +135 drivers/pinctrl/renesas/pfc-r8a779a0.c

741a7370fc3b8b Ulrich Hecht 2021-01-12  133  =

741a7370fc3b8b Ulrich Hecht 2021-01-12  134  /* GPSR1 */
741a7370fc3b8b Ulrich Hecht 2021-01-12 @135  #define GPSR1_30	F_(GP1_30,	IP=
3SR1_27_24)
741a7370fc3b8b Ulrich Hecht 2021-01-12  136  #define GPSR1_29	F_(GP1_29,	IP=
3SR1_23_20)
741a7370fc3b8b Ulrich Hecht 2021-01-12  137  #define GPSR1_28	F_(GP1_28,	IP=
3SR1_19_16)
741a7370fc3b8b Ulrich Hecht 2021-01-12  138  #define GPSR1_27	F_(IRQ3,	IP3S=
R1_15_12)
741a7370fc3b8b Ulrich Hecht 2021-01-12  139  #define GPSR1_26	F_(IRQ2,	IP3S=
R1_11_8)
741a7370fc3b8b Ulrich Hecht 2021-01-12  140  #define GPSR1_25	F_(IRQ1,	IP3S=
R1_7_4)
741a7370fc3b8b Ulrich Hecht 2021-01-12  141  #define GPSR1_24	F_(IRQ0,	IP3S=
R1_3_0)
741a7370fc3b8b Ulrich Hecht 2021-01-12  142  #define GPSR1_23	F_(MSIOF2_SS2=
,	IP2SR1_31_28)
741a7370fc3b8b Ulrich Hecht 2021-01-12  143  #define GPSR1_22	F_(MSIOF2_SS1=
,	IP2SR1_27_24)
741a7370fc3b8b Ulrich Hecht 2021-01-12  144  #define GPSR1_21	F_(MSIOF2_SYN=
C,	IP2SR1_23_20)
741a7370fc3b8b Ulrich Hecht 2021-01-12  145  #define GPSR1_20	F_(MSIOF2_SCK=
,	IP2SR1_19_16)
741a7370fc3b8b Ulrich Hecht 2021-01-12  146  #define GPSR1_19	F_(MSIOF2_TXD=
,	IP2SR1_15_12)
741a7370fc3b8b Ulrich Hecht 2021-01-12  147  #define GPSR1_18	F_(MSIOF2_RXD=
,	IP2SR1_11_8)
741a7370fc3b8b Ulrich Hecht 2021-01-12  148  #define GPSR1_17	F_(MSIOF1_SS2=
,	IP2SR1_7_4)
741a7370fc3b8b Ulrich Hecht 2021-01-12  149  #define GPSR1_16	F_(MSIOF1_SS1=
,	IP2SR1_3_0)
741a7370fc3b8b Ulrich Hecht 2021-01-12  150  #define GPSR1_15	F_(MSIOF1_SYN=
C,	IP1SR1_31_28)
741a7370fc3b8b Ulrich Hecht 2021-01-12  151  #define GPSR1_14	F_(MSIOF1_SCK=
,	IP1SR1_27_24)
741a7370fc3b8b Ulrich Hecht 2021-01-12  152  #define GPSR1_13	F_(MSIOF1_TXD=
,	IP1SR1_23_20)
741a7370fc3b8b Ulrich Hecht 2021-01-12  153  #define GPSR1_12	F_(MSIOF1_RXD=
,	IP1SR1_19_16)
741a7370fc3b8b Ulrich Hecht 2021-01-12  154  #define GPSR1_11	F_(MSIOF0_SS2=
,	IP1SR1_15_12)
741a7370fc3b8b Ulrich Hecht 2021-01-12  155  #define GPSR1_10	F_(MSIOF0_SS1=
,	IP1SR1_11_8)
741a7370fc3b8b Ulrich Hecht 2021-01-12  156  #define GPSR1_9		F_(MSIOF0_SYN=
C,	IP1SR1_7_4)
741a7370fc3b8b Ulrich Hecht 2021-01-12  157  #define GPSR1_8		F_(MSIOF0_SCK=
,	IP1SR1_3_0)
741a7370fc3b8b Ulrich Hecht 2021-01-12  158  #define GPSR1_7		F_(MSIOF0_TXD=
,	IP0SR1_31_28)
741a7370fc3b8b Ulrich Hecht 2021-01-12  159  #define GPSR1_6		F_(MSIOF0_RXD=
,	IP0SR1_27_24)
741a7370fc3b8b Ulrich Hecht 2021-01-12  160  #define GPSR1_5		F_(HTX0,	IP0S=
R1_23_20)
741a7370fc3b8b Ulrich Hecht 2021-01-12  161  #define GPSR1_4		F_(HCTS0_N,	I=
P0SR1_19_16)
741a7370fc3b8b Ulrich Hecht 2021-01-12  162  #define GPSR1_3		F_(HRTS0_N,	I=
P0SR1_15_12)
741a7370fc3b8b Ulrich Hecht 2021-01-12  163  #define GPSR1_2		F_(HSCK0,	IP0=
SR1_11_8)
741a7370fc3b8b Ulrich Hecht 2021-01-12  164  #define GPSR1_1		F_(HRX0,	IP0S=
R1_7_4)
741a7370fc3b8b Ulrich Hecht 2021-01-12  165  #define GPSR1_0		F_(SCIF_CLK,	=
IP0SR1_3_0)
741a7370fc3b8b Ulrich Hecht 2021-01-12  166  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4590813837862532313==--

