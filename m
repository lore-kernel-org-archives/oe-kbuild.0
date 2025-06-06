Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927781EEA4D
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jun 2025 18:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749236123; cv=none; b=Zr7XqL9jhJ3k0pNhcIzPiyhp91m0VvvioEp/XPbiSXCb2AwH6gDUlb2ODzG80kzoW14uDn9IH5Nt66eyn4cgXxTBANy43mnexLZYCk86bgbL6gBh8GxEwGzYPE/TeSEEQn4RIP+ju8VAPGtm71vGVnJSfRloeqQpdp3KLuiHL0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749236123; c=relaxed/simple;
	bh=Jk9MGtAcogRQCjqqGQ2OeFNPFRxQewHewZyHbJXBNNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=edV3AKEjLm4ZokCwiVQW1LiFoF31aJMk00xI8Sg77h05dzc7efmNXGwBy1TJRHaVvkSV83NPBpQZaL6aKikAKGLkrH5OCZjwdUOYQC80SpoiVqeTS9BdubZPi4oa+O6boM4YPtnemNTLEE7jadanTBj9iIGMT6uogZqNmy5ZI1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWy/K07L; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWy/K07L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749236121; x=1780772121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jk9MGtAcogRQCjqqGQ2OeFNPFRxQewHewZyHbJXBNNA=;
  b=fWy/K07LStjN19pgzJy/xiY8ySpzjZqECcEW1eVF+VbVJuDafY1BkPLL
   iXVMF/z17fjfES3a5DuSOds8xMH3ntB6RpwMl1IwQ0B/7d2/qp2V6h6R+
   n+zGfx6/wFww4eDqJwu+oSgqgFoqcQ1Ie/BRlO3871/J8P54PSxJka8Zt
   9Z20xeMbLYl+uVipVGSMRqNPkrcv7kqe73vA/g3mtjnyfFSqR0CXVjnd2
   LEsyXWYaidHpCkz/QBZo8fmO3MXz/jYoNNeZ9OeTmgPwTEQfFJBNC/F4i
   K5rE8r5VVBrgpmOKhft625NfG73p9wIwCK6Tapo3HekcQLa7REqwjMS2d
   w==;
X-CSE-ConnectionGUID: 4bqC1MHHRyG34/iPQ5x8+g==
X-CSE-MsgGUID: MidgBxbgTFOwVM6opIoxZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51303638"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="51303638"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 11:55:19 -0700
X-CSE-ConnectionGUID: cDhXoq20R6OMbo5pNNgtBg==
X-CSE-MsgGUID: +pWejTWnTDWPTNq0BHu8TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="145797823"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Jun 2025 11:55:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNcDj-0005DN-1p;
	Fri, 06 Jun 2025 18:55:15 +0000
Date: Sat, 7 Jun 2025 02:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4] gup: optimize longterm pin_user_pages() for large
 folio
Message-ID: <202506070247.dgcE3AlK-lkp@intel.com>
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
In-Reply-To: <20250606023742.58344-1-lizhe.67@bytedance.com>
References: <20250606023742.58344-1-lizhe.67@bytedance.com>
TO: lizhe.67@bytedance.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.15 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/lizhe-67-bytedance-com/gup-optimize-longterm-pin_user_pages-for-large-folio/20250606-103931
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250606023742.58344-1-lizhe.67%40bytedance.com
patch subject: [PATCH v4] gup: optimize longterm pin_user_pages() for large folio
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-randconfig-r072-20250606 (https://download.01.org/0day-ci/archive/20250607/202506070247.dgcE3AlK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506070247.dgcE3AlK-lkp@intel.com/

New smatch warnings:
mm/gup.c:2333 collect_longterm_unpinnable_folios() warn: iterator 'i' not incremented

Old smatch warnings:
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +/i +2333 mm/gup.c

856f87e4a35ad3 Li Zhe                  2025-06-06  2323  
f68749ec342b5f Pavel Tatashin          2021-05-04  2324  /*
53ba78de064b6a Vivek Kasireddy         2024-06-23  2325   * Returns the number of collected folios. Return value is always >= 0.
f68749ec342b5f Pavel Tatashin          2021-05-04  2326   */
1aaf8c122918aa Zhaoyang Huang          2025-01-21  2327  static void collect_longterm_unpinnable_folios(
53ba78de064b6a Vivek Kasireddy         2024-06-23  2328  		struct list_head *movable_folio_list,
94efde1d15399f John Hubbard            2024-11-04  2329  		struct pages_or_folios *pofs)
9a4e9f3b2d7393 Aneesh Kumar K.V        2019-03-05  2330  {
67e139b02d9949 Alistair Popple         2022-08-24  2331  	bool drain_allow = true;
856f87e4a35ad3 Li Zhe                  2025-06-06  2332  	struct folio *folio;
856f87e4a35ad3 Li Zhe                  2025-06-06 @2333  	long i = 0;
f9f38f78c5d5ee Christoph Hellwig       2022-02-16  2334  
856f87e4a35ad3 Li Zhe                  2025-06-06  2335  	for (folio = pofs_get_folio(pofs, i); folio;
856f87e4a35ad3 Li Zhe                  2025-06-06  2336  		 folio = pofs_next_folio(folio, pofs, &i)) {
f9f38f78c5d5ee Christoph Hellwig       2022-02-16  2337  
67e139b02d9949 Alistair Popple         2022-08-24  2338  		if (folio_is_longterm_pinnable(folio))
67e139b02d9949 Alistair Popple         2022-08-24  2339  			continue;
b05a79d4377f6d Alistair Popple         2022-07-15  2340  
67e139b02d9949 Alistair Popple         2022-08-24  2341  		if (folio_is_device_coherent(folio))
f9f38f78c5d5ee Christoph Hellwig       2022-02-16  2342  			continue;
f9f38f78c5d5ee Christoph Hellwig       2022-02-16  2343  
1b7f7e58decccb Matthew Wilcox (Oracle  2022-02-17  2344) 		if (folio_test_hugetlb(folio)) {
4c640f128074e0 David Hildenbrand       2025-01-13  2345  			folio_isolate_hugetlb(folio, movable_folio_list);
f9f38f78c5d5ee Christoph Hellwig       2022-02-16  2346  			continue;
f9f38f78c5d5ee Christoph Hellwig       2022-02-16  2347  		}
f9f38f78c5d5ee Christoph Hellwig       2022-02-16  2348  
1b7f7e58decccb Matthew Wilcox (Oracle  2022-02-17  2349) 		if (!folio_test_lru(folio) && drain_allow) {
9a4e9f3b2d7393 Aneesh Kumar K.V        2019-03-05  2350  			lru_add_drain_all();
9a4e9f3b2d7393 Aneesh Kumar K.V        2019-03-05  2351  			drain_allow = false;
9a4e9f3b2d7393 Aneesh Kumar K.V        2019-03-05  2352  		}
9a4e9f3b2d7393 Aneesh Kumar K.V        2019-03-05  2353  
be2d57563822b7 Baolin Wang             2023-02-15  2354  		if (!folio_isolate_lru(folio))
6e7f34ebb8d25d Pavel Tatashin          2021-05-04  2355  			continue;
67e139b02d9949 Alistair Popple         2022-08-24  2356  
53ba78de064b6a Vivek Kasireddy         2024-06-23  2357  		list_add_tail(&folio->lru, movable_folio_list);
1b7f7e58decccb Matthew Wilcox (Oracle  2022-02-17  2358) 		node_stat_mod_folio(folio,
1b7f7e58decccb Matthew Wilcox (Oracle  2022-02-17  2359) 				    NR_ISOLATED_ANON + folio_is_file_lru(folio),
1b7f7e58decccb Matthew Wilcox (Oracle  2022-02-17  2360) 				    folio_nr_pages(folio));
9a4e9f3b2d7393 Aneesh Kumar K.V        2019-03-05  2361  	}
67e139b02d9949 Alistair Popple         2022-08-24  2362  }
67e139b02d9949 Alistair Popple         2022-08-24  2363  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
