Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3041DACA1
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Aug 2025 03:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755920131; cv=none; b=Obe7n9Vli8wqdP0PO0501RHqV9BDQQC2t18NUYPMa9PmaE3YCkB8cj6AaIuvPr7KMd1It8pFoIQXmbPvg8ka6+Vm6eHMIEth7IBIU+yPCnHaKsFX2lszzNuVM2U9MNyo5Ggf+CmtX3K/mc2AqoXoIOtWaEKZbbUoK5iBVG/9mi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755920131; c=relaxed/simple;
	bh=W1q9esUt6XaV168aT2AYmBOCSsXdku6OkV99hMa3gtw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UwuhjM2jjOq8n+gghv93p+qgkaKlGE+GqnOqSQVuXHk29e1sq05R5Rd35HvdEe2f9FgaRIpjMZzzAAbMeUaObKkeXxKw3mX5WHObbCg//hJRhlNk4027ov+NQlffSVTOFHWUWef1aAslQm5Pe9tJJugl3ZbBci8G2RuEZopb29A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtVUp+Wt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtVUp+Wt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755920129; x=1787456129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W1q9esUt6XaV168aT2AYmBOCSsXdku6OkV99hMa3gtw=;
  b=dtVUp+WtvTQ0TMRaAYzWF9T1Eqf9dYBeaNz76VWbfFMdhFuN3+Oe90UC
   jd/O5vSTct/YK0ZjO9PVbDY6UPMlTkG79eCySutpU9ORYQbf8b+9nVG3N
   s5J7U55zRbIkwxPWCHXzt/LDmnSp0lVILjx59zFQl+fY2T6uO5P/x9OTj
   ln0Rkh4YDXccpVKWim9M1OoqKtjnZqhED2mWcKvgHraD98aQBpOofvnLG
   UJ+1ihnnZezA5AkN/L7EgIpOZVU4cm+QCS6H54ErOZnARql6370KOQc7x
   gqFPOCal04gGLAHZYZ+r/9RRAQzrVr4WDvIJDb5YimizhvpBmgMGEB6MO
   Q==;
X-CSE-ConnectionGUID: /3W8bpfkSp+5w4+ClyXpMw==
X-CSE-MsgGUID: 6XQEZt0CTau7MmiBA+CRGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80823776"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="80823776"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 20:35:29 -0700
X-CSE-ConnectionGUID: M1C4T7xLTXyZ+eJZxuZg7Q==
X-CSE-MsgGUID: dQCu1YyvRTWHqkZjLwqudw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168752778"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Aug 2025 20:35:27 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upf2F-000M3Z-1c;
	Sat, 23 Aug 2025 03:35:22 +0000
Date: Sat, 23 Aug 2025 11:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/phy/mdio_bus_provider.c:86:1-33: WARNING: Function
 "for_each_available_child_of_node" should have of_node_put() before return
 around line 116.
Message-ID: <202508231105.HAn6sIUH-lkp@intel.com>
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
TO: Heiner Kallweit <hkallweit1@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6debb69041724bae8a8a4d0ac60502754c1cd945
commit: a3e1c0ad835702555d90565584ab6f723adf7f94 net: phy: factor out provider part from mdio_bus.c
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-051-20250823 (https://download.01.org/0day-ci/archive/20250823/202508231105.HAn6sIUH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202508231105.HAn6sIUH-lkp@intel.com/

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
