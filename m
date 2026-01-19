Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5948B24A047
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 19:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850113; cv=none; b=rlqVVOJ5PXfiZsLnVfQVW8K8QStrCG66uWDj+th/4f+jkY62tMqERfN/ofnTix2yV9KMhRu7BbDG7Ha7fVnS4aQSYTtOI4oKfaD9sTl4hRohVQtmyTAWcy1Nac1FDDDukRsbl2h1XZIkG4ITYYz1otk08AFWbomZjWzsrwbVaDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850113; c=relaxed/simple;
	bh=n8utB8VS5rWDDQSOj7/8kIsFAO/h9eXkeidCdsfGWZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WwO7jsLA2SUVLY3//vYUq8+llgSJTkBOcO6IuSALQ7d8/QLHhvYMarPaENdVb1RuhxffFLudJDnB0RNcyaGFOv1bEDlrCCn8bySlhlCDn5OjGe8CLyslbCFuODMlIzOMByMUapyqcWBpPkHXdm0QV3+Bg7WyKMFrxODeEepuGu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StkXLlN0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StkXLlN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768850111; x=1800386111;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=n8utB8VS5rWDDQSOj7/8kIsFAO/h9eXkeidCdsfGWZc=;
  b=StkXLlN0JZSvrsHb+AmfoB/cZAE23+pI2VH4dgUCqmUcSz9veHEXoEHn
   3vXCy9MpHdFFK7wTC0/B0o6kbQd9C0TnhOxlNOeTlSMiWO5hdqiId1gJr
   PIyoIkoaJkV6qUi1W8cTOMWf9XPodJF0VcfwWLon+grJLNmn4JwUKv6HD
   kC2gQjHOSfzAM8Zeno774OgmDsvdfz3+TxqjK375HcbfHDWf6uzOCFrId
   MQL/xeF+tD+YjGaVbyLdloU5ED5fyMQJrNt7zTMKdPkushwDP7GMUBUkS
   MpGyV6oRCfloS6EpDSXmeg/03CZdZnJ36E04Z4sx/pUn7PK6/U9GVErsb
   g==;
X-CSE-ConnectionGUID: MfJjusJERQyBxievMtI2wQ==
X-CSE-MsgGUID: ffbXKNizTEqceRf43ml1Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80784669"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="80784669"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 11:15:10 -0800
X-CSE-ConnectionGUID: ldFN8GktSciNTcNVkwPKOQ==
X-CSE-MsgGUID: lLJp0UJoQW+99FMUlAPXoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="205980601"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Jan 2026 11:15:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhuiQ-00000000OCr-2yZG;
	Mon, 19 Jan 2026 19:15:06 +0000
Date: Tue, 20 Jan 2026 03:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/3] mm: unified hmm fault and migrate device pagewalk
 paths
Message-ID: <202601200251.uRdWeQPq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260119112502.645059-2-mpenttil@redhat.com>
References: <20260119112502.645059-2-mpenttil@redhat.com>
TO: mpenttil@redhat.com
TO: linux-mm@kvack.org
CC: linux-kernel@vger.kernel.org
CC: "Mika Penttilä" <mpenttil@redhat.com>
CC: David Hildenbrand <david@redhat.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>
CC: Alistair Popple <apopple@nvidia.com>
CC: Balbir Singh <balbirs@nvidia.com>
CC: Zi Yan <ziy@nvidia.com>
CC: Matthew Brost <matthew.brost@intel.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7]

url:    https://github.com/intel-lab-lkp/linux/commits/mpenttil-redhat-com/mm-unified-hmm-fault-and-migrate-device-pagewalk-paths/20260119-193100
base:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
patch link:    https://lore.kernel.org/r/20260119112502.645059-2-mpenttil%40redhat.com
patch subject: [PATCH v2 1/3] mm: unified hmm fault and migrate device pagewalk paths
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: sparc-randconfig-r071-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200251.uRdWeQPq-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601200251.uRdWeQPq-lkp@intel.com/

smatch warnings:
mm/hmm.c:960 hmm_vma_walk_pmd() warn: missing error code? 'r'
mm/hmm.c:1310 hmm_range_fault() error: we previously assumed 'range->notifier' could be null (see line 1296)

vim +/r +960 mm/hmm.c

adc5de78797562 Mika Penttilä   2026-01-19   925  
53f5c3f489ecdd Jérôme Glisse   2018-04-10   926  static int hmm_vma_walk_pmd(pmd_t *pmdp,
53f5c3f489ecdd Jérôme Glisse   2018-04-10   927  			    unsigned long start,
53f5c3f489ecdd Jérôme Glisse   2018-04-10   928  			    unsigned long end,
53f5c3f489ecdd Jérôme Glisse   2018-04-10   929  			    struct mm_walk *walk)
53f5c3f489ecdd Jérôme Glisse   2018-04-10   930  {
53f5c3f489ecdd Jérôme Glisse   2018-04-10   931  	struct hmm_vma_walk *hmm_vma_walk = walk->private;
53f5c3f489ecdd Jérôme Glisse   2018-04-10   932  	struct hmm_range *range = hmm_vma_walk->range;
2733ea144dcce7 Jason Gunthorpe 2020-05-01   933  	unsigned long *hmm_pfns =
2733ea144dcce7 Jason Gunthorpe 2020-05-01   934  		&range->hmm_pfns[(start - range->start) >> PAGE_SHIFT];
2288a9a68175ce Jason Gunthorpe 2020-03-05   935  	unsigned long npages = (end - start) >> PAGE_SHIFT;
adc5de78797562 Mika Penttilä   2026-01-19   936  	struct mm_struct *mm = walk->vma->vm_mm;
2288a9a68175ce Jason Gunthorpe 2020-03-05   937  	unsigned long addr = start;
adc5de78797562 Mika Penttilä   2026-01-19   938  	enum migrate_vma_info minfo;
adc5de78797562 Mika Penttilä   2026-01-19   939  	unsigned long i;
adc5de78797562 Mika Penttilä   2026-01-19   940  	spinlock_t *ptl;
53f5c3f489ecdd Jérôme Glisse   2018-04-10   941  	pte_t *ptep;
d08faca018c461 Jérôme Glisse   2018-10-30   942  	pmd_t pmd;
adc5de78797562 Mika Penttilä   2026-01-19   943  	int r;
adc5de78797562 Mika Penttilä   2026-01-19   944  
adc5de78797562 Mika Penttilä   2026-01-19   945  	minfo = hmm_select_migrate(range);
53f5c3f489ecdd Jérôme Glisse   2018-04-10   946  
53f5c3f489ecdd Jérôme Glisse   2018-04-10   947  again:
adc5de78797562 Mika Penttilä   2026-01-19   948  	hmm_vma_walk->locked = false;
adc5de78797562 Mika Penttilä   2026-01-19   949  	hmm_vma_walk->pmdlocked = false;
26e1a0c3277d7f Hugh Dickins    2023-06-08   950  	pmd = pmdp_get_lockless(pmdp);
adc5de78797562 Mika Penttilä   2026-01-19   951  	if (pmd_none(pmd)) {
adc5de78797562 Mika Penttilä   2026-01-19   952  		r = hmm_vma_walk_hole(start, end, -1, walk);
adc5de78797562 Mika Penttilä   2026-01-19   953  		if (r || !minfo)
adc5de78797562 Mika Penttilä   2026-01-19   954  			return r;
adc5de78797562 Mika Penttilä   2026-01-19   955  
adc5de78797562 Mika Penttilä   2026-01-19   956  		ptl = pmd_lock(walk->mm, pmdp);
adc5de78797562 Mika Penttilä   2026-01-19   957  		if (pmd_none(*pmdp)) {
adc5de78797562 Mika Penttilä   2026-01-19   958  			// hmm_vma_walk_hole() filled migration needs
adc5de78797562 Mika Penttilä   2026-01-19   959  			spin_unlock(ptl);
adc5de78797562 Mika Penttilä   2026-01-19  @960  			return r;
adc5de78797562 Mika Penttilä   2026-01-19   961  		}
adc5de78797562 Mika Penttilä   2026-01-19   962  		spin_unlock(ptl);
adc5de78797562 Mika Penttilä   2026-01-19   963  	}
53f5c3f489ecdd Jérôme Glisse   2018-04-10   964  
0ac881efe16468 Lorenzo Stoakes 2025-11-10   965  	if (thp_migration_supported() && pmd_is_migration_entry(pmd)) {
adc5de78797562 Mika Penttilä   2026-01-19   966  		if (!minfo) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01   967  			if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0)) {
d08faca018c461 Jérôme Glisse   2018-10-30   968  				hmm_vma_walk->last = addr;
d2e8d551165ccb Ralph Campbell  2019-07-25   969  				pmd_migration_entry_wait(walk->mm, pmdp);
73231612dc7c90 Jérôme Glisse   2019-05-13   970  				return -EBUSY;
d08faca018c461 Jérôme Glisse   2018-10-30   971  			}
2288a9a68175ce Jason Gunthorpe 2020-03-05   972  		}
adc5de78797562 Mika Penttilä   2026-01-19   973  		for (i = 0; addr < end; addr += PAGE_SIZE, i++)
adc5de78797562 Mika Penttilä   2026-01-19   974  			hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
2288a9a68175ce Jason Gunthorpe 2020-03-05   975  
adc5de78797562 Mika Penttilä   2026-01-19   976  		return 0;
adc5de78797562 Mika Penttilä   2026-01-19   977  	}
adc5de78797562 Mika Penttilä   2026-01-19   978  
adc5de78797562 Mika Penttilä   2026-01-19   979  	if (minfo) {
adc5de78797562 Mika Penttilä   2026-01-19   980  		hmm_vma_walk->ptl = pmd_lock(mm, pmdp);
adc5de78797562 Mika Penttilä   2026-01-19   981  		hmm_vma_walk->pmdlocked = true;
adc5de78797562 Mika Penttilä   2026-01-19   982  		pmd = pmdp_get(pmdp);
adc5de78797562 Mika Penttilä   2026-01-19   983  	} else
adc5de78797562 Mika Penttilä   2026-01-19   984  		pmd = pmdp_get_lockless(pmdp);
adc5de78797562 Mika Penttilä   2026-01-19   985  
adc5de78797562 Mika Penttilä   2026-01-19   986  	if (pmd_trans_huge(pmd) || !pmd_present(pmd)) {
adc5de78797562 Mika Penttilä   2026-01-19   987  
adc5de78797562 Mika Penttilä   2026-01-19   988  		if (!pmd_present(pmd)) {
adc5de78797562 Mika Penttilä   2026-01-19   989  			r = hmm_vma_handle_absent_pmd(walk, start, end, hmm_pfns,
10b9feee2d0dc8 Francois Dugast 2025-09-08   990  						      pmd);
adc5de78797562 Mika Penttilä   2026-01-19   991  			if (r || !minfo)
adc5de78797562 Mika Penttilä   2026-01-19   992  				return r;
adc5de78797562 Mika Penttilä   2026-01-19   993  		} else {
d08faca018c461 Jérôme Glisse   2018-10-30   994  
53f5c3f489ecdd Jérôme Glisse   2018-04-10   995  			/*
adc5de78797562 Mika Penttilä   2026-01-19   996  			 * No need to take pmd_lock here if not migrating,
adc5de78797562 Mika Penttilä   2026-01-19   997  			 * even if some other thread is splitting the huge
adc5de78797562 Mika Penttilä   2026-01-19   998  			 * pmd we will get that event through mmu_notifier callback.
53f5c3f489ecdd Jérôme Glisse   2018-04-10   999  			 *
d2e8d551165ccb Ralph Campbell  2019-07-25  1000  			 * So just read pmd value and check again it's a transparent
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1001  			 * huge or device mapping one and compute corresponding pfn
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1002  			 * values.
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1003  			 */
adc5de78797562 Mika Penttilä   2026-01-19  1004  
adc5de78797562 Mika Penttilä   2026-01-19  1005  			if (!pmd_trans_huge(pmd)) {
adc5de78797562 Mika Penttilä   2026-01-19  1006  				// must be lockless
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1007  				goto again;
adc5de78797562 Mika Penttilä   2026-01-19  1008  			}
adc5de78797562 Mika Penttilä   2026-01-19  1009  
adc5de78797562 Mika Penttilä   2026-01-19  1010  			r = hmm_vma_handle_pmd(walk, addr, end, hmm_pfns, pmd);
adc5de78797562 Mika Penttilä   2026-01-19  1011  
adc5de78797562 Mika Penttilä   2026-01-19  1012  			if (r || !minfo)
adc5de78797562 Mika Penttilä   2026-01-19  1013  				return r;
adc5de78797562 Mika Penttilä   2026-01-19  1014  		}
adc5de78797562 Mika Penttilä   2026-01-19  1015  
adc5de78797562 Mika Penttilä   2026-01-19  1016  		r = hmm_vma_handle_migrate_prepare_pmd(walk, pmdp, start, end, hmm_pfns);
adc5de78797562 Mika Penttilä   2026-01-19  1017  
adc5de78797562 Mika Penttilä   2026-01-19  1018  		if (hmm_vma_walk->pmdlocked) {
adc5de78797562 Mika Penttilä   2026-01-19  1019  			spin_unlock(hmm_vma_walk->ptl);
adc5de78797562 Mika Penttilä   2026-01-19  1020  			hmm_vma_walk->pmdlocked = false;
adc5de78797562 Mika Penttilä   2026-01-19  1021  		}
adc5de78797562 Mika Penttilä   2026-01-19  1022  
adc5de78797562 Mika Penttilä   2026-01-19  1023  		if (r == -ENOENT) {
adc5de78797562 Mika Penttilä   2026-01-19  1024  			r = hmm_vma_walk_split(pmdp, addr, walk);
adc5de78797562 Mika Penttilä   2026-01-19  1025  			if (r) {
adc5de78797562 Mika Penttilä   2026-01-19  1026  				/* Split not successful, skip */
adc5de78797562 Mika Penttilä   2026-01-19  1027  				return hmm_pfns_fill(start, end, hmm_vma_walk, HMM_PFN_ERROR);
adc5de78797562 Mika Penttilä   2026-01-19  1028  			}
adc5de78797562 Mika Penttilä   2026-01-19  1029  
adc5de78797562 Mika Penttilä   2026-01-19  1030  			/* Split successful or "again", reloop */
adc5de78797562 Mika Penttilä   2026-01-19  1031  			hmm_vma_walk->last = addr;
adc5de78797562 Mika Penttilä   2026-01-19  1032  			return -EBUSY;
adc5de78797562 Mika Penttilä   2026-01-19  1033  		}
adc5de78797562 Mika Penttilä   2026-01-19  1034  
adc5de78797562 Mika Penttilä   2026-01-19  1035  		return r;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1036  
adc5de78797562 Mika Penttilä   2026-01-19  1037  	}
adc5de78797562 Mika Penttilä   2026-01-19  1038  
adc5de78797562 Mika Penttilä   2026-01-19  1039  	if (hmm_vma_walk->pmdlocked) {
adc5de78797562 Mika Penttilä   2026-01-19  1040  		spin_unlock(hmm_vma_walk->ptl);
adc5de78797562 Mika Penttilä   2026-01-19  1041  		hmm_vma_walk->pmdlocked = false;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1042  	}
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1043  
d08faca018c461 Jérôme Glisse   2018-10-30  1044  	/*
d2e8d551165ccb Ralph Campbell  2019-07-25  1045  	 * We have handled all the valid cases above ie either none, migration,
d08faca018c461 Jérôme Glisse   2018-10-30  1046  	 * huge or transparent huge. At this point either it is a valid pmd
d08faca018c461 Jérôme Glisse   2018-10-30  1047  	 * entry pointing to pte directory or it is a bad pmd that will not
d08faca018c461 Jérôme Glisse   2018-10-30  1048  	 * recover.
d08faca018c461 Jérôme Glisse   2018-10-30  1049  	 */
2288a9a68175ce Jason Gunthorpe 2020-03-05  1050  	if (pmd_bad(pmd)) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  1051  		if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0))
2288a9a68175ce Jason Gunthorpe 2020-03-05  1052  			return -EFAULT;
adc5de78797562 Mika Penttilä   2026-01-19  1053  		return hmm_pfns_fill(start, end, hmm_vma_walk, HMM_PFN_ERROR);
2288a9a68175ce Jason Gunthorpe 2020-03-05  1054  	}
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1055  
adc5de78797562 Mika Penttilä   2026-01-19  1056  	if (minfo) {
adc5de78797562 Mika Penttilä   2026-01-19  1057  		ptep = pte_offset_map_lock(mm, pmdp, addr, &hmm_vma_walk->ptl);
adc5de78797562 Mika Penttilä   2026-01-19  1058  		if (ptep)
adc5de78797562 Mika Penttilä   2026-01-19  1059  			hmm_vma_walk->locked = true;
adc5de78797562 Mika Penttilä   2026-01-19  1060  	} else
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1061  		ptep = pte_offset_map(pmdp, addr);
6ec1905f6ec7f9 Hugh Dickins    2023-06-08  1062  	if (!ptep)
6ec1905f6ec7f9 Hugh Dickins    2023-06-08  1063  		goto again;
adc5de78797562 Mika Penttilä   2026-01-19  1064  
2733ea144dcce7 Jason Gunthorpe 2020-05-01  1065  	for (; addr < end; addr += PAGE_SIZE, ptep++, hmm_pfns++) {
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1066  
2733ea144dcce7 Jason Gunthorpe 2020-05-01  1067  		r = hmm_vma_handle_pte(walk, addr, end, pmdp, ptep, hmm_pfns);
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1068  		if (r) {
dfdc22078f3f06 Jason Gunthorpe 2020-02-28  1069  			/* hmm_vma_handle_pte() did pte_unmap() */
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1070  			return r;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1071  		}
adc5de78797562 Mika Penttilä   2026-01-19  1072  
adc5de78797562 Mika Penttilä   2026-01-19  1073  		r = hmm_vma_handle_migrate_prepare(walk, pmdp, ptep, addr, hmm_pfns);
adc5de78797562 Mika Penttilä   2026-01-19  1074  		if (r == -EAGAIN) {
adc5de78797562 Mika Penttilä   2026-01-19  1075  			goto again;
adc5de78797562 Mika Penttilä   2026-01-19  1076  		}
adc5de78797562 Mika Penttilä   2026-01-19  1077  		if (r) {
adc5de78797562 Mika Penttilä   2026-01-19  1078  			hmm_pfns_fill(addr, end, hmm_vma_walk, HMM_PFN_ERROR);
adc5de78797562 Mika Penttilä   2026-01-19  1079  			break;
da4c3c735ea4dc Jérôme Glisse   2017-09-08  1080  		}
adc5de78797562 Mika Penttilä   2026-01-19  1081  	}
adc5de78797562 Mika Penttilä   2026-01-19  1082  
adc5de78797562 Mika Penttilä   2026-01-19  1083  	if (hmm_vma_walk->locked)
adc5de78797562 Mika Penttilä   2026-01-19  1084  		pte_unmap_unlock(ptep - 1, hmm_vma_walk->ptl);
adc5de78797562 Mika Penttilä   2026-01-19  1085  	else
da4c3c735ea4dc Jérôme Glisse   2017-09-08  1086  		pte_unmap(ptep - 1);
adc5de78797562 Mika Penttilä   2026-01-19  1087  
da4c3c735ea4dc Jérôme Glisse   2017-09-08  1088  	return 0;
da4c3c735ea4dc Jérôme Glisse   2017-09-08  1089  }
da4c3c735ea4dc Jérôme Glisse   2017-09-08  1090  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
