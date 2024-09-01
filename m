Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9E279D2
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Sep 2024 05:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725166954; cv=none; b=ocsfd6s1ITfPsyt7j1VTtG3ibLCPoPulcL4cxu3KuKWkZE++W6VP2BacovdKsp8JnCx7V3DZ0wnsiRt1OY1at2UxWF422PT1TzjFOUoCicajM89/rq+ldCKL59Lg2+LQY2cAIjjfV+5VrZGR7QnFA9ck4OIZ838mNnBXC1vuEqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725166954; c=relaxed/simple;
	bh=otys+s5PhimIfEJJlVOvbGwq3ftWTV9VV4qUq6A4qqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UVXxIq0P43k2vt3oZ+8bKhUK1mnMsL4w6FN/9xrmzhOU4b1D4NB/5IXe/bMfJHJuxSZugE9mExDH5T21ywg391hdjBEoUAp+mmDF7iGk5gUSKmB7LnxHU7EoqaICmIfuupNuP2AU0JZWlheAot8vhleECLLXW5ZT7IS7OlnTqRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8AlVrwE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8AlVrwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725166952; x=1756702952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=otys+s5PhimIfEJJlVOvbGwq3ftWTV9VV4qUq6A4qqM=;
  b=Z8AlVrwE+d1pdBOS42FxWNzNBL1EOH1gE3Fin0DnMKxkYcYKCZObdsQ7
   dQYBqqTTmCdDMUuRl5R4H8LzKw0c+vDhw4iptdN50mCCq6k0VvN3ZvgCC
   MxdYL6mNWGEjA1OEYLNvRZXYEfluYfjI9sf3+o0yKqEKC8AkWUmY2cL4u
   h9fOKsFU03McfbOwSGhKHUjIBncY1rK9i63uVqWk7r4l7dwFaOKNh9FQA
   gS8+5+xXhhKUgYNNGobrnfThySXljeYlUWwFz/F+IFXVtTT595FjI553/
   6ozDu2CfUxpHDY3HJO/xjdWgszQg4sxBL30+zq3cqYoajEfPuNMe7H0N2
   w==;
X-CSE-ConnectionGUID: xjWosptkSVKVbkiMWCcapQ==
X-CSE-MsgGUID: Y80No1yWREmY78DQZaEM5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="34385725"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="34385725"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 22:02:32 -0700
X-CSE-ConnectionGUID: 7LurM6zXTBq2meb+QLSE3w==
X-CSE-MsgGUID: K+2bYIbwSq+qv5BDSsF44w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="63966983"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2024 22:02:30 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skcjM-0003Q5-2q;
	Sun, 01 Sep 2024 05:02:28 +0000
Date: Sun, 1 Sep 2024 13:02:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] mm: Abstract THP allocation
Message-ID: <202409011215.bhqLigEB-lkp@intel.com>
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
In-Reply-To: <20240830084117.4079805-2-dev.jain@arm.com>
References: <20240830084117.4079805-2-dev.jain@arm.com>
TO: Dev Jain <dev.jain@arm.com>
TO: akpm@linux-foundation.org
TO: david@redhat.com
TO: willy@infradead.org
TO: kirill.shutemov@linux.intel.com
CC: ryan.roberts@arm.com
CC: anshuman.khandual@arm.com
CC: catalin.marinas@arm.com
CC: cl@gentwo.org
CC: vbabka@suse.cz
CC: mhocko@suse.com
CC: apopple@nvidia.com
CC: dave.hansen@linux.intel.com
CC: will@kernel.org
CC: baohua@kernel.org
CC: jack@suse.cz
CC: mark.rutland@arm.com
CC: hughd@google.com
CC: aneesh.kumar@kernel.org
CC: yang@os.amperecomputing.com
CC: peterx@redhat.com
CC: ioworker0@gmail.com
CC: jglisse@google.com
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-mm@kvack.org
CC: Dev Jain <dev.jain@arm.com>

Hi Dev,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dev-Jain/mm-Abstract-THP-allocation/20240830-164300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240830084117.4079805-2-dev.jain%40arm.com
patch subject: [PATCH 1/2] mm: Abstract THP allocation
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240901 (https://download.01.org/0day-ci/archive/20240901/202409011215.bhqLigEB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409011215.bhqLigEB-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:1236 __do_huge_pmd_anonymous_page() warn: inconsistent returns 'vmf->ptl'.

vim +1236 mm/huge_memory.c

5ee350d3e6d11e Dev Jain           2024-08-30  1186  
5ee350d3e6d11e Dev Jain           2024-08-30  1187  static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf)
5ee350d3e6d11e Dev Jain           2024-08-30  1188  {
5ee350d3e6d11e Dev Jain           2024-08-30  1189  	struct vm_area_struct *vma = vmf->vma;
5ee350d3e6d11e Dev Jain           2024-08-30  1190  	struct folio *folio = NULL;
5ee350d3e6d11e Dev Jain           2024-08-30  1191  	pgtable_t pgtable;
5ee350d3e6d11e Dev Jain           2024-08-30  1192  	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
5ee350d3e6d11e Dev Jain           2024-08-30  1193  	vm_fault_t ret = 0;
5ee350d3e6d11e Dev Jain           2024-08-30  1194  	gfp_t gfp = vma_thp_gfp_mask(vma);
5ee350d3e6d11e Dev Jain           2024-08-30  1195  
5ee350d3e6d11e Dev Jain           2024-08-30  1196  	pgtable = pte_alloc_one(vma->vm_mm);
5ee350d3e6d11e Dev Jain           2024-08-30  1197  	if (unlikely(!pgtable)) {
5ee350d3e6d11e Dev Jain           2024-08-30  1198  		ret = VM_FAULT_OOM;
5ee350d3e6d11e Dev Jain           2024-08-30  1199  		goto release;
5ee350d3e6d11e Dev Jain           2024-08-30  1200  	}
5ee350d3e6d11e Dev Jain           2024-08-30  1201  
5ee350d3e6d11e Dev Jain           2024-08-30  1202  	ret = thp_fault_alloc(gfp, HPAGE_PMD_ORDER, vma, haddr, &folio,
5ee350d3e6d11e Dev Jain           2024-08-30  1203  			      vmf->address);
5ee350d3e6d11e Dev Jain           2024-08-30  1204  	if (ret)
5ee350d3e6d11e Dev Jain           2024-08-30  1205  		goto release;
71e3aac0724ffe Andrea Arcangeli   2011-01-13  1206  
82b0f8c39a3869 Jan Kara           2016-12-14  1207  	vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
5ee350d3e6d11e Dev Jain           2024-08-30  1208  
82b0f8c39a3869 Jan Kara           2016-12-14  1209  	if (unlikely(!pmd_none(*vmf->pmd))) {
6b31d5955cb29a Michal Hocko       2017-08-18  1210  		goto unlock_release;
71e3aac0724ffe Andrea Arcangeli   2011-01-13  1211  	} else {
6b31d5955cb29a Michal Hocko       2017-08-18  1212  		ret = check_stable_address_space(vma->vm_mm);
6b31d5955cb29a Michal Hocko       2017-08-18  1213  		if (ret)
6b31d5955cb29a Michal Hocko       2017-08-18  1214  			goto unlock_release;
6b31d5955cb29a Michal Hocko       2017-08-18  1215  
6b251fc96cf2cd Andrea Arcangeli   2015-09-04  1216  		/* Deliver the page fault to userland */
6b251fc96cf2cd Andrea Arcangeli   2015-09-04  1217  		if (userfaultfd_missing(vma)) {
82b0f8c39a3869 Jan Kara           2016-12-14  1218  			spin_unlock(vmf->ptl);
cfe3236d32d07b Kefeng Wang        2023-03-02  1219  			folio_put(folio);
bae473a423f65e Kirill A. Shutemov 2016-07-26  1220  			pte_free(vma->vm_mm, pgtable);
8fd5eda4c7268b Miaohe Lin         2021-05-04  1221  			ret = handle_userfault(vmf, VM_UFFD_MISSING);
8fd5eda4c7268b Miaohe Lin         2021-05-04  1222  			VM_BUG_ON(ret & VM_FAULT_FALLBACK);
8fd5eda4c7268b Miaohe Lin         2021-05-04  1223  			return ret;
6b251fc96cf2cd Andrea Arcangeli   2015-09-04  1224  		}
5ee350d3e6d11e Dev Jain           2024-08-30  1225  		map_pmd_thp(folio, vmf, vma, haddr, pgtable);
71e3aac0724ffe Andrea Arcangeli   2011-01-13  1226  	}
71e3aac0724ffe Andrea Arcangeli   2011-01-13  1227  
aa2e878efa7949 David Rientjes     2012-05-29  1228  	return 0;
6b31d5955cb29a Michal Hocko       2017-08-18  1229  unlock_release:
6b31d5955cb29a Michal Hocko       2017-08-18  1230  	spin_unlock(vmf->ptl);
6b31d5955cb29a Michal Hocko       2017-08-18  1231  release:
6b31d5955cb29a Michal Hocko       2017-08-18  1232  	if (pgtable)
6b31d5955cb29a Michal Hocko       2017-08-18  1233  		pte_free(vma->vm_mm, pgtable);
5ee350d3e6d11e Dev Jain           2024-08-30  1234  	if (folio)
cfe3236d32d07b Kefeng Wang        2023-03-02  1235  		folio_put(folio);
6b31d5955cb29a Michal Hocko       2017-08-18 @1236  	return ret;
6b31d5955cb29a Michal Hocko       2017-08-18  1237  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
