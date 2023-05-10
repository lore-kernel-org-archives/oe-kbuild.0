Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5973D5686
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 07:31:04 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3078aa0b152so2824417f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 00:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683703861; x=1686295861;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWo1sg0somZMNgGlcFLRkmVcIDlSQTMl8pKsiW/eV54=;
        b=ZHXOD0US6k+Uj5xdW55J7eYr0TnA02fPbsmLLNq6sUDLmDq7I+oDY3jEBxynbyxhet
         EqE6r+GAGKu3l4YD7+0jx0/nRqnz8imy4qLYH4MUTN5+a8pO4I7ZS5P3ciEFHZGVyh1g
         8zCsDlU6bI2l9iD9/3WA02Qrj3XLqJwGA07tNY3I8aBvZTPKiGvGzXujQ8HcFwouFuCJ
         G0ymKk/hKsq9yW5F6qFK0jb2/wDNXS3HYVfsT2O+EuRxAPcpAKGYsb8mdPYaHAP735Pb
         d9XtQgUtO8pdyKdf3o+MdbFJwF9Ns5LqHUauge3lOteqbTnx6yDL6sRDdKtvvIDGG+ZO
         STSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683703861; x=1686295861;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xWo1sg0somZMNgGlcFLRkmVcIDlSQTMl8pKsiW/eV54=;
        b=Vh/lmOVsfbki47WqSSzNCuhE3xZ/ghQVzT9PFf1LWgB9RxS4f2CBLN+bfF4aWdZJI+
         Oe+wpg0tpekRzuFSdn6+hmPbAIYsbebsztNa6mMSDGiuumsvxvkhDb4Wh0uC+UUwqGMA
         N7yTo/b2/g6dWGEdGNXNNBydqzqo94sDiBKp516IMCgr7SECukMdsmlgWz7gPLkyze2k
         rimxMAJOxJPUik1mGLGhC7NrO7za6EkmDtRoKKBGvtXAIcK+6JuwCkl47ILRnL3FLfxh
         uZ7I1x56c6GNS79Q5UP3Yj0PrTglL2sqrEp6yxpVu6PaAo5bGFTHh3TvB6LlQHkjHdAE
         cuoA==
X-Gm-Message-State: AC+VfDxTBMiQy+qJHOg6sGhJqS11Hoce+MUHjJgx4jg6G3g8F1mK71cJ
	toDwDWqJKbucJfFfe5mGEtWhJ+nAVV5odNwY748=
X-Google-Smtp-Source: ACHHUZ4Cg8Ic4iWneS+LZyuPv2Ez6MMvNXZ306tGQcor9Klt/uEhOTYj6+LMxUgA4EtUhS4SS9PM6w==
X-Received: by 2002:a5d:6684:0:b0:2dc:c0da:409 with SMTP id l4-20020a5d6684000000b002dcc0da0409mr11593065wru.27.1683703861272;
        Wed, 10 May 2023 00:31:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v23-20020a5d5917000000b0030632833e74sm16575331wrd.11.2023.05.10.00.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 00:30:59 -0700 (PDT)
Date: Wed, 10 May 2023 10:30:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Conor Dooley <conor+lkp@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [conor:gpio-irq 3/8] drivers/irqchip/irq-mpfs-mux.c:351
 mpfs_irq_mux_init() warn: 'priv->reg' from of_iomap() not released on lines:
 310,316,333,339.
Message-ID: <eee3db8f-77ba-4218-af2a-9f7ec44ceec7@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git gpio-irq
head:   6ef4b8fad90b5bae682bd4b88b807f2a38822fe8
commit: f39a859cf7fec51e695de4544786f2b0fb566e75 [3/8] irqchip: add mpfs gpio interrupt mux
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

Of course, these are all marked with TODOs so you already know about
them...  These emails are generated automatically and I just review
them and hit forward.

f39a859cf7fec5 Conor Dooley 2023-05-09  302  
f39a859cf7fec5 Conor Dooley 2023-05-09  303  	priv->mux_config = readl(priv->reg);
f39a859cf7fec5 Conor Dooley 2023-05-09  304  
f39a859cf7fec5 Conor Dooley 2023-05-09  305  	for (i = 0; i < MPFS_MUX_NUM_DIRECT_IRQS; i++) {
f39a859cf7fec5 Conor Dooley 2023-05-09  306  		priv->irqchip_data[i].output_hwirq = i;
f39a859cf7fec5 Conor Dooley 2023-05-09  307  
f39a859cf7fec5 Conor Dooley 2023-05-09  308  		priv->irqchip_data[i].irq = irq_of_parse_and_map(node, i);
f39a859cf7fec5 Conor Dooley 2023-05-09  309  		if (priv->irqchip_data[i].irq <= 0)
f39a859cf7fec5 Conor Dooley 2023-05-09  310  			return -1; //TODO: add teardown code

It's unfortunate that irq_of_parse_and_map() returns zero on error.
It's for historical reasons.  It used to return NO_IRQ.  :(  I can't
imagine that all the callers check correctly so I've created a new
static checker warning for this.  We shall see tomorrow.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

