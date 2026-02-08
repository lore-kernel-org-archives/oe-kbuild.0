Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1658122B8AB
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Feb 2026 17:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770572596; cv=none; b=gpEZ8XohOahEaYwStVVAav0hy/8emg2k1NRZqJYdoTWW6n4wihUaiAGQdtQsyVDNNEnUx1k4wLlZ0TCbbkp0ijNk8f4+9rHkkpb3R7hLwXoCFxNKAr1za3uQnt2szt/fIHvNiKgz+lJLYm6m7SmJPbPEBjhYoNy1SsNjkspnUfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770572596; c=relaxed/simple;
	bh=8JWkfwFY7x1PwQ4BnetBBRyYZHp4iA+SQ8WIo14f+zo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E07znKEjY/K81Xdd1nW6ZUpsn9roq/wql0CTSPs+1SO+1KQBJzfBqNaFfe/ulY4/wrNYDk2z5flcjrTcGSMHX2hbNtbEaWYBFBmdnmznk/0IosTlJPicxWdKg9be20sqLdrNCNgA81m/sfVJ3KrvNoFei2BjbqhOw54gf3m+Mv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fmCEB/as; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fmCEB/as"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770572595; x=1802108595;
  h=date:from:to:cc:subject:message-id;
  bh=8JWkfwFY7x1PwQ4BnetBBRyYZHp4iA+SQ8WIo14f+zo=;
  b=fmCEB/asAcGzdB8ojeAIztuikrThjcgqAIaNr3DcB2AC3w5UUS+EEhD1
   HZyP/EgnWnpLk7AvraJ3l3HefabGlW1TOFWunfyIJm3eDKsuBZTb9tbRn
   r9v9GpM+H6mhTHjJQpPrI8RjAMYrUkbuXgZpjt8GAOydUQTqeoySuEY/u
   M1mnqQFUZGXCMZ2BGpGB/OaZb3wGZoeUsZT7E5PoXDaLSeLYioenH0FQ+
   iXEw72O+7YyLyVGdEe8Yi1VTaNpQg4+huKz/KfxOCD5QRJJL56RTp3cdE
   TyqqwxpW3XsyPkaI1LUVIWpkhoWlCSfn72rKZTbjWqh2UnvghujdoJiW2
   g==;
X-CSE-ConnectionGUID: N3HW8r3bSdeGk04lspDyZQ==
X-CSE-MsgGUID: bTLyK9wMTQ+bjjU0Q1mfog==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="82021999"
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800"; 
   d="scan'208";a="82021999"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 09:43:14 -0800
X-CSE-ConnectionGUID: fbIMh0K3QKCHGFzPk/HIIQ==
X-CSE-MsgGUID: nWefLx9CSKS19Elvrj84jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800"; 
   d="scan'208";a="242011931"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Feb 2026 09:43:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vp8oR-00000000mKi-0mx2;
	Sun, 08 Feb 2026 17:43:11 +0000
Date: Mon, 09 Feb 2026 01:42:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [frank-w-bpi-r2-4.14:6.19-as21_192 144/144]
 drivers/net/phy/phylink.c:1022:32-35: ERROR: invalid reference to the index
 variable of the iterator on line 1011
Message-ID: <202602090100.W0vMAD7F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-as21_192
head:   a16f3f4d09f2d008300fd2068475d5a12c3df8eb
commit: 1b3aeabfc8d801de4b51f4b902d30a50decb31e2 [144/144] net: phylink: introduce internal phylink PCS handling
:::::: branch date: 2 days ago
:::::: commit date: 8 weeks ago
config: csky-randconfig-r053-20260208 (https://download.01.org/0day-ci/archive/20260209/202602090100.W0vMAD7F-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602090100.W0vMAD7F-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/phy/phylink.c:1022:32-35: ERROR: invalid reference to the index variable of the iterator on line 1011
   drivers/net/phy/phylink.c:1342:26-29: ERROR: invalid reference to the index variable of the iterator on line 1324
   drivers/net/phy/phylink.c:580:7-10: ERROR: invalid reference to the index variable of the iterator on line 567

vim +1022 drivers/net/phy/phylink.c

e9f03a6a879bff Russell King (Oracle  2025-02-10   996) 
df874f9e52c340 Russell King (Oracle  2024-12-03   997) /* Query inband for a specific interface mode, asking the MAC for the
df874f9e52c340 Russell King (Oracle  2024-12-03   998)  * PCS which will be used to handle the interface mode.
df874f9e52c340 Russell King (Oracle  2024-12-03   999)  */
df874f9e52c340 Russell King (Oracle  2024-12-03  1000) static unsigned int phylink_inband_caps(struct phylink *pl,
df874f9e52c340 Russell King (Oracle  2024-12-03  1001) 					 phy_interface_t interface)
df874f9e52c340 Russell King (Oracle  2024-12-03  1002) {
df874f9e52c340 Russell King (Oracle  2024-12-03  1003) 	struct phylink_pcs *pcs;
1b3aeabfc8d801 Christian Marangi     2025-04-07  1004  	bool pcs_found = false;
df874f9e52c340 Russell King (Oracle  2024-12-03  1005) 
1b3aeabfc8d801 Christian Marangi     2025-04-07  1006  	if (pl->mac_ops->mac_select_pcs) {
1b3aeabfc8d801 Christian Marangi     2025-04-07  1007  		pcs = pl->mac_ops->mac_select_pcs(pl->config,
1b3aeabfc8d801 Christian Marangi     2025-04-07  1008  						  interface);
1b3aeabfc8d801 Christian Marangi     2025-04-07  1009  		pcs_found = !!pcs;
1b3aeabfc8d801 Christian Marangi     2025-04-07  1010  	} else {
1b3aeabfc8d801 Christian Marangi     2025-04-07 @1011  		list_for_each_entry(pcs, &pl->pcs_list, list) {
1b3aeabfc8d801 Christian Marangi     2025-04-07  1012  			if (!phylink_validate_pcs_interface(pcs, interface)) {
1b3aeabfc8d801 Christian Marangi     2025-04-07  1013  				pcs_found = true;
1b3aeabfc8d801 Christian Marangi     2025-04-07  1014  				break;
1b3aeabfc8d801 Christian Marangi     2025-04-07  1015  			}
1b3aeabfc8d801 Christian Marangi     2025-04-07  1016  		}
1b3aeabfc8d801 Christian Marangi     2025-04-07  1017  	}
df874f9e52c340 Russell King (Oracle  2024-12-03  1018) 
1b3aeabfc8d801 Christian Marangi     2025-04-07  1019  	if (!pcs_found)
df874f9e52c340 Russell King (Oracle  2024-12-03  1020) 		return 0;
df874f9e52c340 Russell King (Oracle  2024-12-03  1021) 
df874f9e52c340 Russell King (Oracle  2024-12-03 @1022) 	return phylink_pcs_inband_caps(pcs, interface);
df874f9e52c340 Russell King (Oracle  2024-12-03  1023) }
df874f9e52c340 Russell King (Oracle  2024-12-03  1024) 

:::::: The code at line 1022 was first introduced by commit
:::::: df874f9e52c340cc6f0a0014a97b778f67d46849 net: phylink: add pcs_inband_caps() method

:::::: TO: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
