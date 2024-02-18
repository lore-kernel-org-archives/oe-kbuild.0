Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EED17F0
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Feb 2024 04:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708228881; cv=none; b=TsIhxDbY2b4NiyizX/hxsVBgD6wmKPaTm3YV2llCqtjK96HNh9vrzRiLfmuxZwDedprQY/jZi9wlV8sdxVqgGsqjVaiivPBwxnnkg7TAh+QQLx+DtpZTU35jlG7dE2/wVa1AXTRfHpjhMoB5eZAj1SgnQw0/NUdvbuQdr/YXGps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708228881; c=relaxed/simple;
	bh=eFHuE7Gbkbum2VrRKyu7PApHpjIIFf8Fb1DlD/iXEWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YrJkhlw/pDDk1LHKr9FV9XL1KayDu+QBREEt8RCLfJmuLpHSbnh2uNUvSnKdYUSNQWGs79NnNGEVFwE6+7ZNemoPqEK/QlUx+Xyd+oDhjOGyJXmQ2JNn30rgHK56pqFnYu6rf0u3F2wbphwwaHWxZ+YvgyAKp6aa0OCRThWaR/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HEUYA9xp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEUYA9xp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708228878; x=1739764878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFHuE7Gbkbum2VrRKyu7PApHpjIIFf8Fb1DlD/iXEWw=;
  b=HEUYA9xpupNfu2WDwe9wQXS2+HRN5WUi8L3vfazA0u+/Sl3tcHvgdJSF
   YOYbF6d5qDepU+/5WnEYmNgSugKIIiYOotaZNltwbvlXee5BYWTgrian5
   KCJquMBRyHsnPxH1v5z5tKeLC5MRVUiTaN2S5KkQlIf6458xHqRrKqXR9
   CZxQdH/c9EdKsjqbUOuzEy8SFS9yJOqiWm3Z/Lgu02hq8nuvkLMLK8JHz
   lu6e+NAq1qz87k+qi9bF7Rdy/5GZQML+PKCR1vWm763eIkWRSgzrxH9NN
   pYZQe6LNIcD6riNLF9CK7hgZrNKWDPKOIVA2H2LjxMJUDpGVeRzzu5NbH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2191902"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="2191902"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 20:01:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="4482285"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 17 Feb 2024 20:01:17 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbYMb-0002l8-1o;
	Sun, 18 Feb 2024 04:01:13 +0000
Date: Sun, 18 Feb 2024 12:00:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 308/320] mm/userfaultfd.c:740 mfill_atomic()
 warn: inconsistent returns '&ctx->map_changing_lock'.
Message-ID: <202402181106.IX4u67yH-lkp@intel.com>
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
TO: Lokesh Gidra <lokeshgidra@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Mike Rapoport (IBM)" <rppt@kernel.org>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   9951769060d8f5eb001acaca67c1439d2cfe1c6b
commit: 973edec7cc120e3bf429b8183b62c2292b728bde [308/320] userfaultfd: protect mmap_changing with rw_sem in userfaulfd_ctx
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-r081-20240216 (https://download.01.org/0day-ci/archive/20240218/202402181106.IX4u67yH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402181106.IX4u67yH-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:740 mfill_atomic() warn: inconsistent returns '&ctx->map_changing_lock'.

vim +740 mm/userfaultfd.c

3217d3c79b5d7a Mike Rapoport           2017-09-06  570  
973edec7cc120e Lokesh Gidra            2024-02-15  571  static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
c1a4de99fada21 Andrea Arcangeli        2015-09-04  572  					    unsigned long dst_start,
c1a4de99fada21 Andrea Arcangeli        2015-09-04  573  					    unsigned long src_start,
c1a4de99fada21 Andrea Arcangeli        2015-09-04  574  					    unsigned long len,
d9712937037e0c Axel Rasmussen          2023-03-14  575  					    uffd_flags_t flags)
c1a4de99fada21 Andrea Arcangeli        2015-09-04  576  {
973edec7cc120e Lokesh Gidra            2024-02-15  577  	struct mm_struct *dst_mm = ctx->mm;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  578  	struct vm_area_struct *dst_vma;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  579  	ssize_t err;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  580  	pmd_t *dst_pmd;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  581  	unsigned long src_addr, dst_addr;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  582  	long copied;
d7be6d7eee1bbf ZhangPeng               2023-04-10  583  	struct folio *folio;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  584  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  585  	/*
c1a4de99fada21 Andrea Arcangeli        2015-09-04  586  	 * Sanitize the command parameters:
c1a4de99fada21 Andrea Arcangeli        2015-09-04  587  	 */
c1a4de99fada21 Andrea Arcangeli        2015-09-04  588  	BUG_ON(dst_start & ~PAGE_MASK);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  589  	BUG_ON(len & ~PAGE_MASK);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  590  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  591  	/* Does the address range wrap, or is the span zero-sized? */
c1a4de99fada21 Andrea Arcangeli        2015-09-04  592  	BUG_ON(src_start + len <= src_start);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  593  	BUG_ON(dst_start + len <= dst_start);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  594  
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  595  	src_addr = src_start;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  596  	dst_addr = dst_start;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  597  	copied = 0;
d7be6d7eee1bbf ZhangPeng               2023-04-10  598  	folio = NULL;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  599  retry:
d8ed45c5dcd455 Michel Lespinasse       2020-06-08  600  	mmap_read_lock(dst_mm);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  601  
df2cc96e77011c Mike Rapoport           2018-06-07  602  	/*
df2cc96e77011c Mike Rapoport           2018-06-07  603  	 * If memory mappings are changing because of non-cooperative
df2cc96e77011c Mike Rapoport           2018-06-07  604  	 * operation (e.g. mremap) running in parallel, bail out and
df2cc96e77011c Mike Rapoport           2018-06-07  605  	 * request the user to retry later
df2cc96e77011c Mike Rapoport           2018-06-07  606  	 */
973edec7cc120e Lokesh Gidra            2024-02-15  607  	down_read(&ctx->map_changing_lock);
df2cc96e77011c Mike Rapoport           2018-06-07  608  	err = -EAGAIN;
973edec7cc120e Lokesh Gidra            2024-02-15  609  	if (atomic_read(&ctx->mmap_changing))
df2cc96e77011c Mike Rapoport           2018-06-07  610  		goto out_unlock;
df2cc96e77011c Mike Rapoport           2018-06-07  611  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  612  	/*
c1a4de99fada21 Andrea Arcangeli        2015-09-04  613  	 * Make sure the vma is not shared, that the dst range is
c1a4de99fada21 Andrea Arcangeli        2015-09-04  614  	 * both valid and fully within a single existing vma.
c1a4de99fada21 Andrea Arcangeli        2015-09-04  615  	 */
27d02568f529e9 Mike Rapoport           2017-02-24  616  	err = -ENOENT;
643aa36eadebdc Wei Yang                2019-11-30  617  	dst_vma = find_dst_vma(dst_mm, dst_start, len);
26071cedc519b8 Mike Rapoport           2017-02-22  618  	if (!dst_vma)
26071cedc519b8 Mike Rapoport           2017-02-22  619  		goto out_unlock;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  620  
27d02568f529e9 Mike Rapoport           2017-02-24  621  	err = -EINVAL;
27d02568f529e9 Mike Rapoport           2017-02-24  622  	/*
27d02568f529e9 Mike Rapoport           2017-02-24  623  	 * shmem_zero_setup is invoked in mmap for MAP_ANONYMOUS|MAP_SHARED but
27d02568f529e9 Mike Rapoport           2017-02-24  624  	 * it will overwrite vm_ops, so vma_is_anonymous must return false.
27d02568f529e9 Mike Rapoport           2017-02-24  625  	 */
27d02568f529e9 Mike Rapoport           2017-02-24  626  	if (WARN_ON_ONCE(vma_is_anonymous(dst_vma) &&
27d02568f529e9 Mike Rapoport           2017-02-24  627  	    dst_vma->vm_flags & VM_SHARED))
27d02568f529e9 Mike Rapoport           2017-02-24  628  		goto out_unlock;
27d02568f529e9 Mike Rapoport           2017-02-24  629  
72981e0e7b609c Andrea Arcangeli        2020-04-06  630  	/*
72981e0e7b609c Andrea Arcangeli        2020-04-06  631  	 * validate 'mode' now that we know the dst_vma: don't allow
72981e0e7b609c Andrea Arcangeli        2020-04-06  632  	 * a wrprotect copy if the userfaultfd didn't register as WP.
72981e0e7b609c Andrea Arcangeli        2020-04-06  633  	 */
d9712937037e0c Axel Rasmussen          2023-03-14  634  	if ((flags & MFILL_ATOMIC_WP) && !(dst_vma->vm_flags & VM_UFFD_WP))
72981e0e7b609c Andrea Arcangeli        2020-04-06  635  		goto out_unlock;
72981e0e7b609c Andrea Arcangeli        2020-04-06  636  
60d4d2d2b40e44 Mike Kravetz            2017-02-22  637  	/*
60d4d2d2b40e44 Mike Kravetz            2017-02-22  638  	 * If this is a HUGETLB vma, pass off to appropriate routine
60d4d2d2b40e44 Mike Kravetz            2017-02-22  639  	 */
60d4d2d2b40e44 Mike Kravetz            2017-02-22  640  	if (is_vm_hugetlb_page(dst_vma))
973edec7cc120e Lokesh Gidra            2024-02-15  641  		return  mfill_atomic_hugetlb(ctx, dst_vma, dst_start,
973edec7cc120e Lokesh Gidra            2024-02-15  642  					     src_start, len, flags);
60d4d2d2b40e44 Mike Kravetz            2017-02-22  643  
26071cedc519b8 Mike Rapoport           2017-02-22  644  	if (!vma_is_anonymous(dst_vma) && !vma_is_shmem(dst_vma))
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  645  		goto out_unlock;
d9712937037e0c Axel Rasmussen          2023-03-14  646  	if (!vma_is_shmem(dst_vma) &&
d9712937037e0c Axel Rasmussen          2023-03-14  647  	    uffd_flags_mode_is(flags, MFILL_ATOMIC_CONTINUE))
f619147104c8ea Axel Rasmussen          2021-05-04  648  		goto out_unlock;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  649  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  650  	/*
c1a4de99fada21 Andrea Arcangeli        2015-09-04  651  	 * Ensure the dst_vma has a anon_vma or this page
c1a4de99fada21 Andrea Arcangeli        2015-09-04  652  	 * would get a NULL anon_vma when moved in the
c1a4de99fada21 Andrea Arcangeli        2015-09-04  653  	 * dst_vma.
c1a4de99fada21 Andrea Arcangeli        2015-09-04  654  	 */
c1a4de99fada21 Andrea Arcangeli        2015-09-04  655  	err = -ENOMEM;
5b51072e97d587 Andrea Arcangeli        2018-11-30  656  	if (!(dst_vma->vm_flags & VM_SHARED) &&
5b51072e97d587 Andrea Arcangeli        2018-11-30  657  	    unlikely(anon_vma_prepare(dst_vma)))
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  658  		goto out_unlock;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  659  
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  660  	while (src_addr < src_start + len) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  661  		pmd_t dst_pmdval;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  662  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  663  		BUG_ON(dst_addr >= dst_start + len);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  664  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  665  		dst_pmd = mm_alloc_pmd(dst_mm, dst_addr);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  666  		if (unlikely(!dst_pmd)) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  667  			err = -ENOMEM;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  668  			break;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  669  		}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  670  
dab6e717429e5e Peter Zijlstra          2020-11-26  671  		dst_pmdval = pmdp_get_lockless(dst_pmd);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  672  		/*
c1a4de99fada21 Andrea Arcangeli        2015-09-04  673  		 * If the dst_pmd is mapped as THP don't
c1a4de99fada21 Andrea Arcangeli        2015-09-04  674  		 * override it and just be strict.
c1a4de99fada21 Andrea Arcangeli        2015-09-04  675  		 */
c1a4de99fada21 Andrea Arcangeli        2015-09-04  676  		if (unlikely(pmd_trans_huge(dst_pmdval))) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  677  			err = -EEXIST;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  678  			break;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  679  		}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  680  		if (unlikely(pmd_none(dst_pmdval)) &&
4cf58924951ef8 Joel Fernandes (Google  2019-01-03  681) 		    unlikely(__pte_alloc(dst_mm, dst_pmd))) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  682  			err = -ENOMEM;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  683  			break;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  684  		}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  685  		/* If an huge pmd materialized from under us fail */
c1a4de99fada21 Andrea Arcangeli        2015-09-04  686  		if (unlikely(pmd_trans_huge(*dst_pmd))) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  687  			err = -EFAULT;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  688  			break;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  689  		}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  690  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  691  		BUG_ON(pmd_none(*dst_pmd));
c1a4de99fada21 Andrea Arcangeli        2015-09-04  692  		BUG_ON(pmd_trans_huge(*dst_pmd));
c1a4de99fada21 Andrea Arcangeli        2015-09-04  693  
61c5004022f56c Axel Rasmussen          2023-03-14  694  		err = mfill_atomic_pte(dst_pmd, dst_vma, dst_addr,
d7be6d7eee1bbf ZhangPeng               2023-04-10  695  				       src_addr, flags, &folio);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  696  		cond_resched();
c1a4de99fada21 Andrea Arcangeli        2015-09-04  697  
9e368259ad9883 Andrea Arcangeli        2018-11-30  698  		if (unlikely(err == -ENOENT)) {
d7be6d7eee1bbf ZhangPeng               2023-04-10  699  			void *kaddr;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  700  
973edec7cc120e Lokesh Gidra            2024-02-15  701  			up_read(&ctx->map_changing_lock);
d8ed45c5dcd455 Michel Lespinasse       2020-06-08  702  			mmap_read_unlock(dst_mm);
d7be6d7eee1bbf ZhangPeng               2023-04-10  703  			BUG_ON(!folio);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  704  
d7be6d7eee1bbf ZhangPeng               2023-04-10  705  			kaddr = kmap_local_folio(folio, 0);
d7be6d7eee1bbf ZhangPeng               2023-04-10  706  			err = copy_from_user(kaddr,
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  707  					     (const void __user *) src_addr,
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  708  					     PAGE_SIZE);
d7be6d7eee1bbf ZhangPeng               2023-04-10  709  			kunmap_local(kaddr);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  710  			if (unlikely(err)) {
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  711  				err = -EFAULT;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  712  				goto out;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  713  			}
d7be6d7eee1bbf ZhangPeng               2023-04-10  714  			flush_dcache_folio(folio);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  715  			goto retry;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  716  		} else
d7be6d7eee1bbf ZhangPeng               2023-04-10  717  			BUG_ON(folio);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  718  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  719  		if (!err) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  720  			dst_addr += PAGE_SIZE;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  721  			src_addr += PAGE_SIZE;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  722  			copied += PAGE_SIZE;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  723  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  724  			if (fatal_signal_pending(current))
c1a4de99fada21 Andrea Arcangeli        2015-09-04  725  				err = -EINTR;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  726  		}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  727  		if (err)
c1a4de99fada21 Andrea Arcangeli        2015-09-04  728  			break;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  729  	}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  730  
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  731  out_unlock:
973edec7cc120e Lokesh Gidra            2024-02-15  732  	up_read(&ctx->map_changing_lock);
d8ed45c5dcd455 Michel Lespinasse       2020-06-08  733  	mmap_read_unlock(dst_mm);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  734  out:
d7be6d7eee1bbf ZhangPeng               2023-04-10  735  	if (folio)
d7be6d7eee1bbf ZhangPeng               2023-04-10  736  		folio_put(folio);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  737  	BUG_ON(copied < 0);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  738  	BUG_ON(err > 0);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  739  	BUG_ON(!copied && !err);
c1a4de99fada21 Andrea Arcangeli        2015-09-04 @740  	return copied ? copied : err;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  741  }
c1a4de99fada21 Andrea Arcangeli        2015-09-04  742  

:::::: The code at line 740 was first introduced by commit
:::::: c1a4de99fada21e2e9251e52cbb51eff5aadc757 userfaultfd: mcopy_atomic|mfill_zeropage: UFFDIO_COPY|UFFDIO_ZEROPAGE preparation

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
