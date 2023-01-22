Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25F7648
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jan 2023 11:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674386306; x=1705922306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SfXXW/EabbwQVOXiFGzqT3rrkCZnTn5P85lJyV5+v6Q=;
  b=lJdxtlTV4q6kgNLGbpCREgYByK9vFRFoePCHaJvN+O+3sHu2S+fU3X9b
   tnSbFo23uCuw9OFkVrl1AJjy+37pVxWjp7o8gu6EcsYojYNrKBDlTeexw
   xy0aWtwNDF/TI9oOAvJRp6SFOAYl6LrLb0oFiUoPC0WwFS1SXukRYP+l0
   LrYU4EYONSgd6DhCW8lQcrbwBh9lH49pbeMCShMvfD/z+LWyo7BmexYcU
   7iflANNDl8kyvLLaBIOasWYNQv53W7N4UOVI5pdqzZ65YsSL5mwf25is+
   gK4YyWmrI3+BAVoGQAsIER9Yp65eAcjRhTCdp6d3KGNAlLS4dzrR2eo6g
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="327975361"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; 
   d="scan'208";a="327975361"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 03:18:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="729706409"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; 
   d="scan'208";a="729706409"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Jan 2023 03:18:24 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJYMi-0004yg-0E;
	Sun, 22 Jan 2023 11:18:24 +0000
Date: Sun, 22 Jan 2023 19:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:xfile-page-caching 136/266]
 fs/xfs/libxfs/xfs_bmap_btree.c:671:9: warning: use of NULL 'ifp' where
 non-null expected [CWE-476]
Message-ID: <202301221901.L5VNTY3K-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: fs/xfs/libxfs/xfs_bmap_btree.c:671:9: warning: use of NULL 'ifp' where non-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   5ac6d5f53f18d0486ac3713be490eb8c186ff344
commit: ef59bcb59a37c7fca95b6c6cd73eb6c91fac4bc0 [136/266] xfs: repair inode fork block mapping data structures
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-c002-20230122 (https://download.01.org/0day-ci/archive/20230122/202301221901.L5VNTY3K-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=ef59bcb59a37c7fca95b6c6cd73eb6c91fac4bc0
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs xfile-page-caching
        git checkout ef59bcb59a37c7fca95b6c6cd73eb6c91fac4bc0
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
   fs/xfs/libxfs/xfs_bmap_btree.c:600:42: warning: dereference of NULL 'ifp' [CWE-476] [-Wanalyzer-null-dereference]
     600 |         cur->bc_nlevels = be16_to_cpu(ifp->if_broot->bb_level) + 1;
         |                                       ~~~^~~~~~~~~~
   include/uapi/linux/swab.h:102:54: note: in definition of macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:97:21: note: in expansion of macro '__be16_to_cpu'
      97 | #define be16_to_cpu __be16_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:600:27: note: in expansion of macro 'be16_to_cpu'
     600 |         cur->bc_nlevels = be16_to_cpu(ifp->if_broot->bb_level) + 1;
         |                           ^~~~~~~~~~~
     'xfs_bmbt_init_cursor': events 1-2
       |
       |  589 | xfs_bmbt_init_cursor(
       |      | ^~~~~~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'xfs_bmbt_init_cursor'
       |......
       |  598 |         cur = xfs_bmbt_init_common(mp, tp, ip, whichfork);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (2) calling 'xfs_bmbt_init_common' from 'xfs_bmbt_init_cursor'
       |
       +--> 'xfs_bmbt_init_common': event 3
              |
              |  559 | xfs_bmbt_init_common(
              |      | ^~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (3) entry to 'xfs_bmbt_init_common'
              |
            'xfs_bmbt_init_common': event 4
              |
              |fs/xfs/xfs_linux.h:214:33:
              |  214 |         (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE__))
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                                 |
              |      |                                 (4) following 'false' branch...
   fs/xfs/libxfs/xfs_bmap_btree.c:567:9: note: in expansion of macro 'ASSERT'
              |  567 |         ASSERT(whichfork != XFS_COW_FORK);
              |      |         ^~~~~~
              |
            'xfs_bmbt_init_common': event 5
              |
              |  570 |                         mp->m_bm_maxlevels[whichfork], xfs_bmbt_cur_cache);
              |      |                         ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
              |      |                                           |
              |      |                                           (5) ...to here
              |
       <------+
       |
     'xfs_bmbt_init_cursor': event 6
       |
       |  598 |         cur = xfs_bmbt_init_common(mp, tp, ip, whichfork);
       |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (6) returning to 'xfs_bmbt_init_cursor' from 'xfs_bmbt_init_common'
       |
     'xfs_bmbt_init_cursor': event 7
       |
       |  600 |         cur->bc_nlevels = be16_to_cpu(ifp->if_broot->bb_level) + 1;
       |      |                                       ~~~^~~~~~~~~~
       |      |                                          |
       |      |                                          (7) dereference of NULL 'ifp'
   include/uapi/linux/swab.h:102:54: note: in definition of macro '__swab16'
       |  102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
       |      |                                                      ^
   include/linux/byteorder/generic.h:97:21: note: in expansion of macro '__be16_to_cpu'
       |   97 | #define be16_to_cpu __be16_to_cpu
       |      |                     ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:600:27: note: in expansion of macro 'be16_to_cpu'
       |  600 |         cur->bc_nlevels = be16_to_cpu(ifp->if_broot->bb_level) + 1;
       |      |                           ^~~~~~~~~~~
       |
   fs/xfs/libxfs/xfs_bmap_btree.c: In function 'xfs_bmbt_stage_cursor':
   fs/xfs/libxfs/xfs_bmap_btree.c:631:34: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     631 |         struct xfs_btree_ops    *ops;
         |                                  ^~~
     'xfs_bmbt_stage_cursor': event 1
       |
       |  631 |         struct xfs_btree_ops    *ops;
       |      |                                  ^~~
       |      |                                  |
       |      |                                  (1) use of uninitialized value '<unknown>' here
       |
   fs/xfs/libxfs/xfs_bmap_btree.c: In function 'xfs_bmbt_commit_staged_btree':
>> fs/xfs/libxfs/xfs_bmap_btree.c:671:9: warning: use of NULL 'ifp' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     671 |         memcpy(ifp, ifake->if_fork, sizeof(struct xfs_ifork));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'xfs_bmbt_commit_staged_btree': event 1
       |
       |  671 |         memcpy(ifp, ifake->if_fork, sizeof(struct xfs_ifork));
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (1) argument 1 ('ifp') NULL where non-null expected
       |
   In file included from include/linux/string.h:20,
                    from include/linux/uuid.h:12,
                    from fs/xfs/xfs_linux.h:10:
   arch/arm/include/asm/string.h:20:15: note: argument 1 of 'memcpy' must be non-null
      20 | extern void * memcpy(void *, const void *, __kernel_size_t);
         |               ^~~~~~
   In file included from include/linux/string.h:5:
   fs/xfs/libxfs/xfs_bmap_btree.c: In function 'xfs_bmbt_change_owner':
   fs/xfs/libxfs/xfs_bmap_btree.c:768:44: warning: dereference of NULL '0' [CWE-476] [-Wanalyzer-null-dereference]
     768 |         ASSERT(xfs_ifork_ptr(ip, whichfork)->if_format == XFS_DINODE_FMT_BTREE);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   fs/xfs/libxfs/xfs_bmap_btree.c:768:9: note: in expansion of macro 'ASSERT'
     768 |         ASSERT(xfs_ifork_ptr(ip, whichfork)->if_format == XFS_DINODE_FMT_BTREE);
         |         ^~~~~~
     'xfs_bmbt_change_owner': event 1
       |
       |  768 |         ASSERT(xfs_ifork_ptr(ip, whichfork)->if_format == XFS_DINODE_FMT_BTREE);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
       |      |                                            |
       |      |                                            (1) dereference of NULL 'xfs_ifork_ptr(ip,  whichfork)'
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
       |   77 | # define likely(x)      __builtin_expect(!!(x), 1)
       |      |                                             ^
   fs/xfs/libxfs/xfs_bmap_btree.c:768:9: note: in expansion of macro 'ASSERT'
       |  768 |         ASSERT(xfs_ifork_ptr(ip, whichfork)->if_format == XFS_DINODE_FMT_BTREE);
       |      |         ^~~~~~
       |

vim +/ifp +671 fs/xfs/libxfs/xfs_bmap_btree.c

ef59bcb59a37c7 Darrick J. Wong 2022-07-14  642  
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  643  /*
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  644   * Swap in the new inode fork root.  Once we pass this point the newly rebuilt
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  645   * mappings are in place and we have to kill off any old btree blocks.
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  646   */
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  647  void
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  648  xfs_bmbt_commit_staged_btree(
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  649  	struct xfs_btree_cur	*cur,
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  650  	struct xfs_trans	*tp,
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  651  	int			whichfork)
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  652  {
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  653  	struct xbtree_ifakeroot	*ifake = cur->bc_ino.ifake;
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  654  	struct xfs_ifork	*ifp;
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  655  	static const short	brootflag[2] =
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  656  		{ XFS_ILOG_DBROOT, XFS_ILOG_ABROOT };
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  657  	static const short	extflag[2] =
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  658  		{ XFS_ILOG_DEXT, XFS_ILOG_AEXT };
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  659  	int			flags = XFS_ILOG_CORE;
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  660  
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  661  	ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  662  	ASSERT(whichfork != XFS_COW_FORK);
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  663  
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  664  	/*
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  665  	 * Free any resources hanging off the real fork, then shallow-copy the
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  666  	 * staging fork's contents into the real fork to transfer everything
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  667  	 * we just built.
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  668  	 */
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  669  	ifp = xfs_ifork_ptr(cur->bc_ino.ip, whichfork);
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  670  	xfs_idestroy_fork(ifp);
ef59bcb59a37c7 Darrick J. Wong 2022-07-14 @671  	memcpy(ifp, ifake->if_fork, sizeof(struct xfs_ifork));
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  672  
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  673  	switch (ifp->if_format) {
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  674  	case XFS_DINODE_FMT_EXTENTS:
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  675  		flags |= extflag[whichfork];
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  676  		break;
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  677  	case XFS_DINODE_FMT_BTREE:
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  678  		flags |= brootflag[whichfork];
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  679  		break;
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  680  	default:
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  681  		ASSERT(0);
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  682  		break;
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  683  	}
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  684  	xfs_trans_log_inode(tp, cur->bc_ino.ip, flags);
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  685  	xfs_btree_commit_ifakeroot(cur, tp, whichfork, &xfs_bmbt_ops);
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  686  }
ef59bcb59a37c7 Darrick J. Wong 2022-07-14  687  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
