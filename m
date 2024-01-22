Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25714136A
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jan 2024 01:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705888779; cv=none; b=MbO5vVyqf/C5dpfoiR8Ct4sRFXnCTdzr4uerwm2Benyx7MRBRr5WVUgYAxhygPUaDjVfC7Rved8XMKx4yDFC5F1OOO5phcKzenQvvQS0/qwtmkfJE+hesy0usMhSqltYlXWY+XGMindIaciN5Tz9kKpvFw8Typ+uWol/CNOwgUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705888779; c=relaxed/simple;
	bh=Z99VIoaCToQs9Ejh/5Bj7G5Uk9LnARWA1skhjmfN3kk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZmYAiU7iKd9jVxFgHXvJtLk5frQ0ZfuMaXkinVSFd8WotQhPkSc4srL7ffj3McYgcafqpSHZaXKVWxLw7nq7GDKROQn0enpACMj1YErHxat9zX3x8Y6US72WCKNwrblitGARkC7BXN55PkeFFOano2+uGwZssIoMqfeT5wd0W7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVbd2UYR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVbd2UYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705888776; x=1737424776;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Z99VIoaCToQs9Ejh/5Bj7G5Uk9LnARWA1skhjmfN3kk=;
  b=HVbd2UYRpSx892k+AUrZD4pkwfF2kQwTQBM+gYv0ku6Nraunypn2bO4b
   3Vo29h3H53a+oCbzPIP4fXXTuCY2qUklaLPkFTdpnqyvdUD8QWdEzRKb5
   cbUrGqEf85Xs+wsDRhumtSXPq4V4CwqlUhKHP9p61c7/9RKo/lrjgrPZB
   eE/5W1VoLnZrb/3pAAFXnqMHJ55MiOiyW1eXrHChIuD3Fe/zvSulUWiC/
   PWrosmWVsa208fAKRBQYgRN4KNGjlxjBV1pD4HH9AlY/arhZj1Eipec+P
   EeLxf6VRMAIqc3Ax1bmRn5cM78QP6BFmGDz3hTHzKvy+iBjAAG/o/xO2C
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="8466377"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8466377"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 17:59:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="1116726870"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1116726870"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Jan 2024 17:59:33 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRjb1-0006KC-0Q;
	Mon, 22 Jan 2024 01:59:31 +0000
Date: Mon, 22 Jan 2024 09:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pci/controller/dwc/pci-dra7xx.c:843:7-32: WARNING: Threaded
 IRQ with no primary handler requested without IRQF_ONESHOT (unless it is
 nested IRQ)
Message-ID: <202401220944.KCffA3OK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: "Krzysztof Wilczyński" <kwilczynski@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6613476e225e090cc9aad49be7fa504e290dd33d
commit: da87d35a6e51480703d6f055e7a1b52c85731d7e PCI: dra7xx: Use threaded IRQ handler for "dra7xx-pcie-main" IRQ
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-r062-20240117 (https://download.01.org/0day-ci/archive/20240122/202401220944.KCffA3OK-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401220944.KCffA3OK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pci/controller/dwc/pci-dra7xx.c:843:7-32: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +843 drivers/pci/controller/dwc/pci-dra7xx.c

c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  683  
e259c2926c016d drivers/pci/controller/dwc/pci-dra7xx.c Tony Lindgren          2021-03-10  684  static int dra7xx_pcie_probe(struct platform_device *pdev)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  685  {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  686  	u32 reg;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  687  	int ret;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  688  	int irq;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  689  	int i;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  690  	int phy_count;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  691  	struct phy **phy;
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  692  	struct device_link **link;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  693  	void __iomem *base;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  694  	struct dw_pcie *pci;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  695  	struct dra7xx_pcie *dra7xx;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  696  	struct device *dev = &pdev->dev;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  697  	struct device_node *np = dev->of_node;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  698  	char name[10];
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  699  	struct gpio_desc *reset;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  700  	const struct dra7xx_pcie_of_data *data;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  701  	enum dw_pcie_device_mode mode;
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  702  	u32 b1co_mode_sel_mask;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  703  
dc078f15715a8e drivers/pci/controller/dwc/pci-dra7xx.c Fan Fei                2021-12-22  704  	data = of_device_get_match_data(dev);
dc078f15715a8e drivers/pci/controller/dwc/pci-dra7xx.c Fan Fei                2021-12-22  705  	if (!data)
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  706  		return -EINVAL;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  707  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  708  	mode = (enum dw_pcie_device_mode)data->mode;
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  709  	b1co_mode_sel_mask = data->b1co_mode_sel_mask;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  710  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  711  	dra7xx = devm_kzalloc(dev, sizeof(*dra7xx), GFP_KERNEL);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  712  	if (!dra7xx)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  713  		return -ENOMEM;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  714  
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  715  	pci = devm_kzalloc(dev, sizeof(*pci), GFP_KERNEL);
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  716  	if (!pci)
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  717  		return -ENOMEM;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  718  
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  719  	pci->dev = dev;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  720  	pci->ops = &dw_pcie_ops;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  721  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  722  	irq = platform_get_irq(pdev, 0);
caecb05c800081 drivers/pci/controller/dwc/pci-dra7xx.c Krzysztof Wilczyński   2020-08-02  723  	if (irq < 0)
a0d21ba120d2c7 drivers/pci/dwc/pci-dra7xx.c            Gustavo A. R. Silva    2017-08-09  724  		return irq;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  725  
c8a119779f5609 drivers/pci/controller/dwc/pci-dra7xx.c Wei Yongjun            2020-04-29  726  	base = devm_platform_ioremap_resource_byname(pdev, "ti_conf");
c8a119779f5609 drivers/pci/controller/dwc/pci-dra7xx.c Wei Yongjun            2020-04-29  727  	if (IS_ERR(base))
c8a119779f5609 drivers/pci/controller/dwc/pci-dra7xx.c Wei Yongjun            2020-04-29  728  		return PTR_ERR(base);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  729  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  730  	phy_count = of_property_count_strings(np, "phy-names");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  731  	if (phy_count < 0) {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  732  		dev_err(dev, "unable to find the strings\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  733  		return phy_count;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  734  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  735  
a86854d0c599b3 drivers/pci/dwc/pci-dra7xx.c            Kees Cook              2018-06-12  736  	phy = devm_kcalloc(dev, phy_count, sizeof(*phy), GFP_KERNEL);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  737  	if (!phy)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  738  		return -ENOMEM;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  739  
a86854d0c599b3 drivers/pci/dwc/pci-dra7xx.c            Kees Cook              2018-06-12  740  	link = devm_kcalloc(dev, phy_count, sizeof(*link), GFP_KERNEL);
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  741  	if (!link)
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  742  		return -ENOMEM;
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  743  
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  744  	dra7xx->clk = devm_clk_get_optional(dev, NULL);
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  745  	if (IS_ERR(dra7xx->clk))
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  746  		return dev_err_probe(dev, PTR_ERR(dra7xx->clk),
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  747  				     "clock request failed");
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  748  
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  749  	ret = clk_prepare_enable(dra7xx->clk);
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  750  	if (ret)
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  751  		return ret;
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  752  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  753  	for (i = 0; i < phy_count; i++) {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  754  		snprintf(name, sizeof(name), "pcie-phy%d", i);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  755  		phy[i] = devm_phy_get(dev, name);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  756  		if (IS_ERR(phy[i]))
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  757  			return PTR_ERR(phy[i]);
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  758  
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  759  		link[i] = device_link_add(dev, &phy[i]->dev, DL_FLAG_STATELESS);
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  760  		if (!link[i]) {
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  761  			ret = -EINVAL;
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  762  			goto err_link;
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  763  		}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  764  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  765  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  766  	dra7xx->base = base;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  767  	dra7xx->phy = phy;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  768  	dra7xx->pci = pci;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  769  	dra7xx->phy_count = phy_count;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  770  
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  771  	if (phy_count == 2) {
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  772  		ret = dra7xx_pcie_configure_two_lane(dev, b1co_mode_sel_mask);
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  773  		if (ret < 0)
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  774  			dra7xx->phy_count = 1; /* Fallback to x1 lane mode */
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  775  	}
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  776  
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  777  	ret = dra7xx_pcie_enable_phy(dra7xx);
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  778  	if (ret) {
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  779  		dev_err(dev, "failed to enable phy\n");
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  780  		return ret;
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  781  	}
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  782  
9bcf0a6fdc5062 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  783  	platform_set_drvdata(pdev, dra7xx);
9bcf0a6fdc5062 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  784  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  785  	pm_runtime_enable(dev);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  786  	ret = pm_runtime_get_sync(dev);
d3f4caa355c1c9 drivers/pci/host/pci-dra7xx.c           Fabio Estevam          2015-08-20  787  	if (ret < 0) {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  788  		dev_err(dev, "pm_runtime_get_sync failed\n");
0e2bdb0e7abf4b drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2015-07-31  789  		goto err_get_sync;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  790  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  791  
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  792  	reset = devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  793  	if (IS_ERR(reset)) {
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  794  		ret = PTR_ERR(reset);
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  795  		dev_err(&pdev->dev, "gpio request failed, ret %d\n", ret);
78bdcad05ea17f drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2015-07-28  796  		goto err_gpio;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  797  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  798  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  799  	reg = dra7xx_pcie_readl(dra7xx, PCIECTRL_DRA7XX_CONF_DEVICE_CMD);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  800  	reg &= ~LTSSM_EN;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  801  	dra7xx_pcie_writel(dra7xx, PCIECTRL_DRA7XX_CONF_DEVICE_CMD, reg);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  802  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  803  	switch (mode) {
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  804  	case DW_PCIE_RC_TYPE:
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  805  		if (!IS_ENABLED(CONFIG_PCI_DRA7XX_HOST)) {
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  806  			ret = -ENODEV;
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  807  			goto err_gpio;
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  808  		}
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  809  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  810  		dra7xx_pcie_writel(dra7xx, PCIECTRL_TI_CONF_DEVICE_TYPE,
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  811  				   DEVICE_TYPE_RC);
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  812  
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  813  		ret = dra7xx_pcie_unaligned_memaccess(dev);
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  814  		if (ret)
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  815  			dev_err(dev, "WA for Errata i870 not applied\n");
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  816  
23926c8dbd6fdc drivers/pci/host/pci-dra7xx.c           Jingoo Han             2014-11-06  817  		ret = dra7xx_add_pcie_port(dra7xx, pdev);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  818  		if (ret < 0)
78bdcad05ea17f drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2015-07-28  819  			goto err_gpio;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  820  		break;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  821  	case DW_PCIE_EP_TYPE:
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  822  		if (!IS_ENABLED(CONFIG_PCI_DRA7XX_EP)) {
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  823  			ret = -ENODEV;
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  824  			goto err_gpio;
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  825  		}
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  826  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  827  		dra7xx_pcie_writel(dra7xx, PCIECTRL_TI_CONF_DEVICE_TYPE,
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  828  				   DEVICE_TYPE_EP);
f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  829  
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  830  		ret = dra7xx_pcie_unaligned_memaccess(dev);
f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  831  		if (ret)
f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  832  			goto err_gpio;
f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  833  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  834  		ret = dra7xx_add_pcie_ep(dra7xx, pdev);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  835  		if (ret < 0)
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  836  			goto err_gpio;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  837  		break;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  838  	default:
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  839  		dev_err(dev, "INVALID device type %d\n", mode);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  840  	}
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  841  	dra7xx->mode = mode;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  842  
da87d35a6e5148 drivers/pci/controller/dwc/pci-dra7xx.c Manivannan Sadhasivam  2023-01-24 @843  	ret = devm_request_threaded_irq(dev, irq, NULL, dra7xx_pcie_irq_handler,
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  844  			       IRQF_SHARED, "dra7xx-pcie-main", dra7xx);
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  845  	if (ret) {
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  846  		dev_err(dev, "failed to request irq\n");
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  847  		goto err_gpio;
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  848  	}
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  849  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  850  	return 0;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  851  
78bdcad05ea17f drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2015-07-28  852  err_gpio:
0e2bdb0e7abf4b drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2015-07-31  853  err_get_sync:
c2615d620a852a drivers/pci/controller/dwc/pci-dra7xx.c Dinghao Liu            2020-05-20  854  	pm_runtime_put(dev);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  855  	pm_runtime_disable(dev);
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  856  	dra7xx_pcie_disable_phy(dra7xx);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  857  
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  858  err_link:
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  859  	while (--i >= 0)
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  860  		device_link_del(link[i]);
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  861  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  862  	return ret;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  863  }
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  864  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
