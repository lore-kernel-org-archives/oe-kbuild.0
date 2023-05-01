Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874B8362
	for <oe-kbuild@lists.linux.dev>; Mon,  1 May 2023 00:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682901594; x=1714437594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KOAv5mOLVWXPBeWDrykRP+QtNOU2bQLMn4ASABhmVjw=;
  b=WIUU+++EDLD7H1DXcxziX8YgfziQ8rfPqJIDPC6Yc6T/iisgeIlAeBdU
   wWlaE9fa27E5m155iDG9Oa31QmGonrXxngbT8MyqLIhZEIx0nn1rknNLf
   8pgiH4v50M8KmZGUWK8AUC0NRYxHYEXaPPEBEsNX06t+J4mFcKkGjcFo8
   XrBcXZ5r4pWT+XAZcg5DNuPJOWJx6D3iZSNZX9bo+DXtXgrqo5fQuQIlL
   /wCcSqqPPnHeWljGTLMDCKntkb/2RBK5jLslF1d0sKgOQd3iK+l2+r99y
   qXMO8Zch1KCqp78qK1X5zrHetYSDoauVWVb/btqnFaHcODdqscOnwrovj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="327697571"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="327697571"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 17:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="695627903"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="695627903"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Apr 2023 17:39:52 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptHa3-0000D7-34;
	Mon, 01 May 2023 00:39:51 +0000
Date: Mon, 1 May 2023 08:38:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 323/382]
 drivers/spi/spi-cadence-quadspi.c:747:23-25: WARNING opportunity for max()
Message-ID: <202305010847.l8LAnuss-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Pratyush Yadav <p.yadav@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   5b69be59af422fe55a3cee133b337b1027cb98c3
commit: 4535fc8cd288f5c537ff9b8abe0e3131a0ebcc98 [323/382] spi: cadence-qspi: Tune PHY to allow running at higher frequencies
:::::: branch date: 2 days ago
:::::: commit date: 9 days ago
config: openrisc-randconfig-c024-20230430 (https://download.01.org/0day-ci/archive/20230501/202305010847.l8LAnuss-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202305010847.l8LAnuss-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-cadence-quadspi.c:747:23-25: WARNING opportunity for max()
>> drivers/spi/spi-cadence-quadspi.c:726:22-24: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
