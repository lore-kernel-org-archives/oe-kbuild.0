Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F2B3128CC
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 06:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111415; cv=none; b=lzYPuKq7A6p3VSGTsUoG7zU4ZDw3MOrqimvuLy/gsKzQjWs/wUiN2v82ZKtx5qINsdhI0HY9b2WlAELLJNGo/cQ6XAn6J325Hgtt5nJA7NixguRyTQu/nfpHafAT2Nrayf+pY1+HVcBDXRnHREFm2pkv/ERY2ECEOainPewFfRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111415; c=relaxed/simple;
	bh=hbuuwSYw5Kedm6lDv6AEhD7kqvGGtl7t1xmoJKCW12A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VXNqxRkbe0StcaNesZHfRpB8u11voUou1DtDxL2edGyJ96GmWSTGvkXw2SUNXVMJIWnz7x958vog84uLCKBwpzGKEwPOeZQaWKoTEMa5RiPmMFCnX5VzbtvMIPkCqqKQqu/glIuWcP6aXWJ1hp0bTEn06se2Pgl6N65JXuuARpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHKpAIix; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHKpAIix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775111408; x=1806647408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hbuuwSYw5Kedm6lDv6AEhD7kqvGGtl7t1xmoJKCW12A=;
  b=SHKpAIix//xFXpkPERDI4dZQax22SUtqrKd9D93xQi7k30CpSrKLorTn
   jjnIQEozP2p2yG/tp4UdWvuea7t0sYnWwE+lgwp4P/0Hbnag6o8XXODw4
   BlMh05rq6UYahNiTJDdCiPKTTKcSx+avj7HPUcMPD6POpoRlNQOWJ9Afm
   T/fnLeyJsRsdjZss7wBBWrM1xolhKvxVn6oxdfHEMWFZXPIxbL/itDetq
   mQwFk/AjbwhiFjdhql9pzsDIrnnL67PfZmtWKcDwmkG/ueNOhQqmCYotf
   FcsbWzxdC7UdGNIM4g0RRZ2hvmSyUo4hdzPuJCc9jlC9zno+JjtPveMwQ
   g==;
X-CSE-ConnectionGUID: jX4DXerpRyWT4RMmziRBVA==
X-CSE-MsgGUID: gb3UHQV8TqeTaczIlwbUEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76179527"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="76179527"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 23:30:07 -0700
X-CSE-ConnectionGUID: 2EhpR3IDT3WYKR5KeFKI2w==
X-CSE-MsgGUID: N1krwneXSXuulR4wj2dOvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="249948272"
Received: from lkp-server02.sh.intel.com (HELO cedfeeed6c12) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Apr 2026 23:30:05 -0700
Received: from kbuild by cedfeeed6c12 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8BZ4-0000000001a-21tO;
	Thu, 02 Apr 2026 06:30:02 +0000
Date: Thu, 2 Apr 2026 14:24:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
Message-ID: <202604020400.jEq32K95-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="eabBYEV3iYFD53oW"
Content-Disposition: inline


--eabBYEV3iYFD53oW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260331111240.153913-1-elver@google.com>
References: <20260331111240.153913-1-elver@google.com>
TO: Marco Elver <elver@google.com>
TO: elver@google.com
TO: Vlastimil Babka <vbabka@kernel.org>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Nicolas Schier <nsc@kernel.org>
CC: Dennis Zhou <dennis@kernel.org>
CC: Tejun Heo <tj@kernel.org>
CC: Christoph Lameter <cl@linux-foundation.org>
CC: Harry Yoo <harry.yoo@oracle.com>
CC: Hao Li <hao.li@linux.dev>
CC: David Rientjes <rientjes@google.com>
CC: Roman Gushchin <roman.gushchin@linux.dev>
CC: Kees Cook <kees@kernel.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: David Hildenbrand <david@kernel.org>
CC: Lorenzo Stoakes <ljs@kernel.org>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: Mike Rapoport <rppt@kernel.org>
CC: Suren Baghdasaryan <surenb@google.com>
CC: Michal Hocko <mhocko@suse.com>
CC: Alexander Potapenko <glider@google.com>
CC: Dmitry Vyukov <dvyukov@google.com>
CC: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
CC: Bill Wendling <morbo@google.com>
CC: Justin Stitt <justinstitt@google.com>
CC: linux-kbuild@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-hardening@vger.kernel.org
CC: kasan-dev@googlegroups.com

Hi Marco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on kees/for-next/hardening linus/master v7.0-rc6 next-20260331]
[cannot apply to vbabka-slab/for-next vbabka/slab-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Elver/slab-support-for-compiler-assisted-type-based-slab-cache-partitioning/20260401-035608
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260331111240.153913-1-elver%40google.com
patch subject: [PATCH v1] slab: support for compiler-assisted type-based slab cache partitioning
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: um-randconfig-r072-20260401
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604020400.jEq32K95-lkp@intel.com/

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--eabBYEV3iYFD53oW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/um 7.0.0-rc5 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-14 (Debian 14.2.0-19) 14.2.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=140200
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=24400
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=24400
CONFIG_LLD_VERSION=0
CONFIG_RUSTC_VERSION=0
CONFIG_RUSTC_LLVM_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_ASSUME=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_LD_CAN_USE_KEEP_IN_OVERLAY=y
CONFIG_PAHOLE_VERSION=131
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=128
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_WATCH_QUEUE=y
# CONFIG_CROSS_MEMORY_ATTACH is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
CONFIG_IRQ_KUNIT_TEST=y
# end of IRQ subsystem

CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_TIME_KUNIT_TEST=m
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ=y
# CONFIG_HIGH_RES_TIMERS is not set
CONFIG_POSIX_AUX_CLOCKS=y
# end of Timers subsystem

CONFIG_BPF=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# end of BPF subsystem

CONFIG_PREEMPT_BUILD=y
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTION=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_PSI=y
CONFIG_PSI_DEFAULT_DISABLED=y
# end of CPU/Task time and stats accounting

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_PREEMPT_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_NEED_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
# end of RCU Subsystem

CONFIG_IKCONFIG=m
# CONFIG_IKCONFIG_PROC is not set
CONFIG_IKHEADERS=m
CONFIG_LOG_BUF_SHIFT=17
CONFIG_PRINTK_INDEX=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC10_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_GCC_NO_STRINGOP_OVERFLOW=y
CONFIG_CC_NO_STRINGOP_OVERFLOW=y
# CONFIG_CGROUPS is not set
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
CONFIG_IPC_NS=y
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
# CONFIG_RD_BZIP2 is not set
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
# CONFIG_RD_LZO is not set
# CONFIG_RD_LZ4 is not set
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
CONFIG_BOOT_CONFIG_FORCE=y
CONFIG_BOOT_CONFIG_EMBED=y
CONFIG_BOOT_CONFIG_EMBED_FILE=""
CONFIG_CMDLINE_LOG_WRAP_IDEAL_LEN=1021
CONFIG_INITRAMFS_PRESERVE_MTIME=y
# CONFIG_INITRAMFS_TEST is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
# CONFIG_SYSFS_SYSCALL is not set
# CONFIG_EXPERT is not set
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_PRINTK_RINGBUFFER_KUNIT_TEST=m
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_FUTEX_PRIVATE_HASH=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_GCOV_PROFILE_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_CACHESTAT_SYSCALL=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
# CONFIG_KALLSYMS_LINEINFO is not set

#
# Kernel Performance Events And Counters
#
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
# CONFIG_PROFILING is not set

#
# Kexec and crash features
#
CONFIG_VMCORE_INFO=y
# end of Kexec and crash features

#
# Live Update and Kexec HandOver
#
# end of Live Update and Kexec HandOver
# end of General setup

#
# UML-specific options
#
CONFIG_UML=y
CONFIG_MMU=y
CONFIG_UML_DMA_EMULATION=y
CONFIG_UML_IOMEM_EMULATION=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_HZ=100
CONFIG_UML_SUBARCH_SUPPORTS_SMP=y
# CONFIG_SMP is not set
CONFIG_NR_CPUS_RANGE_BEGIN=1
CONFIG_NR_CPUS_RANGE_END=1
CONFIG_NR_CPUS_DEFAULT=1
CONFIG_NR_CPUS=1

#
# Host processor type and features
#
CONFIG_CC_HAS_MARCH_NATIVE=y
# CONFIG_X86_NATIVE_CPU is not set
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_HAVE_PAE=y
CONFIG_X86_CX8=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_BROADCAST_TLB_FLUSH=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
# end of Host processor type and features

CONFIG_UML_X86=y
CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_GENERIC_HWEIGHT=y
# CONFIG_STATIC_LINK is not set
CONFIG_LD_SCRIPT_DYN=y
CONFIG_LD_SCRIPT_DYN_RPATH=y
CONFIG_HOSTFS=m
# CONFIG_MCONSOLE is not set
CONFIG_KERNEL_STACK_ORDER=2
CONFIG_PGTABLE_LEVELS=4
CONFIG_UML_TIME_TRAVEL_SUPPORT=y
CONFIG_UML_MAX_USERSPACE_ITERATIONS=10000
CONFIG_KASAN_SHADOW_OFFSET=0x100000000000
# end of UML-specific options

#
# UML Character Devices
#
# CONFIG_STDERR_CONSOLE is not set
# CONFIG_SSL is not set
CONFIG_NULL_CHAN=y
# CONFIG_PORT_CHAN is not set
CONFIG_PTY_CHAN=y
CONFIG_TTY_CHAN=y
# CONFIG_XTERM_CHAN is not set
CONFIG_NOCONFIG_CHAN=y
CONFIG_CON_ZERO_CHAN="fd:0,fd:1"
CONFIG_CON_CHAN="xterm"
CONFIG_SSL_CHAN="pty"
CONFIG_UML_SOUND=m
# end of UML Character Devices

# CONFIG_VIRTIO_UML is not set
CONFIG_UML_PCI=y
CONFIG_UML_PCI_OVER_VFIO=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y

#
# Power management options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_PM_SLEEP=y
# CONFIG_PM_AUTOSLEEP is not set
CONFIG_PM_USERSPACE_AUTOSLEEP=y
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
CONFIG_PM_SLEEP_DEBUG=y
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_ENERGY_MODEL=y
# end of Power management options

CONFIG_CPU_MITIGATIONS=y

#
# General architecture-dependent options
#
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_CPU_FINALIZE_INIT=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_RUST=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_LAZY_TLB_REFCOUNT=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_PAGE_SIZE_4KB=y
CONFIG_PAGE_SIZE_4KB=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_PAGE_SHIFT=12
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
# CONFIG_LOCK_EVENT_COUNTS is not set

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
CONFIG_FUNCTION_ALIGNMENT=0
CONFIG_CC_HAS_MIN_FUNCTION_ALIGNMENT=y
CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_DEBUGFS=y
CONFIG_MODULE_DEBUG=y
CONFIG_MODULE_STATS=y
# CONFIG_MODULE_DEBUG_AUTOLOAD_DUPS is not set
CONFIG_MODULE_FORCE_LOAD=y
# CONFIG_MODULE_UNLOAD is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
# CONFIG_MODULE_SIG_ALL is not set
# CONFIG_MODULE_SIG_SHA256 is not set
# CONFIG_MODULE_SIG_SHA384 is not set
CONFIG_MODULE_SIG_SHA512=y
# CONFIG_MODULE_SIG_SHA3_256 is not set
# CONFIG_MODULE_SIG_SHA3_384 is not set
# CONFIG_MODULE_SIG_SHA3_512 is not set
CONFIG_MODULE_SIG_HASH="sha512"
CONFIG_MODULE_COMPRESS=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
CONFIG_MODULE_COMPRESS_ZSTD=y
# CONFIG_MODULE_COMPRESS_ALL is not set
CONFIG_MODULE_DECOMPRESS=y
CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_TRIM_UNUSED_KSYMS=y
CONFIG_UNUSED_KSYMS_WHITELIST=""
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
# CONFIG_BLK_DEV_WRITE_MOUNTED is not set
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_WBT=y
# CONFIG_BLK_WBT_MQ is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_SED_OPAL=y
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=m
CONFIG_MQ_IOSCHED_KYBER=m
CONFIG_IOSCHED_BFQ=m
# end of IO Schedulers

CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_FREEZER=y

#
# Executable file formats
#
# CONFIG_BINFMT_ELF is not set
CONFIG_BINFMT_SCRIPT=m
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
CONFIG_EXEC_KUNIT_TEST=y
# end of Executable file formats

#
# Memory Management options
#
# CONFIG_SWAP is not set

#
# Slab allocator options
#
CONFIG_SLUB=y
CONFIG_KVFREE_RCU_BATCHED=y
# CONFIG_SLAB_MERGE_DEFAULT is not set
# CONFIG_SLAB_FREELIST_RANDOM is not set
CONFIG_SLAB_FREELIST_HARDENED=y
# CONFIG_SLAB_BUCKETS is not set
CONFIG_SLUB_STATS=y
# CONFIG_PARTITION_KMALLOC_CACHES is not set
# end of Slab allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_COMPAT_BRK=y
CONFIG_FLATMEM=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_BALLOON=y
# CONFIG_BALLOON_MIGRATION is not set
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PCP_BATCH_SCALE_MAX=5
CONFIG_PHYS_ADDR_T_64BIT=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_PAGE_MAPCOUNT=y
CONFIG_NEED_PER_CPU_KM=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=8
CONFIG_PAGE_BLOCK_MAX_ORDER=10
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
CONFIG_GUP_TEST=y
# CONFIG_DMAPOOL_TEST is not set
CONFIG_ANON_VMA_NAME=y
# CONFIG_USERFAULTFD is not set
# CONFIG_LRU_GEN is not set
CONFIG_EXECMEM=y
CONFIG_PT_RECLAIM=y

#
# Data Access Monitoring
#
CONFIG_DAMON=y
# CONFIG_DAMON_DEBUG_SANITY is not set
# CONFIG_DAMON_KUNIT_TEST is not set
# CONFIG_DAMON_VADDR is not set
# CONFIG_DAMON_PADDR is not set
CONFIG_DAMON_SYSFS=y
# CONFIG_DAMON_SYSFS_KUNIT_TEST is not set
# end of Data Access Monitoring
# end of Memory Management options

# CONFIG_NET is not set

#
# Device Drivers
#
CONFIG_HAVE_PCI=y
CONFIG_FORCE_PCI=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_PCI=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCIEASPM=y
# CONFIG_PCIEASPM_DEFAULT is not set
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
CONFIG_PCIEASPM_PERFORMANCE=y
# CONFIG_PCIE_PTM is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_QUIRKS=y
CONFIG_PCI_DEBUG=y
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=m
# CONFIG_PCI_PF_STUB is not set
CONFIG_PCI_ATS=y
CONFIG_PCI_IDE=y
CONFIG_PCI_TSM=y
CONFIG_PCI_DOE=y
CONFIG_PCI_ECAM=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_NPEM=y
# CONFIG_PCI_PRI is not set
CONFIG_PCI_PASID=y
# CONFIG_PCIE_TPH is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_CPCI=y
# CONFIG_HOTPLUG_PCI_OCTEONEP is not set
# CONFIG_HOTPLUG_PCI_SHPC is not set

#
# PCI controller drivers
#
CONFIG_PCI_HOST_COMMON=y
# CONFIG_PCIE_ALTERA is not set
# CONFIG_PCI_VERSATILE is not set
# CONFIG_PCIE_MEDIATEK_GEN3 is not set
# CONFIG_PCIE_MT7621 is not set
# CONFIG_PCI_TEGRA is not set
# CONFIG_PCIE_RCAR_EP is not set
# CONFIG_PCI_RCAR_GEN2 is not set
# CONFIG_PCIE_RENESAS_RZG3S_HOST is not set
# CONFIG_PCIE_XILINX_DMA_PL is not set
# CONFIG_PCIE_XILINX_NWL is not set
# CONFIG_PCIE_XILINX_CPM is not set

#
# Cadence-based PCIe controllers
#
# end of Cadence-based PCIe controllers

#
# DesignWare-based PCIe controllers
#
CONFIG_PCIE_DW=y
CONFIG_PCIE_DW_DEBUGFS=y
CONFIG_PCIE_DW_HOST=y
CONFIG_PCIE_DW_EP=y
# CONFIG_PCI_MESON is not set
# CONFIG_PCIE_ARTPEC6_HOST is not set
# CONFIG_PCIE_ARTPEC6_EP is not set
# CONFIG_PCIE_BT1 is not set
# CONFIG_PCI_IMX6_HOST is not set
# CONFIG_PCI_IMX6_EP is not set
# CONFIG_PCIE_HISI_STB is not set
# CONFIG_PCIE_KEEMBAY_HOST is not set
# CONFIG_PCIE_KEEMBAY_EP is not set
# CONFIG_PCIE_ARMADA_8K is not set
# CONFIG_PCIE_TEGRA194_HOST is not set
# CONFIG_PCIE_TEGRA194_EP is not set
# CONFIG_PCIE_NXP_S32G is not set
CONFIG_PCIE_DW_PLAT=y
CONFIG_PCIE_DW_PLAT_HOST=y
CONFIG_PCIE_DW_PLAT_EP=y
# CONFIG_PCIE_RCAR_GEN4_HOST is not set
# CONFIG_PCIE_RCAR_GEN4_EP is not set
# CONFIG_PCI_EXYNOS is not set
# CONFIG_PCIE_FU740 is not set
# CONFIG_PCIE_SPACEMIT_K1 is not set
# CONFIG_PCIE_SPEAR13XX is not set
# CONFIG_PCIE_STM32_HOST is not set
# CONFIG_PCIE_STM32_EP is not set
# CONFIG_PCI_KEYSTONE_HOST is not set
# CONFIG_PCI_KEYSTONE_EP is not set
# CONFIG_PCIE_VISCONTI_HOST is not set
# end of DesignWare-based PCIe controllers

#
# Mobiveil-based PCIe controllers
#
# CONFIG_PCIE_LAYERSCAPE_GEN4 is not set
# end of Mobiveil-based PCIe controllers

#
# PLDA-based PCIe controllers
#
# end of PLDA-based PCIe controllers
# end of PCI controller drivers

#
# PCI Endpoint
#
CONFIG_PCI_ENDPOINT=y
# CONFIG_PCI_ENDPOINT_CONFIGFS is not set
# CONFIG_PCI_ENDPOINT_MSI_DOORBELL is not set
# CONFIG_PCI_EPF_TEST is not set
# CONFIG_PCI_EPF_NTB is not set
# CONFIG_PCI_EPF_VNTB is not set
# CONFIG_PCI_EPF_MHI is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=y
# end of PCI switch controller drivers

# CONFIG_PCI_PWRCTRL_SLOT is not set
# CONFIG_PCI_PWRCTRL_TC9563 is not set
CONFIG_CXL_BUS=y
CONFIG_CXL_PCI=m
CONFIG_CXL_MEM_RAW_COMMANDS=y
CONFIG_CXL_MEM=m
# CONFIG_CXL_FEATURES is not set
CONFIG_CXL_PORT=y
CONFIG_CXL_SUSPEND=y
CONFIG_PCCARD=y
CONFIG_PCMCIA=y
# CONFIG_PCMCIA_LOAD_CIS is not set
# CONFIG_CARDBUS is not set

#
# PC-card bridges
#
# CONFIG_YENTA is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_DEVTMPFS_SAFE is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEBUG_DRIVER=y
# CONFIG_DEBUG_DEVRES is not set
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
# CONFIG_PM_QOS_KUNIT_TEST is not set
CONFIG_PM_RUNTIME_KUNIT_TEST=m
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_DM_KUNIT_TEST=m
CONFIG_DRIVER_PE_KUNIT_TEST=m
CONFIG_GENERIC_CPU_DEVICES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_KUNIT=y
CONFIG_REGMAP_BUILD=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_SPMI=m
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_RAM=y
CONFIG_REGMAP_SPI_AVMM=m
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_ARM_INTEGRATOR_LM is not set
# CONFIG_BT1_APB is not set
# CONFIG_BT1_AXI is not set
# CONFIG_IMX_WEIM is not set
# CONFIG_INTEL_IXP4XX_EB is not set
# CONFIG_OMAP_OCP2SCP is not set
# CONFIG_QCOM_EBI2 is not set
CONFIG_MHI_BUS=y
# CONFIG_MHI_BUS_DEBUG is not set
CONFIG_MHI_BUS_PCI_GENERIC=m
CONFIG_MHI_BUS_EP=m
# end of Bus devices

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# CONFIG_ARM_SCMI_PROTOCOL is not set
# end of ARM System Control and Management Interface Protocol

# CONFIG_ARM_SCPI_PROTOCOL is not set
# CONFIG_TH1520_AON_PROTOCOL is not set
# CONFIG_BCM47XX_NVRAM is not set
CONFIG_FW_CS_DSP=m
# CONFIG_FW_CS_DSP_KUNIT_TEST is not set
CONFIG_GOOGLE_FIRMWARE=y
# CONFIG_IMX_SCMI_CPU_DRV is not set
# CONFIG_IMX_SCMI_LMM_DRV is not set
# CONFIG_IMX_SCMI_MISC_DRV is not set

#
# Qualcomm firmware drivers
#
# end of Qualcomm firmware drivers

# CONFIG_EXYNOS_ACPM_PROTOCOL is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_FWCTL is not set
CONFIG_GNSS=y
CONFIG_GNSS_SERIAL=m
CONFIG_GNSS_MTK_SERIAL=m
CONFIG_GNSS_SIRF_SERIAL=m
# CONFIG_GNSS_UBX_SERIAL is not set
# CONFIG_GNSS_USB is not set
CONFIG_MTD=m
# CONFIG_MTD_TESTS is not set

#
# Partition parsers
#
# CONFIG_MTD_BCM63XX_PARTS is not set
# CONFIG_MTD_BRCM_U_BOOT is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
# CONFIG_MTD_PARSER_IMAGETAG is not set
# CONFIG_MTD_PARSER_TPLINK_SAFELOADER is not set
# CONFIG_MTD_PARSER_TRX is not set
# CONFIG_MTD_SHARPSL_PARTS is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=m
CONFIG_MTD_BLOCK=m
CONFIG_MTD_BLOCK_RO=m

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
# CONFIG_FTL is not set
CONFIG_NFTL=m
CONFIG_NFTL_RW=y
CONFIG_INFTL=m
CONFIG_RFD_FTL=m
CONFIG_SSFDC=m
CONFIG_SM_FTL=m
CONFIG_MTD_OOPS=m
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=m
CONFIG_MTD_JEDECPROBE=m
CONFIG_MTD_GEN_PROBE=m
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=m
CONFIG_MTD_CFI_STAA=m
CONFIG_MTD_CFI_UTIL=m
CONFIG_MTD_RAM=m
# CONFIG_MTD_ROM is not set
CONFIG_MTD_ABSENT=m
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=m
CONFIG_MTD_PHYSMAP_COMPAT=y
CONFIG_MTD_PHYSMAP_START=0x8000000
CONFIG_MTD_PHYSMAP_LEN=0
CONFIG_MTD_PHYSMAP_BANKWIDTH=2
# CONFIG_MTD_PHYSMAP_GPIO_ADDR is not set
# CONFIG_MTD_SC520CDP is not set
# CONFIG_MTD_NETSC520 is not set
# CONFIG_MTD_TS5500 is not set
CONFIG_MTD_PCI=m
# CONFIG_MTD_PCMCIA is not set
# CONFIG_MTD_PLATRAM is not set
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_PMC551=m
CONFIG_MTD_PMC551_BUGFIX=y
CONFIG_MTD_PMC551_DEBUG=y
CONFIG_MTD_DATAFLASH=m
# CONFIG_MTD_DATAFLASH_WRITE_VERIFY is not set
# CONFIG_MTD_DATAFLASH_OTP is not set
CONFIG_MTD_MCHP23K256=m
# CONFIG_MTD_MCHP48L640 is not set
# CONFIG_MTD_SPEAR_SMI is not set
CONFIG_MTD_SST25L=m
CONFIG_MTD_SLRAM=m
# CONFIG_MTD_PHRAM is not set
CONFIG_MTD_MTDRAM=m
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128
# CONFIG_MTD_BLOCK2MTD is not set
# CONFIG_MTD_INTEL_DG is not set

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=m
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=m
CONFIG_MTD_ONENAND=m
# CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
# CONFIG_MTD_ONENAND_GENERIC is not set
# CONFIG_MTD_ONENAND_SAMSUNG is not set
# CONFIG_MTD_ONENAND_OTP is not set
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
# CONFIG_MTD_RAW_NAND is not set
CONFIG_MTD_SPI_NAND=m

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
# CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
CONFIG_MTD_NAND_ECC_MXIC=y
# CONFIG_MTD_NAND_ECC_MEDIATEK is not set
# CONFIG_MTD_NAND_ECC_REALTEK is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=m
CONFIG_MTD_QINFO_PROBE=m
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_SPI_NOR=m
CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=y
# CONFIG_MTD_SPI_NOR_SWP_DISABLE is not set
CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE=y
# CONFIG_MTD_SPI_NOR_SWP_KEEP is not set
# CONFIG_SPI_HISI_SFC is not set
CONFIG_MTD_UBI=m
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
# CONFIG_MTD_UBI_FASTMAP is not set
CONFIG_MTD_UBI_GLUEBI=m
CONFIG_MTD_UBI_BLOCK=y
CONFIG_MTD_UBI_NVMEM=m
CONFIG_MTD_HYPERBUS=m
# CONFIG_HBMC_AM654 is not set
CONFIG_DTC=y
# CONFIG_OF is not set
# CONFIG_PARPORT is not set
# CONFIG_BLK_DEV is not set

#
# NVME Support
#
CONFIG_NVME_KEYRING=y
CONFIG_NVME_AUTH=y
CONFIG_NVME_CORE=y
# CONFIG_BLK_DEV_NVME is not set
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_VERBOSE_ERRORS is not set
CONFIG_NVME_FABRICS=y
CONFIG_NVME_FC=y
CONFIG_NVME_HOST_AUTH=y
CONFIG_NVME_TARGET=m
# CONFIG_NVME_TARGET_DEBUGFS is not set
CONFIG_NVME_TARGET_PASSTHRU=y
CONFIG_NVME_TARGET_LOOP=m
# CONFIG_NVME_TARGET_FC is not set
# CONFIG_NVME_TARGET_AUTH is not set
# CONFIG_NVME_TARGET_PCI_EPF is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
CONFIG_AD525X_DPOT_SPI=m
# CONFIG_DUMMY_IRQ is not set
# CONFIG_PHANTOM is not set
CONFIG_RPMB=y
CONFIG_TI_FPC202=y
CONFIG_TIFM_CORE=y
CONFIG_TIFM_7XX1=y
CONFIG_ICS932S401=m
# CONFIG_ATMEL_SSC is not set
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_SMPRO_ERRMON is not set
CONFIG_SMPRO_MISC=m
# CONFIG_GEHC_ACHC is not set
CONFIG_HP_ILO=y
# CONFIG_QCOM_COINCELL is not set
# CONFIG_QCOM_FASTRPC is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=y
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=y
# CONFIG_DS1682 is not set
# CONFIG_PCH_PHUB is not set
# CONFIG_LATTICE_ECP3_CONFIG is not set
CONFIG_SRAM=y
CONFIG_DW_XDATA_PCIE=y
CONFIG_PCI_ENDPOINT_TEST=m
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=y
# CONFIG_HISI_HIKEY_USB is not set
CONFIG_NTSYNC=m
CONFIG_TPS6594_ESM=m
# CONFIG_TPS6594_PFSM is not set
# CONFIG_NSM is not set
# CONFIG_MARVELL_CN10K_DPI is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_MAX6875=y
# CONFIG_EEPROM_93CX6 is not set
CONFIG_EEPROM_93XX46=m
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# CONFIG_EEPROM_M24LR is not set
# end of EEPROM support

CONFIG_CB710_CORE=y
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y
CONFIG_SENSORS_LIS3_SPI=y
CONFIG_SENSORS_LIS3_I2C=m
CONFIG_ALTERA_STAPL=y
CONFIG_INTEL_MEI=y
CONFIG_INTEL_MEI_ME=y
CONFIG_INTEL_MEI_TXE=m
# CONFIG_INTEL_MEI_GSC is not set
# CONFIG_INTEL_MEI_LB is not set
# CONFIG_INTEL_MEI_HDCP is not set
# CONFIG_INTEL_MEI_PXP is not set
# CONFIG_INTEL_MEI_GSC_PROXY is not set
CONFIG_GENWQE=y
CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=0
# CONFIG_BCM_VK is not set
CONFIG_MISC_ALCOR_PCI=m
CONFIG_MISC_RTSX_PCI=y
# CONFIG_MISC_RTSX_USB is not set
CONFIG_UACCE=m
CONFIG_PVPANIC=y
CONFIG_PVPANIC_PCI=m
CONFIG_GP_PCI1XXXX=y
CONFIG_KEBA_CP500=m
CONFIG_KEBA_LAN9252=m
# CONFIG_AMD_SBRMI_I2C is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_PROC_FS=y
CONFIG_SCSI_LIB_KUNIT_TEST=m

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=y
CONFIG_CHR_DEV_SG=y
# CONFIG_BLK_DEV_BSG is not set
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
CONFIG_SCSI_CONSTANTS=y
# CONFIG_SCSI_LOGGING is not set
CONFIG_SCSI_SCAN_ASYNC=y
# CONFIG_SCSI_PROTO_TEST is not set

#
# SCSI Transports
#
# CONFIG_SCSI_SPI_ATTRS is not set
# CONFIG_SCSI_SAS_ATTRS is not set
# CONFIG_SCSI_SAS_LIBSAS is not set
# CONFIG_SCSI_SRP_ATTRS is not set
# end of SCSI Transports

# CONFIG_SCSI_LOWLEVEL is not set
# CONFIG_SCSI_DH is not set
# end of SCSI device support

CONFIG_ATA=y
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
# CONFIG_ATA_VERBOSE_ERROR is not set
CONFIG_ATA_FORCE=y
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=3
# CONFIG_SATA_AHCI_PLATFORM is not set
# CONFIG_AHCI_BRCM is not set
# CONFIG_AHCI_DA850 is not set
# CONFIG_AHCI_DM816 is not set
CONFIG_AHCI_DWC=y
# CONFIG_AHCI_ST is not set
# CONFIG_AHCI_IMX is not set
# CONFIG_AHCI_MTK is not set
# CONFIG_AHCI_MVEBU is not set
# CONFIG_AHCI_SUNXI is not set
# CONFIG_AHCI_TEGRA is not set
# CONFIG_AHCI_XGENE is not set
# CONFIG_SATA_FSL is not set
# CONFIG_SATA_GEMINI is not set
# CONFIG_SATA_AHCI_SEATTLE is not set
CONFIG_SATA_INIC162X=m
# CONFIG_SATA_ACARD_AHCI is not set
CONFIG_SATA_SIL24=y
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
CONFIG_PDC_ADMA=m
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
# CONFIG_ATA_BMDMA is not set

#
# PIO-only SFF controllers
#
CONFIG_PATA_CMD640_PCI=m
# CONFIG_PATA_IXP4XX_CF is not set
CONFIG_PATA_MPIIX=m
CONFIG_PATA_NS87410=y
# CONFIG_PATA_OPTI is not set
CONFIG_PATA_PCMCIA=y
CONFIG_PATA_RZ1000=y

#
# Generic fallback / legacy drivers
#
# CONFIG_MD is not set
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
# CONFIG_TCM_FILEIO is not set
CONFIG_TCM_PSCSI=m
# CONFIG_LOOPBACK_TARGET is not set
CONFIG_SBP_TARGET=m
CONFIG_REMOTE_TARGET=m

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
CONFIG_FIREWIRE_KUNIT_UAPI_TEST=m
CONFIG_FIREWIRE_KUNIT_DEVICE_ATTRIBUTE_TEST=m
# CONFIG_FIREWIRE_KUNIT_PACKET_SERDES_TEST is not set
CONFIG_FIREWIRE_KUNIT_SELF_ID_SEQUENCE_HELPER_TEST=m
# CONFIG_FIREWIRE_OHCI is not set
# CONFIG_FIREWIRE_KUNIT_OHCI_SERDES_TEST is not set
# CONFIG_FIREWIRE_SBP2 is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=m
CONFIG_INPUT_FF_MEMLESS=y
# CONFIG_INPUT_SPARSEKMAP is not set
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_KUNIT_TEST=m

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
CONFIG_INPUT_MOUSE=y
# CONFIG_MOUSE_PS2 is not set
# CONFIG_MOUSE_SERIAL is not set
CONFIG_MOUSE_APPLETOUCH=y
# CONFIG_MOUSE_BCM5974 is not set
# CONFIG_MOUSE_CYAPA is not set
# CONFIG_MOUSE_ELAN_I2C is not set
# CONFIG_MOUSE_VSXXXAA is not set
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=y
CONFIG_MOUSE_SYNAPTICS_USB=m
# CONFIG_INPUT_TABLET is not set
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_ADS7846=m
# CONFIG_TOUCHSCREEN_AD7877 is not set
CONFIG_TOUCHSCREEN_AD7879=y
CONFIG_TOUCHSCREEN_AD7879_I2C=m
CONFIG_TOUCHSCREEN_AD7879_SPI=y
CONFIG_TOUCHSCREEN_ADC=m
# CONFIG_TOUCHSCREEN_APPLE_Z2 is not set
CONFIG_TOUCHSCREEN_ATMEL_MXT=m
# CONFIG_TOUCHSCREEN_ATMEL_MXT_T37 is not set
# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
# CONFIG_TOUCHSCREEN_BU21013 is not set
# CONFIG_TOUCHSCREEN_BU21029 is not set
# CONFIG_TOUCHSCREEN_CY8CTMA140 is not set
CONFIG_TOUCHSCREEN_CY8CTMG110=m
CONFIG_TOUCHSCREEN_CYTTSP_CORE=y
CONFIG_TOUCHSCREEN_CYTTSP_I2C=y
CONFIG_TOUCHSCREEN_CYTTSP_SPI=m
CONFIG_TOUCHSCREEN_CYTTSP5=m
CONFIG_TOUCHSCREEN_DA9052=y
# CONFIG_TOUCHSCREEN_DYNAPRO is not set
CONFIG_TOUCHSCREEN_HAMPSHIRE=m
CONFIG_TOUCHSCREEN_EETI=y
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=m
CONFIG_TOUCHSCREEN_EXC3000=y
# CONFIG_TOUCHSCREEN_FUJITSU is not set
# CONFIG_TOUCHSCREEN_GOODIX is not set
CONFIG_TOUCHSCREEN_GOODIX_BERLIN_CORE=y
CONFIG_TOUCHSCREEN_GOODIX_BERLIN_I2C=m
CONFIG_TOUCHSCREEN_GOODIX_BERLIN_SPI=y
# CONFIG_TOUCHSCREEN_HIDEEP is not set
CONFIG_TOUCHSCREEN_HIMAX_HX852X=y
CONFIG_TOUCHSCREEN_HYCON_HY46XX=m
CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX=m
# CONFIG_TOUCHSCREEN_HYNITRON_CST816X is not set
# CONFIG_TOUCHSCREEN_ILI210X is not set
# CONFIG_TOUCHSCREEN_ILITEK is not set
# CONFIG_TOUCHSCREEN_IPROC is not set
# CONFIG_TOUCHSCREEN_S6SY761 is not set
CONFIG_TOUCHSCREEN_GUNZE=y
CONFIG_TOUCHSCREEN_EKTF2127=m
CONFIG_TOUCHSCREEN_ELAN=m
# CONFIG_TOUCHSCREEN_ELO is not set
CONFIG_TOUCHSCREEN_WACOM_W8001=m
CONFIG_TOUCHSCREEN_WACOM_I2C=m
# CONFIG_TOUCHSCREEN_MAX11801 is not set
# CONFIG_TOUCHSCREEN_MMS114 is not set
# CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
CONFIG_TOUCHSCREEN_MSG2638=m
CONFIG_TOUCHSCREEN_MTOUCH=m
CONFIG_TOUCHSCREEN_NOVATEK_NVT_TS=y
CONFIG_TOUCHSCREEN_IMAGIS=y
# CONFIG_TOUCHSCREEN_IMX6UL_TSC is not set
# CONFIG_TOUCHSCREEN_INEXIO is not set
CONFIG_TOUCHSCREEN_PENMOUNT=y
# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
# CONFIG_TOUCHSCREEN_RASPBERRYPI_FW is not set
# CONFIG_TOUCHSCREEN_MIGOR is not set
CONFIG_TOUCHSCREEN_TOUCHRIGHT=y
# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
# CONFIG_TOUCHSCREEN_PIXCIR is not set
# CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
# CONFIG_TOUCHSCREEN_WM831X is not set
CONFIG_TOUCHSCREEN_USB_COMPOSITE=y
CONFIG_TOUCHSCREEN_MC13783=y
CONFIG_TOUCHSCREEN_USB_EGALAX=y
CONFIG_TOUCHSCREEN_USB_PANJIT=y
CONFIG_TOUCHSCREEN_USB_3M=y
CONFIG_TOUCHSCREEN_USB_ITM=y
CONFIG_TOUCHSCREEN_USB_ETURBO=y
CONFIG_TOUCHSCREEN_USB_GUNZE=y
CONFIG_TOUCHSCREEN_USB_DMC_TSC10=y
CONFIG_TOUCHSCREEN_USB_IRTOUCH=y
CONFIG_TOUCHSCREEN_USB_IDEALTEK=y
CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=y
CONFIG_TOUCHSCREEN_USB_GOTOP=y
CONFIG_TOUCHSCREEN_USB_JASTEC=y
CONFIG_TOUCHSCREEN_USB_ELO=y
CONFIG_TOUCHSCREEN_USB_E2I=y
CONFIG_TOUCHSCREEN_USB_ZYTRONIC=y
CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=y
CONFIG_TOUCHSCREEN_USB_NEXIO=y
CONFIG_TOUCHSCREEN_USB_EASYTOUCH=y
CONFIG_TOUCHSCREEN_TOUCHIT213=m
# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
CONFIG_TOUCHSCREEN_TSC200X_CORE=m
CONFIG_TOUCHSCREEN_TSC2004=m
# CONFIG_TOUCHSCREEN_TSC2005 is not set
CONFIG_TOUCHSCREEN_TSC2007=y
CONFIG_TOUCHSCREEN_PCAP=m
# CONFIG_TOUCHSCREEN_RM_TS is not set
# CONFIG_TOUCHSCREEN_SILEAD is not set
# CONFIG_TOUCHSCREEN_SIS_I2C is not set
CONFIG_TOUCHSCREEN_ST1232=y
CONFIG_TOUCHSCREEN_STMFTS=m
# CONFIG_TOUCHSCREEN_SUN4I is not set
# CONFIG_TOUCHSCREEN_SURFACE3_SPI is not set
CONFIG_TOUCHSCREEN_SX8654=m
CONFIG_TOUCHSCREEN_TPS6507X=m
# CONFIG_TOUCHSCREEN_ZET6223 is not set
# CONFIG_TOUCHSCREEN_ZFORCE is not set
# CONFIG_TOUCHSCREEN_COLIBRI_VF50 is not set
# CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
CONFIG_TOUCHSCREEN_IQS5XX=m
# CONFIG_TOUCHSCREEN_IQS7211 is not set
CONFIG_TOUCHSCREEN_ZINITIX=y
# CONFIG_TOUCHSCREEN_HIMAX_HX83112B is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
# CONFIG_RMI4_SMB is not set
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
# CONFIG_RMI4_F11 is not set
# CONFIG_RMI4_F12 is not set
# CONFIG_RMI4_F1A is not set
# CONFIG_RMI4_F21 is not set
# CONFIG_RMI4_F30 is not set
# CONFIG_RMI4_F34 is not set
CONFIG_RMI4_F3A=y
# CONFIG_RMI4_F54 is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_LIBPS2=m
CONFIG_SERIO_RAW=m
# CONFIG_SERIO_ALTERA_PS2 is not set
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
# CONFIG_SERIO_OLPC_APSP is not set
# CONFIG_SERIO_SUN4I_PS2 is not set
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=m
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_LEGACY_TIOCSTI=y
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
# CONFIG_SERIAL_8250 is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_AMBA_PL010 is not set
# CONFIG_SERIAL_ATMEL is not set
# CONFIG_SERIAL_MESON is not set
# CONFIG_SERIAL_CLPS711X is not set
# CONFIG_SERIAL_SAMSUNG is not set
# CONFIG_SERIAL_TEGRA is not set
# CONFIG_SERIAL_TEGRA_TCU is not set
# CONFIG_SERIAL_TEGRA_UTC is not set
CONFIG_SERIAL_MAX3100=m
CONFIG_SERIAL_MAX310X=m
# CONFIG_SERIAL_IMX is not set
CONFIG_SERIAL_UARTLITE=m
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
# CONFIG_SERIAL_SH_SCI is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_ICOM is not set
# CONFIG_SERIAL_MSM is not set
# CONFIG_SERIAL_VT8500 is not set
# CONFIG_SERIAL_OMAP is not set
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_TIMBERDALE is not set
# CONFIG_SERIAL_BCM63XX is not set
CONFIG_SERIAL_ALTERA_JTAGUART=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
CONFIG_SERIAL_ALTERA_UART_CONSOLE=y
# CONFIG_SERIAL_PCH_UART is not set
# CONFIG_SERIAL_MXS_AUART is not set
# CONFIG_SERIAL_MPS2_UART is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
CONFIG_SERIAL_RP2=y
CONFIG_SERIAL_RP2_NR_UARTS=32
# CONFIG_SERIAL_FSL_LPUART is not set
CONFIG_SERIAL_FSL_LINFLEXUART=m
# CONFIG_SERIAL_ST_ASC is not set
CONFIG_SERIAL_MEN_Z135=m
CONFIG_SERIAL_SPRD=y
# CONFIG_SERIAL_SPRD_CONSOLE is not set
# CONFIG_SERIAL_STM32 is not set
# CONFIG_SERIAL_MVEBU_UART is not set
# CONFIG_SERIAL_OWL is not set
# CONFIG_SERIAL_RDA is not set
# CONFIG_SERIAL_SUNPLUS is not set
# CONFIG_SERIAL_NUVOTON_MA35D1 is not set
# end of Serial drivers

# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_NOZOMI=y
CONFIG_NULL_TTY=m
CONFIG_RPMSG_TTY=m
CONFIG_SERIAL_DEV_BUS=m
# CONFIG_VIRTIO_CONSOLE is not set
# CONFIG_IPMI_HANDLER is not set
# CONFIG_ASPEED_KCS_IPMI_BMC is not set
# CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
# CONFIG_ASPEED_BT_IPMI_BMC is not set
# CONFIG_SSIF_IPMI_BMC is not set
CONFIG_IPMB_DEVICE_INTERFACE=m
# CONFIG_HW_RANDOM is not set
# CONFIG_UML_RANDOM is not set
CONFIG_APPLICOM=y
# CONFIG_DEVMEM is not set
CONFIG_TCG_TPM=m
CONFIG_TCG_TPM2_HMAC=y
CONFIG_TCG_TIS_CORE=m
CONFIG_TCG_TIS_SPI=m
# CONFIG_TCG_TIS_SPI_CR50 is not set
CONFIG_TCG_TIS_I2C=m
# CONFIG_TCG_TIS_SYNQUACER is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
# CONFIG_TCG_TIS_I2C_ATMEL is not set
# CONFIG_TCG_TIS_I2C_INFINEON is not set
CONFIG_TCG_TIS_I2C_NUVOTON=m
# CONFIG_TCG_INFINEON is not set
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_XILLYBUS_CLASS=y
# CONFIG_XILLYBUS is not set
CONFIG_XILLYUSB=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
CONFIG_I2C_MUX_LTC4306=m
CONFIG_I2C_MUX_PCA9541=m
# CONFIG_I2C_MUX_PCA954x is not set
CONFIG_I2C_MUX_REG=m
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_ATR=y
# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=m
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_CCGX_UCSI=m
# CONFIG_I2C_HIX5HD2 is not set
CONFIG_I2C_NVIDIA_GPU=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ASPEED is not set
# CONFIG_I2C_AT91 is not set
# CONFIG_I2C_AXXIA is not set
# CONFIG_I2C_BCM2835 is not set
# CONFIG_I2C_BCM_IPROC is not set
# CONFIG_I2C_BCM_KONA is not set
# CONFIG_I2C_BRCMSTB is not set
# CONFIG_I2C_CADENCE is not set
CONFIG_I2C_CBUS_GPIO=y
# CONFIG_I2C_DAVINCI is not set
# CONFIG_I2C_DESIGNWARE_CORE is not set
# CONFIG_I2C_DIGICOLOR is not set
# CONFIG_I2C_EG20T is not set
CONFIG_I2C_EMEV2=m
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_GXP is not set
# CONFIG_I2C_HIGHLANDER is not set
# CONFIG_I2C_HISI is not set
# CONFIG_I2C_IMG is not set
# CONFIG_I2C_IMX is not set
# CONFIG_I2C_IMX_LPI2C is not set
# CONFIG_I2C_IOP3XX is not set
# CONFIG_I2C_JZ4780 is not set
# CONFIG_I2C_KEBA is not set
# CONFIG_I2C_KEMPLD is not set
# CONFIG_I2C_LS2X is not set
# CONFIG_I2C_MESON is not set
# CONFIG_I2C_MT65XX is not set
# CONFIG_I2C_MT7621 is not set
# CONFIG_I2C_MV64XXX is not set
# CONFIG_I2C_MXS is not set
# CONFIG_I2C_NOMADIK is not set
# CONFIG_I2C_NPCM is not set
CONFIG_I2C_OCORES=m
# CONFIG_I2C_OMAP is not set
# CONFIG_I2C_OWL is not set
# CONFIG_I2C_APPLE is not set
CONFIG_I2C_PCA_PLATFORM=m
# CONFIG_I2C_PNX is not set
# CONFIG_I2C_PXA is not set
# CONFIG_I2C_QCOM_CCI is not set
# CONFIG_I2C_QUP is not set
# CONFIG_I2C_RIIC is not set
# CONFIG_I2C_RTL9300 is not set
# CONFIG_I2C_RZV2M is not set
# CONFIG_I2C_S3C2410 is not set
# CONFIG_I2C_SH_MOBILE is not set
CONFIG_I2C_SIMTEC=y
# CONFIG_I2C_SPRD is not set
# CONFIG_I2C_ST is not set
# CONFIG_I2C_STM32F4 is not set
# CONFIG_I2C_STM32F7 is not set
# CONFIG_I2C_SUN6I_P2WI is not set
# CONFIG_I2C_SYNQUACER is not set
# CONFIG_I2C_TEGRA_BPMP is not set
# CONFIG_I2C_UNIPHIER is not set
# CONFIG_I2C_UNIPHIER_F is not set
# CONFIG_I2C_VERSATILE is not set
# CONFIG_I2C_WMT is not set
# CONFIG_I2C_THUNDERX is not set
CONFIG_I2C_XILINX=m
# CONFIG_I2C_XLP9XX is not set
# CONFIG_I2C_RCAR is not set

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=m
# CONFIG_I2C_NCT6694 is not set
# CONFIG_I2C_CP2615 is not set
# CONFIG_I2C_PCI1XXXX is not set
CONFIG_I2C_ROBOTFUZZ_OSIF=m
CONFIG_I2C_TAOS_EVM=m
CONFIG_I2C_TINY_USB=y
CONFIG_I2C_VIPERBOARD=y

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_VIRTIO=m
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
# CONFIG_I2C_SLAVE_EEPROM is not set
# CONFIG_I2C_SLAVE_TESTUNIT is not set
# CONFIG_I2C_DEBUG_CORE is not set
CONFIG_I2C_DEBUG_ALGO=y
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_I3C_OR_I2C=y
CONFIG_SPI=y
CONFIG_SPI_DEBUG=y
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y
CONFIG_SPI_OFFLOAD=y

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_AIROHA_SNFI is not set
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_ALTERA_CORE is not set
# CONFIG_SPI_AMLOGIC_SPIFC_A1 is not set
# CONFIG_SPI_AMLOGIC_SPIFC_A4 is not set
# CONFIG_SPI_AMLOGIC_SPISG is not set
# CONFIG_SPI_APPLE is not set
# CONFIG_SPI_AR934X is not set
# CONFIG_SPI_ATH79 is not set
# CONFIG_SPI_ARMADA_3700 is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_AXIADO is not set
# CONFIG_SPI_BCM2835 is not set
# CONFIG_SPI_BCM2835AUX is not set
# CONFIG_SPI_BCM63XX is not set
# CONFIG_SPI_BCM63XX_HSSPI is not set
# CONFIG_SPI_BCM_QSPI is not set
# CONFIG_SPI_BCMBCA_HSSPI is not set
CONFIG_SPI_BITBANG=y
CONFIG_SPI_CADENCE=m
CONFIG_SPI_CH341=y
# CONFIG_SPI_CLPS711X is not set
# CONFIG_SPI_DAVINCI is not set
CONFIG_SPI_DESIGNWARE=m
CONFIG_SPI_DW_DMA=y
CONFIG_SPI_DW_PCI=m
CONFIG_SPI_DW_MMIO=m
# CONFIG_SPI_EP93XX is not set
# CONFIG_SPI_FSL_LPSPI is not set
# CONFIG_SPI_FSL_QUADSPI is not set
# CONFIG_SPI_GXP is not set
# CONFIG_SPI_HISI_KUNPENG is not set
# CONFIG_SPI_HISI_SFC_V3XX is not set
# CONFIG_SPI_NXP_FLEXSPI is not set
# CONFIG_SPI_NXP_XSPI is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_IMG_SPFI is not set
# CONFIG_SPI_IMX is not set
# CONFIG_SPI_INGENIC is not set
# CONFIG_SPI_INTEL_PCI is not set
# CONFIG_SPI_INTEL_PLATFORM is not set
# CONFIG_SPI_KSPI2 is not set
# CONFIG_SPI_LOONGSON_PCI is not set
# CONFIG_SPI_LP8841_RTC is not set
# CONFIG_SPI_FSL_DSPI is not set
# CONFIG_SPI_MESON_SPICC is not set
# CONFIG_SPI_MESON_SPIFC is not set
CONFIG_SPI_MICROCHIP_CORE_QSPI=y
CONFIG_SPI_MICROCHIP_CORE_SPI=y
# CONFIG_SPI_MT65XX is not set
# CONFIG_SPI_MT7621 is not set
# CONFIG_SPI_MTK_NOR is not set
# CONFIG_SPI_WPCM_FIU is not set
# CONFIG_SPI_NPCM_PSPI is not set
# CONFIG_SPI_LANTIQ_SSC is not set
CONFIG_SPI_OC_TINY=y
# CONFIG_SPI_OMAP24XX is not set
# CONFIG_SPI_TI_QSPI is not set
# CONFIG_SPI_ORION is not set
CONFIG_SPI_PCI1XXXX=y
# CONFIG_SPI_PIC32 is not set
# CONFIG_SPI_PIC32_SQI is not set
# CONFIG_SPI_POLARFIRE_SOC is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_REALTEK_SNAND is not set
# CONFIG_SPI_ROCKCHIP is not set
# CONFIG_SPI_ROCKCHIP_SFC is not set
# CONFIG_SPI_RSPI is not set
# CONFIG_SPI_RZV2H_RSPI is not set
# CONFIG_SPI_RZV2M_CSI is not set
# CONFIG_SPI_QCOM_QSPI is not set
# CONFIG_SPI_QPIC_SNAND is not set
# CONFIG_SPI_QUP is not set
# CONFIG_SPI_S3C64XX is not set
CONFIG_SPI_SC18IS602=y
# CONFIG_SPI_SH_MSIOF is not set
# CONFIG_SPI_SH is not set
# CONFIG_SPI_SH_HSPI is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_SLAVE_MT27XX is not set
# CONFIG_SPI_SG2044_NOR is not set
# CONFIG_SPI_SPRD is not set
# CONFIG_SPI_SPRD_ADI is not set
# CONFIG_SPI_STM32 is not set
# CONFIG_SPI_ST_SSC4 is not set
# CONFIG_SPI_SUN4I is not set
# CONFIG_SPI_SUN6I is not set
# CONFIG_SPI_SUNPLUS_SP7021 is not set
# CONFIG_SPI_SYNQUACER is not set
CONFIG_SPI_MXIC=y
# CONFIG_SPI_TEGRA210_QUAD is not set
# CONFIG_SPI_TEGRA114 is not set
# CONFIG_SPI_TEGRA20_SFLASH is not set
# CONFIG_SPI_TEGRA20_SLINK is not set
# CONFIG_SPI_THUNDERX is not set
# CONFIG_SPI_TOPCLIFF_PCH is not set
CONFIG_SPI_VIRTIO=y
# CONFIG_SPI_XCOMM is not set
CONFIG_SPI_XILINX=y
# CONFIG_SPI_XLP is not set
# CONFIG_SPI_XTENSA_XTFPGA is not set
# CONFIG_SPI_ZYNQ_QSPI is not set
CONFIG_SPI_ZYNQMP_GQSPI=m
CONFIG_SPI_AMD=y

#
# SPI Multiplexer support
#
CONFIG_SPI_MUX=m

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=y
CONFIG_SPI_LOOPBACK_TEST=m
# CONFIG_SPI_TLE62X0 is not set
CONFIG_SPI_SLAVE=y
# CONFIG_SPI_SLAVE_TIME is not set
# CONFIG_SPI_SLAVE_SYSTEM_CONTROL is not set
CONFIG_SPI_DYNAMIC=y

#
# SPI Offload triggers
#
CONFIG_SPI_OFFLOAD_TRIGGER_ADI_UTIL_SD=m
CONFIG_SPI_OFFLOAD_TRIGGER_PWM=y
CONFIG_SPMI=y
# CONFIG_SPMI_APPLE is not set
# CONFIG_SPMI_HISI3670 is not set
# CONFIG_SPMI_MSM_PMIC_ARB is not set
# CONFIG_SPMI_MTK_PMIF is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
CONFIG_PPS_DEBUG=y
# CONFIG_NTP_PPS is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
CONFIG_PPS_CLIENT_LDISC=y
CONFIG_PPS_CLIENT_GPIO=y
# CONFIG_PPS_GENERATOR is not set

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

#
# DPLL device support
#
# end of DPLL device support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_AMDISP is not set
# CONFIG_PINCTRL_AT91 is not set
CONFIG_PINCTRL_CY8C95X0=y
CONFIG_PINCTRL_DA9062=m
# CONFIG_PINCTRL_EIC7700 is not set
CONFIG_PINCTRL_MAX7360=m
CONFIG_PINCTRL_MCP23S08_I2C=m
CONFIG_PINCTRL_MCP23S08_SPI=m
CONFIG_PINCTRL_MCP23S08=m
# CONFIG_PINCTRL_SCMI is not set
CONFIG_PINCTRL_SX150X=m
# CONFIG_PINCTRL_TB10X is not set
# CONFIG_PINCTRL_MLXBF3 is not set
# CONFIG_PINCTRL_CS42L43 is not set
CONFIG_PINCTRL_MADERA=m
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L35=y
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L92=y
# CONFIG_PINCTRL_SKY1 is not set

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
# CONFIG_PINCTRL_INTEL_PLATFORM is not set
# CONFIG_PINCTRL_ALDERLAKE is not set
# CONFIG_PINCTRL_BROXTON is not set
# CONFIG_PINCTRL_CANNONLAKE is not set
# CONFIG_PINCTRL_CEDARFORK is not set
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_ELKHARTLAKE is not set
# CONFIG_PINCTRL_EMMITSBURG is not set
# CONFIG_PINCTRL_GEMINILAKE is not set
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
# CONFIG_PINCTRL_LAKEFIELD is not set
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_METEORLAKE is not set
# CONFIG_PINCTRL_METEORPOINT is not set
# CONFIG_PINCTRL_SUNRISEPOINT is not set
# CONFIG_PINCTRL_TIGERLAKE is not set
# CONFIG_PINCTRL_MERRIFIELD is not set
# CONFIG_PINCTRL_MOOREFIELD is not set
# end of Intel pinctrl drivers

#
# MediaTek pinctrl drivers
#
# CONFIG_EINT_MTK is not set
# end of MediaTek pinctrl drivers

# CONFIG_PINCTRL_PXA25X is not set
# CONFIG_PINCTRL_PXA27X is not set
# CONFIG_PINCTRL_LPASS_LPI is not set

#
# Renesas pinctrl drivers
#
# CONFIG_PINCTRL_RENESAS is not set
# CONFIG_PINCTRL_PFC_EMEV2 is not set
# CONFIG_PINCTRL_PFC_R8A73A4 is not set
# CONFIG_PINCTRL_PFC_R8A7740 is not set
# CONFIG_PINCTRL_PFC_R8A7742 is not set
# CONFIG_PINCTRL_PFC_R8A7743 is not set
# CONFIG_PINCTRL_PFC_R8A7744 is not set
# CONFIG_PINCTRL_PFC_R8A7745 is not set
# CONFIG_PINCTRL_PFC_R8A77470 is not set
# CONFIG_PINCTRL_PFC_R8A774A1 is not set
# CONFIG_PINCTRL_PFC_R8A774B1 is not set
# CONFIG_PINCTRL_PFC_R8A774C0 is not set
# CONFIG_PINCTRL_PFC_R8A774E1 is not set
# CONFIG_PINCTRL_PFC_R8A7778 is not set
# CONFIG_PINCTRL_PFC_R8A7779 is not set
# CONFIG_PINCTRL_PFC_R8A7790 is not set
# CONFIG_PINCTRL_PFC_R8A7791 is not set
# CONFIG_PINCTRL_PFC_R8A7792 is not set
# CONFIG_PINCTRL_PFC_R8A7793 is not set
# CONFIG_PINCTRL_PFC_R8A7794 is not set
# CONFIG_PINCTRL_PFC_R8A77951 is not set
# CONFIG_PINCTRL_PFC_R8A77960 is not set
# CONFIG_PINCTRL_PFC_R8A77961 is not set
# CONFIG_PINCTRL_PFC_R8A77965 is not set
# CONFIG_PINCTRL_PFC_R8A77970 is not set
# CONFIG_PINCTRL_PFC_R8A77980 is not set
# CONFIG_PINCTRL_PFC_R8A77990 is not set
# CONFIG_PINCTRL_PFC_R8A77995 is not set
# CONFIG_PINCTRL_PFC_R8A779A0 is not set
# CONFIG_PINCTRL_PFC_R8A779F0 is not set
# CONFIG_PINCTRL_PFC_R8A779G0 is not set
# CONFIG_PINCTRL_PFC_R8A779H0 is not set
# CONFIG_PINCTRL_PFC_SH7203 is not set
# CONFIG_PINCTRL_PFC_SH7264 is not set
# CONFIG_PINCTRL_PFC_SH7269 is not set
# CONFIG_PINCTRL_PFC_SH73A0 is not set
# CONFIG_PINCTRL_PFC_SH7720 is not set
# CONFIG_PINCTRL_PFC_SH7722 is not set
# CONFIG_PINCTRL_PFC_SH7723 is not set
# CONFIG_PINCTRL_PFC_SH7724 is not set
# CONFIG_PINCTRL_PFC_SH7734 is not set
# CONFIG_PINCTRL_PFC_SH7757 is not set
# CONFIG_PINCTRL_PFC_SH7785 is not set
# CONFIG_PINCTRL_PFC_SH7786 is not set
# CONFIG_PINCTRL_PFC_SHX3 is not set
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB_LEGACY=y
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_GPIO_SHARED=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=y
CONFIG_GPIO_IDIO_16=m

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_ALTERA=m
# CONFIG_GPIO_ATH79 is not set
# CONFIG_GPIO_BCM_KONA is not set
# CONFIG_GPIO_CLPS711X is not set
# CONFIG_GPIO_DAVINCI is not set
CONFIG_GPIO_DWAPB=m
CONFIG_GPIO_EP93XX=y
# CONFIG_GPIO_GE_FPGA is not set
CONFIG_GPIO_GENERIC_PLATFORM=m
# CONFIG_GPIO_GRANITERAPIDS is not set
# CONFIG_GPIO_GRGPIO is not set
# CONFIG_GPIO_HISI is not set
# CONFIG_GPIO_IXP4XX is not set
CONFIG_GPIO_MB86S7X=y
CONFIG_GPIO_MENZ127=m
# CONFIG_GPIO_MPC8XXX is not set
# CONFIG_GPIO_MVEBU is not set
# CONFIG_GPIO_MXC is not set
# CONFIG_GPIO_MXS is not set
# CONFIG_GPIO_NOMADIK is not set
# CONFIG_GPIO_NPCM_SGPIO is not set
# CONFIG_GPIO_OMAP is not set
# CONFIG_GPIO_PL061 is not set
# CONFIG_GPIO_POLARFIRE_SOC is not set
# CONFIG_GPIO_PXA is not set
# CONFIG_GPIO_RCAR is not set
# CONFIG_GPIO_REALTEK_OTTO is not set
# CONFIG_GPIO_ROCKCHIP is not set
CONFIG_GPIO_RTD=y
# CONFIG_GPIO_TB10X is not set
# CONFIG_GPIO_THUNDERX is not set
# CONFIG_GPIO_VF610 is not set
# CONFIG_GPIO_XGENE_SB is not set
# CONFIG_GPIO_XILINX is not set
# CONFIG_GPIO_XLP is not set
# CONFIG_GPIO_ZYNQ is not set
# CONFIG_GPIO_ZYNQMP_MODEPIN is not set
# CONFIG_GPIO_LOONGSON1 is not set
CONFIG_GPIO_AMD_FCH=y
# CONFIG_GPIO_MSC313 is not set
# CONFIG_GPIO_IDT3243X is not set
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_FXL6408=y
CONFIG_GPIO_DS4520=y
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=y
CONFIG_GPIO_MAX732X_IRQ=y
CONFIG_GPIO_PCA953X=m
# CONFIG_GPIO_PCA953X_IRQ is not set
CONFIG_GPIO_PCA9570=m
CONFIG_GPIO_PCF857X=y
CONFIG_GPIO_TPIC2810=m
# CONFIG_GPIO_TS4900 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# CONFIG_GPIO_ADP5520 is not set
CONFIG_GPIO_ARIZONA=m
# CONFIG_GPIO_BD9571MWV is not set
CONFIG_GPIO_DA9052=m
# CONFIG_HTC_EGPIO is not set
# CONFIG_GPIO_JANZ_TTL is not set
CONFIG_GPIO_KEMPLD=m
# CONFIG_GPIO_LP873X is not set
CONFIG_GPIO_MADERA=m
CONFIG_GPIO_MAX7360=m
CONFIG_GPIO_NCT6694=m
# CONFIG_GPIO_PALMAS is not set
CONFIG_GPIO_QIXIS_FPGA=m
# CONFIG_GPIO_SL28CPLD is not set
# CONFIG_GPIO_TN48M_CPLD is not set
# CONFIG_GPIO_TPS65086 is not set
# CONFIG_GPIO_TPS6586X is not set
# CONFIG_GPIO_TPS65910 is not set
CONFIG_GPIO_TPS65912=m
# CONFIG_GPIO_TQMX86 is not set
CONFIG_GPIO_WM831X=y
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_MLXBF is not set
# CONFIG_GPIO_MLXBF2 is not set
# CONFIG_GPIO_MLXBF3 is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCH is not set
CONFIG_GPIO_PCI_IDIO_16=m
CONFIG_GPIO_PCIE_IDIO_24=y
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
CONFIG_GPIO_74X164=m
CONFIG_GPIO_MAX3191X=m
# CONFIG_GPIO_MAX7301 is not set
CONFIG_GPIO_MC33880=m
CONFIG_GPIO_PISOSR=m
CONFIG_GPIO_XRA1403=y
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# CONFIG_GPIO_VIPERBOARD is not set
CONFIG_GPIO_MPSSE=m
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
# CONFIG_GPIO_LATCH is not set
CONFIG_GPIO_MOCKUP=y
# CONFIG_GPIO_VIRTIO is not set
CONFIG_GPIO_SIM=m
CONFIG_GPIO_SHARED_PROXY=m
# end of Virtual GPIO drivers

#
# GPIO Debugging utilities
#
# CONFIG_GPIO_VIRTUSER is not set
# end of GPIO Debugging utilities

CONFIG_DEV_SYNC_PROBE=y
CONFIG_W1=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_AMD_AXI=m
CONFIG_W1_MASTER_MATROX=m
# CONFIG_W1_MASTER_DS2490 is not set
CONFIG_W1_MASTER_DS2482=y
# CONFIG_W1_MASTER_MXC is not set
CONFIG_W1_MASTER_GPIO=y
# CONFIG_HDQ_MASTER_OMAP is not set
CONFIG_W1_MASTER_SGI=y
CONFIG_W1_MASTER_UART=m
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
CONFIG_W1_SLAVE_SMEM=m
CONFIG_W1_SLAVE_DS2405=y
CONFIG_W1_SLAVE_DS2408=y
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=y
CONFIG_W1_SLAVE_DS2805=y
CONFIG_W1_SLAVE_DS2430=m
CONFIG_W1_SLAVE_DS2431=y
# CONFIG_W1_SLAVE_DS2433 is not set
# CONFIG_W1_SLAVE_DS2438 is not set
CONFIG_W1_SLAVE_DS250X=y
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=m
CONFIG_W1_SLAVE_DS28E17=m
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SEQUENCING=m
# CONFIG_POWER_SEQUENCING_QCOM_WCN is not set
# CONFIG_POWER_SEQUENCING_TH1520_GPU is not set
# CONFIG_POWER_SEQUENCING_PCIE_M2 is not set
CONFIG_POWER_SUPPLY=y
CONFIG_POWER_SUPPLY_DEBUG=y
CONFIG_GENERIC_ADC_BATTERY=m
CONFIG_IP5XXX_POWER=y
CONFIG_WM831X_BACKUP=m
# CONFIG_WM831X_POWER is not set
CONFIG_TEST_POWER=y
CONFIG_CHARGER_ADP5061=y
# CONFIG_BATTERY_ACT8945A is not set
CONFIG_BATTERY_CHAGALL=y
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2760 is not set
CONFIG_BATTERY_DS2780=m
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=m
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
CONFIG_MANAGER_SBS=m
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=m
CONFIG_BATTERY_BQ27XXX_HDQ=m
# CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
CONFIG_BATTERY_DA9052=y
# CONFIG_CHARGER_AXP20X is not set
CONFIG_BATTERY_AXP20X=m
# CONFIG_AXP20X_POWER is not set
CONFIG_BATTERY_MAX17040=m
CONFIG_BATTERY_MAX17042=m
CONFIG_BATTERY_MAX1720X=y
CONFIG_BATTERY_MAX1721X=y
CONFIG_CHARGER_ISP1704=y
CONFIG_CHARGER_MAX8903=m
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_GPIO=y
# CONFIG_CHARGER_MANAGER is not set
CONFIG_CHARGER_LT3651=y
# CONFIG_CHARGER_LTC4162L is not set
CONFIG_CHARGER_MAX77693=m
CONFIG_CHARGER_MAX77705=m
CONFIG_CHARGER_MAX77976=m
CONFIG_CHARGER_MAX8971=y
# CONFIG_CHARGER_MP2629 is not set
CONFIG_CHARGER_MT6360=m
CONFIG_CHARGER_MT6370=m
# CONFIG_BATTERY_PM8916_BMS_VM is not set
# CONFIG_CHARGER_PM8916_LBC is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=y
CONFIG_CHARGER_BQ24735=y
CONFIG_CHARGER_BQ2515X=m
CONFIG_CHARGER_BQ25890=m
# CONFIG_CHARGER_BQ25980 is not set
CONFIG_CHARGER_BQ256XX=y
CONFIG_CHARGER_SMB347=y
CONFIG_CHARGER_TPS65090=m
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
CONFIG_BATTERY_GOLDFISH=m
CONFIG_BATTERY_RT5033=y
# CONFIG_CHARGER_RT5033 is not set
# CONFIG_CHARGER_RT9455 is not set
CONFIG_CHARGER_RT9467=y
CONFIG_CHARGER_RT9471=m
# CONFIG_CHARGER_RT9756 is not set
# CONFIG_CHARGER_SC2731 is not set
# CONFIG_FUEL_GAUGE_SC27XX is not set
CONFIG_FUEL_GAUGE_STC3117=m
CONFIG_CHARGER_BD99954=m
# CONFIG_BATTERY_UG3105 is not set
CONFIG_FUEL_GAUGE_MM8013=m
CONFIG_HWMON=m
CONFIG_HWMON_VID=m
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
CONFIG_SENSORS_SMPRO=m
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
# CONFIG_SENSORS_ADM1029 is not set
# CONFIG_SENSORS_ADM1031 is not set
# CONFIG_SENSORS_ADM1177 is not set
# CONFIG_SENSORS_ADM9240 is not set
# CONFIG_SENSORS_ADT7310 is not set
# CONFIG_SENSORS_ADT7410 is not set
CONFIG_SENSORS_ADT7411=m
# CONFIG_SENSORS_ADT7462 is not set
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
CONFIG_SENSORS_AHT10=m
# CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
# CONFIG_SENSORS_AS370 is not set
# CONFIG_SENSORS_ASC7621 is not set
# CONFIG_SENSORS_ASUS_ROG_RYUJIN is not set
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_KBATT=m
# CONFIG_SENSORS_KFAN is not set
# CONFIG_SENSORS_ASB100 is not set
# CONFIG_SENSORS_ASPEED is not set
# CONFIG_SENSORS_ASPEED_G6 is not set
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_BT1_PVT is not set
# CONFIG_SENSORS_CHIPCAP2 is not set
CONFIG_SENSORS_CORSAIR_CPRO=m
CONFIG_SENSORS_CORSAIR_PSU=m
CONFIG_SENSORS_DRIVETEMP=m
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
CONFIG_SENSORS_DA9052_ADC=m
# CONFIG_SENSORS_I5K_AMB is not set
# CONFIG_SENSORS_SPARX5 is not set
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_MC13783_ADC=m
# CONFIG_SENSORS_FSCHMD is not set
CONFIG_SENSORS_GIGABYTE_WATERFORCE=m
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
CONFIG_SENSORS_G762=m
# CONFIG_SENSORS_GXP_FAN_CTRL is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_HS3001=m
CONFIG_SENSORS_HTU31=m
# CONFIG_SENSORS_IIO_HWMON is not set
CONFIG_SENSORS_ISL28022=m
CONFIG_SENSORS_JC42=m
CONFIG_SENSORS_POWERZ=m
# CONFIG_SENSORS_POWR1220 is not set
# CONFIG_SENSORS_LAN966X is not set
# CONFIG_SENSORS_LINEAGE is not set
CONFIG_SENSORS_LTC2945=m
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2947_SPI is not set
CONFIG_SENSORS_LTC2990=m
CONFIG_SENSORS_LTC2991=m
CONFIG_SENSORS_LTC2992=m
# CONFIG_SENSORS_LTC4151 is not set
# CONFIG_SENSORS_LTC4215 is not set
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
CONFIG_SENSORS_LTC4260=m
# CONFIG_SENSORS_LTC4261 is not set
# CONFIG_SENSORS_LTC4282 is not set
# CONFIG_SENSORS_MAX1111 is not set
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
# CONFIG_SENSORS_MAX1619 is not set
# CONFIG_SENSORS_MAX1668 is not set
CONFIG_SENSORS_MAX197=m
CONFIG_SENSORS_MAX31722=m
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX31760 is not set
# CONFIG_MAX31827 is not set
CONFIG_SENSORS_MAX6620=m
CONFIG_SENSORS_MAX6621=m
# CONFIG_SENSORS_MAX6639 is not set
# CONFIG_SENSORS_MAX6650 is not set
CONFIG_SENSORS_MAX6697=m
CONFIG_SENSORS_MAX31790=m
# CONFIG_SENSORS_MAX77705 is not set
CONFIG_SENSORS_MC34VR500=m
CONFIG_SENSORS_MCP3021=m
CONFIG_SENSORS_TC654=m
# CONFIG_SENSORS_TPS23861 is not set
CONFIG_SENSORS_MENF21BMC_HWMON=m
# CONFIG_SENSORS_MR75203 is not set
CONFIG_SENSORS_ADCXX=m
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
# CONFIG_SENSORS_LM73 is not set
# CONFIG_SENSORS_LM75 is not set
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
# CONFIG_SENSORS_LM92 is not set
CONFIG_SENSORS_LM93=m
# CONFIG_SENSORS_LM95234 is not set
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT6694=m
CONFIG_SENSORS_NCT6775_CORE=m
CONFIG_SENSORS_NCT6775_I2C=m
CONFIG_SENSORS_NCT7363=m
# CONFIG_SENSORS_NCT7802 is not set
CONFIG_SENSORS_NPCM7XX=m
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
CONFIG_SENSORS_NZXT_KRAKEN3=m
CONFIG_SENSORS_NZXT_SMART2=m
# CONFIG_SENSORS_OCC_P8_I2C is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_SENSORS_PECI_CPUTEMP=m
CONFIG_SENSORS_PECI_DIMMTEMP=m
CONFIG_SENSORS_PECI=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
CONFIG_SENSORS_ACBEL_FSG032=m
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=m
CONFIG_SENSORS_ADP1050=m
# CONFIG_SENSORS_ADP1050_REGULATOR is not set
CONFIG_SENSORS_BEL_PFE=m
CONFIG_SENSORS_BPA_RS600=m
# CONFIG_SENSORS_CRPS is not set
CONFIG_SENSORS_DELTA_AHE50DC_FAN=m
# CONFIG_SENSORS_FSP_3Y is not set
CONFIG_SENSORS_HAC300S=m
# CONFIG_SENSORS_IBM_CFFPS is not set
CONFIG_SENSORS_DPS920AB=m
CONFIG_SENSORS_INA233=m
CONFIG_SENSORS_INSPUR_IPSPS=m
# CONFIG_SENSORS_IR35221 is not set
CONFIG_SENSORS_IR36021=m
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
CONFIG_SENSORS_ISL68137=m
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LM25066_REGULATOR=y
CONFIG_SENSORS_LT3074=m
# CONFIG_SENSORS_LT3074_REGULATOR is not set
CONFIG_SENSORS_LT7182S=m
# CONFIG_SENSORS_LTC2978 is not set
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_LTC4286=y
CONFIG_SENSORS_MAX15301=m
CONFIG_SENSORS_MAX16064=m
CONFIG_SENSORS_MAX16601=m
# CONFIG_SENSORS_MAX17616 is not set
CONFIG_SENSORS_MAX20730=m
CONFIG_SENSORS_MAX20751=m
CONFIG_SENSORS_MAX31785=m
# CONFIG_SENSORS_MAX34440 is not set
# CONFIG_SENSORS_MAX8688 is not set
CONFIG_SENSORS_MP2856=m
CONFIG_SENSORS_MP2869=m
# CONFIG_SENSORS_MP2888 is not set
# CONFIG_SENSORS_MP2891 is not set
# CONFIG_SENSORS_MP2925 is not set
CONFIG_SENSORS_MP29502=m
# CONFIG_SENSORS_MP2975 is not set
CONFIG_SENSORS_MP2993=m
CONFIG_SENSORS_MP5023=m
CONFIG_SENSORS_MP5920=m
CONFIG_SENSORS_MP5926=m
CONFIG_SENSORS_MP5990=m
CONFIG_SENSORS_MP9941=m
CONFIG_SENSORS_MP9945=m
# CONFIG_SENSORS_MPQ7932 is not set
# CONFIG_SENSORS_MPQ8785 is not set
CONFIG_SENSORS_PIM4328=m
# CONFIG_SENSORS_PLI1209BC is not set
# CONFIG_SENSORS_PM6764TR is not set
CONFIG_SENSORS_PXE1610=m
# CONFIG_SENSORS_Q54SJ108A2 is not set
CONFIG_SENSORS_STEF48H28=m
CONFIG_SENSORS_STPDDC60=m
# CONFIG_SENSORS_TDA38640 is not set
CONFIG_SENSORS_TPS25990=m
CONFIG_SENSORS_TPS25990_REGULATOR=y
# CONFIG_SENSORS_TPS40422 is not set
CONFIG_SENSORS_TPS53679=m
CONFIG_SENSORS_TPS546D24=m
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
CONFIG_SENSORS_XDP710=m
# CONFIG_SENSORS_XDPE152 is not set
CONFIG_SENSORS_XDPE122=m
CONFIG_SENSORS_XDPE122_REGULATOR=y
CONFIG_SENSORS_ZL6100=m
CONFIG_SENSORS_PT5161L=m
CONFIG_SENSORS_PWM_FAN=m
# CONFIG_SENSORS_QNAP_MCU_HWMON is not set
# CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
# CONFIG_SENSORS_SL28CPLD is not set
CONFIG_SENSORS_SBTSI=m
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
CONFIG_SENSORS_SHTC1=m
CONFIG_SENSORS_EMC1403=m
CONFIG_SENSORS_EMC2103=m
CONFIG_SENSORS_EMC2305=m
# CONFIG_SENSORS_EMC6W201 is not set
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_STTS751=m
# CONFIG_SENSORS_SFCTEMP is not set
# CONFIG_SENSORS_SG2042_MCU is not set
CONFIG_SENSORS_ADC128D818=m
# CONFIG_SENSORS_ADS7828 is not set
CONFIG_SENSORS_ADS7871=m
# CONFIG_SENSORS_AMC6821 is not set
CONFIG_SENSORS_INA209=m
# CONFIG_SENSORS_INA2XX is not set
CONFIG_SENSORS_INA238=m
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_SPD5118 is not set
CONFIG_SENSORS_TC74=m
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
CONFIG_SENSORS_TMP103=m
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
# CONFIG_SENSORS_TMP421 is not set
# CONFIG_SENSORS_TMP464 is not set
CONFIG_SENSORS_TMP513=m
CONFIG_SENSORS_TSC1641=m
CONFIG_SENSORS_W83773G=m
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
# CONFIG_SENSORS_W83L786NG is not set
# CONFIG_SENSORS_WM831X is not set
CONFIG_SENSORS_INTEL_M10_BMC_HWMON=m
CONFIG_THERMAL=y
# CONFIG_THERMAL_STATISTICS is not set
# CONFIG_THERMAL_DEBUGFS is not set
CONFIG_THERMAL_CORE_TESTING=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=y
# CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
# CONFIG_THERMAL_DEFAULT_GOV_BANG_BANG is not set
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
CONFIG_DEVFREQ_THERMAL=y
CONFIG_THERMAL_EMULATION=y
# CONFIG_K3_THERMAL is not set
# CONFIG_ROCKCHIP_THERMAL is not set

#
# Mediatek thermal drivers
#
# end of Mediatek thermal drivers

#
# Intel thermal drivers
#

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers
# end of Intel thermal drivers

#
# Broadcom thermal drivers
#
# CONFIG_BRCMSTB_THERMAL is not set
# CONFIG_BCM_NS_THERMAL is not set
# CONFIG_BCM_SR_THERMAL is not set
# end of Broadcom thermal drivers

#
# Texas Instruments thermal drivers
#
# CONFIG_TI_SOC_THERMAL is not set
# end of Texas Instruments thermal drivers

#
# Samsung thermal drivers
#
# end of Samsung thermal drivers

# CONFIG_RZG3E_THERMAL is not set

#
# NVIDIA Tegra thermal drivers
#
# CONFIG_TEGRA_SOCTHERM is not set
# CONFIG_TEGRA_BPMP_THERMAL is not set
# CONFIG_TEGRA30_TSENSOR is not set
# end of NVIDIA Tegra thermal drivers

CONFIG_GENERIC_ADC_THERMAL=m

#
# Qualcomm thermal drivers
#
# CONFIG_QCOM_LMH is not set
# end of Qualcomm thermal drivers

# CONFIG_SPRD_THERMAL is not set
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=m
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
CONFIG_SSB_PCMCIAHOST=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
# CONFIG_SSB_SDIOHOST is not set
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
# CONFIG_SSB_DRIVER_PCICORE is not set
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
CONFIG_BCMA_HOST_SOC=y
CONFIG_BCMA_DRIVER_PCI=y
# CONFIG_BCMA_DRIVER_MIPS is not set
CONFIG_BCMA_SFLASH=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
# CONFIG_BCMA_DRIVER_GPIO is not set
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_SUN4I_GPADC is not set
CONFIG_MFD_AS3711=y
CONFIG_MFD_SMPRO=y
CONFIG_PMIC_ADP5520=y
CONFIG_MFD_AAT2870_CORE=y
# CONFIG_MFD_AT91_USART is not set
# CONFIG_MFD_BCM590XX is not set
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_CS40L50_CORE=m
# CONFIG_MFD_CS40L50_I2C is not set
CONFIG_MFD_CS40L50_SPI=m
CONFIG_MFD_CS42L43=m
CONFIG_MFD_CS42L43_I2C=m
CONFIG_MFD_MADERA=m
CONFIG_MFD_MADERA_I2C=m
CONFIG_MFD_MADERA_SPI=m
CONFIG_MFD_CS47L15=y
CONFIG_MFD_CS47L35=y
CONFIG_MFD_CS47L85=y
# CONFIG_MFD_CS47L90 is not set
CONFIG_MFD_CS47L92=y
# CONFIG_MFD_TN48M_CPLD is not set
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_SPI=y
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=m
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_ENE_KB3930 is not set
# CONFIG_MFD_EXYNOS_LPASS is not set
CONFIG_MFD_MC13XXX=y
# CONFIG_MFD_MC13XXX_SPI is not set
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=m
# CONFIG_MFD_MXS_LRADC is not set
# CONFIG_MFD_MX25_TSADC is not set
CONFIG_LPC_ICH=y
# CONFIG_LPC_SCH is not set
# CONFIG_INTEL_SOC_PMIC is not set
CONFIG_MFD_IQS62X=y
CONFIG_MFD_JANZ_CMODIO=y
CONFIG_MFD_KEMPLD=m
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=m
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX5970 is not set
# CONFIG_MFD_MAX14577 is not set
CONFIG_MFD_MAX77541=m
CONFIG_MFD_MAX77693=y
CONFIG_MFD_MAX77705=y
# CONFIG_MFD_MAX77843 is not set
CONFIG_MFD_MAX8907=y
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
CONFIG_MFD_MT6360=m
CONFIG_MFD_MT6370=y
CONFIG_MFD_MT6397=m
CONFIG_MFD_MENF21BMC=y
CONFIG_MFD_NCT6694=m
# CONFIG_MFD_OCELOT is not set
CONFIG_EZX_PCAP=y
CONFIG_MFD_VIPERBOARD=y
CONFIG_MFD_RETU=m
# CONFIG_MFD_PM8XXX is not set
# CONFIG_MFD_SPACEMIT_P1 is not set
# CONFIG_MFD_SY7636A is not set
CONFIG_MFD_RDC321X=y
# CONFIG_MFD_RT4831 is not set
CONFIG_MFD_RT5033=m
# CONFIG_MFD_RT5120 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SIMPLE_MFD_I2C=y
# CONFIG_MFD_SL28CPLD is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SC27XX_PMIC is not set
# CONFIG_RZ_MTU3 is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_SUN6I_PRCM is not set
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_BQ257XX is not set
CONFIG_MFD_PALMAS=y
CONFIG_TPS6105X=m
CONFIG_TPS65010=m
# CONFIG_TPS6507X is not set
CONFIG_MFD_TPS65086=y
CONFIG_MFD_TPS65090=y
CONFIG_MFD_TI_LP873X=y
CONFIG_MFD_TPS6586X=y
CONFIG_MFD_TPS65910=y
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
CONFIG_MFD_TPS65912_SPI=m
CONFIG_MFD_TPS6594=m
CONFIG_MFD_TPS6594_I2C=m
CONFIG_MFD_TPS6594_SPI=m
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_LM3533=m
# CONFIG_MFD_TIMBERDALE is not set
CONFIG_MFD_TQMX86=y
CONFIG_MFD_VX855=y
CONFIG_MFD_ARIZONA=m
CONFIG_MFD_ARIZONA_I2C=m
CONFIG_MFD_ARIZONA_SPI=m
# CONFIG_MFD_CS47L24 is not set
# CONFIG_MFD_WM5102 is not set
CONFIG_MFD_WM5110=y
# CONFIG_MFD_WM8997 is not set
# CONFIG_MFD_WM8998 is not set
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
CONFIG_MFD_WM831X_SPI=y
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_STW481X is not set
# CONFIG_MFD_STM32_LPTIMER is not set
# CONFIG_MFD_STM32_TIMERS is not set
# CONFIG_MFD_WCD934X is not set
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
# CONFIG_MFD_KHADAS_MCU is not set
# CONFIG_MFD_ACER_A500_EC is not set
CONFIG_RAVE_SP_CORE=m
CONFIG_MFD_INTEL_M10_BMC_CORE=m
CONFIG_MFD_INTEL_M10_BMC_SPI=m
CONFIG_MFD_QNAP_MCU=m
CONFIG_MFD_MAX7360=m
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
# CONFIG_REGULATOR_88PG86X is not set
CONFIG_REGULATOR_88PM800=y
CONFIG_REGULATOR_ACT8865=m
# CONFIG_REGULATOR_AD5398 is not set
CONFIG_REGULATOR_ADP5055=m
# CONFIG_REGULATOR_ANATOP is not set
# CONFIG_REGULATOR_AAT2870 is not set
CONFIG_REGULATOR_AS3711=y
CONFIG_REGULATOR_ATC260X=y
CONFIG_REGULATOR_AW37503=m
CONFIG_REGULATOR_AXP20X=y
CONFIG_REGULATOR_BD9571MWV=y
CONFIG_REGULATOR_DA9052=y
CONFIG_REGULATOR_DA9062=m
CONFIG_REGULATOR_DA9210=m
CONFIG_REGULATOR_DA9211=m
CONFIG_REGULATOR_FAN53555=y
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=m
# CONFIG_REGULATOR_FP9931 is not set
CONFIG_REGULATOR_LP3971=m
# CONFIG_REGULATOR_LP3972 is not set
# CONFIG_REGULATOR_LP872X is not set
# CONFIG_REGULATOR_LP8755 is not set
CONFIG_REGULATOR_LTC3589=m
# CONFIG_REGULATOR_LTC3676 is not set
CONFIG_REGULATOR_MAX1586=m
CONFIG_REGULATOR_MAX77503=m
CONFIG_REGULATOR_MAX77541=m
# CONFIG_REGULATOR_MAX77620 is not set
# CONFIG_REGULATOR_MAX77650 is not set
CONFIG_REGULATOR_MAX77857=y
CONFIG_REGULATOR_MAX8649=m
CONFIG_REGULATOR_MAX8660=m
CONFIG_REGULATOR_MAX8893=m
CONFIG_REGULATOR_MAX8907=y
CONFIG_REGULATOR_MAX8952=y
CONFIG_REGULATOR_MAX20086=y
CONFIG_REGULATOR_MAX20411=y
# CONFIG_REGULATOR_MAX77686 is not set
CONFIG_REGULATOR_MAX77693=m
# CONFIG_REGULATOR_MAX77802 is not set
CONFIG_REGULATOR_MAX77826=y
CONFIG_REGULATOR_MAX77838=y
CONFIG_REGULATOR_MC13XXX_CORE=m
# CONFIG_REGULATOR_MC13783 is not set
CONFIG_REGULATOR_MC13892=m
# CONFIG_REGULATOR_MP8859 is not set
# CONFIG_REGULATOR_MT6311 is not set
# CONFIG_REGULATOR_MT6315 is not set
CONFIG_REGULATOR_MT6316=m
CONFIG_REGULATOR_MT6323=m
CONFIG_REGULATOR_MT6331=m
CONFIG_REGULATOR_MT6332=m
# CONFIG_REGULATOR_MT6357 is not set
CONFIG_REGULATOR_MT6358=m
CONFIG_REGULATOR_MT6359=m
CONFIG_REGULATOR_MT6360=m
# CONFIG_REGULATOR_MT6363 is not set
# CONFIG_REGULATOR_MT6370 is not set
# CONFIG_REGULATOR_MT6397 is not set
CONFIG_REGULATOR_PALMAS=m
# CONFIG_REGULATOR_PBIAS is not set
# CONFIG_REGULATOR_PCA9450 is not set
CONFIG_REGULATOR_PF9453=y
CONFIG_REGULATOR_PCAP=m
CONFIG_REGULATOR_PF0900=y
CONFIG_REGULATOR_PV88060=m
CONFIG_REGULATOR_PV88080=m
CONFIG_REGULATOR_PV88090=y
CONFIG_REGULATOR_PWM=m
# CONFIG_REGULATOR_QCOM_REFGEN is not set
# CONFIG_REGULATOR_QCOM_RPMH is not set
CONFIG_REGULATOR_QCOM_SPMI=y
CONFIG_REGULATOR_QCOM_USB_VBUS=y
CONFIG_REGULATOR_RAA215300=y
CONFIG_REGULATOR_RT4801=y
CONFIG_REGULATOR_RT4803=m
CONFIG_REGULATOR_RT5033=m
CONFIG_REGULATOR_RT5190A=y
CONFIG_REGULATOR_RT5739=m
CONFIG_REGULATOR_RT5759=m
# CONFIG_REGULATOR_RT6160 is not set
# CONFIG_REGULATOR_RT6190 is not set
# CONFIG_REGULATOR_RT6245 is not set
CONFIG_REGULATOR_RT8092=m
# CONFIG_REGULATOR_RTQ2134 is not set
# CONFIG_REGULATOR_RTMV20 is not set
CONFIG_REGULATOR_RTQ6752=y
# CONFIG_REGULATOR_RTQ2208 is not set
# CONFIG_REGULATOR_S2DOS05 is not set
# CONFIG_REGULATOR_S2MPA01 is not set
# CONFIG_REGULATOR_S2MPS11 is not set
# CONFIG_REGULATOR_S5M8767 is not set
# CONFIG_REGULATOR_SC2731 is not set
# CONFIG_REGULATOR_SLG51000 is not set
# CONFIG_REGULATOR_SPACEMIT_P1 is not set
# CONFIG_REGULATOR_STM32_BOOSTER is not set
# CONFIG_REGULATOR_STM32_VREFBUF is not set
# CONFIG_REGULATOR_STM32_PWR is not set
# CONFIG_REGULATOR_TI_ABB is not set
# CONFIG_REGULATOR_STW481X_VMMC is not set
# CONFIG_REGULATOR_SUN20I is not set
CONFIG_REGULATOR_TPS51632=m
CONFIG_REGULATOR_TPS6105X=m
CONFIG_REGULATOR_TPS62360=y
# CONFIG_REGULATOR_TPS65023 is not set
CONFIG_REGULATOR_TPS6507X=m
CONFIG_REGULATOR_TPS65086=m
CONFIG_REGULATOR_TPS65090=m
CONFIG_REGULATOR_TPS65132=m
# CONFIG_REGULATOR_TPS65185 is not set
# CONFIG_REGULATOR_TPS6524X is not set
# CONFIG_REGULATOR_TPS6586X is not set
CONFIG_REGULATOR_TPS65910=m
CONFIG_REGULATOR_TPS65912=y
# CONFIG_REGULATOR_TPS68470 is not set
CONFIG_REGULATOR_WM831X=m
CONFIG_REGULATOR_QCOM_LABIBB=y
# CONFIG_RC_CORE is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y
CONFIG_CEC_PIN=y

#
# CEC support
#
CONFIG_CEC_PIN_ERROR_INJ=y
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_CEC_CH7322=y
# CONFIG_CEC_NXP_TDA9950 is not set
# CONFIG_CEC_MESON_AO is not set
CONFIG_CEC_GPIO=m
# CONFIG_CEC_SAMSUNG_S5P is not set
# CONFIG_CEC_STI is not set
# CONFIG_CEC_STM32 is not set
# CONFIG_CEC_TEGRA is not set
# CONFIG_USB_EXTRON_DA_HD_4K_PLUS_CEC is not set
CONFIG_USB_PULSE8_CEC=y
# CONFIG_USB_RAINSHADOW_CEC is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
CONFIG_MEDIA_SUPPORT_FILTER=y
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set

#
# Media device types
#
# CONFIG_MEDIA_CAMERA_SUPPORT is not set
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
# CONFIG_MEDIA_RADIO_SUPPORT is not set
# CONFIG_MEDIA_SDR_SUPPORT is not set
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

CONFIG_VIDEO_DEV=y
CONFIG_MEDIA_CONTROLLER=y

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
# CONFIG_VIDEO_ADV_DEBUG is not set
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
# CONFIG_V4L2_FLASH_LED_CLASS is not set
CONFIG_V4L2_FWNODE=y
CONFIG_V4L2_ASYNC=y
CONFIG_V4L2_CCI=y
CONFIG_V4L2_CCI_I2C=y
# end of Video4Linux options

#
# Media controller options
#
# end of Media controller options

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
CONFIG_MEDIA_PCI_SUPPORT=y
# CONFIG_MEDIA_PLATFORM_DRIVERS is not set
# CONFIG_V4L_TEST_DRIVERS is not set
# end of Media drivers

#
# Media ancillary drivers
#

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_CS3308=y
CONFIG_VIDEO_CS5345=m
CONFIG_VIDEO_CS53L32A=m
CONFIG_VIDEO_MSP3400=y
# CONFIG_VIDEO_SONY_BTF_MPX is not set
CONFIG_VIDEO_TDA7432=m
CONFIG_VIDEO_TDA9840=y
# CONFIG_VIDEO_TEA6415C is not set
CONFIG_VIDEO_TEA6420=y
# CONFIG_VIDEO_TLV320AIC23B is not set
CONFIG_VIDEO_TVAUDIO=y
CONFIG_VIDEO_UDA1342=y
# CONFIG_VIDEO_VP27SMPX is not set
# CONFIG_VIDEO_WM8739 is not set
CONFIG_VIDEO_WM8775=y
# end of Audio decoders, processors and mixers

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=y
# end of RDS decoders

#
# Video decoders
#
CONFIG_VIDEO_ADV7180=m
CONFIG_VIDEO_ADV7183=y
CONFIG_VIDEO_ADV7604=m
# CONFIG_VIDEO_ADV7604_CEC is not set
CONFIG_VIDEO_ADV7842=y
CONFIG_VIDEO_ADV7842_CEC=y
# CONFIG_VIDEO_BT819 is not set
CONFIG_VIDEO_BT856=y
CONFIG_VIDEO_BT866=m
CONFIG_VIDEO_KS0127=y
CONFIG_VIDEO_ML86V7667=m
CONFIG_VIDEO_SAA7110=m
CONFIG_VIDEO_SAA711X=m
CONFIG_VIDEO_TC358743=y
# CONFIG_VIDEO_TC358743_CEC is not set
CONFIG_VIDEO_TC358746=m
CONFIG_VIDEO_TVP514X=y
CONFIG_VIDEO_TVP5150=m
# CONFIG_VIDEO_TVP7002 is not set
CONFIG_VIDEO_TW2804=y
# CONFIG_VIDEO_TW9900 is not set
CONFIG_VIDEO_TW9903=m
CONFIG_VIDEO_TW9906=y
CONFIG_VIDEO_TW9910=y
CONFIG_VIDEO_VPX3220=y

#
# Video and audio decoders
#
# CONFIG_VIDEO_SAA717X is not set
CONFIG_VIDEO_CX25840=m
# end of Video decoders

#
# Video encoders
#
CONFIG_VIDEO_ADV7170=m
CONFIG_VIDEO_ADV7175=m
CONFIG_VIDEO_ADV7343=m
CONFIG_VIDEO_ADV7393=m
CONFIG_VIDEO_ADV7511=m
# CONFIG_VIDEO_ADV7511_CEC is not set
# CONFIG_VIDEO_AK881X is not set
CONFIG_VIDEO_SAA7127=y
# CONFIG_VIDEO_SAA7185 is not set
CONFIG_VIDEO_THS8200=y
# end of Video encoders

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=m
# CONFIG_VIDEO_UPD64083 is not set
# end of Video improvement chips

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=y
# end of Audio/Video compression chips

#
# SDR tuner chips
#
# end of SDR tuner chips

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_I2C is not set
CONFIG_VIDEO_M52790=m
CONFIG_VIDEO_ST_MIPID02=y
CONFIG_VIDEO_THS7303=m
# end of Miscellaneous helper chips

#
# Video serializers and deserializers
#
# CONFIG_VIDEO_MAX96717 is not set
# end of Video serializers and deserializers

#
# Media SPI Adapters
#
CONFIG_VIDEO_GS1662=y
# end of Media SPI Adapters

#
# Tools to develop new frontends
#
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_HD44780_COMMON=y
CONFIG_HD44780=y
CONFIG_LCD2S=y
# CONFIG_PANEL_CHANGE_MESSAGE is not set
# CONFIG_CHARLCD_BL_OFF is not set
# CONFIG_CHARLCD_BL_ON is not set
CONFIG_CHARLCD_BL_FLASH=y
CONFIG_LINEDISP=y
# CONFIG_IMG_ASCII_LCD is not set
CONFIG_MAX6959=y
CONFIG_SEG_LED_GPIO=m
# CONFIG_TEGRA_HOST1X is not set
# CONFIG_IMX_IPUV3_CORE is not set
# CONFIG_DRM is not set

#
# Frame buffer Devices
#
# CONFIG_FB is not set
# CONFIG_MMP_DISP is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
# CONFIG_LCD_CLASS_DEVICE is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_AW99706 is not set
# CONFIG_BACKLIGHT_KTD253 is not set
CONFIG_BACKLIGHT_KTD2801=y
CONFIG_BACKLIGHT_KTZ8866=m
# CONFIG_BACKLIGHT_LM3533 is not set
# CONFIG_BACKLIGHT_OMAP1 is not set
CONFIG_BACKLIGHT_PWM=y
CONFIG_BACKLIGHT_DA9052=y
# CONFIG_BACKLIGHT_MT6370 is not set
# CONFIG_BACKLIGHT_APPLE_DWI is not set
CONFIG_BACKLIGHT_QCOM_WLED=m
CONFIG_BACKLIGHT_WM831X=y
CONFIG_BACKLIGHT_ADP5520=m
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_AAT2870 is not set
# CONFIG_BACKLIGHT_LM3509 is not set
CONFIG_BACKLIGHT_LM3630A=m
CONFIG_BACKLIGHT_LM3639=y
# CONFIG_BACKLIGHT_LP855X is not set
# CONFIG_BACKLIGHT_MP3309C is not set
# CONFIG_BACKLIGHT_AS3711 is not set
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
CONFIG_BACKLIGHT_BD6107=m
# CONFIG_BACKLIGHT_ARCXCNN is not set
# CONFIG_BACKLIGHT_RAVE_SP is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y
CONFIG_TRACE_GPU_MEM=y
# end of Graphics support

CONFIG_SOUND=m
CONFIG_SOUND_OSS_CORE=y
# CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
# CONFIG_SND is not set
CONFIG_HID_SUPPORT=y
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
# CONFIG_HIDRAW is not set
# CONFIG_UHID is not set
# CONFIG_HID_GENERIC is not set
# CONFIG_HID_HAPTIC is not set

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
CONFIG_HID_ACCUTOUCH=m
CONFIG_HID_ACRUX=y
# CONFIG_HID_ACRUX_FF is not set
# CONFIG_HID_APPLE is not set
CONFIG_HID_APPLEIR=m
# CONFIG_HID_APPLETB_BL is not set
# CONFIG_HID_APPLETB_KBD is not set
CONFIG_HID_ASUS=m
# CONFIG_HID_AUREAL is not set
# CONFIG_HID_BELKIN is not set
CONFIG_HID_BETOP_FF=m
CONFIG_HID_BIGBEN_FF=m
CONFIG_HID_CHERRY=y
# CONFIG_HID_CHICONY is not set
CONFIG_HID_CORSAIR=m
CONFIG_HID_COUGAR=y
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=y
CONFIG_HID_CREATIVE_SB0540=m
CONFIG_HID_CYPRESS=y
# CONFIG_HID_DRAGONRISE is not set
CONFIG_HID_EMS_FF=m
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
CONFIG_HID_ELO=m
CONFIG_HID_EVISION=y
# CONFIG_HID_EZKEY is not set
CONFIG_HID_GEMBIRD=y
# CONFIG_HID_GFRM is not set
CONFIG_HID_GLORIOUS=y
CONFIG_HID_HOLTEK=m
# CONFIG_HOLTEK_FF is not set
# CONFIG_HID_GOODIX_SPI is not set
CONFIG_HID_GOOGLE_STADIA_FF=m
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
# CONFIG_HID_KEYTOUCH is not set
CONFIG_HID_KYE=y
CONFIG_HID_KYSONA=m
CONFIG_HID_UCLOGIC=m
# CONFIG_HID_WALTOP is not set
# CONFIG_HID_VIEWSONIC is not set
CONFIG_HID_VRC2=y
# CONFIG_HID_XIAOMI is not set
CONFIG_HID_GYRATION=y
# CONFIG_HID_ICADE is not set
# CONFIG_HID_ITE is not set
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=y
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=y
CONFIG_HID_LENOVO=m
CONFIG_HID_LETSKETCH=m
CONFIG_HID_LOGITECH=m
# CONFIG_HID_LOGITECH_HIDPP is not set
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=m
CONFIG_HID_MALTRON=m
CONFIG_HID_MAYFLASH=y
# CONFIG_HID_MEGAWORLD_FF is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=y
CONFIG_HID_MONTEREY=y
CONFIG_HID_MULTITOUCH=m
CONFIG_HID_NINTENDO=y
CONFIG_NINTENDO_FF=y
CONFIG_HID_NTI=m
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=y
CONFIG_HID_PANTHERLORD=m
CONFIG_PANTHERLORD_FF=y
# CONFIG_HID_PENMOUNT is not set
# CONFIG_HID_PETALYNX is not set
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LEDS=y
# CONFIG_HID_PLANTRONICS is not set
# CONFIG_HID_PLAYSTATION is not set
CONFIG_HID_PXRC=y
CONFIG_HID_RAPOO=y
CONFIG_HID_RAZER=m
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
CONFIG_HID_ROCCAT=m
# CONFIG_HID_SAITEK is not set
# CONFIG_HID_SAMSUNG is not set
CONFIG_HID_SEMITEK=m
# CONFIG_HID_SIGMAMICRO is not set
CONFIG_HID_SONY=m
CONFIG_SONY_FF=y
# CONFIG_HID_SPEEDLINK is not set
CONFIG_HID_STEAM=m
CONFIG_STEAM_FF=y
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=y
# CONFIG_HID_RMI is not set
# CONFIG_HID_GREENASIA is not set
CONFIG_HID_SMARTJOYPLUS=y
CONFIG_SMARTJOYPLUS_FF=y
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
CONFIG_HID_TOPRE=m
CONFIG_HID_THINGM=y
# CONFIG_HID_THRUSTMASTER is not set
CONFIG_HID_UDRAW_PS3=y
CONFIG_HID_UNIVERSAL_PIDFF=m
# CONFIG_HID_WACOM is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_WINWING=m
CONFIG_HID_XINMO=y
CONFIG_HID_ZEROPLUS=y
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=y
CONFIG_HID_ALPS=m
CONFIG_HID_MCP2200=m
CONFIG_HID_MCP2221=m
# end of Special HID drivers

#
# HID-BPF support
#
# end of HID-BPF support

# CONFIG_I2C_HID is not set

#
# Intel ISH HID support
#
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# end of AMD SFH HID Support

#
# Intel THC HID Support
#
# end of Intel THC HID Support

#
# USB HID support
#
CONFIG_USB_HID=m
CONFIG_HID_PID=y
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ULPI_BUS=y
CONFIG_USB_CONN_GPIO=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_PCI is not set
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
CONFIG_USB_OTG=y
CONFIG_USB_OTG_PRODUCTLIST=y
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
# CONFIG_USB_OTG_FSM is not set
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_DEFAULT_AUTHORIZATION_MODE=1
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=m
# CONFIG_USB_XHCI_HCD is not set
# CONFIG_USB_BRCMSTB is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_FSL=m
# CONFIG_USB_EHCI_HCD_NPCM7XX is not set
# CONFIG_USB_EHCI_HCD_OMAP is not set
# CONFIG_USB_EHCI_HCD_ORION is not set
# CONFIG_USB_EHCI_HCD_SPEAR is not set
# CONFIG_USB_EHCI_HCD_AT91 is not set
# CONFIG_USB_EHCI_SH is not set
# CONFIG_USB_EHCI_EXYNOS is not set
# CONFIG_USB_EHCI_MV is not set
CONFIG_USB_EHCI_HCD_PLATFORM=m
CONFIG_USB_OXU210HP_HCD=m
# CONFIG_USB_ISP116X_HCD is not set
CONFIG_USB_MAX3421_HCD=y
CONFIG_USB_OHCI_HCD=m
# CONFIG_USB_OHCI_HCD_SPEAR is not set
# CONFIG_USB_OHCI_HCD_S3C2410 is not set
CONFIG_USB_OHCI_HCD_LPC32XX=m
# CONFIG_USB_OHCI_HCD_OMAP3 is not set
# CONFIG_USB_OHCI_HCD_DAVINCI is not set
CONFIG_USB_OHCI_HCD_SSB=y
# CONFIG_USB_OHCI_EXYNOS is not set
CONFIG_USB_OHCI_HCD_PLATFORM=m
# CONFIG_USB_SL811_HCD is not set
CONFIG_USB_R8A66597_HCD=m
# CONFIG_USB_HCD_BCMA is not set
CONFIG_USB_HCD_SSB=m
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
CONFIG_USB_PRINTER=y
CONFIG_USB_WDM=m
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may also be needed; see USB_STORAGE Help for more info
#
# CONFIG_USB_STORAGE is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set

#
# USB dual-mode controller drivers
#
CONFIG_USB_CDNS_SUPPORT=m
# CONFIG_USB_CDNS3 is not set
# CONFIG_USB_FOTG210 is not set
# CONFIG_USB_MTU3 is not set
CONFIG_USB_MUSB_HDRC=y
CONFIG_USB_MUSB_HOST=y

#
# Platform Glue Layer
#
# CONFIG_USB_MUSB_TUSB6010 is not set
# CONFIG_USB_MUSB_OMAP2PLUS is not set
# CONFIG_USB_MUSB_UX500 is not set
# CONFIG_USB_MUSB_MEDIATEK is not set
# CONFIG_USB_MUSB_POLARFIRE_SOC is not set

#
# MUSB DMA mode
#
CONFIG_MUSB_PIO_ONLY=y
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
CONFIG_USB_CHIPIDEA=y
# CONFIG_USB_CHIPIDEA_HOST is not set
CONFIG_USB_CHIPIDEA_MSM=y
CONFIG_USB_CHIPIDEA_NPCM=y
CONFIG_USB_CHIPIDEA_GENERIC=y
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y

#
# USB port drivers
#
# CONFIG_USB_SERIAL is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=y
CONFIG_USB_EMI26=m
CONFIG_USB_ADUTUX=y
CONFIG_USB_SEVSEG=y
CONFIG_USB_LEGOTOWER=m
CONFIG_USB_LCD=m
CONFIG_USB_CYPRESS_CY7C63=y
# CONFIG_USB_CYTHERM is not set
CONFIG_USB_IDMOUSE=m
CONFIG_USB_APPLEDISPLAY=y
# CONFIG_USB_QCOM_EUD is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
CONFIG_USB_SISUSBVGA=m
CONFIG_USB_LD=y
CONFIG_USB_TRANCEVIBRATOR=y
CONFIG_USB_IOWARRIOR=m
# CONFIG_USB_TEST is not set
CONFIG_USB_EHSET_TEST_FIXTURE=y
CONFIG_USB_ISIGHTFW=y
# CONFIG_USB_YUREX is not set
CONFIG_USB_EZUSB_FX2=y
CONFIG_USB_HUB_USB251XB=y
CONFIG_USB_HSIC_USB3503=m
# CONFIG_USB_HSIC_USB4604 is not set
CONFIG_USB_LINK_LAYER_TEST=m
# CONFIG_BRCM_USB_PINMAP is not set

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_KEYSTONE_USB_PHY is not set
CONFIG_NOP_USB_XCEIV=y
# CONFIG_AM335X_PHY_USB is not set
# CONFIG_TAHVO_USB is not set
CONFIG_USB_ISP1301=y
# CONFIG_USB_TEGRA_PHY is not set
# CONFIG_USB_ULPI is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=m
CONFIG_TYPEC_TCPM=m
CONFIG_TYPEC_TCPCI=m
CONFIG_TYPEC_RT1711H=m
CONFIG_TYPEC_MT6360=m
CONFIG_TYPEC_TCPCI_MT6370=m
CONFIG_TYPEC_TCPCI_MAXIM=m
# CONFIG_TYPEC_FUSB302 is not set
# CONFIG_TYPEC_QCOM_PMIC is not set
# CONFIG_TYPEC_UCSI is not set
CONFIG_TYPEC_TPS6598X=m
CONFIG_TYPEC_ANX7411=m
CONFIG_TYPEC_RT1719=m
CONFIG_TYPEC_HD3SS3220=m
CONFIG_TYPEC_STUSB160X=m
CONFIG_TYPEC_WUSB3801=m

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_FSA4480 is not set
CONFIG_TYPEC_MUX_GPIO_SBU=m
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
CONFIG_TYPEC_MUX_IT5205=m
CONFIG_TYPEC_MUX_NB7VPQ904M=m
CONFIG_TYPEC_MUX_PS883X=m
CONFIG_TYPEC_MUX_PTN36502=m
# CONFIG_TYPEC_MUX_TUSB1046 is not set
CONFIG_TYPEC_MUX_WCD939X_USBSS=m
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
CONFIG_TYPEC_TBT_ALTMODE=m
# end of USB Type-C Alternate Mode drivers

CONFIG_USB_ROLE_SWITCH=y
CONFIG_MMC=y
CONFIG_MMC_BLOCK=y
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=y
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
# CONFIG_MMC_SUNPLUS is not set
# CONFIG_MMC_PXA is not set
# CONFIG_MMC_SDHCI is not set
# CONFIG_MMC_MESON_GX is not set
# CONFIG_MMC_MOXART is not set
# CONFIG_MMC_OMAP_HS is not set
# CONFIG_MMC_ALCOR is not set
# CONFIG_MMC_MXC is not set
CONFIG_MMC_TIFM_SD=m
# CONFIG_MMC_DAVINCI is not set
# CONFIG_MMC_SPI is not set
CONFIG_MMC_SDRICOH_CS=m
# CONFIG_MMC_SDHI is not set
CONFIG_MMC_CB710=y
CONFIG_MMC_VIA_SDMMC=y
# CONFIG_MMC_DW is not set
# CONFIG_MMC_SH_MMCIF is not set
# CONFIG_MMC_VUB300 is not set
CONFIG_MMC_USHC=y
# CONFIG_MMC_WMT is not set
CONFIG_MMC_USDHI6ROL0=m
CONFIG_MMC_REALTEK_PCI=m
CONFIG_MMC_CQHCI=m
CONFIG_MMC_HSQ=y
CONFIG_MMC_TOSHIBA_PCI=m
# CONFIG_MMC_BCM2835 is not set
CONFIG_MMC_MTK=m
# CONFIG_MMC_OWL is not set
# CONFIG_MMC_LOONGSON2 is not set
# CONFIG_MMC_LITEX is not set
CONFIG_SCSI_UFSHCD=y
CONFIG_SCSI_UFS_BSG=y
# CONFIG_SCSI_UFSHCD_PCI is not set
CONFIG_SCSI_UFSHCD_PLATFORM=y
CONFIG_SCSI_UFS_CDNS_PLATFORM=y
# CONFIG_SCSI_UFS_HISI is not set
# CONFIG_SCSI_UFS_RENESAS is not set
# CONFIG_SCSI_UFS_EXYNOS is not set
# CONFIG_SCSI_UFS_SPRD is not set
# CONFIG_SCSI_UFS_ROCKCHIP is not set
# CONFIG_SCSI_UFS_AMD_VERSAL2 is not set
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set
CONFIG_MSPRO_BLOCK=y
# CONFIG_MS_BLOCK is not set

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=y
CONFIG_MEMSTICK_JMICRON_38X=y
# CONFIG_MEMSTICK_R592 is not set
CONFIG_LEDS_EXPRESSWIRE=y
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=m
CONFIG_LEDS_CLASS_MULTICOLOR=m
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
CONFIG_LEDS_KUNIT_TEST=m

#
# LED drivers
#
# CONFIG_LEDS_ARIEL is not set
# CONFIG_LEDS_OSRAM_AMS_AS3668 is not set
# CONFIG_LEDS_AW200XX is not set
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3532=y
# CONFIG_LEDS_LM3533 is not set
CONFIG_LEDS_LM3642=y
# CONFIG_LEDS_MT6323 is not set
# CONFIG_LEDS_COBALT_QUBE is not set
# CONFIG_LEDS_COBALT_RAQ is not set
# CONFIG_LEDS_SUN50I_A100 is not set
# CONFIG_LEDS_PCA9532 is not set
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=y
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP50XX=m
# CONFIG_LEDS_PCA955X is not set
CONFIG_LEDS_PCA963X=m
CONFIG_LEDS_PCA995X=m
CONFIG_LEDS_QNAP_MCU=m
# CONFIG_LEDS_WM831X_STATUS is not set
# CONFIG_LEDS_DA9052 is not set
CONFIG_LEDS_DAC124S085=y
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_REGULATOR is not set
CONFIG_LEDS_BD2606MVV=y
CONFIG_LEDS_BD2802=m
# CONFIG_LEDS_LT3593 is not set
CONFIG_LEDS_ADP5520=y
CONFIG_LEDS_MC13783=m
# CONFIG_LEDS_NS2 is not set
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=m
# CONFIG_LEDS_MAX77705 is not set
# CONFIG_LEDS_LM355x is not set
CONFIG_LEDS_MENF21BMC=m
CONFIG_LEDS_IS31FL319X=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_MLXREG=y
CONFIG_LEDS_USER=m
# CONFIG_LEDS_SPI_BYTE is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set
# CONFIG_LEDS_TPS6105X is not set
# CONFIG_LEDS_IP30 is not set

#
# Flash and Torch LED drivers
#
# CONFIG_LEDS_AS3645A is not set
# CONFIG_LEDS_LM3601X is not set
# CONFIG_LEDS_MT6370_FLASH is not set
CONFIG_LEDS_RT8515=m
CONFIG_LEDS_SGM3140=m

#
# RGB LED drivers
#
CONFIG_LEDS_KTD202X=m
CONFIG_LEDS_LP5812=m
CONFIG_LEDS_PWM_MULTICOLOR=m
CONFIG_LEDS_MT6370_RGB=m

#
# LED Triggers
#
# CONFIG_LEDS_TRIGGERS is not set

#
# Simatic LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
CONFIG_DMABUF_DEBUG=y
CONFIG_DMABUF_SELFTESTS=y
CONFIG_DMABUF_HEAPS=y
CONFIG_DMABUF_HEAPS_SYSTEM=y
# end of DMABUF options

CONFIG_UIO=y
CONFIG_UIO_CIF=m
# CONFIG_UIO_PDRV_GENIRQ is not set
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=y
CONFIG_UIO_SERCOS3=m
CONFIG_UIO_PCI_GENERIC=y
CONFIG_UIO_NETX=y
CONFIG_UIO_MF624=y
CONFIG_VFIO=y
CONFIG_VFIO_GROUP=y
CONFIG_VFIO_CONTAINER=y
# CONFIG_VFIO_NOIOMMU is not set
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO_DEBUGFS=y

#
# VFIO support for PCI devices
#
CONFIG_VFIO_PCI_CORE=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=m
# CONFIG_VIRTIO_VFIO_PCI is not set
# CONFIG_NVGRACE_GPU_VFIO_PCI is not set
CONFIG_QAT_VFIO_PCI=y
# end of VFIO support for PCI devices

#
# VFIO support for platform devices
#
# CONFIG_VFIO_PLATFORM is not set
# CONFIG_VFIO_AMBA is not set
# end of VFIO support for platform devices

CONFIG_IRQ_BYPASS_MANAGER=y
# CONFIG_VIRT_DRIVERS is not set
CONFIG_TSM=y
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_ADMIN_LEGACY=y
# CONFIG_VIRTIO_PCI_LEGACY is not set
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
CONFIG_VIRTIO_MMIO=m
CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
CONFIG_VIRTIO_DEBUG=y
CONFIG_VIRTIO_RTC=m

#
# WARNING: Consider enabling VIRTIO_RTC_PTP and/or VIRTIO_RTC_CLASS.
#

#
# Enable PTP_1588_CLOCK in order to enable VIRTIO_RTC_PTP.
#

#
# Enable RTC_CLASS in order to enable VIRTIO_RTC_CLASS.
#
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
# CONFIG_GPIB is not set
CONFIG_STAGING=y

#
# IIO staging drivers
#

#
# Accelerometers
#
CONFIG_ADIS16203=m
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD7816=m
# end of Analog to digital converters

#
# Analog digital bi-direction converters
#
CONFIG_ADT7316=m
CONFIG_ADT7316_SPI=m
# CONFIG_ADT7316_I2C is not set
# end of Analog digital bi-direction converters

#
# Direct Digital Synthesis
#
CONFIG_AD9832=m
# CONFIG_AD9834 is not set
# end of Direct Digital Synthesis

#
# Network Analyzer, Impedance Converters
#
# CONFIG_AD5933 is not set
# end of Network Analyzer, Impedance Converters
# end of IIO staging drivers

CONFIG_STAGING_MEDIA=y
# CONFIG_VIDEO_MESON_VDEC is not set

#
# StarFive media platform drivers
#
# CONFIG_VIDEO_SUNXI is not set
# CONFIG_STAGING_MEDIA_DEPRECATED is not set
CONFIG_MOST_COMPONENTS=m
CONFIG_MOST_VIDEO=m
# CONFIG_VME_BUS is not set
# CONFIG_GOLDFISH is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_CZNIC_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
# CONFIG_OLPC_XO175 is not set
# CONFIG_SURFACE_PLATFORMS is not set
# CONFIG_ARM64_PLATFORM_DEVICES is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=m

#
# Clock driver for ARM Reference designs
#
# CONFIG_CLK_ICST is not set
# CONFIG_CLK_SP810 is not set
# end of Clock driver for ARM Reference designs

# CONFIG_CLK_HSDK is not set
CONFIG_LMK04832=y
# CONFIG_COMMON_CLK_APPLE_NCO is not set
# CONFIG_COMMON_CLK_MAX77686 is not set
CONFIG_COMMON_CLK_MAX9485=y
# CONFIG_COMMON_CLK_RP1 is not set
# CONFIG_COMMON_CLK_SCMI is not set
# CONFIG_COMMON_CLK_SCPI is not set
CONFIG_COMMON_CLK_SI5341=y
CONFIG_COMMON_CLK_SI5351=m
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_BM1880 is not set
CONFIG_COMMON_CLK_CDCE706=m
# CONFIG_COMMON_CLK_TPS68470 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_EP93XX is not set
# CONFIG_COMMON_CLK_EYEQ is not set
# CONFIG_COMMON_CLK_FSL_FLEXSPI is not set
# CONFIG_COMMON_CLK_FSL_SAI is not set
# CONFIG_COMMON_CLK_GEMINI is not set
# CONFIG_COMMON_CLK_S2MPS11 is not set
# CONFIG_CLK_LS1028A_PLLDIG is not set
# CONFIG_COMMON_CLK_XGENE is not set
# CONFIG_COMMON_CLK_NPCM8XX is not set
# CONFIG_COMMON_CLK_LOONGSON2 is not set
# CONFIG_COMMON_CLK_PALMAS is not set
CONFIG_COMMON_CLK_PWM=y
# CONFIG_COMMON_CLK_MMP2_AUDIO is not set
# CONFIG_COMMON_CLK_SP7021 is not set
# CONFIG_COMMON_CLK_RPMI is not set
# CONFIG_CLK_ACTIONS is not set
# CONFIG_COMMON_CLK_ASPEED is not set
# CONFIG_COMMON_CLK_AST2700 is not set
# CONFIG_CLK_BAIKAL_T1 is not set
# CONFIG_CLK_BCM2711_DVP is not set
# CONFIG_CLK_BCM2835 is not set
# CONFIG_CLK_BCM_63XX is not set
# CONFIG_CLK_BCM_63XX_GATE is not set
# CONFIG_CLK_BCM63268_TIMER is not set
# CONFIG_CLK_BCM_KONA is not set
# CONFIG_CLK_BCM_CYGNUS is not set
# CONFIG_CLK_BCM_HR2 is not set
# CONFIG_CLK_BCM_NSP is not set
# CONFIG_CLK_BCM_NS2 is not set
# CONFIG_CLK_BCM_SR is not set
# CONFIG_CLK_RASPBERRYPI is not set
# CONFIG_COMMON_CLK_HI3516CV300 is not set
# CONFIG_COMMON_CLK_HI3519 is not set
# CONFIG_COMMON_CLK_HI3559A is not set
# CONFIG_COMMON_CLK_HI3660 is not set
# CONFIG_COMMON_CLK_HI3670 is not set
# CONFIG_COMMON_CLK_HI3798CV200 is not set
# CONFIG_COMMON_CLK_HI6220 is not set
# CONFIG_RESET_HISI is not set
# CONFIG_COMMON_CLK_BOSTON is not set
# CONFIG_MXC_CLK is not set
# CONFIG_CLK_IMX8MM is not set
# CONFIG_CLK_IMX8MN is not set
# CONFIG_CLK_IMX8MP is not set
# CONFIG_CLK_IMX8MQ is not set
# CONFIG_CLK_IMX8ULP is not set
# CONFIG_CLK_IMX93 is not set
# CONFIG_CLK_IMX95_BLK_CTL is not set
# CONFIG_CLK_IMXRT1050 is not set

#
# Ingenic SoCs drivers
#
# CONFIG_INGENIC_CGU_JZ4740 is not set
# CONFIG_INGENIC_CGU_JZ4755 is not set
# CONFIG_INGENIC_CGU_JZ4725B is not set
# CONFIG_INGENIC_CGU_JZ4760 is not set
# CONFIG_INGENIC_CGU_JZ4770 is not set
# CONFIG_INGENIC_CGU_JZ4780 is not set
# CONFIG_INGENIC_CGU_X1000 is not set
# CONFIG_INGENIC_CGU_X1830 is not set
# CONFIG_INGENIC_TCU_CLK is not set
# end of Ingenic SoCs drivers

# CONFIG_TI_SYSCON_CLK is not set

#
# Clock driver for MediaTek SoC
#
# CONFIG_COMMON_CLK_MEDIATEK_FHCTL is not set
# CONFIG_COMMON_CLK_MT2701 is not set
# CONFIG_COMMON_CLK_MT2712 is not set
# CONFIG_COMMON_CLK_MT6735 is not set
# CONFIG_COMMON_CLK_MT6765 is not set
# CONFIG_COMMON_CLK_MT6779 is not set
# CONFIG_COMMON_CLK_MT6795 is not set
# CONFIG_COMMON_CLK_MT6797 is not set
# CONFIG_COMMON_CLK_MT7622 is not set
# CONFIG_COMMON_CLK_MT7629 is not set
# CONFIG_COMMON_CLK_MT7981 is not set
# CONFIG_COMMON_CLK_MT7986 is not set
# CONFIG_COMMON_CLK_MT7988 is not set
# CONFIG_COMMON_CLK_MT8135 is not set
# CONFIG_COMMON_CLK_MT8167 is not set
# CONFIG_COMMON_CLK_MT8173 is not set
# CONFIG_COMMON_CLK_MT8183 is not set
# CONFIG_COMMON_CLK_MT8186 is not set
# CONFIG_COMMON_CLK_MT8188 is not set
# CONFIG_COMMON_CLK_MT8192 is not set
# CONFIG_COMMON_CLK_MT8195 is not set
# CONFIG_COMMON_CLK_MT8196 is not set
# CONFIG_COMMON_CLK_MT8365 is not set
# CONFIG_COMMON_CLK_MT8516 is not set
# end of Clock driver for MediaTek SoC

#
# Clock support for Amlogic platforms
#
# end of Clock support for Amlogic platforms

# CONFIG_MSTAR_MSC313_CPUPLL is not set
# CONFIG_MSTAR_MSC313_MPLL is not set
CONFIG_MCHP_CLK_MPFS=y
# CONFIG_COMMON_CLK_NUVOTON is not set
# CONFIG_COMMON_CLK_PISTACHIO is not set
# CONFIG_CLK_MT7621 is not set
# CONFIG_CLK_MTMIPS is not set
# CONFIG_CLK_RENESAS is not set
# CONFIG_EXYNOS_ACPM_CLK is not set
# CONFIG_CLK_SIFIVE is not set
# CONFIG_CLK_INTEL_SOCFPGA is not set
# CONFIG_CLK_SOPHGO_CV1800 is not set
# CONFIG_CLK_SOPHGO_SG2042_PLL is not set
# CONFIG_CLK_SOPHGO_SG2044 is not set
# CONFIG_CLK_SOPHGO_SG2044_PLL is not set

#
# Clock support for SpacemiT platforms
#
# CONFIG_SPACEMIT_K1_CCU is not set
# CONFIG_SPACEMIT_K3_CCU is not set
# end of Clock support for SpacemiT platforms

# CONFIG_SPRD_COMMON_CLK is not set
# CONFIG_CLK_STARFIVE_JH7100 is not set
# CONFIG_CLK_STARFIVE_JH7110_PLL is not set
# CONFIG_CLK_STARFIVE_JH7110_SYS is not set
# CONFIG_CLK_SUNXI is not set
# CONFIG_SUNXI_CCU is not set
# CONFIG_CLK_THEAD_TH1520_AP is not set
# CONFIG_COMMON_CLK_STM32MP is not set
# CONFIG_COMMON_CLK_TI_ADPLL is not set
# CONFIG_COMMON_CLK_VISCONTI is not set
# CONFIG_XILINX_VCU is not set
# CONFIG_COMMON_CLK_ZYNQMP is not set
# CONFIG_CLK_KUNIT_TEST is not set
CONFIG_CLK_FIXED_RATE_KUNIT_TEST=m
CONFIG_CLK_GATE_KUNIT_TEST=m
# CONFIG_CLK_FD_KUNIT_TEST is not set
CONFIG_HWSPINLOCK=y
# CONFIG_HWSPINLOCK_OMAP is not set
# CONFIG_HWSPINLOCK_QCOM is not set
# CONFIG_HWSPINLOCK_SPRD is not set
# CONFIG_HWSPINLOCK_STM32 is not set
# CONFIG_HWSPINLOCK_SUN6I is not set
# CONFIG_HSEM_U8500 is not set

#
# Clock Source drivers
#
# CONFIG_BCM2835_TIMER is not set
# CONFIG_BCM_KONA_TIMER is not set
# CONFIG_DAVINCI_TIMER is not set
# CONFIG_DIGICOLOR_TIMER is not set
# CONFIG_OMAP_DM_TIMER is not set
# CONFIG_DW_APB_TIMER is not set
# CONFIG_ECONET_EN751221_TIMER is not set
# CONFIG_FTTMR010_TIMER is not set
# CONFIG_IXP4XX_TIMER is not set
# CONFIG_MESON6_TIMER is not set
# CONFIG_OWL_TIMER is not set
# CONFIG_RDA_TIMER is not set
# CONFIG_REALTEK_OTTO_TIMER is not set
# CONFIG_SUN4I_TIMER is not set
# CONFIG_SUN5I_HSTIMER is not set
# CONFIG_TEGRA_TIMER is not set
# CONFIG_VT8500_TIMER is not set
# CONFIG_NPCM7XX_TIMER is not set
# CONFIG_CADENCE_TTC_TIMER is not set
# CONFIG_ASM9260_TIMER is not set
# CONFIG_CLKSRC_DBX500_PRCMU is not set
# CONFIG_CLPS711X_TIMER is not set
# CONFIG_MXS_TIMER is not set
# CONFIG_NSPIRE_TIMER is not set
# CONFIG_CLKSRC_PISTACHIO is not set
# CONFIG_CLKSRC_STM32_LP is not set
# CONFIG_ARMV7M_SYSTICK is not set
# CONFIG_ATMEL_PIT is not set
# CONFIG_ATMEL_ST is not set
# CONFIG_CLKSRC_SAMSUNG_PWM is not set
# CONFIG_FSL_FTM_TIMER is not set
# CONFIG_NXP_PIT_TIMER is not set
# CONFIG_MTK_TIMER is not set
# CONFIG_MTK_CPUX_TIMER is not set
# CONFIG_SH_TIMER_CMT is not set
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_RENESAS_OSTM is not set
# CONFIG_SH_TIMER_TMU is not set
# CONFIG_EM_TIMER_STI is not set
# CONFIG_CLKSRC_PXA is not set
# CONFIG_TIMER_IMX_SYS_CTR is not set
# CONFIG_CLKSRC_LOONGSON1_PWM is not set
# CONFIG_CLKSRC_ST_LPC is not set
# CONFIG_GXP_TIMER is not set
# CONFIG_MSC313E_TIMER is not set
# CONFIG_INGENIC_TIMER is not set
# CONFIG_INGENIC_SYSOST is not set
# CONFIG_INGENIC_OST is not set
# CONFIG_RALINK_TIMER is not set
# CONFIG_NXP_STM_TIMER is not set
# end of Clock Source drivers

CONFIG_MAILBOX=y
# CONFIG_AST2700_MBOX is not set
# CONFIG_CV1800_MBOX is not set
# CONFIG_EXYNOS_MBOX is not set
# CONFIG_IMX_MBOX is not set
# CONFIG_OMAP2PLUS_MBOX is not set
# CONFIG_ROCKCHIP_MBOX is not set
CONFIG_ALTERA_MBOX=m
# CONFIG_TI_MESSAGE_MANAGER is not set
# CONFIG_POLARFIRE_SOC_MAILBOX is not set
# CONFIG_QCOM_APCS_IPC is not set
# CONFIG_BCM_PDC_MBOX is not set
# CONFIG_STM32_IPCC is not set
# CONFIG_MTK_ADSP_MBOX is not set
# CONFIG_MTK_CMDQ_MBOX is not set
# CONFIG_MTK_GPUEB_MBOX is not set
# CONFIG_MTK_VCP_MBOX is not set
# CONFIG_SUN6I_MSGBOX is not set
# CONFIG_SPRD_MBOX is not set
# CONFIG_QCOM_CPUCP_MBOX is not set
# CONFIG_QCOM_IPCC is not set
# CONFIG_THEAD_TH1520_MBOX is not set
# CONFIG_BCM74110_MAILBOX is not set
CONFIG_IOMMU_API=y
# CONFIG_IOMMU_SUPPORT is not set
# CONFIG_GENERIC_PT is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_CTRL=y
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_QCOM_GLINK=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# CONFIG_MESON_CANVAS is not set
# CONFIG_MESON_CLK_MEASURE is not set
# CONFIG_MESON_GX_SOCINFO is not set
# CONFIG_MESON_MX_SOCINFO is not set
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
# CONFIG_APPLE_MAILBOX is not set
# CONFIG_APPLE_SART is not set
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
# CONFIG_ASPEED_LPC_CTRL is not set
# CONFIG_ASPEED_LPC_SNOOP is not set
# CONFIG_ASPEED_UART_ROUTING is not set
# CONFIG_ASPEED_P2A_CTRL is not set
# CONFIG_ASPEED_SOCINFO is not set
# end of ASPEED SoC drivers

# CONFIG_AT91_SOC_ID is not set
# CONFIG_AT91_SOC_SFR is not set

#
# Broadcom SoC drivers
#
# CONFIG_SOC_BRCMSTB is not set
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# CONFIG_FSL_DPAA is not set
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# Hisilicon SoC drivers
#
# end of Hisilicon SoC drivers

#
# i.MX SoC drivers
#
# CONFIG_SOC_IMX8M is not set
# CONFIG_SOC_IMX9 is not set
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
# CONFIG_IXP4XX_QMGR is not set
# CONFIG_IXP4XX_NPE is not set
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

# CONFIG_LOONGSON2_GUTS is not set

#
# MediaTek SoC drivers
#
# CONFIG_MTK_CMDQ is not set
# CONFIG_MTK_DEVAPC is not set
# CONFIG_MTK_INFRACFG is not set
# CONFIG_MTK_REGULATOR_COUPLER is not set
# CONFIG_MTK_MMSYS is not set
# end of MediaTek SoC drivers

CONFIG_WPCM450_SOC=m

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_AOSS_QMP is not set
# CONFIG_QCOM_GENI_SE is not set
# CONFIG_QCOM_GSBI is not set
# CONFIG_QCOM_LLCC is not set
# CONFIG_QCOM_RAMP_CTRL is not set
# CONFIG_QCOM_RMTFS_MEM is not set
# CONFIG_QCOM_RPM_MASTER_STATS is not set
# CONFIG_QCOM_RPMH is not set
# CONFIG_QCOM_SMEM is not set
# CONFIG_QCOM_SMD_RPM is not set
# CONFIG_QCOM_SPM is not set
# CONFIG_QCOM_WCNSS_CTRL is not set
# CONFIG_QCOM_ICC_BWMON is not set
CONFIG_QCOM_PBS=m
# end of Qualcomm SoC drivers

# CONFIG_SOC_RENESAS is not set
# CONFIG_ROCKCHIP_GRF is not set
# CONFIG_SOC_SAMSUNG is not set

#
# Sophgo SoC drivers
#
# CONFIG_SOPHGO_CV1800_RTCSYS is not set
# CONFIG_SOPHGO_SG2044_TOPSYS is not set
# end of Sophgo SoC drivers

# CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
CONFIG_SOC_TI=y
# CONFIG_TI_K3_SOCINFO is not set
# CONFIG_TI_PRUSS is not set
# CONFIG_UX500_SOC_ID is not set
# CONFIG_SOC_INTEGRATOR_CM is not set
# CONFIG_SOC_REALVIEW is not set

#
# VIA/WonderMedia SoC drivers
#
# CONFIG_WMT_SOCINFO is not set
# end of VIA/WonderMedia SoC drivers

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

#
# PM Domains
#
# CONFIG_OWL_PM_DOMAINS is not set

#
# Amlogic PM Domains
#
# end of Amlogic PM Domains

# CONFIG_APPLE_PMGR_PWRSTATE is not set

#
# Broadcom PM Domains
#
# end of Broadcom PM Domains

#
# i.MX PM Domains
#
# end of i.MX PM Domains

#
# Marvell PM Domains
#
# end of Marvell PM Domains

#
# MediaTek PM Domains
#
# CONFIG_MTK_SCPSYS_PM_DOMAINS is not set
# end of MediaTek PM Domains

#
# Qualcomm PM Domains
#
# end of Qualcomm PM Domains

# CONFIG_UX500_PM_DOMAIN is not set
# CONFIG_JH71XX_PMU is not set
# CONFIG_SUN20I_PPU is not set
# CONFIG_SUN50I_H6_PRCM_PPU is not set
# CONFIG_SUN55I_PCK600 is not set
# end of PM Domains

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
CONFIG_DEVFREQ_GOV_USERSPACE=m
# CONFIG_DEVFREQ_GOV_PASSIVE is not set

#
# DEVFREQ Drivers
#
# CONFIG_ARM_EXYNOS_BUS_DEVFREQ is not set
# CONFIG_ARM_IMX_BUS_DEVFREQ is not set
# CONFIG_ARM_TEGRA_DEVFREQ is not set
# CONFIG_ARM_MEDIATEK_CCI_DEVFREQ is not set
# CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ is not set
# CONFIG_PM_DEVFREQ_EVENT is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ADC_JACK is not set
CONFIG_EXTCON_FSA9480=y
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_LC824206XA=m
CONFIG_EXTCON_MAX3355=y
# CONFIG_EXTCON_MAX77693 is not set
CONFIG_EXTCON_MAX14526=m
CONFIG_EXTCON_PALMAS=y
CONFIG_EXTCON_PTN5150=m
# CONFIG_EXTCON_QCOM_SPMI_MISC is not set
# CONFIG_EXTCON_RT8973A is not set
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=m
# CONFIG_EXTCON_USBC_TUSB320 is not set
# CONFIG_EXTCON_RTK_TYPE_C is not set
# CONFIG_MEMORY is not set
CONFIG_IIO=m
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=m
CONFIG_IIO_BUFFER_DMA=m
CONFIG_IIO_BUFFER_DMAENGINE=m
CONFIG_IIO_BUFFER_HW_CONSUMER=m
CONFIG_IIO_KFIFO_BUF=m
CONFIG_IIO_TRIGGERED_BUFFER=m
CONFIG_IIO_CONFIGFS=m
CONFIG_IIO_GTS_HELPER=m
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=m
CONFIG_IIO_SW_TRIGGER=m
CONFIG_IIO_TRIGGERED_EVENT=m
CONFIG_IIO_BACKEND=m

#
# Accelerometers
#
CONFIG_ADIS16201=m
CONFIG_ADIS16209=m
CONFIG_ADXL313=m
# CONFIG_ADXL313_I2C is not set
CONFIG_ADXL313_SPI=m
# CONFIG_ADXL345_I2C is not set
# CONFIG_ADXL345_SPI is not set
CONFIG_ADXL355=m
# CONFIG_ADXL355_I2C is not set
CONFIG_ADXL355_SPI=m
CONFIG_ADXL367=m
CONFIG_ADXL367_SPI=m
CONFIG_ADXL367_I2C=m
CONFIG_ADXL372=m
# CONFIG_ADXL372_SPI is not set
CONFIG_ADXL372_I2C=m
CONFIG_ADXL380=m
CONFIG_ADXL380_SPI=m
CONFIG_ADXL380_I2C=m
CONFIG_BMA180=m
CONFIG_BMA220=m
CONFIG_BMA220_I2C=m
CONFIG_BMA220_SPI=m
# CONFIG_BMA400 is not set
CONFIG_BMC150_ACCEL=m
CONFIG_BMC150_ACCEL_I2C=m
CONFIG_BMC150_ACCEL_SPI=m
# CONFIG_BMI088_ACCEL is not set
CONFIG_DA280=m
CONFIG_DA311=m
CONFIG_DMARD06=m
CONFIG_DMARD09=m
CONFIG_DMARD10=m
CONFIG_FXLS8962AF=m
CONFIG_FXLS8962AF_I2C=m
CONFIG_FXLS8962AF_SPI=m
# CONFIG_HID_SENSOR_ACCEL_3D is not set
CONFIG_IIO_KX022A=m
# CONFIG_IIO_KX022A_SPI is not set
CONFIG_IIO_KX022A_I2C=m
# CONFIG_KXSD9 is not set
# CONFIG_KXCJK1013 is not set
CONFIG_MC3230=m
CONFIG_MMA7455=m
# CONFIG_MMA7455_I2C is not set
CONFIG_MMA7455_SPI=m
# CONFIG_MMA7660 is not set
# CONFIG_MMA8452 is not set
CONFIG_MMA9551_CORE=m
# CONFIG_MMA9551 is not set
CONFIG_MMA9553=m
CONFIG_MSA311=m
# CONFIG_MXC4005 is not set
CONFIG_MXC6255=m
# CONFIG_SCA3000 is not set
CONFIG_SCA3300=m
CONFIG_STK8312=m
CONFIG_STK8BA50=m
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD_SIGMA_DELTA=m
# CONFIG_AD4000 is not set
# CONFIG_AD4030 is not set
# CONFIG_AD4080 is not set
# CONFIG_AD4130 is not set
CONFIG_AD4134=m
CONFIG_AD4170_4=m
CONFIG_AD4695=m
CONFIG_AD4851=m
CONFIG_AD7091R=m
CONFIG_AD7091R5=m
CONFIG_AD7091R8=m
# CONFIG_AD7124 is not set
# CONFIG_AD7173 is not set
CONFIG_AD7191=m
# CONFIG_AD7192 is not set
CONFIG_AD7266=m
CONFIG_AD7280=m
# CONFIG_AD7291 is not set
CONFIG_AD7292=m
CONFIG_AD7298=m
CONFIG_AD7380=m
CONFIG_AD7405=m
CONFIG_AD7476=m
# CONFIG_AD7606_IFACE_SPI is not set
CONFIG_AD7625=m
CONFIG_AD7766=m
CONFIG_AD7768_1=m
# CONFIG_AD7779 is not set
# CONFIG_AD7780 is not set
CONFIG_AD7791=m
CONFIG_AD7793=m
# CONFIG_AD7887 is not set
# CONFIG_AD7923 is not set
# CONFIG_AD7944 is not set
CONFIG_AD7949=m
# CONFIG_AD799X is not set
CONFIG_AD9467=m
CONFIG_ADE9000=m
# CONFIG_ADI_AXI_ADC is not set
# CONFIG_ASPEED_ADC is not set
# CONFIG_AT91_SAMA5D2_ADC is not set
CONFIG_AXP20X_ADC=m
CONFIG_AXP288_ADC=m
# CONFIG_BCM_IPROC_ADC is not set
# CONFIG_BERLIN2_ADC is not set
CONFIG_CC10001_ADC=m
CONFIG_ENVELOPE_DETECTOR=m
# CONFIG_EP93XX_ADC is not set
# CONFIG_GEHC_PMC_ADC is not set
CONFIG_HI8435=m
CONFIG_HX711=m
# CONFIG_INA2XX_ADC is not set
# CONFIG_INGENIC_ADC is not set
# CONFIG_IMX7D_ADC is not set
# CONFIG_IMX8QXP_ADC is not set
# CONFIG_IMX93_ADC is not set
# CONFIG_LPC18XX_ADC is not set
# CONFIG_LPC32XX_ADC is not set
CONFIG_LTC2309=m
CONFIG_LTC2471=m
CONFIG_LTC2485=m
CONFIG_LTC2496=m
# CONFIG_LTC2497 is not set
# CONFIG_MAX1027 is not set
CONFIG_MAX11100=m
CONFIG_MAX1118=m
# CONFIG_MAX11205 is not set
CONFIG_MAX11410=m
CONFIG_MAX1241=m
CONFIG_MAX1363=m
CONFIG_MAX14001=m
# CONFIG_MAX34408 is not set
CONFIG_MAX77541_ADC=m
CONFIG_MAX9611=m
CONFIG_MCP320X=m
CONFIG_MCP3422=m
# CONFIG_MCP3564 is not set
CONFIG_MCP3911=m
CONFIG_MEDIATEK_MT6359_AUXADC=m
CONFIG_MEDIATEK_MT6360_ADC=m
CONFIG_MEDIATEK_MT6370_ADC=m
# CONFIG_MEDIATEK_MT6577_AUXADC is not set
# CONFIG_MEN_Z188_ADC is not set
CONFIG_MP2629_ADC=m
CONFIG_NAU7802=m
CONFIG_NCT7201=m
# CONFIG_NPCM_ADC is not set
# CONFIG_NXP_SAR_ADC is not set
# CONFIG_PAC1921 is not set
CONFIG_PAC1934=m
CONFIG_PALMAS_GPADC=m
CONFIG_QCOM_VADC_COMMON=m
CONFIG_QCOM_SPMI_IADC=m
CONFIG_QCOM_SPMI_VADC=m
# CONFIG_QCOM_SPMI_ADC5 is not set
# CONFIG_RCAR_GYRO_ADC is not set
# CONFIG_ROHM_BD79112 is not set
# CONFIG_ROHM_BD79124 is not set
# CONFIG_ROCKCHIP_SARADC is not set
CONFIG_RICHTEK_RTQ6056=m
# CONFIG_RZG2L_ADC is not set
# CONFIG_RZN1_ADC is not set
# CONFIG_RZT2H_ADC is not set
# CONFIG_SC27XX_ADC is not set
# CONFIG_SOPHGO_CV1800B_ADC is not set
# CONFIG_SPEAR_ADC is not set
# CONFIG_SD_ADC_MODULATOR is not set
# CONFIG_STM32_DFSDM_CORE is not set
# CONFIG_STM32_DFSDM_ADC is not set
# CONFIG_SUN20I_GPADC is not set
# CONFIG_TI_ADC081C is not set
CONFIG_TI_ADC0832=m
# CONFIG_TI_ADC084S021 is not set
CONFIG_TI_ADC108S102=m
CONFIG_TI_ADC12138=m
CONFIG_TI_ADC128S052=m
CONFIG_TI_ADC161S626=m
# CONFIG_TI_ADS1015 is not set
# CONFIG_TI_ADS1018 is not set
# CONFIG_TI_ADS1100 is not set
CONFIG_TI_ADS1119=m
# CONFIG_TI_ADS124S08 is not set
# CONFIG_TI_ADS1298 is not set
CONFIG_TI_ADS131E08=m
CONFIG_TI_ADS131M02=m
CONFIG_TI_ADS7138=m
CONFIG_TI_ADS7924=m
# CONFIG_TI_ADS7950 is not set
# CONFIG_TI_ADS8344 is not set
CONFIG_TI_ADS8688=m
# CONFIG_TI_LMP92064 is not set
CONFIG_TI_TLC4541=m
# CONFIG_TI_TSC2046 is not set
CONFIG_VF610_ADC=m
CONFIG_VIPERBOARD_ADC=m
CONFIG_XILINX_XADC=m
# CONFIG_XILINX_AMS is not set
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# CONFIG_AD74115 is not set
CONFIG_AD74413R=m
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
# CONFIG_IIO_RESCALE is not set
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_AD8366=m
# CONFIG_ADA4250 is not set
CONFIG_ADL8113=m
CONFIG_HMC425=m
# end of Amplifiers

#
# Capacitance to digital converters
#
# CONFIG_AD7150 is not set
# CONFIG_AD7746 is not set
# end of Capacitance to digital converters

#
# Chemical Sensors
#
# CONFIG_AOSONG_AGS02MA is not set
# CONFIG_ATLAS_PH_SENSOR is not set
CONFIG_ATLAS_EZO_SENSOR=m
# CONFIG_BME680 is not set
CONFIG_CCS811=m
CONFIG_ENS160=m
CONFIG_ENS160_I2C=m
CONFIG_ENS160_SPI=m
# CONFIG_IAQCORE is not set
# CONFIG_MHZ19B is not set
CONFIG_PMS7003=m
CONFIG_SCD30_CORE=m
# CONFIG_SCD30_I2C is not set
CONFIG_SCD30_SERIAL=m
CONFIG_SCD4X=m
# CONFIG_SEN0322 is not set
CONFIG_SENSIRION_SGP30=m
CONFIG_SENSIRION_SGP40=m
CONFIG_SPS30=m
CONFIG_SPS30_I2C=m
CONFIG_SPS30_SERIAL=m
# CONFIG_SENSEAIR_SUNRISE_CO2 is not set
# CONFIG_VZ89X is not set
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=m
CONFIG_HID_SENSOR_IIO_TRIGGER=m
# end of Hid Sensor IIO Common

CONFIG_IIO_INV_SENSORS_TIMESTAMP=m
CONFIG_IIO_MS_SENSORS_I2C=m

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
CONFIG_IIO_SSP_SENSORS_COMMONS=m
CONFIG_IIO_SSP_SENSORHUB=m
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_SPI=m
CONFIG_IIO_ST_SENSORS_CORE=m

#
# Digital to analog converters
#
# CONFIG_AD3530R is not set
# CONFIG_AD3552R_HS is not set
CONFIG_AD3552R_LIB=m
CONFIG_AD3552R=m
# CONFIG_AD5064 is not set
# CONFIG_AD5360 is not set
# CONFIG_AD5380 is not set
CONFIG_AD5421=m
CONFIG_AD5446=m
CONFIG_AD5446_SPI=m
# CONFIG_AD5446_I2C is not set
CONFIG_AD5449=m
CONFIG_AD5592R_BASE=m
# CONFIG_AD5592R is not set
CONFIG_AD5593R=m
# CONFIG_AD5504 is not set
# CONFIG_AD5624R_SPI is not set
CONFIG_AD9739A=m
# CONFIG_ADI_AXI_DAC is not set
# CONFIG_LTC2688 is not set
CONFIG_AD5686=m
CONFIG_AD5686_SPI=m
# CONFIG_AD5696_I2C is not set
CONFIG_AD5755=m
CONFIG_AD5758=m
CONFIG_AD5761=m
CONFIG_AD5764=m
CONFIG_AD5766=m
CONFIG_AD5770R=m
CONFIG_AD5791=m
# CONFIG_AD7293 is not set
CONFIG_AD7303=m
CONFIG_AD8460=m
CONFIG_AD8801=m
CONFIG_BD79703=m
CONFIG_DPOT_DAC=m
CONFIG_DS4424=m
# CONFIG_LPC18XX_DAC is not set
# CONFIG_LTC1660 is not set
# CONFIG_LTC2632 is not set
CONFIG_LTC2664=m
# CONFIG_M62332 is not set
CONFIG_MAX517=m
# CONFIG_MAX22007 is not set
# CONFIG_MAX5522 is not set
CONFIG_MAX5821=m
CONFIG_MCP4725=m
CONFIG_MCP4728=m
CONFIG_MCP47FEB02=m
CONFIG_MCP4821=m
# CONFIG_MCP4922 is not set
# CONFIG_STM32_DAC is not set
# CONFIG_TI_DAC082S085 is not set
CONFIG_TI_DAC5571=m
CONFIG_TI_DAC7311=m
CONFIG_TI_DAC7612=m
# CONFIG_VF610_DAC is not set
# end of Digital to analog converters

#
# IIO dummy driver
#
CONFIG_IIO_DUMMY_EVGEN=m
CONFIG_IIO_SIMPLE_DUMMY=m
CONFIG_IIO_SIMPLE_DUMMY_EVENTS=y
# CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
# end of IIO dummy driver

#
# Filters
#
# CONFIG_ADMV8818 is not set
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
CONFIG_AD9523=m
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
CONFIG_ADF4350=m
CONFIG_ADF4371=m
CONFIG_ADF4377=m
CONFIG_ADMFM2000=m
CONFIG_ADMV1013=m
CONFIG_ADMV1014=m
# CONFIG_ADMV4420 is not set
CONFIG_ADRF6780=m
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
CONFIG_ADIS16080=m
CONFIG_ADIS16130=m
# CONFIG_ADIS16136 is not set
CONFIG_ADIS16260=m
# CONFIG_ADXRS290 is not set
CONFIG_ADXRS450=m
CONFIG_BMG160=m
CONFIG_BMG160_I2C=m
CONFIG_BMG160_SPI=m
CONFIG_FXAS21002C=m
CONFIG_FXAS21002C_I2C=m
CONFIG_FXAS21002C_SPI=m
# CONFIG_HID_SENSOR_GYRO_3D is not set
CONFIG_MPU3050=m
CONFIG_MPU3050_I2C=m
CONFIG_IIO_ST_GYRO_3AXIS=m
CONFIG_IIO_ST_GYRO_I2C_3AXIS=m
CONFIG_IIO_ST_GYRO_SPI_3AXIS=m
CONFIG_ITG3200=m
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
# CONFIG_AFE4403 is not set
# CONFIG_AFE4404 is not set
# CONFIG_MAX30100 is not set
CONFIG_MAX30102=m
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
# CONFIG_AM2315 is not set
# CONFIG_DHT11 is not set
# CONFIG_ENS210 is not set
# CONFIG_HDC100X is not set
# CONFIG_HDC2010 is not set
CONFIG_HDC3020=m
# CONFIG_HID_SENSOR_HUMIDITY is not set
CONFIG_HTS221=m
CONFIG_HTS221_I2C=m
CONFIG_HTS221_SPI=m
CONFIG_HTU21=m
CONFIG_SI7005=m
CONFIG_SI7020=m
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_ADIS16400=m
CONFIG_ADIS16460=m
CONFIG_ADIS16475=m
CONFIG_ADIS16480=m
# CONFIG_ADIS16550 is not set
CONFIG_BMI160=m
CONFIG_BMI160_I2C=m
CONFIG_BMI160_SPI=m
CONFIG_BMI270=m
CONFIG_BMI270_I2C=m
CONFIG_BMI270_SPI=m
CONFIG_BMI323=m
# CONFIG_BMI323_I2C is not set
CONFIG_BMI323_SPI=m
CONFIG_BOSCH_BNO055=m
CONFIG_BOSCH_BNO055_SERIAL=m
CONFIG_BOSCH_BNO055_I2C=m
CONFIG_FXOS8700=m
# CONFIG_FXOS8700_I2C is not set
CONFIG_FXOS8700_SPI=m
# CONFIG_KMX61 is not set
CONFIG_INV_ICM42600=m
CONFIG_INV_ICM42600_I2C=m
CONFIG_INV_ICM42600_SPI=m
CONFIG_INV_ICM45600=m
CONFIG_INV_ICM45600_I2C=m
CONFIG_INV_ICM45600_SPI=m
CONFIG_INV_MPU6050_IIO=m
CONFIG_INV_MPU6050_I2C=m
CONFIG_INV_MPU6050_SPI=m
CONFIG_SMI240=m
CONFIG_SMI330=m
# CONFIG_SMI330_I2C is not set
CONFIG_SMI330_SPI=m
CONFIG_IIO_ST_LSM6DSX=m
CONFIG_IIO_ST_LSM6DSX_I2C=m
# CONFIG_IIO_ST_LSM6DSX_SPI is not set
# end of Inertial measurement units

CONFIG_IIO_ADIS_LIB=m
CONFIG_IIO_ADIS_LIB_BUFFER=y

#
# Light sensors
#
CONFIG_ADJD_S311=m
CONFIG_ADUX1020=m
# CONFIG_AL3000A is not set
CONFIG_AL3010=m
CONFIG_AL3320A=m
# CONFIG_APDS9160 is not set
CONFIG_APDS9300=m
# CONFIG_APDS9306 is not set
# CONFIG_APDS9960 is not set
CONFIG_AS73211=m
CONFIG_BH1745=m
CONFIG_BH1750=m
CONFIG_BH1780=m
CONFIG_CM32181=m
CONFIG_CM3232=m
# CONFIG_CM3323 is not set
CONFIG_CM3605=m
CONFIG_CM36651=m
CONFIG_GP2AP002=m
# CONFIG_GP2AP020A00F is not set
# CONFIG_IQS621_ALS is not set
CONFIG_SENSORS_ISL29018=m
CONFIG_SENSORS_ISL29028=m
CONFIG_ISL29125=m
CONFIG_ISL76682=m
CONFIG_HID_SENSOR_ALS=m
# CONFIG_HID_SENSOR_PROX is not set
CONFIG_JSA1212=m
CONFIG_ROHM_BU27034=m
# CONFIG_RPR0521 is not set
CONFIG_SENSORS_LM3533=m
CONFIG_LTR390=m
# CONFIG_LTR501 is not set
CONFIG_LTRF216A=m
# CONFIG_LV0104CS is not set
CONFIG_MAX44000=m
CONFIG_MAX44009=m
CONFIG_NOA1305=m
CONFIG_OPT3001=m
CONFIG_OPT4001=m
CONFIG_OPT4060=m
CONFIG_PA12203001=m
CONFIG_SI1133=m
CONFIG_SI1145=m
CONFIG_STK3310=m
CONFIG_ST_UVIS25=m
CONFIG_ST_UVIS25_I2C=m
CONFIG_ST_UVIS25_SPI=m
# CONFIG_TCS3414 is not set
CONFIG_TCS3472=m
CONFIG_SENSORS_TSL2563=m
# CONFIG_TSL2583 is not set
# CONFIG_TSL2591 is not set
CONFIG_TSL2772=m
CONFIG_TSL4531=m
CONFIG_US5182D=m
CONFIG_VCNL4000=m
CONFIG_VCNL4035=m
CONFIG_VEML3235=m
CONFIG_VEML6030=m
# CONFIG_VEML6040 is not set
CONFIG_VEML6046X00=m
CONFIG_VEML6070=m
# CONFIG_VEML6075 is not set
CONFIG_VL6180=m
CONFIG_ZOPT2201=m
# end of Light sensors

#
# Magnetometer sensors
#
# CONFIG_AK8974 is not set
CONFIG_AK8975=m
# CONFIG_AK09911 is not set
CONFIG_ALS31300=m
CONFIG_BMC150_MAGN=m
# CONFIG_BMC150_MAGN_I2C is not set
CONFIG_BMC150_MAGN_SPI=m
CONFIG_MAG3110=m
# CONFIG_HID_SENSOR_MAGNETOMETER_3D is not set
CONFIG_MMC35240=m
# CONFIG_MMC5633 is not set
CONFIG_IIO_ST_MAGN_3AXIS=m
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
CONFIG_IIO_ST_MAGN_SPI_3AXIS=m
CONFIG_INFINEON_TLV493D=m
CONFIG_SENSORS_HMC5843=m
CONFIG_SENSORS_HMC5843_I2C=m
CONFIG_SENSORS_HMC5843_SPI=m
CONFIG_SENSORS_RM3100=m
CONFIG_SENSORS_RM3100_I2C=m
CONFIG_SENSORS_RM3100_SPI=m
CONFIG_SI7210=m
CONFIG_TI_TMAG5273=m
# CONFIG_YAMAHA_YAS530 is not set
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=m
# end of Multiplexers

#
# Inclinometer sensors
#
CONFIG_HID_SENSOR_INCLINOMETER_3D=m
# CONFIG_HID_SENSOR_DEVICE_ROTATION is not set
# end of Inclinometer sensors

CONFIG_IIO_GTS_KUNIT_TEST=m
CONFIG_IIO_FORMAT_KUNIT_TEST=m
# CONFIG_IIO_MULTIPLY_KUNIT_TEST is not set

#
# Triggers - standalone
#
CONFIG_IIO_HRTIMER_TRIGGER=m
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
# CONFIG_IIO_STM32_LPTIMER_TRIGGER is not set
# CONFIG_IIO_STM32_TIMER_TRIGGER is not set
CONFIG_IIO_TIGHTLOOP_TRIGGER=m
# CONFIG_IIO_SYSFS_TRIGGER is not set
# end of Triggers - standalone

#
# Linear and angular position sensors
#
# CONFIG_IQS624_POS is not set
# CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE is not set
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=m
CONFIG_AD5272=m
CONFIG_DS1803=m
CONFIG_MAX5432=m
# CONFIG_MAX5481 is not set
CONFIG_MAX5487=m
# CONFIG_MCP4018 is not set
CONFIG_MCP4131=m
CONFIG_MCP4531=m
CONFIG_MCP41010=m
# CONFIG_TPL0102 is not set
CONFIG_X9250=m
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=m
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=m
CONFIG_ABP2030PA=m
CONFIG_ABP2030PA_I2C=m
CONFIG_ABP2030PA_SPI=m
CONFIG_ROHM_BM1390=m
CONFIG_BMP280=m
CONFIG_BMP280_I2C=m
CONFIG_BMP280_SPI=m
CONFIG_DLHL60D=m
# CONFIG_DPS310 is not set
# CONFIG_HID_SENSOR_PRESS is not set
CONFIG_HP03=m
# CONFIG_HSC030PA is not set
CONFIG_ICP10100=m
CONFIG_MPL115=m
CONFIG_MPL115_I2C=m
CONFIG_MPL115_SPI=m
CONFIG_MPL3115=m
CONFIG_MPRLS0025PA=m
CONFIG_MPRLS0025PA_I2C=m
# CONFIG_MPRLS0025PA_SPI is not set
# CONFIG_MS5611 is not set
# CONFIG_MS5637 is not set
# CONFIG_SDP500 is not set
CONFIG_IIO_ST_PRESS=m
CONFIG_IIO_ST_PRESS_I2C=m
CONFIG_IIO_ST_PRESS_SPI=m
CONFIG_T5403=m
CONFIG_HP206C=m
CONFIG_ZPA2326=m
CONFIG_ZPA2326_I2C=m
CONFIG_ZPA2326_SPI=m
# CONFIG_ADP810 is not set
# end of Pressure sensors

#
# Lightning sensors
#
CONFIG_AS3935=m
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_D3323AA=m
CONFIG_HX9023S=m
CONFIG_IRSD200=m
# CONFIG_ISL29501 is not set
CONFIG_LIDAR_LITE_V2=m
# CONFIG_MB1232 is not set
# CONFIG_PING is not set
# CONFIG_RFD77402 is not set
CONFIG_SRF04=m
CONFIG_SX_COMMON=m
CONFIG_SX9310=m
CONFIG_SX9324=m
# CONFIG_SX9360 is not set
CONFIG_SX9500=m
CONFIG_SRF08=m
# CONFIG_VCNL3020 is not set
CONFIG_VL53L0X_I2C=m
# CONFIG_AW96103 is not set
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# CONFIG_AD2S90 is not set
CONFIG_AD2S1200=m
# CONFIG_AD2S1210 is not set
# end of Resolver to digital converters

#
# Temperature sensors
#
# CONFIG_IQS620AT_TEMP is not set
CONFIG_LTC2983=m
CONFIG_MAXIM_THERMOCOUPLE=m
# CONFIG_HID_SENSOR_TEMP is not set
# CONFIG_MLX90614 is not set
# CONFIG_MLX90632 is not set
CONFIG_MLX90635=m
# CONFIG_TMP006 is not set
CONFIG_TMP007=m
# CONFIG_TMP117 is not set
CONFIG_TSYS01=m
CONFIG_TSYS02D=m
CONFIG_MAX30208=m
CONFIG_MAX31856=m
CONFIG_MAX31865=m
CONFIG_MCP9600=m
# end of Temperature sensors

CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
# CONFIG_NTB_AMD is not set
CONFIG_NTB_IDT=m
CONFIG_NTB_INTEL=m
CONFIG_NTB_EPF=m
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
# CONFIG_NTB_PERF is not set
# CONFIG_NTB_TRANSPORT is not set
CONFIG_PWM=y
CONFIG_PWM_DEBUG=y
CONFIG_PWM_PROVIDE_GPIO=y
# CONFIG_PWM_AIROHA is not set
# CONFIG_PWM_APPLE is not set
# CONFIG_PWM_AXI_PWMGEN is not set
# CONFIG_PWM_BCM2835 is not set
# CONFIG_PWM_BCM_IPROC is not set
# CONFIG_PWM_BCM_KONA is not set
# CONFIG_PWM_BERLIN is not set
# CONFIG_PWM_BRCMSTB is not set
# CONFIG_PWM_CLK is not set
# CONFIG_PWM_CLPS711X is not set
CONFIG_PWM_DWC_CORE=m
CONFIG_PWM_DWC=m
# CONFIG_PWM_EP93XX is not set
# CONFIG_PWM_HIBVT is not set
# CONFIG_PWM_IMG is not set
# CONFIG_PWM_IMX1 is not set
# CONFIG_PWM_IMX27 is not set
# CONFIG_PWM_IMX_TPM is not set
# CONFIG_PWM_INTEL_LGM is not set
# CONFIG_PWM_IQS620A is not set
# CONFIG_PWM_KEEMBAY is not set
# CONFIG_PWM_LOONGSON is not set
# CONFIG_PWM_LPC18XX_SCT is not set
# CONFIG_PWM_LPC32XX is not set
# CONFIG_PWM_LPSS_PCI is not set
# CONFIG_PWM_LPSS_PLATFORM is not set
# CONFIG_PWM_MAX7360 is not set
# CONFIG_PWM_MEDIATEK is not set
# CONFIG_PWM_MESON is not set
# CONFIG_PWM_MTK_DISP is not set
CONFIG_PWM_PCA9685=y
# CONFIG_PWM_PXA is not set
# CONFIG_PWM_RASPBERRYPI_POE is not set
# CONFIG_PWM_RENESAS_RCAR is not set
# CONFIG_PWM_RENESAS_RZG2L_GPT is not set
# CONFIG_PWM_RENESAS_TPU is not set
# CONFIG_PWM_ROCKCHIP is not set
# CONFIG_PWM_SAMSUNG is not set
# CONFIG_PWM_SL28CPLD is not set
# CONFIG_PWM_SOPHGO_SG2042 is not set
# CONFIG_PWM_SPRD is not set
# CONFIG_PWM_STM32 is not set
# CONFIG_PWM_STM32_LP is not set
# CONFIG_PWM_SUN4I is not set
# CONFIG_PWM_TEGRA is not set
# CONFIG_PWM_TIECAP is not set
# CONFIG_PWM_TIEHRPWM is not set
# CONFIG_PWM_VISCONTI is not set
# CONFIG_PWM_VT8500 is not set

#
# IRQ chip support
#
CONFIG_IRQ_MSI_LIB=y
# CONFIG_BCM7038_L1_IRQ is not set
# CONFIG_BCM7120_L2_IRQ is not set
# CONFIG_BRCMSTB_L2_IRQ is not set
# CONFIG_LAN966X_OIC is not set
CONFIG_MADERA_IRQ=m
# CONFIG_RENESAS_INTC_IRQPIN is not set
# CONFIG_RENESAS_IRQC is not set
# CONFIG_RENESAS_RZA1_IRQC is not set
# CONFIG_RENESAS_RZG2L_IRQC is not set
# CONFIG_RENESAS_RZT2H_ICU is not set
# CONFIG_RENESAS_RZV2H_ICU is not set
# CONFIG_SL28CPLD_INTC is not set
# CONFIG_TS4800_IRQ is not set
# CONFIG_INGENIC_TCU_IRQ is not set
# CONFIG_STM32MP_EXTI is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
# CONFIG_MESON_IRQ_GPIO is not set
# CONFIG_IMX_IRQSTEER is not set
# CONFIG_IMX_INTMUX is not set
# CONFIG_STARFIVE_JH8100_INTC is not set
# CONFIG_EXYNOS_IRQ_COMBINER is not set
# CONFIG_MST_IRQ is not set
# CONFIG_MCHP_EIC is not set
# CONFIG_SOPHGO_SG2042_MSI is not set
# CONFIG_SUNPLUS_SP7021_INTC is not set
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_A10SR is not set
# CONFIG_RESET_ASPEED is not set
# CONFIG_RESET_ATH79 is not set
# CONFIG_RESET_AXS10X is not set
# CONFIG_RESET_BCM6345 is not set
# CONFIG_RESET_BERLIN is not set
# CONFIG_RESET_BRCMSTB is not set
# CONFIG_RESET_BRCMSTB_RESCAL is not set
# CONFIG_RESET_EIC7700 is not set
# CONFIG_RESET_EYEQ is not set
CONFIG_RESET_GPIO=y
# CONFIG_RESET_HSDK is not set
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_IMX8MP_AUDIOMIX is not set
# CONFIG_RESET_K230 is not set
# CONFIG_RESET_LANTIQ is not set
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MCHP_SPARX5 is not set
# CONFIG_RESET_NPCM is not set
# CONFIG_RESET_NUVOTON_MA35D1 is not set
# CONFIG_RESET_PISTACHIO is not set
CONFIG_RESET_POLARFIRE_SOC=y
# CONFIG_RESET_QCOM_AOSS is not set
# CONFIG_RESET_QCOM_PDC is not set
# CONFIG_RESET_RASPBERRYPI is not set
# CONFIG_RESET_RZG2L_USBPHY_CTRL is not set
# CONFIG_RESET_RZV2H_USB2PHY is not set
# CONFIG_RESET_SCMI is not set
# CONFIG_RESET_SIMPLE is not set
# CONFIG_RESET_SOCFPGA is not set
# CONFIG_RESET_SUNPLUS is not set
# CONFIG_RESET_SUNXI is not set
# CONFIG_RESET_TH1520 is not set
# CONFIG_RESET_TI_SCI is not set
CONFIG_RESET_TI_SYSCON=y
CONFIG_RESET_TI_TPS380X=m
# CONFIG_RESET_TN48M_CPLD is not set
# CONFIG_RESET_ZYNQ is not set
# CONFIG_RESET_ZYNQMP is not set
# CONFIG_RESET_MESON is not set
# CONFIG_RESET_MESON_AUX is not set
# CONFIG_RESET_MESON_AUDIO_ARB is not set
# CONFIG_COMMON_RESET_HI3660 is not set
# CONFIG_COMMON_RESET_HI6220 is not set

#
# Reset support for SpacemiT platforms
#
# end of Reset support for SpacemiT platforms

# CONFIG_RESET_STARFIVE_JH7100 is not set
# CONFIG_STIH407_RESET is not set
# CONFIG_RESET_TEGRA_BPMP is not set

#
# PHY Subsystem
#
CONFIG_PHY_COMMON_PROPS=y
CONFIG_PHY_COMMON_PROPS_TEST=m
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
CONFIG_PHY_GOOGLE_USB=m
# CONFIG_PHY_PISTACHIO_USB is not set
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set
# CONFIG_PHY_SUN4I_USB is not set
# CONFIG_PHY_SUN6I_MIPI_DPHY is not set
# CONFIG_PHY_SUN9I_USB is not set
# CONFIG_PHY_APPLE_ATC is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_PHY_BCM63XX_USBH is not set
CONFIG_BCM_KONA_USB2_PHY=m
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_HI6220_USB is not set
# CONFIG_PHY_HI3660_USB is not set
# CONFIG_PHY_HI3670_USB is not set
# CONFIG_PHY_HI3670_PCIE is not set
# CONFIG_PHY_HISTB_COMBPHY is not set
# CONFIG_PHY_HISI_INNO_USB2 is not set
# CONFIG_PHY_INGENIC_USB is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_PXA_USB is not set
# CONFIG_PHY_MMP3_USB is not set
# CONFIG_PHY_MMP3_HSIC is not set
CONFIG_PHY_CPCAP_USB=m
# CONFIG_PHY_QCOM_M31_USB is not set
# CONFIG_PHY_QCOM_M31_EUSB is not set
CONFIG_PHY_QCOM_USB_HS=m
CONFIG_PHY_QCOM_USB_HSIC=m
# CONFIG_PHY_MT7621_PCI is not set
# CONFIG_PHY_RALINK_USB is not set
# CONFIG_PHY_RTK_RTD_USB2PHY is not set
# CONFIG_PHY_RTK_RTD_USB3PHY is not set
# CONFIG_PHY_R8A779F0_ETHERNET_SERDES is not set
# CONFIG_PHY_RCAR_GEN3_USB3 is not set
# CONFIG_PHY_RZ_G3E_USB3 is not set
# CONFIG_PHY_ROCKCHIP_DPHY_RX0 is not set
# CONFIG_PHY_ROCKCHIP_PCIE is not set
# CONFIG_PHY_ROCKCHIP_SAMSUNG_DCPHY is not set
# CONFIG_PHY_ROCKCHIP_SNPS_PCIE3 is not set
# CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
# CONFIG_PHY_SAMSUNG_USB2 is not set
# CONFIG_PHY_SOPHGO_CV1800_USB2 is not set
# CONFIG_PHY_ST_SPEAR1310_MIPHY is not set
# CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
# CONFIG_PHY_STIH407_USB is not set
# CONFIG_PHY_STM32_COMBOPHY is not set
# CONFIG_PHY_STM32_USBPHYC is not set
# CONFIG_PHY_STARFIVE_JH7110_DPHY_RX is not set
# CONFIG_PHY_STARFIVE_JH7110_DPHY_TX is not set
# CONFIG_PHY_STARFIVE_JH7110_PCIE is not set
# CONFIG_PHY_STARFIVE_JH7110_USB is not set
# CONFIG_PHY_TEGRA194_P2U is not set
# CONFIG_PHY_DA8XX_USB is not set
# CONFIG_PHY_DM816X_USB is not set
# CONFIG_OMAP_CONTROL_PHY is not set
# CONFIG_OMAP_USB2 is not set
# CONFIG_TI_PIPE3 is not set
# CONFIG_PHY_TUSB1210 is not set
# CONFIG_PHY_INTEL_KEEMBAY_EMMC is not set
# CONFIG_PHY_INTEL_KEEMBAY_USB is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# CONFIG_PHY_XILINX_ZYNQMP is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_MCB=y
CONFIG_MCB_PCI=m
# CONFIG_MCB_LPC is not set
CONFIG_RAS=y
CONFIG_USB4=m
CONFIG_USB4_DEBUGFS_WRITE=y
# CONFIG_USB4_DEBUGFS_MARGINING is not set
CONFIG_USB4_KUNIT_TEST=y
CONFIG_USB4_DMA_TEST=m

#
# Android
#
# end of Android

CONFIG_DAX=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_LAYOUTS is not set
# CONFIG_NVMEM_AN8855_EFUSE is not set
# CONFIG_NVMEM_APPLE_EFUSES is not set
# CONFIG_NVMEM_APPLE_SPMI is not set
# CONFIG_NVMEM_BCM_OCOTP is not set
# CONFIG_NVMEM_BRCM_NVRAM is not set
# CONFIG_NVMEM_IMX_IIM is not set
# CONFIG_NVMEM_IMX_OCOTP is not set
# CONFIG_NVMEM_LAN9662_OTPC is not set
# CONFIG_NVMEM_LAYERSCAPE_SFP is not set
# CONFIG_NVMEM_LPC18XX_EEPROM is not set
# CONFIG_NVMEM_LPC18XX_OTP is not set
# CONFIG_NVMEM_MESON_MX_EFUSE is not set
# CONFIG_NVMEM_MICROCHIP_OTPC is not set
# CONFIG_NVMEM_MTK_EFUSE is not set
# CONFIG_NVMEM_MXS_OCOTP is not set
# CONFIG_NVMEM_NINTENDO_OTP is not set
# CONFIG_NVMEM_QCOM_QFPROM is not set
# CONFIG_NVMEM_QNAP_MCU_EEPROM is not set
CONFIG_NVMEM_RAVE_SP_EEPROM=m
# CONFIG_NVMEM_RCAR_EFUSE is not set
CONFIG_NVMEM_RMEM=y
# CONFIG_NVMEM_ROCKCHIP_EFUSE is not set
# CONFIG_NVMEM_ROCKCHIP_OTP is not set
# CONFIG_NVMEM_SC27XX_EFUSE is not set
# CONFIG_NVMEM_SNVS_LPGPR is not set
CONFIG_NVMEM_SPMI_SDAM=m
# CONFIG_NVMEM_SPRD_EFUSE is not set
# CONFIG_NVMEM_STM32_ROMEM is not set
# CONFIG_NVMEM_SUNPLUS_OCOTP is not set
# CONFIG_NVMEM_UNIPHIER_EFUSE is not set
# CONFIG_NVMEM_VF610_OCOTP is not set
# CONFIG_NVMEM_QORIQ_EFUSE is not set

#
# HW tracing support
#
# CONFIG_STM is not set
CONFIG_INTEL_TH=m
CONFIG_INTEL_TH_PCI=m
CONFIG_INTEL_TH_GTH=m
# CONFIG_INTEL_TH_MSU is not set
CONFIG_INTEL_TH_PTI=m
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_TEE is not set
CONFIG_MULTIPLEXER=m

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=m
# CONFIG_MUX_ADGS1408 is not set
# CONFIG_MUX_GPIO is not set
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
CONFIG_SLIMBUS=y
# CONFIG_INTERCONNECT is not set
CONFIG_COUNTER=y
# CONFIG_104_QUAD_8 is not set
# CONFIG_INTERRUPT_CNT is not set
# CONFIG_STM32_LPTIMER_CNT is not set
# CONFIG_STM32_TIMER_CNT is not set
# CONFIG_TI_ECAP_CAPTURE is not set
# CONFIG_TI_EQEP is not set
CONFIG_MOST=m
# CONFIG_MOST_USB_HDM is not set
CONFIG_MOST_CDEV=m
CONFIG_PECI=m
CONFIG_PECI_CPU=m
CONFIG_HTE=y
# CONFIG_HTE_TEGRA194 is not set
# CONFIG_HTE_TEGRA194_TEST is not set
# CONFIG_CDX_BUS is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_FS_STACK=y
CONFIG_BUFFER_HEAD=y
CONFIG_LEGACY_DIRECT_IO=y
CONFIG_EXT2_FS=m
CONFIG_EXT2_FS_XATTR=y
CONFIG_EXT2_FS_POSIX_ACL=y
# CONFIG_EXT2_FS_SECURITY is not set
CONFIG_EXT4_FS=m
CONFIG_EXT4_FS_POSIX_ACL=y
# CONFIG_EXT4_FS_SECURITY is not set
CONFIG_EXT4_DEBUG=y
# CONFIG_EXT4_KUNIT_TESTS is not set
CONFIG_JBD2=m
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=m
CONFIG_JFS_FS=y
# CONFIG_JFS_POSIX_ACL is not set
# CONFIG_JFS_SECURITY is not set
# CONFIG_JFS_DEBUG is not set
CONFIG_JFS_STATISTICS=y
# CONFIG_XFS_FS is not set
CONFIG_GFS2_FS=y
# CONFIG_BTRFS_FS is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
# CONFIG_F2FS_FS_POSIX_ACL is not set
# CONFIG_F2FS_FS_SECURITY is not set
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
# CONFIG_F2FS_IOSTAT is not set
# CONFIG_ZONEFS_FS is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
CONFIG_QUOTACTL=y
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
CONFIG_OVERLAY_FS_INDEX=y
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
CONFIG_OVERLAY_FS_METACOPY=y
CONFIG_OVERLAY_FS_DEBUG=y

#
# Caches
#
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=y
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
# CONFIG_FAT_DEFAULT_UTF8 is not set
CONFIG_FAT_KUNIT_TEST=m
CONFIG_EXFAT_FS=y
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
# CONFIG_NTFS3_FS is not set
# CONFIG_NTFS_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
# CONFIG_TMPFS is not set
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=y
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
CONFIG_NLS_CODEPAGE_860=y
CONFIG_NLS_CODEPAGE_861=y
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=y
CONFIG_NLS_CODEPAGE_949=y
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=m
# CONFIG_NLS_CODEPAGE_1251 is not set
# CONFIG_NLS_ASCII is not set
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
# CONFIG_NLS_ISO8859_13 is not set
CONFIG_NLS_ISO8859_14=y
# CONFIG_NLS_ISO8859_15 is not set
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=y
# CONFIG_NLS_MAC_CELTIC is not set
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=m
# CONFIG_NLS_MAC_GAELIC is not set
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
# CONFIG_NLS_MAC_INUIT is not set
# CONFIG_NLS_MAC_ROMANIAN is not set
CONFIG_NLS_MAC_TURKISH=m
# CONFIG_NLS_UTF8 is not set
CONFIG_NLS_UCS2_UTILS=y
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=m
CONFIG_HAVE_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_TPM=y
# CONFIG_ENCRYPTED_KEYS is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_KEY_NOTIFICATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_PROC_MEM_ALWAYS_FORCE is not set
# CONFIG_PROC_MEM_FORCE_PTRACE is not set
CONFIG_PROC_MEM_NO_FORCE=y
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_PATH=y
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_LOADPIN=y
# CONFIG_SECURITY_LOADPIN_ENFORCE is not set
CONFIG_SECURITY_YAMA=y
CONFIG_SECURITY_SAFESETID=y
CONFIG_SECURITY_LOCKDOWN_LSM=y
# CONFIG_SECURITY_LOCKDOWN_LSM_EARLY is not set
CONFIG_LOCK_DOWN_KERNEL_FORCE_NONE=y
# CONFIG_LOCK_DOWN_KERNEL_FORCE_INTEGRITY is not set
# CONFIG_LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY is not set
CONFIG_SECURITY_LANDLOCK=y
CONFIG_SECURITY_LANDLOCK_KUNIT_TEST=y
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
# CONFIG_IMA is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,ipe,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
CONFIG_INIT_STACK_NONE=y
# CONFIG_INIT_STACK_ALL_PATTERN is not set
# CONFIG_INIT_STACK_ALL_ZERO is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

#
# Bounds checking
#
CONFIG_FORTIFY_SOURCE=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY_DEFAULT_ON=y
# end of Bounds checking

#
# Hardening of kernel data structures
#
CONFIG_LIST_HARDENED=y
CONFIG_BUG_ON_DATA_CORRUPTION=y
# end of Hardening of kernel data structures

CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SIG=y
CONFIG_CRYPTO_SIG2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_HKDF=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_CRYPTD=m
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_KRB5ENC=y
CONFIG_CRYPTO_BENCHMARK=m
CONFIG_CRYPTO_ENGINE=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=m
CONFIG_CRYPTO_ECDSA=y
CONFIG_CRYPTO_ECRDSA=m
CONFIG_CRYPTO_MLDSA=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_ARIA=y
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=y
# CONFIG_CRYPTO_CAST5 is not set
CONFIG_CRYPTO_CAST6=y
# CONFIG_CRYPTO_DES is not set
# CONFIG_CRYPTO_FCRYPT is not set
# CONFIG_CRYPTO_SERPENT is not set
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_HCTR2=m
CONFIG_CRYPTO_LRW=y
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XCTR=m
CONFIG_CRYPTO_XTS=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_CHACHA20POLY1305=m
# CONFIG_CRYPTO_CCM is not set
# CONFIG_CRYPTO_GCM is not set
CONFIG_CRYPTO_GENIV=m
# CONFIG_CRYPTO_SEQIV is not set
CONFIG_CRYPTO_ECHAINIV=m
CONFIG_CRYPTO_ESSIV=m
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=m
CONFIG_CRYPTO_CMAC=m
# CONFIG_CRYPTO_GHASH is not set
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=m
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_RMD160=y
CONFIG_CRYPTO_SHA1=m
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
# CONFIG_CRYPTO_SM3_GENERIC is not set
CONFIG_CRYPTO_STREEBOG=m
CONFIG_CRYPTO_WP512=m
# CONFIG_CRYPTO_XCBC is not set
# CONFIG_CRYPTO_XXHASH is not set
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
# CONFIG_CRYPTO_CRC32 is not set
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=m
# CONFIG_CRYPTO_LZO is not set
# CONFIG_CRYPTO_842 is not set
CONFIG_CRYPTO_LZ4=y
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_JITTERENTROPY_MEMORY_BLOCKS=64
CONFIG_CRYPTO_JITTERENTROPY_MEMORY_BLOCKSIZE=32
CONFIG_CRYPTO_JITTERENTROPY_OSR=1
CONFIG_CRYPTO_DF80090A=y
# end of Random number generation

#
# Userspace interface
#
# end of Userspace interface

CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_ALLWINNER is not set
# CONFIG_CRYPTO_DEV_SL3516 is not set
# CONFIG_CRYPTO_DEV_FSL_CAAM is not set
# CONFIG_CRYPTO_DEV_EXYNOS_RNG is not set
# CONFIG_CRYPTO_DEV_S5P is not set
# CONFIG_CRYPTO_DEV_ATMEL_AES is not set
# CONFIG_CRYPTO_DEV_ATMEL_TDES is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA is not set
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
# CONFIG_CAVIUM_CPT is not set
# CONFIG_CRYPTO_DEV_NITROX_CNN55XX is not set
# CONFIG_CRYPTO_DEV_MARVELL_CESA is not set
# CONFIG_CRYPTO_DEV_OCTEONTX_CPT is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4 is not set
CONFIG_CRYPTO_DEV_QAT=y
CONFIG_CRYPTO_DEV_QAT_DH895xCC=m
# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
CONFIG_CRYPTO_DEV_QAT_C62X=m
CONFIG_CRYPTO_DEV_QAT_4XXX=y
# CONFIG_CRYPTO_DEV_QAT_420XX is not set
# CONFIG_CRYPTO_DEV_QAT_6XXX is not set
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=m
# CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
CONFIG_CRYPTO_DEV_QAT_C62XVF=y
# CONFIG_CRYPTO_DEV_QAT_ERROR_INJECTION is not set
# CONFIG_CRYPTO_DEV_QCE is not set
# CONFIG_CRYPTO_DEV_IMGTEC_HASH is not set
# CONFIG_CRYPTO_DEV_XILINX_TRNG is not set
# CONFIG_CRYPTO_DEV_ZYNQMP_AES is not set
# CONFIG_CRYPTO_DEV_ZYNQMP_SHA3 is not set
# CONFIG_CRYPTO_DEV_VIRTIO is not set
CONFIG_CRYPTO_DEV_SAFEXCEL=m
# CONFIG_CRYPTO_DEV_HISI_SEC is not set
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG is not set
# CONFIG_CRYPTO_DEV_SA2UL is not set
# CONFIG_CRYPTO_DEV_ASPEED is not set
# CONFIG_CRYPTO_DEV_JH7110 is not set
# CONFIG_CRYPTO_DEV_EIP93 is not set
# CONFIG_CRYPTO_DEV_TI_DTHEV2 is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=y
CONFIG_PKCS7_MESSAGE_PARSER=y
CONFIG_PKCS7_WAIVE_AUTHATTRS_REJECTION_FOR_MLDSA=y
CONFIG_PKCS7_TEST_KEY=m
# CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
CONFIG_FIPS_SIGNATURE_SELFTEST=y
CONFIG_FIPS_SIGNATURE_SELFTEST_RSA=y
CONFIG_FIPS_SIGNATURE_SELFTEST_ECDSA=y

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
# CONFIG_MODULE_SIG_KEY_TYPE_RSA is not set
# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
CONFIG_MODULE_SIG_KEY_TYPE_MLDSA_44=y
# CONFIG_MODULE_SIG_KEY_TYPE_MLDSA_65 is not set
# CONFIG_MODULE_SIG_KEY_TYPE_MLDSA_87 is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# CONFIG_SYSTEM_REVOCATION_LIST is not set
CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE=y
CONFIG_OPENSSL_SUPPORTS_ML_DSA=y
# end of Certificates for signature checking

CONFIG_CRYPTO_KRB5=m
# CONFIG_CRYPTO_KRB5_SELFTESTS is not set
CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_ARCH_HAS_STRNCPY_FROM_USER=y
CONFIG_ARCH_HAS_STRNLEN_USER=y
# CONFIG_CORDIC is not set
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_INDIRECT_IOMEM=y
CONFIG_CRC7=m
CONFIG_CRC8=y
CONFIG_CRC16=y
CONFIG_CRC_CCITT=m
CONFIG_CRC_ITU_T=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC32=y
CONFIG_CRC64=y
CONFIG_CRC_KUNIT_TEST=m
CONFIG_CRC_BENCHMARK=y

#
# Crypto library routines
#
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_AESCFB=m
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2B=m
CONFIG_CRYPTO_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_MD5=m
CONFIG_CRYPTO_LIB_MLDSA=y
CONFIG_CRYPTO_LIB_NH=m
CONFIG_CRYPTO_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_LIB_POLYVAL=m
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
CONFIG_CRYPTO_LIB_SHA512=y
CONFIG_CRYPTO_LIB_SHA3=y
# CONFIG_CRYPTO_LIB_BLAKE2B_KUNIT_TEST is not set
# CONFIG_CRYPTO_LIB_BLAKE2S_KUNIT_TEST is not set
CONFIG_CRYPTO_LIB_MD5_KUNIT_TEST=m
CONFIG_CRYPTO_LIB_MLDSA_KUNIT_TEST=m
# CONFIG_CRYPTO_LIB_NH_KUNIT_TEST is not set
CONFIG_CRYPTO_LIB_POLY1305_KUNIT_TEST=m
CONFIG_CRYPTO_LIB_POLYVAL_KUNIT_TEST=m
# CONFIG_CRYPTO_LIB_SHA1_KUNIT_TEST is not set
CONFIG_CRYPTO_LIB_SHA256_KUNIT_TEST=m
CONFIG_CRYPTO_LIB_SHA512_KUNIT_TEST=m
CONFIG_CRYPTO_LIB_SHA3_KUNIT_TEST=m
CONFIG_CRYPTO_LIB_BENCHMARK_VISIBLE=y
CONFIG_CRYPTO_LIB_BENCHMARK=y
# end of Crypto library routines

CONFIG_XXHASH=y
CONFIG_RANDOM32_SELFTEST=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=m
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_ARM64=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_RISCV=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_ENC16=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=m
CONFIG_BCH_CONST_PARAMS=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_DMA_NEED_SYNC=y
CONFIG_DMA_API_DEBUG=y
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_FORCE_NR_CPUS=y
CONFIG_GLOB=y
CONFIG_CLZ_TAB=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_SG_POOL=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_STACKDEPOT_MAX_FRAMES=64
CONFIG_REF_TRACKER=y
CONFIG_SBITMAP=y
# CONFIG_PARMAN is not set
# CONFIG_OBJAGG is not set
# CONFIG_LWQ_TEST is not set
# end of Library routines

CONFIG_ASN1_ENCODER=m
CONFIG_FIRMWARE_TABLE=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
# CONFIG_PRINTK_TIME is not set
# CONFIG_PRINTK_CALLER is not set
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
# CONFIG_DYNAMIC_DEBUG is not set
# CONFIG_DYNAMIC_DEBUG_CORE is not set
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# CONFIG_DEBUG_BUGVERBOSE_DETAILED is not set
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_ULEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_DEBUG_INFO_DWARF5 is not set
# CONFIG_DEBUG_INFO_REDUCED is not set
# CONFIG_DEBUG_INFO_COMPRESSED_NONE is not set
# CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
CONFIG_DEBUG_INFO_COMPRESSED_ZSTD=y
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_DEBUG_INFO_BTF=y
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
CONFIG_DEBUG_INFO_BTF_MODULES=y
# CONFIG_MODULE_ALLOW_BTF_MISMATCH is not set
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_FRAME_POINTER=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_ARCH_HAS_UBSAN=y
# CONFIG_UBSAN is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_DEBUG_PAGEALLOC=y
CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=y
CONFIG_SLUB_DEBUG=y
CONFIG_SLUB_DEBUG_ON=y
CONFIG_SLUB_RCU_DEBUG=y
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_POISONING=y
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=y
# CONFIG_DEBUG_KMEMLEAK_VERBOSE is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
# CONFIG_DEBUG_VFS is not set
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
CONFIG_DEBUG_VM_MAPLE_TREE=y
# CONFIG_DEBUG_VM_RB is not set
CONFIG_DEBUG_VM_PGFLAGS=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_KASAN_SW_TAGS=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX=y
CONFIG_KASAN_GENERIC=y
CONFIG_KASAN_OUTLINE=y
# CONFIG_KASAN_INLINE is not set
CONFIG_KASAN_STACK=y
# CONFIG_KASAN_VMALLOC is not set
# CONFIG_KASAN_EXTRA_INFO is not set
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_TIMEOUT=0
# CONFIG_SOFTLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
CONFIG_BOOTPARAM_HUNG_TASK_PANIC=0
# CONFIG_DETECT_HUNG_TASK_BLOCKER is not set
# CONFIG_WQ_WATCHDOG is not set
CONFIG_WQ_CPU_INTENSIVE_REPORT=y
CONFIG_TEST_LOCKUP=m
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# CONFIG_SCHEDSTATS is not set
# end of Scheduler Debugging

CONFIG_DEBUG_PREEMPT=y
CONFIG_DEBUG_ATOMIC=y
CONFIG_DEBUG_ATOMIC_LARGEST_ALIGN=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
CONFIG_WW_MUTEX_SELFTEST=m
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_DEBUG_KOBJECT is not set
CONFIG_HAVE_DEBUG_BUGVERBOSE=y

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
CONFIG_DEBUG_PLIST=y
# CONFIG_DEBUG_SG is not set
CONFIG_DEBUG_NOTIFIERS=y
CONFIG_DEBUG_MAPLE_TREE=y
# end of Debug kernel data structures

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=y
# CONFIG_RCU_TORTURE_TEST_CHK_RDR_STATE is not set
CONFIG_RCU_TORTURE_TEST_LOG_CPU=y
CONFIG_RCU_TORTURE_TEST_LOG_GP=y
CONFIG_RCU_REF_SCALE_TEST=y
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_CPU_STALL_CPUTIME is not set
CONFIG_RCU_TRACE=y
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
# CONFIG_LATENCYTOP is not set
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_TRACE_CLOCK=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_SAMPLES is not set
# CONFIG_STRICT_DEVMEM is not set

#
# um Debugging
#
CONFIG_GPROF=y
CONFIG_EARLY_PRINTK=y
# end of um Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=y
CONFIG_KUNIT_DEBUGFS=y
CONFIG_KUNIT_TEST=m
CONFIG_KUNIT_EXAMPLE_TEST=m
CONFIG_KUNIT_ALL_TESTS=m
# CONFIG_KUNIT_DEFAULT_ENABLED is not set
CONFIG_KUNIT_AUTORUN_ENABLED=y
CONFIG_KUNIT_DEFAULT_FILTER_GLOB=""
CONFIG_KUNIT_DEFAULT_FILTER=""
CONFIG_KUNIT_DEFAULT_FILTER_ACTION=""
CONFIG_KUNIT_DEFAULT_TIMEOUT=300
CONFIG_KUNIT_UML_PCI=y
CONFIG_NOTIFIER_ERROR_INJECTION=m
CONFIG_PM_NOTIFIER_ERROR_INJECT=m
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_TEST_DHRY=m
CONFIG_LKDTM=m
CONFIG_CPUMASK_KUNIT_TEST=m
CONFIG_TEST_LIST_SORT=m
CONFIG_TEST_SORT=m
# CONFIG_TEST_DIV64 is not set
CONFIG_TEST_MULDIV64=y
CONFIG_TEST_IOV_ITER=m
CONFIG_BACKTRACE_SELF_TEST=m
CONFIG_TEST_REF_TRACKER=y
# CONFIG_RBTREE_TEST is not set
CONFIG_REED_SOLOMON_TEST=y
CONFIG_INTERVAL_TREE_TEST=m
CONFIG_PERCPU_TEST=m
# CONFIG_ATOMIC64_SELFTEST is not set
CONFIG_TEST_HEXDUMP=y
# CONFIG_PRINTF_KUNIT_TEST is not set
CONFIG_SCANF_KUNIT_TEST=m
# CONFIG_SEQ_BUF_KUNIT_TEST is not set
CONFIG_STRING_KUNIT_TEST=m
CONFIG_STRING_HELPERS_KUNIT_TEST=m
CONFIG_FFS_KUNIT_TEST=m
CONFIG_TEST_KSTRTOX=m
CONFIG_TEST_BITMAP=m
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_MAPLE_TREE is not set
CONFIG_TEST_RHASHTABLE=m
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_MISC_MINOR is not set
CONFIG_TEST_LKM=m
CONFIG_TEST_BITOPS=y
CONFIG_TEST_VMALLOC=m
CONFIG_FIND_BIT_BENCHMARK=y
CONFIG_TEST_FIRMWARE=y
# CONFIG_TEST_SYSCTL is not set
CONFIG_BITOPS_KUNIT=m
CONFIG_BITFIELD_KUNIT=m
# CONFIG_CHECKSUM_KUNIT is not set
CONFIG_UTIL_MACROS_KUNIT=m
CONFIG_HASH_KUNIT_TEST=m
# CONFIG_RESOURCE_KUNIT_TEST is not set
CONFIG_SYSCTL_KUNIT_TEST=m
CONFIG_KFIFO_KUNIT_TEST=m
CONFIG_LIST_KUNIT_TEST=m
# CONFIG_LIST_PRIVATE_KUNIT_TEST is not set
CONFIG_HASHTABLE_KUNIT_TEST=m
CONFIG_LINEAR_RANGES_TEST=m
CONFIG_CMDLINE_KUNIT_TEST=m
# CONFIG_BASE64_KUNIT is not set
CONFIG_BITS_TEST=m
CONFIG_SLUB_KUNIT_TEST=m
CONFIG_RATIONAL_KUNIT_TEST=m
CONFIG_MEMCPY_KUNIT_TEST=m
CONFIG_MIN_HEAP_KUNIT_TEST=m
# CONFIG_IS_SIGNED_TYPE_KUNIT_TEST is not set
CONFIG_OVERFLOW_KUNIT_TEST=m
CONFIG_RANDSTRUCT_KUNIT_TEST=m
CONFIG_STACKINIT_KUNIT_TEST=m
# CONFIG_FORTIFY_KUNIT_TEST is not set
# CONFIG_SIPHASH_KUNIT_TEST is not set
CONFIG_USERCOPY_KUNIT_TEST=y
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
CONFIG_TEST_KMOD=m
# CONFIG_TEST_KALLSYMS is not set
CONFIG_TEST_MEMCAT_P=y
CONFIG_TEST_MEMINIT=m
CONFIG_TEST_FREE_PAGES=m
CONFIG_TEST_OBJPOOL=m
CONFIG_RATELIMIT_KUNIT_TEST=m
# CONFIG_UUID_KUNIT_TEST is not set
CONFIG_INT_POW_KUNIT_TEST=m
# CONFIG_INT_SQRT_KUNIT_TEST is not set
CONFIG_INT_LOG_KUNIT_TEST=m
CONFIG_GCD_KUNIT_TEST=m
CONFIG_PRIME_NUMBERS_KUNIT_TEST=m
CONFIG_GLOB_KUNIT_TEST=m
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

#
# Documentation
#
# CONFIG_WARN_MISSING_DOCUMENTS is not set
# CONFIG_WARN_ABI_ERRORS is not set
# end of Documentation

--eabBYEV3iYFD53oW--
