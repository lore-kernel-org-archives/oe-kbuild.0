Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BF21FDE0E
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Mar 2025 14:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741962054; cv=none; b=PSDhkgV2Rc/rfGqFdaIJNhhI60OU5KAjwtPPDUoWLTce1JCelFMlfBj1RyADB8ktMhq/17Ng9jjVfpvFSU7718CbAH3V4Rg6UZbKfM6Gx5OP60m3MpVSW1EUGvVuX2MoasGK4ucZGYqK0ksR+k8E5PVqJM4fOmME8AGDVVXspj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741962054; c=relaxed/simple;
	bh=2rKVtdTd65dq+hIj+jQAAPVyHzqgVD98k47FP1+Faz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ooX5xcBB+MRScbY000j9bLmlzRXM8woLBXYoNXS21JaFCrTNuYpqbZ5MCORA8fmeecFDK79eKSnrlYTF7MHXG5VxIfzL6pAE4xoMqUMfc4XAL3m3BWVlkMP+4wQqDN7XQy7JKY+4YKfNhdQ6NaWlDFRvwtxWlAKt9JPBrg4N7ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/V7p1wB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/V7p1wB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741962053; x=1773498053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2rKVtdTd65dq+hIj+jQAAPVyHzqgVD98k47FP1+Faz4=;
  b=D/V7p1wBv5CjTiWZbC8CYe9GP6tlkS7E+bRdCCoHfI6fzbzfWsFWzJwQ
   bhqYCSOOKDBCTs7UhF8KqVvhaGctyo8sCDxANQHskxC4MD3SAQnBDf1Ak
   9lQcywMPxM4IgZjmjAwDU+RHWkqLGUKtSWRHF3PQQAU4scMDD8eOXTFgo
   8U6Wz1bxJQFStVsnVUHw8uKWyyYFQbRTG7lBAhpJsUqT+50ENZKLgbBrk
   JZW6NBn0HFF12lQCdMWTfZOnpu1Xapo9eVMyy61nQbn8qoONWxqH54dlx
   ahcrSVNAKa/w963pCABvuABODkwOZueTEX1jTtmhHelhO3DBcYt6Arnk+
   Q==;
X-CSE-ConnectionGUID: ZIY7Dwh3TD63CM19T3vUNw==
X-CSE-MsgGUID: VY4l2nvYQS2ffu3tFw0leA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43149599"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43149599"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 07:20:52 -0700
X-CSE-ConnectionGUID: Cv5T4lboQhywsG+LnQU4aw==
X-CSE-MsgGUID: 7W8gboyUR1S/ldXGiHVueg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121024308"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 14 Mar 2025 07:20:51 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt5u4-000AXk-1E;
	Fri, 14 Mar 2025 14:20:48 +0000
Date: Fri, 14 Mar 2025 22:19:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1915/11207] drivers/phy/phy-can-transceiver.c:120
 can_transceiver_phy_probe() warn: passing positive error code '(-517)' to
 'PTR_ERR'
Message-ID: <202503142216.ns0lUa4g-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   da920b7df701770e006928053672147075587fb2
commit: d02dfd4ceb2e9f34caaaaf87105267e2f722f443 [1915/11207] phy: can-transceiver: Drop unnecessary "mux-states" property presence check
:::::: branch date: 7 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-141-20250314 (https://download.01.org/0day-ci/archive/20250314/202503142216.ns0lUa4g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503142216.ns0lUa4g-lkp@intel.com/

smatch warnings:
drivers/phy/phy-can-transceiver.c:120 can_transceiver_phy_probe() warn: passing positive error code '(-517)' to 'PTR_ERR'

vim +120 drivers/phy/phy-can-transceiver.c

a4a86d273ff1b6f Aswath Govindraju  2021-05-10   95  
a4a86d273ff1b6f Aswath Govindraju  2021-05-10   96  static int can_transceiver_phy_probe(struct platform_device *pdev)
a4a86d273ff1b6f Aswath Govindraju  2021-05-10   97  {
a4a86d273ff1b6f Aswath Govindraju  2021-05-10   98  	struct phy_provider *phy_provider;
a4a86d273ff1b6f Aswath Govindraju  2021-05-10   99  	struct device *dev = &pdev->dev;
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  100  	struct can_transceiver_phy *can_transceiver_phy;
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  101  	const struct can_transceiver_data *drvdata;
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  102  	const struct of_device_id *match;
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  103  	struct phy *phy;
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  104  	struct gpio_desc *standby_gpio;
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  105  	struct gpio_desc *enable_gpio;
d02dfd4ceb2e9f3 Rob Herring (Arm   2025-02-03  106) 	struct mux_state *mux_state;
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  107  	u32 max_bitrate = 0;
bc30c15f275484f Geert Uytterhoeven 2023-01-18  108  	int err;
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  109  
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  110  	can_transceiver_phy = devm_kzalloc(dev, sizeof(struct can_transceiver_phy), GFP_KERNEL);
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  111  	if (!can_transceiver_phy)
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  112  		return -ENOMEM;
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  113  
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  114  	match = of_match_node(can_transceiver_phy_ids, pdev->dev.of_node);
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  115  	drvdata = match->data;
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  116  
e4d437125302952 Aswath Govindraju  2022-04-08  117  	mux_state = devm_mux_state_get(dev, NULL);
d02dfd4ceb2e9f3 Rob Herring (Arm   2025-02-03  118) 	if (IS_ERR(mux_state)) {
d02dfd4ceb2e9f3 Rob Herring (Arm   2025-02-03  119) 		if (PTR_ERR(mux_state) == -EPROBE_DEFER)
d02dfd4ceb2e9f3 Rob Herring (Arm   2025-02-03 @120) 			return PTR_ERR(mux_state);
d02dfd4ceb2e9f3 Rob Herring (Arm   2025-02-03  121) 	} else {
e4d437125302952 Aswath Govindraju  2022-04-08  122  		can_transceiver_phy->mux_state = mux_state;
e4d437125302952 Aswath Govindraju  2022-04-08  123  	}
e4d437125302952 Aswath Govindraju  2022-04-08  124  
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  125  	phy = devm_phy_create(dev, dev->of_node,
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  126  			      &can_transceiver_phy_ops);
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  127  	if (IS_ERR(phy)) {
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  128  		dev_err(dev, "failed to create can transceiver phy\n");
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  129  		return PTR_ERR(phy);
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  130  	}
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  131  
bc30c15f275484f Geert Uytterhoeven 2023-01-18  132  	err = device_property_read_u32(dev, "max-bitrate", &max_bitrate);
bc30c15f275484f Geert Uytterhoeven 2023-01-18  133  	if ((err != -EINVAL) && !max_bitrate)
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  134  		dev_warn(dev, "Invalid value for transceiver max bitrate. Ignoring bitrate limit\n");
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  135  	phy->attrs.max_link_rate = max_bitrate;
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  136  
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  137  	can_transceiver_phy->generic_phy = phy;
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  138  
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  139  	if (drvdata->flags & CAN_TRANSCEIVER_STB_PRESENT) {
be24d24840ccb6f Aswath Govindraju  2021-11-02  140  		standby_gpio = devm_gpiod_get_optional(dev, "standby", GPIOD_OUT_HIGH);
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  141  		if (IS_ERR(standby_gpio))
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  142  			return PTR_ERR(standby_gpio);
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  143  		can_transceiver_phy->standby_gpio = standby_gpio;
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  144  	}
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  145  
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  146  	if (drvdata->flags & CAN_TRANSCEIVER_EN_PRESENT) {
be24d24840ccb6f Aswath Govindraju  2021-11-02  147  		enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  148  		if (IS_ERR(enable_gpio))
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  149  			return PTR_ERR(enable_gpio);
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  150  		can_transceiver_phy->enable_gpio = enable_gpio;
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  151  	}
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  152  
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  153  	phy_set_drvdata(can_transceiver_phy->generic_phy, can_transceiver_phy);
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  154  
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  155  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  156  
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  157  	return PTR_ERR_OR_ZERO(phy_provider);
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  158  }
a4a86d273ff1b6f Aswath Govindraju  2021-05-10  159  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
