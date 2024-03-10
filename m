Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EFE11187
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Mar 2024 08:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710057666; cv=none; b=EJFUKJbg2eoz+cXTmCkAOK4fx9hYxz12WPNZfc3QNb2D8FsF/9EQnPRuddqZoB9SN+XRJKTO9qE/4qJXyrUakpjLtZZQ68u4tXM83Yh2BIiX1kxhNApIh4dTikk37HoniP35tnYM4kTXQuitC73no+LErgx/HRAaSLAAEHN50Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710057666; c=relaxed/simple;
	bh=AnnTQjENULMD62EafesjbI6BNfjOIOSpVs8p4i2VVyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=htNr/hRx8VDf4+drUJLeWC49ShRGOUBl9EpHIQVLjQViqyrjwUN1kW3iYlezmueruS/z9WllhDXyWotJlBQXjSGh4ScSdR79kVDvn9E7VSRP30/u7lralhMmHnq0O4zf4nl0zSAtCU6WElhIyZa6LteSYwGM/1huVuwQLFK+o04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxxrO+nq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxxrO+nq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710057662; x=1741593662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AnnTQjENULMD62EafesjbI6BNfjOIOSpVs8p4i2VVyY=;
  b=BxxrO+nqvjxE3Xa5G7bDXXxz6Y7zaBkWmQOhpV0V6dOSGx5KTiIGXe0E
   xKpjReN9wi6ER7I54Qif/yxDV3wOf+u6KAKbp7CY3EE6P77O2DfpIrfUY
   4X4ytrkC8Vo3xnhiu3d7X4xR3RUhMqSoPTcv1Cx19lyKZjcI4KxeYCMIu
   SyQuYCAobFT6jjg3xWA8UuJACm/FwWOkxdfVxQ7E9cBtJmKYlEhkXeDTy
   /2x9d6I7a2wC4iaUu7iUIyoeA/HP0L3NP2cZLY3nLTznOzyjQZAE16XDW
   Eq3XM6C8B1YeA6lNI5axJuXXsFHRiYTpO5j0wSzb/15vr/XPvTcPSOqru
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="22192072"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="22192072"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 00:01:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="11267841"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Mar 2024 00:01:00 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjE77-00085P-1w;
	Sun, 10 Mar 2024 08:00:57 +0000
Date: Sun, 10 Mar 2024 16:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:fsverity-cleanups-6.9 7/37] fs/verity/verify.c:208
 verify_data_block() error: uninitialized symbol 'err'.
Message-ID: <202403101516.ySR7iu7Z-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fsverity-cleanups-6.9
head:   16654e84b3e67ad84f5461574994b653c849406d
commit: aeaffdfa6a9871c1ad1ecd755664ecfe5d8a51dc [7/37] fsverity: support block-based Merkle tree caching
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-randconfig-141-20240310 (https://download.01.org/0day-ci/archive/20240310/202403101516.ySR7iu7Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403101516.ySR7iu7Z-lkp@intel.com/

smatch warnings:
fs/verity/verify.c:208 verify_data_block() error: uninitialized symbol 'err'.

vim +/err +208 fs/verity/verify.c

5306892a50bf4c Eric Biggers       2022-12-23   89  
5306892a50bf4c Eric Biggers       2022-12-23   90  /*
5306892a50bf4c Eric Biggers       2022-12-23   91   * Verify a single data block against the file's Merkle tree.
8a1d0f9cacc997 Eric Biggers       2019-07-22   92   *
5306892a50bf4c Eric Biggers       2022-12-23   93   * In principle, we need to verify the entire path to the root node.  However,
5306892a50bf4c Eric Biggers       2022-12-23   94   * for efficiency the filesystem may cache the hash blocks.  Therefore we need
5306892a50bf4c Eric Biggers       2022-12-23   95   * only ascend the tree until an already-verified hash block is seen, and then
5306892a50bf4c Eric Biggers       2022-12-23   96   * verify the path to that block.
8a1d0f9cacc997 Eric Biggers       2019-07-22   97   *
5306892a50bf4c Eric Biggers       2022-12-23   98   * Return: %true if the data block is valid, else %false.
8a1d0f9cacc997 Eric Biggers       2019-07-22   99   */
5306892a50bf4c Eric Biggers       2022-12-23  100  static bool
5306892a50bf4c Eric Biggers       2022-12-23  101  verify_data_block(struct inode *inode, struct fsverity_info *vi,
8fcd94add6c5c9 Eric Biggers       2023-05-15  102  		  const void *data, u64 data_pos, unsigned long max_ra_pages)
8a1d0f9cacc997 Eric Biggers       2019-07-22  103  {
8a1d0f9cacc997 Eric Biggers       2019-07-22  104  	const struct merkle_tree_params *params = &vi->tree_params;
8a1d0f9cacc997 Eric Biggers       2019-07-22  105  	const unsigned int hsize = params->digest_size;
8a1d0f9cacc997 Eric Biggers       2019-07-22  106  	int level;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  107  	int err;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  108  	int num_ra_pages;
8a1d0f9cacc997 Eric Biggers       2019-07-22  109  	u8 _want_hash[FS_VERITY_MAX_DIGEST_SIZE];
8a1d0f9cacc997 Eric Biggers       2019-07-22  110  	const u8 *want_hash;
8a1d0f9cacc997 Eric Biggers       2019-07-22  111  	u8 real_hash[FS_VERITY_MAX_DIGEST_SIZE];
5306892a50bf4c Eric Biggers       2022-12-23  112  	/* The hash blocks that are traversed, indexed by level */
5306892a50bf4c Eric Biggers       2022-12-23  113  	struct {
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  114  		/* Buffer containing the hash block */
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  115  		struct fsverity_blockbuf block;
5306892a50bf4c Eric Biggers       2022-12-23  116  		/* Index of the hash block in the tree overall */
5306892a50bf4c Eric Biggers       2022-12-23  117  		unsigned long index;
8fcd94add6c5c9 Eric Biggers       2023-05-15  118  		/* Byte offset of the wanted hash relative to @addr */
5306892a50bf4c Eric Biggers       2022-12-23  119  		unsigned int hoffset;
5306892a50bf4c Eric Biggers       2022-12-23  120  	} hblocks[FS_VERITY_MAX_LEVELS];
5306892a50bf4c Eric Biggers       2022-12-23  121  	/*
5306892a50bf4c Eric Biggers       2022-12-23  122  	 * The index of the previous level's block within that level; also the
5306892a50bf4c Eric Biggers       2022-12-23  123  	 * index of that block's hash within the current level.
5306892a50bf4c Eric Biggers       2022-12-23  124  	 */
5306892a50bf4c Eric Biggers       2022-12-23  125  	u64 hidx = data_pos >> params->log_blocksize;
8a1d0f9cacc997 Eric Biggers       2019-07-22  126  
8fcd94add6c5c9 Eric Biggers       2023-05-15  127  	/* Up to 1 + FS_VERITY_MAX_LEVELS pages may be mapped at once */
8fcd94add6c5c9 Eric Biggers       2023-05-15  128  	BUILD_BUG_ON(1 + FS_VERITY_MAX_LEVELS > KM_MAX_IDX);
8fcd94add6c5c9 Eric Biggers       2023-05-15  129  
5306892a50bf4c Eric Biggers       2022-12-23  130  	if (unlikely(data_pos >= inode->i_size)) {
5306892a50bf4c Eric Biggers       2022-12-23  131  		/*
5306892a50bf4c Eric Biggers       2022-12-23  132  		 * This can happen in the data page spanning EOF when the Merkle
5306892a50bf4c Eric Biggers       2022-12-23  133  		 * tree block size is less than the page size.  The Merkle tree
5306892a50bf4c Eric Biggers       2022-12-23  134  		 * doesn't cover data blocks fully past EOF.  But the entire
5306892a50bf4c Eric Biggers       2022-12-23  135  		 * page spanning EOF can be visible to userspace via a mmap, and
5306892a50bf4c Eric Biggers       2022-12-23  136  		 * any part past EOF should be all zeroes.  Therefore, we need
5306892a50bf4c Eric Biggers       2022-12-23  137  		 * to verify that any data blocks fully past EOF are all zeroes.
5306892a50bf4c Eric Biggers       2022-12-23  138  		 */
8fcd94add6c5c9 Eric Biggers       2023-05-15  139  		if (memchr_inv(data, 0, params->block_size)) {
8fcd94add6c5c9 Eric Biggers       2023-05-15  140  			fsverity_err(inode,
8fcd94add6c5c9 Eric Biggers       2023-05-15  141  				     "FILE CORRUPTED!  Data past EOF is not zeroed");
8fcd94add6c5c9 Eric Biggers       2023-05-15  142  			return false;
8fcd94add6c5c9 Eric Biggers       2023-05-15  143  		}
8fcd94add6c5c9 Eric Biggers       2023-05-15  144  		return true;
5306892a50bf4c Eric Biggers       2022-12-23  145  	}
8a1d0f9cacc997 Eric Biggers       2019-07-22  146  
8a1d0f9cacc997 Eric Biggers       2019-07-22  147  	/*
5306892a50bf4c Eric Biggers       2022-12-23  148  	 * Starting at the leaf level, ascend the tree saving hash blocks along
5306892a50bf4c Eric Biggers       2022-12-23  149  	 * the way until we find a hash block that has already been verified, or
5306892a50bf4c Eric Biggers       2022-12-23  150  	 * until we reach the root.
8a1d0f9cacc997 Eric Biggers       2019-07-22  151  	 */
8a1d0f9cacc997 Eric Biggers       2019-07-22  152  	for (level = 0; level < params->num_levels; level++) {
5306892a50bf4c Eric Biggers       2022-12-23  153  		unsigned long next_hidx;
5306892a50bf4c Eric Biggers       2022-12-23  154  		unsigned long hblock_idx;
5306892a50bf4c Eric Biggers       2022-12-23  155  		pgoff_t hpage_idx;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  156  		u64 hblock_pos;
5306892a50bf4c Eric Biggers       2022-12-23  157  		unsigned int hblock_offset_in_page;
8a1d0f9cacc997 Eric Biggers       2019-07-22  158  		unsigned int hoffset;
8a1d0f9cacc997 Eric Biggers       2019-07-22  159  		struct page *hpage;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  160  		struct fsverity_blockbuf *block = &hblocks[level].block;
8a1d0f9cacc997 Eric Biggers       2019-07-22  161  
5306892a50bf4c Eric Biggers       2022-12-23  162  		/*
5306892a50bf4c Eric Biggers       2022-12-23  163  		 * The index of the block in the current level; also the index
5306892a50bf4c Eric Biggers       2022-12-23  164  		 * of that block's hash within the next level.
5306892a50bf4c Eric Biggers       2022-12-23  165  		 */
5306892a50bf4c Eric Biggers       2022-12-23  166  		next_hidx = hidx >> params->log_arity;
5306892a50bf4c Eric Biggers       2022-12-23  167  
5306892a50bf4c Eric Biggers       2022-12-23  168  		/* Index of the hash block in the tree overall */
5306892a50bf4c Eric Biggers       2022-12-23  169  		hblock_idx = params->level_start[level] + next_hidx;
8a1d0f9cacc997 Eric Biggers       2019-07-22  170  
5306892a50bf4c Eric Biggers       2022-12-23  171  		/* Index of the hash page in the tree overall */
5306892a50bf4c Eric Biggers       2022-12-23  172  		hpage_idx = hblock_idx >> params->log_blocks_per_page;
5306892a50bf4c Eric Biggers       2022-12-23  173  
5306892a50bf4c Eric Biggers       2022-12-23  174  		/* Byte offset of the hash block within the page */
5306892a50bf4c Eric Biggers       2022-12-23  175  		hblock_offset_in_page =
5306892a50bf4c Eric Biggers       2022-12-23  176  			(hblock_idx << params->log_blocksize) & ~PAGE_MASK;
5306892a50bf4c Eric Biggers       2022-12-23  177  
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  178  		/* Offset of the Merkle tree block into the tree */
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  179  		hblock_pos = hblock_idx << params->log_blocksize;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  180  
8fcd94add6c5c9 Eric Biggers       2023-05-15  181  		/* Byte offset of the hash within the block */
8fcd94add6c5c9 Eric Biggers       2023-05-15  182  		hoffset = (hidx << params->log_digestsize) &
8fcd94add6c5c9 Eric Biggers       2023-05-15  183  			  (params->block_size - 1);
5306892a50bf4c Eric Biggers       2022-12-23  184  
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  185  		num_ra_pages = level == 0 ?
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  186  			min(max_ra_pages, params->tree_pages - hpage_idx) : 0;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  187  
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  188  		if (inode->i_sb->s_vop->read_merkle_tree_block) {
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  189  			err = inode->i_sb->s_vop->read_merkle_tree_block(
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  190  				inode, hblock_pos, block, params->log_blocksize,
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  191  				num_ra_pages);
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  192  		} else {
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  193  			unsigned int blocks_per_page =
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  194  				vi->tree_params.blocks_per_page;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  195  			hblock_idx = round_down(hblock_idx, blocks_per_page);
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  196  			hpage = inode->i_sb->s_vop->read_merkle_tree_page(
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  197  				inode, hpage_idx, (num_ra_pages << PAGE_SHIFT));
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  198  
8a1d0f9cacc997 Eric Biggers       2019-07-22  199  			if (IS_ERR(hpage)) {
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  200  				err = PTR_ERR(hpage);
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  201  			} else {
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  202  				block->kaddr = kmap_local_page(hpage) +
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  203  					hblock_offset_in_page;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  204  				block->context = hpage;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  205  			}
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  206  		}
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  207  
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28 @208  		if (err) {
8a1d0f9cacc997 Eric Biggers       2019-07-22  209  			fsverity_err(inode,
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  210  				     "Error %d reading Merkle tree block %lu",
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  211  				     err, hblock_idx);
13e2408d02dd12 Eric Biggers       2023-06-03  212  			goto error;
8a1d0f9cacc997 Eric Biggers       2019-07-22  213  		}
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  214  
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  215  		if (is_hash_block_verified(inode, block, hblock_idx)) {
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  216  			memcpy(_want_hash, block->kaddr + hoffset, hsize);
8a1d0f9cacc997 Eric Biggers       2019-07-22  217  			want_hash = _want_hash;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  218  			fsverity_drop_block(inode, block);
8a1d0f9cacc997 Eric Biggers       2019-07-22  219  			goto descend;
8a1d0f9cacc997 Eric Biggers       2019-07-22  220  		}
5306892a50bf4c Eric Biggers       2022-12-23  221  		hblocks[level].index = hblock_idx;
5306892a50bf4c Eric Biggers       2022-12-23  222  		hblocks[level].hoffset = hoffset;
5306892a50bf4c Eric Biggers       2022-12-23  223  		hidx = next_hidx;
8a1d0f9cacc997 Eric Biggers       2019-07-22  224  	}
8a1d0f9cacc997 Eric Biggers       2019-07-22  225  
8a1d0f9cacc997 Eric Biggers       2019-07-22  226  	want_hash = vi->root_hash;
8a1d0f9cacc997 Eric Biggers       2019-07-22  227  descend:
f45555bf23cfc6 Eric Biggers       2022-12-23  228  	/* Descend the tree verifying hash blocks. */
8a1d0f9cacc997 Eric Biggers       2019-07-22  229  	for (; level > 0; level--) {
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  230  		struct fsverity_blockbuf *block = &hblocks[level - 1].block;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  231  		const void *haddr = block->kaddr;
5306892a50bf4c Eric Biggers       2022-12-23  232  		unsigned long hblock_idx = hblocks[level - 1].index;
5306892a50bf4c Eric Biggers       2022-12-23  233  		unsigned int hoffset = hblocks[level - 1].hoffset;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  234  		struct page *hpage = (struct page *)block->context;
8a1d0f9cacc997 Eric Biggers       2019-07-22  235  
13e2408d02dd12 Eric Biggers       2023-06-03  236  		if (fsverity_hash_block(params, inode, haddr, real_hash) != 0)
13e2408d02dd12 Eric Biggers       2023-06-03  237  			goto error;
13e2408d02dd12 Eric Biggers       2023-06-03  238  		if (memcmp(want_hash, real_hash, hsize) != 0)
13e2408d02dd12 Eric Biggers       2023-06-03  239  			goto corrupted;
5306892a50bf4c Eric Biggers       2022-12-23  240  		/*
5306892a50bf4c Eric Biggers       2022-12-23  241  		 * Mark the hash block as verified.  This must be atomic and
5306892a50bf4c Eric Biggers       2022-12-23  242  		 * idempotent, as the same hash block might be verified by
5306892a50bf4c Eric Biggers       2022-12-23  243  		 * multiple threads concurrently.
5306892a50bf4c Eric Biggers       2022-12-23  244  		 */
5306892a50bf4c Eric Biggers       2022-12-23  245  		if (vi->hash_block_verified)
5306892a50bf4c Eric Biggers       2022-12-23  246  			set_bit(hblock_idx, vi->hash_block_verified);
5306892a50bf4c Eric Biggers       2022-12-23  247  		else
8a1d0f9cacc997 Eric Biggers       2019-07-22  248  			SetPageChecked(hpage);
8fcd94add6c5c9 Eric Biggers       2023-05-15  249  		memcpy(_want_hash, haddr + hoffset, hsize);
8a1d0f9cacc997 Eric Biggers       2019-07-22  250  		want_hash = _want_hash;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  251  		fsverity_drop_block(inode, block);
8a1d0f9cacc997 Eric Biggers       2019-07-22  252  	}
8a1d0f9cacc997 Eric Biggers       2019-07-22  253  
f45555bf23cfc6 Eric Biggers       2022-12-23  254  	/* Finally, verify the data block. */
13e2408d02dd12 Eric Biggers       2023-06-03  255  	if (fsverity_hash_block(params, inode, data, real_hash) != 0)
13e2408d02dd12 Eric Biggers       2023-06-03  256  		goto error;
13e2408d02dd12 Eric Biggers       2023-06-03  257  	if (memcmp(want_hash, real_hash, hsize) != 0)
13e2408d02dd12 Eric Biggers       2023-06-03  258  		goto corrupted;
13e2408d02dd12 Eric Biggers       2023-06-03  259  	return true;
13e2408d02dd12 Eric Biggers       2023-06-03  260  
13e2408d02dd12 Eric Biggers       2023-06-03  261  corrupted:
13e2408d02dd12 Eric Biggers       2023-06-03  262  	fsverity_err(inode,
13e2408d02dd12 Eric Biggers       2023-06-03  263  		     "FILE CORRUPTED! pos=%llu, level=%d, want_hash=%s:%*phN, real_hash=%s:%*phN",
13e2408d02dd12 Eric Biggers       2023-06-03  264  		     data_pos, level - 1,
13e2408d02dd12 Eric Biggers       2023-06-03  265  		     params->hash_alg->name, hsize, want_hash,
13e2408d02dd12 Eric Biggers       2023-06-03  266  		     params->hash_alg->name, hsize, real_hash);
13e2408d02dd12 Eric Biggers       2023-06-03  267  error:
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  268  	for (; level > 0; level--)
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  269  		fsverity_drop_block(inode, &hblocks[level - 1].block);
13e2408d02dd12 Eric Biggers       2023-06-03  270  	return false;
8a1d0f9cacc997 Eric Biggers       2019-07-22  271  }
8a1d0f9cacc997 Eric Biggers       2019-07-22  272  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
