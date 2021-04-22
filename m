Content-Type: multipart/mixed; boundary="===============4050266432866189820=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/renesas/pfc-r8a77990.c:113:0: warning: failed to expand 'PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorErrorDirective]
Date: Thu, 22 Apr 2021 17:17:24 +0800
Message-ID: <202104221711.PblxrP3Z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4050266432866189820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   16fc44d6387e260f4932e9248b985837324705d8
commit: 077365a941166f3a7f5894017f9d26d17cdec00e pinctrl: Rename sh-pfc to =
renesas
date:   7 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 months ago
compiler: powerpc64le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pinctrl/renesas/pfc-r8a77990.c:113:0: warning: failed to expand =
'PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorErro=
rDirective]
   #define GPSR2_25 F_(EX_WAIT0,  IP2_27_24)
   ^

vim +113 drivers/pinctrl/renesas/pfc-r8a77990.c

6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  111  =

6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  112  /* GPSR2 */
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11 @113  #define GPSR2_25	F_(EX_WAIT0,		IP2_27_24)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  114  #define GPSR2_24	F_(RD_WR_N,		IP2_23_20)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  115  #define GPSR2_23	F_(RD_N,		IP2_19_16)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  116  #define GPSR2_22	F_(BS_N,		IP2_15_12)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  117  #define GPSR2_21	FM(AVB_PHY_INT)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  118  #define GPSR2_20	F_(AVB_TXCREFCLK,	IP2_3_0)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  119  #define GPSR2_19	FM(AVB_RD3)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  120  #define GPSR2_18	F_(AVB_RD2,		IP1_31_28)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  121  #define GPSR2_17	F_(AVB_RD1,		IP1_27_24)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  122  #define GPSR2_16	F_(AVB_RD0,		IP1_23_20)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  123  #define GPSR2_15	FM(AVB_RXC)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  124  #define GPSR2_14	FM(AVB_RX_CTL)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  125  #define GPSR2_13	F_(RPC_RESET_N,		IP1_19_16)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  126  #define GPSR2_12	F_(RPC_INT_N,		IP1_15_12)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  127  #define GPSR2_11	F_(QSPI1_SSL,		IP1_11_8)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  128  #define GPSR2_10	F_(QSPI1_IO3,		IP1_7_4)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  129  #define GPSR2_9		F_(QSPI1_IO2,		IP1_3_0)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  130  #define GPSR2_8		F_(QSPI1_MISO_IO1,	IP0_31_28)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  131  #define GPSR2_7		F_(QSPI1_MOSI_IO0,	IP0_27_24)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  132  #define GPSR2_6		F_(QSPI1_SPCLK,		IP0_23_20)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  133  #define GPSR2_5		FM(QSPI0_SSL)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  134  #define GPSR2_4		F_(QSPI0_IO3,		IP0_19_16)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  135  #define GPSR2_3		F_(QSPI0_IO2,		IP0_15_12)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  136  #define GPSR2_2		F_(QSPI0_MISO_IO1,	IP0_11_8)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  137  #define GPSR2_1		F_(QSPI0_MOSI_IO0,	IP0_7_4)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  138  #define GPSR2_0		F_(QSPI0_SPCLK,		IP0_3_0)
6d4036a1e3b3ac drivers/pinctrl/sh-pfc/pfc-r8a77990.c Takeshi Kihara 2018-05=
-11  139  =


:::::: The code at line 113 was first introduced by commit
:::::: 6d4036a1e3b3ac0f3eebda5a0bbc6d78ebc14389 pinctrl: sh-pfc: Initial R8=
A77990 PFC support

:::::: TO: Takeshi Kihara <takeshi.kihara.df@renesas.com>
:::::: CC: Geert Uytterhoeven <geert+renesas@glider.be>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4050266432866189820==--

