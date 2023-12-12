Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC5F59163
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Dec 2023 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lPPDw87X"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a1f5cb80a91so570926766b.3
        for <oe-kbuild@lists.linux.dev>; Tue, 12 Dec 2023 01:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702374882; x=1702979682; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjR8BKwSgpek9GG0wHa5XZwZECW6M2QMMuJp4oAEKcE=;
        b=lPPDw87XZv+BOJphkohTXTAL/oiL5vGB4NR6i4K1t2ucEiY5zeZLb3m1jN+AVYEPJy
         gOc025xK9jMqTrartH77D3Ipu+T7PfhR65FDxZJKP97tk0pPjFwTG4SsmkVNhLdg07Ys
         bnVah8PnaZwM52mxVhLC0q23thH77p6rxZpT6u2jr/iEyc4oJmeMx2anOL4bVaRLxaHp
         8E6WgTOPTWut1iPkfgn+HKPA80Ny4VD9MKwBCZ/2QGYDWjvBeKfjK1gDR9ru2fo2WSb5
         zyKg2vEfDVgtMJNFgNR0x2yyqJxTR5q5dKVpvWAKqLuv+0OhiyJEw0krgvfxeFLfOkSu
         Nsig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702374882; x=1702979682;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjR8BKwSgpek9GG0wHa5XZwZECW6M2QMMuJp4oAEKcE=;
        b=cSDayLfyVag7PkAWP8obX8ENSYO3rKowpcPieLtb3xo/WL+U8+xHw0HZPpb0OEvyHm
         oERU94i6MjWixvs2JhOqivxnB4cOl0iK8SimqL1jF72mnmfDOJECPjzAr44IQW183i5L
         PHrkdfDhTGbLV5C9NM1CaQEY5hOz0zT+2P5u2bQckBjpmKKZsKGstfyM0U3Mv2BX0OcV
         BduYDlrJrWDNTZQ61+1OmLno50smhwEbAdgwrfaIfQx/hXb+R7wFJCBQOwvVrnNxZmKB
         Q6cQeNqWssa2nKaYW0fUOSGqQuT2mwcu9qib7cfwaNxEcVpj8fmjN9cM8prjmm5R12mp
         YkJw==
X-Gm-Message-State: AOJu0YyrVRnEWoGmBr1ZbOn5lN9C1ktuSjpAGQF1kfz1TyN403vTqgH4
	3ky7s1CCHJztmPufcBOxKWJJrRp4C8H5Q4uaswP5nQ==
X-Google-Smtp-Source: AGHT+IGVrUPvYxOqLCfziqXrWtlmHZgVgkiHcyuyjLZ3ekgLNOCxP0p3aUMy133AXGHUctxY5NWBIg==
X-Received: by 2002:a17:906:f0cd:b0:a19:a19b:4210 with SMTP id dk13-20020a170906f0cd00b00a19a19b4210mr1825378ejb.123.1702374882002;
        Tue, 12 Dec 2023 01:54:42 -0800 (PST)
Received: from localhost (h1f2c.n1.ips.mtn.co.ug. [41.210.159.44])
        by smtp.gmail.com with ESMTPSA id hu18-20020a170907a09200b00a1e081369a9sm5953570ejc.23.2023.12.12.01.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 01:54:41 -0800 (PST)
Date: Tue, 12 Dec 2023 12:54:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>
Subject: drivers/pci/controller/pcie-xilinx-dma-pl.c:638
 xilinx_pl_dma_pcie_setup_irq() error: uninitialized symbol 'irq'.
Message-ID: <efd94697-ef3c-4554-82f0-df6f7b74134a@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
commit: 8d786149d78c7784144c7179e25134b6530b714b PCI: xilinx-xdma: Add Xilinx XDMA Root Port driver
config: riscv-randconfig-r071-20231211 (https://download.01.org/0day-ci/archive/20231212/202312120248.5DblxkBp-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231212/202312120248.5DblxkBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312120248.5DblxkBp-lkp@intel.com/

New smatch warnings:
drivers/pci/controller/pcie-xilinx-dma-pl.c:638 xilinx_pl_dma_pcie_setup_irq() error: uninitialized symbol 'irq'.

vim +/irq +638 drivers/pci/controller/pcie-xilinx-dma-pl.c

8d786149d78c77 Thippeswamy Havalige 2023-10-03  596  static int xilinx_pl_dma_pcie_setup_irq(struct pl_dma_pcie *port)
8d786149d78c77 Thippeswamy Havalige 2023-10-03  597  {
8d786149d78c77 Thippeswamy Havalige 2023-10-03  598  	struct device *dev = port->dev;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  599  	struct platform_device *pdev = to_platform_device(dev);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  600  	int i, irq, err;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  601  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  602  	port->irq = platform_get_irq(pdev, 0);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  603  	if (port->irq < 0)
8d786149d78c77 Thippeswamy Havalige 2023-10-03  604  		return port->irq;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  605  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  606  	for (i = 0; i < ARRAY_SIZE(intr_cause); i++) {
8d786149d78c77 Thippeswamy Havalige 2023-10-03  607  		int err;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  608  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  609  		if (!intr_cause[i].str)
8d786149d78c77 Thippeswamy Havalige 2023-10-03  610  			continue;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  611  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  612  		irq = irq_create_mapping(port->pldma_domain, i);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  613  		if (!irq) {
8d786149d78c77 Thippeswamy Havalige 2023-10-03  614  			dev_err(dev, "Failed to map interrupt\n");
8d786149d78c77 Thippeswamy Havalige 2023-10-03  615  			return -ENXIO;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  616  		}
8d786149d78c77 Thippeswamy Havalige 2023-10-03  617  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  618  		err = devm_request_irq(dev, irq,
8d786149d78c77 Thippeswamy Havalige 2023-10-03  619  				       xilinx_pl_dma_pcie_intr_handler,
8d786149d78c77 Thippeswamy Havalige 2023-10-03  620  				       IRQF_SHARED | IRQF_NO_THREAD,
8d786149d78c77 Thippeswamy Havalige 2023-10-03  621  				       intr_cause[i].sym, port);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  622  		if (err) {
8d786149d78c77 Thippeswamy Havalige 2023-10-03  623  			dev_err(dev, "Failed to request IRQ %d\n", irq);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  624  			return err;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  625  		}
8d786149d78c77 Thippeswamy Havalige 2023-10-03  626  	}
8d786149d78c77 Thippeswamy Havalige 2023-10-03  627  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  628  	port->intx_irq = irq_create_mapping(port->pldma_domain,
8d786149d78c77 Thippeswamy Havalige 2023-10-03  629  					    XILINX_PCIE_INTR_INTX);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  630  	if (!port->intx_irq) {
8d786149d78c77 Thippeswamy Havalige 2023-10-03  631  		dev_err(dev, "Failed to map INTx interrupt\n");
8d786149d78c77 Thippeswamy Havalige 2023-10-03  632  		return -ENXIO;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  633  	}
8d786149d78c77 Thippeswamy Havalige 2023-10-03  634  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  635  	err = devm_request_irq(dev, port->intx_irq, xilinx_pl_dma_pcie_intx_flow,
8d786149d78c77 Thippeswamy Havalige 2023-10-03  636  			       IRQF_SHARED | IRQF_NO_THREAD, NULL, port);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  637  	if (err) {
8d786149d78c77 Thippeswamy Havalige 2023-10-03 @638  		dev_err(dev, "Failed to request INTx IRQ %d\n", irq);
                                                                                                                ^^^
s/irq/port->intx_irq/

8d786149d78c77 Thippeswamy Havalige 2023-10-03  639  		return err;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  640  	}
8d786149d78c77 Thippeswamy Havalige 2023-10-03  641  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  642  	err = devm_request_irq(dev, port->irq, xilinx_pl_dma_pcie_event_flow,
8d786149d78c77 Thippeswamy Havalige 2023-10-03  643  			       IRQF_SHARED | IRQF_NO_THREAD, NULL, port);
8d786149d78c77 Thippeswamy Havalige 2023-10-03  644  	if (err) {
8d786149d78c77 Thippeswamy Havalige 2023-10-03  645  		dev_err(dev, "Failed to request event IRQ %d\n", irq);
                                                                                                                 ^^^
s/irq/port->irq/

8d786149d78c77 Thippeswamy Havalige 2023-10-03  646  		return err;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  647  	}
8d786149d78c77 Thippeswamy Havalige 2023-10-03  648  
8d786149d78c77 Thippeswamy Havalige 2023-10-03  649  	return 0;
8d786149d78c77 Thippeswamy Havalige 2023-10-03  650  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

