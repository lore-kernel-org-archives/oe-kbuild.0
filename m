Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5A31DFE3
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jan 2024 07:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVeRc/IU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704352781; x=1735888781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4X+zVKxbvf3b8rQWokvnuGqyMDuSIl9BAivEDF+7iQ=;
  b=hVeRc/IU6E6Hv1+IGGssLvRDtQQh6Og9lbVNOc+3Z+GaglEx+hZx2pOp
   Mwjp5wKWT1GRbL4/SFVZU4SXijSHdnfGvlmUzIRImm2PyG5F35ZwaJbbP
   IOz0rUs6gZFXIuUkpSeIZ8byBsWy7nB2ELBejArvWDH4m9LI925ZhKkbn
   q9hswXBx5r6pAAElWlf1N9TZVmQ/GxxiOipzDnfoorcs6ysrXS7S0uXEm
   vHiAPmxcZ2yVNAYIHNxPrB76W8+Ey5ux+FdEk4mFbpLFKXhkgmcevrTHu
   zq/g6l+jy4tiUCpkq3Ym0l/dnFDb0S4vK1ES6RBs8Hkwg05IffEfnao8g
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="461457356"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="461457356"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 23:19:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="809106148"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="809106148"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 03 Jan 2024 23:19:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLI0t-000N1A-12;
	Thu, 04 Jan 2024 07:19:36 +0000
Date: Thu, 4 Jan 2024 15:19:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/kernel/machine_kexec.c:31: warning: Function parameter or
 member '_i' not described in 'kexec_image_info'
Message-ID: <202401041550.VltBa8dz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm64/kernel/machine_kexec.c:31: warning: Function parameter or member '_i' not described in 'kexec_image_info'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric DeVolder <eric.devolder@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac865f00af293d081356bec56eea90815094a60e
commit: 91506f7e5d2142130f7407fca42c7a44a77eedfa arm64/kexec: refactor for kernel/Kconfig.kexec
date:   5 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 months ago
config: arm64-buildonly-randconfig-r004-20230608 (https://download.01.org/0day-ci/archive/20240104/202401041550.VltBa8dz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20240104/202401041550.VltBa8dz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401041550.VltBa8dz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/machine_kexec.c:31: warning: Function parameter or member '_i' not described in 'kexec_image_info'
>> arch/arm64/kernel/machine_kexec.c:70: warning: Function parameter or member 'kimage' not described in 'machine_kexec_prepare'
>> arch/arm64/kernel/machine_kexec.c:83: warning: Function parameter or member 'kimage' not described in 'kexec_segment_flush'
>> arch/arm64/kernel/machine_kexec.c:180: warning: Function parameter or member 'kimage' not described in 'machine_kexec'
>> arch/arm64/kernel/machine_kexec.c:259: warning: Function parameter or member 'regs' not described in 'machine_crash_shutdown'


vim +31 arch/arm64/kernel/machine_kexec.c

d28f6df1305a86 Geoff Levand    2016-06-23   27  
221f2c770e10d3 Geoff Levand    2016-06-23   28  /**
221f2c770e10d3 Geoff Levand    2016-06-23   29   * kexec_image_info - For debugging output.
221f2c770e10d3 Geoff Levand    2016-06-23   30   */
221f2c770e10d3 Geoff Levand    2016-06-23  @31  #define kexec_image_info(_i) _kexec_image_info(__func__, __LINE__, _i)
221f2c770e10d3 Geoff Levand    2016-06-23   32  static void _kexec_image_info(const char *func, int line,
221f2c770e10d3 Geoff Levand    2016-06-23   33  	const struct kimage *kimage)
221f2c770e10d3 Geoff Levand    2016-06-23   34  {
221f2c770e10d3 Geoff Levand    2016-06-23   35  	unsigned long i;
221f2c770e10d3 Geoff Levand    2016-06-23   36  
221f2c770e10d3 Geoff Levand    2016-06-23   37  	pr_debug("%s:%d:\n", func, line);
221f2c770e10d3 Geoff Levand    2016-06-23   38  	pr_debug("  kexec kimage info:\n");
221f2c770e10d3 Geoff Levand    2016-06-23   39  	pr_debug("    type:        %d\n", kimage->type);
221f2c770e10d3 Geoff Levand    2016-06-23   40  	pr_debug("    start:       %lx\n", kimage->start);
221f2c770e10d3 Geoff Levand    2016-06-23   41  	pr_debug("    head:        %lx\n", kimage->head);
221f2c770e10d3 Geoff Levand    2016-06-23   42  	pr_debug("    nr_segments: %lu\n", kimage->nr_segments);
08eae0ef618f34 Pasha Tatashin  2021-09-30   43  	pr_debug("    dtb_mem: %pa\n", &kimage->arch.dtb_mem);
4c3c31230c912d Pavel Tatashin  2021-01-25   44  	pr_debug("    kern_reloc: %pa\n", &kimage->arch.kern_reloc);
08eae0ef618f34 Pasha Tatashin  2021-09-30   45  	pr_debug("    el2_vectors: %pa\n", &kimage->arch.el2_vectors);
221f2c770e10d3 Geoff Levand    2016-06-23   46  
221f2c770e10d3 Geoff Levand    2016-06-23   47  	for (i = 0; i < kimage->nr_segments; i++) {
221f2c770e10d3 Geoff Levand    2016-06-23   48  		pr_debug("      segment[%lu]: %016lx - %016lx, 0x%lx bytes, %lu pages\n",
221f2c770e10d3 Geoff Levand    2016-06-23   49  			i,
221f2c770e10d3 Geoff Levand    2016-06-23   50  			kimage->segment[i].mem,
221f2c770e10d3 Geoff Levand    2016-06-23   51  			kimage->segment[i].mem + kimage->segment[i].memsz,
221f2c770e10d3 Geoff Levand    2016-06-23   52  			kimage->segment[i].memsz,
221f2c770e10d3 Geoff Levand    2016-06-23   53  			kimage->segment[i].memsz /  PAGE_SIZE);
221f2c770e10d3 Geoff Levand    2016-06-23   54  	}
221f2c770e10d3 Geoff Levand    2016-06-23   55  }
221f2c770e10d3 Geoff Levand    2016-06-23   56  
d28f6df1305a86 Geoff Levand    2016-06-23   57  void machine_kexec_cleanup(struct kimage *kimage)
d28f6df1305a86 Geoff Levand    2016-06-23   58  {
d28f6df1305a86 Geoff Levand    2016-06-23   59  	/* Empty routine needed to avoid build errors. */
d28f6df1305a86 Geoff Levand    2016-06-23   60  }
d28f6df1305a86 Geoff Levand    2016-06-23   61  
d28f6df1305a86 Geoff Levand    2016-06-23   62  /**
d28f6df1305a86 Geoff Levand    2016-06-23   63   * machine_kexec_prepare - Prepare for a kexec reboot.
d28f6df1305a86 Geoff Levand    2016-06-23   64   *
d28f6df1305a86 Geoff Levand    2016-06-23   65   * Called from the core kexec code when a kernel image is loaded.
d28f6df1305a86 Geoff Levand    2016-06-23   66   * Forbid loading a kexec kernel if we have no way of hotplugging cpus or cpus
d28f6df1305a86 Geoff Levand    2016-06-23   67   * are stuck in the kernel. This avoids a panic once we hit machine_kexec().
d28f6df1305a86 Geoff Levand    2016-06-23   68   */
d28f6df1305a86 Geoff Levand    2016-06-23   69  int machine_kexec_prepare(struct kimage *kimage)
d28f6df1305a86 Geoff Levand    2016-06-23  @70  {
d28f6df1305a86 Geoff Levand    2016-06-23   71  	if (kimage->type != KEXEC_TYPE_CRASH && cpus_are_stuck_in_kernel()) {
d28f6df1305a86 Geoff Levand    2016-06-23   72  		pr_err("Can't kexec: CPUs are stuck in the kernel.\n");
d28f6df1305a86 Geoff Levand    2016-06-23   73  		return -EBUSY;
d28f6df1305a86 Geoff Levand    2016-06-23   74  	}
d28f6df1305a86 Geoff Levand    2016-06-23   75  
d28f6df1305a86 Geoff Levand    2016-06-23   76  	return 0;
d28f6df1305a86 Geoff Levand    2016-06-23   77  }
d28f6df1305a86 Geoff Levand    2016-06-23   78  
d28f6df1305a86 Geoff Levand    2016-06-23   79  /**
d28f6df1305a86 Geoff Levand    2016-06-23   80   * kexec_segment_flush - Helper to flush the kimage segments to PoC.
d28f6df1305a86 Geoff Levand    2016-06-23   81   */
d28f6df1305a86 Geoff Levand    2016-06-23   82  static void kexec_segment_flush(const struct kimage *kimage)
d28f6df1305a86 Geoff Levand    2016-06-23  @83  {
d28f6df1305a86 Geoff Levand    2016-06-23   84  	unsigned long i;
d28f6df1305a86 Geoff Levand    2016-06-23   85  
d28f6df1305a86 Geoff Levand    2016-06-23   86  	pr_debug("%s:\n", __func__);
d28f6df1305a86 Geoff Levand    2016-06-23   87  
d28f6df1305a86 Geoff Levand    2016-06-23   88  	for (i = 0; i < kimage->nr_segments; i++) {
d28f6df1305a86 Geoff Levand    2016-06-23   89  		pr_debug("  segment[%lu]: %016lx - %016lx, 0x%lx bytes, %lu pages\n",
d28f6df1305a86 Geoff Levand    2016-06-23   90  			i,
d28f6df1305a86 Geoff Levand    2016-06-23   91  			kimage->segment[i].mem,
d28f6df1305a86 Geoff Levand    2016-06-23   92  			kimage->segment[i].mem + kimage->segment[i].memsz,
d28f6df1305a86 Geoff Levand    2016-06-23   93  			kimage->segment[i].memsz,
d28f6df1305a86 Geoff Levand    2016-06-23   94  			kimage->segment[i].memsz /  PAGE_SIZE);
d28f6df1305a86 Geoff Levand    2016-06-23   95  
fade9c2c6ee2ba Fuad Tabba      2021-05-24   96  		dcache_clean_inval_poc(
814b186079cd54 Fuad Tabba      2021-05-24   97  			(unsigned long)phys_to_virt(kimage->segment[i].mem),
814b186079cd54 Fuad Tabba      2021-05-24   98  			(unsigned long)phys_to_virt(kimage->segment[i].mem) +
d28f6df1305a86 Geoff Levand    2016-06-23   99  				kimage->segment[i].memsz);
d28f6df1305a86 Geoff Levand    2016-06-23  100  	}
d28f6df1305a86 Geoff Levand    2016-06-23  101  }
d28f6df1305a86 Geoff Levand    2016-06-23  102  
08eae0ef618f34 Pasha Tatashin  2021-09-30  103  /* Allocates pages for kexec page table */
08eae0ef618f34 Pasha Tatashin  2021-09-30  104  static void *kexec_page_alloc(void *arg)
08eae0ef618f34 Pasha Tatashin  2021-09-30  105  {
6915cffd4889bb Yu Zhe          2023-03-03  106  	struct kimage *kimage = arg;
08eae0ef618f34 Pasha Tatashin  2021-09-30  107  	struct page *page = kimage_alloc_control_pages(kimage, 0);
7afccde389dcfa Rongwei Wang    2021-11-26  108  	void *vaddr = NULL;
08eae0ef618f34 Pasha Tatashin  2021-09-30  109  
08eae0ef618f34 Pasha Tatashin  2021-09-30  110  	if (!page)
08eae0ef618f34 Pasha Tatashin  2021-09-30  111  		return NULL;
08eae0ef618f34 Pasha Tatashin  2021-09-30  112  
7afccde389dcfa Rongwei Wang    2021-11-26  113  	vaddr = page_address(page);
7afccde389dcfa Rongwei Wang    2021-11-26  114  	memset(vaddr, 0, PAGE_SIZE);
08eae0ef618f34 Pasha Tatashin  2021-09-30  115  
7afccde389dcfa Rongwei Wang    2021-11-26  116  	return vaddr;
08eae0ef618f34 Pasha Tatashin  2021-09-30  117  }
08eae0ef618f34 Pasha Tatashin  2021-09-30  118  
0d8732e461d6b4 Pasha Tatashin  2021-09-30  119  int machine_kexec_post_load(struct kimage *kimage)
0d8732e461d6b4 Pasha Tatashin  2021-09-30  120  {
3744b5280e67f5 Pasha Tatashin  2021-09-30  121  	int rc;
3744b5280e67f5 Pasha Tatashin  2021-09-30  122  	pgd_t *trans_pgd;
0d8732e461d6b4 Pasha Tatashin  2021-09-30  123  	void *reloc_code = page_to_virt(kimage->control_code_page);
19a046f07ce5a5 Pasha Tatashin  2021-09-30  124  	long reloc_size;
08eae0ef618f34 Pasha Tatashin  2021-09-30  125  	struct trans_pgd_info info = {
08eae0ef618f34 Pasha Tatashin  2021-09-30  126  		.trans_alloc_page	= kexec_page_alloc,
08eae0ef618f34 Pasha Tatashin  2021-09-30  127  		.trans_alloc_arg	= kimage,
08eae0ef618f34 Pasha Tatashin  2021-09-30  128  	};
0d8732e461d6b4 Pasha Tatashin  2021-09-30  129  
5bb6834fc29000 Pasha Tatashin  2021-09-30  130  	/* If in place, relocation is not used, only flush next kernel */
5bb6834fc29000 Pasha Tatashin  2021-09-30  131  	if (kimage->head & IND_DONE) {
0d8732e461d6b4 Pasha Tatashin  2021-09-30  132  		kexec_segment_flush(kimage);
5bb6834fc29000 Pasha Tatashin  2021-09-30  133  		kexec_image_info(kimage);
5bb6834fc29000 Pasha Tatashin  2021-09-30  134  		return 0;
5bb6834fc29000 Pasha Tatashin  2021-09-30  135  	}
0d8732e461d6b4 Pasha Tatashin  2021-09-30  136  
08eae0ef618f34 Pasha Tatashin  2021-09-30  137  	kimage->arch.el2_vectors = 0;
08eae0ef618f34 Pasha Tatashin  2021-09-30  138  	if (is_hyp_nvhe()) {
3744b5280e67f5 Pasha Tatashin  2021-09-30  139  		rc = trans_pgd_copy_el2_vectors(&info,
08eae0ef618f34 Pasha Tatashin  2021-09-30  140  						&kimage->arch.el2_vectors);
08eae0ef618f34 Pasha Tatashin  2021-09-30  141  		if (rc)
08eae0ef618f34 Pasha Tatashin  2021-09-30  142  			return rc;
08eae0ef618f34 Pasha Tatashin  2021-09-30  143  	}
08eae0ef618f34 Pasha Tatashin  2021-09-30  144  
3744b5280e67f5 Pasha Tatashin  2021-09-30  145  	/* Create a copy of the linear map */
3744b5280e67f5 Pasha Tatashin  2021-09-30  146  	trans_pgd = kexec_page_alloc(kimage);
3744b5280e67f5 Pasha Tatashin  2021-09-30  147  	if (!trans_pgd)
3744b5280e67f5 Pasha Tatashin  2021-09-30  148  		return -ENOMEM;
3744b5280e67f5 Pasha Tatashin  2021-09-30  149  	rc = trans_pgd_create_copy(&info, &trans_pgd, PAGE_OFFSET, PAGE_END);
3744b5280e67f5 Pasha Tatashin  2021-09-30  150  	if (rc)
3744b5280e67f5 Pasha Tatashin  2021-09-30  151  		return rc;
3744b5280e67f5 Pasha Tatashin  2021-09-30  152  	kimage->arch.ttbr1 = __pa(trans_pgd);
2f2183243f52a8 Mark Rutland    2021-11-30  153  	kimage->arch.zero_page = __pa_symbol(empty_zero_page);
3744b5280e67f5 Pasha Tatashin  2021-09-30  154  
19a046f07ce5a5 Pasha Tatashin  2021-09-30  155  	reloc_size = __relocate_new_kernel_end - __relocate_new_kernel_start;
19a046f07ce5a5 Pasha Tatashin  2021-09-30  156  	memcpy(reloc_code, __relocate_new_kernel_start, reloc_size);
0d8732e461d6b4 Pasha Tatashin  2021-09-30  157  	kimage->arch.kern_reloc = __pa(reloc_code);
efc2d0f20a9dab Pasha Tatashin  2021-09-30  158  	rc = trans_pgd_idmap_page(&info, &kimage->arch.ttbr0,
efc2d0f20a9dab Pasha Tatashin  2021-09-30  159  				  &kimage->arch.t0sz, reloc_code);
efc2d0f20a9dab Pasha Tatashin  2021-09-30  160  	if (rc)
efc2d0f20a9dab Pasha Tatashin  2021-09-30  161  		return rc;
efc2d0f20a9dab Pasha Tatashin  2021-09-30  162  	kimage->arch.phys_offset = virt_to_phys(kimage) - (long)kimage;
0d8732e461d6b4 Pasha Tatashin  2021-09-30  163  
0d8732e461d6b4 Pasha Tatashin  2021-09-30  164  	/* Flush the reloc_code in preparation for its execution. */
0d8732e461d6b4 Pasha Tatashin  2021-09-30  165  	dcache_clean_inval_poc((unsigned long)reloc_code,
19a046f07ce5a5 Pasha Tatashin  2021-09-30  166  			       (unsigned long)reloc_code + reloc_size);
0d8732e461d6b4 Pasha Tatashin  2021-09-30  167  	icache_inval_pou((uintptr_t)reloc_code,
19a046f07ce5a5 Pasha Tatashin  2021-09-30  168  			 (uintptr_t)reloc_code + reloc_size);
5bb6834fc29000 Pasha Tatashin  2021-09-30  169  	kexec_image_info(kimage);
0d8732e461d6b4 Pasha Tatashin  2021-09-30  170  
0d8732e461d6b4 Pasha Tatashin  2021-09-30  171  	return 0;
0d8732e461d6b4 Pasha Tatashin  2021-09-30  172  }
0d8732e461d6b4 Pasha Tatashin  2021-09-30  173  
d28f6df1305a86 Geoff Levand    2016-06-23  174  /**
d28f6df1305a86 Geoff Levand    2016-06-23  175   * machine_kexec - Do the kexec reboot.
d28f6df1305a86 Geoff Levand    2016-06-23  176   *
d28f6df1305a86 Geoff Levand    2016-06-23  177   * Called from the core kexec code for a sys_reboot with LINUX_REBOOT_CMD_KEXEC.
d28f6df1305a86 Geoff Levand    2016-06-23  178   */
d28f6df1305a86 Geoff Levand    2016-06-23  179  void machine_kexec(struct kimage *kimage)
d28f6df1305a86 Geoff Levand    2016-06-23 @180  {
78fd584cdec051 AKASHI Takahiro 2017-04-03  181  	bool in_kexec_crash = (kimage == kexec_crash_image);
78fd584cdec051 AKASHI Takahiro 2017-04-03  182  	bool stuck_cpus = cpus_are_stuck_in_kernel();
d28f6df1305a86 Geoff Levand    2016-06-23  183  
d28f6df1305a86 Geoff Levand    2016-06-23  184  	/*
d28f6df1305a86 Geoff Levand    2016-06-23  185  	 * New cpus may have become stuck_in_kernel after we loaded the image.
d28f6df1305a86 Geoff Levand    2016-06-23  186  	 */
78fd584cdec051 AKASHI Takahiro 2017-04-03  187  	BUG_ON(!in_kexec_crash && (stuck_cpus || (num_online_cpus() > 1)));
78fd584cdec051 AKASHI Takahiro 2017-04-03  188  	WARN(in_kexec_crash && (stuck_cpus || smp_crash_stop_failed()),
78fd584cdec051 AKASHI Takahiro 2017-04-03  189  		"Some CPUs may be stale, kdump will be unreliable.\n");
d28f6df1305a86 Geoff Levand    2016-06-23  190  
d28f6df1305a86 Geoff Levand    2016-06-23  191  	pr_info("Bye!\n");
d28f6df1305a86 Geoff Levand    2016-06-23  192  
0fbeb318754860 James Morse     2017-11-02  193  	local_daif_mask();
d28f6df1305a86 Geoff Levand    2016-06-23  194  
d28f6df1305a86 Geoff Levand    2016-06-23  195  	/*
efc2d0f20a9dab Pasha Tatashin  2021-09-30  196  	 * Both restart and kernel_reloc will shutdown the MMU, disable data
5bb6834fc29000 Pasha Tatashin  2021-09-30  197  	 * caches. However, restart will start new kernel or purgatory directly,
efc2d0f20a9dab Pasha Tatashin  2021-09-30  198  	 * kernel_reloc contains the body of arm64_relocate_new_kernel
4c9e7e649a3f29 AKASHI Takahiro 2018-11-15  199  	 * In kexec case, kimage->start points to purgatory assuming that
4c9e7e649a3f29 AKASHI Takahiro 2018-11-15  200  	 * kernel entry and dtb address are embedded in purgatory by
4c9e7e649a3f29 AKASHI Takahiro 2018-11-15  201  	 * userspace (kexec-tools).
4c9e7e649a3f29 AKASHI Takahiro 2018-11-15  202  	 * In kexec_file case, the kernel starts directly without purgatory.
d28f6df1305a86 Geoff Levand    2016-06-23  203  	 */
5bb6834fc29000 Pasha Tatashin  2021-09-30  204  	if (kimage->head & IND_DONE) {
7a2512fa649397 Pasha Tatashin  2021-09-30  205  		typeof(cpu_soft_restart) *restart;
5bb6834fc29000 Pasha Tatashin  2021-09-30  206  
5bb6834fc29000 Pasha Tatashin  2021-09-30  207  		cpu_install_idmap();
607289a7cd7a3c Sami Tolvanen   2022-09-08  208  		restart = (void *)__pa_symbol(cpu_soft_restart);
5bb6834fc29000 Pasha Tatashin  2021-09-30  209  		restart(is_hyp_nvhe(), kimage->start, kimage->arch.dtb_mem,
5bb6834fc29000 Pasha Tatashin  2021-09-30  210  			0, 0);
5bb6834fc29000 Pasha Tatashin  2021-09-30  211  	} else {
efc2d0f20a9dab Pasha Tatashin  2021-09-30  212  		void (*kernel_reloc)(struct kimage *kimage);
efc2d0f20a9dab Pasha Tatashin  2021-09-30  213  
08eae0ef618f34 Pasha Tatashin  2021-09-30  214  		if (is_hyp_nvhe())
08eae0ef618f34 Pasha Tatashin  2021-09-30  215  			__hyp_set_vectors(kimage->arch.el2_vectors);
efc2d0f20a9dab Pasha Tatashin  2021-09-30  216  		cpu_install_ttbr0(kimage->arch.ttbr0, kimage->arch.t0sz);
efc2d0f20a9dab Pasha Tatashin  2021-09-30  217  		kernel_reloc = (void *)kimage->arch.kern_reloc;
efc2d0f20a9dab Pasha Tatashin  2021-09-30  218  		kernel_reloc(kimage);
5bb6834fc29000 Pasha Tatashin  2021-09-30  219  	}
d28f6df1305a86 Geoff Levand    2016-06-23  220  
d28f6df1305a86 Geoff Levand    2016-06-23  221  	BUG(); /* Should never get here. */
d28f6df1305a86 Geoff Levand    2016-06-23  222  }
d28f6df1305a86 Geoff Levand    2016-06-23  223  

:::::: The code at line 31 was first introduced by commit
:::::: 221f2c770e10d3f8dca71e1e14e24e61dc8988dd arm64/kexec: Add pr_debug output

:::::: TO: Geoff Levand <geoff@infradead.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
