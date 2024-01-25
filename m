Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364AE4F61E
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jan 2024 10:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706179417; cv=none; b=qqqUzmgQqMgnwJxsD33OsIWzmEaqP9gE9mi6Az9dplAZE83qheH+gsqnuX9NDFUjD2MUH/H8lCJoZ8M7MWPGe2AXLhBCWU7hAVtpYpWAGr7GJ64JdoH7dEmfUOMAKlmBpAU9a7n6bSVorq40fYg6elyJLOVM2Pf8AS3z9wT/yUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706179417; c=relaxed/simple;
	bh=KLCciiECmKUFOnOkd4O5NH/jZVaFK9S3c4MbmQvC9lk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BGpi9ze22dPWYyCmbczIHiyqWFVBjnr7naBmGMK+HqrudsPfXBsQyjlMP/XjVwrxzxzj4b0/jxAqgZ17UMGhryykN+Hqjobot12Xa/XrMT1GgMl2y7c1FQrsmueNFMPp5SY3sz6eSvw1btZooB4m1t0Gt8hl9CBBykXqsQcnGMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebVV9ZB6; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebVV9ZB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706179415; x=1737715415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KLCciiECmKUFOnOkd4O5NH/jZVaFK9S3c4MbmQvC9lk=;
  b=ebVV9ZB66z5JcaoT8Ayupfg420iODCFupGqx3X/C22a3quYzHbSxq8aF
   zVh2QpdJ0vXRhjSXcjtKz34Le0mgNyFbAUYyPXYpUvkSWOii90iz0axZZ
   8hgsAdJQHm125O2yhAJ7lX9ZrS+3Egb0QBjJo5ZWKiQZoS1dcSaWoa/rh
   wmeaV+tyTFYAAHczgC+Se5440v2saPQigdVi87bqdTu49ZOPPUe/4rNqA
   S/MTxUr8ic8xhcb09ztzbIv6SEceWAbRLlrq5pWFFhyyPLgipY8Yt1Lm/
   yHi7Yf4IzslbEg4CBGb/4Z1w0b1SgD3Oi9Zz1D2HnRQ4oeBfZolbolOVh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="433281065"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="433281065"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 02:43:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2317624"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Jan 2024 02:43:33 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSxCk-0008ur-1y;
	Thu, 25 Jan 2024 10:43:30 +0000
Date: Thu, 25 Jan 2024 18:42:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/usb/misc/onboard_usb_hub_pdevs.c:122:0-1: ERROR: missing
 put_device; call of_find_device_by_node on line 94, but without a
 corresponding object release within this function.
Message-ID: <202401251839.dwdDFnhs-lkp@intel.com>
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
TO: Matthias Kaehlcke <mka@chromium.org>
CC: Douglas Anderson <dianders@chromium.org>
CC: Ravi Chandra Sadineni <ravisadineni@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6098d87eaf31f48153c984e2adadf14762520a87
commit: 8bc063641cebf9d555e41d135db2b5035b521768 usb: misc: Add onboard_usb_hub driver
date:   1 year, 7 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 1 year, 7 months ago
config: arm-randconfig-r062-20240117 (https://download.01.org/0day-ci/archive/20240125/202401251839.dwdDFnhs-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401251839.dwdDFnhs-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/usb/misc/onboard_usb_hub_pdevs.c:122:0-1: ERROR: missing put_device; call of_find_device_by_node on line 94, but without a corresponding object release within this function.

vim +122 drivers/usb/misc/onboard_usb_hub_pdevs.c

8bc063641cebf9 Matthias Kaehlcke 2022-06-30   30  
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   31  /**
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   32   * onboard_hub_create_pdevs -- create platform devices for onboard USB hubs
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   33   * @parent_hub	: parent hub to scan for connected onboard hubs
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   34   * @pdev_list	: list of onboard hub platform devices owned by the parent hub
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   35   *
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   36   * Creates a platform device for each supported onboard hub that is connected to
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   37   * the given parent hub. The platform device is in charge of initializing the
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   38   * hub (enable regulators, take the hub out of reset, ...) and can optionally
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   39   * control whether the hub remains powered during system suspend or not.
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   40   *
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   41   * To keep track of the platform devices they are added to a list that is owned
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   42   * by the parent hub.
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   43   *
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   44   * Some background about the logic in this function, which can be a bit hard
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   45   * to follow:
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   46   *
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   47   * Root hubs don't have dedicated device tree nodes, but use the node of their
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   48   * HCD. The primary and secondary HCD are usually represented by a single DT
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   49   * node. That means the root hubs of the primary and secondary HCD share the
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   50   * same device tree node (the HCD node). As a result this function can be called
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   51   * twice with the same DT node for root hubs. We only want to create a single
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   52   * platform device for each physical onboard hub, hence for root hubs the loop
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   53   * is only executed for the root hub of the primary HCD. Since the function
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   54   * scans through all child nodes it still creates pdevs for onboard hubs
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   55   * connected to the root hub of the secondary HCD if needed.
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   56   *
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   57   * Further there must be only one platform device for onboard hubs with a peer
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   58   * hub (the hub is a single physical device). To achieve this two measures are
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   59   * taken: pdevs for onboard hubs with a peer are only created when the function
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   60   * is called on behalf of the parent hub that is connected to the primary HCD
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   61   * (directly or through other hubs). For onboard hubs connected to root hubs
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   62   * the function processes the nodes of both peers. A platform device is only
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   63   * created if the peer hub doesn't have one already.
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   64   */
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   65  void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   66  {
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   67  	int i;
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   68  	struct usb_hcd *hcd = bus_to_hcd(parent_hub->bus);
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   69  	struct device_node *np, *npc;
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   70  	struct platform_device *pdev;
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   71  	struct pdev_list_entry *pdle;
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   72  
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   73  	if (!parent_hub->dev.of_node)
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   74  		return;
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   75  
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   76  	if (!parent_hub->parent && !usb_hcd_is_primary_hcd(hcd))
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   77  		return;
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   78  
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   79  	for (i = 1; i <= parent_hub->maxchild; i++) {
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   80  		np = usb_of_get_device_node(parent_hub, i);
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   81  		if (!np)
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   82  			continue;
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   83  
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   84  		if (!of_is_onboard_usb_hub(np))
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   85  			goto node_put;
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   86  
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   87  		npc = of_parse_phandle(np, "peer-hub", 0);
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   88  		if (npc) {
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   89  			if (!usb_hcd_is_primary_hcd(hcd)) {
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   90  				of_node_put(npc);
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   91  				goto node_put;
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   92  			}
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   93  
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  @94  			pdev = of_find_device_by_node(npc);
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   95  			of_node_put(npc);
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   96  
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   97  			if (pdev) {
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   98  				put_device(&pdev->dev);
8bc063641cebf9 Matthias Kaehlcke 2022-06-30   99  				goto node_put;
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  100  			}
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  101  		}
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  102  
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  103  		pdev = of_platform_device_create(np, NULL, &parent_hub->dev);
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  104  		if (!pdev) {
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  105  			dev_err(&parent_hub->dev,
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  106  				"failed to create platform device for onboard hub '%pOF'\n", np);
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  107  			goto node_put;
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  108  		}
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  109  
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  110  		pdle = kzalloc(sizeof(*pdle), GFP_KERNEL);
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  111  		if (!pdle) {
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  112  			of_platform_device_destroy(&pdev->dev, NULL);
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  113  			goto node_put;
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  114  		}
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  115  
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  116  		pdle->pdev = pdev;
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  117  		list_add(&pdle->node, pdev_list);
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  118  
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  119  node_put:
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  120  		of_node_put(np);
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  121  	}
8bc063641cebf9 Matthias Kaehlcke 2022-06-30 @122  }
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  123  EXPORT_SYMBOL_GPL(onboard_hub_create_pdevs);
8bc063641cebf9 Matthias Kaehlcke 2022-06-30  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
