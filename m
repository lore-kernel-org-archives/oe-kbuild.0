Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD74201278
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Oct 2024 19:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730231190; cv=none; b=GTO26lAM7ljKsZNji2e+chlO4UWpT0hx9fIdReFZDkNUpLPEXYWE5TsmCd1LmOYn6MVGgMUslcRI+Eqn4I5L0YXbvAcdGiWDepBVMyNQj1ErwnCML/VVRlQbS7ALvh65mLFbixI6D2iQMpEH0SwMiKGBDW/vAJ5kJ+kjZ9fPtOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730231190; c=relaxed/simple;
	bh=pP02t+iXqg+MFlXqeltpQ1nNYdW3aTQwsk1UtmTz3iA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SOyS+UvUGfUfpLqRRnepi4i5VdkrQTDa/RGSuntCrJzutNKSRrCO2u60yUF02vc4Zm0MIrRQBMTsMEFkwqfSHMLZ00sceYLCbu/8FIp34aLKte80AGNdgLGdnX8hYmeST5nnNYpM5e4VQIGUFjzxFjeLQz+6yTB056vT/SzGZ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OF1gE/AC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OF1gE/AC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730231189; x=1761767189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pP02t+iXqg+MFlXqeltpQ1nNYdW3aTQwsk1UtmTz3iA=;
  b=OF1gE/ACDpfgsZ2FqVaZDjdZCwNy0yUGaebeMo7jTLRQNS4e2cwphu/+
   EgwXM1CwoDwrp4a1vVcxfvruJ9X8SpojqO9yUlk+y9K0CzBVC7CJxZJ4R
   H0x3laLH5j+bzA9khCoc8RUbYEHvJF01wgBM86RFrt1x0ldDDgFaHOy6E
   dHpMlqMdpz99rwZSCdcr9FPgvHfH7c+IhXZmpPDDXJkTM16SqgYEWHQAV
   7SRdHu3FW8CjFKIxX9M40Pppta7m7ZGuBmnQ18/X7x9aPTRLrmZhyd3Ej
   1Yn+AKqy/i5FQ2NzAg2Bez8OYw8/H5aOA13xx4pAGxrGaKBmTL0Ps9mwt
   Q==;
X-CSE-ConnectionGUID: moY89ODqTFCP+NOVS45qig==
X-CSE-MsgGUID: PRdiApDqSnWk/ZXrkxiuBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="33697670"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="33697670"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 12:46:28 -0700
X-CSE-ConnectionGUID: Ts/hCcSoQBWOM6Hl3YlZeA==
X-CSE-MsgGUID: 9We/6r6YRw6bIqdNKBYbbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="86630027"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Oct 2024 12:46:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5sAa-000e4n-1S;
	Tue, 29 Oct 2024 19:46:24 +0000
Date: Wed, 30 Oct 2024 03:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-5.10 677/30000] mm/page_alloc.c:7013
 alloc_node_mem_map() warn: argument 5 to %08lx specifier is cast from
 pointer
Message-ID: <202410300336.TOK9n90M-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   b9d4c135c790a1939ec769c137cf677aefa40e2c
commit: 8d03e49505006f0034e76af1b858ad7a8fc836a2 [677/30000] ANDROID: mm: build alloc_contig_dump_pages in page_alloc.o
:::::: branch date: 25 hours ago
:::::: commit date: 3 years, 8 months ago
config: i386-randconfig-141-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300336.TOK9n90M-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410300336.TOK9n90M-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:7013 alloc_node_mem_map() warn: argument 5 to %08lx specifier is cast from pointer

vim +7013 mm/page_alloc.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  6980  
0cd842f97069c6 Oscar Salvador   2017-11-15  6981  #ifdef CONFIG_FLAT_NODE_MEM_MAP
bd721ea73e1f96 Fabian Frederick 2016-08-02  6982  static void __ref alloc_node_mem_map(struct pglist_data *pgdat)
^1da177e4c3f41 Linus Torvalds   2005-04-16  6983  {
b0aeba741b2d08 Tony Luck        2015-11-10  6984  	unsigned long __maybe_unused start = 0;
a1c34a3bf00af2 Laura Abbott     2015-11-05  6985  	unsigned long __maybe_unused offset = 0;
a1c34a3bf00af2 Laura Abbott     2015-11-05  6986  
^1da177e4c3f41 Linus Torvalds   2005-04-16  6987  	/* Skip empty nodes */
^1da177e4c3f41 Linus Torvalds   2005-04-16  6988  	if (!pgdat->node_spanned_pages)
^1da177e4c3f41 Linus Torvalds   2005-04-16  6989  		return;
^1da177e4c3f41 Linus Torvalds   2005-04-16  6990  
b0aeba741b2d08 Tony Luck        2015-11-10  6991  	start = pgdat->node_start_pfn & ~(MAX_ORDER_NR_PAGES - 1);
b0aeba741b2d08 Tony Luck        2015-11-10  6992  	offset = pgdat->node_start_pfn - start;
^1da177e4c3f41 Linus Torvalds   2005-04-16  6993  	/* ia64 gets its own node_mem_map, before this, without bootmem */
^1da177e4c3f41 Linus Torvalds   2005-04-16  6994  	if (!pgdat->node_mem_map) {
b0aeba741b2d08 Tony Luck        2015-11-10  6995  		unsigned long size, end;
d41dee369bff3b Andy Whitcroft   2005-06-23  6996  		struct page *map;
d41dee369bff3b Andy Whitcroft   2005-06-23  6997  
e984bb43f74503 Bob Picco        2006-05-20  6998  		/*
e984bb43f74503 Bob Picco        2006-05-20  6999  		 * The zone's endpoints aren't required to be MAX_ORDER
e984bb43f74503 Bob Picco        2006-05-20  7000  		 * aligned but the node_mem_map endpoints must be in order
e984bb43f74503 Bob Picco        2006-05-20  7001  		 * for the buddy allocator to function correctly.
e984bb43f74503 Bob Picco        2006-05-20  7002  		 */
108bcc96ef7047 Cody P Schafer   2013-02-22  7003  		end = pgdat_end_pfn(pgdat);
e984bb43f74503 Bob Picco        2006-05-20  7004  		end = ALIGN(end, MAX_ORDER_NR_PAGES);
e984bb43f74503 Bob Picco        2006-05-20  7005  		size =  (end - start) * sizeof(struct page);
26fb3dae0a1ec7 Mike Rapoport    2019-03-11  7006  		map = memblock_alloc_node(size, SMP_CACHE_BYTES,
26fb3dae0a1ec7 Mike Rapoport    2019-03-11  7007  					  pgdat->node_id);
23a7052a5db478 Mike Rapoport    2019-03-05  7008  		if (!map)
23a7052a5db478 Mike Rapoport    2019-03-05  7009  			panic("Failed to allocate %ld bytes for node %d memory map\n",
23a7052a5db478 Mike Rapoport    2019-03-05  7010  			      size, pgdat->node_id);
a1c34a3bf00af2 Laura Abbott     2015-11-05  7011  		pgdat->node_mem_map = map + offset;
^1da177e4c3f41 Linus Torvalds   2005-04-16  7012  	}
0cd842f97069c6 Oscar Salvador   2017-11-15 @7013  	pr_debug("%s: node %d, pgdat %08lx, node_mem_map %08lx\n",
0cd842f97069c6 Oscar Salvador   2017-11-15  7014  				__func__, pgdat->node_id, (unsigned long)pgdat,
0cd842f97069c6 Oscar Salvador   2017-11-15  7015  				(unsigned long)pgdat->node_mem_map);
12d810c1b8c2b9 Roman Zippel     2007-05-31  7016  #ifndef CONFIG_NEED_MULTIPLE_NODES
^1da177e4c3f41 Linus Torvalds   2005-04-16  7017  	/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  7018  	 * With no DISCONTIG, the global mem_map is just set as node 0's
^1da177e4c3f41 Linus Torvalds   2005-04-16  7019  	 */
c713216deebd95 Mel Gorman       2006-09-27  7020  	if (pgdat == NODE_DATA(0)) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  7021  		mem_map = NODE_DATA(0)->node_mem_map;
c713216deebd95 Mel Gorman       2006-09-27  7022  		if (page_to_pfn(mem_map) != pgdat->node_start_pfn)
a1c34a3bf00af2 Laura Abbott     2015-11-05  7023  			mem_map -= offset;
c713216deebd95 Mel Gorman       2006-09-27  7024  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  7025  #endif
^1da177e4c3f41 Linus Torvalds   2005-04-16  7026  }
0cd842f97069c6 Oscar Salvador   2017-11-15  7027  #else
0cd842f97069c6 Oscar Salvador   2017-11-15  7028  static void __ref alloc_node_mem_map(struct pglist_data *pgdat) { }
0cd842f97069c6 Oscar Salvador   2017-11-15  7029  #endif /* CONFIG_FLAT_NODE_MEM_MAP */
^1da177e4c3f41 Linus Torvalds   2005-04-16  7030  

:::::: The code at line 7013 was first introduced by commit
:::::: 0cd842f97069c68718bef21ad2dc96a0578567ec mm: make alloc_node_mem_map a void call if we don't have CONFIG_FLAT_NODE_MEM_MAP

:::::: TO: Oscar Salvador <osalvador@techadventures.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
