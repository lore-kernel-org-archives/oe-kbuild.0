Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA331EDA0B
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Aug 2025 18:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755973010; cv=none; b=Bj3sx3kgjK5v2ATEn73Nkq23Pt0hRXyofLS0uH7qJ213uEr+MCVrAL41zYM9gZN4f2BZUSMoDK2IB2pJLHBayvWfK+4EdHsm0pI50dZ32CYsFupbD6TZHicrP3KEHSoW9Ed2wphzecKMhdrPapJadDvRLM2pTMsXGbPyBkAsvg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755973010; c=relaxed/simple;
	bh=wRmFNtnjYeGggV6iwySV3VFme1zwfvW4P20JP4OohVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fkEZ0fcNZXpQucUeOnbh3MKM1IxWFLnNo5e0dR6CPrtbCf4h+1U7b0Mm1set69BQdDkdTXSFpfemWRNrsStavczL34ObPm/L6QSKofsKnh5mxMX1gZwZ44KkGbqZYGb0i3QzyF0bPfmi2U+iEKa6ubnzgQ3YssCcWcfds5ELdV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gmphMSzo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gmphMSzo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755973008; x=1787509008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wRmFNtnjYeGggV6iwySV3VFme1zwfvW4P20JP4OohVo=;
  b=gmphMSzo3CdVrQ+2rAMn62TN6QRpFkF63FwN1DnH89Wz6FZkuRP6s7jt
   wJOleBhd8kaf8YEimkZIcl+T8HMys14QD3g1abZJyWn5poWfQrYQJICRb
   RuzstNSZnIWDISG/P2E7vb9r0L7M7Kf7XVh9JsOjpNj4+yUKucnUR1/S2
   8lb28/fH/Rm8EoIE0V4yV0ITP+kV18ae7I8XnuAae3eAoCDnRMJRElNo7
   fsw0fXrDYB4ok0UkgW4Z2nwjU8mC6fg17GzAxaSuR0cjl5hy1KMl62aEm
   s4g/CrO8us4c7OvNRCuoResNPcf+qk5fXiMrk5N2xaHYMikmGDcPDpoqf
   g==;
X-CSE-ConnectionGUID: Ti5GhYoITwyGOwDN22ylMw==
X-CSE-MsgGUID: FjpfrdxdTtqmveM/MMotFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61887232"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61887232"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 11:16:47 -0700
X-CSE-ConnectionGUID: ST9W3ZxQT9eZBWKlIwBsdQ==
X-CSE-MsgGUID: AIRSy26rRUWcYZek9d7OFg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 23 Aug 2025 11:16:45 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upsnD-000MVL-1G;
	Sat, 23 Aug 2025 18:16:43 +0000
Date: Sun, 24 Aug 2025 02:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:alloc-token 1/1] drivers/misc/lkdtm/heap.c:118
 lkdtm_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32
 bit pointer)
Message-ID: <202508240214.w2jEHqvy-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git alloc-token
head:   9a3cdf4805f95fde6c6912608140fe432605bf8a
commit: 9a3cdf4805f95fde6c6912608140fe432605bf8a [1/1] slab: add support for type-based slab cache partitioning
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-141-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240214.w2jEHqvy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508240214.w2jEHqvy-lkp@intel.com/

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
