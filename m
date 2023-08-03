Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08778EA0
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Aug 2023 23:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691106477; x=1722642477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=10pGXRVxmbAVLtRlq9nuVKtKGM2JKhWYR5y+EuvXbRY=;
  b=M5PAitJzvvKVogGpO6DT+i+FtdhnllCftVPbCmNR9fCLU/vbpYdX2JVW
   V7L4rkVziBz7mG9Iwlxyb0d5TJ6jf7SRP06k0xwBD/x6+XNRNYbd2xZ/W
   jdsi6Mgo9rgWFItL+OqXjQg5dsS09DSWHLd81pO6TO0f09YG5Lj5Kvx1U
   h7g0LnvDnVhzd4xhdJkQMqNRSRlfjnqslP/sifdYFuYYHBN//2T6kGaQ1
   qIg6Hd21vQfwrXxXziN/tZ4+ckd6XoQdoyLSs5yLRs2NZEeiWgcT2HfV4
   wmWVYzr5JAjZ8u5TMlT+RS3FcTwTL8nwTUtmyRIOhCoB79d2xRb8ezY+c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="456394954"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="456394954"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 16:47:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="976320526"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="976320526"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Aug 2023 16:47:54 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRi2s-0002St-0V;
	Thu, 03 Aug 2023 23:47:54 +0000
Date: Fri, 4 Aug 2023 07:47:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 3368/6910] drivers/net/phy/motorcomm.c:885:12-14:
 WARNING opportunity for min()
Message-ID: <202308040743.xMd2Kipc-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Samin Guo <samin.guo@starfivetech.com>
CC: Hal Feng <hal.feng@starfivetech.com>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fb4327106e5250ee360d0d8b056c1eef7eeb9a98
commit: 7a561e9351ae7e3fb1f08584d40b49c1e55dde60 [3368/6910] net: phy: motorcomm: Add pad drive strength cfg support
:::::: branch date: 19 hours ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-x051-20230730 (https://download.01.org/0day-ci/archive/20230804/202308040743.xMd2Kipc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040743.xMd2Kipc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308040743.xMd2Kipc-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/phy/motorcomm.c:885:12-14: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
