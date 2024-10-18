Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4778A18452C
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729242262; cv=none; b=WHcFUSEsMuIxoPYA0t+2xFUxzff4GS3Ki/OvAwpKCZAQBGe7LYOmYz9Ss70V9ywEN7OP5B5nHYfJHcfhDzDj6c4nThta5iUIqwxdtpUU4GS1uMK2AhmatBgY1OwBOmUhKseikS4L+6qQSxMTvAIODX5E9AnqUb1hKCnALDGqxN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729242262; c=relaxed/simple;
	bh=SekMcgZJSzqa5oYuSDHFtKr25G1uyq/au4/1+rSqWWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tLLFMKCbcFnpbdrEkdiNGMv1NpJqgGxELKm9ntwgH8KBrwAjTNl1ANPsEHU6j4Qvh7nCsBBABG6EXLYDkNfGFWlHHrXcsWYJ6FUoHAPdy4GwteXfjA6Omt6CPDf8aIU3nT3KXhiP8QP8mOu8aT3/pb/U5Ca2pSvOsRlyCM2QAJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ah7HcOvJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ah7HcOvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729242261; x=1760778261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SekMcgZJSzqa5oYuSDHFtKr25G1uyq/au4/1+rSqWWY=;
  b=ah7HcOvJxKIM6PZcdPxHoN2fQ3Q288DUoB6LthMf1pEbu7gx5AVbNTVB
   iLQSJd7dV7EdxfVwZhXO0jpg9dP1s8I8Sk3BNy+651BJpIIko7XNx/0A9
   jBca1mgdebkVhG+vWBWDeDXx4EDh+nd59Uv5SlF64B76uAESW/zgZzaM7
   ZDpWt9bpjFX5RzXjq4hirgUjEDG5HBWN0iIH9GjLS1af+UU8WMBzXbI3+
   GvK2EpvklciQE/G2/KTYSNiqlNH7ADJk0kbAtRSItDsCxiBY4Mmli1s1x
   LCUqqJTK9IaWO/HqPDTvOwTVxpv6q6pHiFuqSnkHZpEuWMjje4n7Ou0u+
   Q==;
X-CSE-ConnectionGUID: TQNqk6uAS02yNMYF8ZpYGA==
X-CSE-MsgGUID: HssC/W+NQV6bxQwdjPx5aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28858105"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28858105"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 02:04:20 -0700
X-CSE-ConnectionGUID: LTgaw8hAT/qWVm3QonIClA==
X-CSE-MsgGUID: II5S/slGR62jYBOnF53aKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="109621912"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Oct 2024 02:04:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1iu8-000NUo-0m;
	Fri, 18 Oct 2024 09:04:16 +0000
Date: Fri, 18 Oct 2024 17:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/emulate-nested.c:2209 kvm_emulate_nested_eret()
 error: uninitialized symbol 'elr'.
Message-ID: <202410181703.fHHsyDW0-lkp@intel.com>
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
head:   4d939780b70592e0f4bc6c397e52e518f8fb7916
commit: 213b3d1ea1612c6d26153be446923831c4534689 KVM: arm64: nv: Handle ERETA[AB] instructions
date:   6 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241018/202410181703.fHHsyDW0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410181703.fHHsyDW0-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/emulate-nested.c:2209 kvm_emulate_nested_eret() error: uninitialized symbol 'elr'.

Old smatch warnings:
arch/arm64/kvm/emulate-nested.c:2082 triage_sysreg_trap() error: uninitialized symbol 'val'.

vim +/elr +2209 arch/arm64/kvm/emulate-nested.c

47f3a2fc765ae2 Jintack Lim  2023-02-09  2172  
47f3a2fc765ae2 Jintack Lim  2023-02-09  2173  void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
47f3a2fc765ae2 Jintack Lim  2023-02-09  2174  {
213b3d1ea1612c Marc Zyngier 2024-04-19  2175  	u64 spsr, elr, esr;
47f3a2fc765ae2 Jintack Lim  2023-02-09  2176  
95537f06b9e826 Marc Zyngier 2024-04-19  2177  	/*
95537f06b9e826 Marc Zyngier 2024-04-19  2178  	 * Forward this trap to the virtual EL2 if the virtual
95537f06b9e826 Marc Zyngier 2024-04-19  2179  	 * HCR_EL2.NV bit is set and this is coming from !EL2.
95537f06b9e826 Marc Zyngier 2024-04-19  2180  	 */
95537f06b9e826 Marc Zyngier 2024-04-19  2181  	if (forward_traps(vcpu, HCR_NV))
95537f06b9e826 Marc Zyngier 2024-04-19  2182  		return;
95537f06b9e826 Marc Zyngier 2024-04-19  2183  
213b3d1ea1612c Marc Zyngier 2024-04-19  2184  	/* Check for an ERETAx */
213b3d1ea1612c Marc Zyngier 2024-04-19  2185  	esr = kvm_vcpu_get_esr(vcpu);
213b3d1ea1612c Marc Zyngier 2024-04-19  2186  	if (esr_iss_is_eretax(esr) && !kvm_auth_eretax(vcpu, &elr)) {
213b3d1ea1612c Marc Zyngier 2024-04-19  2187  		/*
213b3d1ea1612c Marc Zyngier 2024-04-19  2188  		 * Oh no, ERETAx failed to authenticate.  If we have
213b3d1ea1612c Marc Zyngier 2024-04-19  2189  		 * FPACCOMBINE, deliver an exception right away.  If we
213b3d1ea1612c Marc Zyngier 2024-04-19  2190  		 * don't, then let the mangled ELR value trickle down the
213b3d1ea1612c Marc Zyngier 2024-04-19  2191  		 * ERET handling, and the guest will have a little surprise.
213b3d1ea1612c Marc Zyngier 2024-04-19  2192  		 */
213b3d1ea1612c Marc Zyngier 2024-04-19  2193  		if (kvm_has_pauth(vcpu->kvm, FPACCOMBINE)) {
213b3d1ea1612c Marc Zyngier 2024-04-19  2194  			esr &= ESR_ELx_ERET_ISS_ERETA;
213b3d1ea1612c Marc Zyngier 2024-04-19  2195  			esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_FPAC);
213b3d1ea1612c Marc Zyngier 2024-04-19  2196  			kvm_inject_nested_sync(vcpu, esr);
213b3d1ea1612c Marc Zyngier 2024-04-19  2197  			return;
213b3d1ea1612c Marc Zyngier 2024-04-19  2198  		}
213b3d1ea1612c Marc Zyngier 2024-04-19  2199  	}
213b3d1ea1612c Marc Zyngier 2024-04-19  2200  
47f3a2fc765ae2 Jintack Lim  2023-02-09  2201  	preempt_disable();
47f3a2fc765ae2 Jintack Lim  2023-02-09  2202  	kvm_arch_vcpu_put(vcpu);
47f3a2fc765ae2 Jintack Lim  2023-02-09  2203  
dd0717a998f77f Marc Zyngier 2024-04-19  2204  	spsr = __vcpu_sys_reg(vcpu, SPSR_EL2);
dd0717a998f77f Marc Zyngier 2024-04-19  2205  	spsr = kvm_check_illegal_exception_return(vcpu, spsr);
213b3d1ea1612c Marc Zyngier 2024-04-19  2206  	if (!esr_iss_is_eretax(esr))
47f3a2fc765ae2 Jintack Lim  2023-02-09  2207  		elr = __vcpu_sys_reg(vcpu, ELR_EL2);
47f3a2fc765ae2 Jintack Lim  2023-02-09  2208  
47f3a2fc765ae2 Jintack Lim  2023-02-09 @2209  	trace_kvm_nested_eret(vcpu, elr, spsr);
47f3a2fc765ae2 Jintack Lim  2023-02-09  2210  
47f3a2fc765ae2 Jintack Lim  2023-02-09  2211  	/*
47f3a2fc765ae2 Jintack Lim  2023-02-09  2212  	 * Note that the current exception level is always the virtual EL2,
47f3a2fc765ae2 Jintack Lim  2023-02-09  2213  	 * since we set HCR_EL2.NV bit only when entering the virtual EL2.
47f3a2fc765ae2 Jintack Lim  2023-02-09  2214  	 */
47f3a2fc765ae2 Jintack Lim  2023-02-09  2215  	*vcpu_pc(vcpu) = elr;
47f3a2fc765ae2 Jintack Lim  2023-02-09  2216  	*vcpu_cpsr(vcpu) = spsr;
47f3a2fc765ae2 Jintack Lim  2023-02-09  2217  
47f3a2fc765ae2 Jintack Lim  2023-02-09  2218  	kvm_arch_vcpu_load(vcpu, smp_processor_id());
47f3a2fc765ae2 Jintack Lim  2023-02-09  2219  	preempt_enable();
47f3a2fc765ae2 Jintack Lim  2023-02-09  2220  }
47f3a2fc765ae2 Jintack Lim  2023-02-09  2221  

:::::: The code at line 2209 was first introduced by commit
:::::: 47f3a2fc765ae2719e6daf39c0a1c757934b152e KVM: arm64: nv: Support virtual EL2 exceptions

:::::: TO: Jintack Lim <jintack.lim@linaro.org>
:::::: CC: Oliver Upton <oliver.upton@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
