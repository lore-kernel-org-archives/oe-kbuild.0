Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6C671B3A
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Oct 2024 01:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730338670; cv=none; b=kvojtNWxkVqanDrSkFTD9Cp6KfjAatG3L7QUyMRIdECcW7q6LY10FFTsy/dbZsvneusGlIHAxo34R5vBaltMQQS28y0Q/RWAqITvleEsa949bKDI+JoPKsi9GbiVKQRxfxc5x+4Klek6OFK1OzbBMFN6yOinHs27wyLzJfHq0G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730338670; c=relaxed/simple;
	bh=xNnVHyCsUQ0M92w8jg/zdSWiaTWvgZnXiUyIPALNie8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DNkiXz3NiC6AN2F9bjB48kEX8JXTElBVCUQeB+T+SnIsGoOqMyJlvwSvR0yeq7cL5v87/Zwaa9xpAt6vkB7XOf9dV2GJhzqnBadE4KVsIH6ivxuTcmwddc7gEgHOn/YoYSlPk9vLHrGZAOsU6osWYsXeb67y/9fmhEfqKaKzTEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ndgfhs/X; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ndgfhs/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730338667; x=1761874667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xNnVHyCsUQ0M92w8jg/zdSWiaTWvgZnXiUyIPALNie8=;
  b=Ndgfhs/XPeDhYZZUCXx+GBlSwptVtGtbWMF/2d1TOxxnQKwZlahZEQYd
   84Z/tjhsJyvG59Os6TtdoKAo3f7H/JD/wXQm0jynS+AyTwx2SBlMrkGcl
   xYxnfpH1Ar33mGpPJG6UtBk26WyqPyDxbK4Sd2qOSZS/Ru041jPeCbvhX
   TO4k86QT5sm7TMG8JkhBTjRpezMrVtnDMDs7r6UxBllDN2609is23+fga
   P72MNHrLd/6XFZF8OUZabfg6bbZKy9S9fPCqneT2rjqi/j3WZJAUTwHfm
   ONo+6h7MggAdadQxfzta5lnRceyJ7jqBvByQH7dKjKoqD+C163XVxjjt7
   A==;
X-CSE-ConnectionGUID: IMZFL+E9TdaLqneg0ShAGQ==
X-CSE-MsgGUID: tFQZYr1gT3abTk5BM077lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="30170018"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="30170018"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 18:37:46 -0700
X-CSE-ConnectionGUID: 3vSRCwbyTm2g+F7iCoiNKg==
X-CSE-MsgGUID: T/bKT9TEQWKrL8+V8DvQQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="87630243"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Oct 2024 18:37:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6K87-000fVs-06;
	Thu, 31 Oct 2024 01:37:43 +0000
Date: Thu, 31 Oct 2024 09:37:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net] net: phy: dp83869: fix status reporting for
 1000base-x autonegotiation
Message-ID: <202410310949.CLirAHxH-lkp@intel.com>
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
In-Reply-To: <20241029-dp83869-1000base-x-v1-1-fcafe360bd98@bootlin.com>
References: <20241029-dp83869-1000base-x-v1-1-fcafe360bd98@bootlin.com>
TO: Romain Gantois <romain.gantois@bootlin.com>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Heiner Kallweit <hkallweit1@gmail.com>
TO: Russell King <linux@armlinux.org.uk>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Dan Murphy <dmurphy@ti.com>
TO: Florian Fainelli <f.fainelli@gmail.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: linux-kernel@vger.kernel.org
CC: stable@vger.kernel.org
CC: Romain Gantois <romain.gantois@bootlin.com>

Hi Romain,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 94c11e852955b2eef5c4f0b36cfeae7dcf11a759]

url:    https://github.com/intel-lab-lkp/linux/commits/Romain-Gantois/net-phy-dp83869-fix-status-reporting-for-1000base-x-autonegotiation/20241029-173146
base:   94c11e852955b2eef5c4f0b36cfeae7dcf11a759
patch link:    https://lore.kernel.org/r/20241029-dp83869-1000base-x-v1-1-fcafe360bd98%40bootlin.com
patch subject: [PATCH net] net: phy: dp83869: fix status reporting for 1000base-x autonegotiation
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20241031 (https://download.01.org/0day-ci/archive/20241031/202410310949.CLirAHxH-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410310949.CLirAHxH-lkp@intel.com/

smatch warnings:
drivers/net/phy/dp83869.c:206 dp83869_config_aneg() error: uninitialized symbol 'adv'.

vim +/adv +206 drivers/net/phy/dp83869.c

01db923e83779b Dan Murphy     2019-11-13  168  
99f7e4c674a2fd Romain Gantois 2024-10-29  169  static int dp83869_config_aneg(struct phy_device *phydev)
99f7e4c674a2fd Romain Gantois 2024-10-29  170  {
99f7e4c674a2fd Romain Gantois 2024-10-29  171  	struct dp83869_private *dp83869 = phydev->priv;
99f7e4c674a2fd Romain Gantois 2024-10-29  172  	unsigned long *advertising;
99f7e4c674a2fd Romain Gantois 2024-10-29  173  	int err, changed = false;
99f7e4c674a2fd Romain Gantois 2024-10-29  174  	u32 adv;
99f7e4c674a2fd Romain Gantois 2024-10-29  175  
99f7e4c674a2fd Romain Gantois 2024-10-29  176  	if (dp83869->mode != DP83869_RGMII_1000_BASE)
99f7e4c674a2fd Romain Gantois 2024-10-29  177  		return genphy_config_aneg(phydev);
99f7e4c674a2fd Romain Gantois 2024-10-29  178  
99f7e4c674a2fd Romain Gantois 2024-10-29  179  	/* Forcing speed or duplex isn't supported in 1000base-x mode */
99f7e4c674a2fd Romain Gantois 2024-10-29  180  	if (phydev->autoneg != AUTONEG_ENABLE)
99f7e4c674a2fd Romain Gantois 2024-10-29  181  		return 0;
99f7e4c674a2fd Romain Gantois 2024-10-29  182  
99f7e4c674a2fd Romain Gantois 2024-10-29  183  	/* In fiber modes, register locations 0xc0... get mapped to offset 0.
99f7e4c674a2fd Romain Gantois 2024-10-29  184  	 * Unfortunately, the fiber-specific autonegotiation advertisement
99f7e4c674a2fd Romain Gantois 2024-10-29  185  	 * register at address 0xc04 does not have the same bit layout as the
99f7e4c674a2fd Romain Gantois 2024-10-29  186  	 * corresponding standard MII_ADVERTISE register. Thus, functions such
99f7e4c674a2fd Romain Gantois 2024-10-29  187  	 * as genphy_config_advert() will write the advertisement register
99f7e4c674a2fd Romain Gantois 2024-10-29  188  	 * incorrectly.
99f7e4c674a2fd Romain Gantois 2024-10-29  189  	 */
99f7e4c674a2fd Romain Gantois 2024-10-29  190  	advertising = phydev->advertising;
99f7e4c674a2fd Romain Gantois 2024-10-29  191  
99f7e4c674a2fd Romain Gantois 2024-10-29  192  	/* Only allow advertising what this PHY supports */
99f7e4c674a2fd Romain Gantois 2024-10-29  193  	linkmode_and(advertising, advertising,
99f7e4c674a2fd Romain Gantois 2024-10-29  194  		     phydev->supported);
99f7e4c674a2fd Romain Gantois 2024-10-29  195  
99f7e4c674a2fd Romain Gantois 2024-10-29  196  	if (linkmode_test_bit(ETHTOOL_LINK_MODE_1000baseX_Full_BIT, advertising))
99f7e4c674a2fd Romain Gantois 2024-10-29  197  		adv |= DP83869_BP_FULL_DUPLEX;
99f7e4c674a2fd Romain Gantois 2024-10-29  198  	if (linkmode_test_bit(ETHTOOL_LINK_MODE_Pause_BIT, advertising))
99f7e4c674a2fd Romain Gantois 2024-10-29  199  		adv |= DP83869_BP_PAUSE;
99f7e4c674a2fd Romain Gantois 2024-10-29  200  	if (linkmode_test_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, advertising))
99f7e4c674a2fd Romain Gantois 2024-10-29  201  		adv |= DP83869_BP_ASYMMETRIC_PAUSE;
99f7e4c674a2fd Romain Gantois 2024-10-29  202  
99f7e4c674a2fd Romain Gantois 2024-10-29  203  	err = phy_modify_changed(phydev, DP83869_FX_ANADV,
99f7e4c674a2fd Romain Gantois 2024-10-29  204  				 DP83869_BP_FULL_DUPLEX | DP83869_BP_PAUSE |
99f7e4c674a2fd Romain Gantois 2024-10-29  205  				 DP83869_BP_ASYMMETRIC_PAUSE,
99f7e4c674a2fd Romain Gantois 2024-10-29 @206  				 adv);
99f7e4c674a2fd Romain Gantois 2024-10-29  207  
99f7e4c674a2fd Romain Gantois 2024-10-29  208  	if (err < 0)
99f7e4c674a2fd Romain Gantois 2024-10-29  209  		return err;
99f7e4c674a2fd Romain Gantois 2024-10-29  210  	else if (err)
99f7e4c674a2fd Romain Gantois 2024-10-29  211  		changed = true;
99f7e4c674a2fd Romain Gantois 2024-10-29  212  
99f7e4c674a2fd Romain Gantois 2024-10-29  213  	return genphy_check_and_restart_aneg(phydev, changed);
99f7e4c674a2fd Romain Gantois 2024-10-29  214  }
99f7e4c674a2fd Romain Gantois 2024-10-29  215  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
