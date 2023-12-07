Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7D0199D2
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Dec 2023 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeUIQwAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701981836; x=1733517836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/h3756kIcBkQaaaK2lQIRFGqMgLeSlKwtM7UR9g2OU8=;
  b=AeUIQwAvsL1GT1kmvzaqO4AQ17uIY/aMSVXJ+nINBMlZdGC3LSqrFnon
   IvungW61wYsvQa7nGFldNYgXmQLUyRD+IBjnu3NCe2ewskad3BHPCb3mB
   II4OfqOhDWqERJew55fQvZtwswx309AZFbgx1khU+oc9C102NX0wTJcYN
   pKbeDT6GmxF5CtkO0k/WTO3q9jZl3SXyN5L5DyMz0N8j6rmu1Sbd20Kyu
   fI/hmC3XFA8W1YkoTOiJFpLrAZS/27vRNSAcaWVF1OqXQCh50aTXrVgJy
   JXt8v30FIlrNav6Q6FD2zJNKCbthAaGbJLiq3rXXV8ixsDcZxYDF3985c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="7620489"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="7620489"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 12:43:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1019088115"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="1019088115"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2023 12:43:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBLDs-000Cod-0A;
	Thu, 07 Dec 2023 20:43:52 +0000
Date: Fri, 8 Dec 2023 04:43:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/irqchip/irq-apple-aic.c:941 aic_of_ic_init() error:
 uninitialized symbol 'off'.
Message-ID: <202312080450.6gI69Jba-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: dc97fd6fec009957e81026055fc99a03877ff3b8 irqchip/apple-aic: Dynamically compute register offsets
date:   1 year, 9 months ago
:::::: branch date: 3 days ago
:::::: commit date: 1 year, 9 months ago
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231208/202312080450.6gI69Jba-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312080450.6gI69Jba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312080450.6gI69Jba-lkp@intel.com/

New smatch warnings:
drivers/irqchip/irq-apple-aic.c:941 aic_of_ic_init() error: uninitialized symbol 'off'.

Old smatch warnings:
drivers/irqchip/irq-apple-aic.c:920 aic_of_ic_init() warn: possible memory leak of 'irqc'
drivers/irqchip/irq-apple-aic.c:998 aic_of_ic_init() warn: 'regs' from of_iomap() not released on lines: 914,920.

vim +/off +941 drivers/irqchip/irq-apple-aic.c

b6ca556c352979 Marc Zyngier  2021-02-28   899  
76cde26394114f Hector Martin 2021-01-21   900  static int __init aic_of_ic_init(struct device_node *node, struct device_node *parent)
76cde26394114f Hector Martin 2021-01-21   901  {
76cde26394114f Hector Martin 2021-01-21   902  	int i;
dc97fd6fec0099 Hector Martin 2022-03-10   903  	u32 off;
76cde26394114f Hector Martin 2021-01-21   904  	void __iomem *regs;
76cde26394114f Hector Martin 2021-01-21   905  	struct aic_irq_chip *irqc;
2cf68211664acd Hector Martin 2022-03-10   906  	const struct of_device_id *match;
76cde26394114f Hector Martin 2021-01-21   907  
76cde26394114f Hector Martin 2021-01-21   908  	regs = of_iomap(node, 0);
76cde26394114f Hector Martin 2021-01-21   909  	if (WARN_ON(!regs))
76cde26394114f Hector Martin 2021-01-21   910  		return -EIO;
76cde26394114f Hector Martin 2021-01-21   911  
76cde26394114f Hector Martin 2021-01-21   912  	irqc = kzalloc(sizeof(*irqc), GFP_KERNEL);
76cde26394114f Hector Martin 2021-01-21   913  	if (!irqc)
76cde26394114f Hector Martin 2021-01-21   914  		return -ENOMEM;
76cde26394114f Hector Martin 2021-01-21   915  
76cde26394114f Hector Martin 2021-01-21   916  	irqc->base = regs;
76cde26394114f Hector Martin 2021-01-21   917  
2cf68211664acd Hector Martin 2022-03-10   918  	match = of_match_node(aic_info_match, node);
2cf68211664acd Hector Martin 2022-03-10   919  	if (!match)
2cf68211664acd Hector Martin 2022-03-10   920  		return -ENODEV;
2cf68211664acd Hector Martin 2022-03-10   921  
2cf68211664acd Hector Martin 2022-03-10   922  	irqc->info = *(struct aic_info *)match->data;
2cf68211664acd Hector Martin 2022-03-10   923  
2cf68211664acd Hector Martin 2022-03-10   924  	aic_irqc = irqc;
2cf68211664acd Hector Martin 2022-03-10   925  
dc97fd6fec0099 Hector Martin 2022-03-10   926  	switch (irqc->info.version) {
dc97fd6fec0099 Hector Martin 2022-03-10   927  	case 1: {
dc97fd6fec0099 Hector Martin 2022-03-10   928  		u32 info;
dc97fd6fec0099 Hector Martin 2022-03-10   929  
76cde26394114f Hector Martin 2021-01-21   930  		info = aic_ic_read(irqc, AIC_INFO);
7c841f5f6fa3f9 Hector Martin 2022-03-10   931  		irqc->nr_irq = FIELD_GET(AIC_INFO_NR_IRQ, info);
dc97fd6fec0099 Hector Martin 2022-03-10   932  		irqc->max_irq = AIC_MAX_IRQ;
dc97fd6fec0099 Hector Martin 2022-03-10   933  
dc97fd6fec0099 Hector Martin 2022-03-10   934  		off = irqc->info.target_cpu;
dc97fd6fec0099 Hector Martin 2022-03-10   935  		off += sizeof(u32) * irqc->max_irq; /* TARGET_CPU */
dc97fd6fec0099 Hector Martin 2022-03-10   936  
dc97fd6fec0099 Hector Martin 2022-03-10   937  		break;
dc97fd6fec0099 Hector Martin 2022-03-10   938  	}
dc97fd6fec0099 Hector Martin 2022-03-10   939  	}
dc97fd6fec0099 Hector Martin 2022-03-10   940  
dc97fd6fec0099 Hector Martin 2022-03-10  @941  	irqc->info.sw_set = off;
dc97fd6fec0099 Hector Martin 2022-03-10   942  	off += sizeof(u32) * (irqc->max_irq >> 5); /* SW_SET */
dc97fd6fec0099 Hector Martin 2022-03-10   943  	irqc->info.sw_clr = off;
dc97fd6fec0099 Hector Martin 2022-03-10   944  	off += sizeof(u32) * (irqc->max_irq >> 5); /* SW_CLR */
dc97fd6fec0099 Hector Martin 2022-03-10   945  	irqc->info.mask_set = off;
dc97fd6fec0099 Hector Martin 2022-03-10   946  	off += sizeof(u32) * (irqc->max_irq >> 5); /* MASK_SET */
dc97fd6fec0099 Hector Martin 2022-03-10   947  	irqc->info.mask_clr = off;
dc97fd6fec0099 Hector Martin 2022-03-10   948  	off += sizeof(u32) * (irqc->max_irq >> 5); /* MASK_CLR */
dc97fd6fec0099 Hector Martin 2022-03-10   949  	off += sizeof(u32) * (irqc->max_irq >> 5); /* HW_STATE */
76cde26394114f Hector Martin 2021-01-21   950  
2cf68211664acd Hector Martin 2022-03-10   951  	if (irqc->info.fast_ipi)
2cf68211664acd Hector Martin 2022-03-10   952  		static_branch_enable(&use_fast_ipi);
2cf68211664acd Hector Martin 2022-03-10   953  	else
2cf68211664acd Hector Martin 2022-03-10   954  		static_branch_disable(&use_fast_ipi);
2cf68211664acd Hector Martin 2022-03-10   955  
7c841f5f6fa3f9 Hector Martin 2022-03-10   956  	irqc->hw_domain = irq_domain_create_tree(of_node_to_fwnode(node),
76cde26394114f Hector Martin 2021-01-21   957  						 &aic_irq_domain_ops, irqc);
76cde26394114f Hector Martin 2021-01-21   958  	if (WARN_ON(!irqc->hw_domain)) {
76cde26394114f Hector Martin 2021-01-21   959  		iounmap(irqc->base);
76cde26394114f Hector Martin 2021-01-21   960  		kfree(irqc);
76cde26394114f Hector Martin 2021-01-21   961  		return -ENODEV;
76cde26394114f Hector Martin 2021-01-21   962  	}
76cde26394114f Hector Martin 2021-01-21   963  
76cde26394114f Hector Martin 2021-01-21   964  	irq_domain_update_bus_token(irqc->hw_domain, DOMAIN_BUS_WIRED);
76cde26394114f Hector Martin 2021-01-21   965  
76cde26394114f Hector Martin 2021-01-21   966  	if (aic_init_smp(irqc, node)) {
76cde26394114f Hector Martin 2021-01-21   967  		irq_domain_remove(irqc->hw_domain);
76cde26394114f Hector Martin 2021-01-21   968  		iounmap(irqc->base);
76cde26394114f Hector Martin 2021-01-21   969  		kfree(irqc);
76cde26394114f Hector Martin 2021-01-21   970  		return -ENODEV;
76cde26394114f Hector Martin 2021-01-21   971  	}
76cde26394114f Hector Martin 2021-01-21   972  
76cde26394114f Hector Martin 2021-01-21   973  	set_handle_irq(aic_handle_irq);
76cde26394114f Hector Martin 2021-01-21   974  	set_handle_fiq(aic_handle_fiq);
76cde26394114f Hector Martin 2021-01-21   975  
7c841f5f6fa3f9 Hector Martin 2022-03-10   976  	for (i = 0; i < BITS_TO_U32(irqc->nr_irq); i++)
dc97fd6fec0099 Hector Martin 2022-03-10   977  		aic_ic_write(irqc, irqc->info.mask_set + i * 4, U32_MAX);
7c841f5f6fa3f9 Hector Martin 2022-03-10   978  	for (i = 0; i < BITS_TO_U32(irqc->nr_irq); i++)
dc97fd6fec0099 Hector Martin 2022-03-10   979  		aic_ic_write(irqc, irqc->info.sw_clr + i * 4, U32_MAX);
7c841f5f6fa3f9 Hector Martin 2022-03-10   980  	for (i = 0; i < irqc->nr_irq; i++)
dc97fd6fec0099 Hector Martin 2022-03-10   981  		aic_ic_write(irqc, irqc->info.target_cpu + i * 4, 1);
76cde26394114f Hector Martin 2021-01-21   982  
76cde26394114f Hector Martin 2021-01-21   983  	if (!is_kernel_in_hyp_mode())
76cde26394114f Hector Martin 2021-01-21   984  		pr_info("Kernel running in EL1, mapping interrupts");
76cde26394114f Hector Martin 2021-01-21   985  
2cf68211664acd Hector Martin 2022-03-10   986  	if (static_branch_likely(&use_fast_ipi))
2cf68211664acd Hector Martin 2022-03-10   987  		pr_info("Using Fast IPIs");
2cf68211664acd Hector Martin 2022-03-10   988  
76cde26394114f Hector Martin 2021-01-21   989  	cpuhp_setup_state(CPUHP_AP_IRQ_APPLE_AIC_STARTING,
76cde26394114f Hector Martin 2021-01-21   990  			  "irqchip/apple-aic/ipi:starting",
76cde26394114f Hector Martin 2021-01-21   991  			  aic_init_cpu, NULL);
76cde26394114f Hector Martin 2021-01-21   992  
b6ca556c352979 Marc Zyngier  2021-02-28   993  	vgic_set_kvm_info(&vgic_info);
b6ca556c352979 Marc Zyngier  2021-02-28   994  
dc97fd6fec0099 Hector Martin 2022-03-10   995  	pr_info("Initialized with %d/%d IRQs, %d FIQs, %d vIPIs",
dc97fd6fec0099 Hector Martin 2022-03-10   996  		irqc->nr_irq, irqc->max_irq, AIC_NR_FIQ, AIC_NR_SWIPI);
76cde26394114f Hector Martin 2021-01-21   997  
76cde26394114f Hector Martin 2021-01-21   998  	return 0;
76cde26394114f Hector Martin 2021-01-21   999  }
76cde26394114f Hector Martin 2021-01-21  1000  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
