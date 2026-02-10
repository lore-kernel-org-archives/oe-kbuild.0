Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364341C5D5E
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 13:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770728743; cv=none; b=C+zSA7ZK31BJIkda3oezjJJx0JZTQUxwQ1G55OkfqpzREPuYItz8rALOPnZPfhjgBRAvUSnKgkBBCliNEtydTA63/G8DwQKZ4lBuzbQrRIsEy9zbL8ZkCj1Z9Fpy4N4FMej8U5qYO6owwBHeiAlToQ1Q1Idado+gNBNhoszhBOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770728743; c=relaxed/simple;
	bh=XhzBA9Mc+ARVtgM4dSIZ/Xx0qZmTRPKCMt4855ta1NA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=srwZkhz0LCE26hYNKneIFflioBPjJwKmbu7j7PoTTD6LfoxHZI/wOO1EwmeNP8efhJDU31TgY1pMmI/SO7TN2aGlg73/rFFQsYLFWB2lCST4w7E5YwIL0hV4Jbn4nuwiwOX+hvPlme9YZH+CnXPfcM/Wx/MGNFI0Rx6Q8D64gpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eg1yMBX3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eg1yMBX3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770728742; x=1802264742;
  h=date:from:to:cc:subject:message-id;
  bh=XhzBA9Mc+ARVtgM4dSIZ/Xx0qZmTRPKCMt4855ta1NA=;
  b=Eg1yMBX3UliVYjAdVjy8HOofdzwOEHUHqi7Ui1cbQtaHU6bI07+e3cIc
   VVwhmM3ExFf3/94GJ6k9EstnIjMejI2N1Gg/eJdG9YYkZjlv11l8/UVnk
   VEv7K8vvRU71MMX2ldrGo1P1lHaH2uvxdFht5miymY3+8CtiupBMDbDKo
   T/s8lGVp4YTLPMTK+Da2seh6VUH7qXFGCYhCQ8pZokCCa25XZbTrtK7Xh
   iEvESEtvGSTy1pqi4mwoc+OMe7NsZn44XCLQQbfb69dYTz4z3bfX7DgBg
   yDg8bsI/+iKp0Yz2RLgr0NNWhDp6L9uiuTqOtxKEZr6ikkSJfJtVTNEdB
   w==;
X-CSE-ConnectionGUID: 2DXsRYh2TGqSuDX6yr1hrg==
X-CSE-MsgGUID: VJPealtTRkm+9e2rhBgPqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="59422644"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="59422644"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 05:05:42 -0800
X-CSE-ConnectionGUID: 5OKqUKcFT8GXyUTZ4pJZ1Q==
X-CSE-MsgGUID: +verHpFuTne43L+e+q+11g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216872158"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Feb 2026 05:05:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpnQv-00000000p1U-3x7Z;
	Tue, 10 Feb 2026 13:05:37 +0000
Date: Tue, 10 Feb 2026 21:05:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sean-jc:vmx/mediated_pmu_freeze_in_smm 11/13]
 arch/x86/kvm/x86.c:10111 kvm_x86_vendor_init() warn: missing unwind goto?
Message-ID: <202602102006.i1w8pi73-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sean Christopherson <seanjc@google.com>

tree:   https://github.com/sean-jc/linux vmx/mediated_pmu_freeze_in_smm
head:   1a1b5a9415ac2d91c7a07e973c736ed283719b4d
commit: 443b6ab2b8ece4d299b203c17bf81c79a2048e36 [11/13] KVM: x86: Group kvm_host register snapshotting code together
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-141-20260210 (https://download.01.org/0day-ci/archive/20260210/202602102006.i1w8pi73-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602102006.i1w8pi73-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:10111 kvm_x86_vendor_init() warn: missing unwind goto?

Old smatch warnings:
arch/x86/kvm/x86.c:1298 __kvm_set_xcr() warn: bitwise AND condition is false here
arch/x86/kvm/x86.c:1299 __kvm_set_xcr() warn: bitwise AND condition is false here
arch/x86/kvm/x86.c:5964 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
arch/x86/kvm/x86.c:9458 x86_emulate_instruction() warn: missing error code? 'r'

vim +10111 arch/x86/kvm/x86.c

3045c483eeeed5 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10044  
955997e880175b arch/x86/kvm/x86.c Nikolay Borisov     2023-10-30  10045  int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
4f8396b96a9fc6 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10046  {
94bda2f4cd8680 arch/x86/kvm/x86.c Sean Christopherson 2022-07-15  10047  	u64 host_pat;
3045c483eeeed5 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10048  	int r, cpu;
f8c16bbaa9e14b drivers/kvm/x86.c  Zhang Xiantao       2007-11-14  10049  
955997e880175b arch/x86/kvm/x86.c Nikolay Borisov     2023-10-30  10050  	guard(mutex)(&vendor_module_lock);
955997e880175b arch/x86/kvm/x86.c Nikolay Borisov     2023-10-30  10051  
0617a769ce16b8 arch/x86/kvm/x86.c Sean Christopherson 2024-08-29  10052  	if (kvm_x86_ops.enable_virtualization_cpu) {
8d20bd63816703 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10053  		pr_err("already loaded vendor module '%s'\n", kvm_x86_ops.name);
82ffad2ddf5d7b arch/x86/kvm/x86.c Sean Christopherson 2022-07-15  10054  		return -EEXIST;
f8c16bbaa9e14b drivers/kvm/x86.c  Zhang Xiantao       2007-11-14  10055  	}
f8c16bbaa9e14b drivers/kvm/x86.c  Zhang Xiantao       2007-11-14  10056  
b666a4b697397f arch/x86/kvm/x86.c Marc Orr            2018-11-06  10057  	/*
b666a4b697397f arch/x86/kvm/x86.c Marc Orr            2018-11-06  10058  	 * KVM explicitly assumes that the guest has an FPU and
b666a4b697397f arch/x86/kvm/x86.c Marc Orr            2018-11-06  10059  	 * FXSAVE/FXRSTOR. For example, the KVM_GET_FPU explicitly casts the
b666a4b697397f arch/x86/kvm/x86.c Marc Orr            2018-11-06  10060  	 * vCPU's FPU state as a fxregs_state struct.
b666a4b697397f arch/x86/kvm/x86.c Marc Orr            2018-11-06  10061  	 */
b666a4b697397f arch/x86/kvm/x86.c Marc Orr            2018-11-06  10062  	if (!boot_cpu_has(X86_FEATURE_FPU) || !boot_cpu_has(X86_FEATURE_FXSR)) {
8d20bd63816703 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10063  		pr_err("inadequate fpu\n");
82ffad2ddf5d7b arch/x86/kvm/x86.c Sean Christopherson 2022-07-15  10064  		return -EOPNOTSUPP;
b666a4b697397f arch/x86/kvm/x86.c Marc Orr            2018-11-06  10065  	}
b666a4b697397f arch/x86/kvm/x86.c Marc Orr            2018-11-06  10066  
5e17b2ee45b941 arch/x86/kvm/x86.c Thomas Gleixner     2011-11-06  10067  	if (IS_ENABLED(CONFIG_PREEMPT_RT) && !boot_cpu_has(X86_FEATURE_CONSTANT_TSC)) {
5e17b2ee45b941 arch/x86/kvm/x86.c Thomas Gleixner     2011-11-06  10068  		pr_err("RT requires X86_FEATURE_CONSTANT_TSC\n");
82ffad2ddf5d7b arch/x86/kvm/x86.c Sean Christopherson 2022-07-15  10069  		return -EOPNOTSUPP;
b666a4b697397f arch/x86/kvm/x86.c Marc Orr            2018-11-06  10070  	}
b666a4b697397f arch/x86/kvm/x86.c Marc Orr            2018-11-06  10071  
94bda2f4cd8680 arch/x86/kvm/x86.c Sean Christopherson 2022-07-15  10072  	/*
94bda2f4cd8680 arch/x86/kvm/x86.c Sean Christopherson 2022-07-15  10073  	 * KVM assumes that PAT entry '0' encodes WB memtype and simply zeroes
94bda2f4cd8680 arch/x86/kvm/x86.c Sean Christopherson 2022-07-15  10074  	 * the PAT bits in SPTEs.  Bail if PAT[0] is programmed to something
94bda2f4cd8680 arch/x86/kvm/x86.c Sean Christopherson 2022-07-15  10075  	 * other than WB.  Note, EPT doesn't utilize the PAT, but don't bother
94bda2f4cd8680 arch/x86/kvm/x86.c Sean Christopherson 2022-07-15  10076  	 * with an exception.  PAT[0] is set to WB on RESET and also by the
94bda2f4cd8680 arch/x86/kvm/x86.c Sean Christopherson 2022-07-15  10077  	 * kernel, i.e. failure indicates a kernel bug or broken firmware.
94bda2f4cd8680 arch/x86/kvm/x86.c Sean Christopherson 2022-07-15  10078  	 */
6fe22abacd40e2 arch/x86/kvm/x86.c Ingo Molnar         2025-04-09  10079  	if (rdmsrq_safe(MSR_IA32_CR_PAT, &host_pat) ||
94bda2f4cd8680 arch/x86/kvm/x86.c Sean Christopherson 2022-07-15  10080  	    (host_pat & GENMASK(2, 0)) != 6) {
8d20bd63816703 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10081  		pr_err("host PAT[0] is not WB\n");
82ffad2ddf5d7b arch/x86/kvm/x86.c Sean Christopherson 2022-07-15  10082  		return -EIO;
94bda2f4cd8680 arch/x86/kvm/x86.c Sean Christopherson 2022-07-15  10083  	}
b666a4b697397f arch/x86/kvm/x86.c Marc Orr            2018-11-06  10084  
40269c03fdbff2 arch/x86/kvm/x86.c Sean Christopherson 2024-04-23  10085  	memset(&kvm_caps, 0, sizeof(kvm_caps));
40269c03fdbff2 arch/x86/kvm/x86.c Sean Christopherson 2024-04-23  10086  
c9b8b07cded58c arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  10087  	x86_emulator_cache = kvm_alloc_emulator_cache();
c9b8b07cded58c arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  10088  	if (!x86_emulator_cache) {
8d20bd63816703 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10089  		pr_err("failed to allocate cache for x86 emulator\n");
82ffad2ddf5d7b arch/x86/kvm/x86.c Sean Christopherson 2022-07-15  10090  		return -ENOMEM;
c9b8b07cded58c arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  10091  	}
c9b8b07cded58c arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  10092  
1d0e84806047f3 arch/x86/kvm/x86.c Sean Christopherson 2022-03-31  10093  	r = kvm_mmu_vendor_module_init();
97db56ce6cc2a0 arch/x86/kvm/x86.c Avi Kivity          2008-01-13  10094  	if (r)
11d984633f7f3f arch/x86/kvm/x86.c Chao Gao            2025-11-07  10095  		goto out_free_x86_emulator_cache;
97db56ce6cc2a0 arch/x86/kvm/x86.c Avi Kivity          2008-01-13  10096  
c43ad19045d5b7 arch/x86/kvm/x86.c Sean Christopherson 2024-04-23  10097  	kvm_caps.supported_vm_types = BIT(KVM_X86_DEFAULT_VM);
555485bd86e344 arch/x86/kvm/x86.c Sean Christopherson 2024-04-23  10098  	kvm_caps.supported_mce_cap = MCG_CTL_P | MCG_SER_P;
443b6ab2b8ece4 arch/x86/kvm/x86.c Sean Christopherson 2026-02-09  10099  	kvm_caps.supported_quirks = KVM_X86_VALID_QUIRKS;
443b6ab2b8ece4 arch/x86/kvm/x86.c Sean Christopherson 2026-02-09  10100  	kvm_caps.inapplicable_quirks = KVM_X86_CONDITIONAL_QUIRKS;
443b6ab2b8ece4 arch/x86/kvm/x86.c Sean Christopherson 2026-02-09  10101  
443b6ab2b8ece4 arch/x86/kvm/x86.c Sean Christopherson 2026-02-09  10102  	if (boot_cpu_has(X86_FEATURE_SHSTK) || boot_cpu_has(X86_FEATURE_IBT)) {
443b6ab2b8ece4 arch/x86/kvm/x86.c Sean Christopherson 2026-02-09  10103  		rdmsrq(MSR_IA32_S_CET, kvm_host.s_cet);
443b6ab2b8ece4 arch/x86/kvm/x86.c Sean Christopherson 2026-02-09  10104  		/*
443b6ab2b8ece4 arch/x86/kvm/x86.c Sean Christopherson 2026-02-09  10105  		 * Linux doesn't yet support supervisor shadow stacks (SSS), so
443b6ab2b8ece4 arch/x86/kvm/x86.c Sean Christopherson 2026-02-09  10106  		 * KVM doesn't save/restore the associated MSRs, i.e. KVM may
443b6ab2b8ece4 arch/x86/kvm/x86.c Sean Christopherson 2026-02-09  10107  		 * clobber the host values.  Yell and refuse to load if SSS is
443b6ab2b8ece4 arch/x86/kvm/x86.c Sean Christopherson 2026-02-09  10108  		 * unexpectedly enabled, e.g. to avoid crashing the host.
443b6ab2b8ece4 arch/x86/kvm/x86.c Sean Christopherson 2026-02-09  10109  		 */
443b6ab2b8ece4 arch/x86/kvm/x86.c Sean Christopherson 2026-02-09  10110  		if (WARN_ON_ONCE(kvm_host.s_cet & CET_SHSTK_EN))
443b6ab2b8ece4 arch/x86/kvm/x86.c Sean Christopherson 2026-02-09 @10111  			return -EIO;
443b6ab2b8ece4 arch/x86/kvm/x86.c Sean Christopherson 2026-02-09  10112  	}
c43ad19045d5b7 arch/x86/kvm/x86.c Sean Christopherson 2024-04-23  10113  
cfc481810c903a arch/x86/kvm/x86.c Sean Christopherson 2020-03-02  10114  	if (boot_cpu_has(X86_FEATURE_XSAVE)) {
7974c0643ee3b4 arch/x86/kvm/x86.c Sean Christopherson 2024-04-23  10115  		kvm_host.xcr0 = xgetbv(XCR_XFEATURE_ENABLED_MASK);
7974c0643ee3b4 arch/x86/kvm/x86.c Sean Christopherson 2024-04-23  10116  		kvm_caps.supported_xcr0 = kvm_host.xcr0 & KVM_SUPPORTED_XCR0;
cfc481810c903a arch/x86/kvm/x86.c Sean Christopherson 2020-03-02  10117  	}
779ed05511f293 arch/x86/kvm/x86.c Yang Weijiang       2025-09-19  10118  
779ed05511f293 arch/x86/kvm/x86.c Yang Weijiang       2025-09-19  10119  	if (boot_cpu_has(X86_FEATURE_XSAVES)) {
779ed05511f293 arch/x86/kvm/x86.c Yang Weijiang       2025-09-19  10120  		rdmsrq(MSR_IA32_XSS, kvm_host.xss);
779ed05511f293 arch/x86/kvm/x86.c Yang Weijiang       2025-09-19  10121  		kvm_caps.supported_xss = kvm_host.xss & KVM_SUPPORTED_XSS;
779ed05511f293 arch/x86/kvm/x86.c Yang Weijiang       2025-09-19  10122  	}
779ed05511f293 arch/x86/kvm/x86.c Yang Weijiang       2025-09-19  10123  
443b6ab2b8ece4 arch/x86/kvm/x86.c Sean Christopherson 2026-02-09  10124  	if (boot_cpu_has(X86_FEATURE_ARCH_CAPABILITIES))
443b6ab2b8ece4 arch/x86/kvm/x86.c Sean Christopherson 2026-02-09  10125  		rdmsrq(MSR_IA32_ARCH_CAPABILITIES, kvm_host.arch_capabilities);
2acf923e38fb6a arch/x86/kvm/x86.c Dexuan Cui          2010-06-10  10126  
6fe22abacd40e2 arch/x86/kvm/x86.c Ingo Molnar         2025-04-09  10127  	rdmsrq_safe(MSR_EFER, &kvm_host.efer);
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10128  
8911ce66697e04 arch/x86/kvm/x86.c Sean Christopherson 2023-01-24  10129  	kvm_init_pmu_capability(ops->pmu_ops);
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10130  
11d984633f7f3f arch/x86/kvm/x86.c Chao Gao            2025-11-07  10131  	WARN_ON_ONCE(kvm_nr_uret_msrs);
11d984633f7f3f arch/x86/kvm/x86.c Chao Gao            2025-11-07  10132  
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10133  	r = ops->hardware_setup();
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10134  	if (r != 0)
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10135  		goto out_mmu_exit;
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10136  
459074cff66f77 arch/x86/kvm/x86.c Sean Christopherson 2025-04-01  10137  	enable_device_posted_irqs &= enable_apicv &&
459074cff66f77 arch/x86/kvm/x86.c Sean Christopherson 2025-04-01  10138  				     irq_remapping_cap(IRQ_POSTING_CAP);
459074cff66f77 arch/x86/kvm/x86.c Sean Christopherson 2025-04-01  10139  
d83420c2d74e66 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10140  	kvm_ops_update(ops);
d83420c2d74e66 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10141  
3045c483eeeed5 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10142  	for_each_online_cpu(cpu) {
d83420c2d74e66 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10143  		smp_call_function_single(cpu, kvm_x86_check_cpu_compat, &r, 1);
3045c483eeeed5 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10144  		if (r < 0)
d83420c2d74e66 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10145  			goto out_unwind_ops;
3045c483eeeed5 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10146  	}
3045c483eeeed5 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10147  
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10148  	/*
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10149  	 * Point of no return!  DO NOT add error paths below this point unless
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10150  	 * absolutely necessary, as most operations from this point forward
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10151  	 * require unwinding.
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10152  	 */
1935542a04cc12 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10153  	kvm_timer_init();
1935542a04cc12 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10154  
0c5f81dad46c90 arch/x86/kvm/x86.c Wanpeng Li          2019-07-06  10155  	if (pi_inject_timer == -1)
04d4e665a60902 arch/x86/kvm/x86.c Frederic Weisbecker 2022-02-07  10156  		pi_inject_timer = housekeeping_enabled(HK_TYPE_TIMER);
16e8d74d2da992 arch/x86/kvm/x86.c Marcelo Tosatti     2012-11-27  10157  #ifdef CONFIG_X86_64
16e8d74d2da992 arch/x86/kvm/x86.c Marcelo Tosatti     2012-11-27  10158  	pvclock_gtod_register_notifier(&pvclock_gtod_notifier);
0092e4346f4955 arch/x86/kvm/x86.c Vitaly Kuznetsov    2018-01-24  10159  
5fa4ec9cb2e667 arch/x86/kvm/x86.c Thomas Gleixner     2018-01-31  10160  	if (hypervisor_is_type(X86_HYPER_MS_HYPERV))
0092e4346f4955 arch/x86/kvm/x86.c Vitaly Kuznetsov    2018-01-24  10161  		set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
16e8d74d2da992 arch/x86/kvm/x86.c Marcelo Tosatti     2012-11-27  10162  #endif
16e8d74d2da992 arch/x86/kvm/x86.c Marcelo Tosatti     2012-11-27  10163  
1c4ba7286afba9 arch/x86/kvm/x86.c Xiong Zhang         2025-12-05  10164  	__kvm_register_perf_callbacks(ops->handle_intel_pt_intr,
1c4ba7286afba9 arch/x86/kvm/x86.c Xiong Zhang         2025-12-05  10165  				      enable_mediated_pmu ? kvm_handle_guest_mediated_pmi : NULL);
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10166  
2a955c4db1dd37 arch/x86/kvm/x86.c Paolo Bonzini       2024-04-04  10167  	if (IS_ENABLED(CONFIG_KVM_SW_PROTECTED_VM) && tdp_mmu_enabled)
2a955c4db1dd37 arch/x86/kvm/x86.c Paolo Bonzini       2024-04-04  10168  		kvm_caps.supported_vm_types |= BIT(KVM_X86_SW_PROTECTED_VM);
2a955c4db1dd37 arch/x86/kvm/x86.c Paolo Bonzini       2024-04-04  10169  
c9c1e20b4c7d60 arch/x86/kvm/x86.c Yan Zhao            2025-02-24  10170  	/* KVM always ignores guest PAT for shadow paging.  */
c9c1e20b4c7d60 arch/x86/kvm/x86.c Yan Zhao            2025-02-24  10171  	if (!tdp_enabled)
c9c1e20b4c7d60 arch/x86/kvm/x86.c Yan Zhao            2025-02-24  10172  		kvm_caps.supported_quirks &= ~KVM_X86_QUIRK_IGNORE_GUEST_PAT;
c9c1e20b4c7d60 arch/x86/kvm/x86.c Yan Zhao            2025-02-24  10173  
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10174  	if (kvm_caps.has_tsc_control) {
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10175  		/*
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10176  		 * Make sure the user can only configure tsc_khz values that
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10177  		 * fit into a signed integer.
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10178  		 * A min value is not calculated because it will always
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10179  		 * be 1 on all machines.
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10180  		 */
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10181  		u64 max = min(0x7fffffffULL,
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10182  			      __scale_tsc(kvm_caps.max_tsc_scaling_ratio, tsc_khz));
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10183  		kvm_caps.max_guest_tsc_khz = max;
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10184  	}
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10185  	kvm_caps.default_tsc_scaling_ratio = 1ULL << kvm_caps.tsc_scaling_ratio_frac_bits;
b1932c5c19ddcb arch/x86/kvm/x86.c Sean Christopherson 2023-03-10  10186  	kvm_init_msr_lists();
f8c16bbaa9e14b drivers/kvm/x86.c  Zhang Xiantao       2007-11-14  10187  	return 0;
56c6d28a9afdca drivers/kvm/x86.c  Zhang Xiantao       2007-11-18  10188  
d83420c2d74e66 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10189  out_unwind_ops:
0617a769ce16b8 arch/x86/kvm/x86.c Sean Christopherson 2024-08-29  10190  	kvm_x86_ops.enable_virtualization_cpu = NULL;
896046474f8d2e arch/x86/kvm/x86.c Wei Wang            2024-05-07  10191  	kvm_x86_call(hardware_unsetup)();
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10192  out_mmu_exit:
11d984633f7f3f arch/x86/kvm/x86.c Chao Gao            2025-11-07  10193  	kvm_destroy_user_return_msrs();
b7483387e37497 arch/x86/kvm/x86.c Sean Christopherson 2022-11-30  10194  	kvm_mmu_vendor_module_exit();
c9b8b07cded58c arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  10195  out_free_x86_emulator_cache:
c9b8b07cded58c arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  10196  	kmem_cache_destroy(x86_emulator_cache);
56c6d28a9afdca drivers/kvm/x86.c  Zhang Xiantao       2007-11-18  10197  	return r;
f8c16bbaa9e14b drivers/kvm/x86.c  Zhang Xiantao       2007-11-14  10198  }
6b36119b94d0b2 arch/x86/kvm/x86.c Sean Christopherson 2025-09-18  10199  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_x86_vendor_init);
f8c16bbaa9e14b drivers/kvm/x86.c  Zhang Xiantao       2007-11-14  10200  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
