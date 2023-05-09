Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A651990C
	for <oe-kbuild@lists.linux.dev>; Tue,  9 May 2023 23:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683674817; x=1715210817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T2GsNGm55HFBIYUYd+4gxAX1VhHaolCvs2+bIFlSCg4=;
  b=mMp0OLMmqlSYdjUEWI2TygK5UQhw004DCiYGnzn9pNgT+HoFKh/UYx3Q
   8mHMY6fQ8VcRt8cVMO0NEQL8yFBxH7HQv0l1FV52QTTXlUQeDAWLqmfeZ
   scqdxUZPh2m05ZeJNtCAsFrvagw08LbG0L/Jb37atYT5P/hDNUVeaFa73
   RRWi0Tw2oVMlX1YB4JgzRq0RlLyYCZPQsBXVIIlHkmC5Z4Hd6rjNgFCWL
   Fiu9uC0BEgBPkcbhz93Upv1qLSt0cCtIGvuwqfdrQzYJ9s6QkLQaCnFmK
   oO7TQqpqLZ7OP3YNUCWjHVo+keMYeSrSfmCwEagwQ4icvyxgBmZ8V1Jym
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353146053"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="353146053"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 16:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="945470412"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="945470412"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 May 2023 16:26:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwWjO-0002cI-2m;
	Tue, 09 May 2023 23:26:54 +0000
Date: Wed, 10 May 2023 07:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [conor:gpio-irq 3/8] drivers/irqchip/irq-mpfs-mux.c:301
 mpfs_irq_mux_init() warn: possible memory leak of 'priv'
Message-ID: <202305100737.hMKHF5yZ-lkp@intel.com>
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
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: ia64-randconfig-m031-20230509 (https://download.01.org/0day-ci/archive/20230510/202305100737.hMKHF5yZ-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305100737.hMKHF5yZ-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-mpfs-mux.c:301 mpfs_irq_mux_init() warn: possible memory leak of 'priv'

vim +/priv +301 drivers/irqchip/irq-mpfs-mux.c

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
f39a859cf7fec5 Conor Dooley 2023-05-09 @301  		return -ENODEV; //TODO: add teardown code
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
f39a859cf7fec5 Conor Dooley 2023-05-09  351  	return 0;
f39a859cf7fec5 Conor Dooley 2023-05-09  352  }
f39a859cf7fec5 Conor Dooley 2023-05-09  353  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
