Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB851FCE
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Dec 2023 09:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3eZn1UV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702113290; x=1733649290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UcR8ANhBhAS2t3yQ8I3yMM7G26si4aFDe3Px6wceeQ4=;
  b=U3eZn1UV/7ev6Mz17Kt97ILrRMuGCxTsEsoadrMt2Hf/hL7Oh0ocWssb
   hF3auooybW0KWiZRncBSADlPtpZ++nLe9vt9AsYuEN281rn+7Tgm/KvDw
   TAy0AYNH0Wm2SWSfhVH/HZJwDkz5W50oue8fxDYSz9MPbTFgYbKulHGFl
   M0uQPU551W556oBZ48nMddB9WwBQUPNYyvaHwJ7fF0vk8AtgIx6LcJb++
   zb3V7skNNataFHTnW1HSKj+WnNEzKuNWB6XJGyox8VKcFQO244G9ozMEL
   mGggixtw8s+Rs+sAgNQ9gs9OAU9xTUmJkDblbJ9KBgVm+z7ingQ5MKUyN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="13196569"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="13196569"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 01:14:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="945668636"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="945668636"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 09 Dec 2023 01:14:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBtQ4-000F8H-1U;
	Sat, 09 Dec 2023 09:14:44 +0000
Date: Sat, 9 Dec 2023 17:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/irqchip/irq-apple-aic.c:1143 aic_of_ic_init() warn:
 'irqc->event' from of_iomap() not released on lines: 1143.
Message-ID: <202312091759.KabSHqF5-lkp@intel.com>
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
commit: 768d4435de2a042f35069c68587d8e6702102248 irqchip/apple-aic: Add support for AICv2
date:   1 year, 9 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year, 9 months ago
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231209/202312091759.KabSHqF5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312091759.KabSHqF5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312091759.KabSHqF5-lkp@intel.com/

New smatch warnings:
drivers/irqchip/irq-apple-aic.c:1143 aic_of_ic_init() warn: 'irqc->event' from of_iomap() not released on lines: 1143.

Old smatch warnings:
drivers/irqchip/irq-apple-aic.c:1070 aic_of_ic_init() error: uninitialized symbol 'off'.
drivers/irqchip/irq-apple-aic.c:1085 aic_of_ic_init() error: uninitialized symbol 'start_off'.

vim +1143 drivers/irqchip/irq-apple-aic.c

b6ca556c352979 Marc Zyngier  2021-02-28  1003  
76cde26394114f Hector Martin 2021-01-21  1004  static int __init aic_of_ic_init(struct device_node *node, struct device_node *parent)
76cde26394114f Hector Martin 2021-01-21  1005  {
a801f0ee563b81 Hector Martin 2022-03-10  1006  	int i, die;
a801f0ee563b81 Hector Martin 2022-03-10  1007  	u32 off, start_off;
76cde26394114f Hector Martin 2021-01-21  1008  	void __iomem *regs;
76cde26394114f Hector Martin 2021-01-21  1009  	struct aic_irq_chip *irqc;
2cf68211664acd Hector Martin 2022-03-10  1010  	const struct of_device_id *match;
76cde26394114f Hector Martin 2021-01-21  1011  
76cde26394114f Hector Martin 2021-01-21  1012  	regs = of_iomap(node, 0);
76cde26394114f Hector Martin 2021-01-21  1013  	if (WARN_ON(!regs))
76cde26394114f Hector Martin 2021-01-21  1014  		return -EIO;
76cde26394114f Hector Martin 2021-01-21  1015  
76cde26394114f Hector Martin 2021-01-21  1016  	irqc = kzalloc(sizeof(*irqc), GFP_KERNEL);
768d4435de2a04 Hector Martin 2022-03-10  1017  	if (!irqc) {
768d4435de2a04 Hector Martin 2022-03-10  1018  		iounmap(regs);
76cde26394114f Hector Martin 2021-01-21  1019  		return -ENOMEM;
768d4435de2a04 Hector Martin 2022-03-10  1020  	}
76cde26394114f Hector Martin 2021-01-21  1021  
76cde26394114f Hector Martin 2021-01-21  1022  	irqc->base = regs;
76cde26394114f Hector Martin 2021-01-21  1023  
2cf68211664acd Hector Martin 2022-03-10  1024  	match = of_match_node(aic_info_match, node);
2cf68211664acd Hector Martin 2022-03-10  1025  	if (!match)
768d4435de2a04 Hector Martin 2022-03-10  1026  		goto err_unmap;
2cf68211664acd Hector Martin 2022-03-10  1027  
2cf68211664acd Hector Martin 2022-03-10  1028  	irqc->info = *(struct aic_info *)match->data;
2cf68211664acd Hector Martin 2022-03-10  1029  
2cf68211664acd Hector Martin 2022-03-10  1030  	aic_irqc = irqc;
2cf68211664acd Hector Martin 2022-03-10  1031  
dc97fd6fec0099 Hector Martin 2022-03-10  1032  	switch (irqc->info.version) {
dc97fd6fec0099 Hector Martin 2022-03-10  1033  	case 1: {
dc97fd6fec0099 Hector Martin 2022-03-10  1034  		u32 info;
dc97fd6fec0099 Hector Martin 2022-03-10  1035  
76cde26394114f Hector Martin 2021-01-21  1036  		info = aic_ic_read(irqc, AIC_INFO);
7c841f5f6fa3f9 Hector Martin 2022-03-10  1037  		irqc->nr_irq = FIELD_GET(AIC_INFO_NR_IRQ, info);
dc97fd6fec0099 Hector Martin 2022-03-10  1038  		irqc->max_irq = AIC_MAX_IRQ;
a801f0ee563b81 Hector Martin 2022-03-10  1039  		irqc->nr_die = irqc->max_die = 1;
dc97fd6fec0099 Hector Martin 2022-03-10  1040  
a801f0ee563b81 Hector Martin 2022-03-10  1041  		off = start_off = irqc->info.target_cpu;
dc97fd6fec0099 Hector Martin 2022-03-10  1042  		off += sizeof(u32) * irqc->max_irq; /* TARGET_CPU */
dc97fd6fec0099 Hector Martin 2022-03-10  1043  
768d4435de2a04 Hector Martin 2022-03-10  1044  		irqc->event = irqc->base;
768d4435de2a04 Hector Martin 2022-03-10  1045  
768d4435de2a04 Hector Martin 2022-03-10  1046  		break;
768d4435de2a04 Hector Martin 2022-03-10  1047  	}
768d4435de2a04 Hector Martin 2022-03-10  1048  	case 2: {
768d4435de2a04 Hector Martin 2022-03-10  1049  		u32 info1, info3;
768d4435de2a04 Hector Martin 2022-03-10  1050  
768d4435de2a04 Hector Martin 2022-03-10  1051  		info1 = aic_ic_read(irqc, AIC2_INFO1);
768d4435de2a04 Hector Martin 2022-03-10  1052  		info3 = aic_ic_read(irqc, AIC2_INFO3);
768d4435de2a04 Hector Martin 2022-03-10  1053  
768d4435de2a04 Hector Martin 2022-03-10  1054  		irqc->nr_irq = FIELD_GET(AIC2_INFO1_NR_IRQ, info1);
768d4435de2a04 Hector Martin 2022-03-10  1055  		irqc->max_irq = FIELD_GET(AIC2_INFO3_MAX_IRQ, info3);
768d4435de2a04 Hector Martin 2022-03-10  1056  		irqc->nr_die = FIELD_GET(AIC2_INFO1_LAST_DIE, info1) + 1;
768d4435de2a04 Hector Martin 2022-03-10  1057  		irqc->max_die = FIELD_GET(AIC2_INFO3_MAX_DIE, info3);
768d4435de2a04 Hector Martin 2022-03-10  1058  
768d4435de2a04 Hector Martin 2022-03-10  1059  		off = start_off = irqc->info.irq_cfg;
768d4435de2a04 Hector Martin 2022-03-10  1060  		off += sizeof(u32) * irqc->max_irq; /* IRQ_CFG */
768d4435de2a04 Hector Martin 2022-03-10  1061  
768d4435de2a04 Hector Martin 2022-03-10  1062  		irqc->event = of_iomap(node, 1);
768d4435de2a04 Hector Martin 2022-03-10  1063  		if (WARN_ON(!irqc->event))
768d4435de2a04 Hector Martin 2022-03-10  1064  			goto err_unmap;
768d4435de2a04 Hector Martin 2022-03-10  1065  
dc97fd6fec0099 Hector Martin 2022-03-10  1066  		break;
dc97fd6fec0099 Hector Martin 2022-03-10  1067  	}
dc97fd6fec0099 Hector Martin 2022-03-10  1068  	}
dc97fd6fec0099 Hector Martin 2022-03-10  1069  
dc97fd6fec0099 Hector Martin 2022-03-10  1070  	irqc->info.sw_set = off;
dc97fd6fec0099 Hector Martin 2022-03-10  1071  	off += sizeof(u32) * (irqc->max_irq >> 5); /* SW_SET */
dc97fd6fec0099 Hector Martin 2022-03-10  1072  	irqc->info.sw_clr = off;
dc97fd6fec0099 Hector Martin 2022-03-10  1073  	off += sizeof(u32) * (irqc->max_irq >> 5); /* SW_CLR */
dc97fd6fec0099 Hector Martin 2022-03-10  1074  	irqc->info.mask_set = off;
dc97fd6fec0099 Hector Martin 2022-03-10  1075  	off += sizeof(u32) * (irqc->max_irq >> 5); /* MASK_SET */
dc97fd6fec0099 Hector Martin 2022-03-10  1076  	irqc->info.mask_clr = off;
dc97fd6fec0099 Hector Martin 2022-03-10  1077  	off += sizeof(u32) * (irqc->max_irq >> 5); /* MASK_CLR */
dc97fd6fec0099 Hector Martin 2022-03-10  1078  	off += sizeof(u32) * (irqc->max_irq >> 5); /* HW_STATE */
76cde26394114f Hector Martin 2021-01-21  1079  
2cf68211664acd Hector Martin 2022-03-10  1080  	if (irqc->info.fast_ipi)
2cf68211664acd Hector Martin 2022-03-10  1081  		static_branch_enable(&use_fast_ipi);
2cf68211664acd Hector Martin 2022-03-10  1082  	else
2cf68211664acd Hector Martin 2022-03-10  1083  		static_branch_disable(&use_fast_ipi);
2cf68211664acd Hector Martin 2022-03-10  1084  
a801f0ee563b81 Hector Martin 2022-03-10  1085  	irqc->info.die_stride = off - start_off;
a801f0ee563b81 Hector Martin 2022-03-10  1086  
7c841f5f6fa3f9 Hector Martin 2022-03-10  1087  	irqc->hw_domain = irq_domain_create_tree(of_node_to_fwnode(node),
76cde26394114f Hector Martin 2021-01-21  1088  						 &aic_irq_domain_ops, irqc);
768d4435de2a04 Hector Martin 2022-03-10  1089  	if (WARN_ON(!irqc->hw_domain))
768d4435de2a04 Hector Martin 2022-03-10  1090  		goto err_unmap;
76cde26394114f Hector Martin 2021-01-21  1091  
76cde26394114f Hector Martin 2021-01-21  1092  	irq_domain_update_bus_token(irqc->hw_domain, DOMAIN_BUS_WIRED);
76cde26394114f Hector Martin 2021-01-21  1093  
768d4435de2a04 Hector Martin 2022-03-10  1094  	if (aic_init_smp(irqc, node))
768d4435de2a04 Hector Martin 2022-03-10  1095  		goto err_remove_domain;
76cde26394114f Hector Martin 2021-01-21  1096  
76cde26394114f Hector Martin 2021-01-21  1097  	set_handle_irq(aic_handle_irq);
76cde26394114f Hector Martin 2021-01-21  1098  	set_handle_fiq(aic_handle_fiq);
76cde26394114f Hector Martin 2021-01-21  1099  
a801f0ee563b81 Hector Martin 2022-03-10  1100  	off = 0;
a801f0ee563b81 Hector Martin 2022-03-10  1101  	for (die = 0; die < irqc->nr_die; die++) {
7c841f5f6fa3f9 Hector Martin 2022-03-10  1102  		for (i = 0; i < BITS_TO_U32(irqc->nr_irq); i++)
a801f0ee563b81 Hector Martin 2022-03-10  1103  			aic_ic_write(irqc, irqc->info.mask_set + off + i * 4, U32_MAX);
7c841f5f6fa3f9 Hector Martin 2022-03-10  1104  		for (i = 0; i < BITS_TO_U32(irqc->nr_irq); i++)
a801f0ee563b81 Hector Martin 2022-03-10  1105  			aic_ic_write(irqc, irqc->info.sw_clr + off + i * 4, U32_MAX);
a801f0ee563b81 Hector Martin 2022-03-10  1106  		if (irqc->info.target_cpu)
7c841f5f6fa3f9 Hector Martin 2022-03-10  1107  			for (i = 0; i < irqc->nr_irq; i++)
a801f0ee563b81 Hector Martin 2022-03-10  1108  				aic_ic_write(irqc, irqc->info.target_cpu + off + i * 4, 1);
a801f0ee563b81 Hector Martin 2022-03-10  1109  		off += irqc->info.die_stride;
a801f0ee563b81 Hector Martin 2022-03-10  1110  	}
76cde26394114f Hector Martin 2021-01-21  1111  
768d4435de2a04 Hector Martin 2022-03-10  1112  	if (irqc->info.version == 2) {
768d4435de2a04 Hector Martin 2022-03-10  1113  		u32 config = aic_ic_read(irqc, AIC2_CONFIG);
768d4435de2a04 Hector Martin 2022-03-10  1114  
768d4435de2a04 Hector Martin 2022-03-10  1115  		config |= AIC2_CONFIG_ENABLE;
768d4435de2a04 Hector Martin 2022-03-10  1116  		aic_ic_write(irqc, AIC2_CONFIG, config);
768d4435de2a04 Hector Martin 2022-03-10  1117  	}
768d4435de2a04 Hector Martin 2022-03-10  1118  
76cde26394114f Hector Martin 2021-01-21  1119  	if (!is_kernel_in_hyp_mode())
76cde26394114f Hector Martin 2021-01-21  1120  		pr_info("Kernel running in EL1, mapping interrupts");
76cde26394114f Hector Martin 2021-01-21  1121  
2cf68211664acd Hector Martin 2022-03-10  1122  	if (static_branch_likely(&use_fast_ipi))
2cf68211664acd Hector Martin 2022-03-10  1123  		pr_info("Using Fast IPIs");
2cf68211664acd Hector Martin 2022-03-10  1124  
76cde26394114f Hector Martin 2021-01-21  1125  	cpuhp_setup_state(CPUHP_AP_IRQ_APPLE_AIC_STARTING,
76cde26394114f Hector Martin 2021-01-21  1126  			  "irqchip/apple-aic/ipi:starting",
76cde26394114f Hector Martin 2021-01-21  1127  			  aic_init_cpu, NULL);
76cde26394114f Hector Martin 2021-01-21  1128  
b6ca556c352979 Marc Zyngier  2021-02-28  1129  	vgic_set_kvm_info(&vgic_info);
b6ca556c352979 Marc Zyngier  2021-02-28  1130  
a801f0ee563b81 Hector Martin 2022-03-10  1131  	pr_info("Initialized with %d/%d IRQs * %d/%d die(s), %d FIQs, %d vIPIs",
a801f0ee563b81 Hector Martin 2022-03-10  1132  		irqc->nr_irq, irqc->max_irq, irqc->nr_die, irqc->max_die, AIC_NR_FIQ, AIC_NR_SWIPI);
76cde26394114f Hector Martin 2021-01-21  1133  
76cde26394114f Hector Martin 2021-01-21  1134  	return 0;
768d4435de2a04 Hector Martin 2022-03-10  1135  
768d4435de2a04 Hector Martin 2022-03-10  1136  err_remove_domain:
768d4435de2a04 Hector Martin 2022-03-10  1137  	irq_domain_remove(irqc->hw_domain);
768d4435de2a04 Hector Martin 2022-03-10  1138  err_unmap:
768d4435de2a04 Hector Martin 2022-03-10  1139  	if (irqc->event && irqc->event != irqc->base)
768d4435de2a04 Hector Martin 2022-03-10  1140  		iounmap(irqc->event);
768d4435de2a04 Hector Martin 2022-03-10  1141  	iounmap(irqc->base);
768d4435de2a04 Hector Martin 2022-03-10  1142  	kfree(irqc);
768d4435de2a04 Hector Martin 2022-03-10 @1143  	return -ENODEV;
76cde26394114f Hector Martin 2021-01-21  1144  }
76cde26394114f Hector Martin 2021-01-21  1145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
