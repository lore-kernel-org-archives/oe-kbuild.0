Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C451233153
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 20:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742674410; cv=none; b=J/crLnBA8Koh/8Uec1uWUg5b2rmCB1eHBiV+Q2tBCa4IF7BShM7qqMPAaRHKEPq4zSCJhN3P3ErdMfSvM9BIEdQuNCD261xhRof45pu7TfeeLDOkO7qB2ZPKLJ8NsgHofaC5TXCSL3nTdNCdJ31PGJ6dOZ2XDnFCRGCVgoAudMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742674410; c=relaxed/simple;
	bh=uDlbUQ/SdktmzaK7CkGn1tCeL+ba6lK4n3M6weGScfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eiy+DL4R/7YlDrPzfNdYK5d0Vr1RI7M1KZMOvGWOYyzBVt2l1vh7ox7kSYpqzXBoHn9KWBWRAP0qAeIScW1Q532UoOJ7OQq6AB2fm3ceg9zHSNuDoJbIDrtCGcnYMar2G2S6wTy17q/HoXGwKbbZ6a5RQ3DmyS3EfGPNNuHYuII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxFo0M0I; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxFo0M0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742674408; x=1774210408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uDlbUQ/SdktmzaK7CkGn1tCeL+ba6lK4n3M6weGScfY=;
  b=DxFo0M0IGUFjP03HqMRgQPDDmX6WRf5g+rj99tLo7kDrS6/ZsTBropoZ
   tIvkduJFuuty+XA9dwNUJtIsNy5NTaXxWCorFrh4aLr4qSK/iwhecVtRk
   vAUVrLq7bOPKb6t6diH4zfGrzCCJLCNIX7uCrAtXi/F8DNnMd5+UnI7GR
   2C042SBjIyDWXB6REqmXWY/m+Qw1RqI/pRfgQDNmcBwCySswvc5Zr1Con
   f2lj+LKweb0BOIIM9K+xDu+cp7EOwUjNcZpY78jeQNpOrbeyBdC8Px1e+
   YqdMWejVxGXy+UATBqr+6OPWkvFWd+5CHDGWp7WsyCFFVNT6HINtA1Jgt
   g==;
X-CSE-ConnectionGUID: V49b3qPNQxu5P+SMv7FZVg==
X-CSE-MsgGUID: Wflwpab2STC31/ZCimZBHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="44101935"
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="44101935"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 13:13:27 -0700
X-CSE-ConnectionGUID: 6Iv8xMUTT9SiwGuvi/SgjQ==
X-CSE-MsgGUID: VIuwCac7SS+fJIjvACPwSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="123401223"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Mar 2025 13:13:26 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw5Df-0002My-0I;
	Sat, 22 Mar 2025 20:13:23 +0000
Date: Sun, 23 Mar 2025 04:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/usb/misc/onboard_usb_dev_pdevs.c:124:0-1: ERROR: missing
 put_device; call of_find_device_by_node on line 96, but without a
 corresponding object release within this function.
Message-ID: <202503230428.ZqMTz9xf-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Javier Carrasco <javier.carrasco@wolfvision.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   88d324e69ea9f3ae1c1905ea75d717c08bdb8e15
commit: 31e7f6c015d9eb35e77ae9868801c53ab0ff19ac usb: misc: onboard_hub: rename to onboard_dev
date:   12 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r064-20250322 (https://download.01.org/0day-ci/archive/20250323/202503230428.ZqMTz9xf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503230428.ZqMTz9xf-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/usb/misc/onboard_usb_dev_pdevs.c:124:0-1: ERROR: missing put_device; call of_find_device_by_node on line 96, but without a corresponding object release within this function.

vim +124 drivers/usb/misc/onboard_usb_dev_pdevs.c

8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   31  
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   32  /**
31e7f6c015d9eb drivers/usb/misc/onboard_usb_dev_pdevs.c Javier Carrasco   2024-03-25   33   * onboard_dev_create_pdevs -- create platform devices for onboard USB devices
31e7f6c015d9eb drivers/usb/misc/onboard_usb_dev_pdevs.c Javier Carrasco   2024-03-25   34   * @parent_hub	: parent hub to scan for connected onboard devices
31e7f6c015d9eb drivers/usb/misc/onboard_usb_dev_pdevs.c Javier Carrasco   2024-03-25   35   * @pdev_list	: list of onboard platform devices owned by the parent hub
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   36   *
31e7f6c015d9eb drivers/usb/misc/onboard_usb_dev_pdevs.c Javier Carrasco   2024-03-25   37   * Creates a platform device for each supported onboard device that is connected
31e7f6c015d9eb drivers/usb/misc/onboard_usb_dev_pdevs.c Javier Carrasco   2024-03-25   38   * to the given parent hub. The platform device is in charge of initializing the
31e7f6c015d9eb drivers/usb/misc/onboard_usb_dev_pdevs.c Javier Carrasco   2024-03-25   39   * device (enable regulators, take the device out of reset, ...). For onboard
31e7f6c015d9eb drivers/usb/misc/onboard_usb_dev_pdevs.c Javier Carrasco   2024-03-25   40   * hubs, it can optionally control whether the device remains powered during
31e7f6c015d9eb drivers/usb/misc/onboard_usb_dev_pdevs.c Javier Carrasco   2024-03-25   41   * system suspend or not.
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   42   *
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   43   * To keep track of the platform devices they are added to a list that is owned
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   44   * by the parent hub.
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   45   *
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   46   * Some background about the logic in this function, which can be a bit hard
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   47   * to follow:
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   48   *
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   49   * Root hubs don't have dedicated device tree nodes, but use the node of their
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   50   * HCD. The primary and secondary HCD are usually represented by a single DT
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   51   * node. That means the root hubs of the primary and secondary HCD share the
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   52   * same device tree node (the HCD node). As a result this function can be called
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   53   * twice with the same DT node for root hubs. We only want to create a single
31e7f6c015d9eb drivers/usb/misc/onboard_usb_dev_pdevs.c Javier Carrasco   2024-03-25   54   * platform device for each physical onboard device, hence for root hubs the
31e7f6c015d9eb drivers/usb/misc/onboard_usb_dev_pdevs.c Javier Carrasco   2024-03-25   55   * loop is only executed for the root hub of the primary HCD. Since the function
31e7f6c015d9eb drivers/usb/misc/onboard_usb_dev_pdevs.c Javier Carrasco   2024-03-25   56   * scans through all child nodes it still creates pdevs for onboard devices
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   57   * connected to the root hub of the secondary HCD if needed.
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   58   *
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   59   * Further there must be only one platform device for onboard hubs with a peer
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   60   * hub (the hub is a single physical device). To achieve this two measures are
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   61   * taken: pdevs for onboard hubs with a peer are only created when the function
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   62   * is called on behalf of the parent hub that is connected to the primary HCD
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   63   * (directly or through other hubs). For onboard hubs connected to root hubs
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   64   * the function processes the nodes of both peers. A platform device is only
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   65   * created if the peer hub doesn't have one already.
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   66   */
31e7f6c015d9eb drivers/usb/misc/onboard_usb_dev_pdevs.c Javier Carrasco   2024-03-25   67  void onboard_dev_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   68  {
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   69  	int i;
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   70  	struct usb_hcd *hcd = bus_to_hcd(parent_hub->bus);
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   71  	struct device_node *np, *npc;
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   72  	struct platform_device *pdev;
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   73  	struct pdev_list_entry *pdle;
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   74  
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   75  	if (!parent_hub->dev.of_node)
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   76  		return;
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   77  
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   78  	if (!parent_hub->parent && !usb_hcd_is_primary_hcd(hcd))
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   79  		return;
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   80  
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   81  	for (i = 1; i <= parent_hub->maxchild; i++) {
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   82  		np = usb_of_get_device_node(parent_hub, i);
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   83  		if (!np)
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   84  			continue;
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   85  
31e7f6c015d9eb drivers/usb/misc/onboard_usb_dev_pdevs.c Javier Carrasco   2024-03-25   86  		if (!of_is_onboard_usb_dev(np))
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   87  			goto node_put;
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   88  
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   89  		npc = of_parse_phandle(np, "peer-hub", 0);
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   90  		if (npc) {
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   91  			if (!usb_hcd_is_primary_hcd(hcd)) {
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   92  				of_node_put(npc);
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   93  				goto node_put;
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   94  			}
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   95  
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  @96  			pdev = of_find_device_by_node(npc);
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   97  			of_node_put(npc);
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   98  
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30   99  			if (pdev) {
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  100  				put_device(&pdev->dev);
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  101  				goto node_put;
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  102  			}
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  103  		}
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  104  
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  105  		pdev = of_platform_device_create(np, NULL, &parent_hub->dev);
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  106  		if (!pdev) {
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  107  			dev_err(&parent_hub->dev,
31e7f6c015d9eb drivers/usb/misc/onboard_usb_dev_pdevs.c Javier Carrasco   2024-03-25  108  				"failed to create platform device for onboard dev '%pOF'\n", np);
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  109  			goto node_put;
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  110  		}
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  111  
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  112  		pdle = kzalloc(sizeof(*pdle), GFP_KERNEL);
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  113  		if (!pdle) {
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  114  			of_platform_device_destroy(&pdev->dev, NULL);
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  115  			goto node_put;
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  116  		}
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  117  
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  118  		pdle->pdev = pdev;
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  119  		list_add(&pdle->node, pdev_list);
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  120  
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  121  node_put:
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  122  		of_node_put(np);
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  123  	}
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30 @124  }
31e7f6c015d9eb drivers/usb/misc/onboard_usb_dev_pdevs.c Javier Carrasco   2024-03-25  125  EXPORT_SYMBOL_GPL(onboard_dev_create_pdevs);
8bc063641cebf9 drivers/usb/misc/onboard_usb_hub_pdevs.c Matthias Kaehlcke 2022-06-30  126  

:::::: The code at line 124 was first introduced by commit
:::::: 8bc063641cebf9d555e41d135db2b5035b521768 usb: misc: Add onboard_usb_hub driver

:::::: TO: Matthias Kaehlcke <mka@chromium.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
