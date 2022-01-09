Content-Type: multipart/mixed; boundary="===============7234961650925384105=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ntfs3/file.c:37:17: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 09 Jan 2022 17:02:41 +0800
Message-ID: <202201091639.QczqYi3L-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7234961650925384105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4634129ad9fdc89d10b597fc6f8f4336fb61e105
commit: 6e5be40d32fb1907285277c02e74493ed43d77fe fs/ntfs3: Add NTFS3 in fs/=
Kconfig and fs/Makefile
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: mips-randconfig-c004-20220107 (https://download.01.org/0day-ci/arch=
ive/20220109/202201091639.QczqYi3L-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167b=
fe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6e5be40d32fb1907285277c02e74493ed43d77fe
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6e5be40d32fb1907285277c02e74493ed43d77fe
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/hwmon/max31730.c:201:3: note:  Execution continues on line 219
                   break;
                   ^
   drivers/hwmon/max31730.c:219:8: note: Assuming '__UNIQUE_ID___x341' is <=
=3D '__UNIQUE_ID___y342'
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
                 ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:104:48: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/hwmon/max31730.c:219:8: note: '?' condition is false
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
                 ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                                  ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/max31730.c:219:8: note: '__UNIQUE_ID___x343' is < '__UNIQU=
E_ID___y344'
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
                 ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/hwmon/max31730.c:219:8: note: '?' condition is true
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
                 ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/max31730.c:219:2: note: The value -128000 is assigned to '=
val'
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/max31730.c:220:30: note: The result of the left shift is u=
ndefined because the left operand is negative
           val =3D DIV_ROUND_CLOSEST(val << 4, 1000) << 4;
                                       ^
   include/linux/math.h:87:18: note: expanded from macro 'DIV_ROUND_CLOSEST'
           typeof(x) __x =3D x;                              \
                           ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> fs/ntfs3/file.c:37:17: warning: Assigned value is garbage or undefined [=
clang-analyzer-core.uninitialized.Assign]
           range.minlen =3D max_t(u32, range.minlen, q->limits.discard_gran=
ularity);
                          ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:31:3: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                   ^
   fs/ntfs3/file.c:55:2: note: Control jumps to 'case 3222820985:'  at line=
 62
           switch (cmd) {
           ^
   fs/ntfs3/file.c:63:10: note: Calling 'ntfs_ioctl_fitrim'
                   return ntfs_ioctl_fitrim(sbi, arg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/file.c:27:7: note: Calling 'capable'
           if (!capable(CAP_SYS_ADMIN))
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/capability.h:235:2: note: Returning the value 1, which par=
ticipates in a condition later
           return true;
           ^~~~~~~~~~~
   fs/ntfs3/file.c:27:7: note: Returning from 'capable'
           if (!capable(CAP_SYS_ADMIN))
                ^~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/file.c:27:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   fs/ntfs3/file.c:30:6: note: Assuming the condition is false
           if (!blk_queue_discard(q))
               ^~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/file.c:30:2: note: Taking false branch
           if (!blk_queue_discard(q))
           ^
   fs/ntfs3/file.c:34:6: note: Calling 'copy_from_user'
           if (copy_from_user(&range, user_range, sizeof(range)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:456:2: note: Returning without writing t=
o 'to->minlen'
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
   fs/ntfs3/file.c:34:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&range, user_range, sizeof(range)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/file.c:34:2: note: Taking false branch
           if (copy_from_user(&range, user_range, sizeof(range)))
           ^
   fs/ntfs3/file.c:37:17: note: Assigned value is garbage or undefined
           range.minlen =3D max_t(u32, range.minlen, q->limits.discard_gran=
ularity);

vim +37 fs/ntfs3/file.c

4342306f0f0d5f Konstantin Komarov 2021-08-13  19  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  20  static int ntfs_ioctl_fit=
rim(struct ntfs_sb_info *sbi, unsigned long arg)
4342306f0f0d5f Konstantin Komarov 2021-08-13  21  {
4342306f0f0d5f Konstantin Komarov 2021-08-13  22  	struct fstrim_range __us=
er *user_range;
4342306f0f0d5f Konstantin Komarov 2021-08-13  23  	struct fstrim_range rang=
e;
4342306f0f0d5f Konstantin Komarov 2021-08-13  24  	struct request_queue *q =
=3D bdev_get_queue(sbi->sb->s_bdev);
4342306f0f0d5f Konstantin Komarov 2021-08-13  25  	int err;
4342306f0f0d5f Konstantin Komarov 2021-08-13  26  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  27  	if (!capable(CAP_SYS_ADM=
IN))
4342306f0f0d5f Konstantin Komarov 2021-08-13  28  		return -EPERM;
4342306f0f0d5f Konstantin Komarov 2021-08-13  29  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  30  	if (!blk_queue_discard(q=
))
4342306f0f0d5f Konstantin Komarov 2021-08-13  31  		return -EOPNOTSUPP;
4342306f0f0d5f Konstantin Komarov 2021-08-13  32  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  33  	user_range =3D (struct f=
strim_range __user *)arg;
4342306f0f0d5f Konstantin Komarov 2021-08-13  34  	if (copy_from_user(&rang=
e, user_range, sizeof(range)))
4342306f0f0d5f Konstantin Komarov 2021-08-13  35  		return -EFAULT;
4342306f0f0d5f Konstantin Komarov 2021-08-13  36  =

4342306f0f0d5f Konstantin Komarov 2021-08-13 @37  	range.minlen =3D max_t(u=
32, range.minlen, q->limits.discard_granularity);
4342306f0f0d5f Konstantin Komarov 2021-08-13  38  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  39  	err =3D ntfs_trim_fs(sbi=
, &range);
4342306f0f0d5f Konstantin Komarov 2021-08-13  40  	if (err < 0)
4342306f0f0d5f Konstantin Komarov 2021-08-13  41  		return err;
4342306f0f0d5f Konstantin Komarov 2021-08-13  42  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  43  	if (copy_to_user(user_ra=
nge, &range, sizeof(range)))
4342306f0f0d5f Konstantin Komarov 2021-08-13  44  		return -EFAULT;
4342306f0f0d5f Konstantin Komarov 2021-08-13  45  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  46  	return 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  47  }
4342306f0f0d5f Konstantin Komarov 2021-08-13  48  =


:::::: The code@line 37 was first introduced by commit
:::::: 4342306f0f0d5ff4315a204d315c1b51b914fca5 fs/ntfs3: Add file operatio=
ns and implementation

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7234961650925384105==--

