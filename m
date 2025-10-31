Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2A71D5146
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Oct 2025 01:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761873571; cv=none; b=YdsdI7ERdDCvJOcI0NJyv0Mpth8MyOnQV0EfaTryVYj1oWsHLl6tUjcZ0mPWU9EWVkjQe/PIaOvICKBRVW4VIsEN+Pd2rqE3NxpEViMeEMknFh4UOE0HuWSwWYmcOhZmRals6Fx4mUCGymZzjQQVNTdfR8bCmh4WVg7qsZ7v+7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761873571; c=relaxed/simple;
	bh=UBWWgidLIaW0FM/GctEjetD7dHW22Rxkp822OOd/rTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UZFStruNnjFApr8iTi6jRTiZ8zlXhWnR3NwfONsElPd3uK/AyduL94D2HcJX0uMj6n6bQ8oTfqEEXOPrFdnn7WBPiU/qNLYrmVKzyxRKFxmZRVCrdhv84KbpmxylIyJCDi7l2j0ij1ThzwT8bnGKnjiwPF52RdSRDEFQA4InXEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUEv1clu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUEv1clu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761873569; x=1793409569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UBWWgidLIaW0FM/GctEjetD7dHW22Rxkp822OOd/rTo=;
  b=VUEv1clu3KScUO6iaqtlNQOLC3sEryYKJK4PZoXMIrPeOuoJwYe07Hqe
   ptFgqRH23hEx/EqfwgqnFziPcAJWFefKkZdKhpu3wKBaln1VzTJZOZWPV
   6fCo/4GGe7cd1TwO2jCVHv6hTOntalxFnj44LGX8G+jS0gboj8SYQwwUr
   6qdiRYO6aB2WlU+CsrnOSE83M80CfHJd0Q8ri4ioDnzh5e26RLjN+IkIU
   /38G38Ei1wfvs+jWk+CTABTfE8dWFfNHsdCj9H+2kdf60KPWT/skvIqq7
   4V5CucJaGgU72drv/UoQxzfs2Zrd0F/ev2sjiY5BlteCx+PTMWfX7w45K
   Q==;
X-CSE-ConnectionGUID: WM1OIBkySw23+K8M+3hbbA==
X-CSE-MsgGUID: 3e3kPNmbT/OAAD/SLROvjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64069217"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="64069217"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 18:19:29 -0700
X-CSE-ConnectionGUID: u/X2psAGQ8ube2w0fmA3yg==
X-CSE-MsgGUID: 8JhHzJ43RcuwwXdjn5VoKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="190455069"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Oct 2025 18:19:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEdnW-000Mep-2G;
	Fri, 31 Oct 2025 01:19:23 +0000
Date: Fri, 31 Oct 2025 09:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [osandov:svm-int3-fix 1/1] arch/x86/kvm/svm/svm.c:321
 svm_update_soft_interrupt_rip() warn: right shifting more than type allows 8
 vs 16
Message-ID: <202510310909.y5ClH2qW-lkp@intel.com>
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
CC: Omar Sandoval <osandov@osandov.com>
TO: Omar Sandoval <osandov@fb.com>
CC: Sean Christopherson <seanjc@google.com>

tree:   https://github.com/osandov/linux.git svm-int3-fix
head:   71cc6a9d4228c085a380dec917c65df5fcd9e8a9
commit: 71cc6a9d4228c085a380dec917c65df5fcd9e8a9 [1/1] KVM: SVM: Don't skip unrelated instruction if INT3/INTO is replaced
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-141-20251031 (https://download.01.org/0day-ci/archive/20251031/202510310909.y5ClH2qW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510310909.y5ClH2qW-lkp@intel.com/

smatch warnings:
arch/x86/kvm/svm/svm.c:321 svm_update_soft_interrupt_rip() warn: right shifting more than type allows 8 vs 16

vim +321 arch/x86/kvm/svm/svm.c

da998b46d24476 arch/x86/kvm/svm.c     Jim Mattson         2018-10-16  317  
71cc6a9d4228c0 arch/x86/kvm/svm/svm.c Omar Sandoval       2025-10-29  318  static int svm_update_soft_interrupt_rip(struct kvm_vcpu *vcpu, u8 vector)
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  319  {
71cc6a9d4228c0 arch/x86/kvm/svm/svm.c Omar Sandoval       2025-10-29  320  	const int emul_type = EMULTYPE_SKIP | EMULTYPE_SKIP_SOFT_INT |
71cc6a9d4228c0 arch/x86/kvm/svm/svm.c Omar Sandoval       2025-10-29 @321  			      EMULTYPE_GET_SOFT_INT_VECTOR(vector);
63129754178c55 arch/x86/kvm/svm/svm.c Paolo Bonzini       2021-03-02  322  	unsigned long rip, old_rip = kvm_rip_read(vcpu);
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  323  	struct vcpu_svm *svm = to_svm(vcpu);
66b7138f913635 arch/x86/kvm/svm.c     Jan Kiszka          2010-02-23  324  
66b7138f913635 arch/x86/kvm/svm.c     Jan Kiszka          2010-02-23  325  	/*
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  326  	 * Due to architectural shortcomings, the CPU doesn't always provide
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  327  	 * NextRIP, e.g. if KVM intercepted an exception that occurred while
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  328  	 * the CPU was vectoring an INTO/INT3 in the guest.  Temporarily skip
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  329  	 * the instruction even if NextRIP is supported to acquire the next
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  330  	 * RIP so that it can be shoved into the NextRIP field, otherwise
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  331  	 * hardware will fail to advance guest RIP during event injection.
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  332  	 * Drop the exception/interrupt if emulation fails and effectively
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  333  	 * retry the instruction, it's the least awful option.  If NRIPS is
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  334  	 * in use, the skip must not commit any side effects such as clearing
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  335  	 * the interrupt shadow or RFLAGS.RF.
66b7138f913635 arch/x86/kvm/svm.c     Jan Kiszka          2010-02-23  336  	 */
71cc6a9d4228c0 arch/x86/kvm/svm/svm.c Omar Sandoval       2025-10-29  337  	if (!__svm_skip_emulated_instruction(vcpu, emul_type, !nrips))
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  338  		return -EIO;
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  339  
63129754178c55 arch/x86/kvm/svm/svm.c Paolo Bonzini       2021-03-02  340  	rip = kvm_rip_read(vcpu);
3741aec4c38fa4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  341  
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  342  	/*
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  343  	 * Save the injection information, even when using next_rip, as the
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  344  	 * VMCB's next_rip will be lost (cleared on VM-Exit) if the injection
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  345  	 * doesn't complete due to a VM-Exit occurring while the CPU is
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  346  	 * vectoring the event.   Decoding the instruction isn't guaranteed to
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  347  	 * work as there may be no backing instruction, e.g. if the event is
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  348  	 * being injected by L1 for L2, or if the guest is patching INT3 into
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  349  	 * a different instruction.
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  350  	 */
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  351  	svm->soft_int_injected = true;
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  352  	svm->soft_int_csbase = svm->vmcb->save.cs.base;
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  353  	svm->soft_int_old_rip = old_rip;
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  354  	svm->soft_int_next_rip = rip;
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  355  
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  356  	if (nrips)
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  357  		kvm_rip_write(vcpu, old_rip);
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  358  
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  359  	if (static_cpu_has(X86_FEATURE_NRIPS))
3741aec4c38fa4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  360  		svm->vmcb->control.next_rip = rip;
3741aec4c38fa4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  361  
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  362  	return 0;
66b7138f913635 arch/x86/kvm/svm.c     Jan Kiszka          2010-02-23  363  }
66b7138f913635 arch/x86/kvm/svm.c     Jan Kiszka          2010-02-23  364  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
