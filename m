Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4691C07D4
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728998366; cv=none; b=XYNJZ/SYtEf4jMd5uvU8avZw3g1k0rnaLR2r8tbDqTlAvrgoQK2VoJhbm8PJ/yU9JzaD3I9ce20B13LWLenq7KwgMoI9Rmvtlm+9iSsJJNH2M1RypnEmbHQi00tCUZU6EJjiysPkuBLxwuJoYEc8plEq7DEDIvfb/DEU0wow5xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728998366; c=relaxed/simple;
	bh=WYTdtf8b/qru9myQZAxZrpi/xKuYqWN42NwDiymcpl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SaowUoIiTrLumV4g9D251B/R7QO8EuGShq03kp78mJyHIPLdDZFkD3EEo832TS3OIiUdiFDhAwj9wpml34plJrlA3ueFFrxn+BkBexBaq5m0W7+06X+itEDyelz8CLktkctkWztl5V+lOX0U1K7Kt17uFxeYGRST5FTVfAtApuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2vuTsTJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2vuTsTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728998365; x=1760534365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WYTdtf8b/qru9myQZAxZrpi/xKuYqWN42NwDiymcpl0=;
  b=U2vuTsTJMON845yHPq1SBHaR548NmfEU9oyS5HhYT7bKfh6Hdyn4962I
   n57iImna6LfHSwklaDOv/rygQAIpIhT5TWxhrynCzBB8t0G2ioMoLCGzk
   ib8cvRmr3VosyVFGK0HJgDhoPtVDsaQJrRA4vS05gCRx8pR6o+uDC2uJZ
   D2vnLbBs3RAhvOtmKwBAB3/U8Nu02s6fSRgJaupaSaGvs6GKtNbaEgYZa
   JB34U9dPf6OxRPCTc3Sr7SpYkGkBV3cad/rYboCOc1KgehKBLVTxidnOg
   A0nzH0ulZB6z7WYg8OEjOg0i6uRq1KlGAnwSW7uHvStXG84HGFIANoW9k
   Q==;
X-CSE-ConnectionGUID: sYyPlmDlQny57AYYaUIqyw==
X-CSE-MsgGUID: sD2X7G7yS7SRgX7hO5Hheg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39766149"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="39766149"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 06:19:24 -0700
X-CSE-ConnectionGUID: tNO/rprsQPG04Bem0v1ehQ==
X-CSE-MsgGUID: Kyf7eBvHReGRywuh86d/WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="77507540"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Oct 2024 06:19:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0hSL-000JGT-04;
	Tue, 15 Oct 2024 13:19:21 +0000
Date: Tue, 15 Oct 2024 21:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/emulate-nested.c:2209 kvm_emulate_nested_eret()
 error: uninitialized symbol 'elr'.
Message-ID: <202410152147.a5ohQcjr-lkp@intel.com>
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
head:   eca631b8fe808748d7585059c4307005ca5c5820
commit: 213b3d1ea1612c6d26153be446923831c4534689 KVM: arm64: nv: Handle ERETA[AB] instructions
date:   6 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241015/202410152147.a5ohQcjr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410152147.a5ohQcjr-lkp@intel.com/

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
