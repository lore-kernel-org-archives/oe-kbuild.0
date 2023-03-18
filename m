Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C9FA4D
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679131422; x=1710667422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B3x72Sba/Femsi5qqHwiGW8udrsHm5mcXvPoLuF7e6g=;
  b=KrDUlg00uq0g3V1zzJUmtnLGJT0H849pvwSiP+U7Jk6s1Hit8gQWOd1X
   7VFBz3Was9tgVjIDYvcVAkRKgrXeg8wZjbVLdYfVruE4qa9V7cD5mafDm
   u1sqNYGywg+BPFKHd2fHnqmlKpC/FMiTqIK84iPlB939MqnxllBE+HTLN
   bVW4uLX5OEh9ryDRA5OYHL/93udiSt/pgIbc9s4wdsurmH3o1BvJUU9hX
   gZtBPZnedoJQrX1EelJpErYchvmsxaWHeeAwP4k0p5bNQG62P2oQrpA3C
   J6gIfKmcgPl2ASp5TU0HrXCT7e3Cq+HUbjpQeN20jHAir0OfWAt4DBWYC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="366128379"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="366128379"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 02:23:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630555810"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="630555810"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Mar 2023 02:23:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdSmp-0009yE-3D;
	Sat, 18 Mar 2023 09:23:40 +0000
Date: Sat, 18 Mar 2023 17:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:xfile-page-caching 140/274]
 fs/xfs/libxfs/xfs_bmap_btree.c:653:9: warning: use of NULL 'ifp' where
 non-null expected [CWE-476]
Message-ID: <202303181750.Cn9v6RSF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/xfs/libxfs/xfs_bmap_btree.c:653:9: warning: use of NULL 'ifp' where non-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   67bb67e9a9941400f950d75d77991bf99c54ed05
commit: 544f0ba5469ed386627cf718de28af73eeafc71d [140/274] xfs: repair inode fork block mapping data structures
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20230316 (https://download.01.org/0day-ci/archive/20230318/202303181750.Cn9v6RSF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=544f0ba5469ed386627cf718de28af73eeafc71d
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs xfile-page-caching
        git checkout 544f0ba5469ed386627cf718de28af73eeafc71d
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303181750.Cn9v6RSF-lkp@intel.com/

gcc_analyzer warnings: (new ones prefixed by >>)
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from fs/xfs/kmem.h:9,
                    from fs/xfs/xfs_linux.h:24,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/libxfs/xfs_bmap_btree.c:6:
   fs/xfs/libxfs/xfs_bmap_btree.c: In function 'xfs_bmbt_init_cursor':
   fs/xfs/libxfs/xfs_bmap_btree.c:582:42: warning: dereference of NULL 'ifp' [CWE-476] [-Wanalyzer-null-dereference]
     582 |         cur->bc_nlevels = be16_to_cpu(ifp->if_broot->bb_level) + 1;
         |                                       ~~~^~~~~~~~~~
   include/uapi/linux/swab.h:102:54: note: in definition of macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:97:21: note: in expansion of macro '__be16_to_cpu'
      97 | #define be16_to_cpu __be16_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:582:27: note: in expansion of macro 'be16_to_cpu'
     582 |         cur->bc_nlevels = be16_to_cpu(ifp->if_broot->bb_level) + 1;
         |                           ^~~~~~~~~~~
     'xfs_bmbt_init_cursor': events 1-2
       |
       |  571 | xfs_bmbt_init_cursor(
       |      | ^~~~~~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'xfs_bmbt_init_cursor'
       |......
       |  580 |         cur = xfs_bmbt_init_common(mp, tp, ip, whichfork);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (2) calling 'xfs_bmbt_init_common' from 'xfs_bmbt_init_cursor'
       |
       +--> 'xfs_bmbt_init_common': event 3
              |
              |  541 | xfs_bmbt_init_common(
              |      | ^~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (3) entry to 'xfs_bmbt_init_common'
              |
            'xfs_bmbt_init_common': event 4
              |
              |fs/xfs/xfs_linux.h:215:33:
              |  215 |         (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE__))
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                                 |
              |      |                                 (4) following 'false' branch (when '______r != 0')...
   fs/xfs/libxfs/xfs_bmap_btree.c:549:9: note: in expansion of macro 'ASSERT'
              |  549 |         ASSERT(whichfork != XFS_COW_FORK);
              |      |         ^~~~~~
              |
            'xfs_bmbt_init_common': event 5
              |
              |  551 |         cur = xfs_btree_alloc_cursor(mp, tp, XFS_BTNUM_BMAP,
              |      |         ^~~
              |      |         |
              |      |         (5) ...to here
              |
       <------+
       |
     'xfs_bmbt_init_cursor': event 6
       |
       |  580 |         cur = xfs_bmbt_init_common(mp, tp, ip, whichfork);
       |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (6) returning to 'xfs_bmbt_init_cursor' from 'xfs_bmbt_init_common'
       |
     'xfs_bmbt_init_cursor': event 7
       |
       |  582 |         cur->bc_nlevels = be16_to_cpu(ifp->if_broot->bb_level) + 1;
       |      |                                       ~~~^~~~~~~~~~
       |      |                                          |
       |      |                                          (7) dereference of NULL 'ifp'
   include/uapi/linux/swab.h:102:54: note: in definition of macro '__swab16'
       |  102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
       |      |                                                      ^
   include/linux/byteorder/generic.h:97:21: note: in expansion of macro '__be16_to_cpu'
       |   97 | #define be16_to_cpu __be16_to_cpu
       |      |                     ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:582:27: note: in expansion of macro 'be16_to_cpu'
       |  582 |         cur->bc_nlevels = be16_to_cpu(ifp->if_broot->bb_level) + 1;
       |      |                           ^~~~~~~~~~~
       |
   fs/xfs/libxfs/xfs_bmap_btree.c: In function 'xfs_bmbt_stage_cursor':
   fs/xfs/libxfs/xfs_bmap_btree.c:613:34: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     613 |         struct xfs_btree_ops    *ops;
         |                                  ^~~
     'xfs_bmbt_stage_cursor': event 1
       |
       |  613 |         struct xfs_btree_ops    *ops;
       |      |                                  ^~~
       |      |                                  |
       |      |                                  (1) use of uninitialized value '<unknown>' here
       |
   fs/xfs/libxfs/xfs_bmap_btree.c: In function 'xfs_bmbt_commit_staged_btree':
>> fs/xfs/libxfs/xfs_bmap_btree.c:653:9: warning: use of NULL 'ifp' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     653 |         memcpy(ifp, ifake->if_fork, sizeof(struct xfs_ifork));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'xfs_bmbt_commit_staged_btree': event 1
       |
       |  653 |         memcpy(ifp, ifake->if_fork, sizeof(struct xfs_ifork));
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (1) argument 1 ('ifp') NULL where non-null expected
       |
   In file included from include/linux/string.h:20,
                    from include/linux/uuid.h:11,
                    from fs/xfs/xfs_linux.h:10:
   arch/arm/include/asm/string.h:20:15: note: argument 1 of 'memcpy' must be non-null
      20 | extern void * memcpy(void *, const void *, __kernel_size_t);
         |               ^~~~~~

vim +/ifp +653 fs/xfs/libxfs/xfs_bmap_btree.c

544f0ba5469ed3 Darrick J. Wong 2023-03-06  624  
544f0ba5469ed3 Darrick J. Wong 2023-03-06  625  /*
544f0ba5469ed3 Darrick J. Wong 2023-03-06  626   * Swap in the new inode fork root.  Once we pass this point the newly rebuilt
544f0ba5469ed3 Darrick J. Wong 2023-03-06  627   * mappings are in place and we have to kill off any old btree blocks.
544f0ba5469ed3 Darrick J. Wong 2023-03-06  628   */
544f0ba5469ed3 Darrick J. Wong 2023-03-06  629  void
544f0ba5469ed3 Darrick J. Wong 2023-03-06  630  xfs_bmbt_commit_staged_btree(
544f0ba5469ed3 Darrick J. Wong 2023-03-06  631  	struct xfs_btree_cur	*cur,
544f0ba5469ed3 Darrick J. Wong 2023-03-06  632  	struct xfs_trans	*tp,
544f0ba5469ed3 Darrick J. Wong 2023-03-06  633  	int			whichfork)
544f0ba5469ed3 Darrick J. Wong 2023-03-06  634  {
544f0ba5469ed3 Darrick J. Wong 2023-03-06  635  	struct xbtree_ifakeroot	*ifake = cur->bc_ino.ifake;
544f0ba5469ed3 Darrick J. Wong 2023-03-06  636  	struct xfs_ifork	*ifp;
544f0ba5469ed3 Darrick J. Wong 2023-03-06  637  	static const short	brootflag[2] =
544f0ba5469ed3 Darrick J. Wong 2023-03-06  638  		{ XFS_ILOG_DBROOT, XFS_ILOG_ABROOT };
544f0ba5469ed3 Darrick J. Wong 2023-03-06  639  	static const short	extflag[2] =
544f0ba5469ed3 Darrick J. Wong 2023-03-06  640  		{ XFS_ILOG_DEXT, XFS_ILOG_AEXT };
544f0ba5469ed3 Darrick J. Wong 2023-03-06  641  	int			flags = XFS_ILOG_CORE;
544f0ba5469ed3 Darrick J. Wong 2023-03-06  642  
544f0ba5469ed3 Darrick J. Wong 2023-03-06  643  	ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
544f0ba5469ed3 Darrick J. Wong 2023-03-06  644  	ASSERT(whichfork != XFS_COW_FORK);
544f0ba5469ed3 Darrick J. Wong 2023-03-06  645  
544f0ba5469ed3 Darrick J. Wong 2023-03-06  646  	/*
544f0ba5469ed3 Darrick J. Wong 2023-03-06  647  	 * Free any resources hanging off the real fork, then shallow-copy the
544f0ba5469ed3 Darrick J. Wong 2023-03-06  648  	 * staging fork's contents into the real fork to transfer everything
544f0ba5469ed3 Darrick J. Wong 2023-03-06  649  	 * we just built.
544f0ba5469ed3 Darrick J. Wong 2023-03-06  650  	 */
544f0ba5469ed3 Darrick J. Wong 2023-03-06  651  	ifp = xfs_ifork_ptr(cur->bc_ino.ip, whichfork);
544f0ba5469ed3 Darrick J. Wong 2023-03-06  652  	xfs_idestroy_fork(ifp);
544f0ba5469ed3 Darrick J. Wong 2023-03-06 @653  	memcpy(ifp, ifake->if_fork, sizeof(struct xfs_ifork));
544f0ba5469ed3 Darrick J. Wong 2023-03-06  654  
544f0ba5469ed3 Darrick J. Wong 2023-03-06  655  	switch (ifp->if_format) {
544f0ba5469ed3 Darrick J. Wong 2023-03-06  656  	case XFS_DINODE_FMT_EXTENTS:
544f0ba5469ed3 Darrick J. Wong 2023-03-06  657  		flags |= extflag[whichfork];
544f0ba5469ed3 Darrick J. Wong 2023-03-06  658  		break;
544f0ba5469ed3 Darrick J. Wong 2023-03-06  659  	case XFS_DINODE_FMT_BTREE:
544f0ba5469ed3 Darrick J. Wong 2023-03-06  660  		flags |= brootflag[whichfork];
544f0ba5469ed3 Darrick J. Wong 2023-03-06  661  		break;
544f0ba5469ed3 Darrick J. Wong 2023-03-06  662  	default:
544f0ba5469ed3 Darrick J. Wong 2023-03-06  663  		ASSERT(0);
544f0ba5469ed3 Darrick J. Wong 2023-03-06  664  		break;
544f0ba5469ed3 Darrick J. Wong 2023-03-06  665  	}
544f0ba5469ed3 Darrick J. Wong 2023-03-06  666  	xfs_trans_log_inode(tp, cur->bc_ino.ip, flags);
544f0ba5469ed3 Darrick J. Wong 2023-03-06  667  	xfs_btree_commit_ifakeroot(cur, tp, whichfork, &xfs_bmbt_ops);
544f0ba5469ed3 Darrick J. Wong 2023-03-06  668  }
544f0ba5469ed3 Darrick J. Wong 2023-03-06  669  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
