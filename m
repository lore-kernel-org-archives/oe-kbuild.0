Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02D77EF
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jul 2024 01:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720315949; cv=none; b=EBqdGOHHN7BEH+XgAlw0jHyF5Lvpke2NtEn1Ch6+o/Zf8ZkipbIQ3ppak1ACX4HiKxXMClyPr5ItQgqd8YUEwaiGNP5cHnY2yYAza938zDjpW94RFmRw/zSIDKjTPlHnsQ9TueBJrZci1OhTl+L1OpeRhlj59H+PmxfiTcTNc7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720315949; c=relaxed/simple;
	bh=qvus7upGuHpviPGjLy+PenFEWZOZXrSPrMQLwtHaWuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z2reAhayTqcO05aEo2MT/R8grrjBjiInjDAPJGRV+rSPAbNCf5En4JTanyKS/3r1rrza+upulPhiZIjsL3aW8EtWKwDDTkXpnYBszTK+5czo7RlZyb+mCW0lW6oBIrH+5zNa2MsOPtVCLRgD7YxSkif4+4E0JQaPfVH/UFpEXcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6JCvczV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6JCvczV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720315948; x=1751851948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qvus7upGuHpviPGjLy+PenFEWZOZXrSPrMQLwtHaWuQ=;
  b=K6JCvczVnHrL6L0mpQ3iKWqAAjnVPp29gvWU1kDj/x5DFgnyu6wS3iHh
   FxGwM29q8S6nKOGM5JUGhfFqAuw1KexGGCDWo0PSxjFMLbXe2EBNVacLT
   kbPvYg8N5aorWoKV+ZyL/8obVOpUNio8Fmyi5SWh17gGmR1DOm3TAbPqu
   kRfS7dsIVcd+jybODaicYGYPHvQ6PYdcZc6ryJ1NKfnxzKZQotQF6YcuE
   /vVAoebJxi3kPg3nBHXs2afeO8MdFvKcKnY8v9UqJRKb485GbIsDUGMiY
   93m+lHA719Eko5A9+UeWYzXEE/ta4te1H1Ti1w+CcSdrr82PQ3qb4kply
   g==;
X-CSE-ConnectionGUID: fRuW14NiRcCMcj/fNKfutg==
X-CSE-MsgGUID: P3SdeFQxTui6CDRng2Qy9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17266193"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="17266193"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 18:32:27 -0700
X-CSE-ConnectionGUID: yWPWkfR3Qo2Y+MDqlgBYLw==
X-CSE-MsgGUID: EFnPtOVeTg2nN5nS4CXSXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="47057060"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jul 2024 18:32:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQGlL-000UTM-2L;
	Sun, 07 Jul 2024 01:32:23 +0000
Date: Sun, 7 Jul 2024 09:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [efi:next 4/6] drivers/firmware/efi/libstub/x86-stub.c:276
 apple_set_os() error: uninitialized symbol 'set_os'.
Message-ID: <202407070905.agBmzzaD-lkp@intel.com>
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
TO: Aditya Garg <gargaditya08@live.com>
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Lukas Wunner <lukas@wunner.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
head:   f06ecac98e56e2d6c8cb04da732dc6709f7e3fef
commit: d68cc8abc357c05ca1567458965f009add8bab69 [4/6] x86/efistub: Call Apple set_os protocol on dual GPU Intel Macs
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20240707 (https://download.01.org/0day-ci/archive/20240707/202407070905.agBmzzaD-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407070905.agBmzzaD-lkp@intel.com/

New smatch warnings:
drivers/firmware/efi/libstub/x86-stub.c:276 apple_set_os() error: uninitialized symbol 'set_os'.

Old smatch warnings:
drivers/firmware/efi/libstub/x86-stub.c:190 retrieve_apple_device_properties() error: uninitialized symbol 'p'.
drivers/firmware/efi/libstub/x86-stub.c:190 retrieve_apple_device_properties() error: uninitialized symbol 'p'.
drivers/firmware/efi/libstub/x86-stub.c:208 retrieve_apple_device_properties() error: uninitialized symbol 'new'.
drivers/firmware/efi/libstub/x86-stub.c:208 retrieve_apple_device_properties() error: uninitialized symbol 'new'.

vim +/set_os +276 drivers/firmware/efi/libstub/x86-stub.c

d68cc8abc357c0 Aditya Garg 2024-06-30  258  
d68cc8abc357c0 Aditya Garg 2024-06-30  259  static void apple_set_os(void)
d68cc8abc357c0 Aditya Garg 2024-06-30  260  {
d68cc8abc357c0 Aditya Garg 2024-06-30  261  	struct {
d68cc8abc357c0 Aditya Garg 2024-06-30  262  		unsigned long version;
d68cc8abc357c0 Aditya Garg 2024-06-30  263  		efi_status_t (__efiapi *set_os_version)(const char *);
d68cc8abc357c0 Aditya Garg 2024-06-30  264  		efi_status_t (__efiapi *set_os_vendor)(const char *);
d68cc8abc357c0 Aditya Garg 2024-06-30  265  	} *set_os;
d68cc8abc357c0 Aditya Garg 2024-06-30  266  	efi_status_t status;
d68cc8abc357c0 Aditya Garg 2024-06-30  267  
d68cc8abc357c0 Aditya Garg 2024-06-30  268  	if (!efi_is_64bit() || !apple_match_product_name())
d68cc8abc357c0 Aditya Garg 2024-06-30  269  		return;
d68cc8abc357c0 Aditya Garg 2024-06-30  270  
d68cc8abc357c0 Aditya Garg 2024-06-30  271  	status = efi_bs_call(locate_protocol, &APPLE_SET_OS_PROTOCOL_GUID, NULL,
d68cc8abc357c0 Aditya Garg 2024-06-30  272  			     (void **)&set_os);
d68cc8abc357c0 Aditya Garg 2024-06-30  273  	if (status != EFI_SUCCESS)
d68cc8abc357c0 Aditya Garg 2024-06-30  274  		return;
d68cc8abc357c0 Aditya Garg 2024-06-30  275  
d68cc8abc357c0 Aditya Garg 2024-06-30 @276  	if (set_os->version >= 2) {
d68cc8abc357c0 Aditya Garg 2024-06-30  277  		status = set_os->set_os_vendor("Apple Inc.");
d68cc8abc357c0 Aditya Garg 2024-06-30  278  		if (status != EFI_SUCCESS)
d68cc8abc357c0 Aditya Garg 2024-06-30  279  			efi_err("Failed to set OS vendor via apple_set_os\n");
d68cc8abc357c0 Aditya Garg 2024-06-30  280  	}
d68cc8abc357c0 Aditya Garg 2024-06-30  281  
d68cc8abc357c0 Aditya Garg 2024-06-30  282  	if (set_os->version > 0) {
d68cc8abc357c0 Aditya Garg 2024-06-30  283  		/* The version being set doesn't seem to matter */
d68cc8abc357c0 Aditya Garg 2024-06-30  284  		status = set_os->set_os_version("Mac OS X 10.9");
d68cc8abc357c0 Aditya Garg 2024-06-30  285  		if (status != EFI_SUCCESS)
d68cc8abc357c0 Aditya Garg 2024-06-30  286  			efi_err("Failed to set OS version via apple_set_os\n");
d68cc8abc357c0 Aditya Garg 2024-06-30  287  	}
d68cc8abc357c0 Aditya Garg 2024-06-30  288  }
d68cc8abc357c0 Aditya Garg 2024-06-30  289  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
