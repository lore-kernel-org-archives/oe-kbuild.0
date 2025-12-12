Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF122E0934
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 04:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765514967; cv=none; b=aD5dyDoRLl93m2PGxXNg4c4WxY17X0m5Hs3Q0BWG3jexkozFWox4fIOVmafkt3YfRQ9QitqKuKtgPGH9SXbcIjQ3WcnQN70GoSr/suzUrx4Twrd38WfYNeF80k8W0zPy1WzQqH7B+8Dz3flFHe9aAmi9r8qaepkvhgi3dDoZvPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765514967; c=relaxed/simple;
	bh=SBHsIGIcRRtUNQ72QaZ5DXfoDZ7LSdoQ7e8PUYzjlTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YYFnpzan1I+qLsOiNR62KtnRvZB+KdEG/k7d/Uz5xDXBIe+ILV7+6Q/JTTVVm0E37nZbfJCKnXlRjrp9wzhPrq2xBNVzWdEJ2+PKqS+2boCE1vbhTBirtFu/MZdkQpF4cF3rMeZln8CP7ApoKogGqEu0KSLSY8j8s7NRg0fch+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVMdb5pg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVMdb5pg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765514965; x=1797050965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SBHsIGIcRRtUNQ72QaZ5DXfoDZ7LSdoQ7e8PUYzjlTA=;
  b=nVMdb5pg2aLGenOxfov587qVlSMwRBf++/e43U5Co7HM7SM8CHkMmbn/
   VNxZHMD8D9eLuUMGe9entD6wJ58iWYwcPZ7sw3C1RbFAA8b1LWoCWORuR
   BBKIKKGZTYKfS4kiPvji+EI6Ao/gvXlPRdbSsrac+1oRbrRryWVW4t0NS
   c8QMOkatm2RjIXyuGRAchsm37eDhpMHisyRdY8EDJBYLx2GR0VtrR5SDa
   aoNX8QN2Wc1joRSXBkXqXxLImascteYRs0Ar7U7HQeYah4X5o+bNNTdjf
   FJKpF2TfaZxhouQpWy+9oypGDuvuoZCm88phY4HC5d4eM7d33HyRACsFR
   A==;
X-CSE-ConnectionGUID: uVZxRHmSRWGyMiex2OlZQw==
X-CSE-MsgGUID: UQtbkvvJTcuOio8xdxx/1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67390417"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67390417"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 20:49:23 -0800
X-CSE-ConnectionGUID: qQ5u3TfJRVOgSTWO18/pMA==
X-CSE-MsgGUID: vNTkiAYsQq+3t3+RHxJvcg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Dec 2025 20:49:23 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTv5k-000000005W9-1MI4;
	Fri, 12 Dec 2025 04:49:20 +0000
Date: Fri, 12 Dec 2025 12:48:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/9] bitfield: Update sanity checks
Message-ID: <202512121232.PvAIXM4T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/pci/controller/pcie-rockchip.c:158:16: sparse: sparse: __auto_type on self-init var"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251209100313.2867-7-david.laight.linux@gmail.com>
References: <20251209100313.2867-7-david.laight.linux@gmail.com>
TO: david.laight.linux@gmail.com
TO: Yury Norov <yury.norov@gmail.com>
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
TO: linux-kernel@vger.kernel.org
TO: linux-usb@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
TO: Crt Mori <cmo@melexis.com>
TO: Richard Genoud <richard.genoud@bootlin.com>
TO: Andy Shevchenko <andriy.shevchenko@intel.com>
TO: Luo Jie <quic_luoj@quicinc.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Jakub Kicinski <kuba@kernel.org>
TO: netdev@vger.kernel.org
TO: "David S . Miller" <davem@davemloft.net>
TO: Simon Horman <simon.horman@netronome.com>
TO: Mika Westerberg <mika.westerberg@linux.intel.com>
TO: Andreas Noever <andreas.noever@gmail.com>
TO: Yehezkel Bernat <YehezkelShB@gmail.com>
TO: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
CC: David Laight <david.laight.linux@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20251212]
[cannot apply to westeri-thunderbolt/next v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/nfp-Call-FIELD_PREP-in-NFP_ETH_SET_BIT_CONFIG-wrapper/20251209-181248
base:   linus/master
patch link:    https://lore.kernel.org/r/20251209100313.2867-7-david.laight.linux%40gmail.com
patch subject: [PATCH 6/9] bitfield: Update sanity checks
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: um-randconfig-r132-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121232.PvAIXM4T-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121232.PvAIXM4T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512121232.PvAIXM4T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pcie-rockchip.c:158:16: sparse: sparse: __auto_type on self-init var
>> drivers/pci/controller/pcie-rockchip.c:158:16: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/pci/controller/pcie-rockchip.c:158:16: sparse:    unsigned int
   drivers/pci/controller/pcie-rockchip.c:158:16: sparse:    bad type
>> drivers/pci/controller/pcie-rockchip.c:158:16: sparse: sparse: incompatible type for operation (-):
   drivers/pci/controller/pcie-rockchip.c:158:16: sparse:    bad type _mask
>> drivers/pci/controller/pcie-rockchip.c:158:16: sparse: sparse: incompatible types for operation (>>):
   drivers/pci/controller/pcie-rockchip.c:158:16: sparse:    bad type _mask
   drivers/pci/controller/pcie-rockchip.c:158:16: sparse:    int
   drivers/pci/controller/pcie-rockchip.c:158:16: sparse: sparse: incompatible types for operation (<<):
   drivers/pci/controller/pcie-rockchip.c:158:16: sparse:    bad type _val
   drivers/pci/controller/pcie-rockchip.c:158:16: sparse:    int

vim +158 drivers/pci/controller/pcie-rockchip.c

9dd3c7c4c8c3f7 drivers/pci/controller/pcie-rockchip.c Rick Wertenbroek 2023-04-18  114  
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  115  int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  116  {
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  117  	struct device *dev = rockchip->dev;
9e87240c460637 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2017-08-25  118  	int err, i;
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  119  	u32 regs;
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  120  
18715931a5c08d drivers/pci/controller/pcie-rockchip.c Anand Moon       2024-12-02  121  	err = reset_control_bulk_assert(ROCKCHIP_NUM_PM_RSTS,
18715931a5c08d drivers/pci/controller/pcie-rockchip.c Anand Moon       2024-12-02  122  					rockchip->pm_rsts);
18715931a5c08d drivers/pci/controller/pcie-rockchip.c Anand Moon       2024-12-02  123  	if (err)
18715931a5c08d drivers/pci/controller/pcie-rockchip.c Anand Moon       2024-12-02  124  		return dev_err_probe(dev, err, "Couldn't assert PM resets\n");
31a3a7b5b26f75 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-11-10  125  
9e87240c460637 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2017-08-25  126  	for (i = 0; i < MAX_LANE_NUM; i++) {
9e87240c460637 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2017-08-25  127  		err = phy_init(rockchip->phys[i]);
9e87240c460637 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2017-08-25  128  		if (err) {
9e87240c460637 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2017-08-25  129  			dev_err(dev, "init phy%d err %d\n", i, err);
8c595dd1fd97d8 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2017-08-23  130  			goto err_exit_phy;
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  131  		}
9e87240c460637 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2017-08-25  132  	}
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  133  
18715931a5c08d drivers/pci/controller/pcie-rockchip.c Anand Moon       2024-12-02  134  	err = reset_control_bulk_assert(ROCKCHIP_NUM_CORE_RSTS,
18715931a5c08d drivers/pci/controller/pcie-rockchip.c Anand Moon       2024-12-02  135  					rockchip->core_rsts);
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  136  	if (err) {
18715931a5c08d drivers/pci/controller/pcie-rockchip.c Anand Moon       2024-12-02  137  		dev_err_probe(dev, err, "Couldn't assert Core resets\n");
8c595dd1fd97d8 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2017-08-23  138  		goto err_exit_phy;
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  139  	}
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  140  
0722bdd2962a4a drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-11-24  141  	udelay(10);
0722bdd2962a4a drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-11-24  142  
18715931a5c08d drivers/pci/controller/pcie-rockchip.c Anand Moon       2024-12-02  143  	err = reset_control_bulk_deassert(ROCKCHIP_NUM_PM_RSTS,
18715931a5c08d drivers/pci/controller/pcie-rockchip.c Anand Moon       2024-12-02  144  					  rockchip->pm_rsts);
0722bdd2962a4a drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-11-24  145  	if (err) {
18715931a5c08d drivers/pci/controller/pcie-rockchip.c Anand Moon       2024-12-02  146  		dev_err(dev, "Couldn't deassert PM resets %d\n", err);
8c595dd1fd97d8 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2017-08-23  147  		goto err_exit_phy;
0722bdd2962a4a drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-11-24  148  	}
0722bdd2962a4a drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-11-24  149  
f2fb5b8f2a0cb6 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-12-07  150  	if (rockchip->link_gen == 2)
f2fb5b8f2a0cb6 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-12-07  151  		rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_2,
f2fb5b8f2a0cb6 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-12-07  152  				    PCIE_CLIENT_CONFIG);
f2fb5b8f2a0cb6 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-12-07  153  	else
f2fb5b8f2a0cb6 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-12-07  154  		rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_1,
f2fb5b8f2a0cb6 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-12-07  155  				    PCIE_CLIENT_CONFIG);
f2fb5b8f2a0cb6 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-12-07  156  
091022f5f94513 drivers/pci/controller/pcie-rockchip.c Damien Le Moal   2024-10-17  157  	regs = PCIE_CLIENT_ARI_ENABLE |
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09 @158  	       PCIE_CLIENT_CONF_LANE_NUM(rockchip->lanes);
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  159  
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  160  	if (rockchip->is_rc)
091022f5f94513 drivers/pci/controller/pcie-rockchip.c Damien Le Moal   2024-10-17  161  		regs |= PCIE_CLIENT_LINK_TRAIN_ENABLE |
091022f5f94513 drivers/pci/controller/pcie-rockchip.c Damien Le Moal   2024-10-17  162  			PCIE_CLIENT_CONF_ENABLE | PCIE_CLIENT_MODE_RC;
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  163  	else
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  164  		regs |= PCIE_CLIENT_CONF_DISABLE | PCIE_CLIENT_MODE_EP;
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  165  
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  166  	rockchip_pcie_write(rockchip, regs, PCIE_CLIENT_CONFIG);
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  167  
9e87240c460637 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2017-08-25  168  	for (i = 0; i < MAX_LANE_NUM; i++) {
9e87240c460637 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2017-08-25  169  		err = phy_power_on(rockchip->phys[i]);
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  170  		if (err) {
9e87240c460637 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2017-08-25  171  			dev_err(dev, "power on phy%d err %d\n", i, err);
8c595dd1fd97d8 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2017-08-23  172  			goto err_power_off_phy;
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  173  		}
9e87240c460637 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2017-08-25  174  	}
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  175  
9dd3c7c4c8c3f7 drivers/pci/controller/pcie-rockchip.c Rick Wertenbroek 2023-04-18  176  	err = readx_poll_timeout(rockchip_pcie_read_addr,
9dd3c7c4c8c3f7 drivers/pci/controller/pcie-rockchip.c Rick Wertenbroek 2023-04-18  177  				 PCIE_CLIENT_SIDE_BAND_STATUS,
9dd3c7c4c8c3f7 drivers/pci/controller/pcie-rockchip.c Rick Wertenbroek 2023-04-18  178  				 regs, !(regs & PCIE_CLIENT_PHY_ST),
9dd3c7c4c8c3f7 drivers/pci/controller/pcie-rockchip.c Rick Wertenbroek 2023-04-18  179  				 RK_PHY_PLL_LOCK_SLEEP_US,
9dd3c7c4c8c3f7 drivers/pci/controller/pcie-rockchip.c Rick Wertenbroek 2023-04-18  180  				 RK_PHY_PLL_LOCK_TIMEOUT_US);
9dd3c7c4c8c3f7 drivers/pci/controller/pcie-rockchip.c Rick Wertenbroek 2023-04-18  181  	if (err) {
9dd3c7c4c8c3f7 drivers/pci/controller/pcie-rockchip.c Rick Wertenbroek 2023-04-18  182  		dev_err(dev, "PHY PLLs could not lock, %d\n", err);
9dd3c7c4c8c3f7 drivers/pci/controller/pcie-rockchip.c Rick Wertenbroek 2023-04-18  183  		goto err_power_off_phy;
9dd3c7c4c8c3f7 drivers/pci/controller/pcie-rockchip.c Rick Wertenbroek 2023-04-18  184  	}
9dd3c7c4c8c3f7 drivers/pci/controller/pcie-rockchip.c Rick Wertenbroek 2023-04-18  185  
18715931a5c08d drivers/pci/controller/pcie-rockchip.c Anand Moon       2024-12-02  186  	err = reset_control_bulk_deassert(ROCKCHIP_NUM_CORE_RSTS,
18715931a5c08d drivers/pci/controller/pcie-rockchip.c Anand Moon       2024-12-02  187  					  rockchip->core_rsts);
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  188  	if (err) {
18715931a5c08d drivers/pci/controller/pcie-rockchip.c Anand Moon       2024-12-02  189  		dev_err(dev, "Couldn't deassert Core reset %d\n", err);
8c595dd1fd97d8 drivers/pci/host/pcie-rockchip.c       Shawn Lin        2017-08-23  190  		goto err_power_off_phy;
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  191  	}
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  192  
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  193  	return 0;
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  194  err_power_off_phy:
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  195  	while (i--)
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  196  		phy_power_off(rockchip->phys[i]);
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  197  	i = MAX_LANE_NUM;
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  198  err_exit_phy:
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  199  	while (i--)
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  200  		phy_exit(rockchip->phys[i]);
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  201  	return err;
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  202  }
3593709f2651da drivers/pci/host/pcie-rockchip.c       Shawn Lin        2018-05-09  203  EXPORT_SYMBOL_GPL(rockchip_pcie_init_port);
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin        2016-09-03  204  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
