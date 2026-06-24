Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71D8175A9B
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Jun 2026 02:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782267260; cv=none; b=Vq+ewZ6w4iBGedvyw5dUtljJQ6Cl78wIoBgGbMu+paYv43JiWmjUj7l2phcmIPiCJ9OhpIvVAuNgE8T+quICdQ0I2U11H2v25fRRkMzGzlBzAZ1MWp0ZWxaSS5Kq7A1/Nh7+Gn4z+bXVCOpH7qyAICsLBE511R5PUH/NHuLzvcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782267260; c=relaxed/simple;
	bh=GISEx7ursfkNLH2Sac7VJg5czmXcwKecwB8LLiHC4J0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qNdL3569IpZ1nmqRd78hLDGcz+Y5Vo6SGLipNx/H6P+dKXIAk13rjzzPWwJqtumCnDiCMyk8vpGATVwOS/T/KvtVkOY9pSuFuUHVtPMhaH+vI+3I6vYZofZPc81hV5nmpCh71yI5+9F4EbC1rS5HCmUaubuH8Werjgy8AfTHsW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7CSCAjm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7CSCAjm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782267257; x=1813803257;
  h=date:from:to:cc:subject:message-id;
  bh=GISEx7ursfkNLH2Sac7VJg5czmXcwKecwB8LLiHC4J0=;
  b=F7CSCAjmpyzurqCQ8fmy/iJ0gGpkTgu13suzizf7/94w5cyG85WT56Hd
   KWg826LCrRxjX9dCAzP0M9l+/57pW50MfuoEo48TpGAjEZwa7CpnWUGoB
   HUEEv8DQYAwGNSBBLtiBbhHVkPfxafsT8VDRyiinCQryARk/G+j0tgyG3
   Y87U/2gJaGNHJaU3by+Ny4OvIe1Ks7q+QczgofFHJC2hCOcfD90NrEqst
   rbomkBT0AdaeVN6a9tWIxRdb4vgHzCv9ANx1kvoMs3no+EeW2VuPlmBe7
   4KLG6D74U135ChYZa+o/4v4viJUEzQsMHWlFrR4Wg6q7JCuufWYoMH4s0
   Q==;
X-CSE-ConnectionGUID: ZIuUSySBTO+j55OHkpSiaQ==
X-CSE-MsgGUID: RS8wNCDbTRmtfGrt6Bi98Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94138376"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="94138376"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 19:14:11 -0700
X-CSE-ConnectionGUID: UwSbPcKLQIm8TghMNcj6LA==
X-CSE-MsgGUID: h/ooBZLhTr2f1eJZkcZeQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="287816023"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 23 Jun 2026 19:14:10 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcD7t-000000006Jx-48Ei;
	Wed, 24 Jun 2026 02:14:05 +0000
Date: Wed, 24 Jun 2026 04:14:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/boot/compressed/acpi.c:25:1: warning:
 '__efi_get_rsdp_addr' defined but not used
Message-ID: <202606240416.cXegPpiJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thorsten Blum <thorsten.blum@linux.dev>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Thorsten-Blum/x86-boot-compressed-Remove-unused-variables-in-EFI-helpers/20260622-190409
head:   0836935ce0e87c942b3f02ea8c134c1116593ebc
commit: 0836935ce0e87c942b3f02ea8c134c1116593ebc x86/boot/compressed: Enable -Wunused
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20260624/202606240416.cXegPpiJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240416.cXegPpiJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606240416.cXegPpiJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/boot/compressed/acpi.c:25:1: warning: '__efi_get_rsdp_addr' defined but not used [-Wunused-function]
      25 | __efi_get_rsdp_addr(unsigned long cfg_tbl_pa, unsigned int cfg_tbl_len)
         | ^~~~~~~~~~~~~~~~~~~


vim +/__efi_get_rsdp_addr +25 arch/x86/boot/compressed/acpi.c

02a3e3cdb7f12f Chao Fan       2019-01-23  23  
0a23ebc66a4678 Junichi Nomura 2019-04-11  24  static acpi_physical_address
dee602dd5d1489 Michael Roth   2022-02-24 @25  __efi_get_rsdp_addr(unsigned long cfg_tbl_pa, unsigned int cfg_tbl_len)
33f0df8d843deb Chao Fan       2019-01-23  26  {
33f0df8d843deb Chao Fan       2019-01-23  27  #ifdef CONFIG_EFI
dee602dd5d1489 Michael Roth   2022-02-24  28  	unsigned long rsdp_addr;
0a23ebc66a4678 Junichi Nomura 2019-04-11  29  
dee602dd5d1489 Michael Roth   2022-02-24  30  	/*
dee602dd5d1489 Michael Roth   2022-02-24  31  	 * Search EFI system tables for RSDP. Preferred is ACPI_20_TABLE_GUID to
dee602dd5d1489 Michael Roth   2022-02-24  32  	 * ACPI_TABLE_GUID because it has more features.
dee602dd5d1489 Michael Roth   2022-02-24  33  	 */
d55d5bc5d93774 Ard Biesheuvel 2023-10-17  34  	rsdp_addr = efi_find_vendor_table(boot_params_ptr, cfg_tbl_pa, cfg_tbl_len,
dee602dd5d1489 Michael Roth   2022-02-24  35  					  ACPI_20_TABLE_GUID);
dee602dd5d1489 Michael Roth   2022-02-24  36  	if (rsdp_addr)
dee602dd5d1489 Michael Roth   2022-02-24  37  		return (acpi_physical_address)rsdp_addr;
dee602dd5d1489 Michael Roth   2022-02-24  38  
dee602dd5d1489 Michael Roth   2022-02-24  39  	/* No ACPI_20_TABLE_GUID found, fallback to ACPI_TABLE_GUID. */
d55d5bc5d93774 Ard Biesheuvel 2023-10-17  40  	rsdp_addr = efi_find_vendor_table(boot_params_ptr, cfg_tbl_pa, cfg_tbl_len,
dee602dd5d1489 Michael Roth   2022-02-24  41  					  ACPI_TABLE_GUID);
dee602dd5d1489 Michael Roth   2022-02-24  42  	if (rsdp_addr)
dee602dd5d1489 Michael Roth   2022-02-24  43  		return (acpi_physical_address)rsdp_addr;
dee602dd5d1489 Michael Roth   2022-02-24  44  
dee602dd5d1489 Michael Roth   2022-02-24  45  	debug_putstr("Error getting RSDP address.\n");
0a23ebc66a4678 Junichi Nomura 2019-04-11  46  #endif
dee602dd5d1489 Michael Roth   2022-02-24  47  	return 0;
0a23ebc66a4678 Junichi Nomura 2019-04-11  48  }
0a23ebc66a4678 Junichi Nomura 2019-04-11  49  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
