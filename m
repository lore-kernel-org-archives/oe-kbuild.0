Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C0331DD96
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766479171; cv=none; b=M/luFZVWmhCyX7gpO3P0+Loj+T5JHW8+IVrSeCRGFSrzxmeRCYI2tmUa4ZvzSeA0QuznAJKL8W8VGyi9L1pW9y9JTST2z471Fnx2rXcMZaHPCAO0c4BneE5UySOblMBP2/egX7DbmHi3M+CSA1HmYCpQjGUT94l2C+g8ZtAT7xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766479171; c=relaxed/simple;
	bh=ph9MZ6TEAC673rfR2S4zcl/x5eI1PsYGSi9bchw+UTA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hjFsJrVQOiaAjvCuLp4SrAAUCOSP9VxQRXjaUa1jenudbBp+SSc5sqc4q48FKLzv6ODCpnV/tKzuQ6EaZBlzUUVAd5Wua9P9tFDezGQAuoiFXMPorjZl5o4wQXF6DE5bbKdxFsHF9s3KrkTKRUPvDaPik7RSzU8GBQ0DwzHFxZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZrYCxuU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZrYCxuU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766479169; x=1798015169;
  h=date:from:to:cc:subject:message-id;
  bh=ph9MZ6TEAC673rfR2S4zcl/x5eI1PsYGSi9bchw+UTA=;
  b=HZrYCxuUpjRt9u3oeceP7Aeq+naIhtbppEaLpxR4Mwc3sKBtMi5TD7VC
   larAHm9Ywte4v9F9J/F8qt4umAq5nFGsM0BVb1zhP8aV5/Zk96/7ab4nv
   xGzL7Hy2qWu7WdZQhf3LlZmUe32lhg7FcMoa/Y2GwLiylQb/Pciq55Eat
   efjOlfdaRVrcwwwj99PjyWkIBljb1G3KpU67qhkvNdVVLeTt3SPOVdsqV
   KWCKa8N1atSuXO5INXnBXy1mdS031izLeVBPPJw/pexD3iqcriUsqj9GE
   T+fPWB3yjwSCFwCN4urYCWR7cSvtcinH0T6/yRlTmzED0x9/A4Fj4ldkV
   Q==;
X-CSE-ConnectionGUID: HeGRywMSTQi8NwqRDdlTnw==
X-CSE-MsgGUID: 38SI6s5iQTyHfimy2AfmcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="78960638"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="78960638"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 00:39:26 -0800
X-CSE-ConnectionGUID: kAh+LmFkTvS7UeCV9cphDA==
X-CSE-MsgGUID: AyVSl4SBTPiWrMzMJJNRyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="204255986"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Dec 2025 00:39:25 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXxvO-000000001eX-0rI3;
	Tue, 23 Dec 2025 08:39:22 +0000
Date: Tue, 23 Dec 2025 16:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [arm-platforms:kvm-arm64/gicv5-full 48/82]
 arch/arm64/kvm/vgic/vgic-v5.c:782:5-12: WARNING: Unsigned expression compared
 with zero: db_virq < 0
Message-ID: <202512231628.Oi8sU7No-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
TO: Sascha Bischoff <sascha.bischoff@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: 784f082a09f253879e4c4f57182b3a7e0bb92539 [48/82] KVM: arm64: gic-v5: Init/tear down VMTEs
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r064-20251223 (https://download.01.org/0day-ci/archive/20251223/202512231628.Oi8sU7No-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512231628.Oi8sU7No-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/vgic/vgic-v5.c:782:5-12: WARNING: Unsigned expression compared with zero: db_virq < 0

vim +782 arch/arm64/kvm/vgic/vgic-v5.c

c06c34f76684a2 Sascha Bischoff 2025-12-02  722  
784f082a09f253 Sascha Bischoff 2025-10-15  723  /*
784f082a09f253 Sascha Bischoff 2025-10-15  724   * Claim and populate a VMTE (optionally making a new L2 VMT valid), create VPE
784f082a09f253 Sascha Bischoff 2025-10-15  725   * doorbells, allocate VPET and populate for each VPE. Finally, we also init the
784f082a09f253 Sascha Bischoff 2025-10-15  726   * vIRS, which means allocating and making the virtual SPI IST valid.
784f082a09f253 Sascha Bischoff 2025-10-15  727   *
784f082a09f253 Sascha Bischoff 2025-10-15  728   * Note: We do need to put the cart before the horse here. The VPE doorbells are
784f082a09f253 Sascha Bischoff 2025-10-15  729   * our conduit for communication with the IRS, which means we need to have those
784f082a09f253 Sascha Bischoff 2025-10-15  730   * before making the VMTE valid.
784f082a09f253 Sascha Bischoff 2025-10-15  731   */
784f082a09f253 Sascha Bischoff 2025-10-15  732  int vgic_v5_init(struct kvm *kvm)
784f082a09f253 Sascha Bischoff 2025-10-15  733  {
784f082a09f253 Sascha Bischoff 2025-10-15  734  	int nr_vcpus, ret = 0;
784f082a09f253 Sascha Bischoff 2025-10-15  735  	struct kvm_vcpu *vcpu, *vcpu0;
784f082a09f253 Sascha Bischoff 2025-10-15  736  	unsigned long i;
784f082a09f253 Sascha Bischoff 2025-10-15  737  	struct irq_data *d;
784f082a09f253 Sascha Bischoff 2025-10-15  738  	unsigned int db_virq;
784f082a09f253 Sascha Bischoff 2025-10-15  739  
784f082a09f253 Sascha Bischoff 2025-10-15  740  	if (!vgic_v5_vmt_allocated()) {
784f082a09f253 Sascha Bischoff 2025-10-15  741  		pr_err("No VM tables allocated; something is horribly wrong\n");
784f082a09f253 Sascha Bischoff 2025-10-15  742  		return -ENODEV;
784f082a09f253 Sascha Bischoff 2025-10-15  743  	}
784f082a09f253 Sascha Bischoff 2025-10-15  744  
784f082a09f253 Sascha Bischoff 2025-10-15  745  	kvm_for_each_vcpu(i, vcpu, kvm) {
c06c34f76684a2 Sascha Bischoff 2025-12-02  746  		if (vcpu_has_nv(vcpu)) {
c06c34f76684a2 Sascha Bischoff 2025-12-02  747  			kvm_err("Nested GICv5 VMs are currently unsupported\n");
c06c34f76684a2 Sascha Bischoff 2025-12-02  748  			return -EINVAL;
c06c34f76684a2 Sascha Bischoff 2025-12-02  749  		}
c06c34f76684a2 Sascha Bischoff 2025-12-02  750  	}
784f082a09f253 Sascha Bischoff 2025-10-15  751  	nr_vcpus = atomic_read(&kvm->online_vcpus);
784f082a09f253 Sascha Bischoff 2025-10-15  752  	if (WARN_ON(nr_vcpus == 0)) {
784f082a09f253 Sascha Bischoff 2025-10-15  753  		ret = -ENODEV;
784f082a09f253 Sascha Bischoff 2025-10-15  754  		goto fail;
784f082a09f253 Sascha Bischoff 2025-10-15  755  
784f082a09f253 Sascha Bischoff 2025-10-15  756  	}
784f082a09f253 Sascha Bischoff 2025-10-15  757  	kvm->arch.vgic.gicv5_vm.nr_vpes = nr_vcpus;
c06c34f76684a2 Sascha Bischoff 2025-12-02  758  
f53c2931b8e252 Sascha Bischoff 2025-12-17  759  	/*
f53c2931b8e252 Sascha Bischoff 2025-12-17  760  	 * We only allow userspace to drive the SW_PPI, if it is
f53c2931b8e252 Sascha Bischoff 2025-12-17  761  	 * implemented.
f53c2931b8e252 Sascha Bischoff 2025-12-17  762  	 */
f53c2931b8e252 Sascha Bischoff 2025-12-17  763  	kvm->arch.vgic.gicv5_vm.userspace_ppis[0] = GICV5_SW_PPI & GICV5_HWIRQ_ID;
f53c2931b8e252 Sascha Bischoff 2025-12-17  764  	kvm->arch.vgic.gicv5_vm.userspace_ppis[0] &= ppi_caps->impl_ppi_mask[0];
f53c2931b8e252 Sascha Bischoff 2025-12-17  765  	kvm->arch.vgic.gicv5_vm.userspace_ppis[1] = 0;
f53c2931b8e252 Sascha Bischoff 2025-12-17  766  
784f082a09f253 Sascha Bischoff 2025-10-15  767  	ret = vgic_v5_allocate_vm_id(kvm);
784f082a09f253 Sascha Bischoff 2025-10-15  768  	if (ret)
784f082a09f253 Sascha Bischoff 2025-10-15  769  		goto fail;
784f082a09f253 Sascha Bischoff 2025-10-15  770  
784f082a09f253 Sascha Bischoff 2025-10-15  771  	if (vgic_v5_create_per_vm_domain(&kvm->arch.vgic.gicv5_vm))
784f082a09f253 Sascha Bischoff 2025-10-15  772  		goto fail_cleanup_id;
784f082a09f253 Sascha Bischoff 2025-10-15  773  
784f082a09f253 Sascha Bischoff 2025-10-15  774  	/*
784f082a09f253 Sascha Bischoff 2025-10-15  775  	 * Allocate VPE doorbells first - these are our conduit for
784f082a09f253 Sascha Bischoff 2025-10-15  776  	 * communicating with the host irqchip driver. Can't do any earlier as
784f082a09f253 Sascha Bischoff 2025-10-15  777  	 * we wouldn't know the VM ID.
784f082a09f253 Sascha Bischoff 2025-10-15  778  	 */
784f082a09f253 Sascha Bischoff 2025-10-15  779  	db_virq = irq_domain_alloc_irqs(kvm->arch.vgic.gicv5_vm.domain,
784f082a09f253 Sascha Bischoff 2025-10-15  780  					nr_vcpus, NUMA_NO_NODE,
784f082a09f253 Sascha Bischoff 2025-10-15  781  					&kvm->arch.vgic.gicv5_vm);
784f082a09f253 Sascha Bischoff 2025-10-15 @782  	if (db_virq < 0) {
784f082a09f253 Sascha Bischoff 2025-10-15  783  		ret = db_virq;
784f082a09f253 Sascha Bischoff 2025-10-15  784  		goto fail_cleanup_domain;
c06c34f76684a2 Sascha Bischoff 2025-12-02  785  	}
784f082a09f253 Sascha Bischoff 2025-10-15  786  	kvm->arch.vgic.gicv5_vm.vpe_db_base = db_virq;
c06c34f76684a2 Sascha Bischoff 2025-12-02  787  
784f082a09f253 Sascha Bischoff 2025-10-15  788  	kvm_for_each_vcpu(i, vcpu, kvm) {
784f082a09f253 Sascha Bischoff 2025-10-15  789  		d = irq_domain_get_irq_data(kvm->arch.vgic.gicv5_vm.domain,
784f082a09f253 Sascha Bischoff 2025-10-15  790  					    db_virq + i);
784f082a09f253 Sascha Bischoff 2025-10-15  791  		irq_set_status_flags(db_virq + i, IRQ_NOAUTOEN);
784f082a09f253 Sascha Bischoff 2025-10-15  792  
784f082a09f253 Sascha Bischoff 2025-10-15  793  		ret = request_irq(db_virq + i, db_handler, 0, "vcpu", vcpu);
784f082a09f253 Sascha Bischoff 2025-10-15  794  		if (ret)
784f082a09f253 Sascha Bischoff 2025-10-15  795  			goto fail_cleanup_partial_dbs;
784f082a09f253 Sascha Bischoff 2025-10-15  796  
784f082a09f253 Sascha Bischoff 2025-10-15  797  		/* Stash it with the VCPU for easy retrieval */
784f082a09f253 Sascha Bischoff 2025-10-15  798  		vcpu->arch.vgic_cpu.vgic_v5.gicv5_vpe.db = db_virq + i;
784f082a09f253 Sascha Bischoff 2025-10-15  799  	}
784f082a09f253 Sascha Bischoff 2025-10-15  800  
784f082a09f253 Sascha Bischoff 2025-10-15  801  	/* Populate VMTE (with VPET and VM descriptor) */
784f082a09f253 Sascha Bischoff 2025-10-15  802  	ret = vgic_v5_vmte_init(kvm);
784f082a09f253 Sascha Bischoff 2025-10-15  803  	if (ret)
784f082a09f253 Sascha Bischoff 2025-10-15  804  		goto fail_cleanup_dbs;
784f082a09f253 Sascha Bischoff 2025-10-15  805  
784f082a09f253 Sascha Bischoff 2025-10-15  806  	/* We pick the first vcpu to make the VMTE valid - any would do */
784f082a09f253 Sascha Bischoff 2025-10-15  807  	vcpu0 = kvm_get_vcpu(kvm, 0);
784f082a09f253 Sascha Bischoff 2025-10-15  808  	ret = vgic_v5_send_command(vcpu0, VMTE_MAKE_VALID);
784f082a09f253 Sascha Bischoff 2025-10-15  809  	if (ret)
784f082a09f253 Sascha Bischoff 2025-10-15  810  		goto fail_cleanup_vmte;
784f082a09f253 Sascha Bischoff 2025-10-15  811  
784f082a09f253 Sascha Bischoff 2025-10-15  812  	/* Loop over all VPEs, allocate/populate their data structures */
784f082a09f253 Sascha Bischoff 2025-10-15  813  	kvm_for_each_vcpu(i, vcpu, kvm) {
784f082a09f253 Sascha Bischoff 2025-10-15  814  		ret = vgic_v5_vmte_alloc_vpe(vcpu);
784f082a09f253 Sascha Bischoff 2025-10-15  815  		if (ret)
784f082a09f253 Sascha Bischoff 2025-10-15  816  			goto fail_cleanup_vpes;
784f082a09f253 Sascha Bischoff 2025-10-15  817  	}
784f082a09f253 Sascha Bischoff 2025-10-15  818  
784f082a09f253 Sascha Bischoff 2025-10-15  819  	return ret;
784f082a09f253 Sascha Bischoff 2025-10-15  820  
784f082a09f253 Sascha Bischoff 2025-10-15  821  fail_cleanup_vpes:
784f082a09f253 Sascha Bischoff 2025-10-15  822  	/* i contains the first vCPU that failed */
784f082a09f253 Sascha Bischoff 2025-10-15  823  	if (i == 0)
784f082a09f253 Sascha Bischoff 2025-10-15  824  		goto fail_cleanup_vmte;
784f082a09f253 Sascha Bischoff 2025-10-15  825  
784f082a09f253 Sascha Bischoff 2025-10-15  826  	do {
784f082a09f253 Sascha Bischoff 2025-10-15  827  		vcpu = kvm_get_vcpu(kvm, --i);
784f082a09f253 Sascha Bischoff 2025-10-15  828  		vgic_v5_vmte_free_vpe(vcpu);
784f082a09f253 Sascha Bischoff 2025-10-15  829  	} while (i != 0);
784f082a09f253 Sascha Bischoff 2025-10-15  830  
784f082a09f253 Sascha Bischoff 2025-10-15  831  fail_cleanup_vmte:
784f082a09f253 Sascha Bischoff 2025-10-15  832  	vgic_v5_vmte_release(kvm);
784f082a09f253 Sascha Bischoff 2025-10-15  833  
784f082a09f253 Sascha Bischoff 2025-10-15  834  fail_cleanup_dbs:
784f082a09f253 Sascha Bischoff 2025-10-15  835  	i = nr_vcpus;
784f082a09f253 Sascha Bischoff 2025-10-15  836  fail_cleanup_partial_dbs:
784f082a09f253 Sascha Bischoff 2025-10-15  837  	/* i contains the first vCPU that failed */
784f082a09f253 Sascha Bischoff 2025-10-15  838  	if (i == 0)
784f082a09f253 Sascha Bischoff 2025-10-15  839  		goto fail_cleanup_domain;
784f082a09f253 Sascha Bischoff 2025-10-15  840  
784f082a09f253 Sascha Bischoff 2025-10-15  841  	do {
784f082a09f253 Sascha Bischoff 2025-10-15  842  		vcpu = kvm_get_vcpu(kvm, --i);
784f082a09f253 Sascha Bischoff 2025-10-15  843  		vgic_v5_disable_vcpu(vcpu);
784f082a09f253 Sascha Bischoff 2025-10-15  844  	} while (i != 0);
784f082a09f253 Sascha Bischoff 2025-10-15  845  
784f082a09f253 Sascha Bischoff 2025-10-15  846  fail_cleanup_domain:
784f082a09f253 Sascha Bischoff 2025-10-15  847  	vgic_v5_teardown_per_vm_domain(&kvm->arch.vgic.gicv5_vm);
784f082a09f253 Sascha Bischoff 2025-10-15  848  
784f082a09f253 Sascha Bischoff 2025-10-15  849  fail_cleanup_id:
784f082a09f253 Sascha Bischoff 2025-10-15  850  	vgic_v5_release_vm_id(kvm);
784f082a09f253 Sascha Bischoff 2025-10-15  851  
784f082a09f253 Sascha Bischoff 2025-10-15  852  fail:
784f082a09f253 Sascha Bischoff 2025-10-15  853  	return ret;
784f082a09f253 Sascha Bischoff 2025-10-15  854  }
784f082a09f253 Sascha Bischoff 2025-10-15  855  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
