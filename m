Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DCE21ADCB
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jan 2026 13:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767273163; cv=none; b=gVDcy5uKCMBKNljc4NeQ5HXxcE98r11ON67U5t4ufzDzw9XfywtlEDNpj7VKRk4fTX+LfKkjE6rumKxv2dpkn19M7A1VKIKtA/cL4ApzuDcXeQDClKfqJQL8FIO1oxmFd/StZZrWgs48gG/BD8TS2Nf5JsQScsSMAbavIpyOpr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767273163; c=relaxed/simple;
	bh=KkjEcDqnhRGbbPjLmEGXM4WQKx34q2ER5iLweJfvwYI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bbmfJE0q3KSQrvbGp757Q/9vqv7I6eCmx4ZHGCNJAz+xT9rYzRLznzzkS5JDnTY90KFxDOYk6YLVKFPz12/gUbJPwSF5I4GT0EP+NWcnI11K5rB+m777wKRi1yyE1qcdAvn2qlYRRPVLj3CY+bF0NI/jq7EY8iITZ08MqpyJdgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mkwejVss; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mkwejVss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767273160; x=1798809160;
  h=date:from:to:cc:subject:message-id;
  bh=KkjEcDqnhRGbbPjLmEGXM4WQKx34q2ER5iLweJfvwYI=;
  b=mkwejVssZqjYB99V9bEDzE1RTTQG5itdZywawbVKOxz8yEEFzfFe1eY2
   A/RUUB5QzBgsf/9YacntqSZCjcHH9wvMvAY1J7PoZcS3lw4lK3mfU92jZ
   VZnBY7fjq7N6bDiKUS3lVyRkijQsODpfSPoUGlg+RS3BqlC3jaS1DpqNN
   QclOeTDrTdr8+hh1TyK8L+dg/GRG2E2S7eA6Q5cZsPjvWWtwka8/fQld0
   7ke0pthh7es70+LHq46e8w++CIXCNRKaqzKQ0L01s3WWaQudjWfSR1DJl
   oTZSB75TnGhPIOKbrLPD2vm68jVxuFVx9WR519Dt2MaU5SE2IWrRUJtha
   g==;
X-CSE-ConnectionGUID: ljrWIkWQTW2ZxRZpTFLGYw==
X-CSE-MsgGUID: 9xQgdRnnSYCo9zN1BHTGEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="91462873"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="91462873"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 05:12:40 -0800
X-CSE-ConnectionGUID: U1wsktUZShCP8AoeX05Akw==
X-CSE-MsgGUID: PbtN3DcvQ0Gv0p4V8NxhFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="201388560"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Jan 2026 05:12:39 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbITk-000000001sT-3aEF;
	Thu, 01 Jan 2026 13:12:36 +0000
Date: Thu, 01 Jan 2026 21:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/phy/mdio_bus_provider.c:86:1-33: WARNING:
 Function "for_each_available_child_of_node" should have of_node_put() before
 return around line 116.
Message-ID: <202601012124.lFvGLhZG-lkp@intel.com>
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
head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
commit: a3e1c0ad835702555d90565584ab6f723adf7f94 net: phy: factor out provider part from mdio_bus.c
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: hexagon-randconfig-r053-20251231 (https://download.01.org/0day-ci/archive/20260101/202601012124.lFvGLhZG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 86b9f90b9574b3a7d15d28a91f6316459dcfa046)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601012124.lFvGLhZG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/phy/mdio_bus_provider.c:86:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before return around line 116.

vim +/for_each_available_child_of_node +86 drivers/net/phy/mdio_bus_provider.c

a3e1c0ad835702 Heiner Kallweit 2025-04-29   72  
a3e1c0ad835702 Heiner Kallweit 2025-04-29   73  #if IS_ENABLED(CONFIG_OF_MDIO)
a3e1c0ad835702 Heiner Kallweit 2025-04-29   74  /* Walk the list of subnodes of a mdio bus and look for a node that
a3e1c0ad835702 Heiner Kallweit 2025-04-29   75   * matches the mdio device's address with its 'reg' property. If
a3e1c0ad835702 Heiner Kallweit 2025-04-29   76   * found, set the of_node pointer for the mdio device. This allows
a3e1c0ad835702 Heiner Kallweit 2025-04-29   77   * auto-probed phy devices to be supplied with information passed in
a3e1c0ad835702 Heiner Kallweit 2025-04-29   78   * via DT.
a3e1c0ad835702 Heiner Kallweit 2025-04-29   79   * If a PHY package is found, PHY is searched also there.
a3e1c0ad835702 Heiner Kallweit 2025-04-29   80   */
a3e1c0ad835702 Heiner Kallweit 2025-04-29   81  static int of_mdiobus_find_phy(struct device *dev, struct mdio_device *mdiodev,
a3e1c0ad835702 Heiner Kallweit 2025-04-29   82  			       struct device_node *np)
a3e1c0ad835702 Heiner Kallweit 2025-04-29   83  {
a3e1c0ad835702 Heiner Kallweit 2025-04-29   84  	struct device_node *child;
a3e1c0ad835702 Heiner Kallweit 2025-04-29   85  
a3e1c0ad835702 Heiner Kallweit 2025-04-29  @86  	for_each_available_child_of_node(np, child) {
a3e1c0ad835702 Heiner Kallweit 2025-04-29   87  		int addr;
a3e1c0ad835702 Heiner Kallweit 2025-04-29   88  
a3e1c0ad835702 Heiner Kallweit 2025-04-29   89  		if (of_node_name_eq(child, "ethernet-phy-package")) {
a3e1c0ad835702 Heiner Kallweit 2025-04-29   90  			/* Validate PHY package reg presence */
a3e1c0ad835702 Heiner Kallweit 2025-04-29   91  			if (!of_property_present(child, "reg")) {
a3e1c0ad835702 Heiner Kallweit 2025-04-29   92  				of_node_put(child);
a3e1c0ad835702 Heiner Kallweit 2025-04-29   93  				return -EINVAL;
a3e1c0ad835702 Heiner Kallweit 2025-04-29   94  			}
a3e1c0ad835702 Heiner Kallweit 2025-04-29   95  
a3e1c0ad835702 Heiner Kallweit 2025-04-29   96  			if (!of_mdiobus_find_phy(dev, mdiodev, child)) {
a3e1c0ad835702 Heiner Kallweit 2025-04-29   97  				/* The refcount for the PHY package will be
a3e1c0ad835702 Heiner Kallweit 2025-04-29   98  				 * incremented later when PHY join the Package.
a3e1c0ad835702 Heiner Kallweit 2025-04-29   99  				 */
a3e1c0ad835702 Heiner Kallweit 2025-04-29  100  				of_node_put(child);
a3e1c0ad835702 Heiner Kallweit 2025-04-29  101  				return 0;
a3e1c0ad835702 Heiner Kallweit 2025-04-29  102  			}
a3e1c0ad835702 Heiner Kallweit 2025-04-29  103  
a3e1c0ad835702 Heiner Kallweit 2025-04-29  104  			continue;
a3e1c0ad835702 Heiner Kallweit 2025-04-29  105  		}
a3e1c0ad835702 Heiner Kallweit 2025-04-29  106  
a3e1c0ad835702 Heiner Kallweit 2025-04-29  107  		addr = of_mdio_parse_addr(dev, child);
a3e1c0ad835702 Heiner Kallweit 2025-04-29  108  		if (addr < 0)
a3e1c0ad835702 Heiner Kallweit 2025-04-29  109  			continue;
a3e1c0ad835702 Heiner Kallweit 2025-04-29  110  
a3e1c0ad835702 Heiner Kallweit 2025-04-29  111  		if (addr == mdiodev->addr) {
a3e1c0ad835702 Heiner Kallweit 2025-04-29  112  			device_set_node(dev, of_fwnode_handle(child));
a3e1c0ad835702 Heiner Kallweit 2025-04-29  113  			/* The refcount on "child" is passed to the mdio
a3e1c0ad835702 Heiner Kallweit 2025-04-29  114  			 * device. Do _not_ use of_node_put(child) here.
a3e1c0ad835702 Heiner Kallweit 2025-04-29  115  			 */
a3e1c0ad835702 Heiner Kallweit 2025-04-29 @116  			return 0;
a3e1c0ad835702 Heiner Kallweit 2025-04-29  117  		}
a3e1c0ad835702 Heiner Kallweit 2025-04-29  118  	}
a3e1c0ad835702 Heiner Kallweit 2025-04-29  119  
a3e1c0ad835702 Heiner Kallweit 2025-04-29  120  	return -ENODEV;
a3e1c0ad835702 Heiner Kallweit 2025-04-29  121  }
a3e1c0ad835702 Heiner Kallweit 2025-04-29  122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
