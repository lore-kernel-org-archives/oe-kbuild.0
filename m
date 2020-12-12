Content-Type: multipart/mixed; boundary="===============6670879972881259649=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/renesas/pfc-r8a77950.c:213:0: warning: failed to expand 'PINMUX_GPSR', Wrong number of parameters for macro 'F_'.
Date: Sun, 13 Dec 2020 03:08:23 +0800
Message-ID: <202012130317.k3zXgpad-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6670879972881259649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7f376f1917d7461e05b648983e8d2aea9d0712b2
commit: 077365a941166f3a7f5894017f9d26d17cdec00e pinctrl: Rename sh-pfc to =
renesas
date:   3 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 3 months ago
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pinctrl/renesas/pfc-r8a77950.c:213:0: warning: failed to expand =
'PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorErro=
rDirective]
   #define GPSR6_31 F_(USB31_OVC,  IP17_7_4)
   ^
--
>> drivers/pinctrl/renesas/pfc-r8a7796.c:218:0: warning: failed to expand '=
PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorError=
Directive]
   #define GPSR6_31 F_(GP6_31,  IP18_7_4)
   ^
--
>> drivers/pinctrl/renesas/pfc-r8a77990.c:113:0: warning: failed to expand =
'PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorErro=
rDirective]
   #define GPSR2_25 F_(EX_WAIT0,  IP2_27_24)
   ^
--
>> drivers/pinctrl/renesas/pfc-r8a77951.c:214:0: warning: failed to expand =
'PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorErro=
rDirective]
   #define GPSR6_31 F_(USB2_CH3_OVC, IP18_7_4)
   ^
--
>> drivers/pinctrl/renesas/pfc-r8a77965.c:219:0: warning: failed to expand =
'PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorErro=
rDirective]
   #define GPSR6_31 F_(GP6_31,  IP18_7_4)
   ^

vim +213 drivers/pinctrl/renesas/pfc-r8a77950.c

b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  211  =

b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  212  /* GPSR6 */
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03 @213  #define GPSR6_31	F_(USB31_OVC,		IP17_7_4)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  214  #define GPSR6_30	F_(USB31_PWEN,		IP17_3_0)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  215  #define GPSR6_29	F_(USB30_OVC,		IP16_31_28)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  216  #define GPSR6_28	F_(USB30_PWEN,		IP16_27_24)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  217  #define GPSR6_27	F_(USB1_OVC,		IP16_23_20)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  218  #define GPSR6_26	F_(USB1_PWEN,		IP16_19_16)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  219  #define GPSR6_25	F_(USB0_OVC,		IP16_15_12)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  220  #define GPSR6_24	F_(USB0_PWEN,		IP16_11_8)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  221  #define GPSR6_23	F_(AUDIO_CLKB_B,	IP16_7_4)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  222  #define GPSR6_22	F_(AUDIO_CLKA_A,	IP16_3_0)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  223  #define GPSR6_21	F_(SSI_SDATA9_A,	IP15_31_28)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  224  #define GPSR6_20	F_(SSI_SDATA8,		IP15_27_24)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  225  #define GPSR6_19	F_(SSI_SDATA7,		IP15_23_20)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  226  #define GPSR6_18	F_(SSI_WS78,		IP15_19_16)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  227  #define GPSR6_17	F_(SSI_SCK78,		IP15_15_12)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  228  #define GPSR6_16	F_(SSI_SDATA6,		IP15_11_8)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  229  #define GPSR6_15	F_(SSI_WS6,		IP15_7_4)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  230  #define GPSR6_14	F_(SSI_SCK6,		IP15_3_0)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  231  #define GPSR6_13	FM(SSI_SDATA5)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  232  #define GPSR6_12	FM(SSI_WS5)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  233  #define GPSR6_11	FM(SSI_SCK5)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  234  #define GPSR6_10	F_(SSI_SDATA4,		IP14_31_28)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  235  #define GPSR6_9		F_(SSI_WS4,		IP14_27_24)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  236  #define GPSR6_8		F_(SSI_SCK4,		IP14_23_20)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  237  #define GPSR6_7		F_(SSI_SDATA3,		IP14_19_16)
5c6aa7bdd2ebdf drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Kuninori Morimoto  =
2017-05-16  238  #define GPSR6_6		F_(SSI_WS349,		IP14_15_12)
5c6aa7bdd2ebdf drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Kuninori Morimoto  =
2017-05-16  239  #define GPSR6_5		F_(SSI_SCK349,		IP14_11_8)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  240  #define GPSR6_4		F_(SSI_SDATA2_A,	IP14_7_4)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  241  #define GPSR6_3		F_(SSI_SDATA1_A,	IP14_3_0)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  242  #define GPSR6_2		F_(SSI_SDATA0,		IP13_31_28)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  243  #define GPSR6_1		F_(SSI_WS01239,		IP13_27_24)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  244  #define GPSR6_0		F_(SSI_SCK01239,	IP13_23_20)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven =
2016-10-03  245  =


:::::: The code at line 213 was first introduced by commit
:::::: b205914c8f822ef2464b741c64e892823d685ad6 pinctrl: sh-pfc: r8a7795: A=
dd support for R-Car H3 ES2.0

:::::: TO: Geert Uytterhoeven <geert+renesas@glider.be>
:::::: CC: Geert Uytterhoeven <geert+renesas@glider.be>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6670879972881259649==--

