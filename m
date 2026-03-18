Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFC91E5B7B
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 00:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773794586; cv=none; b=AsfGlQQMD/PPuZb/h3PH3G9DAgS7vzS9cVjm3HtVCmEzZU7skDL0gozUmsUf8AHKrUqHaObtaSPh/zV/a6wmTboOiJjATrrgdPq37q684V2bUgdh1WObYJ1KgFh3A7ggoTcsTOHx2ymT5z526y2NgwgzRW8SsZziX3G5CeRMFgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773794586; c=relaxed/simple;
	bh=19Bj1jWUREjtfw17NkMuNUAD4obkrpw22z4u1eJ1LWE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u18lzW69A5DTBINFPsfgUbI9jmEp4BrlhMovxmYiSM36a+h7bMamKiPAvX0N+cdJkVXs6hWXWgxN8X3E/mxT+WMT+DfNH+ikp0/6TMJp00V9lJprOj40HlPzqG70DuFtZ5grl6MqVQQrNicRi7C/zDWdscVY2a7WJotdrRbGZjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=joVKpTEP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joVKpTEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773794584; x=1805330584;
  h=date:from:to:cc:subject:message-id;
  bh=19Bj1jWUREjtfw17NkMuNUAD4obkrpw22z4u1eJ1LWE=;
  b=joVKpTEPtwa5GTQbDI98FkdiEfWglIxy74Jwh24hyMMvQMyHVL8mzkLg
   cZZW/OWR0ySUWaNwJfC1QK8RMdwU32D5Yo5smaKnimny8HsaTORbGKhnO
   EFmDOPvWqel5ENsdb5uw3+l49FOjr/7V37b2BHuH+IPK5xhYrtnzzhUdm
   BLqxjJuta2WLbqpxVlTQ0Rm4C4N3Tz2ihJHx8ejTAXSwwsOIy7lBCYwWE
   +CZ2OXto4T9JFqVwXpCSmzwrs6pEQD+MZHMDGQ8UG0b7prw1PRlzT8nby
   ultGd32afpQZflnTOITBIkBVx/Naax2Jy9joOJYMxSEi8L4rYYEYk9P8P
   w==;
X-CSE-ConnectionGUID: 2nCPXOKoQBS/OyLIPEMSXg==
X-CSE-MsgGUID: Zkx8bn2oRuWACukBqHYj+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85157263"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85157263"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 17:43:00 -0700
X-CSE-ConnectionGUID: MLkdEd0CTvKZl+xGgVCmzQ==
X-CSE-MsgGUID: GOlx1D9UStyvpEVq4MbjZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="260334251"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Mar 2026 17:43:00 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2ezw-000000002Fj-3Afc;
	Wed, 18 Mar 2026 00:42:56 +0000
Date: Wed, 18 Mar 2026 08:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/phy/mdio_bus_provider.c:86:1-33: WARNING:
 Function "for_each_available_child_of_node" should have of_node_put() before
 return around line 116.
Message-ID: <202603180818.852rfwYl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Heiner Kallweit <hkallweit1@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a989fde763f4f24209e4702f50a45be572340e68
commit: a3e1c0ad835702555d90565584ab6f723adf7f94 net: phy: factor out provider part from mdio_bus.c
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: um-randconfig-r062-20260318 (https://download.01.org/0day-ci/archive/20260318/202603180818.852rfwYl-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603180818.852rfwYl-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/phy/mdio_bus_provider.c:86:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before return around line 116.

vim +/for_each_available_child_of_node +86 drivers/net/phy/mdio_bus_provider.c

a3e1c0ad8357025 Heiner Kallweit 2025-04-29   72  
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   73  #if IS_ENABLED(CONFIG_OF_MDIO)
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   74  /* Walk the list of subnodes of a mdio bus and look for a node that
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   75   * matches the mdio device's address with its 'reg' property. If
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   76   * found, set the of_node pointer for the mdio device. This allows
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   77   * auto-probed phy devices to be supplied with information passed in
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   78   * via DT.
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   79   * If a PHY package is found, PHY is searched also there.
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   80   */
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   81  static int of_mdiobus_find_phy(struct device *dev, struct mdio_device *mdiodev,
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   82  			       struct device_node *np)
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   83  {
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   84  	struct device_node *child;
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   85  
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  @86  	for_each_available_child_of_node(np, child) {
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   87  		int addr;
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   88  
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   89  		if (of_node_name_eq(child, "ethernet-phy-package")) {
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   90  			/* Validate PHY package reg presence */
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   91  			if (!of_property_present(child, "reg")) {
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   92  				of_node_put(child);
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   93  				return -EINVAL;
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   94  			}
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   95  
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   96  			if (!of_mdiobus_find_phy(dev, mdiodev, child)) {
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   97  				/* The refcount for the PHY package will be
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   98  				 * incremented later when PHY join the Package.
a3e1c0ad8357025 Heiner Kallweit 2025-04-29   99  				 */
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  100  				of_node_put(child);
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  101  				return 0;
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  102  			}
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  103  
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  104  			continue;
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  105  		}
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  106  
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  107  		addr = of_mdio_parse_addr(dev, child);
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  108  		if (addr < 0)
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  109  			continue;
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  110  
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  111  		if (addr == mdiodev->addr) {
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  112  			device_set_node(dev, of_fwnode_handle(child));
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  113  			/* The refcount on "child" is passed to the mdio
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  114  			 * device. Do _not_ use of_node_put(child) here.
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  115  			 */
a3e1c0ad8357025 Heiner Kallweit 2025-04-29 @116  			return 0;
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  117  		}
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  118  	}
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  119  
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  120  	return -ENODEV;
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  121  }
a3e1c0ad8357025 Heiner Kallweit 2025-04-29  122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
