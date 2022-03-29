Content-Type: multipart/mixed; boundary="===============0431180956531414940=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/exfat/file.c:369:17: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 30 Mar 2022 05:31:20 +0800
Message-ID: <202203300544.xPLyDmy1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0431180956531414940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hyeongseok Kim <hyeongseok@gmail.com>
CC: Namjae Jeon <namjae.jeon@samsung.com>
CC: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1930a6e739c4b4a654a69164dbe39e554d228915
commit: 654762df2ec7d61b05acc788afbffaba52d658fe exfat: add support ioctl a=
nd FITRIM function
date:   11 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-c004-20220328 (https://download.01.org/0day-ci/arch=
ive/20220330/202203300544.xPLyDmy1-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D654762df2ec7d61b05acc788afbffaba52d658fe
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 654762df2ec7d61b05acc788afbffaba52d658fe
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/virtio/virtio_balloon.c:266:2: note: Assigned value is garbage o=
r undefined
           list_for_each_entry_safe(page, next, pages, lru) {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:708:2: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/exfat/nls.c:582:18: warning: Assigned value is garbage or undefined [=
clang-analyzer-core.uninitialized.Assign]
                                   *p_cstring++ =3D buf[j];
                                                ^
   fs/exfat/nls.c:635:6: note: Assuming field 'utf8' is 0
           if (EXFAT_SB(sb)->options.utf8)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/exfat/nls.c:635:2: note: Taking false branch
           if (EXFAT_SB(sb)->options.utf8)
           ^
   fs/exfat/nls.c:638:9: note: Calling '__exfat_utf16_to_nls'
           return __exfat_utf16_to_nls(sb, uniname, p_cstring, buflen);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/exfat/nls.c:550:9: note: 'i' is < MAX_NAME_LENGTH
           while (i < MAX_NAME_LENGTH && out_len < (buflen - 1)) {
                  ^
   fs/exfat/nls.c:550:9: note: Left side of '&&' is true
   fs/exfat/nls.c:550:32: note: Assuming the condition is true
           while (i < MAX_NAME_LENGTH && out_len < (buflen - 1)) {
                                         ^~~~~~~~~~~~~~~~~~~~~~
   fs/exfat/nls.c:550:2: note: Loop condition is true.  Entering loop body
           while (i < MAX_NAME_LENGTH && out_len < (buflen - 1)) {
           ^
   fs/exfat/nls.c:551:7: note: Assuming the condition is false
                   if (*uniname =3D=3D '\0')
                       ^~~~~~~~~~~~~~~~
   fs/exfat/nls.c:551:3: note: Taking false branch
                   if (*uniname =3D=3D '\0')
                   ^
   fs/exfat/nls.c:553:7: note: Assuming the condition is false
                   if ((*uniname & SURROGATE_MASK) !=3D SURROGATE_PAIR) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/exfat/nls.c:553:3: note: Taking false branch
                   if ((*uniname & SURROGATE_MASK) !=3D SURROGATE_PAIR) {
                   ^
   fs/exfat/nls.c:558:8: note: Assuming the condition is false
                           if (!(*uniname & SURROGATE_LOW) &&
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/exfat/nls.c:558:36: note: Left side of '&&' is false
                           if (!(*uniname & SURROGATE_LOW) &&
                                                           ^
   fs/exfat/nls.c:576:7: note: Assuming the condition is true
                   if (out_len + len >=3D buflen)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   fs/exfat/nls.c:576:3: note: Taking true branch
                   if (out_len + len >=3D buflen)
                   ^
   fs/exfat/nls.c:580:7: note: 'len' is > 1
                   if (len > 1) {
                       ^~~
   fs/exfat/nls.c:580:3: note: Taking true branch
                   if (len > 1) {
                   ^
   fs/exfat/nls.c:581:4: note: Loop condition is true.  Entering loop body
                           for (j =3D 0; j < len; j++)
                           ^
   fs/exfat/nls.c:581:25: note: The value 1 is assigned to 'j'
                           for (j =3D 0; j < len; j++)
                                                ^~~
   fs/exfat/nls.c:581:4: note: Loop condition is true.  Entering loop body
                           for (j =3D 0; j < len; j++)
                           ^
   fs/exfat/nls.c:582:18: note: Assigned value is garbage or undefined
                                   *p_cstring++ =3D buf[j];
                                                ^ ~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> fs/exfat/file.c:369:17: warning: Assigned value is garbage or undefined =
[clang-analyzer-core.uninitialized.Assign]
           range.minlen =3D max_t(unsigned int, range.minlen,
                          ^
   include/linux/minmax.h:118:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:37:3: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                   ^
   fs/exfat/file.c:386:2: note: Control jumps to 'case 3222820985:'  at lin=
e 387
           switch (cmd) {
           ^
   fs/exfat/file.c:388:10: note: Calling 'exfat_ioctl_fitrim'
                   return exfat_ioctl_fitrim(inode, arg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/exfat/file.c:360:6: note: Assuming the condition is false
           if (!capable(CAP_SYS_ADMIN))
               ^~~~~~~~~~~~~~~~~~~~~~~
   fs/exfat/file.c:360:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   fs/exfat/file.c:363:6: note: Assuming the condition is false
           if (!blk_queue_discard(q))
               ^~~~~~~~~~~~~~~~~~~~~
   fs/exfat/file.c:363:2: note: Taking false branch
           if (!blk_queue_discard(q))
           ^
   fs/exfat/file.c:366:6: note: Calling 'copy_from_user'
           if (copy_from_user(&range, (struct fstrim_range __user *)arg, si=
zeof(range)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Assuming the condition is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
   include/linux/uaccess.h:157:33: note: Assuming the condition is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:616:2: note: Taking false branch
           if (eva_kernel_access())
           ^
   arch/mips/include/asm/uaccess.h:619:3: note: Returning without writing t=
o 'to->minlen'
                   return __invoke_copy_from_user(to, from, n);
                   ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->m=
inlen'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->m=
inlen'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   fs/exfat/file.c:366:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&range, (struct fstrim_range __user *)arg, si=
zeof(range)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   fs/exfat/file.c:366:2: note: Taking false branch
           if (copy_from_user(&range, (struct fstrim_range __user *)arg, si=
zeof(range)))
           ^
   fs/exfat/file.c:369:17: note: Assigned value is garbage or undefined
           range.minlen =3D max_t(unsigned int, range.minlen,
                          ^
   include/linux/minmax.h:118:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'

vim +369 fs/exfat/file.c

98d917047e8b7f4 Namjae Jeon    2020-03-02  353  =

654762df2ec7d61 Hyeongseok Kim 2021-03-04  354  static int exfat_ioctl_fitr=
im(struct inode *inode, unsigned long arg)
654762df2ec7d61 Hyeongseok Kim 2021-03-04  355  {
654762df2ec7d61 Hyeongseok Kim 2021-03-04  356  	struct request_queue *q =
=3D bdev_get_queue(inode->i_sb->s_bdev);
654762df2ec7d61 Hyeongseok Kim 2021-03-04  357  	struct fstrim_range range;
654762df2ec7d61 Hyeongseok Kim 2021-03-04  358  	int ret =3D 0;
654762df2ec7d61 Hyeongseok Kim 2021-03-04  359  =

654762df2ec7d61 Hyeongseok Kim 2021-03-04  360  	if (!capable(CAP_SYS_ADMIN=
))
654762df2ec7d61 Hyeongseok Kim 2021-03-04  361  		return -EPERM;
654762df2ec7d61 Hyeongseok Kim 2021-03-04  362  =

654762df2ec7d61 Hyeongseok Kim 2021-03-04  363  	if (!blk_queue_discard(q))
654762df2ec7d61 Hyeongseok Kim 2021-03-04  364  		return -EOPNOTSUPP;
654762df2ec7d61 Hyeongseok Kim 2021-03-04  365  =

654762df2ec7d61 Hyeongseok Kim 2021-03-04  366  	if (copy_from_user(&range,=
 (struct fstrim_range __user *)arg, sizeof(range)))
654762df2ec7d61 Hyeongseok Kim 2021-03-04  367  		return -EFAULT;
654762df2ec7d61 Hyeongseok Kim 2021-03-04  368  =

654762df2ec7d61 Hyeongseok Kim 2021-03-04 @369  	range.minlen =3D max_t(uns=
igned int, range.minlen,
654762df2ec7d61 Hyeongseok Kim 2021-03-04  370  				q->limits.discard_granu=
larity);
654762df2ec7d61 Hyeongseok Kim 2021-03-04  371  =

654762df2ec7d61 Hyeongseok Kim 2021-03-04  372  	ret =3D exfat_trim_fs(inod=
e, &range);
654762df2ec7d61 Hyeongseok Kim 2021-03-04  373  	if (ret < 0)
654762df2ec7d61 Hyeongseok Kim 2021-03-04  374  		return ret;
654762df2ec7d61 Hyeongseok Kim 2021-03-04  375  =

654762df2ec7d61 Hyeongseok Kim 2021-03-04  376  	if (copy_to_user((struct f=
strim_range __user *)arg, &range, sizeof(range)))
654762df2ec7d61 Hyeongseok Kim 2021-03-04  377  		return -EFAULT;
654762df2ec7d61 Hyeongseok Kim 2021-03-04  378  =

654762df2ec7d61 Hyeongseok Kim 2021-03-04  379  	return 0;
654762df2ec7d61 Hyeongseok Kim 2021-03-04  380  }
654762df2ec7d61 Hyeongseok Kim 2021-03-04  381  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0431180956531414940==--

