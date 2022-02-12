Content-Type: multipart/mixed; boundary="===============1525770211002899802=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/video/fbdev/smscufx.c:835:33: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sun, 13 Feb 2022 03:49:14 +0800
Message-ID: <202202130333.HA0H3MJV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1525770211002899802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Kees Cook <keescook@chromium.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   83e396641110663d3c7bb25b9bc0c6a750359ecf
commit: 97e4910232fa1f81e806aa60c25a0450276d99a2 linux/compiler-clang.h: de=
fine HAVE_BUILTIN_BSWAP*
date:   11 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-c004-20220211 (https://download.01.org/0day-ci/arch=
ive/20220213/202202130333.HA0H3MJV-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f=
774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D97e4910232fa1f81e806aa60c25a0450276d99a2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 97e4910232fa1f81e806aa60c25a0450276d99a2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/video/fbdev/smscufx.c:151:24: warning: Access to field 'udev' re=
sults in a dereference of a null pointer (loaded from variable 'dev') [clan=
g-analyzer-core.NullDereference]
           ret =3D usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
                                 ^
   drivers/video/fbdev/smscufx.c:353:28: note: Passing value via 1st parame=
ter 'dev'
           int status =3D ufx_reg_read(dev, 0x2004, &dc_sts);
                                     ^~~
   drivers/video/fbdev/smscufx.c:353:15: note: Calling 'ufx_reg_read'
           int status =3D ufx_reg_read(dev, 0x2004, &dc_sts);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:143:13: note: Calling 'kmalloc'
           u32 *buf =3D kmalloc(4, GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:542:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:559:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:143:13: note: Returning from 'kmalloc'
           u32 *buf =3D kmalloc(4, GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:146:9: note: Assuming 'dev' is null
           BUG_ON(!dev);
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   drivers/video/fbdev/smscufx.c:148:6: note: Assuming 'buf' is non-null
           if (!buf)
               ^~~~
   drivers/video/fbdev/smscufx.c:148:2: note: Taking false branch
           if (!buf)
           ^
   drivers/video/fbdev/smscufx.c:151:24: note: Access to field 'udev' resul=
ts in a dereference of a null pointer (loaded from variable 'dev')
           ret =3D usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
                                 ^~~
   drivers/video/fbdev/smscufx.c:180:24: warning: Access to field 'udev' re=
sults in a dereference of a null pointer (loaded from variable 'dev') [clan=
g-analyzer-core.NullDereference]
           ret =3D usb_control_msg(dev->udev, usb_sndctrlpipe(dev->udev, 0),
                                 ^
   drivers/video/fbdev/smscufx.c:1329:29: note: Passing value via 1st param=
eter 'dev'
           int status =3D ufx_reg_write(dev, 0x106C, 0x00);
                                      ^~~
   drivers/video/fbdev/smscufx.c:1329:15: note: Calling 'ufx_reg_write'
           int status =3D ufx_reg_write(dev, 0x106C, 0x00);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:169:13: note: Calling 'kmalloc'
           u32 *buf =3D kmalloc(4, GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:542:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:559:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:169:13: note: Returning from 'kmalloc'
           u32 *buf =3D kmalloc(4, GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:172:9: note: Assuming 'dev' is null
           BUG_ON(!dev);
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   drivers/video/fbdev/smscufx.c:174:6: note: Assuming 'buf' is non-null
           if (!buf)
               ^~~~
   drivers/video/fbdev/smscufx.c:174:2: note: Taking false branch
           if (!buf)
           ^
   drivers/video/fbdev/smscufx.c:180:24: note: Access to field 'udev' resul=
ts in a dereference of a null pointer (loaded from variable 'dev')
           ret =3D usb_control_msg(dev->udev, usb_sndctrlpipe(dev->udev, 0),
                                 ^~~
>> drivers/video/fbdev/smscufx.c:835:33: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           cmd[10] =3D cpu_to_le16(0x4000 | dev->info->var.xres);
                                          ^
   include/linux/byteorder/generic.h:90:21: note: expanded from macro 'cpu_=
to_le16'
   #define cpu_to_le16 __cpu_to_le16
                       ^
   drivers/video/fbdev/smscufx.c:991:6: note: Assuming the condition is fal=
se
           if (!atomic_read(&dev->usb_active))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:991:2: note: Taking false branch
           if (!atomic_read(&dev->usb_active))
           ^
   drivers/video/fbdev/smscufx.c:995:6: note: Assuming 'cmd' is not equal t=
o UFX_IOCTL_RETURN_EDID
           if (cmd =3D=3D UFX_IOCTL_RETURN_EDID) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:995:2: note: Taking false branch
           if (cmd =3D=3D UFX_IOCTL_RETURN_EDID) {
           ^
   drivers/video/fbdev/smscufx.c:1003:6: note: Assuming 'cmd' is equal to U=
FX_IOCTL_REPORT_DAMAGE
           if (cmd =3D=3D UFX_IOCTL_REPORT_DAMAGE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:1003:2: note: Taking true branch
           if (cmd =3D=3D UFX_IOCTL_REPORT_DAMAGE) {
           ^
   drivers/video/fbdev/smscufx.c:1010:7: note: Assuming field 'fbdefio' is =
null
                   if (info->fbdefio)
                       ^~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:1010:3: note: Taking false branch
                   if (info->fbdefio)
                   ^
   drivers/video/fbdev/smscufx.c:1015:7: note: Assuming field 'x' is >=3D 0
                   if (area->x < 0)
                       ^~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:1015:3: note: Taking false branch
                   if (area->x < 0)
                   ^
   drivers/video/fbdev/smscufx.c:1018:7: note: Assuming field 'x' is <=3D f=
ield 'xres'
                   if (area->x > info->var.xres)
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:1018:3: note: Taking false branch
                   if (area->x > info->var.xres)
                   ^
   drivers/video/fbdev/smscufx.c:1021:7: note: Assuming field 'y' is >=3D 0
                   if (area->y < 0)
                       ^~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:1021:3: note: Taking false branch
                   if (area->y < 0)
                   ^
   drivers/video/fbdev/smscufx.c:1024:7: note: Assuming field 'y' is <=3D f=
ield 'yres'
                   if (area->y > info->var.yres)
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:1024:3: note: Taking false branch
                   if (area->y > info->var.yres)
                   ^
   drivers/video/fbdev/smscufx.c:1027:3: note: Calling 'ufx_handle_damage'
                   ufx_handle_damage(dev, area->x, area->y, area->w, area->=
h);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/video/fbdev/smscufx.c:855:7: note: Assuming 'width' is > 0
           if ((width <=3D 0) || (height <=3D 0) ||
                ^~~~~~~~~~
   drivers/video/fbdev/smscufx.c:855:6: note: Left side of '||' is false
           if ((width <=3D 0) || (height <=3D 0) ||
               ^
   drivers/video/fbdev/smscufx.c:855:23: note: Assuming 'height' is > 0
           if ((width <=3D 0) || (height <=3D 0) ||
                                ^~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:855:6: note: Left side of '||' is false
           if ((width <=3D 0) || (height <=3D 0) ||
               ^
   drivers/video/fbdev/smscufx.c:856:7: note: Assuming the condition is fal=
se
               (x + width > dev->info->var.xres) ||
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:855:6: note: Left side of '||' is false
           if ((width <=3D 0) || (height <=3D 0) ||
               ^
   drivers/video/fbdev/smscufx.c:857:7: note: Assuming the condition is fal=
se
               (y + height > dev->info->var.yres))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:855:2: note: Taking false branch
           if ((width <=3D 0) || (height <=3D 0) ||
           ^
   drivers/video/fbdev/smscufx.c:860:2: note: Taking false branch
           if (!atomic_read(&dev->usb_active))
           ^
   drivers/video/fbdev/smscufx.c:863:9: note: 'start_line' is < 'height'
           while (start_line < height) {
                  ^~~~~~~~~~
   drivers/video/fbdev/smscufx.c:863:2: note: Loop condition is true.  Ente=
ring loop body
           while (start_line < height) {
           ^
   drivers/video/fbdev/smscufx.c:864:21: note: Calling 'ufx_get_urb'
                   struct urb *urb =3D ufx_get_urb(dev);
                                     ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:1908:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/video/fbdev/smscufx.c:1908:2: note: Taking false branch
           if (ret) {
           ^
   drivers/video/fbdev/smscufx.c:1915:2: note: Loop condition is false.  Ex=
iting loop
           spin_lock_irqsave(&dev->urbs.lock, flags);
--
                       ^~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:1096:3: note: Taking true branch
                   if (el->l_tree_depth) {
                   ^
   fs/ocfs2/refcounttree.c:1101:4: note: Control jumps to line 1138
                           goto out;
                           ^
   fs/ocfs2/refcounttree.c:1139:2: note: Returning without writing to 'ret_=
rec->r_cpos'
           return ret;
           ^
   fs/ocfs2/refcounttree.c:1139:2: note: Returning value (loaded from 'ret'=
), which participates in a condition later
           return ret;
           ^~~~~~~~~~
   fs/ocfs2/refcounttree.c:2386:9: note: Returning from 'ocfs2_get_refcount=
_rec'
                   ret =3D ocfs2_get_refcount_rec(ci, ref_root_bh,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:2389:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   fs/ocfs2/refcounttree.c:2389:3: note: Taking false branch
                   if (ret) {
                   ^
   fs/ocfs2/refcounttree.c:2394:7: note: 'ref_leaf_bh' is equal to 'prev_bh'
                   if (ref_leaf_bh !=3D prev_bh) {
                       ^~~~~~~~~~~
   fs/ocfs2/refcounttree.c:2394:3: note: Taking false branch
                   if (ref_leaf_bh !=3D prev_bh) {
                   ^
   fs/ocfs2/refcounttree.c:2418:25: note: 1st function call argument is an =
uninitialized value
                                   (unsigned long long)le64_to_cpu(rec.r_cp=
os),
                                                       ^
   include/linux/byteorder/generic.h:87:21: note: expanded from macro 'le64=
_to_cpu'
   #define le64_to_cpu __le64_to_cpu
                       ^
   include/uapi/linux/byteorder/big_endian.h:32:26: note: expanded from mac=
ro '__le64_to_cpu'
   #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:128:28: note: expanded from macro '__swab64'
   #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
                              ^                 ~~~~~~~~~~
   fs/ocfs2/refcounttree.c:3644:17: warning: The left operand of '=3D=3D' i=
s a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           BUG_ON(cow_len =3D=3D 0);
                          ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   fs/ocfs2/refcounttree.c:3632:17: note: 'cow_len' declared without an ini=
tial value
           u32 cow_start, cow_len;
                          ^~~~~~~
   fs/ocfs2/refcounttree.c:3634:9: note: Assuming the condition is false
           BUG_ON(!ocfs2_is_refcount_inode(inode));
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   fs/ocfs2/refcounttree.c:3636:8: note: Calling 'ocfs2_refcount_cal_cow_cl=
usters'
           ret =3D ocfs2_refcount_cal_cow_clusters(inode, &xv->xr_list,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:2648:6: note: Assuming 'tree_height' is > 0
           if (tree_height > 0) {
               ^~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:2648:2: note: Taking true branch
           if (tree_height > 0) {
           ^
   fs/ocfs2/refcounttree.c:2650:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   fs/ocfs2/refcounttree.c:2650:3: note: Taking false branch
                   if (ret) {
                   ^
   fs/ocfs2/refcounttree.c:2658:7: note: Assuming field 'l_tree_depth' is n=
ot equal to 0
                   if (el->l_tree_depth) {
                       ^~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:2658:3: note: Taking true branch
                   if (el->l_tree_depth) {
                   ^
   fs/ocfs2/refcounttree.c:2663:4: note: Control jumps to line 2823
                           goto out;
                           ^
   fs/ocfs2/refcounttree.c:2824:2: note: Returning without writing to '*cow=
_len'
           return ret;
           ^
   fs/ocfs2/refcounttree.c:2824:2: note: Returning value (loaded from 'ret'=
), which participates in a condition later
           return ret;
           ^~~~~~~~~~
   fs/ocfs2/refcounttree.c:3636:8: note: Returning from 'ocfs2_refcount_cal=
_cow_clusters'
           ret =3D ocfs2_refcount_cal_cow_clusters(inode, &xv->xr_list,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:3639:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   fs/ocfs2/refcounttree.c:3639:2: note: Taking false branch
           if (ret) {
           ^
   fs/ocfs2/refcounttree.c:3644:17: note: The left operand of '=3D=3D' is a=
 garbage value
           BUG_ON(cow_len =3D=3D 0);
                          ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
>> fs/ocfs2/refcounttree.c:3654:21: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
           context->cow_start =3D cow_start;
                              ^ ~~~~~~~~~
   fs/ocfs2/refcounttree.c:3632:6: note: 'cow_start' declared without an in=
itial value
           u32 cow_start, cow_len;
               ^~~~~~~~~
   fs/ocfs2/refcounttree.c:3634:9: note: Assuming the condition is false
           BUG_ON(!ocfs2_is_refcount_inode(inode));
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   fs/ocfs2/refcounttree.c:3636:8: note: Calling 'ocfs2_refcount_cal_cow_cl=
usters'
           ret =3D ocfs2_refcount_cal_cow_clusters(inode, &xv->xr_list,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:2648:6: note: Assuming 'tree_height' is <=3D 0
           if (tree_height > 0) {
               ^~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:2648:2: note: Taking false branch
           if (tree_height > 0) {
           ^
   fs/ocfs2/refcounttree.c:2668:14: note: Assuming the condition is false
           for (i =3D 0; i < le16_to_cpu(el->l_next_free_rec); i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:2668:2: note: Loop condition is false. Execution=
 continues on line 2823
           for (i =3D 0; i < le16_to_cpu(el->l_next_free_rec); i++) {
           ^
   fs/ocfs2/refcounttree.c:2824:2: note: Returning without writing to '*cow=
_start'
           return ret;
           ^
   fs/ocfs2/refcounttree.c:2824:2: note: Returning zero (loaded from 'ret')=
, which participates in a condition later
           return ret;
           ^~~~~~~~~~
   fs/ocfs2/refcounttree.c:3636:8: note: Returning from 'ocfs2_refcount_cal=
_cow_clusters'
           ret =3D ocfs2_refcount_cal_cow_clusters(inode, &xv->xr_list,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:3639:6: note: 'ret' is 0
           if (ret) {
               ^~~
   fs/ocfs2/refcounttree.c:3639:2: note: Taking false branch
           if (ret) {
           ^
   fs/ocfs2/refcounttree.c:3646:12: note: Calling 'kzalloc'
           context =3D kzalloc(sizeof(struct ocfs2_cow_context), GFP_NOFS);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:684:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:542:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:559:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:684:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:684:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:3646:12: note: Returning from 'kzalloc'
           context =3D kzalloc(sizeof(struct ocfs2_cow_context), GFP_NOFS);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:3647:6: note: Assuming 'context' is non-null
           if (!context) {
               ^~~~~~~~
   fs/ocfs2/refcounttree.c:3647:2: note: Taking false branch
           if (!context) {
           ^
   fs/ocfs2/refcounttree.c:3654:21: note: Assigned value is garbage or unde=
fined
           context->cow_start =3D cow_start;
                              ^ ~~~~~~~~~
   include/linux/page-flags.h:184:23: warning: Dereference of null pointer =
[clang-analyzer-core.NullDereference]
           unsigned long head =3D READ_ONCE(page->compound_head);
                                ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   fs/ocfs2/refcounttree.c:3154:6: note: Calling 'ocfs2_should_order_data'
           if (ocfs2_should_order_data(inode))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/ocfs2.h:484:7: note: Assuming the condition is false
           if (!S_ISREG(inode->i_mode))
                ^
   include/uapi/linux/stat.h:22:21: note: expanded from macro 'S_ISREG'
   #define S_ISREG(m)      (((m) & S_IFMT) =3D=3D S_IFREG)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/ocfs2.h:484:2: note: Taking true branch
           if (!S_ISREG(inode->i_mode))
           ^
   fs/ocfs2/ocfs2.h:485:3: note: Returning zero, which participates in a co=
ndition later
                   return 0;
                   ^~~~~~~~
   fs/ocfs2/refcounttree.c:3154:6: note: Returning from 'ocfs2_should_order=
_data'
           if (ocfs2_should_order_data(inode))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:3154:2: note: Taking false branch
           if (ocfs2_should_order_data(inode))

vim +835 drivers/video/fbdev/smscufx.c

3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  809  =

be444890c82a15 drivers/video/smscufx.c Steve Glendinning 2011-09-07  810  s=
tatic void ufx_raw_rect(struct ufx_data *dev, u16 *cmd, int x, int y,
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  811  	=
int width, int height)
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  812  {
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  813  	=
size_t packed_line_len =3D ALIGN((width * 2), 4);
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  814  	=
size_t packed_rect_len =3D packed_line_len * height;
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  815  	=
int line;
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  816  =

3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  817  	=
BUG_ON(!dev);
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  818  	=
BUG_ON(!dev->info);
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  819  =

3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  820  	=
/* command word */
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  821  	=
*((u32 *)&cmd[0]) =3D cpu_to_le32(0x01);
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  822  =

3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  823  	=
/* length word */
be444890c82a15 drivers/video/smscufx.c Steve Glendinning 2011-09-07  824  	=
*((u32 *)&cmd[2]) =3D cpu_to_le32(packed_rect_len + 16);
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  825  =

be444890c82a15 drivers/video/smscufx.c Steve Glendinning 2011-09-07  826  	=
cmd[4] =3D cpu_to_le16(x);
be444890c82a15 drivers/video/smscufx.c Steve Glendinning 2011-09-07  827  	=
cmd[5] =3D cpu_to_le16(y);
be444890c82a15 drivers/video/smscufx.c Steve Glendinning 2011-09-07  828  	=
cmd[6] =3D cpu_to_le16(width);
be444890c82a15 drivers/video/smscufx.c Steve Glendinning 2011-09-07  829  	=
cmd[7] =3D cpu_to_le16(height);
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  830  =

3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  831  	=
/* frame base address */
be444890c82a15 drivers/video/smscufx.c Steve Glendinning 2011-09-07  832  	=
*((u32 *)&cmd[8]) =3D cpu_to_le32(0);
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  833  =

3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  834  	=
/* color mode and horizontal resolution */
be444890c82a15 drivers/video/smscufx.c Steve Glendinning 2011-09-07 @835  	=
cmd[10] =3D cpu_to_le16(0x4000 | dev->info->var.xres);
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  836  =

3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  837  	=
/* vertical resolution */
be444890c82a15 drivers/video/smscufx.c Steve Glendinning 2011-09-07  838  	=
cmd[11] =3D cpu_to_le16(dev->info->var.yres);
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  839  =

3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  840  	=
/* packed data */
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  841  	=
for (line =3D 0; line < height; line++) {
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  842  	=
	const int line_offset =3D dev->info->fix.line_length * (y + line);
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  843  	=
	const int byte_offset =3D line_offset + (x * BPP);
be444890c82a15 drivers/video/smscufx.c Steve Glendinning 2011-09-07  844  	=
	memcpy(&cmd[(24 + (packed_line_len * line)) / 2],
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  845  	=
		(char *)dev->info->fix.smem_start + byte_offset, width * BPP);
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  846  	}
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  847  }
3c8a63e22a0802 drivers/video/smscufx.c Steve Glendinning 2011-08-18  848  =


:::::: The code at line 835 was first introduced by commit
:::::: be444890c82a150d137c75cac8c7f3c5b02b7748 smscufx: reduce number of c=
asts in ufx_raw_rect

:::::: TO: Steve Glendinning <steve.glendinning@smsc.com>
:::::: CC: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1525770211002899802==--

