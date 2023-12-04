Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D222FC29
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 18:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kscXGYA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701715114; x=1733251114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OLDqtPD/+49qMl59NK7jBEcz9Di/B7TXr2NP36MIJS4=;
  b=kscXGYA9wZRcq2f7n8+019qXSq+BjnzI0jvB/d0COX4hvhqEJYRPrs72
   FKZkzpNAuk481Eic4B59l5b35U8K9XbDx23/1SXPB1bstHtu9+hUZkfpo
   Judm8Z35Cw0Wl51ZIU9ZMjr/hbS/9U3e7Y8R4JkdxAo9XR2x4lR2wRfWL
   fFdjGUVTkm9FJKMHi2X/qP1yCEXDvPPxafcBV/oVUMd9QkTVFVbizlTqa
   OXBRNAb0eb1HhhKsTSchNNfzvD+nxRBQB4iruifiB6u7Fu0rTtgU2ltWM
   4jn5OeP9tlapovq7FowUhpGyZmu31W3v/oWEF2+N6DQ59PHNcw9ZviBuW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="675193"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="675193"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 10:38:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="841155761"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="841155761"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 04 Dec 2023 10:38:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rADpV-000807-2u;
	Mon, 04 Dec 2023 18:38:05 +0000
Date: Tue, 5 Dec 2023 02:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/video/fbdev/aty/atyfb_base.c:3710:37: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202312050222.9hqPhX0M-lkp@intel.com>
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
TO: Paul Cercueil <paul@crapouillou.net>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Paul,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: c434b9f80b0923e6460031b0fd964f8b0bf3c6a6 MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
date:   3 years, 3 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 3 years, 3 months ago
config: mips-randconfig-r123-20231115 (https://download.01.org/0day-ci/archive/20231205/202312050222.9hqPhX0M-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312050222.9hqPhX0M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312050222.9hqPhX0M-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/aty/atyfb_base.c:3710:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *addr @@
   drivers/video/fbdev/aty/atyfb_base.c:3710:37: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/aty/atyfb_base.c:3710:37: sparse:     got unsigned char [usertype] *addr
--
   drivers/gpu/drm/qxl/qxl_kms.c:169:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct qxl_rom *rom @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/qxl/qxl_kms.c:169:19: sparse:     expected struct qxl_rom *rom
   drivers/gpu/drm/qxl/qxl_kms.c:169:19: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/qxl/qxl_kms.c:187:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct qxl_ram_header *ram_header @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/qxl/qxl_kms.c:187:26: sparse:     expected struct qxl_ram_header *ram_header
   drivers/gpu/drm/qxl/qxl_kms.c:187:26: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/qxl/qxl_kms.c:276:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got struct qxl_ram_header *ram_header @@
   drivers/gpu/drm/qxl/qxl_kms.c:276:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/qxl/qxl_kms.c:276:21: sparse:     got struct qxl_ram_header *ram_header
>> drivers/gpu/drm/qxl/qxl_kms.c:280:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got struct qxl_rom *rom @@
   drivers/gpu/drm/qxl/qxl_kms.c:280:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/qxl/qxl_kms.c:280:21: sparse:     got struct qxl_rom *rom
   drivers/gpu/drm/qxl/qxl_kms.c:300:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got struct qxl_ram_header *ram_header @@
   drivers/gpu/drm/qxl/qxl_kms.c:300:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/qxl/qxl_kms.c:300:21: sparse:     got struct qxl_ram_header *ram_header
   drivers/gpu/drm/qxl/qxl_kms.c:301:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got struct qxl_rom *rom @@
   drivers/gpu/drm/qxl/qxl_kms.c:301:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/qxl/qxl_kms.c:301:21: sparse:     got struct qxl_rom *rom

vim +3710 drivers/video/fbdev/aty/atyfb_base.c

c98959f566e0c6 drivers/video/aty/atyfb_base.c       Ville Syrjala      2006-12-08  3686  
48c68c4f1b5424 drivers/video/aty/atyfb_base.c       Greg Kroah-Hartman 2012-12-21  3687  static void atyfb_remove(struct fb_info *info)
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3688  {
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3689  	struct atyfb_par *par = (struct atyfb_par *) info->par;
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3690  
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3691  	/* restore video mode */
eafad22a05fdac drivers/video/aty/atyfb_base.c       Ville Syrjala      2009-06-30  3692  	aty_set_crtc(par, &par->saved_crtc);
eafad22a05fdac drivers/video/aty/atyfb_base.c       Ville Syrjala      2009-06-30  3693  	par->pll_ops->set_pll(info, &par->saved_pll);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3694  
37ce69a57ff217 drivers/video/aty/atyfb_base.c       Richard Purdie     2007-02-10  3695  	unregister_framebuffer(info);
37ce69a57ff217 drivers/video/aty/atyfb_base.c       Richard Purdie     2007-02-10  3696  
5474c120aafe78 drivers/video/aty/atyfb_base.c       Michael Hanselmann 2006-06-25  3697  #ifdef CONFIG_FB_ATY_BACKLIGHT
5474c120aafe78 drivers/video/aty/atyfb_base.c       Michael Hanselmann 2006-06-25  3698  	if (M64_HAS(MOBIL_BUS))
37ce69a57ff217 drivers/video/aty/atyfb_base.c       Richard Purdie     2007-02-10  3699  		aty_bl_exit(info->bl_dev);
5474c120aafe78 drivers/video/aty/atyfb_base.c       Michael Hanselmann 2006-06-25  3700  #endif
7d89a3cb159aec drivers/video/fbdev/aty/atyfb_base.c Luis R. Rodriguez  2015-07-09  3701  	arch_phys_wc_del(par->wc_cookie);
5474c120aafe78 drivers/video/aty/atyfb_base.c       Michael Hanselmann 2006-06-25  3702  
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3703  #ifndef __sparc__
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3704  	if (par->ati_regbase)
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3705  		iounmap(par->ati_regbase);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3706  	if (info->screen_base)
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3707  		iounmap(info->screen_base);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3708  #ifdef __BIG_ENDIAN
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3709  	if (info->sprite.addr)
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16 @3710  		iounmap(info->sprite.addr);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3711  #endif
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3712  #endif
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3713  #ifdef __sparc__
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3714  	kfree(par->mmap_map);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3715  #endif
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3716  	if (par->aux_start)
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3717  		release_mem_region(par->aux_start, par->aux_size);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3718  
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3719  	if (par->res_start)
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3720  		release_mem_region(par->res_start, par->res_size);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3721  
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3722  	framebuffer_release(info);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3723  }
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds     2005-04-16  3724  

:::::: The code at line 3710 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
