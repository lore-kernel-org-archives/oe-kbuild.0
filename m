Content-Type: multipart/mixed; boundary="===============6065904129899264981=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/renesas/pfc-r8a779f0.c:34:0: warning: failed to expand 'PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorErrorDirective]
Date: Wed, 04 May 2022 03:37:09 +0800
Message-ID: <202205040355.qt7ZSvkY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6065904129899264981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9050ba3a61a4b5bd84c2cde092a100404f814f31
commit: 030ac6d7eeff81e33acc02aa827bfb3448b53d3a pinctrl: renesas: Initial =
R8A779F0 PFC support
date:   10 weeks ago
:::::: branch date: 26 hours ago
:::::: commit date: 10 weeks ago
compiler: powerpc64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 030ac6d7eeff81e33acc02aa827bfb3448b53d3a
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pinctrl/renesas/pfc-sh7724.c:1972:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("PSELA", 0xa405014e, 16, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7724.c:1990:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("PSELB", 0xa4050150, 16, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7724.c:2008:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("PSELC", 0xa4050152, 16, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7724.c:2026:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("PSELD", 0xa4050154, 16, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7724.c:2044:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("PSELE", 0xa4050156, 16, 1, GROUP(
      ^
--
>> drivers/pinctrl/renesas/pfc-sh7757.c:1949:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("PSEL0", 0xffec0070, 16, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7757.c:1967:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("PSEL1", 0xffec0072, 16, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7757.c:1985:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("PSEL2", 0xffec0074, 16, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7757.c:2003:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("PSEL3", 0xffec0076, 16, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7757.c:2022:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("PSEL4", 0xffec0078, 16, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7757.c:2040:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("PSEL5", 0xffec007a, 16, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7757.c:2058:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("PSEL6", 0xffec007c, 16, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7757.c:2076:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("PSEL7", 0xffec0082, 16, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7757.c:2094:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("PSEL8", 0xffec0084, 16, 1, GROUP(
      ^
--
>> drivers/pinctrl/renesas/pfc-r8a779f0.c:34:0: warning: failed to expand '=
PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorError=
Directive]
   #define GPSR0_20 F_(IRQ3, IP2SR0_19_16)
   ^
--
>> drivers/pinctrl/renesas/pfc-sh7786.c:720:4: warning: Modulo of one is al=
ways equal to zero [moduloofone]
    { PINMUX_CFG_REG("P1MSELR", 0xffcc0080, 16, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7786.c:738:4: warning: Modulo of one is al=
ways equal to zero [moduloofone]
    { PINMUX_CFG_REG("P2MSELR", 0xffcc0082, 16, 1, GROUP(
      ^
--
>> drivers/pinctrl/renesas/pfc-sh7734.c:1638:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("GPSR0", 0xFFFC0004, 32, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7734.c:1672:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("GPSR1", 0xFFFC0008, 32, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7734.c:1706:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("GPSR2", 0xFFFC000C, 32, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7734.c:1740:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("GPSR3", 0xFFFC0010, 32, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7734.c:1775:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("GPSR4", 0xFFFC0014, 32, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7734.c:1809:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("GPSR5", 0xFFFC0018, 32, 1, GROUP(
      ^
   drivers/pinctrl/renesas/pfc-sh7734.c:2396:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("INOUTSEL0", 0xFFC40004, 32, 1, GROUP(GP_INOUTSEL(0)))
      ^
   drivers/pinctrl/renesas/pfc-sh7734.c:2398:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("INOUTSEL1", 0xFFC41004, 32, 1, GROUP(GP_INOUTSEL(1)))
      ^
   drivers/pinctrl/renesas/pfc-sh7734.c:2400:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("INOUTSEL2", 0xFFC42004, 32, 1, GROUP(GP_INOUTSEL(2)))
      ^
   drivers/pinctrl/renesas/pfc-sh7734.c:2402:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("INOUTSEL3", 0xFFC43004, 32, 1, GROUP(GP_INOUTSEL(3)))
      ^
   drivers/pinctrl/renesas/pfc-sh7734.c:2404:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("INOUTSEL4", 0xFFC44004, 32, 1, GROUP(GP_INOUTSEL(4)))
      ^
   drivers/pinctrl/renesas/pfc-sh7734.c:2406:4: warning: Modulo of one is a=
lways equal to zero [moduloofone]
    { PINMUX_CFG_REG("INOUTSEL5", 0xffc45004, 32, 1, GROUP(
      ^
--
>> drivers/pinctrl/renesas/pinctrl-rzn1.c:183:38: warning: Boolean result i=
s used in bitwise operation. Clarify expression with parentheses. [clarifyC=
ondition]
     u32 val =3D ipctl->lev1_protect_phys | !(value & LOCK_LEVEL1);
                                        ^
   drivers/pinctrl/renesas/pinctrl-rzn1.c:189:38: warning: Boolean result i=
s used in bitwise operation. Clarify expression with parentheses. [clarifyC=
ondition]
     u32 val =3D ipctl->lev2_protect_phys | !(value & LOCK_LEVEL2);
                                        ^

vim +34 drivers/pinctrl/renesas/pfc-r8a779f0.c

030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  17  =

030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  18  #define CPU_ALL_GP(fn, sf=
x)	\
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  19  	PORT_GP_CFG_21(0, fn, sf=
x, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  20  	PORT_GP_CFG_25(1, fn, sf=
x, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  21  	PORT_GP_CFG_17(2, fn, sf=
x, CFG_FLAGS),	\
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  22  	PORT_GP_CFG_19(3, fn, sf=
x, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  23  =

030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  24  #define CPU_ALL_NOGP(fn)	=
							\
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  25  	PIN_NOGP_CFG(PRESETOUT0_=
N, "PRESETOUT0#", fn, SH_PFC_PIN_CFG_PULL_DOWN),	\
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  26  	PIN_NOGP_CFG(EXTALR, "EX=
TALR", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  27  =

030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  28  /*
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  29   * F_() : just information
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  30   * FM() : macro for FN_xx=
x / xxx_MARK
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  31   */
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  32  =

030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  33  /* GPSR0 */
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21 @34  #define GPSR0_20	F_(IRQ3,=
	IP2SR0_19_16)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  35  #define GPSR0_19	F_(IRQ2,=
	IP2SR0_15_12)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  36  #define GPSR0_18	F_(IRQ1,=
	IP2SR0_11_8)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  37  #define GPSR0_17	F_(IRQ0,=
	IP2SR0_7_4)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  38  #define GPSR0_16	F_(MSIOF=
0_SS2,	IP2SR0_3_0)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  39  #define GPSR0_15	F_(MSIOF=
0_SS1,	IP1SR0_31_28)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  40  #define GPSR0_14	F_(MSIOF=
0_SCK,	IP1SR0_27_24)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  41  #define GPSR0_13	F_(MSIOF=
0_TXD,	IP1SR0_23_20)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  42  #define GPSR0_12	F_(MSIOF=
0_RXD,	IP1SR0_19_16)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  43  #define GPSR0_11	F_(MSIOF=
0_SYNC,	IP1SR0_15_12)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  44  #define GPSR0_10	F_(CTS0_=
N,	IP1SR0_11_8)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  45  #define GPSR0_9		F_(RTS0_=
N,	IP1SR0_7_4)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  46  #define GPSR0_8		F_(SCK0,=
	IP1SR0_3_0)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  47  #define GPSR0_7		F_(TX0,	=
	IP0SR0_31_28)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  48  #define GPSR0_6		F_(RX0,	=
	IP0SR0_27_24)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  49  #define GPSR0_5		F_(HRTS0=
_N,	IP0SR0_23_20)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  50  #define GPSR0_4		F_(HCTS0=
_N,	IP0SR0_19_16)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  51  #define GPSR0_3		F_(HTX0,=
	IP0SR0_15_12)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  52  #define GPSR0_2		F_(HRX0,=
	IP0SR0_11_8)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  53  #define GPSR0_1		F_(HSCK0=
,	IP0SR0_7_4)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  54  #define GPSR0_0		F_(SCIF_=
CLK,	IP0SR0_3_0)
030ac6d7eeff81 Geert Uytterhoeven 2022-02-21  55  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6065904129899264981==--

