Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578F417C7
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Apr 2023 04:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680322573; x=1711858573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8bcp0g6PaBt/qyN6pwQ5NSqZV+l+HK1jDVZvaQRt6c=;
  b=j9KScl30SA9cDdnG7aBMhKnnS5b3yEoFO8/iQQOPktV/u2T7aoJctawm
   zhl//y2lJYlCSncHvCgoarSElGWc0QY87YPsz8Ef3vCeEtYjVfoENVckN
   pcxc7dwSIZ6z9CvaH4DeEZ2nX0sVs7HOYOxavWHwo4p1Qu5FsBQd2XsgK
   kPCiqCFByDmNgeATDsel3pvZ2occlCa1iOl64x94zCrlYpf/muo/ei0dg
   72KOksXPYY7x+MFcvsCwJQXnZVWeq5kp9x0SS6R+WRlO9VaerS5pkQDHn
   vWBK9/HDSRIj1HbXg0xG9PAvnL5hN/GZFA+hJFJ6NKvknuJCbOZ5snORL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="339113046"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="339113046"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 21:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="685327148"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="685327148"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Mar 2023 21:16:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piSew-000MR7-0w;
	Sat, 01 Apr 2023 04:16:10 +0000
Date: Sat, 1 Apr 2023 12:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:xfile-page-caching 149/287]
 fs/xfs/libxfs/xfs_bmap_btree.c:653:9: warning: use of NULL 'ifp' where
 non-null expected [CWE-476]
Message-ID: <202304011220.hA5lFBVr-lkp@intel.com>
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
head:   10b2657dfdd633f83d3de6eba27b8e093cf0caa6
commit: c8b467b62e13f716a045428dcc9fdf41e14818f4 [149/287] xfs: repair inode fork block mapping data structures
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-c002-20230330 (https://download.01.org/0day-ci/archive/20230401/202304011220.hA5lFBVr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=c8b467b62e13f716a045428dcc9fdf41e14818f4
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs xfile-page-caching
        git checkout c8b467b62e13f716a045428dcc9fdf41e14818f4
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304011220.hA5lFBVr-lkp@intel.com/

gcc_analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/arm/include/uapi/asm/byteorder.h:20,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arm/include/asm/bitops.h:269,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
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
   include/uapi/linux/byteorder/big_endian.h:43:51: note: in definition of macro '__be16_to_cpu'
      43 | #define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
         |                                                   ^
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
              |      |                                 (4) following 'false' branch...
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
   include/uapi/linux/byteorder/big_endian.h:43:51: note: in definition of macro '__be16_to_cpu'
       |   43 | #define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
       |      |                                                   ^
   fs/xfs/libxfs/xfs_bmap_btree.c:582:27: note: in expansion of macro 'be16_to_cpu'
       |  582 |         cur->bc_nlevels = be16_to_cpu(ifp->if_broot->bb_level) + 1;
       |      |                           ^~~~~~~~~~~
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
   In file included from include/linux/string.h:5:
   fs/xfs/libxfs/xfs_bmap_btree.c: In function 'xfs_bmbt_change_owner':
   fs/xfs/libxfs/xfs_bmap_btree.c:750:44: warning: dereference of NULL '0' [CWE-476] [-Wanalyzer-null-dereference]
     750 |         ASSERT(xfs_ifork_ptr(ip, whichfork)->if_format == XFS_DINODE_FMT_BTREE);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   fs/xfs/libxfs/xfs_bmap_btree.c:750:9: note: in expansion of macro 'ASSERT'
     750 |         ASSERT(xfs_ifork_ptr(ip, whichfork)->if_format == XFS_DINODE_FMT_BTREE);
         |         ^~~~~~
     'xfs_bmbt_change_owner': event 1
       |
       |  750 |         ASSERT(xfs_ifork_ptr(ip, whichfork)->if_format == XFS_DINODE_FMT_BTREE);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
       |      |                                            |
       |      |                                            (1) dereference of NULL 'xfs_ifork_ptr(ip,  whichfork)'
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
       |   77 | # define likely(x)      __builtin_expect(!!(x), 1)
       |      |                                             ^
   fs/xfs/libxfs/xfs_bmap_btree.c:750:9: note: in expansion of macro 'ASSERT'
       |  750 |         ASSERT(xfs_ifork_ptr(ip, whichfork)->if_format == XFS_DINODE_FMT_BTREE);
       |      |         ^~~~~~
       |

vim +/ifp +653 fs/xfs/libxfs/xfs_bmap_btree.c

c8b467b62e13f7 Darrick J. Wong 2023-03-06  624  
c8b467b62e13f7 Darrick J. Wong 2023-03-06  625  /*
c8b467b62e13f7 Darrick J. Wong 2023-03-06  626   * Swap in the new inode fork root.  Once we pass this point the newly rebuilt
c8b467b62e13f7 Darrick J. Wong 2023-03-06  627   * mappings are in place and we have to kill off any old btree blocks.
c8b467b62e13f7 Darrick J. Wong 2023-03-06  628   */
c8b467b62e13f7 Darrick J. Wong 2023-03-06  629  void
c8b467b62e13f7 Darrick J. Wong 2023-03-06  630  xfs_bmbt_commit_staged_btree(
c8b467b62e13f7 Darrick J. Wong 2023-03-06  631  	struct xfs_btree_cur	*cur,
c8b467b62e13f7 Darrick J. Wong 2023-03-06  632  	struct xfs_trans	*tp,
c8b467b62e13f7 Darrick J. Wong 2023-03-06  633  	int			whichfork)
c8b467b62e13f7 Darrick J. Wong 2023-03-06  634  {
c8b467b62e13f7 Darrick J. Wong 2023-03-06  635  	struct xbtree_ifakeroot	*ifake = cur->bc_ino.ifake;
c8b467b62e13f7 Darrick J. Wong 2023-03-06  636  	struct xfs_ifork	*ifp;
c8b467b62e13f7 Darrick J. Wong 2023-03-06  637  	static const short	brootflag[2] =
c8b467b62e13f7 Darrick J. Wong 2023-03-06  638  		{ XFS_ILOG_DBROOT, XFS_ILOG_ABROOT };
c8b467b62e13f7 Darrick J. Wong 2023-03-06  639  	static const short	extflag[2] =
c8b467b62e13f7 Darrick J. Wong 2023-03-06  640  		{ XFS_ILOG_DEXT, XFS_ILOG_AEXT };
c8b467b62e13f7 Darrick J. Wong 2023-03-06  641  	int			flags = XFS_ILOG_CORE;
c8b467b62e13f7 Darrick J. Wong 2023-03-06  642  
c8b467b62e13f7 Darrick J. Wong 2023-03-06  643  	ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
c8b467b62e13f7 Darrick J. Wong 2023-03-06  644  	ASSERT(whichfork != XFS_COW_FORK);
c8b467b62e13f7 Darrick J. Wong 2023-03-06  645  
c8b467b62e13f7 Darrick J. Wong 2023-03-06  646  	/*
c8b467b62e13f7 Darrick J. Wong 2023-03-06  647  	 * Free any resources hanging off the real fork, then shallow-copy the
c8b467b62e13f7 Darrick J. Wong 2023-03-06  648  	 * staging fork's contents into the real fork to transfer everything
c8b467b62e13f7 Darrick J. Wong 2023-03-06  649  	 * we just built.
c8b467b62e13f7 Darrick J. Wong 2023-03-06  650  	 */
c8b467b62e13f7 Darrick J. Wong 2023-03-06  651  	ifp = xfs_ifork_ptr(cur->bc_ino.ip, whichfork);
c8b467b62e13f7 Darrick J. Wong 2023-03-06  652  	xfs_idestroy_fork(ifp);
c8b467b62e13f7 Darrick J. Wong 2023-03-06 @653  	memcpy(ifp, ifake->if_fork, sizeof(struct xfs_ifork));
c8b467b62e13f7 Darrick J. Wong 2023-03-06  654  
c8b467b62e13f7 Darrick J. Wong 2023-03-06  655  	switch (ifp->if_format) {
c8b467b62e13f7 Darrick J. Wong 2023-03-06  656  	case XFS_DINODE_FMT_EXTENTS:
c8b467b62e13f7 Darrick J. Wong 2023-03-06  657  		flags |= extflag[whichfork];
c8b467b62e13f7 Darrick J. Wong 2023-03-06  658  		break;
c8b467b62e13f7 Darrick J. Wong 2023-03-06  659  	case XFS_DINODE_FMT_BTREE:
c8b467b62e13f7 Darrick J. Wong 2023-03-06  660  		flags |= brootflag[whichfork];
c8b467b62e13f7 Darrick J. Wong 2023-03-06  661  		break;
c8b467b62e13f7 Darrick J. Wong 2023-03-06  662  	default:
c8b467b62e13f7 Darrick J. Wong 2023-03-06  663  		ASSERT(0);
c8b467b62e13f7 Darrick J. Wong 2023-03-06  664  		break;
c8b467b62e13f7 Darrick J. Wong 2023-03-06  665  	}
c8b467b62e13f7 Darrick J. Wong 2023-03-06  666  	xfs_trans_log_inode(tp, cur->bc_ino.ip, flags);
c8b467b62e13f7 Darrick J. Wong 2023-03-06  667  	xfs_btree_commit_ifakeroot(cur, tp, whichfork, &xfs_bmbt_ops);
c8b467b62e13f7 Darrick J. Wong 2023-03-06  668  }
c8b467b62e13f7 Darrick J. Wong 2023-03-06  669  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
