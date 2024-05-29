Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAED0158201
	for <oe-kbuild@lists.linux.dev>; Wed, 29 May 2024 14:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994632; cv=none; b=TW+tZz2gCDVJKXI6KdUopzEzoaIE05jdZRyg1iEEjRn5/lYQexjrpEN28xqVoTJoFqoscjp8xDqKxgR9ZSXDLpmnUlCG38WB7NQp2e51Dm7BRbqkxTQ1itFXrkXmnMkkL8l/rJqdCov9qyTCA1wNlnVog/XPbdOkhU/DxbsX7CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994632; c=relaxed/simple;
	bh=ONzzSfP+DGtfFXYX+XfKtYxtBsMzssBZDAoNfIqJVeM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YJZxTfN1RVTmS42PlgG+IWJNkpQ8fCYJ8Ljs6/3NH5V0Xd5+a70sOsTfwS6CEFnFHgMpb78VYvDCDFTITN13TigGZfm5k4JTDdtN2reT8ZIjHIuAu9HjmZC5RWKtxvxyu4kjf52TLdZdM0dV48kBLl0k+Sbp6/7Qlz09dAwtUlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DdjeETEu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdjeETEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716994631; x=1748530631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ONzzSfP+DGtfFXYX+XfKtYxtBsMzssBZDAoNfIqJVeM=;
  b=DdjeETEuYmdmMqD21L7T65jgvUjel+QhK/2NZRBvFtRee02YQi8SubDX
   Bziy6O7UKkY5S64xpjjwkt3aZtZA0sr8oAgWWw9cnAGZqU/fVzNH/2CrM
   pMuf3r+jim49ruU0jLh3eHg3ym9mg3eWafnmsRGomrs0LP6sHcXxnb7dF
   tsDaMAceEecjvzAeOA5D9V7KcUp7EHAWpzsxe+hNML6HBLjSyp5Uwq3vX
   pN1Uex0xab1E+7f9uoOGwJv9eECmZe1k24jdZtNriqP6bw+dOHEBk8MP1
   4sbKK2D7eQJ5WpLzo9p8yUDDRv0JlsEME0qvxBxuvE2oWM4wWTDWVmS2u
   Q==;
X-CSE-ConnectionGUID: PDZdbK1uT+6EAd+INPoZkg==
X-CSE-MsgGUID: xsWGXypITkSnRm+L2FFmpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13353071"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="13353071"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 07:57:11 -0700
X-CSE-ConnectionGUID: 5RUAqTtBQziaXAlj3UbXEA==
X-CSE-MsgGUID: 96/wO4uNTE+95B2b64X8FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="36009243"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 May 2024 07:57:09 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCKji-000Dpr-1w;
	Wed, 29 May 2024 14:57:06 +0000
Date: Wed, 29 May 2024 22:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 6/7] ext4: Convert to buffered_write_operations
Message-ID: <202405292201.wdsK3rFE-lkp@intel.com>
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
In-Reply-To: <20240528164829.2105447-7-willy@infradead.org>
References: <20240528164829.2105447-7-willy@infradead.org>
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
TO: Christoph Hellwig <hch@lst.de>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: linux-fsdevel@vger.kernel.org
CC: linux-ext4@vger.kernel.org

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.10-rc1 next-20240529]
[cannot apply to tytso-ext4/dev jack-fs/for_next hch-configfs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/fs-Introduce-buffered_write_operations/20240529-005213
base:   linus/master
patch link:    https://lore.kernel.org/r/20240528164829.2105447-7-willy%40infradead.org
patch subject: [PATCH 6/7] ext4: Convert to buffered_write_operations
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: openrisc-randconfig-r081-20240529 (https://download.01.org/0day-ci/archive/20240529/202405292201.wdsK3rFE-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405292201.wdsK3rFE-lkp@intel.com/

smatch warnings:
fs/ext4/inline.c:652 ext4_convert_inline_data_to_extent() warn: passing zero to 'ERR_PTR'
fs/ext4/inline.c:951 ext4_da_write_inline_data_begin() warn: passing zero to 'ERR_PTR'
fs/ext4/inline.c:956 ext4_da_write_inline_data_begin() error: uninitialized symbol 'folio'.

vim +/ERR_PTR +652 fs/ext4/inline.c

46c7f254543ded Tao Ma                  2012-12-10  540  
8ca000469995a1 Matthew Wilcox (Oracle  2024-05-28  541) /* Returns NULL on success, ERR_PTR on failure */
8ca000469995a1 Matthew Wilcox (Oracle  2024-05-28  542) static void *ext4_convert_inline_data_to_extent(struct address_space *mapping,
832ee62d992d9b Matthew Wilcox (Oracle  2022-02-22  543) 		struct inode *inode)
f19d5870cbf72d Tao Ma                  2012-12-10  544  {
c755e251357a0c Theodore Ts'o           2017-01-11  545  	int ret, needed_blocks, no_expand;
f19d5870cbf72d Tao Ma                  2012-12-10  546  	handle_t *handle = NULL;
f19d5870cbf72d Tao Ma                  2012-12-10  547  	int retries = 0, sem_held = 0;
83eba701cf6e58 Matthew Wilcox          2023-03-24  548  	struct folio *folio = NULL;
f19d5870cbf72d Tao Ma                  2012-12-10  549  	unsigned from, to;
f19d5870cbf72d Tao Ma                  2012-12-10  550  	struct ext4_iloc iloc;
f19d5870cbf72d Tao Ma                  2012-12-10  551  
f19d5870cbf72d Tao Ma                  2012-12-10  552  	if (!ext4_has_inline_data(inode)) {
f19d5870cbf72d Tao Ma                  2012-12-10  553  		/*
f19d5870cbf72d Tao Ma                  2012-12-10  554  		 * clear the flag so that no new write
f19d5870cbf72d Tao Ma                  2012-12-10  555  		 * will trap here again.
f19d5870cbf72d Tao Ma                  2012-12-10  556  		 */
f19d5870cbf72d Tao Ma                  2012-12-10  557  		ext4_clear_inode_state(inode, EXT4_STATE_MAY_INLINE_DATA);
8ca000469995a1 Matthew Wilcox (Oracle  2024-05-28  558) 		return NULL;
f19d5870cbf72d Tao Ma                  2012-12-10  559  	}
f19d5870cbf72d Tao Ma                  2012-12-10  560  
f19d5870cbf72d Tao Ma                  2012-12-10  561  	needed_blocks = ext4_writepage_trans_blocks(inode);
f19d5870cbf72d Tao Ma                  2012-12-10  562  
f19d5870cbf72d Tao Ma                  2012-12-10  563  	ret = ext4_get_inode_loc(inode, &iloc);
f19d5870cbf72d Tao Ma                  2012-12-10  564  	if (ret)
8ca000469995a1 Matthew Wilcox (Oracle  2024-05-28  565) 		return ERR_PTR(ret);
f19d5870cbf72d Tao Ma                  2012-12-10  566  
f19d5870cbf72d Tao Ma                  2012-12-10  567  retry:
9924a92a8c2175 Theodore Ts'o           2013-02-08  568  	handle = ext4_journal_start(inode, EXT4_HT_WRITE_PAGE, needed_blocks);
f19d5870cbf72d Tao Ma                  2012-12-10  569  	if (IS_ERR(handle)) {
f19d5870cbf72d Tao Ma                  2012-12-10  570  		ret = PTR_ERR(handle);
f19d5870cbf72d Tao Ma                  2012-12-10  571  		handle = NULL;
f19d5870cbf72d Tao Ma                  2012-12-10  572  		goto out;
f19d5870cbf72d Tao Ma                  2012-12-10  573  	}
f19d5870cbf72d Tao Ma                  2012-12-10  574  
f19d5870cbf72d Tao Ma                  2012-12-10  575  	/* We cannot recurse into the filesystem as the transaction is already
f19d5870cbf72d Tao Ma                  2012-12-10  576  	 * started */
83eba701cf6e58 Matthew Wilcox          2023-03-24  577  	folio = __filemap_get_folio(mapping, 0, FGP_WRITEBEGIN | FGP_NOFS,
83eba701cf6e58 Matthew Wilcox          2023-03-24  578  			mapping_gfp_mask(mapping));
7fa8a8ee9400fe Linus Torvalds          2023-04-27  579  	if (IS_ERR(folio)) {
7fa8a8ee9400fe Linus Torvalds          2023-04-27  580  		ret = PTR_ERR(folio);
7fa8a8ee9400fe Linus Torvalds          2023-04-27  581  		goto out_nofolio;
f19d5870cbf72d Tao Ma                  2012-12-10  582  	}
f19d5870cbf72d Tao Ma                  2012-12-10  583  
c755e251357a0c Theodore Ts'o           2017-01-11  584  	ext4_write_lock_xattr(inode, &no_expand);
f19d5870cbf72d Tao Ma                  2012-12-10  585  	sem_held = 1;
f19d5870cbf72d Tao Ma                  2012-12-10  586  	/* If some one has already done this for us, just exit. */
f19d5870cbf72d Tao Ma                  2012-12-10  587  	if (!ext4_has_inline_data(inode)) {
f19d5870cbf72d Tao Ma                  2012-12-10  588  		ret = 0;
f19d5870cbf72d Tao Ma                  2012-12-10  589  		goto out;
f19d5870cbf72d Tao Ma                  2012-12-10  590  	}
f19d5870cbf72d Tao Ma                  2012-12-10  591  
f19d5870cbf72d Tao Ma                  2012-12-10  592  	from = 0;
f19d5870cbf72d Tao Ma                  2012-12-10  593  	to = ext4_get_inline_size(inode);
83eba701cf6e58 Matthew Wilcox          2023-03-24  594  	if (!folio_test_uptodate(folio)) {
6b87fbe4155007 Matthew Wilcox          2023-03-24  595  		ret = ext4_read_inline_folio(inode, folio);
f19d5870cbf72d Tao Ma                  2012-12-10  596  		if (ret < 0)
f19d5870cbf72d Tao Ma                  2012-12-10  597  			goto out;
f19d5870cbf72d Tao Ma                  2012-12-10  598  	}
f19d5870cbf72d Tao Ma                  2012-12-10  599  
f19d5870cbf72d Tao Ma                  2012-12-10  600  	ret = ext4_destroy_inline_data_nolock(handle, inode);
f19d5870cbf72d Tao Ma                  2012-12-10  601  	if (ret)
f19d5870cbf72d Tao Ma                  2012-12-10  602  		goto out;
f19d5870cbf72d Tao Ma                  2012-12-10  603  
705965bd6dfadc Jan Kara                2016-03-08  604  	if (ext4_should_dioread_nolock(inode)) {
83eba701cf6e58 Matthew Wilcox          2023-03-24  605  		ret = __block_write_begin(&folio->page, from, to,
705965bd6dfadc Jan Kara                2016-03-08  606  					  ext4_get_block_unwritten);
705965bd6dfadc Jan Kara                2016-03-08  607  	} else
83eba701cf6e58 Matthew Wilcox          2023-03-24  608  		ret = __block_write_begin(&folio->page, from, to, ext4_get_block);
f19d5870cbf72d Tao Ma                  2012-12-10  609  
f19d5870cbf72d Tao Ma                  2012-12-10  610  	if (!ret && ext4_should_journal_data(inode)) {
83eba701cf6e58 Matthew Wilcox          2023-03-24  611  		ret = ext4_walk_page_buffers(handle, inode,
83eba701cf6e58 Matthew Wilcox          2023-03-24  612  					     folio_buffers(folio), from, to,
83eba701cf6e58 Matthew Wilcox          2023-03-24  613  					     NULL, do_journal_get_write_access);
f19d5870cbf72d Tao Ma                  2012-12-10  614  	}
f19d5870cbf72d Tao Ma                  2012-12-10  615  
f19d5870cbf72d Tao Ma                  2012-12-10  616  	if (ret) {
83eba701cf6e58 Matthew Wilcox          2023-03-24  617  		folio_unlock(folio);
83eba701cf6e58 Matthew Wilcox          2023-03-24  618  		folio_put(folio);
83eba701cf6e58 Matthew Wilcox          2023-03-24  619  		folio = NULL;
f19d5870cbf72d Tao Ma                  2012-12-10  620  		ext4_orphan_add(handle, inode);
c755e251357a0c Theodore Ts'o           2017-01-11  621  		ext4_write_unlock_xattr(inode, &no_expand);
f19d5870cbf72d Tao Ma                  2012-12-10  622  		sem_held = 0;
f19d5870cbf72d Tao Ma                  2012-12-10  623  		ext4_journal_stop(handle);
f19d5870cbf72d Tao Ma                  2012-12-10  624  		handle = NULL;
f19d5870cbf72d Tao Ma                  2012-12-10  625  		ext4_truncate_failed_write(inode);
f19d5870cbf72d Tao Ma                  2012-12-10  626  		/*
f19d5870cbf72d Tao Ma                  2012-12-10  627  		 * If truncate failed early the inode might
f19d5870cbf72d Tao Ma                  2012-12-10  628  		 * still be on the orphan list; we need to
f19d5870cbf72d Tao Ma                  2012-12-10  629  		 * make sure the inode is removed from the
f19d5870cbf72d Tao Ma                  2012-12-10  630  		 * orphan list in that case.
f19d5870cbf72d Tao Ma                  2012-12-10  631  		 */
f19d5870cbf72d Tao Ma                  2012-12-10  632  		if (inode->i_nlink)
f19d5870cbf72d Tao Ma                  2012-12-10  633  			ext4_orphan_del(NULL, inode);
f19d5870cbf72d Tao Ma                  2012-12-10  634  	}
f19d5870cbf72d Tao Ma                  2012-12-10  635  
f19d5870cbf72d Tao Ma                  2012-12-10  636  	if (ret == -ENOSPC && ext4_should_retry_alloc(inode->i_sb, &retries))
f19d5870cbf72d Tao Ma                  2012-12-10  637  		goto retry;
f19d5870cbf72d Tao Ma                  2012-12-10  638  
83eba701cf6e58 Matthew Wilcox          2023-03-24  639  	if (folio)
83eba701cf6e58 Matthew Wilcox          2023-03-24  640  		block_commit_write(&folio->page, from, to);
f19d5870cbf72d Tao Ma                  2012-12-10  641  out:
83eba701cf6e58 Matthew Wilcox          2023-03-24  642  	if (folio) {
83eba701cf6e58 Matthew Wilcox          2023-03-24  643  		folio_unlock(folio);
83eba701cf6e58 Matthew Wilcox          2023-03-24  644  		folio_put(folio);
f19d5870cbf72d Tao Ma                  2012-12-10  645  	}
7fa8a8ee9400fe Linus Torvalds          2023-04-27  646  out_nofolio:
f19d5870cbf72d Tao Ma                  2012-12-10  647  	if (sem_held)
c755e251357a0c Theodore Ts'o           2017-01-11  648  		ext4_write_unlock_xattr(inode, &no_expand);
f19d5870cbf72d Tao Ma                  2012-12-10  649  	if (handle)
f19d5870cbf72d Tao Ma                  2012-12-10  650  		ext4_journal_stop(handle);
f19d5870cbf72d Tao Ma                  2012-12-10  651  	brelse(iloc.bh);
8ca000469995a1 Matthew Wilcox (Oracle  2024-05-28 @652) 	return ERR_PTR(ret);
f19d5870cbf72d Tao Ma                  2012-12-10  653  }
f19d5870cbf72d Tao Ma                  2012-12-10  654  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
