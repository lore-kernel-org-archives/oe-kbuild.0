Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85889184F
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 01:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728955582; cv=none; b=uvUecpFnjyyN0CO9UNPXApQ+y64F+z8URJB065jANQojZNlkYvSF8bA6NU9Ss6OJp+jPv0ADIVxdCB5DF6CrSXebm5Wtju1xTK0t2GW+cE845EfhMR7u/a2O846eVHl5CrQBoF/A2dePgJF2xevQh18E1eF0MRnnSuKKG41wuWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728955582; c=relaxed/simple;
	bh=slA7pvH5xx7Hq/3hy0kTxZsR4CuQE42hGFfAoklirg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CjIDg/7qOJXf3Db5bpfgpsOnDrk8I/uJO0mp4st5iZLuOpxa51cmbvYmQzmXuwfmzfFMtDqT0QXtL2sh8vYTCwAWd7w0I/gH2AFrnPXyJWfDhWm9DZ7+W/R80248BreeYRgpqcavmVWIeWVIsDcZcqdw2QTB0e0GoS90zxE3C/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ih5ktLjo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ih5ktLjo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728955580; x=1760491580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=slA7pvH5xx7Hq/3hy0kTxZsR4CuQE42hGFfAoklirg8=;
  b=Ih5ktLjoLexxbwXiVPFeDOPIaPMantMW3Agwakl6Zdfc1aT/HsTsLnLR
   c7P955Z6E9NI4MXj9KPSXpr0rq5k/Q+X6ZSiWIaVDodkua3irMpLs93uf
   jTiAA70YdNlwh4RbG+NPvMrlYLts0f4B2E/R4IALd/ltD6Yp/DTqrc9F9
   Dg0qvfloYTkujRndLgpsVUMA+I2L8TjTZVMNcvrdjhIeRqVCGpgYzVrpQ
   VF699hfJbh8ydR19QTU2usVwMN6jpfmQeY2689ZFKJREde6d5/pUajfT2
   fCinjTS6r/OAgdnXW9k4vzDOsnanOddR6D/w5jV0KR7pLw6UY4d/wXObP
   A==;
X-CSE-ConnectionGUID: LNX+USGbQZGmtkhzSb7nUQ==
X-CSE-MsgGUID: KADnT/KdT7+VpbWB37iw0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32247146"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="32247146"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 18:26:20 -0700
X-CSE-ConnectionGUID: PJTJh+tGQoScJQH7VflrIQ==
X-CSE-MsgGUID: tVFYTRTaRqGwPaX5AEbzyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="115184381"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Oct 2024 18:26:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0WKG-000HQl-0i;
	Tue, 15 Oct 2024 01:26:16 +0000
Date: Tue, 15 Oct 2024 09:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/vgic/vgic-init.c:394 kvm_vgic_destroy() warn:
 iterator 'i' not incremented
Message-ID: <202410150959.VgOc3fa1-lkp@intel.com>
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
head:   eca631b8fe808748d7585059c4307005ca5c5820
commit: 01ad29d224ff73bc4e16e0ef9ece17f28598c4a4 KVM: arm64: vgic: Simplify kvm_vgic_destroy()
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241015/202410150959.VgOc3fa1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410150959.VgOc3fa1-lkp@intel.com/

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
