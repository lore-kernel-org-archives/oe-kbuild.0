Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83061137E
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Oct 2024 02:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729303223; cv=none; b=AGjJZPOEqm0tNauBgsMnvTcSRaQFtiT1P0urrIbvEEo9Z7xRodCKMBs30di53H0YcefSJgGj6gOirPt6vwZXrFz91wIKemqls4y8/W9Ppk8rOkaDmmTjRhT5TlP62xT29/Q85sc5zW/BqdQRiABL29PSRkQsRGEtSqfOQ/5axYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729303223; c=relaxed/simple;
	bh=boaZNA3ChqTRCKruw9zDPZ9sWUwt/E+UjTo721hHLa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mh1jtkycFSOkp8YV/LpwXtP7XmmaYPPO/hxNOwXaqopqGHlzzt2J3zSGNMQC7q6eZDQHlD/3LAFv/LiizEvs/5V6bZWeYE7SC2YQzlE/R3rpLEaoDvXshPVaMAqoSAb/vTPloX3Hth5fv2Lw+u3QIOcYeqjqaUyf7goQjrCCaGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A017MWJf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A017MWJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729303220; x=1760839220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=boaZNA3ChqTRCKruw9zDPZ9sWUwt/E+UjTo721hHLa8=;
  b=A017MWJfRfch7YZhfKABYgQafa38QqxZzF7s/Pe3fcgr0nOdCWYl6rlL
   8t0bMKc6vgqVFArT6GECm8cjK/RC7fcKfaDj9bc9yZ8EqoLS3HSy2r0Uw
   ypzFCKnlMleZQoWm0ef4VoDu3Y8K7mdT7r4YlDu76Jll2cTtPUR2RgpSt
   CGkO4TzuvKa7Q87W3J8+1Sfdq1lTNr6yoPhpMC2ceOQjgoicQWt/Hfp2W
   u5subGs88tuGm5HsHbuh5mAXib8l3xP1GF1SYW0vo1yVB03QZXoFEIR9Z
   WBuVpEOrDxl5XwqblhWVueUj6zzdINTDTACRF0Y11M3Shcp8aPb5WBJjE
   w==;
X-CSE-ConnectionGUID: 7Qe3KCjHQO+BRbx2jp8DCg==
X-CSE-MsgGUID: p5i57WwqTSWxdZOEXwbZjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28730980"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="28730980"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 19:00:19 -0700
X-CSE-ConnectionGUID: Fr7w2YgxS3yLf/yYZWe0BA==
X-CSE-MsgGUID: U2/CGweZRPCQzQmvEaCxwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="84091633"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Oct 2024 19:00:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1ylL-000OZt-0G;
	Sat, 19 Oct 2024 02:00:15 +0000
Date: Sat, 19 Oct 2024 09:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/emulate-nested.c:2083 triage_sysreg_trap() error:
 uninitialized symbol 'val'.
Message-ID: <202410190942.4R1LJkf1-lkp@intel.com>
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
CC: Oliver Upton <oliver.upton@linux.dev>
CC: Joey Gouly <joey.gouly@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dbafeddb9524bd459592f92432b90dd7c0b79568
commit: 085eabaa74a12345b7dd083b160519fe3a52f2ce KVM: arm64: Rename __check_nv_sr_forward() to triage_sysreg_trap()
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241019/202410190942.4R1LJkf1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410190942.4R1LJkf1-lkp@intel.com/

smatch warnings:
arch/arm64/kvm/emulate-nested.c:2083 triage_sysreg_trap() error: uninitialized symbol 'val'.

vim +/val +2083 arch/arm64/kvm/emulate-nested.c

15b4d82d69d7b0 Marc Zyngier 2023-08-15  2009  
085eabaa74a123 Marc Zyngier 2024-02-14  2010  bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
e58ec47bf68d2b Marc Zyngier 2023-08-15  2011  {
e58ec47bf68d2b Marc Zyngier 2023-08-15  2012  	union trap_config tc;
e58ec47bf68d2b Marc Zyngier 2023-08-15  2013  	enum trap_behaviour b;
e58ec47bf68d2b Marc Zyngier 2023-08-15  2014  	bool is_read;
e58ec47bf68d2b Marc Zyngier 2023-08-15  2015  	u32 sysreg;
15b4d82d69d7b0 Marc Zyngier 2023-08-15  2016  	u64 esr, val;
e58ec47bf68d2b Marc Zyngier 2023-08-15  2017  
e58ec47bf68d2b Marc Zyngier 2023-08-15  2018  	esr = kvm_vcpu_get_esr(vcpu);
e58ec47bf68d2b Marc Zyngier 2023-08-15  2019  	sysreg = esr_sys64_to_sysreg(esr);
e58ec47bf68d2b Marc Zyngier 2023-08-15  2020  	is_read = (esr & ESR_ELx_SYS64_ISS_DIR_MASK) == ESR_ELx_SYS64_ISS_DIR_READ;
e58ec47bf68d2b Marc Zyngier 2023-08-15  2021  
e58ec47bf68d2b Marc Zyngier 2023-08-15  2022  	tc = get_trap_config(sysreg);
e58ec47bf68d2b Marc Zyngier 2023-08-15  2023  
e58ec47bf68d2b Marc Zyngier 2023-08-15  2024  	/*
e58ec47bf68d2b Marc Zyngier 2023-08-15  2025  	 * A value of 0 for the whole entry means that we know nothing
e58ec47bf68d2b Marc Zyngier 2023-08-15  2026  	 * for this sysreg, and that it cannot be re-injected into the
e58ec47bf68d2b Marc Zyngier 2023-08-15  2027  	 * nested hypervisor. In this situation, let's cut it short.
e58ec47bf68d2b Marc Zyngier 2023-08-15  2028  	 */
e58ec47bf68d2b Marc Zyngier 2023-08-15  2029  	if (!tc.val)
cc5f84fbb008ff Marc Zyngier 2024-02-14  2030  		goto local;
cc5f84fbb008ff Marc Zyngier 2024-02-14  2031  
cc5f84fbb008ff Marc Zyngier 2024-02-14  2032  	/*
cc5f84fbb008ff Marc Zyngier 2024-02-14  2033  	 * If we're not nesting, immediately return to the caller, with the
cc5f84fbb008ff Marc Zyngier 2024-02-14  2034  	 * sysreg index, should we have it.
cc5f84fbb008ff Marc Zyngier 2024-02-14  2035  	 */
cc5f84fbb008ff Marc Zyngier 2024-02-14  2036  	if (!vcpu_has_nv(vcpu) || is_hyp_ctxt(vcpu))
cc5f84fbb008ff Marc Zyngier 2024-02-14  2037  		goto local;
e58ec47bf68d2b Marc Zyngier 2023-08-15  2038  
15b4d82d69d7b0 Marc Zyngier 2023-08-15  2039  	switch ((enum fgt_group_id)tc.fgt) {
15b4d82d69d7b0 Marc Zyngier 2023-08-15  2040  	case __NO_FGT_GROUP__:
15b4d82d69d7b0 Marc Zyngier 2023-08-15  2041  		break;
15b4d82d69d7b0 Marc Zyngier 2023-08-15  2042  
5a24ea78698572 Marc Zyngier 2023-08-15  2043  	case HFGxTR_GROUP:
5a24ea78698572 Marc Zyngier 2023-08-15  2044  		if (is_read)
76b457a5cdeae4 Marc Zyngier 2024-02-14  2045  			val = __vcpu_sys_reg(vcpu, HFGRTR_EL2);
5a24ea78698572 Marc Zyngier 2023-08-15  2046  		else
76b457a5cdeae4 Marc Zyngier 2024-02-14  2047  			val = __vcpu_sys_reg(vcpu, HFGWTR_EL2);
5a24ea78698572 Marc Zyngier 2023-08-15  2048  		break;
5a24ea78698572 Marc Zyngier 2023-08-15  2049  
d0be0b2ede1324 Marc Zyngier 2023-08-15  2050  	case HDFGRTR_GROUP:
d0be0b2ede1324 Marc Zyngier 2023-08-15  2051  		if (is_read)
76b457a5cdeae4 Marc Zyngier 2024-02-14  2052  			val = __vcpu_sys_reg(vcpu, HDFGRTR_EL2);
d0be0b2ede1324 Marc Zyngier 2023-08-15  2053  		else
76b457a5cdeae4 Marc Zyngier 2024-02-14  2054  			val = __vcpu_sys_reg(vcpu, HDFGWTR_EL2);
d0be0b2ede1324 Marc Zyngier 2023-08-15  2055  		break;
d0be0b2ede1324 Marc Zyngier 2023-08-15  2056  
676f482354886c Fuad Tabba   2023-12-14  2057  	case HAFGRTR_GROUP:
76b457a5cdeae4 Marc Zyngier 2024-02-14  2058  		val = __vcpu_sys_reg(vcpu, HAFGRTR_EL2);
676f482354886c Fuad Tabba   2023-12-14  2059  		break;
676f482354886c Fuad Tabba   2023-12-14  2060  
039f9f12de5fc7 Marc Zyngier 2023-08-15  2061  	case HFGITR_GROUP:
76b457a5cdeae4 Marc Zyngier 2024-02-14  2062  		val = __vcpu_sys_reg(vcpu, HFGITR_EL2);
03fb54d0aa73cc Marc Zyngier 2023-08-15  2063  		switch (tc.fgf) {
03fb54d0aa73cc Marc Zyngier 2023-08-15  2064  			u64 tmp;
03fb54d0aa73cc Marc Zyngier 2023-08-15  2065  
03fb54d0aa73cc Marc Zyngier 2023-08-15  2066  		case __NO_FGF__:
03fb54d0aa73cc Marc Zyngier 2023-08-15  2067  			break;
03fb54d0aa73cc Marc Zyngier 2023-08-15  2068  
03fb54d0aa73cc Marc Zyngier 2023-08-15  2069  		case HCRX_FGTnXS:
76b457a5cdeae4 Marc Zyngier 2024-02-14  2070  			tmp = __vcpu_sys_reg(vcpu, HCRX_EL2);
03fb54d0aa73cc Marc Zyngier 2023-08-15  2071  			if (tmp & HCRX_EL2_FGTnXS)
03fb54d0aa73cc Marc Zyngier 2023-08-15  2072  				tc.fgt = __NO_FGT_GROUP__;
03fb54d0aa73cc Marc Zyngier 2023-08-15  2073  		}
039f9f12de5fc7 Marc Zyngier 2023-08-15  2074  		break;
039f9f12de5fc7 Marc Zyngier 2023-08-15  2075  
15b4d82d69d7b0 Marc Zyngier 2023-08-15  2076  	case __NR_FGT_GROUP_IDS__:
15b4d82d69d7b0 Marc Zyngier 2023-08-15  2077  		/* Something is really wrong, bail out */
15b4d82d69d7b0 Marc Zyngier 2023-08-15  2078  		WARN_ONCE(1, "__NR_FGT_GROUP_IDS__");
cc5f84fbb008ff Marc Zyngier 2024-02-14  2079  		goto local;
15b4d82d69d7b0 Marc Zyngier 2023-08-15  2080  	}
15b4d82d69d7b0 Marc Zyngier 2023-08-15  2081  
9958d58779c92b Marc Zyngier 2024-02-14  2082  	if (tc.fgt != __NO_FGT_GROUP__ && check_fgt_bit(vcpu->kvm, is_read,
9958d58779c92b Marc Zyngier 2024-02-14 @2083  							val, tc))
15b4d82d69d7b0 Marc Zyngier 2023-08-15  2084  		goto inject;
15b4d82d69d7b0 Marc Zyngier 2023-08-15  2085  
e58ec47bf68d2b Marc Zyngier 2023-08-15  2086  	b = compute_trap_behaviour(vcpu, tc);
e58ec47bf68d2b Marc Zyngier 2023-08-15  2087  
e58ec47bf68d2b Marc Zyngier 2023-08-15  2088  	if (((b & BEHAVE_FORWARD_READ) && is_read) ||
e58ec47bf68d2b Marc Zyngier 2023-08-15  2089  	    ((b & BEHAVE_FORWARD_WRITE) && !is_read))
e58ec47bf68d2b Marc Zyngier 2023-08-15  2090  		goto inject;
e58ec47bf68d2b Marc Zyngier 2023-08-15  2091  
cc5f84fbb008ff Marc Zyngier 2024-02-14  2092  local:
cc5f84fbb008ff Marc Zyngier 2024-02-14  2093  	if (!tc.sri) {
cc5f84fbb008ff Marc Zyngier 2024-02-14  2094  		struct sys_reg_params params;
cc5f84fbb008ff Marc Zyngier 2024-02-14  2095  
cc5f84fbb008ff Marc Zyngier 2024-02-14  2096  		params = esr_sys64_to_params(esr);
cc5f84fbb008ff Marc Zyngier 2024-02-14  2097  
cc5f84fbb008ff Marc Zyngier 2024-02-14  2098  		/*
cc5f84fbb008ff Marc Zyngier 2024-02-14  2099  		 * Check for the IMPDEF range, as per DDI0487 J.a,
cc5f84fbb008ff Marc Zyngier 2024-02-14  2100  		 * D18.3.2 Reserved encodings for IMPLEMENTATION
cc5f84fbb008ff Marc Zyngier 2024-02-14  2101  		 * DEFINED registers.
cc5f84fbb008ff Marc Zyngier 2024-02-14  2102  		 */
cc5f84fbb008ff Marc Zyngier 2024-02-14  2103  		if (!(params.Op0 == 3 && (params.CRn & 0b1011) == 0b1011))
cc5f84fbb008ff Marc Zyngier 2024-02-14  2104  			print_sys_reg_msg(&params,
cc5f84fbb008ff Marc Zyngier 2024-02-14  2105  					  "Unsupported guest access at: %lx\n",
cc5f84fbb008ff Marc Zyngier 2024-02-14  2106  					  *vcpu_pc(vcpu));
cc5f84fbb008ff Marc Zyngier 2024-02-14  2107  		kvm_inject_undefined(vcpu);
cc5f84fbb008ff Marc Zyngier 2024-02-14  2108  		return true;
cc5f84fbb008ff Marc Zyngier 2024-02-14  2109  	}
cc5f84fbb008ff Marc Zyngier 2024-02-14  2110  
cc5f84fbb008ff Marc Zyngier 2024-02-14  2111  	*sr_index = tc.sri - 1;
e58ec47bf68d2b Marc Zyngier 2023-08-15  2112  	return false;
e58ec47bf68d2b Marc Zyngier 2023-08-15  2113  
e58ec47bf68d2b Marc Zyngier 2023-08-15  2114  inject:
e58ec47bf68d2b Marc Zyngier 2023-08-15  2115  	trace_kvm_forward_sysreg_trap(vcpu, sysreg, is_read);
e58ec47bf68d2b Marc Zyngier 2023-08-15  2116  
e58ec47bf68d2b Marc Zyngier 2023-08-15  2117  	kvm_inject_nested_sync(vcpu, kvm_vcpu_get_esr(vcpu));
e58ec47bf68d2b Marc Zyngier 2023-08-15  2118  	return true;
e58ec47bf68d2b Marc Zyngier 2023-08-15  2119  }
e58ec47bf68d2b Marc Zyngier 2023-08-15  2120  

:::::: The code at line 2083 was first introduced by commit
:::::: 9958d58779c92b72ef5b29284d073ecaa2a28764 KVM: arm64: nv: Correctly handle negative polarity FGTs

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Oliver Upton <oliver.upton@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
