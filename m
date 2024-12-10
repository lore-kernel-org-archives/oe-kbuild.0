Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CA31863E
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Dec 2024 01:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733795585; cv=none; b=mLmYVm/xd8ZGh9lDnwpMsRtdHd1H2mNnn2+hK3JXhgGGxpSt98ovLXktyV+8bUi0/IUbQnfAoNLlLhdg9qOzvlTH0u65l7PVQGJZHrUSHP6iNXclaE6w6IF/c7KCQinRatZbG9+fUqQJf+lFZmcFPPmvJRjBN+N3J14MOF9tF0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733795585; c=relaxed/simple;
	bh=MqhG0ucZ6sKgFDZGqWnxjM39oLf2XwY18iA2duXP9KM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GVJipyj7x/t4t48+IEGFmKWAieFh9+8bZstyt6jQVnaumjtE0wUEC6r2plrPG8d1k0CMQ3hc9Xw5kNxiITkkASEnR+1DD8+td0jJxMZaRzjnV0HuOezwBxPK44xqXtygmwKoFndySE6KnRN/gAT89n26s2veoRyB71JkN2rK6Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ke/O5mPx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ke/O5mPx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733795582; x=1765331582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MqhG0ucZ6sKgFDZGqWnxjM39oLf2XwY18iA2duXP9KM=;
  b=Ke/O5mPxGsMD1fjo5tauD6Lks++F41JezSaZ3TVu/z4pJIeSQ5gw4I6g
   kkDagaX8G4gMRDNSy+recnT3RIrCMLEj3wSqYDNo/IeF22ApWLo/MGqRl
   Vc1IUeJEsWhfZuzbs9thgG1PAAa9Fa/4wwQArtoJ2se+br1FTciNDNe82
   JZoRjFbIDvEHFXCuJ/BwTZ8MJFZ2vL54l/lg3ZyfezB9MLwdd6dJPx7nk
   L/J3hTvoHLI9/BJrDB3g86O066gj4GFqHNioUE9N+YdH0YbZZU9Mysg6p
   f/mmXSzxFGXLnJc7SBUcY/LhSjS+y0OFD0IN7/kDMZLyAwu4I44vGvc4F
   g==;
X-CSE-ConnectionGUID: cofdPdEsThiiJghIR4jzUQ==
X-CSE-MsgGUID: 7rqsuWiYQEGRyNT/fmF9FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45504008"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45504008"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 17:53:02 -0800
X-CSE-ConnectionGUID: u94HVL0xRWqLjc6wOx/E5w==
X-CSE-MsgGUID: dfoUSyQ+T0686QgJBz7TAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="100308552"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Dec 2024 17:53:01 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKpQo-00051b-1S;
	Tue, 10 Dec 2024 01:52:58 +0000
Date: Tue, 10 Dec 2024 09:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/hyp/include/hyp/switch.h:196
 __activate_traps_hfgxtr() error: uninitialized symbol 'id'.
Message-ID: <202412100938.gnYJFAHx-lkp@intel.com>
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
head:   7cb1b466315004af98f6ba6c2546bb713ca3c237
commit: f5a5a406b4b8bb6c1fc7a1e92a872bd86061a53f KVM: arm64: Propagate and handle Fine-Grained UNDEF bits
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241210/202412100938.gnYJFAHx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412100938.gnYJFAHx-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/hyp/include/hyp/switch.h:196 __activate_traps_hfgxtr() error: uninitialized symbol 'id'.
arch/arm64/kvm/hyp/include/hyp/switch.h:242 __deactivate_traps_hfgxtr() error: uninitialized symbol 'id'.
arch/arm64/kvm/hyp/include/hyp/switch.h:196 __activate_traps_hfgxtr() error: uninitialized symbol 'id'.
arch/arm64/kvm/hyp/include/hyp/switch.h:242 __deactivate_traps_hfgxtr() error: uninitialized symbol 'id'.

Old smatch warnings:
arch/arm64/kvm/hyp/include/hyp/switch.h:215 __activate_traps_hfgxtr() error: uninitialized symbol 'id'.
arch/arm64/kvm/hyp/vhe/switch.c:57 __activate_traps() error: uninitialized symbol 'val'.
arch/arm64/kvm/hyp/include/hyp/switch.h:215 __activate_traps_hfgxtr() error: uninitialized symbol 'id'.

vim +/id +196 arch/arm64/kvm/hyp/include/hyp/switch.h

ce4a36225753a1a Oliver Upton 2023-06-09  155  
e930694e6145eb2 Marc Zyngier 2023-08-15  156  static inline void __activate_traps_hfgxtr(struct kvm_vcpu *vcpu)
ce4a36225753a1a Oliver Upton 2023-06-09  157  {
e930694e6145eb2 Marc Zyngier 2023-08-15  158  	struct kvm_cpu_context *hctxt = &this_cpu_ptr(&kvm_host_data)->host_ctxt;
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  159  	struct kvm *kvm = kern_hyp_va(vcpu->kvm);
ce4a36225753a1a Oliver Upton 2023-06-09  160  	u64 r_clr = 0, w_clr = 0, r_set = 0, w_set = 0, tmp;
e930694e6145eb2 Marc Zyngier 2023-08-15  161  	u64 r_val, w_val;
e930694e6145eb2 Marc Zyngier 2023-08-15  162  
6c4abbea6d9c09d Fuad Tabba   2023-12-14  163  	CHECK_FGT_MASKS(HFGRTR_EL2);
6c4abbea6d9c09d Fuad Tabba   2023-12-14  164  	CHECK_FGT_MASKS(HFGWTR_EL2);
6c4abbea6d9c09d Fuad Tabba   2023-12-14  165  	CHECK_FGT_MASKS(HFGITR_EL2);
6c4abbea6d9c09d Fuad Tabba   2023-12-14  166  	CHECK_FGT_MASKS(HDFGRTR_EL2);
6c4abbea6d9c09d Fuad Tabba   2023-12-14  167  	CHECK_FGT_MASKS(HDFGWTR_EL2);
6c4abbea6d9c09d Fuad Tabba   2023-12-14  168  	CHECK_FGT_MASKS(HAFGRTR_EL2);
6c4abbea6d9c09d Fuad Tabba   2023-12-14  169  	CHECK_FGT_MASKS(HCRX_EL2);
6c4abbea6d9c09d Fuad Tabba   2023-12-14  170  
e930694e6145eb2 Marc Zyngier 2023-08-15  171  	if (!cpus_have_final_cap(ARM64_HAS_FGT))
e930694e6145eb2 Marc Zyngier 2023-08-15  172  		return;
e930694e6145eb2 Marc Zyngier 2023-08-15  173  
e930694e6145eb2 Marc Zyngier 2023-08-15  174  	ctxt_sys_reg(hctxt, HFGRTR_EL2) = read_sysreg_s(SYS_HFGRTR_EL2);
e930694e6145eb2 Marc Zyngier 2023-08-15  175  	ctxt_sys_reg(hctxt, HFGWTR_EL2) = read_sysreg_s(SYS_HFGWTR_EL2);
ce4a36225753a1a Oliver Upton 2023-06-09  176  
ce4a36225753a1a Oliver Upton 2023-06-09  177  	if (cpus_have_final_cap(ARM64_SME)) {
ce4a36225753a1a Oliver Upton 2023-06-09  178  		tmp = HFGxTR_EL2_nSMPRI_EL1_MASK | HFGxTR_EL2_nTPIDR2_EL0_MASK;
ce4a36225753a1a Oliver Upton 2023-06-09  179  
ce4a36225753a1a Oliver Upton 2023-06-09  180  		r_clr |= tmp;
ce4a36225753a1a Oliver Upton 2023-06-09  181  		w_clr |= tmp;
ce4a36225753a1a Oliver Upton 2023-06-09  182  	}
ce4a36225753a1a Oliver Upton 2023-06-09  183  
082fdfd13841fa4 Oliver Upton 2023-06-09  184  	/*
082fdfd13841fa4 Oliver Upton 2023-06-09  185  	 * Trap guest writes to TCR_EL1 to prevent it from enabling HA or HD.
082fdfd13841fa4 Oliver Upton 2023-06-09  186  	 */
082fdfd13841fa4 Oliver Upton 2023-06-09  187  	if (cpus_have_final_cap(ARM64_WORKAROUND_AMPERE_AC03_CPU_38))
082fdfd13841fa4 Oliver Upton 2023-06-09  188  		w_set |= HFGxTR_EL2_TCR_EL1_MASK;
082fdfd13841fa4 Oliver Upton 2023-06-09  189  
d4d2dacc7cddc37 Marc Zyngier 2023-08-15  190  	if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)) {
d4d2dacc7cddc37 Marc Zyngier 2023-08-15  191  		compute_clr_set(vcpu, HFGRTR_EL2, r_clr, r_set);
d4d2dacc7cddc37 Marc Zyngier 2023-08-15  192  		compute_clr_set(vcpu, HFGWTR_EL2, w_clr, w_set);
ce4a36225753a1a Oliver Upton 2023-06-09  193  	}
ce4a36225753a1a Oliver Upton 2023-06-09  194  
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  195  	compute_undef_clr_set(vcpu, kvm, HFGRTR_EL2, r_clr, r_set);
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14 @196  	compute_undef_clr_set(vcpu, kvm, HFGWTR_EL2, w_clr, w_set);
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  197  
1565c881c3df053 Fuad Tabba   2023-12-14  198  	/* The default to trap everything not handled or supported in KVM. */
1565c881c3df053 Fuad Tabba   2023-12-14  199  	tmp = HFGxTR_EL2_nAMAIR2_EL1 | HFGxTR_EL2_nMAIR2_EL1 | HFGxTR_EL2_nS2POR_EL1 |
1565c881c3df053 Fuad Tabba   2023-12-14  200  	      HFGxTR_EL2_nPOR_EL1 | HFGxTR_EL2_nPOR_EL0 | HFGxTR_EL2_nACCDATA_EL1;
1565c881c3df053 Fuad Tabba   2023-12-14  201  
1565c881c3df053 Fuad Tabba   2023-12-14  202  	r_val = __HFGRTR_EL2_nMASK & ~tmp;
e930694e6145eb2 Marc Zyngier 2023-08-15  203  	r_val |= r_set;
e930694e6145eb2 Marc Zyngier 2023-08-15  204  	r_val &= ~r_clr;
ce4a36225753a1a Oliver Upton 2023-06-09  205  
1565c881c3df053 Fuad Tabba   2023-12-14  206  	w_val = __HFGWTR_EL2_nMASK & ~tmp;
e930694e6145eb2 Marc Zyngier 2023-08-15  207  	w_val |= w_set;
e930694e6145eb2 Marc Zyngier 2023-08-15  208  	w_val &= ~w_clr;
e930694e6145eb2 Marc Zyngier 2023-08-15  209  
e930694e6145eb2 Marc Zyngier 2023-08-15  210  	write_sysreg_s(r_val, SYS_HFGRTR_EL2);
e930694e6145eb2 Marc Zyngier 2023-08-15  211  	write_sysreg_s(w_val, SYS_HFGWTR_EL2);
d4d2dacc7cddc37 Marc Zyngier 2023-08-15  212  
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  213  	update_fgt_traps(hctxt, vcpu, kvm, HFGITR_EL2);
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  214  	update_fgt_traps(hctxt, vcpu, kvm, HDFGRTR_EL2);
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  215  	update_fgt_traps(hctxt, vcpu, kvm, HDFGWTR_EL2);
d4d2dacc7cddc37 Marc Zyngier 2023-08-15  216  
0ccd901da1886cf Fuad Tabba   2023-12-14  217  	if (cpu_has_amu())
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  218  		update_fgt_traps(hctxt, vcpu, kvm, HAFGRTR_EL2);
ce4a36225753a1a Oliver Upton 2023-06-09  219  }
ce4a36225753a1a Oliver Upton 2023-06-09  220  
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  221  #define __deactivate_fgt(htcxt, vcpu, kvm, reg)				\
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  222  	do {								\
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  223  		if ((vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)) ||	\
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  224  		    kvm->arch.fgu[reg_to_fgt_group_id(reg)])		\
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  225  			write_sysreg_s(ctxt_sys_reg(hctxt, reg),	\
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  226  				       SYS_ ## reg);			\
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  227  	} while(0)
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  228  
e930694e6145eb2 Marc Zyngier 2023-08-15  229  static inline void __deactivate_traps_hfgxtr(struct kvm_vcpu *vcpu)
ce4a36225753a1a Oliver Upton 2023-06-09  230  {
e930694e6145eb2 Marc Zyngier 2023-08-15  231  	struct kvm_cpu_context *hctxt = &this_cpu_ptr(&kvm_host_data)->host_ctxt;
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  232  	struct kvm *kvm = kern_hyp_va(vcpu->kvm);
ce4a36225753a1a Oliver Upton 2023-06-09  233  
e930694e6145eb2 Marc Zyngier 2023-08-15  234  	if (!cpus_have_final_cap(ARM64_HAS_FGT))
e930694e6145eb2 Marc Zyngier 2023-08-15  235  		return;
ce4a36225753a1a Oliver Upton 2023-06-09  236  
e930694e6145eb2 Marc Zyngier 2023-08-15  237  	write_sysreg_s(ctxt_sys_reg(hctxt, HFGRTR_EL2), SYS_HFGRTR_EL2);
e930694e6145eb2 Marc Zyngier 2023-08-15  238  	write_sysreg_s(ctxt_sys_reg(hctxt, HFGWTR_EL2), SYS_HFGWTR_EL2);
082fdfd13841fa4 Oliver Upton 2023-06-09  239  
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  240  	__deactivate_fgt(hctxt, vcpu, kvm, HFGITR_EL2);
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  241  	__deactivate_fgt(hctxt, vcpu, kvm, HDFGRTR_EL2);
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14 @242  	__deactivate_fgt(hctxt, vcpu, kvm, HDFGWTR_EL2);
676f482354886ca Fuad Tabba   2023-12-14  243  
0ccd901da1886cf Fuad Tabba   2023-12-14  244  	if (cpu_has_amu())
f5a5a406b4b8bb6 Marc Zyngier 2024-02-14  245  		__deactivate_fgt(hctxt, vcpu, kvm, HAFGRTR_EL2);
ce4a36225753a1a Oliver Upton 2023-06-09  246  }
ce4a36225753a1a Oliver Upton 2023-06-09  247  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
