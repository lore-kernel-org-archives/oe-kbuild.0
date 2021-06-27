Content-Type: multipart/mixed; boundary="===============2200489419545402309=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/renesas/pfc-r8a7796.c:218:0: warning: failed to expand 'PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorErrorDirective]
Date: Sun, 27 Jun 2021 10:54:49 +0800
Message-ID: <202106271038.c0vJULMx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2200489419545402309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   625acffd7ae2c52898d249e6c5c39f348db0d8df
commit: 077365a941166f3a7f5894017f9d26d17cdec00e pinctrl: Rename sh-pfc to =
renesas
date:   10 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 months ago
compiler: microblaze-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

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
>> drivers/pinctrl/renesas/pfc-r8a77970.c:59:0: warning: failed to expand '=
PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorError=
Directive]
   #define GPSR1_27 F_(DIGRF_CLKOUT, IP8_27_24)
   ^
--
>> drivers/pinctrl/renesas/pfc-r8a77980.c:90:0: warning: failed to expand '=
PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorError=
Directive]
   #define GPSR2_29 F_(FSO_TOE_N,    IP10_19_16)
   ^

vim +218 drivers/pinctrl/renesas/pfc-r8a7796.c

f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  216  =

f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  217  /* GPSR6 */
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18 @218  #define GPSR6_31	F_(GP6_31,		IP18_7_4)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  219  #define GPSR6_30	F_(GP6_30,		IP18_3_0)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  220  #define GPSR6_29	F_(USB30_OVC,		IP17_31_28)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  221  #define GPSR6_28	F_(USB30_PWEN,		IP17_27_24)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  222  #define GPSR6_27	F_(USB1_OVC,		IP17_23_20)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  223  #define GPSR6_26	F_(USB1_PWEN,		IP17_19_16)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  224  #define GPSR6_25	F_(USB0_OVC,		IP17_15_12)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  225  #define GPSR6_24	F_(USB0_PWEN,		IP17_11_8)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  226  #define GPSR6_23	F_(AUDIO_CLKB_B,	IP17_7_4)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  227  #define GPSR6_22	F_(AUDIO_CLKA_A,	IP17_3_0)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  228  #define GPSR6_21	F_(SSI_SDATA9_A,	IP16_31_28)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  229  #define GPSR6_20	F_(SSI_SDATA8,		IP16_27_24)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  230  #define GPSR6_19	F_(SSI_SDATA7,		IP16_23_20)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  231  #define GPSR6_18	F_(SSI_WS78,		IP16_19_16)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  232  #define GPSR6_17	F_(SSI_SCK78,		IP16_15_12)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  233  #define GPSR6_16	F_(SSI_SDATA6,		IP16_11_8)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  234  #define GPSR6_15	F_(SSI_WS6,		IP16_7_4)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  235  #define GPSR6_14	F_(SSI_SCK6,		IP16_3_0)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  236  #define GPSR6_13	FM(SSI_SDATA5)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  237  #define GPSR6_12	FM(SSI_WS5)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  238  #define GPSR6_11	FM(SSI_SCK5)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  239  #define GPSR6_10	F_(SSI_SDATA4,		IP15_31_28)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  240  #define GPSR6_9		F_(SSI_WS4,		IP15_27_24)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  241  #define GPSR6_8		F_(SSI_SCK4,		IP15_23_20)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  242  #define GPSR6_7		F_(SSI_SDATA3,		IP15_19_16)
07073b885871d2 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Kuninori Morimoto 2017-=
05-16  243  #define GPSR6_6		F_(SSI_WS349,		IP15_15_12)
07073b885871d2 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Kuninori Morimoto 2017-=
05-16  244  #define GPSR6_5		F_(SSI_SCK349,		IP15_11_8)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  245  #define GPSR6_4		F_(SSI_SDATA2_A,	IP15_7_4)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  246  #define GPSR6_3		F_(SSI_SDATA1_A,	IP15_3_0)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  247  #define GPSR6_2		F_(SSI_SDATA0,		IP14_31_28)
540403265b7dd3 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Kuninori Morimoto 2017-=
05-12  248  #define GPSR6_1		F_(SSI_WS01239,		IP14_27_24)
540403265b7dd3 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Kuninori Morimoto 2017-=
05-12  249  #define GPSR6_0		F_(SSI_SCK01239,	IP14_23_20)
f9aece7344bd81 drivers/pinctrl/sh-pfc/pfc-r8a7796.c Takeshi Kihara    2016-=
08-18  250  =


:::::: The code at line 218 was first introduced by commit
:::::: f9aece7344bd81ce16bafc15f8e90ef0dbd18714 pinctrl: sh-pfc: Initial R8=
A7796 PFC support

:::::: TO: Takeshi Kihara <takeshi.kihara.df@renesas.com>
:::::: CC: Geert Uytterhoeven <geert+renesas@glider.be>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2200489419545402309==--

