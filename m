Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA9678F2E
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 19:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766432712; cv=none; b=t4eWHY3hhoBiQGNFmn/3i1E5nP6yiMqFlCFRifNkcX+mvJvuYUzzktCVR03OrATDGf7TbR19hk/sRtRvJvtNxuhSBjdvHj/Hhn2OFW/x2tfAlJWKAgVN5zD3rpf9pLRZedELnN8N1IrEKSYtJoc63MnhV+sJnxmMkRrTdszWysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766432712; c=relaxed/simple;
	bh=8Au8ujL7K24vtgrzbjDudD1qHgQCc7m8ePbeJ4ef1Mg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V1QA6KUGqD25WBr+innRh8lR1H6jLKbIC+cV8z95IbTWRZJQrx6Gr32otzNuDwx9bZFykDIH/xlClTTi0giMwEG4pjuPcRtRsGYcwNAQPfFqMjRb2gH/WgAjR1PS7pbwrz33v/wJg/NkQFLTLc2+y9kY4lAPVO6wyOvqEc+Gv7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJj7Fl0K; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJj7Fl0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766432710; x=1797968710;
  h=date:from:to:cc:subject:message-id;
  bh=8Au8ujL7K24vtgrzbjDudD1qHgQCc7m8ePbeJ4ef1Mg=;
  b=TJj7Fl0KoyPw4f4WIIOw5VioGUquL7fGHokN5HUnqFlDJx7rwNeyCKsH
   MUyH7qaZwocW1C7SFX7XO/UZW3fk534e7nF0HZfa1JD6bSjSptyw5iQ74
   nB9idevQKojyO9485kIsc3pX74FVUxV2f5S8u3+KRk04RTHji491ELMqh
   uRJBwDfo0sLsKGHEogiaNUe+Cxf2NqRaBAVroQPZSCFTFlIayd+N6vj8r
   OBSvOgrvA3DEKbmVac5lOvIeQDX75Z4aGWhZQDd3QsMDKBr0nw7PQMlBG
   3SBpomCA063yX2+xQRQXOXZ+ktrfYr91x5DwX1Uj6SlDY9fRLiMKPxkLB
   A==;
X-CSE-ConnectionGUID: FGPUKj3TTa2Nk+0AmKTcUA==
X-CSE-MsgGUID: W1hQyddrTa6m0vm4edb5oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85875492"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="85875492"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 11:45:09 -0800
X-CSE-ConnectionGUID: dUtcyabPTCmYcx2Pte8rpQ==
X-CSE-MsgGUID: PSS2HKiaSSGIykz1fPy0ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="230257374"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Dec 2025 11:45:07 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXlps-0000000013N-1yX5;
	Mon, 22 Dec 2025 19:45:00 +0000
Date: Tue, 23 Dec 2025 03:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [frank-w-bpi-r2-4.14:6.18-main 31/116]
 drivers/net/phy/phylink.c:1019:32-35: ERROR: invalid reference to the index
 variable of the iterator on line 1008
Message-ID: <202512230331.wRJAjIYI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-main
head:   2ddea1cb451c404037683e2c22de667692ea512d
commit: d8b8af61b30a51cc4708d38de50774b228dc3d20 [31/116] net: phylink: introduce internal phylink PCS handling
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-101-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230331.wRJAjIYI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512230331.wRJAjIYI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/phy/phylink.c:1019:32-35: ERROR: invalid reference to the index variable of the iterator on line 1008
   drivers/net/phy/phylink.c:1339:26-29: ERROR: invalid reference to the index variable of the iterator on line 1321
   drivers/net/phy/phylink.c:577:7-10: ERROR: invalid reference to the index variable of the iterator on line 564

vim +1019 drivers/net/phy/phylink.c

e9f03a6a879bff Russell King (Oracle  2025-02-10   993) 
df874f9e52c340 Russell King (Oracle  2024-12-03   994) /* Query inband for a specific interface mode, asking the MAC for the
df874f9e52c340 Russell King (Oracle  2024-12-03   995)  * PCS which will be used to handle the interface mode.
df874f9e52c340 Russell King (Oracle  2024-12-03   996)  */
df874f9e52c340 Russell King (Oracle  2024-12-03   997) static unsigned int phylink_inband_caps(struct phylink *pl,
df874f9e52c340 Russell King (Oracle  2024-12-03   998) 					 phy_interface_t interface)
df874f9e52c340 Russell King (Oracle  2024-12-03   999) {
df874f9e52c340 Russell King (Oracle  2024-12-03  1000) 	struct phylink_pcs *pcs;
d8b8af61b30a51 Christian Marangi     2025-04-07  1001  	bool pcs_found = false;
df874f9e52c340 Russell King (Oracle  2024-12-03  1002) 
d8b8af61b30a51 Christian Marangi     2025-04-07  1003  	if (pl->mac_ops->mac_select_pcs) {
d8b8af61b30a51 Christian Marangi     2025-04-07  1004  		pcs = pl->mac_ops->mac_select_pcs(pl->config,
d8b8af61b30a51 Christian Marangi     2025-04-07  1005  						  interface);
d8b8af61b30a51 Christian Marangi     2025-04-07  1006  		pcs_found = !!pcs;
d8b8af61b30a51 Christian Marangi     2025-04-07  1007  	} else {
d8b8af61b30a51 Christian Marangi     2025-04-07 @1008  		list_for_each_entry(pcs, &pl->pcs_list, list) {
d8b8af61b30a51 Christian Marangi     2025-04-07  1009  			if (!phylink_validate_pcs_interface(pcs, interface)) {
d8b8af61b30a51 Christian Marangi     2025-04-07  1010  				pcs_found = true;
d8b8af61b30a51 Christian Marangi     2025-04-07  1011  				break;
d8b8af61b30a51 Christian Marangi     2025-04-07  1012  			}
d8b8af61b30a51 Christian Marangi     2025-04-07  1013  		}
d8b8af61b30a51 Christian Marangi     2025-04-07  1014  	}
df874f9e52c340 Russell King (Oracle  2024-12-03  1015) 
d8b8af61b30a51 Christian Marangi     2025-04-07  1016  	if (!pcs_found)
df874f9e52c340 Russell King (Oracle  2024-12-03  1017) 		return 0;
df874f9e52c340 Russell King (Oracle  2024-12-03  1018) 
df874f9e52c340 Russell King (Oracle  2024-12-03 @1019) 	return phylink_pcs_inband_caps(pcs, interface);
df874f9e52c340 Russell King (Oracle  2024-12-03  1020) }
df874f9e52c340 Russell King (Oracle  2024-12-03  1021) 

:::::: The code at line 1019 was first introduced by commit
:::::: df874f9e52c340cc6f0a0014a97b778f67d46849 net: phylink: add pcs_inband_caps() method

:::::: TO: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
