Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827680;
	b=B9PnaznDl9MUznwbFpraRkYE6ZZs3D/9Noof0n6Hfr9uoYXYtOIApR6yHF0gXORorhAC
	 SJ0cyvypRi/i9ZqMia0Cr/yRG3e/G0o0q3TzV5A4bK5BiBRKpm1JzIbqY1hTk0job8ShY
	 /tevnLbRiExpxwvhExoyDpzpuE0wiIamnJwpbzA/HvtrYuseZOqw6X3A79wDwZrAw/tQ2
	 Piaqkfyg/2D34CyPmvhS19hH7+Droz6S5WqVLzLkgY84xc+8vqbDz0B3PsQxs5Mx1fWem
	 huIWMrwbC6MeYkmS3acxxG4/AXT/MwDY6ectYVJeoDhC+J+xsgRUOZOJCzY3mSmrlfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827680;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=EG17nlwgai6/FgYKEljSKBcbv/1re+m/rExityyZETk=;
	b=VOtBUujPgYC3Cy14tvTgK0QXhG/iOEZhSNkqft7sigPl0CBMpWtKLEpv/9rCb+Bi5qWU
	 ZZLD0vkEjAsvBVqIR+xCX94wdtnUw/7nyPVT6vjje6+5rs4/CcxDid0yvSrb1khCuU7Ia
	 iul3+2h7NtQS3wlaibNvKVr21wvCN29NDEl6wJsgMHoLH9Q6jBzKQpUabUqf2kEKehV9D
	 Th2came//eIcjUdERJcfcvCZjogHET48eYQYxsqRmCD3uDj9rgUM7vOG3yFS6ZkqCKpVl
	 zP8d1+lUybiokadLHf4Tb6p0AHpLdAhvtHoWrZZ9Bhnxn6UJkqjIfdIT4XMOdHlsbiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=doPIhLjL;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F4D606B2E6
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Nov 2026 21:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30F4D606B2E6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=doPIhLjL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793827680; x=1825363680;
  h=date:from:to:cc:subject:message-id;
  bh=Og7DS9aVB2iOvDh6QSnkbpVfiJOLCNQFJF5STGWz2U8=;
  b=doPIhLjLYmi4F2mOcy7dM7+juoIysbpSWtYfbK/Nvpi42S7QECJGnnhr
   E+Lhp0B198XAknHTgh+/q3alc+kyElGDgrS1AbjLCm+SHaeD4VFRd5uOl
   skkEc78SXDdRPMqyA6nK5K2EB5sgxR9S0Oezdmg/diM5sg8ixvJ0g/Mux
   R50mIxiUTFlEOAhuzEAtNS73EnRIOh7E2RZGEGYfa9d+f6LAvZukenuzr
   IXuBJv8vrUHf4nICImtQY0vWt5LGWtAULbjAlVGjH2DHC6aoh8MpnIVvI
   RUY111IORXXH61rT48evlp7yuzTIHLigzT+XNAc5g8SjtG5fnl2yzsXjM
   w==;
X-CSE-ConnectionGUID: 2J8zErONSiuiEkHs11hsmw==
X-CSE-MsgGUID: uTGrfbssSYmMXt+f4chxGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2702739"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2702739"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 13:27:59 -0800
X-CSE-ConnectionGUID: q36hnL7OQ1qw3/f02HtEdw==
X-CSE-MsgGUID: bK4rrcMBRfadaui4X01KjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6881378"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 04 Nov 2026 13:27:57 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOiWP-000000009Gl-3aWb;
	Wed, 04 Nov 2026 21:27:53 +0000
Date: Wed, 04 Nov 2026 22:27:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:riscv_iommu_misc_v1 27/35]
 arch/riscv/kvm/aia_imsic.c:711 __kvm_riscv_vcpu_irq_update() warn: mixing irq
 and irqsave
Message-ID: <202611042200.NX4mTopN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Andrew Jones <andrew.jones@oss.qualcomm.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://github.com/avpatel/linux.git riscv_iommu_misc_v1
head:   bfa7a6c4f67f2d4d155c3aa2fbc606e5c5189ca0
commit: ef0d72018fdf0d8d92e9031e7c12f621e1f36d7e [27/35] RISC-V: KVM: Add guest file irqbypass support
:::::: branch date: 5 hours ago
:::::: commit date: 6 hours ago
config: riscv-randconfig-2200-20261104 (https://download.01.org/0day-ci/archive/20261104/202611042200.NX4mTopN-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611042200.NX4mTopN-lkp@intel.com/

smatch warnings:
arch/riscv/kvm/aia_imsic.c:711 __kvm_riscv_vcpu_irq_update() warn: mixing irq and irqsave

vim +711 arch/riscv/kvm/aia_imsic.c

ef0d72018fdf0d Andrew Jones 2026-04-19  664  
ef0d72018fdf0d Andrew Jones 2026-04-19  665  static void __kvm_riscv_vcpu_irq_update(struct kvm_vcpu *vcpu, bool release)
ef0d72018fdf0d Andrew Jones 2026-04-19  666  {
ef0d72018fdf0d Andrew Jones 2026-04-19  667  	struct kvm *kvm = vcpu->kvm;
ef0d72018fdf0d Andrew Jones 2026-04-19  668  	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
ef0d72018fdf0d Andrew Jones 2026-04-19  669  	gpa_t gpa = vcpu->arch.aia_context.imsic_addr;
ef0d72018fdf0d Andrew Jones 2026-04-19  670  	struct kvm_aia *aia = &kvm->arch.aia;
ef0d72018fdf0d Andrew Jones 2026-04-19  671  	u64 msi_addr_mask = kvm_riscv_aia_msi_addr_mask(aia);
ef0d72018fdf0d Andrew Jones 2026-04-19  672  	struct riscv_iommu_ir_vcpu_info vcpu_info = {
ef0d72018fdf0d Andrew Jones 2026-04-19  673  		.gpa = gpa,
ef0d72018fdf0d Andrew Jones 2026-04-19  674  		.msi_addr_mask = msi_addr_mask,
ef0d72018fdf0d Andrew Jones 2026-04-19  675  		.msi_addr_pattern = (gpa >> IMSIC_MMIO_PAGE_SHIFT) & ~msi_addr_mask,
ef0d72018fdf0d Andrew Jones 2026-04-19  676  		.group_index_bits = aia->nr_group_bits,
ef0d72018fdf0d Andrew Jones 2026-04-19  677  		.group_index_shift = aia->nr_group_shift,
ef0d72018fdf0d Andrew Jones 2026-04-19  678  	};
ef0d72018fdf0d Andrew Jones 2026-04-19  679  	struct kvm_kernel_irq_routing_entry *irq_entry;
ef0d72018fdf0d Andrew Jones 2026-04-19  680  	struct kvm_kernel_irqfd *irqfd;
ef0d72018fdf0d Andrew Jones 2026-04-19  681  	unsigned long flags;
ef0d72018fdf0d Andrew Jones 2026-04-19  682  	gpa_t target;
ef0d72018fdf0d Andrew Jones 2026-04-19  683  	int host_irq, ret;
ef0d72018fdf0d Andrew Jones 2026-04-19  684  
ef0d72018fdf0d Andrew Jones 2026-04-19  685  	spin_lock_irq(&kvm->irqfds.lock);
ef0d72018fdf0d Andrew Jones 2026-04-19  686  
ef0d72018fdf0d Andrew Jones 2026-04-19  687  	list_for_each_entry(irqfd, &kvm->irqfds.items, list) {
ef0d72018fdf0d Andrew Jones 2026-04-19  688  		if (!irqfd->producer)
ef0d72018fdf0d Andrew Jones 2026-04-19  689  			continue;
ef0d72018fdf0d Andrew Jones 2026-04-19  690  
ef0d72018fdf0d Andrew Jones 2026-04-19  691  		irq_entry = &irqfd->irq_entry;
ef0d72018fdf0d Andrew Jones 2026-04-19  692  		if (irq_entry->type != KVM_IRQ_ROUTING_MSI)
ef0d72018fdf0d Andrew Jones 2026-04-19  693  			continue;
ef0d72018fdf0d Andrew Jones 2026-04-19  694  
ef0d72018fdf0d Andrew Jones 2026-04-19  695  		target = ((gpa_t)irq_entry->msi.address_hi << 32) | irq_entry->msi.address_lo;
ef0d72018fdf0d Andrew Jones 2026-04-19  696  		if (WARN_ON_ONCE(target & (IMSIC_MMIO_PAGE_SZ - 1)))
ef0d72018fdf0d Andrew Jones 2026-04-19  697  			continue;
ef0d72018fdf0d Andrew Jones 2026-04-19  698  
ef0d72018fdf0d Andrew Jones 2026-04-19  699  		if (target != gpa)
ef0d72018fdf0d Andrew Jones 2026-04-19  700  			continue;
ef0d72018fdf0d Andrew Jones 2026-04-19  701  
ef0d72018fdf0d Andrew Jones 2026-04-19  702  		host_irq = irqfd->producer->irq;
ef0d72018fdf0d Andrew Jones 2026-04-19  703  
ef0d72018fdf0d Andrew Jones 2026-04-19  704  		if (release) {
ef0d72018fdf0d Andrew Jones 2026-04-19  705  			ret = irq_set_vcpu_affinity(host_irq, NULL);
ef0d72018fdf0d Andrew Jones 2026-04-19  706  		} else {
ef0d72018fdf0d Andrew Jones 2026-04-19  707  			/*
ef0d72018fdf0d Andrew Jones 2026-04-19  708  			 * irqfds.lock -> vsfile_lock(read), same order as
ef0d72018fdf0d Andrew Jones 2026-04-19  709  			 * kvm_arch_update_irqfd_routing()
ef0d72018fdf0d Andrew Jones 2026-04-19  710  			 */
ef0d72018fdf0d Andrew Jones 2026-04-19 @711  			read_lock_irqsave(&imsic->vsfile_lock, flags);
ef0d72018fdf0d Andrew Jones 2026-04-19  712  			if (imsic->vsfile_cpu < 0) {
ef0d72018fdf0d Andrew Jones 2026-04-19  713  				read_unlock_irqrestore(&imsic->vsfile_lock, flags);
ef0d72018fdf0d Andrew Jones 2026-04-19  714  				break;
ef0d72018fdf0d Andrew Jones 2026-04-19  715  			}
ef0d72018fdf0d Andrew Jones 2026-04-19  716  			vcpu_info.hpa = imsic->vsfile_pa;
ef0d72018fdf0d Andrew Jones 2026-04-19  717  			ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
ef0d72018fdf0d Andrew Jones 2026-04-19  718  			read_unlock_irqrestore(&imsic->vsfile_lock, flags);
ef0d72018fdf0d Andrew Jones 2026-04-19  719  		}
ef0d72018fdf0d Andrew Jones 2026-04-19  720  		WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
ef0d72018fdf0d Andrew Jones 2026-04-19  721  		if (ret)
ef0d72018fdf0d Andrew Jones 2026-04-19  722  			break;
ef0d72018fdf0d Andrew Jones 2026-04-19  723  	}
ef0d72018fdf0d Andrew Jones 2026-04-19  724  
ef0d72018fdf0d Andrew Jones 2026-04-19  725  	spin_unlock_irq(&kvm->irqfds.lock);
ef0d72018fdf0d Andrew Jones 2026-04-19  726  }
ef0d72018fdf0d Andrew Jones 2026-04-19  727  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
