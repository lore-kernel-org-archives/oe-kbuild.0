Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B0F2FF646
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 17:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765820288; cv=none; b=hyD3pVuumKC84UXdsz0pAsSMFLU+R0/dSiUatDI0glGndQCwK/PQ5pmTQ2wDzBzIiaWiX/QskLO6UfCNTCYeigBE7EwI8bS9gm2mTlQZ1kPXH81Sw74XGhYL9J4z+6cImVF8TS+9AKRfT+pQj3wJ7fI2RlTHKUdUzA1zXDt9oHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765820288; c=relaxed/simple;
	bh=j9vGQnNuIJvn8Wqq2x3e4R38XfkB+eWOfyKZWErQvzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A+R5ktNIgkcymX/UuiIMcMqbnfFyEWAmDJUUtStdNNY2QOvg0v4uHdj2RzFrGfVpR99+Y8HqXNIHSlMmwMQm2TnSI8gkYVhnjndDtetDVT1mYq+Xilg2qmbawCpFk7cdjmsITPC9zZdYaOEt3xV2QWYFNjKpEuQGdp/XVjlV/8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkuvzUTw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkuvzUTw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765820286; x=1797356286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j9vGQnNuIJvn8Wqq2x3e4R38XfkB+eWOfyKZWErQvzE=;
  b=VkuvzUTw3FlXyJxzgYUKcP+sRLiSTdGxf+jb3fYw0yaT1B5a9s72/Orj
   fWqSd+bZGf22nQADtVirZYp7ZAYxhBDE8NrytJyjZCCU4EShTPhtulHGB
   8lYaakkAlE2cIxFfgo1FFhbonhhShXheQunpP2TwdY7LOpqNZzMH/1bIt
   omO4a+oheDWkIIOrIQk+BgzKpu8AZEG38xL8GWNGYRsYa182NqCL7v37T
   Cs/JO2bKEqY8SO2xlT8GapErN/uCy20tQbO1lec0410ZUP30Bp7ULZCs0
   oTrY9UAH1j8/LOKuzpTuvycIGHyGapVxkwPu+Cw+gFaQCCDnE++gndCSD
   A==;
X-CSE-ConnectionGUID: qDTO/dVXQ0uF58grEzOutA==
X-CSE-MsgGUID: P6CquB7AQQiUk15huqNzZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67798594"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67798594"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 09:38:06 -0800
X-CSE-ConnectionGUID: BfweY6T2TSudpTSSu8jxBQ==
X-CSE-MsgGUID: 8pRIxcYhQPGNb1WBE5vHLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197679310"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Dec 2025 09:38:05 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVCWI-000000000Z5-2Nuv;
	Mon, 15 Dec 2025 17:38:02 +0000
Date: Tue, 16 Dec 2025 01:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/libstub/pci.c:32
 efi_pci_disable_bridge_busmaster() error: uninitialized symbol
 'pci_handle_num'.
Message-ID: <202512160155.rnwlrH8P-lkp@intel.com>
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
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 90534e689d2e52202c276ade5cf1dfc13d9e116f efi/libstub: Simplify PCI I/O handle buffer traversal
date:   11 months ago
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20251215 (https://download.01.org/0day-ci/archive/20251216/202512160155.rnwlrH8P-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160155.rnwlrH8P-lkp@intel.com/

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

vim +/pci_handle_num +32 drivers/firmware/efi/libstub/pci.c

4444f8541dad16 Matthew Garrett 2020-01-03  15  
4444f8541dad16 Matthew Garrett 2020-01-03  16  void efi_pci_disable_bridge_busmaster(void)
4444f8541dad16 Matthew Garrett 2020-01-03  17  {
4444f8541dad16 Matthew Garrett 2020-01-03  18  	efi_guid_t pci_proto = EFI_PCI_IO_PROTOCOL_GUID;
90534e689d2e52 Ard Biesheuvel  2024-12-19  19  	efi_handle_t *pci_handle __free(efi_pool) = NULL;
90534e689d2e52 Ard Biesheuvel  2024-12-19  20  	unsigned long pci_handle_num;
4444f8541dad16 Matthew Garrett 2020-01-03  21  	efi_handle_t handle;
4444f8541dad16 Matthew Garrett 2020-01-03  22  	efi_status_t status;
4444f8541dad16 Matthew Garrett 2020-01-03  23  	u16 class, command;
4444f8541dad16 Matthew Garrett 2020-01-03  24  
90534e689d2e52 Ard Biesheuvel  2024-12-19  25  	status = efi_bs_call(locate_handle_buffer, EFI_LOCATE_BY_PROTOCOL,
90534e689d2e52 Ard Biesheuvel  2024-12-19  26  			     &pci_proto, NULL, &pci_handle_num, &pci_handle);
4444f8541dad16 Matthew Garrett 2020-01-03  27  	if (status != EFI_SUCCESS) {
90534e689d2e52 Ard Biesheuvel  2024-12-19  28  		efi_err("Failed to locate PCI I/O handles\n");
4444f8541dad16 Matthew Garrett 2020-01-03  29  		return;
4444f8541dad16 Matthew Garrett 2020-01-03  30  	}
4444f8541dad16 Matthew Garrett 2020-01-03  31  
90534e689d2e52 Ard Biesheuvel  2024-12-19 @32  	for_each_efi_handle(handle, pci_handle, pci_handle_num) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
