Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA511925BC
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 02:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774925337; cv=none; b=oBAtF689bNmfPZ+pXmnllVBsXIyom2adIWJvm3ctdubwuXExioo3Z0eZkl+SaTX0wsLsx1n27p0dBgfuDXOsJGXbIABPj+CqVmbovUtvyGT2hIB8UjKWJnAzzJSi/vT3bGMjaeZKuOtUhiiBhsBpdmKp5Oi3Ta261J9VGm/0sgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774925337; c=relaxed/simple;
	bh=mHWoW9Nv9OUeQnOYetm1QJYuQ4a0CLPY2zoM8eRWDzU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aWh0XGRUr6UyeoxGmhBi7rqD8zYYgsLulHnP/B5s/ZRrLhZT5lbEt2/zX/j6Wmo8mdOMXW7stexzATDYoXmOeKsuE0YdXUC5NUHslUaIeq/qnL6sndxer7BLb0JSL/e/qggS2LjIPpjyEVqlWLNuPfgwTl2jGrRIQGWBocNeJTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pf+TlSA4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pf+TlSA4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774925336; x=1806461336;
  h=date:from:to:cc:subject:message-id;
  bh=mHWoW9Nv9OUeQnOYetm1QJYuQ4a0CLPY2zoM8eRWDzU=;
  b=Pf+TlSA4Co3MlaKPlyFERn4Qj4Snm/CFTTCfavD7OkDStL0VpBY1Ungx
   HjRGvaXFR/B0KAWJ4mE/mRCmtCzR4jQCg8/tm34lo1+epLtUvwgGZ9OIw
   FC8JThSXIwJt8juWx6gfS2tbc8xjGX+mSHYQUlN756u7z1puNa462LcSF
   W3sPJRsuG+5IJke6sHEutrh4PFjZ3DGsQL2XApQSUvv35GnLAPpk8Cgos
   xuJqRSNBR4IXYWuSE4LOmEWHyqCkThFJsvAqMdEXCKeYsd1Ij3PeBvS9x
   LwdDhbmyYMPcCVE29SGVS5w6lkFBqRF/SSZrHkKzWWpnrkqwLDqgI3zse
   Q==;
X-CSE-ConnectionGUID: qpy1sPdVTnyCsAQgBgY6Qw==
X-CSE-MsgGUID: NX7tI8FyRDyZFOgr7/JvRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75101473"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="75101473"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 19:48:55 -0700
X-CSE-ConnectionGUID: JdL29+0wT4aJeFsX+9Rjng==
X-CSE-MsgGUID: Jtdstx8TQzWkaItwYCMf7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="225242254"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Mar 2026 19:48:54 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7P9v-0000000023p-15OZ;
	Tue, 31 Mar 2026 02:48:51 +0000
Date: Tue, 31 Mar 2026 10:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5932/10352]
 arch/arm64/kvm/vgic/vgic-v5.c:231 vgic_v5_sync_ppi_priorities() warn:
 subtract is higher precedence than shift
Message-ID: <202603311033.HLhkGi9K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: Marc Zyngier <maz@kernel.org>
CC: Joey Gouly <joey.gouly@arm.com>
CC: Jonathan Cameron <jonathan.cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cf7c3c02fdd0dfccf4d6611714273dcb538af2cb
commit: 933e5288fa9714085e384a3d6ad6dcce8089a6b9 [5932/10352] KVM: arm64: gic-v5: Check for pending PPIs
:::::: branch date: 6 hours ago
:::::: commit date: 11 days ago
config: arm64-randconfig-r072-20260330 (https://download.01.org/0day-ci/archive/20260331/202603311033.HLhkGi9K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603311033.HLhkGi9K-lkp@intel.com/

smatch warnings:
arch/arm64/kvm/vgic/vgic-v5.c:231 vgic_v5_sync_ppi_priorities() warn: subtract is higher precedence than shift
arch/arm64/kvm/vgic/vgic-v5.c:231 vgic_v5_sync_ppi_priorities() warn: subtract is higher precedence than shift
arch/arm64/kvm/vgic/vgic-v5.c:231 vgic_v5_sync_ppi_priorities() warn: subtract is higher precedence than shift
arch/arm64/kvm/vgic/vgic-v5.c:231 vgic_v5_sync_ppi_priorities() warn: subtract is higher precedence than shift

vim +231 arch/arm64/kvm/vgic/vgic-v5.c

4d591252bacb2d Sascha Bischoff 2026-03-19  199  
933e5288fa9714 Sascha Bischoff 2026-03-19  200  /*
933e5288fa9714 Sascha Bischoff 2026-03-19  201   * Sync back the PPI priorities to the vgic_irq shadow state for any interrupts
933e5288fa9714 Sascha Bischoff 2026-03-19  202   * exposed to the guest (skipping all others).
933e5288fa9714 Sascha Bischoff 2026-03-19  203   */
933e5288fa9714 Sascha Bischoff 2026-03-19  204  static void vgic_v5_sync_ppi_priorities(struct kvm_vcpu *vcpu)
933e5288fa9714 Sascha Bischoff 2026-03-19  205  {
933e5288fa9714 Sascha Bischoff 2026-03-19  206  	struct vgic_v5_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v5;
933e5288fa9714 Sascha Bischoff 2026-03-19  207  	u64 priorityr;
933e5288fa9714 Sascha Bischoff 2026-03-19  208  	int i;
933e5288fa9714 Sascha Bischoff 2026-03-19  209  
933e5288fa9714 Sascha Bischoff 2026-03-19  210  	/*
933e5288fa9714 Sascha Bischoff 2026-03-19  211  	 * We have up to 16 PPI Priority regs, but only have a few interrupts
933e5288fa9714 Sascha Bischoff 2026-03-19  212  	 * that the guest is allowed to use. Limit our sync of PPI priorities to
933e5288fa9714 Sascha Bischoff 2026-03-19  213  	 * those actually exposed to the guest by first iterating over the mask
933e5288fa9714 Sascha Bischoff 2026-03-19  214  	 * of exposed PPIs.
933e5288fa9714 Sascha Bischoff 2026-03-19  215  	 */
933e5288fa9714 Sascha Bischoff 2026-03-19  216  	for_each_set_bit(i, vcpu->kvm->arch.vgic.gicv5_vm.vgic_ppi_mask, VGIC_V5_NR_PRIVATE_IRQS) {
933e5288fa9714 Sascha Bischoff 2026-03-19  217  		u32 intid = vgic_v5_make_ppi(i);
933e5288fa9714 Sascha Bischoff 2026-03-19  218  		struct vgic_irq *irq;
933e5288fa9714 Sascha Bischoff 2026-03-19  219  		int pri_idx, pri_reg, pri_bit;
933e5288fa9714 Sascha Bischoff 2026-03-19  220  		u8 priority;
933e5288fa9714 Sascha Bischoff 2026-03-19  221  
933e5288fa9714 Sascha Bischoff 2026-03-19  222  		/*
933e5288fa9714 Sascha Bischoff 2026-03-19  223  		 * Determine which priority register and the field within it to
933e5288fa9714 Sascha Bischoff 2026-03-19  224  		 * extract.
933e5288fa9714 Sascha Bischoff 2026-03-19  225  		 */
933e5288fa9714 Sascha Bischoff 2026-03-19  226  		pri_reg = i / 8;
933e5288fa9714 Sascha Bischoff 2026-03-19  227  		pri_idx = i % 8;
933e5288fa9714 Sascha Bischoff 2026-03-19  228  		pri_bit = pri_idx * 8;
933e5288fa9714 Sascha Bischoff 2026-03-19  229  
933e5288fa9714 Sascha Bischoff 2026-03-19  230  		priorityr = cpu_if->vgic_ppi_priorityr[pri_reg];
933e5288fa9714 Sascha Bischoff 2026-03-19 @231  		priority = field_get(GENMASK(pri_bit + 4, pri_bit), priorityr);
933e5288fa9714 Sascha Bischoff 2026-03-19  232  
933e5288fa9714 Sascha Bischoff 2026-03-19  233  		irq = vgic_get_vcpu_irq(vcpu, intid);
933e5288fa9714 Sascha Bischoff 2026-03-19  234  
933e5288fa9714 Sascha Bischoff 2026-03-19  235  		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock)
933e5288fa9714 Sascha Bischoff 2026-03-19  236  			irq->priority = priority;
933e5288fa9714 Sascha Bischoff 2026-03-19  237  
933e5288fa9714 Sascha Bischoff 2026-03-19  238  		vgic_put_irq(vcpu->kvm, irq);
933e5288fa9714 Sascha Bischoff 2026-03-19  239  	}
933e5288fa9714 Sascha Bischoff 2026-03-19  240  }
933e5288fa9714 Sascha Bischoff 2026-03-19  241  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
