Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9C610E1
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Aug 2023 06:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691647264; x=1723183264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=63ZVXwTCu3L98PUL4RtNH2syW5HMXh0bdn7JxqGgnhM=;
  b=gRXJrAaj5p0C/3oZIaPGWyqcTGrI0LpFfZ2vDAbuHhenwi3pcPkBWPum
   kxNcZCtR77pDgIsq4DYPHo3hkvt2WCHHO/RGpU+VDaBeJm0CEGV1DXsMc
   8NuHjw3xvcDeUvC4XZjSY+S4pe2hxeXJJRLiiXup+01Pn9YSpPyhP5clf
   xq1sLSI3GxBk3ECC/DWDDxqemQ/Ryhu47bDKAiyPxA9dM1tE83FysIHDU
   So4RapIm3pDcKP3gIWbeDKXhe3ucQl+xELBCgCJYpcyFbtM8LDhJmd3Tm
   ZO0UZGHqn4KN5TYpXFv1v84g2+wajOqT+EDTJjkDfWT1GObqBO3NCEPoj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="402265154"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="402265154"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 23:01:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="681966350"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="681966350"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Aug 2023 23:01:01 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTyjF-0006me-03;
	Thu, 10 Aug 2023 06:01:01 +0000
Date: Thu, 10 Aug 2023 14:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 6/6] regulator: pca9450: register restart handlers
Message-ID: <202308101359.c7lYeLGV-lkp@intel.com>
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
In-Reply-To: <20230809-pca9450-reboot-v2-6-b98b4f8139d5@skidata.com>
References: <20230809-pca9450-reboot-v2-6-b98b4f8139d5@skidata.com>
TO: Benjamin Bara <bbara93@gmail.com>
TO: Lee Jones <lee@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Tony Lindgren <tony@atomide.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Dmitry Osipenko <dmitry.osipenko@collabora.com>
TO: peng.fan@oss.nxp.com
TO: rafael.j.wysocki@intel.com
TO: Jerome Neanne <jneanne@baylibre.com>
CC: linux-kernel@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-omap@vger.kernel.org
CC: Benjamin Bara <benjamin.bara@skidata.com>

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 21ef7b1e17d039053edaeaf41142423810572741]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Bara/kernel-reboot-distinguish-between-cold-and-warm/20230810-032740
base:   21ef7b1e17d039053edaeaf41142423810572741
patch link:    https://lore.kernel.org/r/20230809-pca9450-reboot-v2-6-b98b4f8139d5%40skidata.com
patch subject: [PATCH v2 6/6] regulator: pca9450: register restart handlers
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arc-randconfig-r043-20230809 (https://download.01.org/0day-ci/archive/20230810/202308101359.c7lYeLGV-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101359.c7lYeLGV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308101359.c7lYeLGV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/regulator/pca9450-regulator.c:255:43: warning: 'struct sys_off_data' declared inside parameter list will not be visible outside of this definition or declaration
     255 | static int pca9450_restart_handler(struct sys_off_data *data)
         |                                           ^~~~~~~~~~~~
   drivers/regulator/pca9450-regulator.c: In function 'pca9450_restart_handler':
>> drivers/regulator/pca9450-regulator.c:257:48: error: invalid use of undefined type 'struct sys_off_data'
     257 |         int (*handler)(struct pca9450 *) = data->cb_data;
         |                                                ^~
   drivers/regulator/pca9450-regulator.c:258:54: error: invalid use of undefined type 'struct sys_off_data'
     258 |         struct pca9450 *pca9450 = dev_to_pca9450(data->dev);
         |                                                      ^~
   drivers/regulator/pca9450-regulator.c: In function 'pca9450_i2c_probe':
>> drivers/regulator/pca9450-regulator.c:889:15: error: implicit declaration of function 'devm_register_cold_restart_handler' [-Werror=implicit-function-declaration]
     889 |         ret = devm_register_cold_restart_handler(pca9450->dev,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/regulator/pca9450-regulator.c:898:15: error: implicit declaration of function 'devm_register_warm_restart_handler' [-Werror=implicit-function-declaration]
     898 |         ret = devm_register_warm_restart_handler(pca9450->dev,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +257 drivers/regulator/pca9450-regulator.c

d5856c66c005da Benjamin Bara 2023-08-09  254  
d5856c66c005da Benjamin Bara 2023-08-09 @255  static int pca9450_restart_handler(struct sys_off_data *data)
d5856c66c005da Benjamin Bara 2023-08-09  256  {
d5856c66c005da Benjamin Bara 2023-08-09 @257  	int (*handler)(struct pca9450 *) = data->cb_data;
d5856c66c005da Benjamin Bara 2023-08-09 @258  	struct pca9450 *pca9450 = dev_to_pca9450(data->dev);
d5856c66c005da Benjamin Bara 2023-08-09  259  
d5856c66c005da Benjamin Bara 2023-08-09  260  	return handler(pca9450);
d5856c66c005da Benjamin Bara 2023-08-09  261  }
d5856c66c005da Benjamin Bara 2023-08-09  262  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
