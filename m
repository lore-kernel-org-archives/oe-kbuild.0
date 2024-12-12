Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E10259483
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 07:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733989680; cv=none; b=XcHKE64YYoiOkAxWoHgJ+HQTAxCZKEiKo5et/X1fy8laumk82DNBmw67wQqTB+gB7SiGajQ0uUV4Gku/P7tI5xdrTx7tVKVke+2w+CaydlMLOCCLemWCp1y8tRGSGCPg30gTEQD2o/b0xgCnUISZI4K97B0B6pBYqxJWQ7P5sMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733989680; c=relaxed/simple;
	bh=woDBjJAUpjXQSTNSFYeT3Ddo+h8jCuZRoh6NjHIJfsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BHUqnFpJqNMmI39BncLeRuL4dL7wHFZx6dgc4Wc56yIfB5wQ8VJ15B1mV8CnpqNgG4oe/PmW2XgrzuTO4vEYQTp+Pt7fT80QIHF2Np7L5HGzgmO2p3hQ6d59m0v8tYZaW5I89WYZJ8oEjS0jZBCLKVyLWVzuegfQvAZN/WPY5f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4rWf/TE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4rWf/TE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733989678; x=1765525678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=woDBjJAUpjXQSTNSFYeT3Ddo+h8jCuZRoh6NjHIJfsI=;
  b=N4rWf/TEqn2kFj48SW8eqN+6pP9U/E4jfpEupp+QBdHuSHtFJQat88B3
   G0qAwv6neKBus6p3DZD7LmRADtiM3wyfCrErYVIIvT+Hdd8OdeStJiuHP
   lmUF7WFHx7Ss+IV2mteUXqBiDk0zBN/aHJgENHEvCKRKhfiZIhFu1Yzcv
   OtlAp2Xox4w0rCT7pB3WNlPZuSaZoMRMvqsp+ymA1DLecjlxUBX74VmhG
   VBWDayko+wERf6M6JvjvXMBHGsjSfjRQHltJxUuL/4upuK1E95CljQGCX
   1999C+0mYzIj67sArsgJ5WvZQZAnHBpRgDavKrKxnVpy+rcH9ypVqkW6G
   w==;
X-CSE-ConnectionGUID: qMj/hUyoQGuhhVQyKga7ww==
X-CSE-MsgGUID: dXZeqzgdT12pACwrg7xC0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34638411"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34638411"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 23:47:57 -0800
X-CSE-ConnectionGUID: fVHrfEnySdaYW7i9QQyqyg==
X-CSE-MsgGUID: B/EM9KdqSeyqDtM4LGeg1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101110356"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Dec 2024 23:47:56 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLdvN-0007b2-0g;
	Thu, 12 Dec 2024 07:47:53 +0000
Date: Thu, 12 Dec 2024 15:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/emulate-nested.c:2209 kvm_emulate_nested_eret()
 error: uninitialized symbol 'elr'.
Message-ID: <202412121518.JIQvH1DQ-lkp@intel.com>
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
head:   231825b2e1ff6ba799c5eaf396d3ab2354e37c6b
commit: 213b3d1ea1612c6d26153be446923831c4534689 KVM: arm64: nv: Handle ERETA[AB] instructions
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241212/202412121518.JIQvH1DQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412121518.JIQvH1DQ-lkp@intel.com/

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
