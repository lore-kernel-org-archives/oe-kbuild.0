Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0996363
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Jul 2023 02:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689905019; x=1721441019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TLpk9FWPyiqLcmJkdRvYFO2kZu2MVyzTjn1a7ZUtGhw=;
  b=QMK6QUGf+SEFDDRSODlc1w1Zj5o1N/bhck2O+vFk+w3qRvesJN3lGdDT
   4wOIXqB1NQuDWyYji0/z0xPFWb0MeYJrNE3NH4vSzf82KrrsvosGWrPBm
   7IGqTyXXjQBPxhw1v+VygFFypuu/t7wPZ7JLH9SNruF2tEgfu7NHyepQC
   0c7zVafquW3EFv9rS1gRPIw0gsJMoCSz8/AnhjctaH5u/U2VtTvywWV0L
   EFGfh2uqIcS/4I23Posl2LeRdliJcr7Sv/exl39gjgFGtnO1NKh/OuZlT
   yosmQboBLx7h10Q8a9j16to7YRGZjPzIoxMrzoxWXVP+TaRVJyJQkPeLY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="370514618"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="370514618"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 19:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="898544160"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="898544160"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Jul 2023 19:03:38 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMfUC-0006jv-27;
	Fri, 21 Jul 2023 02:03:22 +0000
Date: Fri, 21 Jul 2023 10:02:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1550/3762]
 drivers/phy/starfive/phy-jh7110-pcie.c:154 jh7110_pcie_phy_probe() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202307210935.mEohoXIv-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Minda Chen <minda.chen@starfivetech.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Roger Quadros <rogerq@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c58c49dd89324b18a812762a2bfa5a0458e4f252
commit: fd097f48eea95c9776a8846edfe9e328e9eaf7e2 [1550/3762] phy: starfive: Add JH7110 PCIE 2.0 PHY driver
:::::: branch date: 22 hours ago
:::::: commit date: 8 days ago
config: parisc-randconfig-m041-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210935.mEohoXIv-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210935.mEohoXIv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307210935.mEohoXIv-lkp@intel.com/

smatch warnings:
drivers/phy/starfive/phy-jh7110-pcie.c:154 jh7110_pcie_phy_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +154 drivers/phy/starfive/phy-jh7110-pcie.c

fd097f48eea95c Minda Chen 2023-06-29  136  
fd097f48eea95c Minda Chen 2023-06-29  137  static int jh7110_pcie_phy_probe(struct platform_device *pdev)
fd097f48eea95c Minda Chen 2023-06-29  138  {
fd097f48eea95c Minda Chen 2023-06-29  139  	struct jh7110_pcie_phy *phy;
fd097f48eea95c Minda Chen 2023-06-29  140  	struct device *dev = &pdev->dev;
fd097f48eea95c Minda Chen 2023-06-29  141  	struct phy_provider *phy_provider;
fd097f48eea95c Minda Chen 2023-06-29  142  	u32 args[2];
fd097f48eea95c Minda Chen 2023-06-29  143  
fd097f48eea95c Minda Chen 2023-06-29  144  	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
fd097f48eea95c Minda Chen 2023-06-29  145  	if (!phy)
fd097f48eea95c Minda Chen 2023-06-29  146  		return -ENOMEM;
fd097f48eea95c Minda Chen 2023-06-29  147  
fd097f48eea95c Minda Chen 2023-06-29  148  	phy->regs = devm_platform_ioremap_resource(pdev, 0);
fd097f48eea95c Minda Chen 2023-06-29  149  	if (IS_ERR(phy->regs))
fd097f48eea95c Minda Chen 2023-06-29  150  		return PTR_ERR(phy->regs);
fd097f48eea95c Minda Chen 2023-06-29  151  
fd097f48eea95c Minda Chen 2023-06-29  152  	phy->phy = devm_phy_create(dev, NULL, &jh7110_pcie_phy_ops);
fd097f48eea95c Minda Chen 2023-06-29  153  	if (IS_ERR(phy->phy))
fd097f48eea95c Minda Chen 2023-06-29 @154  		return dev_err_probe(dev, PTR_ERR(phy->regs),
fd097f48eea95c Minda Chen 2023-06-29  155  				     "Failed to map phy base\n");
fd097f48eea95c Minda Chen 2023-06-29  156  
fd097f48eea95c Minda Chen 2023-06-29  157  	phy->sys_syscon =
fd097f48eea95c Minda Chen 2023-06-29  158  		syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
fd097f48eea95c Minda Chen 2023-06-29  159  						     "starfive,sys-syscon",
fd097f48eea95c Minda Chen 2023-06-29  160  						     1, args);
fd097f48eea95c Minda Chen 2023-06-29  161  
fd097f48eea95c Minda Chen 2023-06-29  162  	if (!IS_ERR_OR_NULL(phy->sys_syscon))
fd097f48eea95c Minda Chen 2023-06-29  163  		phy->sys_phy_connect = args[0];
fd097f48eea95c Minda Chen 2023-06-29  164  	else
fd097f48eea95c Minda Chen 2023-06-29  165  		phy->sys_syscon = NULL;
fd097f48eea95c Minda Chen 2023-06-29  166  
fd097f48eea95c Minda Chen 2023-06-29  167  	phy->stg_syscon =
fd097f48eea95c Minda Chen 2023-06-29  168  		syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
fd097f48eea95c Minda Chen 2023-06-29  169  						     "starfive,stg-syscon",
fd097f48eea95c Minda Chen 2023-06-29  170  						     2, args);
fd097f48eea95c Minda Chen 2023-06-29  171  
fd097f48eea95c Minda Chen 2023-06-29  172  	if (!IS_ERR_OR_NULL(phy->stg_syscon)) {
fd097f48eea95c Minda Chen 2023-06-29  173  		phy->stg_pcie_mode = args[0];
fd097f48eea95c Minda Chen 2023-06-29  174  		phy->stg_pcie_usb = args[1];
fd097f48eea95c Minda Chen 2023-06-29  175  	} else {
fd097f48eea95c Minda Chen 2023-06-29  176  		phy->stg_syscon = NULL;
fd097f48eea95c Minda Chen 2023-06-29  177  	}
fd097f48eea95c Minda Chen 2023-06-29  178  
fd097f48eea95c Minda Chen 2023-06-29  179  	phy_kvco_gain_set(phy);
fd097f48eea95c Minda Chen 2023-06-29  180  
fd097f48eea95c Minda Chen 2023-06-29  181  	phy_set_drvdata(phy->phy, phy);
fd097f48eea95c Minda Chen 2023-06-29  182  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
fd097f48eea95c Minda Chen 2023-06-29  183  
fd097f48eea95c Minda Chen 2023-06-29  184  	return PTR_ERR_OR_ZERO(phy_provider);
fd097f48eea95c Minda Chen 2023-06-29  185  }
fd097f48eea95c Minda Chen 2023-06-29  186  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
