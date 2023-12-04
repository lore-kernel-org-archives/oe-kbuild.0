Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F428A31
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 06:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qcovlUxP"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40b2ad4953cso31618985e9.0
        for <oe-kbuild@lists.linux.dev>; Sun, 03 Dec 2023 22:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701672111; x=1702276911; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ApmB2pUDSXbw3GASD2VuKcH2dVbqTsGey4cd15/8X7k=;
        b=qcovlUxPSHerXStv8/9v9JXUEtqDl0oMuXj/+4Zjj0Ft6niqQX+VRwb01ACQyZ0Hux
         tqiDzH+Dr5Wyt3zWSO6K+u3yL7pPPui/2VA4QUNJijuw5JAWk6JB2+AV6gST2RWwHhUP
         MfPTgwp3WHQgJFNWAHkMzyDErLmJr2C6lgRtgvNtxIZQaZY5KF6A6vlG15iVJjF+CqWp
         G6A31eOWWgeaiWezXLpxTwzZMa8/oLPRxqPBz5IQ2W8wqSuLtVcBpSh/yIdq2MEkWDNX
         9Zq1DF2BR0x5eMZBOHmWtgfps5StgqhWE41Nxs0UOlU2lSYPbfbaSspRhlZh9dTZu6D5
         rLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701672111; x=1702276911;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ApmB2pUDSXbw3GASD2VuKcH2dVbqTsGey4cd15/8X7k=;
        b=cMfPHLlfQVJV6RIfn5zZPm9q30m+RKH771zRyrjRt+kvf6i3uN+EcO1ZonbjE9j5vC
         4g106cyfLAYzLCQokeTer4UEnWHkTERROBkgmU94k8vW9Wg6SGgWgA+qKmYZ8Dpzy0Dd
         fwTlc0xzyDrynj9Z8jz3wAAdjnOprN6uScuKPxiDZrGZEbGQuZ/N87Vonwkeqk6/EJLH
         DdixYHElbOY9vzsTVXpFTzZzFwZLIgZ0EzYKluCziiVA30x94W1odsH571ANrgfSoTkv
         VVQaCeXQYvaBd7Ns5Ys9IZAhOpuBdl5J/BA2qoDskO1qdqWpZODp0E1XiIHU/bxBTKO7
         fFIg==
X-Gm-Message-State: AOJu0YyONRyK+vqROsjw86Yhvox/ZpA5TCvyZdXeT+tzfBDZhyxL9npu
	Qkvujxhct64PFVvE/tMUxRy2Pf+rUG7Fll2DH94=
X-Google-Smtp-Source: AGHT+IGTGf6yHFfA5ku1l5PLwahClR/h62xhyVRdgQu+YIgTbEkkykxXiu9yo5aJbxw4GsFSRqJEsQ==
X-Received: by 2002:a05:600c:45c6:b0:40b:5e56:7b45 with SMTP id s6-20020a05600c45c600b0040b5e567b45mr2791016wmo.142.1701672110620;
        Sun, 03 Dec 2023 22:41:50 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id fa23-20020a05600c519700b003fee6e170f9sm13725019wmb.45.2023.12.03.22.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 22:41:50 -0800 (PST)
Date: Mon, 4 Dec 2023 09:41:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hector Martin <marcan@marcan.st>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: drivers/irqchip/irq-apple-aic.c:941 aic_of_ic_init() error:
 uninitialized symbol 'off'.
Message-ID: <ec3c78c4-6d16-4e42-b9b3-a1ba709dc991@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: dc97fd6fec009957e81026055fc99a03877ff3b8 irqchip/apple-aic: Dynamically compute register offsets
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231203/202312032327.J915WcaL-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312032327.J915WcaL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312032327.J915WcaL-lkp@intel.com/

New smatch warnings:
drivers/irqchip/irq-apple-aic.c:941 aic_of_ic_init() error: uninitialized symbol 'off'.

Old smatch warnings:
drivers/irqchip/irq-apple-aic.c:920 aic_of_ic_init() warn: possible memory leak of 'irqc'
drivers/irqchip/irq-apple-aic.c:998 aic_of_ic_init() warn: 'regs' from of_iomap() not released on lines: 914,920.

vim +/off +941 drivers/irqchip/irq-apple-aic.c

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

not default statement.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

