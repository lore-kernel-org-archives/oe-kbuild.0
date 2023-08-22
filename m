Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5E1EA8
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Aug 2023 08:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692691663; x=1724227663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/G1W707QjJTKtQ+QI7ogTgBihBUsDHFjbE9bz97t9h4=;
  b=AaayoVnlDzYEpHv6hq7RhIaSP9bBpvj3G8fn3CRru2LeYuZxG9kTB7qC
   qf+K159RFsKAYcOwBsHpw+RAcNzQCzdU9XV/f8jWq3YXc1BAYPPC7VQ5B
   MA4/2QQCV+4atHqVbMmV6v9Wi7nxuDOKaHturjtOcQCUKfLScmppF971l
   uR+Mu92qU13dTkGYtTSYj7I2NCQVi5a2Li7JSSq2KsyVAsS9eFmgapZ3v
   RIZ4Rh6p1TI3BrmnvD3m0hkameS+AdYHAuxodP7dW2+UniC7keKU6BLyL
   fhR0PHMcRInGYn0fKBIQIfQyBda/MTwswlYJ5JrCb/ZqkTn+Zq+gCBPMh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="371241360"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="371241360"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 01:07:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="685950598"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="685950598"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 22 Aug 2023 01:07:40 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYMQD-0001Xk-0p;
	Tue, 22 Aug 2023 08:07:31 +0000
Date: Tue, 22 Aug 2023 16:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/libstub/unaccepted_memory.c:73
 allocate_unaccepted_bitmap() error: we previously assumed 'unaccepted_table'
 could be null (see line 19)
Message-ID: <202308221650.5RbCjJYK-lkp@intel.com>
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
TO: Tom Lendacky <thomas.lendacky@amd.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f7757129e3dea336c407551c98f50057c22bb266
commit: 6c3211796326a9d35618b866826ca556c8f008a8 x86/sev: Add SNP-specific unaccepted memory support
date:   3 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20230822 (https://download.01.org/0day-ci/archive/20230822/202308221650.5RbCjJYK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221650.5RbCjJYK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308221650.5RbCjJYK-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/unaccepted_memory.c:73 allocate_unaccepted_bitmap() error: we previously assumed 'unaccepted_table' could be null (see line 19)

vim +/unaccepted_table +73 drivers/firmware/efi/libstub/unaccepted_memory.c

745e3ed85f71a6 Kirill A. Shutemov 2023-06-06   8  
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06   9  efi_status_t allocate_unaccepted_bitmap(__u32 nr_desc,
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  10  					struct efi_boot_memmap *map)
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  11  {
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  12  	efi_guid_t unaccepted_table_guid = LINUX_EFI_UNACCEPTED_MEM_TABLE_GUID;
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  13  	u64 unaccepted_start = ULLONG_MAX, unaccepted_end = 0, bitmap_size;
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  14  	efi_status_t status;
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  15  	int i;
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  16  
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  17  	/* Check if the table is already installed */
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  18  	unaccepted_table = get_efi_config_table(unaccepted_table_guid);
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06 @19  	if (unaccepted_table) {
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  20  		if (unaccepted_table->version != 1) {
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  21  			efi_err("Unknown version of unaccepted memory table\n");
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  22  			return EFI_UNSUPPORTED;
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  23  		}
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  24  		return EFI_SUCCESS;
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  25  	}
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  26  
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  27  	/* Check if there's any unaccepted memory and find the max address */
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  28  	for (i = 0; i < nr_desc; i++) {
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  29  		efi_memory_desc_t *d;
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  30  		unsigned long m = (unsigned long)map->map;
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  31  
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  32  		d = efi_early_memdesc_ptr(m, map->desc_size, i);
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  33  		if (d->type != EFI_UNACCEPTED_MEMORY)
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  34  			continue;
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  35  
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  36  		unaccepted_start = min(unaccepted_start, d->phys_addr);
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  37  		unaccepted_end = max(unaccepted_end,
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  38  				     d->phys_addr + d->num_pages * PAGE_SIZE);
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  39  	}
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  40  
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  41  	if (unaccepted_start == ULLONG_MAX)
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  42  		return EFI_SUCCESS;
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  43  
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  44  	unaccepted_start = round_down(unaccepted_start,
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  45  				      EFI_UNACCEPTED_UNIT_SIZE);
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  46  	unaccepted_end = round_up(unaccepted_end, EFI_UNACCEPTED_UNIT_SIZE);
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  47  
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  48  	/*
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  49  	 * If unaccepted memory is present, allocate a bitmap to track what
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  50  	 * memory has to be accepted before access.
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  51  	 *
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  52  	 * One bit in the bitmap represents 2MiB in the address space:
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  53  	 * A 4k bitmap can track 64GiB of physical address space.
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  54  	 *
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  55  	 * In the worst case scenario -- a huge hole in the middle of the
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  56  	 * address space -- It needs 256MiB to handle 4PiB of the address
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  57  	 * space.
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  58  	 *
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  59  	 * The bitmap will be populated in setup_e820() according to the memory
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  60  	 * map after efi_exit_boot_services().
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  61  	 */
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  62  	bitmap_size = DIV_ROUND_UP(unaccepted_end - unaccepted_start,
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  63  				   EFI_UNACCEPTED_UNIT_SIZE * BITS_PER_BYTE);
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  64  
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  65  	status = efi_bs_call(allocate_pool, EFI_LOADER_DATA,
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  66  			     sizeof(*unaccepted_table) + bitmap_size,
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  67  			     (void **)&unaccepted_table);
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  68  	if (status != EFI_SUCCESS) {
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  69  		efi_err("Failed to allocate unaccepted memory config table\n");
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  70  		return status;
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  71  	}
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  72  
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06 @73  	unaccepted_table->version = 1;
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  74  	unaccepted_table->unit_size = EFI_UNACCEPTED_UNIT_SIZE;
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  75  	unaccepted_table->phys_base = unaccepted_start;
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  76  	unaccepted_table->size = bitmap_size;
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  77  	memset(unaccepted_table->bitmap, 0, bitmap_size);
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  78  
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  79  	status = efi_bs_call(install_configuration_table,
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  80  			     &unaccepted_table_guid, unaccepted_table);
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  81  	if (status != EFI_SUCCESS) {
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  82  		efi_bs_call(free_pool, unaccepted_table);
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  83  		efi_err("Failed to install unaccepted memory config table!\n");
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  84  	}
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  85  
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  86  	return status;
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  87  }
745e3ed85f71a6 Kirill A. Shutemov 2023-06-06  88  

:::::: The code at line 73 was first introduced by commit
:::::: 745e3ed85f71a6382a239b03d9278a8025f2beae efi/libstub: Implement support for unaccepted memory

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
