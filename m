Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795829772;
	b=5gh/19Zegrc1+G22r8h46J0uorCx5nIKn8k8zjnTLuX2wtGMk5rfYGFduzY2jgC7TX2Y
	 ZOoypk1+wiYbtCTEictpQGVkz2N5G95vzaSSwgSaKJ7FDXSYeRCpyCsCIrHMXOwsZdr0w
	 aAXLNgVbYMcwx3z8YWrVMR5KqfPd28baXKMybIwAz9O2BgsnW62jAclTrOuEHJsOdvhAY
	 nRwwFwLjBt+geqk0/vtcn/UHbYQu45D3JDxlIiDy6MXI9PBzSpY9zX6eCAjdTwQ5+c61F
	 AemSji4WN3ZYV7pCxY6uvUEAs8FJXSPZTGK6gRCML0GfxObmppRd7trAijSOm9zDEdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795829772;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=GQ6iAZOOLAJSojFKWU/kEFHcsoNiqRrvdTEFizxstgs=;
	b=rVpKC6Pjw9+Pl6p5cemAUGEKs7JvaODKJ/sHhnJZjkQN6E/uywtoEvgq4PWhCQ8Q+DYV
	 EHbtSIVU9XJEAPErziCQl8ubXQXGfF0rNCgEXsQMBjBFmB7SsXuMR81AAJvvycn039k87
	 VSYU6DmqArvbLkV0wReaCyZgKRZa5Fcnl6jKOLkRCbRahgUcxYu+xgjhMex9AZnv4ZG7e
	 xf6fs39g3n4kx4FNauklLZOpIzi2vySarVGc453WM8bW1pqd6eno6FKeVc8ZDRjiBd+vW
	 lssMXerYXOdmdAPk5lYx6iVGyuw6x+aTJcv4v+qTHCgGg2XXeikhcy2OxLDLXR2JbwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jmZ5VNHZ;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8E3606A31E
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Nov 2026 01:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E8E3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jmZ5VNHZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795829772; x=1827365772;
  h=date:from:to:cc:subject:message-id;
  bh=ZLeskMphFjHpgfxn8pYSH65sEUSFZ3S1B/ARhB5+IWU=;
  b=jmZ5VNHZESkxFADuBPZwKUZxMIuPuCO3e4SJRuf9hCHm2NjQpGiK0t7L
   mqN+T08D0s9QfCR0MadYcl9Ry5ha61PBsR/a+NtoAgw6KgjKvxnk+kkBd
   hvJWeCOhjvvGMu7qjo/C+wiw94/ZpCtB47Nguy6fCR+Dx5OviFJbQVzq3
   Mi11DVe2nDpPTTNZFkQUlSCX8CO+cP+1KflXBueqARL4FoxpvvUU9TB2Q
   gTmFW+r8W4pmTLZ5wy0XmXJCUEmUXenEPY3nlriYTCYNtRBsSWv8s20O1
   R4LKAR26MQF7Ay0fHz4UJCSLPEOGSAj1g/zF58aXeMzsB31rlnH6tQlV7
   w==;
X-CSE-ConnectionGUID: M9VESTyOQQWgrUjuDyTGzA==
X-CSE-MsgGUID: Nyh6HhALSay6LbOvhwm8tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4700896"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4700896"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 17:36:12 -0800
X-CSE-ConnectionGUID: fHRpuvk1S5OWvuU0E9QeGA==
X-CSE-MsgGUID: RrlKPKYoTYmGRyZUBfbnUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4017031"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 27 Nov 2026 17:36:10 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX7MG-000000000TS-14kY;
	Sat, 28 Nov 2026 01:36:08 +0000
Date: Sat, 28 Nov 2026 02:35:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android17-6.18 9/9]
 drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:35:16: sparse:
 sparse: not a function list_add_valid_or_report
Message-ID: <20261128022811.QxMJqMiK-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:35:16: sparse: sparse: not a function list_add_valid_or_report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Mostafa,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   531718cea1e32dd7cc6c91731f0f6a07c8aae153
commit: 5e05ef6d02e170f7200fb3a5b56acd2993b20633 [9/9] ANDROID: drivers/arm-smmu-v3-kvm: Modularize driver
:::::: branch date: 11 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-r2300-20261127 (https://download.01.org/0day-ci/archive/20261128/20261128022811.QxMJqMiK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.3.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128022811.QxMJqMiK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261128022811.QxMJqMiK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:35:16: sparse: sparse: not a function list_add_valid_or_report
>> drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:40:16: sparse: sparse: not a function list_del_entry_valid_or_report
>> drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:410:15: sparse: sparse: cast to restricted __le64
>> drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:410:15: sparse: sparse: restricted __le64 degrades to integer
>> drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:410:15: sparse: sparse: restricted __le64 degrades to integer
   drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:411:14: sparse: sparse: cast to restricted __le64
   drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:411:14: sparse: sparse: restricted __le64 degrades to integer
   drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:411:14: sparse: sparse: restricted __le64 degrades to integer
>> drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:426:22: sparse: sparse: invalid assignment: |=
>> drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:428:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:438:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:440:22: sparse: sparse: invalid assignment: |=
   drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:456:40: sparse: sparse: restricted __le64 degrades to integer
   drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:459:25: sparse: sparse: restricted __le64 degrades to integer
>> drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:612:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *base @@     got void * @@

vim +35 drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c

6056d88e71d977 Mostafa Saleh 2023-08-17  29  
6056d88e71d977 Mostafa Saleh 2023-08-17  30  #ifdef CONFIG_LIST_HARDENED
6056d88e71d977 Mostafa Saleh 2023-08-17  31  bool __list_add_valid_or_report(struct list_head *new,
6056d88e71d977 Mostafa Saleh 2023-08-17  32  				struct list_head *prev,
6056d88e71d977 Mostafa Saleh 2023-08-17  33  				struct list_head *next)
6056d88e71d977 Mostafa Saleh 2023-08-17  34  {
6056d88e71d977 Mostafa Saleh 2023-08-17 @35  	return CALL_FROM_OPS(list_add_valid_or_report, new, prev, next);
6056d88e71d977 Mostafa Saleh 2023-08-17  36  }
6056d88e71d977 Mostafa Saleh 2023-08-17  37  
6056d88e71d977 Mostafa Saleh 2023-08-17  38  bool __list_del_entry_valid_or_report(struct list_head *entry)
6056d88e71d977 Mostafa Saleh 2023-08-17  39  {
6056d88e71d977 Mostafa Saleh 2023-08-17 @40  	return CALL_FROM_OPS(list_del_entry_valid_or_report, entry);
6056d88e71d977 Mostafa Saleh 2023-08-17  41  }
6056d88e71d977 Mostafa Saleh 2023-08-17  42  #endif
6056d88e71d977 Mostafa Saleh 2023-08-17  43  

:::::: The code at line 35 was first introduced by commit
:::::: 6056d88e71d977020974d7b4af860cbc0ecc6276 ANDROID: iommu/arm-smmu-v3-kvm: Support EL2 compiling as a module

:::::: TO: Mostafa Saleh <smostafa@google.com>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
