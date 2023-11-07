Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECD62F50C
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ni7d9CxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699359407; x=1730895407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fhZURibIZ8wG/Kr+/kCeev/dwyuB2H/K7QgymO3NRQs=;
  b=ni7d9CxED8S3B/TnknxsvfpOvifA2VhFq640xE2JHn0uQpaoAPGm+vqT
   D5DwRMhlUt5YBA3CYCU0S1fHirkBmEt7tSY19tuvvJONME1LA+s10DRQs
   XdhWpk59ep63e9rgr1NaaYTpL+ty7pQLFfatOQEbU1zs9mG3nOMtYGYS8
   yZQZP9r5giNw2RH37We54lQv7u39S8+/V+IZh3wd63hkyQQT5rnBdbZ8J
   oeSucBTfc+g1hvAE5gH8zv499VrRegb0d9Et+y9dJ7PtoqaDLxxzknEAO
   vshGtgPKhLobOVZ+YK76M4ziTj0RLBVXo0jbm8LTFDc/LH1wSJVLO4epY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="420603765"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="420603765"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 04:16:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="762683591"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="762683591"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Nov 2023 04:16:43 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0L0b-00075Q-1f;
	Tue, 07 Nov 2023 12:16:41 +0000
Date: Tue, 7 Nov 2023 20:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/video/fbdev/offb.c:373:48: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202311072017.YF8A9yjV-lkp@intel.com>
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
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Helge Deller <deller@gmx.de>

Hi Randy,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
commit: 9d8b5376cc2848ca22314fdec9a7a45b1bf69189 fbdev: make offb driver tristate
date:   11 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 11 months ago
config: powerpc-randconfig-r121-20231107 (https://download.01.org/0day-ci/archive/20231107/202311072017.YF8A9yjV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311072017.YF8A9yjV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311072017.YF8A9yjV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/offb.c:373:48: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __be32 @@     got int @@
   drivers/video/fbdev/offb.c:373:48: sparse:     expected restricted __be32
   drivers/video/fbdev/offb.c:373:48: sparse:     got int
>> drivers/video/fbdev/offb.c:581:42: sparse: sparse: restricted __be32 degrades to integer
>> drivers/video/fbdev/offb.c:602:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int addr_prop @@     got restricted __be32 const [usertype] @@
   drivers/video/fbdev/offb.c:602:27: sparse:     expected unsigned int addr_prop
   drivers/video/fbdev/offb.c:602:27: sparse:     got restricted __be32 const [usertype]

vim +373 drivers/video/fbdev/offb.c

^1da177e4c3f41 drivers/video/offb.c       Linus Torvalds         2005-04-16  322  
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  323  static void offb_init_palette_hacks(struct fb_info *info, struct device_node *dp,
00257e0cc550c4 drivers/video/fbdev/offb.c Rob Herring            2019-01-11  324  				    unsigned long address)
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  325  {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  326  	struct offb_par *par = (struct offb_par *) info->par;
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  327  
00257e0cc550c4 drivers/video/fbdev/offb.c Rob Herring            2019-01-11  328  	if (of_node_name_prefix(dp, "ATY,Rage128")) {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  329  		par->cmap_adr = offb_map_reg(dp, 2, 0, 0x1fff);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  330  		if (par->cmap_adr)
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  331  			par->cmap_type = cmap_r128;
00257e0cc550c4 drivers/video/fbdev/offb.c Rob Herring            2019-01-11  332  	} else if (of_node_name_prefix(dp, "ATY,RageM3pA") ||
00257e0cc550c4 drivers/video/fbdev/offb.c Rob Herring            2019-01-11  333  		   of_node_name_prefix(dp, "ATY,RageM3p12A")) {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  334  		par->cmap_adr = offb_map_reg(dp, 2, 0, 0x1fff);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  335  		if (par->cmap_adr)
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  336  			par->cmap_type = cmap_M3A;
00257e0cc550c4 drivers/video/fbdev/offb.c Rob Herring            2019-01-11  337  	} else if (of_node_name_prefix(dp, "ATY,RageM3pB")) {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  338  		par->cmap_adr = offb_map_reg(dp, 2, 0, 0x1fff);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  339  		if (par->cmap_adr)
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  340  			par->cmap_type = cmap_M3B;
00257e0cc550c4 drivers/video/fbdev/offb.c Rob Herring            2019-01-11  341  	} else if (of_node_name_prefix(dp, "ATY,Rage6")) {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  342  		par->cmap_adr = offb_map_reg(dp, 1, 0, 0x1fff);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  343  		if (par->cmap_adr)
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  344  			par->cmap_type = cmap_radeon;
00257e0cc550c4 drivers/video/fbdev/offb.c Rob Herring            2019-01-11  345  	} else if (of_node_name_prefix(dp, "ATY,")) {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  346  		unsigned long base = address & 0xff000000UL;
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  347  		par->cmap_adr =
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  348  			ioremap(base + 0x7ff000, 0x1000) + 0xcc0;
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  349  		par->cmap_data = par->cmap_adr + 1;
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14  350  		par->cmap_type = cmap_simple;
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  351  	} else if (dp && (of_device_is_compatible(dp, "pci1014,b7") ||
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  352  			  of_device_is_compatible(dp, "pci1014,21c"))) {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  353  		par->cmap_adr = offb_map_reg(dp, 0, 0x6000, 0x1000);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  354  		if (par->cmap_adr)
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  355  			par->cmap_type = cmap_gxt2000;
00257e0cc550c4 drivers/video/fbdev/offb.c Rob Herring            2019-01-11  356  	} else if (of_node_name_prefix(dp, "vga,Display-")) {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  357  		/* Look for AVIVO initialized by SLOF */
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  358  		struct device_node *pciparent = of_get_parent(dp);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  359  		const u32 *vid, *did;
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  360  		vid = of_get_property(pciparent, "vendor-id", NULL);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  361  		did = of_get_property(pciparent, "device-id", NULL);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  362  		/* This will match most R5xx */
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  363  		if (vid && did && *vid == 0x1002 &&
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  364  		    ((*did >= 0x7100 && *did < 0x7800) ||
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  365  		     (*did >= 0x9400))) {
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  366  			par->cmap_adr = offb_map_reg(pciparent, 2, 0, 0x10000);
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  367  			if (par->cmap_adr)
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  368  				par->cmap_type = cmap_avivo;
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  369  		}
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  370  		of_node_put(pciparent);
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14  371  	} else if (dp && of_device_is_compatible(dp, "qemu,std-vga")) {
212c0cbd5be721 drivers/video/offb.c       Cedric Le Goater       2013-12-04  372  #ifdef __BIG_ENDIAN
212c0cbd5be721 drivers/video/offb.c       Cedric Le Goater       2013-12-04 @373  		const __be32 io_of_addr[3] = { 0x01000000, 0x0, 0x0 };
212c0cbd5be721 drivers/video/offb.c       Cedric Le Goater       2013-12-04  374  #else
212c0cbd5be721 drivers/video/offb.c       Cedric Le Goater       2013-12-04  375  		const __be32 io_of_addr[3] = { 0x00000001, 0x0, 0x0 };
212c0cbd5be721 drivers/video/offb.c       Cedric Le Goater       2013-12-04  376  #endif
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14  377  		u64 io_addr = of_translate_address(dp, io_of_addr);
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14  378  		if (io_addr != OF_BAD_ADDR) {
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14  379  			par->cmap_adr = ioremap(io_addr + 0x3c8, 2);
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14  380  			if (par->cmap_adr) {
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14  381  				par->cmap_type = cmap_simple;
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14  382  				par->cmap_data = par->cmap_adr + 1;
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14  383  			}
9b961ed21a7c92 drivers/video/offb.c       Benjamin Herrenschmidt 2011-12-14  384  		}
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  385  	}
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  386  	info->fix.visual = (par->cmap_type != cmap_unknown) ?
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  387  		FB_VISUAL_PSEUDOCOLOR : FB_VISUAL_STATIC_PSEUDOCOLOR;
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  388  }
57a20d8fb0d2a0 drivers/video/offb.c       Benjamin Herrenschmidt 2008-07-17  389  

:::::: The code at line 373 was first introduced by commit
:::::: 212c0cbd5be721a39ef3e2f723e0c78008f9e955 offb: Little endian fixes

:::::: TO: Cedric Le Goater <clg@fr.ibm.com>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
