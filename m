Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB5F2F7EF4
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Oct 2026 22:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016348; cv=none; b=Q9ynJUdvw5SS6jCPieCJ8hkQNqmlJ/FVmOeCiD0NeGyuUsE+VHYHyhuT8dkRK9+aUWPlnHcC616a14X6RniOxjxqXbskrE/W3t5DHcThTu5bJ085Yepktf4+XI5LL7hilRjK/kE7qm/YdlEOtSOjEGS0RICitY1I1cLC88odobs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016348; c=relaxed/simple;
	bh=a6BWgl5SIkgq4j0348MAdySKk29YyjhmFd8LexYotdw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pXppRj2YUk2/NpYDqCj715npqRUxlrj/8GF0GsHYmwRyGDiTte1Y3V2wvppzzjrVyW1C3jsPvltLWakSG5fqpt5nVyJ87IH1p3xGtZBGir0GimnCmKiLaPfO0c+Bzq/FZpSit1BwL+ay3ctqVPJb7vbKM+kw/KE9TznsZpgKbVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tjpx3Ejz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tjpx3Ejz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792016346; x=1823552346;
  h=date:from:to:cc:subject:message-id;
  bh=a6BWgl5SIkgq4j0348MAdySKk29YyjhmFd8LexYotdw=;
  b=Tjpx3EjzWiIfdi1grAdbztsOGbyw1XaGzKeTulr5gYrEd+h7QiRDS0h4
   VBY8ctUfx8X+2xE/tGe7rFxOD2WoqWZDfV57YzYcdkrsnkFHA8pBRV9yG
   YFDzuXLORLXonD/j9aqOQZXzemEFd891hV09o/8t8fBRCbQZqDceVazYx
   ueXAzWBpdqncPJ+GxMhtUeDNfmrDBPzR/obCeYhEqqkabmVrEU8/DojHd
   nBnGMAfTmalUJgJnDe22ZfBvgt8vESkoqMt50Dh7ZFk2xEKl9vhnDkt+F
   aHa5MGnJSIfXnaL/EeiBGjkUqrK8zUbt4Rq8XafYV7QrD3Ul0e5ECeAn9
   w==;
X-CSE-ConnectionGUID: zDhYspjWTrWnb0QVGeaikQ==
X-CSE-MsgGUID: ITf96PecRqi0poUP3mup3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="677876"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="677876"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 15:19:05 -0700
X-CSE-ConnectionGUID: QAC+4EQnSpmNiL4RKvxdZA==
X-CSE-MsgGUID: PjP8GahhShWuOsJHUQqsoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1450625"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 14 Oct 2026 15:19:05 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH7JO-00000000BKR-1Nq9;
	Wed, 14 Oct 2026 22:19:02 +0000
Date: Thu, 15 Oct 2026 00:18:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kas:rcu-free/clean 11/13] mm/filemap.c:2869
 filemap_read_rcu() warn: bitwise AND condition is false here
Message-ID: <202610150009.YSyjG3rF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git rcu-free/clean
head:   25a123685f783fe2d511f44330e977304997fecc
commit: 7945beac7bf45f6e6fe50b519f2b55c3fed1cc2f [11/13] mm/filemap: read from the page cache without folio references
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: nios2-randconfig-r2200-20261014 (https://download.01.org/0day-ci/archive/20261015/202610150009.YSyjG3rF-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610150009.YSyjG3rF-lkp@intel.com/

smatch warnings:
mm/filemap.c:2869 filemap_read_rcu() warn: bitwise AND condition is false here

vim +2869 mm/filemap.c

5ccc944dce3df5f Matthew Wilcox (Oracle  2022-06-10  2830) 
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2831) /*
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2832)  * Copy from folios with PG_rcu_free without taking references, and return
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2833)  * how much was copied; the caller reads the rest.  The memory of a folio
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2834)  * is not reused before rcu_read_unlock() if the flag was seen and then
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2835)  * the folio was still in its slot.  A split can change a folio's size
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2836)  * meanwhile, so copy page by page, each page looked up in i_pages.
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2837)  */
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2838) static size_t filemap_read_rcu(struct kiocb *iocb, struct iov_iter *iter)
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2839) {
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2840) 	struct address_space *mapping = iocb->ki_filp->f_mapping;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2841) 	struct inode *inode = mapping->host;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2842) 	XA_STATE(xas, &mapping->i_pages, 0);
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2843) 	size_t copied = 0;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2844) 
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2845) 	if (!IS_ENABLED(CONFIG_PAGE_RCU_FREE) || !mapping_rcu_read(mapping))
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2846) 		return 0;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2847) 	/* An aliasing D-cache needs flush_dcache_folio(), under a reference */
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2848) 	if (cpu_dcache_is_aliasing() && mapping_writably_mapped(mapping))
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2849) 		return 0;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2850) 
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2851) 	rcu_read_lock();
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2852) 	/* A fault ends the copy: it cannot be handled here */
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2853) 	pagefault_disable();
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2854) 	while (iov_iter_count(iter) && copied < SZ_128K) {
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2855) 		loff_t pos = iocb->ki_pos;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2856) 		pgoff_t index = pos >> PAGE_SHIFT;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2857) 		size_t offset = offset_in_page(pos);
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2858) 		struct folio *folio;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2859) 		struct page *page;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2860) 		size_t bytes, n;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2861) 		loff_t isize;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2862) 
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2863) 		xas_set(&xas, index);
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2864) 		folio = xas_load(&xas);
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2865) 		if (xas_retry(&xas, folio) || !folio || xa_is_value(folio))
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2866) 			break;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2867) 
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2868) 		/* Not folio_test_rcu_free(): may be a tail page by now */
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13 @2869) 		if (!(READ_ONCE(folio->flags.f) & __PG_RCU_FREE))
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2870) 			break;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2871) 		/* Pairs with folio_test_set_rcu_free() */
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2872) 		smp_rmb();
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2873) 		if (xas_reload(&xas) != folio)
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2874) 			break;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2875) 		/* Pairs with the store into i_pages */
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2876) 		smp_rmb();
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2877) 
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2878) 		if (!folio_test_uptodate(folio) || folio_test_readahead(folio))
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2879) 			break;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2880) 		/* folio_mark_accessed() needs a reference */
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2881) 		if (!folio_mark_accessed_noop(folio))
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2882) 			break;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2883) 		page = folio_page(folio, index - folio->index);
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2884) 		/* memory_failure() waits only for readers that got past this */
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2885) 		if (PageHWPoison(page))
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2886) 			break;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2887) 
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2888) 		isize = i_size_read(inode);
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2889) 		if (pos >= isize)
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2890) 			break;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2891) 		/* A write that moved i_size used the folio in the slot */
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2892) 		if (xas_reload(&xas) != folio)
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2893) 			break;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2894) 		bytes = min_t(loff_t, isize - pos,
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2895) 			      min(iov_iter_count(iter), PAGE_SIZE - offset));
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2896) 
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2897) 		/* Not _nofault(): its usercopy check reads the folio's order */
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2898) 		n = copy_page_to_iter(page, offset, bytes, iter);
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2899) 		copied += n;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2900) 		iocb->ki_pos += n;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2901) 		if (n < bytes)
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2902) 			break;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2903) 	}
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2904) 	pagefault_enable();
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2905) 	rcu_read_unlock();
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2906) 
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2907) 	return copied;
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2908) }
7945beac7bf45f6 Kiryl Shutsemau (Meta   2026-10-13  2909) 

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
