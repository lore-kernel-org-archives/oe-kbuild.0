Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB56319866
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Nov 2025 16:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762188429; cv=none; b=C1WEgAVHc3Byo/9Wf5HV9RIU2xr+7TbbMpTQ9DVggVvhlcy2vs/iUUSoiLE8xU+aihPep7qwAo8HUZSO72XcoHVYtY/rfwT6/GmsYtvc0OoX4o3JDMjnbZmcf5jB6k7OtFj+lx3Is1eUiMrYxrXTWADcNTPOK7eE9wk0KS69Kn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762188429; c=relaxed/simple;
	bh=AYZ3lXzgbHLGG4FwEzKMIg4GSNVptIehYhI8zpe7F4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NA3N36hCXgDT9/9/Y3d7F9sNSV5S0v6CntLBkQ8EATZsAYQ6vZ6J5dCfSZtppyB2ebTdf21sqDl7ygVuQT5NtTM+VqB0KYChdoOoDPPFg+bU0/1GjquZMFvUcj8d/Co3/IFHsP7tbjmM4e2mHpg0TeSNyFzpcKUVNLzUU2BrvNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=im1vJHsR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="im1vJHsR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762188427; x=1793724427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AYZ3lXzgbHLGG4FwEzKMIg4GSNVptIehYhI8zpe7F4c=;
  b=im1vJHsRxDLAhOFROVhiU2dXvXKjyv6k05mbyBpNwJ83AzGL5NynsSXh
   pVpZSMTXvfeB9w/0oF9Gpp5EKh2VdE/YSdIH/2hYXdiVW7t2QVAEkg4ru
   LrceLRhIRTQiJW1CSK2/wf8u7iD8TkeDe5l+lV5moqStCanALH2Bkf6FI
   XkO3VVpEfziRNCwOgc5xyP7IV1nBchB/k89BnLmWbAfmjhXx7arjDlWrB
   efyJIi9UOyAbn36WXVrz0iHfgmhmtKzIsBL5A0mjdGQC4H9+7JyC5zfVU
   pHMh/RD9/3eaKgeOIuOXLWFvtsLOXtKzePBhSo52RM4ttITddWIKzgoxo
   A==;
X-CSE-ConnectionGUID: f4sdH5TaRWSRr4evuIgztA==
X-CSE-MsgGUID: NZSay/fsT/azp1LNwHVAJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64301770"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="64301770"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 08:47:04 -0800
X-CSE-ConnectionGUID: uhsLihLfSMuWRCj71AkMpg==
X-CSE-MsgGUID: Xms974ilTgivhxXNM5ijAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="224161338"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Nov 2025 08:47:02 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFxht-000QMG-17;
	Mon, 03 Nov 2025 16:47:01 +0000
Date: Tue, 4 Nov 2025 00:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:riscv_trace_support_v1 24/57]
 arch/riscv/kvm/aia_imsic.c:841 kvm_arch_update_irqfd_routing() error:
 uninitialized symbol 'vcpu'.
Message-ID: <202511040050.0Y37MZUe-lkp@intel.com>
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
TO: Andrew Jones <ajones@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   3f71314c58520f6fada72d7f0364429fc3e8bf50
commit: ac8926edb2c3b1d5e8e1ac2dece8eb31efe98397 [24/57] RISC-V: KVM: Add guest file irqbypass support
:::::: branch date: 6 days ago
:::::: commit date: 8 days ago
config: riscv-randconfig-r071-20251103 (https://download.01.org/0day-ci/archive/20251104/202511040050.0Y37MZUe-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511040050.0Y37MZUe-lkp@intel.com/

New smatch warnings:
arch/riscv/kvm/aia_imsic.c:841 kvm_arch_update_irqfd_routing() error: uninitialized symbol 'vcpu'.

Old smatch warnings:
include/linux/kvm_host.h:1027 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented

vim +/vcpu +841 arch/riscv/kvm/aia_imsic.c

db8b7e97d6137a Anup Patel   2023-06-15  793  
ac8926edb2c3b1 Andrew Jones 2025-09-20  794  void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
ac8926edb2c3b1 Andrew Jones 2025-09-20  795  				   struct kvm_kernel_irq_routing_entry *old,
ac8926edb2c3b1 Andrew Jones 2025-09-20  796  				   struct kvm_kernel_irq_routing_entry *new)
ac8926edb2c3b1 Andrew Jones 2025-09-20  797  {
ac8926edb2c3b1 Andrew Jones 2025-09-20  798  	struct riscv_iommu_ir_vcpu_info vcpu_info;
ac8926edb2c3b1 Andrew Jones 2025-09-20  799  	struct kvm *kvm = irqfd->kvm;
ac8926edb2c3b1 Andrew Jones 2025-09-20  800  	struct kvm_aia *aia = &kvm->arch.aia;
ac8926edb2c3b1 Andrew Jones 2025-09-20  801  	int host_irq = irqfd->producer->irq;
ac8926edb2c3b1 Andrew Jones 2025-09-20  802  	struct irq_data *irqdata = irq_get_irq_data(host_irq);
ac8926edb2c3b1 Andrew Jones 2025-09-20  803  	unsigned long tmp, flags;
ac8926edb2c3b1 Andrew Jones 2025-09-20  804  	struct kvm_vcpu *vcpu;
ac8926edb2c3b1 Andrew Jones 2025-09-20  805  	struct imsic *imsic;
ac8926edb2c3b1 Andrew Jones 2025-09-20  806  	struct msi_msg msg;
ac8926edb2c3b1 Andrew Jones 2025-09-20  807  	u64 msi_addr_mask;
ac8926edb2c3b1 Andrew Jones 2025-09-20  808  	gpa_t target;
ac8926edb2c3b1 Andrew Jones 2025-09-20  809  	int ret;
ac8926edb2c3b1 Andrew Jones 2025-09-20  810  
ac8926edb2c3b1 Andrew Jones 2025-09-20  811  	if (old && old->type == KVM_IRQ_ROUTING_MSI &&
ac8926edb2c3b1 Andrew Jones 2025-09-20  812  	    new && new->type == KVM_IRQ_ROUTING_MSI &&
ac8926edb2c3b1 Andrew Jones 2025-09-20  813  	    !memcmp(&old->msi, &new->msi, sizeof(new->msi)))
ac8926edb2c3b1 Andrew Jones 2025-09-20  814  		return;
ac8926edb2c3b1 Andrew Jones 2025-09-20  815  
ac8926edb2c3b1 Andrew Jones 2025-09-20  816  	if (!new) {
ac8926edb2c3b1 Andrew Jones 2025-09-20  817  		if (!WARN_ON_ONCE(!old) && old->type == KVM_IRQ_ROUTING_MSI) {
ac8926edb2c3b1 Andrew Jones 2025-09-20  818  			ret = irq_set_vcpu_affinity(host_irq, NULL);
ac8926edb2c3b1 Andrew Jones 2025-09-20  819  			WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
ac8926edb2c3b1 Andrew Jones 2025-09-20  820  		}
ac8926edb2c3b1 Andrew Jones 2025-09-20  821  		return;
ac8926edb2c3b1 Andrew Jones 2025-09-20  822  	}
ac8926edb2c3b1 Andrew Jones 2025-09-20  823  
ac8926edb2c3b1 Andrew Jones 2025-09-20  824  	if (new->type != KVM_IRQ_ROUTING_MSI)
ac8926edb2c3b1 Andrew Jones 2025-09-20  825  		return;
ac8926edb2c3b1 Andrew Jones 2025-09-20  826  
ac8926edb2c3b1 Andrew Jones 2025-09-20  827  	target = ((gpa_t)new->msi.address_hi << 32) | new->msi.address_lo;
ac8926edb2c3b1 Andrew Jones 2025-09-20  828  	if (WARN_ON_ONCE(target & (IMSIC_MMIO_PAGE_SZ - 1)))
ac8926edb2c3b1 Andrew Jones 2025-09-20  829  		return;
ac8926edb2c3b1 Andrew Jones 2025-09-20  830  
ac8926edb2c3b1 Andrew Jones 2025-09-20  831  	msg = (struct msi_msg){
ac8926edb2c3b1 Andrew Jones 2025-09-20  832  		.address_hi = new->msi.address_hi,
ac8926edb2c3b1 Andrew Jones 2025-09-20  833  		.address_lo = new->msi.address_lo,
ac8926edb2c3b1 Andrew Jones 2025-09-20  834  		.data = new->msi.data,
ac8926edb2c3b1 Andrew Jones 2025-09-20  835  	};
ac8926edb2c3b1 Andrew Jones 2025-09-20  836  
ac8926edb2c3b1 Andrew Jones 2025-09-20  837  	kvm_for_each_vcpu(tmp, vcpu, kvm) {
ac8926edb2c3b1 Andrew Jones 2025-09-20  838  		if (target == vcpu->arch.aia_context.imsic_addr)
ac8926edb2c3b1 Andrew Jones 2025-09-20  839  			break;
ac8926edb2c3b1 Andrew Jones 2025-09-20  840  	}
ac8926edb2c3b1 Andrew Jones 2025-09-20 @841  	if (!vcpu)
ac8926edb2c3b1 Andrew Jones 2025-09-20  842  		return;
ac8926edb2c3b1 Andrew Jones 2025-09-20  843  
ac8926edb2c3b1 Andrew Jones 2025-09-20  844  	msi_addr_mask = kvm_riscv_aia_msi_addr_mask(aia);
ac8926edb2c3b1 Andrew Jones 2025-09-20  845  	vcpu_info = (struct riscv_iommu_ir_vcpu_info){
ac8926edb2c3b1 Andrew Jones 2025-09-20  846  		.gpa = target,
ac8926edb2c3b1 Andrew Jones 2025-09-20  847  		.msi_addr_mask = msi_addr_mask,
ac8926edb2c3b1 Andrew Jones 2025-09-20  848  		.msi_addr_pattern = (target >> IMSIC_MMIO_PAGE_SHIFT) & ~msi_addr_mask,
ac8926edb2c3b1 Andrew Jones 2025-09-20  849  		.group_index_bits = aia->nr_group_bits,
ac8926edb2c3b1 Andrew Jones 2025-09-20  850  		.group_index_shift = aia->nr_group_shift,
ac8926edb2c3b1 Andrew Jones 2025-09-20  851  	};
ac8926edb2c3b1 Andrew Jones 2025-09-20  852  
ac8926edb2c3b1 Andrew Jones 2025-09-20  853  	imsic = vcpu->arch.aia_context.imsic_state;
ac8926edb2c3b1 Andrew Jones 2025-09-20  854  
ac8926edb2c3b1 Andrew Jones 2025-09-20  855  	read_lock_irqsave(&imsic->vsfile_lock, flags);
ac8926edb2c3b1 Andrew Jones 2025-09-20  856  
ac8926edb2c3b1 Andrew Jones 2025-09-20  857  	if (WARN_ON_ONCE(imsic->vsfile_cpu < 0))
ac8926edb2c3b1 Andrew Jones 2025-09-20  858  		goto out;
ac8926edb2c3b1 Andrew Jones 2025-09-20  859  
ac8926edb2c3b1 Andrew Jones 2025-09-20  860  	vcpu_info.hpa = imsic->vsfile_pa;
ac8926edb2c3b1 Andrew Jones 2025-09-20  861  
ac8926edb2c3b1 Andrew Jones 2025-09-20  862  	ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
ac8926edb2c3b1 Andrew Jones 2025-09-20  863  	WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
ac8926edb2c3b1 Andrew Jones 2025-09-20  864  	if (ret)
ac8926edb2c3b1 Andrew Jones 2025-09-20  865  		goto out;
ac8926edb2c3b1 Andrew Jones 2025-09-20  866  
ac8926edb2c3b1 Andrew Jones 2025-09-20  867  	irq_data_get_irq_chip(irqdata)->irq_write_msi_msg(irqdata, &msg);
ac8926edb2c3b1 Andrew Jones 2025-09-20  868  
ac8926edb2c3b1 Andrew Jones 2025-09-20  869  out:
ac8926edb2c3b1 Andrew Jones 2025-09-20  870  	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
ac8926edb2c3b1 Andrew Jones 2025-09-20  871  }
ac8926edb2c3b1 Andrew Jones 2025-09-20  872  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
