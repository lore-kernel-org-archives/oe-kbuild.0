Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792463118;
	b=Gt5YMA/KQ/AxO7QDjoMzhANkpuEOnFg7Rb5lKEbFTAUwQ1Sf7PiQ2I1iqmP9D+K75crl
	 blp3P3p75FVw9ajRDR5Y5sF1UkheTQDjDs5A0y1nyjXZ+8Kv3VYQijV4VDmy7wsCaXvNE
	 9IeWFica+9tx3rLpKrLYRvlvNr954nwN4r2HQ5FaqVz9P3rZlUOKfUSGWJFhgMJYK5ZQ2
	 ORZytXe4R4IO/qEFKefVzN00vOD+XrBCMmdOCxhC7lmyeoEDEFh/AdiXZbESiQnCis10a
	 gPs6dK2oDSOHDEf923ZkkKzMKp2/ADXYNG0p7jeEKh5ct3MIX9bIxRVzh7g80KvTdXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463118;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Eix4fG/I0B5UF5+w3236MvBWtZG894HQrtNGiiIMrPc=;
	b=q1xYRg/w4GGHBmG15qlf7oDSroIG5sExZ5fvrQ1XV2tLza2lgzG52dHeRlpItYZ/WkIc
	 n9YNloz77KLn0VxL8ci5AEu8OWo1dk4WYY3iipAoiRFnUwIoyhaVWUHyfTJX3ShJ/YnCt
	 g8P+LJbR/gU+aZN0O0ep0MOvL3QKApTLGIndO+SHW0ti5cHOTHjGB66i4SnGRh/OEYcqv
	 kxmn00ufJS4ELXbi4hDvIamxfHhP5Va4ufxgg++Jct/VLh14CAPHW9x+r4SjUte/mcGUP
	 4X218vjAvWGySk/V+B1zcCSbTfHu3w6vbQZnY1dxVrIePMEz24K4CVQtN/gCaerl9Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TfZtmq9l;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449EB606A31F
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Oct 2026 02:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 449EB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TfZtmq9l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792463118; x=1823999118;
  h=date:from:to:cc:subject:message-id;
  bh=E9raTl/8V0Mum+H5kxLs2TdugXz1QYvL7pbKJIINnHY=;
  b=TfZtmq9liM1DBtPCWe+8NpXWj1yPKROhDlSur1wkETHJAiLYaJfPWzQW
   fYlc7NBxAimZbv/hP1YChbWWbuQJGg7pY84/1pxoUTslykwlWO9tfuKjG
   Vm2Rc5SABlu+Okr6cKLf+DwurlNCb7xh3Uv9VZwL18DC6wWRMoQZA8+3R
   OAOK5rtTaYVSUe0eaulgXyyxUSu2stgZ9wgX8eN4wVY0aw+HF42U612cR
   /ORpOpi1BmaOXH83zW3HkkpLrlSNkySSaV0qhX8VGK28r+FXhh0qZjnCG
   smEcVHvritKBPc94haEQiVW9bVeENvvtONu60w7AZDQ8nsGqzAjJuWhp6
   g==;
X-CSE-ConnectionGUID: qkfarq+zRKGNsZr2DgnS+A==
X-CSE-MsgGUID: 6yvoY509RJuoakqZ5Ptkqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1040082"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1040082"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 19:25:17 -0700
X-CSE-ConnectionGUID: IimNIHgDQR2N6U5aMYh9ZA==
X-CSE-MsgGUID: xze5keOMRj2veWAks3qqGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2747334"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2026 19:25:16 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIzXN-0000000063L-2Oq3;
	Tue, 20 Oct 2026 02:25:13 +0000
Date: Tue, 20 Oct 2026 04:24:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-5.15 9/9] mm/page_alloc.c:7727
 alloc_node_mem_map() warn: argument 5 to %08lx specifier is cast from pointer
Message-ID: <202610200415.3cc6xT3Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   40edfa11d1c7da2d302618d181eb78ebdfe52839
commit: 1b6d55eb480526f334f52cbc93379a0e301f1938 [9/9] ANDROID: mm: build alloc_contig_dump_pages in page_alloc.o
:::::: branch date: 15 hours ago
:::::: commit date: 3 years, 10 months ago
config: i386-randconfig-2200-20261020 (https://download.01.org/0day-ci/archive/20261020/202610200415.3cc6xT3Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610200415.3cc6xT3Z-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:7727 alloc_node_mem_map() warn: argument 5 to %08lx specifier is cast from pointer

vim +7727 mm/page_alloc.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  7694  
43b02ba93b25b1c Mike Rapoport  2021-06-28  7695  #ifdef CONFIG_FLATMEM
3b446da6be7a722 Mike Rapoport  2021-09-02  7696  static void __init alloc_node_mem_map(struct pglist_data *pgdat)
^1da177e4c3f415 Linus Torvalds 2005-04-16  7697  {
b0aeba741b2d082 Tony Luck      2015-11-10  7698  	unsigned long __maybe_unused start = 0;
a1c34a3bf00af2c Laura Abbott   2015-11-05  7699  	unsigned long __maybe_unused offset = 0;
a1c34a3bf00af2c Laura Abbott   2015-11-05  7700  
^1da177e4c3f415 Linus Torvalds 2005-04-16  7701  	/* Skip empty nodes */
^1da177e4c3f415 Linus Torvalds 2005-04-16  7702  	if (!pgdat->node_spanned_pages)
^1da177e4c3f415 Linus Torvalds 2005-04-16  7703  		return;
^1da177e4c3f415 Linus Torvalds 2005-04-16  7704  
b0aeba741b2d082 Tony Luck      2015-11-10  7705  	start = pgdat->node_start_pfn & ~(MAX_ORDER_NR_PAGES - 1);
b0aeba741b2d082 Tony Luck      2015-11-10  7706  	offset = pgdat->node_start_pfn - start;
^1da177e4c3f415 Linus Torvalds 2005-04-16  7707  	/* ia64 gets its own node_mem_map, before this, without bootmem */
^1da177e4c3f415 Linus Torvalds 2005-04-16  7708  	if (!pgdat->node_mem_map) {
b0aeba741b2d082 Tony Luck      2015-11-10  7709  		unsigned long size, end;
d41dee369bff3b9 Andy Whitcroft 2005-06-23  7710  		struct page *map;
d41dee369bff3b9 Andy Whitcroft 2005-06-23  7711  
e984bb43f745031 Bob Picco      2006-05-20  7712  		/*
e984bb43f745031 Bob Picco      2006-05-20  7713  		 * The zone's endpoints aren't required to be MAX_ORDER
e984bb43f745031 Bob Picco      2006-05-20  7714  		 * aligned but the node_mem_map endpoints must be in order
e984bb43f745031 Bob Picco      2006-05-20  7715  		 * for the buddy allocator to function correctly.
e984bb43f745031 Bob Picco      2006-05-20  7716  		 */
108bcc96ef7047c Cody P Schafer 2013-02-22  7717  		end = pgdat_end_pfn(pgdat);
e984bb43f745031 Bob Picco      2006-05-20  7718  		end = ALIGN(end, MAX_ORDER_NR_PAGES);
e984bb43f745031 Bob Picco      2006-05-20  7719  		size =  (end - start) * sizeof(struct page);
c803b3c8b3b70f3 Mike Rapoport  2021-09-02  7720  		map = memmap_alloc(size, SMP_CACHE_BYTES, MEMBLOCK_LOW_LIMIT,
c803b3c8b3b70f3 Mike Rapoport  2021-09-02  7721  				   pgdat->node_id, false);
23a7052a5db478b Mike Rapoport  2019-03-05  7722  		if (!map)
23a7052a5db478b Mike Rapoport  2019-03-05  7723  			panic("Failed to allocate %ld bytes for node %d memory map\n",
23a7052a5db478b Mike Rapoport  2019-03-05  7724  			      size, pgdat->node_id);
a1c34a3bf00af2c Laura Abbott   2015-11-05  7725  		pgdat->node_mem_map = map + offset;
^1da177e4c3f415 Linus Torvalds 2005-04-16  7726  	}
0cd842f97069c68 Oscar Salvador 2017-11-15 @7727  	pr_debug("%s: node %d, pgdat %08lx, node_mem_map %08lx\n",
0cd842f97069c68 Oscar Salvador 2017-11-15  7728  				__func__, pgdat->node_id, (unsigned long)pgdat,
0cd842f97069c68 Oscar Salvador 2017-11-15  7729  				(unsigned long)pgdat->node_mem_map);
a9ee6cf5c60ed10 Mike Rapoport  2021-06-28  7730  #ifndef CONFIG_NUMA
^1da177e4c3f415 Linus Torvalds 2005-04-16  7731  	/*
^1da177e4c3f415 Linus Torvalds 2005-04-16  7732  	 * With no DISCONTIG, the global mem_map is just set as node 0's
^1da177e4c3f415 Linus Torvalds 2005-04-16  7733  	 */
c713216deebd95d Mel Gorman     2006-09-27  7734  	if (pgdat == NODE_DATA(0)) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  7735  		mem_map = NODE_DATA(0)->node_mem_map;
c713216deebd95d Mel Gorman     2006-09-27  7736  		if (page_to_pfn(mem_map) != pgdat->node_start_pfn)
a1c34a3bf00af2c Laura Abbott   2015-11-05  7737  			mem_map -= offset;
c713216deebd95d Mel Gorman     2006-09-27  7738  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  7739  #endif
^1da177e4c3f415 Linus Torvalds 2005-04-16  7740  }
0cd842f97069c68 Oscar Salvador 2017-11-15  7741  #else
3b446da6be7a722 Mike Rapoport  2021-09-02  7742  static inline void alloc_node_mem_map(struct pglist_data *pgdat) { }
43b02ba93b25b1c Mike Rapoport  2021-06-28  7743  #endif /* CONFIG_FLATMEM */
^1da177e4c3f415 Linus Torvalds 2005-04-16  7744  

:::::: The code at line 7727 was first introduced by commit
:::::: 0cd842f97069c68718bef21ad2dc96a0578567ec mm: make alloc_node_mem_map a void call if we don't have CONFIG_FLAT_NODE_MEM_MAP

:::::: TO: Oscar Salvador <osalvador@techadventures.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
