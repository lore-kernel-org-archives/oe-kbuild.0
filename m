Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC56C4508E9
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Oct 2026 15:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388055; cv=none; b=Sm7GhVjDU+HMF8hsAKv0VnXLwp5UTydd6Yb2NaCgK7fsBfrZH6OVvyv0StEL1noLpHfvCLt34F020RwFTXc7CE/uEvge2k0FClbUo3EzQPlcM7Yea1CcOwh/rZeq30C+ZUkJKTliT4W4h4hUEUbKkLmQmOtlECmxm7jroLWUAjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388055; c=relaxed/simple;
	bh=ZcplwK4QjkE/F6KC/tDHTu4+3YFjtDoW9oorYPoZlZI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WUL4WwTFIZZjNks9bkIm9Ovj3pkZ5Dd/wtZeiG14Hamcy6wz+Ix0N9lP9IkfGh3JfjOamXeNm7RehyX8foBbLhj6htn95uM4Hko3ke1I0C/Mh5FrNxbNs4ur+4/w2opcfozkiBNEst0nnE15Ogc8e4JBF21QL5UcsqA9DdIPACQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsMA8BqK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsMA8BqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791388053; x=1822924053;
  h=date:from:to:cc:subject:message-id;
  bh=ZcplwK4QjkE/F6KC/tDHTu4+3YFjtDoW9oorYPoZlZI=;
  b=hsMA8BqKbz0rh69ziduSPbGhSB9jBCWNfFg5llEZd/GiOS/WOYfOPCRM
   xCwpuYQP91t1D1RO2HTdqtpL6U1wNxheg8oaWG30ZiQ4pw8T84KRxf4F+
   AlbsAmbnl7vVeSmdjuc9HJSiO3smHFDs3YABhOmM9zeNr3OCeXwE9bqNJ
   WQ2fzPXTIIMOYYssCM6RxxlobUrpM0KmzAG1X5nBVkrAUNOkiSfmwJtY4
   pM0lGPWdsyggy4sOTP8f6hUjRHoeomm9YBZuY7uDH00N9trnbHY9U2beQ
   DRlpirbL/sAGUsqfhMzL9Ta/W+bsHTPkJNOPxYM4zoATPsza/gvmqWBXd
   Q==;
X-CSE-ConnectionGUID: FfcF8qqrTKyPlYy4qUjAOw==
X-CSE-MsgGUID: z5wn1ICKR96XewkCW4ohBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="157941"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="157941"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 08:47:32 -0700
X-CSE-ConnectionGUID: xZlGqSEtQ6OFsfm1Hv3+YA==
X-CSE-MsgGUID: xpopi1lsQbiRysDU96svhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="89422"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 07 Oct 2026 08:47:32 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xETrd-000000003Z9-2L6h;
	Wed, 07 Oct 2026 15:47:29 +0000
Date: Wed, 07 Oct 2026 17:47:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9283/15025]
 ./drivers/gpu/nova-core/exports_nova_core_generated.h:1:1: sparse: sparse:
 '##' failed: concatenation is not a valid token
Message-ID: <202610071718.qFmCBTl4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: ./drivers/gpu/nova-core/exports_nova_core_generated.h:1:1: sparse: sparse: '##' failed: concatenation is not a valid token"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alistair Popple <apopple@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b018686719706a781c45a874ed51374a2dc4b767
commit: ce6e59897ba550a63a4552e5a887e6eb121c2507 [9283/15025] drm: nova: Add an info ioctl
:::::: branch date: 2 hours ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-2301-20261007 (https://download.01.org/0day-ci/archive/20261007/202610071718.qFmCBTl4-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610071718.qFmCBTl4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610071718.qFmCBTl4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/nova-core/nova_core_exports.c: note: in included file:
>> ./drivers/gpu/nova-core/exports_nova_core_generated.h:1:1: sparse: sparse: '##' failed: concatenation is not a valid token
   ./drivers/gpu/nova-core/exports_nova_core_generated.h:1:1: sparse: sparse: Expected ; at end of declaration
   ./drivers/gpu/nova-core/exports_nova_core_generated.h:1:1: sparse: sparse: got addressable__RINvMs5_NtCsbuTvttuFvbr_6kernel9auxiliaryINtB6_6DeviceNtNtB8_6device5BoundE24registration_data_pinnedINtNtNtB8_5types6for_lt15UnsafeForLtImplDG_INtB1E_6WithLtL0_Ep2OfINtNtCs6PUMngfe6Jo_9nova_core3api11NovaCoreApiL0_EEL_B2F_Kj0_EEB2J__0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
