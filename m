Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DA72FE08
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 16:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LuseYaXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701362990; x=1732898990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oEK9qFzbj/g7lOksGK3l7NXIk4/DNp8oRHyG9qbPuUo=;
  b=LuseYaXsuI+HtywBAc49UC+zsSnHDpTf/qmq3dxBzDHHuo3B4wl7RTel
   ZBxot5ON94faRKIxkjVActicjpbw8cYZTAvLdohFCXHtIJD24oztQqXYK
   o4ckp5SQJqQG0PABFo4LaBhUCu21h19L8HHwpAaGiU3cQ3QE4/pVL3cAx
   Cd2Z/4mx4IF5PoBASfDpYz4ZNbmUQWnEGAPBeozA+ufbg3LoLdqdpEU+J
   TSUS4lMUedlAvOUof1cfZoz1GpLrwAfHgv+Zf3WuCIeR5hUMFwU1uvOUn
   DueJQ2YAo5mFGJnHcv9cIM/P7/0Bgy/yddNlUagOxu2lHtC0+fR6MDAnL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="459846247"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="459846247"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 08:49:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="762790790"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="762790790"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Nov 2023 08:49:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8kET-0002Om-2V;
	Thu, 30 Nov 2023 16:49:45 +0000
Date: Fri, 1 Dec 2023 00:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/firmware/efi/libstub/loongarch.c:73:9: sparse: sparse: cast
 from unknown type
Message-ID: <202312010049.MAGz1ska-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/firmware/efi/libstub/loongarch.c:73:9: sparse: sparse: cast from unknown type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: WANG Xuerui <git@xen0n.name>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: 53a4858ccd0d27538f9ab1ac2bead002fca97edc LoongArch: Make the CPUCFG&CSR ops simple aliases of compiler built-ins
date:   5 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r025-20230627 (https://download.01.org/0day-ci/archive/20231201/202312010049.MAGz1ska-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010049.MAGz1ska-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312010049.MAGz1ska-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firmware/efi/libstub/loongarch.c:73:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
>> drivers/firmware/efi/libstub/loongarch.c:73:9: sparse: sparse: cast from unknown type
   drivers/firmware/efi/libstub/loongarch.c:74:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   drivers/firmware/efi/libstub/loongarch.c:74:9: sparse: sparse: cast from unknown type

vim +73 drivers/firmware/efi/libstub/loongarch.c

d729b554e17904 Ard Biesheuvel 2022-10-13  44  
d729b554e17904 Ard Biesheuvel 2022-10-13  45  efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
d729b554e17904 Ard Biesheuvel 2022-10-13  46  			     unsigned long kernel_addr, char *cmdline_ptr)
d729b554e17904 Ard Biesheuvel 2022-10-13  47  {
d729b554e17904 Ard Biesheuvel 2022-10-13  48  	kernel_entry_t real_kernel_entry;
d729b554e17904 Ard Biesheuvel 2022-10-13  49  	struct exit_boot_struct priv;
d729b554e17904 Ard Biesheuvel 2022-10-13  50  	unsigned long desc_size;
d729b554e17904 Ard Biesheuvel 2022-10-13  51  	efi_status_t status;
d729b554e17904 Ard Biesheuvel 2022-10-13  52  	u32 desc_ver;
d729b554e17904 Ard Biesheuvel 2022-10-13  53  
d729b554e17904 Ard Biesheuvel 2022-10-13  54  	status = efi_alloc_virtmap(&priv.runtime_map, &desc_size, &desc_ver);
d729b554e17904 Ard Biesheuvel 2022-10-13  55  	if (status != EFI_SUCCESS) {
d729b554e17904 Ard Biesheuvel 2022-10-13  56  		efi_err("Unable to retrieve UEFI memory map.\n");
d729b554e17904 Ard Biesheuvel 2022-10-13  57  		return status;
d729b554e17904 Ard Biesheuvel 2022-10-13  58  	}
d729b554e17904 Ard Biesheuvel 2022-10-13  59  
d729b554e17904 Ard Biesheuvel 2022-10-13  60  	efi_info("Exiting boot services\n");
d729b554e17904 Ard Biesheuvel 2022-10-13  61  
d729b554e17904 Ard Biesheuvel 2022-10-13  62  	efi_novamap = false;
d729b554e17904 Ard Biesheuvel 2022-10-13  63  	status = efi_exit_boot_services(handle, &priv, exit_boot_func);
d729b554e17904 Ard Biesheuvel 2022-10-13  64  	if (status != EFI_SUCCESS)
d729b554e17904 Ard Biesheuvel 2022-10-13  65  		return status;
d729b554e17904 Ard Biesheuvel 2022-10-13  66  
d729b554e17904 Ard Biesheuvel 2022-10-13  67  	/* Install the new virtual address map */
d729b554e17904 Ard Biesheuvel 2022-10-13  68  	efi_rt_call(set_virtual_address_map,
d729b554e17904 Ard Biesheuvel 2022-10-13  69  		    priv.runtime_entry_count * desc_size, desc_size,
d729b554e17904 Ard Biesheuvel 2022-10-13  70  		    desc_ver, priv.runtime_map);
d729b554e17904 Ard Biesheuvel 2022-10-13  71  
d729b554e17904 Ard Biesheuvel 2022-10-13  72  	/* Config Direct Mapping */
d729b554e17904 Ard Biesheuvel 2022-10-13 @73  	csr_write64(CSR_DMW0_INIT, LOONGARCH_CSR_DMWIN0);

:::::: The code at line 73 was first introduced by commit
:::::: d729b554e17904e16498ab5c36122d70406f70ae efi/loongarch: libstub: Split off kernel image relocation for builtin stub

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
