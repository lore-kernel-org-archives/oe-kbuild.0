Content-Type: multipart/mixed; boundary="===============1724918597728309732=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/renesas/pfc-r8a77951.c:214:0: warning: failed to expand 'PINMUX_GPSR', Wrong number of parameters for macro 'F_'.
Date: Wed, 27 Jan 2021 03:32:55 +0800
Message-ID: <202101270346.dCu1EnCo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1724918597728309732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>

Hi Geert,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   13391c60da3308ed9980de0168f74cce6c62ac1d
commit: 077365a941166f3a7f5894017f9d26d17cdec00e pinctrl: Rename sh-pfc to =
renesas
date:   4 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 4 months ago
compiler: xtensa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pinctrl/renesas/pfc-r8a77951.c:214:0: warning: failed to expand =
'PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorErro=
rDirective]
   #define GPSR6_31 F_(USB2_CH3_OVC, IP18_7_4)
   ^
--
>> drivers/pinctrl/renesas/pfc-r8a7796.c:218:0: warning: failed to expand '=
PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorError=
Directive]
   #define GPSR6_31 F_(GP6_31,  IP18_7_4)
   ^
--
>> drivers/pinctrl/renesas/pfc-r8a77965.c:219:0: warning: failed to expand =
'PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorErro=
rDirective]
   #define GPSR6_31 F_(GP6_31,  IP18_7_4)
   ^

vim +214 drivers/pinctrl/renesas/pfc-r8a77951.c

0b0ffc96dbe30f drivers/pinctrl/sh-pfc/pfc-r8a7795.c Takeshi Kihara     2015=
-09-03  212  =

0b0ffc96dbe30f drivers/pinctrl/sh-pfc/pfc-r8a7795.c Takeshi Kihara     2015=
-09-03  213  /* GPSR6 */
f9d130808c9aa7 drivers/pinctrl/sh-pfc/pfc-r8a7795.c Yoshihiro Shimoda  2017=
-07-26 @214  #define GPSR6_31	F_(USB2_CH3_OVC,	IP18_7_4)
f9d130808c9aa7 drivers/pinctrl/sh-pfc/pfc-r8a7795.c Yoshihiro Shimoda  2017=
-07-26  215  #define GPSR6_30	F_(USB2_CH3_PWEN,	IP18_3_0)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  216  #define GPSR6_29	F_(USB30_OVC,		IP17_31_28)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  217  #define GPSR6_28	F_(USB30_PWEN,		IP17_27_24)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  218  #define GPSR6_27	F_(USB1_OVC,		IP17_23_20)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  219  #define GPSR6_26	F_(USB1_PWEN,		IP17_19_16)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  220  #define GPSR6_25	F_(USB0_OVC,		IP17_15_12)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  221  #define GPSR6_24	F_(USB0_PWEN,		IP17_11_8)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  222  #define GPSR6_23	F_(AUDIO_CLKB_B,	IP17_7_4)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  223  #define GPSR6_22	F_(AUDIO_CLKA_A,	IP17_3_0)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  224  #define GPSR6_21	F_(SSI_SDATA9_A,	IP16_31_28)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  225  #define GPSR6_20	F_(SSI_SDATA8,		IP16_27_24)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  226  #define GPSR6_19	F_(SSI_SDATA7,		IP16_23_20)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  227  #define GPSR6_18	F_(SSI_WS78,		IP16_19_16)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  228  #define GPSR6_17	F_(SSI_SCK78,		IP16_15_12)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  229  #define GPSR6_16	F_(SSI_SDATA6,		IP16_11_8)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  230  #define GPSR6_15	F_(SSI_WS6,		IP16_7_4)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  231  #define GPSR6_14	F_(SSI_SCK6,		IP16_3_0)
0b0ffc96dbe30f drivers/pinctrl/sh-pfc/pfc-r8a7795.c Takeshi Kihara     2015=
-09-03  232  #define GPSR6_13	FM(SSI_SDATA5)
0b0ffc96dbe30f drivers/pinctrl/sh-pfc/pfc-r8a7795.c Takeshi Kihara     2015=
-09-03  233  #define GPSR6_12	FM(SSI_WS5)
0b0ffc96dbe30f drivers/pinctrl/sh-pfc/pfc-r8a7795.c Takeshi Kihara     2015=
-09-03  234  #define GPSR6_11	FM(SSI_SCK5)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  235  #define GPSR6_10	F_(SSI_SDATA4,		IP15_31_28)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  236  #define GPSR6_9		F_(SSI_WS4,		IP15_27_24)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  237  #define GPSR6_8		F_(SSI_SCK4,		IP15_23_20)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  238  #define GPSR6_7		F_(SSI_SDATA3,		IP15_19_16)
68e6389200120b drivers/pinctrl/sh-pfc/pfc-r8a7795.c Kuninori Morimoto  2017=
-05-16  239  #define GPSR6_6		F_(SSI_WS349,		IP15_15_12)
68e6389200120b drivers/pinctrl/sh-pfc/pfc-r8a7795.c Kuninori Morimoto  2017=
-05-16  240  #define GPSR6_5		F_(SSI_SCK349,		IP15_11_8)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  241  #define GPSR6_4		F_(SSI_SDATA2_A,	IP15_7_4)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  242  #define GPSR6_3		F_(SSI_SDATA1_A,	IP15_3_0)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  243  #define GPSR6_2		F_(SSI_SDATA0,		IP14_31_28)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  244  #define GPSR6_1		F_(SSI_WS01239,		IP14_27_24)
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795.c Geert Uytterhoeven 2016=
-10-03  245  #define GPSR6_0		F_(SSI_SCK01239,		IP14_23_20)
0b0ffc96dbe30f drivers/pinctrl/sh-pfc/pfc-r8a7795.c Takeshi Kihara     2015=
-09-03  246  =


:::::: The code at line 214 was first introduced by commit
:::::: f9d130808c9aa74c34a6ed5eb536e19872065313 pinctrl: sh-pfc: r8a7795: C=
hange USB3_{OVC,PWEN} definitions

:::::: TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
:::::: CC: Geert Uytterhoeven <geert+renesas@glider.be>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1724918597728309732==--

