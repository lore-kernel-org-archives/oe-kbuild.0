Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F81A8475
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Jun 2024 14:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717252834; cv=none; b=Jm/cOUAIieBxTzqh61HX/OnUsHvPL94AzpK0aYdaT3VJ8F8QNbBRbO+7FtD+v/zyJhhtj6yxfGP9I4BWEWh+BOKz9YWWb5Ep9jf7lL/1MnPcRLjRyBLSiUUWhE+xxFuHUq7AuBjjZiBxWdDIrkdoH16JSt8skoB5e3hVxcTFF0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717252834; c=relaxed/simple;
	bh=SnqyB9ICMrjcVmmjbq8CpxxsiJwlEgUodR3HhMKaLKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uVFvzUgXc7SQ0xVHbFoD9H0COWLjhZTKxrmSNXMoXvkbVb00eGr03DVn8udeHizOZiBKVUYjw1I6U57MdKqjk71JYI3fCCoyemA95PdV2Tagm449Ad80yDBD1eMvw942AiC9IcvH5GTERZ2Ammx5P3Hv4ZjVgdH/+z4SHGqiGdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n55dlLAs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n55dlLAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717252833; x=1748788833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SnqyB9ICMrjcVmmjbq8CpxxsiJwlEgUodR3HhMKaLKk=;
  b=n55dlLAsGwQ3sH/AzomzDR6uM0sbycPKKqIK/Zkp/yqD3D+8tBvACyhd
   zyuz2eVloiEATQowdJbmS77j44RMzQC20uHaE3vBMPp9q5LICcUIaZtaN
   k2cL2ogLK8r/D8a2T6YOfcHX14OXxGue5ricnzXJW9HN8v3pGKPFsp2dE
   3mBYDiYKuHAV89AO6FMOUyHAu3Dpsw/Xp4MmI4/Hqb6n3saCGq+Tp1xIT
   ReVPF35k58BfpK0wagW+yJtNBYQRn+B/5HpkdISMCYvCFGaL8IZxheOuq
   U8YaXrcWE6ed+xyUjIQs0AEMbaXQOgTbCRTrHn4MIer8ZjZ04e1ypqqDs
   w==;
X-CSE-ConnectionGUID: 8Ly9AtwRRIaNEtC2L9QeCQ==
X-CSE-MsgGUID: 601TFxAHTAW1LY0chJR0Iw==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="24912041"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="24912041"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 07:40:32 -0700
X-CSE-ConnectionGUID: GEndzdtRTui8m/nC6Hc3xg==
X-CSE-MsgGUID: LSfyu3omTVGWWhzhmPtGrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="37077455"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2024 07:40:30 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDPuF-000Izj-32;
	Sat, 01 Jun 2024 14:40:27 +0000
Date: Sat, 1 Jun 2024 22:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [davidhildenbrand:page_mapcount 6/7] fs/proc/task_mmu.c:1544
 pagemap_pmd_range() error: uninitialized symbol 'folio'.
Message-ID: <202406012258.3xEFL8ob-lkp@intel.com>
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
TO: David Hildenbrand <david@redhat.com>

tree:   https://github.com/davidhildenbrand/linux page_mapcount
head:   f54bed3e71781a4daf354bb79926d200160cb5c8
commit: 2c1f45c11958c33f452011cb4f02df574b3c341f [6/7] fs/proc: move page_mapcount() to fs/proc/internal.h
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-141-20240601 (https://download.01.org/0day-ci/archive/20240601/202406012258.3xEFL8ob-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406012258.3xEFL8ob-lkp@intel.com/

smatch warnings:
fs/proc/task_mmu.c:1544 pagemap_pmd_range() error: uninitialized symbol 'folio'.

vim +/folio +1544 fs/proc/task_mmu.c

84c3fc4e9c563d8 Zi Yan                2017-09-08  1533  
2c1f45c11958c33 David Hildenbrand     2024-05-19  1534  		if (page) {
2c1f45c11958c33 David Hildenbrand     2024-05-19  1535  			folio = page_folio(page);
2c1f45c11958c33 David Hildenbrand     2024-05-19  1536  			if (!folio_test_anon(folio))
1a4c3f09a7cd2ef David Hildenbrand     2024-05-19  1537  				flags |= PM_FILE;
2c1f45c11958c33 David Hildenbrand     2024-05-19  1538  		}
356515e7b64c262 Konstantin Khlebnikov 2015-09-08  1539  
499ee938d882fee David Hildenbrand     2024-05-21  1540  		for (; addr != end; addr += PAGE_SIZE, idx++) {
499ee938d882fee David Hildenbrand     2024-05-21  1541  			unsigned long cur_flags = flags;
499ee938d882fee David Hildenbrand     2024-05-21  1542  			pagemap_entry_t pme;
499ee938d882fee David Hildenbrand     2024-05-21  1543  
2c1f45c11958c33 David Hildenbrand     2024-05-19 @1544  			if (folio && (flags & PM_PRESENT) &&
2c1f45c11958c33 David Hildenbrand     2024-05-19  1545  			    folio_precise_page_mapcount(folio, page + idx) == 1)
499ee938d882fee David Hildenbrand     2024-05-21  1546  				cur_flags |= PM_MMAP_EXCLUSIVE;
5aaabe831eb527e Naoya Horiguchi       2012-03-21  1547  
499ee938d882fee David Hildenbrand     2024-05-21  1548  			pme = make_pme(frame, cur_flags);
cabbb6d51e2af4f Hui Zhu               2024-01-11  1549  			err = add_to_pagemap(&pme, pm);
5aaabe831eb527e Naoya Horiguchi       2012-03-21  1550  			if (err)
5aaabe831eb527e Naoya Horiguchi       2012-03-21  1551  				break;
ab6ecf247a9321e Huang Ying            2018-06-07  1552  			if (pm->show_pfn) {
ab6ecf247a9321e Huang Ying            2018-06-07  1553  				if (flags & PM_PRESENT)
356515e7b64c262 Konstantin Khlebnikov 2015-09-08  1554  					frame++;
88c28f2469151b0 Huang Ying            2018-04-20  1555  				else if (flags & PM_SWAP)
88c28f2469151b0 Huang Ying            2018-04-20  1556  					frame += (1 << MAX_SWAPFILES_SHIFT);
5aaabe831eb527e Naoya Horiguchi       2012-03-21  1557  			}
ab6ecf247a9321e Huang Ying            2018-06-07  1558  		}
bf929152e9f6c49 Kirill A. Shutemov    2013-11-14  1559  		spin_unlock(ptl);
5aaabe831eb527e Naoya Horiguchi       2012-03-21  1560  		return err;
5aaabe831eb527e Naoya Horiguchi       2012-03-21  1561  	}
356515e7b64c262 Konstantin Khlebnikov 2015-09-08  1562  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
bcf8039ed45f560 Dave Hansen           2008-06-12  1563  
81d0fa623c5b8db Peter Feiner          2014-10-09  1564  	/*
f995ece24dfecb3 Naoya Horiguchi       2015-02-11  1565  	 * We can assume that @vma always points to a valid one and @end never
f995ece24dfecb3 Naoya Horiguchi       2015-02-11  1566  	 * goes beyond vma->vm_end.
81d0fa623c5b8db Peter Feiner          2014-10-09  1567  	 */
356515e7b64c262 Konstantin Khlebnikov 2015-09-08  1568  	orig_pte = pte = pte_offset_map_lock(walk->mm, pmdp, addr, &ptl);
7780d04046a2288 Hugh Dickins          2023-06-08  1569  	if (!pte) {
7780d04046a2288 Hugh Dickins          2023-06-08  1570  		walk->action = ACTION_AGAIN;
7780d04046a2288 Hugh Dickins          2023-06-08  1571  		return err;
7780d04046a2288 Hugh Dickins          2023-06-08  1572  	}
f995ece24dfecb3 Naoya Horiguchi       2015-02-11  1573  	for (; addr < end; pte++, addr += PAGE_SIZE) {
81d0fa623c5b8db Peter Feiner          2014-10-09  1574  		pagemap_entry_t pme;
05fbf357d941521 Konstantin Khlebnikov 2015-02-11  1575  
c33c794828f2121 Ryan Roberts          2023-06-12  1576  		pme = pte_to_pagemap_entry(pm, vma, addr, ptep_get(pte));
cabbb6d51e2af4f Hui Zhu               2024-01-11  1577  		err = add_to_pagemap(&pme, pm);
85863e475e59afb Matt Mackall          2008-02-04  1578  		if (err)
05fbf357d941521 Konstantin Khlebnikov 2015-02-11  1579  			break;
85863e475e59afb Matt Mackall          2008-02-04  1580  	}
05fbf357d941521 Konstantin Khlebnikov 2015-02-11  1581  	pte_unmap_unlock(orig_pte, ptl);
05fbf357d941521 Konstantin Khlebnikov 2015-02-11  1582  
85863e475e59afb Matt Mackall          2008-02-04  1583  	cond_resched();
85863e475e59afb Matt Mackall          2008-02-04  1584  
85863e475e59afb Matt Mackall          2008-02-04  1585  	return err;
85863e475e59afb Matt Mackall          2008-02-04  1586  }
85863e475e59afb Matt Mackall          2008-02-04  1587  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
