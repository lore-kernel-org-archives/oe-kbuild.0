Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB903360ECC
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 06:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782973596; cv=none; b=rZl8UPWeC4f1euXmTyItat46ru0dO1PAGoSdahIvivHzMBtXyHTi+PSNEhlZds4OgiovzrPQjPO8E1MK3ixLqi3OmHIeYfohEJUKjFU0TAQ8aFnZTv6KGeFXzHEAS4PYX4UqpUlq5r3diyKsA5IhInqGSpIn5eqr++wt0rSgLcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782973596; c=relaxed/simple;
	bh=W2u4/efs9NpZZpFpbed9il8ccgQYBMv2k3fojOH5CaI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N718W34FX68YKqEktNzf9IFI42nyYpQnRXkrIe5b8j3/pk0rTDZyR6pOkESlTtuOerFIgr93aZMgiu2C54bPHFGvuTKpUYQcrNr4xR5hRXEgFW26jTspVjtCeFHKku75KWL0UaF0CL5rVhtBYIX2zSgXpzHvJp2OTNpkvMP+uSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hny5l2LO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hny5l2LO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782973594; x=1814509594;
  h=date:from:to:cc:subject:message-id;
  bh=W2u4/efs9NpZZpFpbed9il8ccgQYBMv2k3fojOH5CaI=;
  b=hny5l2LOjexpG5B1oisHsi7gBPwOuewIc7dFRrofzXMKoaYGgC/LzuWJ
   HAAO+sf27je8KpNOHXmYkjUcIBxVUESyMABtfoA4kEPyGGxZP7KC14T8D
   BSm9ioqeY19k//ovlOPnHr7cGzGleBmXaIuOFGBfYke5EKDw2d5uvwk+X
   n7ik+hLAi/nRqcNwBsa/P8wXlWKY1JvVvPzwd/MsiOxdcmSB03B3XMEf7
   VfgcrD/S2M0M4qwsLll4zmKouGe5Ol0pqTkrnOfsWBoGc5RUndRYHdtQN
   o/l5BEoTghu354sydmerrGPsa1T30vXOSBxZqS69PfwKmwGNmz7qtV4b9
   g==;
X-CSE-ConnectionGUID: 1EvXkYcrQmCYWY8FDnUJFQ==
X-CSE-MsgGUID: HTC8KhJsSsuJY4TCoRO0vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="109260836"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="109260836"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 23:26:34 -0700
X-CSE-ConnectionGUID: FzsNHx8QRXGhugr6AE7QRA==
X-CSE-MsgGUID: p8MJxIIdQbu6iykKNRSUTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="252907479"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Jul 2026 23:26:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfAsX-00000000A5j-2xmq;
	Thu, 02 Jul 2026 06:26:29 +0000
Date: Thu, 02 Jul 2026 14:25:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [frank-w-bpi-r2-4.14:7.1-rc 167/167]
 drivers/net/phy/phylink.c:1025:32-35: ERROR: invalid reference to the index
 variable of the iterator on line 1014
Message-ID: <202607021404.U0takawU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   866eb49750d39fe938dca71acece6f1540bb1123
commit: 63189053fa805e75a2a2a3a1f54b9b70cbc4d609 [167/167] net: phylink: introduce internal phylink PCS handling
:::::: branch date: 5 days ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-053-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021404.U0takawU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607021404.U0takawU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/phy/phylink.c:1025:32-35: ERROR: invalid reference to the index variable of the iterator on line 1014
   drivers/net/phy/phylink.c:1345:26-29: ERROR: invalid reference to the index variable of the iterator on line 1327
   drivers/net/phy/phylink.c:583:7-10: ERROR: invalid reference to the index variable of the iterator on line 570

vim +1025 drivers/net/phy/phylink.c

e9f03a6a879bff Russell King (Oracle  2025-02-10   999) 
df874f9e52c340 Russell King (Oracle  2024-12-03  1000) /* Query inband for a specific interface mode, asking the MAC for the
df874f9e52c340 Russell King (Oracle  2024-12-03  1001)  * PCS which will be used to handle the interface mode.
df874f9e52c340 Russell King (Oracle  2024-12-03  1002)  */
df874f9e52c340 Russell King (Oracle  2024-12-03  1003) static unsigned int phylink_inband_caps(struct phylink *pl,
df874f9e52c340 Russell King (Oracle  2024-12-03  1004) 					 phy_interface_t interface)
df874f9e52c340 Russell King (Oracle  2024-12-03  1005) {
df874f9e52c340 Russell King (Oracle  2024-12-03  1006) 	struct phylink_pcs *pcs;
63189053fa805e Christian Marangi     2025-03-31  1007  	bool pcs_found = false;
df874f9e52c340 Russell King (Oracle  2024-12-03  1008) 
63189053fa805e Christian Marangi     2025-03-31  1009  	if (pl->mac_ops->mac_select_pcs) {
63189053fa805e Christian Marangi     2025-03-31  1010  		pcs = pl->mac_ops->mac_select_pcs(pl->config,
63189053fa805e Christian Marangi     2025-03-31  1011  						  interface);
63189053fa805e Christian Marangi     2025-03-31  1012  		pcs_found = !!pcs;
63189053fa805e Christian Marangi     2025-03-31  1013  	} else {
63189053fa805e Christian Marangi     2025-03-31 @1014  		list_for_each_entry(pcs, &pl->pcs_list, list) {
63189053fa805e Christian Marangi     2025-03-31  1015  			if (!phylink_validate_pcs_interface(pcs, interface)) {
63189053fa805e Christian Marangi     2025-03-31  1016  				pcs_found = true;
63189053fa805e Christian Marangi     2025-03-31  1017  				break;
63189053fa805e Christian Marangi     2025-03-31  1018  			}
63189053fa805e Christian Marangi     2025-03-31  1019  		}
63189053fa805e Christian Marangi     2025-03-31  1020  	}
df874f9e52c340 Russell King (Oracle  2024-12-03  1021) 
63189053fa805e Christian Marangi     2025-03-31  1022  	if (!pcs_found)
df874f9e52c340 Russell King (Oracle  2024-12-03  1023) 		return 0;
df874f9e52c340 Russell King (Oracle  2024-12-03  1024) 
df874f9e52c340 Russell King (Oracle  2024-12-03 @1025) 	return phylink_pcs_inband_caps(pcs, interface);
df874f9e52c340 Russell King (Oracle  2024-12-03  1026) }
df874f9e52c340 Russell King (Oracle  2024-12-03  1027) 

:::::: The code at line 1025 was first introduced by commit
:::::: df874f9e52c340cc6f0a0014a97b778f67d46849 net: phylink: add pcs_inband_caps() method

:::::: TO: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
