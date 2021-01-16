Content-Type: multipart/mixed; boundary="===============4907107390273192253=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:reserve-rt-metadata-space 159/196] fs/xfs/libxfs/xfs_inode_buf.c:477:20: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses.
Date: Sat, 16 Jan 2021 14:09:23 +0800
Message-ID: <202101161414.wDecnW1g-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4907107390273192253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t reserve-rt-metadata-space
head:   51f17deded84ae5863d2220a0a7c152ef4a8bbb2
commit: d11764606b06f3bead29d8498c6e7d2d52f9b950 [159/196] xfs: enforce met=
adata inode flag
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: csky-randconfig-p001-20210115 (attached as .config)
compiler: csky-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3Dd11764606b06f3bead29d8498c6e7d2d52f9b950
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs reserve-rt-metadata-space
        git checkout d11764606b06f3bead29d8498c6e7d2d52f9b950
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dcsky =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_xchgrange.c:21:
   fs/xfs/xfs_quota.h: In function 'xfs_trans_unreserve_quota_nblks':
   fs/xfs/xfs_quota.h:185:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     185 |  return xfs_trans_reserve_quota_nblks(&tp, ip, -nblks, -ninos, f=
lags,
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:141:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     141 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_quota.h: At top level:
   fs/xfs/xfs_quota.h:190:1: error: redefinition of 'xfs_quota_reserve_blkr=
es'
     190 | xfs_quota_reserve_blkres(struct xfs_inode *ip, int64_t nblks,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h:154:19: note: previous definition of 'xfs_quota_reser=
ve_blkres' was here
     154 | static inline int xfs_quota_reserve_blkres(struct xfs_inode *ip,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h: In function 'xfs_quota_reserve_blkres':
   fs/xfs/xfs_quota.h:195:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     195 |  return xfs_trans_reserve_quota_nblks(&tp, ip, nblks, 0, flags, =
NULL);
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:141:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     141 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_xchgrange.c: In function 'xfs_xchg_range_reserve_quota_blocks=
':
>> fs/xfs/xfs_xchgrange.c:409:41: error: passing argument 1 of 'xfs_trans_r=
eserve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-=
pointer-types]
     409 |   error =3D xfs_trans_reserve_quota_nblks(tpp, req->ip1,
         |                                         ^~~
         |                                         |
         |                                         struct xfs_trans **
   In file included from fs/xfs/xfs_xchgrange.c:21:
   fs/xfs/xfs_quota.h:141:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     141 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_xchgrange.c:419:41: error: passing argument 1 of 'xfs_trans_r=
eserve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-=
pointer-types]
     419 |   error =3D xfs_trans_reserve_quota_nblks(tpp, req->ip2,
         |                                         ^~~
         |                                         |
         |                                         struct xfs_trans **
   In file included from fs/xfs/xfs_xchgrange.c:21:
   fs/xfs/xfs_quota.h:141:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     141 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_xchgrange.c:435:40: error: passing argument 1 of 'xfs_trans_r=
eserve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-=
pointer-types]
     435 |  error =3D xfs_trans_reserve_quota_nblks(tpp, req->ip1, ip1_mapp=
ed, 0,
         |                                        ^~~
         |                                        |
         |                                        struct xfs_trans **
   In file included from fs/xfs/xfs_xchgrange.c:21:
   fs/xfs/xfs_quota.h:141:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     141 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_xchgrange.c:440:39: error: passing argument 1 of 'xfs_trans_r=
eserve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-=
pointer-types]
     440 |  return xfs_trans_reserve_quota_nblks(tpp, req->ip2, ip2_mapped,=
 0,
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   In file included from fs/xfs/xfs_xchgrange.c:21:
   fs/xfs/xfs_quota.h:141:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     141 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   cc1: some warnings being treated as errors


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from fs/xfs/libxfs/xfs_inode_buf.c:
   fs/xfs/libxfs/xfs_format.h:342:2: warning: Non-boolean value returned fr=
om function returning bool [returnNonBoolInBooleanFunction]
    return (sbp->sb_versionnum & XFS_SB_VERSION_ATTRBIT);
    ^
   fs/xfs/libxfs/xfs_format.h:352:2: warning: Non-boolean value returned fr=
om function returning bool [returnNonBoolInBooleanFunction]
    return (sbp->sb_versionnum & XFS_SB_VERSION_QUOTABIT);
    ^
   fs/xfs/libxfs/xfs_format.h:368:2: warning: Non-boolean value returned fr=
om function returning bool [returnNonBoolInBooleanFunction]
    return (sbp->sb_versionnum & XFS_SB_VERSION_DALIGNBIT);
    ^
   fs/xfs/libxfs/xfs_format.h:379:2: warning: Non-boolean value returned fr=
om function returning bool [returnNonBoolInBooleanFunction]
    return (sbp->sb_versionnum & XFS_SB_VERSION_SECTORBIT);
    ^
   fs/xfs/libxfs/xfs_format.h:384:2: warning: Non-boolean value returned fr=
om function returning bool [returnNonBoolInBooleanFunction]
    return (sbp->sb_versionnum & XFS_SB_VERSION_BORGBIT);
    ^
>> fs/xfs/libxfs/xfs_inode_buf.c:477:20: warning: Boolean result is used in=
 bitwise operation. Clarify expression with parentheses. [clarifyCondition]
    if (S_ISDIR(mode) & !(flags & XFS_DIFLAG_NOSYMLINKS))
                      ^

vim +477 fs/xfs/libxfs/xfs_inode_buf.c

339e1a3fcdd199 Eric Sandeen    2018-09-29  423  =

d11764606b06f3 Darrick J. Wong 2021-01-05  424  /*
d11764606b06f3 Darrick J. Wong 2021-01-05  425   * Validate all the picky r=
equirements we have for a file that claims to be
d11764606b06f3 Darrick J. Wong 2021-01-05  426   * filesystem metadata.
d11764606b06f3 Darrick J. Wong 2021-01-05  427   */
d11764606b06f3 Darrick J. Wong 2021-01-05  428  xfs_failaddr_t
d11764606b06f3 Darrick J. Wong 2021-01-05  429  xfs_dinode_verify_metaflag(
d11764606b06f3 Darrick J. Wong 2021-01-05  430  	struct xfs_mount	*mp,
d11764606b06f3 Darrick J. Wong 2021-01-05  431  	struct xfs_dinode	*dip,
d11764606b06f3 Darrick J. Wong 2021-01-05  432  	uint16_t		mode,
d11764606b06f3 Darrick J. Wong 2021-01-05  433  	uint16_t		flags,
d11764606b06f3 Darrick J. Wong 2021-01-05  434  	uint64_t		flags2)
d11764606b06f3 Darrick J. Wong 2021-01-05  435  {
d11764606b06f3 Darrick J. Wong 2021-01-05  436  	if (!xfs_sb_version_hasmet=
adir(&mp->m_sb))
d11764606b06f3 Darrick J. Wong 2021-01-05  437  		return __this_address;
d11764606b06f3 Darrick J. Wong 2021-01-05  438  =

d11764606b06f3 Darrick J. Wong 2021-01-05  439  	/* V5 filesystem only */
d11764606b06f3 Darrick J. Wong 2021-01-05  440  	if (dip->di_version < 3)
d11764606b06f3 Darrick J. Wong 2021-01-05  441  		return __this_address;
d11764606b06f3 Darrick J. Wong 2021-01-05  442  =

d11764606b06f3 Darrick J. Wong 2021-01-05  443  	/* V3 inode fields that ar=
e always zero */
d11764606b06f3 Darrick J. Wong 2021-01-05  444  	if (dip->di_flushiter || d=
ip->di_onlink)
d11764606b06f3 Darrick J. Wong 2021-01-05  445  		return __this_address;
d11764606b06f3 Darrick J. Wong 2021-01-05  446  =

d11764606b06f3 Darrick J. Wong 2021-01-05  447  	/* Metadata files can only=
 be directories or regular files */
d11764606b06f3 Darrick J. Wong 2021-01-05  448  	if (!S_ISDIR(mode) && !S_I=
SREG(mode))
d11764606b06f3 Darrick J. Wong 2021-01-05  449  		return __this_address;
d11764606b06f3 Darrick J. Wong 2021-01-05  450  =

d11764606b06f3 Darrick J. Wong 2021-01-05  451  	/* They must have zero acc=
ess permissions */
d11764606b06f3 Darrick J. Wong 2021-01-05  452  	if (mode & 0777)
d11764606b06f3 Darrick J. Wong 2021-01-05  453  		return __this_address;
d11764606b06f3 Darrick J. Wong 2021-01-05  454  =

d11764606b06f3 Darrick J. Wong 2021-01-05  455  	/* DMAPI event and state m=
asks are zero */
d11764606b06f3 Darrick J. Wong 2021-01-05  456  	if (dip->di_dmevmask || di=
p->di_dmstate)
d11764606b06f3 Darrick J. Wong 2021-01-05  457  		return __this_address;
d11764606b06f3 Darrick J. Wong 2021-01-05  458  =

d11764606b06f3 Darrick J. Wong 2021-01-05  459  	/* User, group, and projec=
t IDs must be zero */
d11764606b06f3 Darrick J. Wong 2021-01-05  460  	if (dip->di_uid || dip->di=
_gid ||
d11764606b06f3 Darrick J. Wong 2021-01-05  461  	    dip->di_projid_lo || d=
ip->di_projid_hi)
d11764606b06f3 Darrick J. Wong 2021-01-05  462  		return __this_address;
d11764606b06f3 Darrick J. Wong 2021-01-05  463  =

d11764606b06f3 Darrick J. Wong 2021-01-05  464  	/* Immutable, sync, noatim=
e, nodump, and nodefrag flags must be set */
d11764606b06f3 Darrick J. Wong 2021-01-05  465  	if (!(flags & XFS_DIFLAG_I=
MMUTABLE))
d11764606b06f3 Darrick J. Wong 2021-01-05  466  		return __this_address;
d11764606b06f3 Darrick J. Wong 2021-01-05  467  	if (!(flags & XFS_DIFLAG_S=
YNC))
d11764606b06f3 Darrick J. Wong 2021-01-05  468  		return __this_address;
d11764606b06f3 Darrick J. Wong 2021-01-05  469  	if (!(flags & XFS_DIFLAG_N=
OATIME))
d11764606b06f3 Darrick J. Wong 2021-01-05  470  		return __this_address;
d11764606b06f3 Darrick J. Wong 2021-01-05  471  	if (!(flags & XFS_DIFLAG_N=
ODUMP))
d11764606b06f3 Darrick J. Wong 2021-01-05  472  		return __this_address;
d11764606b06f3 Darrick J. Wong 2021-01-05  473  	if (!(flags & XFS_DIFLAG_N=
ODEFRAG))
d11764606b06f3 Darrick J. Wong 2021-01-05  474  		return __this_address;
d11764606b06f3 Darrick J. Wong 2021-01-05  475  =

d11764606b06f3 Darrick J. Wong 2021-01-05  476  	/* Directories must have n=
osymlinks flags set */
d11764606b06f3 Darrick J. Wong 2021-01-05 @477  	if (S_ISDIR(mode) & !(flag=
s & XFS_DIFLAG_NOSYMLINKS))
d11764606b06f3 Darrick J. Wong 2021-01-05  478  		return __this_address;
d11764606b06f3 Darrick J. Wong 2021-01-05  479  =

d11764606b06f3 Darrick J. Wong 2021-01-05  480  	/* dax flags2 must not be =
set */
d11764606b06f3 Darrick J. Wong 2021-01-05  481  	if (flags2 & XFS_DIFLAG2_D=
AX)
d11764606b06f3 Darrick J. Wong 2021-01-05  482  		return __this_address;
d11764606b06f3 Darrick J. Wong 2021-01-05  483  =

d11764606b06f3 Darrick J. Wong 2021-01-05  484  	return NULL;
d11764606b06f3 Darrick J. Wong 2021-01-05  485  }
d11764606b06f3 Darrick J. Wong 2021-01-05  486  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4907107390273192253==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
GLDmR6lJCa6yxVg3OlkjWxPYKKzOStGPJR6/VTFwkl9Kv5CvhagECy0vLoQEfBKaYNekSuBRoeKY
rWrAcjJ1Pm9TJQnxfQQhkp3eYaRgbXmwiJXpEUd69/BKORnqLKelnTPPSOGQspyJ1VY3S5VAW9a5
u7Q1BfULL/DeQ5hX3rOCNPy36tLnO7REozprnVgeKrsKQs4w0TxPIfwopnvhpDk2LePKbMeTsAX1
pKtZ6Ai+YP8pa/wT/45Yq4eOUVpUtuw6UzGA7VKgCOgCbzGfLikohD45oRzTd8d2Z31HRU9E86ui
/2VpMHltffsiEUp9H3FhuJNFdLAxoDuqHCp7HEuzq3VCz6EM04xQ73qG6mlMkOClwBXrkRp2mA7v
aOCk56rVoTomtAOzbqEjKyNys46O8xNpniSdapi0Nq+paaqjOMvSduwMRlJNcuyOhHXHxOwTi60s
hbBLsq7M7ganN4NiXDy8fr4+Pt4/XZ9/vMqOm9x4jGMHMkmzPRFivQOLdspwyQl8e1EGLSmXsoxm
mPST2XkcoMjO5AepDrYJz0VRVmPAS04rpFMJhjQ5uXwIdFh16DSsnl/fwNZ0eA6S2rq/7N315rxY
OJ3YneGj4tR0d0hMP04jVIt/YuuSMeJru2Lrbc/NzDO0SEltIJC3mJsd5wjKOXxdJhR7LO2e5Xg5
ejWMplTnNlgujjUweZoBoYaX67Nb3b34gGDu4gDV1DqzsKE2THwyvLAKqbA+bZZh4JbH8ni5xAoc
AdEITDMHniaGt1BiC4ukn68roNIbTB92fRyN6hHDTfJ4//qK+eOR4zvBFgJpKthIIxuziXep1RO8
GDe9pVg2/nkj28sroellN1+u3+FV0g2YjiWM3vz+4+1ml9+CUOhYevPt/udgYHb/+Pp88/v15ul6
/XL98r+iLlcjp+P18bu0fPoGbpEenv54HlJCQ+m3+68PT1+NB0j6JE0TPCaBAGntWFMr6qkfAT7J
I1g8kUsUOLhL0id+WrIQIcmMTHohP2yqOyyayIpbtrJ+vH8T3fLt5vD443qT3/+8vow+MOQQKIjo
si9Xw2WP/Lq06qoyx3ffUmLeJbjPwh7EXeLLNh2pWDQzTKca5rER514junNqBCCMTKOeDozfHdZF
93xFTlDGrIsFOZqE1khcmy/IylyYPJMlK+ja326Bon5D5TRLW65fSqnanFhmDZE8O1TcDCEvya5M
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
Rvt7B0Bhde4f74CtZ4eBAQA=
--===============4907107390273192253==--

