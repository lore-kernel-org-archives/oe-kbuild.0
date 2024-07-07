Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7CAA55
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jul 2024 00:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720312228; cv=none; b=Z84UIUykEKCwGCIZXKZ83ZyuOPtOOPLmhbuUea6NmUBQX1cFNhDO72JkNXG8AO0uEQGL58M8siKXSoiWUD2iGozI2+gQ/b0XA+HC5otB1verCGr8dlKwL1qkFG93sLemWYP11nkMyDCiNTPrr8xLUByhYJ+1tJT4hs4cw7x1S5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720312228; c=relaxed/simple;
	bh=RjSF9NSguymYI9UvAIsC8bZr6ffb7PyB7FpWUzVxPM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jgg7//21pPtfYE+vn49/UCCDAWGSV9MIp9/CabNsfBvYCYSaPVbHvx5rU7yTbU6Reb4Grl88SuA8KJqkHRFNJdsuKoG8c/qDWp3lSz/zO2d59IKGweXf6yhQtJugFSYrb5iD7svMIOlW8bcK2VoIVyDNVMSdIsEZqTpHqcubHVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcdoL+Uj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcdoL+Uj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720312226; x=1751848226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RjSF9NSguymYI9UvAIsC8bZr6ffb7PyB7FpWUzVxPM0=;
  b=gcdoL+UjvZYwnQ3b9Ru7iZuHpioCnvtPJ4kjBjZAoUp8acckfoHs48s/
   3JX7dobR9aBnr83tRMjkXLJNIDG9+LvlYtI/SG3oHLeQXApsaZo/O/6mo
   g9BrTJ12yYnnyCEUL8WIVjiNbHjKvGvmAn8J84c4gSl8kB7JzpYmtmgYK
   k9dFHjjTk0Rv7+wRklLTn5f/ktC6trmi/QPiFy7M1VPEcc0wKx0fHfkvR
   VxxPr0GIP8FsKgr9IiL78cMpWSmVdsGuDqNYS/qhl+Xy8Jy57RFY/wtuT
   AKCd0A0tRVoyJMWK54bsgrnbUE1ValmHDJztcwgSZgKkxIAKw932bz24A
   g==;
X-CSE-ConnectionGUID: Gm5t8yWcQZuxR4CwwsDgNw==
X-CSE-MsgGUID: 7gfYVPnmS1GYXQBBgFvfUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17654451"
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="17654451"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 17:30:26 -0700
X-CSE-ConnectionGUID: LaIJnk4jTtKDFjurY1CWPg==
X-CSE-MsgGUID: 1ipJO9HtQ82ohl64cUNh/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="51591191"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jul 2024 17:30:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQFnK-000UR6-1H;
	Sun, 07 Jul 2024 00:30:22 +0000
Date: Sun, 7 Jul 2024 08:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [efi:next 3/6] drivers/firmware/efi/libstub/smbios.c:45
 efi_get_smbios_record() error: uninitialized symbol 'smbios'.
Message-ID: <202407070813.G9K0kZc6-lkp@intel.com>
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
CC: linux-efi@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Lukas Wunner <lukas@wunner.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
head:   f06ecac98e56e2d6c8cb04da732dc6709f7e3fef
commit: 84810a21ecab70568586217f185998bcf34b450e [3/6] x86/efistub: Enable SMBIOS protocol handling for x86
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20240707 (https://download.01.org/0day-ci/archive/20240707/202407070813.G9K0kZc6-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407070813.G9K0kZc6-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/smbios.c:45 efi_get_smbios_record() error: uninitialized symbol 'smbios'.

vim +/smbios +45 drivers/firmware/efi/libstub/smbios.c

550b33cfd44529 Ard Biesheuvel 2022-11-10  35  
eb684408f3ea48 Ard Biesheuvel 2023-02-28  36  const struct efi_smbios_record *efi_get_smbios_record(u8 type)
550b33cfd44529 Ard Biesheuvel 2022-11-10  37  {
550b33cfd44529 Ard Biesheuvel 2022-11-10  38  	struct efi_smbios_record *record;
550b33cfd44529 Ard Biesheuvel 2022-11-10  39  	efi_smbios_protocol_t *smbios;
550b33cfd44529 Ard Biesheuvel 2022-11-10  40  	efi_status_t status;
550b33cfd44529 Ard Biesheuvel 2022-11-10  41  	u16 handle = 0xfffe;
550b33cfd44529 Ard Biesheuvel 2022-11-10  42  
550b33cfd44529 Ard Biesheuvel 2022-11-10  43  	status = efi_bs_call(locate_protocol, &EFI_SMBIOS_PROTOCOL_GUID, NULL,
550b33cfd44529 Ard Biesheuvel 2022-11-10  44  			     (void **)&smbios) ?:
550b33cfd44529 Ard Biesheuvel 2022-11-10 @45  		 efi_call_proto(smbios, get_next, &handle, &type, &record, NULL);
550b33cfd44529 Ard Biesheuvel 2022-11-10  46  	if (status != EFI_SUCCESS)
550b33cfd44529 Ard Biesheuvel 2022-11-10  47  		return NULL;
eb684408f3ea48 Ard Biesheuvel 2023-02-28  48  	return record;
eb684408f3ea48 Ard Biesheuvel 2023-02-28  49  }
eb684408f3ea48 Ard Biesheuvel 2023-02-28  50  

:::::: The code at line 45 was first introduced by commit
:::::: 550b33cfd445296868a478e8413ffb2e963eed32 arm64: efi: Force the use of SetVirtualAddressMap() on Altra machines

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
