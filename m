Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E56632E13F
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 21:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761858450; cv=none; b=N0yjA6Juau2Z+4yJA355kYHbyr0wjHwElUs7mWGxNHMHz/dIKM5cb8eoOWvTRCLis6MizVGsGl+YRSi7IpYj19Ay+md3Lo68J3yJXfXjhlIfyfumHUTGAplfndK84mZ7335Ppi2AxLPY4unKuZ8fLsJhHZZzthAU04HcBlXK2nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761858450; c=relaxed/simple;
	bh=XaD/LbgY/bYrKAgQDIimKV8e/8pweGTLO/J83P67zUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ot3yPiGPjUJL0NrzyyYvtYRbt0lifliLsmLpdnP8rywjIEK8kprfUjouQGlEon/5lvkd+uBIaZ3rqCX3AiSw5bnNq6OrNlqkLWGLdtjXoyDa59YpbGF4GokMQjhWHWOsnVJbPIV1bqLinDXdKBT+ivpT8SPaHcOaIFpPDqf0cEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHqKcsvR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHqKcsvR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761858449; x=1793394449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XaD/LbgY/bYrKAgQDIimKV8e/8pweGTLO/J83P67zUw=;
  b=YHqKcsvRUaR+Hxxw75lGTrHjMDrOGuUvsBqzJETqH9j4x/qvieRjTBz2
   X/6IGFfllYlGOQT4PGrieNHXo45WjXoAVVg52pKIl7uSowDEMAH/Ek/90
   6kXNnTvYHTQAnnP4JKPC4WY1PrHE71hyZ7BwzxwsJxe/7bCse8moX9923
   lhbgManiANlQY4c4gGLn34p/suacm8hrsOa/AeGe7X1/7OkWQ2cSNoc9J
   2zvYbuV/FAwzEWOrbAsyTrRc1PY8fbpnFeCrAZpA3q/1cUzW9uQHJovvR
   KTWYbGZNspqwZLRbXjpcPd1Umn5slv6nI84sUZ5FuEuUvcX1u2MeA03V8
   g==;
X-CSE-ConnectionGUID: +XRsg8heTqyv8Mf9Jb5jsg==
X-CSE-MsgGUID: 0ptLU8DLQ92fntwSqY0Wrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67667196"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="67667196"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 14:07:28 -0700
X-CSE-ConnectionGUID: LKqHc7GaQRGAqDFK81xtdg==
X-CSE-MsgGUID: w+nJFnDnRgSoanQevHFWZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="190411995"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Oct 2025 14:07:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEZrg-000MXA-0r;
	Thu, 30 Oct 2025 21:07:24 +0000
Date: Fri, 31 Oct 2025 05:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 3064/3064] arch/arm64/kvm/rme.c:355
 realm_init_sve_param() warn: iterator 'i' not incremented
Message-ID: <202510310530.gfNLDjBL-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Xu Raoqing <xuraoqing@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7f38ece6b510adaa28c8e625ff574fe6357a3960
commit: 4cce6f4d1521a852a180deee29c8af841987c1d1 [3064/3064] [v8-38-43]rm64: RME: Configure max SVE vector length for a Realm
:::::: branch date: 12 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251031/202510310530.gfNLDjBL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510310530.gfNLDjBL-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/rme.c:355 realm_init_sve_param() warn: iterator 'i' not incremented
arch/arm64/kvm/rme.c:461 realm_create_rd() warn: missing error code 'r'
arch/arm64/kvm/rme.c:461 realm_create_rd() warn: missing error code 'r'

Old smatch warnings:
arch/arm64/kvm/rme.c:655 realm_fold_rtt_level() error: uninitialized symbol 'rtt_granule'.
arch/arm64/kvm/rme.c:1070 populate_region() error: uninitialized symbol 'tmp_page'.

vim +/i +355 arch/arm64/kvm/rme.c

4afc6444175955 Steven Price          2025-06-14  343  
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  344  static int realm_init_sve_param(struct kvm *kvm, struct realm_params *params)
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  345  {
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  346  	int ret = 0;
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  347  	unsigned long i;
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  348  	struct kvm_vcpu *vcpu;
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  349  	int vl, last_vl = -1;
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  350  
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  351  	/*
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  352  	 * Get the preferred SVE configuration, set by userspace with the
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  353  	 * KVM_ARM_VCPU_SVE feature and KVM_REG_ARM64_SVE_VLS pseudo-register.
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  354  	 */
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14 @355  	kvm_for_each_vcpu(i, vcpu, kvm) {
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  356  		mutex_lock(&vcpu->mutex);
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  357  		if (vcpu_has_sve(vcpu)) {
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  358  			if (!kvm_arm_vcpu_sve_finalized(vcpu))
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  359  				ret = -EINVAL;
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  360  			vl = vcpu->arch.sve_max_vl;
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  361  		} else {
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  362  			vl = 0;
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  363  		}
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  364  		mutex_unlock(&vcpu->mutex);
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  365  		if (ret)
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  366  			return ret;
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  367  
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  368  		/* We need all vCPUs to have the same SVE config */
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  369  		if (last_vl >= 0 && last_vl != vl)
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  370  			return -EINVAL;
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  371  
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  372  		last_vl = vl;
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  373  	}
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  374  
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  375  	if (last_vl > 0) {
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  376  		params->sve_vl = sve_vq_from_vl(last_vl) - 1;
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  377  		params->flags |= RMI_REALM_PARAM_FLAG_SVE;
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  378  	}
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  379  	return 0;
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  380  }
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  381  
a52ee43f5c69bf Steven Price          2025-06-17  382  /* Calculate the number of s2 root rtts needed */
a52ee43f5c69bf Steven Price          2025-06-17  383  static int realm_num_root_rtts(struct realm *realm)
a52ee43f5c69bf Steven Price          2025-06-17  384  {
a52ee43f5c69bf Steven Price          2025-06-17  385  	unsigned int ipa_bits = realm->ia_bits;
a52ee43f5c69bf Steven Price          2025-06-17  386  	unsigned int levels = 3 - get_start_level(realm);
a52ee43f5c69bf Steven Price          2025-06-17  387  	unsigned int sl_ipa_bits = (levels + 1) * (RMM_PAGE_SHIFT - 3) +
a52ee43f5c69bf Steven Price          2025-06-17  388  				   RMM_PAGE_SHIFT;
a52ee43f5c69bf Steven Price          2025-06-17  389  
a52ee43f5c69bf Steven Price          2025-06-17  390  	if (sl_ipa_bits >= ipa_bits)
a52ee43f5c69bf Steven Price          2025-06-17  391  		return 1;
a52ee43f5c69bf Steven Price          2025-06-17  392  
a52ee43f5c69bf Steven Price          2025-06-17  393  	return 1 << (ipa_bits - sl_ipa_bits);
a52ee43f5c69bf Steven Price          2025-06-17  394  }
a52ee43f5c69bf Steven Price          2025-06-17  395  
a52ee43f5c69bf Steven Price          2025-06-17  396  static int realm_create_rd(struct kvm *kvm)
a52ee43f5c69bf Steven Price          2025-06-17  397  {
a52ee43f5c69bf Steven Price          2025-06-17  398  	struct realm *realm = &kvm->arch.realm;
a52ee43f5c69bf Steven Price          2025-06-17  399  	struct realm_params *params = realm->params;
a52ee43f5c69bf Steven Price          2025-06-17  400  	void *rd = NULL;
a52ee43f5c69bf Steven Price          2025-06-17  401  	phys_addr_t rd_phys, params_phys;
a52ee43f5c69bf Steven Price          2025-06-17  402  	size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.vtcr);
7774c8164828a3 Jean-Philippe Brucker 2025-06-21  403  	u64 dfr0 = IDREG(kvm, SYS_ID_AA64DFR0_EL1);
a52ee43f5c69bf Steven Price          2025-06-17  404  	int i, r;
a52ee43f5c69bf Steven Price          2025-06-17  405  	int rtt_num_start;
a52ee43f5c69bf Steven Price          2025-06-17  406  
a52ee43f5c69bf Steven Price          2025-06-17  407  	realm->ia_bits = VTCR_EL2_IPA(kvm->arch.vtcr);
a52ee43f5c69bf Steven Price          2025-06-17  408  	rtt_num_start = realm_num_root_rtts(realm);
a52ee43f5c69bf Steven Price          2025-06-17  409  
a52ee43f5c69bf Steven Price          2025-06-17  410  	if (WARN_ON(realm->rd || !realm->params))
a52ee43f5c69bf Steven Price          2025-06-17  411  		return -EEXIST;
a52ee43f5c69bf Steven Price          2025-06-17  412  
a52ee43f5c69bf Steven Price          2025-06-17  413  	if (pgd_size / RMM_PAGE_SIZE < rtt_num_start)
a52ee43f5c69bf Steven Price          2025-06-17  414  		return -EINVAL;
a52ee43f5c69bf Steven Price          2025-06-17  415  
a52ee43f5c69bf Steven Price          2025-06-17  416  	rd = (void *)__get_free_page(GFP_KERNEL);
a52ee43f5c69bf Steven Price          2025-06-17  417  	if (!rd)
a52ee43f5c69bf Steven Price          2025-06-17  418  		return -ENOMEM;
a52ee43f5c69bf Steven Price          2025-06-17  419  
a52ee43f5c69bf Steven Price          2025-06-17  420  	rd_phys = virt_to_phys(rd);
a52ee43f5c69bf Steven Price          2025-06-17  421  	if (rmi_granule_delegate(rd_phys)) {
a52ee43f5c69bf Steven Price          2025-06-17  422  		r = -ENXIO;
a52ee43f5c69bf Steven Price          2025-06-17  423  		goto free_rd;
a52ee43f5c69bf Steven Price          2025-06-17  424  	}
a52ee43f5c69bf Steven Price          2025-06-17  425  
a52ee43f5c69bf Steven Price          2025-06-17  426  	for (i = 0; i < pgd_size; i += RMM_PAGE_SIZE) {
a52ee43f5c69bf Steven Price          2025-06-17  427  		phys_addr_t pgd_phys = kvm->arch.mmu.pgd_phys + i;
a52ee43f5c69bf Steven Price          2025-06-17  428  
a52ee43f5c69bf Steven Price          2025-06-17  429  		if (rmi_granule_delegate(pgd_phys)) {
a52ee43f5c69bf Steven Price          2025-06-17  430  			r = -ENXIO;
a52ee43f5c69bf Steven Price          2025-06-17  431  			goto out_undelegate_tables;
a52ee43f5c69bf Steven Price          2025-06-17  432  		}
a52ee43f5c69bf Steven Price          2025-06-17  433  	}
a52ee43f5c69bf Steven Price          2025-06-17  434  
a52ee43f5c69bf Steven Price          2025-06-17  435  	params->s2sz = VTCR_EL2_IPA(kvm->arch.vtcr);
a52ee43f5c69bf Steven Price          2025-06-17  436  	params->rtt_level_start = get_start_level(realm);
a52ee43f5c69bf Steven Price          2025-06-17  437  	params->rtt_num_start = rtt_num_start;
a52ee43f5c69bf Steven Price          2025-06-17  438  	params->rtt_base = kvm->arch.mmu.pgd_phys;
a52ee43f5c69bf Steven Price          2025-06-17  439  	params->vmid = realm->vmid;
7774c8164828a3 Jean-Philippe Brucker 2025-06-21  440  	params->num_bps = SYS_FIELD_GET(ID_AA64DFR0_EL1, BRPs, dfr0);
7774c8164828a3 Jean-Philippe Brucker 2025-06-21  441  	params->num_wps = SYS_FIELD_GET(ID_AA64DFR0_EL1, WRPs, dfr0);
a52ee43f5c69bf Steven Price          2025-06-17  442  
bfc1d5f6472a25 Steven Price          2025-06-17  443  	if (kvm->arch.arm_pmu) {
bfc1d5f6472a25 Steven Price          2025-06-17  444  		params->pmu_num_ctrs = kvm->arch.pmcr_n;
bfc1d5f6472a25 Steven Price          2025-06-17  445  		params->flags |= RMI_REALM_PARAM_FLAG_PMU;
bfc1d5f6472a25 Steven Price          2025-06-17  446  	}
bfc1d5f6472a25 Steven Price          2025-06-17  447  
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  448  	r = realm_init_sve_param(kvm, params);
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  449  	if (r)
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  450  		goto out_undelegate_tables;
4cce6f4d1521a8 Jean-Philippe Brucker 2025-06-14  451  
a52ee43f5c69bf Steven Price          2025-06-17  452  	params_phys = virt_to_phys(params);
a52ee43f5c69bf Steven Price          2025-06-17  453  
a52ee43f5c69bf Steven Price          2025-06-17  454  	if (rmi_realm_create(rd_phys, params_phys)) {
a52ee43f5c69bf Steven Price          2025-06-17  455  		r = -ENXIO;
a52ee43f5c69bf Steven Price          2025-06-17  456  		goto out_undelegate_tables;
a52ee43f5c69bf Steven Price          2025-06-17  457  	}
a52ee43f5c69bf Steven Price          2025-06-17  458  
a52ee43f5c69bf Steven Price          2025-06-17  459  	if (WARN_ON(rmi_rec_aux_count(rd_phys, &realm->num_aux))) {
a52ee43f5c69bf Steven Price          2025-06-17  460  		WARN_ON(rmi_realm_destroy(rd_phys));
a52ee43f5c69bf Steven Price          2025-06-17 @461  		goto out_undelegate_tables;
a52ee43f5c69bf Steven Price          2025-06-17  462  	}
a52ee43f5c69bf Steven Price          2025-06-17  463  
a52ee43f5c69bf Steven Price          2025-06-17  464  	realm->rd = rd;
a52ee43f5c69bf Steven Price          2025-06-17  465  
a52ee43f5c69bf Steven Price          2025-06-17  466  	return 0;
a52ee43f5c69bf Steven Price          2025-06-17  467  
a52ee43f5c69bf Steven Price          2025-06-17  468  out_undelegate_tables:
a52ee43f5c69bf Steven Price          2025-06-17  469  	while (i > 0) {
a52ee43f5c69bf Steven Price          2025-06-17  470  		i -= RMM_PAGE_SIZE;
a52ee43f5c69bf Steven Price          2025-06-17  471  
a52ee43f5c69bf Steven Price          2025-06-17  472  		phys_addr_t pgd_phys = kvm->arch.mmu.pgd_phys + i;
a52ee43f5c69bf Steven Price          2025-06-17  473  
a52ee43f5c69bf Steven Price          2025-06-17  474  		if (WARN_ON(rmi_granule_undelegate(pgd_phys))) {
a52ee43f5c69bf Steven Price          2025-06-17  475  			/* Leak the pages if they cannot be returned */
a52ee43f5c69bf Steven Price          2025-06-17  476  			kvm->arch.mmu.pgt = NULL;
a52ee43f5c69bf Steven Price          2025-06-17  477  			break;
a52ee43f5c69bf Steven Price          2025-06-17  478  		}
a52ee43f5c69bf Steven Price          2025-06-17  479  	}
a52ee43f5c69bf Steven Price          2025-06-17  480  	if (WARN_ON(rmi_granule_undelegate(rd_phys))) {
a52ee43f5c69bf Steven Price          2025-06-17  481  		/* Leak the page if it isn't returned */
a52ee43f5c69bf Steven Price          2025-06-17  482  		return r;
a52ee43f5c69bf Steven Price          2025-06-17  483  	}
a52ee43f5c69bf Steven Price          2025-06-17  484  free_rd:
a52ee43f5c69bf Steven Price          2025-06-17  485  	free_page((unsigned long)rd);
a52ee43f5c69bf Steven Price          2025-06-17  486  	return r;
2db822cdbd4c9c Steven Price          2025-06-14  487  }
2db822cdbd4c9c Steven Price          2025-06-14  488  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
