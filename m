Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50C51102
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Feb 2024 00:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708387847; cv=none; b=Pr7FPqhGKUdnoapb1aHcN/pTnHfOFZ77jNOzUKYjpt2XoywCBy2+2HL/7hwvE9YFZsC5YbyqkZo1l/Q9eoFuRq+zzHcisK7NNfUEwK9gO75/KUqW/M6N/j5hOppotoV0A+4F6khwLZYlpZ7mJ9dLqkKBV8iaYJQIGDSQFwRswGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708387847; c=relaxed/simple;
	bh=Hcd6eb4ohQGio66E4weZ4Dtmq4Xh/lN4Ex3fjSFOdAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JlGOG857evro+X+9f0pN/9RNX8rDo/OR/zf61kTzT73F5YH3w+pRT8vnXsLE4Q1C6mShPtt/8uan4FVOPWbfiMJFWgzwpNbGf1nzAbN19jpVZpE5qnDZ/EY0dqnuMKaise2FDjfhkECI7eE3zqLiqHLaneZ08cfo5jWLRqM/K4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mM7TMkzp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mM7TMkzp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708387844; x=1739923844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hcd6eb4ohQGio66E4weZ4Dtmq4Xh/lN4Ex3fjSFOdAo=;
  b=mM7TMkzpMgakwN8zKg3IUdEhsb5YoBhN9SOTvg2fnztartwCXvHUvVUr
   w/nwXgAJu630XA77EuXt07Z5W3p4xPma/d9/tSWAUTOhtynXykohBldHf
   V8oegD90ymPYTP5lmTdjEuc5ofCp4Tz/LSUIfxidM9tTtOkIHDiUt5sIe
   xCo7hyxDg2vJJEDst4DNNKYiTWqZ/RJ5/QlarGjZx+VR/Fh5Y+iKkAAn5
   79yaTiorI5vrP2jOZ2UYb1OMSdNYVz3Xh7k8LUCQox5wPxW/tZsYUDA12
   umlM/coGNJ+SDFg8YcuJCjF6XFIWr4kAhe7RBIWQoHS4vW/lJiCMJgeH9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2620556"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="2620556"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 16:10:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="35385837"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Feb 2024 16:10:40 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcDiT-00048y-1g;
	Tue, 20 Feb 2024 00:10:35 +0000
Date: Tue, 20 Feb 2024 08:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kvm:kvm-coco-queue 36/42] arch/x86/kvm/vmx/hyperv_evmcs.h:133:30:
 sparse: sparse: cast truncates bits from constant value (80a88 becomes a88)
Message-ID: <202402200818.PnMfgTlQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "sparse: cast truncates bits from constant value in ROL16 macro"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: kvm@vger.kernel.org
CC: Robert Hu <robert.hu@intel.com>
CC: Farrah Chen <farrah.chen@intel.com>
CC: Danmei Wei <danmei.wei@intel.com>
TO: Isaku Yamahata <isaku.yamahata@intel.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git kvm-coco-queue
head:   3428d62d5effe9bed1b9084ea8f7722761441ec0
commit: d93c498a082b065777e202a6fe6ece65cca41e8c [36/42] KVM: VMX: Introduce test mode related to EPT violation VE
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-121-20240219 (https://download.01.org/0day-ci/archive/20240220/202402200818.PnMfgTlQ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240220/202402200818.PnMfgTlQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402200818.PnMfgTlQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110311 becomes 311)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100610 becomes 610)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100690 becomes 690)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80408 becomes 408)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80c88 becomes c88)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a039a becomes 39a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a041a becomes 41a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a039a becomes 39a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a041a becomes 41a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a050a becomes 50a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a071a becomes 71a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a079a becomes 79a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a001a becomes 1a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a009a becomes 9a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (180198 becomes 198)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a051a becomes 51a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120392 becomes 392)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (180118 becomes 118)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a001a becomes 1a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80688 becomes 688)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a009a becomes 9a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (180198 becomes 198)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120492 becomes 492)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a061a becomes 61a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120492 becomes 492)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a061a becomes 61a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120412 becomes 412)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a059a becomes 59a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120412 becomes 412)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a059a becomes 59a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (20402 becomes 402)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b001b becomes 1b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b009b becomes 9b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b011b becomes 11b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (30083 becomes 83)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (30183 becomes 183)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (30003 becomes 3)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (30103 becomes 103)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (30303 becomes 303)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b039b becomes 39b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b059b becomes 59b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (130013 becomes 13)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b041b becomes 41b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b049b becomes 49b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (b000b becomes b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (b008b becomes 8b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (180098 becomes 98)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100010 becomes 10)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80d08 becomes d08)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80d08 becomes d08)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80108 becomes 108)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a000a becomes a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100010 becomes 10)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80a88 becomes a88)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80d08 becomes d08)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80708 becomes 708)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80788 becomes 788)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80808 becomes 808)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80888 becomes 888)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (20402 becomes 402)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80588 becomes 588)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (81088 becomes 1088)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100810 becomes 810)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100910 becomes 910)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100190 becomes 190)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100210 becomes 210)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100290 becomes 290)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (30203 becomes 203)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (30283 becomes 283)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b019b becomes 19b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b021b becomes 21b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80608 becomes 608)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100390 becomes 390)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100410 becomes 410)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80208 becomes 208)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100510 becomes 510)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80288 becomes 288)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (180018 becomes 18)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80b08 becomes b08)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80388 becomes 388)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (20482 becomes 482)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a050a becomes 50a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80488 becomes 488)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80488 becomes 488)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100710 becomes 710)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (20082 becomes 82)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a021a becomes 21a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (20382 becomes 382)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a051a becomes 51a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120392 becomes 392)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (20302 becomes 302)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a049a becomes 49a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120312 becomes 312)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120812 becomes 812)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a059a becomes 59a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120412 becomes 412)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a061a becomes 61a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120492 becomes 492)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a089a becomes 89a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100690 becomes 690)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110311 becomes 311)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110111 becomes 111)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110191 becomes 191)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a089a becomes 89a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a089a becomes 89a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a069a becomes 69a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110311 becomes 311)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (180118 becomes 118)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (180198 becomes 198)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a069a becomes 69a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a069a becomes 69a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a069a becomes 69a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110291 becomes 291)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (90009 becomes 9)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (90009 becomes 9)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110391 becomes 391)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110111 becomes 111)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110191 becomes 191)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (20482 becomes 482)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (20482 becomes 482)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100010 becomes 10)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80d08 becomes d08)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a001a becomes 1a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (180118 becomes 118)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (180018 becomes 18)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (180198 becomes 198)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (180098 becomes 98)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a009a becomes 9a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a071a becomes 71a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a079a becomes 79a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a069a becomes 69a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a018a becomes 18a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a089a becomes 89a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a020a becomes 20a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (20402 becomes 402)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100510 becomes 510)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100390 becomes 390)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b059b becomes 59b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b051b becomes 51b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (30083 becomes 83)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (30103 becomes 103)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (30183 becomes 183)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (30003 becomes 3)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (30203 becomes 203)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (30283 becomes 283)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (30303 becomes 303)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b019b becomes 19b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b021b becomes 21b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b029b becomes 29b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b031b becomes 31b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b039b becomes 39b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b001b becomes 1b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b009b becomes 9b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b011b becomes 11b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b041b becomes 41b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (130013 becomes 13)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b049b becomes 49b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (b008b becomes 8b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (b000b becomes b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (b010b becomes 10b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100410 becomes 410)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100110 becomes 110)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100190 becomes 190)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100210 becomes 210)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100610 becomes 610)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100690 becomes 690)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110111 becomes 111)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110191 becomes 191)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110311 becomes 311)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110091 becomes 91)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110211 becomes 211)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110291 becomes 291)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80408 becomes 408)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80c88 becomes c88)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (20402 becomes 402)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100710 becomes 710)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80508 becomes 508)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80488 becomes 488)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80688 becomes 688)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100810 becomes 810)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100890 becomes 890)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80a88 becomes a88)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80a88 becomes a88)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (90009 becomes 9)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100710 becomes 710)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80508 becomes 508)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (20402 becomes 402)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (20402 becomes 402)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (20402 becomes 402)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (20402 becomes 402)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80708 becomes 708)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80788 becomes 788)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80808 becomes 808)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80888 becomes 888)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110111 becomes 111)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110111 becomes 111)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110111 becomes 111)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120b92 becomes b92)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120b92 becomes b92)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120b92 becomes b92)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b051b becomes 51b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110091 becomes 91)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110211 becomes 211)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110111 becomes 111)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100890 becomes 890)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a071a becomes 71a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a079a becomes 79a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b009b becomes 9b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b011b becomes 11b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)

vim +133 arch/x86/kvm/vmx/hyperv_evmcs.h

e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  128  
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  129  static __always_inline int evmcs_field_offset(unsigned long field,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  130  					      u16 *clean_field)
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  131  {
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  132  	const struct evmcs_field *evmcs_field;
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05 @133  	unsigned int index = ROL16(field, 6);
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  134  
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  135  	if (unlikely(index >= nr_evmcs_1_fields))
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  136  		return -ENOENT;
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  137  
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  138  	evmcs_field = &vmcs_field_to_evmcs_1[index];
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  139  
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  140  	/*
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  141  	 * Use offset=0 to detect holes in eVMCS. This offset belongs to
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  142  	 * 'revision_id' but this field has no encoding and is supposed to
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  143  	 * be accessed directly.
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  144  	 */
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  145  	if (unlikely(!evmcs_field->offset))
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  146  		return -ENOENT;
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  147  
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  148  	if (clean_field)
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  149  		*clean_field = evmcs_field->clean_field;
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  150  
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  151  	return evmcs_field->offset;
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  152  }
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  153  

:::::: The code at line 133 was first introduced by commit
:::::: e7ad84db4d718e18c7a133e941ba4c7d4c6d4cbf KVM: VMX: Split off hyperv_evmcs.{ch}

:::::: TO: Vitaly Kuznetsov <vkuznets@redhat.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
