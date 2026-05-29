Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583B61A6803
	for <oe-kbuild@lists.linux.dev>; Fri, 29 May 2026 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060220; cv=none; b=ExbHU2nlPCUXpBqoTkjp/4e2sd97UUziZlvPsNTo2HJbyBERhUleP/fIyyPKjsLGzxVEJ0Bns/TJ8WDDDe22frAVRe5Xir4gvHdhlJUTwdtJbnAI8vAYFWd/M4t7jPMCBbbbfWIW+7Ym/Bl4qnYK+c1FwDGiZlOGWyQGTL5V1x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060220; c=relaxed/simple;
	bh=HcZSwIv23XaAF+cDMelb/QSyLdqcp9hpdMT3dGxfCxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qCa7IupSAwPoZpl4MocAU4kZ+/VOciwKiNzqI3ln8uZhVLRt2JzEqu+YZg9ceKR1iU9kJD3jlZNrdQVCKG0M/S1aB4F7VUI6dL9x6LxTIwrO3HflFsCcStuVCU/wcyKlscMFgYwejoFO3rMDuHXOvpVRLGWI2mkVXVc76LKZNNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkNuxPNx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkNuxPNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780060219; x=1811596219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HcZSwIv23XaAF+cDMelb/QSyLdqcp9hpdMT3dGxfCxs=;
  b=RkNuxPNxK48yMPapBFVinGogMsKh+KG8eqHSbXb8F0dR82nkOBuGFv38
   B1/cb8ak5Tcp7TKWhHGEhcEZX94+bI4rJFBxmQvQJGzTssNSrU6AOCleR
   7kVAXR0xgcN/P8yIa2DmKG1M3FXaA7c4Ufe2WXSOJ7fYzWZUcNrfDHN+k
   HU9FtFyjV4f4l7/2VuOrTtWJJ8MhP8VQ2ytp30KT1Zu+tKQ3KhzXzBP7B
   lNDkJaXDy7m/v9cKhWisxyduYQdB08VsYLR5dmdQ3tgKzjbiURiyk+yho
   x1oPbTI2XbwZW/hghXH89eO/jdEPE4A5poEcxbDt+K8Xbk2cxpk6w0hS6
   Q==;
X-CSE-ConnectionGUID: rwyNc0c6QfOayzYnImd+VQ==
X-CSE-MsgGUID: Dqr+1If8RpSpotw8GCgivA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="98483774"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="98483774"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 06:10:19 -0700
X-CSE-ConnectionGUID: WKwya7rJRAKKRcStVUL/cA==
X-CSE-MsgGUID: m1HqIIw4RcSGg0WBKAHfww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="238447611"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 May 2026 06:10:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSwyd-000000007GE-3Wcr;
	Fri, 29 May 2026 13:10:15 +0000
Date: Fri, 29 May 2026 21:10:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/nova-core/nova_core.o: warning: objtool:
 =?us-ascii?Q?=5FRINvXs5=5FNtNtCshc5sK6KjdJJ=5F6kernel5alloc4kboxINtB?=
 =?us-ascii?Q?6=5F3BoxINtNtNtCsbsbRiabPlh9=5F4core3mem12maybe=5Funinit11?=
 =?us-ascii?Q?MaybeUninitINtNtBa=5F9auxiliary16RegistrationDatauEENtNtB8?=
 =?us-ascii?Q?=5F9allocator7KmallocEINtCs57PXBekmiam=5F8pin=5Fini...?=
Message-ID: <202605292119.wX5ML321-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Danilo-Krummrich/rust-pci-use-static-lifetime-for-PCI-BAR-resource-names/20260526-043253, commit: 9869f189730ea87a3dea2069ab6d6f7a680c4f0c"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Danilo Krummrich <dakr@kernel.org>
CC: 0day robot <lkp@intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Alexandre Courbot <acourbot@nvidia.com>
CC: Eliot Courtney <ecourtney@nvidia.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/rust-pci-use-static-lifetime-for-PCI-BAR-resource-names/20260526-043253
head:   953178433dc3f49fbe9170320eec40466b1c28da
commit: 9869f189730ea87a3dea2069ab6d6f7a680c4f0c rust: auxiliary: generalize Registration over ForLt
date:   4 days ago
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-004-20260529 (https://download.01.org/0day-ci/archive/20260529/202605292119.wX5ML321-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605292119.wX5ML321-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605292119.wX5ML321-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/nova-core/nova_core.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   drivers/gpu/nova-core/nova_core.o: warning: objtool: asan.module_dtor+0x1: call without frame pointer save/setup
>> drivers/gpu/nova-core/nova_core.o: warning: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDatauEENtNtB8_9allocator7KmallocEINtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB2R_10___internal11InitClosureNCINvYIBH_B1L_B2o_EINtNtBa_4init11InPlaceInitB1L_E8pin_initB3N_IB47_NCINvMsd_B1O_INtB1O_12RegistrationINtNtNtBa_5types6for_lt15UnsafeForLtImplDG_INtB6m_6WithLtL0_Ep2OfuEL_uKj0_EE11new_with_ltNtNtBX_7convert10InfallibleuEs_0B1L_B3N_EE0B1L_B3N_EECsel4MriKkfEK_9nova_core: symbol name too long, can't create __pfx_ symbol
   drivers/gpu/nova-core/nova_core.o: warning: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitNtNtCsel4MriKkfEK_9nova_core6driver8NovaCoreENtNtB8_9allocator7KmallocEINtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB2X_10___internal11InitClosureNCINvYIBH_B1L_B2u_EINtNtBa_4init11InPlaceInitB1L_E8pin_initB3T_IB4d_NCINvB2X_14pin_init_scopeB1L_B3T_NCNvXB1N_NtB1N_14NovaCoreDriverNtNtBa_3pci6Driver5probe0IB4d_NCNCB6q_0s_0B1L_B3T_EE0B1L_B3T_EE0B1L_B3T_EEB1P_: symbol name too long, can't create __pfx_ symbol

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
