Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FB7146A77
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713787244; cv=none; b=iNtukNiyHn/dPF22cOMSttRmMijts7jKFQ1S5dgF89GjdHp+70e436EZHh4pNHsTZKchFMyUzDDY/+Lg4Z1o79BBc4AbpbjKKz0RHTVQBYibZF/cngQWHTa93TS94+27DGE8Re6+uCOicIaOgkxH94k1W3xml1B1Uq+9VimxdOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713787244; c=relaxed/simple;
	bh=hnNRIuWcmEzZC4nyZPl4Y43i8v5OkdD8qrqSCS9RU5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uy3GyQDayAOy73/4pGfbkjxjCqR4dP2BGSaKfWPVbaL5TpPOehIhVMevuBqCV2PegARKJYs0Kdm8UALrmpuWTPphpBxI+W2lzMksvoE3qU4SrJZWArQQZb2hcRtMzhHMOU+lNLsq3SzyNAWjTASC3K23aHPzrJoVHRcIod777IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnXIA6Gy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnXIA6Gy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713787240; x=1745323240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hnNRIuWcmEzZC4nyZPl4Y43i8v5OkdD8qrqSCS9RU5s=;
  b=SnXIA6GyfhxqpCK3G5lgIxaJcjX6tnhrmoTiItaFZPzPLa6v0JQCdK9T
   JBaCzG6IYb9v8tAhWXlOdyW0JmFxjSE35EzLXnjd82/GOHQQIKQQaG0Kq
   CS03880JGdaOXHCCV7yHfwKwIfL8XRpWaF/uzd6ill21J1AtwAtgTPHFJ
   KsipHbUIKScAP94bWGEhP0ulAPvkrWfWD8P/rRNUZJP/tL3G2D3umyGob
   EPd5OcEk0QKRUQV9LIEN49Akn146SfAe4h66b9itivHlaHIiK86ti9JPe
   LqZDiPSWFR8Lh3hzMYzdRq3SEPznr1nvBzM4aCiYydOxukXMnalkISqye
   w==;
X-CSE-ConnectionGUID: Xvf2gaZbTBmWShNI4f0wcQ==
X-CSE-MsgGUID: sKZCyMvYS8uc2tCiRbZIug==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="13155347"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="13155347"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 05:00:39 -0700
X-CSE-ConnectionGUID: zMPwTPR3TxGQX69uAqx37g==
X-CSE-MsgGUID: DN1tZsWEQUa978F/qn8JLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="24074170"
Received: from lkp-server01.sh.intel.com (HELO 69a5ba6c3aa8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Apr 2024 05:00:38 -0700
Received: from kbuild by 69a5ba6c3aa8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rysLc-00002G-0B;
	Mon, 22 Apr 2024 12:00:36 +0000
Date: Mon, 22 Apr 2024 20:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6954/7322] drivers/spmi/spmi-pmic-arb.c:1782
 spmi_pmic_arb_register_buses() error: uninitialized symbol 'ret'.
Message-ID: <202404221945.jickYhnO-lkp@intel.com>
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
TO: Abel Vesa <abel.vesa@linaro.org>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f529a6d274b3b8c75899e949649d231298f30a32
commit: ee2098c0b512fb80b63119199938ea62a240ebc7 [6954/7322] spmi: pmic-arb: Add multi bus support
:::::: branch date: 6 hours ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r071-20240422 (https://download.01.org/0day-ci/archive/20240422/202404221945.jickYhnO-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404221945.jickYhnO-lkp@intel.com/

New smatch warnings:
drivers/spmi/spmi-pmic-arb.c:1782 spmi_pmic_arb_register_buses() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/spmi/spmi-pmic-arb.c:1724 spmi_pmic_arb_bus_init() warn: unsigned 'irq' is never less than zero.

vim +/ret +1782 drivers/spmi/spmi-pmic-arb.c

932282f154ac7b Abel Vesa 2024-04-17  1761  
ee2098c0b512fb Abel Vesa 2024-04-17  1762  static int spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
ee2098c0b512fb Abel Vesa 2024-04-17  1763  					struct platform_device *pdev)
ee2098c0b512fb Abel Vesa 2024-04-17  1764  {
ee2098c0b512fb Abel Vesa 2024-04-17  1765  	struct device *dev = &pdev->dev;
ee2098c0b512fb Abel Vesa 2024-04-17  1766  	struct device_node *node = dev->of_node;
ee2098c0b512fb Abel Vesa 2024-04-17  1767  	struct device_node *child;
ee2098c0b512fb Abel Vesa 2024-04-17  1768  	int ret;
ee2098c0b512fb Abel Vesa 2024-04-17  1769  
ee2098c0b512fb Abel Vesa 2024-04-17  1770  	/* legacy mode doesn't provide child node for the bus */
ee2098c0b512fb Abel Vesa 2024-04-17  1771  	if (of_device_is_compatible(node, "qcom,spmi-pmic-arb"))
ee2098c0b512fb Abel Vesa 2024-04-17  1772  		return spmi_pmic_arb_bus_init(pdev, node, pmic_arb);
ee2098c0b512fb Abel Vesa 2024-04-17  1773  
ee2098c0b512fb Abel Vesa 2024-04-17  1774  	for_each_available_child_of_node(node, child) {
ee2098c0b512fb Abel Vesa 2024-04-17  1775  		if (of_node_name_eq(child, "spmi")) {
ee2098c0b512fb Abel Vesa 2024-04-17  1776  			ret = spmi_pmic_arb_bus_init(pdev, child, pmic_arb);
ee2098c0b512fb Abel Vesa 2024-04-17  1777  			if (ret)
ee2098c0b512fb Abel Vesa 2024-04-17  1778  				return ret;
ee2098c0b512fb Abel Vesa 2024-04-17  1779  		}
ee2098c0b512fb Abel Vesa 2024-04-17  1780  	}
ee2098c0b512fb Abel Vesa 2024-04-17  1781  
ee2098c0b512fb Abel Vesa 2024-04-17 @1782  	return ret;
ee2098c0b512fb Abel Vesa 2024-04-17  1783  }
ee2098c0b512fb Abel Vesa 2024-04-17  1784  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
