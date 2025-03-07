Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF5D2DF68
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 16:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741366403; cv=none; b=mMSPzwasnU2T6OtSR0kho8I9uX7VOXSfzHeI0fSV4xsx3WL994iZl3WZ82C+FbeMqjex24sAXcvxysfBlp46j8/Z/2zOPWhKGD/sPawenr3BIxK7qOVRRUj39RSvKGyznkjcI3AU3G9yuwHljhuzox2+NtY1x4y/ETjZiTVuJ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741366403; c=relaxed/simple;
	bh=i/V/AbZllr1NNVDZM6EOgnrxbPYF10KzQnOlr6YaMQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LZYLUf05yAMHOp5Oc82/s1Lw+A0o1moLAtAEqvW0uScxMx32nL86glN84SuxkMBUOnqKs0L7/I8ibF5POwSs/+vmf1vYHTMrnKWjiceS6xYd6gXn1x/iTMPqEq+d1qnbyKVMcoOS89WZeexVUF0vsftI5y+8tYBhS0pvLnDokLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a9k9pI5Q; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9k9pI5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741366401; x=1772902401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i/V/AbZllr1NNVDZM6EOgnrxbPYF10KzQnOlr6YaMQI=;
  b=a9k9pI5Q5Kej8obooGKUzlmUcn/O+VtS4Q/dC1+FzN1FeHuSAuPSx/cO
   C5pkJ/XyTtnIxilJqoQRd2FfrxMasIJe5Nv6sksIUgcfgd3FIiCA+Kout
   oJmC9kgNv1CYWsZcPACHW2JM/m/x/opwPZoR6pTP6bk/XvSGnufc5gV7R
   pc01nZsqOdRGP6vH3eO0VGY/TUEWFZd6J9jiZd9S7Z821bxLVfrJ5LNBF
   ErDIpVJudXxwtGxPYTf3gNjRb+Z5/Z4JKnV+nnb/cmNj5j45IwhCPqfPU
   7NeEnGjUTG1TFoU5bDLDF0umTSixJhNPIC//Bx2l2LGFPLi+U5kBFK2MF
   w==;
X-CSE-ConnectionGUID: oQwCIHYHR/2SDxqIliiPgA==
X-CSE-MsgGUID: 41QoB/bYT9KwCWwV3RF13g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46199171"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="46199171"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 08:48:32 -0800
X-CSE-ConnectionGUID: E6izkID0Tu2uvQwZnivG0g==
X-CSE-MsgGUID: W7s5AHhBQ+eh4nkBN0V+pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119896200"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 07 Mar 2025 08:48:30 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqas8-0000mt-1a;
	Fri, 07 Mar 2025 16:48:28 +0000
Date: Sat, 8 Mar 2025 00:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 1/1]
 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:31:16: sparse: sparse: not
 a function list_add_valid_or_report
Message-ID: <202503080015.r1EZHJVq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:31:16: sparse: sparse: not a function list_add_valid_or_report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Mostafa,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   fe4f8d3aba6106cd87fd9d2b3e1231f5c6fd5d7f
commit: e0abda8b771ca9dd97fd815b4be3bc9711fa3a5c [1/1] ANDROID: drivers/arm-smmu-v3-kvm: Modularize driver
:::::: branch date: 7 hours ago
:::::: commit date: 2 months ago
config: arm64-randconfig-r122-20250307 (https://download.01.org/0day-ci/archive/20250308/202503080015.r1EZHJVq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250308/202503080015.r1EZHJVq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503080015.r1EZHJVq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:31:16: sparse: sparse: not a function list_add_valid_or_report
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:36:16: sparse: sparse: not a function list_del_entry_valid_or_report
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:204:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:310:25: sparse: sparse: restricted __le64 degrades to integer
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:591:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *base @@     got void * @@
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:927:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:929:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:930:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:940:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:954:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:958:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:989:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1016:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1018:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1034:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long volatile @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1168:30: sparse: sparse: cast to restricted __le64
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1168:30: sparse: sparse: restricted __le64 degrades to integer
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1168:30: sparse: sparse: restricted __le64 degrades to integer
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1173:45: sparse: sparse: restricted __le64 degrades to integer

vim +31 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

99daab694814b39 Mostafa Saleh 2023-08-17  25  
99daab694814b39 Mostafa Saleh 2023-08-17  26  #ifdef CONFIG_LIST_HARDENED
99daab694814b39 Mostafa Saleh 2023-08-17  27  bool __list_add_valid_or_report(struct list_head *new,
99daab694814b39 Mostafa Saleh 2023-08-17  28  				struct list_head *prev,
99daab694814b39 Mostafa Saleh 2023-08-17  29  				struct list_head *next)
99daab694814b39 Mostafa Saleh 2023-08-17  30  {
99daab694814b39 Mostafa Saleh 2023-08-17 @31  	return CALL_FROM_OPS(list_add_valid_or_report, new, prev, next);
99daab694814b39 Mostafa Saleh 2023-08-17  32  }
99daab694814b39 Mostafa Saleh 2023-08-17  33  
99daab694814b39 Mostafa Saleh 2023-08-17  34  bool __list_del_entry_valid_or_report(struct list_head *entry)
99daab694814b39 Mostafa Saleh 2023-08-17  35  {
99daab694814b39 Mostafa Saleh 2023-08-17 @36  	return CALL_FROM_OPS(list_del_entry_valid_or_report, entry);
99daab694814b39 Mostafa Saleh 2023-08-17  37  }
99daab694814b39 Mostafa Saleh 2023-08-17  38  #endif
99daab694814b39 Mostafa Saleh 2023-08-17  39  

:::::: The code at line 31 was first introduced by commit
:::::: 99daab694814b393011efe5fa496f272842b0217 ANDROID: iommu/arm-smmu-v3-kvm: Support EL2 compiling as a module

:::::: TO: Mostafa Saleh <smostafa@google.com>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
