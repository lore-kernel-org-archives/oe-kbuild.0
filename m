Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CFE225CA
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Dec 2023 17:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mKYP3jNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703006837; x=1734542837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yah5i7jf8fyJWX/1pja9TKf73LNwMOmExYflI1zubkE=;
  b=mKYP3jNnb5IlD5ivW5sFTC9GT/vybj6cKQ1gnBfhAgEBil2lxhebuMo1
   kd/3dOtLJexNuNJ0yx7inczLLVz7/Fux2uQ1y8NdeGXScYpripo1uDpk5
   R1m30vkfAIeSVt1UbGhHIYxgs0zeG+rzI2K4ht8NVUq0nx2LlyYbwjkqn
   gPTbGK8/hRin5iDC6LO62Z6Vk06GWO2z8QDauerDAVC2is1xQz5Wz96/g
   D36BDPNq3nV1UgozVkpY//81q6JHYmqnpa4Mj3pwNFtyxhykQ1vUf7PLs
   mynkNcaKBIDDqt1yWY5qRhlHLg7hgLlEMTL6C/d+tBhz2EqVNPw3/t0IH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2925861"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="2925861"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 09:27:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="17679093"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Dec 2023 09:27:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFdsA-0005kL-00;
	Tue, 19 Dec 2023 17:27:14 +0000
Date: Wed, 20 Dec 2023 01:26:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/phy/micrel.c:1445:12-13: WARNING opportunity for min()
Message-ID: <202312200116.d7Gqh0jk-lkp@intel.com>
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
TO: Oleksij Rempel <o.rempel@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cf4f94d8e8646803f8fb0facf134b0cd7fb691a
commit: 49011e0c1555dd7a689d0f32fd78c1ecd43e59cd net: phy: micrel: ksz886x/ksz8081: add cabletest support
date:   2 years, 6 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 2 years, 6 months ago
config: x86_64-randconfig-104-20231130 (https://download.01.org/0day-ci/archive/20231220/202312200116.d7Gqh0jk-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312200116.d7Gqh0jk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/phy/micrel.c:1445:12-13: WARNING opportunity for min()

vim +1445 drivers/net/phy/micrel.c

49011e0c1555dd Oleksij Rempel 2021-06-14  1436  
49011e0c1555dd Oleksij Rempel 2021-06-14  1437  static int ksz886x_cable_test_wait_for_completion(struct phy_device *phydev)
49011e0c1555dd Oleksij Rempel 2021-06-14  1438  {
49011e0c1555dd Oleksij Rempel 2021-06-14  1439  	int val, ret;
49011e0c1555dd Oleksij Rempel 2021-06-14  1440  
49011e0c1555dd Oleksij Rempel 2021-06-14  1441  	ret = phy_read_poll_timeout(phydev, KSZ8081_LMD, val,
49011e0c1555dd Oleksij Rempel 2021-06-14  1442  				    !(val & KSZ8081_LMD_ENABLE_TEST),
49011e0c1555dd Oleksij Rempel 2021-06-14  1443  				    30000, 100000, true);
49011e0c1555dd Oleksij Rempel 2021-06-14  1444  
49011e0c1555dd Oleksij Rempel 2021-06-14 @1445  	return ret < 0 ? ret : 0;
49011e0c1555dd Oleksij Rempel 2021-06-14  1446  }
49011e0c1555dd Oleksij Rempel 2021-06-14  1447  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
