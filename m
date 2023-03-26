Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019D0370
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Mar 2023 02:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679798488; x=1711334488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XOZKOaH/ok7pHdg5WAhZrti1HrFwq4gJyrOhyWTPh4c=;
  b=iKeJWkcYdgqMHfsVa84JolfgwiCWAQJ4fIFFDhWs+TKkVx8NUqw40wKp
   Zu6ZuDUlsa6FUVS2LZSXlhStuS6y/LUhHvrk3rfJd0yEk1nvgJWVtt13j
   qMlSbiqntZ1OkgiSAQpNHD7RlCndbtVcSPVr20030U/verYxX+G1mB8cA
   S1e9/W3Q8K2RTGETkqnkjiS05s2bi/KPw5OEmG9X2nQ/uc4hVfmwkWnFD
   S526WRTef05LqIdOSq0N8QxR6l+TpoG8hW+yBTawS9hjDo5C/MewAbYLf
   y9xLJTQoQoloG1KODOTHzGUIeqvb88fQ6ILq1mMlq9JbvAP3CgNLW4aRU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="402637043"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="402637043"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 19:41:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="747588823"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="747588823"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Mar 2023 19:41:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgGJy-000GpT-20;
	Sun, 26 Mar 2023 02:41:26 +0000
Date: Sun, 26 Mar 2023 10:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 281/287] fs/xfs/scrub/listxattr.c:194
 xchk_xattr_find_leftmost_leaf() warn: missing unwind goto?
Message-ID: <202303261056.NlQDcFhx-lkp@intel.com>
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
head:   10b2657dfdd633f83d3de6eba27b8e093cf0caa6
commit: be507348ae4390cb248d9700aa160ba8c0f10ec1 [281/287] xfs: create an xattr iteration function for scrub
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: microblaze-randconfig-m041-20230326 (https://download.01.org/0day-ci/archive/20230326/202303261056.NlQDcFhx-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303261056.NlQDcFhx-lkp@intel.com/

smatch warnings:
fs/xfs/scrub/listxattr.c:194 xchk_xattr_find_leftmost_leaf() warn: missing unwind goto?

vim +194 fs/xfs/scrub/listxattr.c

be507348ae4390 Darrick J. Wong 2023-03-06  125  
be507348ae4390 Darrick J. Wong 2023-03-06  126  /* Find the leftmost leaf in the xattr dabtree. */
be507348ae4390 Darrick J. Wong 2023-03-06  127  STATIC int
be507348ae4390 Darrick J. Wong 2023-03-06  128  xchk_xattr_find_leftmost_leaf(
be507348ae4390 Darrick J. Wong 2023-03-06  129  	struct xfs_scrub		*sc,
be507348ae4390 Darrick J. Wong 2023-03-06  130  	struct xfs_inode		*ip,
be507348ae4390 Darrick J. Wong 2023-03-06  131  	struct xbitmap			*seen_blocks,
be507348ae4390 Darrick J. Wong 2023-03-06  132  	struct xfs_buf			**leaf_bpp)
be507348ae4390 Darrick J. Wong 2023-03-06  133  {
be507348ae4390 Darrick J. Wong 2023-03-06  134  	struct xfs_da3_icnode_hdr	nodehdr;
be507348ae4390 Darrick J. Wong 2023-03-06  135  	struct xfs_mount		*mp = sc->mp;
be507348ae4390 Darrick J. Wong 2023-03-06  136  	struct xfs_trans		*tp = sc->tp;
be507348ae4390 Darrick J. Wong 2023-03-06  137  	struct xfs_da_intnode		*node;
be507348ae4390 Darrick J. Wong 2023-03-06  138  	struct xfs_da_node_entry	*btree;
be507348ae4390 Darrick J. Wong 2023-03-06  139  	struct xfs_buf			*bp;
be507348ae4390 Darrick J. Wong 2023-03-06  140  	xfs_failaddr_t			fa;
be507348ae4390 Darrick J. Wong 2023-03-06  141  	xfs_dablk_t			blkno = 0;
be507348ae4390 Darrick J. Wong 2023-03-06  142  	unsigned int			expected_level = 0;
be507348ae4390 Darrick J. Wong 2023-03-06  143  	int				error;
be507348ae4390 Darrick J. Wong 2023-03-06  144  
be507348ae4390 Darrick J. Wong 2023-03-06  145  	for (;;) {
be507348ae4390 Darrick J. Wong 2023-03-06  146  		uint64_t		len;
be507348ae4390 Darrick J. Wong 2023-03-06  147  		uint16_t		magic;
be507348ae4390 Darrick J. Wong 2023-03-06  148  
be507348ae4390 Darrick J. Wong 2023-03-06  149  		error = xfs_da3_node_read(tp, ip, blkno, &bp, XFS_ATTR_FORK);
be507348ae4390 Darrick J. Wong 2023-03-06  150  		if (error)
be507348ae4390 Darrick J. Wong 2023-03-06  151  			return error;
be507348ae4390 Darrick J. Wong 2023-03-06  152  
be507348ae4390 Darrick J. Wong 2023-03-06  153  		node = bp->b_addr;
be507348ae4390 Darrick J. Wong 2023-03-06  154  		magic = be16_to_cpu(node->hdr.info.magic);
be507348ae4390 Darrick J. Wong 2023-03-06  155  		if (magic == XFS_ATTR_LEAF_MAGIC ||
be507348ae4390 Darrick J. Wong 2023-03-06  156  		    magic == XFS_ATTR3_LEAF_MAGIC)
be507348ae4390 Darrick J. Wong 2023-03-06  157  			break;
be507348ae4390 Darrick J. Wong 2023-03-06  158  
be507348ae4390 Darrick J. Wong 2023-03-06  159  		error = -EFSCORRUPTED;
be507348ae4390 Darrick J. Wong 2023-03-06  160  		if (magic != XFS_DA_NODE_MAGIC &&
be507348ae4390 Darrick J. Wong 2023-03-06  161  		    magic != XFS_DA3_NODE_MAGIC)
be507348ae4390 Darrick J. Wong 2023-03-06  162  			goto out_buf;
be507348ae4390 Darrick J. Wong 2023-03-06  163  
be507348ae4390 Darrick J. Wong 2023-03-06  164  		fa = xfs_da3_node_header_check(bp, ip->i_ino);
be507348ae4390 Darrick J. Wong 2023-03-06  165  		if (fa)
be507348ae4390 Darrick J. Wong 2023-03-06  166  			goto out_buf;
be507348ae4390 Darrick J. Wong 2023-03-06  167  
be507348ae4390 Darrick J. Wong 2023-03-06  168  		xfs_da3_node_hdr_from_disk(mp, &nodehdr, node);
be507348ae4390 Darrick J. Wong 2023-03-06  169  
be507348ae4390 Darrick J. Wong 2023-03-06  170  		if (nodehdr.count == 0 || nodehdr.level >= XFS_DA_NODE_MAXDEPTH)
be507348ae4390 Darrick J. Wong 2023-03-06  171  			goto out_buf;
be507348ae4390 Darrick J. Wong 2023-03-06  172  
be507348ae4390 Darrick J. Wong 2023-03-06  173  		/* Check the level from the root node. */
be507348ae4390 Darrick J. Wong 2023-03-06  174  		if (blkno == 0)
be507348ae4390 Darrick J. Wong 2023-03-06  175  			expected_level = nodehdr.level - 1;
be507348ae4390 Darrick J. Wong 2023-03-06  176  		else if (expected_level != nodehdr.level)
be507348ae4390 Darrick J. Wong 2023-03-06  177  			goto out_buf;
be507348ae4390 Darrick J. Wong 2023-03-06  178  		else
be507348ae4390 Darrick J. Wong 2023-03-06  179  			expected_level--;
be507348ae4390 Darrick J. Wong 2023-03-06  180  
be507348ae4390 Darrick J. Wong 2023-03-06  181  		/* Remember that we've seen this node. */
be507348ae4390 Darrick J. Wong 2023-03-06  182  		error = xbitmap_set(seen_blocks, blkno, 1);
be507348ae4390 Darrick J. Wong 2023-03-06  183  		if (error)
be507348ae4390 Darrick J. Wong 2023-03-06  184  			goto out_buf;
be507348ae4390 Darrick J. Wong 2023-03-06  185  
be507348ae4390 Darrick J. Wong 2023-03-06  186  		/* Find the next level towards the leaves of the dabtree. */
be507348ae4390 Darrick J. Wong 2023-03-06  187  		btree = nodehdr.btree;
be507348ae4390 Darrick J. Wong 2023-03-06  188  		blkno = be32_to_cpu(btree->before);
be507348ae4390 Darrick J. Wong 2023-03-06  189  		xfs_trans_brelse(tp, bp);
be507348ae4390 Darrick J. Wong 2023-03-06  190  
be507348ae4390 Darrick J. Wong 2023-03-06  191  		/* Make sure we haven't seen this new block already. */
be507348ae4390 Darrick J. Wong 2023-03-06  192  		len = 1;
be507348ae4390 Darrick J. Wong 2023-03-06  193  		if (xbitmap_test(seen_blocks, blkno, &len))
be507348ae4390 Darrick J. Wong 2023-03-06 @194  			return -EFSCORRUPTED;
be507348ae4390 Darrick J. Wong 2023-03-06  195  	}
be507348ae4390 Darrick J. Wong 2023-03-06  196  
be507348ae4390 Darrick J. Wong 2023-03-06  197  	error = -EFSCORRUPTED;
be507348ae4390 Darrick J. Wong 2023-03-06  198  	fa = xfs_attr3_leaf_header_check(bp, ip->i_ino);
be507348ae4390 Darrick J. Wong 2023-03-06  199  	if (fa)
be507348ae4390 Darrick J. Wong 2023-03-06  200  		goto out_buf;
be507348ae4390 Darrick J. Wong 2023-03-06  201  
be507348ae4390 Darrick J. Wong 2023-03-06  202  	if (expected_level != 0)
be507348ae4390 Darrick J. Wong 2023-03-06  203  		goto out_buf;
be507348ae4390 Darrick J. Wong 2023-03-06  204  
be507348ae4390 Darrick J. Wong 2023-03-06  205  	/* Remember that we've seen this leaf. */
be507348ae4390 Darrick J. Wong 2023-03-06  206  	error = xbitmap_set(seen_blocks, blkno, 1);
be507348ae4390 Darrick J. Wong 2023-03-06  207  	if (error)
be507348ae4390 Darrick J. Wong 2023-03-06  208  		goto out_buf;
be507348ae4390 Darrick J. Wong 2023-03-06  209  
be507348ae4390 Darrick J. Wong 2023-03-06  210  	*leaf_bpp = bp;
be507348ae4390 Darrick J. Wong 2023-03-06  211  	return 0;
be507348ae4390 Darrick J. Wong 2023-03-06  212  
be507348ae4390 Darrick J. Wong 2023-03-06  213  out_buf:
be507348ae4390 Darrick J. Wong 2023-03-06  214  	xfs_trans_brelse(tp, bp);
be507348ae4390 Darrick J. Wong 2023-03-06  215  	return error;
be507348ae4390 Darrick J. Wong 2023-03-06  216  }
be507348ae4390 Darrick J. Wong 2023-03-06  217  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
