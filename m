Content-Type: multipart/mixed; boundary="===============4548711766107056653=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/sh/math-emu/sfp-util.h:71:9: sparse: this was the original definition
Date: Sat, 16 Jul 2022 20:06:49 +0800
Message-ID: <202207162051.E4Wj1qzc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4548711766107056653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/sh/math-emu/sfp-util.h:71:9: sparse: this was the original definition"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Rich Felker <dalias@libc.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9b59ec8d50a1f28747ceff9a4f39af5deba9540e
commit: b929926f01f2d14635345d22eafcf60feed1085e sh: define __BIG_ENDIAN fo=
r math-emu
date:   9 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 9 months ago
config: sh-randconfig-s042-20220715 (https://download.01.org/0day-ci/archiv=
e/20220716/202207162051.E4Wj1qzc-lkp(a)intel.com/config)
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
h SHELL=3D/bin/bash ./ arch/sh/math-emu/ drivers/pinctrl/nuvoton/ drivers/s=
oc/imx/ drivers/thermal/ fs/xfs/

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
--===============4548711766107056653==--

