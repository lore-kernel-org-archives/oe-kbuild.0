Content-Type: multipart/mixed; boundary="===============0514451088962045980=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 138/396] fs/xfs/xfs_inode.c:3840:20: warning: Value stored to 'ifp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 21 Apr 2022 14:40:57 +0800
Message-ID: <202204202314.RKE4xVnk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0514451088962045980==
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
head:   f5b8bfb5a673179515ef7df607347b696b3a0029
commit: 2fab0f12c84469a81921ee1fd6874e7e43bafd8f [138/396] xfs: implement l=
ive quotacheck inode scan
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: riscv-randconfig-c006-20220419 (https://download.01.org/0day-ci/arc=
hive/20220420/202204202314.RKE4xVnk-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c1c49a=
356162b22554088d269f7689bdb044a9f1)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3D2fab0f12c84469a81921ee1fd6874e7e43bafd8f
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout 2fab0f12c84469a81921ee1fd6874e7e43bafd8f
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                    ^~~~~~~~~~~~~~~
   mm/vmalloc.c:1824:20: note: expanded from macro 'VMAP_BBMAP_BITS'
                           VMALLOC_PAGES / roundup_pow_of_two(NR_CPUS) / 16=
))
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/log2.h:177:4: note: expanded from macro 'roundup_pow_of_tw=
o'
                   ((n) =3D=3D 1) ? 1 :                \
                    ^
   mm/vmalloc.c:1820:45: note: expanded from macro 'VMAP_MAX'
   #define VMAP_MAX(x, y)          ((x) > (y) ? (x) : (y)) /* can't use max=
() */
                                                       ^
   mm/vmalloc.c:1819:33: note: expanded from macro 'VMAP_MIN'
   #define VMAP_MIN(x, y)          ((x) < (y) ? (x) : (y)) /* can't use min=
() */
                                           ^
   mm/vmalloc.c:2055:20: note: '?' condition is true
           offset =3D (addr & (VMAP_BLOCK_SIZE - 1)) >> PAGE_SHIFT;
                             ^
   mm/vmalloc.c:1826:27: note: expanded from macro 'VMAP_BLOCK_SIZE'
   #define VMAP_BLOCK_SIZE         (VMAP_BBMAP_BITS * PAGE_SIZE)
                                    ^
   mm/vmalloc.c:1824:20: note: expanded from macro 'VMAP_BBMAP_BITS'
                           VMALLOC_PAGES / roundup_pow_of_two(NR_CPUS) / 16=
))
                                           ^
   include/linux/log2.h:177:3: note: expanded from macro 'roundup_pow_of_tw=
o'
                   ((n) =3D=3D 1) ? 1 :                \
                   ^
   mm/vmalloc.c:2055:20: note: '?' condition is true
           offset =3D (addr & (VMAP_BLOCK_SIZE - 1)) >> PAGE_SHIFT;
                             ^
   mm/vmalloc.c:1826:27: note: expanded from macro 'VMAP_BLOCK_SIZE'
   #define VMAP_BLOCK_SIZE         (VMAP_BBMAP_BITS * PAGE_SIZE)
                                    ^
   mm/vmalloc.c:1822:3: note: expanded from macro 'VMAP_BBMAP_BITS'
                   VMAP_MIN(VMAP_BBMAP_BITS_MAX,   \
                   ^
   mm/vmalloc.c:1819:26: note: expanded from macro 'VMAP_MIN'
   #define VMAP_MIN(x, y)          ((x) < (y) ? (x) : (y)) /* can't use min=
() */
                                    ^
   mm/vmalloc.c:2060:2: note: Taking false branch
           if (debug_pagealloc_enabled_static())
           ^
   mm/vmalloc.c:2066:18: note: Assuming '__UNIQUE_ID___x291' is >=3D '__UNI=
QUE_ID___y292'
           vb->dirty_min =3D min(vb->dirty_min, offset);
                           ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   mm/vmalloc.c:2066:18: note: '?' condition is false
           vb->dirty_min =3D min(vb->dirty_min, offset);
                           ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
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
   mm/vmalloc.c:2067:51: note: The result of the left shift is undefined du=
e to shifting by '64', which is greater or equal to the width of type 'unsi=
gned long'
           vb->dirty_max =3D max(vb->dirty_max, offset + (1UL << order));
                                                            ^
   include/linux/minmax.h:52:36: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                                            ^
   include/linux/minmax.h:38:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                                 ^
   include/linux/minmax.h:32:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y =3D (y);               \
                                         ^
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/xfs/xfs_iops.c:650:11: warning: Value stored to 'uid' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           kuid_t                  uid =3D GLOBAL_ROOT_UID;
                                   ^~~
   fs/xfs/xfs_iops.c:650:11: note: Value stored to 'uid' during its initial=
ization is never read
           kuid_t                  uid =3D GLOBAL_ROOT_UID;
                                   ^~~
   fs/xfs/xfs_iops.c:651:11: warning: Value stored to 'gid' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           kgid_t                  gid =3D GLOBAL_ROOT_GID;
                                   ^~~
   fs/xfs/xfs_iops.c:651:11: note: Value stored to 'gid' during its initial=
ization is never read
           kgid_t                  gid =3D GLOBAL_ROOT_GID;
                                   ^~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> fs/xfs/xfs_inode.c:3840:20: warning: Value stored to 'ifp' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(ip, XFS_DATA_FORK=
);
                                    ^~~
   fs/xfs/xfs_inode.c:3840:20: note: Value stored to 'ifp' during its initi=
alization is never read
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(ip, XFS_DATA_FORK=
);
                                    ^~~
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
   4 warnings generated.
   fs/xfs/xfs_reflink.c:1356:2: warning: Value stored to 'ret' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           ret =3D -EINVAL;
           ^     ~~~~~~~
   fs/xfs/xfs_reflink.c:1356:2: note: Value stored to 'ret' is never read
           ret =3D -EINVAL;
           ^     ~~~~~~~
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
   6 warnings generated.
   drivers/spi/spi-amd.c:162:17: warning: Dereference of null pointer [clan=
g-analyzer-core.NullDereference]
                           cmd_opcode =3D *(u8 *)xfer->tx_buf;
                                        ^
   drivers/spi/spi-amd.c:216:2: note: Calling 'amd_spi_fifo_xfer'
           amd_spi_fifo_xfer(amd_spi, master, msg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-amd.c:152:2: note: Loop condition is true.  Entering loo=
p body
           list_for_each_entry(xfer, &message->transfers,
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/spi/spi-amd.c:154:7: note: Assuming field 'rx_buf' is null
                   if (xfer->rx_buf)
                       ^~~~~~~~~~~~
   drivers/spi/spi-amd.c:154:3: note: Taking false branch
                   if (xfer->rx_buf)
                   ^
   drivers/spi/spi-amd.c:156:7: note: Assuming field 'tx_buf' is non-null
                   if (xfer->tx_buf)
                       ^~~~~~~~~~~~
   drivers/spi/spi-amd.c:156:3: note: Taking true branch
                   if (xfer->tx_buf)
                   ^
   drivers/spi/spi-amd.c:159:3: note: Taking true branch
                   if (m_cmd & AMD_SPI_XFER_TX) {
                   ^
   drivers/spi/spi-amd.c:167:16: note: Assuming 'i' is >=3D 'tx_len'
                           for (i =3D 0; i < tx_len; i++) {
                                       ^~~~~~~~~~
   drivers/spi/spi-amd.c:167:4: note: Loop condition is false. Execution co=
ntinues on line 172
                           for (i =3D 0; i < tx_len; i++) {
                           ^
   drivers/spi/spi-amd.c:177:3: note: Taking false branch
                   if (m_cmd & AMD_SPI_XFER_RX) {
                   ^
   drivers/spi/spi-amd.c:152:2: note: Loop condition is true.  Entering loo=
p body
           list_for_each_entry(xfer, &message->transfers,
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/spi/spi-amd.c:154:7: note: Assuming field 'rx_buf' is null
                   if (xfer->rx_buf)
                       ^~~~~~~~~~~~
   drivers/spi/spi-amd.c:154:3: note: Taking false branch
                   if (xfer->rx_buf)

vim +/ifp +3840 fs/xfs/xfs_inode.c

2fab0f12c84469a8 Darrick J. Wong 2022-01-06  3831  =

2fab0f12c84469a8 Darrick J. Wong 2022-01-06  3832  /* Compute the number of=
 data and realtime blocks used by a file. */
2fab0f12c84469a8 Darrick J. Wong 2022-01-06  3833  void
2fab0f12c84469a8 Darrick J. Wong 2022-01-06  3834  xfs_inode_count_blocks(
2fab0f12c84469a8 Darrick J. Wong 2022-01-06  3835  	struct xfs_trans	*tp,
2fab0f12c84469a8 Darrick J. Wong 2022-01-06  3836  	struct xfs_inode	*ip,
2fab0f12c84469a8 Darrick J. Wong 2022-01-06  3837  	xfs_filblks_t		*dblocks,
2fab0f12c84469a8 Darrick J. Wong 2022-01-06  3838  	xfs_filblks_t		*rblocks)
2fab0f12c84469a8 Darrick J. Wong 2022-01-06  3839  {
2fab0f12c84469a8 Darrick J. Wong 2022-01-06 @3840  	struct xfs_ifork	*ifp =
=3D XFS_IFORK_PTR(ip, XFS_DATA_FORK);

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0514451088962045980==--

