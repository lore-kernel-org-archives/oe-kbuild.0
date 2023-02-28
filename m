Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192A9A38
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Feb 2023 07:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677570334; x=1709106334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hOYpVWCn3jLGfPAztzM1pgKwKRtqlpf/DOug/eRW6Kc=;
  b=OcFTwYUVkEHP+ARS05oYWxpntnckl3Tat89XTbcnB/xhI42nCzkbRSFt
   8krp9CbLX8bsJ2Zlo04B1wi7Sx4rqzlwnyFH/mGdFUH91cONj/jv9sJfb
   W1ehRg09DTYOgzEkPimhqkHiDRxvz9L/GMeVWfvEAAULl8DPiczOFVm4+
   90j+Q0KjlqBqrlhEYqThI2nUsZc1/GqqxxjRU3ZiatBkgFbHCmIFbs3G8
   z4lL2pvMIN055m2iyefjC12JjZOFXNP0c/ikzCDbujPsl4Zki950Ou6bO
   zj3f4fwNtr1NyL08c+Lz+2JznZUQEF9Bo0PhsLjVIhnj42qExQiMDG5+G
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="331550215"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="331550215"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 23:45:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="704312374"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="704312374"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Feb 2023 23:45:23 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWufq-0005C7-0D;
	Tue, 28 Feb 2023 07:45:22 +0000
Date: Tue, 28 Feb 2023 15:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13796/14141] arch/parisc/mm/fault.c:427
 do_page_fault() error: uninitialized symbol 'msg'.
Message-ID: <202302281542.7n0td9mi-lkp@intel.com>
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
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   058f4df42121baadbb8a980c06011e912784dbd2
commit: 4f2fdfbfa1519deb957686ecd4898fbf1b57624a [13796/14141] parisc: fix livelock in uaccess
:::::: branch date: 6 hours ago
:::::: commit date: 3 days ago
config: parisc-randconfig-m041-20230226 (https://download.01.org/0day-ci/archive/20230228/202302281542.7n0td9mi-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302281542.7n0td9mi-lkp@intel.com/

New smatch warnings:
arch/parisc/mm/fault.c:427 do_page_fault() error: uninitialized symbol 'msg'.

Old smatch warnings:
arch/parisc/mm/fault.c:435 do_page_fault() warn: inconsistent returns '&mm->mmap_lock'.

vim +/msg +427 arch/parisc/mm/fault.c

fef47e2a2e1e75 Helge Deller        2014-05-05  261  
^1da177e4c3f41 Linus Torvalds      2005-04-16  262  void do_page_fault(struct pt_regs *regs, unsigned long code,
^1da177e4c3f41 Linus Torvalds      2005-04-16  263  			      unsigned long address)
^1da177e4c3f41 Linus Torvalds      2005-04-16  264  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  265  	struct vm_area_struct *vma, *prev_vma;
2d8b22de6e5241 John David Anglin   2013-10-05  266  	struct task_struct *tsk;
2d8b22de6e5241 John David Anglin   2013-10-05  267  	struct mm_struct *mm;
^1da177e4c3f41 Linus Torvalds      2005-04-16  268  	unsigned long acc_type;
50a7ca3c6fc869 Souptick Joarder    2018-08-17  269  	vm_fault_t fault = 0;
2d8b22de6e5241 John David Anglin   2013-10-05  270  	unsigned int flags;
20dda87bdc6567 John David Anglin   2022-01-04  271  	char *msg;
^1da177e4c3f41 Linus Torvalds      2005-04-16  272  
2d8b22de6e5241 John David Anglin   2013-10-05  273  	tsk = current;
2d8b22de6e5241 John David Anglin   2013-10-05  274  	mm = tsk->mm;
20dda87bdc6567 John David Anglin   2022-01-04  275  	if (!mm) {
20dda87bdc6567 John David Anglin   2022-01-04  276  		msg = "Page fault: no context";
2d8b22de6e5241 John David Anglin   2013-10-05  277  		goto no_context;
20dda87bdc6567 John David Anglin   2022-01-04  278  	}
2d8b22de6e5241 John David Anglin   2013-10-05  279  
dde1607248328c Peter Xu            2020-04-01  280  	flags = FAULT_FLAG_DEFAULT;
759496ba6407c6 Johannes Weiner     2013-09-12  281  	if (user_mode(regs))
759496ba6407c6 Johannes Weiner     2013-09-12  282  		flags |= FAULT_FLAG_USER;
0772dac1dc28ab Felipe Pena         2013-09-30  283  
0772dac1dc28ab Felipe Pena         2013-09-30  284  	acc_type = parisc_acctyp(code, regs->iir);
759496ba6407c6 Johannes Weiner     2013-09-12  285  	if (acc_type & VM_WRITE)
759496ba6407c6 Johannes Weiner     2013-09-12  286  		flags |= FAULT_FLAG_WRITE;
af8a7926273645 Peter Xu            2020-08-11  287  	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
38057477b98712 Kautuk Consul       2012-03-20  288  retry:
d8ed45c5dcd455 Michel Lespinasse   2020-06-08  289  	mmap_read_lock(mm);
^1da177e4c3f41 Linus Torvalds      2005-04-16  290  	vma = find_vma_prev(mm, address, &prev_vma);
^1da177e4c3f41 Linus Torvalds      2005-04-16  291  	if (!vma || address < vma->vm_start)
^1da177e4c3f41 Linus Torvalds      2005-04-16  292  		goto check_expansion;
^1da177e4c3f41 Linus Torvalds      2005-04-16  293  /*
^1da177e4c3f41 Linus Torvalds      2005-04-16  294   * Ok, we have a good vm_area for this memory access. We still need to
^1da177e4c3f41 Linus Torvalds      2005-04-16  295   * check the access permissions.
^1da177e4c3f41 Linus Torvalds      2005-04-16  296   */
^1da177e4c3f41 Linus Torvalds      2005-04-16  297  
^1da177e4c3f41 Linus Torvalds      2005-04-16  298  good_area:
^1da177e4c3f41 Linus Torvalds      2005-04-16  299  
^1da177e4c3f41 Linus Torvalds      2005-04-16  300  	if ((vma->vm_flags & acc_type) != acc_type)
^1da177e4c3f41 Linus Torvalds      2005-04-16  301  		goto bad_area;
^1da177e4c3f41 Linus Torvalds      2005-04-16  302  
^1da177e4c3f41 Linus Torvalds      2005-04-16  303  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  304  	 * If for any reason at all we couldn't handle the fault, make
^1da177e4c3f41 Linus Torvalds      2005-04-16  305  	 * sure we exit gracefully rather than endlessly redo the
^1da177e4c3f41 Linus Torvalds      2005-04-16  306  	 * fault.
^1da177e4c3f41 Linus Torvalds      2005-04-16  307  	 */
^1da177e4c3f41 Linus Torvalds      2005-04-16  308  
af8a7926273645 Peter Xu            2020-08-11  309  	fault = handle_mm_fault(vma, address, flags, regs);
38057477b98712 Kautuk Consul       2012-03-20  310  
4f2fdfbfa1519d Al Viro             2023-01-30  311  	if (fault_signal_pending(fault, regs)) {
4f2fdfbfa1519d Al Viro             2023-01-30  312  		if (!user_mode(regs))
4f2fdfbfa1519d Al Viro             2023-01-30  313  			goto no_context;
38057477b98712 Kautuk Consul       2012-03-20  314  		return;
4f2fdfbfa1519d Al Viro             2023-01-30  315  	}
38057477b98712 Kautuk Consul       2012-03-20  316  
d92725256b4f22 Peter Xu            2022-05-30  317  	/* The fault is fully completed (including releasing mmap lock) */
d92725256b4f22 Peter Xu            2022-05-30  318  	if (fault & VM_FAULT_COMPLETED)
d92725256b4f22 Peter Xu            2022-05-30  319  		return;
d92725256b4f22 Peter Xu            2022-05-30  320  
83c54070ee1a2d Nicholas Piggin     2007-07-19  321  	if (unlikely(fault & VM_FAULT_ERROR)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  322  		/*
67a5a59d330194 Helge Deller        2006-03-27  323  		 * We hit a shared mapping outside of the file, or some
6e346228c76506 Linus Torvalds      2005-08-04  324  		 * other thing happened to us that made us unable to
6e346228c76506 Linus Torvalds      2005-08-04  325  		 * handle the page fault gracefully.
^1da177e4c3f41 Linus Torvalds      2005-04-16  326  		 */
83c54070ee1a2d Nicholas Piggin     2007-07-19  327  		if (fault & VM_FAULT_OOM)
^1da177e4c3f41 Linus Torvalds      2005-04-16  328  			goto out_of_memory;
33692f27597fca Linus Torvalds      2015-01-29  329  		else if (fault & VM_FAULT_SIGSEGV)
33692f27597fca Linus Torvalds      2015-01-29  330  			goto bad_area;
606f95e4255845 Helge Deller        2017-09-21  331  		else if (fault & (VM_FAULT_SIGBUS|VM_FAULT_HWPOISON|
606f95e4255845 Helge Deller        2017-09-21  332  				  VM_FAULT_HWPOISON_LARGE))
83c54070ee1a2d Nicholas Piggin     2007-07-19  333  			goto bad_area;
83c54070ee1a2d Nicholas Piggin     2007-07-19  334  		BUG();
^1da177e4c3f41 Linus Torvalds      2005-04-16  335  	}
38057477b98712 Kautuk Consul       2012-03-20  336  	if (fault & VM_FAULT_RETRY) {
38057477b98712 Kautuk Consul       2012-03-20  337  		/*
3e4e28c5a8f01e Michel Lespinasse   2020-06-08  338  		 * No need to mmap_read_unlock(mm) as we would
38057477b98712 Kautuk Consul       2012-03-20  339  		 * have already released it in __lock_page_or_retry
38057477b98712 Kautuk Consul       2012-03-20  340  		 * in mm/filemap.c.
38057477b98712 Kautuk Consul       2012-03-20  341  		 */
4064b982706375 Peter Xu            2020-04-01  342  		flags |= FAULT_FLAG_TRIED;
38057477b98712 Kautuk Consul       2012-03-20  343  		goto retry;
38057477b98712 Kautuk Consul       2012-03-20  344  	}
d8ed45c5dcd455 Michel Lespinasse   2020-06-08  345  	mmap_read_unlock(mm);
^1da177e4c3f41 Linus Torvalds      2005-04-16  346  	return;
^1da177e4c3f41 Linus Torvalds      2005-04-16  347  
^1da177e4c3f41 Linus Torvalds      2005-04-16  348  check_expansion:
^1da177e4c3f41 Linus Torvalds      2005-04-16  349  	vma = prev_vma;
^1da177e4c3f41 Linus Torvalds      2005-04-16  350  	if (vma && (expand_stack(vma, address) == 0))
^1da177e4c3f41 Linus Torvalds      2005-04-16  351  		goto good_area;
^1da177e4c3f41 Linus Torvalds      2005-04-16  352  
^1da177e4c3f41 Linus Torvalds      2005-04-16  353  /*
^1da177e4c3f41 Linus Torvalds      2005-04-16  354   * Something tried to access memory that isn't in our memory map..
^1da177e4c3f41 Linus Torvalds      2005-04-16  355   */
^1da177e4c3f41 Linus Torvalds      2005-04-16  356  bad_area:
d8ed45c5dcd455 Michel Lespinasse   2020-06-08  357  	mmap_read_unlock(mm);
^1da177e4c3f41 Linus Torvalds      2005-04-16  358  
^1da177e4c3f41 Linus Torvalds      2005-04-16  359  	if (user_mode(regs)) {
ccf75290cc6463 Eric W. Biederman   2018-04-19  360  		int signo, si_code;
fef47e2a2e1e75 Helge Deller        2014-05-05  361  
1f2048fd8bc421 Helge Deller        2013-11-07  362  		switch (code) {
1f2048fd8bc421 Helge Deller        2013-11-07  363  		case 15:	/* Data TLB miss fault/Data page fault */
49d1cb2bcadfc5 Helge Deller        2013-11-18  364  			/* send SIGSEGV when outside of vma */
49d1cb2bcadfc5 Helge Deller        2013-11-18  365  			if (!vma ||
247462316f85a9 Helge Deller        2017-07-02  366  			    address < vma->vm_start || address >= vma->vm_end) {
ccf75290cc6463 Eric W. Biederman   2018-04-19  367  				signo = SIGSEGV;
ccf75290cc6463 Eric W. Biederman   2018-04-19  368  				si_code = SEGV_MAPERR;
49d1cb2bcadfc5 Helge Deller        2013-11-18  369  				break;
49d1cb2bcadfc5 Helge Deller        2013-11-18  370  			}
49d1cb2bcadfc5 Helge Deller        2013-11-18  371  
49d1cb2bcadfc5 Helge Deller        2013-11-18  372  			/* send SIGSEGV for wrong permissions */
49d1cb2bcadfc5 Helge Deller        2013-11-18  373  			if ((vma->vm_flags & acc_type) != acc_type) {
ccf75290cc6463 Eric W. Biederman   2018-04-19  374  				signo = SIGSEGV;
ccf75290cc6463 Eric W. Biederman   2018-04-19  375  				si_code = SEGV_ACCERR;
49d1cb2bcadfc5 Helge Deller        2013-11-18  376  				break;
49d1cb2bcadfc5 Helge Deller        2013-11-18  377  			}
49d1cb2bcadfc5 Helge Deller        2013-11-18  378  
49d1cb2bcadfc5 Helge Deller        2013-11-18  379  			/* probably address is outside of mapped file */
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  380  			fallthrough;
1f2048fd8bc421 Helge Deller        2013-11-07  381  		case 17:	/* NA data TLB miss / page fault */
1f2048fd8bc421 Helge Deller        2013-11-07  382  		case 18:	/* Unaligned access - PCXS only */
ccf75290cc6463 Eric W. Biederman   2018-04-19  383  			signo = SIGBUS;
ccf75290cc6463 Eric W. Biederman   2018-04-19  384  			si_code = (code == 18) ? BUS_ADRALN : BUS_ADRERR;
1f2048fd8bc421 Helge Deller        2013-11-07  385  			break;
1f2048fd8bc421 Helge Deller        2013-11-07  386  		case 16:	/* Non-access instruction TLB miss fault */
1f2048fd8bc421 Helge Deller        2013-11-07  387  		case 26:	/* PCXL: Data memory access rights trap */
1f2048fd8bc421 Helge Deller        2013-11-07  388  		default:
ccf75290cc6463 Eric W. Biederman   2018-04-19  389  			signo = SIGSEGV;
ccf75290cc6463 Eric W. Biederman   2018-04-19  390  			si_code = (code == 26) ? SEGV_ACCERR : SEGV_MAPERR;
49d1cb2bcadfc5 Helge Deller        2013-11-18  391  			break;
1f2048fd8bc421 Helge Deller        2013-11-07  392  		}
606f95e4255845 Helge Deller        2017-09-21  393  #ifdef CONFIG_MEMORY_FAILURE
606f95e4255845 Helge Deller        2017-09-21  394  		if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
c2b0e0d33b5573 Eric W. Biederman   2018-04-19  395  			unsigned int lsb = 0;
606f95e4255845 Helge Deller        2017-09-21  396  			printk(KERN_ERR
606f95e4255845 Helge Deller        2017-09-21  397  	"MCE: Killing %s:%d due to hardware memory corruption fault at %08lx\n",
606f95e4255845 Helge Deller        2017-09-21  398  			tsk->comm, tsk->pid, address);
606f95e4255845 Helge Deller        2017-09-21  399  			/*
606f95e4255845 Helge Deller        2017-09-21  400  			 * Either small page or large page may be poisoned.
606f95e4255845 Helge Deller        2017-09-21  401  			 * In other words, VM_FAULT_HWPOISON_LARGE and
606f95e4255845 Helge Deller        2017-09-21  402  			 * VM_FAULT_HWPOISON are mutually exclusive.
606f95e4255845 Helge Deller        2017-09-21  403  			 */
606f95e4255845 Helge Deller        2017-09-21  404  			if (fault & VM_FAULT_HWPOISON_LARGE)
606f95e4255845 Helge Deller        2017-09-21  405  				lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
606f95e4255845 Helge Deller        2017-09-21  406  			else if (fault & VM_FAULT_HWPOISON)
606f95e4255845 Helge Deller        2017-09-21  407  				lsb = PAGE_SHIFT;
c2b0e0d33b5573 Eric W. Biederman   2018-04-19  408  
c2b0e0d33b5573 Eric W. Biederman   2018-04-19  409  			force_sig_mceerr(BUS_MCEERR_AR, (void __user *) address,
f8eac9011b6be5 Eric W. Biederman   2019-02-05  410  					 lsb);
c2b0e0d33b5573 Eric W. Biederman   2018-04-19  411  			return;
c2b0e0d33b5573 Eric W. Biederman   2018-04-19  412  		}
c2b0e0d33b5573 Eric W. Biederman   2018-04-19  413  #endif
606f95e4255845 Helge Deller        2017-09-21  414  		show_signal_msg(regs, code, address, tsk, vma);
606f95e4255845 Helge Deller        2017-09-21  415  
2e1661d2673667 Eric W. Biederman   2019-05-23  416  		force_sig_fault(signo, si_code, (void __user *) address);
^1da177e4c3f41 Linus Torvalds      2005-04-16  417  		return;
^1da177e4c3f41 Linus Torvalds      2005-04-16  418  	}
20dda87bdc6567 John David Anglin   2022-01-04  419  	msg = "Page fault: bad address";
^1da177e4c3f41 Linus Torvalds      2005-04-16  420  
^1da177e4c3f41 Linus Torvalds      2005-04-16  421  no_context:
^1da177e4c3f41 Linus Torvalds      2005-04-16  422  
c61c25eb02757e Kyle McMartin       2008-12-20  423  	if (!user_mode(regs) && fixup_exception(regs)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  424  		return;
^1da177e4c3f41 Linus Torvalds      2005-04-16  425  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  426  
20dda87bdc6567 John David Anglin   2022-01-04 @427  	parisc_terminate(msg, regs, code, address);
^1da177e4c3f41 Linus Torvalds      2005-04-16  428  
^1da177e4c3f41 Linus Torvalds      2005-04-16  429  out_of_memory:
d8ed45c5dcd455 Michel Lespinasse   2020-06-08  430  	mmap_read_unlock(mm);
20dda87bdc6567 John David Anglin   2022-01-04  431  	if (!user_mode(regs)) {
20dda87bdc6567 John David Anglin   2022-01-04  432  		msg = "Page fault: out of memory";
^1da177e4c3f41 Linus Torvalds      2005-04-16  433  		goto no_context;
20dda87bdc6567 John David Anglin   2022-01-04  434  	}
53e30d02276943 Nicholas Piggin     2010-04-22  435  	pagefault_out_of_memory();
^1da177e4c3f41 Linus Torvalds      2005-04-16  436  }
e00b0a2ab8ec01 John David Anglin   2022-03-09  437  

:::::: The code at line 427 was first introduced by commit
:::::: 20dda87bdc6567e864942ead40bc149ebbe3ae79 parisc: Enhance page fault termination message

:::::: TO: John David Anglin <dave.anglin@bell.net>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
