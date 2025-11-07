Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567DE20B7ED
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Nov 2025 06:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762497947; cv=none; b=bzc8lre9n5LtSKTaPwdB9w5SXNiCTTrvttmSwL8XQCZpWFmhWpK2eCSFo8QFMaTkAFV7mvgzKpT+cFBEvXFLZi7taTogdjYuBeMhnRZurtcDQFF98JlAVbDBBfaBkxL2fjv0vpBft8JaVChiz4MwAGBQKpNci5W8ihaMFSj/sfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762497947; c=relaxed/simple;
	bh=ngHPQfTUiNDkX7JWyIKiOfN9JXKuWnDGZUhcIKbaAkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d1vDbYrKaAhFBVd/esjB9Wcql2cm47BUVwHKutCnmhdGJBeXMazYTJf93woPGTRSepDIXFhsCFsBj9cy1HVRze5qZwsILexQ9rqB5M2G7tdVW+PrWixE6IIapd5b6x5KavCBwubdpMTa9v2fdff1c3dtkOlWxto5xkb1dRnnNdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+Ply2yx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+Ply2yx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762497945; x=1794033945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ngHPQfTUiNDkX7JWyIKiOfN9JXKuWnDGZUhcIKbaAkw=;
  b=g+Ply2yxrh1P7vhYCfiI3xmLAr2A7lsCnd/BOtIYVoR7tH2erUcLCep6
   Za7cXNvs314crOc8Qk8ePzEZDSO+u8HXAayVSRC6QZq/IWJ+Y6s1kiQF4
   0TR8f+bVjitJ2+kw+RnhcEd8uFG5sL3r2sxXw5OLpJUN5FKCEa9D9v0Xl
   MIaQzrlzoA+dDHhESkSw/g9d10U17Qt5O1JOuRG63Ny/CgKuQtmZUT5e9
   6UoKmeUWnSElXCy08Ln/Y+/EuN4z6og1muIuXMfB8vz444gYiSSdq6u57
   EimXufZ6/YK7d53zDG/IREs/W8lSTvedF443xM0N3AHOIazOpnCvD3Ace
   w==;
X-CSE-ConnectionGUID: fIsYkAAdT7e1YKCOlKAMPQ==
X-CSE-MsgGUID: NaKMmT3zQMS64v+rZT0LcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75997563"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="75997563"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 22:45:45 -0800
X-CSE-ConnectionGUID: e3HIso+JRSuU+3KYCORkIw==
X-CSE-MsgGUID: p3jAVQexSKuZhDww2nL6tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="192229930"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2025 22:45:43 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHGDJ-000UoC-1M;
	Fri, 07 Nov 2025 06:45:30 +0000
Date: Fri, 7 Nov 2025 14:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/page_io.c:245 swap_writeout() warn: missing error code 'ret'
Message-ID: <202511071412.kHmTJvBX-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a0c9b3391999818e2c5b93719699b255be1f682
commit: 2d1844cdbe89d04d4f679a1a01e165fea1741bab mm: tidy up swap_writeout
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r072-20251107 (https://download.01.org/0day-ci/archive/20251107/202511071412.kHmTJvBX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511071412.kHmTJvBX-lkp@intel.com/

smatch warnings:
mm/page_io.c:245 swap_writeout() warn: missing error code 'ret'

vim +/ret +245 mm/page_io.c

0ca0c24e321158 Usama Arif              2024-08-23  235  
^1da177e4c3f41 Linus Torvalds          2005-04-16  236  /*
^1da177e4c3f41 Linus Torvalds          2005-04-16  237   * We may have stale swap cache pages in memory: notice
^1da177e4c3f41 Linus Torvalds          2005-04-16  238   * them here and get rid of the unnecessary final write.
^1da177e4c3f41 Linus Torvalds          2005-04-16  239   */
84798514db503d Matthew Wilcox (Oracle  2025-04-02  240) int swap_writeout(struct folio *folio, struct writeback_control *wbc)
^1da177e4c3f41 Linus Torvalds          2005-04-16  241  {
2d1844cdbe89d0 Christoph Hellwig       2025-06-10  242  	int ret = 0;
2d1844cdbe89d0 Christoph Hellwig       2025-06-10  243  
2d1844cdbe89d0 Christoph Hellwig       2025-06-10  244  	if (folio_free_swap(folio))
2d1844cdbe89d0 Christoph Hellwig       2025-06-10 @245  		goto out_unlock;
^1da177e4c3f41 Linus Torvalds          2005-04-16  246  
8a84802e2a2b1a Steven Price            2020-05-13  247  	/*
8a84802e2a2b1a Steven Price            2020-05-13  248  	 * Arch code may have to preserve more data than just the page
8a84802e2a2b1a Steven Price            2020-05-13  249  	 * contents, e.g. memory tags.
8a84802e2a2b1a Steven Price            2020-05-13  250  	 */
f238b8c33c6738 Barry Song              2024-03-23  251  	ret = arch_prepare_to_swap(folio);
8a84802e2a2b1a Steven Price            2020-05-13  252  	if (ret) {
71fa1a533d2e02 Matthew Wilcox (Oracle  2022-09-02  253) 		folio_mark_dirty(folio);
2d1844cdbe89d0 Christoph Hellwig       2025-06-10  254  		goto out_unlock;
8a84802e2a2b1a Steven Price            2020-05-13  255  	}
0ca0c24e321158 Usama Arif              2024-08-23  256  
0ca0c24e321158 Usama Arif              2024-08-23  257  	/*
0ca0c24e321158 Usama Arif              2024-08-23  258  	 * Use a bitmap (zeromap) to avoid doing IO for zero-filled pages.
0ca0c24e321158 Usama Arif              2024-08-23  259  	 * The bits in zeromap are protected by the locked swapcache folio
0ca0c24e321158 Usama Arif              2024-08-23  260  	 * and atomic updates are used to protect against read-modify-write
0ca0c24e321158 Usama Arif              2024-08-23  261  	 * corruption due to other zero swap entries seeing concurrent updates.
0ca0c24e321158 Usama Arif              2024-08-23  262  	 */
0ca0c24e321158 Usama Arif              2024-08-23  263  	if (is_folio_zero_filled(folio)) {
0ca0c24e321158 Usama Arif              2024-08-23  264  		swap_zeromap_folio_set(folio);
2d1844cdbe89d0 Christoph Hellwig       2025-06-10  265  		goto out_unlock;
2d1844cdbe89d0 Christoph Hellwig       2025-06-10  266  	}
2d1844cdbe89d0 Christoph Hellwig       2025-06-10  267  
0ca0c24e321158 Usama Arif              2024-08-23  268  	/*
2d1844cdbe89d0 Christoph Hellwig       2025-06-10  269  	 * Clear bits this folio occupies in the zeromap to prevent zero data
2d1844cdbe89d0 Christoph Hellwig       2025-06-10  270  	 * being read in from any previous zero writes that occupied the same
2d1844cdbe89d0 Christoph Hellwig       2025-06-10  271  	 * swap entries.
0ca0c24e321158 Usama Arif              2024-08-23  272  	 */
0ca0c24e321158 Usama Arif              2024-08-23  273  	swap_zeromap_folio_clear(folio);
2d1844cdbe89d0 Christoph Hellwig       2025-06-10  274  
34f4c198bfbe86 Matthew Wilcox (Oracle  2023-07-15  275) 	if (zswap_store(folio)) {
0c560dd8604055 Kanchana P Sridhar      2024-09-30  276  		count_mthp_stat(folio_order(folio), MTHP_STAT_ZSWPOUT);
2d1844cdbe89d0 Christoph Hellwig       2025-06-10  277  		goto out_unlock;
38b5faf4b178d5 Dan Magenheimer         2012-04-09  278  	}
501a06fe8e4c18 Nhat Pham               2023-12-07  279  	if (!mem_cgroup_zswap_writeback_enabled(folio_memcg(folio))) {
501a06fe8e4c18 Nhat Pham               2023-12-07  280  		folio_mark_dirty(folio);
501a06fe8e4c18 Nhat Pham               2023-12-07  281  		return AOP_WRITEPAGE_ACTIVATE;
501a06fe8e4c18 Nhat Pham               2023-12-07  282  	}
501a06fe8e4c18 Nhat Pham               2023-12-07  283  
b99b4e0d9d7f29 Matthew Wilcox (Oracle  2023-12-13  284) 	__swap_writepage(folio, wbc);
e3e2762bd3c5e0 Christoph Hellwig       2023-01-25  285  	return 0;
2d1844cdbe89d0 Christoph Hellwig       2025-06-10  286  out_unlock:
2d1844cdbe89d0 Christoph Hellwig       2025-06-10  287  	folio_unlock(folio);
2d1844cdbe89d0 Christoph Hellwig       2025-06-10  288  	return ret;
2f772e6cadf8ad Seth Jennings           2013-04-29  289  }
2f772e6cadf8ad Seth Jennings           2013-04-29  290  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
