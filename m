Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96766260578
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 02:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765419813; cv=none; b=PliwUC3O3t8cjXLFOkePX8rFEIYRvw8vKu5537xKx13wERJGbCBRsLI5vlPzritDxmcBgOfwkpJobKA1f+x0M/g9buYrWEaYF60jQSdkUl41/oStG15PjH7znQD4l3m9hk6A0i/s8KYE/fJvWhwkUX1+hSRoX5PJur/l6xRuzuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765419813; c=relaxed/simple;
	bh=eNjHsnGDb/6D5Y57lUYD7K1Bfb+ADDit/uPkWBmNzR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MOKKS/E8dN2Zh8pBlkIlLW36jF45cLExOYLCRH4qd+06ZxGpocm4Tbdu2PvFXUM2Ymydl3YQujx1xemJNTWMTbY7biwGqh5ht/AIJzokKYyDuyue6HLqWEhwBUZx7mrRFDQLbp6G351KW/nYz1zRSgtnKdVNvQ9AaCUGH3AK6GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRXI8be8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRXI8be8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765419811; x=1796955811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eNjHsnGDb/6D5Y57lUYD7K1Bfb+ADDit/uPkWBmNzR0=;
  b=dRXI8be8XFW7y9tm0XCO9oxpOIgQUKnsucr4ZCYAwbYfDZqiE0KDs3yV
   rJF827mPJk/3Iw1jC6sge7AYj8cbeuE4yZciBmUDe7hEx0hlgEkHoflyx
   cZsW/3FObEu7XF3vzyxlu6rdZcIzKSRLf4j3thG+mGdN3iDzbtqqmxBtA
   sPWuW+j0t53QHemaik1pCzEkj/d3fSBnZ3A+GZ3k1lcSEDmFO4nZancUZ
   5EV77ZBmxGsPxef9LV1YA/3jqyEZTQ6qftsl2OTiebU/ezM8oRNs8sN6t
   BZkSQQ+JAc+ZkmX8trdXNyJwCZmFZzIqqgBpg1wn+i0NAreVyRkq4tbxD
   A==;
X-CSE-ConnectionGUID: Ulyo2RFgQOWcQAJVagXKSQ==
X-CSE-MsgGUID: Ym+6HPjiSlWrGsBV0zf+4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="69984962"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="69984962"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:23:28 -0800
X-CSE-ConnectionGUID: g41PnlwRS+SXcoRb5asrtw==
X-CSE-MsgGUID: 2YLLxVhVQrC/56YSg76vtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="197487221"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Dec 2025 18:23:27 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTWKy-0000000041p-3789;
	Thu, 11 Dec 2025 02:23:24 +0000
Date: Thu, 11 Dec 2025 10:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/f2fs/file.c:4376 redirty_blocks() error: 'folio' dereferencing
 possible ERR_PTR()
Message-ID: <202512111043.nn44n1xC-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8c8081cc599fcafa25371d50959c17e154f9fd08
commit: 5951fee46befbf6176c86482432f4f76e522f16c f2fs: Use a folio in redirty_blocks()
date:   8 months ago
:::::: branch date: 83 minutes ago
:::::: commit date: 8 months ago
config: csky-randconfig-r073-20251210 (https://download.01.org/0day-ci/archive/20251211/202512111043.nn44n1xC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512111043.nn44n1xC-lkp@intel.com/

New smatch warnings:
fs/f2fs/file.c:4376 redirty_blocks() error: 'folio' dereferencing possible ERR_PTR()

Old smatch warnings:
arch/csky/include/asm/uaccess.h:191 __get_user_fn() error: uninitialized symbol 'retval'.
fs/f2fs/file.c:3229 f2fs_ioc_flush_device() warn: potential spectre issue 'sbi->devs' [w] (local cap)

vim +/folio +4376 fs/f2fs/file.c

e1e8debec6564d Daeho Jeong             2020-10-30  4345  
5fdb322ff2c2b4 Daeho Jeong             2020-12-03  4346  static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
5fdb322ff2c2b4 Daeho Jeong             2020-12-03  4347  {
fcd9ae4f7f3b5f Matthew Wilcox (Oracle  2021-04-07  4348) 	DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, page_idx);
5fdb322ff2c2b4 Daeho Jeong             2020-12-03  4349  	struct address_space *mapping = inode->i_mapping;
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4350) 	struct folio *folio;
5fdb322ff2c2b4 Daeho Jeong             2020-12-03  4351  	pgoff_t redirty_idx = page_idx;
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4352) 	int page_len = 0, ret = 0;
5fdb322ff2c2b4 Daeho Jeong             2020-12-03  4353  
5fdb322ff2c2b4 Daeho Jeong             2020-12-03  4354  	page_cache_ra_unbounded(&ractl, len, 0);
5fdb322ff2c2b4 Daeho Jeong             2020-12-03  4355  
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4356) 	do {
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4357) 		folio = read_cache_folio(mapping, page_idx, NULL, NULL);
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4358) 		if (IS_ERR(folio)) {
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4359) 			ret = PTR_ERR(folio);
5fdb322ff2c2b4 Daeho Jeong             2020-12-03  4360  			break;
5fdb322ff2c2b4 Daeho Jeong             2020-12-03  4361  		}
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4362) 		page_len += folio_nr_pages(folio) - (page_idx - folio->index);
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4363) 		page_idx = folio_next_index(folio);
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4364) 	} while (page_len < len);
5fdb322ff2c2b4 Daeho Jeong             2020-12-03  4365  
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4366) 	do {
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4367) 		folio = filemap_lock_folio(mapping, redirty_idx);
a4a0e16dbf7758 Jack Qiu                2022-05-31  4368  
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4369) 		/* It will never fail, when folio has pinned above */
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4370) 		f2fs_bug_on(F2FS_I_SB(inode), IS_ERR(folio));
a4a0e16dbf7758 Jack Qiu                2022-05-31  4371  
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4372) 		f2fs_folio_wait_writeback(folio, DATA, true, true);
a4d7f2b3238fd5 Chao Yu                 2024-08-12  4373  
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4374) 		folio_mark_dirty(folio);
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4375) 		set_page_private_gcing(&folio->page);
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31 @4376) 		redirty_idx = folio_next_index(folio);
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4377) 		folio_unlock(folio);
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4378) 		folio_put_refs(folio, 2);
5951fee46befbf Matthew Wilcox (Oracle  2025-03-31  4379) 	} while (redirty_idx < page_idx);
5fdb322ff2c2b4 Daeho Jeong             2020-12-03  4380  
5fdb322ff2c2b4 Daeho Jeong             2020-12-03  4381  	return ret;
5fdb322ff2c2b4 Daeho Jeong             2020-12-03  4382  }
5fdb322ff2c2b4 Daeho Jeong             2020-12-03  4383  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
