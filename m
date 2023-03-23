Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC224A950
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Mar 2023 17:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679590911; x=1711126911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/EbLTLNAf4asOTZKeCl4xP1TVhpSJ0rxtjB5ql88Ns=;
  b=kLCFjYeVesBGhkfSITLs+02ZhQfc2/HZZtlCfTMIItZnMjyKqBMWq2+F
   umw1Lqu8DGG8EauQwvcvhDnChXUrQ4bbMWFanGRkMOaLAc/mQ0rhqTVy+
   YOF/7a+g6hV+SyquNpF8YUlN/XMOygClvhSHc+2JWFjXcj7FoToDHBe2s
   PAqhkLiPWBrvUVMjkz+VPOlYNCnRjd9+PzLSnys4pX6LDs+QiawD2vu0+
   MamaodKG6kTCdkj2uIkpNxJFAv3hZmeJ3p58aUny1TRfW6w2+fMKT9U21
   TJ51eUNOQZ7NQxOZ0Yu430gc2RQ6whFi2ez6G0bsyBdg4m8N9vEiDDHfs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="341109007"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="341109007"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 10:01:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="714890193"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="714890193"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Mar 2023 10:01:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfOJj-000EYi-1z;
	Thu, 23 Mar 2023 17:01:35 +0000
Date: Fri, 24 Mar 2023 01:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 232/249] mm/userfaultfd.c:688 mfill_atomic()
 warn: inconsistent returns '&dst_mm->mmap_lock'.
Message-ID: <202303240004.7atXWqLQ-lkp@intel.com>
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
TO: Axel Rasmussen <axelrasmussen@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   51551d71edbc998fd8c8afa7312db3d270f5998e
commit: fc9e2b001e85d8e0dcc80ad8af973ccb0b3adba1 [232/249] mm: userfaultfd: rename functions for clarity + consistency
:::::: branch date: 17 hours ago
:::::: commit date: 7 days ago
config: loongarch-randconfig-m041-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240004.7atXWqLQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303240004.7atXWqLQ-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:688 mfill_atomic() warn: inconsistent returns '&dst_mm->mmap_lock'.
mm/userfaultfd.c:361 mfill_atomic_hugetlb() warn: variable dereferenced before check 'dst_vma' (see line 321)

vim +688 mm/userfaultfd.c

3217d3c79b5d7a Mike Rapoport           2017-09-06  518  
fc9e2b001e85d8 Axel Rasmussen          2023-03-14  519  static __always_inline ssize_t mfill_atomic(struct mm_struct *dst_mm,
c1a4de99fada21 Andrea Arcangeli        2015-09-04  520  					    unsigned long dst_start,
c1a4de99fada21 Andrea Arcangeli        2015-09-04  521  					    unsigned long src_start,
c1a4de99fada21 Andrea Arcangeli        2015-09-04  522  					    unsigned long len,
f619147104c8ea Axel Rasmussen          2021-05-04  523  					    enum mcopy_atomic_mode mcopy_mode,
a759a909d42d72 Nadav Amit              2021-09-02  524  					    atomic_t *mmap_changing,
72981e0e7b609c Andrea Arcangeli        2020-04-06  525  					    __u64 mode)
c1a4de99fada21 Andrea Arcangeli        2015-09-04  526  {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  527  	struct vm_area_struct *dst_vma;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  528  	ssize_t err;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  529  	pmd_t *dst_pmd;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  530  	unsigned long src_addr, dst_addr;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  531  	long copied;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  532  	struct page *page;
72981e0e7b609c Andrea Arcangeli        2020-04-06  533  	bool wp_copy;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  534  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  535  	/*
c1a4de99fada21 Andrea Arcangeli        2015-09-04  536  	 * Sanitize the command parameters:
c1a4de99fada21 Andrea Arcangeli        2015-09-04  537  	 */
c1a4de99fada21 Andrea Arcangeli        2015-09-04  538  	BUG_ON(dst_start & ~PAGE_MASK);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  539  	BUG_ON(len & ~PAGE_MASK);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  540  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  541  	/* Does the address range wrap, or is the span zero-sized? */
c1a4de99fada21 Andrea Arcangeli        2015-09-04  542  	BUG_ON(src_start + len <= src_start);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  543  	BUG_ON(dst_start + len <= dst_start);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  544  
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  545  	src_addr = src_start;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  546  	dst_addr = dst_start;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  547  	copied = 0;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  548  	page = NULL;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  549  retry:
d8ed45c5dcd455 Michel Lespinasse       2020-06-08  550  	mmap_read_lock(dst_mm);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  551  
df2cc96e77011c Mike Rapoport           2018-06-07  552  	/*
df2cc96e77011c Mike Rapoport           2018-06-07  553  	 * If memory mappings are changing because of non-cooperative
df2cc96e77011c Mike Rapoport           2018-06-07  554  	 * operation (e.g. mremap) running in parallel, bail out and
df2cc96e77011c Mike Rapoport           2018-06-07  555  	 * request the user to retry later
df2cc96e77011c Mike Rapoport           2018-06-07  556  	 */
df2cc96e77011c Mike Rapoport           2018-06-07  557  	err = -EAGAIN;
a759a909d42d72 Nadav Amit              2021-09-02  558  	if (mmap_changing && atomic_read(mmap_changing))
df2cc96e77011c Mike Rapoport           2018-06-07  559  		goto out_unlock;
df2cc96e77011c Mike Rapoport           2018-06-07  560  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  561  	/*
c1a4de99fada21 Andrea Arcangeli        2015-09-04  562  	 * Make sure the vma is not shared, that the dst range is
c1a4de99fada21 Andrea Arcangeli        2015-09-04  563  	 * both valid and fully within a single existing vma.
c1a4de99fada21 Andrea Arcangeli        2015-09-04  564  	 */
27d02568f529e9 Mike Rapoport           2017-02-24  565  	err = -ENOENT;
643aa36eadebdc Wei Yang                2019-11-30  566  	dst_vma = find_dst_vma(dst_mm, dst_start, len);
26071cedc519b8 Mike Rapoport           2017-02-22  567  	if (!dst_vma)
26071cedc519b8 Mike Rapoport           2017-02-22  568  		goto out_unlock;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  569  
27d02568f529e9 Mike Rapoport           2017-02-24  570  	err = -EINVAL;
27d02568f529e9 Mike Rapoport           2017-02-24  571  	/*
27d02568f529e9 Mike Rapoport           2017-02-24  572  	 * shmem_zero_setup is invoked in mmap for MAP_ANONYMOUS|MAP_SHARED but
27d02568f529e9 Mike Rapoport           2017-02-24  573  	 * it will overwrite vm_ops, so vma_is_anonymous must return false.
27d02568f529e9 Mike Rapoport           2017-02-24  574  	 */
27d02568f529e9 Mike Rapoport           2017-02-24  575  	if (WARN_ON_ONCE(vma_is_anonymous(dst_vma) &&
27d02568f529e9 Mike Rapoport           2017-02-24  576  	    dst_vma->vm_flags & VM_SHARED))
27d02568f529e9 Mike Rapoport           2017-02-24  577  		goto out_unlock;
27d02568f529e9 Mike Rapoport           2017-02-24  578  
72981e0e7b609c Andrea Arcangeli        2020-04-06  579  	/*
72981e0e7b609c Andrea Arcangeli        2020-04-06  580  	 * validate 'mode' now that we know the dst_vma: don't allow
72981e0e7b609c Andrea Arcangeli        2020-04-06  581  	 * a wrprotect copy if the userfaultfd didn't register as WP.
72981e0e7b609c Andrea Arcangeli        2020-04-06  582  	 */
72981e0e7b609c Andrea Arcangeli        2020-04-06  583  	wp_copy = mode & UFFDIO_COPY_MODE_WP;
72981e0e7b609c Andrea Arcangeli        2020-04-06  584  	if (wp_copy && !(dst_vma->vm_flags & VM_UFFD_WP))
72981e0e7b609c Andrea Arcangeli        2020-04-06  585  		goto out_unlock;
72981e0e7b609c Andrea Arcangeli        2020-04-06  586  
60d4d2d2b40e44 Mike Kravetz            2017-02-22  587  	/*
60d4d2d2b40e44 Mike Kravetz            2017-02-22  588  	 * If this is a HUGETLB vma, pass off to appropriate routine
60d4d2d2b40e44 Mike Kravetz            2017-02-22  589  	 */
60d4d2d2b40e44 Mike Kravetz            2017-02-22  590  	if (is_vm_hugetlb_page(dst_vma))
fc9e2b001e85d8 Axel Rasmussen          2023-03-14  591  		return  mfill_atomic_hugetlb(dst_mm, dst_vma, dst_start,
6041c691790342 Peter Xu                2022-05-12  592  					     src_start, len, mcopy_mode,
6041c691790342 Peter Xu                2022-05-12  593  					     wp_copy);
60d4d2d2b40e44 Mike Kravetz            2017-02-22  594  
26071cedc519b8 Mike Rapoport           2017-02-22  595  	if (!vma_is_anonymous(dst_vma) && !vma_is_shmem(dst_vma))
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  596  		goto out_unlock;
153132571f0204 Axel Rasmussen          2021-06-30  597  	if (!vma_is_shmem(dst_vma) && mcopy_mode == MCOPY_ATOMIC_CONTINUE)
f619147104c8ea Axel Rasmussen          2021-05-04  598  		goto out_unlock;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  599  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  600  	/*
c1a4de99fada21 Andrea Arcangeli        2015-09-04  601  	 * Ensure the dst_vma has a anon_vma or this page
c1a4de99fada21 Andrea Arcangeli        2015-09-04  602  	 * would get a NULL anon_vma when moved in the
c1a4de99fada21 Andrea Arcangeli        2015-09-04  603  	 * dst_vma.
c1a4de99fada21 Andrea Arcangeli        2015-09-04  604  	 */
c1a4de99fada21 Andrea Arcangeli        2015-09-04  605  	err = -ENOMEM;
5b51072e97d587 Andrea Arcangeli        2018-11-30  606  	if (!(dst_vma->vm_flags & VM_SHARED) &&
5b51072e97d587 Andrea Arcangeli        2018-11-30  607  	    unlikely(anon_vma_prepare(dst_vma)))
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  608  		goto out_unlock;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  609  
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  610  	while (src_addr < src_start + len) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  611  		pmd_t dst_pmdval;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  612  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  613  		BUG_ON(dst_addr >= dst_start + len);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  614  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  615  		dst_pmd = mm_alloc_pmd(dst_mm, dst_addr);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  616  		if (unlikely(!dst_pmd)) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  617  			err = -ENOMEM;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  618  			break;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  619  		}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  620  
dab6e717429e5e Peter Zijlstra          2020-11-26  621  		dst_pmdval = pmdp_get_lockless(dst_pmd);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  622  		/*
c1a4de99fada21 Andrea Arcangeli        2015-09-04  623  		 * If the dst_pmd is mapped as THP don't
c1a4de99fada21 Andrea Arcangeli        2015-09-04  624  		 * override it and just be strict.
c1a4de99fada21 Andrea Arcangeli        2015-09-04  625  		 */
c1a4de99fada21 Andrea Arcangeli        2015-09-04  626  		if (unlikely(pmd_trans_huge(dst_pmdval))) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  627  			err = -EEXIST;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  628  			break;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  629  		}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  630  		if (unlikely(pmd_none(dst_pmdval)) &&
4cf58924951ef8 Joel Fernandes (Google  2019-01-03  631) 		    unlikely(__pte_alloc(dst_mm, dst_pmd))) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  632  			err = -ENOMEM;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  633  			break;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  634  		}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  635  		/* If an huge pmd materialized from under us fail */
c1a4de99fada21 Andrea Arcangeli        2015-09-04  636  		if (unlikely(pmd_trans_huge(*dst_pmd))) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  637  			err = -EFAULT;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  638  			break;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  639  		}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  640  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  641  		BUG_ON(pmd_none(*dst_pmd));
c1a4de99fada21 Andrea Arcangeli        2015-09-04  642  		BUG_ON(pmd_trans_huge(*dst_pmd));
c1a4de99fada21 Andrea Arcangeli        2015-09-04  643  
3217d3c79b5d7a Mike Rapoport           2017-09-06  644  		err = mfill_atomic_pte(dst_mm, dst_pmd, dst_vma, dst_addr,
153132571f0204 Axel Rasmussen          2021-06-30  645  				       src_addr, &page, mcopy_mode, wp_copy);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  646  		cond_resched();
c1a4de99fada21 Andrea Arcangeli        2015-09-04  647  
9e368259ad9883 Andrea Arcangeli        2018-11-30  648  		if (unlikely(err == -ENOENT)) {
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  649  			void *page_kaddr;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  650  
d8ed45c5dcd455 Michel Lespinasse       2020-06-08  651  			mmap_read_unlock(dst_mm);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  652  			BUG_ON(!page);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  653  
5521de7dddd211 Ira Weiny               2022-10-23  654  			page_kaddr = kmap_local_page(page);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  655  			err = copy_from_user(page_kaddr,
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  656  					     (const void __user *) src_addr,
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  657  					     PAGE_SIZE);
5521de7dddd211 Ira Weiny               2022-10-23  658  			kunmap_local(page_kaddr);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  659  			if (unlikely(err)) {
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  660  				err = -EFAULT;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  661  				goto out;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  662  			}
7c25a0b89a4878 Muchun Song             2022-03-22  663  			flush_dcache_page(page);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  664  			goto retry;
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  665  		} else
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  666  			BUG_ON(page);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  667  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  668  		if (!err) {
c1a4de99fada21 Andrea Arcangeli        2015-09-04  669  			dst_addr += PAGE_SIZE;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  670  			src_addr += PAGE_SIZE;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  671  			copied += PAGE_SIZE;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  672  
c1a4de99fada21 Andrea Arcangeli        2015-09-04  673  			if (fatal_signal_pending(current))
c1a4de99fada21 Andrea Arcangeli        2015-09-04  674  				err = -EINTR;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  675  		}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  676  		if (err)
c1a4de99fada21 Andrea Arcangeli        2015-09-04  677  			break;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  678  	}
c1a4de99fada21 Andrea Arcangeli        2015-09-04  679  
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  680  out_unlock:
d8ed45c5dcd455 Michel Lespinasse       2020-06-08  681  	mmap_read_unlock(dst_mm);
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  682  out:
b6ebaedb4cb1a1 Andrea Arcangeli        2015-09-04  683  	if (page)
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  684  		put_page(page);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  685  	BUG_ON(copied < 0);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  686  	BUG_ON(err > 0);
c1a4de99fada21 Andrea Arcangeli        2015-09-04  687  	BUG_ON(!copied && !err);
c1a4de99fada21 Andrea Arcangeli        2015-09-04 @688  	return copied ? copied : err;
c1a4de99fada21 Andrea Arcangeli        2015-09-04  689  }
c1a4de99fada21 Andrea Arcangeli        2015-09-04  690  

:::::: The code at line 688 was first introduced by commit
:::::: c1a4de99fada21e2e9251e52cbb51eff5aadc757 userfaultfd: mcopy_atomic|mfill_zeropage: UFFDIO_COPY|UFFDIO_ZEROPAGE preparation

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
