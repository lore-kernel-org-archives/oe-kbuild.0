Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63FF2E7165
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 02:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789352091; cv=none; b=Qj1vUo/7+Zp2wX3ZP28ykcrL6La12PcOCf0cTsz031SlkpjPKFJL1p7w0uNC4h1iAYYW1Xr9hGJrRVgYjJnosoqkRQLE7mYbF0zEG51g/aZHVcgq2ucAKg2dzjGphdUIHB+vD8kUTrnhN4kbPAuJKLQIYf9vYnzsV44PRCR2E9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789352091; c=relaxed/simple;
	bh=zRShUh3NIzRNGfqzKuY9gGgHeMm5hf14ujHdFDtaUqk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bb27w0UtgyhSYpglKN29U4uUPACa7LDnYwGpltNLdI5T+4oTHPDL4y7Uj64wlLKDf/egUq06ydlgve96Kz5AYrj/+G3is1/Rst9vy0RWZSkkum0tpPC+w+wbRNh/1xzhskYYmZ6GsDcOeAdLW+r7BdtnC2QNpwNT9hDDp6rkZQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSRq+xgJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSRq+xgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789352089; x=1820888089;
  h=date:from:to:cc:subject:message-id;
  bh=zRShUh3NIzRNGfqzKuY9gGgHeMm5hf14ujHdFDtaUqk=;
  b=dSRq+xgJbZyVzGG3fdKPm/GMNZmW8jHKfBc0fxYbI0vi7628h7BjIbjX
   uJKGB14GnBtfWOW62ywEwxcAxRJWvPhh/ZpEJ9flD9UqkfwL3YMv/RcSm
   eLjzs7x/FFAkSOnBW0zCNdNh21ezfhAQAsiNfY9fR4r4PUcr2GyiaNHH0
   pXCTgc6qn2CuWNb1emhGX4KGtey/kX+xa9BW0D5I1HsV2RRI6/mGBGPed
   bfEP+98J4bKTCfIiSQoeLdBBaf1CLRLzxyG61TUJ8NSVqYL0IFLg142Vx
   Y2vGvKKb6mi9RBN+KIZqxwALLY4vij2ZKJ1Q/nLhxEmzyyLoglDNAchx3
   w==;
X-CSE-ConnectionGUID: x3rP5O8uS8SagXlXxpo1GA==
X-CSE-MsgGUID: jAj3GITgSwGPsPUgAl+9vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89915379"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89915379"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 19:14:48 -0700
X-CSE-ConnectionGUID: OcTSWJTIQ8Kza7oncLHbMQ==
X-CSE-MsgGUID: v8ELBEo6T4Gp1HEdC/odtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="270715384"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 13 Sep 2026 19:14:47 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5wDV-000000001pL-0pTv;
	Mon, 14 Sep 2026 02:14:45 +0000
Date: Mon, 14 Sep 2026 04:14:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pci:controller/misc 1/3]
 drivers/pci/controller/cadence/pcie-cadence-plat.c:103 cdns_plat_pcie_probe()
 warn: missing unwind goto?
Message-ID: <202609140401.1Bl9Bl4m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-pci@vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Hi Vladimir,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/misc
head:   9a9d18547ddc97a73d5d90cff4d5aef90bd8c15d
commit: da0cec0d8f08bf419aa76bce49a69c10c31ac4a9 [1/3] PCI: cadence: Preserve all error codes in cdns_plat_pcie_probe()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20260913 (https://download.01.org/0day-ci/archive/20260914/202609140401.1Bl9Bl4m-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609140401.1Bl9Bl4m-lkp@intel.com/

smatch warnings:
drivers/pci/controller/cadence/pcie-cadence-plat.c:103 cdns_plat_pcie_probe() warn: missing unwind goto?

vim +103 drivers/pci/controller/cadence/pcie-cadence-plat.c

d07701a17aec3e drivers/pci/controller/cadence/pcie-cadence-plat.c Kishon Vijay Abraham I 2020-07-22   35  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   36  static int cdns_plat_pcie_probe(struct platform_device *pdev)
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   37  {
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   38  	const struct cdns_plat_pcie_of_data *data;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   39  	struct cdns_plat_pcie *cdns_plat_pcie;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   40  	struct device *dev = &pdev->dev;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   41  	struct pci_host_bridge *bridge;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   42  	struct cdns_pcie_ep *ep;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   43  	struct cdns_pcie_rc *rc;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   44  	int phy_count;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   45  	bool is_rc;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   46  	int ret;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   47  
131748ad2939df drivers/pci/controller/cadence/pcie-cadence-plat.c Fan Fei                2021-12-22   48  	data = of_device_get_match_data(dev);
131748ad2939df drivers/pci/controller/cadence/pcie-cadence-plat.c Fan Fei                2021-12-22   49  	if (!data)
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   50  		return -EINVAL;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   51  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   52  	is_rc = data->is_rc;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   53  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   54  	pr_debug(" Started %s with is_rc: %d\n", __func__, is_rc);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   55  	cdns_plat_pcie = devm_kzalloc(dev, sizeof(*cdns_plat_pcie), GFP_KERNEL);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   56  	if (!cdns_plat_pcie)
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   57  		return -ENOMEM;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   58  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   59  	platform_set_drvdata(pdev, cdns_plat_pcie);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   60  	if (is_rc) {
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   61  		if (!IS_ENABLED(CONFIG_PCIE_CADENCE_PLAT_HOST))
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   62  			return -ENODEV;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   63  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   64  		bridge = devm_pci_alloc_host_bridge(dev, sizeof(*rc));
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   65  		if (!bridge)
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   66  			return -ENOMEM;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   67  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   68  		rc = pci_host_bridge_priv(bridge);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   69  		rc->pcie.dev = dev;
d07701a17aec3e drivers/pci/controller/cadence/pcie-cadence-plat.c Kishon Vijay Abraham I 2020-07-22   70  		rc->pcie.ops = &cdns_plat_ops;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   71  		cdns_plat_pcie->pcie = &rc->pcie;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   72  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   73  		ret = cdns_pcie_init_phy(dev, cdns_plat_pcie->pcie);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   74  		if (ret) {
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   75  			dev_err(dev, "failed to init phy\n");
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   76  			return ret;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   77  		}
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   78  		pm_runtime_enable(dev);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   79  		ret = pm_runtime_get_sync(dev);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   80  		if (ret < 0) {
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   81  			dev_err(dev, "pm_runtime_get_sync() failed\n");
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   82  			goto err_get_sync;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   83  		}
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   84  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   85  		ret = cdns_pcie_host_setup(rc);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   86  		if (ret)
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   87  			goto err_init;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   88  	} else {
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   89  		if (!IS_ENABLED(CONFIG_PCIE_CADENCE_PLAT_EP))
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   90  			return -ENODEV;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   91  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   92  		ep = devm_kzalloc(dev, sizeof(*ep), GFP_KERNEL);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   93  		if (!ep)
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   94  			return -ENOMEM;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   95  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   96  		ep->pcie.dev = dev;
d07701a17aec3e drivers/pci/controller/cadence/pcie-cadence-plat.c Kishon Vijay Abraham I 2020-07-22   97  		ep->pcie.ops = &cdns_plat_ops;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   98  		cdns_plat_pcie->pcie = &ep->pcie;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   99  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  100  		ret = cdns_pcie_init_phy(dev, cdns_plat_pcie->pcie);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  101  		if (ret) {
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  102  			dev_err(dev, "failed to init phy\n");
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11 @103  			return ret;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  104  		}
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  105  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  106  		pm_runtime_enable(dev);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  107  		ret = pm_runtime_get_sync(dev);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  108  		if (ret < 0) {
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  109  			dev_err(dev, "pm_runtime_get_sync() failed\n");
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  110  			goto err_get_sync;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  111  		}
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  112  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  113  		ret = cdns_pcie_ep_setup(ep);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  114  		if (ret)
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  115  			goto err_init;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  116  	}
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  117  
27cd7e3c9bb1ae drivers/pci/controller/cadence/pcie-cadence-plat.c Li Chen                2021-10-21  118  	return 0;
27cd7e3c9bb1ae drivers/pci/controller/cadence/pcie-cadence-plat.c Li Chen                2021-10-21  119  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  120   err_init:
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  121   err_get_sync:
7a790087c1ad11 drivers/pci/controller/cadence/pcie-cadence-plat.c Dinghao Liu            2020-05-20  122  	pm_runtime_put_sync(dev);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  123  	pm_runtime_disable(dev);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  124  	cdns_pcie_disable_phy(cdns_plat_pcie->pcie);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  125  	phy_count = cdns_plat_pcie->pcie->phy_count;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  126  	while (phy_count--)
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  127  		device_link_del(cdns_plat_pcie->pcie->link[phy_count]);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  128  
da0cec0d8f08bf drivers/pci/controller/cadence/pcie-cadence-plat.c Vladimir Oltean        2026-08-10  129  	return ret;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  130  }
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  131  

:::::: The code at line 103 was first introduced by commit
:::::: bd22885aa188f135fd98382febfec650601ec998 PCI: cadence: Refactor driver to use as a core library

:::::: TO: Tom Joseph <tjoseph@cadence.com>
:::::: CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
