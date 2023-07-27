Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D524827127
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 19:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690484412; x=1722020412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UgczkLwlXxpXnxp2JQ8HEGXSV8WaBz0HlJxi9j1pjfc=;
  b=XoRosqu+/74pGIgPN6SIg+8fu/fUGOyhc0c3wxWSrGe4PhbISozajVzd
   TJEvpQw7mc7NtQOKBbwbe3zlPtCJjMHjg+GkPywyJqLYYPoFk1D1YQCTr
   arIHSdYPPBc/h8exo/zZazldpWWqrbihqo3bPOWRndxmWj48oeo9VR7Zy
   oKJ4eVUXvj56AX6wdmkB3lT/CCzqa11byO9/F3JJCyafnQjbvrYv3ric+
   y4ziaxdvG7mxAhSRKPk10vTpNC2gG5Ob1HLQi/xL+lYoUO1j6BaZDn2gP
   zxExXVgNXaWxXPviGxG0HEJfluyrcQV4Z/Wf9YD1dTbnKISlbqEM5chC1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434695122"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="434695122"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 12:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="1057810872"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="1057810872"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 27 Jul 2023 12:00:10 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP6Da-0002XL-0P;
	Thu, 27 Jul 2023 19:00:10 +0000
Date: Fri, 28 Jul 2023 03:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/6] regulator: pca9450: register restart handlers
Message-ID: <202307280250.eEPtixsy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230727-pca9450-reboot-v1-6-c8edb27bf404@skidata.com>
References: <20230727-pca9450-reboot-v1-6-c8edb27bf404@skidata.com>
TO: Benjamin Bara <bbara93@gmail.com>
TO: Lee Jones <lee@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Tony Lindgren <tony@atomide.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Dmitry Osipenko <dmitry.osipenko@collabora.com>
TO: Robin Gong <yibin.gong@nxp.com>
TO: Jerome Neanne <jneanne@baylibre.com>
CC: linux-kernel@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-omap@vger.kernel.org
CC: Benjamin Bara <benjamin.bara@skidata.com>

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Bara/kernel-reboot-distinguish-between-cold-and-warm/20230727-233435
base:   4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36
patch link:    https://lore.kernel.org/r/20230727-pca9450-reboot-v1-6-c8edb27bf404%40skidata.com
patch subject: [PATCH 6/6] regulator: pca9450: register restart handlers
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230728/202307280250.eEPtixsy-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280250.eEPtixsy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307280250.eEPtixsy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/pca9450-regulator.c:255:43: warning: 'struct sys_off_data' declared inside parameter list will not be visible outside of this definition or declaration
     255 | static int pca9450_restart_handler(struct sys_off_data *data)
         |                                           ^~~~~~~~~~~~
   drivers/regulator/pca9450-regulator.c: In function 'pca9450_restart_handler':
   drivers/regulator/pca9450-regulator.c:257:48: error: invalid use of undefined type 'struct sys_off_data'
     257 |         int (*handler)(struct pca9450 *) = data->cb_data;
         |                                                ^~
   drivers/regulator/pca9450-regulator.c:258:54: error: invalid use of undefined type 'struct sys_off_data'
     258 |         struct pca9450 *pca9450 = dev_to_pca9450(data->dev);
         |                                                      ^~
   drivers/regulator/pca9450-regulator.c: In function 'pca9450_i2c_probe':
   drivers/regulator/pca9450-regulator.c:889:15: error: implicit declaration of function 'devm_register_cold_restart_handler' [-Werror=implicit-function-declaration]
     889 |         ret = devm_register_cold_restart_handler(pca9450->dev,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/pca9450-regulator.c:898:15: error: implicit declaration of function 'devm_register_warm_restart_handler' [-Werror=implicit-function-declaration]
     898 |         ret = devm_register_warm_restart_handler(pca9450->dev,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +255 drivers/regulator/pca9450-regulator.c

fec8096c9c3753 Benjamin Bara 2023-07-27  254  
fec8096c9c3753 Benjamin Bara 2023-07-27 @255  static int pca9450_restart_handler(struct sys_off_data *data)
fec8096c9c3753 Benjamin Bara 2023-07-27  256  {
fec8096c9c3753 Benjamin Bara 2023-07-27  257  	int (*handler)(struct pca9450 *) = data->cb_data;
fec8096c9c3753 Benjamin Bara 2023-07-27  258  	struct pca9450 *pca9450 = dev_to_pca9450(data->dev);
fec8096c9c3753 Benjamin Bara 2023-07-27  259  
fec8096c9c3753 Benjamin Bara 2023-07-27  260  	return handler(pca9450);
fec8096c9c3753 Benjamin Bara 2023-07-27  261  }
fec8096c9c3753 Benjamin Bara 2023-07-27  262  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
