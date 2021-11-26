Content-Type: multipart/mixed; boundary="===============8961053708263647937=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:direct-xfile-mapped-buffers 103/333] fs/xfs/xfs_rtalloc.c:1439:17: warning: Value stored to 'off' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 26 Nov 2021 09:55:22 +0800
Message-ID: <202111260911.JKJz6fEX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8961053708263647937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t direct-xfile-mapped-buffers
head:   014cdddffcddd5b13402721de744b9ea76961d74
commit: bd7fa0e8c47bcda25664e1b2572d33a8d61d29c3 [103/333] xfs: make atomic=
 extent swapping support realtime files
:::::: branch date: 5 weeks ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-c001-20211031 (https://download.01.org/0day-ci/arch=
ive/20211126/202111260911.JKJz6fEX-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d32154=
8c3ce987f4f21350ba1c81fdb5d4354224)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3Dbd7fa0e8c47bcda25664e1b2572d33a8d61d29c3
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs direct-xfile-mapped-buffers
        git checkout bd7fa0e8c47bcda25664e1b2572d33a8d61d29c3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/xfs/xfs_rtalloc.c:286:26: note: Left side of '&&' is false
                           if (thislen >=3D minlen && thislen > bestlen) {
                                                 ^
   fs/xfs/xfs_rtalloc.c:294:7: note: Assuming 'next' is < 'end'
                   if (next < end) {
                       ^~~~~~~~~~
   fs/xfs/xfs_rtalloc.c:294:3: note: Taking true branch
                   if (next < end) {
                   ^
   fs/xfs/xfs_rtalloc.c:296:8: note: Assuming 'error' is 0
                           if (error) {
                               ^~~~~
   fs/xfs/xfs_rtalloc.c:296:4: note: Taking false branch
                           if (error) {
                           ^
   fs/xfs/xfs_rtalloc.c:250:7: note: Assuming 'i' is <=3D 'end'
                i <=3D end;
                ^~~~~~~~
   fs/xfs/xfs_rtalloc.c:248:2: note: Loop condition is true.  Entering loop=
 body
           for (i =3D XFS_BLOCKTOBIT(mp, bbno), besti =3D -1, bestlen =3D 0,
           ^
   fs/xfs/xfs_rtalloc.c:253:12: note: Assuming '__UNIQUE_ID___x1506' is >=
=3D '__UNIQUE_ID___y1507'
                   maxlen =3D min(mp->m_sb.sb_rextents, i + maxlen) - i;
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
   fs/xfs/xfs_rtalloc.c:253:12: note: '?' condition is false
                   maxlen =3D min(mp->m_sb.sb_rextents, i + maxlen) - i;
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
   fs/xfs/xfs_rtalloc.c:260:7: note: Assuming 'error' is 0
                   if (error) {
                       ^~~~~
   fs/xfs/xfs_rtalloc.c:260:3: note: Taking false branch
                   if (error) {
                   ^
   fs/xfs/xfs_rtalloc.c:263:7: note: Assuming 'stat' is not equal to 0
                   if (stat) {
                       ^~~~
   fs/xfs/xfs_rtalloc.c:263:3: note: Taking true branch
                   if (stat) {
                   ^
   fs/xfs/xfs_rtalloc.c:269:8: note: Assuming 'error' is 0
                           if (error) {
                               ^~~~~
   fs/xfs/xfs_rtalloc.c:269:4: note: Taking false branch
                           if (error) {
                           ^
   fs/xfs/xfs_rtalloc.c:274:4: note: Returning without writing to '*nextp'
                           return 0;
                           ^
   fs/xfs/xfs_rtalloc.c:274:4: note: Returning zero, which participates in =
a condition later
                           return 0;
                           ^~~~~~~~
   fs/xfs/xfs_rtalloc.c:735:12: note: Returning from 'xfs_rtallocate_extent=
_block'
                           error =3D xfs_rtallocate_extent_block(mp, tp, i,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_rtalloc.c:739:8: note: 'error' is 0
                           if (error) {
                               ^~~~~
   fs/xfs/xfs_rtalloc.c:739:4: note: Taking false branch
                           if (error) {
                           ^
   fs/xfs/xfs_rtalloc.c:745:8: note: Assuming the condition is false
                           if (r !=3D NULLRTBLOCK) {
                               ^~~~~~~~~~~~~~~~
   fs/xfs/xfs_rtalloc.c:745:4: note: Taking false branch
                           if (r !=3D NULLRTBLOCK) {
                           ^
   fs/xfs/xfs_rtalloc.c:754:8: note: The left operand of '>>' is a garbage =
value
                           if (XFS_BITTOBLOCK(mp, n) > i + 1)
                               ^
   fs/xfs/libxfs/xfs_format.h:1055:37: note: expanded from macro 'XFS_BITTO=
BLOCK'
   #define XFS_BITTOBLOCK(mp,bi)   ((bi) >> (mp)->m_blkbit_log)
                                     ~~  ^
   fs/xfs/xfs_rtalloc.c:983:2: warning: Value stored to 'nrsumsize' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           nrsumsize =3D XFS_FSB_TO_B(mp, nrsumblocks);
           ^
   fs/xfs/xfs_rtalloc.c:983:2: note: Value stored to 'nrsumsize' is never r=
ead
>> fs/xfs/xfs_rtalloc.c:1439:17: warning: Value stored to 'off' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           xfs_fileoff_t           off =3D XFS_B_TO_FSBT(mp, pos);
                                   ^~~
   fs/xfs/xfs_rtalloc.c:1439:17: note: Value stored to 'off' during its ini=
tialization is never read
           xfs_fileoff_t           off =3D XFS_B_TO_FSBT(mp, pos);
                                   ^~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/md/md-autodetect.c:178:2: warning: Value stored to 'err' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           err =3D -EIO;
           ^     ~~~~
   drivers/md/md-autodetect.c:178:2: note: Value stored to 'err' is never r=
ead
           err =3D -EIO;
           ^     ~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/isdn/mISDN/core.c:89:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(buf, dev_name(dev));
           ^~~~~~
   drivers/isdn/mISDN/core.c:89:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(buf, dev_name(dev));
           ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   5 warnings generated.
   drivers/net/phy/micrel.c:1072:2: warning: Value stored to 'regval' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           regval =3D phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:1072:2: note: Value stored to 'regval' is never=
 read
           regval =3D phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   net/rfkill/core.c:978:2: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rfkill->name, name);
           ^~~~~~
   net/rfkill/core.c:978:2: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
           strcpy(rfkill->name, name);
           ^~~~~~
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   net/9p/client.c:543:3: warning: Value stored to 'err' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   err =3D p9pdu_readf(&req->rc, c->proto_version, "d", &ec=
ode);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   net/9p/client.c:543:3: note: Value stored to 'err' is never read
                   err =3D p9pdu_readf(&req->rc, c->proto_version, "d", &ec=
ode);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   net/9p/client.c:630:3: warning: Value stored to 'err' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   err =3D p9pdu_readf(&req->rc, c->proto_version, "d", &ec=
ode);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   net/9p/client.c:630:3: note: Value stored to 'err' is never read
                   err =3D p9pdu_readf(&req->rc, c->proto_version, "d", &ec=
ode);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   net/9p/client.c:1010:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/9p/client.c:1010:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   net/9p/client.c:1177:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/9p/client.c:1177:2: note: Value stored to 'err' is never read
           err =3D 0;

vim +/off +1439 fs/xfs/xfs_rtalloc.c

bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1422  =

bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1423  /*
bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1424   * For all realtime exten=
ts backing the given range of a file, search for
bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1425   * unwritten mappings tha=
t are do not cover a full rt extent and convert them
bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1426   * to zeroed written mapp=
ings.  The goal is to end up with one mapping per rt
bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1427   * extent so that we can =
perform a remapping operation.  Callers must ensure
bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1428   * that there are no dirt=
y pages in the given range.
bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1429   */
bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1430  int
bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1431  xfs_rtfile_convert_unwrit=
ten(
bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1432  	struct xfs_inode	*ip,
bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1433  	loff_t			pos,
bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1434  	uint64_t		len)
bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1435  {
bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1436  	struct xfs_bmbt_irec	ire=
c;
bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1437  	struct xfs_trans	*tp;
bd7fa0e8c47bcda Darrick J. Wong 2021-09-01  1438  	struct xfs_mount	*mp =3D=
 ip->i_mount;
bd7fa0e8c47bcda Darrick J. Wong 2021-09-01 @1439  	xfs_fileoff_t		off =3D X=
FS_B_TO_FSBT(mp, pos);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8961053708263647937==--

