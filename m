Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEFE171C4
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Aug 2023 23:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691536878; x=1723072878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XV7YFsrJ3Xb1pNecvCoyGD/q05UpnDvoJ1IB42alCM4=;
  b=Q3ImBfJ/r03tkjwLOndhJguROsJzuqXoig5bvBOfqADgN2IRUZYx7f0Z
   S+qpdBSbSCmrKDIPcZEdoM6YCBAi3xuQd71kHIZ+sLDomtT0mywFbq0L3
   BXyNVTR5yIWdRiDkWugAPobQP+jI6ySwr3kpbtMWNCQX3fC5MEN/WvOAf
   HXlj+OTwJTYeAO8Moe9mnbdclxVOpujgQYh1EjmF2I/GAyP5xstjneXcT
   AgSDwmDCAv8HFTbeIEolVUlxixyTbWdHTZrYy2nez/G55zmprSbZYu7R/
   wXovioU0vPIYVYDK1UY0mp4VOdBYGESkr4XY52P9I3Ikz8Sqdr4MfOqcA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="437341521"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="437341521"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 16:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="766586694"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="766586694"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Aug 2023 16:21:16 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTW0q-0005fg-06;
	Tue, 08 Aug 2023 23:21:16 +0000
Date: Wed, 9 Aug 2023 07:21:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 7/7] nvmem: core: Expose cells through sysfs
Message-ID: <202308090730.heIvhehR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/nvmem/core.c:2264:1: sparse: sparse: unused label 'del_cells'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230801182132.1058707-8-miquel.raynal@bootlin.com>
References: <20230801182132.1058707-8-miquel.raynal@bootlin.com>
TO: Miquel Raynal <miquel.raynal@bootlin.com>

Hi Miquel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.5-rc5 next-20230808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Raynal/nvmem-core-Create-all-cells-before-adding-the-nvmem-device/20230802-022331
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230801182132.1058707-8-miquel.raynal%40bootlin.com
patch subject: [PATCH v7 7/7] nvmem: core: Expose cells through sysfs
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-x062-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090730.heIvhehR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090730.heIvhehR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308090730.heIvhehR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvmem/core.c:2264:1: sparse: sparse: unused label 'del_cells'
   drivers/nvmem/core.c:83:23: sparse: sparse: symbol 'nvmem_nb' was not declared. Should it be static?

vim +/del_cells +2264 drivers/nvmem/core.c

48c23a411e77cb Miquel Raynal 2023-08-01  2261  
00d059fd6702f0 Miquel Raynal 2023-08-01  2262  	return 0;
00d059fd6702f0 Miquel Raynal 2023-08-01  2263  
48c23a411e77cb Miquel Raynal 2023-08-01 @2264  del_cells:
48c23a411e77cb Miquel Raynal 2023-08-01  2265  	nvmem_device_remove_all_cells(nvmem);
00d059fd6702f0 Miquel Raynal 2023-08-01  2266  put_layout:
00d059fd6702f0 Miquel Raynal 2023-08-01  2267  	nvmem_layout_put(nvmem->layout);
00d059fd6702f0 Miquel Raynal 2023-08-01  2268  	return ret;
00d059fd6702f0 Miquel Raynal 2023-08-01  2269  }
00d059fd6702f0 Miquel Raynal 2023-08-01  2270  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
