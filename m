Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E946C3B5820
	for <oe-kbuild@lists.linux.dev>; Sun, 17 May 2026 14:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779027423; cv=none; b=N81w+mut5M4xFNr7UZvvpKnEL/7qDjQMkdzzRtzlmS+HlEDGxusDNFia/VDXSGLAy/K2IDAsUsrnXqSbh/xB8rRKYiIYU3APTGybwPa1nCO+l0fHOdr8W4voQ/Rem4kz/2akL27HU5SVBLd/Tw0kKZHHdbVlOWG08wUDePtpJOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779027423; c=relaxed/simple;
	bh=OBCzvY9pprG6NEYxNbpQr59n4UpKJnqQAGxBK21v2+w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VsZif73DUwkG9rIHtX5679LCEvBORdZBWO8BI9J6y1vT7KSkGRNdvNuYDE/XMNSPgHsKgvAAsz0n5wtLxgPTAFEJKS2bhdcfR113FwerLICLOcIrLr9Gne0GSONuXZzRKk+p2WJXv29seqJfmdLVrwpAyUk+4EWeQhk/3Kk9cqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHpYTSRu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHpYTSRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779027398; x=1810563398;
  h=date:from:to:cc:subject:message-id;
  bh=OBCzvY9pprG6NEYxNbpQr59n4UpKJnqQAGxBK21v2+w=;
  b=mHpYTSRuS9HnJctK1J/hrWdJ18/uJIh1jLb1ld0knWbfSWJCMXycssI1
   Z9w7MKRFnF6MgAmSOTappwEP1yAtBYsDKkLU0j0mkt+u9X/pqnzKHXukD
   n7oqImPOCWexJoWmthzTNcbRjy7wphw6UH0WEQ8rWzLRsDCSTPk/ZDsDS
   n9rohR9l7JQoh2N1g3Bp0wJAgQGTOpYJARQ9Mzjq7NqD4fB2YPg4JSYyR
   AUyQ/5i2r5smHjpjt6JIqUOsK6D/hCFO1Mx/8W1G9EYmJ/D5Bz7SBvOt3
   9kTntHukzYrmyK1aN7/CmarZmgpAHKyQhCWqnwncmAap/mZXWVcoEBK4e
   Q==;
X-CSE-ConnectionGUID: /e95VWLbQ0m1NADQgtB2yQ==
X-CSE-MsgGUID: YEqvGM3BRsm5O9Lf7g7bsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90210197"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="90210197"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 07:16:36 -0700
X-CSE-ConnectionGUID: aXzt5yOYTlqidXuABKWu9Q==
X-CSE-MsgGUID: hE+Ag72DRCeygMQUn+WrRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="241000275"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 May 2026 07:16:34 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOcIC-000000001fq-05OE;
	Sun, 17 May 2026 14:16:32 +0000
Date: Sun, 17 May 2026 22:15:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/vgic/vgic-v4.c:508
 kvm_vgic_v4_set_forwarding() warn: inconsistent returns '&irq->irq_lock'.
Message-ID: <202605172212.TYwdJYIg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Oliver Upton <oliver.upton@linux.dev>
CC: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6916d5703ddf9a38f1f6c2cc793381a24ee914c6
commit: fc4dafe87b93ec94204896c4bc8cad7e71bdd151 KVM: arm64: Protect vLPI translation with vgic_irq::irq_lock
date:   12 months ago
:::::: branch date: 2 days ago
:::::: commit date: 12 months ago
config: arm64-randconfig-r073-20260517 (https://download.01.org/0day-ci/archive/20260517/202605172212.TYwdJYIg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fc4dafe87b93 ("KVM: arm64: Protect vLPI translation with vgic_irq::irq_lock")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605172212.TYwdJYIg-lkp@intel.com/

smatch warnings:
arch/arm64/kvm/vgic/vgic-v4.c:508 kvm_vgic_v4_set_forwarding() warn: inconsistent returns '&irq->irq_lock'.

vim +508 arch/arm64/kvm/vgic/vgic-v4.c

196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  426  
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  427  int kvm_vgic_v4_set_forwarding(struct kvm *kvm, int virq,
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  428  			       struct kvm_kernel_irq_routing_entry *irq_entry)
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  429  {
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  430  	struct vgic_its *its;
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  431  	struct vgic_irq *irq;
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  432  	struct its_vlpi_map map;
12df7429213abbf arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  433  	unsigned long flags;
5c57533eb8c1efe arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  434  	int ret = 0;
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  435  
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  436  	if (!vgic_supports_direct_msis(kvm))
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  437  		return 0;
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  438  
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  439  	/*
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  440  	 * Get the ITS, and escape early on error (not a valid
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  441  	 * doorbell for any of our vITSs).
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  442  	 */
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  443  	its = vgic_get_its(kvm, irq_entry);
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  444  	if (IS_ERR(its))
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  445  		return 0;
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  446  
761aabe76e6b1eb arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  447  	guard(mutex)(&its->its_lock);
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  448  
5c57533eb8c1efe arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  449  	/*
5c57533eb8c1efe arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  450  	 * Perform the actual DevID/EventID -> LPI translation.
5c57533eb8c1efe arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  451  	 *
5c57533eb8c1efe arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  452  	 * Silently exit if translation fails as the guest (or userspace!) has
5c57533eb8c1efe arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  453  	 * managed to do something stupid. Emulated LPI injection will still
5c57533eb8c1efe arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  454  	 * work if the guest figures itself out at a later time.
5c57533eb8c1efe arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  455  	 */
5c57533eb8c1efe arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  456  	if (vgic_its_resolve_lpi(kvm, its, irq_entry->msi.devid,
5c57533eb8c1efe arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  457  				 irq_entry->msi.data, &irq))
761aabe76e6b1eb arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  458  		return 0;
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  459  
fc4dafe87b93ec9 arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  460  	raw_spin_lock_irqsave(&irq->irq_lock, flags);
fc4dafe87b93ec9 arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  461  
8e4ece6889a5b18 arch/arm64/kvm/vgic/vgic-v4.c Kunkun Jiang 2023-11-20  462  	/* Silently exit if the vLPI is already mapped */
8e4ece6889a5b18 arch/arm64/kvm/vgic/vgic-v4.c Kunkun Jiang 2023-11-20  463  	if (irq->hw)
fc4dafe87b93ec9 arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  464  		goto out_unlock_irq;
8e4ece6889a5b18 arch/arm64/kvm/vgic/vgic-v4.c Kunkun Jiang 2023-11-20  465  
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  466  	/*
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  467  	 * Emit the mapping request. If it fails, the ITS probably
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  468  	 * isn't v4 compatible, so let's silently bail out. Holding
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  469  	 * the ITS lock should ensure that nothing can modify the
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  470  	 * target vcpu.
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  471  	 */
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  472  	map = (struct its_vlpi_map) {
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  473  		.vm		= &kvm->arch.vgic.its_vm,
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  474  		.vpe		= &irq->target_vcpu->arch.vgic_cpu.vgic_v3.its_vpe,
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  475  		.vintid		= irq->intid,
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  476  		.properties	= ((irq->priority & 0xfc) |
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  477  				   (irq->enabled ? LPI_PROP_ENABLED : 0) |
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  478  				   LPI_PROP_GROUP1),
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  479  		.db_enabled	= true,
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  480  	};
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  481  
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  482  	ret = its_map_vlpi(virq, &map);
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  483  	if (ret)
fc4dafe87b93ec9 arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  484  		goto out_unlock_irq;
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  485  
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  486  	irq->hw		= true;
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  487  	irq->host_irq	= virq;
5bd90b098973152 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2019-11-07  488  	atomic_inc(&map.vpe->vlpi_count);
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  489  
12df7429213abbf arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  490  	/* Transfer pending state */
fc4dafe87b93ec9 arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  491  	if (!irq->pending_latch)
fc4dafe87b93ec9 arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  492  		goto out_unlock_irq;
fc4dafe87b93ec9 arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  493  
fc4dafe87b93ec9 arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  494  	ret = irq_set_irqchip_state(irq->host_irq, IRQCHIP_STATE_PENDING,
12df7429213abbf arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  495  				    irq->pending_latch);
12df7429213abbf arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  496  	WARN_RATELIMIT(ret, "IRQ %d", irq->host_irq);
12df7429213abbf arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  497  
12df7429213abbf arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  498  	/*
12df7429213abbf arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  499  	 * Clear pending_latch and communicate this state
12df7429213abbf arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  500  	 * change via vgic_queue_irq_unlock.
12df7429213abbf arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  501  	 */
12df7429213abbf arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  502  	irq->pending_latch = false;
12df7429213abbf arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  503  	vgic_queue_irq_unlock(kvm, irq, flags);
fc4dafe87b93ec9 arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  504  	return ret;
12df7429213abbf arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  505  
fc4dafe87b93ec9 arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  506  out_unlock_irq:
fc4dafe87b93ec9 arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  507  	raw_spin_unlock_irqrestore(&irq->irq_lock, flags);
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27 @508  	return ret;
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  509  }
196b136498b35f1 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  510  

:::::: The code at line 508 was first introduced by commit
:::::: 196b136498b35f1cd787b84465f235e69dbc757c KVM: arm/arm64: GICv4: Wire mapping/unmapping of VLPIs in VFIO irq bypass

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Christoffer Dall <christoffer.dall@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
