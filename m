Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943586;
	b=nLcjAXpGNQfJqYgfkBMyd5X2h2qW5/TdUXYlPkmjSQG96MJP1qmu6D9j+XN5bVZ8o3ya
	 BvcZN0xdXdf+3uBPRPs4I8J5sASljomDRBiTP+w12rjxHivE7DxO/0U4CdFmS2AeHz4Ke
	 6OUeRvOq8notL02xgZjuIVVOoaTFeXuWj/ezTxY3Imv0xxYRyQbfKcokbPP82/Pc1MNtu
	 EacZAvHodrXgthrALdzPRwjWDbrOMKjEUw/TN3r+ZfIClVVc48pTwQXOgjRzMIA/rS7yJ
	 6y2HZReimx3+oHfGHr5LUxEQwPAZBSCYCmmpjkSgDhjGoz31BBUZZBhicX5LZcUACzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943586;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+/r6Zt+0pvLXjqRyXBUcz9o0yD48T4S59nrKM4Q/kI0=;
	b=RkJEN2389zI7dKLi1W8dvfGU4o5YaRyDOlXgFL3oLE44QeQL82bgKufQ8AkRF9R1A3EO
	 +9jlSTh79aCGujFXa6P4WoeUen++kfehmqLa+/A5SYem+9H6iuzAXlIzuvkys3sG9Zod6
	 ZcvZY2gavWxguKHYmEE5Vgu0TcpT/vrBVfJs0BJL4tmaGQHktiLAFG2gW2RV3Lt7p2pQD
	 ckGzbAwsS0fA8Eu0bQm3r+pq9VzzSXqj0LJXtxAg1N1ymmLX4eQ4D096itZPKFooA+gR+
	 2YsQnQp4YwYmtzvyJoHqRpoKkGH2c9Fw0Cw7JbWys6/EA2TVzS0+stO6hsDrXYM0DrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b0FdJg0s;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBD2606A32C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 19:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BBD2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b0FdJg0s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794943586; x=1826479586;
  h=date:from:to:cc:subject:message-id;
  bh=1+yj3UE1O2XooayFw2NywB0BiLrtkLtcSsv/f5jOBlg=;
  b=b0FdJg0sVm6ScqjIncTVOnnIRcZOn4Wei0/mv3zBfivEg1z5qHUknSPp
   E8L9incZ9oWdzQ/ie0njRc9WI0au1xUqmSG9dPg0w4ll0UP7FZYQn+lyU
   fDurCN364Mq1Wgh818/zxn8ZyjXVdTahG6yagr1NQXDbi2buJ/vCAVdfX
   ID59CIYN/8ziLXHgghApMtBM7t0l1SrFDaRbr42oc790tG0xxb8K7hIHm
   bl+CnAujkW0qCmi/hqg2iu7BMY78ogdMrzonspmOK3xcjapy7SZOygZrE
   mWUodDTxMAnJej17PLXMkuCXvghI4In5K+gcHMbZLLE1k9LwL6ZyiBUVb
   A==;
X-CSE-ConnectionGUID: GkbO56BZQGqk37peSv6Cxg==
X-CSE-MsgGUID: eHu5+8U8Q1elYMdxa7SDsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3741713"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3741713"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 11:26:25 -0800
X-CSE-ConnectionGUID: j/BhkExDR6+jpDbnjMwFxg==
X-CSE-MsgGUID: bJZJKqEjSUCGNF+DZ40DEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11737760"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 17 Nov 2026 11:26:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTOow-000000003Be-2AoT;
	Tue, 17 Nov 2026 19:26:22 +0000
Date: Tue, 17 Nov 2026 20:25:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-lts 205/205]
 mm/pagewalk.c:590:5: warning: no previous prototype for
 'walk_page_range_debug'
Message-ID: <20261117201829.3eSjdrxM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Lorenzo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   824580839cbc0d47e64dd2bbdef66590a57ef92d
commit: 56a45fdbe5b254d952bdfd9891be3330b831ff0d [205/205] mm/pagewalk: split walk_page_range_novma() into kernel/user parts
:::::: branch date: 30 hours ago
:::::: commit date: 3 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261117/20261117201829.3eSjdrxM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117201829.3eSjdrxM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261117201829.3eSjdrxM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/pagewalk.c:590:5: warning: no previous prototype for 'walk_page_range_debug' [-Wmissing-prototypes]
     590 | int walk_page_range_debug(struct mm_struct *mm, unsigned long start,
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/walk_page_range_debug +590 mm/pagewalk.c

56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  574  
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  575  /**
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  576   * walk_page_range_debug - walk a range of pagetables not backed by a vma
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  577   * @mm:		mm_struct representing the target process of page table walk
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  578   * @start:	start address of the virtual address range
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  579   * @end:	end address of the virtual address range
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  580   * @ops:	operation to call during the walk
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  581   * @pgd:	pgd to walk if different from mm->pgd
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  582   * @private:	private data for callbacks' usage
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  583   *
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  584   * Similar to walk_page_range() but can walk any page tables even if they are
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  585   * not backed by VMAs. Because 'unusual' entries may be walked this function
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  586   * will also not lock the PTEs for the pte_entry() callback.
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  587   *
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  588   * This is for debugging purposes ONLY.
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  589   */
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14 @590  int walk_page_range_debug(struct mm_struct *mm, unsigned long start,
488ae6a2b933cb5 Steven Price    2020-02-03  591  			  unsigned long end, const struct mm_walk_ops *ops,
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  592  			  pgd_t *pgd, void *private)
488ae6a2b933cb5 Steven Price    2020-02-03  593  {
488ae6a2b933cb5 Steven Price    2020-02-03  594  	struct mm_walk walk = {
488ae6a2b933cb5 Steven Price    2020-02-03  595  		.ops		= ops,
488ae6a2b933cb5 Steven Price    2020-02-03  596  		.mm		= mm,
e47690d756a7605 Steven Price    2020-02-03  597  		.pgd		= pgd,
488ae6a2b933cb5 Steven Price    2020-02-03  598  		.private	= private,
488ae6a2b933cb5 Steven Price    2020-02-03  599  		.no_vma		= true
488ae6a2b933cb5 Steven Price    2020-02-03  600  	};
488ae6a2b933cb5 Steven Price    2020-02-03  601  
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  602  	/* For convenience, we allow traversal of kernel mappings. */
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  603  	if (mm == &init_mm)
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  604  		return walk_kernel_page_table_range(start, end, ops,
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  605  						    pgd, private);
488ae6a2b933cb5 Steven Price    2020-02-03  606  	if (start >= end || !walk.mm)
488ae6a2b933cb5 Steven Price    2020-02-03  607  		return -EINVAL;
488ae6a2b933cb5 Steven Price    2020-02-03  608  
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  609  	/*
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  610  	 * The mmap lock protects the page walker from changes to the page
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  611  	 * tables during the walk.  However a read lock is insufficient to
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  612  	 * protect those areas which don't have a VMA as munmap() detaches
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  613  	 * the VMAs before downgrading to a read lock and actually tearing
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  614  	 * down PTEs/page tables. In which case, the mmap write lock should
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  615  	 * be held.
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  616  	 */
56a45fdbe5b254d Lorenzo Stoakes 2026-08-14  617  	mmap_assert_write_locked(mm);
488ae6a2b933cb5 Steven Price    2020-02-03  618  
8782fb61cc84836 Steven Price    2022-09-02  619  	return walk_pgd_range(start, end, &walk);
488ae6a2b933cb5 Steven Price    2020-02-03  620  }
488ae6a2b933cb5 Steven Price    2020-02-03  621  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
