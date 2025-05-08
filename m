Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880F52101BD
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 23:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746748504; cv=none; b=Sb6XLmWjkZJ4HK63fT/hGfGbQQMpwwUGEMMDahOOTt7m3fhIiVU5kLDOJPdsLcHMUJNrAdXrsVnr1tAQYUxL0xZn73r/xOCxYyWgFpz8LQf1lA8deko/HqWb0SzxeMGIQxpJz5NDrRM0ahIGU56tP6gwhqqOlqtxCres/AnVF2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746748504; c=relaxed/simple;
	bh=uE3Ghv41twnjFBDvUStvIN/Zw8nXM7pXRuAQaS7+EEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FDXglg6OOIsTFVLvudrUIZg7taOO+sUNbicquqnHaN+ShIYGExIr3mKCfnFq2DuusKFVF6ztSfuSUrFfcTLy80EXoIV8jZ0zQDsW8st46kNct9IHAjtTM4z0k8e8Re3bd4YYueJMzZG3yAeWi/b7EW41qFbXZAMVpZ9963kMbcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BerS4YCM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BerS4YCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746748503; x=1778284503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uE3Ghv41twnjFBDvUStvIN/Zw8nXM7pXRuAQaS7+EEs=;
  b=BerS4YCMOWngepqFHSLTUSE445dgh1DP+y/qAJyfAJK3EWUzcEahKio1
   9h5hKDueuVZ4pgdOTH4XRoaQi2DH4LeRnhb9cKDOLzBToEeWsrH1lVP+K
   IQdaf90XqNG8hBQh8PiEYeNNa9J6mAGgGfEndKZ5K9GnEaA6VraA4XfOm
   Cf+NR2k9G9TSiuEDVFxl/ZI1W1QEXEcGuzlLgCFh/1mvLmlbk4EOiCaxN
   8+Q0jrGIDFL6RKmvX+UT4tOjz4pmxRBUgMK5Ekg87xYP55iSjIKyjFmXR
   MAEq5TRkRif1lXAXWHPRfZV0UPX7Wcjo+718gUcwhmOdqIBS4Id3/9UCw
   w==;
X-CSE-ConnectionGUID: Q5tiU8jRQBqsuQzL4n/fBg==
X-CSE-MsgGUID: jyhZ0EBMQuSLH0QglVp9DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47663865"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="47663865"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 16:55:02 -0700
X-CSE-ConnectionGUID: lkFzvU/QTcaFeuJ0Ym65tw==
X-CSE-MsgGUID: HtL0EODySK+VytWuB5bNtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136331251"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 May 2025 16:55:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDB4s-000BUB-0b;
	Thu, 08 May 2025 23:54:58 +0000
Date: Fri, 9 May 2025 07:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jaegeuk-f2fs:dev 154/181] fs/f2fs/file.c:4376 redirty_blocks()
 error: 'folio' dereferencing possible ERR_PTR()
Message-ID: <202505090714.E8UN1vVq-lkp@intel.com>
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
CC: linux-f2fs-devel@lists.sourceforge.net
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev
head:   80f31d2a7e5f4efa7150c951268236c670bcb068
commit: 5951fee46befbf6176c86482432f4f76e522f16c [154/181] f2fs: Use a folio in redirty_blocks()
:::::: branch date: 8 hours ago
:::::: commit date: 10 days ago
config: i386-randconfig-141-20250508 (https://download.01.org/0day-ci/archive/20250509/202505090714.E8UN1vVq-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505090714.E8UN1vVq-lkp@intel.com/

New smatch warnings:
fs/f2fs/file.c:4376 redirty_blocks() error: 'folio' dereferencing possible ERR_PTR()

Old smatch warnings:
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
