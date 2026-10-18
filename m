Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3701D443C27
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309962; cv=none; b=ixUV/dh7DTN6Nrw+3Uc0tuIx9v31nz5Dc3Q8PqOm0t59REMjnxgeBFBNe45UIpZVbb+nS6hdMSzdDnkFbPKkeZmPi8riECB4aW73ZR6pjbRpKEMRCi/VD8Mn59+A7LtPXYZbtNkX1UzFYH5TGH1pxs4zzgynd/w83SPaFM5cgFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309962; c=relaxed/simple;
	bh=JX5Umne0MOUsA1grw1PB2EWM0Go2Argx/ovSldd1s3Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=shzsO2zGw0W+NjyigcoDJG2Mqw/qQ8taZyxTfbIC/Xo60ppo+Q51Hp9hEFPYT04/1n69mx+9RU0mtD6+D3QX+tp78jrIYICHQxQpdmmOidI2sKBirHz9jCs9D8d8rYr8NtkRaPkrg/jsEu9/F+1GtJEXizC7TSk5YKccPHr8vuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dj9UGE4L; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dj9UGE4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309960; x=1823845960;
  h=date:from:to:cc:subject:message-id;
  bh=JX5Umne0MOUsA1grw1PB2EWM0Go2Argx/ovSldd1s3Y=;
  b=Dj9UGE4LYhoDYs3MLUsXTHOMbCyYtKkH6OhlWe71+u7oO7qkCkyN7q4V
   gNUfG2vYoFn5tZ6xyHYWVgVMO8wJzoL258ppkuOnkFZfNNQK70PSCdSnl
   RF5x+akYxmzLUIPqOsHmRWNQ+0Z7hwmjE2HZmYnTvG6Y8k5eTd7rvhNh0
   YYjUrBDbVwNI4U2MHyjgeejML+bI9HSLEpGPfVTAtyY2XXvgNhI6DFWSw
   BQEYFe+UCdGn2l/7jQ42bP64GffhY4fj4UdSzIfbSKwe2vAI4IekG/LqB
   7u/z4G2JYsawQa9iGhrhf8TVj91C239eEpjhFZGGTlKSLfuSO/Qa0tcCN
   w==;
X-CSE-ConnectionGUID: RNPnxaRrQT6wiHEBTMfcMA==
X-CSE-MsgGUID: kum6iPaWS+W7Mk8N27Hgiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="908854"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="908854"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:36 -0700
X-CSE-ConnectionGUID: TUX4hb+ERFmMeWWu6R+IoQ==
X-CSE-MsgGUID: AH2QaXfiRQiTsHJcG2DEGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4115552"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 18 Oct 2026 00:52:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004xx-2P9P;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:49:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/airoha/airoha_ppe.c:122
 airoha_ppe_set_xmit_frame_size() warn: subtract is higher precedence than
 shift
Message-ID: <202610171553.1N6yVgb3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
commit: a7c6debfec17381329b094bd75560a1e57a5533a net: airoha: fix max receive size configuration
date:   4 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 4 months ago
config: alpha-randconfig-r2201-20261017 (https://download.01.org/0day-ci/archive/20261017/202610171553.1N6yVgb3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a7c6debfec17 ("net: airoha: fix max receive size configuration")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610171553.1N6yVgb3-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/airoha/airoha_ppe.c:122 airoha_ppe_set_xmit_frame_size() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_ppe.c:122 airoha_ppe_set_xmit_frame_size() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_ppe.c:122 airoha_ppe_set_xmit_frame_size() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_ppe.c:122 airoha_ppe_set_xmit_frame_size() warn: subtract is higher precedence than shift

Old smatch warnings:
drivers/net/ethernet/airoha/airoha_ppe.c:95 airoha_ppe_set_cpu_port() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_ppe.c:95 airoha_ppe_set_cpu_port() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_ppe.c:95 airoha_ppe_set_cpu_port() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_ppe.c:95 airoha_ppe_set_cpu_port() warn: subtract is higher precedence than shift

vim +122 drivers/net/ethernet/airoha/airoha_ppe.c

f44218cd5e6a3d Lorenzo Bianconi 2026-03-17   99  
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  100  void airoha_ppe_set_xmit_frame_size(struct airoha_gdm_dev *dev)
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  101  {
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  102  	struct airoha_gdm_port *port = dev->port;
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  103  	struct airoha_eth *eth = dev->eth;
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  104  	int i, ppe_id, index;
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  105  	u32 len = 0;
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  106  
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  107  	for (i = 0; i < ARRAY_SIZE(port->devs); i++) {
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  108  		struct airoha_gdm_dev *d = port->devs[i];
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  109  		struct net_device *netdev;
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  110  
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  111  		if (!d)
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  112  			continue;
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  113  
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  114  		netdev = netdev_from_priv(d);
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  115  		if (netif_running(netdev))
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  116  			len = max_t(u32, len, netdev->mtu);
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  117  	}
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  118  	len += VLAN_ETH_HLEN;
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  119  
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  120  	ppe_id = !airoha_is_lan_gdm_dev(dev) && airoha_ppe_is_enabled(eth, 1);
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  121  	index = port->id == AIROHA_GDM4_IDX ? 7 : port->id;
a7c6debfec1738 Lorenzo Bianconi 2026-06-25 @122  	airoha_fe_rmw(eth, REG_PPE_MTU(ppe_id, index),
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  123  		      FP_EGRESS_MTU_MASK(index),
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  124  		      __field_prep(FP_EGRESS_MTU_MASK(index), len));
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  125  }
a7c6debfec1738 Lorenzo Bianconi 2026-06-25  126  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
