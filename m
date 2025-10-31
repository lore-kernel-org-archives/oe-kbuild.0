Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761601D6188
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Oct 2025 02:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761878634; cv=none; b=F9oKfCBm6q2lG+caboEwRj9QYGw0hhFjvGTCGDT56PmFjPY2cviWmZ8TYw0Rv+n1t9X3+Yz6czy4W/4unEzCbuozpandP5YTYbt2mHHPqRuuU88t5zZp1B6PRAROFMiQjkaEDg/eNxfhHWMad3vgQSYHSW7HI/SL2OgFSASXxIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761878634; c=relaxed/simple;
	bh=GZIypXzUt+tm9Kji6zr9YsPZUJEMOSIFE5o2pWIId9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bd0RiVCEVnI3wFx1VpvSaFrw2o/HvBOP5ZrulwTsWym3/LnB6U49uZCIkSJEOugAmVqdAVpLg8CTO7ZhmoJIhESk0wNTeyq2y+WotjpRL2rtoEqW0UF4fec3NEGUK6z+vLAKe/K3qhKW6JmPRA0IYn3nZ0VoH03oK5i+EpnVLr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rkat9ibZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rkat9ibZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761878633; x=1793414633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GZIypXzUt+tm9Kji6zr9YsPZUJEMOSIFE5o2pWIId9Q=;
  b=Rkat9ibZJpZoMri9I9bCMnINKcZCMZn9KfQgFWxNleg22bZQQA2kQ3LG
   oNdnVeNLQvkwd+b9PGVAshyODgBwePuyizoqcOamJlkDA6WRs7ylqkz50
   1O19vpmwQd3lUHHUJ66zWYiyEPGHrflYmGUgTaW/wNks2LVbNAS8RJLYX
   oHFl5338LV5vuzUYj+zFuGZJXN+YrKrOWHfdUmcuXH7ctCoty53TSTe8G
   rn+oQdho0+8ouuZSacOM2FSnolsDQBj/iDrDoTpldAVH6zHGVdX2olXfd
   YcHzEmwHE3s+GVAIKcwc9F2lgdvRro20SINwIngyneKDvUpQBeROHlVdZ
   w==;
X-CSE-ConnectionGUID: jTiBX9bmS6+aGs6iOyAbTg==
X-CSE-MsgGUID: oNwZXVwITuS/7VWfaHDR5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67869372"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67869372"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 19:43:51 -0700
X-CSE-ConnectionGUID: gRnASHkWRiWrzWl7zKWUiA==
X-CSE-MsgGUID: 3N+j3IRgTwShQEcC+ueucg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="186218546"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 30 Oct 2025 19:43:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEf6b-000Mhw-10;
	Fri, 31 Oct 2025 02:43:20 +0000
Date: Fri, 31 Oct 2025 10:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 3064/3064] arch/arm64/kvm/arm.c:297
 kvm_vm_ioctl_enable_cap() error: uninitialized symbol 'r'.
Message-ID: <202510311001.72W5Y1zJ-lkp@intel.com>
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
TO: Jinqian Yang <yangjinqian1@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7f38ece6b510adaa28c8e625ff574fe6357a3960
commit: 958959657133b04448125ddf9c89c669f7eee066 [3064/3064] KVM: arm64: Allow userspace to change the implementation ID registers
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251031/202510311001.72W5Y1zJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510311001.72W5Y1zJ-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/arm.c:297 kvm_vm_ioctl_enable_cap() error: uninitialized symbol 'r'.

Old smatch warnings:
arch/arm64/kvm/arm.c:142 kvm_clear_hdbss() warn: iterator 'i' not incremented
arch/arm64/kvm/arm.c:185 kvm_cap_arm_enable_hdbss() warn: iterator 'i' not incremented
arch/arm64/kvm/arm.c:973 kvm_arm_halt_guest() warn: iterator 'i' not incremented
arch/arm64/kvm/arm.c:983 kvm_arm_resume_guest() warn: iterator 'i' not incremented
arch/arm64/kvm/arm.c:1974 kvm_arch_sync_dirty_log() warn: iterator 'i' not incremented
arch/arm64/kvm/arm.c:2825 kvm_mpidr_to_vcpu() warn: iterator 'i' not incremented

vim +/r +297 arch/arm64/kvm/arm.c

47782a5586e0e2 arch/arm64/kvm/arm.c Zhou Wang        2025-05-23  221  
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  222  int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  223  			    struct kvm_enable_cap *cap)
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  224  {
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  225  	int r;
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  226  	u64 new_cap;
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  227  
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  228  	if (cap->flags)
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  229  		return -EINVAL;
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  230  
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  231  	switch (cap->cap) {
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  232  	case KVM_CAP_ARM_NISV_TO_USER:
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  233  		r = 0;
06394531b42579 arch/arm64/kvm/arm.c Marc Zyngier     2022-03-11  234  		set_bit(KVM_ARCH_FLAG_RETURN_NISV_IO_ABORT_TO_USER,
06394531b42579 arch/arm64/kvm/arm.c Marc Zyngier     2022-03-11  235  			&kvm->arch.flags);
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  236  		break;
673638f434ee4a arch/arm64/kvm/arm.c Steven Price     2021-06-21  237  	case KVM_CAP_ARM_MTE:
c4d7c51845af95 arch/arm64/kvm/arm.c Steven Price     2021-07-29  238  		mutex_lock(&kvm->lock);
c4d7c51845af95 arch/arm64/kvm/arm.c Steven Price     2021-07-29  239  		if (!system_supports_mte() || kvm->created_vcpus) {
c4d7c51845af95 arch/arm64/kvm/arm.c Steven Price     2021-07-29  240  			r = -EINVAL;
c4d7c51845af95 arch/arm64/kvm/arm.c Steven Price     2021-07-29  241  		} else {
673638f434ee4a arch/arm64/kvm/arm.c Steven Price     2021-06-21  242  			r = 0;
06394531b42579 arch/arm64/kvm/arm.c Marc Zyngier     2022-03-11  243  			set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
c4d7c51845af95 arch/arm64/kvm/arm.c Steven Price     2021-07-29  244  		}
c4d7c51845af95 arch/arm64/kvm/arm.c Steven Price     2021-07-29  245  		mutex_unlock(&kvm->lock);
673638f434ee4a arch/arm64/kvm/arm.c Steven Price     2021-06-21  246  		break;
bfbab44568779e arch/arm64/kvm/arm.c Oliver Upton     2022-05-04  247  	case KVM_CAP_ARM_SYSTEM_SUSPEND:
bfbab44568779e arch/arm64/kvm/arm.c Oliver Upton     2022-05-04  248  		r = 0;
bfbab44568779e arch/arm64/kvm/arm.c Oliver Upton     2022-05-04  249  		set_bit(KVM_ARCH_FLAG_SYSTEM_SUSPEND_ENABLED, &kvm->arch.flags);
bfbab44568779e arch/arm64/kvm/arm.c Oliver Upton     2022-05-04  250  		break;
958959657133b0 arch/arm64/kvm/arm.c Sebastian Ott    2025-10-29  251  	case KVM_CAP_ARM_WRITABLE_IMP_ID_REGS:
958959657133b0 arch/arm64/kvm/arm.c Sebastian Ott    2025-10-29  252  		mutex_lock(&kvm->lock);
958959657133b0 arch/arm64/kvm/arm.c Sebastian Ott    2025-10-29  253  		if (!kvm->created_vcpus) {
958959657133b0 arch/arm64/kvm/arm.c Sebastian Ott    2025-10-29  254  			r = 0;
958959657133b0 arch/arm64/kvm/arm.c Sebastian Ott    2025-10-29  255  			set_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &kvm->arch.flags);
958959657133b0 arch/arm64/kvm/arm.c Sebastian Ott    2025-10-29  256  		}
958959657133b0 arch/arm64/kvm/arm.c Sebastian Ott    2025-10-29  257  		mutex_unlock(&kvm->lock);
958959657133b0 arch/arm64/kvm/arm.c Sebastian Ott    2025-10-29  258  		break;
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  259  	case KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE:
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  260  		new_cap = cap->args[0];
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  261  
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  262  		mutex_lock(&kvm->slots_lock);
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  263  		/*
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  264  		 * To keep things simple, allow changing the chunk
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  265  		 * size only when no memory slots have been created.
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  266  		 */
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  267  		if (!kvm_are_all_memslots_empty(kvm)) {
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  268  			r = -EINVAL;
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  269  		} else if (new_cap && !kvm_is_block_size_supported(new_cap)) {
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  270  			r = -EINVAL;
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  271  		} else {
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  272  			r = 0;
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  273  			kvm->arch.mmu.split_page_chunk_size = new_cap;
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  274  		}
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  275  		mutex_unlock(&kvm->slots_lock);
2f440b72e852be arch/arm64/kvm/arm.c Ricardo Koller   2023-04-26  276  		break;
8d2e1e3b26a998 arch/arm64/kvm/arm.c eillon           2025-04-02  277  #ifdef CONFIG_ARM64_HDBSS
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  278  	case KVM_CAP_ARM_HW_DIRTY_STATE_TRACK:
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  279  		r = kvm_cap_arm_enable_hdbss(kvm, cap);
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  280  		break;
47782a5586e0e2 arch/arm64/kvm/arm.c Zhou Wang        2025-05-23  281  #endif
47782a5586e0e2 arch/arm64/kvm/arm.c Zhou Wang        2025-05-23  282  #ifdef CONFIG_ARM64_HISI_IPIV
47782a5586e0e2 arch/arm64/kvm/arm.c Zhou Wang        2025-05-23  283  	case KVM_CAP_ARM_HISI_IPIV:
47782a5586e0e2 arch/arm64/kvm/arm.c Zhou Wang        2025-05-23  284  		r = kvm_hisi_ipiv_enable_cap(kvm, cap);
47782a5586e0e2 arch/arm64/kvm/arm.c Zhou Wang        2025-05-23  285  		break;
8d2e1e3b26a998 arch/arm64/kvm/arm.c eillon           2025-04-02  286  #endif
a52ee43f5c69bf arch/arm64/kvm/arm.c Steven Price     2025-06-17  287  	case KVM_CAP_ARM_RME:
a52ee43f5c69bf arch/arm64/kvm/arm.c Steven Price     2025-06-17  288  		mutex_lock(&kvm->lock);
a52ee43f5c69bf arch/arm64/kvm/arm.c Steven Price     2025-06-17  289  		r = kvm_realm_enable_cap(kvm, cap);
a52ee43f5c69bf arch/arm64/kvm/arm.c Steven Price     2025-06-17  290  		mutex_unlock(&kvm->lock);
a52ee43f5c69bf arch/arm64/kvm/arm.c Steven Price     2025-06-17  291  		break;
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  292  	default:
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  293  		r = -EINVAL;
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  294  		break;
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  295  	}
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  296  
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11 @297  	return r;
c726200dd106d4 virt/kvm/arm/arm.c   Christoffer Dall 2019-10-11  298  }
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall 2013-01-20  299  

:::::: The code at line 297 was first introduced by commit
:::::: c726200dd106d4c58a281eea7159b8ba28a4ab34 KVM: arm/arm64: Allow reporting non-ISV data aborts to userspace

:::::: TO: Christoffer Dall <christoffer.dall@arm.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
