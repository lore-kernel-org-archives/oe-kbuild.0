Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B171FD7
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 03:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llCtwj7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700451658; x=1731987658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=clccnqeQ+n0C1fnuPQtiFwGVtyoEqM31YaWpjafnGVU=;
  b=llCtwj7zLSsIOQbenNdqiRxQML+WZ9iuyrSo6YKFtXT8c9r9NJoAxfwg
   qbogWvrNimOEdAPeXfN/zHggSGZPYk6UjMvPn/XfnOr6knBAjpxwYEVmo
   SkJFVmAy9wpIhZ7hRl0H4QRlIDsfJJfWOvwvjG/fkv+wUcalHiLgZjaae
   Snroy+48tRG/bNBY8Qb6n91prZ8ZSo0bPxNUMjWxlA5RsBF5Z/bemm1wD
   bWchbciM4LHaMaFmAmavJML5ewpy3TeGJ1hoMdpsvJ2q02FuAXSBhUlLu
   oMt7c93UGEwg17j8bSTMD2+qY+Ak3HrxwSDEnrtgN9CQ8XfkoUEpTNdXe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="388685674"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="388685674"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 19:40:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="716096696"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="716096696"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 19 Nov 2023 19:40:55 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4v9Y-0005uc-2h;
	Mon, 20 Nov 2023 03:40:52 +0000
Date: Mon, 20 Nov 2023 11:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 03/24] mm/swap: move no readahead swapin code to a stand
 alone helper
Message-ID: <202311201135.iG2KLShW-lkp@intel.com>
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
In-Reply-To: <20231119194740.94101-4-ryncsn@gmail.com>
References: <20231119194740.94101-4-ryncsn@gmail.com>
TO: Kairui Song <ryncsn@gmail.com>
TO: linux-mm@kvack.org
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Huang, Ying" <ying.huang@intel.com>
CC: David Hildenbrand <david@redhat.com>
CC: Hugh Dickins <hughd@google.com>
CC: Johannes Weiner <hannes@cmpxchg.org>
CC: Matthew Wilcox <willy@infradead.org>
CC: Michal Hocko <mhocko@suse.com>
CC: linux-kernel@vger.kernel.org
CC: Kairui Song <kasong@tencent.com>

Hi Kairui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.7-rc2 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-swap-fix-a-potential-undefined-behavior-issue/20231120-035926
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231119194740.94101-4-ryncsn%40gmail.com
patch subject: [PATCH 03/24] mm/swap: move no readahead swapin code to a stand alone helper
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: um-randconfig-r081-20231120 (https://download.01.org/0day-ci/archive/20231120/202311201135.iG2KLShW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231120/202311201135.iG2KLShW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311201135.iG2KLShW-lkp@intel.com/

smatch warnings:
mm/swap_state.c:881 swapin_no_readahead() warn: use 'gfp_mask' here instead of GFP_KERNEL?

vim +/gfp_mask +881 mm/swap_state.c

d9bfcfdc41e8e5 Huang Ying  2017-09-06  855  
19f582d2684e47 Kairui Song 2023-11-20  856  /**
19f582d2684e47 Kairui Song 2023-11-20  857   * swapin_no_readahead - swap in pages skipping swap cache and readahead
19f582d2684e47 Kairui Song 2023-11-20  858   * @entry: swap entry of this memory
19f582d2684e47 Kairui Song 2023-11-20  859   * @gfp_mask: memory allocation flags
19f582d2684e47 Kairui Song 2023-11-20  860   * @vmf: fault information
19f582d2684e47 Kairui Song 2023-11-20  861   *
19f582d2684e47 Kairui Song 2023-11-20  862   * Returns the struct page for entry and addr after the swap entry is read
19f582d2684e47 Kairui Song 2023-11-20  863   * in.
19f582d2684e47 Kairui Song 2023-11-20  864   */
19f582d2684e47 Kairui Song 2023-11-20  865  struct page *swapin_no_readahead(swp_entry_t entry, gfp_t gfp_mask,
19f582d2684e47 Kairui Song 2023-11-20  866  				 struct vm_fault *vmf)
19f582d2684e47 Kairui Song 2023-11-20  867  {
19f582d2684e47 Kairui Song 2023-11-20  868  	struct vm_area_struct *vma = vmf->vma;
19f582d2684e47 Kairui Song 2023-11-20  869  	struct page *page = NULL;
19f582d2684e47 Kairui Song 2023-11-20  870  	struct folio *folio;
19f582d2684e47 Kairui Song 2023-11-20  871  	void *shadow = NULL;
19f582d2684e47 Kairui Song 2023-11-20  872  
19f582d2684e47 Kairui Song 2023-11-20  873  	folio = vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0,
19f582d2684e47 Kairui Song 2023-11-20  874  				vma, vmf->address, false);
19f582d2684e47 Kairui Song 2023-11-20  875  	if (folio) {
19f582d2684e47 Kairui Song 2023-11-20  876  		__folio_set_locked(folio);
19f582d2684e47 Kairui Song 2023-11-20  877  		__folio_set_swapbacked(folio);
19f582d2684e47 Kairui Song 2023-11-20  878  
19f582d2684e47 Kairui Song 2023-11-20  879  		if (mem_cgroup_swapin_charge_folio(folio,
19f582d2684e47 Kairui Song 2023-11-20  880  					vma->vm_mm, GFP_KERNEL,
19f582d2684e47 Kairui Song 2023-11-20 @881  					entry)) {
19f582d2684e47 Kairui Song 2023-11-20  882  			folio_unlock(folio);
19f582d2684e47 Kairui Song 2023-11-20  883  			folio_put(folio);
19f582d2684e47 Kairui Song 2023-11-20  884  			return NULL;
19f582d2684e47 Kairui Song 2023-11-20  885  		}
19f582d2684e47 Kairui Song 2023-11-20  886  		mem_cgroup_swapin_uncharge_swap(entry);
19f582d2684e47 Kairui Song 2023-11-20  887  
19f582d2684e47 Kairui Song 2023-11-20  888  		shadow = get_shadow_from_swap_cache(entry);
19f582d2684e47 Kairui Song 2023-11-20  889  		if (shadow)
19f582d2684e47 Kairui Song 2023-11-20  890  			workingset_refault(folio, shadow);
19f582d2684e47 Kairui Song 2023-11-20  891  
19f582d2684e47 Kairui Song 2023-11-20  892  		folio_add_lru(folio);
19f582d2684e47 Kairui Song 2023-11-20  893  
19f582d2684e47 Kairui Song 2023-11-20  894  		/* To provide entry to swap_readpage() */
19f582d2684e47 Kairui Song 2023-11-20  895  		folio->swap = entry;
19f582d2684e47 Kairui Song 2023-11-20  896  		page = &folio->page;
19f582d2684e47 Kairui Song 2023-11-20  897  		swap_readpage(page, true, NULL);
19f582d2684e47 Kairui Song 2023-11-20  898  		folio->private = NULL;
19f582d2684e47 Kairui Song 2023-11-20  899  	}
19f582d2684e47 Kairui Song 2023-11-20  900  
19f582d2684e47 Kairui Song 2023-11-20  901  	return page;
19f582d2684e47 Kairui Song 2023-11-20  902  }
19f582d2684e47 Kairui Song 2023-11-20  903  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
