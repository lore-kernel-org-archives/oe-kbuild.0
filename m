Content-Type: multipart/mixed; boundary="===============1420766276306412106=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:report-refcounts 369/369] fs/xfs/libxfs/xfs_refcount.c:1960:28: warning: Parameter 'low_rec' can be declared with const [constParameter]
Date: Tue, 12 Jul 2022 09:55:34 +0800
Message-ID: <202207120942.yi1KTIgk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1420766276306412106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/xfs/li=
bxfs/xfs_refcount.c:1960:28: warning: Parameter 'low_rec' can be declared w=
ith const [constParameter]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t report-refcounts
head:   e03415388b6396a20de350473226dde17bcf5728
commit: e03415388b6396a20de350473226dde17bcf5728 [369/369] xfs: export refe=
rence count information to userspace
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout e03415388b6396a20de350473226dde17bcf5728
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/xfs/xfs_itable.c:80:8: warning: Redundant initialization for 'error'.=
 The initialized value is overwritten before it is read. [redundantInitiali=
zation]
    error =3D xfs_iget(mp, tp, ino,
          ^
   fs/xfs/xfs_itable.c:78:14: note: error is initialized
    int   error =3D -EINVAL;
                ^
   fs/xfs/xfs_itable.c:80:8: note: error is overwritten
    error =3D xfs_iget(mp, tp, ino,
          ^
>> fs/xfs/libxfs/xfs_rmap.c:2596:20: warning: Parameter 'pag' can be declar=
ed with const [constParameter]
    struct xfs_perag *pag)
                      ^
>> fs/xfs/libxfs/xfs_rmap.c:2717:25: warning: Parameter 'bmap' can be decla=
red with const [constParameter]
    struct xfs_bmbt_irec  *bmap)
                           ^
   fs/xfs/libxfs/xfs_format.h:428:36: warning: Shifting signed 32-bit value=
 by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    sbp->sb_features_log_incompat &=3D ~XFS_SB_FEAT_INCOMPAT_LOG_ALL;
                                      ^
   fs/xfs/libxfs/xfs_format.h:448:4: warning: Shifting signed 32-bit value =
by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
   fs/xfs/libxfs/xfs_format.h:428:36: warning: Signed integer overflow for =
expression '1<<31'. [integerOverflow]
    sbp->sb_features_log_incompat &=3D ~XFS_SB_FEAT_INCOMPAT_LOG_ALL;
                                      ^
   fs/xfs/libxfs/xfs_format.h:448:4: warning: Signed integer overflow for e=
xpression '1<<31'. [integerOverflow]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
--
>> fs/xfs/libxfs/xfs_refcount.c:1960:28: warning: Parameter 'low_rec' can b=
e declared with const [constParameter]
    struct xfs_refcount_irec *low_rec,
                              ^
>> fs/xfs/libxfs/xfs_refcount.c:1961:28: warning: Parameter 'high_rec' can =
be declared with const [constParameter]
    struct xfs_refcount_irec *high_rec,
                              ^
>> fs/xfs/libxfs/xfs_refcount.c:1216:20: warning: Parameter 'pag' can be de=
clared with const [constParameter]
    struct xfs_perag *pag)
                      ^
   fs/xfs/libxfs/xfs_format.h:428:36: warning: Shifting signed 32-bit value=
 by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    sbp->sb_features_log_incompat &=3D ~XFS_SB_FEAT_INCOMPAT_LOG_ALL;
                                      ^
   fs/xfs/libxfs/xfs_format.h:448:4: warning: Shifting signed 32-bit value =
by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
   fs/xfs/libxfs/xfs_format.h:428:36: warning: Signed integer overflow for =
expression '1<<31'. [integerOverflow]
    sbp->sb_features_log_incompat &=3D ~XFS_SB_FEAT_INCOMPAT_LOG_ALL;
                                      ^
   fs/xfs/libxfs/xfs_format.h:448:4: warning: Signed integer overflow for e=
xpression '1<<31'. [integerOverflow]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^

vim +/low_rec +1960 fs/xfs/libxfs/xfs_refcount.c

e03415388b6396 Darrick J. Wong 2022-06-10  1955  =

e03415388b6396 Darrick J. Wong 2022-06-10  1956  /* Find all refcount recor=
ds between two keys. */
e03415388b6396 Darrick J. Wong 2022-06-10  1957  int
e03415388b6396 Darrick J. Wong 2022-06-10  1958  xfs_refcount_query_range(
e03415388b6396 Darrick J. Wong 2022-06-10  1959  	struct xfs_btree_cur		*cu=
r,
e03415388b6396 Darrick J. Wong 2022-06-10 @1960  	struct xfs_refcount_irec	=
*low_rec,
e03415388b6396 Darrick J. Wong 2022-06-10 @1961  	struct xfs_refcount_irec	=
*high_rec,

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1420766276306412106==--

