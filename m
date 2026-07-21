Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA70D3B9D81
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Jul 2026 09:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625303; cv=none; b=FgkxXLiPu6Vi8/UNsql5eOHki/esZsciyKYSiPV9eRmHlKDivp1JSZB3yaMjwhDuSwODyWrg3RX2lBK86ti73qsy4ugrU517WxnPLfE9dkumiKqumrTfQVwqz0RsLsy9nYR5l9PB5HTufKSxW86oigig2/O/wx1h8Lc58r+0v1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625303; c=relaxed/simple;
	bh=p+P/S7A/j6yjU8Y802SWR7FhElbRcYAEYp+4CNWvIrI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VISbMv7LqJkJIuDhG+24jmoEIoH89OMQKc1oy9d3Q8AHUnjcfW45jMH09O1esPxNiHZcvzmfjCaMG69OJLDesnULv/+n3EMx3ID8Iz5OpWvgfPXEdYQ/c6TN58TzSCf52AR9zGksZsZ005cdZi3Cb2cgDEkZ21tGB/Q8YL/qPVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhvYNFDR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhvYNFDR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784625301; x=1816161301;
  h=date:from:to:cc:subject:message-id;
  bh=p+P/S7A/j6yjU8Y802SWR7FhElbRcYAEYp+4CNWvIrI=;
  b=mhvYNFDRMaURrF1/ur+qStPhPmQCFv4CPZkIjQljwHhYtNXEbQDft2Q/
   SpmXE8gJqscKaJwEMGhg3CrrLZqWHViwLI4QAwdCKCcX+w1iK/jp/KQD5
   kIjIjnnOuoH8SurZhhbhbmDQE6njasnOBJY9N53WQ1WICax6OlVZXymXr
   VY8lBiWQDWSOLAGiPvX7HP8EGyAzRvyScapn/WQaEqcL72VCE9/5Wux3/
   isn7MY2gSpOyF9pLYgfKiJX+nrXcQLgzO35vRZZdLDdYthm7WEoeWPXdj
   bwr2Oo8W3ZQ8Q8ykED9MwczppAhBz9dp/kPXj6RffWybYDlhLx3vW+Aih
   w==;
X-CSE-ConnectionGUID: Tr7kWntQTei6b/itiesNXw==
X-CSE-MsgGUID: f4bHS9FuRHOiZLWNh2vsBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="89110630"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="89110630"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 02:15:01 -0700
X-CSE-ConnectionGUID: ZdgW38srQTWEYAdBXyM1BA==
X-CSE-MsgGUID: tyB5Pr/7S/ihWTRh+MJrmQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jul 2026 02:14:59 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wm6Yz-00000000XSc-1TA8;
	Tue, 21 Jul 2026 09:14:57 +0000
Date: Tue, 21 Jul 2026 17:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/vgic/vgic-v5.c:231
 vgic_v5_sync_ppi_priorities() warn: subtract is higher precedence than shift
Message-ID: <202607211739.TBLOVm6c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: Marc Zyngier <maz@kernel.org>
CC: Joey Gouly <joey.gouly@arm.com>
CC: Jonathan Cameron <jonathan.cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b95f03f04d475aa6719d15a636ddf32222d55657
commit: 933e5288fa9714085e384a3d6ad6dcce8089a6b9 KVM: arm64: gic-v5: Check for pending PPIs
date:   4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r073-20260721 (https://download.01.org/0day-ci/archive/20260721/202607211739.TBLOVm6c-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 933e5288fa97 ("KVM: arm64: gic-v5: Check for pending PPIs")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607211739.TBLOVm6c-lkp@intel.com/

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
