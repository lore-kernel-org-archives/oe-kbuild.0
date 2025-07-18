Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050A010942
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Jul 2025 11:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752838142; cv=none; b=RMHhOdjsnC6ZLvpyJVm7SC8avJlu26XQxve/EZVU4hR3kideqzD3oF8CcVBDZRVH/xbZNQ8Z/TmgLKer++2UqjkW+VcoGY7P/EIPzpOEYp9GFb9426+ZaShqptHJX7FZqal+/oO+WkjAsPZRR934OYP36iYax+vjg4S5etB9UDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752838142; c=relaxed/simple;
	bh=k2HEN8NlRRuKNTz5NRmnO7+lfgP5g3l1w1WYq94gqc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FrFY2iWdg3x5HV91lgV10mg1KwOkWdOkiORjkaBaBYClUzBevzrZMci0lGfqjfaaGaoJucAUUwAqxjUgoIIC056jbddJMjstlXzf3MYiY2JUQE3u8eaH45zv18lX1y2+qeOHHmF26YH7O9LAAfchrDVFBtW+QZu+dwldtk9g8GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KL5Lwklx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KL5Lwklx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752838140; x=1784374140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k2HEN8NlRRuKNTz5NRmnO7+lfgP5g3l1w1WYq94gqc0=;
  b=KL5LwklxxrsbRI7ahlrf9AtakUgeJToICwZODJglxuuYzTzKypIQtqa+
   YWjPKNV9ZVbOrKW4D8M72B5csnCffrq5MNPlLXd8bjmUYFS/7cRGOW9iW
   HS/0/ijiWCoSaNvv83ibveZZM7/wGOzdHCecYiib+QnfmKXtoNdHP5Or7
   OPQUmrcNOQ23m1V1C+iJSmwQcMn7kLFYsn+EEmxwV+tj0tNw43y+8zxTe
   emsKizK5G+W9INCmZpEBgCQs0N1mcN66P+hrpMHjTWSlQ7YV5Ch0704De
   csNkJXMskuJviFb5h4OvE4EDFJMwjp6Rg4DY2LpGMyo3mYorzY3uvT+ym
   Q==;
X-CSE-ConnectionGUID: OghbKOygT/S1PpbAMuMM4Q==
X-CSE-MsgGUID: J1nGe0KSTeaoyz6MKbdsnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="80574084"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="80574084"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 04:28:59 -0700
X-CSE-ConnectionGUID: ZMa630G2RS2/EjFk0bf4kQ==
X-CSE-MsgGUID: 04Piz+lxTxiIuSQR6R4Mig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="163668963"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Jul 2025 04:28:58 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucjGp-000EbB-1H;
	Fri, 18 Jul 2025 11:28:55 +0000
Date: Fri, 18 Jul 2025 19:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [xinli-intel-fred-public:next 21/23] arch/x86/kvm/vmx/nested.c:2970
 nested_check_vm_entry_controls() warn: bitwise AND condition is false here
Message-ID: <202507181914.C2XaBkiP-lkp@intel.com>
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
commit: d07852189cbf422d211aa437d18d1f3dc3e93a41 [21/23] KVM: nVMX: Add VMCS FRED states checking
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-141-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181914.C2XaBkiP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507181914.C2XaBkiP-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/vmx/nested.c:2970 nested_check_vm_entry_controls() warn: bitwise AND condition is false here
arch/x86/kvm/vmx/nested.c:3309 nested_vmx_check_guest_state() warn: bitwise AND condition is false here

Old smatch warnings:
arch/x86/kvm/vmx/nested.c:4007 vmcs12_save_pending_event() warn: bitwise AND condition is false here
arch/x86/kvm/vmx/nested.c:4827 prepare_vmcs12() warn: bitwise AND condition is false here

vim +2970 arch/x86/kvm/vmx/nested.c

61446ba75e9ad9 Krish Sadhukhan     2018-12-12  2961  
5fbf963400a399 Krish Sadhukhan     2018-12-12  2962  /*
5fbf963400a399 Krish Sadhukhan     2018-12-12  2963   * Checks related to VM-Entry Control Fields
5fbf963400a399 Krish Sadhukhan     2018-12-12  2964   */
5fbf963400a399 Krish Sadhukhan     2018-12-12  2965  static int nested_check_vm_entry_controls(struct kvm_vcpu *vcpu,
461b4ba4c7ad79 Krish Sadhukhan     2018-12-12  2966  					  struct vmcs12 *vmcs12)
461b4ba4c7ad79 Krish Sadhukhan     2018-12-12  2967  {
461b4ba4c7ad79 Krish Sadhukhan     2018-12-12  2968  	struct vcpu_vmx *vmx = to_vmx(vcpu);
d07852189cbf42 Xin Li              2023-06-04  2969  	bool fred_enabled = (vmcs12->vm_entry_controls & VM_ENTRY_IA32E_MODE) &&
d07852189cbf42 Xin Li              2023-06-04 @2970  			    (vmcs12->guest_cr4 & X86_CR4_FRED);
55d2375e58a61b Sean Christopherson 2018-12-03  2971  
5497b95567c1b7 Sean Christopherson 2019-07-11  2972  	if (CC(!vmx_control_verify(vmcs12->vm_entry_controls,
461b4ba4c7ad79 Krish Sadhukhan     2018-12-12  2973  				    vmx->nested.msrs.entry_ctls_low,
5497b95567c1b7 Sean Christopherson 2019-07-11  2974  				    vmx->nested.msrs.entry_ctls_high)))
5fbf963400a399 Krish Sadhukhan     2018-12-12  2975  		return -EINVAL;
55d2375e58a61b Sean Christopherson 2018-12-03  2976  
55d2375e58a61b Sean Christopherson 2018-12-03  2977  	/*
55d2375e58a61b Sean Christopherson 2018-12-03  2978  	 * From the Intel SDM, volume 3:
55d2375e58a61b Sean Christopherson 2018-12-03  2979  	 * Fields relevant to VM-entry event injection must be set properly.
55d2375e58a61b Sean Christopherson 2018-12-03  2980  	 * These fields are the VM-entry interruption-information field, the
55d2375e58a61b Sean Christopherson 2018-12-03  2981  	 * VM-entry exception error code, and the VM-entry instruction length.
55d2375e58a61b Sean Christopherson 2018-12-03  2982  	 */
55d2375e58a61b Sean Christopherson 2018-12-03  2983  	if (vmcs12->vm_entry_intr_info_field & INTR_INFO_VALID_MASK) {
55d2375e58a61b Sean Christopherson 2018-12-03  2984  		u32 intr_info = vmcs12->vm_entry_intr_info_field;
55d2375e58a61b Sean Christopherson 2018-12-03  2985  		u8 vector = intr_info & INTR_INFO_VECTOR_MASK;
55d2375e58a61b Sean Christopherson 2018-12-03  2986  		u32 intr_type = intr_info & INTR_INFO_INTR_TYPE_MASK;
55d2375e58a61b Sean Christopherson 2018-12-03  2987  		bool has_error_code = intr_info & INTR_INFO_DELIVER_CODE_MASK;
55d2375e58a61b Sean Christopherson 2018-12-03  2988  		bool should_have_error_code;
d07852189cbf42 Xin Li              2023-06-04  2989  		bool has_nested_exception = vmx->nested.msrs.basic & VMX_BASIC_NESTED_EXCEPTION;
55d2375e58a61b Sean Christopherson 2018-12-03  2990  		bool urg = nested_cpu_has2(vmcs12,
55d2375e58a61b Sean Christopherson 2018-12-03  2991  					   SECONDARY_EXEC_UNRESTRICTED_GUEST);
55d2375e58a61b Sean Christopherson 2018-12-03  2992  		bool prot_mode = !urg || vmcs12->guest_cr0 & X86_CR0_PE;
55d2375e58a61b Sean Christopherson 2018-12-03  2993  
55d2375e58a61b Sean Christopherson 2018-12-03  2994  		/* VM-entry interruption-info field: interruption type */
5497b95567c1b7 Sean Christopherson 2019-07-11  2995  		if (CC(intr_type == INTR_TYPE_RESERVED) ||
5497b95567c1b7 Sean Christopherson 2019-07-11  2996  		    CC(intr_type == INTR_TYPE_OTHER_EVENT &&
55d2375e58a61b Sean Christopherson 2018-12-03  2997  		       !nested_cpu_supports_monitor_trap_flag(vcpu)))
5fbf963400a399 Krish Sadhukhan     2018-12-12  2998  			return -EINVAL;
55d2375e58a61b Sean Christopherson 2018-12-03  2999  
55d2375e58a61b Sean Christopherson 2018-12-03  3000  		/* VM-entry interruption-info field: vector */
5497b95567c1b7 Sean Christopherson 2019-07-11  3001  		if (CC(intr_type == INTR_TYPE_NMI_INTR && vector != NMI_VECTOR) ||
5497b95567c1b7 Sean Christopherson 2019-07-11  3002  		    CC(intr_type == INTR_TYPE_HARD_EXCEPTION && vector > 31) ||
d07852189cbf42 Xin Li              2023-06-04  3003  		    CC(intr_type == INTR_TYPE_OTHER_EVENT &&
d07852189cbf42 Xin Li              2023-06-04  3004  		       ((!fred_enabled && vector > 0) ||
d07852189cbf42 Xin Li              2023-06-04  3005  		        (fred_enabled && vector > 2))))
5fbf963400a399 Krish Sadhukhan     2018-12-12  3006  			return -EINVAL;
55d2375e58a61b Sean Christopherson 2018-12-03  3007  
55d2375e58a61b Sean Christopherson 2018-12-03  3008  		/* VM-entry interruption-info field: deliver error code */
55d2375e58a61b Sean Christopherson 2018-12-03  3009  		should_have_error_code =
55d2375e58a61b Sean Christopherson 2018-12-03  3010  			intr_type == INTR_TYPE_HARD_EXCEPTION && prot_mode &&
55d2375e58a61b Sean Christopherson 2018-12-03  3011  			x86_exception_has_error_code(vector);
5497b95567c1b7 Sean Christopherson 2019-07-11  3012  		if (CC(has_error_code != should_have_error_code))
5fbf963400a399 Krish Sadhukhan     2018-12-12  3013  			return -EINVAL;
55d2375e58a61b Sean Christopherson 2018-12-03  3014  
55d2375e58a61b Sean Christopherson 2018-12-03  3015  		/* VM-entry exception error code */
5497b95567c1b7 Sean Christopherson 2019-07-11  3016  		if (CC(has_error_code &&
567926cca99ba1 Sean Christopherson 2019-10-01  3017  		       vmcs12->vm_entry_exception_error_code & GENMASK(31, 16)))
5fbf963400a399 Krish Sadhukhan     2018-12-12  3018  			return -EINVAL;
55d2375e58a61b Sean Christopherson 2018-12-03  3019  
55d2375e58a61b Sean Christopherson 2018-12-03  3020  		/* VM-entry interruption-info field: reserved bits */
5497b95567c1b7 Sean Christopherson 2019-07-11  3021  		if (CC(intr_info & INTR_INFO_RESVD_BITS_MASK))
5fbf963400a399 Krish Sadhukhan     2018-12-12  3022  			return -EINVAL;
55d2375e58a61b Sean Christopherson 2018-12-03  3023  
d07852189cbf42 Xin Li              2023-06-04  3024  		/*
d07852189cbf42 Xin Li              2023-06-04  3025  		 * When the CPU enumerates VMX nested-exception support, bit 13
d07852189cbf42 Xin Li              2023-06-04  3026  		 * (set to indicate a nested exception) of the intr info field
d07852189cbf42 Xin Li              2023-06-04  3027  		 * may have value 1. Otherwise bit 13 is reserved.
d07852189cbf42 Xin Li              2023-06-04  3028  		 */
d07852189cbf42 Xin Li              2023-06-04  3029  		if (CC(!has_nested_exception &&
d07852189cbf42 Xin Li              2023-06-04  3030  		       (intr_info & INTR_INFO_NESTED_EXCEPTION_MASK)))
d07852189cbf42 Xin Li              2023-06-04  3031  			return -EINVAL;
d07852189cbf42 Xin Li              2023-06-04  3032  
55d2375e58a61b Sean Christopherson 2018-12-03  3033  		/* VM-entry instruction length */
55d2375e58a61b Sean Christopherson 2018-12-03  3034  		switch (intr_type) {
55d2375e58a61b Sean Christopherson 2018-12-03  3035  		case INTR_TYPE_SOFT_EXCEPTION:
55d2375e58a61b Sean Christopherson 2018-12-03  3036  		case INTR_TYPE_SOFT_INTR:
55d2375e58a61b Sean Christopherson 2018-12-03  3037  		case INTR_TYPE_PRIV_SW_EXCEPTION:
d4aea23fd0ff6d Sean Christopherson 2025-01-31  3038  			if (CC(vmcs12->vm_entry_instruction_len > X86_MAX_INSTRUCTION_LENGTH) ||
5497b95567c1b7 Sean Christopherson 2019-07-11  3039  			    CC(vmcs12->vm_entry_instruction_len == 0 &&
5497b95567c1b7 Sean Christopherson 2019-07-11  3040  			    CC(!nested_cpu_has_zero_length_injection(vcpu))))
5fbf963400a399 Krish Sadhukhan     2018-12-12  3041  				return -EINVAL;
d07852189cbf42 Xin Li              2023-06-04  3042  			break;
d07852189cbf42 Xin Li              2023-06-04  3043  		case INTR_TYPE_OTHER_EVENT:
d07852189cbf42 Xin Li              2023-06-04  3044  			if (fred_enabled && (vector == 1 || vector == 2))
d07852189cbf42 Xin Li              2023-06-04  3045  				if (CC(vmcs12->vm_entry_instruction_len > 15))
d07852189cbf42 Xin Li              2023-06-04  3046  					return -EINVAL;
d07852189cbf42 Xin Li              2023-06-04  3047  			break;
5fbf963400a399 Krish Sadhukhan     2018-12-12  3048  		}
5fbf963400a399 Krish Sadhukhan     2018-12-12  3049  	}
5fbf963400a399 Krish Sadhukhan     2018-12-12  3050  
5fbf963400a399 Krish Sadhukhan     2018-12-12  3051  	if (nested_vmx_check_entry_msr_switch_controls(vcpu, vmcs12))
5fbf963400a399 Krish Sadhukhan     2018-12-12  3052  		return -EINVAL;
5fbf963400a399 Krish Sadhukhan     2018-12-12  3053  
5fbf963400a399 Krish Sadhukhan     2018-12-12  3054  	return 0;
55d2375e58a61b Sean Christopherson 2018-12-03  3055  }
5fbf963400a399 Krish Sadhukhan     2018-12-12  3056  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
