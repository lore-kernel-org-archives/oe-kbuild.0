Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4615513774A
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Sep 2024 21:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726348523; cv=none; b=rRoCc978N1adI4lfkRsa3fkq8L7Ytty97fpUz+d+exGFVQYHUB5whz7Ls68A0Kcofs6DwRkw+RyY3dGs1zgGyqqfPl1hmk6WV1uhP4G85H6FJLmtJaj2eE/ajXqXCtaH/mnRwVXhaFu4V2FU9LrpdAsbueY9MQFB1pInTExPtQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726348523; c=relaxed/simple;
	bh=Sg5AVHsXNtmQm4wPs3SEk1Cf5ruS5uW0fJ7HKIPZ+50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hgabea0LPYnpF6N+9Ijo+85UuVspBYe9J+BNYhNUKmI5gF+qx+KhtRtV0VAY0c4Vdk0gpJZxM3HxNxDAS7pZxsEEWnmZtGeVugUfpkqJET0SIyGzPs61vBmdiX/GWwrUkb5OCEjaJA793KfUtDKp1MAk0yV/ifQSUmqvE6It1pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzrRHupr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzrRHupr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726348520; x=1757884520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sg5AVHsXNtmQm4wPs3SEk1Cf5ruS5uW0fJ7HKIPZ+50=;
  b=YzrRHuprxJ/Q/MsnnGrflXd4d5x/O9eAlqa9/A+7B7FCbW1HIPc0umSZ
   p+3wHhtMaUfNb6x8lgUIt8+aMo0tyfM4ail42o6a2WLReElTYcUt+g4qM
   IFOo92b21tG6FNJWjiIzzSbxokrECRgAjmfRXQ9pE1vp/U+0inS+Y3JRn
   GsmGIijcfMS0cRcDzKJwE2hrrjSaj+2JOWRpeOA/kw6kfoXrr93+UV5Cv
   S+TsjjLOaVkolDhn6o0B56PWwnGcketAqcwM7zaCilEXBtzJCT1Nkf86V
   dNpEa9gQT2uVVczrmocNjDN46Glv1qFJYXosP1qE28qxXE94fDdEbiGMK
   g==;
X-CSE-ConnectionGUID: 7pIn3HRcRGes78AF07se6Q==
X-CSE-MsgGUID: QHxkE1zHTGSyWv9YjlXs4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25113283"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="25113283"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 14:15:19 -0700
X-CSE-ConnectionGUID: iCGsCAtsSGy2Lz2At7NluQ==
X-CSE-MsgGUID: c35kwXD+QsCQwvO3ezKubw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="69249463"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Sep 2024 14:15:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spa6t-000897-2n;
	Sat, 14 Sep 2024 21:15:15 +0000
Date: Sun, 15 Sep 2024 05:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/mm/fault.c:438 do_exception() warn: inconsistent returns
 '&mm->mmap_lock'.
Message-ID: <202409150531.LHYLqW7y-lkp@intel.com>
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
TO: Heiko Carstens <hca@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0babf683783ddca06551537c6781e413cfe8d27b
commit: b20c8216c1e0d5a5a5c9f40df0cf9bbc795e84f1 s390/mm,fault: move VM_FAULT_ERROR handling to do_exception()
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-r072-20240915 (https://download.01.org/0day-ci/archive/20240915/202409150531.LHYLqW7y-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409150531.LHYLqW7y-lkp@intel.com/

smatch warnings:
arch/s390/mm/fault.c:438 do_exception() warn: inconsistent returns '&mm->mmap_lock'.

vim +438 arch/s390/mm/fault.c

10c1031f706bbe Martin Schwidefsky 2007-04-27  268  
^1da177e4c3f41 Linus Torvalds     2005-04-16  269  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  270   * This routine handles page faults.  It determines the address,
^1da177e4c3f41 Linus Torvalds     2005-04-16  271   * and the problem, and then passes it off to one of the appropriate
^1da177e4c3f41 Linus Torvalds     2005-04-16  272   * routines.
^1da177e4c3f41 Linus Torvalds     2005-04-16  273   *
50d7280d430484 Martin Schwidefsky 2009-12-07  274   * interruption code (int_code):
7904aaa8b22fa0 Heiko Carstens     2020-07-14  275   *   04       Protection	   ->  Write-Protection  (suppression)
^1da177e4c3f41 Linus Torvalds     2005-04-16  276   *   10       Segment translation  ->  Not present	 (nullification)
^1da177e4c3f41 Linus Torvalds     2005-04-16  277   *   11       Page translation	   ->  Not present	 (nullification)
^1da177e4c3f41 Linus Torvalds     2005-04-16  278   *   3b       Region third trans.  ->  Not present	 (nullification)
^1da177e4c3f41 Linus Torvalds     2005-04-16  279   */
64ea33fb09f8fd Heiko Carstens     2023-10-12  280  static void do_exception(struct pt_regs *regs, int access)
^1da177e4c3f41 Linus Torvalds     2005-04-16  281  {
7c915a84e5e2ca Heiko Carstens     2023-10-12  282  	struct vm_area_struct *vma;
^1da177e4c3f41 Linus Torvalds     2005-04-16  283  	struct task_struct *tsk;
7c915a84e5e2ca Heiko Carstens     2023-10-12  284  	unsigned long address;
^1da177e4c3f41 Linus Torvalds     2005-04-16  285  	struct mm_struct *mm;
0aaba41b58bc5f Martin Schwidefsky 2017-08-22  286  	enum fault_type type;
33ce614029576b Heiko Carstens     2011-05-26  287  	unsigned int flags;
7c915a84e5e2ca Heiko Carstens     2023-10-12  288  	struct gmap *gmap;
50a7ca3c6fc869 Souptick Joarder   2018-08-17  289  	vm_fault_t fault;
e41ba1115a351d Sven Schnelle      2021-07-28  290  	bool is_write;
^1da177e4c3f41 Linus Torvalds     2005-04-16  291  
39efd4ec9a2967 Martin Schwidefsky 2012-11-21  292  	tsk = current;
39efd4ec9a2967 Martin Schwidefsky 2012-11-21  293  	/*
39efd4ec9a2967 Martin Schwidefsky 2012-11-21  294  	 * The instruction that caused the program check has
39efd4ec9a2967 Martin Schwidefsky 2012-11-21  295  	 * been nullified. Don't signal single step via SIGTRAP.
39efd4ec9a2967 Martin Schwidefsky 2012-11-21  296  	 */
56e62a73702836 Sven Schnelle      2020-11-21  297  	clear_thread_flag(TIF_PER_TRAP);
b98cca444d287a Anshuman Khandual  2019-07-16  298  	if (kprobe_page_fault(regs, 14))
64ea33fb09f8fd Heiko Carstens     2023-10-12  299  		return;
10c1031f706bbe Martin Schwidefsky 2007-04-27  300  	mm = tsk->mm;
d9c2cf67b9cfd6 Heiko Carstens     2023-02-13  301  	address = get_fault_address(regs);
d9c2cf67b9cfd6 Heiko Carstens     2023-02-13  302  	is_write = fault_is_write(regs);
0aaba41b58bc5f Martin Schwidefsky 2017-08-22  303  	type = get_fault_type(regs);
0aaba41b58bc5f Martin Schwidefsky 2017-08-22  304  	switch (type) {
0aaba41b58bc5f Martin Schwidefsky 2017-08-22  305  	case KERNEL_FAULT:
7c194d84a9ce66 Heiko Carstens     2023-10-12  306  		return handle_fault_error_nolock(regs, 0);
0aaba41b58bc5f Martin Schwidefsky 2017-08-22  307  	case USER_FAULT:
0aaba41b58bc5f Martin Schwidefsky 2017-08-22  308  	case GMAP_FAULT:
0aaba41b58bc5f Martin Schwidefsky 2017-08-22  309  		if (faulthandler_disabled() || !mm)
7c194d84a9ce66 Heiko Carstens     2023-10-12  310  			return handle_fault_error_nolock(regs, 0);
0aaba41b58bc5f Martin Schwidefsky 2017-08-22  311  		break;
0aaba41b58bc5f Martin Schwidefsky 2017-08-22  312  	}
a8b0ca17b80e92 Peter Zijlstra     2011-06-27  313  	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
dde1607248328c Peter Xu           2020-04-01  314  	flags = FAULT_FLAG_DEFAULT;
759496ba6407c6 Johannes Weiner    2013-09-12  315  	if (user_mode(regs))
759496ba6407c6 Johannes Weiner    2013-09-12  316  		flags |= FAULT_FLAG_USER;
41ac42f137080b Gerald Schaefer    2022-08-17  317  	if (is_write)
41ac42f137080b Gerald Schaefer    2022-08-17  318  		access = VM_WRITE;
41ac42f137080b Gerald Schaefer    2022-08-17  319  	if (access == VM_WRITE)
33ce614029576b Heiko Carstens     2011-05-26  320  		flags |= FAULT_FLAG_WRITE;
e06f47a16573de Heiko Carstens     2023-03-14  321  	if (!(flags & FAULT_FLAG_USER))
e06f47a16573de Heiko Carstens     2023-03-14  322  		goto lock_mmap;
e06f47a16573de Heiko Carstens     2023-03-14  323  	vma = lock_vma_under_rcu(mm, address);
e06f47a16573de Heiko Carstens     2023-03-14  324  	if (!vma)
e06f47a16573de Heiko Carstens     2023-03-14  325  		goto lock_mmap;
e06f47a16573de Heiko Carstens     2023-03-14  326  	if (!(vma->vm_flags & access)) {
e06f47a16573de Heiko Carstens     2023-03-14  327  		vma_end_read(vma);
e06f47a16573de Heiko Carstens     2023-03-14  328  		goto lock_mmap;
e06f47a16573de Heiko Carstens     2023-03-14  329  	}
e06f47a16573de Heiko Carstens     2023-03-14  330  	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
4089eef0e6ac1a Suren Baghdasaryan 2023-06-30  331  	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
e06f47a16573de Heiko Carstens     2023-03-14  332  		vma_end_read(vma);
e06f47a16573de Heiko Carstens     2023-03-14  333  	if (!(fault & VM_FAULT_RETRY)) {
e06f47a16573de Heiko Carstens     2023-03-14  334  		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
b20c8216c1e0d5 Heiko Carstens     2023-10-12  335  		if (unlikely(fault & VM_FAULT_ERROR))
b20c8216c1e0d5 Heiko Carstens     2023-10-12  336  			goto error;
b20c8216c1e0d5 Heiko Carstens     2023-10-12  337  		return;
e06f47a16573de Heiko Carstens     2023-03-14  338  	}
e06f47a16573de Heiko Carstens     2023-03-14  339  	count_vm_vma_lock_event(VMA_LOCK_RETRY);
e06f47a16573de Heiko Carstens     2023-03-14  340  	/* Quick path to respond to signals */
e06f47a16573de Heiko Carstens     2023-03-14  341  	if (fault_signal_pending(fault, regs)) {
b61a0922b6dc7d Heiko Carstens     2023-10-12  342  		if (!user_mode(regs))
7c194d84a9ce66 Heiko Carstens     2023-10-12  343  			handle_fault_error_nolock(regs, 0);
b61a0922b6dc7d Heiko Carstens     2023-10-12  344  		return;
e06f47a16573de Heiko Carstens     2023-03-14  345  	}
e06f47a16573de Heiko Carstens     2023-03-14  346  lock_mmap:
d8ed45c5dcd455 Michel Lespinasse  2020-06-08  347  	mmap_read_lock(mm);
0aaba41b58bc5f Martin Schwidefsky 2017-08-22  348  	gmap = NULL;
0aaba41b58bc5f Martin Schwidefsky 2017-08-22  349  	if (IS_ENABLED(CONFIG_PGSTE) && type == GMAP_FAULT) {
0aaba41b58bc5f Martin Schwidefsky 2017-08-22  350  		gmap = (struct gmap *)S390_lowcore.gmap;
527e30b41d8b86 Martin Schwidefsky 2014-04-30  351  		current->thread.gmap_addr = address;
4be130a08420d6 Martin Schwidefsky 2016-03-08  352  		current->thread.gmap_write_flag = !!(flags & FAULT_FLAG_WRITE);
4a494439247318 David Hildenbrand  2016-03-08  353  		current->thread.gmap_int_code = regs->int_code & 0xffff;
527e30b41d8b86 Martin Schwidefsky 2014-04-30  354  		address = __gmap_translate(gmap, address);
7c194d84a9ce66 Heiko Carstens     2023-10-12  355  		if (address == -EFAULT)
7c194d84a9ce66 Heiko Carstens     2023-10-12  356  			return handle_fault_error(regs, SEGV_MAPERR);
24eb3a824c4f3c Dominik Dingel     2013-06-17  357  		if (gmap->pfault_enabled)
24eb3a824c4f3c Dominik Dingel     2013-06-17  358  			flags |= FAULT_FLAG_RETRY_NOWAIT;
e5992f2e6c3829 Martin Schwidefsky 2011-07-24  359  	}
e5992f2e6c3829 Martin Schwidefsky 2011-07-24  360  retry:
^1da177e4c3f41 Linus Torvalds     2005-04-16  361  	vma = find_vma(mm, address);
^1da177e4c3f41 Linus Torvalds     2005-04-16  362  	if (!vma)
7c194d84a9ce66 Heiko Carstens     2023-10-12  363  		return handle_fault_error(regs, SEGV_MAPERR);
50d7280d430484 Martin Schwidefsky 2009-12-07  364  	if (unlikely(vma->vm_start > address)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  365  		if (!(vma->vm_flags & VM_GROWSDOWN))
7c194d84a9ce66 Heiko Carstens     2023-10-12  366  			return handle_fault_error(regs, SEGV_MAPERR);
8d7071af890768 Linus Torvalds     2023-06-24  367  		vma = expand_stack(mm, address);
8d7071af890768 Linus Torvalds     2023-06-24  368  		if (!vma)
7c194d84a9ce66 Heiko Carstens     2023-10-12  369  			return handle_fault_error_nolock(regs, SEGV_MAPERR);
50d7280d430484 Martin Schwidefsky 2009-12-07  370  	}
1ab947de293f43 Martin Schwidefsky 2009-12-07  371  	if (unlikely(!(vma->vm_flags & access)))
7c194d84a9ce66 Heiko Carstens     2023-10-12  372  		return handle_fault_error(regs, SEGV_ACCERR);
35e45f3e5a1fe6 Peter Xu           2020-08-11  373  	fault = handle_mm_fault(vma, address, flags, regs);
4ef873226ceb9c Peter Xu           2020-04-01  374  	if (fault_signal_pending(fault, regs)) {
306d6c49ac9ded Claudio Imbrenda   2018-07-16  375  		if (flags & FAULT_FLAG_RETRY_NOWAIT)
b61a0922b6dc7d Heiko Carstens     2023-10-12  376  			mmap_read_unlock(mm);
b61a0922b6dc7d Heiko Carstens     2023-10-12  377  		if (!user_mode(regs))
7c194d84a9ce66 Heiko Carstens     2023-10-12  378  			handle_fault_error_nolock(regs, 0);
b61a0922b6dc7d Heiko Carstens     2023-10-12  379  		return;
f2c76e3b6f72c3 Heiko Carstens     2012-07-27  380  	}
d92725256b4f22 Peter Xu           2022-05-30  381  	/* The fault is fully completed (including releasing mmap lock) */
d92725256b4f22 Peter Xu           2022-05-30  382  	if (fault & VM_FAULT_COMPLETED) {
d92725256b4f22 Peter Xu           2022-05-30  383  		if (gmap) {
d92725256b4f22 Peter Xu           2022-05-30  384  			mmap_read_lock(mm);
b20c8216c1e0d5 Heiko Carstens     2023-10-12  385  			goto gmap;
d92725256b4f22 Peter Xu           2022-05-30  386  		}
b20c8216c1e0d5 Heiko Carstens     2023-10-12  387  		return;
b20c8216c1e0d5 Heiko Carstens     2023-10-12  388  	}
b20c8216c1e0d5 Heiko Carstens     2023-10-12  389  	if (unlikely(fault & VM_FAULT_ERROR)) {
b20c8216c1e0d5 Heiko Carstens     2023-10-12  390  		mmap_read_unlock(mm);
b20c8216c1e0d5 Heiko Carstens     2023-10-12  391  		goto error;
d92725256b4f22 Peter Xu           2022-05-30  392  	}
33ce614029576b Heiko Carstens     2011-05-26  393  	if (fault & VM_FAULT_RETRY) {
4df5ec98581eb2 Heiko Carstens     2023-10-12  394  		if (IS_ENABLED(CONFIG_PGSTE) && gmap &&	(flags & FAULT_FLAG_RETRY_NOWAIT)) {
36ef159f4408b0 Qi Zheng           2022-01-14  395  			/*
3aad8c04429779 Heiko Carstens     2023-10-12  396  			 * FAULT_FLAG_RETRY_NOWAIT has been set,
3aad8c04429779 Heiko Carstens     2023-10-12  397  			 * mmap_lock has not been released
36ef159f4408b0 Qi Zheng           2022-01-14  398  			 */
24eb3a824c4f3c Dominik Dingel     2013-06-17  399  			current->thread.gmap_pfault = 1;
7c194d84a9ce66 Heiko Carstens     2023-10-12  400  			return handle_fault_error(regs, 0);
24eb3a824c4f3c Dominik Dingel     2013-06-17  401  		}
4064b982706375 Peter Xu           2020-04-01  402  		flags &= ~FAULT_FLAG_RETRY_NOWAIT;
45cac65b0fcd28 Shaohua Li         2012-10-08  403  		flags |= FAULT_FLAG_TRIED;
d8ed45c5dcd455 Michel Lespinasse  2020-06-08  404  		mmap_read_lock(mm);
33ce614029576b Heiko Carstens     2011-05-26  405  		goto retry;
33ce614029576b Heiko Carstens     2011-05-26  406  	}
b20c8216c1e0d5 Heiko Carstens     2023-10-12  407  gmap:
0aaba41b58bc5f Martin Schwidefsky 2017-08-22  408  	if (IS_ENABLED(CONFIG_PGSTE) && gmap) {
527e30b41d8b86 Martin Schwidefsky 2014-04-30  409  		address =  __gmap_link(gmap, current->thread.gmap_addr,
527e30b41d8b86 Martin Schwidefsky 2014-04-30  410  				       address);
7c194d84a9ce66 Heiko Carstens     2023-10-12  411  		if (address == -EFAULT)
7c194d84a9ce66 Heiko Carstens     2023-10-12  412  			return handle_fault_error(regs, SEGV_MAPERR);
527e30b41d8b86 Martin Schwidefsky 2014-04-30  413  		if (address == -ENOMEM) {
527e30b41d8b86 Martin Schwidefsky 2014-04-30  414  			fault = VM_FAULT_OOM;
b20c8216c1e0d5 Heiko Carstens     2023-10-12  415  			mmap_read_unlock(mm);
b20c8216c1e0d5 Heiko Carstens     2023-10-12  416  			goto error;
527e30b41d8b86 Martin Schwidefsky 2014-04-30  417  		}
527e30b41d8b86 Martin Schwidefsky 2014-04-30  418  	}
d8ed45c5dcd455 Michel Lespinasse  2020-06-08  419  	mmap_read_unlock(mm);
b20c8216c1e0d5 Heiko Carstens     2023-10-12  420  	return;
b20c8216c1e0d5 Heiko Carstens     2023-10-12  421  error:
b20c8216c1e0d5 Heiko Carstens     2023-10-12  422  	if (fault & VM_FAULT_OOM) {
b20c8216c1e0d5 Heiko Carstens     2023-10-12  423  		if (!user_mode(regs))
b20c8216c1e0d5 Heiko Carstens     2023-10-12  424  			handle_fault_error_nolock(regs, 0);
b20c8216c1e0d5 Heiko Carstens     2023-10-12  425  		else
b20c8216c1e0d5 Heiko Carstens     2023-10-12  426  			pagefault_out_of_memory();
b20c8216c1e0d5 Heiko Carstens     2023-10-12  427  	} else if (fault & VM_FAULT_SIGSEGV) {
b20c8216c1e0d5 Heiko Carstens     2023-10-12  428  		if (!user_mode(regs))
b20c8216c1e0d5 Heiko Carstens     2023-10-12  429  			handle_fault_error_nolock(regs, 0);
b20c8216c1e0d5 Heiko Carstens     2023-10-12  430  		else
b20c8216c1e0d5 Heiko Carstens     2023-10-12  431  			do_sigsegv(regs, SEGV_MAPERR);
b20c8216c1e0d5 Heiko Carstens     2023-10-12  432  	} else if (fault & VM_FAULT_SIGBUS) {
b20c8216c1e0d5 Heiko Carstens     2023-10-12  433  		if (!user_mode(regs))
b20c8216c1e0d5 Heiko Carstens     2023-10-12  434  			handle_fault_error_nolock(regs, 0);
b20c8216c1e0d5 Heiko Carstens     2023-10-12  435  		else
b20c8216c1e0d5 Heiko Carstens     2023-10-12  436  			do_sigbus(regs);
b20c8216c1e0d5 Heiko Carstens     2023-10-12  437  	} else {
b20c8216c1e0d5 Heiko Carstens     2023-10-12 @438  		BUG();
b20c8216c1e0d5 Heiko Carstens     2023-10-12  439  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  440  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  441  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
