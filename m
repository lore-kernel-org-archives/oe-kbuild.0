Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0013264F5
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 07:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775892255; cv=none; b=CaG8qr4o4ySrEd07RgjyenPbiQGmp//X08/IP1iAWDL8gEyeNJs8hKlIsSWIqq5vd0NDarS/UCrfHEF9dKSPMKFTDvjBXtAstLaSZxoDkoLaEZxIEkGtUKDl1YQwCPBle/Kxfcv6IdXhz1qALLuM7l6v3gVJEgOTdkD6LmcvMjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775892255; c=relaxed/simple;
	bh=1OzM9EUUnRbXWxnGhOPP6er9pMQVVXipWgHV0J7ikOA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q+IgB/SR+4JTkYQ0zvV21Qc1XZN9lN9ysRHDcI72C4/i2I0xJeyiG83N61Qq8n/eb+32qwewpcw4pdymyRlpyTnzD+GtOXDKs5QmwyaWMjcEKIZBkWlCOEHCzJza8P1/uUFPrXq56Uma5L1clxn1ByNlBXfrCQh8TN+GOrm97Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0oy3pMC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0oy3pMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775892253; x=1807428253;
  h=date:from:to:cc:subject:message-id;
  bh=1OzM9EUUnRbXWxnGhOPP6er9pMQVVXipWgHV0J7ikOA=;
  b=B0oy3pMCOVgpIp2j8gRL5BWFSJu5M7rDroqcGNOOJWX9ZQdhM5mVKMDu
   aEzDeQcJuZrCgALPHO60MZp7GtsrNLrSUlcAGQC/TQWHKYNZWEvpY9pdl
   Jeu3IXu+ZyEUUOnPs62VVci+5wBw/8Ph7zfM3J+fgjmFbUp1nGOmHAxSk
   iBP659T5ESUtBS8OLb5ow8a4D8mZLk4WcP/nk9Mb/fa/IdyeZerepcbRV
   9WGwCdIBVz2UC4P8RLBtcXjOvSqkYOA36tVwel9pGRVIq4XRiJrAz6+WQ
   H0kikqKu/zvZTpf89b+AJPOOU1P7SIDa7tFNiN1HLElNMHtJQLBikcZfN
   Q==;
X-CSE-ConnectionGUID: 8hIfgwbQRGuL4fjrROlyWg==
X-CSE-MsgGUID: i+2GzrgzTHWtV35YMyfygw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="94295869"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="94295869"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 00:24:13 -0700
X-CSE-ConnectionGUID: wq1xDRuoRiyhussX6SiL4A==
X-CSE-MsgGUID: XVUHnwyXR3e43YPl/DN+Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="228450971"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Apr 2026 00:24:12 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBShN-000000000wj-2jXR;
	Sat, 11 Apr 2026 07:24:09 +0000
Date: Sat, 11 Apr 2026 15:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android17-6.18 1/1]
 drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:44:16: sparse: sparse:
 not a function list_add_valid_or_report
Message-ID: <202604111520.aI0TP518-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:44:16: sparse: sparse: not a function list_add_valid_or_report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Mostafa,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   4e4a75829357064389709ce8601610646d9c1391
commit: 2ea2104b7c2ba0bed9782bc4236746e850e1bb33 [1/1] ANDROID: iommu/arm-smmu-v3-kvm-pv: Add host driver for pKVM
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r133-20260408 (https://download.01.org/0day-ci/archive/20260411/202604111520.aI0TP518-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111520.aI0TP518-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604111520.aI0TP518-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:44:16: sparse: sparse: not a function list_add_valid_or_report
>> drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:49:16: sparse: sparse: not a function list_del_entry_valid_or_report
>> drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:284:25: sparse: sparse: restricted __le64 degrades to integer
>> drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:460:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:464:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
>> drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:495:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 @@
>> drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:526:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:528:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
>> drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:544:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long volatile @@     got restricted __le64 [usertype] @@
>> drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:601:37: sparse: sparse: cast to restricted __le64
   drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:608:37: sparse: sparse: cast to restricted __le64
   drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:608:37: sparse: sparse: cast to restricted __le64
   drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:615:31: sparse: sparse: cast to restricted __le64
   drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:620:37: sparse: sparse: cast to restricted __le64
   drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:620:37: sparse: sparse: cast to restricted __le64
>> drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c:1074:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *base @@     got void * @@

vim +44 drivers/iommu/arm/arm-smmu-v3/pkvm/pv/arm-smmu-v3-pv.c

5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  34  
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  35  void *__memset(void *dst, int c, size_t count)
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  36  {
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  37  	return memset(dst, c, count);
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  38  }
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  39  #ifdef CONFIG_LIST_HARDENED
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  40  bool __list_add_valid_or_report(struct list_head *new,
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  41  				struct list_head *prev,
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  42  				struct list_head *next)
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  43  {
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13 @44  	return CALL_FROM_OPS(list_add_valid_or_report, new, prev, next);
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  45  }
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  46  
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  47  bool __list_del_entry_valid_or_report(struct list_head *entry)
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  48  {
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13 @49  	return CALL_FROM_OPS(list_del_entry_valid_or_report, entry);
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  50  }
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  51  #endif
5b5ca4a5251ec53 Mostafa Saleh 2025-10-13  52  

:::::: The code at line 44 was first introduced by commit
:::::: 5b5ca4a5251ec5381b425f2a8e5ea32c59175561 ANDROID: iommu/arm-smmu-v3-kvm-pv: Introduce pKVM SMMUv3 PV driver

:::::: TO: Mostafa Saleh <smostafa@google.com>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
