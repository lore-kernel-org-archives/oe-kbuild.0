Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463A206E8F
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 19:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729280823; cv=none; b=KDDfXX+IQV3PFkk6wt7/CvFCtugRRgyCIdUkd90UpjonqDJbscVyHpPrsyoKHjbnvIx5PomqcRHv3Mfi9dKrA9fmf0+pLxMVa7jZW8bZFQ3fJ82jwGQI/Y0biInWUasdl74DcsiUiXqVhA5jl2Wl7fl2rBlIiL+Qj4qqh5qq7EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729280823; c=relaxed/simple;
	bh=c2vY/ikcW/nZLRqEkT8UTHay1XD+TBsG5BxeuK9hnh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qc5D15EgngXjBano1dHgWn82A7F5UrojyK71uzxQQSLE9Q59qwd76O20cNaqx72X2UP1wQmyQFlJ2fqZZO/2CNkDZC7LyMWyrMtalMegLG4cwM2kyBSmvirIuobLCAYkjly3eLemCbjr72bnVbmcLSj8dX9/5Ljyf8K7er9rYYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BOxmjZ15; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BOxmjZ15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729280822; x=1760816822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c2vY/ikcW/nZLRqEkT8UTHay1XD+TBsG5BxeuK9hnh0=;
  b=BOxmjZ15SyLRx1KNZX8aMXt5+eQdHAKIc+2Tr41EdoMdB4n2icWaYf4+
   sHOabjfYqplphD9Vo29tz49YajGG88nJd9/JnI341mBksJ5LtqWQu2ybl
   tTJbTvLFmksBC4Y1FlzqS1vqjkqHq69KNWPiJ1CPco12vSwPuO9tsp3xo
   reKCSLDy68s14hUL8HVAk5CLTID+A3JB/zQ7o25ahXsfnd/MHlCKBJCeF
   tGiKiRJRUamIAtsZ7t6jvp8zLpac3Iy61Nz07rTh0O2t05Oqmnk71CriZ
   b0XTAAPS3zCyAeZ9a+7cYpfxiAUe947vJFadatSwA2tXQmP1M6/PJNo8O
   w==;
X-CSE-ConnectionGUID: UQH+jUQOTMON9BsR94LRgQ==
X-CSE-MsgGUID: MZYBGlk6R4qHtxsqB9rFtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="32752018"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="32752018"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 12:47:01 -0700
X-CSE-ConnectionGUID: +0xh+0A/T6uyWPjIag92wg==
X-CSE-MsgGUID: 1NAeW3szTt29SEEpFYkFJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="109784267"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Oct 2024 12:47:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1sw5-000OF1-1l;
	Fri, 18 Oct 2024 19:46:57 +0000
Date: Sat, 19 Oct 2024 03:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/vgic/vgic-init.c:394 kvm_vgic_destroy() warn:
 iterator 'i' not incremented
Message-ID: <202410190341.qNxiRWZw-lkp@intel.com>
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
head:   b1b46751671be5a426982f037a47ae05f37ff80b
commit: 01ad29d224ff73bc4e16e0ef9ece17f28598c4a4 KVM: arm64: vgic: Simplify kvm_vgic_destroy()
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241019/202410190341.qNxiRWZw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410190341.qNxiRWZw-lkp@intel.com/

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
