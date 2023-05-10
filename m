Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC52651
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 03:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683690193; x=1715226193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vO9FQS22uoDuLtL5JuEBMNuXa9hfxRjNERbiC4TBrhk=;
  b=C5l2IZiK/Oadi4T/ExA418ZRu356j5Ze0cK3qg7/MJInMna8Bm9GMSMj
   Hevmr+2gwaSV8PXHeCO1grdl2lsl6w2v0YhTu6ZSZOJp8SrDEA6OEwTs7
   ELiqGqe7l2ictd0CaBlIzuuMkF0ATeojV/4K8RvHlk2bwRGTLkOwlQTfH
   6u7zO7zaA3NCYpX7SIQp366RhMKH3218jC50wpIsmyln9O/WsrJRJ0zL6
   jkC7g7zesNmx68ML61TW5TGY5BUhiUHkfDCq6zaYluc4nWBgq/0N8aW2e
   hr71bfnmfG6RUomxCGR0EUFJukbNo5Mzr6T0B7NairPIolQSjJzpL4Fs7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="415692827"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="415692827"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 20:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="823388358"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="823388358"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 May 2023 20:43:09 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwajM-0002qa-1Z;
	Wed, 10 May 2023 03:43:08 +0000
Date: Wed, 10 May 2023 11:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [conor:gpio-irq 3/8] drivers/irqchip/irq-mpfs-mux.c:351
 mpfs_irq_mux_init() warn: 'priv->reg' from of_iomap() not released on lines:
 310,316,333,339.
Message-ID: <202305101142.tbjnKXqf-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git gpio-irq
head:   6ef4b8fad90b5bae682bd4b88b807f2a38822fe8
commit: f39a859cf7fec51e695de4544786f2b0fb566e75 [3/8] irqchip: add mpfs gpio interrupt mux
:::::: branch date: 13 hours ago
:::::: commit date: 14 hours ago
config: mips-randconfig-m041-20230509 (https://download.01.org/0day-ci/archive/20230510/202305101142.tbjnKXqf-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305101142.tbjnKXqf-lkp@intel.com/

New smatch warnings:
drivers/irqchip/irq-mpfs-mux.c:351 mpfs_irq_mux_init() warn: 'priv->reg' from of_iomap() not released on lines: 310,316,333,339.

Old smatch warnings:
drivers/irqchip/irq-mpfs-mux.c:301 mpfs_irq_mux_init() warn: possible memory leak of 'priv'

vim +351 drivers/irqchip/irq-mpfs-mux.c

f39a859cf7fec5 Conor Dooley 2023-05-09  288  
f39a859cf7fec5 Conor Dooley 2023-05-09  289  static int __init mpfs_irq_mux_init(struct device_node *node, struct device_node *parent)
f39a859cf7fec5 Conor Dooley 2023-05-09  290  {
f39a859cf7fec5 Conor Dooley 2023-05-09  291  	struct mpfs_irq_mux *priv;
f39a859cf7fec5 Conor Dooley 2023-05-09  292  	struct irq_domain *domain;
f39a859cf7fec5 Conor Dooley 2023-05-09  293  	int i;
f39a859cf7fec5 Conor Dooley 2023-05-09  294  
f39a859cf7fec5 Conor Dooley 2023-05-09  295  	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
f39a859cf7fec5 Conor Dooley 2023-05-09  296  	if (!priv)
f39a859cf7fec5 Conor Dooley 2023-05-09  297  		return -ENOMEM;
f39a859cf7fec5 Conor Dooley 2023-05-09  298  
f39a859cf7fec5 Conor Dooley 2023-05-09  299  	priv->reg = of_iomap(node, 0);
f39a859cf7fec5 Conor Dooley 2023-05-09  300  	if (!priv->reg)
f39a859cf7fec5 Conor Dooley 2023-05-09  301  		return -ENODEV; //TODO: add teardown code
f39a859cf7fec5 Conor Dooley 2023-05-09  302  
f39a859cf7fec5 Conor Dooley 2023-05-09  303  	priv->mux_config = readl(priv->reg);
f39a859cf7fec5 Conor Dooley 2023-05-09  304  
f39a859cf7fec5 Conor Dooley 2023-05-09  305  	for (i = 0; i < MPFS_MUX_NUM_DIRECT_IRQS; i++) {
f39a859cf7fec5 Conor Dooley 2023-05-09  306  		priv->irqchip_data[i].output_hwirq = i;
f39a859cf7fec5 Conor Dooley 2023-05-09  307  
f39a859cf7fec5 Conor Dooley 2023-05-09  308  		priv->irqchip_data[i].irq = irq_of_parse_and_map(node, i);
f39a859cf7fec5 Conor Dooley 2023-05-09  309  		if (priv->irqchip_data[i].irq <= 0)
f39a859cf7fec5 Conor Dooley 2023-05-09  310  			return -1; //TODO: add teardown code
f39a859cf7fec5 Conor Dooley 2023-05-09  311  
f39a859cf7fec5 Conor Dooley 2023-05-09  312  		domain = irq_domain_add_linear(NULL, 1,
f39a859cf7fec5 Conor Dooley 2023-05-09  313  					       &mpfs_irq_mux_direct_domain_ops,
f39a859cf7fec5 Conor Dooley 2023-05-09  314  					       &priv->irqchip_data[i]);
f39a859cf7fec5 Conor Dooley 2023-05-09  315  		if (!domain)
f39a859cf7fec5 Conor Dooley 2023-05-09  316  			return -ENOMEM; //TODO: add teardown code
f39a859cf7fec5 Conor Dooley 2023-05-09  317  
f39a859cf7fec5 Conor Dooley 2023-05-09  318  		priv->irqchip_data[i].domain = domain;
f39a859cf7fec5 Conor Dooley 2023-05-09  319  
f39a859cf7fec5 Conor Dooley 2023-05-09  320  		irq_set_chained_handler_and_data(priv->irqchip_data[i].irq,
f39a859cf7fec5 Conor Dooley 2023-05-09  321  						 mpfs_irq_mux_direct_handler,
f39a859cf7fec5 Conor Dooley 2023-05-09  322  						 &priv->irqchip_data[i]);
f39a859cf7fec5 Conor Dooley 2023-05-09  323  	}
f39a859cf7fec5 Conor Dooley 2023-05-09  324  
f39a859cf7fec5 Conor Dooley 2023-05-09  325  	/*
f39a859cf7fec5 Conor Dooley 2023-05-09  326  	 * The last 3 interrupts must be the non-direct/muxxed ones.
f39a859cf7fec5 Conor Dooley 2023-05-09  327  	 */
f39a859cf7fec5 Conor Dooley 2023-05-09  328  	for (; i < MPFS_MUX_NUM_IRQS; i++) {
f39a859cf7fec5 Conor Dooley 2023-05-09  329  		priv->irqchip_data[i].output_hwirq = i;
f39a859cf7fec5 Conor Dooley 2023-05-09  330  
f39a859cf7fec5 Conor Dooley 2023-05-09  331  		priv->irqchip_data[i].irq = irq_of_parse_and_map(node, i);
f39a859cf7fec5 Conor Dooley 2023-05-09  332  		if (priv->irqchip_data[i].irq <= 0)
f39a859cf7fec5 Conor Dooley 2023-05-09  333  			return -1; //TODO: add teardown code
f39a859cf7fec5 Conor Dooley 2023-05-09  334  
f39a859cf7fec5 Conor Dooley 2023-05-09  335  		domain = irq_domain_add_linear(NULL, MPFS_MAX_IRQS_PER_GPIO,
f39a859cf7fec5 Conor Dooley 2023-05-09  336  					       &mpfs_irq_mux_nondirect_domain_ops,
f39a859cf7fec5 Conor Dooley 2023-05-09  337  					       &priv->irqchip_data[i]);
f39a859cf7fec5 Conor Dooley 2023-05-09  338  		if (!domain)
f39a859cf7fec5 Conor Dooley 2023-05-09  339  			return -ENOMEM; //TODO: add teardown code
f39a859cf7fec5 Conor Dooley 2023-05-09  340  
f39a859cf7fec5 Conor Dooley 2023-05-09  341  		priv->irqchip_data[i].domain = domain;
f39a859cf7fec5 Conor Dooley 2023-05-09  342  		priv->irqchip_data[i].reg_mask = mpfs_irq_mux_masks[i - MPFS_MUX_NUM_DIRECT_IRQS];
f39a859cf7fec5 Conor Dooley 2023-05-09  343  		priv->irqchip_data[i].offset = (i - MPFS_MUX_NUM_DIRECT_IRQS) * MPFS_MAX_IRQS_PER_GPIO;
f39a859cf7fec5 Conor Dooley 2023-05-09  344  
f39a859cf7fec5 Conor Dooley 2023-05-09  345  		irq_set_chained_handler_and_data(priv->irqchip_data[i].irq,
f39a859cf7fec5 Conor Dooley 2023-05-09  346  						 mpfs_irq_mux_nondirect_handler,
f39a859cf7fec5 Conor Dooley 2023-05-09  347  						 &priv->irqchip_data[i]);
f39a859cf7fec5 Conor Dooley 2023-05-09  348  	}
f39a859cf7fec5 Conor Dooley 2023-05-09  349  
f39a859cf7fec5 Conor Dooley 2023-05-09  350  	pr_info("registered with mux config %x\n", priv->mux_config);
f39a859cf7fec5 Conor Dooley 2023-05-09 @351  	return 0;
f39a859cf7fec5 Conor Dooley 2023-05-09  352  }
f39a859cf7fec5 Conor Dooley 2023-05-09  353  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
