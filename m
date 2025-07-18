Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1C52BD5BB
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Jul 2025 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752835617; cv=none; b=SWLav00n7foWx/vr/yzamrNHRZR/SsUpFnWyNzRiAb9RB7qnVpxeNVDXumtxZCmCNI1Pa55SBhM5a/G9WwwApUnCjz03uU4BOTPdCLpOKx4PtqvNGhGB0cuKLg8k78EjmklX/7R4q6Dhk74FBw1dNZwHo/B9XOwPcVCPkuM5VYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752835617; c=relaxed/simple;
	bh=MOR36QPQl6H2Chzmio0SkUvqp9LGUvi++Uc5KBaSmbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m94XBRkrXrBsQE7aqh0VcuB3s1NpKcbVz2D2VK4IY/qg1uveEz4b4NwXhoF8YG/30Xs1a9SZWufq+wM7Sh3a7maFk6WxRNfJeIv33pSMvyWAH7l83TpUUfbytZ50Zfc/dARzBCwY9Kuf4SQ312sjs79ZnFwiyyuHeZ9hW5CivHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmRYkvF6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmRYkvF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752835615; x=1784371615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MOR36QPQl6H2Chzmio0SkUvqp9LGUvi++Uc5KBaSmbY=;
  b=jmRYkvF6xvGSZcNONaAdta7YeZUvRHagT97fVeuzzdoqYA3r0MiwJgGL
   MN04nUKPP9pwWiyuIJacK2TF2vt7RBj2AL52zffK9LoHX1DNZUkx7fAS8
   c/e3R1ycb7eursJts+FSn54+zfC4x2LQH4MupZ12ReD3UDuXgX1ZmL8w9
   qRSeooobMSPcEsosDiV4oCjjtakUSLnd/k9viMuQ7Y2E0DvrAwo91Sxzu
   nNk/HbAqnE7EX9QgvxaOi2pH3vuMm2I6PXdU62vc0xp7Zy0f4baGfgcr/
   Yg6A/G/wRPsmwIRZjYp4ry3iYBhmbj5DN9yNxAp5HUimD4jmHGmU/RMKF
   w==;
X-CSE-ConnectionGUID: 7GX7M7ppQbCzIMjz9UG/pg==
X-CSE-MsgGUID: FZljQauATo2YyiJDYKdthw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55070013"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="55070013"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 03:46:54 -0700
X-CSE-ConnectionGUID: vbYUL61tS3iMh1+MwUlyHQ==
X-CSE-MsgGUID: vCHkQahTSAmvde1KRIXGzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="157415395"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Jul 2025 03:46:53 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucic6-000EZ3-2N;
	Fri, 18 Jul 2025 10:46:50 +0000
Date: Fri, 18 Jul 2025 18:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [xinli-intel-fred-public:next 20/23] arch/x86/kvm/vmx/nested.c:3929
 vmcs12_save_pending_event() warn: bitwise AND condition is false here
Message-ID: <202507181845.zqDysfM6-lkp@intel.com>
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
TO: Xin3 Li <xin3.li@intel.com>

tree:   https://github.com/xinli-intel/linux-fred-public.git next
head:   783c13faf3d3a6fd683e220f7274aeeffb74a9c1
commit: 5dc3d02c4af495dc296c70b4222bea5293d517dc [20/23] KVM: nVMX: Add FRED VMCS fields to nested VMX context management
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-141-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181845.zqDysfM6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507181845.zqDysfM6-lkp@intel.com/

smatch warnings:
arch/x86/kvm/vmx/nested.c:3929 vmcs12_save_pending_event() warn: bitwise AND condition is false here
arch/x86/kvm/vmx/nested.c:4749 prepare_vmcs12() warn: bitwise AND condition is false here

vim +3929 arch/x86/kvm/vmx/nested.c

55d2375e58a61b Sean Christopherson 2018-12-03  3880  
55d2375e58a61b Sean Christopherson 2018-12-03  3881  static void vmcs12_save_pending_event(struct kvm_vcpu *vcpu,
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3882  				      struct vmcs12 *vmcs12,
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3883  				      u32 vm_exit_reason, u32 exit_intr_info)
55d2375e58a61b Sean Christopherson 2018-12-03  3884  {
55d2375e58a61b Sean Christopherson 2018-12-03  3885  	u32 idt_vectoring;
55d2375e58a61b Sean Christopherson 2018-12-03  3886  	unsigned int nr;
55d2375e58a61b Sean Christopherson 2018-12-03  3887  
5dc3d02c4af495 Xin Li              2022-09-15  3888  	vmcs12->original_event_data = 0;
5dc3d02c4af495 Xin Li              2022-09-15  3889  
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3890  	/*
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3891  	 * Per the SDM, VM-Exits due to double and triple faults are never
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3892  	 * considered to occur during event delivery, even if the double/triple
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3893  	 * fault is the result of an escalating vectoring issue.
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3894  	 *
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3895  	 * Note, the SDM qualifies the double fault behavior with "The original
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3896  	 * event results in a double-fault exception".  It's unclear why the
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3897  	 * qualification exists since exits due to double fault can occur only
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3898  	 * while vectoring a different exception (injected events are never
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3899  	 * subject to interception), i.e. there's _always_ an original event.
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3900  	 *
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3901  	 * The SDM also uses NMI as a confusing example for the "original event
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3902  	 * causes the VM exit directly" clause.  NMI isn't special in any way,
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3903  	 * the same rule applies to all events that cause an exit directly.
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3904  	 * NMI is an odd choice for the example because NMIs can only occur on
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3905  	 * instruction boundaries, i.e. they _can't_ occur during vectoring.
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3906  	 */
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3907  	if ((u16)vm_exit_reason == EXIT_REASON_TRIPLE_FAULT ||
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3908  	    ((u16)vm_exit_reason == EXIT_REASON_EXCEPTION_NMI &&
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3909  	     is_double_fault(exit_intr_info))) {
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3910  		vmcs12->idt_vectoring_info_field = 0;
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3911  	} else if (vcpu->arch.exception.injected) {
d4963e319f1f78 Sean Christopherson 2022-08-30  3912  		nr = vcpu->arch.exception.vector;
55d2375e58a61b Sean Christopherson 2018-12-03  3913  		idt_vectoring = nr | VECTORING_INFO_VALID_MASK;
55d2375e58a61b Sean Christopherson 2018-12-03  3914  
55d2375e58a61b Sean Christopherson 2018-12-03  3915  		if (kvm_exception_is_soft(nr)) {
55d2375e58a61b Sean Christopherson 2018-12-03  3916  			vmcs12->vm_exit_instruction_len =
55d2375e58a61b Sean Christopherson 2018-12-03  3917  				vcpu->arch.event_exit_inst_len;
55d2375e58a61b Sean Christopherson 2018-12-03  3918  			idt_vectoring |= INTR_TYPE_SOFT_EXCEPTION;
55d2375e58a61b Sean Christopherson 2018-12-03  3919  		} else
55d2375e58a61b Sean Christopherson 2018-12-03  3920  			idt_vectoring |= INTR_TYPE_HARD_EXCEPTION;
55d2375e58a61b Sean Christopherson 2018-12-03  3921  
55d2375e58a61b Sean Christopherson 2018-12-03  3922  		if (vcpu->arch.exception.has_error_code) {
55d2375e58a61b Sean Christopherson 2018-12-03  3923  			idt_vectoring |= VECTORING_INFO_DELIVER_CODE_MASK;
55d2375e58a61b Sean Christopherson 2018-12-03  3924  			vmcs12->idt_vectoring_error_code =
55d2375e58a61b Sean Christopherson 2018-12-03  3925  				vcpu->arch.exception.error_code;
55d2375e58a61b Sean Christopherson 2018-12-03  3926  		}
55d2375e58a61b Sean Christopherson 2018-12-03  3927  
5dc3d02c4af495 Xin Li              2022-09-15  3928  		if ((vmcs12->vm_entry_controls & VM_ENTRY_IA32E_MODE) &&
5dc3d02c4af495 Xin Li              2022-09-15 @3929  		    (vmcs12->guest_cr4 & X86_CR4_FRED) &&
5dc3d02c4af495 Xin Li              2022-09-15  3930  		    (vcpu->arch.exception.nested))
5dc3d02c4af495 Xin Li              2022-09-15  3931  			idt_vectoring |= VECTORING_INFO_NESTED_EXCEPTION_MASK;
5dc3d02c4af495 Xin Li              2022-09-15  3932  
5dc3d02c4af495 Xin Li              2022-09-15  3933  		vmcs12->original_event_data = vcpu->arch.exception.event_data;
5dc3d02c4af495 Xin Li              2022-09-15  3934  
55d2375e58a61b Sean Christopherson 2018-12-03  3935  		vmcs12->idt_vectoring_info_field = idt_vectoring;
55d2375e58a61b Sean Christopherson 2018-12-03  3936  	} else if (vcpu->arch.nmi_injected) {
55d2375e58a61b Sean Christopherson 2018-12-03  3937  		vmcs12->idt_vectoring_info_field =
55d2375e58a61b Sean Christopherson 2018-12-03  3938  			INTR_TYPE_NMI_INTR | INTR_INFO_VALID_MASK | NMI_VECTOR;
55d2375e58a61b Sean Christopherson 2018-12-03  3939  	} else if (vcpu->arch.interrupt.injected) {
55d2375e58a61b Sean Christopherson 2018-12-03  3940  		nr = vcpu->arch.interrupt.nr;
55d2375e58a61b Sean Christopherson 2018-12-03  3941  		idt_vectoring = nr | VECTORING_INFO_VALID_MASK;
55d2375e58a61b Sean Christopherson 2018-12-03  3942  
55d2375e58a61b Sean Christopherson 2018-12-03  3943  		if (vcpu->arch.interrupt.soft) {
55d2375e58a61b Sean Christopherson 2018-12-03  3944  			idt_vectoring |= INTR_TYPE_SOFT_INTR;
55d2375e58a61b Sean Christopherson 2018-12-03  3945  			vmcs12->vm_entry_instruction_len =
55d2375e58a61b Sean Christopherson 2018-12-03  3946  				vcpu->arch.event_exit_inst_len;
55d2375e58a61b Sean Christopherson 2018-12-03  3947  		} else
55d2375e58a61b Sean Christopherson 2018-12-03  3948  			idt_vectoring |= INTR_TYPE_EXT_INTR;
55d2375e58a61b Sean Christopherson 2018-12-03  3949  
55d2375e58a61b Sean Christopherson 2018-12-03  3950  		vmcs12->idt_vectoring_info_field = idt_vectoring;
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3951  	} else {
9bd1f0efa859b6 Sean Christopherson 2022-04-07  3952  		vmcs12->idt_vectoring_info_field = 0;
55d2375e58a61b Sean Christopherson 2018-12-03  3953  	}
55d2375e58a61b Sean Christopherson 2018-12-03  3954  }
55d2375e58a61b Sean Christopherson 2018-12-03  3955  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
