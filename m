Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F7846AC
	for <oe-kbuild@lists.linux.dev>; Wed,  3 May 2023 11:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683111916; x=1714647916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hbsSVBaG2bstSOArJhHiV6zZ/f1pwEWWMjEYXWwxDEY=;
  b=NPkoLEiwDg+PXssSZhcrB3O77kqphZmj2/qJ87Ha91Vg+B3dVm5bKn3Z
   gMTGDaYHZJ5ijjBFOWFkWuQ7Il7LAtxfeEPeAz4ABAkJvYlrLHjbDMjKo
   afn2HgEAkouEZKsBqwYUZpCJmM147k2XZjzCfbL4/8/Nvi6X/rT1R0Ct5
   SD2FH4zBQYcaFpNSgcVY9/obfQxvAQqqKALk6NMIY/ITepWKjYmhbXAiq
   /ljYMlEpvls+e+EN9ssQhgWNCWc4LfCcCH/I9KnCVddznrZWDHVWiAdLy
   6ioY5cZkXwq7CqnrMShxUZmE36mVa9EYZf/NnXTNb7/aJxn+ayE9uHWC/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="346106735"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="346106735"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 04:05:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="761450720"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="761450720"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 May 2023 04:05:14 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puAIM-0001wQ-0X;
	Wed, 03 May 2023 11:05:14 +0000
Date: Wed, 3 May 2023 19:04:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/memory_hotplug.c:351 __add_pages() error: uninitialized symbol
 'err'.
Message-ID: <202305031919.9RYWKySX-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Anshuman Khandual <anshuman.khandual@arm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Hildenbrand <david@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   348551ddaf311c76b01cdcbaf61b6fef06a49144
commit: 943189db4f3ed1445dd630dc0b96e115357c4330 mm/memory_hotplug: drop 'reason' argument from check_pfn_span()
date:   11 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-m041-20230428 (https://download.01.org/0day-ci/archive/20230503/202305031919.9RYWKySX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305031919.9RYWKySX-lkp@intel.com/

smatch warnings:
mm/memory_hotplug.c:351 __add_pages() error: uninitialized symbol 'err'.

vim +/err +351 mm/memory_hotplug.c

9f605f260594f99 Dan Williams      2021-02-25  309  
7ea6216049ff9cf Dan Williams      2019-07-18  310  int __ref __add_pages(int nid, unsigned long pfn, unsigned long nr_pages,
f5637d3b42ab046 Logan Gunthorpe   2020-04-10  311  		struct mhp_params *params)
4edd7ceff0662af David Rientjes    2013-04-29  312  {
6cdd0b30a920b35 David Hildenbrand 2020-04-06  313  	const unsigned long end_pfn = pfn + nr_pages;
6cdd0b30a920b35 David Hildenbrand 2020-04-06  314  	unsigned long cur_nr_pages;
9a845030427c7a2 Dan Williams      2019-07-18  315  	int err;
f5637d3b42ab046 Logan Gunthorpe   2020-04-10  316  	struct vmem_altmap *altmap = params->altmap;
4b94ffdc4163bae Dan Williams      2016-01-15  317  
6366238b8dfc383 liusongtang       2022-05-09  318  	if (WARN_ON_ONCE(!pgprot_val(params->pgprot)))
bfeb022f8fe4c5a Logan Gunthorpe   2020-04-10  319  		return -EINVAL;
bfeb022f8fe4c5a Logan Gunthorpe   2020-04-10  320  
bca3feaa0764ab5 Anshuman Khandual 2021-02-25  321  	VM_BUG_ON(!mhp_range_allowed(PFN_PHYS(pfn), nr_pages * PAGE_SIZE, false));
dca4436d1cf9e0d Alastair D'Silva  2019-11-30  322  
4b94ffdc4163bae Dan Williams      2016-01-15  323  	if (altmap) {
4b94ffdc4163bae Dan Williams      2016-01-15  324  		/*
4b94ffdc4163bae Dan Williams      2016-01-15  325  		 * Validate altmap is within bounds of the total request
4b94ffdc4163bae Dan Williams      2016-01-15  326  		 */
7ea6216049ff9cf Dan Williams      2019-07-18  327  		if (altmap->base_pfn != pfn
4b94ffdc4163bae Dan Williams      2016-01-15  328  				|| vmem_altmap_offset(altmap) > nr_pages) {
4b94ffdc4163bae Dan Williams      2016-01-15  329  			pr_warn_once("memory add fail, invalid altmap\n");
7ea6216049ff9cf Dan Williams      2019-07-18  330  			return -EINVAL;
4b94ffdc4163bae Dan Williams      2016-01-15  331  		}
4b94ffdc4163bae Dan Williams      2016-01-15  332  		altmap->alloc = 0;
4b94ffdc4163bae Dan Williams      2016-01-15  333  	}
4b94ffdc4163bae Dan Williams      2016-01-15  334  
943189db4f3ed14 Anshuman Khandual 2022-05-31  335  	if (check_pfn_span(pfn, nr_pages)) {
943189db4f3ed14 Anshuman Khandual 2022-05-31  336  		WARN(1, "Misaligned %s start: %#lx end: #%lx\n", __func__, pfn, pfn + nr_pages - 1);
943189db4f3ed14 Anshuman Khandual 2022-05-31  337  		return -EINVAL;
943189db4f3ed14 Anshuman Khandual 2022-05-31  338  	}
7ea6216049ff9cf Dan Williams      2019-07-18  339  
6cdd0b30a920b35 David Hildenbrand 2020-04-06  340  	for (; pfn < end_pfn; pfn += cur_nr_pages) {
6cdd0b30a920b35 David Hildenbrand 2020-04-06  341  		/* Select all remaining pages up to the next section boundary */
6cdd0b30a920b35 David Hildenbrand 2020-04-06  342  		cur_nr_pages = min(end_pfn - pfn,
6cdd0b30a920b35 David Hildenbrand 2020-04-06  343  				   SECTION_ALIGN_UP(pfn + 1) - pfn);
e3246d8f52173a7 Joao Martins      2022-04-28  344  		err = sparse_add_section(nid, pfn, cur_nr_pages, altmap,
e3246d8f52173a7 Joao Martins      2022-04-28  345  					 params->pgmap);
ba72b4c8cf60e45 Dan Williams      2019-07-18  346  		if (err)
ba72b4c8cf60e45 Dan Williams      2019-07-18  347  			break;
f64ac5e6e306682 Michal Hocko      2017-10-03  348  		cond_resched();
4edd7ceff0662af David Rientjes    2013-04-29  349  	}
c435a390574d012 Zhu Guihua        2015-06-24  350  	vmemmap_populate_print_last();
4edd7ceff0662af David Rientjes    2013-04-29 @351  	return err;
4edd7ceff0662af David Rientjes    2013-04-29  352  }
4edd7ceff0662af David Rientjes    2013-04-29  353  

:::::: The code at line 351 was first introduced by commit
:::::: 4edd7ceff0662afde195da6f6c43e7cbe1ed2dc4 mm, hotplug: avoid compiling memory hotremove functions when disabled

:::::: TO: David Rientjes <rientjes@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
