Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2D779DA
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Mar 2023 16:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678291469; x=1709827469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e9naaf+3w165OTpOUrgy5Mp1aqCju1Beu/LLdJ+tu5Q=;
  b=ZnBENM23b79YfRF/DvDH/EO/Kd1FeSB/Cr3HGlF7CXWDX9kECNtdYq1a
   zbug3bMDqZA65vWzU591+iNsd0UWx/sbYYqbNm4T02YNuvioHS1orwDmc
   miFGG4qzmUvfiU8HlfDiVRpt/EYUnL71Cp8zplYGSmpIAhuHjemAT6v0g
   R7NYIMmZZ9cP7zVqIy1RnFVWTwhDmqI7AKJR+paJv5Pu8kBBERJr1DpKb
   ZHUs/EDYfRMkQNGlwYfMAUVl7NYiQnHafw5aosfZUkNR4MdK0wuSo/pqm
   1ghfvqKT1e9T5cEbkOrQUOU/T+prap2dniZ7UjatSdD2OoQGSwzK9kTuB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398773074"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="398773074"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 08:03:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="745956186"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="745956186"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Mar 2023 08:03:50 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZwGb-0002F9-0X;
	Wed, 08 Mar 2023 16:03:49 +0000
Date: Thu, 9 Mar 2023 00:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ardb:efi-x86-nx 10/24] drivers/firmware/efi/libstub/mem.c:170
 efi_adjust_memory_range_protection() error: uninitialized symbol
 'rounded_start'.
Message-ID: <202303090050.RhPPJRPD-lkp@intel.com>
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
TO: Evgeniy Baskov <baskov@ispras.ru>
CC: Ard Biesheuvel <ardb@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-x86-nx
head:   8171142f3e4c96f6be75a6195de59d1607f1bd4b
commit: 6b4ae58e7147165ec019e3899a5d4d14e0396110 [10/24] efi/libstub: Move helper function to related file
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: loongarch-randconfig-m041-20230305 (https://download.01.org/0day-ci/archive/20230309/202303090050.RhPPJRPD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303090050.RhPPJRPD-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/mem.c:170 efi_adjust_memory_range_protection() error: uninitialized symbol 'rounded_start'.
drivers/firmware/efi/libstub/mem.c:170 efi_adjust_memory_range_protection() error: uninitialized symbol 'rounded_end'.

vim +/rounded_start +170 drivers/firmware/efi/libstub/mem.c

6b4ae58e714716 Evgeniy Baskov 2022-10-25  131  
6b4ae58e714716 Evgeniy Baskov 2022-10-25  132  /**
6b4ae58e714716 Evgeniy Baskov 2022-10-25  133   * efi_adjust_memory_range_protection() - change memory range protection attributes
6b4ae58e714716 Evgeniy Baskov 2022-10-25  134   * @start:	memory range start address
6b4ae58e714716 Evgeniy Baskov 2022-10-25  135   * @size:	memory range size
6b4ae58e714716 Evgeniy Baskov 2022-10-25  136   *
6b4ae58e714716 Evgeniy Baskov 2022-10-25  137   * Actual memory range for which memory attributes are modified is
6b4ae58e714716 Evgeniy Baskov 2022-10-25  138   * the smallest ranged with start address and size aligned to EFI_PAGE_SIZE
6b4ae58e714716 Evgeniy Baskov 2022-10-25  139   * that includes [start, start + size].
6b4ae58e714716 Evgeniy Baskov 2022-10-25  140   *
6b4ae58e714716 Evgeniy Baskov 2022-10-25  141   * @return: status code
6b4ae58e714716 Evgeniy Baskov 2022-10-25  142   */
6b4ae58e714716 Evgeniy Baskov 2022-10-25  143  efi_status_t efi_adjust_memory_range_protection(unsigned long start,
6b4ae58e714716 Evgeniy Baskov 2022-10-25  144  						unsigned long size,
6b4ae58e714716 Evgeniy Baskov 2022-10-25  145  						unsigned long attributes)
6b4ae58e714716 Evgeniy Baskov 2022-10-25  146  {
6b4ae58e714716 Evgeniy Baskov 2022-10-25  147  	efi_status_t status;
6b4ae58e714716 Evgeniy Baskov 2022-10-25  148  	efi_gcd_memory_space_desc_t desc;
6b4ae58e714716 Evgeniy Baskov 2022-10-25  149  	efi_physical_addr_t end, next;
6b4ae58e714716 Evgeniy Baskov 2022-10-25  150  	efi_physical_addr_t rounded_start, rounded_end;
6b4ae58e714716 Evgeniy Baskov 2022-10-25  151  	efi_physical_addr_t unprotect_start, unprotect_size;
6b4ae58e714716 Evgeniy Baskov 2022-10-25  152  
6b4ae58e714716 Evgeniy Baskov 2022-10-25  153  	if (efi_dxe_table == NULL)
6b4ae58e714716 Evgeniy Baskov 2022-10-25  154  		return EFI_UNSUPPORTED;
6b4ae58e714716 Evgeniy Baskov 2022-10-25  155  
6b4ae58e714716 Evgeniy Baskov 2022-10-25  156  	/*
6b4ae58e714716 Evgeniy Baskov 2022-10-25  157  	 * This function should not be used to modify attributes
6b4ae58e714716 Evgeniy Baskov 2022-10-25  158  	 * other than writable/executable.
6b4ae58e714716 Evgeniy Baskov 2022-10-25  159  	 */
6b4ae58e714716 Evgeniy Baskov 2022-10-25  160  
6b4ae58e714716 Evgeniy Baskov 2022-10-25  161  	if ((attributes & ~(EFI_MEMORY_RO | EFI_MEMORY_XP)) != 0)
6b4ae58e714716 Evgeniy Baskov 2022-10-25  162  		return EFI_INVALID_PARAMETER;
6b4ae58e714716 Evgeniy Baskov 2022-10-25  163  
6b4ae58e714716 Evgeniy Baskov 2022-10-25  164  	/*
6b4ae58e714716 Evgeniy Baskov 2022-10-25  165  	 * Disallow simultaniously executable and writable memory
6b4ae58e714716 Evgeniy Baskov 2022-10-25  166  	 * to inforce W^X policy if direct extraction code is enabled.
6b4ae58e714716 Evgeniy Baskov 2022-10-25  167  	 */
6b4ae58e714716 Evgeniy Baskov 2022-10-25  168  
6b4ae58e714716 Evgeniy Baskov 2022-10-25  169  	if ((attributes & (EFI_MEMORY_RO | EFI_MEMORY_XP)) == 0) {
6b4ae58e714716 Evgeniy Baskov 2022-10-25 @170  		efi_warn("W^X violation at [%08lx,%08lx]\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
