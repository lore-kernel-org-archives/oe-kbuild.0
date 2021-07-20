Content-Type: multipart/mixed; boundary="===============4327237027546399728=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/renesas/core.c:131:16: warning: Possible null pointer dereference: r [nullPointer]
Date: Wed, 21 Jul 2021 03:56:42 +0800
Message-ID: <202107210334.xdJsJNC9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4327237027546399728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Julian Braha <julianbraha@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Julian,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8cae8cd89f05f6de223d63e6d15e31c8ba9cf53b
commit: 7d37cb2c912dc5c25ffac784a4f9b98c06c6bd08 lib: fix kconfig dependenc=
y on ARCH_WANT_FRAME_POINTERS
date:   3 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
compiler: csky-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pinctrl/renesas/core.c:131:16: warning: Possible null pointer de=
reference: r [nullPointer]
    if (enum_id < r->begin)
                  ^
   drivers/pinctrl/renesas/core.c:323:11: note: Assignment 'range=3DNULL', =
assigned value is 0
     range =3D NULL;
             ^
   drivers/pinctrl/renesas/core.c:371:46: note: Calling function 'sh_pfc_en=
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
   drivers/pinctrl/renesas/core.c:323:11: note: Assignment 'range=3DNULL', =
assigned value is 0
     range =3D NULL;
             ^
   drivers/pinctrl/renesas/core.c:371:46: note: Calling function 'sh_pfc_en=
um_in_range', 2nd argument 'range' value is 0
       in_range =3D sh_pfc_enum_in_range(enum_id, range);
                                                ^
   drivers/pinctrl/renesas/core.c:134:16: note: Null pointer dereference
    if (enum_id > r->end)
                  ^

vim +131 drivers/pinctrl/renesas/core.c

934cb02bab9003 drivers/pinctrl/sh-pfc/core.c Laurent Pinchart 2013-02-14  1=
28  =

533743dccb517b drivers/pinctrl/sh-pfc/core.c Laurent Pinchart 2013-07-15  1=
29  static int sh_pfc_enum_in_range(u16 enum_id, const struct pinmux_range =
*r)
2967dab1ae37e3 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  1=
30  {
2967dab1ae37e3 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08 @1=
31  	if (enum_id < r->begin)
2967dab1ae37e3 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  1=
32  		return 0;
2967dab1ae37e3 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  1=
33  =

2967dab1ae37e3 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  1=
34  	if (enum_id > r->end)
2967dab1ae37e3 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  1=
35  		return 0;
2967dab1ae37e3 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  1=
36  =

2967dab1ae37e3 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  1=
37  	return 1;
2967dab1ae37e3 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  1=
38  }
2967dab1ae37e3 arch/sh/kernel/gpio.c         Magnus Damm      2008-10-08  1=
39  =


:::::: The code at line 131 was first introduced by commit
:::::: 2967dab1ae37e30f1b71316513b49fd25c42eabe sh: GPIO and pinmux base co=
de

:::::: TO: Magnus Damm <damm@igel.co.jp>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4327237027546399728==--

