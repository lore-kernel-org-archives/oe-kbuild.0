Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A03E373
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Nov 2023 00:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAlyOrNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699663362; x=1731199362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y3DHOXmtOZLTqTVqY8tYZos5hak1ZitmfgTdvH8qdAo=;
  b=CAlyOrNbrzZv4e9KXrbjj83f2wnwFb5qOxzXSf/v/33W/Z8+TidfFp67
   PW8udKRVmtFcsvr3hbjLHTaITBZSgX3e1yksfGPhcHeRuj0lQkBxMO8+n
   MW17eKsBmD3NVSThZ4zc8Q9PEG6ENQ6Uy8gVQEyYV+3lwZpRWzgxCzwyk
   X0A8245sAIpzTE3VXBL7Wmu+W25782/Jedl3qXDAiModdNdVopGL7sssC
   jO+4i2AgsJ5fxehgrdZwvUCc6R7Y0CyKoXGlS9P/YfidaQ2TA8rwe5TFZ
   NBidPpyQaLaA6mnYkHGHK38GnqUMp6linsB6Z3wyI9oW1Dq6NLvsnE/re
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="8896237"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="8896237"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 16:42:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="834255332"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="834255332"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 Nov 2023 16:42:40 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1c57-000A5G-33;
	Sat, 11 Nov 2023 00:42:37 +0000
Date: Sat, 11 Nov 2023 08:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/platform/chrome/chromeos_laptop.c:729:43: sparse: sparse:
 cast to non-scalar
Message-ID: <202311110807.Miqx6My5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/platform/chrome/chromeos_laptop.c:729:43: sparse: sparse: cast to non-scalar"
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac347a0655dbc7d885e217c89dddd16e2800bd58
commit: 52c4d11f1dce60453ab2a75fd7103118cedb2b58 resource: Convert DEFINE_RES_NAMED() to be compound literal
date:   1 year ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year ago
config: i386-randconfig-062-20230909 (https://download.01.org/0day-ci/archive/20231111/202311110807.Miqx6My5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110807.Miqx6My5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311110807.Miqx6My5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/chrome/chromeos_laptop.c:729:43: sparse: sparse: cast to non-scalar
>> drivers/platform/chrome/chromeos_laptop.c:729:43: sparse: sparse: cast from non-scalar

vim +729 drivers/platform/chrome/chromeos_laptop.c

65582920d72d25 Dmitry Torokhov 2018-03-20  719  
c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  720  static int __init chromeos_laptop_setup_irq(struct i2c_peripheral *i2c_dev)
65582920d72d25 Dmitry Torokhov 2018-03-20  721  {
65582920d72d25 Dmitry Torokhov 2018-03-20  722  	int irq;
65582920d72d25 Dmitry Torokhov 2018-03-20  723  
c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  724  	if (i2c_dev->dmi_name) {
65582920d72d25 Dmitry Torokhov 2018-03-20  725  		irq = chromeos_laptop_get_irq_from_dmi(i2c_dev->dmi_name);
65582920d72d25 Dmitry Torokhov 2018-03-20  726  		if (irq < 0)
c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  727  			return irq;
e6215eeaa23c5d Dmitry Torokhov 2018-03-20  728  
e6215eeaa23c5d Dmitry Torokhov 2018-03-20 @729  		i2c_dev->irq_resource  = (struct resource)
e6215eeaa23c5d Dmitry Torokhov 2018-03-20  730  			DEFINE_RES_NAMED(irq, 1, NULL,
e6215eeaa23c5d Dmitry Torokhov 2018-03-20  731  					 IORESOURCE_IRQ | i2c_dev->irqflags);
e6215eeaa23c5d Dmitry Torokhov 2018-03-20  732  		i2c_dev->board_info.resources = &i2c_dev->irq_resource;
e6215eeaa23c5d Dmitry Torokhov 2018-03-20  733  		i2c_dev->board_info.num_resources = 1;
65582920d72d25 Dmitry Torokhov 2018-03-20  734  	}
65582920d72d25 Dmitry Torokhov 2018-03-20  735  
c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  736  	return 0;
c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  737  }
c0bb0608ec79f8 Dmitry Torokhov 2018-03-20  738  

:::::: The code at line 729 was first introduced by commit
:::::: e6215eeaa23c5d80a72caa91fc80795b9cde038f platform/chrome: chromeos_laptop - rely on I2C to set up interrupt trigger

:::::: TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
:::::: CC: Benson Leung <bleung@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
