Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B55C23AE
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 04:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674104204; x=1705640204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z3RCMVeaWIKh4w4wuubzGn08Ik4i9/ooRzJvXz789Ks=;
  b=UaYios0SS3pY8tqpSzBLcpHmV8tQAxzsjZKlO9C5sToQ28mjPKC4vzwu
   a3Xm6S2NTZV7gGfkbmWuDKV+A5ERigYoZE2JLeExhGgrX6QYDanQQYedT
   w1dwXBKoxFqPm2pwJBHGuO1qemD86Cujshif61nBJmuYrw6IH5hbG41BR
   /yG2HrzCdwgw2WGZrREYxQ2hdCHWZ2pGDzzr489Fk/8JTX28NucgySVMK
   FoyE32d2qWqJbr5YWS3cU7N8WbH3oh1M/Y815SzuJCMdnahajLO2l9g+o
   UFW8rij//6ByR02QFccuTNBf9OOCfxhvoPLE3PClfg+fIi2Ex2RDHW3uX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323879245"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="323879245"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 20:56:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="988851663"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="988851663"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Jan 2023 20:56:33 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIMyW-00016Q-1P;
	Thu, 19 Jan 2023 04:56:32 +0000
Date: Thu, 19 Jan 2023 12:55:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:5.15/linux 16/16]
 drivers/i2c/busses/i2c-designware-pcidrv.c:75:12: warning: 'dw_reg_write'
 defined but not used
Message-ID: <202301191228.UkOxHkfK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
CC: nanli2x <nanx.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   4e26912f977bc8d60339bfcd56a777a08ded493d
commit: 1ec5959a8f6dbfbb47057317bc935924cd8d6977 [16/16] i2c: Add read and write functions in pcidrv
:::::: branch date: 7 days ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-a013-20230116 (https://download.01.org/0day-ci/archive/20230119/202301191228.UkOxHkfK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/linux-intel-lts/commit/1ec5959a8f6dbfbb47057317bc935924cd8d6977
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.15/linux
        git checkout 1ec5959a8f6dbfbb47057317bc935924cd8d6977
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-designware-pcidrv.c:75:12: warning: 'dw_reg_write' defined but not used [-Wunused-function]
      75 | static int dw_reg_write(struct dw_i2c_dev *dev, unsigned int reg, unsigned int val)
         |            ^~~~~~~~~~~~
>> drivers/i2c/busses/i2c-designware-pcidrv.c:69:12: warning: 'dw_reg_read' defined but not used [-Wunused-function]
      69 | static int dw_reg_read(struct dw_i2c_dev *dev, unsigned int reg, unsigned int *val)
         |            ^~~~~~~~~~~


vim +/dw_reg_write +75 drivers/i2c/busses/i2c-designware-pcidrv.c

fe20ff5c7e9ca7 Dirk Brandewie      2011-10-06  68  
1ec5959a8f6dbf D, Lakshmi Sowjanya 2022-03-03 @69  static int dw_reg_read(struct dw_i2c_dev *dev, unsigned int reg, unsigned int *val)
1ec5959a8f6dbf D, Lakshmi Sowjanya 2022-03-03  70  {
1ec5959a8f6dbf D, Lakshmi Sowjanya 2022-03-03  71  	*val = readl_relaxed(dev->base + reg);
1ec5959a8f6dbf D, Lakshmi Sowjanya 2022-03-03  72  	return 0;
1ec5959a8f6dbf D, Lakshmi Sowjanya 2022-03-03  73  }
1ec5959a8f6dbf D, Lakshmi Sowjanya 2022-03-03  74  
1ec5959a8f6dbf D, Lakshmi Sowjanya 2022-03-03 @75  static int dw_reg_write(struct dw_i2c_dev *dev, unsigned int reg, unsigned int val)
1ec5959a8f6dbf D, Lakshmi Sowjanya 2022-03-03  76  {
1ec5959a8f6dbf D, Lakshmi Sowjanya 2022-03-03  77  	writel_relaxed(val, dev->base + reg);
1ec5959a8f6dbf D, Lakshmi Sowjanya 2022-03-03  78  	return 0;
1ec5959a8f6dbf D, Lakshmi Sowjanya 2022-03-03  79  }
1ec5959a8f6dbf D, Lakshmi Sowjanya 2022-03-03  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
