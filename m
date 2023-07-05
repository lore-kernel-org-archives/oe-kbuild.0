Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951A863C
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Jul 2023 00:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688518390; x=1720054390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U/Mity5lj45jnSe2jujYpXGxrgiFTrxypDokLSefA8Y=;
  b=ftujwHktTw1Pl7IByblFbGqkMURSqDKXE75W6j8mcdZxPHCCqvtN6FjM
   NZu2kV9tha5uLOvEygHFRZ4NpslbCHLGJl40tgtriM8Md5TCur986VI0V
   8eZLSr67ArD/9J3tTh6lLaMiK2UXwtLPcIWtEnT4lGEYvw1MFsxgkrz5F
   Us2hrEf3Pz+sMBBw24nZc6vulEivVs8KlpPYYDPFNHOXFBCf7fAgoymZO
   obn4TbDXdN7UzSwVR2kxr3XiA+mOY45r9L8VhNyTEYnah/+ka3I8JUdi9
   tTKt56DEbeHVefZv3qhlxDo08T2ognMrgn6R4S/p7oeCNESgoYDUIIpK1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="366702636"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="366702636"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 17:53:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="809061202"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="809061202"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Jul 2023 17:53:08 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGqlX-000IgJ-1e;
	Wed, 05 Jul 2023 00:53:07 +0000
Date: Wed, 5 Jul 2023 08:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 123/217]
 fs/xfs/libxfs/xfs_btree.c:163 __xfs_btree_check_lblock() warn: bitwise AND
 condition is false here
Message-ID: <202307050831.VmUDy6Kj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   c0ed27a65e17a5d3db3a6e2a4df60d4642524c8c
commit: 1eaaf704d413b36ddd665f65ebf8e876bdedd4cc [123/217] xfs: support in-memory btrees
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: riscv-randconfig-m031-20230703 (https://download.01.org/0day-ci/archive/20230705/202307050831.VmUDy6Kj-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050831.VmUDy6Kj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307050831.VmUDy6Kj-lkp@intel.com/

New smatch warnings:
fs/xfs/libxfs/xfs_btree.c:163 __xfs_btree_check_lblock() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:88 xfs_btree_check_lblock_siblings() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:232 __xfs_btree_check_sblock() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:118 xfs_btree_check_sblock_siblings() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:294 xfs_btree_check_lptr() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:308 xfs_btree_check_sptr() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:324 xfs_btree_check_ptr() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:484 xfs_btree_del_cursor() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:498 xfs_btree_buftarg() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:508 xfs_btree_bbsize() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:995 xfs_btree_readahead_lblock() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:1023 xfs_btree_readahead_sblock() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:1086 xfs_btree_ptr_to_daddr() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:1295 xfs_btree_init_block_cur() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:1337 xfs_btree_buf_to_ptr() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:1878 xfs_btree_check_block_owner() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:2495 xfs_buftarg_nr_sectors() warn: bitwise AND condition is false here
fs/xfs/xfs_health.c:511 xfs_btree_mark_sick() warn: bitwise AND condition is false here

Old smatch warnings:
fs/xfs/libxfs/xfs_btree.c:486 xfs_btree_del_cursor() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:744 xfs_buf_get_map() error: we previously assumed 'bp' could be null (see line 726)
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: inconsistent indenting
fs/xfs/xfs_buf.c:1637 _xfs_buf_ioapply() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:2011 xfs_free_buftarg() warn: bitwise AND condition is false here

vim +163 fs/xfs/libxfs/xfs_btree.c

^1da177e4c3f41 fs/xfs/xfs_btree.c        Linus Torvalds    2005-04-16   57  
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   58  /*
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   59   * These sibling pointer checks are optimised for null sibling pointers. This
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   60   * happens a lot, and we don't need to byte swap at runtime if the sibling
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   61   * pointer is NULL.
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   62   *
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   63   * These are explicitly marked at inline because the cost of calling them as
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   64   * functions instead of inlining them is about 36 bytes extra code per call site
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   65   * on x86-64. Yes, gcc-11 fails to inline them, and explicit inlining of these
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   66   * two sibling check functions reduces the compiled code size by over 300
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   67   * bytes.
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   68   */
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   69  static inline xfs_failaddr_t
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   70  xfs_btree_check_lblock_siblings(
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   71  	struct xfs_mount	*mp,
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   72  	struct xfs_btree_cur	*cur,
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   73  	int			level,
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   74  	xfs_fsblock_t		fsb,
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   75  	__be64			dsibling)
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   76  {
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   77  	xfs_fsblock_t		sibling;
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   78  
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   79  	if (dsibling == cpu_to_be64(NULLFSBLOCK))
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   80  		return NULL;
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   81  
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   82  	sibling = be64_to_cpu(dsibling);
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   83  	if (sibling == fsb)
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   84  		return __this_address;
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   85  	if (level >= 0) {
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   86  		if (!xfs_btree_check_lptr(cur, sibling, level + 1))
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   87  			return __this_address;
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  @88  	} else if (cur && (cur->bc_flags & XFS_BTREE_IN_XFILE)) {
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06   89  		if (!xfbtree_verify_xfileoff(cur, sibling))
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06   90  			return __this_address;
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   91  	} else {
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   92  		if (!xfs_verify_fsbno(mp, sibling))
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   93  			return __this_address;
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   94  	}
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   95  
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   96  	return NULL;
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   97  }
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04   98  
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27   99  static inline xfs_failaddr_t
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  100  xfs_btree_check_sblock_siblings(
0800169e3e2c97 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-07-07  101  	struct xfs_perag	*pag,
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  102  	struct xfs_btree_cur	*cur,
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  103  	int			level,
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  104  	xfs_agblock_t		agbno,
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27  105  	__be32			dsibling)
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  106  {
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27  107  	xfs_agblock_t		sibling;
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27  108  
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27  109  	if (dsibling == cpu_to_be32(NULLAGBLOCK))
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  110  		return NULL;
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27  111  
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27  112  	sibling = be32_to_cpu(dsibling);
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  113  	if (sibling == agbno)
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  114  		return __this_address;
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  115  	if (level >= 0) {
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  116  		if (!xfs_btree_check_sptr(cur, sibling, level + 1))
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  117  			return __this_address;
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06 @118  	} else if (cur && (cur->bc_flags & XFS_BTREE_IN_XFILE)) {
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  119  		if (!xfbtree_verify_xfileoff(cur, sibling))
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  120  			return __this_address;
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  121  	} else {
0800169e3e2c97 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-07-07  122  		if (!xfs_verify_agbno(pag, sibling))
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  123  			return __this_address;
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  124  	}
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  125  	return NULL;
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  126  }
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  127  
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  128  /*
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  129   * Check a long btree block header.  Return the address of the failing check,
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  130   * or NULL if everything is ok.
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  131   */
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  132  xfs_failaddr_t
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  133  __xfs_btree_check_lblock(
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  134  	struct xfs_btree_cur	*cur,
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  135  	struct xfs_btree_block	*block,
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  136  	int			level,
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  137  	struct xfs_buf		*bp)
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  138  {
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  139  	struct xfs_mount	*mp = cur->bc_mp;
af7d20fd83d9e2 fs/xfs/libxfs/xfs_btree.c Eric Sandeen      2017-01-27  140  	xfs_btnum_t		btnum = cur->bc_btnum;
38c26bfd90e199 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2021-08-18  141  	int			crc = xfs_has_crc(mp);
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  142  	xfs_failaddr_t		fa;
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  143  	xfs_fsblock_t		fsb = NULLFSBLOCK;
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  144  
af7d20fd83d9e2 fs/xfs/libxfs/xfs_btree.c Eric Sandeen      2017-01-27  145  	if (crc) {
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  146  		if (!uuid_equal(&block->bb_u.l.bb_uuid, &mp->m_sb.sb_meta_uuid))
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  147  			return __this_address;
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  148  		if (block->bb_u.l.bb_blkno !=
9343ee76909e3f fs/xfs/libxfs/xfs_btree.c Dave Chinner      2021-08-18  149  		    cpu_to_be64(bp ? xfs_buf_daddr(bp) : XFS_BUF_DADDR_NULL))
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  150  			return __this_address;
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  151  		if (block->bb_u.l.bb_pad != cpu_to_be32(0))
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  152  			return __this_address;
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  153  	}
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  154  
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  155  	if (be32_to_cpu(block->bb_magic) != xfs_btree_magic(crc, btnum))
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  156  		return __this_address;
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  157  	if (be16_to_cpu(block->bb_level) != level)
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  158  		return __this_address;
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  159  	if (be16_to_cpu(block->bb_numrecs) >
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  160  	    cur->bc_ops->get_maxrecs(cur, level))
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  161  		return __this_address;
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  162  
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06 @163  	if ((cur->bc_flags & XFS_BTREE_IN_XFILE) && bp)
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  164  		fsb = xfbtree_buf_to_xfoff(cur, bp);
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  165  	else if (bp)
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  166  		fsb = XFS_DADDR_TO_FSB(mp, xfs_buf_daddr(bp));
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  167  
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  168  	fa = xfs_btree_check_lblock_siblings(mp, cur, level, fsb,
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27  169  			block->bb_u.l.bb_leftsib);
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  170  	if (!fa)
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  171  		fa = xfs_btree_check_lblock_siblings(mp, cur, level, fsb,
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27  172  				block->bb_u.l.bb_rightsib);
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  173  	return fa;
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  174  }
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  175  
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  176  /* Check a long btree block header. */
4483eb566b2c04 fs/xfs/libxfs/xfs_btree.c Christoph Hellwig 2017-11-06  177  static int
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  178  xfs_btree_check_lblock(
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  179  	struct xfs_btree_cur	*cur,
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  180  	struct xfs_btree_block	*block,
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  181  	int			level,
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  182  	struct xfs_buf		*bp)
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  183  {
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  184  	struct xfs_mount	*mp = cur->bc_mp;
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  185  	xfs_failaddr_t		fa;
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  186  
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  187  	fa = __xfs_btree_check_lblock(cur, block, level, bp);
a71895c5dad1ab fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2019-11-11  188  	if (XFS_IS_CORRUPT(mp, fa != NULL) ||
a71895c5dad1ab fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2019-11-11  189  	    XFS_TEST_ERROR(false, mp, XFS_ERRTAG_BTREE_CHECK_LBLOCK)) {
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  190  		if (bp)
0b1b213fcf3a84 fs/xfs/xfs_btree.c        Christoph Hellwig 2009-12-14  191  			trace_xfs_btree_corrupt(bp, _RET_IP_);
260cdc846a3986 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  192  		xfs_btree_mark_sick(cur);
2451337dd04390 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2014-06-25  193  		return -EFSCORRUPTED;
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  194  	}
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  195  	return 0;
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  196  }
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  197  
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  198  /*
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  199   * Check a short btree block header.  Return the address of the failing check,
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  200   * or NULL if everything is ok.
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  201   */
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  202  xfs_failaddr_t
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  203  __xfs_btree_check_sblock(
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  204  	struct xfs_btree_cur	*cur,
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  205  	struct xfs_btree_block	*block,
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  206  	int			level,
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  207  	struct xfs_buf		*bp)
^1da177e4c3f41 fs/xfs/xfs_btree.c        Linus Torvalds    2005-04-16  208  {
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  209  	struct xfs_mount	*mp = cur->bc_mp;
0800169e3e2c97 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-07-07  210  	struct xfs_perag	*pag = cur->bc_ag.pag;
af7d20fd83d9e2 fs/xfs/libxfs/xfs_btree.c Eric Sandeen      2017-01-27  211  	xfs_btnum_t		btnum = cur->bc_btnum;
38c26bfd90e199 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2021-08-18  212  	int			crc = xfs_has_crc(mp);
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  213  	xfs_failaddr_t		fa;
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  214  	xfs_agblock_t		agbno = NULLAGBLOCK;
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  215  
af7d20fd83d9e2 fs/xfs/libxfs/xfs_btree.c Eric Sandeen      2017-01-27  216  	if (crc) {
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  217  		if (!uuid_equal(&block->bb_u.s.bb_uuid, &mp->m_sb.sb_meta_uuid))
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  218  			return __this_address;
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  219  		if (block->bb_u.s.bb_blkno !=
9343ee76909e3f fs/xfs/libxfs/xfs_btree.c Dave Chinner      2021-08-18  220  		    cpu_to_be64(bp ? xfs_buf_daddr(bp) : XFS_BUF_DADDR_NULL))
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  221  			return __this_address;
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  222  	}
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  223  
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  224  	if (be32_to_cpu(block->bb_magic) != xfs_btree_magic(crc, btnum))
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  225  		return __this_address;
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  226  	if (be16_to_cpu(block->bb_level) != level)
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  227  		return __this_address;
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  228  	if (be16_to_cpu(block->bb_numrecs) >
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  229  	    cur->bc_ops->get_maxrecs(cur, level))
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  230  		return __this_address;
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  231  
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06 @232  	if ((cur->bc_flags & XFS_BTREE_IN_XFILE) && bp) {
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  233  		pag = NULL;
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  234  		agbno = xfbtree_buf_to_xfoff(cur, bp);
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  235  	} else if (bp) {
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  236  		agbno = xfs_daddr_to_agbno(mp, xfs_buf_daddr(bp));
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  237  	}
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  238  
0800169e3e2c97 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-07-07  239  	fa = xfs_btree_check_sblock_siblings(pag, cur, level, agbno,
5672225e8f2a87 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-27  240  			block->bb_u.s.bb_leftsib);
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  241  	if (!fa)
0800169e3e2c97 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-07-07  242  		fa = xfs_btree_check_sblock_siblings(pag, cur, level, agbno,
0800169e3e2c97 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-07-07  243  				block->bb_u.s.bb_rightsib);
dc04db2aa7c930 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-05-04  244  	return fa;
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  245  }
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  246  
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  247  /* Check a short btree block header. */
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  248  STATIC int
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  249  xfs_btree_check_sblock(
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  250  	struct xfs_btree_cur	*cur,
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  251  	struct xfs_btree_block	*block,
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  252  	int			level,
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  253  	struct xfs_buf		*bp)
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  254  {
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  255  	struct xfs_mount	*mp = cur->bc_mp;
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  256  	xfs_failaddr_t		fa;
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  257  
52c732eee78b47 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  258  	fa = __xfs_btree_check_sblock(cur, block, level, bp);
a71895c5dad1ab fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2019-11-11  259  	if (XFS_IS_CORRUPT(mp, fa != NULL) ||
a71895c5dad1ab fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2019-11-11  260  	    XFS_TEST_ERROR(false, mp, XFS_ERRTAG_BTREE_CHECK_SBLOCK)) {
^1da177e4c3f41 fs/xfs/xfs_btree.c        Linus Torvalds    2005-04-16  261  		if (bp)
0b1b213fcf3a84 fs/xfs/xfs_btree.c        Christoph Hellwig 2009-12-14  262  			trace_xfs_btree_corrupt(bp, _RET_IP_);
260cdc846a3986 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  263  		xfs_btree_mark_sick(cur);
2451337dd04390 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2014-06-25  264  		return -EFSCORRUPTED;
^1da177e4c3f41 fs/xfs/xfs_btree.c        Linus Torvalds    2005-04-16  265  	}
^1da177e4c3f41 fs/xfs/xfs_btree.c        Linus Torvalds    2005-04-16  266  	return 0;
^1da177e4c3f41 fs/xfs/xfs_btree.c        Linus Torvalds    2005-04-16  267  }
^1da177e4c3f41 fs/xfs/xfs_btree.c        Linus Torvalds    2005-04-16  268  
^1da177e4c3f41 fs/xfs/xfs_btree.c        Linus Torvalds    2005-04-16  269  /*
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  270   * Debug routine: check that block header is ok.
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  271   */
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  272  int
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  273  xfs_btree_check_block(
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  274  	struct xfs_btree_cur	*cur,	/* btree cursor */
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  275  	struct xfs_btree_block	*block,	/* generic btree block pointer */
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  276  	int			level,	/* level of the btree block */
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  277  	struct xfs_buf		*bp)	/* buffer containing block, if any */
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  278  {
7cc95a821df8f0 fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  279  	if (cur->bc_flags & XFS_BTREE_LONG_PTRS)
7cc95a821df8f0 fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  280  		return xfs_btree_check_lblock(cur, block, level, bp);
7cc95a821df8f0 fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  281  	else
7cc95a821df8f0 fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  282  		return xfs_btree_check_sblock(cur, block, level, bp);
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  283  }
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  284  
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  285  /* Check that this long pointer is valid and points within the fs. */
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  286  bool
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  287  xfs_btree_check_lptr(
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  288  	struct xfs_btree_cur	*cur,
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  289  	xfs_fsblock_t		fsbno,
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  290  	int			level)
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  291  {
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  292  	if (level <= 0)
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  293  		return false;
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06 @294  	if (cur->bc_flags & XFS_BTREE_IN_XFILE)
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  295  		return xfbtree_verify_xfileoff(cur, fsbno);
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  296  	return xfs_verify_fsbno(cur->bc_mp, fsbno);
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  297  }
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  298  
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  299  /* Check that this short pointer is valid and points within the AG. */
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  300  bool
^1da177e4c3f41 fs/xfs/xfs_btree.c        Linus Torvalds    2005-04-16  301  xfs_btree_check_sptr(
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  302  	struct xfs_btree_cur	*cur,
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  303  	xfs_agblock_t		agbno,
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  304  	int			level)
^1da177e4c3f41 fs/xfs/xfs_btree.c        Linus Torvalds    2005-04-16  305  {
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  306  	if (level <= 0)
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  307  		return false;
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06 @308  	if (cur->bc_flags & XFS_BTREE_IN_XFILE)
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  309  		return xfbtree_verify_xfileoff(cur, agbno);
0800169e3e2c97 fs/xfs/libxfs/xfs_btree.c Dave Chinner      2022-07-07  310  	return xfs_verify_agbno(cur->bc_ag.pag, agbno);
^1da177e4c3f41 fs/xfs/xfs_btree.c        Linus Torvalds    2005-04-16  311  }
^1da177e4c3f41 fs/xfs/xfs_btree.c        Linus Torvalds    2005-04-16  312  
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  313  /*
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  314   * Check that a given (indexed) btree pointer at a certain level of a
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  315   * btree is valid and doesn't point past where it should.
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  316   */
4483eb566b2c04 fs/xfs/libxfs/xfs_btree.c Christoph Hellwig 2017-11-06  317  static int
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  318  xfs_btree_check_ptr(
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  319  	struct xfs_btree_cur		*cur,
32816fd7920b32 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2021-08-12  320  	const union xfs_btree_ptr	*ptr,
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  321  	int				index,
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  322  	int				level)
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  323  {
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06 @324  	if (cur->bc_flags & XFS_BTREE_IN_XFILE)
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  325  		return xfbtree_check_ptr(cur, ptr, index, level);
1eaaf704d413b3 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  326  
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  327  	if (cur->bc_flags & XFS_BTREE_LONG_PTRS) {
85ae01098c1a6a fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2018-06-03  328  		if (xfs_btree_check_lptr(cur, be64_to_cpu((&ptr->l)[index]),
85ae01098c1a6a fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2018-06-03  329  				level))
85ae01098c1a6a fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2018-06-03  330  			return 0;
85ae01098c1a6a fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2018-06-03  331  		xfs_err(cur->bc_mp,
85ae01098c1a6a fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2018-06-03  332  "Inode %llu fork %d: Corrupt btree %d pointer at level %d index %d.",
92219c292af8dd fs/xfs/libxfs/xfs_btree.c Dave Chinner      2020-03-10  333  				cur->bc_ino.ip->i_ino,
92219c292af8dd fs/xfs/libxfs/xfs_btree.c Dave Chinner      2020-03-10  334  				cur->bc_ino.whichfork, cur->bc_btnum,
85ae01098c1a6a fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2018-06-03  335  				level, index);
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  336  	} else {
85ae01098c1a6a fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2018-06-03  337  		if (xfs_btree_check_sptr(cur, be32_to_cpu((&ptr->s)[index]),
85ae01098c1a6a fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2018-06-03  338  				level))
85ae01098c1a6a fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2018-06-03  339  			return 0;
85ae01098c1a6a fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2018-06-03  340  		xfs_err(cur->bc_mp,
85ae01098c1a6a fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2018-06-03  341  "AG %u: Corrupt btree %d pointer at level %d index %d.",
50f02fe3338d3f fs/xfs/libxfs/xfs_btree.c Dave Chinner      2021-06-02  342  				cur->bc_ag.pag->pag_agno, cur->bc_btnum,
85ae01098c1a6a fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2018-06-03  343  				level, index);
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  344  	}
f135761a73b188 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2017-10-17  345  
260cdc846a3986 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  346  	xfs_btree_mark_sick(cur);
85ae01098c1a6a fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2018-06-03  347  	return -EFSCORRUPTED;
a23f6ef8ce966a fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  348  }
4cbae4b816fd61 fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2018-06-03  349  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
