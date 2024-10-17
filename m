Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11E21EE022
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Oct 2024 21:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729199695; cv=none; b=pxNdPFjwaNVcrXJcDeVxr0rpyF5PVwkaxQN4iQhA6jSKgdq0x7ajQTIJzUpfew0/AwCbsE1iR0P347qYvOnOLDAFPfPbLFSvjhDCUx6bY3UBumZh9QQUwtcc4nzOVgniuXGYQ9OcdMrMUt/rKFtJUz0205bzLXyQbR5ssvik4P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729199695; c=relaxed/simple;
	bh=Qa1oM/5HuMrP1nEvzTtAYr9RPL4cyZZ8yjEQa355UTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p6SHhxUNEkf6s7MKPfDxRSkbd1yB4gdnsTisWAzNvDjjYLGR5iCrfFJ8azOJ9jadBLfOi2BQkXruCMeb5w3DN2X78xtcG03vcZIvFr/22fNmtyvoLdcER46VjjDIlBubUFhNfh8pK2bQBePclDtQF2sgj8ckCwEMJvZs9dixx9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZF5NQhY6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZF5NQhY6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729199690; x=1760735690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qa1oM/5HuMrP1nEvzTtAYr9RPL4cyZZ8yjEQa355UTM=;
  b=ZF5NQhY6WjYCa7HUEYPfUYkBJo5Odb3NoTKaBA0KQYPRKGILjqg4XIRI
   jZ4n6/0vOyvelRI74LIj4yLOZDPshlra0UetaD7M7+TaKFN4mxhsG+GqQ
   4W8A4XNmtUAMxrSYUT3lJiKLKjdXr0DTGJ64Tt02B+/x4GgZavdYviFyy
   JmzHc1KqXaaq9+HkYPoLXB6kX5qJq5uir8TOsJ6S6D87IqPRTu3Pvpunr
   FXR+vQjaZpUhVI+LWKsI+r98uNvNomluiBFqKfHO2MOMNfyGp1VNStrqC
   0rBriDe2v48OSj64GncMYL8BkMg3zhxazF6P1PktQCTnYajVPlLcScF7B
   g==;
X-CSE-ConnectionGUID: IPS/sNSWSzaEMXptMlrSbw==
X-CSE-MsgGUID: +TAHqrcZTUCAqvbULB1ZCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="39296958"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="39296958"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 14:14:50 -0700
X-CSE-ConnectionGUID: cTnzcDjWTH+FAqgkprMzfQ==
X-CSE-MsgGUID: 0+p/w7LEQFGcViWgpCVxYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="82631204"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Oct 2024 14:14:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1XpW-000Mwd-1a;
	Thu, 17 Oct 2024 21:14:46 +0000
Date: Fri, 18 Oct 2024 05:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/vgic/vgic-init.c:394 kvm_vgic_destroy() warn:
 iterator 'i' not incremented
Message-ID: <202410180513.nstvj66G-lkp@intel.com>
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
head:   6efbea77b390604a7be7364583e19cd2d6a1291b
commit: 01ad29d224ff73bc4e16e0ef9ece17f28598c4a4 KVM: arm64: vgic: Simplify kvm_vgic_destroy()
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241018/202410180513.nstvj66G-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410180513.nstvj66G-lkp@intel.com/

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
