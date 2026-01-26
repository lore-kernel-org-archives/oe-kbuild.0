Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9641CF7D5
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 14:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769436477; cv=none; b=RicUNKJZDTAVol1LgXLopK+88E+uMmFUXxp/1B211dRHqst7ixbwnU1SiKa0gyX2SG1TqmXGRmjZoCfiqb175aQkoeun+gapiQu5Tr9h1T7OeAvtrhNOiCphvsklVp2QOaH+K90auAzBt3n9zwX7fhqjI/bSYtxvTBx9PxMZlMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769436477; c=relaxed/simple;
	bh=Jr9YiK9gWX9B9niV9jx+sxzOLYETR2lCKJgw0IHItxg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t14IjDFD3H7x/6pieZPjyauMJ8MJ2ZerM8QoUh6CPvypmgbPSC9A26Ue77kRucwG7dzLtVWA8ahxmEZe3tilk7jetoLPRwtDzMgVeAzA4iyjgfqa9Tn07P+pgZnhHvN7FW40BV/V1sHfxPTfZ53ehCF3E7S+SouxceMTiGA+rd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhbSgRPX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhbSgRPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769436475; x=1800972475;
  h=date:from:to:cc:subject:message-id;
  bh=Jr9YiK9gWX9B9niV9jx+sxzOLYETR2lCKJgw0IHItxg=;
  b=hhbSgRPXbbXZidaIRCVwazFTlCLPAs/3ttyeVcLaqWwB6zk36Xby5+2j
   cJcZhu0WwUc7QkDyPQ88gmUF6mTFZSAp+awh+fnQQ4d4pDwe4XlT0hP44
   dfzTrDzYXpBUjsZws69AUCRkZO1URltV+sXa1YfFDoiUFUPny+m8BmKQm
   d8Nut7eokJqtwWedwGoDNd2wq3XAf1hdqfp0UlAbZDn1+CXB75gdmOkgP
   zdlbCsuxObkxhUWjda3ftHUKUsKqL8MIoO4sNfhaAL1x/r0ZeK3eGBCFb
   1FDiL5WJicBoosQqNe1RcZZrxInO8sR6Sq9j4SwUoErItHBDSwZKOom9G
   g==;
X-CSE-ConnectionGUID: /jsf/4DEQ+iRHroQWLmeNA==
X-CSE-MsgGUID: mWjpixN3SGWZjpzAatAeuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70579619"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70579619"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:07:55 -0800
X-CSE-ConnectionGUID: swBsnab9QeGtqMoZolJVHw==
X-CSE-MsgGUID: d+o+B9bkQdmWDrIDYTtuBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207288309"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jan 2026 06:07:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkNFv-00000000XNT-0LTB;
	Mon, 26 Jan 2026 14:07:51 +0000
Date: Mon, 26 Jan 2026 22:07:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/vgic/vgic-v4.c:508
 kvm_vgic_v4_set_forwarding() warn: inconsistent returns '&irq->irq_lock'.
Message-ID: <202601262217.HEm1HrQR-lkp@intel.com>
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
head:   63804fed149a6750ffd28610c5c1c98cce6bd377
commit: fc4dafe87b93ec94204896c4bc8cad7e71bdd151 KVM: arm64: Protect vLPI translation with vgic_irq::irq_lock
date:   8 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-r073-20260125 (https://download.01.org/0day-ci/archive/20260126/202601262217.HEm1HrQR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601262217.HEm1HrQR-lkp@intel.com/

smatch warnings:
arch/arm64/kvm/vgic/vgic-v4.c:508 kvm_vgic_v4_set_forwarding() warn: inconsistent returns '&irq->irq_lock'.

vim +508 arch/arm64/kvm/vgic/vgic-v4.c

196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  426  
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  427  int kvm_vgic_v4_set_forwarding(struct kvm *kvm, int virq,
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  428  			       struct kvm_kernel_irq_routing_entry *irq_entry)
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  429  {
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  430  	struct vgic_its *its;
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  431  	struct vgic_irq *irq;
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  432  	struct its_vlpi_map map;
12df7429213abb arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  433  	unsigned long flags;
5c57533eb8c1ef arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  434  	int ret = 0;
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  435  
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  436  	if (!vgic_supports_direct_msis(kvm))
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  437  		return 0;
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  438  
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  439  	/*
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  440  	 * Get the ITS, and escape early on error (not a valid
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  441  	 * doorbell for any of our vITSs).
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  442  	 */
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  443  	its = vgic_get_its(kvm, irq_entry);
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  444  	if (IS_ERR(its))
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  445  		return 0;
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  446  
761aabe76e6b1e arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  447  	guard(mutex)(&its->its_lock);
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  448  
5c57533eb8c1ef arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  449  	/*
5c57533eb8c1ef arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  450  	 * Perform the actual DevID/EventID -> LPI translation.
5c57533eb8c1ef arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  451  	 *
5c57533eb8c1ef arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  452  	 * Silently exit if translation fails as the guest (or userspace!) has
5c57533eb8c1ef arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  453  	 * managed to do something stupid. Emulated LPI injection will still
5c57533eb8c1ef arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  454  	 * work if the guest figures itself out at a later time.
5c57533eb8c1ef arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  455  	 */
5c57533eb8c1ef arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  456  	if (vgic_its_resolve_lpi(kvm, its, irq_entry->msi.devid,
5c57533eb8c1ef arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-02-26  457  				 irq_entry->msi.data, &irq))
761aabe76e6b1e arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  458  		return 0;
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  459  
fc4dafe87b93ec arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  460  	raw_spin_lock_irqsave(&irq->irq_lock, flags);
fc4dafe87b93ec arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  461  
8e4ece6889a5b1 arch/arm64/kvm/vgic/vgic-v4.c Kunkun Jiang 2023-11-20  462  	/* Silently exit if the vLPI is already mapped */
8e4ece6889a5b1 arch/arm64/kvm/vgic/vgic-v4.c Kunkun Jiang 2023-11-20  463  	if (irq->hw)
fc4dafe87b93ec arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  464  		goto out_unlock_irq;
8e4ece6889a5b1 arch/arm64/kvm/vgic/vgic-v4.c Kunkun Jiang 2023-11-20  465  
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  466  	/*
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  467  	 * Emit the mapping request. If it fails, the ITS probably
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  468  	 * isn't v4 compatible, so let's silently bail out. Holding
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  469  	 * the ITS lock should ensure that nothing can modify the
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  470  	 * target vcpu.
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  471  	 */
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  472  	map = (struct its_vlpi_map) {
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  473  		.vm		= &kvm->arch.vgic.its_vm,
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  474  		.vpe		= &irq->target_vcpu->arch.vgic_cpu.vgic_v3.its_vpe,
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  475  		.vintid		= irq->intid,
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  476  		.properties	= ((irq->priority & 0xfc) |
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  477  				   (irq->enabled ? LPI_PROP_ENABLED : 0) |
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  478  				   LPI_PROP_GROUP1),
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  479  		.db_enabled	= true,
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  480  	};
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  481  
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  482  	ret = its_map_vlpi(virq, &map);
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  483  	if (ret)
fc4dafe87b93ec arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  484  		goto out_unlock_irq;
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  485  
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  486  	irq->hw		= true;
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  487  	irq->host_irq	= virq;
5bd90b09897315 virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2019-11-07  488  	atomic_inc(&map.vpe->vlpi_count);
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  489  
12df7429213abb arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  490  	/* Transfer pending state */
fc4dafe87b93ec arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  491  	if (!irq->pending_latch)
fc4dafe87b93ec arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  492  		goto out_unlock_irq;
fc4dafe87b93ec arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  493  
fc4dafe87b93ec arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  494  	ret = irq_set_irqchip_state(irq->host_irq, IRQCHIP_STATE_PENDING,
12df7429213abb arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  495  				    irq->pending_latch);
12df7429213abb arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  496  	WARN_RATELIMIT(ret, "IRQ %d", irq->host_irq);
12df7429213abb arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  497  
12df7429213abb arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  498  	/*
12df7429213abb arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  499  	 * Clear pending_latch and communicate this state
12df7429213abb arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  500  	 * change via vgic_queue_irq_unlock.
12df7429213abb arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  501  	 */
12df7429213abb arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  502  	irq->pending_latch = false;
12df7429213abb arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  503  	vgic_queue_irq_unlock(kvm, irq, flags);
fc4dafe87b93ec arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  504  	return ret;
12df7429213abb arch/arm64/kvm/vgic/vgic-v4.c Zenghui Yu   2021-03-22  505  
fc4dafe87b93ec arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  506  out_unlock_irq:
fc4dafe87b93ec arch/arm64/kvm/vgic/vgic-v4.c Oliver Upton 2025-05-23  507  	raw_spin_unlock_irqrestore(&irq->irq_lock, flags);
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27 @508  	return ret;
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  509  }
196b136498b35f virt/kvm/arm/vgic/vgic-v4.c   Marc Zyngier 2017-10-27  510  

:::::: The code at line 508 was first introduced by commit
:::::: 196b136498b35f1cd787b84465f235e69dbc757c KVM: arm/arm64: GICv4: Wire mapping/unmapping of VLPIs in VFIO irq bypass

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Christoffer Dall <christoffer.dall@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
