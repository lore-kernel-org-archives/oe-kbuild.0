Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795251423;
	b=zL88o0N8kVJjoYSGLCvYEBp3UIwRitt5v3ao/vbiLnbjxflA8hC4jSOa0h2DmzE66YVL
	 MIdZiQIumBvjKPOhcBW9oBDyL0QedmLKGF6l1/CyGKjzOgLH/5SeZ8BOfKdKUQ0l6dwYq
	 hPmzLeKQycQBQd/52/CWBT25H/WsKqXJVfZlZ36TtqNl4UpdeiZ6jEDiCmG3pP2VjfWlM
	 FoqjIpBt7Yih2Io42ZkGOA64mlRbL6FqeUQwnpkJj3qTomX8ONO/0LUvdRQgTaefQZLk+
	 YAevlt/83rC1PNJgrfsLY4WrOqoZSNexbH97m2uilX/Ap52pzAj7TP5n41nWZ8FFQVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795251423;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=sFlGeLcvqAQd4jEuUPW28w92YV2bBcosvAaKCQ8K7x4=;
	b=GIlsuwD6Jnq9XSQZgBkpmuNs5Oxr4Ysmvij6TAOt+5jw3uVBoiqNfXuBvuoT6XqjWYaL
	 /mK+rBEDxhIVzkthKROgv5KB9JU+kF417IcCytOXMZE627Kcn7AJLRnIlqJhYi/VLaidD
	 cbZvlnlUFLdH0Avih7Dtz3ez+0bgtchHnFMlwBdRi3kfAgZR5chI+XzUJRdqhv6F801r6
	 nXuh2jCOQXSXJuLkdNinnJMbrzF2wRy59ZfLbka/YUrHsG/PiSSI8szfGB9YYj+K39x2Q
	 RoF3rIQXl4iv8SFV/exPs8cNnnN6R6mOz2HlUcuGEt4fPO3u79wgRfZOLJX85xRnMyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dby7i3cZ;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98787606A320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 08:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98787606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dby7i3cZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795251423; x=1826787423;
  h=date:from:to:cc:subject:message-id;
  bh=2rPSvOps8uqU0m6FbgWEP+ZSnh62maUkv6Q3CwFyCOo=;
  b=dby7i3cZfIfCL+Ryb89+3XGKQQ1shtTjRUJmGUhpQJiaBcs2fcya1spF
   MUlMZqKq2HVqEA4jDwsF4Yj0c8MzO3FuBAcBRYLvEtxyS3ReLtTfLe5mT
   iXPfpnC9HB/mMTi4/X7PesDQDGDdii2TtC9F4/zgGbiVHO558actg9Lv+
   KN2k5GKCy9MnRc/+TeSDMDh0bMxMevDw2s+YZlZJo54naJ5UXvlxsPfPO
   z5E1USSfwb3atBQnEpO2v1SEnHga0a6gIU0LoOvYzv/2zduPxtFV3E1LY
   K0M8g9OX0lYRBoHo8ezNxD9b01ES/6iZK3MpBJx/kayQ4MtfAqmHhdL9L
   Q==;
X-CSE-ConnectionGUID: sYwe8nQoTAyv7EH/Psz6aw==
X-CSE-MsgGUID: HhQRI6dvR46eKWA9cM+o1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3971089"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="3971089"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 00:57:02 -0800
X-CSE-ConnectionGUID: loHeRogLQHGs7LxAL4jwmw==
X-CSE-MsgGUID: oTzkQdFdQyWwZZRE0Tcgdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="11297012"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 21 Nov 2026 00:57:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUgtz-000000004Hk-4AhD;
	Sat, 21 Nov 2026 08:56:55 +0000
Date: Sat, 21 Nov 2026 09:56:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rppt:generic-set-memory/rfc-v2 56/59]
 arch/s390/mm/pageattr.c:88 cpa_large_to_pte() warn: bitwise AND condition is
 false here
Message-ID: <20261121095353.DyLuRJaj-lkp@intel.com>
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
CC: Mike Rapoport <rppt@kernel.org>
TO: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git generic-set-memory/rfc-v2
head:   a095c48646998ad2b7c07e66d9f48b528ff46e21
commit: 689e3b924f92d9b5627fd5ad0075b36ad635b176 [56/59] s390: use the generic change_page_attr() core
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: s390-randconfig-2200-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121095353.DyLuRJaj-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261121095353.DyLuRJaj-lkp@intel.com/

smatch warnings:
arch/s390/mm/pageattr.c:88 cpa_large_to_pte() warn: bitwise AND condition is false here
arch/s390/mm/pageattr.c:114 cpa_pte_to_large() warn: bitwise AND condition is false here

vim +88 arch/s390/mm/pageattr.c

e8a97e42dc986a Heiko Carstens            2016-05-17   75  
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   76) static unsigned long cpa_large_to_pte(unsigned long val)
e8a97e42dc986a Heiko Carstens            2016-05-17   77  {
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   78) 	unsigned long prot = 0;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   79) 
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   80) 	if (val & _SEGMENT_ENTRY_PRESENT)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   81) 		prot |= _PAGE_PRESENT;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   82) 	if (val & _SEGMENT_ENTRY_INVALID)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   83) 		prot |= _PAGE_INVALID;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   84) 	if (val & _SEGMENT_ENTRY_PROTECT)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   85) 		prot |= _PAGE_PROTECT;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   86) 	if (val & _SEGMENT_ENTRY_NOEXEC)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   87) 		prot |= _PAGE_NOEXEC;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  @88) 	if (val & _SEGMENT_ENTRY_SOFT_DIRTY)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   89) 		prot |= _PAGE_SOFT_DIRTY;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   90) 	if (val & _SEGMENT_ENTRY_YOUNG)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   91) 		prot |= _PAGE_YOUNG;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   92) 	if (val & _SEGMENT_ENTRY_DIRTY)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   93) 		prot |= _PAGE_DIRTY;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   94) 	if (val & _SEGMENT_ENTRY_READ)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   95) 		prot |= _PAGE_READ;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   96) 	if (val & _SEGMENT_ENTRY_WRITE)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   97) 		prot |= _PAGE_WRITE;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   98) 
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12   99) 	return prot;
0490d6d7ba0a47 Heiko Carstens            2023-04-14  100  }
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  101) 
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  102) static unsigned long cpa_pte_to_large(unsigned long prot)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  103) {
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  104) 	unsigned long val = _SEGMENT_ENTRY_LARGE;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  105) 
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  106) 	if (prot & _PAGE_PRESENT)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  107) 		val |= _SEGMENT_ENTRY_PRESENT;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  108) 	if (prot & _PAGE_INVALID)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  109) 		val |= _SEGMENT_ENTRY_INVALID;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  110) 	if (prot & _PAGE_PROTECT)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  111) 		val |= _SEGMENT_ENTRY_PROTECT;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  112) 	if (prot & _PAGE_NOEXEC)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  113) 		val |= _SEGMENT_ENTRY_NOEXEC;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12 @114) 	if (prot & _PAGE_SOFT_DIRTY)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  115) 		val |= _SEGMENT_ENTRY_SOFT_DIRTY;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  116) 	if (prot & _PAGE_YOUNG)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  117) 		val |= _SEGMENT_ENTRY_YOUNG;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  118) 	if (prot & _PAGE_DIRTY)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  119) 		val |= _SEGMENT_ENTRY_DIRTY;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  120) 	if (prot & _PAGE_READ)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  121) 		val |= _SEGMENT_ENTRY_READ;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  122) 	if (prot & _PAGE_WRITE)
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  123) 		val |= _SEGMENT_ENTRY_WRITE;
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  124) 
689e3b924f92d9 Mike Rapoport (Microsoft  2026-11-12  125) 	return val;
e8a97e42dc986a Heiko Carstens            2016-05-17  126  }
e8a97e42dc986a Heiko Carstens            2016-05-17  127  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
