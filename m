Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58C72874F1
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 14:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629212; cv=none; b=tPf8smil9XzH9ACUxQN70gwVctaM/sUxXw7nd7yKPuPsJJkZthlH3iSCBzvSAgYcRC1lnEcOJK92GghW79K+52rZjvusNTrudFzYoDJVoFpFQ3Wbc3sGwNTxCxwW4SuGDjZdjeweep3HAtrF3aBOJXFK3rTRI4dF36cDkCk3LYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629212; c=relaxed/simple;
	bh=G9UFdkVUcMmX1g7r6OBRSMZftCqgf0KxntiPkvPbHUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O/RorGxBTWVfTnKMonV4/8IrYXfsaOlmWGJk2ywC4eI3VT+X+bdDvxBEQ0aksFsEVl0rQG+pFUkSlZBrmn9PD/cmi+UV/gtIa59dM5HXoONW7wKtjgrzE2Fi14qvz9c09VtbzBxbCWzytlq+AAvM7L8CoSyDzldSkEbQ8xHPdE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=THV8Bnzi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THV8Bnzi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746629210; x=1778165210;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G9UFdkVUcMmX1g7r6OBRSMZftCqgf0KxntiPkvPbHUc=;
  b=THV8BnzimpNsqJwigSYwXjHhj4wJAYPSto2jJw+J1dn4acXgwp3voQWw
   BEZLWkpnWRptEb92I7CaF6wiBj2t/627fIuDWqPporfdOvW48pXoE2uTG
   0uMmYjC8URzkP8aHDBTgzy8y0ruGL2e5ODF/UJ/oQhE9PkKbwANT1LZvz
   yLslbMasqaGHO5ciCOgnJ2WQwvCKSRvZT3Wq0TR0H7gdvxGTgauy1XIIh
   BMjBFAjvbeAoZVk3FJQWVO45bVmt+lrmuNjlKiQz+BfShT8vFRPT0W63M
   C9UxHPFGm8rISzNuFSCJ2xvJQRp59q1XJ2y9eS0V0P2h9ygd1KUotVWaw
   Q==;
X-CSE-ConnectionGUID: ouEKOVNtTLmMb07edCCngA==
X-CSE-MsgGUID: mcrFTdmCS7qFQ7nijW28nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48072537"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48072537"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:46:46 -0700
X-CSE-ConnectionGUID: RDjMlYLBQAaTQ81wsWu26A==
X-CSE-MsgGUID: YDsCTYasQGav09ihYpcthw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136990100"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2025 07:46:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCg2l-00080k-0m;
	Wed, 07 May 2025 14:46:43 +0000
Date: Wed, 7 May 2025 22:45:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/hmm.c:285 hmm_vma_handle_pte() warn: missing unwind goto?
Message-ID: <202505072243.6zp46BqE-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Oak Zeng <oak.zeng@intel.com>
CC: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d8d44db295ccad20052d6301ef49ff01fb8ae2d
commit: 81e058a3e7fd8593d076b4f26f7b8bb49f1d61e3 drm/xe: Introduce helper to populate userptr
date:   1 year, 1 month ago
:::::: branch date: 23 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-141-20250429 (https://download.01.org/0day-ci/archive/20250507/202505072243.6zp46BqE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505072243.6zp46BqE-lkp@intel.com/

smatch warnings:
mm/hmm.c:285 hmm_vma_handle_pte() warn: missing unwind goto?

vim +285 mm/hmm.c

2aee09d8c11642 Jérôme Glisse   2018-04-10  222  
53f5c3f489ecdd Jérôme Glisse   2018-04-10  223  static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
53f5c3f489ecdd Jérôme Glisse   2018-04-10  224  			      unsigned long end, pmd_t *pmdp, pte_t *ptep,
2733ea144dcce7 Jason Gunthorpe 2020-05-01  225  			      unsigned long *hmm_pfn)
53f5c3f489ecdd Jérôme Glisse   2018-04-10  226  {
53f5c3f489ecdd Jérôme Glisse   2018-04-10  227  	struct hmm_vma_walk *hmm_vma_walk = walk->private;
f88a1e90c66540 Jérôme Glisse   2018-04-10  228  	struct hmm_range *range = hmm_vma_walk->range;
a3eb13c1579ba9 Jason Gunthorpe 2020-03-27  229  	unsigned int required_fault;
2733ea144dcce7 Jason Gunthorpe 2020-05-01  230  	unsigned long cpu_flags;
c33c794828f212 Ryan Roberts    2023-06-12  231  	pte_t pte = ptep_get(ptep);
2733ea144dcce7 Jason Gunthorpe 2020-05-01  232  	uint64_t pfn_req_flags = *hmm_pfn;
da4c3c735ea4dc Jérôme Glisse   2017-09-08  233  
5c041f5d1f23d3 Peter Xu        2022-05-12  234  	if (pte_none_mostly(pte)) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  235  		required_fault =
2733ea144dcce7 Jason Gunthorpe 2020-05-01  236  			hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0);
a3eb13c1579ba9 Jason Gunthorpe 2020-03-27  237  		if (required_fault)
74eee180b935fc Jérôme Glisse   2017-09-08  238  			goto fault;
2733ea144dcce7 Jason Gunthorpe 2020-05-01  239  		*hmm_pfn = 0;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  240  		return 0;
74eee180b935fc Jérôme Glisse   2017-09-08  241  	}
74eee180b935fc Jérôme Glisse   2017-09-08  242  
74eee180b935fc Jérôme Glisse   2017-09-08  243  	if (!pte_present(pte)) {
8d63e4cd62b258 Ralph Campbell  2018-01-31  244  		swp_entry_t entry = pte_to_swp_entry(pte);
74eee180b935fc Jérôme Glisse   2017-09-08  245  
74eee180b935fc Jérôme Glisse   2017-09-08  246  		/*
8a295dbbaf7292 Ralph Campbell  2022-07-25  247  		 * Don't fault in device private pages owned by the caller,
8a295dbbaf7292 Ralph Campbell  2022-07-25  248  		 * just report the PFN.
74eee180b935fc Jérôme Glisse   2017-09-08  249  		 */
8a295dbbaf7292 Ralph Campbell  2022-07-25  250  		if (is_device_private_entry(entry) &&
8a295dbbaf7292 Ralph Campbell  2022-07-25  251  		    pfn_swap_entry_to_page(entry)->pgmap->owner ==
8a295dbbaf7292 Ralph Campbell  2022-07-25  252  		    range->dev_private_owner) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  253  			cpu_flags = HMM_PFN_VALID;
4dd845b5a3e57a Alistair Popple 2021-06-30  254  			if (is_writable_device_private_entry(entry))
2733ea144dcce7 Jason Gunthorpe 2020-05-01  255  				cpu_flags |= HMM_PFN_WRITE;
0d206b5d2e0d7d Peter Xu        2022-08-11  256  			*hmm_pfn = swp_offset_pfn(entry) | cpu_flags;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  257  			return 0;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  258  		}
53f5c3f489ecdd Jérôme Glisse   2018-04-10  259  
2733ea144dcce7 Jason Gunthorpe 2020-05-01  260  		required_fault =
2733ea144dcce7 Jason Gunthorpe 2020-05-01  261  			hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0);
846babe85efdda Jason Gunthorpe 2020-03-27  262  		if (!required_fault) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  263  			*hmm_pfn = 0;
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  264  			return 0;
846babe85efdda Jason Gunthorpe 2020-03-27  265  		}
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  266  
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  267  		if (!non_swap_entry(entry))
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  268  			goto fault;
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  269  
8a295dbbaf7292 Ralph Campbell  2022-07-25  270  		if (is_device_private_entry(entry))
8a295dbbaf7292 Ralph Campbell  2022-07-25  271  			goto fault;
8a295dbbaf7292 Ralph Campbell  2022-07-25  272  
b756a3b5e7ead8 Alistair Popple 2021-06-30  273  		if (is_device_exclusive_entry(entry))
b756a3b5e7ead8 Alistair Popple 2021-06-30  274  			goto fault;
b756a3b5e7ead8 Alistair Popple 2021-06-30  275  
53f5c3f489ecdd Jérôme Glisse   2018-04-10  276  		if (is_migration_entry(entry)) {
74eee180b935fc Jérôme Glisse   2017-09-08  277  			pte_unmap(ptep);
74eee180b935fc Jérôme Glisse   2017-09-08  278  			hmm_vma_walk->last = addr;
d2e8d551165ccb Ralph Campbell  2019-07-25  279  			migration_entry_wait(walk->mm, pmdp, addr);
73231612dc7c90 Jérôme Glisse   2019-05-13  280  			return -EBUSY;
74eee180b935fc Jérôme Glisse   2017-09-08  281  		}
53f5c3f489ecdd Jérôme Glisse   2018-04-10  282  
53f5c3f489ecdd Jérôme Glisse   2018-04-10  283  		/* Report error for everything else */
dfdc22078f3f06 Jason Gunthorpe 2020-02-28  284  		pte_unmap(ptep);
53f5c3f489ecdd Jérôme Glisse   2018-04-10 @285  		return -EFAULT;
da4c3c735ea4dc Jérôme Glisse   2017-09-08  286  	}
da4c3c735ea4dc Jérôme Glisse   2017-09-08  287  
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  288  	cpu_flags = pte_to_hmm_pfn_flags(range, pte);
2733ea144dcce7 Jason Gunthorpe 2020-05-01  289  	required_fault =
2733ea144dcce7 Jason Gunthorpe 2020-05-01  290  		hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, cpu_flags);
a3eb13c1579ba9 Jason Gunthorpe 2020-03-27  291  	if (required_fault)
74eee180b935fc Jérôme Glisse   2017-09-08  292  		goto fault;
74eee180b935fc Jérôme Glisse   2017-09-08  293  
ac541f25037229 Ralph Campbell  2019-10-23  294  	/*
4b42fb213678d2 Li Zhijian      2021-09-08  295  	 * Bypass devmap pte such as DAX page when all pfn requested
4b42fb213678d2 Li Zhijian      2021-09-08  296  	 * flags(pfn_req_flags) are fulfilled.
40550627492291 Jason Gunthorpe 2020-03-05  297  	 * Since each architecture defines a struct page for the zero page, just
40550627492291 Jason Gunthorpe 2020-03-05  298  	 * fall through and treat it like a normal page.
ac541f25037229 Ralph Campbell  2019-10-23  299  	 */
87c01d57fa23de Alistair Popple 2022-01-14  300  	if (!vm_normal_page(walk->vma, addr, pte) &&
87c01d57fa23de Alistair Popple 2022-01-14  301  	    !pte_devmap(pte) &&
4b42fb213678d2 Li Zhijian      2021-09-08  302  	    !is_zero_pfn(pte_pfn(pte))) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  303  		if (hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0)) {
40550627492291 Jason Gunthorpe 2020-03-05  304  			pte_unmap(ptep);
40550627492291 Jason Gunthorpe 2020-03-05  305  			return -EFAULT;
40550627492291 Jason Gunthorpe 2020-03-05  306  		}
2733ea144dcce7 Jason Gunthorpe 2020-05-01  307  		*hmm_pfn = HMM_PFN_ERROR;
40550627492291 Jason Gunthorpe 2020-03-05  308  		return 0;
ac541f25037229 Ralph Campbell  2019-10-23  309  	}
992de9a8b75116 Jérôme Glisse   2019-05-13  310  
2733ea144dcce7 Jason Gunthorpe 2020-05-01  311  	*hmm_pfn = pte_pfn(pte) | cpu_flags;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  312  	return 0;
74eee180b935fc Jérôme Glisse   2017-09-08  313  
74eee180b935fc Jérôme Glisse   2017-09-08  314  fault:
74eee180b935fc Jérôme Glisse   2017-09-08  315  	pte_unmap(ptep);
5504ed29692faa Jérôme Glisse   2018-04-10  316  	/* Fault any virtual address we were asked to fault */
a3eb13c1579ba9 Jason Gunthorpe 2020-03-27  317  	return hmm_vma_fault(addr, end, required_fault, walk);
53f5c3f489ecdd Jérôme Glisse   2018-04-10  318  }
53f5c3f489ecdd Jérôme Glisse   2018-04-10  319  

:::::: The code at line 285 was first introduced by commit
:::::: 53f5c3f489ecddc7570a2e2422a6fc5b25007b9d mm/hmm: factor out pte and pmd handling to simplify hmm_vma_walk_pmd()

:::::: TO: Jérôme Glisse <jglisse@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
