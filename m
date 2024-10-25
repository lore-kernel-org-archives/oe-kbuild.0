Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A734618BC1C
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729852022; cv=none; b=lanvbbsg0Ft6shcrzE/KO6JuFwwT6eyL1KW8ej0Lb1CDnbP+7K79409KQpMTSWjkuMrVGyBstruGSLHFl+f2OH8zZG0tHS8D0N9l/mOEHA/dx+8XKTeyjeWpyW8i0br9hUzoCoPOaPAIJiKQZQwFsXwkQpGVgt0ZU5oQtQosryI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729852022; c=relaxed/simple;
	bh=0t8BSi1LLzedGLYz/JPLH/pYC1XgP2M26sgNwVfsAl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NqUMGW9io0TiqiENjw4Qc0EATblwQO5u+2hCUvgkJAqjnUmM10E6KlCb4nTdTEwzkFs1SeoPVcEo98gXR8NpROH5Jc0WdhQuwpd+4VKhoob1HsDyG1wbxpcZv+4DaXC/nh2wHXS3Z+qc71BXPE7R6xJUawYNz17W21hUkZjph/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRkvNna1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRkvNna1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729852018; x=1761388018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0t8BSi1LLzedGLYz/JPLH/pYC1XgP2M26sgNwVfsAl8=;
  b=hRkvNna1m79XtdNaSH5Nunj5ppQ48JtQMc9OT+AQumn7YRbcy3jyAOv5
   JtsqTA6Fvnh87jtK3sI/RAfmBC0OrUfsEXtjbNwUu4i86h0lOGHf7aGoa
   yv5LgMrHvrGGopl860HjfUg7o3l8GntrSpacvTT+QkWlMzNjG/QyHnwFq
   m/EQfnqtwSWMtdvg/6WmxEzxjI6IyiC0IO0fEi9ZoW/tPr9u7dOTCzMUz
   ndPxDypVKZutK8LViJ0IsaaIiiu2VJXgAI8R97MWQi75NrD3GEJyUCIn3
   a6c7/VAH4MBLPaqsPfVHuh50/F9xEy6Tnttp2imXAyP3r3pvhTxieI3as
   Q==;
X-CSE-ConnectionGUID: EryDBV1KTbC5giQFKnoSJw==
X-CSE-MsgGUID: slZKm2ZER7qMCnOiH+awjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29416193"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="29416193"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 03:26:58 -0700
X-CSE-ConnectionGUID: FdzXCv/ZSDmhQr3OItWb0g==
X-CSE-MsgGUID: Yr2lZ761RaC7e+pQ3lNxiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80475297"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Oct 2024 03:26:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4HWw-000Y3Q-2I;
	Fri, 25 Oct 2024 10:26:54 +0000
Date: Fri, 25 Oct 2024 18:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 15/19] mm/userfaultfd.c:718
 __mcopy_atomic() warn: inconsistent returns '&ctx->map_changing_lock'.
Message-ID: <202410251806.AIka0nUF-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   a874ed06eb34e9a049fed6f767519de9f38130bd
commit: a5b6040d5cb800d56a2d2c5d106e1213838eed4e [15/19] BACKPORT: userfaultfd: protect mmap_changing with rw_sem in userfaulfd_ctx
:::::: branch date: 18 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-141-20241025 (https://download.01.org/0day-ci/archive/20241025/202410251806.AIka0nUF-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410251806.AIka0nUF-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:718 __mcopy_atomic() warn: inconsistent returns '&ctx->map_changing_lock'.

vim +718 mm/userfaultfd.c

3217d3c79b5d7a Mike Rapoport           2017-09-06  545  
a5b6040d5cb800 Lokesh Gidra            2024-02-15  546  static __always_inline ssize_t __mcopy_atomic(struct userfaultfd_ctx *ctx,
c1a4de99fada21 Andrea Arcangeli        2015-09-04  547  					      unsigned long dst_start,
c1a4de99fada21 Andrea Arcangeli        2015-09-04  548  					      unsigned long src_start,
c1a4de99fada21 Andrea Arcangeli        2015-09-04  549  					      unsigned long len,
f619147104c8ea Axel Rasmussen          2021-05-04  550  					      enum mcopy_atomic_mode mcopy_mode,
72981e0e7b609c Andrea Arcangeli        2020-04-06  551  					      __u64 mode)
c1a4de99fada21 Andrea Arcangeli        2015-09-04  552  {
a5b6040d5cb800 Lokesh Gidra            2024-02-15  553  	struct mm_struct *dst_mm = ctx->mm;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  554  	struct vm_area_struct *dst_vma;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  555  	ssize_t err;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  556  	pmd_t *dst_pmd;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  557  	unsigned long src_addr, dst_addr;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  558  	long copied;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  559  	struct page *page;
72981e0e7b609c Andrea Arcangeli        2020-04-06  560  	bool wp_copy;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  561  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  562  	/*
c1a4de99fada21 Andrea Arcangeli        2015-09-04  563  	 * Sanitize the command parameters:
c1a4de99fada21 Andrea Arcangeli        2015-09-04  564  	 */
c1a4de99fada21 Andrea Arcangeli        2015-09-04  565  	BUG_ON(dst_start & ~PAGE_MASK);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  566  	BUG_ON(len & ~PAGE_MASK);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  567  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  568  	/* Does the address range wrap, or is the span zero-sized? */
c1a4de99fada21 Andrea Arcangeli        2015-09-04  569  	BUG_ON(src_start + len <= src_start);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  570  	BUG_ON(dst_start + len <= dst_start);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  571  
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  572  	src_addr = src_start;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  573  	dst_addr = dst_start;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  574  	copied = 0;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  575  	page = NULL;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  576  retry:
d8ed45c5dcd455 Michel Lespinasse       2020-06-08  577  	mmap_read_lock(dst_mm);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  578  
df2cc96e77011c Mike Rapoport           2018-06-07  579  	/*
df2cc96e77011c Mike Rapoport           2018-06-07  580  	 * If memory mappings are changing because of non-cooperative
df2cc96e77011c Mike Rapoport           2018-06-07  581  	 * operation (e.g. mremap) running in parallel, bail out and
df2cc96e77011c Mike Rapoport           2018-06-07  582  	 * request the user to retry later
df2cc96e77011c Mike Rapoport           2018-06-07  583  	 */
a5b6040d5cb800 Lokesh Gidra            2024-02-15  584  	down_read(&ctx->map_changing_lock);
df2cc96e77011c Mike Rapoport           2018-06-07  585  	err = -EAGAIN;
a5b6040d5cb800 Lokesh Gidra            2024-02-15  586  	if (atomic_read(&ctx->mmap_changing))
df2cc96e77011c Mike Rapoport           2018-06-07  587  		goto out_unlock;
df2cc96e77011c Mike Rapoport           2018-06-07  588  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  589  	/*
c1a4de99fada21 Andrea Arcangeli        2015-09-04  590  	 * Make sure the vma is not shared, that the dst range is
c1a4de99fada21 Andrea Arcangeli        2015-09-04  591  	 * both valid and fully within a single existing vma.
c1a4de99fada21 Andrea Arcangeli        2015-09-04  592  	 */
27d02568f529e9 Mike Rapoport           2017-02-24  593  	err = -ENOENT;
643aa36eadebdc Wei Yang                2019-11-30  594  	dst_vma = find_dst_vma(dst_mm, dst_start, len);
26071cedc519b8 Mike Rapoport           2017-02-22  595  	if (!dst_vma)
26071cedc519b8 Mike Rapoport           2017-02-22  596  		goto out_unlock;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  597  
27d02568f529e9 Mike Rapoport           2017-02-24  598  	err = -EINVAL;
27d02568f529e9 Mike Rapoport           2017-02-24  599  	/*
27d02568f529e9 Mike Rapoport           2017-02-24  600  	 * shmem_zero_setup is invoked in mmap for MAP_ANONYMOUS|MAP_SHARED but
27d02568f529e9 Mike Rapoport           2017-02-24  601  	 * it will overwrite vm_ops, so vma_is_anonymous must return false.
27d02568f529e9 Mike Rapoport           2017-02-24  602  	 */
27d02568f529e9 Mike Rapoport           2017-02-24  603  	if (WARN_ON_ONCE(vma_is_anonymous(dst_vma) &&
27d02568f529e9 Mike Rapoport           2017-02-24  604  	    dst_vma->vm_flags & VM_SHARED))
27d02568f529e9 Mike Rapoport           2017-02-24  605  		goto out_unlock;
27d02568f529e9 Mike Rapoport           2017-02-24  606  
72981e0e7b609c Andrea Arcangeli        2020-04-06  607  	/*
72981e0e7b609c Andrea Arcangeli        2020-04-06  608  	 * validate 'mode' now that we know the dst_vma: don't allow
72981e0e7b609c Andrea Arcangeli        2020-04-06  609  	 * a wrprotect copy if the userfaultfd didn't register as WP.
72981e0e7b609c Andrea Arcangeli        2020-04-06  610  	 */
72981e0e7b609c Andrea Arcangeli        2020-04-06  611  	wp_copy = mode & UFFDIO_COPY_MODE_WP;
72981e0e7b609c Andrea Arcangeli        2020-04-06  612  	if (wp_copy && !(dst_vma->vm_flags & VM_UFFD_WP))
72981e0e7b609c Andrea Arcangeli        2020-04-06  613  		goto out_unlock;
72981e0e7b609c Andrea Arcangeli        2020-04-06  614  
60d4d2d2b40e44 Mike Kravetz            2017-02-22  615  	/*
60d4d2d2b40e44 Mike Kravetz            2017-02-22  616  	 * If this is a HUGETLB vma, pass off to appropriate routine
60d4d2d2b40e44 Mike Kravetz            2017-02-22  617  	 */
60d4d2d2b40e44 Mike Kravetz            2017-02-22  618  	if (is_vm_hugetlb_page(dst_vma))
a5b6040d5cb800 Lokesh Gidra            2024-02-15  619  		return  __mcopy_atomic_hugetlb(ctx, dst_vma, dst_start,
6041c691790342 Peter Xu                2022-05-12  620  					       src_start, len, mcopy_mode,
a5b6040d5cb800 Lokesh Gidra            2024-02-15  621  					       wp_copy);
60d4d2d2b40e44 Mike Kravetz            2017-02-22  622  
26071cedc519b8 Mike Rapoport           2017-02-22  623  	if (!vma_is_anonymous(dst_vma) && !vma_is_shmem(dst_vma))
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  624  		goto out_unlock;
153132571f0204 Axel Rasmussen          2021-06-30  625  	if (!vma_is_shmem(dst_vma) && mcopy_mode == MCOPY_ATOMIC_CONTINUE)
f619147104c8ea Axel Rasmussen          2021-05-04  626  		goto out_unlock;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  627  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  628  	/*
c1a4de99fada21 Andrea Arcangeli        2015-09-04  629  	 * Ensure the dst_vma has a anon_vma or this page
c1a4de99fada21 Andrea Arcangeli        2015-09-04  630  	 * would get a NULL anon_vma when moved in the
c1a4de99fada21 Andrea Arcangeli        2015-09-04  631  	 * dst_vma.
c1a4de99fada21 Andrea Arcangeli        2015-09-04  632  	 */
c1a4de99fada21 Andrea Arcangeli        2015-09-04  633  	err = -ENOMEM;
5b51072e97d587 Andrea Arcangeli        2018-11-30  634  	if (!(dst_vma->vm_flags & VM_SHARED) &&
5b51072e97d587 Andrea Arcangeli        2018-11-30  635  	    unlikely(anon_vma_prepare(dst_vma)))
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  636  		goto out_unlock;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  637  
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  638  	while (src_addr < src_start + len) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  639  		pmd_t dst_pmdval;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  640  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  641  		BUG_ON(dst_addr >= dst_start + len);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  642  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  643  		dst_pmd = mm_alloc_pmd(dst_mm, dst_addr);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  644  		if (unlikely(!dst_pmd)) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  645  			err = -ENOMEM;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  646  			break;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  647  		}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  648  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  649  		dst_pmdval = pmd_read_atomic(dst_pmd);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  650  		/*
c1a4de99fada21 Andrea Arcangeli        2015-09-04  651  		 * If the dst_pmd is mapped as THP don't
c1a4de99fada21 Andrea Arcangeli        2015-09-04  652  		 * override it and just be strict.
c1a4de99fada21 Andrea Arcangeli        2015-09-04  653  		 */
c1a4de99fada21 Andrea Arcangeli        2015-09-04  654  		if (unlikely(pmd_trans_huge(dst_pmdval))) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  655  			err = -EEXIST;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  656  			break;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  657  		}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  658  		if (unlikely(pmd_none(dst_pmdval)) &&
4cf58924951ef8 Joel Fernandes (Google  2019-01-03  659) 		    unlikely(__pte_alloc(dst_mm, dst_pmd))) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  660  			err = -ENOMEM;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  661  			break;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  662  		}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  663  		/* If an huge pmd materialized from under us fail */
c1a4de99fada21 Andrea Arcangeli        2015-09-04  664  		if (unlikely(pmd_trans_huge(*dst_pmd))) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  665  			err = -EFAULT;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  666  			break;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  667  		}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  668  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  669  		BUG_ON(pmd_none(*dst_pmd));
c1a4de99fada21 Andrea Arcangeli        2015-09-04  670  		BUG_ON(pmd_trans_huge(*dst_pmd));
c1a4de99fada21 Andrea Arcangeli        2015-09-04  671  
3217d3c79b5d7a Mike Rapoport           2017-09-06  672  		err = mfill_atomic_pte(dst_mm, dst_pmd, dst_vma, dst_addr,
153132571f0204 Axel Rasmussen          2021-06-30  673  				       src_addr, &page, mcopy_mode, wp_copy);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  674  		cond_resched();
c1a4de99fada21 Andrea Arcangeli        2015-09-04  675  
9e368259ad9883 Andrea Arcangeli        2018-11-30  676  		if (unlikely(err == -ENOENT)) {
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  677  			void *page_kaddr;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  678  
a5b6040d5cb800 Lokesh Gidra            2024-02-15  679  			up_read(&ctx->map_changing_lock);
d8ed45c5dcd455 Michel Lespinasse       2020-06-08  680  			mmap_read_unlock(dst_mm);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  681  			BUG_ON(!page);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  682  
5521de7dddd211 Ira Weiny               2022-10-23  683  			page_kaddr = kmap_local_page(page);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  684  			err = copy_from_user(page_kaddr,
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  685  					     (const void __user *) src_addr,
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  686  					     PAGE_SIZE);
5521de7dddd211 Ira Weiny               2022-10-23  687  			kunmap_local(page_kaddr);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  688  			if (unlikely(err)) {
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  689  				err = -EFAULT;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  690  				goto out;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  691  			}
7c25a0b89a4878 Muchun Song             2022-03-22  692  			flush_dcache_page(page);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  693  			goto retry;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  694  		} else
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  695  			BUG_ON(page);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  696  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  697  		if (!err) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  698  			dst_addr += PAGE_SIZE;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  699  			src_addr += PAGE_SIZE;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  700  			copied += PAGE_SIZE;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  701  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  702  			if (fatal_signal_pending(current))
c1a4de99fada21 Andrea Arcangeli        2015-09-04  703  				err = -EINTR;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  704  		}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  705  		if (err)
c1a4de99fada21 Andrea Arcangeli        2015-09-04  706  			break;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  707  	}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  708  
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  709  out_unlock:
a5b6040d5cb800 Lokesh Gidra            2024-02-15  710  	up_read(&ctx->map_changing_lock);
d8ed45c5dcd455 Michel Lespinasse       2020-06-08  711  	mmap_read_unlock(dst_mm);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  712  out:
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  713  	if (page)
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  714  		put_page(page);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  715  	BUG_ON(copied < 0);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  716  	BUG_ON(err > 0);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  717  	BUG_ON(!copied && !err);
c1a4de99fada21 Andrea Arcangeli        2015-09-04 @718  	return copied ? copied : err;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  719  }
c1a4de99fada21 Andrea Arcangeli        2015-09-04  720  

:::::: The code at line 718 was first introduced by commit
:::::: c1a4de99fada21e2e9251e52cbb51eff5aadc757 userfaultfd: mcopy_atomic|mfill_zeropage: UFFDIO_COPY|UFFDIO_ZEROPAGE preparation

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
