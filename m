Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD887E
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Dec 2022 17:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671382943; x=1702918943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HZi+rTAf71FYACpS3jbYiLjL8bBjGBBiXYe3RXrIWdU=;
  b=FD7HXWTKXv9lxXNm+rI9IsdhkDYtfot22Al2X5yhjOBi9HvFeqyhACUA
   2EXufoMSOVXS02YAGfzuhOPR2IBGAEK4/vVAyXYkqx27clYz01pWTZlhJ
   +zd79Wj8Q2cWwB0QPRfR1TIVrZxJCy0BghQbwBls/aKG9tPcNGQIFSV5x
   j2k2n5EZPEmtSyF8eacboNnG5hheMnakwQoPnSKCU9Fd/kM97a09dPfsd
   Be8q2EDrShVeK2RAKRkbF3N2k+37MEX1rq5NpsFY/mQLAyPMAXoNZqyGD
   lrl1s4J9hVKZeEV/P6LJFkD++sdausx+Ih/yuRbhvLD6W39YZDYLALPOZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="298896476"
X-IronPort-AV: E=Sophos;i="5.96,254,1665471600"; 
   d="scan'208";a="298896476"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2022 09:02:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="680991388"
X-IronPort-AV: E=Sophos;i="5.96,254,1665471600"; 
   d="scan'208";a="680991388"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Dec 2022 09:02:22 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p6x3N-0008NW-1h;
	Sun, 18 Dec 2022 17:02:21 +0000
Date: Mon, 19 Dec 2022 01:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:vectorized-scrub 403/556]
 fs/xfs/libxfs/xfs_rtgroup.h:46:72: warning: Parameter 'rtg' can be declared
 as pointer to const [constParameter]
Message-ID: <202212190011.K1WQbeBl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/xfs/libxfs/xfs_rtgroup.h:46:72: warning: Parameter 'rtg' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   957abd6304af2759b5e5564977f40272364cf712
commit: 78b20eb9e5a6a7430cb8c75403344cf99c8bcf90 [403/556] xfs: update primary realtime super every time we update the primary fs super
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 78b20eb9e5a6a7430cb8c75403344cf99c8bcf90
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   fs/xfs/libxfs/xfs_sb.c:540:21: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
    if (!!sbp->sb_unit ^ has_dalign) {
                       ^
>> fs/xfs/libxfs/xfs_rtgroup.h:46:72: warning: Parameter 'rtg' can be declared as pointer to const [constParameter]
   static inline struct xfs_rtgroup *xfs_rtgroup_bump(struct xfs_rtgroup *rtg)
                                                                          ^
   fs/xfs/libxfs/xfs_format.h:469:4: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
   fs/xfs/libxfs/xfs_sb.c:178:34: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    if (sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_METADIR)
                                    ^
   fs/xfs/libxfs/xfs_sb.c:221:39: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    if (xfs_sb_has_incompat_feature(sbp, XFS_SB_FEAT_INCOMPAT_UNKNOWN)) {
                                         ^
   fs/xfs/libxfs/xfs_sb.c:225:6: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
        XFS_SB_FEAT_INCOMPAT_UNKNOWN));
        ^
   fs/xfs/libxfs/xfs_sb.c:281:39: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    if (xfs_sb_has_incompat_feature(sbp, XFS_SB_FEAT_INCOMPAT_UNKNOWN)) {
                                         ^
   fs/xfs/libxfs/xfs_sb.c:285:6: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
        XFS_SB_FEAT_INCOMPAT_UNKNOWN));
        ^
   fs/xfs/libxfs/xfs_sb.c:289:4: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      XFS_SB_FEAT_INCOMPAT_LOG_UNKNOWN)) {
      ^
   fs/xfs/libxfs/xfs_sb.c:293:6: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
        XFS_SB_FEAT_INCOMPAT_LOG_UNKNOWN));
        ^
   fs/xfs/libxfs/xfs_sb.c:315:36: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    if (!(sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_METADIR)) {
                                      ^
   fs/xfs/libxfs/xfs_sb.c:694:33: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    if (to->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_METADIR) {
                                   ^
   fs/xfs/libxfs/xfs_sb.c:868:35: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    if (from->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_METADIR) {
                                     ^
   fs/xfs/libxfs/xfs_sb.c:1333:17: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     geo->flags |= XFS_FSOP_GEOM_FLAGS_ATOMIC_SWAP;
                   ^
   fs/xfs/libxfs/xfs_format.h:469:4: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
   fs/xfs/libxfs/xfs_sb.c:178:34: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
    if (sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_METADIR)
                                    ^
   fs/xfs/libxfs/xfs_sb.c:221:39: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
    if (xfs_sb_has_incompat_feature(sbp, XFS_SB_FEAT_INCOMPAT_UNKNOWN)) {
                                         ^
   fs/xfs/libxfs/xfs_sb.c:225:6: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
        XFS_SB_FEAT_INCOMPAT_UNKNOWN));
        ^
   fs/xfs/libxfs/xfs_sb.c:281:39: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
    if (xfs_sb_has_incompat_feature(sbp, XFS_SB_FEAT_INCOMPAT_UNKNOWN)) {
                                         ^
   fs/xfs/libxfs/xfs_sb.c:285:6: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
        XFS_SB_FEAT_INCOMPAT_UNKNOWN));
        ^
   fs/xfs/libxfs/xfs_sb.c:289:4: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
      XFS_SB_FEAT_INCOMPAT_LOG_UNKNOWN)) {
      ^
   fs/xfs/libxfs/xfs_sb.c:293:6: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
        XFS_SB_FEAT_INCOMPAT_LOG_UNKNOWN));
        ^
   fs/xfs/libxfs/xfs_sb.c:315:36: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
    if (!(sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_METADIR)) {
                                      ^
   fs/xfs/libxfs/xfs_sb.c:694:33: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
    if (to->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_METADIR) {
                                   ^
   fs/xfs/libxfs/xfs_sb.c:868:35: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
    if (from->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_METADIR) {
                                     ^
   fs/xfs/libxfs/xfs_sb.c:1333:17: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
     geo->flags |= XFS_FSOP_GEOM_FLAGS_ATOMIC_SWAP;
                   ^

vim +/rtg +46 fs/xfs/libxfs/xfs_rtgroup.h

84dad104ec4c5f Darrick J. Wong 2022-08-11  31  
84dad104ec4c5f Darrick J. Wong 2022-08-11  32  #ifdef CONFIG_XFS_RT
84dad104ec4c5f Darrick J. Wong 2022-08-11  33  struct xfs_rtgroup *xfs_rtgroup_get(struct xfs_mount *mp, xfs_rgnumber_t rgno);
84dad104ec4c5f Darrick J. Wong 2022-08-11  34  struct xfs_rtgroup *xfs_rtgroup_bump(struct xfs_rtgroup *rtg);
84dad104ec4c5f Darrick J. Wong 2022-08-11  35  void xfs_rtgroup_put(struct xfs_rtgroup *rtg);
84dad104ec4c5f Darrick J. Wong 2022-08-11  36  int xfs_initialize_rtgroups(struct xfs_mount *mp, xfs_rgnumber_t rgcount);
84dad104ec4c5f Darrick J. Wong 2022-08-11  37  void xfs_free_rtgroups(struct xfs_mount *mp);
84dad104ec4c5f Darrick J. Wong 2022-08-11  38  #else
84dad104ec4c5f Darrick J. Wong 2022-08-11  39  static inline struct xfs_rtgroup *
84dad104ec4c5f Darrick J. Wong 2022-08-11  40  xfs_rtgroup_get(
84dad104ec4c5f Darrick J. Wong 2022-08-11  41  	struct xfs_mount	*mp,
84dad104ec4c5f Darrick J. Wong 2022-08-11  42  	xfs_rgnumber_t		rgno)
84dad104ec4c5f Darrick J. Wong 2022-08-11  43  {
84dad104ec4c5f Darrick J. Wong 2022-08-11  44  	return NULL;
84dad104ec4c5f Darrick J. Wong 2022-08-11  45  }
84dad104ec4c5f Darrick J. Wong 2022-08-11 @46  static inline struct xfs_rtgroup *xfs_rtgroup_bump(struct xfs_rtgroup *rtg)
84dad104ec4c5f Darrick J. Wong 2022-08-11  47  {
84dad104ec4c5f Darrick J. Wong 2022-08-11  48  	ASSERT(rtg == NULL);
84dad104ec4c5f Darrick J. Wong 2022-08-11  49  	return NULL;
84dad104ec4c5f Darrick J. Wong 2022-08-11  50  }
84dad104ec4c5f Darrick J. Wong 2022-08-11  51  # define xfs_rtgroup_put(rtg)			((void)0)
84dad104ec4c5f Darrick J. Wong 2022-08-11  52  # define xfs_initialize_rtgroups(mp, rgcount)	(0)
84dad104ec4c5f Darrick J. Wong 2022-08-11  53  # define xfs_free_rtgroups(mp)			((void)0)
84dad104ec4c5f Darrick J. Wong 2022-08-11  54  #endif /* CONFIG_XFS_RT */
84dad104ec4c5f Darrick J. Wong 2022-08-11  55  

:::::: The code at line 46 was first introduced by commit
:::::: 84dad104ec4c5f909226645f96ad64c9fdbb587a xfs: create incore realtime group structures

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
