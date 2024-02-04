Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ABA249E4
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Feb 2024 17:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707069580; cv=none; b=ISrX8AZUdFescH9B9iTm6T8s7d9nAZAi6uxvQqPGVcDOj8Z8kKZXZON0J6osRcPOY08DcNohPf7hp0+nPqhxNcWRenQcUvZ6MuEFSLh98e5UT8is4+IbtrynVugzHMUxLxdaEMldCmkmz5F8juaoUqaDOdrK1dHl3lhZuIYx4Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707069580; c=relaxed/simple;
	bh=mpHSia3D26BoRCvfoe8mHfXIFYcbl8uD6k7OKYkNQZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H8DgF//lQgTMeJK2QZ1uWMn+pzrM4yl7YCtsLT1qyv77QSbF1eHfiDte8AWafEMYvfLBehxNdCjDmnTM+C3snoyFChpK15WEhgryZEWHD5d/omvMdS7xQt3h9DbmB4rhjAATXwc9Fda3bI7tNQ14LXouY5VMwwqzskiWKgYLGuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJKheFVU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJKheFVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707069577; x=1738605577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mpHSia3D26BoRCvfoe8mHfXIFYcbl8uD6k7OKYkNQZI=;
  b=SJKheFVUgZKb7W2x37XoNyeLzgd8+ZGvUNyotdDHmM7/G9X0mM6vRwcB
   7BSoSlAMEX3h8ibSyfHeWbjKh/xAa5+0owWL7BDN/yqnhMvf08mlTpzEg
   vwjQOjwf2pcZGc9tchZ+GSQVO5l5TunvIRoiguYjoFeHUNh9VQQgxu+u8
   UQZcFPXqZonDGvtU5Q1asm29HsqZ4zzN/1yZpa0RBVjUiYhqqRXzEZqQj
   ZqeikdeaCG2quHrLQmNRejD1wwpIXj+eLpYF8SQ6auZKq7i2Mu3XSG1Ny
   gKv5c53SdCkzf0KZOveg/F+/Rb/ogN81QL/Q1E8jZlIfiIQpRivkxFmE0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="17932233"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="17932233"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 09:59:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5168582"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 04 Feb 2024 09:59:35 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWgmC-0006ax-3A;
	Sun, 04 Feb 2024 17:59:32 +0000
Date: Mon, 5 Feb 2024 01:59:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 1645/2942] fs/userfaultfd.c:454
 handle_userfault() warn: bitwise AND condition is false here
Message-ID: <202402050127.RC8QEMxP-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Peng Zhang <zhangpeng362@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   988c7111f1e95028838eb8e4f71ee49b45132a23
commit: b54b55c3305c11c0ba5609af1c5d0e5a2e1dc4ed [1645/2942] mm/userswap: support userswap via userfaultfd
:::::: branch date: 6 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-161-20240204 (https://download.01.org/0day-ci/archive/20240205/202402050127.RC8QEMxP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402050127.RC8QEMxP-lkp@intel.com/

smatch warnings:
fs/userfaultfd.c:454 handle_userfault() warn: bitwise AND condition is false here

vim +454 fs/userfaultfd.c

3e69ad081c18d1 Peter Xu           2020-04-01  400  
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  401  /*
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  402   * The locking rules involved in returning VM_FAULT_RETRY depending on
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  403   * FAULT_FLAG_ALLOW_RETRY, FAULT_FLAG_RETRY_NOWAIT and
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  404   * FAULT_FLAG_KILLABLE are not straightforward. The "Caution"
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  405   * recommendation in __lock_page_or_retry is not an understatement.
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  406   *
c1e8d7c6a7a682 Michel Lespinasse  2020-06-08  407   * If FAULT_FLAG_ALLOW_RETRY is set, the mmap_lock must be released
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  408   * before returning VM_FAULT_RETRY only if FAULT_FLAG_RETRY_NOWAIT is
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  409   * not set.
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  410   *
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  411   * If FAULT_FLAG_ALLOW_RETRY is set but FAULT_FLAG_KILLABLE is not
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  412   * set, VM_FAULT_RETRY can still be returned if and only if there are
c1e8d7c6a7a682 Michel Lespinasse  2020-06-08  413   * fatal_signal_pending()s, and the mmap_lock must be released before
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  414   * returning it.
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  415   */
2b7403035459c7 Souptick Joarder   2018-08-23  416  vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  417  {
b8da2e466000b2 Peter Xu           2022-12-16  418  	struct vm_area_struct *vma = vmf->vma;
b8da2e466000b2 Peter Xu           2022-12-16  419  	struct mm_struct *mm = vma->vm_mm;
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  420  	struct userfaultfd_ctx *ctx;
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  421  	struct userfaultfd_wait_queue uwq;
2b7403035459c7 Souptick Joarder   2018-08-23  422  	vm_fault_t ret = VM_FAULT_SIGBUS;
3e69ad081c18d1 Peter Xu           2020-04-01  423  	bool must_wait;
2f064a59a11ff9 Peter Zijlstra     2021-06-11  424  	unsigned int blocking_state;
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  425  
64c2b20301f62c Andrea Arcangeli   2017-06-16  426  	/*
64c2b20301f62c Andrea Arcangeli   2017-06-16  427  	 * We don't do userfault handling for the final child pid update.
64c2b20301f62c Andrea Arcangeli   2017-06-16  428  	 *
64c2b20301f62c Andrea Arcangeli   2017-06-16  429  	 * We also don't do userfault handling during
64c2b20301f62c Andrea Arcangeli   2017-06-16  430  	 * coredumping. hugetlbfs has the special
4849807114b83e Peter Xu           2023-06-28  431  	 * hugetlb_follow_page_mask() to skip missing pages in the
64c2b20301f62c Andrea Arcangeli   2017-06-16  432  	 * FOLL_DUMP case, anon memory also checks for FOLL_DUMP with
64c2b20301f62c Andrea Arcangeli   2017-06-16  433  	 * the no_page_table() helper in follow_page_mask(), but the
64c2b20301f62c Andrea Arcangeli   2017-06-16  434  	 * shmem_vm_ops->fault method is invoked even during
004a9a38e20da6 Jann Horn          2023-08-15  435  	 * coredumping and it ends up here.
64c2b20301f62c Andrea Arcangeli   2017-06-16  436  	 */
64c2b20301f62c Andrea Arcangeli   2017-06-16  437  	if (current->flags & (PF_EXITING|PF_DUMPCORE))
64c2b20301f62c Andrea Arcangeli   2017-06-16  438  		goto out;
64c2b20301f62c Andrea Arcangeli   2017-06-16  439  
29a22b9e08d70d Suren Baghdasaryan 2023-06-30  440  	assert_fault_locked(vmf);
64c2b20301f62c Andrea Arcangeli   2017-06-16  441  
b8da2e466000b2 Peter Xu           2022-12-16  442  	ctx = vma->vm_userfaultfd_ctx.ctx;
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  443  	if (!ctx)
ba85c702e4b247 Andrea Arcangeli   2015-09-04  444  		goto out;
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  445  
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  446  	BUG_ON(ctx->mm != mm);
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  447  
7677f7fd8be766 Axel Rasmussen     2021-05-04  448  	/* Any unrecognized flag is a bug. */
b54b55c3305c11 ZhangPeng          2023-12-12  449  	VM_BUG_ON(reason & ~(__VM_UFFD_FLAGS | VM_USWAP));
7677f7fd8be766 Axel Rasmussen     2021-05-04  450  	/* 0 or > 1 flags set is a bug; we expect exactly 1. */
7677f7fd8be766 Axel Rasmussen     2021-05-04  451  	VM_BUG_ON(!reason || (reason & (reason - 1)));
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  452  
b54b55c3305c11 ZhangPeng          2023-12-12  453  	if (IS_ENABLED(CONFIG_USERSWAP) && (reason == VM_UFFD_MISSING) &&
b54b55c3305c11 ZhangPeng          2023-12-12 @454  	    (vma->vm_flags & VM_USWAP))
b54b55c3305c11 ZhangPeng          2023-12-12  455  		reason |= VM_USWAP;
b54b55c3305c11 ZhangPeng          2023-12-12  456  
2d6d6f5a09a96c Prakash Sangappa   2017-09-06  457  	if (ctx->features & UFFD_FEATURE_SIGBUS)
2d6d6f5a09a96c Prakash Sangappa   2017-09-06  458  		goto out;
2d5de004e009ad Axel Rasmussen     2022-08-08  459  	if (!(vmf->flags & FAULT_FLAG_USER) && (ctx->flags & UFFD_USER_MODE_ONLY))
37cd0575b85101 Lokesh Gidra       2020-12-14  460  		goto out;
2d6d6f5a09a96c Prakash Sangappa   2017-09-06  461  
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  462  	/*
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  463  	 * If it's already released don't get it. This avoids to loop
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  464  	 * in __get_user_pages if userfaultfd_release waits on the
c1e8d7c6a7a682 Michel Lespinasse  2020-06-08  465  	 * caller of handle_userfault to release the mmap_lock.
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  466  	 */
6aa7de059173a9 Mark Rutland       2017-10-23  467  	if (unlikely(READ_ONCE(ctx->released))) {
656710a60e3693 Andrea Arcangeli   2017-09-08  468  		/*
656710a60e3693 Andrea Arcangeli   2017-09-08  469  		 * Don't return VM_FAULT_SIGBUS in this case, so a non
656710a60e3693 Andrea Arcangeli   2017-09-08  470  		 * cooperative manager can close the uffd after the
656710a60e3693 Andrea Arcangeli   2017-09-08  471  		 * last UFFDIO_COPY, without risking to trigger an
656710a60e3693 Andrea Arcangeli   2017-09-08  472  		 * involuntary SIGBUS if the process was starting the
656710a60e3693 Andrea Arcangeli   2017-09-08  473  		 * userfaultfd while the userfaultfd was still armed
656710a60e3693 Andrea Arcangeli   2017-09-08  474  		 * (but after the last UFFDIO_COPY). If the uffd
656710a60e3693 Andrea Arcangeli   2017-09-08  475  		 * wasn't already closed when the userfault reached
656710a60e3693 Andrea Arcangeli   2017-09-08  476  		 * this point, that would normally be solved by
656710a60e3693 Andrea Arcangeli   2017-09-08  477  		 * userfaultfd_must_wait returning 'false'.
656710a60e3693 Andrea Arcangeli   2017-09-08  478  		 *
656710a60e3693 Andrea Arcangeli   2017-09-08  479  		 * If we were to return VM_FAULT_SIGBUS here, the non
656710a60e3693 Andrea Arcangeli   2017-09-08  480  		 * cooperative manager would be instead forced to
656710a60e3693 Andrea Arcangeli   2017-09-08  481  		 * always call UFFDIO_UNREGISTER before it can safely
656710a60e3693 Andrea Arcangeli   2017-09-08  482  		 * close the uffd.
656710a60e3693 Andrea Arcangeli   2017-09-08  483  		 */
656710a60e3693 Andrea Arcangeli   2017-09-08  484  		ret = VM_FAULT_NOPAGE;
ba85c702e4b247 Andrea Arcangeli   2015-09-04  485  		goto out;
656710a60e3693 Andrea Arcangeli   2017-09-08  486  	}
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  487  
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  488  	/*
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  489  	 * Check that we can return VM_FAULT_RETRY.
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  490  	 *
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  491  	 * NOTE: it should become possible to return VM_FAULT_RETRY
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  492  	 * even if FAULT_FLAG_TRIED is set without leading to gup()
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  493  	 * -EBUSY failures, if the userfaultfd is to be extended for
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  494  	 * VM_UFFD_WP tracking and we intend to arm the userfault
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  495  	 * without first stopping userland access to the memory. For
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  496  	 * VM_UFFD_MISSING userfaults this is enough for now.
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  497  	 */
82b0f8c39a3869 Jan Kara           2016-12-14  498  	if (unlikely(!(vmf->flags & FAULT_FLAG_ALLOW_RETRY))) {
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  499  		/*
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  500  		 * Validate the invariant that nowait must allow retry
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  501  		 * to be sure not to return SIGBUS erroneously on
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  502  		 * nowait invocations.
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  503  		 */
82b0f8c39a3869 Jan Kara           2016-12-14  504  		BUG_ON(vmf->flags & FAULT_FLAG_RETRY_NOWAIT);
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  505  #ifdef CONFIG_DEBUG_VM
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  506  		if (printk_ratelimit()) {
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  507  			printk(KERN_WARNING
82b0f8c39a3869 Jan Kara           2016-12-14  508  			       "FAULT_FLAG_ALLOW_RETRY missing %x\n",
82b0f8c39a3869 Jan Kara           2016-12-14  509  			       vmf->flags);
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  510  			dump_stack();
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  511  		}
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  512  #endif
ba85c702e4b247 Andrea Arcangeli   2015-09-04  513  		goto out;
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  514  	}
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  515  
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  516  	/*
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  517  	 * Handle nowait, not much to do other than tell it to retry
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  518  	 * and wait.
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  519  	 */
ba85c702e4b247 Andrea Arcangeli   2015-09-04  520  	ret = VM_FAULT_RETRY;
82b0f8c39a3869 Jan Kara           2016-12-14  521  	if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
ba85c702e4b247 Andrea Arcangeli   2015-09-04  522  		goto out;
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  523  
c1e8d7c6a7a682 Michel Lespinasse  2020-06-08  524  	/* take the reference before dropping the mmap_lock */
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  525  	userfaultfd_ctx_get(ctx);
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  526  
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  527  	init_waitqueue_func_entry(&uwq.wq, userfaultfd_wake_function);
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  528  	uwq.wq.private = current;
d172b1a3bd065d Nadav Amit         2022-07-11  529  	uwq.msg = userfault_msg(vmf->address, vmf->real_address, vmf->flags,
d172b1a3bd065d Nadav Amit         2022-07-11  530  				reason, ctx->features);
b54b55c3305c11 ZhangPeng          2023-12-12  531  #ifdef CONFIG_USERSWAP
b54b55c3305c11 ZhangPeng          2023-12-12  532  	if ((reason & VM_USWAP) && pte_none(vmf->orig_pte))
b54b55c3305c11 ZhangPeng          2023-12-12  533  		uwq.msg.arg.pagefault.flags |= UFFD_PAGEFAULT_FLAG_FIRST;
b54b55c3305c11 ZhangPeng          2023-12-12  534  #endif
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  535  	uwq.ctx = ctx;
15a77c6fe494f4 Andrea Arcangeli   2017-01-24  536  	uwq.waken = false;
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  537  
3e69ad081c18d1 Peter Xu           2020-04-01  538  	blocking_state = userfaultfd_get_blocking_state(vmf->flags);
dfa37dc3fc1f6f Andrea Arcangeli   2015-09-04  539  
b8da2e466000b2 Peter Xu           2022-12-16  540          /*
b8da2e466000b2 Peter Xu           2022-12-16  541           * Take the vma lock now, in order to safely call
b8da2e466000b2 Peter Xu           2022-12-16  542           * userfaultfd_huge_must_wait() later. Since acquiring the
b8da2e466000b2 Peter Xu           2022-12-16  543           * (sleepable) vma lock can modify the current task state, that
b8da2e466000b2 Peter Xu           2022-12-16  544           * must be before explicitly calling set_current_state().
b8da2e466000b2 Peter Xu           2022-12-16  545           */
b8da2e466000b2 Peter Xu           2022-12-16  546  	if (is_vm_hugetlb_page(vma))
b8da2e466000b2 Peter Xu           2022-12-16  547  		hugetlb_vma_lock_read(vma);
b8da2e466000b2 Peter Xu           2022-12-16  548  
cbcfa130a911c6 Eric Biggers       2019-07-04  549  	spin_lock_irq(&ctx->fault_pending_wqh.lock);
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  550  	/*
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  551  	 * After the __add_wait_queue the uwq is visible to userland
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  552  	 * through poll/read().
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  553  	 */
15b726ef048b31 Andrea Arcangeli   2015-09-04  554  	__add_wait_queue(&ctx->fault_pending_wqh, &uwq.wq);
15b726ef048b31 Andrea Arcangeli   2015-09-04  555  	/*
15b726ef048b31 Andrea Arcangeli   2015-09-04  556  	 * The smp_mb() after __set_current_state prevents the reads
15b726ef048b31 Andrea Arcangeli   2015-09-04  557  	 * following the spin_unlock to happen before the list_add in
15b726ef048b31 Andrea Arcangeli   2015-09-04  558  	 * __add_wait_queue.
15b726ef048b31 Andrea Arcangeli   2015-09-04  559  	 */
15a77c6fe494f4 Andrea Arcangeli   2017-01-24  560  	set_current_state(blocking_state);
cbcfa130a911c6 Eric Biggers       2019-07-04  561  	spin_unlock_irq(&ctx->fault_pending_wqh.lock);
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  562  
b8da2e466000b2 Peter Xu           2022-12-16  563  	if (!is_vm_hugetlb_page(vma))
29a22b9e08d70d Suren Baghdasaryan 2023-06-30  564  		must_wait = userfaultfd_must_wait(ctx, vmf, reason);
369cd2121be440 Mike Kravetz       2017-02-22  565  	else
29a22b9e08d70d Suren Baghdasaryan 2023-06-30  566  		must_wait = userfaultfd_huge_must_wait(ctx, vmf, reason);
b8da2e466000b2 Peter Xu           2022-12-16  567  	if (is_vm_hugetlb_page(vma))
b8da2e466000b2 Peter Xu           2022-12-16  568  		hugetlb_vma_unlock_read(vma);
29a22b9e08d70d Suren Baghdasaryan 2023-06-30  569  	release_fault_lock(vmf);
8d2afd96c20316 Andrea Arcangeli   2015-09-04  570  
f9bf352224d7d4 Linus Torvalds     2020-08-02  571  	if (likely(must_wait && !READ_ONCE(ctx->released))) {
a9a08845e9acbd Linus Torvalds     2018-02-11  572  		wake_up_poll(&ctx->fd_wqh, EPOLLIN);
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  573  		schedule();
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  574  	}
ba85c702e4b247 Andrea Arcangeli   2015-09-04  575  
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  576  	__set_current_state(TASK_RUNNING);
15b726ef048b31 Andrea Arcangeli   2015-09-04  577  
15b726ef048b31 Andrea Arcangeli   2015-09-04  578  	/*
15b726ef048b31 Andrea Arcangeli   2015-09-04  579  	 * Here we race with the list_del; list_add in
15b726ef048b31 Andrea Arcangeli   2015-09-04  580  	 * userfaultfd_ctx_read(), however because we don't ever run
15b726ef048b31 Andrea Arcangeli   2015-09-04  581  	 * list_del_init() to refile across the two lists, the prev
15b726ef048b31 Andrea Arcangeli   2015-09-04  582  	 * and next pointers will never point to self. list_add also
15b726ef048b31 Andrea Arcangeli   2015-09-04  583  	 * would never let any of the two pointers to point to
15b726ef048b31 Andrea Arcangeli   2015-09-04  584  	 * self. So list_empty_careful won't risk to see both pointers
15b726ef048b31 Andrea Arcangeli   2015-09-04  585  	 * pointing to self at any time during the list refile. The
15b726ef048b31 Andrea Arcangeli   2015-09-04  586  	 * only case where list_del_init() is called is the full
15b726ef048b31 Andrea Arcangeli   2015-09-04  587  	 * removal in the wake function and there we don't re-list_add
15b726ef048b31 Andrea Arcangeli   2015-09-04  588  	 * and it's fine not to block on the spinlock. The uwq on this
15b726ef048b31 Andrea Arcangeli   2015-09-04  589  	 * kernel stack can be released after the list_del_init.
15b726ef048b31 Andrea Arcangeli   2015-09-04  590  	 */
2055da97389a60 Ingo Molnar        2017-06-20  591  	if (!list_empty_careful(&uwq.wq.entry)) {
cbcfa130a911c6 Eric Biggers       2019-07-04  592  		spin_lock_irq(&ctx->fault_pending_wqh.lock);
15b726ef048b31 Andrea Arcangeli   2015-09-04  593  		/*
15b726ef048b31 Andrea Arcangeli   2015-09-04  594  		 * No need of list_del_init(), the uwq on the stack
15b726ef048b31 Andrea Arcangeli   2015-09-04  595  		 * will be freed shortly anyway.
15b726ef048b31 Andrea Arcangeli   2015-09-04  596  		 */
2055da97389a60 Ingo Molnar        2017-06-20  597  		list_del(&uwq.wq.entry);
cbcfa130a911c6 Eric Biggers       2019-07-04  598  		spin_unlock_irq(&ctx->fault_pending_wqh.lock);
ba85c702e4b247 Andrea Arcangeli   2015-09-04  599  	}
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  600  
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  601  	/*
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  602  	 * ctx may go away after this if the userfault pseudo fd is
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  603  	 * already released.
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  604  	 */
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  605  	userfaultfd_ctx_put(ctx);
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  606  
ba85c702e4b247 Andrea Arcangeli   2015-09-04  607  out:
ba85c702e4b247 Andrea Arcangeli   2015-09-04  608  	return ret;
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  609  }
86039bd3b4e6a1 Andrea Arcangeli   2015-09-04  610  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
