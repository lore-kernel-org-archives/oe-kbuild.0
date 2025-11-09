Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF8814F9FB
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Nov 2025 00:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762647310; cv=none; b=R+pN4dohxzPa86sBj3h1fkdIMY34h1I771Iu4iaYuOPi+mmOhyzmwlt4V5z8n6iJg25tCpj1JH8ih2KeCLLDcFudXz58JaQndNZgJfaVRj274Vy62IsT2nGpZkHwkS0Rtzb6TfzxXIHKGtzVfZ0YzG4jT7i6giq33kupxPzPLhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762647310; c=relaxed/simple;
	bh=D/5vboyFdKcVoqt864gwxxvSF6/ywg+jc+IzxzqMoWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T+RYeZeswdDi+vTP2Xq2v2OBeYa63ix6U4onG5nCgRZDt1XO8xVYUxVOR8R8x2GU6pTlYkCzSYrrYnbX0UuBsW+7tTGwxN0QlVHH9siyQCBHYRIUzp4kw8S7yh51RORANijZCtiC9N68DriXEbYgsdymPm7lr2GtV0Lf2kZKUcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CeS9q5NR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CeS9q5NR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762647307; x=1794183307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D/5vboyFdKcVoqt864gwxxvSF6/ywg+jc+IzxzqMoWw=;
  b=CeS9q5NRRYPnofvZR3KnzYpQUGQ2kSQxtc7MrWy7vbdbUNdOQ1MXyb1o
   YdZLkRefWMSf9922IpTKe6y0iC+IEIOlv9RbtoscatcT0Ri2ARMjMEN8a
   qt8s8kgGWDXPAe5Uk/TuarJ8usDt0T93nmmj0rkey5b5b34xTuYSw+QJm
   E5vUnpraXB49Mo4blJqUCtMwg7DJzMsoXAtm0gMi85mG2bJ8sbMtNEScF
   XrDxP+LnvdtMi5iOEH7DK9evUNmfNTHEBPbLy62Jexm9MSeglTxc15v8t
   qVv7BlHKh10oXfRI9vvRxJ/FrBHDWIjLvsrAap1cEDKhToYwAx/6AClfo
   g==;
X-CSE-ConnectionGUID: S1t47j5bTFyzv1NcT22ISw==
X-CSE-MsgGUID: 5c3/s5O0RZmplV0Zgowwlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="52312189"
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="52312189"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 16:15:06 -0800
X-CSE-ConnectionGUID: lw47x/E8QwuLnqriPtjYZw==
X-CSE-MsgGUID: L3dSFpGgT+mmGvB1alfCvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="193531076"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Nov 2025 16:15:05 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHt5D-0001be-0t;
	Sun, 09 Nov 2025 00:15:03 +0000
Date: Sun, 9 Nov 2025 08:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-6.6 3124/3124] arch/loongarch/kernel/efi.c:220:22:
 sparse: sparse: unsigned value that used to be signed checked against zero?
Message-ID: <202511090850.eZ2zNZPj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/loongarch/kernel/efi.c:220:22: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66984acf4b16f28a2cc0d5d6186b4b6bbfd92e26
commit: 221e2e8bdbb851a519df0bac5a44298dae2b4612 [3124/3124] LoongArch: add kernel setvirtmap for runtime
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 11 months ago
config: loongarch-randconfig-r134-20251108 (https://download.01.org/0day-ci/archive/20251109/202511090850.eZ2zNZPj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d78e0ded5215824a63ac04fb87effd9eacf875eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511090850.eZ2zNZPj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511090850.eZ2zNZPj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/kernel/efi.c:98:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/efi.c:98:9: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/efi.c:153:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kernel/efi.c:153:9: sparse: sparse: cast from unknown type
>> arch/loongarch/kernel/efi.c:220:22: sparse: sparse: unsigned value that used to be signed checked against zero?
   arch/loongarch/kernel/efi.c:219:33: sparse: signed value source

vim +220 arch/loongarch/kernel/efi.c

221e2e8bdbb851 liuyun      2023-12-02   85  
221e2e8bdbb851 liuyun      2023-12-02   86  static void __init efi_map_pgt(void)
221e2e8bdbb851 liuyun      2023-12-02   87  {
221e2e8bdbb851 liuyun      2023-12-02   88  	unsigned long node;
221e2e8bdbb851 liuyun      2023-12-02   89  	unsigned long start, end;
221e2e8bdbb851 liuyun      2023-12-02   90  	unsigned long start_pfn, end_pfn;
221e2e8bdbb851 liuyun      2023-12-02   91  
221e2e8bdbb851 liuyun      2023-12-02   92  	pgd_efi = memblock_alloc_low(PAGE_SIZE, PAGE_SIZE);
221e2e8bdbb851 liuyun      2023-12-02   93  	if (!pgd_efi) {
221e2e8bdbb851 liuyun      2023-12-02   94  		pr_err("alloc efi pgd failed!\n");
221e2e8bdbb851 liuyun      2023-12-02   95  		return;
221e2e8bdbb851 liuyun      2023-12-02   96  	}
221e2e8bdbb851 liuyun      2023-12-02   97  	pgd_init(pgd_efi);
221e2e8bdbb851 liuyun      2023-12-02  @98  	csr_write64((long)pgd_efi, LOONGARCH_CSR_PGDL);
221e2e8bdbb851 liuyun      2023-12-02   99  
221e2e8bdbb851 liuyun      2023-12-02  100  	/* Low Memory, Cached */
221e2e8bdbb851 liuyun      2023-12-02  101  	efimap_populate_hugepages(0, SZ_256M, PAGE_KERNEL);
221e2e8bdbb851 liuyun      2023-12-02  102  
221e2e8bdbb851 liuyun      2023-12-02  103  	for_each_node_mask(node, node_possible_map) {
221e2e8bdbb851 liuyun      2023-12-02  104  		/* MMIO Registers, Uncached */
221e2e8bdbb851 liuyun      2023-12-02  105  		efimap_populate_hugepages(SZ_256M | (node << 44),
221e2e8bdbb851 liuyun      2023-12-02  106  				SZ_512M | (node << 44), PAGE_KERNEL_SUC);
221e2e8bdbb851 liuyun      2023-12-02  107  
221e2e8bdbb851 liuyun      2023-12-02  108  		get_pfn_range_for_nid(node, &start_pfn, &end_pfn);
221e2e8bdbb851 liuyun      2023-12-02  109  		start = ALIGN_DOWN(start_pfn << PAGE_SHIFT, PMD_SIZE);
221e2e8bdbb851 liuyun      2023-12-02  110  		end = ALIGN(end_pfn << PAGE_SHIFT, PMD_SIZE);
221e2e8bdbb851 liuyun      2023-12-02  111  
221e2e8bdbb851 liuyun      2023-12-02  112  		/* System memory, Cached */
221e2e8bdbb851 liuyun      2023-12-02  113  		efimap_populate_hugepages(node ? start : SZ_512M, end, PAGE_KERNEL);
221e2e8bdbb851 liuyun      2023-12-02  114  	}
221e2e8bdbb851 liuyun      2023-12-02  115  }
221e2e8bdbb851 liuyun      2023-12-02  116  
221e2e8bdbb851 liuyun      2023-12-02  117  static int __init efimap_free_pgt(unsigned long start, unsigned long end)
221e2e8bdbb851 liuyun      2023-12-02  118  {
221e2e8bdbb851 liuyun      2023-12-02  119  	unsigned long addr;
221e2e8bdbb851 liuyun      2023-12-02  120  	unsigned long next;
221e2e8bdbb851 liuyun      2023-12-02  121  	pud_t *pud;
221e2e8bdbb851 liuyun      2023-12-02  122  	pmd_t *pmd;
221e2e8bdbb851 liuyun      2023-12-02  123  
221e2e8bdbb851 liuyun      2023-12-02  124  	for (addr = start; addr < end; addr = next) {
221e2e8bdbb851 liuyun      2023-12-02  125  		next = pmd_addr_end(addr, end);
221e2e8bdbb851 liuyun      2023-12-02  126  
221e2e8bdbb851 liuyun      2023-12-02  127  		pud = pud_offset((p4d_t *)pgd_efi + pgd_index(addr), addr);
221e2e8bdbb851 liuyun      2023-12-02  128  		if (!pud_present(*pud))
221e2e8bdbb851 liuyun      2023-12-02  129  			continue;
221e2e8bdbb851 liuyun      2023-12-02  130  		pmd = pmd_offset(pud, addr);
221e2e8bdbb851 liuyun      2023-12-02  131  		memblock_free(pmd, PAGE_SIZE);
221e2e8bdbb851 liuyun      2023-12-02  132  		pud_clear(pud);
221e2e8bdbb851 liuyun      2023-12-02  133  	}
221e2e8bdbb851 liuyun      2023-12-02  134  	return 0;
221e2e8bdbb851 liuyun      2023-12-02  135  }
221e2e8bdbb851 liuyun      2023-12-02  136  
221e2e8bdbb851 liuyun      2023-12-02  137  static void __init efi_unmap_pgt(void)
221e2e8bdbb851 liuyun      2023-12-02  138  {
221e2e8bdbb851 liuyun      2023-12-02  139  	unsigned long node;
221e2e8bdbb851 liuyun      2023-12-02  140  	unsigned long start, end;
221e2e8bdbb851 liuyun      2023-12-02  141  	unsigned long start_pfn, end_pfn;
221e2e8bdbb851 liuyun      2023-12-02  142  
221e2e8bdbb851 liuyun      2023-12-02  143  	for_each_node_mask(node, node_possible_map) {
221e2e8bdbb851 liuyun      2023-12-02  144  		get_pfn_range_for_nid(node, &start_pfn, &end_pfn);
221e2e8bdbb851 liuyun      2023-12-02  145  		start = ALIGN_DOWN(start_pfn << PAGE_SHIFT, PMD_SIZE);
221e2e8bdbb851 liuyun      2023-12-02  146  		end = ALIGN(end_pfn << PAGE_SHIFT, PMD_SIZE);
221e2e8bdbb851 liuyun      2023-12-02  147  
221e2e8bdbb851 liuyun      2023-12-02  148  		/* Free pagetable memory */
221e2e8bdbb851 liuyun      2023-12-02  149  		efimap_free_pgt(start, end);
221e2e8bdbb851 liuyun      2023-12-02  150  	}
221e2e8bdbb851 liuyun      2023-12-02  151  
221e2e8bdbb851 liuyun      2023-12-02  152  	memblock_free(pgd_efi, PAGE_SIZE);
221e2e8bdbb851 liuyun      2023-12-02  153  	csr_write64((long)invalid_pg_dir, LOONGARCH_CSR_PGDL);
221e2e8bdbb851 liuyun      2023-12-02  154  	local_flush_tlb_all();
221e2e8bdbb851 liuyun      2023-12-02  155  }
221e2e8bdbb851 liuyun      2023-12-02  156  
221e2e8bdbb851 liuyun      2023-12-02  157  /*
221e2e8bdbb851 liuyun      2023-12-02  158   * set_virtual_map() - create a virtual mapping for the EFI memory map and call
221e2e8bdbb851 liuyun      2023-12-02  159   * efi_set_virtual_address_map enter virtual for runtime service
221e2e8bdbb851 liuyun      2023-12-02  160   *
221e2e8bdbb851 liuyun      2023-12-02  161   * This function populates the virt_addr fields of all memory region descriptors
221e2e8bdbb851 liuyun      2023-12-02  162   * in @memory_map whose EFI_MEMORY_RUNTIME attribute is set. Those descriptors
221e2e8bdbb851 liuyun      2023-12-02  163   * are also copied to @runtime_map, and their total count is returned in @count.
221e2e8bdbb851 liuyun      2023-12-02  164   */
221e2e8bdbb851 liuyun      2023-12-02  165  static int __init set_virtual_map(void)
221e2e8bdbb851 liuyun      2023-12-02  166  {
221e2e8bdbb851 liuyun      2023-12-02  167  	efi_status_t status;
221e2e8bdbb851 liuyun      2023-12-02  168  	int count = 0;
221e2e8bdbb851 liuyun      2023-12-02  169  	unsigned int size;
221e2e8bdbb851 liuyun      2023-12-02  170  	unsigned long attr;
221e2e8bdbb851 liuyun      2023-12-02  171  	efi_runtime_services_t *rt;
221e2e8bdbb851 liuyun      2023-12-02  172  	efi_set_virtual_address_map_t *svam;
221e2e8bdbb851 liuyun      2023-12-02  173  	efi_memory_desc_t *in, runtime_map[32];
221e2e8bdbb851 liuyun      2023-12-02  174  
221e2e8bdbb851 liuyun      2023-12-02  175  	size = sizeof(efi_memory_desc_t);
221e2e8bdbb851 liuyun      2023-12-02  176  
221e2e8bdbb851 liuyun      2023-12-02  177  	for_each_efi_memory_desc(in) {
221e2e8bdbb851 liuyun      2023-12-02  178  		attr = in->attribute;
221e2e8bdbb851 liuyun      2023-12-02  179  		if (!(attr & EFI_MEMORY_RUNTIME))
221e2e8bdbb851 liuyun      2023-12-02  180  			continue;
221e2e8bdbb851 liuyun      2023-12-02  181  
221e2e8bdbb851 liuyun      2023-12-02  182  		if (attr & (EFI_MEMORY_WB | EFI_MEMORY_WT))
221e2e8bdbb851 liuyun      2023-12-02  183  			in->virt_addr = TO_CACHE(in->phys_addr);
221e2e8bdbb851 liuyun      2023-12-02  184  		else
221e2e8bdbb851 liuyun      2023-12-02  185  			in->virt_addr = TO_UNCACHE(in->phys_addr);
221e2e8bdbb851 liuyun      2023-12-02  186  
221e2e8bdbb851 liuyun      2023-12-02  187  		memcpy(&runtime_map[count++], in, size);
221e2e8bdbb851 liuyun      2023-12-02  188  	}
221e2e8bdbb851 liuyun      2023-12-02  189  
221e2e8bdbb851 liuyun      2023-12-02  190  	rt = early_memremap_ro((unsigned long)efi_systab->runtime, sizeof(*rt));
221e2e8bdbb851 liuyun      2023-12-02  191  
221e2e8bdbb851 liuyun      2023-12-02  192  	/* Install the new virtual address map */
221e2e8bdbb851 liuyun      2023-12-02  193  	svam = rt->set_virtual_address_map;
221e2e8bdbb851 liuyun      2023-12-02  194  
221e2e8bdbb851 liuyun      2023-12-02  195  	efi_map_pgt();
221e2e8bdbb851 liuyun      2023-12-02  196  
221e2e8bdbb851 liuyun      2023-12-02  197  	status = svam(size * count, size, efi.memmap.desc_version,
221e2e8bdbb851 liuyun      2023-12-02  198  			(efi_memory_desc_t *)TO_PHYS((unsigned long)runtime_map));
221e2e8bdbb851 liuyun      2023-12-02  199  
221e2e8bdbb851 liuyun      2023-12-02  200  	efi_unmap_pgt();
221e2e8bdbb851 liuyun      2023-12-02  201  	if (status != EFI_SUCCESS)
221e2e8bdbb851 liuyun      2023-12-02  202  		return -1;
221e2e8bdbb851 liuyun      2023-12-02  203  
221e2e8bdbb851 liuyun      2023-12-02  204  	return 0;
221e2e8bdbb851 liuyun      2023-12-02  205  }
221e2e8bdbb851 liuyun      2023-12-02  206  
628c3bb40e9a8c Huacai Chen 2022-05-31  207  void __init efi_runtime_init(void)
628c3bb40e9a8c Huacai Chen 2022-05-31  208  {
221e2e8bdbb851 liuyun      2023-12-02  209  	efi_status_t status;
221e2e8bdbb851 liuyun      2023-12-02  210  
88d4d957edc707 Binbin Zhou 2022-12-10  211  	if (!efi_enabled(EFI_BOOT) || !efi_systab->runtime)
628c3bb40e9a8c Huacai Chen 2022-05-31  212  		return;
628c3bb40e9a8c Huacai Chen 2022-05-31  213  
628c3bb40e9a8c Huacai Chen 2022-05-31  214  	if (efi_runtime_disabled()) {
628c3bb40e9a8c Huacai Chen 2022-05-31  215  		pr_info("EFI runtime services will be disabled.\n");
628c3bb40e9a8c Huacai Chen 2022-05-31  216  		return;
628c3bb40e9a8c Huacai Chen 2022-05-31  217  	}
628c3bb40e9a8c Huacai Chen 2022-05-31  218  
221e2e8bdbb851 liuyun      2023-12-02  219  	status = set_virtual_map();
221e2e8bdbb851 liuyun      2023-12-02 @220  	if (status < 0)
221e2e8bdbb851 liuyun      2023-12-02  221  		return;
221e2e8bdbb851 liuyun      2023-12-02  222  
221e2e8bdbb851 liuyun      2023-12-02  223  	efi.runtime = READ_ONCE(efi_systab->runtime);
628c3bb40e9a8c Huacai Chen 2022-05-31  224  	efi.runtime_version = (unsigned int)efi.runtime->hdr.revision;
628c3bb40e9a8c Huacai Chen 2022-05-31  225  
628c3bb40e9a8c Huacai Chen 2022-05-31  226  	efi_native_runtime_setup();
628c3bb40e9a8c Huacai Chen 2022-05-31  227  	set_bit(EFI_RUNTIME_SERVICES, &efi.flags);
628c3bb40e9a8c Huacai Chen 2022-05-31  228  }
628c3bb40e9a8c Huacai Chen 2022-05-31  229  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
