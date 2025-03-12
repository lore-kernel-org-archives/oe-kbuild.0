Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8292BD04
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Mar 2025 00:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741739901; cv=none; b=RJCPb4/TlYI2ChnhPVwrHZWIN4dtfMxxQNKiLRq2rbqmMGGFL7bghQOjRzcU4alZ6DEX3Bm5V6JwYoxJ1P75kJbfNjT3aHKEupyUqGnFDfV14jKxru3d+u0ktPonSMDHFdGmYrU7BY/jIoPGGy+0Gy+kTQOtOzhaMeSsmq6ZjoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741739901; c=relaxed/simple;
	bh=VMNRBHnAI4eRIp2Z8IuEYquVACmEiMg95UiLnYk3r8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YRNIBNRvU6L3F1UHe6/eOHP75kUByrnA3SqlraB4UyD0pI4BJ3UiXI/zZhlNvDGUH7xp/8l1bR5rpnWK7qOfNzj9EBmKEg1zOzxt6qF4Z4Qi2/zu3xfmqiqf1y3Usc0m+kSSZcvkH8jlzZfyCqo4Y5A8jK4BKDSXCSL0PNbQu4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtvM//wV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtvM//wV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741739899; x=1773275899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VMNRBHnAI4eRIp2Z8IuEYquVACmEiMg95UiLnYk3r8A=;
  b=YtvM//wV/JwuJS2DtZBBDn7QKAVhWn3xKYSWzH0q9fAae7eJfbipP1K7
   /KTJclSekE24bMFEdPcO3+DfBr26oAKvB3wpGb9hoLMdtRv2mBtdskiH7
   w/m1uQ/JTQmusP4c7r57O1IkXAUYoBGtGt60TfCzs2UR8boHGUC7QDG9o
   er1TtqOKTsGoYZJd2F4un011K1lvmD3pvXV45JRyc72tynJxjONceSR9v
   EpT+GK1i0iLfFzIxuhPqMQH9UVzs9P+c8+PKBbRWlCCulWIqcMubwF0aZ
   e10AKXE/LicWUgrYSKM0Ox/JthGRmSnwocle7nI4ibgpPrEFA+pdzWRqI
   g==;
X-CSE-ConnectionGUID: Q54Up6DdTbiZ5jkkBvZG6Q==
X-CSE-MsgGUID: yt7qiWSRT0SGsbglbzcEJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53796017"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="53796017"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:38:16 -0700
X-CSE-ConnectionGUID: vd6sYPEBRyayfFFeahgvcQ==
X-CSE-MsgGUID: xa3Ul0NSTAuhf0wyxkO/6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="120429952"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 11 Mar 2025 17:38:15 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsA6u-0007zk-1r;
	Wed, 12 Mar 2025 00:38:12 +0000
Date: Wed, 12 Mar 2025 08:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: rust/exports_kernel_generated.h:17:1: sparse: sparse: '##' failed:
 concatenation is not a valid token
Message-ID: <202503120824.Td4GLV3k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: rust/exports_kernel_generated.h:17:1: sparse: sparse: '##' failed: concatenation is not a valid token"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Danilo Krummrich <dakr@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0fed89a961ea851945d23cc35beb59d6e56c0964
commit: 7e16820fe538e1d36a3bc5aab42f7d2c9d14d0fe rust: pci: do not depend on CONFIG_PCI_MSI
date:   9 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-123-20250312 (https://download.01.org/0day-ci/archive/20250312/202503120824.Td4GLV3k-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120824.Td4GLV3k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503120824.Td4GLV3k-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   rust/exports.c: note: in included file:
   rust/exports_core_generated.h:522:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports.c: note: in included file:
>> rust/exports_kernel_generated.h:17:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:18:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:23:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:23:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:57:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:57:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:221:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:221:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:221:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:245:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:245:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:246:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:246:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:247:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:247:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:248:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:248:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports_kernel_generated.h:248:1: sparse: sparse: '##' failed: concatenation is not a valid token
   rust/exports.c: note: in included file:
   rust/exports_core_generated.h:45:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:45:1: sparse: sparse: got _
   rust/exports_core_generated.h:45:1: sparse: sparse: Expected ) after typeof
   rust/exports_core_generated.h:45:1: sparse: sparse: got _
   rust/exports_core_generated.h:45:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:45:1: sparse: sparse: got _44
   rust/exports_core_generated.h:121:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:121:1: sparse: sparse: got olduNCINvNvB3r_12try_for_each4callcINtNtBb_6result6ResultuNtNtBb_3fmt5ErrorENCNvXs20_B2u_NtB2u_11EscapeDebugNtB53_7Display3fmt0E0B4E_EBb_
   rust/exports_core_generated.h:121:1: sparse: sparse: Expected ) after typeof
   rust/exports_core_generated.h:121:1: sparse: sparse: got olduNCINvNvB3r_12try_for_each4callcINtNtBb_6result6ResultuNtNtBb_3fmt5ErrorENCNvXs20_B2u_NtB2u_11EscapeDebugNtB53_7Display3fmt0E0B4E_EBb_
   rust/exports_core_generated.h:121:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:121:1: sparse: sparse: got olduNCINvNvB3r_12try_for_each4callcINtNtBb_6result6ResultuNtNtBb_3fmt5ErrorENCNvXs20_B2u_NtB2u_11EscapeDebugNtB53_7Display3fmt0E0B4E_EBb_120
   rust/exports_core_generated.h:123:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:123:1: sparse: sparse: got buguINtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2K_B2X_B1R_8try_fold7flattenB3J_uB49_NCINvNvB1R_12try_for_each4callcB49_NCNvXs20_BZ_NtBZ_11EscapeDebugNtB4y_7Display3fmt0E0E0E0B49_EBc_
   rust/exports_core_generated.h:123:1: sparse: sparse: Expected ) after typeof
   rust/exports_core_generated.h:123:1: sparse: sparse: got buguINtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2K_B2X_B1R_8try_fold7flattenB3J_uB49_NCINvNvB1R_12try_for_each4callcB49_NCNvXs20_BZ_NtBZ_11EscapeDebugNtB4y_7Display3fmt0E0E0E0B49_EBc_
   rust/exports_core_generated.h:123:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:123:1: sparse: sparse: got buguINtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2K_B2X_B1R_8try_fold7flattenB3J_uB49_NCINvNvB1R_12try_for_each4callcB49_NCNvXs20_BZ_NtBZ_11EscapeDebugNtB4y_7Display3fmt0E0E0E0B49_EBc_122
   rust/exports_core_generated.h:134:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:134:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs23_BZ_NtBZ_13EscapeDefaultNtB4u_7Display3fmt0E0E0E0B45_EBc_
   rust/exports_core_generated.h:134:1: sparse: sparse: Expected ) after typeof
   rust/exports_core_generated.h:134:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs23_BZ_NtBZ_13EscapeDefaultNtB4u_7Display3fmt0E0E0E0B45_EBc_
   rust/exports_core_generated.h:134:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:134:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs23_BZ_NtBZ_13EscapeDefaultNtB4u_7Display3fmt0E0E0E0B45_EBc_133
   rust/exports_core_generated.h:135:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:135:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs26_BZ_NtBZ_13EscapeUnicodeNtB4u_7Display3fmt0E0E0E0B45_EBc_
   rust/exports_core_generated.h:135:1: sparse: sparse: Expected ) after typeof
   rust/exports_core_generated.h:135:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs26_BZ_NtBZ_13EscapeUnicodeNtB4u_7Display3fmt0E0E0E0B45_EBc_
   rust/exports_core_generated.h:135:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:135:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs26_BZ_NtBZ_13EscapeUnicodeNtB4u_7Display3fmt0E0E0E0B45_EBc_134
   rust/exports_core_generated.h:136:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:136:1: sparse: sparse: got 5accumjNtB3Z_3Sum3sumBN_E0EBc_
   rust/exports_core_generated.h:136:1: sparse: sparse: Expected ) after typeof
   rust/exports_core_generated.h:136:1: sparse: sparse: got 5accumjNtB3Z_3Sum3sumBN_E0EBc_
   rust/exports_core_generated.h:136:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:136:1: sparse: sparse: got 5accumjNtB3Z_3Sum3sumBN_E0EBc_135
   rust/exports_core_generated.h:377:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:377:1: sparse: sparse: got c_
   rust/exports_core_generated.h:377:1: sparse: sparse: Expected ) after typeof
   rust/exports_core_generated.h:377:1: sparse: sparse: got c_
   rust/exports_core_generated.h:377:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:377:1: sparse: sparse: got c_376
   rust/exports_core_generated.h:465:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:465:1: sparse: sparse: got b_
   rust/exports_core_generated.h:465:1: sparse: sparse: Expected ) after typeof
   rust/exports_core_generated.h:465:1: sparse: sparse: got b_
   rust/exports_core_generated.h:465:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:465:1: sparse: sparse: got b_464
   rust/exports_core_generated.h:466:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:466:1: sparse: sparse: got b_
   rust/exports_core_generated.h:466:1: sparse: sparse: Expected ) after typeof
   rust/exports_core_generated.h:466:1: sparse: sparse: got b_
   rust/exports_core_generated.h:466:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:466:1: sparse: sparse: got b_465
   rust/exports_core_generated.h:522:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_core_generated.h:522:1: sparse: sparse: got __addressable__RINvYINtNtNtNtCs5QSdWC790r4_4core4iter8adapters3map3MapINtNtNtBc_5slice4iter4IterhENCINvNvXs0_NtB8_6filterINtB1u_6FilterppENtNtNtBa_6traits8iterator8Iterator5count8to_usizeRhNCNvNtNtBc_3str5count23char_count_general_case0E0EB1X_3sumjEBc_521
   rust/exports.c: note: in included file:
   rust/exports_kernel_generated.h:17:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_kernel_generated.h:17:1: sparse: sparse: got __addressable__RNvMs1_NtNtCs1cdwasc6FUb_6kernel5alloc4kboxINtB5_3BoxINtNtNtCs5QSdWC790r4_4core3mem12maybe_uninit11MaybeUninitINtNtNtB9_4sync3arc8ArcInnerIBQ_INtNtB9_6devres11DevresInnerNtNtB9_3pci3BarEEEENtNtB7_9allocator7KmallocE11assume_initB9_1704
   rust/exports_kernel_generated.h:18:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_kernel_generated.h:18:1: sparse: sparse: got 1705
   rust/exports_kernel_generated.h:19:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_kernel_generated.h:19:1: sparse: sparse: got _initNtB8_10AllocErrorINtNtB3v_10___internal11InitClosureNCNvMsi_B1O_INtB1O_9UniqueArcB2h_E10new_uninits_0B1L_B4a_EEBa_
   rust/exports_kernel_generated.h:19:1: sparse: sparse: Expected ) after typeof
   rust/exports_kernel_generated.h:19:1: sparse: sparse: got _initNtB8_10AllocErrorINtNtB3v_10___internal11InitClosureNCNvMsi_B1O_INtB1O_9UniqueArcB2h_E10new_uninits_0B1L_B4a_EEBa_
   rust/exports_kernel_generated.h:19:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_kernel_generated.h:19:1: sparse: sparse: got _initNtB8_10AllocErrorINtNtB3v_10___internal11InitClosureNCNvMsi_B1O_INtB1O_9UniqueArcB2h_E10new_uninits_0B1L_B4a_EEBa_1706
   rust/exports_kernel_generated.h:23:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_kernel_generated.h:23:1: sparse: sparse: got _RNvXsb_NtNtCs1cdwasc6FUb_6kernel5alloc4kboxINtB5_3BoxINtNtNtB9_4sync3arc8ArcInnerINtNtNtCs5QSdWC790r4_4core3mem12maybe_uninit11MaybeUninitINtNtB9_6devres11DevresInnerNtNtB9_3pci3BarEEENtNtB7_9allocator7KmallocENtNtNtB1o_3ops4drop4Drop4dropB9_1710
   rust/exports_kernel_generated.h:57:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_kernel_generated.h:57:1: sparse: sparse: got __addressable__RINvYINtNtNtCs1cdwasc6FUb_6kernel4sync3arc3ArcINtNtBa_6devres11DevresInnerNtNtBa_3pci3BarEEINtNtBa_4init11InPlaceInitBI_E8pin_initNtNtCs5QSdWC790r4_4core7convert10InfallibleINtNtB1u_10___internal11InitClosureNCNvMBL_BI_3news_0BI_B24_EEBa_
   rust/exports_kernel_generated.h:82:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_kernel_generated.h:82:1: sparse: sparse: got ClosureNCINvYINtBB_3ArcB1W_EINtB6_11InPlaceInitB1W_E8pin_initNtNtB18_7convert10InfallibleIB3F_NCNvMB1Z_B1W_3news_0B1W_B54_EE0B1W_B3l_EEB8_
   rust/exports_kernel_generated.h:82:1: sparse: sparse: Expected ) after typeof
   rust/exports_kernel_generated.h:82:1: sparse: sparse: got ClosureNCINvYINtBB_3ArcB1W_EINtB6_11InPlaceInitB1W_E8pin_initNtNtB18_7convert10InfallibleIB3F_NCNvMB1Z_B1W_3news_0B1W_B54_EE0B1W_B3l_EEB8_
   rust/exports_kernel_generated.h:82:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_kernel_generated.h:82:1: sparse: sparse: got ClosureNCINvYINtBB_3ArcB1W_EINtB6_11InPlaceInitB1W_E8pin_initNtNtB18_7convert10InfallibleIB3F_NCNvMB1Z_B1W_3news_0B1W_B54_EE0B1W_B3l_EEB8_1769
   rust/exports_kernel_generated.h:221:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_kernel_generated.h:221:1: sparse: sparse: got __addressable__RINvMs3_NvNtCs1cdwasc6FUb_6kernel6devres1__INtB6_12___ThePinDataNtNtBa_3pci3BarE4dataNtNtCs5QSdWC790r4_4core7convert10InfallibleINtNtNtBa_4init10___internal11InitClosureNCINvMs0_NtBa_9revocableINtB2Q_9RevocableB10_E3newB10_Es_0B35_B1l_EEBa_
   rust/exports_kernel_generated.h:223:1: sparse: sparse: Expected ; at end of declaration
   rust/exports_kernel_generated.h:223:1: sparse: sparse: got EBa_
   rust/exports_kernel_generated.h:223:1: sparse: sparse: Expected ) after typeof

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
