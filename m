Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D247815CB
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jul 2024 02:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721356626; cv=none; b=bUSMjSDzFiJD87sVu8eDcU26Oqauk3IvYP+awzWc2cRLb8saA0w98Rb7rq+ttuxKulzxfr/T9YYBEjBp0gtsdtb8eStumlzgRqQeb4kePQLgF4v29dAofeSeZ10KPBV8lpA9fffC8gN4T9QfsOccf4RvTUuGn8jrr4OYnwBquBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721356626; c=relaxed/simple;
	bh=rDvH0VmF79A+l8UBLwiut5qHF7slq7HYHPVDx/Kh6ng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Im6JSp8zGmfcNDykZFJ+Se4MySWa7Cn8BcfenFIXghS2LZaqzLOGqCsr0ZeVgZ+fBF2SasIReTAjHvkgKWCamZihrRumSg1uV6usQhuhOyTsR5Eai4CYN/Db2WRZtiWgVUUcH2i3VdBJoQ7r9yXA6u1X/k5iGwoy4qOa+To6zEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ItPOxvTH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ItPOxvTH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721356624; x=1752892624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rDvH0VmF79A+l8UBLwiut5qHF7slq7HYHPVDx/Kh6ng=;
  b=ItPOxvTHas1fevOzONTKFrF8fWlZ1MlqZUAtyEHi8dkyIUgeIQ7qC25r
   4D5Y/mHK3XjUWElTEaIplltVjhewCwGDTBtPvttamRdXVXx36ZNBinu7s
   oNBUt7NCShIFqwMUGPFtt3sWyBYXSeO+rRXo5IAWSOvXxfXeQLrzhJ508
   HuXum0DQLV31F2d8vTkt90N6VGTEEhI5JzLU2sDS7BJJGPaXq0QYaLTa4
   3d6Bo/ADLFUhc+XOjjQ8YnbsFN4arwVcHyA494eXevWDQC9Y1p6Rhxwsr
   zFayupbRoXqBI2JlesySCCo64cZ3bKx/zfN1HnII7vbXevcDpBXPhfSEJ
   Q==;
X-CSE-ConnectionGUID: Ss7akJNjTx6aofIQl9fTjQ==
X-CSE-MsgGUID: nbT/peU8TEGrA2ik/n2bsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="21858921"
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="21858921"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 19:37:03 -0700
X-CSE-ConnectionGUID: iH5ydydJRwqYp9EkKQoiow==
X-CSE-MsgGUID: Mgf/1ZHaTPSc+oyJYW5eJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="55162927"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jul 2024 19:37:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUdUR-000hlm-2Q;
	Fri, 19 Jul 2024 02:36:59 +0000
Date: Fri, 19 Jul 2024 10:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ./rust/exports_core_generated.h:497:1: sparse: sparse: '##' failed:
 concatenation is not a valid token
Message-ID: <202407191050.yaRGZUPZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: ./rust/exports_core_generated.h:497:1: sparse: sparse: '##' failed: concatenation is not a valid token"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Miguel Ojeda <ojeda@kernel.org>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Gary Guo <gary@garyguo.net>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   720261cfc7329406a50c2a8536e0039b9dd9a4e5
commit: 70a57b247251aabadd67795c3097c0fcc616e533 RISC-V: enable building 64-bit kernels with rust support
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-r121-20240719 (https://download.01.org/0day-ci/archive/20240719/202407191050.yaRGZUPZ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20240719/202407191050.yaRGZUPZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407191050.yaRGZUPZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   rust/exports.c: note: in included file:
>> ./rust/exports_core_generated.h:497:1: sparse: sparse: '##' failed: concatenation is not a valid token
   ./rust/exports_core_generated.h:37:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:37:1: sparse: sparse: got b_
   ./rust/exports_core_generated.h:37:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:37:1: sparse: sparse: got b_
   ./rust/exports_core_generated.h:37:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:37:1: sparse: sparse: got b_36
   ./rust/exports_core_generated.h:38:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:38:1: sparse: sparse: got _
   ./rust/exports_core_generated.h:38:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:38:1: sparse: sparse: got _
   ./rust/exports_core_generated.h:38:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:38:1: sparse: sparse: got _37
   ./rust/exports_core_generated.h:116:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:116:1: sparse: sparse: got olduNCINvNvB3r_12try_for_each4callcINtNtBb_6result6ResultuNtNtBb_3fmt5ErrorENCNvXs1Z_B2u_NtB2u_11EscapeDebugNtB53_7Display3fmt0E0B4E_EBb_
   ./rust/exports_core_generated.h:116:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:116:1: sparse: sparse: got olduNCINvNvB3r_12try_for_each4callcINtNtBb_6result6ResultuNtNtBb_3fmt5ErrorENCNvXs1Z_B2u_NtB2u_11EscapeDebugNtB53_7Display3fmt0E0B4E_EBb_
   ./rust/exports_core_generated.h:116:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:116:1: sparse: sparse: got olduNCINvNvB3r_12try_for_each4callcINtNtBb_6result6ResultuNtNtBb_3fmt5ErrorENCNvXs1Z_B2u_NtB2u_11EscapeDebugNtB53_7Display3fmt0E0B4E_EBb_115
   ./rust/exports_core_generated.h:118:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:118:1: sparse: sparse: got buguINtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2K_B2X_B1R_8try_fold7flattenB3J_uB49_NCINvNvB1R_12try_for_each4callcB49_NCNvXs1Z_BZ_NtBZ_11EscapeDebugNtB4y_7Display3fmt0E0E0E0B49_EBc_
   ./rust/exports_core_generated.h:118:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:118:1: sparse: sparse: got buguINtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2K_B2X_B1R_8try_fold7flattenB3J_uB49_NCINvNvB1R_12try_for_each4callcB49_NCNvXs1Z_BZ_NtBZ_11EscapeDebugNtB4y_7Display3fmt0E0E0E0B49_EBc_
   ./rust/exports_core_generated.h:118:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:118:1: sparse: sparse: got buguINtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2K_B2X_B1R_8try_fold7flattenB3J_uB49_NCINvNvB1R_12try_for_each4callcB49_NCNvXs1Z_BZ_NtBZ_11EscapeDebugNtB4y_7Display3fmt0E0E0E0B49_EBc_117
   ./rust/exports_core_generated.h:132:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:132:1: sparse: sparse: got faultuINtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2J_B2W_B1Q_8try_fold7flattenB3I_uB4b_NCINvNvB1Q_12try_for_each4callhB4b_NCNvXs2_B1r_NtB1r_11EscapeAsciiNtB4A_7Display3fmt0E0E0E0B4b_EBc_
   ./rust/exports_core_generated.h:132:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:132:1: sparse: sparse: got faultuINtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2J_B2W_B1Q_8try_fold7flattenB3I_uB4b_NCINvNvB1Q_12try_for_each4callhB4b_NCNvXs2_B1r_NtB1r_11EscapeAsciiNtB4A_7Display3fmt0E0E0E0B4b_EBc_
   ./rust/exports_core_generated.h:132:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:132:1: sparse: sparse: got faultuINtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2J_B2W_B1Q_8try_fold7flattenB3I_uB4b_NCINvNvB1Q_12try_for_each4callhB4b_NCNvXs2_B1r_NtB1r_11EscapeAsciiNtB4A_7Display3fmt0E0E0E0B4b_EBc_131
   ./rust/exports_core_generated.h:134:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:134:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs22_BZ_NtBZ_13EscapeDefaultNtB4u_7Display3fmt0E0E0E0B45_EBc_
   ./rust/exports_core_generated.h:134:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:134:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs22_BZ_NtBZ_13EscapeDefaultNtB4u_7Display3fmt0E0E0E0B45_EBc_
   ./rust/exports_core_generated.h:134:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:134:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs22_BZ_NtBZ_13EscapeDefaultNtB4u_7Display3fmt0E0E0E0B45_EBc_133
   ./rust/exports_core_generated.h:135:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:135:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs25_BZ_NtBZ_13EscapeUnicodeNtB4u_7Display3fmt0E0E0E0B45_EBc_
   ./rust/exports_core_generated.h:135:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:135:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs25_BZ_NtBZ_13EscapeUnicodeNtB4u_7Display3fmt0E0E0E0B45_EBc_
   ./rust/exports_core_generated.h:135:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:135:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsx_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs25_BZ_NtBZ_13EscapeUnicodeNtB4u_7Display3fmt0E0E0E0B45_EBc_134
   ./rust/exports_core_generated.h:136:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:136:1: sparse: sparse: got 5accumjNtB3Z_3Sum3sumBN_E0EBc_
   ./rust/exports_core_generated.h:136:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:136:1: sparse: sparse: got 5accumjNtB3Z_3Sum3sumBN_E0EBc_
   ./rust/exports_core_generated.h:136:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:136:1: sparse: sparse: got 5accumjNtB3Z_3Sum3sumBN_E0EBc_135
   ./rust/exports_core_generated.h:365:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:365:1: sparse: sparse: got c_
   ./rust/exports_core_generated.h:365:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:365:1: sparse: sparse: got c_
   ./rust/exports_core_generated.h:365:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:365:1: sparse: sparse: got c_364
   ./rust/exports_core_generated.h:493:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:493:1: sparse: sparse: got b_
   ./rust/exports_core_generated.h:493:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:493:1: sparse: sparse: got b_
   ./rust/exports_core_generated.h:493:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:493:1: sparse: sparse: got b_492
   ./rust/exports_core_generated.h:494:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:494:1: sparse: sparse: got b_
   ./rust/exports_core_generated.h:494:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:494:1: sparse: sparse: got b_
   ./rust/exports_core_generated.h:494:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:494:1: sparse: sparse: got b_493
   ./rust/exports_core_generated.h:497:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:497:1: sparse: sparse: got __addressable__RINvYINtNtNtNtCsd7thgd03LAQ_4core4iter8adapters3map3MapINtNtNtBc_5slice4iter4IterhENCINvNvXs0_NtB8_6filterINtB1u_6FilterppENtNtNtBa_6traits8iterator8Iterator5count8to_usizeRhNCNvNtNtBc_3str5count23char_count_general_case0E0EB1X_3sumjEBc_496

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
