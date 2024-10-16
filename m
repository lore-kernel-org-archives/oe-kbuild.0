Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0EE14A84
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Oct 2024 03:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729050334; cv=none; b=GMQR45oDF93mg3Z2gDSD+UPDtDbgJz+UvCrhwyicSRIntO8y0FGnnyBLQVTGBzkYJEfiuUIP/zCU6tDOyNWMm5y4Q3318klZdMzSxMBhfxC3mscnubY93GT2IzYC5/fLQa3igW3k9uF363qW0K9GiN0ZR0yFdqZDud7JYiD8KjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729050334; c=relaxed/simple;
	bh=xBFDrKjMyPU6iF/wxmBdKdiHUP2w4cW4nMUdk9pJoNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kdZPERRbGk2Tf0pkS3G11P9Rk2vsAaOdQglv3MOUUKeuQqeioctW0MJQ+XPP6X/Lo+P6/rFRKIxspP7u/6Mnm1+6g8hDgbL/PEPWiXEoYh+38Tq4YDPObXRzfnoCYoll8iNBQijGt5D3tG7Te1j/NwcP7VDEURLcEZMH0WooDLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrUiDAtn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrUiDAtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729050332; x=1760586332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xBFDrKjMyPU6iF/wxmBdKdiHUP2w4cW4nMUdk9pJoNU=;
  b=nrUiDAtnfel+ev+0BaxHnJGULXTQ74JnYuXvHJRsy8SqM5GFygK8q44n
   xJ+PTnepD40EqvrYW2qzvxX+X20/I/GZwhnyurRfkj/U8jONYV8i13yyy
   2JW3afbpYnNvF0QDpEo804o0KZebjjVj0mzvDpXnuLn9oKECXhQiZhMKt
   Igm85CJMPW4Zcxro2GGFuTQCTGy+wBYxiFhBk3ALi861aHE7gxsObD6yy
   IU8KVl8ed7w+Lwj5O/PHen6Z41Vg/XoR+u+HBrqtcgYuWOhGCYfTUf2oK
   DxdYpEbbFgtA6rJ4ksk/F2cF1T4yy3n1he55tgfyCoTKREyBozM0kgAsD
   A==;
X-CSE-ConnectionGUID: 92u46CICQnO/2gUHmT9OCA==
X-CSE-MsgGUID: ijoNBEkFRfm5XAcjYqW4rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27918936"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="27918936"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:45:31 -0700
X-CSE-ConnectionGUID: eNB9DTLhSn+Pgrnrqw9lVA==
X-CSE-MsgGUID: BB2bt8EIQbKT3KNogTMgkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78557053"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Oct 2024 20:45:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0uyW-000KEl-12;
	Wed, 16 Oct 2024 03:45:28 +0000
Date: Wed, 16 Oct 2024 11:45:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/emulate-nested.c:2083 triage_sysreg_trap() error:
 uninitialized symbol 'val'.
Message-ID: <202410161139.XkRJ6qpE-lkp@intel.com>
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
head:   2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
commit: 085eabaa74a12345b7dd083b160519fe3a52f2ce KVM: arm64: Rename __check_nv_sr_forward() to triage_sysreg_trap()
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241016/202410161139.XkRJ6qpE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410161139.XkRJ6qpE-lkp@intel.com/

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
