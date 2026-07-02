Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B8523D7E6
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 04:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782968233; cv=none; b=hBK0U+UZyeNCXnSPsFcz79PvTyP8RF6dDPbgLz+rWxnJZVjoSaYj3OK2+kQduYXvXRbFgwvNCboU9zm5XbVWpWhl3+GqJYn90dcGFYy4fqAxj3FDe83kjbtwIsZzELMS0bu/DF5GCHsmVFfICTvNR5fxvhfHz177qRxQSft/Tjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782968233; c=relaxed/simple;
	bh=53KoDp75szsFDxR5auBXuaEHnaiheazl2CHV9Hj70k0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pUgSoSp1+ALm0I/kaa6L914vLD0zkuzDEx8tEjy2W0R/HsHMDSRQcQaLYESZ3tHfPameTklZxvslZQSKQWQpXfRCm1CsQwWWHZrlzOrS8zS6Wa7wWeNISZHC03h1hEyikkjX2bJxPVoYi5h2C032Jzxxy0k6zA6YQTrHYgSNfH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIorvE5t; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIorvE5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782968232; x=1814504232;
  h=date:from:to:cc:subject:message-id;
  bh=53KoDp75szsFDxR5auBXuaEHnaiheazl2CHV9Hj70k0=;
  b=AIorvE5t6NFHJhEEFLFDVoap+7eKe3KSK6KvzNr7PvYqhl3jIbrIZ+Mq
   IrSjbMOLzyzsOApAsTeR4bFzvAwb6t2K0Clv8anJLiXr4D61y88u8791q
   Vsq1+ZtggQ9GLofkFiFLYSo2tJJ4sA7w0m/X9Delp40uqcB4bV2NBTM2V
   Ulf/4FXwchQwQPKoj3nmZXZFmXmT2Z3WQoy5ofs4mKoUGPuBdB2Gm6Atv
   r1Yda+AcT78zAxQkKbUocdtbwtMI9bEVFPM+aR+nYnTd6NOeOGGt5pYyW
   BUW3gbjpL8knxa8H/zavHy2ZyX1UN6yufwsj4HCUKD4kA81kKneruX0rR
   Q==;
X-CSE-ConnectionGUID: 3U4s4NLgQCiHFBU0onzLBQ==
X-CSE-MsgGUID: df5TP5d0SKmwTCz6LnmKQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94308778"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="94308778"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 21:57:11 -0700
X-CSE-ConnectionGUID: HFNmtQeeSqqP5yiRetKMCQ==
X-CSE-MsgGUID: Nq4WAh8fQ2mNP311QWQTLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="277069461"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jul 2026 21:57:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf9U2-000000009zz-3sTo;
	Thu, 02 Jul 2026 04:57:07 +0000
Date: Thu, 02 Jul 2026 12:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1843/2633]
 drivers/net/ethernet/airoha/airoha_ppe.c:122 airoha_ppe_set_xmit_frame_size()
 warn: subtract is higher precedence than shift
Message-ID: <202607021219.DdV9vXcX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f441960e691d37c880d2cc004de06bb5b6bd5e4
commit: a7c6debfec17381329b094bd75560a1e57a5533a [1843/2633] net: airoha: fix max receive size configuration
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
config: sh-randconfig-r072-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021219.DdV9vXcX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607021219.DdV9vXcX-lkp@intel.com/

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
