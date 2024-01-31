Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A6286AC5
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706715202; cv=none; b=KeKEcbE3LWOjzuP8y6eof2hnUdP2MkYFoY+mQTd3gLTV06nT8UR4A7lrvghc5K3Afhu9LZw4whk6RQ8sdMvC1Qwm+AyNoDKuXasMzxJU8JkkUg0WKeg8KiND5TMkQ6sKqZyBQ+vDeB2GM+HfNaLtjJm8Ccye8+nFMA1ED+asGcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706715202; c=relaxed/simple;
	bh=VkGfooVikdk8ryMIxmHvDizb+o7RiIKhwBXKFiLvKgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kYh/I/ZngxFEcPlSUwZhMLhlOvjRck5DPrb5R7Gm04g1JcnyxdgdaQUgWQRcq0lBvgBg84oOayhzIXYfGhjsAvSn4fzNNdYBNBTEDBf1I1VqSfvKK04Hnu0UhfZnvPFcZQ+RFI3lBClcvGEj5nCi2iDyZoWt8afnxYzfjXpOimo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFP+5hw7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFP+5hw7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706715200; x=1738251200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VkGfooVikdk8ryMIxmHvDizb+o7RiIKhwBXKFiLvKgw=;
  b=QFP+5hw76uE6jk+uLDnmGaa++UzlHdCxDMU1WpMYy/HgHG4dtRnbff1e
   Ga0RhJtsmXj2SdOOU3prbthEH4RDOtPKeTuhUc1u0HxZypQqENO2FoEKM
   F5AbQaM9fd75hd4cBZS5U9Pm+2d3VoDDFmXn5spL3phdYsL1hS/GOlGc1
   pHipbUV6LguFjlfGDzWJSjrYziVtA0GxF7xVw9XsVOzbPKKJWOxUwZsEU
   pS6TbYTyYzkjemWRenU9NYyAEFv9720s0IB7uCQNI/D5JK8+m0ysapIni
   vvokUz9fpj+VsuiMX+s3/cjssMVU7ndbqn8cPgg2TKIv7Bzftl85B3uY0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10384214"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10384214"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 07:33:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="36892085"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 31 Jan 2024 07:33:16 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVCaO-0001g4-2o;
	Wed, 31 Jan 2024 15:33:12 +0000
Date: Wed, 31 Jan 2024 23:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:OLK-6.6 776/2894] arch/loongarch/kernel/efi.c:113:28-32:
 ERROR: iterator variable bound on line 103 cannot be NULL
Message-ID: <202401312328.F3LwWBI7-lkp@intel.com>
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
TO: Hongchen Zhang <zhanghongchen@loongson.cn>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f6f9abf1a5ef2fc559630c77b3570346dcd19d40
commit: 221e2e8bdbb851a519df0bac5a44298dae2b4612 [776/2894] LoongArch: add kernel setvirtmap for runtime
:::::: branch date: 6 hours ago
:::::: commit date: 9 weeks ago
config: loongarch-randconfig-r051-20240131 (https://download.01.org/0day-ci/archive/20240131/202401312328.F3LwWBI7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401312328.F3LwWBI7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/efi.c:113:28-32: ERROR: iterator variable bound on line 103 cannot be NULL
--
>> arch/loongarch/kernel/efi.c:220:5-11: WARNING: Unsigned expression compared with zero: status     <     0

vim +113 arch/loongarch/kernel/efi.c

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
221e2e8bdbb851 liuyun      2023-12-02   98  	csr_write64((long)pgd_efi, LOONGARCH_CSR_PGDL);
221e2e8bdbb851 liuyun      2023-12-02   99  
221e2e8bdbb851 liuyun      2023-12-02  100  	/* Low Memory, Cached */
221e2e8bdbb851 liuyun      2023-12-02  101  	efimap_populate_hugepages(0, SZ_256M, PAGE_KERNEL);
221e2e8bdbb851 liuyun      2023-12-02  102  
221e2e8bdbb851 liuyun      2023-12-02 @103  	for_each_node_mask(node, node_possible_map) {
221e2e8bdbb851 liuyun      2023-12-02  104  		/* MMIO Registers, Uncached */
221e2e8bdbb851 liuyun      2023-12-02  105  		efimap_populate_hugepages(SZ_256M | (node << 44),
221e2e8bdbb851 liuyun      2023-12-02  106  				SZ_512M | (node << 44), PAGE_KERNEL_SUC);
221e2e8bdbb851 liuyun      2023-12-02  107  
221e2e8bdbb851 liuyun      2023-12-02  108  		get_pfn_range_for_nid(node, &start_pfn, &end_pfn);
221e2e8bdbb851 liuyun      2023-12-02  109  		start = ALIGN_DOWN(start_pfn << PAGE_SHIFT, PMD_SIZE);
221e2e8bdbb851 liuyun      2023-12-02  110  		end = ALIGN(end_pfn << PAGE_SHIFT, PMD_SIZE);
221e2e8bdbb851 liuyun      2023-12-02  111  
221e2e8bdbb851 liuyun      2023-12-02  112  		/* System memory, Cached */
221e2e8bdbb851 liuyun      2023-12-02 @113  		efimap_populate_hugepages(node ? start : SZ_512M, end, PAGE_KERNEL);
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
