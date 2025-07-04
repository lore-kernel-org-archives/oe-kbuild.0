Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4552E370E
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Jul 2025 16:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647761; cv=none; b=OyuYLmR6s0iyRYIn/uSszX3BDKqxUM5G8MoJafNFOrEuLBIVP2AigmdF4HgseTQy5+CucuWng5/gO+58nVdc4a5OuBphoyVOH+KnCkj/3LFxd2yvWQlTb4izztddHKDh8rPgaLHOV9wrWXyZwg1c1/Fas1KrZxFJvSji3emhzrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647761; c=relaxed/simple;
	bh=JgUNoHU7Rx9iEzEZnaYqByT6Ew6wPFB5gzoZO5+l150=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KL/DUBLJ0xBTP4n3oe7vEWP6H414mmrVsJjJ+aDbNghe03hTdNWQk1578ZauvGlm9QNfyBHddxskW59JhMfRQq/1noZx/Epbas+4Rhfq8HTfsOkiGunEOeEtaUuTTezXZitWfup3VG7ACmJemfZby8rX1xe7Elhf/KnvHzm6voA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ymd/xb/8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ymd/xb/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751647759; x=1783183759;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JgUNoHU7Rx9iEzEZnaYqByT6Ew6wPFB5gzoZO5+l150=;
  b=Ymd/xb/8ZThbNL9luGN8QCH0CCsHiX/72Ugq9Uc3EWdkODGQShS0CbKP
   /AIVAscSPaEijavl52ZrVzsp6ZViQDnAaAWC2OFf7AhfZgBupR32tbDQt
   8WPOvE1WGJY9ErMaW3gFcRyh5XZwgdcdcGkGC6cGDxc9YXFaPluoRRIlg
   UP7NuIjROLAGvYGRWO+9XpOjud7m6bN7A82DtwuNSV+IKpOnUu4w0U9tG
   Ju62OlnsRRxveB6IOJwVq0UZOqlpr/Lt+nDPfF6hRFR7Ne4B/hqbDxrkz
   H2ogjDqUkfq0c/Mid44oSMPDbwtIgDQhnkXZTx2iC58TAuygrMoSe5eHY
   g==;
X-CSE-ConnectionGUID: gPk+ReWhRgKjHspfdLCCaQ==
X-CSE-MsgGUID: eKlH61SgSEaAXOcNgcYVpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53906722"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="53906722"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:49:19 -0700
X-CSE-ConnectionGUID: iszXcAgRSoGRjAlDBv8jwg==
X-CSE-MsgGUID: He2CclD/T02oNQrfolVMhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="160202583"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jul 2025 09:49:18 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXjbA-0003vN-05;
	Fri, 04 Jul 2025 16:49:16 +0000
Date: Sat, 5 Jul 2025 00:48:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [v1 resend 01/12] mm/zone_device: support large zone device
 private folios
Message-ID: <202507050047.XLLs8aYY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250703233511.2028395-2-balbirs@nvidia.com>
References: <20250703233511.2028395-2-balbirs@nvidia.com>
TO: Balbir Singh <balbirs@nvidia.com>
TO: linux-mm@kvack.org
CC: akpm@linux-foundation.org
CC: linux-kernel@vger.kernel.org
CC: Balbir Singh <balbirs@nvidia.com>
CC: Karol Herbst <kherbst@redhat.com>
CC: Lyude Paul <lyude@redhat.com>
CC: Danilo Krummrich <dakr@kernel.org>
CC: David Airlie <airlied@gmail.com>
CC: Simona Vetter <simona@ffwll.ch>
CC: "Jérôme Glisse" <jglisse@redhat.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: David Hildenbrand <david@redhat.com>
CC: Barry Song <baohua@kernel.org>
CC: Baolin Wang <baolin.wang@linux.alibaba.com>
CC: Ryan Roberts <ryan.roberts@arm.com>
CC: Matthew Wilcox <willy@infradead.org>
CC: Peter Xu <peterx@redhat.com>
CC: Zi Yan <ziy@nvidia.com>
CC: Kefeng Wang <wangkefeng.wang@huawei.com>
CC: Jane Chu <jane.chu@oracle.com>
CC: Alistair Popple <apopple@nvidia.com>
CC: Donet Tom <donettom@linux.ibm.com>

Hi Balbir,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on akpm-mm/mm-nonmm-unstable shuah-kselftest/next shuah-kselftest/fixes linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Balbir-Singh/mm-zone_device-support-large-zone-device-private-folios/20250704-073807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250703233511.2028395-2-balbirs%40nvidia.com
patch subject: [v1 resend 01/12] mm/zone_device: support large zone device private folios
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm64-randconfig-002-20250704 (https://download.01.org/0day-ci/archive/20250705/202507050047.XLLs8aYY-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507050047.XLLs8aYY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507050047.XLLs8aYY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memremap.c:510:33: error: call to '__compiletime_assert_714' declared with 'error' attribute: BUILD_BUG failed
     510 |         WARN_ON_ONCE(order && order != HPAGE_PMD_ORDER);
         |                                        ^
   include/linux/huge_mm.h:114:26: note: expanded from macro 'HPAGE_PMD_ORDER'
     114 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
         |                          ^
   include/linux/huge_mm.h:110:28: note: expanded from macro 'HPAGE_PMD_SHIFT'
     110 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:556:2: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:549:4: note: expanded from macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:16:1: note: expanded from here
      16 | __compiletime_assert_714
         | ^
   1 error generated.


vim +510 mm/memremap.c

75e55d8a107edb Christoph Hellwig 2022-02-16  503  
082c3dc9c91f7e Balbir Singh      2025-07-04  504  void init_zone_device_folio(struct folio *folio, unsigned int order)
ef233450898f88 Alistair Popple   2022-09-28  505  {
082c3dc9c91f7e Balbir Singh      2025-07-04  506  	struct page *page = folio_page(folio, 0);
082c3dc9c91f7e Balbir Singh      2025-07-04  507  
082c3dc9c91f7e Balbir Singh      2025-07-04  508  	VM_BUG_ON(order > MAX_ORDER_NR_PAGES);
082c3dc9c91f7e Balbir Singh      2025-07-04  509  
082c3dc9c91f7e Balbir Singh      2025-07-04 @510  	WARN_ON_ONCE(order && order != HPAGE_PMD_ORDER);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
