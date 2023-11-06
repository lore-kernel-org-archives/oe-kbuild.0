Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACE524214
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8YE6720"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699287223; x=1730823223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GcqR2T7UfR4PuKqo22ozb2KlMiWjJI0pM+oYlUu8UEI=;
  b=f8YE6720vqZ9eGjVK8xKWuQaCG3y+3fEiIzo07+kqpt9+ct4RUWDovTP
   S2V5bUN5dlhaK/b6s//9KNBBOIl29npbIufFojoBQbvhLvDb3OekLYav0
   yBtnbPZd9s90LVDb1U6NmR6BySD+68vc7rALxQyXISnwoO8MnIbDB9QrO
   supQZ5CAX7A6afLb6Waj9Ze6ZMkyOeQ6X+mg8PGNVXLnBmMDdOMCP8vCH
   JB62PfDxswB4jnCASZmaJczZAXR9c2BwZ9qM+hHHMLk5pznaodAjd99Kf
   jd5/GNlq9zBHArlffP4HELAU5ACbzaqYnuLd2DUCQnP4+UN6eQPbMYQZ2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="393203044"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="393203044"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 08:12:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="3504768"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Nov 2023 08:12:13 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r02Cw-0006XU-29;
	Mon, 06 Nov 2023 16:12:10 +0000
Date: Tue, 7 Nov 2023 00:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/phy.h:177:20: warning: '%02x' directive output may be
 truncated writing between 2 and 8 bytes into a region of size between 0 and
 60
Message-ID: <202311062330.Onu8RkLe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/phy.h:177:20: warning: '%02x' directive output may be truncated writing between 2 and 8 bytes into a region of size between 0 and 60 [-Wformat-truncation=]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Florian Fainelli <f.fainelli@gmail.com>

Hi Florian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: 7f7b7574555e2189135098885208821d0acd4850 net: ethernet: broadcom: Drop dependency on OF
date:   5 years ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 years ago
config: x86_64-randconfig-x062-20230716 (https://download.01.org/0day-ci/archive/20231106/202311062330.Onu8RkLe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311062330.Onu8RkLe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311062330.Onu8RkLe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/broadcom/genet/bcmmii.c:20:
   drivers/net/ethernet/broadcom/genet/bcmmii.c: In function 'bcmgenet_mii_pd_init':
>> include/linux/phy.h:177:20: warning: '%02x' directive output may be truncated writing between 2 and 8 bytes into a region of size between 0 and 60 [-Wformat-truncation=]
     177 | #define PHY_ID_FMT "%s:%02x"
         |                    ^~~~~~~~~
   drivers/net/ethernet/broadcom/genet/bcmmii.c:495:53: note: in expansion of macro 'PHY_ID_FMT'
     495 |                 snprintf(phy_name, MII_BUS_ID_SIZE, PHY_ID_FMT,
         |                                                     ^~~~~~~~~~
   include/linux/phy.h:177:24: note: format string is defined here
     177 | #define PHY_ID_FMT "%s:%02x"
         |                        ^~~~
   include/linux/phy.h:177:20: note: using the range [0, 4294967295] for directive argument
     177 | #define PHY_ID_FMT "%s:%02x"
         |                    ^~~~~~~~~
   drivers/net/ethernet/broadcom/genet/bcmmii.c:495:53: note: in expansion of macro 'PHY_ID_FMT'
     495 |                 snprintf(phy_name, MII_BUS_ID_SIZE, PHY_ID_FMT,
         |                                                     ^~~~~~~~~~
   drivers/net/ethernet/broadcom/genet/bcmmii.c:495:17: note: 'snprintf' output between 4 and 70 bytes into a destination of size 61
     495 |                 snprintf(phy_name, MII_BUS_ID_SIZE, PHY_ID_FMT,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     496 |                          mdio_bus_id, pd->phy_address);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/genet/bcmmii.o: warning: objtool: bcmgenet_mii_register()+0x3f4: sibling call from callable instruction with modified stack frame
   drivers/net/ethernet/broadcom/genet/bcmmii.o: warning: objtool: bcmgenet_mii_pd_init()+0x19b: sibling call from callable instruction with modified stack frame
   drivers/net/ethernet/broadcom/genet/bcmmii.o: warning: objtool: bcmgenet_mii_config()+0xc5: sibling call from callable instruction with modified stack frame
   drivers/net/ethernet/broadcom/genet/bcmmii.o: warning: objtool: bcmgenet_mii_probe()+0x23d: sibling call from callable instruction with modified stack frame


vim +177 include/linux/phy.h

00db8189d984d6 Andy Fleming 2005-07-30  175  
a4d00f179fcec7 Kumar Gala   2006-01-11  176  /* Used when trying to connect to a specific phy (mii bus id:phy device id) */
9d9326d3bc0ea9 Andy Fleming 2008-04-09 @177  #define PHY_ID_FMT "%s:%02x"
9d9326d3bc0ea9 Andy Fleming 2008-04-09  178  

:::::: The code at line 177 was first introduced by commit
:::::: 9d9326d3bc0ea9a8bbe40bf3e5e66c7b9858caa0 phy: Change mii_bus id field to a string

:::::: TO: Andy Fleming <afleming@freescale.com>
:::::: CC: Jeff Garzik <jgarzik@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
