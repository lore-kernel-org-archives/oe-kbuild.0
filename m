Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC14408602
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Sep 2026 03:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442802; cv=none; b=mnmKtE5CcF7rrcUbpxAB7tS1sjBzYMOZW3fw6n5kLc9uteWbRaVw8xRzdWDarcuP0DHt+mNgh5L7ZSnydAE+cBHQPgnjzBz738yhpjhOUofNr3zFz/+/Zmv4FmcB9mFfIzo0LQi/ZNqLlpe0HZMF6UTLUCK8wAyAJE68zfxuVOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442802; c=relaxed/simple;
	bh=ojMtZxvBh1xGQIKHJvW5KviERNsgryDxfDucQs9Snqo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S5ROeLMsnyBtx4xVZhxwwxmoHTFVy/KcuijU8woLVNmtDsywbNXaRe5CmC1db2n6ltImhxFHL4glM5MkHQv7p+qVyBLlXxBEaPuu7/hJKNeGEBTfHTCJIelRtxqr+eYxZvSj4pZZXvOZPxj8KRTxozKgrKT7Cer2WBoQKXtkUG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Am2p5Tbn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Am2p5Tbn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789442799; x=1820978799;
  h=date:from:to:cc:subject:message-id;
  bh=ojMtZxvBh1xGQIKHJvW5KviERNsgryDxfDucQs9Snqo=;
  b=Am2p5TbnYxDXFU4O6gaUkE12Yz+6FXUzo995YPYsgHl51puW4uJVhTR/
   hGJ5bZow6A/uCwOvFBKROTc3udVR2TaI+aFW8g02cDFL0aYABaoOKdxpN
   kiGzWaBXgdPbs5kBr9OzLTPh/W4mhEQapEXdeIJLONyJGJ6TlSsp56wwc
   V5I2bdDw+y5rQnIA/XR9ERoCMMZeXIY/lqbvtyYog0pmSroVHLCxu6Ha2
   s4HPqZpwQA9xVUnPkwGt+KYW3Da8t9bQ+Hvhrl2gphtu0DjQeZorLXnD7
   6UaFggQ3SK6cGV0sElsfkmAVuidf53oglfYi3piCeTuqxE1XTPfGktcCk
   A==;
X-CSE-ConnectionGUID: LvjUwvGDQbmj1GNKu5OMLA==
X-CSE-MsgGUID: m0lgmUZnR9Wm2GLdXJA9Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88935345"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88935345"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 20:26:37 -0700
X-CSE-ConnectionGUID: gMTJaHkDTl2VQ0gRLMNSxQ==
X-CSE-MsgGUID: VblSwQEvTJi7BVYlYfya5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276962179"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 14 Sep 2026 20:26:36 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6JoX-000000000U3-2Qqb;
	Tue, 15 Sep 2026 03:26:33 +0000
Date: Tue, 15 Sep 2026 05:26:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android14-kiwi-6.1 268/268]
 arch/arm64/kvm/pkvm.c:113:1-25: WARNING: Function "for_each_compatible_node"
 should have of_node_put() before return around line 119.
Message-ID: <202609150532.g9xcFNVz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   cc185f50f1f3990d50a96df3ba5d46d75d5bc8ba
commit: 9d56fc78909afe95f69d5496a74295b8deb8bbe1 [268/268] ANDROID: KVM: arm64: Specify stage-2-protected regions in DT
:::::: branch date: 9 hours ago
:::::: commit date: 3 years, 8 months ago
config: arm64-randconfig-r052-20260915 (https://download.01.org/0day-ci/archive/20260915/202609150532.g9xcFNVz-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 9e70d8f070ba046b8e09388fa84b3a65eb2073e3)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609150532.g9xcFNVz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/pkvm.c:113:1-25: WARNING: Function "for_each_compatible_node" should have of_node_put() before return around line 119.
   arch/arm64/kvm/pkvm.c:113:1-25: WARNING: Function "for_each_compatible_node" should have of_node_put() before return around line 123.
   arch/arm64/kvm/pkvm.c:113:1-25: WARNING: Function "for_each_compatible_node" should have of_node_put() before return around line 128.

vim +/for_each_compatible_node +113 arch/arm64/kvm/pkvm.c

51a84221b10840 Quentin Perret 2022-12-12   97  
51a84221b10840 Quentin Perret 2022-12-12   98  static int __init register_moveable_regions(void)
51a84221b10840 Quentin Perret 2022-12-12   99  {
51a84221b10840 Quentin Perret 2022-12-12  100  	struct memblock_region *reg;
9d56fc78909afe Quentin Perret 2022-12-12  101  	struct device_node *np;
51a84221b10840 Quentin Perret 2022-12-12  102  	int i = 0;
51a84221b10840 Quentin Perret 2022-12-12  103  
51a84221b10840 Quentin Perret 2022-12-12  104  	for_each_mem_region(reg) {
51a84221b10840 Quentin Perret 2022-12-12  105  		if (i >= PKVM_NR_MOVEABLE_REGS)
51a84221b10840 Quentin Perret 2022-12-12  106  			return -ENOMEM;
51a84221b10840 Quentin Perret 2022-12-12  107  		moveable_regs[i].start = reg->base;
51a84221b10840 Quentin Perret 2022-12-12  108  		moveable_regs[i].size = reg->size;
51a84221b10840 Quentin Perret 2022-12-12  109  		moveable_regs[i].type = PKVM_MREG_MEMORY;
51a84221b10840 Quentin Perret 2022-12-12  110  		i++;
51a84221b10840 Quentin Perret 2022-12-12  111  	}
9d56fc78909afe Quentin Perret 2022-12-12  112  
9d56fc78909afe Quentin Perret 2022-12-12 @113  	for_each_compatible_node(np, NULL, "pkvm,protected-region") {
9d56fc78909afe Quentin Perret 2022-12-12  114  		struct resource res;
9d56fc78909afe Quentin Perret 2022-12-12  115  		u64 start, size;
9d56fc78909afe Quentin Perret 2022-12-12  116  		int ret;
9d56fc78909afe Quentin Perret 2022-12-12  117  
9d56fc78909afe Quentin Perret 2022-12-12  118  		if (i >= PKVM_NR_MOVEABLE_REGS)
9d56fc78909afe Quentin Perret 2022-12-12 @119  			return -ENOMEM;
9d56fc78909afe Quentin Perret 2022-12-12  120  
9d56fc78909afe Quentin Perret 2022-12-12  121  		ret = of_address_to_resource(np, 0, &res);
9d56fc78909afe Quentin Perret 2022-12-12  122  		if (ret)
9d56fc78909afe Quentin Perret 2022-12-12  123  			return ret;
9d56fc78909afe Quentin Perret 2022-12-12  124  
9d56fc78909afe Quentin Perret 2022-12-12  125  		start = res.start;
9d56fc78909afe Quentin Perret 2022-12-12  126  		size = resource_size(&res);
9d56fc78909afe Quentin Perret 2022-12-12  127  		if (!PAGE_ALIGNED(start) || !PAGE_ALIGNED(size))
9d56fc78909afe Quentin Perret 2022-12-12  128  			return -EINVAL;
9d56fc78909afe Quentin Perret 2022-12-12  129  
9d56fc78909afe Quentin Perret 2022-12-12  130  		moveable_regs[i].start = start;
9d56fc78909afe Quentin Perret 2022-12-12  131  		moveable_regs[i].size = size;
9d56fc78909afe Quentin Perret 2022-12-12  132  		moveable_regs[i].type = PKVM_MREG_PROTECTED_RANGE;
9d56fc78909afe Quentin Perret 2022-12-12  133  		i++;
9d56fc78909afe Quentin Perret 2022-12-12  134  	}
9d56fc78909afe Quentin Perret 2022-12-12  135  
51a84221b10840 Quentin Perret 2022-12-12  136  	kvm_nvhe_sym(pkvm_moveable_regs_nr) = i;
51a84221b10840 Quentin Perret 2022-12-12  137  	sort_moveable_regs();
51a84221b10840 Quentin Perret 2022-12-12  138  
51a84221b10840 Quentin Perret 2022-12-12  139  	return 0;
51a84221b10840 Quentin Perret 2022-12-12  140  }
51a84221b10840 Quentin Perret 2022-12-12  141  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
