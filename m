Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646680;
	b=G7wy1CY5Oy97vWRCD9nlezNgK5fMFRM/FvVdaPCnItlDh4kmV0Z1JSq5D6SQuvRFF7GE
	 GCmXSykkR8Sah1tjZv5o7hP1ei0ByiHnd/3jcaqP+nyRZMUnzuaRClmlVDGOwWJH5nYsA
	 VAflxVe6+nIl9mFm5tWXqFcjN1HnFJA5vj0V/Ml6hKR2+yk7aiqhA+MfbhFV2J13UTHz9
	 GkHdEck1zc3QxuxXuGnBxSMYPkeApKyU28wy1c5rlnZeK+mPn2PlEbxJ1tszk4R3j88Ws
	 nd/B7jYsvelkJe+v3ytrZBUixrqeVg3WHVPSUZY8+o35bemzGhKS64D4J1I1TVRnhbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646680;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6a1/2jw2sPQkFq4+erR0IyBHLyGkekQfMUrWDIEbupw=;
	b=UlnnL7TvBE6ipmy2EQpMPlzBdXdhb0F/2Mr6ZV9iqil4AkO2ujAqDKZP+ofDyX3a5m9J
	 SvXdSAxai49Aqlc/a+b4cD+7sDYO6N3GnsjV+zfkkEw7iVQCx3gdSnepuXyFd2MnNQChN
	 4+ckC1iuEiH21kKyITonMAVTKphPgv8f1VdhJPGfEeHAXmfnDgJf6pQ9CZukR8Sw3DVBI
	 4DFm0ricJrVTaHI2QBS1WijbXw0x7CkIwiM+2zDWx57O5SdSRjsTb/Rmy/DzporaOpPwC
	 Dxh96JIcrVoiLKCE132lzygJkKZ2KFcaAKDZ7lCi1FdTuVwllDSRoBhaW7BPAPNZYiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T5ArwwRO;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443E9606A319
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Oct 2026 05:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 443E9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T5ArwwRO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792646678; x=1824182678;
  h=date:from:to:cc:subject:message-id;
  bh=NEvGe973DGtgfqbJgXMBgnGOuOgyp5O5B+IH2sFbG5c=;
  b=T5ArwwROVyEa2ReYk0hlrVZ2JWmjXPp6g/JjG7snJzqfUwjOQgBEwUd4
   7YuZW83mT5Kaumio3MwtY+7zzF3aUPHhN5zoeShSO5RPLh3cNRiPAuNU/
   aV6PM7yKj+YqYJhIf2b+YOIEQ4ljfBe1tdV77PNhQQ2ep1Wf0eg+vIKPD
   dLNYSSr+6iGm4p6fjtfJgDTyMRElwTdczIIRgNT0nVEM5TcJ7b1+HL0jE
   s16WZZ1mX2iiN5R/6A+0dkppUqyfLmBa/kSgfVHJjLdh5Vbr27RpXSTQU
   HtcrUyQyClp4QhhnijsvFXW7J9k1ubiIJiLn4tP3iPOqjEq/PwCMP8Zax
   Q==;
X-CSE-ConnectionGUID: TgOf9UdzQmmQL37vbbBReg==
X-CSE-MsgGUID: Yo80nRJXRG+mehifK8dhRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1487570"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1487570"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 22:24:37 -0700
X-CSE-ConnectionGUID: 6W5Y0drEQUygpm9t+Q9ZmA==
X-CSE-MsgGUID: XBJNyxkJQuSUIQOpwqJMqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3333660"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Oct 2026 22:24:36 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJlI1-000000000F5-1wet;
	Thu, 22 Oct 2026 05:24:33 +0000
Date: Thu, 22 Oct 2026 07:23:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 7/7] mm/userfaultfd.c:718
 __mcopy_atomic() warn: inconsistent returns '&ctx->map_changing_lock'.
Message-ID: <202610220723.0dKRYrMy-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   3ad9f1eca4fa204bb4428fa7f6e8448cee35d055
commit: a5b6040d5cb800d56a2d2c5d106e1213838eed4e [7/7] BACKPORT: userfaultfd: protect mmap_changing with rw_sem in userfaulfd_ctx
:::::: branch date: 21 hours ago
:::::: commit date: 2 years, 6 months ago
config: i386-randconfig-2200-20261021 (https://download.01.org/0day-ci/archive/20261022/202610220723.0dKRYrMy-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610220723.0dKRYrMy-lkp@intel.com/

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
