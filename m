Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E68CA70
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Dec 2023 03:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDVqqLJM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702609708; x=1734145708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TlSMl5up+iWfRhAZkdyxNv4g5foOdlns7QR1xyQ8/Jg=;
  b=HDVqqLJMoWmlpPFDPLJujyE817LehIdBSxfYg2/6XVCvfNrYtjkI2Xb6
   x7xkmyEl+hXxERBobEglHRawvivGw1Vd/svK07FwbUgTdKnXEQoATlQVU
   I+6Q+7CBQTBUmcABL6JYnQCzUxQSSyiLhjfVwtLWxct8P/4YBsd/+nfqp
   CI/sCqLcaqlluij16iiGzeJ2+DXSrtzInhivVnhG2KIWRVEEvNVm9DRgj
   h08owe/PqIUkaze6M/VE/6vMbImRIYNXwgOOyxjNNf3Rl5coTNnTF6tBq
   P46L5Cyc7aHbFLqDPIn656D10T6W9xLVOilaTXgr9DAvl1s11BrqXAte5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="461686439"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="461686439"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 19:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="897989751"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="897989751"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Dec 2023 19:08:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDyYr-000N1h-05;
	Fri, 15 Dec 2023 03:08:25 +0000
Date: Fri, 15 Dec 2023 11:08:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:230:23:
 sparse: sparse: cast to restricted __be32
Message-ID: <202312151110.d3oaWWnG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   976600c6da56c488776c9ee2a5733ae9736e2a75
commit: 7378f1149884b183631c6c16c0f1c62bcd7d759d media: omap2: omapfb: allow building it with COMPILE_TEST
date:   6 years ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 years ago
config: sparc-randconfig-r113-20231112 (https://download.01.org/0day-ci/archive/20231215/202312151110.d3oaWWnG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231215/202312151110.d3oaWWnG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312151110.d3oaWWnG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:230:23: sparse: sparse: cast to restricted __be32
   In file included from drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:24:
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'acx565akm_driver_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1545:1: note: in expansion of macro 'module_exit'
    1545 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/spi/spi.h:293:9: note: in expansion of macro 'module_driver'
     293 |         module_driver(__spi_driver, spi_register_driver, 11-      |         ^~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:913:1: note: in expansion of macro 'module_spi_driver'
     913 | module_spi_driver(acx565akm_driver);
         | ^~~~~~~~~~~~~~~~~
   In file included from include/linux/platform_device.h:14,
                    from drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:25:
   drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:913:19: note: 'cleanup_module' target declared here
     913 | module_spi_driver(acx565akm_driver);
         |                   ^~~~~~~~~~~~~~~~
   include/linux/device.h:1541:20: note: in definition of macro 'module_driver'
    1541 | static void __exit __driver##_exit(void) 22-      |                    ^~~~~~~~
   drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:913:1: note: in expansion of macro 'module_spi_driver'
     913 | module_spi_driver(acx565akm_driver);
         | ^~~~~~~~~~~~~~~~~
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'acx565akm_driver_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1540:1: note: in expansion of macro 'module_init'
    1540 | module_init(__driver##_init); 31-      | ^~~~~~~~~~~
   include/linux/spi/spi.h:293:9: note: in expansion of macro 'module_driver'
     293 |         module_driver(__spi_driver, spi_register_driver, 34-      |         ^~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:913:1: note: in expansion of macro 'module_spi_driver'
     913 | module_spi_driver(acx565akm_driver);
         | ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:913:19: note: 'init_module' target declared here
     913 | module_spi_driver(acx565akm_driver);
         |                   ^~~~~~~~~~~~~~~~
   include/linux/device.h:1536:19: note: in definition of macro 'module_driver'
    1536 | static int __init __driver##_init(void) 43-      |                   ^~~~~~~~
   drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:913:1: note: in expansion of macro 'module_spi_driver'
     913 | module_spi_driver(acx565akm_driver);
         | ^~~~~~~~~~~~~~~~~

vim +230 drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c

f76ee892a99e68 Tomi Valkeinen 2015-12-09  222  
f76ee892a99e68 Tomi Valkeinen 2015-12-09  223  static int panel_enabled(struct panel_drv_data *ddata)
f76ee892a99e68 Tomi Valkeinen 2015-12-09  224  {
f76ee892a99e68 Tomi Valkeinen 2015-12-09  225  	u32 disp_status;
f76ee892a99e68 Tomi Valkeinen 2015-12-09  226  	int enabled;
f76ee892a99e68 Tomi Valkeinen 2015-12-09  227  
f76ee892a99e68 Tomi Valkeinen 2015-12-09  228  	acx565akm_read(ddata, MIPID_CMD_READ_DISP_STATUS,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  229  			(u8 *)&disp_status, 4);
f76ee892a99e68 Tomi Valkeinen 2015-12-09 @230  	disp_status = __be32_to_cpu(disp_status);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  231  	enabled = (disp_status & (1 << 17)) && (disp_status & (1 << 10));
f76ee892a99e68 Tomi Valkeinen 2015-12-09  232  	dev_dbg(&ddata->spi->dev,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  233  		"LCD panel %senabled by bootloader (status 0x%04x)\n",
f76ee892a99e68 Tomi Valkeinen 2015-12-09  234  		enabled ? "" : "not ", disp_status);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  235  	return enabled;
f76ee892a99e68 Tomi Valkeinen 2015-12-09  236  }
f76ee892a99e68 Tomi Valkeinen 2015-12-09  237  

:::::: The code at line 230 was first introduced by commit
:::::: f76ee892a99e68b55402b8d4b8aeffcae2aff34d omapfb: copy omapdss & displays for omapfb

:::::: TO: Tomi Valkeinen <tomi.valkeinen@ti.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
