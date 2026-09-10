Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4DC3D1CC1
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 07:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026065; cv=none; b=JL9y0rYotyuqYevatI+upIHQNmbVocAGp9Mn4R7kP2HgtXF+RYC/WtMOEq6nWp55Pp7X5bKkFh/N0HQtC3jNuSQlOFdOnuTtmkKuHp+dDR/q+f7GXf9q7UuOkm+YcX0AXEaLH3IenVAGNyZm5W/1hRGncVXTWIVbj4urvuySKcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026065; c=relaxed/simple;
	bh=BkjmJP0Fs3j/EzAgVaP8vPP3YoGr3XaVxzXVikGX4UQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L3wQqiOMvi7fo1fXqqDBS84NIjOPvqx+3WqzVv6G+DFKSyh1R8LzmEuNDBTtgsB3sJBE2W8+R0YtIHxUEWmuuzkczwrNrCFwYlJIU9u0Mo4CmI2f/80WkDN1BK7pDyD5IFGN5bHETtENA2Tu8rKZDAXkYKRMn8J/4MXGoLvbE/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lu4btQ/k; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lu4btQ/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789026057; x=1820562057;
  h=date:from:to:cc:subject:message-id;
  bh=BkjmJP0Fs3j/EzAgVaP8vPP3YoGr3XaVxzXVikGX4UQ=;
  b=Lu4btQ/kNnEdNOOEGzBpgnZXuP9sBU4kMpT419kwXRL2QKSQEy3XaHVn
   MKx5eQwETUp7x9FcSX23rjYGPFn6DnOmrjwOm82V8p+zGK8Ct8mx8Fs4D
   xfoH9yxKo2ObawIaP5blOdfZ9BqbZxAc1DCFZYEuo6F0URmrLpfcTZMcA
   JXoj/SadQnQiA1JRhQrBXyguKOjeDYoenGKPkjYIDRtRrpVGxutYl4Efx
   mwD7z5lZ2Jso4IdFko2ZJHGOn/GTxDnhAY7ZQ89t1E6mfXV1VkNP0QoL1
   4+asBDlPFrL3LSxCk8kLUznTtuVMJhE8lalJW2qz1eEQl2tcRtk12i51a
   g==;
X-CSE-ConnectionGUID: cIP2MO0ASnas3mWB2dfQsg==
X-CSE-MsgGUID: AaKX1gKSRHWeuQhmnR5Vmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99797282"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="99797282"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 00:40:54 -0700
X-CSE-ConnectionGUID: 1qOYkto2TCivVYuxCiA8tA==
X-CSE-MsgGUID: eg3hCiNhSRi9smVDvRRg1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="270198820"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Sep 2026 00:40:53 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4ZOs-000000001Xc-44MA;
	Thu, 10 Sep 2026 07:40:50 +0000
Date: Thu, 10 Sep 2026 15:40:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast
 truncates bits from constant value (1b069b becomes 69b)
Message-ID: <202609101535.zooY8pPG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "sparse: cast truncates bits from constant value in ROL16 macro"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Sean Christopherson <seanjc@google.com>
CC: Maxim Levitsky <mlevitsk@redhat.com>
CC: Chao Gao <chao.gao@intel.com>
CC: Xiaoyao Li <xiaoyao.li@intel.com>
CC: Binbin Wu <binbin.wu@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50d05c7c76c96b90462f24debacca971d2e86713
commit: 584ba3ffb9843fd12d3b4a33cfe056e2264392a0 KVM: VMX: Set host constant supervisor states to VMCS fields
date:   12 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-r122-20260910 (https://download.01.org/0day-ci/archive/20260910/202609101535.zooY8pPG-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101535.zooY8pPG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 584ba3ffb984 ("KVM: VMX: Set host constant supervisor states to VMCS fields")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609101535.zooY8pPG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b031b becomes 31b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b041b becomes 41b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (110311 becomes 311)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100610 becomes 610)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100690 becomes 690)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80408 becomes 408)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80c88 becomes c88)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a0a1a becomes a1a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a0a9a becomes a9a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a0b1a becomes b1a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a050a becomes 50a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a0a1a becomes a1a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a0a9a becomes a9a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a0b1a becomes b1a)
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
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120612 becomes 612)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120492 becomes 492)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a061a becomes 61a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120492 becomes 492)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a061a becomes 61a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120412 becomes 412)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a059a becomes 59a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120412 becomes 412)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a059a becomes 59a)
   arch/x86/kvm/vmx/vmx.c: note: in included file (through arch/x86/include/asm/page.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, include/linux/spinlock.h, ...):
   include/asm-generic/memory_model.h:30:23: sparse: sparse: unsigned value that used to be signed checked against zero?
   arch/x86/kvm/vmx/vmx.c:3869:48: sparse: signed value source
   arch/x86/kvm/vmx/vmx.c: note: in included file (through arch/x86/kvm/vmx/vmx_onhyperv.h, arch/x86/kvm/vmx/vmx_ops.h, arch/x86/kvm/vmx/vmx.h, arch/x86/kvm/vmx/hyperv.h):
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
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b061b becomes 61b)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b069b becomes 69b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b071b becomes 71b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (180098 becomes 98)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100010 becomes 10)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80d08 becomes d08)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80d08 becomes d08)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80108 becomes 108)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (a000a becomes a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100010 becomes 10)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80a88 becomes a88)
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
   arch/x86/kvm/vmx/vmx.c: note: in included file (through arch/x86/include/asm/page.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, include/linux/spinlock.h, ...):
   include/asm-generic/memory_model.h:30:23: sparse: sparse: unsigned value that used to be signed checked against zero?
   arch/x86/kvm/vmx/vmx.c:4757:43: sparse: signed value source
   arch/x86/kvm/vmx/vmx.c: note: in included file (through arch/x86/kvm/vmx/vmx_onhyperv.h, arch/x86/kvm/vmx/vmx_ops.h, arch/x86/kvm/vmx/vmx.h, arch/x86/kvm/vmx/hyperv.h):
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
