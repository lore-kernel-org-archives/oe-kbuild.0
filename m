Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6340274FED
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 08:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917193; cv=none; b=A/NZQ3fz/wszv2AZHfJKxxjc6OxeUIe7TsUeRDm80O+kLJd5k8SosEjTyzIy360hEfrWmyY3y8lGqbZMPJMXjm5PkLDegj0dbMtLnrxZ7oLntyeATAU5hGzoNyC6HZrCYUTEgi1zZwTz9AfYLn5wMvHVwYBAal/FsvcrdtViI8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917193; c=relaxed/simple;
	bh=H+VkYaeengcDmZ89aTwW5qG1TGAboCUhTeHSlMsKZIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qfQRTXJaTgcpaMtRXgM3HfrwxiYCd5x3eWxvVk+SJ2HgAvEje+fB94yIQ3pbsUR/rAYSMnMOjZaCkGPAmhKDu5qekM8RGchCYvIkvF4fm6thYe24HBrocZ7ERWYionSFznVtBZrnBLzEkB67RUsWcP9jHp4FOj96/J1qpAPi3gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHrN/Ir8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHrN/Ir8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745917192; x=1777453192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H+VkYaeengcDmZ89aTwW5qG1TGAboCUhTeHSlMsKZIE=;
  b=IHrN/Ir8YkT+xvk5IiCGy2svTnZ7Chz+CnS7YMreWlkgo9dUHop4Vp37
   lzKmfdts8fAMZoeSgGJZpd0jHRs6qE4y9AG1DsCZCmUWKz3o3K/iWtq7c
   Kt0S+cNgG02w5epmSI8mOKTMvsecgfl7trYZb3+qkYyV2JH8A4YSjSl+T
   dlUX/6aqhAeq6lg//xjzWab0hBQ/wi5JcSvZUup5LwNO/WDM9pbpDVzzw
   dBg2dVl2j9grD8zNaKSYLRV4TF2SjrekpWhgEz0+JU3wFThhoVsiJPKHn
   K1+Frt1iW+7PbyaKiWS/UE0h2jDszoRlG0GYAnXP/8gk+Egj2D60DS0Qq
   A==;
X-CSE-ConnectionGUID: 5SZ5MLZoQDeNJfcDvUv57Q==
X-CSE-MsgGUID: cgjb8PjUQMGEy+HU806j+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47669581"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="47669581"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 01:59:51 -0700
X-CSE-ConnectionGUID: c2WYlY/3TTKyme8S4L0zrg==
X-CSE-MsgGUID: pVBrjrDYTy65JI/c7qvVvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="138756814"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Apr 2025 01:59:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9god-0000bX-1u;
	Tue, 29 Apr 2025 08:59:47 +0000
Date: Tue, 29 Apr 2025 16:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-5.15 1/1] mm/page_alloc.c:7727
 alloc_node_mem_map() warn: argument 5 to %08lx specifier is cast from
 pointer
Message-ID: <202504291641.IJ9OMldh-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   72c5444cd5a90b322c55d9df9b536afa21a76a78
commit: 1b6d55eb480526f334f52cbc93379a0e301f1938 [1/1] ANDROID: mm: build alloc_contig_dump_pages in page_alloc.o
:::::: branch date: 3 days ago
:::::: commit date: 2 years, 4 months ago
config: i386-randconfig-141-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291641.IJ9OMldh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504291641.IJ9OMldh-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:7727 alloc_node_mem_map() warn: argument 5 to %08lx specifier is cast from pointer

vim +7727 mm/page_alloc.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  7694  
43b02ba93b25b1 Mike Rapoport  2021-06-28  7695  #ifdef CONFIG_FLATMEM
3b446da6be7a72 Mike Rapoport  2021-09-02  7696  static void __init alloc_node_mem_map(struct pglist_data *pgdat)
^1da177e4c3f41 Linus Torvalds 2005-04-16  7697  {
b0aeba741b2d08 Tony Luck      2015-11-10  7698  	unsigned long __maybe_unused start = 0;
a1c34a3bf00af2 Laura Abbott   2015-11-05  7699  	unsigned long __maybe_unused offset = 0;
a1c34a3bf00af2 Laura Abbott   2015-11-05  7700  
^1da177e4c3f41 Linus Torvalds 2005-04-16  7701  	/* Skip empty nodes */
^1da177e4c3f41 Linus Torvalds 2005-04-16  7702  	if (!pgdat->node_spanned_pages)
^1da177e4c3f41 Linus Torvalds 2005-04-16  7703  		return;
^1da177e4c3f41 Linus Torvalds 2005-04-16  7704  
b0aeba741b2d08 Tony Luck      2015-11-10  7705  	start = pgdat->node_start_pfn & ~(MAX_ORDER_NR_PAGES - 1);
b0aeba741b2d08 Tony Luck      2015-11-10  7706  	offset = pgdat->node_start_pfn - start;
^1da177e4c3f41 Linus Torvalds 2005-04-16  7707  	/* ia64 gets its own node_mem_map, before this, without bootmem */
^1da177e4c3f41 Linus Torvalds 2005-04-16  7708  	if (!pgdat->node_mem_map) {
b0aeba741b2d08 Tony Luck      2015-11-10  7709  		unsigned long size, end;
d41dee369bff3b Andy Whitcroft 2005-06-23  7710  		struct page *map;
d41dee369bff3b Andy Whitcroft 2005-06-23  7711  
e984bb43f74503 Bob Picco      2006-05-20  7712  		/*
e984bb43f74503 Bob Picco      2006-05-20  7713  		 * The zone's endpoints aren't required to be MAX_ORDER
e984bb43f74503 Bob Picco      2006-05-20  7714  		 * aligned but the node_mem_map endpoints must be in order
e984bb43f74503 Bob Picco      2006-05-20  7715  		 * for the buddy allocator to function correctly.
e984bb43f74503 Bob Picco      2006-05-20  7716  		 */
108bcc96ef7047 Cody P Schafer 2013-02-22  7717  		end = pgdat_end_pfn(pgdat);
e984bb43f74503 Bob Picco      2006-05-20  7718  		end = ALIGN(end, MAX_ORDER_NR_PAGES);
e984bb43f74503 Bob Picco      2006-05-20  7719  		size =  (end - start) * sizeof(struct page);
c803b3c8b3b70f Mike Rapoport  2021-09-02  7720  		map = memmap_alloc(size, SMP_CACHE_BYTES, MEMBLOCK_LOW_LIMIT,
c803b3c8b3b70f Mike Rapoport  2021-09-02  7721  				   pgdat->node_id, false);
23a7052a5db478 Mike Rapoport  2019-03-05  7722  		if (!map)
23a7052a5db478 Mike Rapoport  2019-03-05  7723  			panic("Failed to allocate %ld bytes for node %d memory map\n",
23a7052a5db478 Mike Rapoport  2019-03-05  7724  			      size, pgdat->node_id);
a1c34a3bf00af2 Laura Abbott   2015-11-05  7725  		pgdat->node_mem_map = map + offset;
^1da177e4c3f41 Linus Torvalds 2005-04-16  7726  	}
0cd842f97069c6 Oscar Salvador 2017-11-15 @7727  	pr_debug("%s: node %d, pgdat %08lx, node_mem_map %08lx\n",
0cd842f97069c6 Oscar Salvador 2017-11-15  7728  				__func__, pgdat->node_id, (unsigned long)pgdat,
0cd842f97069c6 Oscar Salvador 2017-11-15  7729  				(unsigned long)pgdat->node_mem_map);
a9ee6cf5c60ed1 Mike Rapoport  2021-06-28  7730  #ifndef CONFIG_NUMA
^1da177e4c3f41 Linus Torvalds 2005-04-16  7731  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  7732  	 * With no DISCONTIG, the global mem_map is just set as node 0's
^1da177e4c3f41 Linus Torvalds 2005-04-16  7733  	 */
c713216deebd95 Mel Gorman     2006-09-27  7734  	if (pgdat == NODE_DATA(0)) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  7735  		mem_map = NODE_DATA(0)->node_mem_map;
c713216deebd95 Mel Gorman     2006-09-27  7736  		if (page_to_pfn(mem_map) != pgdat->node_start_pfn)
a1c34a3bf00af2 Laura Abbott   2015-11-05  7737  			mem_map -= offset;
c713216deebd95 Mel Gorman     2006-09-27  7738  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  7739  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  7740  }
0cd842f97069c6 Oscar Salvador 2017-11-15  7741  #else
3b446da6be7a72 Mike Rapoport  2021-09-02  7742  static inline void alloc_node_mem_map(struct pglist_data *pgdat) { }
43b02ba93b25b1 Mike Rapoport  2021-06-28  7743  #endif /* CONFIG_FLATMEM */
^1da177e4c3f41 Linus Torvalds 2005-04-16  7744  

:::::: The code at line 7727 was first introduced by commit
:::::: 0cd842f97069c68718bef21ad2dc96a0578567ec mm: make alloc_node_mem_map a void call if we don't have CONFIG_FLAT_NODE_MEM_MAP

:::::: TO: Oscar Salvador <osalvador@techadventures.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
