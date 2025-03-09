Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB2B224CC
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Mar 2025 03:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741489292; cv=none; b=SjyAO0OgtBLyei9K0rLAZ5d9ANHxr0TbIf9Ogcb/f+eTTTeGkaIa6Qpl0gi7RCxxT6ftxQXaN5uAlojvpjAweSlY3fbhFkOHOMB7Hjva6ZFZibAbKuws1E4fFJJ9lH4IWPOX9BCdpvFS7xfYLemktDjfj+qlHTnMp+vUtBDrL4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741489292; c=relaxed/simple;
	bh=pB+n/fMJFHLoVe5anO8SsJWbGqcTo+jd/P8yj4rALJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gYHzNztXYBhQy0DzI2Qq9wnl6kURUh3uIKlkpmSN9OFdFzg2s4ZRBO2LkvwYdAs8Oq9n0jKTMoq7OFRjcTR8M5WocAvwmAy9i1iPoQ6Nc4hSvh0DjMXNJuZHiISh/hTNsPMXguvQZEuLiMlarRLzkT3W02m+dX5yPKLbPnVnEKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeEkTjZg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeEkTjZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741489290; x=1773025290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pB+n/fMJFHLoVe5anO8SsJWbGqcTo+jd/P8yj4rALJA=;
  b=jeEkTjZgGEjtwJh63/LxyrBHarB0QHcgQbadeiS6v0lbwYBm7epXZ75y
   gbNMkpPPP7jiCX07HTceoE4HdzT7SKyXjN2bMaDA4qnJbjSyPmg0YZ3lM
   5z2dInVWBqRkjDBHK3l/yxANrZT8nYOYBUTXjjfSpkGmuSP5X0ZaCYhfm
   XDpXp61c8TChXIfIFjT3/gvlB+Sm0Kzw/oIIaUUKs+FskIhk0hX+N3fM7
   ribin4f5LdC01rrVu42DyuUPXtO4yUTHCSqGB2hDDo/pFpD5zK8Z3zmiP
   qAhy+CRrYWqPERBm3xCu/IAaka+tay7ueMRJpu51Z/3yYDLFQzmP+eVH/
   Q==;
X-CSE-ConnectionGUID: cqpVyKrQTSSPc92+Si3xNw==
X-CSE-MsgGUID: fQkKWV1aTgquprCd/3NaYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="46422262"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="46422262"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 19:01:29 -0800
X-CSE-ConnectionGUID: FoxNidFCQOWevsIRy1VRbQ==
X-CSE-MsgGUID: EVF7Z/miRPWgWbbEzIvf8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="119408691"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 08 Mar 2025 19:01:28 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr6ur-0002ay-1V;
	Sun, 09 Mar 2025 03:01:25 +0000
Date: Sun, 9 Mar 2025 11:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ./rust/exports_core_generated.h:177:1: sparse: sparse: '##' failed:
 concatenation is not a valid token
Message-ID: <202503091037.h41fZlpZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: ./rust/exports_core_generated.h:177:1: sparse: sparse: '##' failed: concatenation is not a valid token"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b7c90e3e717abff6fe06445b98be306b732bbd2b
commit: 724a75ac9542fe1f8aaa587da4d3863d8ea292fc arm64: rust: Enable Rust support for AArch64
date:   1 year, 1 month ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-r123-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091037.h41fZlpZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce: (https://download.01.org/0day-ci/archive/20250309/202503091037.h41fZlpZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503091037.h41fZlpZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   rust/exports.c: note: in included file:
>> ./rust/exports_core_generated.h:177:1: sparse: sparse: '##' failed: concatenation is not a valid token
   ./rust/exports_core_generated.h:196:1: sparse: sparse: '##' failed: concatenation is not a valid token
   ./rust/exports_core_generated.h:500:1: sparse: sparse: '##' failed: concatenation is not a valid token
   ./rust/exports_core_generated.h:500:1: sparse: sparse: '##' failed: concatenation is not a valid token
   ./rust/exports_core_generated.h:500:1: sparse: sparse: '##' failed: concatenation is not a valid token
   ./rust/exports_core_generated.h:667:1: sparse: sparse: '##' failed: concatenation is not a valid token
   ./rust/exports_core_generated.h:667:1: sparse: sparse: '##' failed: concatenation is not a valid token
   ./rust/exports_core_generated.h:667:1: sparse: sparse: '##' failed: concatenation is not a valid token
   ./rust/exports_core_generated.h:59:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:59:1: sparse: sparse: got b_
   ./rust/exports_core_generated.h:59:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:59:1: sparse: sparse: got b_
   ./rust/exports_core_generated.h:59:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:59:1: sparse: sparse: got b_58
   ./rust/exports_core_generated.h:60:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:60:1: sparse: sparse: got _
   ./rust/exports_core_generated.h:60:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:60:1: sparse: sparse: got _
   ./rust/exports_core_generated.h:60:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:60:1: sparse: sparse: got _59
   ./rust/exports_core_generated.h:152:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:152:1: sparse: sparse: got olduNCINvNvB3r_12try_for_each4callcINtNtBb_6result6ResultuNtNtBb_3fmt5ErrorENCNvXs1Z_B2u_NtB2u_11EscapeDebugNtB53_7Display3fmt0E0B4E_EBb_
   ./rust/exports_core_generated.h:152:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:152:1: sparse: sparse: got olduNCINvNvB3r_12try_for_each4callcINtNtBb_6result6ResultuNtNtBb_3fmt5ErrorENCNvXs1Z_B2u_NtB2u_11EscapeDebugNtB53_7Display3fmt0E0B4E_EBb_
   ./rust/exports_core_generated.h:152:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:152:1: sparse: sparse: got olduNCINvNvB3r_12try_for_each4callcINtNtBb_6result6ResultuNtNtBb_3fmt5ErrorENCNvXs1Z_B2u_NtB2u_11EscapeDebugNtB53_7Display3fmt0E0B4E_EBb_151
   ./rust/exports_core_generated.h:154:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:154:1: sparse: sparse: got buguINtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsg_B2K_B2X_B1R_8try_fold7flattenB3J_uB49_NCINvNvB1R_12try_for_each4callcB49_NCNvXs1Z_BZ_NtBZ_11EscapeDebugNtB4y_7Display3fmt0E0E0E0B49_EBc_
   ./rust/exports_core_generated.h:154:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:154:1: sparse: sparse: got buguINtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsg_B2K_B2X_B1R_8try_fold7flattenB3J_uB49_NCINvNvB1R_12try_for_each4callcB49_NCNvXs1Z_BZ_NtBZ_11EscapeDebugNtB4y_7Display3fmt0E0E0E0B49_EBc_
   ./rust/exports_core_generated.h:154:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:154:1: sparse: sparse: got buguINtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsg_B2K_B2X_B1R_8try_fold7flattenB3J_uB49_NCINvNvB1R_12try_for_each4callcB49_NCNvXs1Z_BZ_NtBZ_11EscapeDebugNtB4y_7Display3fmt0E0E0E0B49_EBc_153
   ./rust/exports_core_generated.h:177:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:177:1: sparse: sparse: got __addressable__RNvMNtNtNtCs7qddEHlz8fK_4core4iter8adapters3mapINtB2_3MapINtNtNtB8_5slice4iter4IterhENCINvNvXs0_NtB4_6filterINtB1w_6FilterppENtNtNtB6_6traits8iterator8Iterator5count8to_usizeRhNCNvNtNtB8_3str5count23char_count_general_case0E0E3newB8_176
   ./rust/exports_core_generated.h:181:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:181:1: sparse: sparse: got 8_5slice4iter4IterhEBW_EE0EB8_
   ./rust/exports_core_generated.h:181:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:181:1: sparse: sparse: got 8_5slice4iter4IterhEBW_EE0EB8_
   ./rust/exports_core_generated.h:181:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:181:1: sparse: sparse: got 8_5slice4iter4IterhEBW_EE0EB8_180
   ./rust/exports_core_generated.h:182:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:182:1: sparse: sparse: got g_B2P_B32_NtNtNtB6_6traits8iterator8Iterator8try_fold7flattenBZ_uB1s_NCINvNvB4f_12try_for_each4callhB1s_NCNvXs2_B29_NtB29_11EscapeAsciiNtB1R_7Display3fmt0E0E0E0EB8_
   ./rust/exports_core_generated.h:182:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:182:1: sparse: sparse: got g_B2P_B32_NtNtNtB6_6traits8iterator8Iterator8try_fold7flattenBZ_uB1s_NCINvNvB4f_12try_for_each4callhB1s_NCNvXs2_B29_NtB29_11EscapeAsciiNtB1R_7Display3fmt0E0E0E0EB8_
   ./rust/exports_core_generated.h:182:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:182:1: sparse: sparse: got g_B2P_B32_NtNtNtB6_6traits8iterator8Iterator8try_fold7flattenBZ_uB1s_NCINvNvB4f_12try_for_each4callhB1s_NCNvXs2_B29_NtB29_11EscapeAsciiNtB1R_7Display3fmt0E0E0E0EB8_181
   ./rust/exports_core_generated.h:183:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:183:1: sparse: sparse: got _B2O_B31_NtNtNtB6_6traits8iterator8Iterator8try_fold7flattenBY_uB1o_NCINvNvB4e_12try_for_each4callcB1o_NCNvXs1Z_NtB25_4iterNtB5T_11EscapeDebugNtB1N_7Display3fmt0E0E0E0EB8_
   ./rust/exports_core_generated.h:183:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:183:1: sparse: sparse: got _B2O_B31_NtNtNtB6_6traits8iterator8Iterator8try_fold7flattenBY_uB1o_NCINvNvB4e_12try_for_each4callcB1o_NCNvXs1Z_NtB25_4iterNtB5T_11EscapeDebugNtB1N_7Display3fmt0E0E0E0EB8_
   ./rust/exports_core_generated.h:183:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:183:1: sparse: sparse: got _B2O_B31_NtNtNtB6_6traits8iterator8Iterator8try_fold7flattenBY_uB1o_NCINvNvB4e_12try_for_each4callcB1o_NCNvXs1Z_NtB25_4iterNtB5T_11EscapeDebugNtB1N_7Display3fmt0E0E0E0EB8_182
   ./rust/exports_core_generated.h:184:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:184:1: sparse: sparse: got _B2X_NtNtNtB6_6traits8iterator8Iterator8try_fold7flattenBY_uB1q_NCINvNvB4a_12try_for_each4callcB1q_NCNvXs22_NtB27_4iterNtB5P_13EscapeDefaultNtB1P_7Display3fmt0E0E0E0EB8_
   ./rust/exports_core_generated.h:184:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:184:1: sparse: sparse: got _B2X_NtNtNtB6_6traits8iterator8Iterator8try_fold7flattenBY_uB1q_NCINvNvB4a_12try_for_each4callcB1q_NCNvXs22_NtB27_4iterNtB5P_13EscapeDefaultNtB1P_7Display3fmt0E0E0E0EB8_
   ./rust/exports_core_generated.h:184:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:184:1: sparse: sparse: got _B2X_NtNtNtB6_6traits8iterator8Iterator8try_fold7flattenBY_uB1q_NCINvNvB4a_12try_for_each4callcB1q_NCNvXs22_NtB27_4iterNtB5P_13EscapeDefaultNtB1P_7Display3fmt0E0E0E0EB8_183
   ./rust/exports_core_generated.h:185:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:185:1: sparse: sparse: got faultuINtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsg_B2J_B2W_B1Q_8try_fold7flattenB3I_uB4b_NCINvNvB1Q_12try_for_each4callhB4b_NCNvXs2_B1r_NtB1r_11EscapeAsciiNtB4A_7Display3fmt0E0E0E0B4b_EBc_
   ./rust/exports_core_generated.h:185:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:185:1: sparse: sparse: got faultuINtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsg_B2J_B2W_B1Q_8try_fold7flattenB3I_uB4b_NCINvNvB1Q_12try_for_each4callhB4b_NCNvXs2_B1r_NtB1r_11EscapeAsciiNtB4A_7Display3fmt0E0E0E0B4b_EBc_
   ./rust/exports_core_generated.h:185:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:185:1: sparse: sparse: got faultuINtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsg_B2J_B2W_B1Q_8try_fold7flattenB3I_uB4b_NCINvNvB1Q_12try_for_each4callhB4b_NCNvXs2_B1r_NtB1r_11EscapeAsciiNtB4A_7Display3fmt0E0E0E0B4b_EBc_184
   ./rust/exports_core_generated.h:187:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:187:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsg_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs22_BZ_NtBZ_13EscapeDefaultNtB4u_7Display3fmt0E0E0E0B45_EBc_
   ./rust/exports_core_generated.h:187:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:187:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsg_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs22_BZ_NtBZ_13EscapeDefaultNtB4u_7Display3fmt0E0E0E0B45_EBc_
   ./rust/exports_core_generated.h:187:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:187:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsg_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs22_BZ_NtBZ_13EscapeDefaultNtB4u_7Display3fmt0E0E0E0B45_EBc_186
   ./rust/exports_core_generated.h:188:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:188:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsg_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs25_BZ_NtBZ_13EscapeUnicodeNtB4u_7Display3fmt0E0E0E0B45_EBc_
   ./rust/exports_core_generated.h:188:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:188:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsg_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs25_BZ_NtBZ_13EscapeUnicodeNtB4u_7Display3fmt0E0E0E0B45_EBc_
   ./rust/exports_core_generated.h:188:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:188:1: sparse: sparse: got INtNtBc_6result6ResultuNtNtBc_3fmt5ErrorENCINvNvXsg_B2E_B2R_B1L_8try_fold7flattenB3D_uB45_NCINvNvB1L_12try_for_each4callcB45_NCNvXs25_BZ_NtBZ_13EscapeUnicodeNtB4u_7Display3fmt0E0E0E0B45_EBc_187
   ./rust/exports_core_generated.h:189:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:189:1: sparse: sparse: got 5accumjNtB3Z_3Sum3sumBN_E0EBc_
   ./rust/exports_core_generated.h:189:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:189:1: sparse: sparse: got 5accumjNtB3Z_3Sum3sumBN_E0EBc_
   ./rust/exports_core_generated.h:189:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:189:1: sparse: sparse: got 5accumjNtB3Z_3Sum3sumBN_E0EBc_188
   ./rust/exports_core_generated.h:196:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:196:1: sparse: sparse: got __addressable__RINvYINtNtNtNtCs7qddEHlz8fK_4core4iter8adapters3map3MapINtNtNtBc_5slice4iter4IterhENCINvNvXs0_NtB8_6filterINtB1u_6FilterppENtNtNtBa_6traits8iterator8Iterator5count8to_usizeRhNCNvNtNtBc_3str5count23char_count_general_case0E0EB1X_3sumjEBc_195
   ./rust/exports_core_generated.h:500:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:500:1: sparse: sparse: got __addressable__RNvXs5_NtNtNtCs7qddEHlz8fK_4core4iter8adapters5chainINtB5_5ChainINtNtB7_7flatten7FlattenINtNtBb_6option8IntoIterNtNtBb_4char11EscapeDebugEEINtB13_7FlatMapNtNtNtBb_3str4iter5CharsB1M_NtB2w_23CharEscapeDebugContinueEENtNtBb_3fmt5Debug3fmtBb_
   ./rust/exports_core_generated.h:510:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:510:1: sparse: sparse: got c_
   ./rust/exports_core_generated.h:510:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:510:1: sparse: sparse: got c_
   ./rust/exports_core_generated.h:510:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:510:1: sparse: sparse: got c_509
   ./rust/exports_core_generated.h:667:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:667:1: sparse: sparse: got __addressable__RNvXsP_NtCs7qddEHlz8fK_4core3fmtRINtNtNtNtB7_4iter8adapters5chain5ChainINtNtBA_7flatten7FlattenINtNtB7_6option8IntoIterNtNtB7_4char11EscapeDebugEEINtB1a_7FlatMapNtNtNtB7_3str4iter5CharsB1T_NtB2D_23CharEscapeDebugContinueEENtB5_5Debug3fmtB7_
   ./rust/exports_core_generated.h:993:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:993:1: sparse: sparse: got b_
   ./rust/exports_core_generated.h:993:1: sparse: sparse: Expected ) after typeof
   ./rust/exports_core_generated.h:993:1: sparse: sparse: got b_
   ./rust/exports_core_generated.h:993:1: sparse: sparse: Expected ; at end of declaration
   ./rust/exports_core_generated.h:993:1: sparse: sparse: got b_992
   ./rust/exports_core_generated.h:994:1: sparse: sparse: Expected ; at end of declaration

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
