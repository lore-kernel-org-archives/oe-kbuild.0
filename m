Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094D51C84BD
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 15:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084116; cv=none; b=QRMY9+zaBbYC9txMcxBIouf2Nwru+u2gIsyQOhGYH+qPQy2qcPWouGOdMqJLDIywt/yr7zztvn+XI4BmIa3lb40/N02rQMRflfIVMy/SpoQq6xwaMN+bHL2aGKd80WVV46Ah+2DPSuwi004GfRgzr0SgTjjSUDzJXBhVUpg2tfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084116; c=relaxed/simple;
	bh=ncSrjX9u6Oz4HI8oTzf/ueR8e0LE25cBlcMVgOdU94U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K7+qrpQyYyPz6N3G3AHUSjCtnrCD9T8cda/mu38aMS0m3eCRHoP7h2gv6vZpBoLzD9ip9wdYPSmldUx8j90zpeXhIangwkgEJfMps+vkqY1citBNNQbHSG7flx6lhn3YSP4ZU4tCbhGjVJKxjTafpsBzBq7Zb0zRxSOlJ/BtYEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIEOFuj5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIEOFuj5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764084115; x=1795620115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ncSrjX9u6Oz4HI8oTzf/ueR8e0LE25cBlcMVgOdU94U=;
  b=jIEOFuj54U9u9pETZD6zlGkFtiuJCIML/KRXCgfMukn1gq7OAxSEmPkk
   aDh5BEjciDuWQup/y3ohW6gYzXyE34MNO2fWaY/wJgG1xbk6XhO/88Iem
   f26LUfd4PPhJGdvQBfqJP2CxJppmpTZGejcQJIUGWDqJulxasVIexb722
   g6GQ6dMxTFg65abFNvcOS2LgbmKurA64/6n4LEWyVLeLW+n1V74Q5QDl1
   zIOlG1xfj0jucyBkaS9+VBKBiEtWWe+4fWoj/Taj1bfyJdG/qg8fXKP4V
   vIemXLSQZEzrmzbYZiXICC7m0eO2HG2li5lLka0T+dTspXFwW3Cxm8F2c
   w==;
X-CSE-ConnectionGUID: bhF1Z477RQOFcA+SjDFq6A==
X-CSE-MsgGUID: 3J56BglvT4WgA63VE3QhmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83497439"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="83497439"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 07:21:55 -0800
X-CSE-ConnectionGUID: Wj8cJaOcS6uitqyO7b/BRw==
X-CSE-MsgGUID: ssMe09NBTKWycPOcc/3q1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="192306083"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Nov 2025 07:21:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNurX-000000001vl-05ZZ;
	Tue, 25 Nov 2025 15:21:51 +0000
Date: Tue, 25 Nov 2025 23:21:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sean-jc:x86/vmxon_sucks 10/16] arch/x86/virt/hw.c:118
 x86_vmx_put_cpu() error: uninitialized symbol 'r'.
Message-ID: <202511252332.56suD8dT-lkp@intel.com>
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
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: i386-randconfig-141-20251125 (https://download.01.org/0day-ci/archive/20251125/202511252332.56suD8dT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511252332.56suD8dT-lkp@intel.com/

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
