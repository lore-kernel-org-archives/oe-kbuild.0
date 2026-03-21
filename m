Received: from out198-15.us.a.mail.aliyun.com (out198-15.us.a.mail.aliyun.com [47.90.198.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7362848AA;
	Sat, 21 Mar 2026 09:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774086697; cv=none; b=MwD4F8FO9a+u6PvEVM4QzteWsJ5ceAwLp5AP0aoMJZK7vZrCZHrZmIMUuIkyZoIIcB3lv+LlwQo/7cBjOqLpY6rOVxD1IcoXerq8+M2HgiZumvr/pp+bgr2JS+UF8VgxOm2SGr6v9JwGNGjqoMYcIA3bpe6qvkyHpLQZQLawomg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774086697; c=relaxed/simple;
	bh=Tmfle8pRFnLqoyAyJM+ESvjcfqIUKC0LIpO+7iDOW9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dpyq9r6KkBGCyDEz66NANiMyX9BRK39LBISK9TVHmFvyQFLsQszQ8ag6LuIXO4h6uOqdnVrW9QrHN0i4gZaGrutqU/V6k+V59oNldfM185V/4Ix94eI+nR75WeVfU+OwCFXNjV1cLpLj7Ss+sBmceYHSor3OKEMl5rQqRMt3Ugw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bosc.ac.cn; spf=pass smtp.mailfrom=bosc.ac.cn; dkim=pass (2048-bit key) header.d=bosc.ac.cn header.i=@bosc.ac.cn header.b=hhtT7sAv; arc=none smtp.client-ip=47.90.198.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bosc.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bosc.ac.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bosc.ac.cn header.i=@bosc.ac.cn header.b="hhtT7sAv"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bosc.ac.cn; s=default;
	t=1774086677; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=fnPsaspH0ZUmLsQ1mQyRSHSL+ZJdSRHCyucz6bFwN5k=;
	b=hhtT7sAvBKCr6e6sMjky8k1+2XPy8n2qff1T+WL8JHNLIqP/4xP6D4xrq7NlTeNfjPyrikeIEFhA7OkTlOivqZalkGG3F8xvgAt3bV1p2VCXinmtLE4K/WEE4eoZN1wePpFkF2bzYRlmw9YDfzoSWUyRsou81uJPJ/+LbdTM5lOR/U9kF+OJG2MrbDAZ2biF8oxriVPkBAiHPRqPMRzj3TfMzq1MotfKIvbltkJm/fEuZjiW0XzjcfXVebWmFxKeuYZCVon99ZRc+2iHGLJALTCH7wArt3Xwuxovn7CNFmX7CsZF0pCw52J+OH4b9noMzP7BxMwcc4FlSqDCId216g==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.06893431|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0770959-0.00923744-0.913667;FP=10400299089022146208|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037028158;MF=guoyaxing@bosc.ac.cn;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.gx6d6N7_1774086675;
Received: from 192.168.0.11(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.gx6d6N7_1774086675 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sat, 21 Mar 2026 17:51:16 +0800
Message-ID: <2da23703-7693-47f8-a561-743428b9bb22@bosc.ac.cn>
Date: Sat, 21 Mar 2026 17:51:15 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/uio/uio_pci_generic_sva.c:140 probe() warn: passing devm_
 allocated variable to kfree. 'udev'
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <202603210811.1eXTfndx-lkp@intel.com>
From: yaxing guo <guoyaxing@bosc.ac.cn>
In-Reply-To: <202603210811.1eXTfndx-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/3/21 16:24, Dan Carpenter 写道:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   42bddab0563fe67882b2722620a66dd98c8dbf33
> commit: 3397c3cd859a2c51962ad032dcf97961d42f9db2 uio: Add SVA support for PCI devices via uio_pci_generic_sva.c
> config: x86_64-randconfig-161-20260321 (https://download.01.org/0day-ci/archive/20260321/202603210811.1eXTfndx-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> smatch: v0.5.0-9004-gb810ac53
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202603210811.1eXTfndx-lkp@intel.com/
> 
> New smatch warnings:
> drivers/uio/uio_pci_generic_sva.c:140 probe() warn: passing devm_ allocated variable to kfree. 'udev'
> 
> vim +/udev +140 drivers/uio/uio_pci_generic_sva.c
> 
> 3397c3cd859a2c Yaxing Guo 2025-09-26   62  static int probe(struct pci_dev *pdev, const struct pci_device_id *id)
> 3397c3cd859a2c Yaxing Guo 2025-09-26   63  {
> 3397c3cd859a2c Yaxing Guo 2025-09-26   64  	struct uio_pci_sva_dev *udev;
> 3397c3cd859a2c Yaxing Guo 2025-09-26   65  	int ret, i, irq = 0;
> 3397c3cd859a2c Yaxing Guo 2025-09-26   66
> 3397c3cd859a2c Yaxing Guo 2025-09-26   67  	ret = pci_enable_device(pdev);
> 3397c3cd859a2c Yaxing Guo 2025-09-26   68  	if (ret) {
> 3397c3cd859a2c Yaxing Guo 2025-09-26   69  		dev_err(&pdev->dev, "pci_enable_device failed: %d\n", ret);
> 3397c3cd859a2c Yaxing Guo 2025-09-26   70  		return ret;
> 3397c3cd859a2c Yaxing Guo 2025-09-26   71  	}
> 3397c3cd859a2c Yaxing Guo 2025-09-26   72
> 3397c3cd859a2c Yaxing Guo 2025-09-26   73  	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> 3397c3cd859a2c Yaxing Guo 2025-09-26   74  	if (ret)
> 3397c3cd859a2c Yaxing Guo 2025-09-26   75  		goto out_disable;
> 3397c3cd859a2c Yaxing Guo 2025-09-26   76
> 3397c3cd859a2c Yaxing Guo 2025-09-26   77  	pci_set_master(pdev);
> 3397c3cd859a2c Yaxing Guo 2025-09-26   78
> 3397c3cd859a2c Yaxing Guo 2025-09-26   79  	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSIX | PCI_IRQ_MSI);
> 3397c3cd859a2c Yaxing Guo 2025-09-26   80  	if (ret > 0) {
> 3397c3cd859a2c Yaxing Guo 2025-09-26   81  		irq = pci_irq_vector(pdev, 0);
> 3397c3cd859a2c Yaxing Guo 2025-09-26   82  		if (irq < 0) {
> 3397c3cd859a2c Yaxing Guo 2025-09-26   83  			dev_err(&pdev->dev, "Failed to get MSI vector\n");
> 3397c3cd859a2c Yaxing Guo 2025-09-26   84  			ret = irq;
> 3397c3cd859a2c Yaxing Guo 2025-09-26   85  			goto out_disable;
> 3397c3cd859a2c Yaxing Guo 2025-09-26   86  		}
> 3397c3cd859a2c Yaxing Guo 2025-09-26   87  	} else
> 3397c3cd859a2c Yaxing Guo 2025-09-26   88  		dev_warn(&pdev->dev,
> 3397c3cd859a2c Yaxing Guo 2025-09-26   89  			 "No IRQ vectors available (%d), using polling\n", ret);
> 3397c3cd859a2c Yaxing Guo 2025-09-26   90
> 3397c3cd859a2c Yaxing Guo 2025-09-26   91  	udev = devm_kzalloc(&pdev->dev, sizeof(struct uio_pci_sva_dev),
> 3397c3cd859a2c Yaxing Guo 2025-09-26   92  			    GFP_KERNEL);
> 
> udev is devm_ memory.
> 
> 3397c3cd859a2c Yaxing Guo 2025-09-26   93  	if (!udev) {
> 3397c3cd859a2c Yaxing Guo 2025-09-26   94  		ret =  -ENOMEM;
> 3397c3cd859a2c Yaxing Guo 2025-09-26   95  		goto out_disable;
> 3397c3cd859a2c Yaxing Guo 2025-09-26   96  	}
> 3397c3cd859a2c Yaxing Guo 2025-09-26   97
> 
> [ snip ]
> 
> 3397c3cd859a2c Yaxing Guo 2025-09-26  129  	ret = devm_uio_register_device(&pdev->dev, &udev->info);
> 3397c3cd859a2c Yaxing Guo 2025-09-26  130  	if (ret) {
> 3397c3cd859a2c Yaxing Guo 2025-09-26  131  		dev_err(&pdev->dev, "Failed to register uio device\n");
> 3397c3cd859a2c Yaxing Guo 2025-09-26  132  		goto out_free;
> 3397c3cd859a2c Yaxing Guo 2025-09-26  133  	}
> 3397c3cd859a2c Yaxing Guo 2025-09-26  134
> 3397c3cd859a2c Yaxing Guo 2025-09-26  135  	pci_set_drvdata(pdev, udev);
> 3397c3cd859a2c Yaxing Guo 2025-09-26  136
> 3397c3cd859a2c Yaxing Guo 2025-09-26  137  	return 0;
> 3397c3cd859a2c Yaxing Guo 2025-09-26  138
> 3397c3cd859a2c Yaxing Guo 2025-09-26  139  out_free:
> 3397c3cd859a2c Yaxing Guo 2025-09-26 @140  	kfree(udev);
> 
> So this is a double free.
> 
> 3397c3cd859a2c Yaxing Guo 2025-09-26  141  out_disable:
> 3397c3cd859a2c Yaxing Guo 2025-09-26  142  	pci_disable_device(pdev);
> 3397c3cd859a2c Yaxing Guo 2025-09-26  143
> 3397c3cd859a2c Yaxing Guo 2025-09-26  144  	return ret;
> 3397c3cd859a2c Yaxing Guo 2025-09-26  145  }
> 

Hi Dan,
The double-free issue has been addressed by Shuangshuo Li, who has 
already submitted a fix patch:

https://lore.kernel.org/lkml/20260226153250.18079-1-lgs201920130244@gmail.com/

Best regards,
Yaxing Guo
