Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D535712C46B
	for <oe-kbuild@lists.linux.dev>; Fri, 10 May 2024 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715349258; cv=none; b=bDgg6MZVsLicAmDa16G1lAu6dz3axctdMhgHMBlYoLKYReIdZr81JydjbHLA5NdWDC0fq9TjxKfy8KXbCmjq4ODtWxt/FHmqXK01gOInU8HleUDCkb9K78Dz9AV94ymOucXzUKWnRYvK8POy0pTIwuSTOg36vHTR6EoPiJXLmSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715349258; c=relaxed/simple;
	bh=iAmkzBNBBPSt5DICDMzFYvVCBUAnEUCZJkyZ9FPfWuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GVtsE+8bxQy7/T92a0Q+PrOmwrhC9yMBKXiwuMi+ufPaNlUzMHOG8NM/u3epJ3KLm9yXP4PsTJLU8/IVeNlL7xVj0H8L6NlEVAjoGL3aZsCvIDKe97HmnGsS33dZRnj/W4xyPj7loFtsCg+uxiyrfLntgSsAAZEvvojNdaDlDKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFvcA57/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFvcA57/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715349256; x=1746885256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iAmkzBNBBPSt5DICDMzFYvVCBUAnEUCZJkyZ9FPfWuQ=;
  b=LFvcA57/p2Uy+gA2uQocnoOryU6ekx/2/QUvD7qM9Uyik4qa6N757RiZ
   nbjVFA8POhmpIfbIQo3Oi2VzRadUtrVyC72FBQHBFDffKFcYdrX7icyXh
   mlmHZIFx4WCrvdtNRtiqt21ODI/VSxJgwplBtT40DbDoiJUouQ5uLsYXc
   dGLNCIc4DJpl20G427rkzgLYX9SMMmy+NvbKU5iqc+3YxyYg1AxpX0m4w
   EjG08laOpdA7T3P6dg4AirenBs6aO70j8drnWEk8ZhGSnND8bH3l9KHTm
   w73M/sgqBmEWJ53Lj9Ehb7PxSey/U7iIb+tDI/qkbP7LnHqwyLd2VfFDO
   g==;
X-CSE-ConnectionGUID: xRbl9eP4S6qzUua5uHNjoA==
X-CSE-MsgGUID: B5POpn3cTViy+ei/7C09NA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15123872"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="15123872"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 06:54:16 -0700
X-CSE-ConnectionGUID: paxdZSgAQle1vDrDGMjw+A==
X-CSE-MsgGUID: soHYJnJmTvGri9yEZhE17g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="67095405"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 May 2024 06:54:15 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5QhP-0006Dh-37;
	Fri, 10 May 2024 13:54:11 +0000
Date: Fri, 10 May 2024 21:54:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11286/12533] mm/gup.c:639 follow_hugepd() warn:
 passing zero to 'ERR_PTR'
Message-ID: <202405102143.yjPDwRrj-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Peter Xu <peterx@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Hildenbrand <david@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   75fa778d74b786a1608d55d655d42b480a6fa8bd
commit: 01d89b93e1769928529d339d6e4f780129454161 [11286/12533] mm/gup: fix hugepd handling in hugetlb rework
:::::: branch date: 7 hours ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r071-20240510 (https://download.01.org/0day-ci/archive/20240510/202405102143.yjPDwRrj-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405102143.yjPDwRrj-lkp@intel.com/

New smatch warnings:
mm/gup.c:639 follow_hugepd() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
arch/powerpc/include/asm/mmu.h:261 mmu_has_feature() warn: bitwise AND condition is false here

vim +/ERR_PTR +639 mm/gup.c

a12083d721d703 Peter Xu 2024-03-27  608  
a12083d721d703 Peter Xu 2024-03-27  609  static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
a12083d721d703 Peter Xu 2024-03-27  610  				  unsigned long addr, unsigned int pdshift,
a12083d721d703 Peter Xu 2024-03-27  611  				  unsigned int flags,
a12083d721d703 Peter Xu 2024-03-27  612  				  struct follow_page_context *ctx)
a12083d721d703 Peter Xu 2024-03-27  613  {
a12083d721d703 Peter Xu 2024-03-27  614  	struct page *page;
a12083d721d703 Peter Xu 2024-03-27  615  	struct hstate *h;
a12083d721d703 Peter Xu 2024-03-27  616  	spinlock_t *ptl;
a12083d721d703 Peter Xu 2024-03-27  617  	int nr = 0, ret;
a12083d721d703 Peter Xu 2024-03-27  618  	pte_t *ptep;
a12083d721d703 Peter Xu 2024-03-27  619  
a12083d721d703 Peter Xu 2024-03-27  620  	/* Only hugetlb supports hugepd */
a12083d721d703 Peter Xu 2024-03-27  621  	if (WARN_ON_ONCE(!is_vm_hugetlb_page(vma)))
a12083d721d703 Peter Xu 2024-03-27  622  		return ERR_PTR(-EFAULT);
a12083d721d703 Peter Xu 2024-03-27  623  
a12083d721d703 Peter Xu 2024-03-27  624  	h = hstate_vma(vma);
a12083d721d703 Peter Xu 2024-03-27  625  	ptep = hugepte_offset(hugepd, addr, pdshift);
a12083d721d703 Peter Xu 2024-03-27  626  	ptl = huge_pte_lock(h, vma->vm_mm, ptep);
01d89b93e17699 Peter Xu 2024-04-30  627  	ret = gup_hugepd(vma, hugepd, addr, pdshift, addr + PAGE_SIZE,
a12083d721d703 Peter Xu 2024-03-27  628  			 flags, &page, &nr);
a12083d721d703 Peter Xu 2024-03-27  629  	spin_unlock(ptl);
a12083d721d703 Peter Xu 2024-03-27  630  
01d89b93e17699 Peter Xu 2024-04-30  631  	if (ret == 1) {
01d89b93e17699 Peter Xu 2024-04-30  632  		/* GUP succeeded */
a12083d721d703 Peter Xu 2024-03-27  633  		WARN_ON_ONCE(nr != 1);
a12083d721d703 Peter Xu 2024-03-27  634  		ctx->page_mask = (1U << huge_page_order(h)) - 1;
a12083d721d703 Peter Xu 2024-03-27  635  		return page;
a12083d721d703 Peter Xu 2024-03-27  636  	}
a12083d721d703 Peter Xu 2024-03-27  637  
01d89b93e17699 Peter Xu 2024-04-30  638  	/* ret can be either 0 (translates to NULL) or negative */
01d89b93e17699 Peter Xu 2024-04-30 @639  	return ERR_PTR(ret);
a12083d721d703 Peter Xu 2024-03-27  640  }
a12083d721d703 Peter Xu 2024-03-27  641  #else /* CONFIG_ARCH_HAS_HUGEPD */
01d89b93e17699 Peter Xu 2024-04-30  642  static inline int gup_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
01d89b93e17699 Peter Xu 2024-04-30  643  			     unsigned long addr, unsigned int pdshift,
01d89b93e17699 Peter Xu 2024-04-30  644  			     unsigned long end, unsigned int flags,
a12083d721d703 Peter Xu 2024-03-27  645  			     struct page **pages, int *nr)
a12083d721d703 Peter Xu 2024-03-27  646  {
a12083d721d703 Peter Xu 2024-03-27  647  	return 0;
a12083d721d703 Peter Xu 2024-03-27  648  }
a12083d721d703 Peter Xu 2024-03-27  649  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
