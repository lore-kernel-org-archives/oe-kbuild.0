Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB47C1FE0F3
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 21:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027735; cv=none; b=A2sUAy4G2N0MuogiUMBEE9UrCjs58p3+7RdpehnLrggcEaxdI81VCx3JLfcGHOzqW5/kOnwVPDMglii3lsyJkztlaLDDcXfP9oywyDbLsFgJx5Rng6+9Gxc1y8ldRCggkEZCcPngxOjga3CHQsFGlxndEIFsdHaVwUSkS35MOuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027735; c=relaxed/simple;
	bh=BnmRch6QnjUXq6QCmZaNIwOIR516PXoltUarsEH2ZXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kw2P4wWbu6m4g7l86h830UcVBgYUmnLLaF5ds1ypaNJ8Tb9b8BuHx4cQanVkwlC+UHw32buGUHoUg8YgEP7LI1oyceLsrmMrSWkoXZF0/9I4BMtX8MXp/rWyzvpq7CpcZupp8xWyvUEL5k+I2LK8k4+pbA2Tvxptx0otN++4AZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Me9mvnPR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Me9mvnPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729027733; x=1760563733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BnmRch6QnjUXq6QCmZaNIwOIR516PXoltUarsEH2ZXo=;
  b=Me9mvnPRhinRKcheT6lcankeICyUcp2lx9kAUY3quzc2RYlgWSKPYoic
   kXwv4PZEcxGC2qhW3bv3+UKkTINu2z9vUKRQTmwXxadEvYPtZeicxNOJM
   CMxz8JaTIq7i24f+myCjjiyvjh4yV8/P0AxWAC+r2ZrQHoaz6Doq6ox1H
   wngG8LJg/knRKoTkUFLOf7lx2mf7edUMgtRMNLXqyoWXyz7B6FophJItb
   fHT3v/Uw+HHGH3hWI+JaGk3u6Lecq8F+B9abrT237hW/e8h5eDsv6HEHi
   ve0nwYsxc8W1KY748LSAMftnd7NVsF+ZmxO1A/79Bcz7sr725rjq6QgaZ
   Q==;
X-CSE-ConnectionGUID: geJ+tS9DSOWD6v3LNGCO5Q==
X-CSE-MsgGUID: rZ/44mDyT5KR6XRk/67UNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45926038"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45926038"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 14:28:53 -0700
X-CSE-ConnectionGUID: s6k9nkf9Qmmb73+VY3uBGw==
X-CSE-MsgGUID: uLVKbRyvTkuAeudq0Vq4aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="78482923"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Oct 2024 14:28:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0p61-000Jx5-0P;
	Tue, 15 Oct 2024 21:28:49 +0000
Date: Wed, 16 Oct 2024 05:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/vgic/vgic-init.c:394 kvm_vgic_destroy() warn:
 iterator 'i' not incremented
Message-ID: <202410160540.pz7sYW0V-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
commit: 01ad29d224ff73bc4e16e0ef9ece17f28598c4a4 KVM: arm64: vgic: Simplify kvm_vgic_destroy()
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241016/202410160540.pz7sYW0V-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410160540.pz7sYW0V-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/vgic/vgic-init.c:394 kvm_vgic_destroy() warn: iterator 'i' not incremented

Old smatch warnings:
arch/arm64/kvm/vgic/vgic-init.c:101 kvm_vgic_create() warn: iterator 'i' not incremented

vim +/i +394 arch/arm64/kvm/vgic/vgic-init.c

ad275b8bb1e659 virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  384  
01ad29d224ff73 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2023-12-07  385  void kvm_vgic_destroy(struct kvm *kvm)
ad275b8bb1e659 virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  386  {
ad275b8bb1e659 virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  387  	struct kvm_vcpu *vcpu;
46808a4cb89708 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2021-11-16  388  	unsigned long i;
ad275b8bb1e659 virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  389  
01ad29d224ff73 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2023-12-07  390  	mutex_lock(&kvm->slots_lock);
f00327731131d1 arch/arm64/kvm/vgic/vgic-init.c Oliver Upton     2023-03-27  391  
10f92c4c537794 virt/kvm/arm/vgic/vgic-init.c   Christoffer Dall 2017-01-17  392  	vgic_debug_destroy(kvm);
10f92c4c537794 virt/kvm/arm/vgic/vgic-init.c   Christoffer Dall 2017-01-17  393  
ad275b8bb1e659 virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21 @394  	kvm_for_each_vcpu(i, vcpu, kvm)
ad275b8bb1e659 virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  395  		kvm_vgic_vcpu_destroy(vcpu);
969ce8b5260d8e virt/kvm/arm/vgic/vgic-init.c   Zenghui Yu       2020-04-14  396  
01ad29d224ff73 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2023-12-07  397  	mutex_lock(&kvm->arch.config_lock);
01ad29d224ff73 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2023-12-07  398  
969ce8b5260d8e virt/kvm/arm/vgic/vgic-init.c   Zenghui Yu       2020-04-14  399  	kvm_vgic_dist_destroy(kvm);
ad275b8bb1e659 virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  400  
f00327731131d1 arch/arm64/kvm/vgic/vgic-init.c Oliver Upton     2023-03-27  401  	mutex_unlock(&kvm->arch.config_lock);
01ad29d224ff73 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2023-12-07  402  	mutex_unlock(&kvm->slots_lock);
1193e6aeecb36c virt/kvm/arm/vgic/vgic-init.c   Marc Zyngier     2017-01-12  403  }
1193e6aeecb36c virt/kvm/arm/vgic/vgic-init.c   Marc Zyngier     2017-01-12  404  

:::::: The code at line 394 was first introduced by commit
:::::: ad275b8bb1e659b14120174d87e3c1fdc22e9978 KVM: arm/arm64: vgic-new: vgic_init: implement vgic_init

:::::: TO: Eric Auger <eric.auger@linaro.org>
:::::: CC: Christoffer Dall <christoffer.dall@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
