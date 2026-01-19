Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5E723EA8D
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 16:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768841462; cv=none; b=OEq7eOZSzQeoXNBGtHyX5MEOlOQEwYGoi+ipygAqYxb6/y8e3itNf3IsmJNU4lExdqA6A2DYrRdSnh+cHZ13lYtSGXKRhylbK9EXFmHFHTi4G0xHVOzZraBd6T6Gal6OmJP3liELkWsDtMBgyblakbvKKFnnXdVGGseoZUk35KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768841462; c=relaxed/simple;
	bh=2An89TR/gLiRTU+OT+TfZLSP1c0xG7QhV2J+wqBNY7g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KVKj3obA2uH2wXRPBEqwFwWHyHMc697wLL8g2pwhDFCQHzr1sfMsQ1akZi2RyMxD3FCnecubY/TX7l8qW9jUrbxCu8HtR+WdmWUlVlH4+f4LTxfSGCprN2h1Z7qyna2XG9JnAXLl1fL0R48pjrBx6hgch3tmrPyS19Fkqa3ErSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jTM35gPJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jTM35gPJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768841460; x=1800377460;
  h=date:from:to:cc:subject:message-id;
  bh=2An89TR/gLiRTU+OT+TfZLSP1c0xG7QhV2J+wqBNY7g=;
  b=jTM35gPJjIZSExiba3UT+GR6bVkGJR10HON/sMhPU6j/rh91fiKUVb2p
   p5JpQdmqt/O3/v7Whh+aogz3qyhjEwxE6oMJl1GFj8BVCnauNC3GsIYO5
   En5Jqskd9Svsk4wxdxCHuT9AhYPcEHUo1QxWqbmC2CHExtD6bvoE9ASCS
   QaxkLqQGpPBgTp1m5OzmMU8K+Oc126y8PxOmC45Dg5I2erU1SuwmiRv2b
   LnAC+tfEa1WIR9K37kekRAEviPkF5VJsV2/VHtFk1CGsep9r6i/V8CRrJ
   Ogu+GM1M6AP9wIrWoHWaAWgGUW1PPzQpSuQkn5JLAhAsAEBcpY8qMjYzt
   Q==;
X-CSE-ConnectionGUID: aGBfUdPeT8qg3UxbpLE89g==
X-CSE-MsgGUID: 57UMZe+IRd6osc47NCE0SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="57609700"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="57609700"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:50:59 -0800
X-CSE-ConnectionGUID: ++++93mNT+OBZCCHkmBp8A==
X-CSE-MsgGUID: jSWLLF1PTmCOlB5duKk8ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="236584879"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Jan 2026 08:50:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhsSt-00000000O4d-2BDP;
	Mon, 19 Jan 2026 16:50:55 +0000
Date: Tue, 20 Jan 2026 00:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpirko-mlxsw:combined_queue 18/18]
 drivers/video/fbdev/aty/atyfb_base.c:3647:37: sparse: sparse: unsigned value
 that used to be signed checked against zero?
Message-ID: <202601200012.HQeHm8UT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/video/fbdev/aty/atyfb_base.c:3647:37: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ido Schimmel <idosch@nvidia.com>
CC: Petr Machata <petrm@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   daf636da0fc768c0f24be900c6fde801e9da6358
commit: daf636da0fc768c0f24be900c6fde801e9da6358 [18/18] TMP: Revert "module: Add compile-time check for embedded NUL characters"
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: m68k-randconfig-r112-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200012.HQeHm8UT-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200012.HQeHm8UT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601200012.HQeHm8UT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/aty/atyfb_base.c:3647:37: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/video/fbdev/aty/atyfb_base.c:3715:16: sparse: signed value source

vim +3647 drivers/video/fbdev/aty/atyfb_base.c

^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3638  
5850e0cf9a2345 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3639  static int __init atyfb_atari_probe(void)
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3640  {
cef46b1f10ab67 drivers/video/aty/atyfb_base.c       Al Viro                   2006-01-12  3641  	struct atyfb_par *par;
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3642  	struct fb_info *info;
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3643  	int m64_num;
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3644  	u32 clock_r;
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3645  	int num_found = 0;
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3646  
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16 @3647  	for (m64_num = 0; m64_num < mach64_count; m64_num++) {
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3648  		if (!phys_vmembase[m64_num] || !phys_size[m64_num] ||
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3649  		    !phys_guiregbase[m64_num]) {
689620100172e2 drivers/video/aty/atyfb_base.c       Ville Syrjala             2009-09-22  3650  			PRINTKI("phys_*[%d] parameters not set => "
689620100172e2 drivers/video/aty/atyfb_base.c       Ville Syrjala             2009-09-22  3651  				"returning early. \n", m64_num);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3652  			continue;
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3653  		}
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3654  
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3655  		info = framebuffer_alloc(sizeof(struct atyfb_par), NULL);
0adcdbcb179624 drivers/video/fbdev/aty/atyfb_base.c Bartlomiej Zolnierkiewicz 2019-06-28  3656  		if (!info)
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3657  			return -ENOMEM;
0adcdbcb179624 drivers/video/fbdev/aty/atyfb_base.c Bartlomiej Zolnierkiewicz 2019-06-28  3658  
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3659  		par = info->par;
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3660  
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3661  		info->fix = atyfb_fix;
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3662  
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3663  		par->irq = (unsigned int) -1; /* something invalid */
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3664  
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3665  		/*
689620100172e2 drivers/video/aty/atyfb_base.c       Ville Syrjala             2009-09-22  3666  		 * Map the video memory (physical address given)
689620100172e2 drivers/video/aty/atyfb_base.c       Ville Syrjala             2009-09-22  3667  		 * to somewhere in the kernel address space.
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3668  		 */
7d89a3cb159aec drivers/video/fbdev/aty/atyfb_base.c Luis R. Rodriguez         2015-07-09  3669  		info->screen_base = ioremap_wc(phys_vmembase[m64_num],
7d89a3cb159aec drivers/video/fbdev/aty/atyfb_base.c Luis R. Rodriguez         2015-07-09  3670  					       phys_size[m64_num]);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3671  		info->fix.smem_start = (unsigned long)info->screen_base; /* Fake! */
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3672  		par->ati_regbase = ioremap(phys_guiregbase[m64_num], 0x10000) +
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3673  						0xFC00ul;
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3674  		info->fix.mmio_start = (unsigned long)par->ati_regbase; /* Fake! */
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3675  
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3676  		aty_st_le32(CLOCK_CNTL, 0x12345678, par);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3677  		clock_r = aty_ld_le32(CLOCK_CNTL, par);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3678  
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3679  		switch (clock_r & 0x003F) {
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3680  		case 0x12:
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3681  			par->clk_wr_offset = 3; /*  */
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3682  			break;
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3683  		case 0x34:
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3684  			par->clk_wr_offset = 2; /* Medusa ST-IO ISA Adapter etc. */
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3685  			break;
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3686  		case 0x16:
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3687  			par->clk_wr_offset = 1; /*  */
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3688  			break;
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3689  		case 0x38:
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3690  			par->clk_wr_offset = 0; /* Panther 1 ISA Adapter (Gerald) */
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3691  			break;
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3692  		}
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3693  
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3694  		/* Fake pci_id for correct_chipset() */
fe86175bce50bc drivers/video/aty/atyfb_base.c       Randy Dunlap              2009-02-04  3695  		switch (aty_ld_le32(CNFG_CHIP_ID, par) & CFG_CHIP_TYPE) {
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3696  		case 0x00d7:
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3697  			par->pci_id = PCI_CHIP_MACH64GX;
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3698  			break;
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3699  		case 0x0057:
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3700  			par->pci_id = PCI_CHIP_MACH64CX;
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3701  			break;
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3702  		default:
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3703  			break;
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3704  		}
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3705  
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3706  		if (correct_chipset(par) || aty_init(info)) {
b2a85aebf9d6cb drivers/video/aty/atyfb_base.c       Amol Lad                  2006-12-08  3707  			iounmap(info->screen_base);
b2a85aebf9d6cb drivers/video/aty/atyfb_base.c       Amol Lad                  2006-12-08  3708  			iounmap(par->ati_regbase);
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3709  			framebuffer_release(info);
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3710  		} else {
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3711  			num_found++;
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3712  		}
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3713  	}
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3714  
4ec3fd71e4f5d1 drivers/video/aty/atyfb_base.c       Ville Syrjala             2006-12-08  3715  	return num_found ? 0 : -ENXIO;
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3716  }
^1da177e4c3f41 drivers/video/aty/atyfb_base.c       Linus Torvalds            2005-04-16  3717  

:::::: The code at line 3647 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
