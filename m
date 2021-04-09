Content-Type: multipart/mixed; boundary="===============1548208719920487153=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/renesas/core.c:131:16: warning: Possible null pointer dereference: r [nullPointer]
Date: Fri, 09 Apr 2021 08:43:25 +0800
Message-ID: <202104090809.FYv8eeHO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1548208719920487153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3fb4f979b4fa1f92a02b538ae86e725b73e703d0
commit: 077365a941166f3a7f5894017f9d26d17cdec00e pinctrl: Rename sh-pfc to =
renesas
date:   7 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 months ago
compiler: powerpc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pinctrl/renesas/core.c:131:16: warning: Possible null pointer de=
reference: r [nullPointer]
    if (enum_id < r->begin)
                  ^
   drivers/pinctrl/renesas/core.c:315:11: note: Assignment 'range=3DNULL', =
assigned value is 0
     range =3D NULL;
             ^
   drivers/pinctrl/renesas/core.c:361:46: note: Calling function 'sh_pfc_en=
um_in_range', 2nd argument 'range' value is 0
       in_range =3D sh_pfc_enum_in_range(enum_id, range);
                                                ^
   drivers/pinctrl/renesas/core.c:131:16: note: Null pointer dereference
    if (enum_id < r->begin)
                  ^
   drivers/pinctrl/renesas/core.c:134:16: warning: Possible null pointer de=
reference: r [nullPointer]
    if (enum_id > r->end)
                  ^
   drivers/pinctrl/renesas/core.c:315:11: note: Assignment 'range=3DNULL', =
assigned value is 0
     range =3D NULL;
             ^
   drivers/pinctrl/renesas/core.c:361:46: note: Calling function 'sh_pfc_en=
um_in_range', 2nd argument 'range' value is 0
       in_range =3D sh_pfc_enum_in_range(enum_id, range);
                                                ^
   drivers/pinctrl/renesas/core.c:134:16: note: Null pointer dereference
    if (enum_id > r->end)
                  ^
>> drivers/pinctrl/renesas/pfc-r8a77951.c:214:0: warning: failed to expand =
'PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorErro=
rDirective]
   #define GPSR6_31 F_(USB2_CH3_OVC, IP18_7_4)
   ^
--
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
>> drivers/pinctrl/renesas/pfc-r8a77965.c:219:0: warning: failed to expand =
'PINMUX_GPSR', Wrong number of parameters for macro 'F_'. [preprocessorErro=
rDirective]
   #define GPSR6_31 F_(GP6_31,  IP18_7_4)
   ^

vim +131 drivers/pinctrl/renesas/core.c

934cb02bab9003b drivers/pinctrl/sh-pfc/core.c Laurent Pinchart 2013-02-14  =
128  =

533743dccb517b0 drivers/pinctrl/sh-pfc/core.c Laurent Pinchart 2013-07-15  =
129  static int sh_pfc_enum_in_range(u16 enum_id, const struct pinmux_range=
 *r)
2967dab1ae37e30 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  =
130  {
2967dab1ae37e30 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08 @=
131  	if (enum_id < r->begin)
2967dab1ae37e30 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  =
132  		return 0;
2967dab1ae37e30 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  =
133  =

2967dab1ae37e30 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  =
134  	if (enum_id > r->end)
2967dab1ae37e30 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  =
135  		return 0;
2967dab1ae37e30 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  =
136  =

2967dab1ae37e30 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  =
137  	return 1;
2967dab1ae37e30 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  =
138  }
2967dab1ae37e30 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  =
139  =


:::::: The code at line 131 was first introduced by commit
:::::: 2967dab1ae37e30f1b71316513b49fd25c42eabe sh: GPIO and pinmux base co=
de

:::::: TO: Magnus Damm <damm@igel.co.jp>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1548208719920487153==--

