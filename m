Content-Type: multipart/mixed; boundary="===============3611182832053582313=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 164/368] fs/xfs/libxfs/xfs_format.h:430:4: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
Date: Tue, 12 Jul 2022 09:04:41 +0800
Message-ID: <202207120811.xqyuAUCM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3611182832053582313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/xfs/li=
bxfs/xfs_format.h:430:4: warning: Shifting signed 32-bit value by 31 bits i=
s implementation-defined behaviour [shiftTooManyBitsSigned]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   569bd1ce4bb5c53a1b892fbe6d99693bf637063b
commit: 5b0dfa1e74cd0bce33b5ce9fabd99ee6b1895aea [164/368] xfs: create defe=
rred log items for extent swapping
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 5b0dfa1e74cd0bce33b5ce9fabd99ee6b1895aea
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/xfs/xfs_error.c:119:9: warning: %u in format string (no. 1) requires =
'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType=
_uint]
    return snprintf(buf, PAGE_SIZE, "%un",
           ^
>> fs/xfs/libxfs/xfs_sb.c:470:21: warning: Boolean result is used in bitwis=
e operation. Clarify expression with parentheses. [clarifyCondition]
    if (!!sbp->sb_unit ^ has_dalign) {
                       ^
>> fs/xfs/libxfs/xfs_format.h:430:4: warning: Shifting signed 32-bit value =
by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
>> fs/xfs/libxfs/xfs_sb.c:1200:17: warning: Shifting signed 32-bit value by=
 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     geo->flags |=3D XFS_FSOP_GEOM_FLAGS_ATOMIC_SWAP;
                   ^
>> fs/xfs/libxfs/xfs_format.h:430:4: warning: Signed integer overflow for e=
xpression '1<<31'. [integerOverflow]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
>> fs/xfs/libxfs/xfs_sb.c:1200:17: warning: Signed integer overflow for exp=
ression '1<<31'. [integerOverflow]
     geo->flags |=3D XFS_FSOP_GEOM_FLAGS_ATOMIC_SWAP;
                   ^
--
>> fs/xfs/libxfs/xfs_format.h:430:4: warning: Shifting signed 32-bit value =
by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
>> fs/xfs/libxfs/xfs_format.h:430:4: warning: Signed integer overflow for e=
xpression '1<<31'. [integerOverflow]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
>> fs/xfs/libxfs/xfs_swapext.c:131:24: warning: Using argument irec that po=
ints at uninitialized variable irec1 [ctuuninitvar]
    sxi->sxi_startoff1 +=3D irec->br_blockcount;
                          ^
   fs/xfs/libxfs/xfs_swapext.c:392:36: note: Calling function xfs_swapext_f=
ind_mappings, 2nd argument is uninitialized
     error =3D xfs_swapext_find_mappings(sxi, &irec1, &irec2, NULL);
                                      ^
   fs/xfs/libxfs/xfs_swapext.c:218:38: note: Calling function sxi_advance, =
2nd argument is uninitialized
    for (; sxi_has_more_swap_work(sxi); sxi_advance(sxi, irec1)) {
                                        ^
   fs/xfs/libxfs/xfs_swapext.c:131:24: note: Using argument irec
    sxi->sxi_startoff1 +=3D irec->br_blockcount;
                          ^
--
>> fs/xfs/libxfs/xfs_inode_fork.c:567:3: warning: Assignment of function pa=
rameter has no effect outside the function. Did you forget dereferencing it=
? [uselessAssignmentPtrArg]
     dp++;
     ^
>> fs/xfs/libxfs/xfs_format.h:430:4: warning: Shifting signed 32-bit value =
by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
>> fs/xfs/libxfs/xfs_format.h:430:4: warning: Signed integer overflow for e=
xpression '1<<31'. [integerOverflow]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
>> fs/xfs/libxfs/xfs_inode_fork.c:561:28: warning: Uninitialized variable: =
rec.br_startblock [uninitvar]
     if (isnullstartblock(rec.br_startblock))
                              ^
--
>> fs/xfs/libxfs/xfs_iext_tree.c:431:10: warning: Parameter 'ptr' can be de=
clared with const [constParameter]
    void   *ptr)
            ^
>> fs/xfs/libxfs/xfs_format.h:430:4: warning: Shifting signed 32-bit value =
by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
>> fs/xfs/libxfs/xfs_format.h:430:4: warning: Signed integer overflow for e=
xpression '1<<31'. [integerOverflow]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
--
>> fs/xfs/libxfs/xfs_ialloc.c:1998:21: warning: Local variable 'pag' shadow=
s outer argument [shadowArgument]
     struct xfs_perag *pag =3D agbp->b_pag;
                       ^
   fs/xfs/libxfs/xfs_ialloc.c:1930:21: note: Shadowed declaration
    struct xfs_perag  *pag,
                       ^
   fs/xfs/libxfs/xfs_ialloc.c:1998:21: note: Shadow variable
     struct xfs_perag *pag =3D agbp->b_pag;
                       ^
>> fs/xfs/libxfs/xfs_format.h:430:4: warning: Shifting signed 32-bit value =
by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
>> fs/xfs/libxfs/xfs_format.h:430:4: warning: Signed integer overflow for e=
xpression '1<<31'. [integerOverflow]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
--
   fs/xfs/libxfs/xfs_refcount.c:126:7: warning: Redundant initialization fo=
r 'agno'. The initialized value is overwritten before it is read. [redundan=
tInitialization]
    agno =3D cur->bc_ag.pag->pag_agno;
         ^
   fs/xfs/libxfs/xfs_refcount.c:115:24: note: agno is initialized
    xfs_agnumber_t   agno =3D cur->bc_ag.pag->pag_agno;
                          ^
   fs/xfs/libxfs/xfs_refcount.c:126:7: note: agno is overwritten
    agno =3D cur->bc_ag.pag->pag_agno;
         ^
>> fs/xfs/libxfs/xfs_format.h:430:4: warning: Shifting signed 32-bit value =
by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
>> fs/xfs/libxfs/xfs_format.h:430:4: warning: Signed integer overflow for e=
xpression '1<<31'. [integerOverflow]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
--
   In file included from fs/xfs/libxfs/xfs_rmap.c:
>> fs/xfs/libxfs/xfs_format.h:430:4: warning: Shifting signed 32-bit value =
by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
>> fs/xfs/libxfs/xfs_format.h:430:4: warning: Signed integer overflow for e=
xpression '1<<31'. [integerOverflow]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^

vim +430 fs/xfs/libxfs/xfs_format.h

bb58e6188a10f0 Christoph Hellwig 2014-11-28  426  =

5b0dfa1e74cd0b Darrick J. Wong   2022-06-10  427  static inline bool xfs_sb=
_version_haslogswapext(struct xfs_sb *sbp)
5b0dfa1e74cd0b Darrick J. Wong   2022-06-10  428  {
5b0dfa1e74cd0b Darrick J. Wong   2022-06-10  429  	return xfs_sb_is_v5(sbp)=
 && (sbp->sb_features_log_incompat &
5b0dfa1e74cd0b Darrick J. Wong   2022-06-10 @430  		 XFS_SB_FEAT_INCOMPAT_L=
OG_SWAPEXT);
5b0dfa1e74cd0b Darrick J. Wong   2022-06-10  431  }
5b0dfa1e74cd0b Darrick J. Wong   2022-06-10  432  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3611182832053582313==--

