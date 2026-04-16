Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136B638AC8A
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Apr 2026 21:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776374784; cv=none; b=cibgDBJSaAoFm+fN5saYRUFhkOpHnskI8n7hYHZJeRhrcV1jBbwb+6SX4UN2lxtWaX4EFr4wnF+A4+5vyzDmYsh3xUC40zlZClksNkONDRlu1jqh2g0Q6CF7hbrfaF5OshyIZn8Ry2TNis+et3BHOS3FKwIi5or/iDUDmStRcVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776374784; c=relaxed/simple;
	bh=SRCpJ/PWlRGvywatpYK6ugZcQ3hj5VGo5xC4hLS0/Kg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y0AHoQ9FzRw+bh62nXOnCJzXtmHYcD5UYWp18XU8E4fDf3V1pTpnWp2fyTB0cci3HUELRQZ3HSKYLxWgX5iSRAd1jmc91j0bg6hgMoZVb30sYOqQtKxCCcRw33v8tO8HINos/g+8+kidCtVXY4ode0uwUtjCvW1wxzn/b+yq5iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNzIkYsE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNzIkYsE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776374783; x=1807910783;
  h=date:from:to:cc:subject:message-id;
  bh=SRCpJ/PWlRGvywatpYK6ugZcQ3hj5VGo5xC4hLS0/Kg=;
  b=QNzIkYsEG0SOaZzh94hrfUPF7lr62Mo41gdMFjHtjhF8DOJqi926H0an
   d0SPNfb6RzxtVelanxD16lpXXvcbo+V0iamDdLp4LTajnXIkbJSk/2TiO
   AV9p7hYUf9QW7t7MCYgJBslSkwKMMVmSc1Eu2/yYNS6DuFpTd7XUpad0w
   cp8MBw6QtRJZgL/MLKtfvMIDTkjNQOWmQdj6VPgMFrGegGGnYAT9nykKO
   lBzZmpIYqTC/9wV36SxhPTgILibzKtGzeHtTaxY2snFT4Hc8Pdo9dWG+N
   3mhKfXGwyOPVkwoUqe5GP8kZaodB8QSbL0jRqsRsR304OICZQXhMobYqb
   Q==;
X-CSE-ConnectionGUID: FHaLTM4uSVy0qxmLYcCnfg==
X-CSE-MsgGUID: fQOkMK8sSp+DUxG6erwi7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77400903"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77400903"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 14:26:22 -0700
X-CSE-ConnectionGUID: lLle7ePhSE+0KYpwMTDDtQ==
X-CSE-MsgGUID: GNjC+dL8SHy9P0wKqgBIfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="227712578"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Apr 2026 14:26:21 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDUE6-000000001yM-3yNI;
	Thu, 16 Apr 2026 21:26:18 +0000
Date: Fri, 17 Apr 2026 05:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/f2fs/file.c:4376 redirty_blocks() error: 'folio'
 dereferencing possible ERR_PTR()
Message-ID: <202604170513.MD2LqpI3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1d51b370a0f8f642f4fc84c795fbedac0fcdbbd2
commit: 5951fee46befbf6176c86482432f4f76e522f16c f2fs: Use a folio in redirty_blocks()
date:   12 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 12 months ago
config: powerpc-randconfig-r073-20260416 (https://download.01.org/0day-ci/archive/20260417/202604170513.MD2LqpI3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5951fee46bef ("f2fs: Use a folio in redirty_blocks()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604170513.MD2LqpI3-lkp@intel.com/

New smatch warnings:
fs/f2fs/file.c:4376 redirty_blocks() error: 'folio' dereferencing possible ERR_PTR()

Old smatch warnings:
fs/f2fs/file.c:3229 f2fs_ioc_flush_device() warn: potential spectre issue 'sbi->devs' [w] (local cap)

vim +/folio +4376 fs/f2fs/file.c

e1e8debec6564d0 Daeho Jeong             2020-10-30  4345  
5fdb322ff2c2b4a Daeho Jeong             2020-12-03  4346  static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
5fdb322ff2c2b4a Daeho Jeong             2020-12-03  4347  {
fcd9ae4f7f3b5fb Matthew Wilcox (Oracle  2021-04-07  4348) 	DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, page_idx);
5fdb322ff2c2b4a Daeho Jeong             2020-12-03  4349  	struct address_space *mapping = inode->i_mapping;
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4350) 	struct folio *folio;
5fdb322ff2c2b4a Daeho Jeong             2020-12-03  4351  	pgoff_t redirty_idx = page_idx;
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4352) 	int page_len = 0, ret = 0;
5fdb322ff2c2b4a Daeho Jeong             2020-12-03  4353  
5fdb322ff2c2b4a Daeho Jeong             2020-12-03  4354  	page_cache_ra_unbounded(&ractl, len, 0);
5fdb322ff2c2b4a Daeho Jeong             2020-12-03  4355  
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4356) 	do {
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4357) 		folio = read_cache_folio(mapping, page_idx, NULL, NULL);
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4358) 		if (IS_ERR(folio)) {
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4359) 			ret = PTR_ERR(folio);
5fdb322ff2c2b4a Daeho Jeong             2020-12-03  4360  			break;
5fdb322ff2c2b4a Daeho Jeong             2020-12-03  4361  		}
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4362) 		page_len += folio_nr_pages(folio) - (page_idx - folio->index);
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4363) 		page_idx = folio_next_index(folio);
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4364) 	} while (page_len < len);
5fdb322ff2c2b4a Daeho Jeong             2020-12-03  4365  
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4366) 	do {
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4367) 		folio = filemap_lock_folio(mapping, redirty_idx);
a4a0e16dbf77582 Jack Qiu                2022-05-31  4368  
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4369) 		/* It will never fail, when folio has pinned above */
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4370) 		f2fs_bug_on(F2FS_I_SB(inode), IS_ERR(folio));
a4a0e16dbf77582 Jack Qiu                2022-05-31  4371  
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4372) 		f2fs_folio_wait_writeback(folio, DATA, true, true);
a4d7f2b3238fd5f Chao Yu                 2024-08-12  4373  
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4374) 		folio_mark_dirty(folio);
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4375) 		set_page_private_gcing(&folio->page);
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31 @4376) 		redirty_idx = folio_next_index(folio);
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4377) 		folio_unlock(folio);
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4378) 		folio_put_refs(folio, 2);
5951fee46befbf6 Matthew Wilcox (Oracle  2025-03-31  4379) 	} while (redirty_idx < page_idx);
5fdb322ff2c2b4a Daeho Jeong             2020-12-03  4380  
5fdb322ff2c2b4a Daeho Jeong             2020-12-03  4381  	return ret;
5fdb322ff2c2b4a Daeho Jeong             2020-12-03  4382  }
5fdb322ff2c2b4a Daeho Jeong             2020-12-03  4383  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
