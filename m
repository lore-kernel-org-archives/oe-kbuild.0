Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C720823A0
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 07:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6W1ONSo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701588773; x=1733124773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fSP2xYSjEYR2qrwqocToS95LZ7zT87nPJs4DjA7fRHk=;
  b=b6W1ONSoCHsN8co/j/EhU+4Xk+cIa7iSYWcE7Beg6Ev8eDTMfGRBJKKr
   FOumCW0p8bezcdod+irwTkUgQUwEh/q/Uh6fiblYSWBq60oDF/AO491We
   RdNXy6xXDtSEFR9wImzebeJymtx7dNUQz8tHssmwI8dJ1aeWrTdZYnC7e
   /AvkYCXw3N7qdQBk4cYjBBipGr0ijxBfCkWIqIqdBdqE48sevuXSTpo6X
   S9yjcC9f9U73f2Q2qV/sEwQINrgQul8g040sK7ifpgWFyyuV3cREITf64
   tjKtekt0iR8QVIhkbZ9VbQeyAdyHlfrtUEoMxnvZNrXg28y4K9+mbYaz5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="397517631"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="397517631"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 23:32:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="799231495"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="799231495"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 02 Dec 2023 23:32:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9gy8-0006PV-2Y;
	Sun, 03 Dec 2023 07:32:48 +0000
Date: Sun, 3 Dec 2023 15:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/phy/micrel.c:1445:12-13: WARNING opportunity for min()
Message-ID: <202312031425.bYktlO47-lkp@intel.com>
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
head:   968f35f4ab1c0966ceb39af3c89f2e24afedf878
commit: 49011e0c1555dd7a689d0f32fd78c1ecd43e59cd net: phy: micrel: ksz886x/ksz8081: add cabletest support
date:   2 years, 6 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 2 years, 6 months ago
config: x86_64-randconfig-104-20231130 (https://download.01.org/0day-ci/archive/20231203/202312031425.bYktlO47-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312031425.bYktlO47-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312031425.bYktlO47-lkp@intel.com/

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
