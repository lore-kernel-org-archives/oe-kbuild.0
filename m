Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC4A37189C
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 07:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778226273; cv=none; b=gIUDNe1zBdUyI/ld2wteP4ANmJm/Se7mYM002iajiuz4Adlf/q4MN4B5xsBZgNrrIkOOEZWWH/ovpF+YuKRGzZxngEsa+0m1MmH4sf6TV+og7qPhnlbTI2WnpwB996pUSXvJ85Ng5kGyZFTUW6jEnkH5P5BDFxI8Lwg43P2MjKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778226273; c=relaxed/simple;
	bh=GBP38pU77D3EK1fr98OK5OgzkQd2yqGwCWuA8muafzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FoASSV2ZVTOwaJUSDi3FPx4r2ZC2Cv4Vbg76dLwcy/r5aqX1Xza9J7HVR1peXJb/SrlOgzO5Ge9b7VQRSx0Sdhg3hyWT1BSOjrpl8ErjfKF2KD12ejpkzpy8s6WUe+KO6Xav3m4mouKYP8sDWfymkHTvd+5KLafPIV1SDk6NhqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIDplLmC; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIDplLmC"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8eb5ad01402so173216685a.2
        for <oe-kbuild@lists.linux.dev>; Fri, 08 May 2026 00:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778226270; x=1778831070; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NCbzFtLhK79n7a7ASsYq9r38KBq2w1GQvvmpskHJAks=;
        b=BIDplLmCwM01yIh4uPQ9BfYELc5WXNNSmmPOk62w4Zk+fAElnIVVs5NEFe9eto7i5h
         NRtPK5DdP/6yHMFtyrcJFnR62XMj8+hV+prm66o+Jj7If3X7cZi0XEYE1tueD9WCpzca
         ipm3MPXyGWMUBmvN+JaFjasW7Rqngp7aqLriXMU1Jd9jgzDnUPA3dhaljTBBDiode6h4
         Y4qjVJkigpFiPcNHoFvC422YN1s8UrG7D2Z4RmRpcqgvSagfdV+xPn+2OTEinExxceDW
         Ib7fUBDZSBRl4IXgAUNxlt2vo/D1GYRON1a4ZN/65HLuEQKzA9kt5aftMiT6TUPzrNXo
         kSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778226270; x=1778831070;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCbzFtLhK79n7a7ASsYq9r38KBq2w1GQvvmpskHJAks=;
        b=lSoExiVWm/HlevFneUXjZktxcMYTKdk0E4ILdt2F/t34RtIkdxy8VgNhKY8OAS9y77
         djO3GWZSXzKtYDwkiH8Z9DwC769jlxyBXKKuDwPduPW+lTI5cV+D/R/xKcflwbjD7xjS
         cRl/zNsGWtFdkAGq62hFde3jpPrWbsjtipm2hAp30eZ6LFKTl6Q90eb07zrgw6RnYTjq
         /2cZmHY5wvT6U8zperRB9V8wccpw1tEYMyfT1N6pxF8o8SCEwbauT+cGQBd1RGD22zDn
         tJa54FpNzNQsw64jq/eORVwmIDQy/iE78AINQJ9nba5DQ5OcdibfrEnY3K9b9gZm4mSF
         /NeQ==
X-Gm-Message-State: AOJu0YzVs8capfe8ot2Gol+HzsdJk6CJ8XlCfI4yXFXA3tOJ45DypJcb
	E6csdEUgJj97WHri5HGOU8BeKO0Lwf7FgvSSsElY0emzIrruQKI0YJ6wzOQvQQMx
X-Gm-Gg: AeBDiet3u0aXjyfp8cVNj5xF4Fbp0l02xzu+aTDM4CYGRpuxucv797JqZuetDDd7j3F
	JStEuVSMdhZ51tfWSdPHdSkOEqyoQwyKB/MFkzi+1dKwQ61mK8K0pWQ4syyenwsKsWtYZNHRFuI
	pJoDwwHMZkU0ejQ7DMca+E8Av7rOPOwBmIEQU9rHsEpNQaueFa4kz2i/ZsN/7bxeFVZXxgmoRc+
	LZUpp+kElIs2bSFO6WNFhVzBX5Kz6vUL1FwLnKJGfjuT2JoEcOpYnVD2amkfzugD/pOgyxjEbhy
	CaVbYrI24X4IL9jhDnaGHUqRLqjIFE5ZnLbv2wJZ10TrniYKsn7Y4PghCsjpdqt6Dj3dDndQlJ3
	GZlV0LhM5EidNgojckfnib6YrWNa47ltXgRz6xxNzpqzz+LX6sH0pFdTboDCP0BOE/JUoQReJDC
	boyGDf4Lpd29lMhKCYr8HR5245vJzw
X-Received: by 2002:a05:620a:280e:b0:8cd:b626:cdf1 with SMTP id af79cd13be357-904d69d9de7mr1740136085a.46.1778226269415;
        Fri, 08 May 2026 00:44:29 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3aed2920sm11188176d6.7.2026.05.08.00.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:44:27 -0700 (PDT)
Date: Fri, 8 May 2026 10:44:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Sean Wang <sean.wang@mediatek.com>,
	Madhur Kumar <madhurkumar004@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Subject: drivers/net/wireless/mediatek/mt76/mt7921/pci.c:323
 mt7921_pci_probe() warn: missing unwind goto?
Message-ID: <202605080828.1bWBCNfb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260508074422.r_bduNwY_j3TqAGltrJmDNbamZt1NBCDke8lH0GT0jg@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ab992f815d6736b5c7a6f5fd7bfe7bc106bb3dc
commit: ee5bb35d2b83fadc6920aa2478326fb50ea653a9 wifi: mt76: mt7921: Replace deprecated PCI function
config: mips-randconfig-r071-20260506 (https://download.01.org/0day-ci/archive/20260508/202605080828.1bWBCNfb-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ee5bb35d2b83 ("wifi: mt76: mt7921: Replace deprecated PCI function")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605080828.1bWBCNfb-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7921/pci.c:323 mt7921_pci_probe() warn: missing unwind goto?

vim +323 drivers/net/wireless/mediatek/mt76/mt7921/pci.c

5c14a5f944b913 Sean Wang          2021-01-28  233  static int mt7921_pci_probe(struct pci_dev *pdev,
5c14a5f944b913 Sean Wang          2021-01-28  234  			    const struct pci_device_id *id)
5c14a5f944b913 Sean Wang          2021-01-28  235  {
5c14a5f944b913 Sean Wang          2021-01-28  236  	static const struct mt76_driver_ops drv_ops = {
5c14a5f944b913 Sean Wang          2021-01-28  237  		/* txwi_size = txd size + txp size */
4cb4da17fe2f3c Lorenzo Bianconi   2022-06-19  238  		.txwi_size = MT_TXD_SIZE + sizeof(struct mt76_connac_hw_txp),
5b0fb852237622 Ben Greear         2022-10-01  239  		.drv_flags = MT_DRV_TXWI_NO_FREE | MT_DRV_HW_MGMT_TXQ |
5b0fb852237622 Ben Greear         2022-10-01  240  			     MT_DRV_AMSDU_OFFLOAD,
5c14a5f944b913 Sean Wang          2021-01-28  241  		.survey_flags = SURVEY_INFO_TIME_TX |
5c14a5f944b913 Sean Wang          2021-01-28  242  				SURVEY_INFO_TIME_RX |
5c14a5f944b913 Sean Wang          2021-01-28  243  				SURVEY_INFO_TIME_BSS_RX,
d089692bc7938a Lorenzo Bianconi   2021-04-20  244  		.token_size = MT7921_TOKEN_SIZE,
576b4484f3a8f4 Sean Wang          2021-10-19  245  		.tx_prepare_skb = mt7921e_tx_prepare_skb,
0a178a6084d6b6 Lorenzo Bianconi   2022-06-19  246  		.tx_complete_skb = mt76_connac_tx_complete_skb,
0af1ad955919a7 Lorenzo Bianconi   2022-07-21  247  		.rx_check = mt7921_rx_check,
0af1ad955919a7 Lorenzo Bianconi   2022-07-21  248  		.rx_skb = mt7921_queue_rx_skb,
ff6551740000ea Lorenzo Bianconi   2023-06-28  249  		.rx_poll_complete = mt792x_rx_poll_complete,
5c14a5f944b913 Sean Wang          2021-01-28  250  		.sta_add = mt7921_mac_sta_add,
17b0f68a72ae1a Felix Fietkau      2024-08-27  251  		.sta_event = mt7921_mac_sta_event,
5c14a5f944b913 Sean Wang          2021-01-28  252  		.sta_remove = mt7921_mac_sta_remove,
311f121c240967 Lorenzo Bianconi   2023-06-28  253  		.update_survey = mt792x_update_channel,
f4fdd7716290a2 Felix Fietkau      2024-08-28  254  		.set_channel = mt7921_set_channel,
5c14a5f944b913 Sean Wang          2021-01-28  255  	};
838cc667973358 Lorenzo Bianconi   2023-06-28  256  	static const struct mt792x_hif_ops mt7921_pcie_ops = {
033ae79b383020 Sean Wang          2021-10-19  257  		.init_reset = mt7921e_init_reset,
576b4484f3a8f4 Sean Wang          2021-10-19  258  		.reset = mt7921e_mac_reset,
dfc7743de1ebb5 Sean Wang          2021-10-19  259  		.mcu_init = mt7921e_mcu_init,
1c0254967d94bf Lorenzo Bianconi   2023-06-28  260  		.drv_own = mt792xe_mcu_drv_pmctrl,
1c0254967d94bf Lorenzo Bianconi   2023-06-28  261  		.fw_own = mt792xe_mcu_fw_pmctrl,
576b4484f3a8f4 Sean Wang          2021-10-19  262  	};
c9072f112fcf7b Lorenzo Bianconi   2023-06-28  263  	static const struct mt792x_irq_map irq_map = {
c9072f112fcf7b Lorenzo Bianconi   2023-06-28  264  		.host_irq_enable = MT_WFDMA0_HOST_INT_ENA,
c9072f112fcf7b Lorenzo Bianconi   2023-06-28  265  		.tx = {
c9072f112fcf7b Lorenzo Bianconi   2023-06-28  266  			.all_complete_mask = MT_INT_TX_DONE_ALL,
c9072f112fcf7b Lorenzo Bianconi   2023-06-28  267  			.mcu_complete_mask = MT_INT_TX_DONE_MCU,
c9072f112fcf7b Lorenzo Bianconi   2023-06-28  268  		},
c9072f112fcf7b Lorenzo Bianconi   2023-06-28  269  		.rx = {
c9072f112fcf7b Lorenzo Bianconi   2023-06-28  270  			.data_complete_mask = MT_INT_RX_DONE_DATA,
c9072f112fcf7b Lorenzo Bianconi   2023-06-28  271  			.wm_complete_mask = MT_INT_RX_DONE_WM,
c9072f112fcf7b Lorenzo Bianconi   2023-06-28  272  			.wm2_complete_mask = MT_INT_RX_DONE_WM2,
c9072f112fcf7b Lorenzo Bianconi   2023-06-28  273  		},
c9072f112fcf7b Lorenzo Bianconi   2023-06-28  274  	};
034ae28b56f13d Sean Wang          2022-11-15  275  	struct ieee80211_ops *ops;
602cc0c9618a81 Sean Wang          2022-01-07  276  	struct mt76_bus_ops *bus_ops;
975e122ddb7cd6 Lorenzo Bianconi   2023-06-28  277  	struct mt792x_dev *dev;
5c14a5f944b913 Sean Wang          2021-01-28  278  	struct mt76_dev *mdev;
ee5bb35d2b83fa Madhur Kumar       2025-12-08  279  	void __iomem *regs;
4a40fcbfe3ab48 Deren Wu           2024-03-06  280  	u16 cmd, chipid;
034ae28b56f13d Sean Wang          2022-11-15  281  	u8 features;
5c14a5f944b913 Sean Wang          2021-01-28  282  	int ret;
5c14a5f944b913 Sean Wang          2021-01-28  283  
5c14a5f944b913 Sean Wang          2021-01-28  284  	ret = pcim_enable_device(pdev);
5c14a5f944b913 Sean Wang          2021-01-28  285  	if (ret)
5c14a5f944b913 Sean Wang          2021-01-28  286  		return ret;
5c14a5f944b913 Sean Wang          2021-01-28  287  
09d4d6da1b65d0 Mario Limonciello  2023-03-29  288  	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
09d4d6da1b65d0 Mario Limonciello  2023-03-29  289  	if (!(cmd & PCI_COMMAND_MEMORY)) {
09d4d6da1b65d0 Mario Limonciello  2023-03-29  290  		cmd |= PCI_COMMAND_MEMORY;
09d4d6da1b65d0 Mario Limonciello  2023-03-29  291  		pci_write_config_word(pdev, PCI_COMMAND, cmd);
09d4d6da1b65d0 Mario Limonciello  2023-03-29  292  	}
5c14a5f944b913 Sean Wang          2021-01-28  293  	pci_set_master(pdev);
5c14a5f944b913 Sean Wang          2021-01-28  294  
eaafabd2850d78 Lorenzo Bianconi   2021-01-28  295  	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
5c14a5f944b913 Sean Wang          2021-01-28  296  	if (ret < 0)
5c14a5f944b913 Sean Wang          2021-01-28  297  		return ret;
5c14a5f944b913 Sean Wang          2021-01-28  298  
a2e759612e5ff3 Christophe JAILLET 2021-08-22  299  	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
5c14a5f944b913 Sean Wang          2021-01-28  300  	if (ret)
5c14a5f944b913 Sean Wang          2021-01-28  301  		goto err_free_pci_vec;
5c14a5f944b913 Sean Wang          2021-01-28  302  
bf3747ae2e25dd Sean Wang          2021-06-20  303  	if (mt7921_disable_aspm)
5c14a5f944b913 Sean Wang          2021-01-28  304  		mt76_pci_disable_aspm(pdev);
5c14a5f944b913 Sean Wang          2021-01-28  305  
e8a264ccd2de0d Lorenzo Bianconi   2023-06-28  306  	ops = mt792x_get_mac80211_ops(&pdev->dev, &mt7921_ops,
e8a264ccd2de0d Lorenzo Bianconi   2023-06-28  307  				      (void *)id->driver_data, &features);
034ae28b56f13d Sean Wang          2022-11-15  308  	if (!ops) {
034ae28b56f13d Sean Wang          2022-11-15  309  		ret = -ENOMEM;
034ae28b56f13d Sean Wang          2022-11-15  310  		goto err_free_pci_vec;
034ae28b56f13d Sean Wang          2022-11-15  311  	}
034ae28b56f13d Sean Wang          2022-11-15  312  
034ae28b56f13d Sean Wang          2022-11-15  313  	mdev = mt76_alloc_device(&pdev->dev, sizeof(*dev), ops, &drv_ops);
5c14a5f944b913 Sean Wang          2021-01-28  314  	if (!mdev) {
5c14a5f944b913 Sean Wang          2021-01-28  315  		ret = -ENOMEM;
5c14a5f944b913 Sean Wang          2021-01-28  316  		goto err_free_pci_vec;
5c14a5f944b913 Sean Wang          2021-01-28  317  	}
5c14a5f944b913 Sean Wang          2021-01-28  318  
b5a62d612b7baf Deren Wu           2022-09-06  319  	pci_set_drvdata(pdev, mdev);
b5a62d612b7baf Deren Wu           2022-09-06  320  
ee5bb35d2b83fa Madhur Kumar       2025-12-08  321  	regs =  pcim_iomap_region(pdev, 0, pci_name(pdev));
ee5bb35d2b83fa Madhur Kumar       2025-12-08  322  	if (IS_ERR(regs))
ee5bb35d2b83fa Madhur Kumar       2025-12-08 @323  		return PTR_ERR(regs);


All the other error paths use a goto to clean up but this one just
returns directly.

Commit 222606f43b58 ("wifi: mt76: mt7921: handle MT7902 irq_map quirk
with mutable copy") adds another error path with no cleanup.  Let me
add Sean to the CC list.

ee5bb35d2b83fa Madhur Kumar       2025-12-08  324  
975e122ddb7cd6 Lorenzo Bianconi   2023-06-28  325  	dev = container_of(mdev, struct mt792x_dev, mt76);
034ae28b56f13d Sean Wang          2022-11-15  326  	dev->fw_features = features;
576b4484f3a8f4 Sean Wang          2021-10-19  327  	dev->hif_ops = &mt7921_pcie_ops;
c9072f112fcf7b Lorenzo Bianconi   2023-06-28  328  	dev->irq_map = &irq_map;
ee5bb35d2b83fa Madhur Kumar       2025-12-08  329  	mt76_mmio_init(&dev->mt76, regs);
ff6551740000ea Lorenzo Bianconi   2023-06-28  330  	tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);
602cc0c9618a81 Sean Wang          2022-01-07  331  
602cc0c9618a81 Sean Wang          2022-01-07  332  	dev->phy.dev = dev;
602cc0c9618a81 Sean Wang          2022-01-07  333  	dev->phy.mt76 = &dev->mt76.phy;
602cc0c9618a81 Sean Wang          2022-01-07  334  	dev->mt76.phy.priv = &dev->phy;
602cc0c9618a81 Sean Wang          2022-01-07  335  	dev->bus_ops = dev->mt76.bus;
602cc0c9618a81 Sean Wang          2022-01-07  336  	bus_ops = devm_kmemdup(dev->mt76.dev, dev->bus_ops, sizeof(*bus_ops),
602cc0c9618a81 Sean Wang          2022-01-07  337  			       GFP_KERNEL);
4e90db5e21eb3b Christophe JAILLET 2022-04-03  338  	if (!bus_ops) {
4e90db5e21eb3b Christophe JAILLET 2022-04-03  339  		ret = -ENOMEM;
4e90db5e21eb3b Christophe JAILLET 2022-04-03  340  		goto err_free_dev;
4e90db5e21eb3b Christophe JAILLET 2022-04-03  341  	}
602cc0c9618a81 Sean Wang          2022-01-07  342  
602cc0c9618a81 Sean Wang          2022-01-07  343  	bus_ops->rr = mt7921_rr;
602cc0c9618a81 Sean Wang          2022-01-07  344  	bus_ops->wr = mt7921_wr;
602cc0c9618a81 Sean Wang          2022-01-07  345  	bus_ops->rmw = mt7921_rmw;
602cc0c9618a81 Sean Wang          2022-01-07  346  	dev->mt76.bus = bus_ops;
602cc0c9618a81 Sean Wang          2022-01-07  347  
d53ab629cff57e Michael Lo         2024-05-23  348  	if (!mt7921_disable_aspm && mt76_pci_aspm_supported(pdev))
d53ab629cff57e Michael Lo         2024-05-23  349  		dev->aspm_supported = true;
d53ab629cff57e Michael Lo         2024-05-23  350  
1c0254967d94bf Lorenzo Bianconi   2023-06-28  351  	ret = mt792xe_mcu_fw_pmctrl(dev);
525c469e5de9bf Quan Zhou          2023-07-05  352  	if (ret)
525c469e5de9bf Quan Zhou          2023-07-05  353  		goto err_free_dev;
525c469e5de9bf Quan Zhou          2023-07-05  354  
1c0254967d94bf Lorenzo Bianconi   2023-06-28  355  	ret = __mt792xe_mcu_drv_pmctrl(dev);
602cc0c9618a81 Sean Wang          2022-01-07  356  	if (ret)
4e90db5e21eb3b Christophe JAILLET 2022-04-03  357  		goto err_free_dev;
602cc0c9618a81 Sean Wang          2022-01-07  358  
4a40fcbfe3ab48 Deren Wu           2024-03-06  359  	chipid = mt7921_l1_rr(dev, MT_HW_CHIPID);
4a40fcbfe3ab48 Deren Wu           2024-03-06  360  	if (chipid == 0x7961 && (mt7921_l1_rr(dev, MT_HW_BOUND) & BIT(7)))
4a40fcbfe3ab48 Deren Wu           2024-03-06  361  		chipid = 0x7920;
4a40fcbfe3ab48 Deren Wu           2024-03-06  362  	mdev->rev = (chipid << 16) |
5c14a5f944b913 Sean Wang          2021-01-28  363  		    (mt7921_l1_rr(dev, MT_HW_REV) & 0xff);
81a88b1e75bdb6 Tzung-Bi Shih      2021-12-10  364  	dev_info(mdev->dev, "ASIC revision: %04x\n", mdev->rev);
5c14a5f944b913 Sean Wang          2021-01-28  365  
ff6551740000ea Lorenzo Bianconi   2023-06-28  366  	ret = mt792x_wfsys_reset(dev);
525c469e5de9bf Quan Zhou          2023-07-05  367  	if (ret)
525c469e5de9bf Quan Zhou          2023-07-05  368  		goto err_free_dev;
525c469e5de9bf Quan Zhou          2023-07-05  369  
c9072f112fcf7b Lorenzo Bianconi   2023-06-28  370  	mt76_wr(dev, irq_map.host_irq_enable, 0);
5c14a5f944b913 Sean Wang          2021-01-28  371  
23c1d2dc9ed5be Sean Wang          2021-02-26  372  	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
5c14a5f944b913 Sean Wang          2021-01-28  373  
ff6551740000ea Lorenzo Bianconi   2023-06-28  374  	ret = devm_request_irq(mdev->dev, pdev->irq, mt792x_irq_handler,
5c14a5f944b913 Sean Wang          2021-01-28  375  			       IRQF_SHARED, KBUILD_MODNAME, dev);
5c14a5f944b913 Sean Wang          2021-01-28  376  	if (ret)
5c14a5f944b913 Sean Wang          2021-01-28  377  		goto err_free_dev;
5c14a5f944b913 Sean Wang          2021-01-28  378  
033ae79b383020 Sean Wang          2021-10-19  379  	ret = mt7921_dma_init(dev);
033ae79b383020 Sean Wang          2021-10-19  380  	if (ret)
033ae79b383020 Sean Wang          2021-10-19  381  		goto err_free_irq;
033ae79b383020 Sean Wang          2021-10-19  382  
5c14a5f944b913 Sean Wang          2021-01-28  383  	ret = mt7921_register_device(dev);
5c14a5f944b913 Sean Wang          2021-01-28  384  	if (ret)
e230f0c44f011f Sean Wang          2021-04-06  385  		goto err_free_irq;
5c14a5f944b913 Sean Wang          2021-01-28  386  
8cd725742eafa9 Michael Lo         2024-02-07  387  	if (of_property_read_bool(dev->mt76.dev->of_node, "wakeup-source"))
8cd725742eafa9 Michael Lo         2024-02-07  388  		device_init_wakeup(dev->mt76.dev, true);
8cd725742eafa9 Michael Lo         2024-02-07  389  
5c14a5f944b913 Sean Wang          2021-01-28  390  	return 0;
5c14a5f944b913 Sean Wang          2021-01-28  391  
e230f0c44f011f Sean Wang          2021-04-06  392  err_free_irq:
e230f0c44f011f Sean Wang          2021-04-06  393  	devm_free_irq(&pdev->dev, pdev->irq, dev);
5c14a5f944b913 Sean Wang          2021-01-28  394  err_free_dev:
5c14a5f944b913 Sean Wang          2021-01-28  395  	mt76_free_device(&dev->mt76);
5c14a5f944b913 Sean Wang          2021-01-28  396  err_free_pci_vec:
5c14a5f944b913 Sean Wang          2021-01-28  397  	pci_free_irq_vectors(pdev);
5c14a5f944b913 Sean Wang          2021-01-28  398  
5c14a5f944b913 Sean Wang          2021-01-28  399  	return ret;
5c14a5f944b913 Sean Wang          2021-01-28  400  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

