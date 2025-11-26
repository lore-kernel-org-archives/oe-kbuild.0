Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AED2D481F
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 18:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764180436; cv=none; b=jOohQbc6Bpcl0Jo5QPBCaOM9gzfhyv65CZzeaQ2Rc9mT2SEK3fkktj9zYstdSSjbKJuBTbMo48W6ISsyUNka2PwGpZqqmwzia8c9XkP9fAdcSlGGYY34pnmVI/IRpgvP/pGESfAxwN6NJdAqQzbr/tihbrk+BxC0eRn8K4d7azs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764180436; c=relaxed/simple;
	bh=fGFK3Kwbku1YTl6JNmrpRJn0NR3BjECO1PmbWYg9o1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e9rU/cnPLi6CLrDmHuGXzCWIAl7tMHrRC1N0pi/0QwsHvu3hTSnWyzV5UmkmvFZ3pdZtFeUoqFfGFvlAwoXtzXvvseEo+hmxxJCK25WLvNrQMgcvcy+73vA484h4zbbq7gwoYbAUJUc3/p3d3U/UBzZjWn0SxAPTyfkcbCuwTFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AeXsBx1p; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeXsBx1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764180435; x=1795716435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fGFK3Kwbku1YTl6JNmrpRJn0NR3BjECO1PmbWYg9o1I=;
  b=AeXsBx1pUmAnWQFJPooeHSJYLkOfB1eWNoaxuqQhp+UPc4/2F2dv+eTs
   MCAp0y48pz5RDw9bsjUYrampzcNUJC58FXYf7xV8D0kCjSYWUPJaknazA
   VoZ/l52kHru/jN04kM0kD+8V+53d3hlRCSK3kg3+vBhjp/abkYbxF1wRT
   t/3vJDJtcEBa1ZGNgSgwiYj+IdKkwLm0QQYOp17EgHXt2fCicwr/BzcdH
   O/hebs6+AZgTQ5mwMKocwvO8U4EBzqewGxopFtw+yzFoymuU0T13kGs0n
   t1Uslkvoik9wMLwQUPP7A1DTxrlUgxDa4vGKBEvVWyZpo+RgwXTPmDqan
   w==;
X-CSE-ConnectionGUID: MfbdS3mkStSVJ+5mttMdhQ==
X-CSE-MsgGUID: QkDapKgOTxG+liCvEj8+3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65412762"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="65412762"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:07:14 -0800
X-CSE-ConnectionGUID: YtaHCwqMQ6mQE+qvhlgs6A==
X-CSE-MsgGUID: wFV/GRtvR2Ow9BDQ45lAWw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Nov 2025 10:07:13 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOJv5-000000003E5-25SX;
	Wed, 26 Nov 2025 18:07:11 +0000
Date: Thu, 27 Nov 2025 02:06:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sean-jc:x86/vmxon_sucks 10/16] arch/x86/virt/hw.c:118
 x86_vmx_put_cpu() error: uninitialized symbol 'r'.
Message-ID: <202511270238.COkFKpvt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sean Christopherson <seanjc@google.com>

tree:   https://github.com/sean-jc/linux x86/vmxon_sucks
head:   8cc09ceb7eb4fc1e727ffebe33e01e28d6f475eb
commit: 1d12733bef630ec915992646f80fcea097c84f0c [10/16] KVM: x86: Extract VMXON and EFER.SVME enablement to kernel
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251125 (https://download.01.org/0day-ci/archive/20251127/202511270238.COkFKpvt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511270238.COkFKpvt-lkp@intel.com/

smatch warnings:
arch/x86/virt/hw.c:118 x86_vmx_put_cpu() error: uninitialized symbol 'r'.

vim +/r +118 arch/x86/virt/hw.c

1d12733bef630e Sean Christopherson 2025-10-09   92  
1d12733bef630e Sean Christopherson 2025-10-09   93  /*
1d12733bef630e Sean Christopherson 2025-10-09   94   * Disable VMX and clear CR4.VMXE (even if VMXOFF faults)
1d12733bef630e Sean Christopherson 2025-10-09   95   *
1d12733bef630e Sean Christopherson 2025-10-09   96   * Note, VMXOFF causes a #UD if the CPU is !post-VMXON, but it's impossible to
1d12733bef630e Sean Christopherson 2025-10-09   97   * atomically track post-VMXON state, e.g. this may be called in NMI context.
1d12733bef630e Sean Christopherson 2025-10-09   98   * Eat all faults as all other faults on VMXOFF faults are mode related, i.e.
1d12733bef630e Sean Christopherson 2025-10-09   99   * faults are guaranteed to be due to the !post-VMXON check unless the CPU is
1d12733bef630e Sean Christopherson 2025-10-09  100   * magically in RM, VM86, compat mode, or at CPL>0.
1d12733bef630e Sean Christopherson 2025-10-09  101   */
1d12733bef630e Sean Christopherson 2025-10-09  102  static int x86_vmx_put_cpu(void)
1d12733bef630e Sean Christopherson 2025-10-09  103  {
1d12733bef630e Sean Christopherson 2025-10-09  104  	int r;
1d12733bef630e Sean Christopherson 2025-10-09  105  
1d12733bef630e Sean Christopherson 2025-10-09  106  	asm goto("1: vmxoff\n\t"
1d12733bef630e Sean Christopherson 2025-10-09  107  		 _ASM_EXTABLE(1b, %l[fault])
1d12733bef630e Sean Christopherson 2025-10-09  108  		 ::: "cc", "memory" : fault);
1d12733bef630e Sean Christopherson 2025-10-09  109  
1d12733bef630e Sean Christopherson 2025-10-09  110  	goto clear_vmxe;
1d12733bef630e Sean Christopherson 2025-10-09  111  
1d12733bef630e Sean Christopherson 2025-10-09  112  fault:
1d12733bef630e Sean Christopherson 2025-10-09  113  	r = -EIO;
1d12733bef630e Sean Christopherson 2025-10-09  114  
1d12733bef630e Sean Christopherson 2025-10-09  115  clear_vmxe:
1d12733bef630e Sean Christopherson 2025-10-09  116  	cr4_clear_bits(X86_CR4_VMXE);
1d12733bef630e Sean Christopherson 2025-10-09  117  	intel_pt_handle_vmx(0);
1d12733bef630e Sean Christopherson 2025-10-09 @118  	return r;
1d12733bef630e Sean Christopherson 2025-10-09  119  }
1d12733bef630e Sean Christopherson 2025-10-09  120  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
