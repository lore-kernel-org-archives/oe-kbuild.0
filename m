Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4881D0DF6
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 22:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730326061; cv=none; b=hQI89nYW3G7wraCkShMMXj4eokou6QClH4Dgj6v/3Npn0XT8uXupb+IH2O7mzkkzatiIjxLqpRJW/KjDePR+fz8zxUMhT0RSGP5as7w91GeWymPQqm0p7iJeMeP6OaUnUGfTxKdPNLqJfXDFAOPDa3RXOL1lzi/UfGbqLLxFvpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730326061; c=relaxed/simple;
	bh=yUIaSr9pR45R2lJQTpPaLHh1lg9h3dmuWyIXBlphdD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U/ZehYV1G68hLxRUxJJSYbi5GQxDcJ+EI7p9cSDmjiSWDmtxGK0hQHApi+RaQ8jED7HA3Mn268gdVEtQS0eQ8rwO3lnlN1gsfD30GXD7QQuZ0jDbJgIzzzofkSnmg2gGuz7n/NTwG3YHfErdj4QnOGXH10/4/bD47AIQitGHczQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fr2U9yJh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fr2U9yJh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730326059; x=1761862059;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yUIaSr9pR45R2lJQTpPaLHh1lg9h3dmuWyIXBlphdD8=;
  b=fr2U9yJh7tUeFvJ6wmTVUkQluFcZoK1lrXTmG5FUmtjAAAChdc5FNr9A
   NhNBGcvXAAG3sLxbN6Z9VyKjGfSC0lweiH9nkL7PHibdJ0X+EbwBbX6MU
   N+I/sowEr/UaqcnQiHyqvLeQqab2AfFmeSvjvbb3P7YHMXrzOKwUwjKUU
   Yt51jR9d/kz1oKnNtXvuh683+opo2Mhqnp6ZUHCbaR5/cGssEdoULjNxl
   ulPvrI3HW9mp275tVGHVe0SYzkCC87KLY/ZPpgdyvL27F2gqpsDVVaye0
   ymHeVhyVdyi2lrQt6PtjhnGkY7Cj40q6durhh73ZWyMtr/XgL9ZBvxM6D
   Q==;
X-CSE-ConnectionGUID: SJxyIGtZRB+j42kpNNRujw==
X-CSE-MsgGUID: 7SRKDEEKQM+7E3WlDCvLuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="29948143"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="29948143"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 15:07:38 -0700
X-CSE-ConnectionGUID: 6GCG+oMqShSpczy9P9KSRw==
X-CSE-MsgGUID: OkP2KmHdRl6RXBmYRAispA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="87049130"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2024 15:07:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Gql-000fMi-0D;
	Wed, 30 Oct 2024 22:07:35 +0000
Date: Thu, 31 Oct 2024 06:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/irqchip/irq-riscv-imsic-state.c:854 imsic_setup_state()
 error: we previously assumed 'mmios_va' could be null (see line 745)
Message-ID: <202410310641.Nrmy8Sr0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Anup Patel <apatel@ventanamicro.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: "Björn Töpel" <bjorn@rivosinc.com>

Hi Anup,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4236f913808cebef1b9e078726a4e5d56064f7ad
commit: 0eebc69db358fd2f6fe34cc4db6428df6a540dd7 RISC-V: Select APLIC and IMSIC drivers
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-r071-20241030 (https://download.01.org/0day-ci/archive/20241031/202410310641.Nrmy8Sr0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410310641.Nrmy8Sr0-lkp@intel.com/

New smatch warnings:
drivers/irqchip/irq-riscv-imsic-state.c:854 imsic_setup_state() error: we previously assumed 'mmios_va' could be null (see line 745)

Old smatch warnings:
drivers/irqchip/irq-riscv-imsic-state.c:825 imsic_setup_state() warn: potentially one past the end of array 'mmios_va[index]'
drivers/irqchip/irq-riscv-imsic-state.c:825 imsic_setup_state() warn: potentially one past the end of array 'mmios_va[index]'

vim +/mmios_va +854 drivers/irqchip/irq-riscv-imsic-state.c

21a8f8a0eb35ce Anup Patel 2024-03-07  690  
21a8f8a0eb35ce Anup Patel 2024-03-07  691  int __init imsic_setup_state(struct fwnode_handle *fwnode)
21a8f8a0eb35ce Anup Patel 2024-03-07  692  {
21a8f8a0eb35ce Anup Patel 2024-03-07  693  	u32 i, j, index, nr_parent_irqs, nr_mmios, nr_handlers = 0;
21a8f8a0eb35ce Anup Patel 2024-03-07  694  	struct imsic_global_config *global;
21a8f8a0eb35ce Anup Patel 2024-03-07  695  	struct imsic_local_config *local;
21a8f8a0eb35ce Anup Patel 2024-03-07  696  	void __iomem **mmios_va = NULL;
21a8f8a0eb35ce Anup Patel 2024-03-07  697  	struct resource *mmios = NULL;
21a8f8a0eb35ce Anup Patel 2024-03-07  698  	unsigned long reloff, hartid;
21a8f8a0eb35ce Anup Patel 2024-03-07  699  	phys_addr_t base_addr;
21a8f8a0eb35ce Anup Patel 2024-03-07  700  	int rc, cpu;
21a8f8a0eb35ce Anup Patel 2024-03-07  701  
21a8f8a0eb35ce Anup Patel 2024-03-07  702  	/*
21a8f8a0eb35ce Anup Patel 2024-03-07  703  	 * Only one IMSIC instance allowed in a platform for clean
21a8f8a0eb35ce Anup Patel 2024-03-07  704  	 * implementation of SMP IRQ affinity and per-CPU IPIs.
21a8f8a0eb35ce Anup Patel 2024-03-07  705  	 *
21a8f8a0eb35ce Anup Patel 2024-03-07  706  	 * This means on a multi-socket (or multi-die) platform we
21a8f8a0eb35ce Anup Patel 2024-03-07  707  	 * will have multiple MMIO regions for one IMSIC instance.
21a8f8a0eb35ce Anup Patel 2024-03-07  708  	 */
21a8f8a0eb35ce Anup Patel 2024-03-07  709  	if (imsic) {
21a8f8a0eb35ce Anup Patel 2024-03-07  710  		pr_err("%pfwP: already initialized hence ignoring\n", fwnode);
21a8f8a0eb35ce Anup Patel 2024-03-07  711  		return -EALREADY;
21a8f8a0eb35ce Anup Patel 2024-03-07  712  	}
21a8f8a0eb35ce Anup Patel 2024-03-07  713  
21a8f8a0eb35ce Anup Patel 2024-03-07  714  	if (!riscv_isa_extension_available(NULL, SxAIA)) {
21a8f8a0eb35ce Anup Patel 2024-03-07  715  		pr_err("%pfwP: AIA support not available\n", fwnode);
21a8f8a0eb35ce Anup Patel 2024-03-07  716  		return -ENODEV;
21a8f8a0eb35ce Anup Patel 2024-03-07  717  	}
21a8f8a0eb35ce Anup Patel 2024-03-07  718  
21a8f8a0eb35ce Anup Patel 2024-03-07  719  	imsic = kzalloc(sizeof(*imsic), GFP_KERNEL);
21a8f8a0eb35ce Anup Patel 2024-03-07  720  	if (!imsic)
21a8f8a0eb35ce Anup Patel 2024-03-07  721  		return -ENOMEM;
21a8f8a0eb35ce Anup Patel 2024-03-07  722  	imsic->fwnode = fwnode;
21a8f8a0eb35ce Anup Patel 2024-03-07  723  	global = &imsic->global;
21a8f8a0eb35ce Anup Patel 2024-03-07  724  
21a8f8a0eb35ce Anup Patel 2024-03-07  725  	global->local = alloc_percpu(typeof(*global->local));
21a8f8a0eb35ce Anup Patel 2024-03-07  726  	if (!global->local) {
21a8f8a0eb35ce Anup Patel 2024-03-07  727  		rc = -ENOMEM;
21a8f8a0eb35ce Anup Patel 2024-03-07  728  		goto out_free_priv;
21a8f8a0eb35ce Anup Patel 2024-03-07  729  	}
21a8f8a0eb35ce Anup Patel 2024-03-07  730  
21a8f8a0eb35ce Anup Patel 2024-03-07  731  	/* Parse IMSIC fwnode */
21a8f8a0eb35ce Anup Patel 2024-03-07  732  	rc = imsic_parse_fwnode(fwnode, global, &nr_parent_irqs, &nr_mmios);
21a8f8a0eb35ce Anup Patel 2024-03-07  733  	if (rc)
21a8f8a0eb35ce Anup Patel 2024-03-07  734  		goto out_free_local;
21a8f8a0eb35ce Anup Patel 2024-03-07  735  
21a8f8a0eb35ce Anup Patel 2024-03-07  736  	/* Allocate MMIO resource array */
21a8f8a0eb35ce Anup Patel 2024-03-07  737  	mmios = kcalloc(nr_mmios, sizeof(*mmios), GFP_KERNEL);
21a8f8a0eb35ce Anup Patel 2024-03-07  738  	if (!mmios) {
21a8f8a0eb35ce Anup Patel 2024-03-07  739  		rc = -ENOMEM;
21a8f8a0eb35ce Anup Patel 2024-03-07  740  		goto out_free_local;
21a8f8a0eb35ce Anup Patel 2024-03-07  741  	}
21a8f8a0eb35ce Anup Patel 2024-03-07  742  
21a8f8a0eb35ce Anup Patel 2024-03-07  743  	/* Allocate MMIO virtual address array */
21a8f8a0eb35ce Anup Patel 2024-03-07  744  	mmios_va = kcalloc(nr_mmios, sizeof(*mmios_va), GFP_KERNEL);
21a8f8a0eb35ce Anup Patel 2024-03-07 @745  	if (!mmios_va) {
21a8f8a0eb35ce Anup Patel 2024-03-07  746  		rc = -ENOMEM;
21a8f8a0eb35ce Anup Patel 2024-03-07  747  		goto out_iounmap;
21a8f8a0eb35ce Anup Patel 2024-03-07  748  	}
21a8f8a0eb35ce Anup Patel 2024-03-07  749  
21a8f8a0eb35ce Anup Patel 2024-03-07  750  	/* Parse and map MMIO register sets */
21a8f8a0eb35ce Anup Patel 2024-03-07  751  	for (i = 0; i < nr_mmios; i++) {
21a8f8a0eb35ce Anup Patel 2024-03-07  752  		rc = imsic_get_mmio_resource(fwnode, i, &mmios[i]);
21a8f8a0eb35ce Anup Patel 2024-03-07  753  		if (rc) {
21a8f8a0eb35ce Anup Patel 2024-03-07  754  			pr_err("%pfwP: unable to parse MMIO regset %d\n", fwnode, i);
21a8f8a0eb35ce Anup Patel 2024-03-07  755  			goto out_iounmap;
21a8f8a0eb35ce Anup Patel 2024-03-07  756  		}
21a8f8a0eb35ce Anup Patel 2024-03-07  757  
21a8f8a0eb35ce Anup Patel 2024-03-07  758  		base_addr = mmios[i].start;
21a8f8a0eb35ce Anup Patel 2024-03-07  759  		base_addr &= ~(BIT(global->guest_index_bits +
21a8f8a0eb35ce Anup Patel 2024-03-07  760  				   global->hart_index_bits +
21a8f8a0eb35ce Anup Patel 2024-03-07  761  				   IMSIC_MMIO_PAGE_SHIFT) - 1);
21a8f8a0eb35ce Anup Patel 2024-03-07  762  		base_addr &= ~((BIT(global->group_index_bits) - 1) <<
21a8f8a0eb35ce Anup Patel 2024-03-07  763  			       global->group_index_shift);
21a8f8a0eb35ce Anup Patel 2024-03-07  764  		if (base_addr != global->base_addr) {
21a8f8a0eb35ce Anup Patel 2024-03-07  765  			rc = -EINVAL;
21a8f8a0eb35ce Anup Patel 2024-03-07  766  			pr_err("%pfwP: address mismatch for regset %d\n", fwnode, i);
21a8f8a0eb35ce Anup Patel 2024-03-07  767  			goto out_iounmap;
21a8f8a0eb35ce Anup Patel 2024-03-07  768  		}
21a8f8a0eb35ce Anup Patel 2024-03-07  769  
21a8f8a0eb35ce Anup Patel 2024-03-07  770  		mmios_va[i] = ioremap(mmios[i].start, resource_size(&mmios[i]));
21a8f8a0eb35ce Anup Patel 2024-03-07  771  		if (!mmios_va[i]) {
21a8f8a0eb35ce Anup Patel 2024-03-07  772  			rc = -EIO;
21a8f8a0eb35ce Anup Patel 2024-03-07  773  			pr_err("%pfwP: unable to map MMIO regset %d\n", fwnode, i);
21a8f8a0eb35ce Anup Patel 2024-03-07  774  			goto out_iounmap;
21a8f8a0eb35ce Anup Patel 2024-03-07  775  		}
21a8f8a0eb35ce Anup Patel 2024-03-07  776  	}
21a8f8a0eb35ce Anup Patel 2024-03-07  777  
21a8f8a0eb35ce Anup Patel 2024-03-07  778  	/* Initialize local (or per-CPU )state */
21a8f8a0eb35ce Anup Patel 2024-03-07  779  	rc = imsic_local_init();
21a8f8a0eb35ce Anup Patel 2024-03-07  780  	if (rc) {
21a8f8a0eb35ce Anup Patel 2024-03-07  781  		pr_err("%pfwP: failed to initialize local state\n",
21a8f8a0eb35ce Anup Patel 2024-03-07  782  		       fwnode);
21a8f8a0eb35ce Anup Patel 2024-03-07  783  		goto out_iounmap;
21a8f8a0eb35ce Anup Patel 2024-03-07  784  	}
21a8f8a0eb35ce Anup Patel 2024-03-07  785  
21a8f8a0eb35ce Anup Patel 2024-03-07  786  	/* Configure handlers for target CPUs */
21a8f8a0eb35ce Anup Patel 2024-03-07  787  	for (i = 0; i < nr_parent_irqs; i++) {
21a8f8a0eb35ce Anup Patel 2024-03-07  788  		rc = imsic_get_parent_hartid(fwnode, i, &hartid);
21a8f8a0eb35ce Anup Patel 2024-03-07  789  		if (rc) {
21a8f8a0eb35ce Anup Patel 2024-03-07  790  			pr_warn("%pfwP: hart ID for parent irq%d not found\n", fwnode, i);
21a8f8a0eb35ce Anup Patel 2024-03-07  791  			continue;
21a8f8a0eb35ce Anup Patel 2024-03-07  792  		}
21a8f8a0eb35ce Anup Patel 2024-03-07  793  
21a8f8a0eb35ce Anup Patel 2024-03-07  794  		cpu = riscv_hartid_to_cpuid(hartid);
21a8f8a0eb35ce Anup Patel 2024-03-07  795  		if (cpu < 0) {
21a8f8a0eb35ce Anup Patel 2024-03-07  796  			pr_warn("%pfwP: invalid cpuid for parent irq%d\n", fwnode, i);
21a8f8a0eb35ce Anup Patel 2024-03-07  797  			continue;
21a8f8a0eb35ce Anup Patel 2024-03-07  798  		}
21a8f8a0eb35ce Anup Patel 2024-03-07  799  
21a8f8a0eb35ce Anup Patel 2024-03-07  800  		/* Find MMIO location of MSI page */
21a8f8a0eb35ce Anup Patel 2024-03-07  801  		index = nr_mmios;
21a8f8a0eb35ce Anup Patel 2024-03-07  802  		reloff = i * BIT(global->guest_index_bits) *
21a8f8a0eb35ce Anup Patel 2024-03-07  803  			 IMSIC_MMIO_PAGE_SZ;
21a8f8a0eb35ce Anup Patel 2024-03-07  804  		for (j = 0; nr_mmios; j++) {
21a8f8a0eb35ce Anup Patel 2024-03-07  805  			if (reloff < resource_size(&mmios[j])) {
21a8f8a0eb35ce Anup Patel 2024-03-07  806  				index = j;
21a8f8a0eb35ce Anup Patel 2024-03-07  807  				break;
21a8f8a0eb35ce Anup Patel 2024-03-07  808  			}
21a8f8a0eb35ce Anup Patel 2024-03-07  809  
21a8f8a0eb35ce Anup Patel 2024-03-07  810  			/*
21a8f8a0eb35ce Anup Patel 2024-03-07  811  			 * MMIO region size may not be aligned to
21a8f8a0eb35ce Anup Patel 2024-03-07  812  			 * BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ
21a8f8a0eb35ce Anup Patel 2024-03-07  813  			 * if holes are present.
21a8f8a0eb35ce Anup Patel 2024-03-07  814  			 */
21a8f8a0eb35ce Anup Patel 2024-03-07  815  			reloff -= ALIGN(resource_size(&mmios[j]),
21a8f8a0eb35ce Anup Patel 2024-03-07  816  			BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ);
21a8f8a0eb35ce Anup Patel 2024-03-07  817  		}
21a8f8a0eb35ce Anup Patel 2024-03-07  818  		if (index >= nr_mmios) {
21a8f8a0eb35ce Anup Patel 2024-03-07  819  			pr_warn("%pfwP: MMIO not found for parent irq%d\n", fwnode, i);
21a8f8a0eb35ce Anup Patel 2024-03-07  820  			continue;
21a8f8a0eb35ce Anup Patel 2024-03-07  821  		}
21a8f8a0eb35ce Anup Patel 2024-03-07  822  
21a8f8a0eb35ce Anup Patel 2024-03-07  823  		local = per_cpu_ptr(global->local, cpu);
21a8f8a0eb35ce Anup Patel 2024-03-07  824  		local->msi_pa = mmios[index].start + reloff;
21a8f8a0eb35ce Anup Patel 2024-03-07  825  		local->msi_va = mmios_va[index] + reloff;
21a8f8a0eb35ce Anup Patel 2024-03-07  826  
21a8f8a0eb35ce Anup Patel 2024-03-07  827  		nr_handlers++;
21a8f8a0eb35ce Anup Patel 2024-03-07  828  	}
21a8f8a0eb35ce Anup Patel 2024-03-07  829  
21a8f8a0eb35ce Anup Patel 2024-03-07  830  	/* If no CPU handlers found then can't take interrupts */
21a8f8a0eb35ce Anup Patel 2024-03-07  831  	if (!nr_handlers) {
21a8f8a0eb35ce Anup Patel 2024-03-07  832  		pr_err("%pfwP: No CPU handlers found\n", fwnode);
21a8f8a0eb35ce Anup Patel 2024-03-07  833  		rc = -ENODEV;
21a8f8a0eb35ce Anup Patel 2024-03-07  834  		goto out_local_cleanup;
21a8f8a0eb35ce Anup Patel 2024-03-07  835  	}
21a8f8a0eb35ce Anup Patel 2024-03-07  836  
21a8f8a0eb35ce Anup Patel 2024-03-07  837  	/* Initialize matrix allocator */
21a8f8a0eb35ce Anup Patel 2024-03-07  838  	rc = imsic_matrix_init();
21a8f8a0eb35ce Anup Patel 2024-03-07  839  	if (rc) {
21a8f8a0eb35ce Anup Patel 2024-03-07  840  		pr_err("%pfwP: failed to create matrix allocator\n", fwnode);
21a8f8a0eb35ce Anup Patel 2024-03-07  841  		goto out_local_cleanup;
21a8f8a0eb35ce Anup Patel 2024-03-07  842  	}
21a8f8a0eb35ce Anup Patel 2024-03-07  843  
21a8f8a0eb35ce Anup Patel 2024-03-07  844  	/* We don't need MMIO arrays anymore so let's free-up */
21a8f8a0eb35ce Anup Patel 2024-03-07  845  	kfree(mmios_va);
21a8f8a0eb35ce Anup Patel 2024-03-07  846  	kfree(mmios);
21a8f8a0eb35ce Anup Patel 2024-03-07  847  
21a8f8a0eb35ce Anup Patel 2024-03-07  848  	return 0;
21a8f8a0eb35ce Anup Patel 2024-03-07  849  
21a8f8a0eb35ce Anup Patel 2024-03-07  850  out_local_cleanup:
21a8f8a0eb35ce Anup Patel 2024-03-07  851  	imsic_local_cleanup();
21a8f8a0eb35ce Anup Patel 2024-03-07  852  out_iounmap:
21a8f8a0eb35ce Anup Patel 2024-03-07  853  	for (i = 0; i < nr_mmios; i++) {
21a8f8a0eb35ce Anup Patel 2024-03-07 @854  		if (mmios_va[i])

:::::: The code at line 854 was first introduced by commit
:::::: 21a8f8a0eb35ceb21e2c9ddd87468bc3b5ac87c0 irqchip: Add RISC-V incoming MSI controller early driver

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
