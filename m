Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D2B19049B
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Aug 2026 02:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787969023; cv=none; b=F4qXL1sPq+RMdiMKZFMttNYrSfXXu6b+q1dJwgUBZJYcayw0m7oaVeOyxcTgfUdYyzwMmqW5nSVQ3HmWCMQkikDfxVsh7JF6Cxapt0RmJN/weRVHwI/nQms8VfM1DZiHQvnbn1A73EdDM3irpE98lfgCAS3IgJCiU4GDy6ERPcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787969023; c=relaxed/simple;
	bh=t1mGDaCglsA+okMxIGdTHdOO9UptWhshQn1Iiq+EN7M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mIXyv8nVEfV10/9c0Gi40mi3bn3Fu9YhUe3PSjyFTXxBiUyS//+OE5Bn/nsPEtW3ST6EqGkvd6JnsGvCVAX7QOI3EfPMVenqrCTRNAc5vxc1FmVme6Fh07JCBUBayx6x2f6bOe3vnQ0eM6INJYnl9A6r1DQzc0WbZNWgxim1/Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eml2c+BY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eml2c+BY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787969020; x=1819505020;
  h=date:from:to:cc:subject:message-id;
  bh=t1mGDaCglsA+okMxIGdTHdOO9UptWhshQn1Iiq+EN7M=;
  b=Eml2c+BYsRhLG1rZahEZ0c1Dcm1Tj8o5CrCQpLn0lpE5WqdSAjsinLsc
   txHOn0aNxQLw5LHvNIjzyEJfRCQ+AwCbcAHkgKvk62TtYfL9dVNRh6xMt
   qyjIYmiE7g7a6LelBi7/DCfIEC/SVHcgGE4cWdPtPiCH0zAfIfnGSPLi1
   z1S3KkDc7V7/zwv2rKO88OBcpKaKS/WTzHSRXIVZISItjH+Grji1NPlzo
   W3NvjZZVhFqyfka1Nml7alexNirxsPlN2iJY/3zUyccPJ1PB+WKNDv+QI
   /GEcGb+BSAzmEjawF8vt3W62BzL/ypG4uj7YJC7hyzGfGivFIWBo2kdTA
   Q==;
X-CSE-ConnectionGUID: KM2rHBpTSiSW1W5J75HBgQ==
X-CSE-MsgGUID: cgwIImOQQ4W3JCi8swdp1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="99635837"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="99635837"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 19:03:39 -0700
X-CSE-ConnectionGUID: QCrGp2AyQbScIFKKBtZhWg==
X-CSE-MsgGUID: H63z3pqLRteUbtrGuUuBSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="265083330"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Aug 2026 19:03:38 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x08Pv-00000000CEo-1Idz;
	Sat, 29 Aug 2026 02:03:35 +0000
Date: Sat, 29 Aug 2026 10:03:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/rseq.c:480:40: warning: cast from pointer to integer
 of different size
Message-ID: <202608290912.NrJ6h4mb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/odion-efficios-com/rseq-uapi-add-rseq-operation-definitions/20260828-113339, commit: e8494bc5b81ab087f8fda3da91fb0349f6e08b83"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Olivier Dion <odion@efficios.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/odion-efficios-com/rseq-uapi-add-rseq-operation-definitions/20260828-113339
head:   6442a4dd9f55ba8a0f39522b330200e1b8548bd5
commit: e8494bc5b81ab087f8fda3da91fb0349f6e08b83 rseq: register and unregister operations via prctl
date:   10 hours ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260829/202608290912.NrJ6h4mb-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260829/202608290912.NrJ6h4mb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608290912.NrJ6h4mb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rseq.c:78:
   include/linux/rseq_entry.h: In function 'rseq_op_reset_word':
   include/linux/rseq_entry.h:268:36: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     268 |                 u32 __user *udst = (u32 __user *)dst;
         |                                    ^
   include/linux/rseq_entry.h:272:44: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     272 |                         u32 __user *usrc = (u32 __user *)src;
         |                                            ^
   include/linux/rseq_entry.h:282:36: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     282 |                 u64 __user *udst = (u64 __user *)dst;
         |                                    ^
   include/linux/rseq_entry.h:286:44: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     286 |                         u64 __user *usrc = (u64 __user *)src;
         |                                            ^
   include/linux/rseq_entry.h: In function 'rseq_apply_ops':
   include/linux/rseq_entry.h:317:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     317 |         node = (struct rseq_op_node __user *)next;
         |                ^
   include/linux/rseq_entry.h:372:24: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     372 |                 node = (struct rseq_op_node __user *)next;
         |                        ^
   include/linux/rseq_entry.h: In function 'rseq_syscall_exit_to_user_mode':
   include/linux/rseq_entry.h:880:17: error: implicit declaration of function 'rseq_clear_one_shot_events' [-Wimplicit-function-declaration]
     880 |                 rseq_clear_one_shot_events(ev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rseq.c: In function 'rseq_register':
>> kernel/rseq.c:480:40: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     480 |                         u64 sentinel = (u64)&rseq->rseq_op_list;
         |                                        ^
   kernel/rseq.c: In function 'rseq_op_register':
>> kernel/rseq.c:992:17: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     992 |         first = (struct rseq_op_node __user *)first_addr;
         |                 ^
   kernel/rseq.c: In function 'rseq_op_unregister':
   kernel/rseq.c:1029:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    1029 |         prev = (struct rseq_op_node __user *)prev_addr;
         |                ^
   kernel/rseq.c:1030:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    1030 |         next = (struct rseq_op_node __user *)next_addr;
         |                ^


vim +480 kernel/rseq.c

0f085b41880e31 Thomas Gleixner   2025-10-27  431  
99428157dcf32f Thomas Gleixner   2026-04-26  432  static long rseq_register(struct rseq __user * rseq, u32 rseq_len, int flags, u32 sig)
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  433  {
d7a5da7a0f7fa7 Thomas Gleixner   2025-12-15  434  	u32 rseqfl = 0;
b9eac6a9d93c95 Thomas Gleixner   2026-04-25  435  	u8 version = 1;
d7a5da7a0f7fa7 Thomas Gleixner   2025-12-15  436  
96d4f267e40f95 Linus Torvalds    2019-01-03  437  	if (!access_ok(rseq, rseq_len))
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  438  		return -EFAULT;
fd881d0a085fc5 Michael Jeanson   2025-03-06  439  
b9eac6a9d93c95 Thomas Gleixner   2026-04-25  440  	/*
99428157dcf32f Thomas Gleixner   2026-04-26  441  	 * Architectures, which use the generic IRQ entry code (at least) enable
99428157dcf32f Thomas Gleixner   2026-04-26  442  	 * registrations with a size greater than the original v1 fixed sized
99428157dcf32f Thomas Gleixner   2026-04-26  443  	 * @rseq_len, which has been validated already to utilize the optimized
99428157dcf32f Thomas Gleixner   2026-04-26  444  	 * v2 ABI mode which also enables extended RSEQ features beyond MMCID.
b9eac6a9d93c95 Thomas Gleixner   2026-04-25  445  	 */
99428157dcf32f Thomas Gleixner   2026-04-26  446  	if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY) && rseq_len > ORIG_RSEQ_SIZE)
99428157dcf32f Thomas Gleixner   2026-04-26  447  		version = 2;
99428157dcf32f Thomas Gleixner   2026-04-26  448  
b9eac6a9d93c95 Thomas Gleixner   2026-04-25  449  	if (IS_ENABLED(CONFIG_RSEQ_SLICE_EXTENSION) && version > 1) {
010b7723c0a3b9 Thomas Gleixner   2026-04-28  450  		if (rseq_slice_extension_enabled()) {
d7a5da7a0f7fa7 Thomas Gleixner   2025-12-15  451  			rseqfl |= RSEQ_CS_FLAG_SLICE_EXT_AVAILABLE;
010b7723c0a3b9 Thomas Gleixner   2026-04-28  452  			if (flags & RSEQ_FLAG_SLICE_EXT_DEFAULT_ON)
d6200245c75e83 Peter Zijlstra    2026-01-19  453  				rseqfl |= RSEQ_CS_FLAG_SLICE_EXT_ENABLED;
d6200245c75e83 Peter Zijlstra    2026-01-19  454  		}
010b7723c0a3b9 Thomas Gleixner   2026-04-28  455  	}
e8494bc5b81ab0 Olivier Dion      2026-08-28  456  	if (version > 1)
e8494bc5b81ab0 Olivier Dion      2026-08-28  457  		rseqfl |= RSEQ_CS_FLAG_RSEQ_OP_AVAILABLE;
d7a5da7a0f7fa7 Thomas Gleixner   2025-12-15  458  
0f085b41880e31 Thomas Gleixner   2025-10-27  459  	scoped_user_write_access(rseq, efault) {
fd881d0a085fc5 Michael Jeanson   2025-03-06  460  		/*
fd881d0a085fc5 Michael Jeanson   2025-03-06  461  		 * If the rseq_cs pointer is non-NULL on registration, clear it to
fd881d0a085fc5 Michael Jeanson   2025-03-06  462  		 * avoid a potential segfault on return to user-space. The proper thing
fd881d0a085fc5 Michael Jeanson   2025-03-06  463  		 * to do would have been to fail the registration but this would break
fd881d0a085fc5 Michael Jeanson   2025-03-06  464  		 * older libcs that reuse the rseq area for new threads without
067b3b41b4dd5b Thomas Gleixner   2025-10-27  465  		 * clearing the fields. Don't bother reading it, just reset it.
fd881d0a085fc5 Michael Jeanson   2025-03-06  466  		 */
0f085b41880e31 Thomas Gleixner   2025-10-27  467  		unsafe_put_user(0UL, &rseq->rseq_cs, efault);
d7a5da7a0f7fa7 Thomas Gleixner   2025-12-15  468  		unsafe_put_user(rseqfl, &rseq->flags, efault);
0f085b41880e31 Thomas Gleixner   2025-10-27  469  		/* Initialize IDs in user space */
0f085b41880e31 Thomas Gleixner   2025-10-27  470  		unsafe_put_user(RSEQ_CPU_ID_UNINITIALIZED, &rseq->cpu_id_start, efault);
0f085b41880e31 Thomas Gleixner   2025-10-27  471  		unsafe_put_user(RSEQ_CPU_ID_UNINITIALIZED, &rseq->cpu_id, efault);
0f085b41880e31 Thomas Gleixner   2025-10-27  472  		unsafe_put_user(0U, &rseq->node_id, efault);
0f085b41880e31 Thomas Gleixner   2025-10-27  473  		unsafe_put_user(0U, &rseq->mm_cid, efault);
b9eac6a9d93c95 Thomas Gleixner   2026-04-25  474  
b9eac6a9d93c95 Thomas Gleixner   2026-04-25  475  		/*
b9eac6a9d93c95 Thomas Gleixner   2026-04-25  476  		 * All fields past mm_cid are only valid for non-legacy v2
b9eac6a9d93c95 Thomas Gleixner   2026-04-25  477  		 * registrations.
b9eac6a9d93c95 Thomas Gleixner   2026-04-25  478  		 */
b9eac6a9d93c95 Thomas Gleixner   2026-04-25  479  		if (version > 1) {
e8494bc5b81ab0 Olivier Dion      2026-08-28 @480  			u64 sentinel = (u64)&rseq->rseq_op_list;
e8494bc5b81ab0 Olivier Dion      2026-08-28  481  
b9eac6a9d93c95 Thomas Gleixner   2026-04-25  482  			if (IS_ENABLED(CONFIG_RSEQ_SLICE_EXTENSION))
d7a5da7a0f7fa7 Thomas Gleixner   2025-12-15  483  				unsafe_put_user(0U, &rseq->slice_ctrl.all, efault);
e8494bc5b81ab0 Olivier Dion      2026-08-28  484  			/*
e8494bc5b81ab0 Olivier Dion      2026-08-28  485  			 * Initialize the rseq operation list sentinel as an
e8494bc5b81ab0 Olivier Dion      2026-08-28  486  			 * empty circular doubly-linked list pointing to itself.
e8494bc5b81ab0 Olivier Dion      2026-08-28  487  			 */
e8494bc5b81ab0 Olivier Dion      2026-08-28  488  			unsafe_put_user(sentinel, &rseq->rseq_op_list.next, efault);
e8494bc5b81ab0 Olivier Dion      2026-08-28  489  			unsafe_put_user(sentinel, &rseq->rseq_op_list.prev, efault);
0f085b41880e31 Thomas Gleixner   2025-10-27  490  		}
b9eac6a9d93c95 Thomas Gleixner   2026-04-25  491  	}
fd881d0a085fc5 Michael Jeanson   2025-03-06  492  
dc0a241ceaf3b7 Michael Jeanson   2025-02-19  493  	/*
dc0a241ceaf3b7 Michael Jeanson   2025-02-19  494  	 * Activate the registration by setting the rseq area address, length
dc0a241ceaf3b7 Michael Jeanson   2025-02-19  495  	 * and signature in the task struct.
dc0a241ceaf3b7 Michael Jeanson   2025-02-19  496  	 */
faba9d250eaec7 Thomas Gleixner   2025-10-27  497  	current->rseq.usrptr = rseq;
faba9d250eaec7 Thomas Gleixner   2025-10-27  498  	current->rseq.len = rseq_len;
faba9d250eaec7 Thomas Gleixner   2025-10-27  499  	current->rseq.sig = sig;
dc0a241ceaf3b7 Michael Jeanson   2025-02-19  500  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
