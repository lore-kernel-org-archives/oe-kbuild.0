Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246AB1FDC
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Jul 2023 08:44:46 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3142970df44so2646247f8f.3
        for <oe-kbuild@lists.linux.dev>; Sat, 08 Jul 2023 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688805884; x=1691397884;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OqthyHHsYfBukv6hgUZNprgD+laPlJ3xZGzRYpWcjUU=;
        b=B1I0JY6C999Ls/bb6Ec3r3g3SmSQ5IDAvbCy4dhGErWuIzq0Tl2b2nFk9g21HlPOi1
         9vOEd6qExV/OVeC3AT0+v70Eu88iWowPb1ohDZpKtP9eDXYtu66FWuzP+aPzUkzcetru
         eORCmLkWsn9uQV4uGiGTZGSHq9o9h5EV+ZT5WX3N9wOgfZbm82pAvNS4SXeGOvw68TKU
         oAYHhGpAdXKdB2CQ8FWoGUuXrc5ZBBE3AlW3GrbZ/B8yow/lKXuJmM9jC1JXwCJnkJeN
         2dg5qoJWIxwUfRsRzURXo03xQxTjhJsE2jAhvVWhsLWhnN2JfqK1+LuiLnr4+6VpNoSa
         jWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688805884; x=1691397884;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OqthyHHsYfBukv6hgUZNprgD+laPlJ3xZGzRYpWcjUU=;
        b=REFocVUk3yCdk4QrCR4NNYNiA+nQAtDxLWOqd48nDZnzEGS2Xpd3THWfUS8Sa4PXpV
         diZNVp4ELUINqfDuaO2gUx/Hi5YpoRE41e7+9U/EYc7kvSVERODKYJwSnLT8I8h0mjhZ
         ncRpkttTD1m8tuFHstQncjFsb/08zO26efotREPRrFwZ/rNQqaZd0Rogx66lG6W+cgHt
         lUWsmR7HWZKO7H6AG/N8gQTu4tCYDxO1p4xVtgW9e1uFYBgRIckN9lQLkm2SKvlmSNhk
         Y60SxC4UwTBvye1Qj3vd/aRHnie5RXyruCcq9BYCXE9ZlcQsiyjrH2bFMF5NQ+JEfk7z
         hdzA==
X-Gm-Message-State: ABy/qLYDde7lGi3OhIwvut3AC+tE5wW9goJzaURR/WBxaxEIr5uqxPVC
	7TykaLvu8/ddpPCWqIcz0DKJ2RdTo6Xwf+x8K2M=
X-Google-Smtp-Source: APBJJlFM1QHIyit2su/fCyHgvX1r0PD7PnzT//1aadnTiH9SjC+ABxHXdD0NSO0LesczEEPBcFF1PQ==
X-Received: by 2002:a05:6000:c9:b0:314:25c6:7f6d with SMTP id q9-20020a05600000c900b0031425c67f6dmr5922319wrx.14.1688805883664;
        Sat, 08 Jul 2023 01:44:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a18-20020adfdd12000000b003143ac73fd0sm6530423wrm.1.2023.07.08.01.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 01:44:41 -0700 (PDT)
Date: Sat, 8 Jul 2023 11:44:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Joel Stanley <joel@jms.id.au>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-xvuart-host-driver 3/3]
 drivers/soc/aspeed/aspeed-host-bmc-dev.c:196
 aspeed_pci_host_bmc_device_probe() warn: possible memory leak of
 'pci_bmc_dev'
Message-ID: <a09d9c97-b07e-475e-b72b-accd968de86b@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-xvuart-host-driver
head:   8384d7b383c2aff772d5503ddddd8a938e48c43f
commit: 8384d7b383c2aff772d5503ddddd8a938e48c43f [3/3] soc/aspeed: Add BMC host driver
config: i386-randconfig-m021-20230703 (https://download.01.org/0day-ci/archive/20230708/202307080925.GDI8sjgI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080925.GDI8sjgI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307080925.GDI8sjgI-lkp@intel.com/

smatch warnings:
drivers/soc/aspeed/aspeed-host-bmc-dev.c:196 aspeed_pci_host_bmc_device_probe() warn: possible memory leak of 'pci_bmc_dev'

vim +/pci_bmc_dev +196 drivers/soc/aspeed/aspeed-host-bmc-dev.c

8384d7b383c2af Joel Stanley 2023-06-15   76  #define BMC_MSI_IDX_BASE	4
8384d7b383c2af Joel Stanley 2023-06-15   77  static int aspeed_pci_host_bmc_device_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
8384d7b383c2af Joel Stanley 2023-06-15   78  {
8384d7b383c2af Joel Stanley 2023-06-15   79  	struct uart_8250_port uart[VUART_MAX_PARMS];
8384d7b383c2af Joel Stanley 2023-06-15   80  	struct aspeed_pci_bmc_dev *pci_bmc_dev;
8384d7b383c2af Joel Stanley 2023-06-15   81  	struct device *dev = &pdev->dev;
8384d7b383c2af Joel Stanley 2023-06-15   82  	u16 config_cmd_val;
8384d7b383c2af Joel Stanley 2023-06-15   83  	int nr_entries;
8384d7b383c2af Joel Stanley 2023-06-15   84  	int rc = 0;
8384d7b383c2af Joel Stanley 2023-06-15   85  	int i = 0;
8384d7b383c2af Joel Stanley 2023-06-15   86  
8384d7b383c2af Joel Stanley 2023-06-15   87  	pr_info("ASPEED BMC PCI ID %04x:%04x, IRQ=%u\n", pdev->vendor, pdev->device, pdev->irq);
8384d7b383c2af Joel Stanley 2023-06-15   88  
8384d7b383c2af Joel Stanley 2023-06-15   89  	pci_bmc_dev = kzalloc(sizeof(*pci_bmc_dev), GFP_KERNEL);
8384d7b383c2af Joel Stanley 2023-06-15   90  	if (!pci_bmc_dev) {
8384d7b383c2af Joel Stanley 2023-06-15   91  		rc = -ENOMEM;
8384d7b383c2af Joel Stanley 2023-06-15   92  		dev_err(&pdev->dev, "kmalloc() returned NULL memory.\n");
8384d7b383c2af Joel Stanley 2023-06-15   93  		goto out_err;
8384d7b383c2af Joel Stanley 2023-06-15   94  	}
8384d7b383c2af Joel Stanley 2023-06-15   95  
8384d7b383c2af Joel Stanley 2023-06-15   96  	rc = pci_enable_device(pdev);
8384d7b383c2af Joel Stanley 2023-06-15   97  	if (rc != 0) {
8384d7b383c2af Joel Stanley 2023-06-15   98  		dev_err(&pdev->dev, "pci_enable_device() returned error %d\n", rc);
8384d7b383c2af Joel Stanley 2023-06-15   99  		goto out_err;

This leaks pci_bmc_dev.

8384d7b383c2af Joel Stanley 2023-06-15  100  	}
8384d7b383c2af Joel Stanley 2023-06-15  101  
8384d7b383c2af Joel Stanley 2023-06-15  102  	/* set PCI host mastering  */
8384d7b383c2af Joel Stanley 2023-06-15  103  	pci_set_master(pdev);
8384d7b383c2af Joel Stanley 2023-06-15  104  
8384d7b383c2af Joel Stanley 2023-06-15  105  	nr_entries = pci_alloc_irq_vectors(pdev, 1, BMC_MULTI_MSI,
8384d7b383c2af Joel Stanley 2023-06-15  106  				PCI_IRQ_MSIX | PCI_IRQ_MSI);
8384d7b383c2af Joel Stanley 2023-06-15  107  	if (nr_entries < 0) {
8384d7b383c2af Joel Stanley 2023-06-15  108  		pr_info("ASPEED BMC using legacy IRQs\n");
8384d7b383c2af Joel Stanley 2023-06-15  109  		pci_bmc_dev->legacy_irq = 1;
8384d7b383c2af Joel Stanley 2023-06-15  110  		pci_read_config_word(pdev, PCI_COMMAND, &config_cmd_val);
8384d7b383c2af Joel Stanley 2023-06-15  111  		config_cmd_val &= ~PCI_COMMAND_INTX_DISABLE;
8384d7b383c2af Joel Stanley 2023-06-15  112  		pci_write_config_word((struct pci_dev *)pdev, PCI_COMMAND, config_cmd_val);
8384d7b383c2af Joel Stanley 2023-06-15  113  
8384d7b383c2af Joel Stanley 2023-06-15  114  	} else {
8384d7b383c2af Joel Stanley 2023-06-15  115  		pr_info("ASPEED BMC using MSI IRQs\n");
8384d7b383c2af Joel Stanley 2023-06-15  116  		pci_bmc_dev->legacy_irq = 0;
8384d7b383c2af Joel Stanley 2023-06-15  117  		pci_read_config_word(pdev, PCI_COMMAND, &config_cmd_val);
8384d7b383c2af Joel Stanley 2023-06-15  118  		config_cmd_val |= PCI_COMMAND_INTX_DISABLE;
8384d7b383c2af Joel Stanley 2023-06-15  119  		pci_write_config_word((struct pci_dev *)pdev, PCI_COMMAND, config_cmd_val);
8384d7b383c2af Joel Stanley 2023-06-15  120  		pdev->irq = pci_irq_vector(pdev, BMC_MSI_IDX_BASE);
8384d7b383c2af Joel Stanley 2023-06-15  121  	}
8384d7b383c2af Joel Stanley 2023-06-15  122  
8384d7b383c2af Joel Stanley 2023-06-15  123  	pr_info("ASPEED BMC PCI ID %04x:%04x, IRQ=%u\n", pdev->vendor, pdev->device, pdev->irq);
8384d7b383c2af Joel Stanley 2023-06-15  124  
8384d7b383c2af Joel Stanley 2023-06-15  125  	//Get MEM bar
8384d7b383c2af Joel Stanley 2023-06-15  126  	pci_bmc_dev->mem_bar_base = pci_resource_start(pdev, 0);
8384d7b383c2af Joel Stanley 2023-06-15  127  	pci_bmc_dev->mem_bar_size = pci_resource_len(pdev, 0);
8384d7b383c2af Joel Stanley 2023-06-15  128  
8384d7b383c2af Joel Stanley 2023-06-15  129  	pr_info("BAR0 I/O Mapped Base Address is: %08lx End %08lx\n", pci_bmc_dev->mem_bar_base, pci_bmc_dev->mem_bar_size);
8384d7b383c2af Joel Stanley 2023-06-15  130  
8384d7b383c2af Joel Stanley 2023-06-15  131  	pci_bmc_dev->mem_bar_reg = pci_ioremap_bar(pdev, 0);
8384d7b383c2af Joel Stanley 2023-06-15  132  	if (!pci_bmc_dev->mem_bar_reg) {
8384d7b383c2af Joel Stanley 2023-06-15  133  		rc = -ENOMEM;
8384d7b383c2af Joel Stanley 2023-06-15  134  		goto out_free0;
8384d7b383c2af Joel Stanley 2023-06-15  135  	}
8384d7b383c2af Joel Stanley 2023-06-15  136  
8384d7b383c2af Joel Stanley 2023-06-15  137      //Get MSG BAR info
8384d7b383c2af Joel Stanley 2023-06-15  138  	pci_bmc_dev->message_bar_base = pci_resource_start(pdev, 1);
8384d7b383c2af Joel Stanley 2023-06-15  139  	pci_bmc_dev->message_bar_size = pci_resource_len(pdev, 1);
8384d7b383c2af Joel Stanley 2023-06-15  140  
8384d7b383c2af Joel Stanley 2023-06-15  141  	pr_info("MSG BAR1 Memory Mapped Base Address is: %08lx End %08lx\n", pci_bmc_dev->message_bar_base, pci_bmc_dev->message_bar_size);
8384d7b383c2af Joel Stanley 2023-06-15  142  
8384d7b383c2af Joel Stanley 2023-06-15  143  	pci_bmc_dev->msg_bar_reg = pci_ioremap_bar(pdev, 1);
8384d7b383c2af Joel Stanley 2023-06-15  144  	if (!pci_bmc_dev->msg_bar_reg) {
8384d7b383c2af Joel Stanley 2023-06-15  145  		rc = -ENOMEM;
8384d7b383c2af Joel Stanley 2023-06-15  146  		goto out_free1;
8384d7b383c2af Joel Stanley 2023-06-15  147  	}
8384d7b383c2af Joel Stanley 2023-06-15  148  
8384d7b383c2af Joel Stanley 2023-06-15  149  	/* ERRTA40: dummy read */
8384d7b383c2af Joel Stanley 2023-06-15  150  	(void)__raw_readl((void __iomem *)pci_bmc_dev->msg_bar_reg);
8384d7b383c2af Joel Stanley 2023-06-15  151  
8384d7b383c2af Joel Stanley 2023-06-15  152  	pci_set_drvdata(pdev, pci_bmc_dev);
8384d7b383c2af Joel Stanley 2023-06-15  153  
8384d7b383c2af Joel Stanley 2023-06-15  154  	/* setup VUART */
8384d7b383c2af Joel Stanley 2023-06-15  155  	memset(uart, 0, sizeof(uart));
8384d7b383c2af Joel Stanley 2023-06-15  156  
8384d7b383c2af Joel Stanley 2023-06-15  157  	for (i = 0; i < VUART_MAX_PARMS; i++) {
8384d7b383c2af Joel Stanley 2023-06-15  158  		pr_info("ASPEED BMC setting up VUART%d\n", i);
8384d7b383c2af Joel Stanley 2023-06-15  159  
8384d7b383c2af Joel Stanley 2023-06-15  160  		vuart_ioport[i] = 0x3F8 - (i * 0x100);
8384d7b383c2af Joel Stanley 2023-06-15  161  		vuart_sirq[i] = 0x10 + 4 - i - BMC_MSI_IDX_BASE;
8384d7b383c2af Joel Stanley 2023-06-15  162  		uart[i].port.flags = UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ;
8384d7b383c2af Joel Stanley 2023-06-15  163  		uart[i].port.uartclk = 115200 * 16;
8384d7b383c2af Joel Stanley 2023-06-15  164  
8384d7b383c2af Joel Stanley 2023-06-15  165  		if (pci_bmc_dev->legacy_irq)
8384d7b383c2af Joel Stanley 2023-06-15  166  			uart[i].port.irq = pdev->irq;
8384d7b383c2af Joel Stanley 2023-06-15  167  		else
8384d7b383c2af Joel Stanley 2023-06-15  168  			uart[i].port.irq = pci_irq_vector(pdev, vuart_sirq[i]);
8384d7b383c2af Joel Stanley 2023-06-15  169  		uart[i].port.dev = &pdev->dev;
8384d7b383c2af Joel Stanley 2023-06-15  170  		uart[i].port.iotype = UPIO_MEM32;
8384d7b383c2af Joel Stanley 2023-06-15  171  		uart[i].port.iobase = 0;
8384d7b383c2af Joel Stanley 2023-06-15  172  		uart[i].port.mapbase = pci_bmc_dev->message_bar_base + (vuart_ioport[i] << 2);
8384d7b383c2af Joel Stanley 2023-06-15  173  		uart[i].port.membase = 0;
8384d7b383c2af Joel Stanley 2023-06-15  174  		uart[i].port.type = PORT_16550A;
8384d7b383c2af Joel Stanley 2023-06-15  175  		uart[i].port.flags |= (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE);
8384d7b383c2af Joel Stanley 2023-06-15  176  		uart[i].port.regshift = 2;
8384d7b383c2af Joel Stanley 2023-06-15  177  
8384d7b383c2af Joel Stanley 2023-06-15  178  		rc = serial8250_register_8250_port(&uart[i]);
8384d7b383c2af Joel Stanley 2023-06-15  179  		if (rc < 0) {
8384d7b383c2af Joel Stanley 2023-06-15  180  			dev_err(dev, "cannot setup VUART@%xh over PCIe, rc=%d\n", vuart_ioport[i], rc);
8384d7b383c2af Joel Stanley 2023-06-15  181  			goto out_unreg;
8384d7b383c2af Joel Stanley 2023-06-15  182  		}
8384d7b383c2af Joel Stanley 2023-06-15  183  	}
8384d7b383c2af Joel Stanley 2023-06-15  184  
8384d7b383c2af Joel Stanley 2023-06-15  185  	return 0;
8384d7b383c2af Joel Stanley 2023-06-15  186  
8384d7b383c2af Joel Stanley 2023-06-15  187  out_unreg:
8384d7b383c2af Joel Stanley 2023-06-15  188  out_free1:
8384d7b383c2af Joel Stanley 2023-06-15  189  	pci_release_region(pdev, 1);
8384d7b383c2af Joel Stanley 2023-06-15  190  out_free0:
8384d7b383c2af Joel Stanley 2023-06-15  191  	pci_release_region(pdev, 0);
8384d7b383c2af Joel Stanley 2023-06-15  192  	kfree(pci_bmc_dev);
8384d7b383c2af Joel Stanley 2023-06-15  193  out_err:
8384d7b383c2af Joel Stanley 2023-06-15  194  	pci_disable_device(pdev);
8384d7b383c2af Joel Stanley 2023-06-15  195  
8384d7b383c2af Joel Stanley 2023-06-15 @196  	return rc;
8384d7b383c2af Joel Stanley 2023-06-15  197  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

