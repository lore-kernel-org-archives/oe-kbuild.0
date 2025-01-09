Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24FC217F22
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 12:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736427058; cv=none; b=gWqhKzcLiWaQptzwBkUYeo5d8wR23jFX5REtpiqvqciCEMc2mlSE07jr0Ue3Akl+Zhni6oDofURyb9RYa6MoA39QueKzhBBUfRIYbK7kE+utWCiHxS2uTBLgIZ9KF2dKqjQvi3mGZX2EYLL53PVcPvZbxDfAMM9yVW5WQvEmEOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736427058; c=relaxed/simple;
	bh=eYi0yjUOvwQ4ZnDOiOB/TnS06racpsIB80Qditmz5e0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oS5z0XThmsJVZ4IXF+QLHBOGaWc0kgIPMBuYqkNB2BG25fYCcHqsSZ+P3DsohK0ULT/tHHJ/ZWIRE4GpiSB+b1Vd7W/qGSDq/JMeBrLv/Zu+015JDqmFaWen1Flg9JrtwCQexb5zBX1qMNJ0FjIAHzKlOHxoWj6OwvEBp7oWYIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQjDOSZk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQjDOSZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736427057; x=1767963057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eYi0yjUOvwQ4ZnDOiOB/TnS06racpsIB80Qditmz5e0=;
  b=VQjDOSZkUKPBFSOvBhZAKo8GP1z54cU4rddvOioOqH+rBEYHgD8lysxr
   DymvISHQyg3KFuGGK9mwDA/D+fLTddM/tDqZ8vq+cX2cQZMWTLp+zyCJn
   TMkp1wrGTwtCH1f8JVitNP8QB4LgOH7vdISDIvGPbjz8t/iAKP0YfqwiA
   U2Z3IVmIxXdgbFJdnm1Axm0KhyC6IbtmJwtREJ2yFqppbAD8MTR3oRxys
   LTeecMLSZYNwwQjkLXS5vkhdCMKoZn/q+UePuv+dk99zWaZNxRTGLQQZ0
   qgABaowyCb7Y3awfkeixLuzwT1Cca0NY9IBq5h2sgFAH96xpIV0IOUG+l
   A==;
X-CSE-ConnectionGUID: nEcyF2KIR5O1artsL5eo7Q==
X-CSE-MsgGUID: LrjVcBrOTr+Wg4P+Nb3D1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36572126"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36572126"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:50:57 -0800
X-CSE-ConnectionGUID: tYCbgaH4R4GBPyTGCgBYFw==
X-CSE-MsgGUID: p/3C/SHnQBSGQUR/2ouGIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108500748"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Jan 2025 04:50:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVrzx-000HXN-0i;
	Thu, 09 Jan 2025 12:50:53 +0000
Date: Thu, 9 Jan 2025 20:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6420/6768] drivers/firmware/efi/libstub/pci.c:32
 efi_pci_disable_bridge_busmaster() error: uninitialized symbol
 'pci_handle_num'.
Message-ID: <202501092028.MyFbBJ4u-lkp@intel.com>
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
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
commit: 3c1aa99479b84acaa007d0173f369188ae15f742 [6420/6768] efi/libstub: Simplify PCI I/O handle buffer traversal
:::::: branch date: 7 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250109 (https://download.01.org/0day-ci/archive/20250109/202501092028.MyFbBJ4u-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501092028.MyFbBJ4u-lkp@intel.com/

New smatch warnings:
drivers/firmware/efi/libstub/pci.c:32 efi_pci_disable_bridge_busmaster() error: uninitialized symbol 'pci_handle_num'.
drivers/firmware/efi/libstub/x86-stub.c:138 setup_efi_pci() error: uninitialized symbol 'num'.

Old smatch warnings:
drivers/firmware/efi/libstub/pci.c:45 efi_pci_disable_bridge_busmaster() error: uninitialized symbol 'pci'.
drivers/firmware/efi/libstub/pci.c:47 efi_pci_disable_bridge_busmaster() error: uninitialized symbol 'bus_nr'.
drivers/firmware/efi/libstub/x86-stub.c:172 retrieve_apple_device_properties() error: uninitialized symbol 'p'.
drivers/firmware/efi/libstub/x86-stub.c:172 retrieve_apple_device_properties() error: uninitialized symbol 'p'.
drivers/firmware/efi/libstub/x86-stub.c:190 retrieve_apple_device_properties() error: uninitialized symbol 'new'.
drivers/firmware/efi/libstub/x86-stub.c:190 retrieve_apple_device_properties() error: uninitialized symbol 'new'.
drivers/firmware/efi/libstub/x86-stub.c:258 apple_set_os() error: uninitialized symbol 'set_os'.
drivers/firmware/efi/libstub/x86-stub.c:366 setup_unaccepted_memory() error: uninitialized symbol 'proto'.

vim +/pci_handle_num +32 drivers/firmware/efi/libstub/pci.c

4444f8541dad16f Matthew Garrett 2020-01-03  15  
4444f8541dad16f Matthew Garrett 2020-01-03  16  void efi_pci_disable_bridge_busmaster(void)
4444f8541dad16f Matthew Garrett 2020-01-03  17  {
4444f8541dad16f Matthew Garrett 2020-01-03  18  	efi_guid_t pci_proto = EFI_PCI_IO_PROTOCOL_GUID;
3c1aa99479b84ac Ard Biesheuvel  2024-12-19  19  	efi_handle_t *pci_handle __free(efi_pool) = NULL;
3c1aa99479b84ac Ard Biesheuvel  2024-12-19  20  	unsigned long pci_handle_num;
4444f8541dad16f Matthew Garrett 2020-01-03  21  	efi_handle_t handle;
4444f8541dad16f Matthew Garrett 2020-01-03  22  	efi_status_t status;
4444f8541dad16f Matthew Garrett 2020-01-03  23  	u16 class, command;
4444f8541dad16f Matthew Garrett 2020-01-03  24  
3c1aa99479b84ac Ard Biesheuvel  2024-12-19  25  	status = efi_bs_call(locate_handle_buffer, EFI_LOCATE_BY_PROTOCOL,
3c1aa99479b84ac Ard Biesheuvel  2024-12-19  26  			     &pci_proto, NULL, &pci_handle_num, &pci_handle);
4444f8541dad16f Matthew Garrett 2020-01-03  27  	if (status != EFI_SUCCESS) {
3c1aa99479b84ac Ard Biesheuvel  2024-12-19  28  		efi_err("Failed to locate PCI I/O handles\n");
4444f8541dad16f Matthew Garrett 2020-01-03  29  		return;
4444f8541dad16f Matthew Garrett 2020-01-03  30  	}
4444f8541dad16f Matthew Garrett 2020-01-03  31  
3c1aa99479b84ac Ard Biesheuvel  2024-12-19 @32  	for_each_efi_handle(handle, pci_handle, pci_handle_num) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
