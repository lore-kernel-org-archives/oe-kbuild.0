Content-Type: multipart/mixed; boundary="===============0523544571015171668=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: block/ioctl.c:124:8: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 10 Jan 2022 15:57:23 +0800
Message-ID: <202201101537.xhsVk3d4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0523544571015171668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   df0cc57e057f18e44dac8e6c18aba47ab53202f9
commit: 04324f44cb69a03fdc8f2ee52386a4fdf6a0043b MIPS: Remove get_fs/set_fs
date:   9 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 months ago
config: mips-randconfig-c004-20220107 (https://download.01.org/0day-ci/arch=
ive/20220110/202201101537.xhsVk3d4-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167b=
fe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D04324f44cb69a03fdc8f2ee52386a4fdf6a0043b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 04324f44cb69a03fdc8f2ee52386a4fdf6a0043b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                ^~~~~~~~~~~~~~~~~~~~~~
   block/ioctl.c:22:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   block/ioctl.c:24:6: note: Calling 'copy_from_user'
           if (copy_from_user(&p, upart, sizeof(struct blkpg_partition)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:472:2: note: Returning without writing t=
o 'to->pno'
           return __cu_len_r;
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
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->p=
no'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->p=
no'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   block/ioctl.c:24:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&p, upart, sizeof(struct blkpg_partition)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/ioctl.c:24:2: note: Taking false branch
           if (copy_from_user(&p, upart, sizeof(struct blkpg_partition)))
           ^
   block/ioctl.c:26:6: note: Calling 'bdev_is_partition'
           if (bdev_is_partition(bdev))
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/blkdev.h:1377:2: note: Returning without writing to 'bdev-=
>bd_partno', which participates in a condition later
           return bdev->bd_partno;
           ^
   include/linux/blkdev.h:1377:2: note: Returning value, which participates=
 in a condition later
           return bdev->bd_partno;
           ^~~~~~~~~~~~~~~~~~~~~~
   block/ioctl.c:26:6: note: Returning from 'bdev_is_partition'
           if (bdev_is_partition(bdev))
               ^~~~~~~~~~~~~~~~~~~~~~~
   block/ioctl.c:26:6: note: Assuming the condition is false
           if (bdev_is_partition(bdev))
               ^~~~~~~~~~~~~~~~~~~~~~~
   block/ioctl.c:26:2: note: Taking false branch
           if (bdev_is_partition(bdev))
           ^
   block/ioctl.c:29:12: note: The left operand of '<=3D' is a garbage value
           if (p.pno <=3D 0)
               ~~~~~ ^
>> block/ioctl.c:124:8: warning: Assigned value is garbage or undefined [cl=
ang-analyzer-core.uninitialized.Assign]
           start =3D range[0];
                 ^
   block/ioctl.c:543:2: note: Control jumps to the 'default' case at line 5=
73
           switch (cmd) {
           ^
   block/ioctl.c:574:3: note:  Execution continues on line 577
                   break;
                   ^
   block/ioctl.c:577:8: note: Calling 'blkdev_common_ioctl'
           ret =3D blkdev_common_ioctl(bdev, mode, cmd, arg, argp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/ioctl.c:458:2: note: Control jumps to 'case 536875645:'  at line 4=
65
           switch (cmd) {
           ^
   block/ioctl.c:466:10: note: Calling 'blk_ioctl_discard'
                   return blk_ioctl_discard(bdev, mode, arg,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/ioctl.c:115:6: note: Assuming the condition is false
           if (!(mode & FMODE_WRITE))
               ^~~~~~~~~~~~~~~~~~~~~
   block/ioctl.c:115:2: note: Taking false branch
           if (!(mode & FMODE_WRITE))
           ^
   block/ioctl.c:118:6: note: Assuming the condition is false
           if (!blk_queue_discard(q))
               ^~~~~~~~~~~~~~~~~~~~~
   block/ioctl.c:118:2: note: Taking false branch
           if (!blk_queue_discard(q))
           ^
   block/ioctl.c:121:6: note: Calling 'copy_from_user'
           if (copy_from_user(range, (void __user *)arg, sizeof(range)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:472:2: note: Returning without writing t=
o '*to'
           return __cu_len_r;
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
   include/linux/uaccess.h:163:2: note: Returning without writing to '*to'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to '*to'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   block/ioctl.c:121:6: note: Returning from 'copy_from_user'
           if (copy_from_user(range, (void __user *)arg, sizeof(range)))
--
   block/ioctl.c:264:7: note: Calling 'capable'
           if (!capable(CAP_SYS_ADMIN))
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/capability.h:235:2: note: Returning the value 1, which par=
ticipates in a condition later
           return true;
           ^~~~~~~~~~~
   block/ioctl.c:264:7: note: Returning from 'capable'
           if (!capable(CAP_SYS_ADMIN))
                ^~~~~~~~~~~~~~~~~~~~~~
   block/ioctl.c:264:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   block/ioctl.c:266:6: note: Assuming 'ops' is non-null
           if (!ops || !ops->pr_reserve)
               ^~~~
   block/ioctl.c:266:6: note: Left side of '||' is false
   block/ioctl.c:266:14: note: Assuming field 'pr_reserve' is non-null
           if (!ops || !ops->pr_reserve)
                       ^~~~~~~~~~~~~~~~
   block/ioctl.c:266:2: note: Taking false branch
           if (!ops || !ops->pr_reserve)
           ^
   block/ioctl.c:268:6: note: Calling 'copy_from_user'
           if (copy_from_user(&rsv, arg, sizeof(rsv)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:472:2: note: Returning without writing t=
o 'to->flags'
           return __cu_len_r;
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
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->f=
lags'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->f=
lags'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   block/ioctl.c:268:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&rsv, arg, sizeof(rsv)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/ioctl.c:268:2: note: Taking false branch
           if (copy_from_user(&rsv, arg, sizeof(rsv)))
           ^
   block/ioctl.c:271:16: note: The left operand of '&' is a garbage value
           if (rsv.flags & ~PR_FL_IGNORE_KEY)
               ~~~~~~~~~ ^
>> block/ioctl.c:289:6: warning: Branch condition evaluates to a garbage va=
lue [clang-analyzer-core.uninitialized.Branch]
           if (rsv.flags)
               ^
   block/ioctl.c:543:2: note: Control jumps to the 'default' case at line 5=
73
           switch (cmd) {
           ^
   block/ioctl.c:574:3: note:  Execution continues on line 577
                   break;
                   ^
   block/ioctl.c:577:8: note: Calling 'blkdev_common_ioctl'
           ret =3D blkdev_common_ioctl(bdev, mode, cmd, arg, argp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/ioctl.c:458:2: note: Control jumps to 'case 2148561098:'  at line =
517
           switch (cmd) {
           ^
   block/ioctl.c:518:10: note: Calling 'blkdev_pr_release'
                   return blkdev_pr_release(bdev, argp);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/ioctl.c:282:7: note: Calling 'capable'
           if (!capable(CAP_SYS_ADMIN))
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/capability.h:235:2: note: Returning the value 1, which par=
ticipates in a condition later
           return true;
           ^~~~~~~~~~~
   block/ioctl.c:282:7: note: Returning from 'capable'
           if (!capable(CAP_SYS_ADMIN))
                ^~~~~~~~~~~~~~~~~~~~~~
   block/ioctl.c:282:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   block/ioctl.c:284:6: note: Assuming 'ops' is non-null
           if (!ops || !ops->pr_release)
               ^~~~
   block/ioctl.c:284:6: note: Left side of '||' is false
   block/ioctl.c:284:14: note: Assuming field 'pr_release' is non-null
           if (!ops || !ops->pr_release)
                       ^~~~~~~~~~~~~~~~
   block/ioctl.c:284:2: note: Taking false branch
           if (!ops || !ops->pr_release)
           ^
   block/ioctl.c:286:6: note: Calling 'copy_from_user'
           if (copy_from_user(&rsv, arg, sizeof(rsv)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:472:2: note: Returning without writing t=
o 'to->flags'
           return __cu_len_r;
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
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->f=
lags'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'

vim +124 block/ioctl.c

^1da177e4c3f41 drivers/block/ioctl.c Linus Torvalds     2005-04-16  106  =

d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  107  st=
atic int blk_ioctl_discard(struct block_device *bdev, fmode_t mode,
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  108  		=
unsigned long arg, unsigned long flags)
d30a2605be9d51 block/ioctl.c         David Woodhouse    2008-08-11  109  {
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  110  	u=
int64_t range[2];
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  111  	u=
int64_t start, len;
351499a172c0c5 block/ioctl.c         Dmitry Monakhov    2017-10-24  112  	s=
truct request_queue *q =3D bdev_get_queue(bdev);
384d87ef2c954f block/ioctl.c         Jan Kara           2020-09-04  113  	i=
nt err;
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  114  =

d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  115  	i=
f (!(mode & FMODE_WRITE))
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  116  		=
return -EBADF;
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  117  =

351499a172c0c5 block/ioctl.c         Dmitry Monakhov    2017-10-24  118  	i=
f (!blk_queue_discard(q))
351499a172c0c5 block/ioctl.c         Dmitry Monakhov    2017-10-24  119  		=
return -EOPNOTSUPP;
351499a172c0c5 block/ioctl.c         Dmitry Monakhov    2017-10-24  120  =

d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  121  	i=
f (copy_from_user(range, (void __user *)arg, sizeof(range)))
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  122  		=
return -EFAULT;
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  123  =

d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15 @124  	s=
tart =3D range[0];
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  125  	l=
en =3D range[1];
8d57a98ccd0b44 block/ioctl.c         Adrian Hunter      2010-08-11  126  =

d30a2605be9d51 block/ioctl.c         David Woodhouse    2008-08-11  127  	i=
f (start & 511)
d30a2605be9d51 block/ioctl.c         David Woodhouse    2008-08-11  128  		=
return -EINVAL;
d30a2605be9d51 block/ioctl.c         David Woodhouse    2008-08-11  129  	i=
f (len & 511)
d30a2605be9d51 block/ioctl.c         David Woodhouse    2008-08-11  130  		=
return -EINVAL;
d30a2605be9d51 block/ioctl.c         David Woodhouse    2008-08-11  131  =

351499a172c0c5 block/ioctl.c         Dmitry Monakhov    2017-10-24  132  	i=
f (start + len > i_size_read(bdev->bd_inode))
d30a2605be9d51 block/ioctl.c         David Woodhouse    2008-08-11  133  		=
return -EINVAL;
384d87ef2c954f block/ioctl.c         Jan Kara           2020-09-04  134  =

384d87ef2c954f block/ioctl.c         Jan Kara           2020-09-04  135  	e=
rr =3D truncate_bdev_range(bdev, mode, start, start + len - 1);
384d87ef2c954f block/ioctl.c         Jan Kara           2020-09-04  136  	i=
f (err)
384d87ef2c954f block/ioctl.c         Jan Kara           2020-09-04  137  		=
return err;
384d87ef2c954f block/ioctl.c         Jan Kara           2020-09-04  138  =

351499a172c0c5 block/ioctl.c         Dmitry Monakhov    2017-10-24  139  	r=
eturn blkdev_issue_discard(bdev, start >> 9, len >> 9,
351499a172c0c5 block/ioctl.c         Dmitry Monakhov    2017-10-24  140  		=
		    GFP_KERNEL, flags);
d30a2605be9d51 block/ioctl.c         David Woodhouse    2008-08-11  141  }
d30a2605be9d51 block/ioctl.c         David Woodhouse    2008-08-11  142  =

d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  143  st=
atic int blk_ioctl_zeroout(struct block_device *bdev, fmode_t mode,
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  144  		=
unsigned long arg)
66ba32dc167202 block/ioctl.c         Martin K. Petersen 2012-09-18  145  {
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  146  	u=
int64_t range[2];
22dd6d356628bc block/ioctl.c         Darrick J. Wong    2016-10-11  147  	u=
int64_t start, end, len;
384d87ef2c954f block/ioctl.c         Jan Kara           2020-09-04  148  	i=
nt err;
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  149  =

d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  150  	i=
f (!(mode & FMODE_WRITE))
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  151  		=
return -EBADF;
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  152  =

d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  153  	i=
f (copy_from_user(range, (void __user *)arg, sizeof(range)))
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  154  		=
return -EFAULT;
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  155  =

d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  156  	s=
tart =3D range[0];
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  157  	l=
en =3D range[1];
22dd6d356628bc block/ioctl.c         Darrick J. Wong    2016-10-11  158  	e=
nd =3D start + len - 1;
d8e4bb8103df02 block/ioctl.c         Christoph Hellwig  2015-10-15  159  =

66ba32dc167202 block/ioctl.c         Martin K. Petersen 2012-09-18  160  	i=
f (start & 511)
66ba32dc167202 block/ioctl.c         Martin K. Petersen 2012-09-18  161  		=
return -EINVAL;
66ba32dc167202 block/ioctl.c         Martin K. Petersen 2012-09-18  162  	i=
f (len & 511)
66ba32dc167202 block/ioctl.c         Martin K. Petersen 2012-09-18  163  		=
return -EINVAL;
22dd6d356628bc block/ioctl.c         Darrick J. Wong    2016-10-11  164  	i=
f (end >=3D (uint64_t)i_size_read(bdev->bd_inode))
22dd6d356628bc block/ioctl.c         Darrick J. Wong    2016-10-11  165  		=
return -EINVAL;
22dd6d356628bc block/ioctl.c         Darrick J. Wong    2016-10-11  166  	i=
f (end < start)
66ba32dc167202 block/ioctl.c         Martin K. Petersen 2012-09-18  167  		=
return -EINVAL;
66ba32dc167202 block/ioctl.c         Martin K. Petersen 2012-09-18  168  =

22dd6d356628bc block/ioctl.c         Darrick J. Wong    2016-10-11  169  	/=
* Invalidate the page cache, including dirty pages */
384d87ef2c954f block/ioctl.c         Jan Kara           2020-09-04  170  	e=
rr =3D truncate_bdev_range(bdev, mode, start, end);
384d87ef2c954f block/ioctl.c         Jan Kara           2020-09-04  171  	i=
f (err)
384d87ef2c954f block/ioctl.c         Jan Kara           2020-09-04  172  		=
return err;
22dd6d356628bc block/ioctl.c         Darrick J. Wong    2016-10-11  173  =

22dd6d356628bc block/ioctl.c         Darrick J. Wong    2016-10-11  174  	r=
eturn blkdev_issue_zeroout(bdev, start >> 9, len >> 9, GFP_KERNEL,
ee472d835c264a block/ioctl.c         Christoph Hellwig  2017-04-05  175  		=
	BLKDEV_ZERO_NOUNMAP);
66ba32dc167202 block/ioctl.c         Martin K. Petersen 2012-09-18  176  }
66ba32dc167202 block/ioctl.c         Martin K. Petersen 2012-09-18  177  =

9b81648cb5e3ae block/ioctl.c         Arnd Bergmann      2019-11-29  178  st=
atic int put_ushort(unsigned short __user *argp, unsigned short val)
^1da177e4c3f41 drivers/block/ioctl.c Linus Torvalds     2005-04-16  179  {
9b81648cb5e3ae block/ioctl.c         Arnd Bergmann      2019-11-29  180  	r=
eturn put_user(val, argp);
^1da177e4c3f41 drivers/block/ioctl.c Linus Torvalds     2005-04-16  181  }
^1da177e4c3f41 drivers/block/ioctl.c Linus Torvalds     2005-04-16  182  =

9b81648cb5e3ae block/ioctl.c         Arnd Bergmann      2019-11-29  183  st=
atic int put_int(int __user *argp, int val)
^1da177e4c3f41 drivers/block/ioctl.c Linus Torvalds     2005-04-16  184  {
9b81648cb5e3ae block/ioctl.c         Arnd Bergmann      2019-11-29  185  	r=
eturn put_user(val, argp);
^1da177e4c3f41 drivers/block/ioctl.c Linus Torvalds     2005-04-16  186  }
^1da177e4c3f41 drivers/block/ioctl.c Linus Torvalds     2005-04-16  187  =

9b81648cb5e3ae block/ioctl.c         Arnd Bergmann      2019-11-29  188  st=
atic int put_uint(unsigned int __user *argp, unsigned int val)
ac481c20ef8f6c block/ioctl.c         Martin K. Petersen 2009-10-03  189  {
9b81648cb5e3ae block/ioctl.c         Arnd Bergmann      2019-11-29  190  	r=
eturn put_user(val, argp);
ac481c20ef8f6c block/ioctl.c         Martin K. Petersen 2009-10-03  191  }
ac481c20ef8f6c block/ioctl.c         Martin K. Petersen 2009-10-03  192  =

9b81648cb5e3ae block/ioctl.c         Arnd Bergmann      2019-11-29  193  st=
atic int put_long(long __user *argp, long val)
^1da177e4c3f41 drivers/block/ioctl.c Linus Torvalds     2005-04-16  194  {
9b81648cb5e3ae block/ioctl.c         Arnd Bergmann      2019-11-29  195  	r=
eturn put_user(val, argp);
^1da177e4c3f41 drivers/block/ioctl.c Linus Torvalds     2005-04-16  196  }
^1da177e4c3f41 drivers/block/ioctl.c Linus Torvalds     2005-04-16  197  =

9b81648cb5e3ae block/ioctl.c         Arnd Bergmann      2019-11-29  198  st=
atic int put_ulong(unsigned long __user *argp, unsigned long val)
^1da177e4c3f41 drivers/block/ioctl.c Linus Torvalds     2005-04-16  199  {
9b81648cb5e3ae block/ioctl.c         Arnd Bergmann      2019-11-29  200  	r=
eturn put_user(val, argp);
^1da177e4c3f41 drivers/block/ioctl.c Linus Torvalds     2005-04-16  201  }
^1da177e4c3f41 drivers/block/ioctl.c Linus Torvalds     2005-04-16  202  =

9b81648cb5e3ae block/ioctl.c         Arnd Bergmann      2019-11-29  203  st=
atic int put_u64(u64 __user *argp, u64 val)
^1da177e4c3f41 drivers/block/ioctl.c Linus Torvalds     2005-04-16  204  {
9b81648cb5e3ae block/ioctl.c         Arnd Bergmann      2019-11-29  205  	r=
eturn put_user(val, argp);
^1da177e4c3f41 drivers/block/ioctl.c Linus Torvalds     2005-04-16  206  }
^1da177e4c3f41 drivers/block/ioctl.c Linus Torvalds     2005-04-16  207  =

bdc1ddad3e5f38 block/ioctl.c         Arnd Bergmann      2019-11-29  208  #i=
fdef CONFIG_COMPAT
c8210a57655a64 block/ioctl.c         Bart Van Assche    2020-05-18  209  st=
atic int compat_put_long(compat_long_t __user *argp, long val)
bdc1ddad3e5f38 block/ioctl.c         Arnd Bergmann      2019-11-29  210  {
9b81648cb5e3ae block/ioctl.c         Arnd Bergmann      2019-11-29  211  	r=
eturn put_user(val, argp);
bdc1ddad3e5f38 block/ioctl.c         Arnd Bergmann      2019-11-29  212  }
bdc1ddad3e5f38 block/ioctl.c         Arnd Bergmann      2019-11-29  213  =

c8210a57655a64 block/ioctl.c         Bart Van Assche    2020-05-18  214  st=
atic int compat_put_ulong(compat_ulong_t __user *argp, compat_ulong_t val)
bdc1ddad3e5f38 block/ioctl.c         Arnd Bergmann      2019-11-29  215  {
9b81648cb5e3ae block/ioctl.c         Arnd Bergmann      2019-11-29  216  	r=
eturn put_user(val, argp);
bdc1ddad3e5f38 block/ioctl.c         Arnd Bergmann      2019-11-29  217  }
bdc1ddad3e5f38 block/ioctl.c         Arnd Bergmann      2019-11-29  218  #e=
ndif
bdc1ddad3e5f38 block/ioctl.c         Arnd Bergmann      2019-11-29  219  =

ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  220  #i=
fdef CONFIG_COMPAT
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  221  /*
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  222   *=
 This is the equivalent of compat_ptr_ioctl(), to be used by block
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  223   *=
 drivers that implement only commands that are completely compatible
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  224   *=
 between 32-bit and 64-bit user space
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  225   */
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  226  in=
t blkdev_compat_ptr_ioctl(struct block_device *bdev, fmode_t mode,
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  227  		=
	unsigned cmd, unsigned long arg)
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  228  {
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  229  	s=
truct gendisk *disk =3D bdev->bd_disk;
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  230  =

ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  231  	i=
f (disk->fops->ioctl)
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  232  		=
return disk->fops->ioctl(bdev, mode, cmd,
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  233  		=
			 (unsigned long)compat_ptr(arg));
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  234  =

ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  235  	r=
eturn -ENOIOCTLCMD;
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  236  }
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  237  EX=
PORT_SYMBOL(blkdev_compat_ptr_ioctl);
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  238  #e=
ndif
ee6a129dffe10a block/ioctl.c         Arnd Bergmann      2019-11-28  239  =

bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  240  st=
atic int blkdev_pr_register(struct block_device *bdev,
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  241  		=
struct pr_registration __user *arg)
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  242  {
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  243  	c=
onst struct pr_ops *ops =3D bdev->bd_disk->fops->pr_ops;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  244  	s=
truct pr_registration reg;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  245  =

bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  246  	i=
f (!capable(CAP_SYS_ADMIN))
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  247  		=
return -EPERM;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  248  	i=
f (!ops || !ops->pr_register)
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  249  		=
return -EOPNOTSUPP;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  250  	i=
f (copy_from_user(&reg, arg, sizeof(reg)))
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  251  		=
return -EFAULT;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  252  =

bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  253  	i=
f (reg.flags & ~PR_FL_IGNORE_KEY)
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  254  		=
return -EOPNOTSUPP;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  255  	r=
eturn ops->pr_register(bdev, reg.old_key, reg.new_key, reg.flags);
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  256  }
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  257  =

bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  258  st=
atic int blkdev_pr_reserve(struct block_device *bdev,
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  259  		=
struct pr_reservation __user *arg)
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  260  {
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  261  	c=
onst struct pr_ops *ops =3D bdev->bd_disk->fops->pr_ops;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  262  	s=
truct pr_reservation rsv;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  263  =

bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  264  	i=
f (!capable(CAP_SYS_ADMIN))
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  265  		=
return -EPERM;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  266  	i=
f (!ops || !ops->pr_reserve)
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  267  		=
return -EOPNOTSUPP;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  268  	i=
f (copy_from_user(&rsv, arg, sizeof(rsv)))
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  269  		=
return -EFAULT;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  270  =

bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  271  	i=
f (rsv.flags & ~PR_FL_IGNORE_KEY)
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  272  		=
return -EOPNOTSUPP;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  273  	r=
eturn ops->pr_reserve(bdev, rsv.key, rsv.type, rsv.flags);
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  274  }
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  275  =

bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  276  st=
atic int blkdev_pr_release(struct block_device *bdev,
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  277  		=
struct pr_reservation __user *arg)
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  278  {
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  279  	c=
onst struct pr_ops *ops =3D bdev->bd_disk->fops->pr_ops;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  280  	s=
truct pr_reservation rsv;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  281  =

bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  282  	i=
f (!capable(CAP_SYS_ADMIN))
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  283  		=
return -EPERM;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  284  	i=
f (!ops || !ops->pr_release)
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  285  		=
return -EOPNOTSUPP;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  286  	i=
f (copy_from_user(&rsv, arg, sizeof(rsv)))
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  287  		=
return -EFAULT;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  288  =

bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15 @289  	i=
f (rsv.flags)
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  290  		=
return -EOPNOTSUPP;
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  291  	r=
eturn ops->pr_release(bdev, rsv.key, rsv.type);
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  292  }
bbd3e064362e50 block/ioctl.c         Christoph Hellwig  2015-10-15  293  =


:::::: The code at line 124 was first introduced by commit
:::::: d8e4bb8103df02a2c509868732dc93fb66110a12 block: cleanup blkdev_ioctl

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@fb.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0523544571015171668==--

