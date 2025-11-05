Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FE11F4615
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 18:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762365910; cv=none; b=ewJYIcSZ5jczlYcp9N0waCJ6JGwoZFjQ0zfhSQWz0q7xEmhxIhhaAKkFwIOOtXourRJzgnVBZ0wGlaD15M3jbWCSAcF/6gmTXnO7Am0ZlwBeApFxoDkXJqxSVEenYsmhgeQTwO3EqKoGGvSDZ5WgQmjOXU9WIYgVm/jNR2LD3S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762365910; c=relaxed/simple;
	bh=/auzepDC2bzNjJz1uM+nJI+V8JMkpsVaEyOBc3QJjPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YHDbj14w6xXbWr2lqxs+JCiQz0kN3uHK4JTnomzZNe0I7KztI2x99xR2pZNZ6dte4MVzclhVCV+QWUWXPFN1kkQiVRO6DGkvuYyz0Ea98ZWwuSkfkB2GqUcsZWq2xdzj1D7Dx5eA1j0LlrrEv8WH+xDu9b9R3XaaeuuIhE7TWsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDKi2n2r; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDKi2n2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762365909; x=1793901909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/auzepDC2bzNjJz1uM+nJI+V8JMkpsVaEyOBc3QJjPY=;
  b=ZDKi2n2rlXU7xsI4K3uDJY3cExirDXSKw5TLQQF9VXkplaZgoKvH/AjY
   fvNXKYId1/v3FscKjGYTyNOVbpj7MT4Rb6SiOpoNuQz1sy3K4zLdmVoUD
   jCAyZWAeg75CBtQS2ltkfXMRosrmiRfCvtuG1nhj7uzFyReagHrP/QDYb
   YgOYZq5NMnmll3zbpLoiaMHeuANB+81UU6JRmiItlBQtp1s6qlZ+xwUTF
   8lKZalUhfqvTw/FbPjPcT+EsD6vAHa5n5QQqL9F326Et6yPRUgTJ/AR6w
   hoyc0OlcTp5oix0LyumDnN9zyH5tH9/1b3qkXblGIMb/kf8+B0jLAB/YX
   A==;
X-CSE-ConnectionGUID: 10j0MoTYQcqcXWRTSWXgUw==
X-CSE-MsgGUID: UpXvkHYER6e+Y3PCgerWaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="52058471"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="52058471"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 10:05:07 -0800
X-CSE-ConnectionGUID: aXP0bPWeSgq9C5sukPCmcQ==
X-CSE-MsgGUID: ZEwFnNDjQuKhHpIKe1AFDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="188244605"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Nov 2025 10:05:07 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGhrL-000Sxj-1b;
	Wed, 05 Nov 2025 18:04:13 +0000
Date: Thu, 6 Nov 2025 01:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sean-jc:x86/svm_handler_nospec 5/5] arch/x86/kvm/svm/svm.c:3469:10:
 error: call to '__compiletime_assert_1102' declared with 'error' attribute:
 BUILD_BUG_ON failed: sizeof(_i) > sizeof(long)
Message-ID: <202511060102.saDUWCMZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sean Christopherson <seanjc@google.com>

tree:   https://github.com/sean-jc/linux x86/svm_handler_nospec
head:   bac6bf1a9360d8301e58c5ea06be70c71a665b75
commit: bac6bf1a9360d8301e58c5ea06be70c71a665b75 [5/5] KVM: SVM: Harden exit_code against being used in Spectre-like attacks
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-052-20251105 (https://download.01.org/0day-ci/archive/20251106/202511060102.saDUWCMZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511060102.saDUWCMZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511060102.saDUWCMZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/svm/svm.c:3469:10: error: call to '__compiletime_assert_1102' declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(_i) > sizeof(long)
    3469 |         index = array_index_nospec(exit_code, ARRAY_SIZE(svm_exit_handlers));
         |                 ^
   include/linux/nospec.h:61:2: note: expanded from macro 'array_index_nospec'
      61 |         BUILD_BUG_ON(sizeof(_i) > sizeof(long));                        \
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:585:2: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:578:4: note: expanded from macro '__compiletime_assert'
     578 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:247:1: note: expanded from here
     247 | __compiletime_assert_1102
         | ^
   1 error generated.


vim +3469 arch/x86/kvm/svm/svm.c

3f10c846f8f9e6a arch/x86/kvm/svm.c     Joerg Roedel        2010-05-05  3445  
63129754178c551 arch/x86/kvm/svm/svm.c Paolo Bonzini       2021-03-02  3446  int svm_invoke_exit_handler(struct kvm_vcpu *vcpu, u64 exit_code)
e9093fd49285ff7 arch/x86/kvm/svm/svm.c Tom Lendacky        2020-12-10  3447  {
bac6bf1a9360d83 arch/x86/kvm/svm/svm.c Sean Christopherson 2025-11-03  3448  	u64 index;
bac6bf1a9360d83 arch/x86/kvm/svm/svm.c Sean Christopherson 2025-11-03  3449  
aefb2f2e619b6c3 arch/x86/kvm/svm/svm.c Breno Leitao        2023-11-21  3450  #ifdef CONFIG_MITIGATION_RETPOLINE
e9093fd49285ff7 arch/x86/kvm/svm/svm.c Tom Lendacky        2020-12-10  3451  	if (exit_code == SVM_EXIT_MSR)
63129754178c551 arch/x86/kvm/svm/svm.c Paolo Bonzini       2021-03-02  3452  		return msr_interception(vcpu);
e9093fd49285ff7 arch/x86/kvm/svm/svm.c Tom Lendacky        2020-12-10  3453  	else if (exit_code == SVM_EXIT_VINTR)
63129754178c551 arch/x86/kvm/svm/svm.c Paolo Bonzini       2021-03-02  3454  		return interrupt_window_interception(vcpu);
e9093fd49285ff7 arch/x86/kvm/svm/svm.c Tom Lendacky        2020-12-10  3455  	else if (exit_code == SVM_EXIT_INTR)
63129754178c551 arch/x86/kvm/svm/svm.c Paolo Bonzini       2021-03-02  3456  		return intr_interception(vcpu);
fa662c9080732b1 arch/x86/kvm/svm/svm.c Manali Shukla       2025-01-28  3457  	else if (exit_code == SVM_EXIT_HLT || exit_code == SVM_EXIT_IDLE_HLT)
5ff3a351f687fdd arch/x86/kvm/svm/svm.c Sean Christopherson 2021-02-04  3458  		return kvm_emulate_halt(vcpu);
e9093fd49285ff7 arch/x86/kvm/svm/svm.c Tom Lendacky        2020-12-10  3459  	else if (exit_code == SVM_EXIT_NPF)
63129754178c551 arch/x86/kvm/svm/svm.c Paolo Bonzini       2021-03-02  3460  		return npf_interception(vcpu);
bb5081f4abf2d91 arch/x86/kvm/svm/svm.c Peng Hao            2025-03-06  3461  #ifdef CONFIG_KVM_AMD_SEV
bb5081f4abf2d91 arch/x86/kvm/svm/svm.c Peng Hao            2025-03-06  3462  	else if (exit_code == SVM_EXIT_VMGEXIT)
bb5081f4abf2d91 arch/x86/kvm/svm/svm.c Peng Hao            2025-03-06  3463  		return sev_handle_vmgexit(vcpu);
bb5081f4abf2d91 arch/x86/kvm/svm/svm.c Peng Hao            2025-03-06  3464  #endif
e9093fd49285ff7 arch/x86/kvm/svm/svm.c Tom Lendacky        2020-12-10  3465  #endif
ac308129168b5f9 arch/x86/kvm/svm/svm.c Sean Christopherson 2025-11-03  3466  	if (exit_code >= ARRAY_SIZE(svm_exit_handlers))
ac308129168b5f9 arch/x86/kvm/svm/svm.c Sean Christopherson 2025-11-03  3467  		goto unexpected_vmexit;
ac308129168b5f9 arch/x86/kvm/svm/svm.c Sean Christopherson 2025-11-03  3468  
bac6bf1a9360d83 arch/x86/kvm/svm/svm.c Sean Christopherson 2025-11-03 @3469  	index = array_index_nospec(exit_code, ARRAY_SIZE(svm_exit_handlers));
bac6bf1a9360d83 arch/x86/kvm/svm/svm.c Sean Christopherson 2025-11-03  3470  	if (!svm_exit_handlers[index])
ac308129168b5f9 arch/x86/kvm/svm/svm.c Sean Christopherson 2025-11-03  3471  		goto unexpected_vmexit;
ac308129168b5f9 arch/x86/kvm/svm/svm.c Sean Christopherson 2025-11-03  3472  
bac6bf1a9360d83 arch/x86/kvm/svm/svm.c Sean Christopherson 2025-11-03  3473  	return svm_exit_handlers[index](vcpu);
3f6d53e912cf057 arch/x86/kvm/svm/svm.c Sean Christopherson 2025-11-03  3474  
3f6d53e912cf057 arch/x86/kvm/svm/svm.c Sean Christopherson 2025-11-03  3475  unexpected_vmexit:
3f6d53e912cf057 arch/x86/kvm/svm/svm.c Sean Christopherson 2025-11-03  3476  	dump_vmcb(vcpu);
3f6d53e912cf057 arch/x86/kvm/svm/svm.c Sean Christopherson 2025-11-03  3477  	kvm_prepare_unexpected_reason_exit(vcpu, exit_code);
3f6d53e912cf057 arch/x86/kvm/svm/svm.c Sean Christopherson 2025-11-03  3478  	return 0;
e9093fd49285ff7 arch/x86/kvm/svm/svm.c Tom Lendacky        2020-12-10  3479  }
e9093fd49285ff7 arch/x86/kvm/svm/svm.c Tom Lendacky        2020-12-10  3480  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
