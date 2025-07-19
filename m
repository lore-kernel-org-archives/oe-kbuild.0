Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999A61F956
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Jul 2025 18:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752950813; cv=none; b=QrxAX5ZaitwvXfnCQUCKDVEDBtyBm9vMqb+fgw9NZ26s4hCc7pCP3fwdIraePDQeqj9pYcF69z4UWxf1yM7/xAPC+eyI3DJGwhNJ9LJsSVNzs3kDvptky/mKgzrvQa8Pz8oSmQ2h5hB1jAjUtdMkxXazDE04/ebVhayvadAf1H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752950813; c=relaxed/simple;
	bh=m7WosUw1oWMbeCgF/ER7tLaEVHc5t585OcHvDtvqMDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TdHmL3q4tdtVKZd63amg+QL1s/uufzUG5DFr2CNhu4vrI0CLZt1azN6/8HYnjywtAK95fTQ6Ag1EPz0h4Qr7gY2Evo1RPMhVrUT1OrY0Zx0P4t60c/rfURwL1rA8xcWWLBCAZJ7R8yf2+N/YT93gfCcK7Ec1SPcjK8gVCbhuTEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4WLMi+2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4WLMi+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752950812; x=1784486812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m7WosUw1oWMbeCgF/ER7tLaEVHc5t585OcHvDtvqMDM=;
  b=I4WLMi+27+FzFhRQ31K4ZJXD3TbGC6+S97q3l8QBRKRpcSS9RppIrUK/
   m1+16NbVvhmQi1WxDNeFNuGStcIaVu7nv57LsPziBAQ2GYlCCZenD14AJ
   D1LhTAY154kSAseaPF+tkS1IS4tWnjt67VNSym4+tIHpZyIv9hSA1l/1P
   YFkoPPc1UaqSQCgVye6egEEBP9u+XpyKFs4stSwVpjRk6EgTDMu22DPPl
   CugTlKrSU3lpJEoybjb85x09+30vagpHk4Q9/Ohz3Fok/sXFAQPElhft4
   jKmCUEOeicKxaWdBkgT5S8pk3sA0fsThLI4E2vOYkTNkUXROxYtFrV1lU
   g==;
X-CSE-ConnectionGUID: 2rKYCEwSQGuq5h51uxIAUw==
X-CSE-MsgGUID: Tod6cnV4Sbeh7rG44OnyUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="65476931"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="65476931"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 11:46:51 -0700
X-CSE-ConnectionGUID: AkN6rjl0TPm9uetXX0gsKA==
X-CSE-MsgGUID: kRbeu+BoTq+Vx7dNYP+Eyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="158584398"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jul 2025 11:46:50 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udCa7-000FiX-2K;
	Sat, 19 Jul 2025 18:46:47 +0000
Date: Sun, 20 Jul 2025 02:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] net: phy: Fix premature resume by a PHY driver
Message-ID: <202507200229.iOChX4Rp-lkp@intel.com>
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
In-Reply-To: <20250718-phy_resume-v1-1-9c6b59580bee@gmail.com>
References: <20250718-phy_resume-v1-1-9c6b59580bee@gmail.com>
TO: Abid Ali <dev.nuvorolabs@gmail.com>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Heiner Kallweit <hkallweit1@gmail.com>
TO: Russell King <linux@armlinux.org.uk>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
CC: linux-kernel@vger.kernel.org
CC: Abid Ali <dev.nuvorolabs@gmail.com>

Hi Abid,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 347e9f5043c89695b01e66b3ed111755afcf1911]

url:    https://github.com/intel-lab-lkp/linux/commits/Abid-Ali/net-phy-Fix-premature-resume-by-a-PHY-driver/20250718-234858
base:   347e9f5043c89695b01e66b3ed111755afcf1911
patch link:    https://lore.kernel.org/r/20250718-phy_resume-v1-1-9c6b59580bee%40gmail.com
patch subject: [PATCH] net: phy: Fix premature resume by a PHY driver
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: sparc-randconfig-r071-20250719 (https://download.01.org/0day-ci/archive/20250720/202507200229.iOChX4Rp-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507200229.iOChX4Rp-lkp@intel.com/

smatch warnings:
drivers/net/phy/phy_device.c:1852 __phy_resume() error: we previously assumed 'phydrv->resume' could be null (see line 1849)

vim +1852 drivers/net/phy/phy_device.c

481b5d938b4a60 Sebastian Hesselbarth 2013-12-13  1841  
9c2c2e62df3fa3 Andrew Lunn           2018-02-27  1842  int __phy_resume(struct phy_device *phydev)
481b5d938b4a60 Sebastian Hesselbarth 2013-12-13  1843  {
0bd199fd9c19aa Russell King (Oracle  2024-02-02  1844) 	const struct phy_driver *phydrv = phydev->drv;
8a8f8281e7e7a8 Heiner Kallweit       2020-03-26  1845  	int ret;
481b5d938b4a60 Sebastian Hesselbarth 2013-12-13  1846  
e6e918d4eb93f4 Heiner Kallweit       2021-01-06  1847  	lockdep_assert_held(&phydev->lock);
f5e64032a799d4 Russell King          2017-12-12  1848  
9421d84b1b3e16 Abid Ali              2025-07-18 @1849  	if (!phydrv || !phydrv->resume && phydev->suspended)
8a8f8281e7e7a8 Heiner Kallweit       2020-03-26  1850  		return 0;
8a477a6fb6a336 Florian Fainelli      2015-01-26  1851  
8a8f8281e7e7a8 Heiner Kallweit       2020-03-26 @1852  	ret = phydrv->resume(phydev);
8a8f8281e7e7a8 Heiner Kallweit       2020-03-26  1853  	if (!ret)
8a477a6fb6a336 Florian Fainelli      2015-01-26  1854  		phydev->suspended = false;
8a477a6fb6a336 Florian Fainelli      2015-01-26  1855  
8a477a6fb6a336 Florian Fainelli      2015-01-26  1856  	return ret;
481b5d938b4a60 Sebastian Hesselbarth 2013-12-13  1857  }
9c2c2e62df3fa3 Andrew Lunn           2018-02-27  1858  EXPORT_SYMBOL(__phy_resume);
9c2c2e62df3fa3 Andrew Lunn           2018-02-27  1859  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
