Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BEA28B4FA
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Aug 2026 06:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788071107; cv=none; b=qg2eNFYuwgOGXpXgvcuMYWkgNFLuZrBkmeNqpu1BBP6UTHNPTrXDqEIh2ZX1UXnEWFCzx6I0FX0Md3N4z9OocNxyLGkBgeiR3qq6m1a817TF8n02U+sT/KaSChyqjI/4ie2pqROQD0YzEVYJ6qxrfkckvZwNwbe6LcjnrUMkIDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788071107; c=relaxed/simple;
	bh=RhKK1Le1AsuzlVndQx6V6V4Ex1b5dhLHr9LI1FjWJko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hhtMueFCiDh6DpjRhuCXlPiQ0fszcNWhoOcsX5z6ZC8Lb3O462gHQERqJ0nQ0dgPiVji0i3HAHRvClY9CboHzVn9rsLh0yfNtjZRWLXemU93fBUi9VDkOfrR9pe62Qq9kFN5MoFgxRLI7y0lBZm4khYCQWxkFdjDuUVjlt6Vn/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQD+TNh8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQD+TNh8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788071104; x=1819607104;
  h=date:from:to:cc:subject:message-id;
  bh=RhKK1Le1AsuzlVndQx6V6V4Ex1b5dhLHr9LI1FjWJko=;
  b=BQD+TNh8w10ByGMP8ICFqaq7Op6rgRk60yHMBSjdI3zOjbDOFOtRj+1u
   gMctXtwl5tuX43r4NduZUPEhsR8TIL/glFmEvfm+U1HAN7NV8ihDoiPQR
   AzQG208TlouYbDdZNS79zBbgE+6IMqpNplnxcCNWQoKae0zEm1QIyPurW
   z5RNmnEorMZrd7VrXihFoF6WC6u1rO3z/OZtPwTPz1cya92K93nfnat9/
   qr7JxYA5XqGzEHlNwh93Q67hkiKJESNR85/rCNz7wNpClkFTfIPUDrlcY
   tVjzaVNW+w3YaImmtPc3CYJGqlPtrcJaCaXoRpgHGL429GX/KVu2UWQ7G
   A==;
X-CSE-ConnectionGUID: BAd92GMLQYGxk+9yJSvAYA==
X-CSE-MsgGUID: EFiqG7PnRr21KG5STD0jaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="88529775"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="88529775"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 23:25:03 -0700
X-CSE-ConnectionGUID: Sya/K4I+S5CaUnOxFa+64g==
X-CSE-MsgGUID: Nn3MQoT2Q12Sza18HvWwpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="268553968"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Aug 2026 23:25:02 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0YyS-00000000De2-1eVR;
	Sun, 30 Aug 2026 06:25:00 +0000
Date: Sun, 30 Aug 2026 14:24:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/rseq.c:480:41: sparse: sparse: cast removes address
 space '__user' of expression
Message-ID: <202608301410.KXaPc9oO-lkp@intel.com>
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
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r131-20260829 (https://download.01.org/0day-ci/archive/20260830/202608301410.KXaPc9oO-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 52774473867e49b5891ab9381accf4e5a3ce0024)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608301410.KXaPc9oO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608301410.KXaPc9oO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/rseq.c:480:41: sparse: sparse: cast removes address space '__user' of expression

vim +/__user +480 kernel/rseq.c

0f085b41880e314 Thomas Gleixner   2025-10-27  431  
99428157dcf32fd Thomas Gleixner   2026-04-26  432  static long rseq_register(struct rseq __user * rseq, u32 rseq_len, int flags, u32 sig)
d7822b1e24f2df5 Mathieu Desnoyers 2018-06-02  433  {
d7a5da7a0f7fa7f Thomas Gleixner   2025-12-15  434  	u32 rseqfl = 0;
b9eac6a9d93c952 Thomas Gleixner   2026-04-25  435  	u8 version = 1;
d7a5da7a0f7fa7f Thomas Gleixner   2025-12-15  436  
96d4f267e40f950 Linus Torvalds    2019-01-03  437  	if (!access_ok(rseq, rseq_len))
d7822b1e24f2df5 Mathieu Desnoyers 2018-06-02  438  		return -EFAULT;
fd881d0a085fc54 Michael Jeanson   2025-03-06  439  
b9eac6a9d93c952 Thomas Gleixner   2026-04-25  440  	/*
99428157dcf32fd Thomas Gleixner   2026-04-26  441  	 * Architectures, which use the generic IRQ entry code (at least) enable
99428157dcf32fd Thomas Gleixner   2026-04-26  442  	 * registrations with a size greater than the original v1 fixed sized
99428157dcf32fd Thomas Gleixner   2026-04-26  443  	 * @rseq_len, which has been validated already to utilize the optimized
99428157dcf32fd Thomas Gleixner   2026-04-26  444  	 * v2 ABI mode which also enables extended RSEQ features beyond MMCID.
b9eac6a9d93c952 Thomas Gleixner   2026-04-25  445  	 */
99428157dcf32fd Thomas Gleixner   2026-04-26  446  	if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY) && rseq_len > ORIG_RSEQ_SIZE)
99428157dcf32fd Thomas Gleixner   2026-04-26  447  		version = 2;
99428157dcf32fd Thomas Gleixner   2026-04-26  448  
b9eac6a9d93c952 Thomas Gleixner   2026-04-25  449  	if (IS_ENABLED(CONFIG_RSEQ_SLICE_EXTENSION) && version > 1) {
010b7723c0a3b9a Thomas Gleixner   2026-04-28  450  		if (rseq_slice_extension_enabled()) {
d7a5da7a0f7fa7f Thomas Gleixner   2025-12-15  451  			rseqfl |= RSEQ_CS_FLAG_SLICE_EXT_AVAILABLE;
010b7723c0a3b9a Thomas Gleixner   2026-04-28  452  			if (flags & RSEQ_FLAG_SLICE_EXT_DEFAULT_ON)
d6200245c75e832 Peter Zijlstra    2026-01-19  453  				rseqfl |= RSEQ_CS_FLAG_SLICE_EXT_ENABLED;
d6200245c75e832 Peter Zijlstra    2026-01-19  454  		}
010b7723c0a3b9a Thomas Gleixner   2026-04-28  455  	}
e8494bc5b81ab08 Olivier Dion      2026-08-28  456  	if (version > 1)
e8494bc5b81ab08 Olivier Dion      2026-08-28  457  		rseqfl |= RSEQ_CS_FLAG_RSEQ_OP_AVAILABLE;
d7a5da7a0f7fa7f Thomas Gleixner   2025-12-15  458  
0f085b41880e314 Thomas Gleixner   2025-10-27  459  	scoped_user_write_access(rseq, efault) {
fd881d0a085fc54 Michael Jeanson   2025-03-06  460  		/*
fd881d0a085fc54 Michael Jeanson   2025-03-06  461  		 * If the rseq_cs pointer is non-NULL on registration, clear it to
fd881d0a085fc54 Michael Jeanson   2025-03-06  462  		 * avoid a potential segfault on return to user-space. The proper thing
fd881d0a085fc54 Michael Jeanson   2025-03-06  463  		 * to do would have been to fail the registration but this would break
fd881d0a085fc54 Michael Jeanson   2025-03-06  464  		 * older libcs that reuse the rseq area for new threads without
067b3b41b4dd5bf Thomas Gleixner   2025-10-27  465  		 * clearing the fields. Don't bother reading it, just reset it.
fd881d0a085fc54 Michael Jeanson   2025-03-06  466  		 */
0f085b41880e314 Thomas Gleixner   2025-10-27  467  		unsafe_put_user(0UL, &rseq->rseq_cs, efault);
d7a5da7a0f7fa7f Thomas Gleixner   2025-12-15  468  		unsafe_put_user(rseqfl, &rseq->flags, efault);
0f085b41880e314 Thomas Gleixner   2025-10-27  469  		/* Initialize IDs in user space */
0f085b41880e314 Thomas Gleixner   2025-10-27  470  		unsafe_put_user(RSEQ_CPU_ID_UNINITIALIZED, &rseq->cpu_id_start, efault);
0f085b41880e314 Thomas Gleixner   2025-10-27  471  		unsafe_put_user(RSEQ_CPU_ID_UNINITIALIZED, &rseq->cpu_id, efault);
0f085b41880e314 Thomas Gleixner   2025-10-27  472  		unsafe_put_user(0U, &rseq->node_id, efault);
0f085b41880e314 Thomas Gleixner   2025-10-27  473  		unsafe_put_user(0U, &rseq->mm_cid, efault);
b9eac6a9d93c952 Thomas Gleixner   2026-04-25  474  
b9eac6a9d93c952 Thomas Gleixner   2026-04-25  475  		/*
b9eac6a9d93c952 Thomas Gleixner   2026-04-25  476  		 * All fields past mm_cid are only valid for non-legacy v2
b9eac6a9d93c952 Thomas Gleixner   2026-04-25  477  		 * registrations.
b9eac6a9d93c952 Thomas Gleixner   2026-04-25  478  		 */
b9eac6a9d93c952 Thomas Gleixner   2026-04-25  479  		if (version > 1) {
e8494bc5b81ab08 Olivier Dion      2026-08-28 @480  			u64 sentinel = (u64)&rseq->rseq_op_list;
e8494bc5b81ab08 Olivier Dion      2026-08-28  481  
b9eac6a9d93c952 Thomas Gleixner   2026-04-25  482  			if (IS_ENABLED(CONFIG_RSEQ_SLICE_EXTENSION))
d7a5da7a0f7fa7f Thomas Gleixner   2025-12-15  483  				unsafe_put_user(0U, &rseq->slice_ctrl.all, efault);
e8494bc5b81ab08 Olivier Dion      2026-08-28  484  			/*
e8494bc5b81ab08 Olivier Dion      2026-08-28  485  			 * Initialize the rseq operation list sentinel as an
e8494bc5b81ab08 Olivier Dion      2026-08-28  486  			 * empty circular doubly-linked list pointing to itself.
e8494bc5b81ab08 Olivier Dion      2026-08-28  487  			 */
e8494bc5b81ab08 Olivier Dion      2026-08-28  488  			unsafe_put_user(sentinel, &rseq->rseq_op_list.next, efault);
e8494bc5b81ab08 Olivier Dion      2026-08-28  489  			unsafe_put_user(sentinel, &rseq->rseq_op_list.prev, efault);
0f085b41880e314 Thomas Gleixner   2025-10-27  490  		}
b9eac6a9d93c952 Thomas Gleixner   2026-04-25  491  	}
fd881d0a085fc54 Michael Jeanson   2025-03-06  492  
dc0a241ceaf3b7d Michael Jeanson   2025-02-19  493  	/*
dc0a241ceaf3b7d Michael Jeanson   2025-02-19  494  	 * Activate the registration by setting the rseq area address, length
dc0a241ceaf3b7d Michael Jeanson   2025-02-19  495  	 * and signature in the task struct.
dc0a241ceaf3b7d Michael Jeanson   2025-02-19  496  	 */
faba9d250eaec7a Thomas Gleixner   2025-10-27  497  	current->rseq.usrptr = rseq;
faba9d250eaec7a Thomas Gleixner   2025-10-27  498  	current->rseq.len = rseq_len;
faba9d250eaec7a Thomas Gleixner   2025-10-27  499  	current->rseq.sig = sig;
dc0a241ceaf3b7d Michael Jeanson   2025-02-19  500  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
