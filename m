Content-Type: multipart/mixed; boundary="===============6211124045566127271=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/pata_samsung_cf.c:117:34: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Wed, 16 Mar 2022 09:01:33 +0800
Message-ID: <202203160824.d9jkYTVc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6211124045566127271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   56e337f2cf1326323844927a04e9dbce9a244835
commit: b6a64a860e1319dfbabc55b351c8b6583bd67413 ata: pata_samsung_cf: add =
compile test support
date:   9 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 9 weeks ago
config: arm-randconfig-c002-20220312 (https://download.01.org/0day-ci/archi=
ve/20220316/202203160824.d9jkYTVc-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db6a64a860e1319dfbabc55b351c8b6583bd67413
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b6a64a860e1319dfbabc55b351c8b6583bd67413
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~
   drivers/tee/tee_core.c:582:2: note: Taking false branch
           if (rc)
           ^
   drivers/tee/tee_core.c:585:6: note: Control jumps to 'case 4:'  at line =
585
           if (put_user(arg.ret, &uarg->ret) ||
               ^
   arch/arm/include/asm/uaccess.h:369:2: note: expanded from macro 'put_use=
r'
           __put_user_switch((x), (ptr), __pu_err, __put_user_check);      \
           ^
   arch/arm/include/asm/uaccess.h:356:3: note: expanded from macro '__put_u=
ser_switch'
                   switch (sizeof(*(ptr))) {                               \
                   ^
   drivers/tee/tee_core.c:585:6: note:  Execution continues on line 585
           if (put_user(arg.ret, &uarg->ret) ||
               ^
   arch/arm/include/asm/uaccess.h:369:2: note: expanded from macro 'put_use=
r'
           __put_user_switch((x), (ptr), __pu_err, __put_user_check);      \
           ^
   arch/arm/include/asm/uaccess.h:359:47: note: expanded from macro '__put_=
user_switch'
                   case 4: __fn(__pu_val, __pu_ptr, __err, 4); break;      \
                                                               ^
   drivers/tee/tee_core.c:585:6: note: Loop condition is false.  Exiting lo=
op
           if (put_user(arg.ret, &uarg->ret) ||
               ^
   arch/arm/include/asm/uaccess.h:369:2: note: expanded from macro 'put_use=
r'
           __put_user_switch((x), (ptr), __pu_err, __put_user_check);      \
           ^
   arch/arm/include/asm/uaccess.h:350:2: note: expanded from macro '__put_u=
ser_switch'
           do {                                                            \
           ^
   drivers/tee/tee_core.c:585:6: note: Assuming the condition is false
           if (put_user(arg.ret, &uarg->ret) ||
               ^
   arch/arm/include/asm/uaccess.h:366:31: note: expanded from macro 'put_us=
er'
   #define put_user(x, ptr)                                                \
                                                                           ^
   drivers/tee/tee_core.c:585:6: note: Left side of '||' is false
           if (put_user(arg.ret, &uarg->ret) ||
               ^
   arch/arm/include/asm/uaccess.h:366:31: note: expanded from macro 'put_us=
er'
   #define put_user(x, ptr)                                                \
                                                                           ^
   drivers/tee/tee_core.c:586:6: note: Control jumps to 'case 4:'  at line =
586
               put_user(arg.ret_origin, &uarg->ret_origin)) {
               ^
   arch/arm/include/asm/uaccess.h:369:2: note: expanded from macro 'put_use=
r'
           __put_user_switch((x), (ptr), __pu_err, __put_user_check);      \
           ^
   arch/arm/include/asm/uaccess.h:356:3: note: expanded from macro '__put_u=
ser_switch'
                   switch (sizeof(*(ptr))) {                               \
                   ^
   drivers/tee/tee_core.c:586:6: note:  Execution continues on line 586
               put_user(arg.ret_origin, &uarg->ret_origin)) {
               ^
   arch/arm/include/asm/uaccess.h:369:2: note: expanded from macro 'put_use=
r'
           __put_user_switch((x), (ptr), __pu_err, __put_user_check);      \
           ^
   arch/arm/include/asm/uaccess.h:359:47: note: expanded from macro '__put_=
user_switch'
                   case 4: __fn(__pu_val, __pu_ptr, __err, 4); break;      \
                                                               ^
   drivers/tee/tee_core.c:586:6: note: Loop condition is false.  Exiting lo=
op
               put_user(arg.ret_origin, &uarg->ret_origin)) {
               ^
   arch/arm/include/asm/uaccess.h:369:2: note: expanded from macro 'put_use=
r'
           __put_user_switch((x), (ptr), __pu_err, __put_user_check);      \
           ^
   arch/arm/include/asm/uaccess.h:350:2: note: expanded from macro '__put_u=
ser_switch'
           do {                                                            \
           ^
   drivers/tee/tee_core.c:586:6: note: Assuming the condition is false
               put_user(arg.ret_origin, &uarg->ret_origin)) {
               ^
   arch/arm/include/asm/uaccess.h:366:31: note: expanded from macro 'put_us=
er'
   #define put_user(x, ptr)                                                \
                                                                           ^
   drivers/tee/tee_core.c:585:2: note: Taking false branch
           if (put_user(arg.ret, &uarg->ret) ||
           ^
   drivers/tee/tee_core.c:590:47: note: Passing null pointer value via 3rd =
parameter 'params'
           rc =3D params_to_user(uparams, arg.num_params, params);
                                                        ^~~~~~
   drivers/tee/tee_core.c:590:7: note: Calling 'params_to_user'
           rc =3D params_to_user(uparams, arg.num_params, params);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:439:14: note: Assuming 'n' is < 'num_params'
           for (n =3D 0; n < num_params; n++) {
                       ^~~~~~~~~~~~~~
   drivers/tee/tee_core.c:439:2: note: Loop condition is true.  Entering lo=
op body
           for (n =3D 0; n < num_params; n++) {
           ^
   drivers/tee/tee_core.c:441:3: note: 'p' initialized to a null pointer va=
lue
                   struct tee_param *p =3D params + n;
                   ^~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:443:11: note: Access to field 'attr' results in a=
 dereference of a null pointer (loaded from variable 'p')
                   switch (p->attr) {
                           ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/ata/pata_samsung_cf.c:117:34: warning: Division by zero [clang-a=
nalyzer-core.DivideZero]
           cycle_time =3D (int)(1000000000UL / clk_get_rate(info->clk));
                              ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_samsung_cf.c:108:18: note: Loop condition is false.  Ex=
iting loop
           ulong ata_cfg =3D readl(info->ide_addr + S3C_ATA_CFG);
                           ^
   arch/arm/include/asm/io.h:304:50: note: expanded from macro 'readl'
   #define readl(c)                ({ u32 __v =3D readl_relaxed(c); __iormb=
(); __v; })
                                                                  ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iormb'
   #define __iormb()               do { } while (0)
                                   ^
   drivers/ata/pata_samsung_cf.c:112:6: note: Assuming the condition is true
           if (ata_pio_need_iordy(adev))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_samsung_cf.c:112:2: note: Taking true branch
           if (ata_pio_need_iordy(adev))
           ^
   drivers/ata/pata_samsung_cf.c:117:36: note: Calling 'clk_get_rate'
           cycle_time =3D (int)(1000000000UL / clk_get_rate(info->clk));
                                             ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:882:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/ata/pata_samsung_cf.c:117:36: note: Returning from 'clk_get_rate'
           cycle_time =3D (int)(1000000000UL / clk_get_rate(info->clk));
                                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_samsung_cf.c:117:34: note: Division by zero
           cycle_time =3D (int)(1000000000UL / clk_get_rate(info->clk));
                              ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
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
   10 warnings generated.
   fs/f2fs/xattr.c:424:35: warning: The left operand of '!=3D' is a garbage=
 value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (le32_to_cpu(header->h_magic) !=3D F2FS_XATTR_MAGIC) {
                                            ^
   fs/f2fs/xattr.c:144:28: note: Assuming field 'name' is not equal to NULL
           for (xattr =3D xattr_array; xattr->name !=3D NULL; xattr++) {
                                     ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/xattr.c:144:2: note: Loop condition is true.  Entering loop body
           for (xattr =3D xattr_array; xattr->name !=3D NULL; xattr++) {
           ^
   fs/f2fs/xattr.c:145:9: note: Calling 'f2fs_setxattr'
                   err =3D f2fs_setxattr(inode, F2FS_XATTR_INDEX_SECURITY,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/xattr.c:771:6: note: Assuming the condition is true
           if (unlikely(f2fs_cp_error(sbi)))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/f2fs/xattr.c:771:2: note: Taking false branch
           if (unlikely(f2fs_cp_error(sbi)))
           ^
   fs/f2fs/xattr.c:773:2: note: Taking false branch
           if (!f2fs_is_checkpoint_ready(sbi))
           ^
   fs/f2fs/xattr.c:777:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/f2fs/xattr.c:777:2: note: Taking false branch
           if (err)
           ^
   fs/f2fs/xattr.c:781:6: note: Assuming 'ipage' is non-null
           if (ipage)
               ^~~~~
   fs/f2fs/xattr.c:781:2: note: Taking true branch
           if (ipage)
           ^
   fs/f2fs/xattr.c:782:10: note: Calling '__f2fs_setxattr'
                   return __f2fs_setxattr(inode, index, name, value,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/xattr.c:641:6: note: 'name' is not equal to NULL
           if (name =3D=3D NULL)
               ^~~~
   fs/f2fs/xattr.c:641:2: note: Taking false branch
           if (name =3D=3D NULL)
           ^
   fs/f2fs/xattr.c:644:6: note: Assuming 'value' is not equal to NULL
           if (value =3D=3D NULL)
               ^~~~~~~~~~~~~
   fs/f2fs/xattr.c:644:2: note: Taking false branch
           if (value =3D=3D NULL)
           ^
   fs/f2fs/xattr.c:649:6: note: Assuming 'len' is <=3D F2FS_NAME_LEN
           if (len > F2FS_NAME_LEN)
               ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/xattr.c:649:2: note: Taking false branch
           if (len > F2FS_NAME_LEN)
           ^
   fs/f2fs/xattr.c:652:6: note: Assuming the condition is false
           if (size > MAX_VALUE_LEN(inode))

vim +117 drivers/ata/pata_samsung_cf.c

155bf48f10fc3c Abhilash Kesavan 2010-07-13  102  =

155bf48f10fc3c Abhilash Kesavan 2010-07-13  103  static void pata_s3c_set_p=
iomode(struct ata_port *ap, struct ata_device *adev)
155bf48f10fc3c Abhilash Kesavan 2010-07-13  104  {
155bf48f10fc3c Abhilash Kesavan 2010-07-13  105  	struct s3c_ide_info *info=
 =3D ap->host->private_data;
155bf48f10fc3c Abhilash Kesavan 2010-07-13  106  	struct ata_timing timing;
155bf48f10fc3c Abhilash Kesavan 2010-07-13  107  	int cycle_time;
155bf48f10fc3c Abhilash Kesavan 2010-07-13  108  	ulong ata_cfg =3D readl(i=
nfo->ide_addr + S3C_ATA_CFG);
155bf48f10fc3c Abhilash Kesavan 2010-07-13  109  	ulong piotime;
155bf48f10fc3c Abhilash Kesavan 2010-07-13  110  =

155bf48f10fc3c Abhilash Kesavan 2010-07-13  111  	/* Enables IORDY if mode =
requires it */
155bf48f10fc3c Abhilash Kesavan 2010-07-13  112  	if (ata_pio_need_iordy(ad=
ev))
155bf48f10fc3c Abhilash Kesavan 2010-07-13  113  		ata_cfg |=3D S3C_ATA_CFG=
_IORDYEN;
155bf48f10fc3c Abhilash Kesavan 2010-07-13  114  	else
155bf48f10fc3c Abhilash Kesavan 2010-07-13  115  		ata_cfg &=3D ~S3C_ATA_CF=
G_IORDYEN;
155bf48f10fc3c Abhilash Kesavan 2010-07-13  116  =

155bf48f10fc3c Abhilash Kesavan 2010-07-13 @117  	cycle_time =3D (int)(1000=
000000UL / clk_get_rate(info->clk));
155bf48f10fc3c Abhilash Kesavan 2010-07-13  118  =

155bf48f10fc3c Abhilash Kesavan 2010-07-13  119  	ata_timing_compute(adev, =
adev->pio_mode, &timing,
155bf48f10fc3c Abhilash Kesavan 2010-07-13  120  					cycle_time * 1000, 0);
155bf48f10fc3c Abhilash Kesavan 2010-07-13  121  =

155bf48f10fc3c Abhilash Kesavan 2010-07-13  122  	piotime =3D pata_s3c_setu=
p_timing(info, &timing);
155bf48f10fc3c Abhilash Kesavan 2010-07-13  123  =

155bf48f10fc3c Abhilash Kesavan 2010-07-13  124  	writel(ata_cfg, info->ide=
_addr + S3C_ATA_CFG);
155bf48f10fc3c Abhilash Kesavan 2010-07-13  125  	writel(piotime, info->ide=
_addr + S3C_ATA_PIO_TIME);
155bf48f10fc3c Abhilash Kesavan 2010-07-13  126  }
155bf48f10fc3c Abhilash Kesavan 2010-07-13  127  =


:::::: The code at line 117 was first introduced by commit
:::::: 155bf48f10fc3c8e0e3125e221981328cd925cf4 [libata] Add Samsung PATA c=
ontroller driver, pata_samsung_cf

:::::: TO: Abhilash Kesavan <a.kesavan@samsung.com>
:::::: CC: Jeff Garzik <jgarzik@redhat.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6211124045566127271==--

