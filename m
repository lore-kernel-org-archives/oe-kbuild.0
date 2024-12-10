Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273433C30
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Dec 2024 11:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733830535; cv=none; b=udTi9FQjffTPiG2kFcOjKRs5KLLBIkQLQdWa59S1uvzpkBgpmBNQI2vIPKur6zx4G2znGySmdq0EtEXMmV/a+CX6hLdqA6vg2tiQiN5U/X0Hhw7EHgfD2DcEGZUFiaMS8zN9HPnVjTksqhFRdWXE23CYLfV9amO15aEZV4ZAcXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733830535; c=relaxed/simple;
	bh=VTGmZxWjwt7NMgYBBgo0v6Sn1YPfebcY94fi3vhRZwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LD/V7sclypZf7VK18PbokVq3DJuE3PIBMkbleIYu6ShrPGlHt+Nx1zypeGz2bF8+jeaUzG7+8LiZSI3K8yQt8NLwojjD2LsxU+VDx6Eno12y26Ly4bwF8ePTSiR5im8EN8xj6q19kWO6jvVcUGNj5HN6LbSog/T8UoPFiydwYtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CfjKl/dc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CfjKl/dc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733830533; x=1765366533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VTGmZxWjwt7NMgYBBgo0v6Sn1YPfebcY94fi3vhRZwA=;
  b=CfjKl/dc5w850Rl5GCIe+E6uuktuOwtV1bF9XZ6vGNXSqEGbjowOi79v
   /ZV8QKRNDwodFOnwxrOUM2zxipQpgVcp3IBMla8gwFZNOr84DHT0byKH3
   NCNETbweB3Xd9UtoqUFDZGWJn4TXgFM8d/clppjNIPMrwxDYVwcN9TUW4
   ewUeK7GcmRv3Swc/UkFsBF99C4vuWNeOq37so63kyG/6wzXDBr3TncyGG
   0t+5FEGk9Qst37H/MQlZcrIHfJKwWrVmeDx77NMsXJ1QQ/MtpWFq4BPn3
   JCNAlYrbJ49IkTP0dUGcrDmOhWtKM3pYJn7TKKrNFsaCO4+LlL6nueo2z
   g==;
X-CSE-ConnectionGUID: XLbmjn5qT1aa/C3KNIcqNA==
X-CSE-MsgGUID: w6298hCvTNK7KdEJTQ9/kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="37953211"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="37953211"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 03:35:33 -0800
X-CSE-ConnectionGUID: 80Ao4e/PRxKeGCZfluHq6w==
X-CSE-MsgGUID: Vmjm6A5ZSB2KO271QCn/yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95206416"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Dec 2024 03:35:32 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKyWX-0005TT-0d;
	Tue, 10 Dec 2024 11:35:29 +0000
Date: Tue, 10 Dec 2024 19:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/emulate-nested.c:2209 kvm_emulate_nested_eret()
 error: uninitialized symbol 'elr'.
Message-ID: <202412101932.Ydls7pED-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Marc Zyngier <maz@kernel.org>
CC: Joey Gouly <joey.gouly@arm.com>
CC: Oliver Upton <oliver.upton@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7cb1b466315004af98f6ba6c2546bb713ca3c237
commit: 213b3d1ea1612c6d26153be446923831c4534689 KVM: arm64: nv: Handle ERETA[AB] instructions
date:   8 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241210/202412101932.Ydls7pED-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412101932.Ydls7pED-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/emulate-nested.c:2209 kvm_emulate_nested_eret() error: uninitialized symbol 'elr'.

Old smatch warnings:
arch/arm64/kvm/emulate-nested.c:2082 triage_sysreg_trap() error: uninitialized symbol 'val'.

vim +/elr +2209 arch/arm64/kvm/emulate-nested.c

47f3a2fc765ae27 Jintack Lim  2023-02-09  2172  
47f3a2fc765ae27 Jintack Lim  2023-02-09  2173  void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
47f3a2fc765ae27 Jintack Lim  2023-02-09  2174  {
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2175  	u64 spsr, elr, esr;
47f3a2fc765ae27 Jintack Lim  2023-02-09  2176  
95537f06b9e8267 Marc Zyngier 2024-04-19  2177  	/*
95537f06b9e8267 Marc Zyngier 2024-04-19  2178  	 * Forward this trap to the virtual EL2 if the virtual
95537f06b9e8267 Marc Zyngier 2024-04-19  2179  	 * HCR_EL2.NV bit is set and this is coming from !EL2.
95537f06b9e8267 Marc Zyngier 2024-04-19  2180  	 */
95537f06b9e8267 Marc Zyngier 2024-04-19  2181  	if (forward_traps(vcpu, HCR_NV))
95537f06b9e8267 Marc Zyngier 2024-04-19  2182  		return;
95537f06b9e8267 Marc Zyngier 2024-04-19  2183  
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2184  	/* Check for an ERETAx */
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2185  	esr = kvm_vcpu_get_esr(vcpu);
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2186  	if (esr_iss_is_eretax(esr) && !kvm_auth_eretax(vcpu, &elr)) {
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2187  		/*
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2188  		 * Oh no, ERETAx failed to authenticate.  If we have
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2189  		 * FPACCOMBINE, deliver an exception right away.  If we
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2190  		 * don't, then let the mangled ELR value trickle down the
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2191  		 * ERET handling, and the guest will have a little surprise.
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2192  		 */
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2193  		if (kvm_has_pauth(vcpu->kvm, FPACCOMBINE)) {
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2194  			esr &= ESR_ELx_ERET_ISS_ERETA;
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2195  			esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_FPAC);
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2196  			kvm_inject_nested_sync(vcpu, esr);
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2197  			return;
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2198  		}
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2199  	}
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2200  
47f3a2fc765ae27 Jintack Lim  2023-02-09  2201  	preempt_disable();
47f3a2fc765ae27 Jintack Lim  2023-02-09  2202  	kvm_arch_vcpu_put(vcpu);
47f3a2fc765ae27 Jintack Lim  2023-02-09  2203  
dd0717a998f77f4 Marc Zyngier 2024-04-19  2204  	spsr = __vcpu_sys_reg(vcpu, SPSR_EL2);
dd0717a998f77f4 Marc Zyngier 2024-04-19  2205  	spsr = kvm_check_illegal_exception_return(vcpu, spsr);
213b3d1ea1612c6 Marc Zyngier 2024-04-19  2206  	if (!esr_iss_is_eretax(esr))
47f3a2fc765ae27 Jintack Lim  2023-02-09  2207  		elr = __vcpu_sys_reg(vcpu, ELR_EL2);
47f3a2fc765ae27 Jintack Lim  2023-02-09  2208  
47f3a2fc765ae27 Jintack Lim  2023-02-09 @2209  	trace_kvm_nested_eret(vcpu, elr, spsr);
47f3a2fc765ae27 Jintack Lim  2023-02-09  2210  
47f3a2fc765ae27 Jintack Lim  2023-02-09  2211  	/*
47f3a2fc765ae27 Jintack Lim  2023-02-09  2212  	 * Note that the current exception level is always the virtual EL2,
47f3a2fc765ae27 Jintack Lim  2023-02-09  2213  	 * since we set HCR_EL2.NV bit only when entering the virtual EL2.
47f3a2fc765ae27 Jintack Lim  2023-02-09  2214  	 */
47f3a2fc765ae27 Jintack Lim  2023-02-09  2215  	*vcpu_pc(vcpu) = elr;
47f3a2fc765ae27 Jintack Lim  2023-02-09  2216  	*vcpu_cpsr(vcpu) = spsr;
47f3a2fc765ae27 Jintack Lim  2023-02-09  2217  
47f3a2fc765ae27 Jintack Lim  2023-02-09  2218  	kvm_arch_vcpu_load(vcpu, smp_processor_id());
47f3a2fc765ae27 Jintack Lim  2023-02-09  2219  	preempt_enable();
47f3a2fc765ae27 Jintack Lim  2023-02-09  2220  }
47f3a2fc765ae27 Jintack Lim  2023-02-09  2221  

:::::: The code at line 2209 was first introduced by commit
:::::: 47f3a2fc765ae2719e6daf39c0a1c757934b152e KVM: arm64: nv: Support virtual EL2 exceptions

:::::: TO: Jintack Lim <jintack.lim@linaro.org>
:::::: CC: Oliver Upton <oliver.upton@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
