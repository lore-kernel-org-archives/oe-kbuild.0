Content-Type: multipart/mixed; boundary="===============5713308643664331082=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2805/2969] drivers/video/fbdev/core/fbcvt.c:233:3: warning: Value stored to 'off' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 01 Feb 2022 20:54:47 +0800
Message-ID: <202202012059.SzDTjaPu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5713308643664331082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dan Carpenter <error27@gmail.com>
CC: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   887a333c44eb67973622e530e43cd5e4cf9af927
commit: 78482af095abd9f4f29f1aa3fe575d25c6ae3028 [2805/2969] video: fbdev: =
fbcvt.c: fix printing in fb_cvt_print_name()
:::::: branch date: 32 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20201/202202012059.SzDTjaPu-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbac=
a3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D78482af095abd9f4f29f1aa3fe575d25c6ae3028
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 78482af095abd9f4f29f1aa3fe575d25c6ae3028
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/ppp/ppp_generic.c:684:3: note: Loop condition is false.  Exi=
ting loop
                   RCU_INIT_POINTER(pchb->bridge, NULL);
                   ^
   include/linux/rcupdate.h:860:3: note: expanded from macro 'RCU_INIT_POIN=
TER'
                   WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                   ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/net/ppp/ppp_generic.c:684:3: note: Loop condition is false.  Exi=
ting loop
                   RCU_INIT_POINTER(pchb->bridge, NULL);
                   ^
   include/linux/rcupdate.h:860:3: note: expanded from macro 'RCU_INIT_POIN=
TER'
                   WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                   ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^
   include/asm-generic/rwonce.h:53:35: note: expanded from macro '__WRITE_O=
NCE'
   #define __WRITE_ONCE(x, val)                                            \
                                                                           ^
   drivers/net/ppp/ppp_generic.c:684:3: note: Loop condition is false.  Exi=
ting loop
                   RCU_INIT_POINTER(pchb->bridge, NULL);
                   ^
   include/linux/rcupdate.h:860:3: note: expanded from macro 'RCU_INIT_POIN=
TER'
                   WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                   ^
   include/asm-generic/rwonce.h:58:33: note: expanded from macro 'WRITE_ONC=
E'
   #define WRITE_ONCE(x, val)                                              \
                                                                           ^
   drivers/net/ppp/ppp_generic.c:684:3: note: Loop condition is false.  Exi=
ting loop
                   RCU_INIT_POINTER(pchb->bridge, NULL);
                   ^
   include/linux/rcupdate.h:858:2: note: expanded from macro 'RCU_INIT_POIN=
TER'
           do { \
           ^
   drivers/net/ppp/ppp_generic.c:689:6: note: 'pchbb' is equal to 'pch'
           if (pchbb =3D=3D pch)
               ^~~~~
   drivers/net/ppp/ppp_generic.c:689:2: note: Taking true branch
           if (pchbb =3D=3D pch)
           ^
   drivers/net/ppp/ppp_generic.c:690:7: note: Assuming the condition is true
                   if (refcount_dec_and_test(&pch->file.refcnt))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ppp/ppp_generic.c:690:3: note: Taking true branch
                   if (refcount_dec_and_test(&pch->file.refcnt))
                   ^
   drivers/net/ppp/ppp_generic.c:691:4: note: Calling 'ppp_destroy_channel'
                           ppp_destroy_channel(pch);
                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ppp/ppp_generic.c:3533:6: note: Assuming field 'dead' is not=
 equal to 0
           if (!pch->file.dead) {
               ^~~~~~~~~~~~~~~
   drivers/net/ppp/ppp_generic.c:3533:2: note: Taking false branch
           if (!pch->file.dead) {
           ^
   drivers/net/ppp/ppp_generic.c:3540:2: note: Memory is released
           kfree(pch);
           ^~~~~~~~~~
   drivers/net/ppp/ppp_generic.c:691:4: note: Returning; memory was release=
d via 1st parameter
                           ppp_destroy_channel(pch);
                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ppp/ppp_generic.c:693:6: note: Assuming the condition is fal=
se
           if (refcount_dec_and_test(&pchb->file.refcnt))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ppp/ppp_generic.c:693:2: note: Taking false branch
           if (refcount_dec_and_test(&pchb->file.refcnt))
           ^
   drivers/net/ppp/ppp_generic.c:2986:2: note: Returning; memory was releas=
ed via 1st parameter
           ppp_unbridge_channels(pch);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ppp/ppp_generic.c:2988:17: note: Use of memory after it is f=
reed
           pch->file.dead =3D 1;
           ~~~~~~~~~~~~~~ ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/video/fbdev/core/fbcvt.c:233:3: warning: Value stored to 'off' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   off +=3D scnprintf(buf + off, size - off,
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbcvt.c:233:3: note: Value stored to 'off' is n=
ever read
                   off +=3D scnprintf(buf + off, size - off,
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbcvt.c:252:4: warning: Value stored to 'off' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           off +=3D scnprintf(buf + off, size - off, "-R");
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbcvt.c:252:4: note: Value stored to 'off' is n=
ever read
                           off +=3D scnprintf(buf + off, size - off, "-R");
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   fs/ocfs2/inode.c:411:2: warning: Value stored to 'status' is never read =
[clang-analyzer-deadcode.DeadStores]
           status =3D -EINVAL;
           ^        ~~~~~~~
   fs/ocfs2/inode.c:411:2: note: Value stored to 'status' is never read
           status =3D -EINVAL;
           ^        ~~~~~~~
   fs/ocfs2/inode.c:525:2: warning: Value stored to 'status' is never read =
[clang-analyzer-deadcode.DeadStores]
           status =3D -EINVAL;
           ^        ~~~~~~~
   fs/ocfs2/inode.c:525:2: note: Value stored to 'status' is never read
           status =3D -EINVAL;
           ^        ~~~~~~~
   fs/ocfs2/inode.c:1387:2: warning: Value stored to 'rc' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           rc =3D -EINVAL;
           ^    ~~~~~~~
   fs/ocfs2/inode.c:1387:2: note: Value stored to 'rc' is never read
           rc =3D -EINVAL;
           ^    ~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/ocfs2/localalloc.c:428:3: warning: Value stored to 'status' is never =
read [clang-analyzer-deadcode.DeadStores]
                   status =3D -ENOMEM;
                   ^        ~~~~~~~
   fs/ocfs2/localalloc.c:428:3: note: Value stored to 'status' is never read
                   status =3D -ENOMEM;
                   ^        ~~~~~~~
   fs/ocfs2/localalloc.c:976:18: warning: Although the value stored to 'bit=
_off' is used in the enclosing expression, the value is never actually read=
 from 'bit_off' [clang-analyzer-deadcode.DeadStores]
           start =3D count =3D bit_off =3D 0;
                           ^         ~
   fs/ocfs2/localalloc.c:976:18: note: Although the value stored to 'bit_of=
f' is used in the enclosing expression, the value is never actually read fr=
om 'bit_off'
           start =3D count =3D bit_off =3D 0;
                           ^         ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/ocfs2/namei.c:1537:3: warning: Value stored to 'status' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   status =3D ocfs2_add_entry(handle, new_dentry, old_inode,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/namei.c:1537:3: note: Value stored to 'status' is never read
                   status =3D ocfs2_add_entry(handle, new_dentry, old_inode,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/namei.c:1596:3: warning: Value stored to 'status' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   status =3D ocfs2_update_entry(old_inode, handle,

vim +/off +233 drivers/video/fbdev/core/fbcvt.c

96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  213  =

96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  214  static void fb_cvt_print_name(struct fb_cvt_data *cvt)
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  215  {
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  216  	u32 pixcount, pixcount_mod;
78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  217  	int size =3D 256;
78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  218  	int off =3D 0;
78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  219  	u8 *buf;
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  220  =

78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  221  	buf =3D kzalloc(size, GFP_KERNEL);
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  222  	if (!buf)
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  223  		return;
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  224  =

96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  225  	pixcount =3D (cvt->xres * (cvt->yres/cvt->interlace))/1000000;
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  226  	pixcount_mod =3D (cvt->xres * (cvt->yres/cvt->interlace)) % 10000=
00;
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  227  	pixcount_mod /=3D 1000;
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  228  =

78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  229  	off +=3D scnprintf(buf + off, size - off, "fbcvt: %dx%d@%d: CVT N=
ame - ",
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  230  			    cvt->xres, cvt->yres, cvt->refresh);
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  231  =

78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  232  	if (cvt->status) {
78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16 @233  		off +=3D scnprintf(buf + off, size - off,
78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  234  				 "Not a CVT standard - %d.%03d Mega Pixel Image\n",
78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  235  				 pixcount, pixcount_mod);
78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  236  	} else {
78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  237  		if (pixcount)
78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  238  			off +=3D scnprintf(buf + off, size - off, "%d", pixcount);
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  239  =

78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  240  		off +=3D scnprintf(buf + off, size - off, ".%03dM", pixcount_mod=
);
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  241  =

96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  242  		if (cvt->aspect_ratio =3D=3D 0)
78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  243  			off +=3D scnprintf(buf + off, size - off, "3");
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  244  		else if (cvt->aspect_ratio =3D=3D 3)
78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  245  			off +=3D scnprintf(buf + off, size - off, "4");
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  246  		else if (cvt->aspect_ratio =3D=3D 1 || cvt->aspect_ratio =3D=3D =
4)
78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  247  			off +=3D scnprintf(buf + off, size - off, "9");
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  248  		else if (cvt->aspect_ratio =3D=3D 2)
78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  249  			off +=3D scnprintf(buf + off, size - off, "A");
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  250  =

78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  251  		if (cvt->flags & FB_CVT_FLAG_REDUCED_BLANK)
78482af095abd9 drivers/video/fbdev/core/fbcvt.c Dan Carpenter      2021-09-=
16  252  			off +=3D scnprintf(buf + off, size - off, "-R");
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  253  	}
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  254  =

96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  255  	printk(KERN_INFO "%s\n", buf);
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  256  	kfree(buf);
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  257  }
96fe6a2109db29 drivers/video/fbcvt.c            Antonino A. Daplas 2005-09-=
09  258  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5713308643664331082==--

