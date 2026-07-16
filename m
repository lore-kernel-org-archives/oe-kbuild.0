Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E2F38330A
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Jul 2026 05:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181194; cv=none; b=bNHjr85hAjb3VGGBuPjkWLz/37h8VtgLzM3wbhS+2yYOIbI4nBcYW4QDSHozU5osvmVxvk/M+P8WE+aXqaPqkDO1TKNeL6+PtY20XgCTJoO1/rU3Da0d4Vj9pqcj3sw/S6u92ntuhcLQinHOt6MRCK1qrf5donRMIKRPqKXxMRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181194; c=relaxed/simple;
	bh=QKsJ0ff1j3sTNvEUkcNTP7eFa/MEBZQUiycPhMjagoA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i0X2u3YlaV6zgoOad3ox3NfWMZ0ByQ4IRYVfkd9MiGjLD7pAq1ADWhARNSdb64sx/PDrgr5kFFUMuCvZIC3lCnF9ccgOI9M/Pld+MrswO08Ma2vHpTU/yvy/2PdtpFTYNzWsx5yNix8mdLDq1GirYSUx7IlKk6fBSOJz7Vp5u0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mkFXI8gQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mkFXI8gQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784181192; x=1815717192;
  h=date:from:to:cc:subject:message-id;
  bh=QKsJ0ff1j3sTNvEUkcNTP7eFa/MEBZQUiycPhMjagoA=;
  b=mkFXI8gQB9bJnMVp/3ZOc9pG3bVA9YVlZak4sDBYRGSUxCjP8zAAvCQR
   5Q7g7OiFETCZT/Kybx0ysVFzoO4ruKJKxtQNms4EPSgPtBQtWVuRaUi25
   VP9jSq0D1Vp3F3Wwwx/iPSMiclLsPhc9CHsrBG+7BlT2v/IMaxqp/Dg2i
   AOWQE8MdbqqPevI932VQjonvCAT1EMlV7UlWrCKNXETx2gT6BXUptQlb1
   bF09r/0nrYzJ4nyqQ1Jeh68mIXvgXOPwZwlEfdUXBtV1UvoapAJZctGqA
   oeP28uEQOJxsFiyW8DFeAmtiOLmaRKQkmazLmnxfrkk5TPY8QTnQnFr/v
   g==;
X-CSE-ConnectionGUID: RvMAIMAKTtevasqE3QY6wA==
X-CSE-MsgGUID: 13re5KbNQ6qUCjMaYEV+Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="72362089"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="72362089"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 22:53:11 -0700
X-CSE-ConnectionGUID: DKdwA1F+QAGT7BlVgF1vgg==
X-CSE-MsgGUID: rIusc9d9TreMZsOcbxSopg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jul 2026 22:53:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkF1v-00000000OM6-3OoH;
	Thu, 16 Jul 2026 05:53:07 +0000
Date: Thu, 16 Jul 2026 13:52:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/misc/lkdtm/heap.c:118 lkdtm_READ_AFTER_FREE() warn:
 potential pointer math issue ('base' is a 32 bit pointer)
Message-ID: <202607161358.quYrqeAD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
CC: "Harry Yoo (Oracle)" <harry@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58717b2a1365d06c8c64b72aa948541b53fe31eb
commit: feb662d9168b63e1d4c02671ec96005410c6f3ce slab: support for compiler-assisted type-based slab cache partitioning
date:   9 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 9 weeks ago
config: um-randconfig-r071-20260716 (https://download.01.org/0day-ci/archive/20260716/202607161358.quYrqeAD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: feb662d9168b ("slab: support for compiler-assisted type-based slab cache partitioning")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607161358.quYrqeAD-lkp@intel.com/

New smatch warnings:
drivers/misc/lkdtm/heap.c:118 lkdtm_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
drivers/misc/lkdtm/heap.c:169 lkdtm_KFENCE_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)

Old smatch warnings:
drivers/misc/lkdtm/heap.c:84 lkdtm_WRITE_AFTER_FREE() error: dereferencing freed memory 'base' (line 83)
drivers/misc/lkdtm/heap.c:119 lkdtm_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
drivers/misc/lkdtm/heap.c:124 lkdtm_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
drivers/misc/lkdtm/heap.c:124 lkdtm_READ_AFTER_FREE() error: dereferencing freed memory 'base' (line 121)
drivers/misc/lkdtm/heap.c:170 lkdtm_KFENCE_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
drivers/misc/lkdtm/heap.c:175 lkdtm_KFENCE_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
drivers/misc/lkdtm/heap.c:330 lkdtm_SLAB_FREE_DOUBLE() error: double free of 'val' (line 329)

vim +118 drivers/misc/lkdtm/heap.c

ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   91  
73f62e60d80c2d drivers/misc/lkdtm/heap.c Kees Cook    2022-03-03   92  static void lkdtm_READ_AFTER_FREE(void)
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   93  {
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   94  	int *base, *val, saw;
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   95  	size_t len = 1024;
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   96  	/*
e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25   97  	 * The slub allocator will use the either the first word or
e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25   98  	 * the middle of the allocation to store the free pointer,
e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25   99  	 * depending on configurations. Store in the second word to
e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25  100  	 * avoid running into the freelist.
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  101  	 */
e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25  102  	size_t offset = sizeof(*base);
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  103  
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  104  	base = kmalloc(len, GFP_KERNEL);
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  105  	if (!base) {
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  106  		pr_info("Unable to allocate base memory.\n");
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  107  		return;
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  108  	}
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  109  
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  110  	val = kmalloc(len, GFP_KERNEL);
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  111  	if (!val) {
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  112  		pr_info("Unable to allocate val memory.\n");
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  113  		kfree(base);
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  114  		return;
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  115  	}
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  116  
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  117  	*val = 0x12345678;
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26 @118  	base[offset] = *val;
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  119  	pr_info("Value in memory before free: %x\n", base[offset]);
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  120  
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  121  	kfree(base);
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  122  
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  123  	pr_info("Attempting bad read from freed memory\n");
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  124  	saw = base[offset];
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  125  	if (saw != *val) {
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  126  		/* Good! Poisoning happened, so declare a win. */
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  127  		pr_info("Memory correctly poisoned (%x)\n", saw);
5b777131bd8005 drivers/misc/lkdtm/heap.c Kees Cook    2021-06-23  128  	} else {
5b777131bd8005 drivers/misc/lkdtm/heap.c Kees Cook    2021-06-23  129  		pr_err("FAIL: Memory was not poisoned!\n");
5b777131bd8005 drivers/misc/lkdtm/heap.c Kees Cook    2021-06-23  130  		pr_expected_config_param(CONFIG_INIT_ON_FREE_DEFAULT_ON, "init_on_free");
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  131  	}
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  132  
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  133  	kfree(val);
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  134  }
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  135  
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  136  static void lkdtm_KFENCE_READ_AFTER_FREE(void)
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  137  {
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  138  	int *base, val, saw;
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  139  	unsigned long timeout, resched_after;
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  140  	size_t len = 1024;
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  141  	/*
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  142  	 * The slub allocator will use the either the first word or
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  143  	 * the middle of the allocation to store the free pointer,
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  144  	 * depending on configurations. Store in the second word to
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  145  	 * avoid running into the freelist.
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  146  	 */
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  147  	size_t offset = sizeof(*base);
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  148  
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  149  	/*
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  150  	 * 100x the sample interval should be more than enough to ensure we get
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  151  	 * a KFENCE allocation eventually.
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  152  	 */
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  153  	timeout = jiffies + msecs_to_jiffies(100 * kfence_sample_interval);
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  154  	/*
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  155  	 * Especially for non-preemption kernels, ensure the allocation-gate
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  156  	 * timer can catch up: after @resched_after, every failed allocation
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  157  	 * attempt yields, to ensure the allocation-gate timer is scheduled.
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  158  	 */
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  159  	resched_after = jiffies + msecs_to_jiffies(kfence_sample_interval);
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  160  	do {
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  161  		base = kmalloc(len, GFP_KERNEL);
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  162  		if (!base) {
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  163  			pr_err("FAIL: Unable to allocate kfence memory!\n");
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  164  			return;
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  165  		}
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  166  
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  167  		if (is_kfence_address(base)) {
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  168  			val = 0x12345678;
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29 @169  			base[offset] = val;
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  170  			pr_info("Value in memory before free: %x\n", base[offset]);
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  171  
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  172  			kfree(base);
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  173  
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  174  			pr_info("Attempting bad read from freed memory\n");
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  175  			saw = base[offset];
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  176  			if (saw != val) {
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  177  				/* Good! Poisoning happened, so declare a win. */
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  178  				pr_info("Memory correctly poisoned (%x)\n", saw);
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  179  			} else {
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  180  				pr_err("FAIL: Memory was not poisoned!\n");
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  181  				pr_expected_config_param(CONFIG_INIT_ON_FREE_DEFAULT_ON, "init_on_free");
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  182  			}
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  183  			return;
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  184  		}
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  185  
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  186  		kfree(base);
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  187  		if (time_after(jiffies, resched_after))
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  188  			cond_resched();
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  189  	} while (time_before(jiffies, timeout));
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  190  
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  191  	pr_err("FAIL: kfence memory never allocated!\n");
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  192  }
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  193  

:::::: The code at line 118 was first introduced by commit
:::::: ffc514f3fcac4aa76735ada55228c814153943e6 lkdtm: split heap corruption tests to separate file

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
