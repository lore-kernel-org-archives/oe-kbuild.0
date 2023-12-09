Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009F810F6
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Dec 2023 03:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBVFQv3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702093433; x=1733629433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W4ExS09ycKI1z42RD5iQu8UoxvtPRZyoqIJCYN1fizQ=;
  b=VBVFQv3il0sYRDuV3+xkvmGJGo3eNQuObOufApy33a2faqugEMcOj1qs
   +dOZRUJXyhLQlJ2Qlt1Ep+nb+M3njE2dmUZNoxRBMkVdONmXeae9wOao7
   whbgHmKGKSGEVcxje0HaOpBtSgtunAM0QU8AHgu1p6DXIEpEtak88AakJ
   s1SjnDIj66mpgUV9H21tPEjS8dVWyzVD+HJ6+7fbwYzoD1Ycz473wXU3s
   V2gV4h0hYpW/1eevskc+T6uoTpiTaHwXOeHqobt5tqa1pwldQWPAKtugb
   IRCpZ0QASS0Yr73AyJCmP94dIxdd80wlmNz6KFePX8k7vGmAsdho7J6zP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="379492139"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="379492139"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 19:43:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="722077896"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="722077896"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 08 Dec 2023 19:43:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBoFp-000ElN-1f;
	Sat, 09 Dec 2023 03:43:49 +0000
Date: Sat, 9 Dec 2023 11:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/irqchip/irq-apple-aic.c:980 aic_of_ic_init() error:
 uninitialized symbol 'start_off'.
Message-ID: <202312091120.v7TBktc7-lkp@intel.com>
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
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: a801f0ee563b8180caf186493806a145a75b4a3c irqchip/apple-aic: Support multiple dies
date:   1 year, 9 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 9 months ago
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231209/202312091120.v7TBktc7-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312091120.v7TBktc7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312091120.v7TBktc7-lkp@intel.com/

New smatch warnings:
drivers/irqchip/irq-apple-aic.c:980 aic_of_ic_init() error: uninitialized symbol 'start_off'.

Old smatch warnings:
drivers/irqchip/irq-apple-aic.c:943 aic_of_ic_init() warn: possible memory leak of 'irqc'
drivers/irqchip/irq-apple-aic.c:965 aic_of_ic_init() error: uninitialized symbol 'off'.
drivers/irqchip/irq-apple-aic.c:1029 aic_of_ic_init() warn: 'regs' from of_iomap() not released on lines: 937,943.

vim +/start_off +980 drivers/irqchip/irq-apple-aic.c

b6ca556c352979 Marc Zyngier  2021-02-28   922  
76cde26394114f Hector Martin 2021-01-21   923  static int __init aic_of_ic_init(struct device_node *node, struct device_node *parent)
76cde26394114f Hector Martin 2021-01-21   924  {
a801f0ee563b81 Hector Martin 2022-03-10   925  	int i, die;
a801f0ee563b81 Hector Martin 2022-03-10   926  	u32 off, start_off;
76cde26394114f Hector Martin 2021-01-21   927  	void __iomem *regs;
76cde26394114f Hector Martin 2021-01-21   928  	struct aic_irq_chip *irqc;
2cf68211664acd Hector Martin 2022-03-10   929  	const struct of_device_id *match;
76cde26394114f Hector Martin 2021-01-21   930  
76cde26394114f Hector Martin 2021-01-21   931  	regs = of_iomap(node, 0);
76cde26394114f Hector Martin 2021-01-21   932  	if (WARN_ON(!regs))
76cde26394114f Hector Martin 2021-01-21   933  		return -EIO;
76cde26394114f Hector Martin 2021-01-21   934  
76cde26394114f Hector Martin 2021-01-21   935  	irqc = kzalloc(sizeof(*irqc), GFP_KERNEL);
76cde26394114f Hector Martin 2021-01-21   936  	if (!irqc)
76cde26394114f Hector Martin 2021-01-21   937  		return -ENOMEM;
76cde26394114f Hector Martin 2021-01-21   938  
76cde26394114f Hector Martin 2021-01-21   939  	irqc->base = regs;
76cde26394114f Hector Martin 2021-01-21   940  
2cf68211664acd Hector Martin 2022-03-10   941  	match = of_match_node(aic_info_match, node);
2cf68211664acd Hector Martin 2022-03-10   942  	if (!match)
2cf68211664acd Hector Martin 2022-03-10   943  		return -ENODEV;
2cf68211664acd Hector Martin 2022-03-10   944  
2cf68211664acd Hector Martin 2022-03-10   945  	irqc->info = *(struct aic_info *)match->data;
2cf68211664acd Hector Martin 2022-03-10   946  
2cf68211664acd Hector Martin 2022-03-10   947  	aic_irqc = irqc;
2cf68211664acd Hector Martin 2022-03-10   948  
dc97fd6fec0099 Hector Martin 2022-03-10   949  	switch (irqc->info.version) {
dc97fd6fec0099 Hector Martin 2022-03-10   950  	case 1: {
dc97fd6fec0099 Hector Martin 2022-03-10   951  		u32 info;
dc97fd6fec0099 Hector Martin 2022-03-10   952  
76cde26394114f Hector Martin 2021-01-21   953  		info = aic_ic_read(irqc, AIC_INFO);
7c841f5f6fa3f9 Hector Martin 2022-03-10   954  		irqc->nr_irq = FIELD_GET(AIC_INFO_NR_IRQ, info);
dc97fd6fec0099 Hector Martin 2022-03-10   955  		irqc->max_irq = AIC_MAX_IRQ;
a801f0ee563b81 Hector Martin 2022-03-10   956  		irqc->nr_die = irqc->max_die = 1;
dc97fd6fec0099 Hector Martin 2022-03-10   957  
a801f0ee563b81 Hector Martin 2022-03-10   958  		off = start_off = irqc->info.target_cpu;
dc97fd6fec0099 Hector Martin 2022-03-10   959  		off += sizeof(u32) * irqc->max_irq; /* TARGET_CPU */
dc97fd6fec0099 Hector Martin 2022-03-10   960  
dc97fd6fec0099 Hector Martin 2022-03-10   961  		break;
dc97fd6fec0099 Hector Martin 2022-03-10   962  	}
dc97fd6fec0099 Hector Martin 2022-03-10   963  	}
dc97fd6fec0099 Hector Martin 2022-03-10   964  
dc97fd6fec0099 Hector Martin 2022-03-10   965  	irqc->info.sw_set = off;
dc97fd6fec0099 Hector Martin 2022-03-10   966  	off += sizeof(u32) * (irqc->max_irq >> 5); /* SW_SET */
dc97fd6fec0099 Hector Martin 2022-03-10   967  	irqc->info.sw_clr = off;
dc97fd6fec0099 Hector Martin 2022-03-10   968  	off += sizeof(u32) * (irqc->max_irq >> 5); /* SW_CLR */
dc97fd6fec0099 Hector Martin 2022-03-10   969  	irqc->info.mask_set = off;
dc97fd6fec0099 Hector Martin 2022-03-10   970  	off += sizeof(u32) * (irqc->max_irq >> 5); /* MASK_SET */
dc97fd6fec0099 Hector Martin 2022-03-10   971  	irqc->info.mask_clr = off;
dc97fd6fec0099 Hector Martin 2022-03-10   972  	off += sizeof(u32) * (irqc->max_irq >> 5); /* MASK_CLR */
dc97fd6fec0099 Hector Martin 2022-03-10   973  	off += sizeof(u32) * (irqc->max_irq >> 5); /* HW_STATE */
76cde26394114f Hector Martin 2021-01-21   974  
2cf68211664acd Hector Martin 2022-03-10   975  	if (irqc->info.fast_ipi)
2cf68211664acd Hector Martin 2022-03-10   976  		static_branch_enable(&use_fast_ipi);
2cf68211664acd Hector Martin 2022-03-10   977  	else
2cf68211664acd Hector Martin 2022-03-10   978  		static_branch_disable(&use_fast_ipi);
2cf68211664acd Hector Martin 2022-03-10   979  
a801f0ee563b81 Hector Martin 2022-03-10  @980  	irqc->info.die_stride = off - start_off;
a801f0ee563b81 Hector Martin 2022-03-10   981  
7c841f5f6fa3f9 Hector Martin 2022-03-10   982  	irqc->hw_domain = irq_domain_create_tree(of_node_to_fwnode(node),
76cde26394114f Hector Martin 2021-01-21   983  						 &aic_irq_domain_ops, irqc);
76cde26394114f Hector Martin 2021-01-21   984  	if (WARN_ON(!irqc->hw_domain)) {
76cde26394114f Hector Martin 2021-01-21   985  		iounmap(irqc->base);
76cde26394114f Hector Martin 2021-01-21   986  		kfree(irqc);
76cde26394114f Hector Martin 2021-01-21   987  		return -ENODEV;
76cde26394114f Hector Martin 2021-01-21   988  	}
76cde26394114f Hector Martin 2021-01-21   989  
76cde26394114f Hector Martin 2021-01-21   990  	irq_domain_update_bus_token(irqc->hw_domain, DOMAIN_BUS_WIRED);
76cde26394114f Hector Martin 2021-01-21   991  
76cde26394114f Hector Martin 2021-01-21   992  	if (aic_init_smp(irqc, node)) {
76cde26394114f Hector Martin 2021-01-21   993  		irq_domain_remove(irqc->hw_domain);
76cde26394114f Hector Martin 2021-01-21   994  		iounmap(irqc->base);
76cde26394114f Hector Martin 2021-01-21   995  		kfree(irqc);
76cde26394114f Hector Martin 2021-01-21   996  		return -ENODEV;
76cde26394114f Hector Martin 2021-01-21   997  	}
76cde26394114f Hector Martin 2021-01-21   998  
76cde26394114f Hector Martin 2021-01-21   999  	set_handle_irq(aic_handle_irq);
76cde26394114f Hector Martin 2021-01-21  1000  	set_handle_fiq(aic_handle_fiq);
76cde26394114f Hector Martin 2021-01-21  1001  
a801f0ee563b81 Hector Martin 2022-03-10  1002  	off = 0;
a801f0ee563b81 Hector Martin 2022-03-10  1003  	for (die = 0; die < irqc->nr_die; die++) {
7c841f5f6fa3f9 Hector Martin 2022-03-10  1004  		for (i = 0; i < BITS_TO_U32(irqc->nr_irq); i++)
a801f0ee563b81 Hector Martin 2022-03-10  1005  			aic_ic_write(irqc, irqc->info.mask_set + off + i * 4, U32_MAX);
7c841f5f6fa3f9 Hector Martin 2022-03-10  1006  		for (i = 0; i < BITS_TO_U32(irqc->nr_irq); i++)
a801f0ee563b81 Hector Martin 2022-03-10  1007  			aic_ic_write(irqc, irqc->info.sw_clr + off + i * 4, U32_MAX);
a801f0ee563b81 Hector Martin 2022-03-10  1008  		if (irqc->info.target_cpu)
7c841f5f6fa3f9 Hector Martin 2022-03-10  1009  			for (i = 0; i < irqc->nr_irq; i++)
a801f0ee563b81 Hector Martin 2022-03-10  1010  				aic_ic_write(irqc, irqc->info.target_cpu + off + i * 4, 1);
a801f0ee563b81 Hector Martin 2022-03-10  1011  		off += irqc->info.die_stride;
a801f0ee563b81 Hector Martin 2022-03-10  1012  	}
76cde26394114f Hector Martin 2021-01-21  1013  
76cde26394114f Hector Martin 2021-01-21  1014  	if (!is_kernel_in_hyp_mode())
76cde26394114f Hector Martin 2021-01-21  1015  		pr_info("Kernel running in EL1, mapping interrupts");
76cde26394114f Hector Martin 2021-01-21  1016  
2cf68211664acd Hector Martin 2022-03-10  1017  	if (static_branch_likely(&use_fast_ipi))
2cf68211664acd Hector Martin 2022-03-10  1018  		pr_info("Using Fast IPIs");
2cf68211664acd Hector Martin 2022-03-10  1019  
76cde26394114f Hector Martin 2021-01-21  1020  	cpuhp_setup_state(CPUHP_AP_IRQ_APPLE_AIC_STARTING,
76cde26394114f Hector Martin 2021-01-21  1021  			  "irqchip/apple-aic/ipi:starting",
76cde26394114f Hector Martin 2021-01-21  1022  			  aic_init_cpu, NULL);
76cde26394114f Hector Martin 2021-01-21  1023  
b6ca556c352979 Marc Zyngier  2021-02-28  1024  	vgic_set_kvm_info(&vgic_info);
b6ca556c352979 Marc Zyngier  2021-02-28  1025  
a801f0ee563b81 Hector Martin 2022-03-10  1026  	pr_info("Initialized with %d/%d IRQs * %d/%d die(s), %d FIQs, %d vIPIs",
a801f0ee563b81 Hector Martin 2022-03-10  1027  		irqc->nr_irq, irqc->max_irq, irqc->nr_die, irqc->max_die, AIC_NR_FIQ, AIC_NR_SWIPI);
76cde26394114f Hector Martin 2021-01-21  1028  
76cde26394114f Hector Martin 2021-01-21  1029  	return 0;
76cde26394114f Hector Martin 2021-01-21  1030  }
76cde26394114f Hector Martin 2021-01-21  1031  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
