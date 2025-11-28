Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB7D2D5A07
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 19:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764357517; cv=none; b=XHNatJeuCNVDdjtKT2JZJPtzkgqtFW2Wqp6OfnXlKyEWf+p6VNdgFxuz6L09AZF1iHpt9vdi5ucovYIamBfavROHSu5pfTbqR4Kw9KJDGUdJGtLnrXyMyFTvlM4L0Rf+7qcJmSBHmHBXTgD01H1BAiVQibr8UjIcD3+2+GPKXyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764357517; c=relaxed/simple;
	bh=knNm6tY8b/QQcjwNRNS0/OK0loRr7IYjYLgR2VWloQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K9H1e9/SfREUztcyKT1ywMr8Gt4oretw/LvMbgC3YgA0K1Rl1ozpMDyv5ARgcTHDhYwkiSvy3uHfAwAzevjXVK4p73p0CC2X9bncUpCq0eKN+5fh0YHbs6ZO69P2b5q3FX5QvOuoG3zhPQmRLid+GPGNM6ENwI+jnqXH7ctyslk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhAcEacy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhAcEacy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764357515; x=1795893515;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=knNm6tY8b/QQcjwNRNS0/OK0loRr7IYjYLgR2VWloQ0=;
  b=KhAcEacySe/oIkH23IwK44NBArwqcohs81ljcx28BEzNejVb1t6rJgMG
   aYPryTI9LAdiVXm+8wp5b210Vd6OPA7drEYoEKsKIEvEYP9J2ZUNK3LzP
   fi8oRYgSvv7YNjLEv2whWGXpbA9wwnJyyfucXJEojyru7x7xz1VUnffZH
   vl6YgwyCohY4jpzyQuD3KBHmZgCSLflEXFOEQnO+0hXUwBaFElgy+XvWo
   YUhNwFtzedXR+qWcY+uaJS7AFwjkNWGxeqjP5Zqqo+MWdZb8k6JvBSXST
   9RDpbK0Sq9TbIdQfNYgpNfeW8g0OxPr6WuAGhQLx9oEchFbxbbrFM4E+n
   g==;
X-CSE-ConnectionGUID: uXReUtiRTvenI/0hXe/2GQ==
X-CSE-MsgGUID: 6qFxMTTbTeOy/sLDITcpvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="77022196"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="77022196"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 11:18:34 -0800
X-CSE-ConnectionGUID: 8MYZ3e/WTC22bsqf3QPnfQ==
X-CSE-MsgGUID: ImseZ7nNSrKWchjeHU5qPQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Nov 2025 11:18:32 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP3zB-000000006ft-2Hdy;
	Fri, 28 Nov 2025 19:18:29 +0000
Date: Sat, 29 Nov 2025 03:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] PCI: dwc: Make Link Up IRQ logic handle already powered
 on PCIe switches
Message-ID: <202511290255.uBLXDIG5-lkp@intel.com>
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
In-Reply-To: <20251127134318.3655052-2-cassel@kernel.org>
References: <20251127134318.3655052-2-cassel@kernel.org>
TO: Niklas Cassel <cassel@kernel.org>
TO: Jingoo Han <jingoohan1@gmail.com>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Niklas Cassel <cassel@kernel.org>
CC: FUKAUMI Naoki <naoki@radxa.com>
CC: linux-pci@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-arm-msm@vger.kernel.org

Hi Niklas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus mani-mhi/mhi-next linus/master v6.18-rc7 next-20251128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Cassel/PCI-dwc-Make-Link-Up-IRQ-logic-handle-already-powered-on-PCIe-switches/20251127-214649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251127134318.3655052-2-cassel%40kernel.org
patch subject: [PATCH] PCI: dwc: Make Link Up IRQ logic handle already powered on PCIe switches
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-r071-20251128 (https://download.01.org/0day-ci/archive/20251129/202511290255.uBLXDIG5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511290255.uBLXDIG5-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pcie-designware-host.c:737 dw_pcie_host_init() warn: missing error code 'ret'

vim +/ret +737 drivers/pci/controller/dwc/pcie-designware-host.c

cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  623  
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  624  int dw_pcie_host_init(struct dw_pcie_rp *pp)
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  625  {
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  626  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  627  	struct device *dev = pci->dev;
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  628  	struct device_node *np = dev->of_node;
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  629  	struct pci_host_bridge *bridge;
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  630  	int ret;
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  631  
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  632  	raw_spin_lock_init(&pp->lock);
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  633  
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  634  	bridge = devm_pci_alloc_host_bridge(dev, 0);
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  635  	if (!bridge)
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  636  		return -ENOMEM;
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  637  
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  638  	pp->bridge = bridge;
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  639  
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  640  	ret = dw_pcie_host_get_resources(pp);
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  641  	if (ret)
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  642  		return ret;
2ce107e064574a drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Helgaas             2025-03-15  643  
aea370b2aec9d3 drivers/pci/controller/dwc/pcie-designware-host.c Yoshihiro Shimoda         2023-12-20  644  	if (pp->ops->init) {
aea370b2aec9d3 drivers/pci/controller/dwc/pcie-designware-host.c Yoshihiro Shimoda         2023-12-20  645  		ret = pp->ops->init(pp);
7e919677bb392c drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Andersson           2021-08-23  646  		if (ret)
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  647  			goto err_free_ecam;
7e919677bb392c drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Andersson           2021-08-23  648  	}
7e919677bb392c drivers/pci/controller/dwc/pcie-designware-host.c Bjorn Andersson           2021-08-23  649  
9e2b5de5604a6f drivers/pci/controller/dwc/pcie-designware-host.c Jisheng Zhang             2019-03-29  650  	if (pci_msi_enabled()) {
aea370b2aec9d3 drivers/pci/controller/dwc/pcie-designware-host.c Yoshihiro Shimoda         2023-12-20  651  		pp->has_msi_ctrl = !(pp->ops->msi_init ||
154fc1f6420840 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring (Arm          2024-11-04  652) 				     of_property_present(np, "msi-parent") ||
154fc1f6420840 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring (Arm          2024-11-04  653) 				     of_property_present(np, "msi-map"));
f78f02638af594 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  654  
cd761378e62c26 drivers/pci/controller/dwc/pcie-designware-host.c Dmitry Baryshkov          2022-07-07  655  		/*
cd761378e62c26 drivers/pci/controller/dwc/pcie-designware-host.c Dmitry Baryshkov          2022-07-07  656  		 * For the has_msi_ctrl case the default assignment is handled
cd761378e62c26 drivers/pci/controller/dwc/pcie-designware-host.c Dmitry Baryshkov          2022-07-07  657  		 * in the dw_pcie_msi_host_init().
cd761378e62c26 drivers/pci/controller/dwc/pcie-designware-host.c Dmitry Baryshkov          2022-07-07  658  		 */
cd761378e62c26 drivers/pci/controller/dwc/pcie-designware-host.c Dmitry Baryshkov          2022-07-07  659  		if (!pp->has_msi_ctrl && !pp->num_vectors) {
7c5925afbc58c6 drivers/pci/dwc/pcie-designware-host.c            Gustavo Pimentel          2018-03-06  660  			pp->num_vectors = MSI_DEF_NUM_VECTORS;
331e9bcead5252 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  661  		} else if (pp->num_vectors > MAX_MSI_IRQS) {
331e9bcead5252 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  662  			dev_err(dev, "Invalid number of vectors\n");
c6481d51dc65f2 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  663  			ret = -EINVAL;
c6481d51dc65f2 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  664  			goto err_deinit_host;
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  665  		}
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  666  
aea370b2aec9d3 drivers/pci/controller/dwc/pcie-designware-host.c Yoshihiro Shimoda         2023-12-20  667  		if (pp->ops->msi_init) {
aea370b2aec9d3 drivers/pci/controller/dwc/pcie-designware-host.c Yoshihiro Shimoda         2023-12-20  668  			ret = pp->ops->msi_init(pp);
f78f02638af594 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  669  			if (ret < 0)
c6481d51dc65f2 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  670  				goto err_deinit_host;
f78f02638af594 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  671  		} else if (pp->has_msi_ctrl) {
226ec087497a6a drivers/pci/controller/dwc/pcie-designware-host.c Dmitry Baryshkov          2022-07-22  672  			ret = dw_pcie_msi_host_init(pp);
226ec087497a6a drivers/pci/controller/dwc/pcie-designware-host.c Dmitry Baryshkov          2022-07-22  673  			if (ret < 0)
c6481d51dc65f2 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  674  				goto err_deinit_host;
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  675  		}
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  676  	}
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  677  
13e9d3900c2024 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  678  	dw_pcie_version_detect(pci);
13e9d3900c2024 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  679  
8bcca26585585a drivers/pci/controller/dwc/pcie-designware-host.c Hou Zhiqiang              2021-04-13  680  	dw_pcie_iatu_detect(pci);
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  681  
f9eb654fb194e7 drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-03-28  682  	if (pci->num_lanes < 1)
f9eb654fb194e7 drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-03-28  683  		pci->num_lanes = dw_pcie_link_get_max_link_width(pci);
f9eb654fb194e7 drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-03-28  684  
09483959e34d25 drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-03-28  685  	ret = of_pci_get_equalization_presets(dev, &pp->presets, pci->num_lanes);
09483959e34d25 drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-03-28  686  	if (ret)
09483959e34d25 drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-03-28  687  		goto err_free_msi;
09483959e34d25 drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-03-28  688  
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  689  	if (pp->ecam_enabled) {
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  690  		ret = dw_pcie_config_ecam_iatu(pp);
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  691  		if (ret) {
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  692  			dev_err(dev, "Failed to configure iATU in ECAM mode\n");
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  693  			goto err_free_msi;
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  694  		}
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  695  	}
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  696  
e1a4ec1a9520bf drivers/pci/controller/dwc/pcie-designware-host.c Frank Li                  2024-04-18  697  	/*
e1a4ec1a9520bf drivers/pci/controller/dwc/pcie-designware-host.c Frank Li                  2024-04-18  698  	 * Allocate the resource for MSG TLP before programming the iATU
e1a4ec1a9520bf drivers/pci/controller/dwc/pcie-designware-host.c Frank Li                  2024-04-18  699  	 * outbound window in dw_pcie_setup_rc(). Since the allocation depends
e1a4ec1a9520bf drivers/pci/controller/dwc/pcie-designware-host.c Frank Li                  2024-04-18  700  	 * on the value of 'region_align', this has to be done after
e1a4ec1a9520bf drivers/pci/controller/dwc/pcie-designware-host.c Frank Li                  2024-04-18  701  	 * dw_pcie_iatu_detect().
e1a4ec1a9520bf drivers/pci/controller/dwc/pcie-designware-host.c Frank Li                  2024-04-18  702  	 *
e1a4ec1a9520bf drivers/pci/controller/dwc/pcie-designware-host.c Frank Li                  2024-04-18  703  	 * Glue drivers need to set 'use_atu_msg' before dw_pcie_host_init() to
e1a4ec1a9520bf drivers/pci/controller/dwc/pcie-designware-host.c Frank Li                  2024-04-18  704  	 * make use of the generic MSG TLP implementation.
e1a4ec1a9520bf drivers/pci/controller/dwc/pcie-designware-host.c Frank Li                  2024-04-18  705  	 */
e1a4ec1a9520bf drivers/pci/controller/dwc/pcie-designware-host.c Frank Li                  2024-04-18  706  	if (pp->use_atu_msg)
e1a4ec1a9520bf drivers/pci/controller/dwc/pcie-designware-host.c Frank Li                  2024-04-18  707  		dw_pcie_host_request_msg_tlp_res(pp);
e1a4ec1a9520bf drivers/pci/controller/dwc/pcie-designware-host.c Frank Li                  2024-04-18  708  
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  709  	ret = dw_pcie_edma_detect(pci);
ce06bf570390fb drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  710  	if (ret)
ce06bf570390fb drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  711  		goto err_free_msi;
59fbab1ae40eb0 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  712  
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  713  	ret = dw_pcie_setup_rc(pp);
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  714  	if (ret)
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  715  		goto err_remove_edma;
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  716  
c5097b9869a136 drivers/pci/controller/dwc/pcie-designware-host.c Johan Hovold              2023-07-06  717  	if (!dw_pcie_link_up(pci)) {
a37beefbde8802 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  718  		ret = dw_pcie_start_link(pci);
886a9c1347558f drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  719  		if (ret)
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  720  			goto err_remove_edma;
da56a1bfbab551 drivers/pci/controller/dwc/pcie-designware-host.c Ajay Agarwal              2023-04-12  721  	}
886a9c1347558f drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  722  
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  723  	/*
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  724  	 * Note: Skip the link up delay only when a Link Up IRQ is present.
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  725  	 * If there is no Link Up IRQ, we should not bypass the delay
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  726  	 * because that would require users to manually rescan for devices.
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  727  	 */
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  728  	if (!pp->use_linkup_irq) {
c5097b9869a136 drivers/pci/controller/dwc/pcie-designware-host.c Johan Hovold              2023-07-06  729  		/* Ignore errors, the link may come up later */
c5097b9869a136 drivers/pci/controller/dwc/pcie-designware-host.c Johan Hovold              2023-07-06  730  		dw_pcie_wait_for_link(pci);
c5097b9869a136 drivers/pci/controller/dwc/pcie-designware-host.c Johan Hovold              2023-07-06  731  
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  732  		/*
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  733  		 * For platforms with Link Up IRQ, initial scan will be done
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  734  		 * on first Link Up IRQ.
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  735  		 */
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  736  		if (dw_pcie_host_initial_scan(pp))
113fa857b74c94 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24 @737  			goto err_stop_link;
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  738  	}
4fbfa17f9a0755 drivers/pci/controller/dwc/pcie-designware-host.c Shradha Todi              2025-02-21  739  
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  740  	return 0;
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  741  
113fa857b74c94 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  742  err_stop_link:
a37beefbde8802 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  743  	dw_pcie_stop_link(pci);
113fa857b74c94 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  744  
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  745  err_remove_edma:
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  746  	dw_pcie_edma_remove(pci);
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  747  
9e2b5de5604a6f drivers/pci/controller/dwc/pcie-designware-host.c Jisheng Zhang             2019-03-29  748  err_free_msi:
f78f02638af594 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  749  	if (pp->has_msi_ctrl)
9e2b5de5604a6f drivers/pci/controller/dwc/pcie-designware-host.c Jisheng Zhang             2019-03-29  750  		dw_pcie_free_msi(pp);
c6481d51dc65f2 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  751  
c6481d51dc65f2 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  752  err_deinit_host:
aea370b2aec9d3 drivers/pci/controller/dwc/pcie-designware-host.c Yoshihiro Shimoda         2023-12-20  753  	if (pp->ops->deinit)
aea370b2aec9d3 drivers/pci/controller/dwc/pcie-designware-host.c Yoshihiro Shimoda         2023-12-20  754  		pp->ops->deinit(pp);
c6481d51dc65f2 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  755  
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  756  err_free_ecam:
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  757  	if (pp->cfg)
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  758  		pci_ecam_free(pp->cfg);
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  759  
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  760  	return ret;
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  761  }
ca98329d3b58ef drivers/pci/controller/dwc/pcie-designware-host.c Vidya Sagar               2019-06-25  762  EXPORT_SYMBOL_GPL(dw_pcie_host_init);
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  763  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
