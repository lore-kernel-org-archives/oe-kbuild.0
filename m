Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C289C1106
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Sep 2023 01:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694135327; x=1725671327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LShrqn8Zp4kV2qJiw6DOqODz2ZlCb23EeVJG6Vw+4Iw=;
  b=Gh11GP6T2dVYnvFyJxz3forweHPR2rm9mEdczI8VzLA+R7BoNY+0eZuN
   rNeZbLjNxIIry+QI2E1O9k/1Bd8Mqn8WxvAJQxb44O6IXJHTLnCxomlHE
   EVIxlVpuelTmkE9p5pLwMlZJl90dNn+hOfFUbp1y7sGrm2+pwJ1ETclrf
   FGdGZI/22O0VCHpOwMUxPO7zKhfqc7hUMGFqe6oXyVw6/Mc3xbVACLVZ/
   cmDYN5x/2+Zmp3RtrAyCVJ/IJHiZRbtplizQp5Xa428bFISpg7td1cjg8
   B7lsyMgEN0++ItXg9kADzQAstIYv33JJxxwd9AKcWXES4nn2VaKUyXzVR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="376432834"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="376432834"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 18:08:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="807760892"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="807760892"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Sep 2023 18:08:42 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qePzD-0001lo-2k;
	Fri, 08 Sep 2023 01:08:39 +0000
Date: Fri, 8 Sep 2023 09:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c:94
 lan966x_fdma_rx_alloc() warn: passing zero to 'PTR_ERR'
Message-ID: <202309080923.7zDJnHsL-lkp@intel.com>
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
TO: Horatiu Vultur <horatiu.vultur@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ff6e6ded54725cd01623b9a1a86b74a523198733
commit: 11871aba19748b3387e83a2db6360aa7119e9a1a net: lan96x: Use page_pool API
date:   10 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20230907 (https://download.01.org/0day-ci/archive/20230908/202309080923.7zDJnHsL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230908/202309080923.7zDJnHsL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309080923.7zDJnHsL-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c:94 lan966x_fdma_rx_alloc() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +94 drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c

11871aba19748b Horatiu Vultur 2022-11-09   83  
c8349639324a79 Horatiu Vultur 2022-04-08   84  static int lan966x_fdma_rx_alloc(struct lan966x_rx *rx)
c8349639324a79 Horatiu Vultur 2022-04-08   85  {
c8349639324a79 Horatiu Vultur 2022-04-08   86  	struct lan966x *lan966x = rx->lan966x;
c8349639324a79 Horatiu Vultur 2022-04-08   87  	struct lan966x_rx_dcb *dcb;
c8349639324a79 Horatiu Vultur 2022-04-08   88  	struct lan966x_db *db;
c8349639324a79 Horatiu Vultur 2022-04-08   89  	struct page *page;
c8349639324a79 Horatiu Vultur 2022-04-08   90  	int i, j;
c8349639324a79 Horatiu Vultur 2022-04-08   91  	int size;
c8349639324a79 Horatiu Vultur 2022-04-08   92  
11871aba19748b Horatiu Vultur 2022-11-09   93  	if (lan966x_fdma_rx_alloc_page_pool(rx))
11871aba19748b Horatiu Vultur 2022-11-09  @94  		return PTR_ERR(rx->page_pool);
11871aba19748b Horatiu Vultur 2022-11-09   95  
c8349639324a79 Horatiu Vultur 2022-04-08   96  	/* calculate how many pages are needed to allocate the dcbs */
c8349639324a79 Horatiu Vultur 2022-04-08   97  	size = sizeof(struct lan966x_rx_dcb) * FDMA_DCB_MAX;
c8349639324a79 Horatiu Vultur 2022-04-08   98  	size = ALIGN(size, PAGE_SIZE);
c8349639324a79 Horatiu Vultur 2022-04-08   99  
c8349639324a79 Horatiu Vultur 2022-04-08  100  	rx->dcbs = dma_alloc_coherent(lan966x->dev, size, &rx->dma, GFP_KERNEL);
c8349639324a79 Horatiu Vultur 2022-04-08  101  	if (!rx->dcbs)
c8349639324a79 Horatiu Vultur 2022-04-08  102  		return -ENOMEM;
c8349639324a79 Horatiu Vultur 2022-04-08  103  
c8349639324a79 Horatiu Vultur 2022-04-08  104  	rx->last_entry = rx->dcbs;
c8349639324a79 Horatiu Vultur 2022-04-08  105  	rx->db_index = 0;
c8349639324a79 Horatiu Vultur 2022-04-08  106  	rx->dcb_index = 0;
c8349639324a79 Horatiu Vultur 2022-04-08  107  
c8349639324a79 Horatiu Vultur 2022-04-08  108  	/* Now for each dcb allocate the dbs */
c8349639324a79 Horatiu Vultur 2022-04-08  109  	for (i = 0; i < FDMA_DCB_MAX; ++i) {
c8349639324a79 Horatiu Vultur 2022-04-08  110  		dcb = &rx->dcbs[i];
c8349639324a79 Horatiu Vultur 2022-04-08  111  		dcb->info = 0;
c8349639324a79 Horatiu Vultur 2022-04-08  112  
c8349639324a79 Horatiu Vultur 2022-04-08  113  		/* For each db allocate a page and map it to the DB dataptr. */
c8349639324a79 Horatiu Vultur 2022-04-08  114  		for (j = 0; j < FDMA_RX_DCB_MAX_DBS; ++j) {
c8349639324a79 Horatiu Vultur 2022-04-08  115  			db = &dcb->db[j];
c8349639324a79 Horatiu Vultur 2022-04-08  116  			page = lan966x_fdma_rx_alloc_page(rx, db);
c8349639324a79 Horatiu Vultur 2022-04-08  117  			if (!page)
c8349639324a79 Horatiu Vultur 2022-04-08  118  				return -ENOMEM;
c8349639324a79 Horatiu Vultur 2022-04-08  119  
c8349639324a79 Horatiu Vultur 2022-04-08  120  			db->status = 0;
c8349639324a79 Horatiu Vultur 2022-04-08  121  			rx->page[i][j] = page;
c8349639324a79 Horatiu Vultur 2022-04-08  122  		}
c8349639324a79 Horatiu Vultur 2022-04-08  123  
c8349639324a79 Horatiu Vultur 2022-04-08  124  		lan966x_fdma_rx_add_dcb(rx, dcb, rx->dma + sizeof(*dcb) * i);
c8349639324a79 Horatiu Vultur 2022-04-08  125  	}
c8349639324a79 Horatiu Vultur 2022-04-08  126  
c8349639324a79 Horatiu Vultur 2022-04-08  127  	return 0;
c8349639324a79 Horatiu Vultur 2022-04-08  128  }
c8349639324a79 Horatiu Vultur 2022-04-08  129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
