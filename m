Content-Type: multipart/mixed; boundary="===============1318432862595948959=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/pistachio/clk.c:81:9: warning: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Tue, 09 Nov 2021 11:32:06 +0800
Message-ID: <202111091159.cUZ8inoJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1318432862595948959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jiaxun Yang <jiaxun.yang@flygoat.com>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d2f38a3c6507b2520101f9a3807ed98f1bdc545a
commit: 90429205c000f4befdc212cfade39e358292584c clk: pistachio: Make it se=
lectable for generic MIPS kernel
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20211017 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 8ca4b3=
ef19fe82d7ad6a6e1515317dcc01b41515)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D90429205c000f4befdc212cfade39e358292584c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 90429205c000f4befdc212cfade39e358292584c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^    ~~~~~~~~~~~~~~~~~
   fs/ext4/extents.c:3335:2: warning: Value stored to 'split_flag1' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           split_flag1 =3D 0;
           ^             ~
   fs/ext4/extents.c:3335:2: note: Value stored to 'split_flag1' is never r=
ead
           split_flag1 =3D 0;
           ^             ~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/clk/pistachio/clk.c:81:9: warning: The result of the left shift =
is undefined because the right operand is negative [clang-analyzer-core.Und=
efinedBinaryOperatorResult]
                   clk =3D clk_register_mux(NULL, mux[i].name, mux[i].paren=
ts,
                         ^
   include/linux/clk-provider.h:909:36: note: expanded from macro 'clk_regi=
ster_mux'
                                  (flags), (reg), (shift), BIT((width)) - 1=
,     \
                                                           ^~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   drivers/clk/pistachio/clk.c:80:14: note: Assuming 'i' is < 'num'
           for (i =3D 0; i < num; i++) {
                       ^~~~~~~
   drivers/clk/pistachio/clk.c:80:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < num; i++) {
           ^
   drivers/clk/pistachio/clk.c:85:12: note: Calling 'get_count_order'
                                          get_count_order(mux[i].num_parent=
s),
                                          ^
   include/linux/clk-provider.h:909:41: note: expanded from macro 'clk_regi=
ster_mux'
                                  (flags), (reg), (shift), BIT((width)) - 1=
,     \
                                                                ^~~~~
   include/vdso/bits.h:7:30: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                              ^~
   include/linux/bitops.h:194:6: note: Assuming 'count' is equal to 0
           if (count =3D=3D 0)
               ^~~~~~~~~~
   include/linux/bitops.h:194:2: note: Taking true branch
           if (count =3D=3D 0)
           ^
   include/linux/bitops.h:195:3: note: Returning the value -1
                   return -1;
                   ^~~~~~~~~
   drivers/clk/pistachio/clk.c:85:12: note: Returning from 'get_count_order'
                                          get_count_order(mux[i].num_parent=
s),
                                          ^
   include/linux/clk-provider.h:909:41: note: expanded from macro 'clk_regi=
ster_mux'
                                  (flags), (reg), (shift), BIT((width)) - 1=
,     \
                                                                ^~~~~
   include/vdso/bits.h:7:30: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                              ^~
   drivers/clk/pistachio/clk.c:81:9: note: The result of the left shift is =
undefined because the right operand is negative
                   clk =3D clk_register_mux(NULL, mux[i].name, mux[i].paren=
ts,
                         ^
   include/linux/clk-provider.h:909:36: note: expanded from macro 'clk_regi=
ster_mux'
                                  (flags), (reg), (shift), BIT((width)) - 1=
,     \
                                                           ^~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
>> drivers/clk/pistachio/clk.c:81:9: warning: The result of the left shift =
is undefined due to shifting by '32', which is greater or equal to the widt=
h of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResul=
t]
                   clk =3D clk_register_mux(NULL, mux[i].name, mux[i].paren=
ts,
                         ^
   include/linux/clk-provider.h:909:36: note: expanded from macro 'clk_regi=
ster_mux'
                                  (flags), (reg), (shift), BIT((width)) - 1=
,     \
                                                           ^~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   drivers/clk/pistachio/clk.c:80:14: note: Assuming 'i' is < 'num'
           for (i =3D 0; i < num; i++) {
                       ^~~~~~~
   drivers/clk/pistachio/clk.c:80:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < num; i++) {
           ^
   drivers/clk/pistachio/clk.c:85:12: note: Calling 'get_count_order'
                                          get_count_order(mux[i].num_parent=
s),
                                          ^
   include/linux/clk-provider.h:909:41: note: expanded from macro 'clk_regi=
ster_mux'
                                  (flags), (reg), (shift), BIT((width)) - 1=
,     \
                                                                ^~~~~
   include/vdso/bits.h:7:30: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                              ^~
   include/linux/bitops.h:194:6: note: Assuming 'count' is not equal to 0
           if (count =3D=3D 0)
               ^~~~~~~~~~
   include/linux/bitops.h:194:2: note: Taking false branch
           if (count =3D=3D 0)
           ^
   include/linux/bitops.h:197:9: note: Calling 'fls'
           return fls(--count);
                  ^~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal t=
o 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is f=
alse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is f=
alse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   include/linux/bitops.h:197:9: note: Returning from 'fls'
           return fls(--count);
                  ^~~~~~~~~~~~
   include/linux/bitops.h:197:2: note: Returning the value 32
           return fls(--count);
           ^~~~~~~~~~~~~~~~~~~
   drivers/clk/pistachio/clk.c:85:12: note: Returning from 'get_count_order'
                                          get_count_order(mux[i].num_parent=
s),
                                          ^
   include/linux/clk-provider.h:909:41: note: expanded from macro 'clk_regi=
ster_mux'
                                  (flags), (reg), (shift), BIT((width)) - 1=
,     \
                                                                ^~~~~
   include/vdso/bits.h:7:30: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                              ^~
   drivers/clk/pistachio/clk.c:81:9: note: The result of the left shift is =
undefined due to shifting by '32', which is greater or equal to the width o=
f type 'unsigned long'
                   clk =3D clk_register_mux(NULL, mux[i].name, mux[i].paren=
ts,
                         ^
   include/linux/clk-provider.h:909:36: note: expanded from macro 'clk_regi=
ster_mux'
                                  (flags), (reg), (shift), BIT((width)) - 1=
,     \
                                                           ^~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +81 drivers/clk/pistachio/clk.c

8e4b7721f61e70 Andrew Bresticker 2015-02-24  72  =

8e4b7721f61e70 Andrew Bresticker 2015-02-24  73  void pistachio_clk_registe=
r_mux(struct pistachio_clk_provider *p,
8e4b7721f61e70 Andrew Bresticker 2015-02-24  74  				struct pistachio_mux *=
mux,
8e4b7721f61e70 Andrew Bresticker 2015-02-24  75  				unsigned int num)
8e4b7721f61e70 Andrew Bresticker 2015-02-24  76  {
8e4b7721f61e70 Andrew Bresticker 2015-02-24  77  	struct clk *clk;
8e4b7721f61e70 Andrew Bresticker 2015-02-24  78  	unsigned int i;
8e4b7721f61e70 Andrew Bresticker 2015-02-24  79  =

8e4b7721f61e70 Andrew Bresticker 2015-02-24  80  	for (i =3D 0; i < num; i+=
+) {
8e4b7721f61e70 Andrew Bresticker 2015-02-24 @81  		clk =3D clk_register_mux=
(NULL, mux[i].name, mux[i].parents,
8e4b7721f61e70 Andrew Bresticker 2015-02-24  82  				       mux[i].num_pare=
nts,
8e4b7721f61e70 Andrew Bresticker 2015-02-24  83  				       CLK_SET_RATE_NO=
_REPARENT,
8e4b7721f61e70 Andrew Bresticker 2015-02-24  84  				       p->base + mux[i=
].reg, mux[i].shift,
8e4b7721f61e70 Andrew Bresticker 2015-02-24  85  				       get_count_order=
(mux[i].num_parents),
8e4b7721f61e70 Andrew Bresticker 2015-02-24  86  				       0, NULL);
8e4b7721f61e70 Andrew Bresticker 2015-02-24  87  		p->clk_data.clks[mux[i].=
id] =3D clk;
8e4b7721f61e70 Andrew Bresticker 2015-02-24  88  	}
8e4b7721f61e70 Andrew Bresticker 2015-02-24  89  }
8e4b7721f61e70 Andrew Bresticker 2015-02-24  90  =


:::::: The code at line 81 was first introduced by commit
:::::: 8e4b7721f61e70396ad8ec2d866c91300f2afbd1 CLK: Add basic infrastructu=
re for Pistachio clocks

:::::: TO: Andrew Bresticker <abrestic@chromium.org>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1318432862595948959==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1318432862595948959==--

