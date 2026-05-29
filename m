Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D803DCDAF
	for <oe-kbuild@lists.linux.dev>; Fri, 29 May 2026 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780055115; cv=none; b=a46t6zN0cwwZiXkFMhYCDEGXsYDM+I1EgCr5JyR0d0sQnKIK2rH3NNosFYqg0ZDldpa6eg3gFyvzCNyvOtamLP1vuwhtxtYNN/fejouE/lXzncyjSJz/bBfa1onAXbKtZ9khK442wgGzpejlE3Puvhdui/9A2Pmi4juPQHCG2Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780055115; c=relaxed/simple;
	bh=DB3DVW6MKfBzwLFwr0NcC6sjss8+JCNmZ8Bj+eLiL1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FuLVX5PdBViTJarbKLQ0k3D/1nvSotvCmHLw2AY+O1+7qTiDy84cRDa4bqYQ66cv4K/0athsgjxUANtyw25czLm/T5ubq7br6SIh4tBeDJMrxh5mVH1BMgr+PbNcN58mQ7P/JPRzu1vveVpAT+EX42dGZSr8+YQhllhVq+VcbS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmJLk5gt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmJLk5gt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780055112; x=1811591112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DB3DVW6MKfBzwLFwr0NcC6sjss8+JCNmZ8Bj+eLiL1g=;
  b=PmJLk5gtU1ZrZWTyqoevUElPaPumrm7W2q9VpG9n73g9WiLJEYCHeJdN
   qeJOjeNS7mSdWlPPVF+osg9g/YDxHVxElHmjI71NmnNLLJK4ZvN/tUBTj
   cCt+y4YlHPb1Gb10/Qv4ef8iQamsjNBcxzW56TU5mQde/0CAG521JjbfU
   Rn+QShU+B0+WDsmIA9BrkSvF8K0n8CqDd5VOiQJly/a26Nbk74TAXfRGs
   DuufKkXYMWGnm8Dr0oSiRYWp9NvwgRdzF9W6hx9glEpbe6WCzbRY1Vg42
   NwZUv45AcV87Od01JkxS414n3aYF+wwcQRSKht62YLS70B1MNRlyE7yzJ
   g==;
X-CSE-ConnectionGUID: jfEocRwPQrqIgSj+cQ9ffg==
X-CSE-MsgGUID: 7a95NLwvTEWKp3PkpePDnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="92288516"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="92288516"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 04:45:11 -0700
X-CSE-ConnectionGUID: BhQhuQGoRoKlg/0dDUA8/g==
X-CSE-MsgGUID: cPKcBk23T6ev5js/h0Ow2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="238636252"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 May 2026 04:45:10 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSveF-000000007Ak-3g3r;
	Fri, 29 May 2026 11:45:07 +0000
Date: Fri, 29 May 2026 19:44:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/nova-core/nova_core.o: warning: objtool:
 =?us-ascii?Q?=5FRINvXs5=5FNtNtCshc5sK6KjdJJ=5F6kernel5alloc4kboxINtB?=
 =?us-ascii?Q?6=5F3BoxINtNtNtCsbsbRiabPlh9=5F4core3mem12maybe=5Funinit11?=
 =?us-ascii?Q?MaybeUninitNtNtCsel4MriKkfEK=5F9nova=5Fcore6driver8NovaCoreE?=
 =?us-ascii?Q?NtNtB8=5F9allocator7KmallocEINtCs57PXBekmiam=5F8p...?=
Message-ID: <202605291906.hYzITbHt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Danilo-Krummrich/rust-pci-use-static-lifetime-for-PCI-BAR-resource-names/20260526-043253, commit: 362d60d8e66d0be69d6eaa8e1f75fe6d7cca1f72"
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
commit: 362d60d8e66d0be69d6eaa8e1f75fe6d7cca1f72 gpu: nova-core: separate driver type from driver data
date:   4 days ago
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-004-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291906.hYzITbHt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291906.hYzITbHt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605291906.hYzITbHt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/nova-core/nova_core.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   drivers/gpu/nova-core/nova_core.o: warning: objtool: asan.module_dtor+0x1: call without frame pointer save/setup
>> drivers/gpu/nova-core/nova_core.o: warning: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitNtNtCsel4MriKkfEK_9nova_core6driver8NovaCoreENtNtB8_9allocator7KmallocEINtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB2X_10___internal11InitClosureNCINvYIBH_B1L_B2u_EINtNtBa_4init11InPlaceInitB1L_E8pin_initB3T_IB4d_NCINvB2X_14pin_init_scopeB1L_B3T_NCNvXB1N_NtB1N_14NovaCoreDriverNtNtBa_3pci6Driver5probe0IB4d_NCNCB6q_0s_0B1L_B3T_EE0B1L_B3T_EE0B1L_B3T_EEB1P_: symbol name too long, can't create __pfx_ symbol

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
