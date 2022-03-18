Content-Type: multipart/mixed; boundary="===============8401826277206016177=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 89/346] fs/xfs/xfs_inode.c:3829:20: warning: Value stored to 'ifp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 19 Mar 2022 04:39:15 +0800
Message-ID: <202203190411.pUlZG6y6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8401826277206016177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   37f1eaa855b8115b247530a5e8081189a09db2de
commit: eb48b17fd386b5fa0d5021ac0b7f02cc50c82b1c [89/346] xfs: implement li=
ve quotacheck inode scan
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: riscv-randconfig-c006-20220317 (https://download.01.org/0day-ci/arc=
hive/20220319/202203190411.pUlZG6y6-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e=
4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3Deb48b17fd386b5fa0d5021ac0b7f02cc50c82b1c
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout eb48b17fd386b5fa0d5021ac0b7f02cc50c82b1c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/hwmon/lm73.c:76:62: warning: The result of the left shift is und=
efined because the left operand is negative [clang-analyzer-core.UndefinedB=
inaryOperatorResult]
           value =3D clamp_val(temp / 250, LM73_TEMP_MIN, LM73_TEMP_MAX) <<=
 5;
                                                                       ^
   drivers/hwmon/lm73.c:72:6: note: Assuming 'status' is >=3D 0
           if (status < 0)
               ^~~~~~~~~~
   drivers/hwmon/lm73.c:72:2: note: Taking false branch
           if (status < 0)
           ^
   drivers/hwmon/lm73.c:76:10: note: Assuming '__UNIQUE_ID___x248' is <=3D =
'__UNIQUE_ID___y249'
           value =3D clamp_val(temp / 250, LM73_TEMP_MIN, LM73_TEMP_MAX) <<=
 5;
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
   drivers/hwmon/lm73.c:76:10: note: '?' condition is false
           value =3D clamp_val(temp / 250, LM73_TEMP_MIN, LM73_TEMP_MAX) <<=
 5;
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
   drivers/hwmon/lm73.c:76:10: note: '__UNIQUE_ID___x250' is < '__UNIQUE_ID=
___y251'
           value =3D clamp_val(temp / 250, LM73_TEMP_MIN, LM73_TEMP_MAX) <<=
 5;
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
   drivers/hwmon/lm73.c:76:10: note: '?' condition is true
           value =3D clamp_val(temp / 250, LM73_TEMP_MIN, LM73_TEMP_MAX) <<=
 5;
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
   drivers/hwmon/lm73.c:76:62: note: The result of the left shift is undefi=
ned because the left operand is negative
           value =3D clamp_val(temp / 250, LM73_TEMP_MIN, LM73_TEMP_MAX) <<=
 5;
                                                                       ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> fs/xfs/xfs_inode.c:3829:20: warning: Value stored to 'ifp' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(ip, XFS_DATA_FORK=
);
                                    ^~~
   fs/xfs/xfs_inode.c:3829:20: note: Value stored to 'ifp' during its initi=
alization is never read
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(ip, XFS_DATA_FORK=
);
                                    ^~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/xfs/xfs_iwalk.c:359:2: warning: Value stored to 'irec' is never read =
[clang-analyzer-deadcode.DeadStores]
           irec =3D &iwag->recs[iwag->nr_recs - 1];
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_iwalk.c:359:2: note: Value stored to 'irec' is never read
           irec =3D &iwag->recs[iwag->nr_recs - 1];
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
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
   10 warnings generated.
   fs/xfs/xfs_reflink.c:1182:3: warning: Value stored to 'qdelta' is never =
read [clang-analyzer-deadcode.DeadStores]
                   qdelta +=3D dmap->br_blockcount;
                   ^         ~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_reflink.c:1182:3: note: Value stored to 'qdelta' is never read
                   qdelta +=3D dmap->br_blockcount;
                   ^         ~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_reflink.c:1356:2: warning: Value stored to 'ret' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           ret =3D -EINVAL;
           ^     ~~~~~~~
   fs/xfs/xfs_reflink.c:1356:2: note: Value stored to 'ret' is never read
           ret =3D -EINVAL;
           ^     ~~~~~~~
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/hwmon/lm75.h:30:29: warning: The result of the left shift is und=
efined because the left operand is negative [clang-analyzer-core.UndefinedB=
inaryOperatorResult]
           return (u16)((ntemp / 500) << 7);
                                      ^
   drivers/hwmon/nct6775.c:2494:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   drivers/hwmon/nct6775.c:2494:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/hwmon/nct6775.c:2498:26: note: Calling 'LM75_TEMP_TO_REG'
           data->temp[index][nr] =3D LM75_TEMP_TO_REG(val);
                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm75.h:27:14: note: Assuming '__UNIQUE_ID___x179' is <=3D =
'__UNIQUE_ID___y180'
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
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
   drivers/hwmon/lm75.h:27:14: note: '?' condition is false
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
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

vim +/ifp +3829 fs/xfs/xfs_inode.c

eb48b17fd386b5 Darrick J. Wong 2022-01-06  3820  =

eb48b17fd386b5 Darrick J. Wong 2022-01-06  3821  /* Compute the number of d=
ata and realtime blocks used by a file. */
eb48b17fd386b5 Darrick J. Wong 2022-01-06  3822  void
eb48b17fd386b5 Darrick J. Wong 2022-01-06  3823  xfs_inode_count_blocks(
eb48b17fd386b5 Darrick J. Wong 2022-01-06  3824  	struct xfs_trans	*tp,
eb48b17fd386b5 Darrick J. Wong 2022-01-06  3825  	struct xfs_inode	*ip,
eb48b17fd386b5 Darrick J. Wong 2022-01-06  3826  	xfs_filblks_t		*dblocks,
eb48b17fd386b5 Darrick J. Wong 2022-01-06  3827  	xfs_filblks_t		*rblocks)
eb48b17fd386b5 Darrick J. Wong 2022-01-06  3828  {
eb48b17fd386b5 Darrick J. Wong 2022-01-06 @3829  	struct xfs_ifork	*ifp =3D=
 XFS_IFORK_PTR(ip, XFS_DATA_FORK);

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8401826277206016177==--

