Content-Type: multipart/mixed; boundary="===============8054388383277818533=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/rpmsg/rpmsg_ctrl.c:88:13: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 09 May 2022 07:23:53 +0800
Message-ID: <202205090701.WkKGSFMz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8054388383277818533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5eb0a61238dd6faf37f58c9ce61c9980aaffd7a
commit: 617d32938d1be0d67bad73a914635bf787c319c1 rpmsg: Move the rpmsg cont=
rol device from rpmsg_char to rpmsg_ctrl
date:   8 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 weeks ago
config: mips-randconfig-c004-20220508 (https://download.01.org/0day-ci/arch=
ive/20220509/202205090701.WkKGSFMz-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af4cf1=
c6b8ed0d8102fc5e69acdc2fcbbcdaa9a7)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D617d32938d1be0d67bad73a914635bf787c319c1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 617d32938d1be0d67bad73a914635bf787c319c1
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   arch/mips/include/asm/bitops.h:413:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   arch/mips/include/asm/bitops.h:417:6: note: Assuming the condition is fa=
lse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:417:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   arch/mips/include/asm/bitops.h:421:6: note: Assuming the condition is fa=
lse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:421:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   arch/mips/include/asm/bitops.h:425:2: note: Returning the value 32 (load=
ed from 'r')
           return r;
           ^~~~~~~~
   include/linux/bitops.h:155:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:155:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/stat.c:227:20: warning: The left expression of the compound assignmen=
t is an uninitialized value. The computed value will also be garbage [clang=
-analyzer-core.uninitialized.Assign]
           stat->result_mask |=3D STATX_MNT_ID;
                             ^
   fs/stat.c:534:1: note: Calling '__do_sys_lstat64'
   SYSCALL_DEFINE2(lstat64, const char __user *, filename,
   ^
   include/linux/syscalls.h:218:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:249:14: note: expanded from macro '__SYSCALL_DE=
FINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/stat.c:538:14: note: Calling 'vfs_lstat'
           int error =3D vfs_lstat(filename, &stat);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs.h:3287:9: note: Calling 'vfs_fstatat'
           return vfs_fstatat(AT_FDCWD, name, stat, AT_SYMLINK_NOFOLLOW);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/stat.c:243:9: note: Calling 'vfs_statx'
           return vfs_statx(dfd, filename, flags | AT_NO_AUTOMOUNT,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/stat.c:209:2: note: Taking false branch
           if (flags & ~(AT_SYMLINK_NOFOLLOW | AT_NO_AUTOMOUNT | AT_EMPTY_P=
ATH |
           ^
   fs/stat.c:213:2: note: Taking false branch
           if (!(flags & AT_SYMLINK_NOFOLLOW))
           ^
   fs/stat.c:215:2: note: Taking false branch
           if (!(flags & AT_NO_AUTOMOUNT))
           ^
   fs/stat.c:217:2: note: Taking false branch
           if (flags & AT_EMPTY_PATH)
           ^
   fs/stat.c:222:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/stat.c:222:2: note: Taking false branch
           if (error)
           ^
   fs/stat.c:225:10: note: Calling 'vfs_getattr'
           error =3D vfs_getattr(&path, stat, request_mask, flags);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/stat.c:158:6: note: Assuming 'retval' is not equal to 0
           if (retval)
               ^~~~~~
   fs/stat.c:158:2: note: Taking true branch
           if (retval)
           ^
   fs/stat.c:159:3: note: Returning without writing to 'stat->result_mask'
                   return retval;
                   ^
   fs/stat.c:225:10: note: Returning from 'vfs_getattr'
           error =3D vfs_getattr(&path, stat, request_mask, flags);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/stat.c:227:20: note: The left expression of the compound assignment i=
s an uninitialized value. The computed value will also be garbage
           stat->result_mask |=3D STATX_MNT_ID;
           ~~~~~~~~~~~~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/rpmsg/rpmsg_ctrl.c:88:13: warning: Assigned value is garbage or =
undefined [clang-analyzer-core.uninitialized.Assign]
           chinfo.src =3D eptinfo.src;
                      ^ ~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:80:13: note: Left side of '&&' is true
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
                      ^
   include/uapi/linux/rpmsg.h:29:32: note: expanded from macro 'RPMSG_CREAT=
E_EPT_IOCTL'
   #define RPMSG_CREATE_EPT_IOCTL  _IOW(0xb5, 0x1, struct rpmsg_endpoint_in=
fo)
                                   ^
   include/uapi/asm-generic/ioctl.h:87:57: note: expanded from macro '_IOW'
   #define _IOW(type,nr,size)      _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECH=
ECK(size)))
                                                                ^
   include/asm-generic/ioctl.h:13:4: note: expanded from macro '_IOC_TYPECH=
ECK'
           ((sizeof(t) =3D=3D sizeof(t[1]) && \
             ^
   drivers/rpmsg/rpmsg_ctrl.c:80:13: note: '?' condition is true
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
                      ^
   include/uapi/linux/rpmsg.h:29:32: note: expanded from macro 'RPMSG_CREAT=
E_EPT_IOCTL'
   #define RPMSG_CREATE_EPT_IOCTL  _IOW(0xb5, 0x1, struct rpmsg_endpoint_in=
fo)
                                   ^
   include/uapi/asm-generic/ioctl.h:87:57: note: expanded from macro '_IOW'
   #define _IOW(type,nr,size)      _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECH=
ECK(size)))
                                                                ^
   include/asm-generic/ioctl.h:13:3: note: expanded from macro '_IOC_TYPECH=
ECK'
           ((sizeof(t) =3D=3D sizeof(t[1]) && \
            ^
   drivers/rpmsg/rpmsg_ctrl.c:80:6: note: Assuming the condition is false
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:80:2: note: Taking false branch
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
           ^
   drivers/rpmsg/rpmsg_ctrl.c:83:6: note: Calling 'copy_from_user'
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->src'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->s=
rc'
           return res;
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->s=
rc'
           return n;
           ^
   drivers/rpmsg/rpmsg_ctrl.c:83:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:83:2: note: Taking false branch
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
           ^
   drivers/rpmsg/rpmsg_ctrl.c:88:13: note: Assigned value is garbage or und=
efined
           chinfo.src =3D eptinfo.src;
                      ^ ~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/extcon/extcon-ptn5150.c:173:2: warning: Value stored to 'vendor_=
id' is never read [clang-analyzer-deadcode.DeadStores]
           vendor_id =3D FIELD_GET(PTN5150_REG_DEVICE_ID_VENDOR, reg_data);
           ^
   drivers/extcon/extcon-ptn5150.c:173:2: note: Value stored to 'vendor_id'=
 is never read
   drivers/extcon/extcon-ptn5150.c:174:2: warning: Value stored to 'version=
_id' is never read [clang-analyzer-deadcode.DeadStores]
           version_id =3D FIELD_GET(PTN5150_REG_DEVICE_ID_VERSION, reg_data=
);
           ^
   drivers/extcon/extcon-ptn5150.c:174:2: note: Value stored to 'version_id=
' is never read
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
--
               ^~~~~~~~~
   drivers/crypto/atmel-sha.c:411:2: note: Taking true branch
           if (!tctx->dd) {
           ^
   drivers/crypto/atmel-sha.c:412:3: note: Loop condition is false. Executi=
on continues on line 416
                   list_for_each_entry(tmp, &atmel_sha.dev_list, list) {
                   ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/crypto/atmel-sha.c:416:3: note: Null pointer value stored to fie=
ld 'dd'
                   tctx->dd =3D dd;
                   ^~~~~~~~~~~~~
   drivers/crypto/atmel-sha.c:431:29: note: Returning from 'atmel_sha_find_=
dev'
           struct atmel_sha_dev *dd =3D atmel_sha_find_dev(tctx);
                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/atmel-sha.c:437:2: note: Taking false branch
           dev_dbg(dd->dev, "init: digest size: %u\n",
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/crypto/atmel-sha.c:440:2: note: Control jumps to 'case 64:'  at =
line 457
           switch (crypto_ahash_digestsize(tfm)) {
           ^
   drivers/crypto/atmel-sha.c:460:3: note:  Execution continues on line 465
                   break;
                   ^
   drivers/crypto/atmel-sha.c:1938:8: note: Returning from 'atmel_sha_init'
           err =3D atmel_sha_init(req);
                 ^~~~~~~~~~~~~~~~~~~
   drivers/crypto/atmel-sha.c:1939:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/crypto/atmel-sha.c:1939:2: note: Taking false branch
           if (err)
           ^
   drivers/crypto/atmel-sha.c:1942:9: note: Calling 'atmel_sha_enqueue'
           return atmel_sha_enqueue(req, SHA_OP_DIGEST);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/atmel-sha.c:1153:31: note: Calling 'crypto_tfm_ctx'
           struct atmel_sha_ctx *tctx =3D crypto_tfm_ctx(req->base.tfm);
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/atmel-sha.c:1153:31: note: Returning from 'crypto_tfm_ctx'
           struct atmel_sha_ctx *tctx =3D crypto_tfm_ctx(req->base.tfm);
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/atmel-sha.c:1154:2: note: 'dd' initialized to a null poin=
ter value
           struct atmel_sha_dev *dd =3D tctx->dd;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/atmel-sha.c:1158:32: note: Passing null pointer value via=
 1st parameter 'dd'
           return atmel_sha_handle_queue(dd, req);
                                         ^~
   drivers/crypto/atmel-sha.c:1158:9: note: Calling 'atmel_sha_handle_queue'
           return atmel_sha_handle_queue(dd, req);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/atmel-sha.c:1063:2: note: Loop condition is false.  Exiti=
ng loop
           spin_lock_irqsave(&dd->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/crypto/atmel-sha.c:1063:2: note: Loop condition is false.  Exiti=
ng loop
           spin_lock_irqsave(&dd->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/crypto/atmel-sha.c:1064:6: note: 'req' is non-null
           if (req)
               ^~~
   drivers/crypto/atmel-sha.c:1064:2: note: Taking true branch
           if (req)
           ^
   drivers/crypto/atmel-sha.c:1067:23: note: Access to field 'flags' result=
s in a dereference of a null pointer (loaded from variable 'dd')
           if (SHA_FLAGS_BUSY & dd->flags) {
                                ^~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/rpmsg/rpmsg_ctrl.c:88:13: warning: Assigned value is garbage or =
undefined [clang-analyzer-core.uninitialized.Assign]
           chinfo.src =3D eptinfo.src;
                      ^ ~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:80:13: note: Left side of '&&' is true
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
                      ^
   include/uapi/linux/rpmsg.h:29:32: note: expanded from macro 'RPMSG_CREAT=
E_EPT_IOCTL'
   #define RPMSG_CREATE_EPT_IOCTL  _IOW(0xb5, 0x1, struct rpmsg_endpoint_in=
fo)
                                   ^
   include/uapi/asm-generic/ioctl.h:87:57: note: expanded from macro '_IOW'
   #define _IOW(type,nr,size)      _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECH=
ECK(size)))
                                                                ^
   include/asm-generic/ioctl.h:13:4: note: expanded from macro '_IOC_TYPECH=
ECK'
           ((sizeof(t) =3D=3D sizeof(t[1]) && \
             ^
   drivers/rpmsg/rpmsg_ctrl.c:80:13: note: '?' condition is true
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
                      ^
   include/uapi/linux/rpmsg.h:29:32: note: expanded from macro 'RPMSG_CREAT=
E_EPT_IOCTL'
   #define RPMSG_CREATE_EPT_IOCTL  _IOW(0xb5, 0x1, struct rpmsg_endpoint_in=
fo)
                                   ^
   include/uapi/asm-generic/ioctl.h:87:57: note: expanded from macro '_IOW'
   #define _IOW(type,nr,size)      _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECH=
ECK(size)))
                                                                ^
   include/asm-generic/ioctl.h:13:3: note: expanded from macro '_IOC_TYPECH=
ECK'
           ((sizeof(t) =3D=3D sizeof(t[1]) && \
            ^
   drivers/rpmsg/rpmsg_ctrl.c:80:6: note: Assuming the condition is false
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:80:2: note: Taking false branch
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
           ^
   drivers/rpmsg/rpmsg_ctrl.c:83:6: note: Calling 'copy_from_user'
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->src'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->s=
rc'
           return res;
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->s=
rc'
           return n;
           ^
   drivers/rpmsg/rpmsg_ctrl.c:83:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:83:2: note: Taking false branch
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
           ^
   drivers/rpmsg/rpmsg_ctrl.c:88:13: note: Assigned value is garbage or und=
efined
           chinfo.src =3D eptinfo.src;
                      ^ ~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/staging/greybus/fw-management.c:451:9: warning: 2nd function cal=
l argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   ret =3D fw_mgmt_load_and_validate_operation(fw_mgmt,
                         ^
   drivers/staging/greybus/fw-management.c:552:6: note: Assuming field 'dis=
abled' is false
           if (!fw_mgmt->disabled) {
               ^~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/fw-management.c:552:2: note: Taking true branch
           if (!fw_mgmt->disabled) {
           ^
   drivers/staging/greybus/fw-management.c:553:9: note: Calling 'gb_pm_runt=
ime_get_sync'
                   ret =3D gb_pm_runtime_get_sync(bundle);

vim +88 drivers/rpmsg/rpmsg_ctrl.c

617d32938d1be0 Arnaud Pouliquen 2022-01-24  71  =

617d32938d1be0 Arnaud Pouliquen 2022-01-24  72  static long rpmsg_ctrldev_i=
octl(struct file *fp, unsigned int cmd,
617d32938d1be0 Arnaud Pouliquen 2022-01-24  73  				unsigned long arg)
617d32938d1be0 Arnaud Pouliquen 2022-01-24  74  {
617d32938d1be0 Arnaud Pouliquen 2022-01-24  75  	struct rpmsg_ctrldev *ctrl=
dev =3D fp->private_data;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  76  	void __user *argp =3D (voi=
d __user *)arg;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  77  	struct rpmsg_endpoint_info=
 eptinfo;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  78  	struct rpmsg_channel_info =
chinfo;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  79  =

617d32938d1be0 Arnaud Pouliquen 2022-01-24  80  	if (cmd !=3D RPMSG_CREATE_=
EPT_IOCTL)
617d32938d1be0 Arnaud Pouliquen 2022-01-24  81  		return -EINVAL;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  82  =

617d32938d1be0 Arnaud Pouliquen 2022-01-24  83  	if (copy_from_user(&eptinf=
o, argp, sizeof(eptinfo)))
617d32938d1be0 Arnaud Pouliquen 2022-01-24  84  		return -EFAULT;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  85  =

617d32938d1be0 Arnaud Pouliquen 2022-01-24  86  	memcpy(chinfo.name, eptinf=
o.name, RPMSG_NAME_SIZE);
617d32938d1be0 Arnaud Pouliquen 2022-01-24  87  	chinfo.name[RPMSG_NAME_SIZ=
E - 1] =3D '\0';
617d32938d1be0 Arnaud Pouliquen 2022-01-24 @88  	chinfo.src =3D eptinfo.src;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  89  	chinfo.dst =3D eptinfo.dst;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  90  =

617d32938d1be0 Arnaud Pouliquen 2022-01-24  91  	return rpmsg_chrdev_eptdev=
_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
617d32938d1be0 Arnaud Pouliquen 2022-01-24  92  };
617d32938d1be0 Arnaud Pouliquen 2022-01-24  93  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8054388383277818533==--

