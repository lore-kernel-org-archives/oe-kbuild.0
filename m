Content-Type: multipart/mixed; boundary="===============5392174826358651816=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/sh/math-emu/sfp-util.h:71:9: sparse: this was the original definition
Date: Sun, 21 Aug 2022 03:06:35 +0800
Message-ID: <202208210244.BZSJxEpa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5392174826358651816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/sh/math-emu/sfp-util.h:71:9: sparse: this was the original definition"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Rich Felker <dalias@libc.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   50cd95ac46548429e5bba7ca75cc97d11a697947
commit: b929926f01f2d14635345d22eafcf60feed1085e sh: define __BIG_ENDIAN fo=
r math-emu
date:   10 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 10 months ago
config: sh-randconfig-s033-20220820 (https://download.01.org/0day-ci/archiv=
e/20220821/202208210244.BZSJxEpa-lkp(a)intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db929926f01f2d14635345d22eafcf60feed1085e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b929926f01f2d14635345d22eafcf60feed1085e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
h SHELL=3D/bin/bash arch/sh/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   arch/sh/math-emu/math.c: note: in included file (through include/math-em=
u/soft-fp.h):
   arch/sh/include/asm/sfp-machine.h:17:9: sparse: sparse: preprocessor tok=
en __BYTE_ORDER redefined
   arch/sh/math-emu/math.c: note: in included file:
>> arch/sh/math-emu/sfp-util.h:71:9: sparse: this was the original definiti=
on
   arch/sh/math-emu/math.c:54:9: sparse: sparse: preprocessor token WRITE r=
edefined
   arch/sh/math-emu/math.c: note: in included file:
   include/linux/kernel.h:38:9: sparse: this was the original definition
   arch/sh/math-emu/math.c:55:9: sparse: sparse: preprocessor token READ re=
defined
   include/linux/kernel.h:37:9: sparse: this was the original definition
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:129:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:129:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:129:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:129:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:145:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:145:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (1)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (1)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (1)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (1)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:129:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:129:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:129:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:129:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:145:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:145:9: sparse: sparse: generating address of non=
-lvalue (11)

vim +71 arch/sh/math-emu/sfp-util.h

13da9e200fe474 Linus Torvalds 2010-05-26  70  =

13da9e200fe474 Linus Torvalds 2010-05-26 @71  #define __BYTE_ORDER __LITTLE=
_ENDIAN

:::::: The code at line 71 was first introduced by commit
:::::: 13da9e200fe4740b02cd51e07ab454627e228920 Revert "endian: #define __B=
YTE_ORDER"

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5392174826358651816==--

