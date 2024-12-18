Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A61487A5
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Dec 2024 02:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734490312; cv=none; b=GGhQjt7Tkf81bwk6DHiDs4h+Xu60UeouFhlYIZC6x+cXj6A6q/GNs2mZUSCNn7uj/SEQuYn1Tt9npZ8kzvtFM4lPnUE235zZHIeJDH1kDj04SCW4NAv7QWw5WcCP5ZorxQL5JnsK2gMq+oPd86sk60THpbNoAj6L5zMouo29SaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734490312; c=relaxed/simple;
	bh=1GT/T4kTjhm1+bkpdmnHBzVmmoJmgiG41fOzNLScVw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q8gBNVki7jYpC6knUY4dCi3G8QU+5QGLU9IfNWWP1Qe/VVWKXDk0Emc20T8WfZVx3UDxMnhC9NM2pKfihGbNek6RQU06pHXZ3C0OtdvNkf8ifUHugSBpp1EEp9UJrEw+4jcJSLtac9ruC2BNDotIvcvvvjJpD9a1io0AVvm65bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUy7E0mk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUy7E0mk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734490311; x=1766026311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1GT/T4kTjhm1+bkpdmnHBzVmmoJmgiG41fOzNLScVw8=;
  b=mUy7E0mklfEsUxTJKbinRueC2OarTWJ4mt/cxwsAF7/wnvxokac9TKt4
   ruu+wxQQnOuhnUBBJvfyRyV8olmu8ypBd7+ZFogqbw/cRWHtDzxsCHSAN
   l6M7rhpAsvdzGOqfTshHk/fY/zW0jDohRkZer8zmrEon6B10hle504BSi
   E0S9VGDKOlgrBbkF/h+AaxcjW2E7FfO4yf6xNl+aoZfvwsCVVzoUDE8sg
   +FGd0v6MQMd2N33FUcvcyqFHTBP3P9+dL7Vc31Z0BaOC1HFF99A+fqDl9
   UiaKrjPWj1z7eMzZ2ySK0dUXoyYdex1+O4ULMGRXueOP7YqlyrOGu70s0
   A==;
X-CSE-ConnectionGUID: RNq8+bkTR+mVHvFSWhXoVQ==
X-CSE-MsgGUID: 4ZF7RHVlT0a6edyQITBE9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="38625753"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="38625753"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:51:49 -0800
X-CSE-ConnectionGUID: zG70kA9jRJO6bnS7kSVD7A==
X-CSE-MsgGUID: egovEkxJTaiwoyTUHV8nhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="97780689"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Dec 2024 18:51:47 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNkA5-000G0a-1E;
	Wed, 18 Dec 2024 02:51:45 +0000
Date: Wed, 18 Dec 2024 10:51:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/hyp/nvhe/pkvm.c:334 pkvm_init_features_from_host()
 warn: should this be a bitwise op?
Message-ID: <202412181019.5u4EbwmC-lkp@intel.com>
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
TO: Fuad Tabba <tabba@google.com>
CC: Oliver Upton <oliver.upton@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aef25be35d23ec768eed08bfcf7ca3cf9685bc28
commit: cb0c272acebdf099431c34972963377f83872a08 KVM: arm64: Initialize the hypervisor's VM state at EL2
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
config: arm64-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241218/202412181019.5u4EbwmC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412181019.5u4EbwmC-lkp@intel.com/

smatch warnings:
arch/arm64/kvm/hyp/nvhe/pkvm.c:334 pkvm_init_features_from_host() warn: should this be a bitwise op?

vim +334 arch/arm64/kvm/hyp/nvhe/pkvm.c

be66e67f175096 Will Deacon 2022-11-10  294  
cb0c272acebdf0 Fuad Tabba  2024-10-18  295  static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struct kvm *host_kvm)
cb0c272acebdf0 Fuad Tabba  2024-10-18  296  {
cb0c272acebdf0 Fuad Tabba  2024-10-18  297  	struct kvm *kvm = &hyp_vm->kvm;
cb0c272acebdf0 Fuad Tabba  2024-10-18  298  	DECLARE_BITMAP(allowed_features, KVM_VCPU_MAX_FEATURES);
cb0c272acebdf0 Fuad Tabba  2024-10-18  299  
cb0c272acebdf0 Fuad Tabba  2024-10-18  300  	/* No restrictions for non-protected VMs. */
cb0c272acebdf0 Fuad Tabba  2024-10-18  301  	if (!kvm_vm_is_protected(kvm)) {
cb0c272acebdf0 Fuad Tabba  2024-10-18  302  		bitmap_copy(kvm->arch.vcpu_features,
cb0c272acebdf0 Fuad Tabba  2024-10-18  303  			    host_kvm->arch.vcpu_features,
cb0c272acebdf0 Fuad Tabba  2024-10-18  304  			    KVM_VCPU_MAX_FEATURES);
cb0c272acebdf0 Fuad Tabba  2024-10-18  305  		return;
cb0c272acebdf0 Fuad Tabba  2024-10-18  306  	}
cb0c272acebdf0 Fuad Tabba  2024-10-18  307  
cb0c272acebdf0 Fuad Tabba  2024-10-18  308  	bitmap_zero(allowed_features, KVM_VCPU_MAX_FEATURES);
cb0c272acebdf0 Fuad Tabba  2024-10-18  309  
cb0c272acebdf0 Fuad Tabba  2024-10-18  310  	/*
cb0c272acebdf0 Fuad Tabba  2024-10-18  311  	 * For protected VMs, always allow:
cb0c272acebdf0 Fuad Tabba  2024-10-18  312  	 * - CPU starting in poweroff state
cb0c272acebdf0 Fuad Tabba  2024-10-18  313  	 * - PSCI v0.2
cb0c272acebdf0 Fuad Tabba  2024-10-18  314  	 */
cb0c272acebdf0 Fuad Tabba  2024-10-18  315  	set_bit(KVM_ARM_VCPU_POWER_OFF, allowed_features);
cb0c272acebdf0 Fuad Tabba  2024-10-18  316  	set_bit(KVM_ARM_VCPU_PSCI_0_2, allowed_features);
cb0c272acebdf0 Fuad Tabba  2024-10-18  317  
cb0c272acebdf0 Fuad Tabba  2024-10-18  318  	/*
cb0c272acebdf0 Fuad Tabba  2024-10-18  319  	 * Check if remaining features are allowed:
cb0c272acebdf0 Fuad Tabba  2024-10-18  320  	 * - Performance Monitoring
cb0c272acebdf0 Fuad Tabba  2024-10-18  321  	 * - Scalable Vectors
cb0c272acebdf0 Fuad Tabba  2024-10-18  322  	 * - Pointer Authentication
cb0c272acebdf0 Fuad Tabba  2024-10-18  323  	 */
cb0c272acebdf0 Fuad Tabba  2024-10-18  324  	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_PMUVer), PVM_ID_AA64DFR0_ALLOW))
cb0c272acebdf0 Fuad Tabba  2024-10-18  325  		set_bit(KVM_ARM_VCPU_PMU_V3, allowed_features);
cb0c272acebdf0 Fuad Tabba  2024-10-18  326  
cb0c272acebdf0 Fuad Tabba  2024-10-18  327  	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_SVE), PVM_ID_AA64PFR0_ALLOW))
cb0c272acebdf0 Fuad Tabba  2024-10-18  328  		set_bit(KVM_ARM_VCPU_SVE, allowed_features);
cb0c272acebdf0 Fuad Tabba  2024-10-18  329  
cb0c272acebdf0 Fuad Tabba  2024-10-18  330  	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_API), PVM_ID_AA64ISAR1_RESTRICT_UNSIGNED) &&
cb0c272acebdf0 Fuad Tabba  2024-10-18  331  	    FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_APA), PVM_ID_AA64ISAR1_RESTRICT_UNSIGNED))
cb0c272acebdf0 Fuad Tabba  2024-10-18  332  		set_bit(KVM_ARM_VCPU_PTRAUTH_ADDRESS, allowed_features);
cb0c272acebdf0 Fuad Tabba  2024-10-18  333  
cb0c272acebdf0 Fuad Tabba  2024-10-18 @334  	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_GPI), PVM_ID_AA64ISAR1_ALLOW) &&
cb0c272acebdf0 Fuad Tabba  2024-10-18  335  	    FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_GPA), PVM_ID_AA64ISAR1_ALLOW))
cb0c272acebdf0 Fuad Tabba  2024-10-18  336  		set_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, allowed_features);
cb0c272acebdf0 Fuad Tabba  2024-10-18  337  
cb0c272acebdf0 Fuad Tabba  2024-10-18  338  	bitmap_and(kvm->arch.vcpu_features, host_kvm->arch.vcpu_features,
cb0c272acebdf0 Fuad Tabba  2024-10-18  339  		   allowed_features, KVM_VCPU_MAX_FEATURES);
cb0c272acebdf0 Fuad Tabba  2024-10-18  340  }
cb0c272acebdf0 Fuad Tabba  2024-10-18  341  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
