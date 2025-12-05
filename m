Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5921321442
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 09:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764927894; cv=none; b=OCeP+9BfUPWifHhcZvBZQeTnnm9R2Okp/9LLZXtwB1PnS1eubUBIa5sJyAWEGz7tWxKTbW+aJY7uRD/1GqQPYOaf3sXfk7D1yYJYcVMy+l14b4t4e/24T5FCKUntsWJff0YQCGt+At7yC8hNiMfFOznskIO+VIu+KkTtYbuFpMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764927894; c=relaxed/simple;
	bh=vy8loGGWAElA7CbQnK/9hJ/B3aMxEUv3vQkkom48u2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WFXZ+nNnbZKeQ5nonodn82/CGNWTaxr4WLxWDC5hpN8WmgwfWXJj+9e5motv7HzeQqQwjPLrolceQlqRdHo3bMY5/gA1eyt3QSawLIx4ACs/JwGrWmGzsH2Fh1BkxfrMDS6fpMFheoeW0Nis//ppcpSZPoIbjMXzLtuvTACBk4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXlA04zW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXlA04zW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764927885; x=1796463885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vy8loGGWAElA7CbQnK/9hJ/B3aMxEUv3vQkkom48u2k=;
  b=UXlA04zWltxdQsc2/MxgRQSNroetGdW3X2HxfsHd4XNwW1XXnp73dZFb
   3FuTRNm8l8cEW0QMlf4MpT4FMUzfGE1r8MPEb76gZTG4ll/B2jOUk4rLU
   qYs3aIGg1JkiAwEe9udk1nrehO4dtZk+9OxD3Dq1Ubmqk6/XNx99ssrOT
   sl2wRD7C7HHH4Cox0AZ5FPiYlBClkOBva1ddkHQzghjQuAO+Yxxx7zWbg
   L4VzCVHnK9Ct/0xGe8b+JLM5zE+q+eTG2arWXTg6sUNJdS2XoOCW15fCU
   MP8Nuz7eEoQ/5CTRfIizGA7hkhHq5/7AiCqFcfco2/ek6rFQzx4T6tsko
   A==;
X-CSE-ConnectionGUID: g3uqPBbXQ+Wlj62uh8ugFg==
X-CSE-MsgGUID: gC0En0V/TtCVZ8EpcH1x4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77578606"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="77578606"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 01:44:39 -0800
X-CSE-ConnectionGUID: TKD49QcSTVuxCbDRhW9rvw==
X-CSE-MsgGUID: 8F0DzHwuRwulxHoXeSPTnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="195071083"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Dec 2025 01:44:38 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRSMd-00000000Eq5-3fhr;
	Fri, 05 Dec 2025 09:44:35 +0000
Date: Fri, 5 Dec 2025 17:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool:
 _RINvMs3_NvNtNtCshc5sK6KjdJJ_6kernel4sync4lock1__INtB6_12___ThePinDataINtNtNtBc_5alloc4kvec3VecINtNtCsbsbRiabPlh9_4core3pin3PinINtNtB1a_4kbox3BoxINtNtBc_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10DeviceDataENtNtB1a_9...
Message-ID: <202512051709.DbdqVrxG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2061f18ad76ecaddf8ed17df81b8611ea88dbddd
commit: 2058f6d1660edc4a9bda9bee627792b352121b10 objtool: Refactor prefix symbol creation code
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-102-20251204 (https://download.01.org/0day-ci/archive/20251205/202512051709.DbdqVrxG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051709.DbdqVrxG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512051709.DbdqVrxG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: _RINvMs3_NvNtNtCshc5sK6KjdJJ_6kernel4sync4lock1__INtB6_12___ThePinDataINtNtNtBc_5alloc4kvec3VecINtNtCsbsbRiabPlh9_4core3pin3PinINtNtB1a_4kbox3BoxINtNtBc_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10DeviceDataENtNtB1a_9allocator7KmallocEEB3s_ENtNtB8_5mutex12MutexBackendE5stateNtNtB1z_7convert10InfallibleINtNtCs57PXBekmiam_8pin_init10___internal11InitClosureNCINvMs5_NtBc_5typesINtB60_6OpaqueNtNtCsfd3uB5I4hpp_8bindings12bindings_raw5mutexE8ffi_initNCNCNvMs0_B8_INtB8_4LockB15_B3Z_E3new0s_0E0B6b_B4x_EEB2G_: symbol name too long, can't create __pfx_ symbol
>> vmlinux.o: warning: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10DeviceDataEENtNtB8_9allocator7KmallocEINtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3p_10___internal11InitClosureNCINvYIBH_B1L_B2W_EINtNtBa_4init11InPlaceInitB1L_E8pin_initNtNtBX_7convert10InfallibleINtB3p_12ChainPinInitIB4F_NCINvMs_B1O_B1L_3newB6a_NCINvMB1O_NtB1O_3Dir5scopeB27_B6a_NCNvB29_17create_file_writes0_0B27_E0B27_Es0_0B1L_B6a_ENCB73_0B1L_B6a_EE0B1L_B4l_EEB29_: symbol name too long, can't create __pfx_ symbol
>> vmlinux.o: warning: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10ModuleDataEENtNtB8_9allocator7KmallocEINtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3p_10___internal11InitClosureNCINvYIBH_B1L_B2W_EINtNtBa_4init11InPlaceInitB1L_E8pin_initNtNtBX_7convert10InfallibleINtB3p_12ChainPinInitIB4F_NCINvMs_B1O_B1L_3newB6a_NCINvMB1O_NtB1O_3Dir5scopeB27_B6a_NCNvB29_12init_control0IB4F_NCNvMB29_B27_4inits_0B27_B6a_EE0B8k_Es0_0B1L_B6a_ENCB73_0B1L_B6a_EE0B1L_B4l_EEB29_: symbol name too long, can't create __pfx_ symbol

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
