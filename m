Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC71C372
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jun 2025 17:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750613664; cv=none; b=jLZZlaIfi+FaBkCDnlBh2z0VwPqGNUylxZ0NnoSJMKtMVg/JGLE8DVkZGHjgc4O7SGiFaZdRWwWT+pCti7aqL/lAKmU20a18mTa6Z80DN4AembiyyDuGThTe6ugAZRPsBZ/LM2/n86DV+6ZfsaTAS7ojDt5XVjNjFq6pofUM8N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750613664; c=relaxed/simple;
	bh=8eeXj0WMS0iAgRBd1IE22zOtATf2wo0y9KVoEnmFqj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LETUYtdb79gaWUDZ2lQbh8zYrsJrnNgMfTfmPTIwkmUnWsXjsT/SNMhwiNaIQKmSdmXoWtt4jhJqzlOzMHgdWULZvFA6CHRMMiuxLar3NSaLqzR2EMC9ppTPbQMlhT9C+SzgPhNnfJZlrVfgwncVfNMwtWk9uD0AE65Qq6813nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMyKhIHz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMyKhIHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750613662; x=1782149662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8eeXj0WMS0iAgRBd1IE22zOtATf2wo0y9KVoEnmFqj4=;
  b=WMyKhIHzp9e1zyE8WOrOG+G8vPmIiuS4Z4igIXYdsM9DP8TMhauu+qYq
   5ZY7D8bWRs63GfrhM/nuT6YEvYTyCKpU9/ALVY+K/s4S2Y8TZIgsZdOzg
   0JexE+MmkUVRmESiRWgHTJLa2D5fq9i2GV10R5TqSR/kevsi/rP/1dFmc
   gI7PGlagfRxZclR5d5D7UDuCaLvGiGFonpao5z8INdJlcqFRAVWCPgRiT
   qDHnjyimcKPVmDztJHYBqIRXedDlafVttGM0AYuYTol5+fzeZkoI4eX9m
   6ESnzTF9zlytflgL7+FXNQ5qgOvlLmCzVf0QhbkISdX+2W2BYYE36Sg6Q
   Q==;
X-CSE-ConnectionGUID: kPxFMDAKTPCNZrUbU5SWmg==
X-CSE-MsgGUID: Z+EQhxUXSvmljCgayrnBxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52903571"
X-IronPort-AV: E=Sophos;i="6.16,257,1744095600"; 
   d="scan'208";a="52903571"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 10:34:22 -0700
X-CSE-ConnectionGUID: pleQkgkgR3ajTZWeVlynVg==
X-CSE-MsgGUID: bdYohgizTzCEg7VAIwRLSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,257,1744095600"; 
   d="scan'208";a="151671949"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jun 2025 10:34:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTOa9-000NRO-30;
	Sun, 22 Jun 2025 17:34:17 +0000
Date: Mon, 23 Jun 2025 01:33:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [frank-w-bpi-r2-4.14:6.16-rsslro 39/72]
 drivers/net/phy/phylink.c:997:32-35: ERROR: invalid reference to the index
 variable of the iterator on line 986
Message-ID: <202506230122.a7FHtzuE-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-rsslro
head:   14bf550b65cbf5b2fc136cfa4f48a3475b597d25
commit: 642dd12fdc2ceddc3b419c5733bee809105b5508 [39/72] net: phylink: introduce internal phylink PCS handling
:::::: branch date: 25 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-r051-20250622 (https://download.01.org/0day-ci/archive/20250623/202506230122.a7FHtzuE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506230122.a7FHtzuE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/phy/phylink.c:997:32-35: ERROR: invalid reference to the index variable of the iterator on line 986
   drivers/net/phy/phylink.c:1308:26-29: ERROR: invalid reference to the index variable of the iterator on line 1290
   drivers/net/phy/phylink.c:564:7-10: ERROR: invalid reference to the index variable of the iterator on line 551

vim +997 drivers/net/phy/phylink.c

e9f03a6a879bff Russell King (Oracle  2025-02-10  971) 
df874f9e52c340 Russell King (Oracle  2024-12-03  972) /* Query inband for a specific interface mode, asking the MAC for the
df874f9e52c340 Russell King (Oracle  2024-12-03  973)  * PCS which will be used to handle the interface mode.
df874f9e52c340 Russell King (Oracle  2024-12-03  974)  */
df874f9e52c340 Russell King (Oracle  2024-12-03  975) static unsigned int phylink_inband_caps(struct phylink *pl,
df874f9e52c340 Russell King (Oracle  2024-12-03  976) 					 phy_interface_t interface)
df874f9e52c340 Russell King (Oracle  2024-12-03  977) {
df874f9e52c340 Russell King (Oracle  2024-12-03  978) 	struct phylink_pcs *pcs;
642dd12fdc2ced Christian Marangi     2025-04-07  979  	bool pcs_found = false;
df874f9e52c340 Russell King (Oracle  2024-12-03  980) 
642dd12fdc2ced Christian Marangi     2025-04-07  981  	if (pl->mac_ops->mac_select_pcs) {
642dd12fdc2ced Christian Marangi     2025-04-07  982  		pcs = pl->mac_ops->mac_select_pcs(pl->config,
642dd12fdc2ced Christian Marangi     2025-04-07  983  						  interface);
642dd12fdc2ced Christian Marangi     2025-04-07  984  		pcs_found = !!pcs;
642dd12fdc2ced Christian Marangi     2025-04-07  985  	} else {
642dd12fdc2ced Christian Marangi     2025-04-07 @986  		list_for_each_entry(pcs, &pl->pcs_list, list) {
642dd12fdc2ced Christian Marangi     2025-04-07  987  			if (!phylink_validate_pcs_interface(pcs, interface)) {
642dd12fdc2ced Christian Marangi     2025-04-07  988  				pcs_found = true;
642dd12fdc2ced Christian Marangi     2025-04-07  989  				break;
642dd12fdc2ced Christian Marangi     2025-04-07  990  			}
642dd12fdc2ced Christian Marangi     2025-04-07  991  		}
642dd12fdc2ced Christian Marangi     2025-04-07  992  	}
df874f9e52c340 Russell King (Oracle  2024-12-03  993) 
642dd12fdc2ced Christian Marangi     2025-04-07  994  	if (!pcs_found)
df874f9e52c340 Russell King (Oracle  2024-12-03  995) 		return 0;
df874f9e52c340 Russell King (Oracle  2024-12-03  996) 
df874f9e52c340 Russell King (Oracle  2024-12-03 @997) 	return phylink_pcs_inband_caps(pcs, interface);
df874f9e52c340 Russell King (Oracle  2024-12-03  998) }
df874f9e52c340 Russell King (Oracle  2024-12-03  999) 

:::::: The code at line 997 was first introduced by commit
:::::: df874f9e52c340cc6f0a0014a97b778f67d46849 net: phylink: add pcs_inband_caps() method

:::::: TO: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
