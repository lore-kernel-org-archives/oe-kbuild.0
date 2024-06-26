Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD42917FAAE
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jun 2024 17:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719422495; cv=none; b=lAldwOeKedQZVgAr6pfPOdc4sboA7by+bT8zgkx4wxzCHhNi5E4FBd/nuT/6l8FzICpCjuGZiAHA/er90/tYipjSHxUxQzrxkIPdxA+ZatH2e7gsspqDb1dK0aRDxL3/piDy47504WznIKkBJaPXwsvPwcUMWSB5mjVL4mqpqi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719422495; c=relaxed/simple;
	bh=BGCOhWeVwwEw11UsMFyYnC6kPUKuRy2ihQ7AmGs7B+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OhzrGsEbziK+29rD2HyOkWma4SxHknimY4oCM23vRbkqmwj9mVxSCZDvzbqHHmK1felF3slyiGPrLqUbz7NWMD24R28IEdn2dsRXkUXqGPt4OR71P7gfAMFdWmcQH7tTOBmF+UlSzIKJhTXy2vjriJeHIF2EucCB/aYrFl5/CH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T61ZG3/s; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T61ZG3/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719422494; x=1750958494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BGCOhWeVwwEw11UsMFyYnC6kPUKuRy2ihQ7AmGs7B+U=;
  b=T61ZG3/st+hrXqfyIDlLG7VSXPvkTX8wB5HVJbDhQt385x2b2n0JQlHC
   E7k9DqeIeoVW0gvg58NG98gaByxPmumQsno6tBE36XzbWyhCBkmxx7CYv
   gF54jrCLGuh+l9Ti4B5Y6S+nyD7woZXhLfY2aIEQOWzl7cJ7+728SylVn
   axB8OYp2/nnncVIpwRZqWtq4P1F0ZajCoWqTorviVi718iXfrvmd7G9VT
   SjWxsJdWfLRciJIfBYnndROg1JNcJNHk/j880eXXrufFjO6ymixdoof7e
   ZnFjLIkbSL1DsTXGWjGby/RmyQjBZsZQN+JomBBLdBn9MqFwcIgpHUMEU
   w==;
X-CSE-ConnectionGUID: sT67itotRZaM3o/kAd67CA==
X-CSE-MsgGUID: 96/el3NATlmSjV4N6vWFWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27198014"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="27198014"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 10:17:48 -0700
X-CSE-ConnectionGUID: f+C/tAzcSzuvbh8IJ9keIA==
X-CSE-MsgGUID: QojHdgvQQRO/xBDKF4K4Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="49042127"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Jun 2024 10:17:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMWHA-000FQI-1R;
	Wed, 26 Jun 2024 17:17:44 +0000
Date: Thu, 27 Jun 2024 01:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7701/8232] mm/huge_memory.c:2735
 __discard_anon_folio_pmd_locked() error: uninitialized symbol 'page'.
Message-ID: <202406270108.7yneS068-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Lance Yang <ioworker0@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
commit: 4627108658d68fad359600dbe667b88b501cee71 [7701/8232] mm/vmscan: avoid split lazyfree THP during shrink_folio_list()
:::::: branch date: 25 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240626 (https://download.01.org/0day-ci/archive/20240627/202406270108.7yneS068-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406270108.7yneS068-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:2735 __discard_anon_folio_pmd_locked() error: uninitialized symbol 'page'.

vim +/page +2735 mm/huge_memory.c

e9b61f19858a5d Kirill A. Shutemov 2016-01-15  2691  
4627108658d68f Lance Yang         2024-06-14  2692  static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
4627108658d68f Lance Yang         2024-06-14  2693  					    unsigned long addr, pmd_t *pmdp,
4627108658d68f Lance Yang         2024-06-14  2694  					    struct folio *folio)
4627108658d68f Lance Yang         2024-06-14  2695  {
4627108658d68f Lance Yang         2024-06-14  2696  	struct mm_struct *mm = vma->vm_mm;
4627108658d68f Lance Yang         2024-06-14  2697  	int ref_count, map_count;
4627108658d68f Lance Yang         2024-06-14  2698  	pmd_t orig_pmd = *pmdp;
4627108658d68f Lance Yang         2024-06-14  2699  	struct page *page;
4627108658d68f Lance Yang         2024-06-14  2700  
4627108658d68f Lance Yang         2024-06-14  2701  	if (folio_test_dirty(folio) || pmd_dirty(orig_pmd))
4627108658d68f Lance Yang         2024-06-14  2702  		return false;
4627108658d68f Lance Yang         2024-06-14  2703  
4627108658d68f Lance Yang         2024-06-14  2704  	orig_pmd = pmdp_huge_clear_flush(vma, addr, pmdp);
4627108658d68f Lance Yang         2024-06-14  2705  
4627108658d68f Lance Yang         2024-06-14  2706  	/*
4627108658d68f Lance Yang         2024-06-14  2707  	 * Syncing against concurrent GUP-fast:
4627108658d68f Lance Yang         2024-06-14  2708  	 * - clear PMD; barrier; read refcount
4627108658d68f Lance Yang         2024-06-14  2709  	 * - inc refcount; barrier; read PMD
4627108658d68f Lance Yang         2024-06-14  2710  	 */
4627108658d68f Lance Yang         2024-06-14  2711  	smp_mb();
4627108658d68f Lance Yang         2024-06-14  2712  
4627108658d68f Lance Yang         2024-06-14  2713  	ref_count = folio_ref_count(folio);
4627108658d68f Lance Yang         2024-06-14  2714  	map_count = folio_mapcount(folio);
4627108658d68f Lance Yang         2024-06-14  2715  
4627108658d68f Lance Yang         2024-06-14  2716  	/*
4627108658d68f Lance Yang         2024-06-14  2717  	 * Order reads for folio refcount and dirty flag
4627108658d68f Lance Yang         2024-06-14  2718  	 * (see comments in __remove_mapping()).
4627108658d68f Lance Yang         2024-06-14  2719  	 */
4627108658d68f Lance Yang         2024-06-14  2720  	smp_rmb();
4627108658d68f Lance Yang         2024-06-14  2721  
4627108658d68f Lance Yang         2024-06-14  2722  	/*
4627108658d68f Lance Yang         2024-06-14  2723  	 * If the folio or its PMD is redirtied at this point, or if there
4627108658d68f Lance Yang         2024-06-14  2724  	 * are unexpected references, we will give up to discard this folio
4627108658d68f Lance Yang         2024-06-14  2725  	 * and remap it.
4627108658d68f Lance Yang         2024-06-14  2726  	 *
4627108658d68f Lance Yang         2024-06-14  2727  	 * The only folio refs must be one from isolation plus the rmap(s).
4627108658d68f Lance Yang         2024-06-14  2728  	 */
4627108658d68f Lance Yang         2024-06-14  2729  	if (folio_test_dirty(folio) || pmd_dirty(orig_pmd) ||
4627108658d68f Lance Yang         2024-06-14  2730  	    ref_count != map_count + 1) {
4627108658d68f Lance Yang         2024-06-14  2731  		set_pmd_at(mm, addr, pmdp, orig_pmd);
4627108658d68f Lance Yang         2024-06-14  2732  		return false;
4627108658d68f Lance Yang         2024-06-14  2733  	}
4627108658d68f Lance Yang         2024-06-14  2734  
4627108658d68f Lance Yang         2024-06-14 @2735  	folio_remove_rmap_pmd(folio, page, vma);
4627108658d68f Lance Yang         2024-06-14  2736  	zap_deposited_table(mm, pmdp);
4627108658d68f Lance Yang         2024-06-14  2737  	add_mm_counter(mm, MM_ANONPAGES, -HPAGE_PMD_NR);
4627108658d68f Lance Yang         2024-06-14  2738  	if (vma->vm_flags & VM_LOCKED)
4627108658d68f Lance Yang         2024-06-14  2739  		mlock_drain_local();
4627108658d68f Lance Yang         2024-06-14  2740  	folio_put(folio);
4627108658d68f Lance Yang         2024-06-14  2741  
4627108658d68f Lance Yang         2024-06-14  2742  	return true;
4627108658d68f Lance Yang         2024-06-14  2743  }
4627108658d68f Lance Yang         2024-06-14  2744  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
