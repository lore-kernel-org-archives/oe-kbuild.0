Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4547B4052D9
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 23:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790378135; cv=none; b=s9GndU6xgkbcJjjnelbbqirhWy00kaUfJLT6Mg+Up1DBjD9zWFU+je4N9o1dSjKJQAtjqZS/hegZLH8ja2uvkCrPgHDaOfvS7JWnCQcCuIKxVx2+MllsA3iQebIs6/UGI3d1S1+43bJr3gB09vf0uITpYed+kYxEfRAcYwzk9t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790378135; c=relaxed/simple;
	bh=9V6LA0IRBiSsjczq7i5cWYUqqkuXj9NmZ0IrboWHEHA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VvqyRBjUcgFJoyxrA1kW+estQDwcxVr1Q2w0CF3SjAv+LcbGddzvl4C0svXeLVMWi/YXZ6X5WPpt0sn9FWp1zwKJgFYj1hWsQ2of6G21h3bpfnw1FPJv7JyBFORiWaUXyG/kB1LHDsqR/2A3vlVFb/+yj0OD8ugIdv82XCUEeYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMHtxDLK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMHtxDLK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790378133; x=1821914133;
  h=date:from:to:cc:subject:message-id;
  bh=9V6LA0IRBiSsjczq7i5cWYUqqkuXj9NmZ0IrboWHEHA=;
  b=XMHtxDLKfuRxUlqi85TM73mspI0hu2Py8AI7ribdBwRIzBnfHbx43iiR
   bZCjNvwCaCC9ynMGoClj9z+CvmRf/7/v2tzsmKIqw7BACGaJLzhHt1vhh
   SkoBc80NlUqWrlcJ1cKDlpECsJIlRrpqbcy0WW+GKwc65odoMBf/BJZwk
   tReUfDtI+WlwsPB9OiUtxbdyN86NUaAclFnXJlR5y4yX3Y2pprT5i5WFJ
   zdJnACjtyXrZnymS+49fHJFAXg3ObS6RHzTxw/Tq0EYGDRteKU4UezlqR
   /QOFILl01zQGqRYXQ9HBcCl6kByDGunz1nD6imx88LIb3v1O4ohkkQPOV
   A==;
X-CSE-ConnectionGUID: dv7SRh/gRx+URcH7KYY5fg==
X-CSE-MsgGUID: Q5oRmh1uSMalLUH5apHH7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="93664491"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="93664491"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 16:15:32 -0700
X-CSE-ConnectionGUID: z0oxU92zS6qSyuEPZ71i4g==
X-CSE-MsgGUID: m5Wa8+oLTPScR09ozMNPSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="270934117"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Sep 2026 16:15:32 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAF8b-0000000004x-13eY;
	Fri, 25 Sep 2026 23:15:29 +0000
Date: Sat, 26 Sep 2026 01:15:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [frank-w-bpi-r2-4.14:7.2-main 214/214]
 drivers/net/phy/phylink.c:1025:32-35: ERROR: invalid reference to the index
 variable of the iterator on line 1014
Message-ID: <202609260150.wTZzwNdt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   27e8d41a42f73cb2b271df0e897e25224889f6d0
commit: 03111cb5f23ecc86efdd30c2db5455161c6875c6 [214/214] net: phylink: introduce internal phylink PCS handling
:::::: branch date: 5 days ago
:::::: commit date: 4 weeks ago
config: sparc64-randconfig-r2104-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260150.wTZzwNdt-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609260150.wTZzwNdt-lkp@intel.com/

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
03111cb5f23ecc Christian Marangi     2025-03-31  1007  	bool pcs_found = false;
df874f9e52c340 Russell King (Oracle  2024-12-03  1008) 
03111cb5f23ecc Christian Marangi     2025-03-31  1009  	if (pl->mac_ops->mac_select_pcs) {
03111cb5f23ecc Christian Marangi     2025-03-31  1010  		pcs = pl->mac_ops->mac_select_pcs(pl->config,
03111cb5f23ecc Christian Marangi     2025-03-31  1011  						  interface);
03111cb5f23ecc Christian Marangi     2025-03-31  1012  		pcs_found = !!pcs;
03111cb5f23ecc Christian Marangi     2025-03-31  1013  	} else {
03111cb5f23ecc Christian Marangi     2025-03-31 @1014  		list_for_each_entry(pcs, &pl->pcs_list, list) {
03111cb5f23ecc Christian Marangi     2025-03-31  1015  			if (!phylink_validate_pcs_interface(pcs, interface)) {
03111cb5f23ecc Christian Marangi     2025-03-31  1016  				pcs_found = true;
03111cb5f23ecc Christian Marangi     2025-03-31  1017  				break;
03111cb5f23ecc Christian Marangi     2025-03-31  1018  			}
03111cb5f23ecc Christian Marangi     2025-03-31  1019  		}
03111cb5f23ecc Christian Marangi     2025-03-31  1020  	}
df874f9e52c340 Russell King (Oracle  2024-12-03  1021) 
03111cb5f23ecc Christian Marangi     2025-03-31  1022  	if (!pcs_found)
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
