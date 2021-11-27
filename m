Content-Type: multipart/mixed; boundary="===============3580071686817315557=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/pci/saa7134/saa7134-tvaudio.c:153:4: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 28 Nov 2021 03:16:31 +0800
Message-ID: <202111280324.UjjobxAa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3580071686817315557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jakub Jelinek <jakub@redhat.com>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: 2f78788b55baa3410b1ec91a576286abe1ad4d6a ilog2: improve ilog2 for c=
onstant arguments
date:   12 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20211124 (https://download.01.org/0day-ci/archi=
ve/20211128/202111280324.UjjobxAa-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 67a1c4=
5def8a75061203461ab0060c75c864df1c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2f78788b55baa3410b1ec91a576286abe1ad4d6a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2f78788b55baa3410b1ec91a576286abe1ad4d6a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/jffs2/summary.c:718:2: note: Loop condition is true.  Entering loop b=
ody
           while (c->summary->sum_num) {
           ^
   fs/jffs2/summary.c:721:3: note: Control jumps to the 'default' case at l=
ine 780
                   switch (je16_to_cpu(temp->u.nodetype)) {
                   ^
   fs/jffs2/summary.c:781:9: note: Assuming the condition is true
                                   if ((je16_to_cpu(temp->u.nodetype) & JFF=
S2_COMPAT_MASK)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
   fs/jffs2/summary.c:781:5: note: Taking true branch
                                   if ((je16_to_cpu(temp->u.nodetype) & JFF=
S2_COMPAT_MASK)
                                   ^
   fs/jffs2/summary.c:785:6: note: Calling 'jffs2_sum_disable_collecting'
                                           jffs2_sum_disable_collecting(c->=
summary);
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   fs/jffs2/summary.c:220:2: note: Calling 'jffs2_sum_clean_collected'
           jffs2_sum_clean_collected(s);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/summary.c:197:10: note: Field 'sum_list_head' is non-null
           if (!s->sum_list_head) {
                   ^
   fs/jffs2/summary.c:197:2: note: Taking false branch
           if (!s->sum_list_head) {
           ^
   fs/jffs2/summary.c:200:2: note: Loop condition is true.  Entering loop b=
ody
           while (s->sum_list_head) {
           ^
   fs/jffs2/summary.c:203:3: note: Memory is released
                   kfree(temp);
                   ^~~~~~~~~~~
   fs/jffs2/summary.c:200:2: note: Loop condition is false. Execution conti=
nues on line 205
           while (s->sum_list_head) {
           ^
   fs/jffs2/summary.c:220:2: note: Returning; memory was released
           jffs2_sum_clean_collected(s);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/summary.c:785:6: note: Returning; memory was released
                                           jffs2_sum_disable_collecting(c->=
summary);
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   fs/jffs2/summary.c:792:31: note: Use of memory after it is freed
                   c->summary->sum_list_head =3D temp->u.next;
                                               ^~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/phy/cadence/phy-cadence-salvo.c:227:2: warning: Value stored to =
'value' is never read [clang-analyzer-deadcode.DeadStores]
           value |=3D RXDET_IN_P3_32KHZ;
           ^
   drivers/phy/cadence/phy-cadence-salvo.c:227:2: note: Value stored to 'va=
lue' is never read
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   drivers/media/pci/saa7134/saa7134-cards.c:7742:3: warning: Value stored =
to 'tuner_t' is never read [clang-analyzer-deadcode.DeadStores]
                   tuner_t =3D 0;
                   ^         ~
   drivers/media/pci/saa7134/saa7134-cards.c:7742:3: note: Value stored to =
'tuner_t' is never read
                   tuner_t =3D 0;
                   ^         ~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/media/pci/saa7134/saa7134-tvaudio.c:52:15: warning: Excessive pa=
dding in 'struct mainscan' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   std, =

   name, =

   carr, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   static struct mainscan {
          ~~~~~~~^~~~~~~~~~
   drivers/media/pci/saa7134/saa7134-tvaudio.c:52:15: note: Excessive paddi=
ng in 'struct mainscan' (8 padding bytes, where 0 is optimal). Optimal fiel=
ds order: std, name, carr, consider reordering the fields or adding explici=
t padding members
   static struct mainscan {
          ~~~~~~~^~~~~~~~~~
>> drivers/media/pci/saa7134/saa7134-tvaudio.c:153:4: warning: Assigned val=
ue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           a <<=3D 24;
             ^
   drivers/media/pci/saa7134/saa7134-tvaudio.c:321:6: note: Assuming the co=
ndition is false
           if (!(dev->tvnorm->id & scan->std)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7134/saa7134-tvaudio.c:321:2: note: Taking false br=
anch
           if (!(dev->tvnorm->id & scan->std)) {
           ^
   drivers/media/pci/saa7134/saa7134-tvaudio.c:327:6: note: Assuming 'audio=
_debug' is <=3D 1
           if (audio_debug > 1) {
               ^~~~~~~~~~~~~~~
   drivers/media/pci/saa7134/saa7134-tvaudio.c:327:2: note: Taking false br=
anch
           if (audio_debug > 1) {
           ^
   drivers/media/pci/saa7134/saa7134-tvaudio.c:344:2: note: Calling 'tvaudi=
o_setcarrier'
           tvaudio_setcarrier(dev,scan->carr-90,scan->carr-90);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7134/saa7134-tvaudio.c:161:6: note: Assuming the co=
ndition is true
           if (-1 =3D=3D secondary)
               ^~~~~~~~~~~~~~~
   drivers/media/pci/saa7134/saa7134-tvaudio.c:161:2: note: Taking true bra=
nch
           if (-1 =3D=3D secondary)
           ^
   drivers/media/pci/saa7134/saa7134-tvaudio.c:163:2: note: Loop condition =
is false.  Exiting loop
           saa_writel(SAA7134_CARRIER1_FREQ0 >> 2, tvaudio_carr2reg(primary=
));
           ^
   drivers/media/pci/saa7134/saa7134.h:691:36: note: expanded from macro 's=
aa_writel'
   #define saa_writel(reg,value)      writel((value), dev->lmmio + (reg));
                                      ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/media/pci/saa7134/saa7134-tvaudio.c:163:42: note: Calling 'tvaud=
io_carr2reg'
           saa_writel(SAA7134_CARRIER1_FREQ0 >> 2, tvaudio_carr2reg(primary=
));
                                                   ^
   drivers/media/pci/saa7134/saa7134.h:691:44: note: expanded from macro 's=
aa_writel'
   #define saa_writel(reg,value)      writel((value), dev->lmmio + (reg));
                                              ^~~~~
   arch/arm/include/asm/io.h:307:51: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                                                ^
   arch/arm/include/asm/io.h:299:68: note: expanded from macro 'writel_rela=
xed'
   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v=
),c)
                                                                          ^
   include/uapi/linux/byteorder/little_endian.h:33:51: note: expanded from =
macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
   drivers/media/pci/saa7134/saa7134-tvaudio.c:153:4: note: Assigned value =
is garbage or undefined
           a <<=3D 24;
             ^   ~~
   drivers/media/pci/saa7134/saa7134-tvaudio.c:494:3: warning: Value stored=
 to 'max1' is never read [clang-analyzer-deadcode.DeadStores]
                   max1 =3D 0;
                   ^      ~
   drivers/media/pci/saa7134/saa7134-tvaudio.c:494:3: note: Value stored to=
 'max1' is never read
                   max1 =3D 0;
                   ^      ~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/clk/clk-fractional-divider.c:88:32: warning: The result of the r=
ight shift is undefined due to shifting by '32', which is greater or equal =
to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOp=
eratorResult]
                           GENMASK(fd->mwidth - 1, 0), GENMASK(fd->nwidth -=
 1, 0),
                                                       ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   drivers/clk/clk-fractional-divider.c:95:38: note: Left side of '&&' is f=
alse
           struct clk_fractional_divider *fd =3D to_clk_fd(hw);
                                               ^
   include/linux/clk-provider.h:956:24: note: expanded from macro 'to_clk_f=
d'
   #define to_clk_fd(_hw) container_of(_hw, struct clk_fractional_divider, =
hw)
                          ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/clk/clk-fractional-divider.c:95:38: note: Taking false branch
           struct clk_fractional_divider *fd =3D to_clk_fd(hw);

vim +153 drivers/media/pci/saa7134/saa7134-tvaudio.c

^1da177e4c3f41 drivers/media/video/saa7134/saa7134-tvaudio.c Linus Torvalds=
 2005-04-16  148  =

^1da177e4c3f41 drivers/media/video/saa7134/saa7134-tvaudio.c Linus Torvalds=
 2005-04-16  149  static u32 tvaudio_carr2reg(u32 carrier)
^1da177e4c3f41 drivers/media/video/saa7134/saa7134-tvaudio.c Linus Torvalds=
 2005-04-16  150  {
^1da177e4c3f41 drivers/media/video/saa7134/saa7134-tvaudio.c Linus Torvalds=
 2005-04-16  151  	u64 a =3D carrier;
^1da177e4c3f41 drivers/media/video/saa7134/saa7134-tvaudio.c Linus Torvalds=
 2005-04-16  152  =

^1da177e4c3f41 drivers/media/video/saa7134/saa7134-tvaudio.c Linus Torvalds=
 2005-04-16 @153  	a <<=3D 24;
^1da177e4c3f41 drivers/media/video/saa7134/saa7134-tvaudio.c Linus Torvalds=
 2005-04-16  154  	do_div(a,12288);
^1da177e4c3f41 drivers/media/video/saa7134/saa7134-tvaudio.c Linus Torvalds=
 2005-04-16  155  	return a;
^1da177e4c3f41 drivers/media/video/saa7134/saa7134-tvaudio.c Linus Torvalds=
 2005-04-16  156  }
^1da177e4c3f41 drivers/media/video/saa7134/saa7134-tvaudio.c Linus Torvalds=
 2005-04-16  157  =


:::::: The code@line 153 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3580071686817315557==--

