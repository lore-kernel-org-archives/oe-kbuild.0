Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05EB1DA52
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 23:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691190121; x=1722726121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GJ7vptWOx0Shrz+wtnXH0gGcwveKG6YrJyUyk0TBsVU=;
  b=N81STYRfIuXYBM0yhv4Tcwnx1gBJauiGA4TbgeGyQqEKVdPtyqvF+YIw
   DqLVHfA3R3Hwraq4rorsxXufCUVsbHNelIK6/+1/y6UhsxtRRhgx4PJ2R
   g9vSD2S/b9XLk8JB2b5qDIOSuHIuIA+to8vl1MaFons9LUWuJTIqu/Nrf
   C8jkXlPiDwqIP7a3mndygLeFqqXhDSTGAU+8W4TonEoDeVuwRQdsQPg1D
   WAX4mYNvP83RpCePjDOx6p27fm3yFGyv06dxq2QSpfkpRCKf5Vg/JfNdj
   Dn4e+XqumYCI1R1yh8IKDFJNdhwHoyQW0g22XDtPecxIAoVuGScHRU9CL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="456644626"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="456644626"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 16:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="1060964157"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="1060964157"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Aug 2023 16:01:54 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS3nu-0003Ad-0K;
	Fri, 04 Aug 2023 23:01:54 +0000
Date: Sat, 5 Aug 2023 07:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202308050648.WfY5sfG7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:600:17: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <6228a4ff9c074075bf07cca0e9d3eab2@AcuMS.aculab.com>
References: <6228a4ff9c074075bf07cca0e9d3eab2@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>
TO: "'Linus Torvalds'" <torvalds@linux-foundation.org>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on crng-random/master v6.5-rc4 next-20230804]
[cannot apply to next-20230804 akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Add-min_unsigned-a-b-and-max_unsigned-a-b/20230804-190414
base:   linus/master
patch link:    https://lore.kernel.org/r/6228a4ff9c074075bf07cca0e9d3eab2%40AcuMS.aculab.com
patch subject: [PATCH v3 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: nios2-randconfig-r081-20230730 (https://download.01.org/0day-ci/archive/20230805/202308050648.WfY5sfG7-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050648.WfY5sfG7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308050648.WfY5sfG7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:600:17: sparse: sparse: too long token expansion
>> drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:600:17: sparse: sparse: too long token expansion

vim +600 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c

133add5b5ad42b Maxime Ripard      2018-04-04  529  
133add5b5ad42b Maxime Ripard      2018-04-04  530  static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
133add5b5ad42b Maxime Ripard      2018-04-04  531  				    struct drm_display_mode *mode)
133add5b5ad42b Maxime Ripard      2018-04-04  532  {
133add5b5ad42b Maxime Ripard      2018-04-04  533  	struct mipi_dsi_device *device = dsi->device;
82a1356a933d84 Samuel Holland     2022-08-11  534  	int Bpp = mipi_dsi_pixel_format_to_bpp(device->format) / 8;
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  535  	u16 hbp = 0, hfp = 0, hsa = 0, hblk = 0, vblk = 0;
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  536  	u32 basic_ctl = 0;
c51756d56e20a1 Kees Cook          2018-06-29  537  	size_t bytes;
c51756d56e20a1 Kees Cook          2018-06-29  538  	u8 *buffer;
c51756d56e20a1 Kees Cook          2018-06-29  539  
c51756d56e20a1 Kees Cook          2018-06-29  540  	/* Do all timing calculations up front to allocate buffer space */
c51756d56e20a1 Kees Cook          2018-06-29  541  
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  542  	if (device->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  543  		hblk = mode->hdisplay * Bpp;
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  544  		basic_ctl = SUN6I_DSI_BASIC_CTL_VIDEO_BURST |
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  545  			    SUN6I_DSI_BASIC_CTL_HSA_HSE_DIS |
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  546  			    SUN6I_DSI_BASIC_CTL_HBP_DIS;
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  547  
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  548  		if (device->lanes == 4)
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  549  			basic_ctl |= SUN6I_DSI_BASIC_CTL_TRAIL_FILL |
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  550  				     SUN6I_DSI_BASIC_CTL_TRAIL_INV(0xc);
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  551  	} else {
c51756d56e20a1 Kees Cook          2018-06-29  552  		/*
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  553  		 * A sync period is composed of a blanking packet (4
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  554  		 * bytes + payload + 2 bytes) and a sync event packet
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  555  		 * (4 bytes). Its minimal size is therefore 10 bytes
c51756d56e20a1 Kees Cook          2018-06-29  556  		 */
c51756d56e20a1 Kees Cook          2018-06-29  557  #define HSA_PACKET_OVERHEAD	10
82a1356a933d84 Samuel Holland     2022-08-11  558  		hsa = max(HSA_PACKET_OVERHEAD,
c51756d56e20a1 Kees Cook          2018-06-29  559  			  (mode->hsync_end - mode->hsync_start) * Bpp - HSA_PACKET_OVERHEAD);
c51756d56e20a1 Kees Cook          2018-06-29  560  
c51756d56e20a1 Kees Cook          2018-06-29  561  		/*
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  562  		 * The backporch is set using a blanking packet (4
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  563  		 * bytes + payload + 2 bytes). Its minimal size is
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  564  		 * therefore 6 bytes
c51756d56e20a1 Kees Cook          2018-06-29  565  		 */
c51756d56e20a1 Kees Cook          2018-06-29  566  #define HBP_PACKET_OVERHEAD	6
82a1356a933d84 Samuel Holland     2022-08-11  567  		hbp = max(HBP_PACKET_OVERHEAD,
2cfdc24d2f8d9b Maxime Ripard      2019-02-11  568  			  (mode->htotal - mode->hsync_end) * Bpp - HBP_PACKET_OVERHEAD);
c51756d56e20a1 Kees Cook          2018-06-29  569  
c51756d56e20a1 Kees Cook          2018-06-29  570  		/*
81fafb9488a1d1 Icenowy Zheng      2019-10-07  571  		 * The frontporch is set using a sync event (4 bytes)
81fafb9488a1d1 Icenowy Zheng      2019-10-07  572  		 * and two blanking packets (each one is 4 bytes +
81fafb9488a1d1 Icenowy Zheng      2019-10-07  573  		 * payload + 2 bytes). Its minimal size is therefore
81fafb9488a1d1 Icenowy Zheng      2019-10-07  574  		 * 16 bytes
c51756d56e20a1 Kees Cook          2018-06-29  575  		 */
81fafb9488a1d1 Icenowy Zheng      2019-10-07  576  #define HFP_PACKET_OVERHEAD	16
82a1356a933d84 Samuel Holland     2022-08-11  577  		hfp = max(HFP_PACKET_OVERHEAD,
2cfdc24d2f8d9b Maxime Ripard      2019-02-11  578  			  (mode->hsync_start - mode->hdisplay) * Bpp - HFP_PACKET_OVERHEAD);
c51756d56e20a1 Kees Cook          2018-06-29  579  
c51756d56e20a1 Kees Cook          2018-06-29  580  		/*
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  581  		 * The blanking is set using a sync event (4 bytes)
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  582  		 * and a blanking packet (4 bytes + payload + 2
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  583  		 * bytes). Its minimal size is therefore 10 bytes.
c51756d56e20a1 Kees Cook          2018-06-29  584  		 */
62e7511a4f4dcf Maxime Ripard      2019-02-11  585  #define HBLK_PACKET_OVERHEAD	10
82a1356a933d84 Samuel Holland     2022-08-11  586  		hblk = max(HBLK_PACKET_OVERHEAD,
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  587  			   (mode->htotal - (mode->hsync_end - mode->hsync_start)) * Bpp -
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  588  			   HBLK_PACKET_OVERHEAD);
c51756d56e20a1 Kees Cook          2018-06-29  589  
c51756d56e20a1 Kees Cook          2018-06-29  590  		/*
c51756d56e20a1 Kees Cook          2018-06-29  591  		 * And I'm not entirely sure what vblk is about. The driver in
c51756d56e20a1 Kees Cook          2018-06-29  592  		 * Allwinner BSP is using a rather convoluted calculation
c51756d56e20a1 Kees Cook          2018-06-29  593  		 * there only for 4 lanes. However, using 0 (the !4 lanes
c51756d56e20a1 Kees Cook          2018-06-29  594  		 * case) even with a 4 lanes screen seems to work...
c51756d56e20a1 Kees Cook          2018-06-29  595  		 */
c51756d56e20a1 Kees Cook          2018-06-29  596  		vblk = 0;
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  597  	}
c51756d56e20a1 Kees Cook          2018-06-29  598  
c51756d56e20a1 Kees Cook          2018-06-29  599  	/* How many bytes do we need to send all payloads? */
c51756d56e20a1 Kees Cook          2018-06-29 @600  	bytes = max_t(size_t, max(max(hfp, hblk), max(hsa, hbp)), vblk);
c51756d56e20a1 Kees Cook          2018-06-29  601  	buffer = kmalloc(bytes, GFP_KERNEL);
c51756d56e20a1 Kees Cook          2018-06-29  602  	if (WARN_ON(!buffer))
c51756d56e20a1 Kees Cook          2018-06-29  603  		return;
133add5b5ad42b Maxime Ripard      2018-04-04  604  
1c1a7aa3663c69 Konstantin Sudakov 2019-02-11  605  	regmap_write(dsi->regs, SUN6I_DSI_BASIC_CTL_REG, basic_ctl);
133add5b5ad42b Maxime Ripard      2018-04-04  606  
133add5b5ad42b Maxime Ripard      2018-04-04  607  	regmap_write(dsi->regs, SUN6I_DSI_SYNC_HSS_REG,
133add5b5ad42b Maxime Ripard      2018-04-04  608  		     sun6i_dsi_build_sync_pkt(MIPI_DSI_H_SYNC_START,
133add5b5ad42b Maxime Ripard      2018-04-04  609  					      device->channel,
133add5b5ad42b Maxime Ripard      2018-04-04  610  					      0, 0));
133add5b5ad42b Maxime Ripard      2018-04-04  611  
133add5b5ad42b Maxime Ripard      2018-04-04  612  	regmap_write(dsi->regs, SUN6I_DSI_SYNC_HSE_REG,
133add5b5ad42b Maxime Ripard      2018-04-04  613  		     sun6i_dsi_build_sync_pkt(MIPI_DSI_H_SYNC_END,
133add5b5ad42b Maxime Ripard      2018-04-04  614  					      device->channel,
133add5b5ad42b Maxime Ripard      2018-04-04  615  					      0, 0));
133add5b5ad42b Maxime Ripard      2018-04-04  616  
133add5b5ad42b Maxime Ripard      2018-04-04  617  	regmap_write(dsi->regs, SUN6I_DSI_SYNC_VSS_REG,
133add5b5ad42b Maxime Ripard      2018-04-04  618  		     sun6i_dsi_build_sync_pkt(MIPI_DSI_V_SYNC_START,
133add5b5ad42b Maxime Ripard      2018-04-04  619  					      device->channel,
133add5b5ad42b Maxime Ripard      2018-04-04  620  					      0, 0));
133add5b5ad42b Maxime Ripard      2018-04-04  621  
133add5b5ad42b Maxime Ripard      2018-04-04  622  	regmap_write(dsi->regs, SUN6I_DSI_SYNC_VSE_REG,
133add5b5ad42b Maxime Ripard      2018-04-04  623  		     sun6i_dsi_build_sync_pkt(MIPI_DSI_V_SYNC_END,
133add5b5ad42b Maxime Ripard      2018-04-04  624  					      device->channel,
133add5b5ad42b Maxime Ripard      2018-04-04  625  					      0, 0));
133add5b5ad42b Maxime Ripard      2018-04-04  626  
133add5b5ad42b Maxime Ripard      2018-04-04  627  	regmap_write(dsi->regs, SUN6I_DSI_BASIC_SIZE0_REG,
133add5b5ad42b Maxime Ripard      2018-04-04  628  		     SUN6I_DSI_BASIC_SIZE0_VSA(mode->vsync_end -
133add5b5ad42b Maxime Ripard      2018-04-04  629  					       mode->vsync_start) |
2cfdc24d2f8d9b Maxime Ripard      2019-02-11  630  		     SUN6I_DSI_BASIC_SIZE0_VBP(mode->vtotal -
2cfdc24d2f8d9b Maxime Ripard      2019-02-11  631  					       mode->vsync_end));
133add5b5ad42b Maxime Ripard      2018-04-04  632  
133add5b5ad42b Maxime Ripard      2018-04-04  633  	regmap_write(dsi->regs, SUN6I_DSI_BASIC_SIZE1_REG,
133add5b5ad42b Maxime Ripard      2018-04-04  634  		     SUN6I_DSI_BASIC_SIZE1_VACT(mode->vdisplay) |
133add5b5ad42b Maxime Ripard      2018-04-04  635  		     SUN6I_DSI_BASIC_SIZE1_VT(mode->vtotal));
133add5b5ad42b Maxime Ripard      2018-04-04  636  
c51756d56e20a1 Kees Cook          2018-06-29  637  	/* sync */
133add5b5ad42b Maxime Ripard      2018-04-04  638  	regmap_write(dsi->regs, SUN6I_DSI_BLK_HSA0_REG,
133add5b5ad42b Maxime Ripard      2018-04-04  639  		     sun6i_dsi_build_blk0_pkt(device->channel, hsa));
133add5b5ad42b Maxime Ripard      2018-04-04  640  	regmap_write(dsi->regs, SUN6I_DSI_BLK_HSA1_REG,
c51756d56e20a1 Kees Cook          2018-06-29  641  		     sun6i_dsi_build_blk1_pkt(0, buffer, hsa));
133add5b5ad42b Maxime Ripard      2018-04-04  642  
c51756d56e20a1 Kees Cook          2018-06-29  643  	/* backporch */
133add5b5ad42b Maxime Ripard      2018-04-04  644  	regmap_write(dsi->regs, SUN6I_DSI_BLK_HBP0_REG,
133add5b5ad42b Maxime Ripard      2018-04-04  645  		     sun6i_dsi_build_blk0_pkt(device->channel, hbp));
133add5b5ad42b Maxime Ripard      2018-04-04  646  	regmap_write(dsi->regs, SUN6I_DSI_BLK_HBP1_REG,
c51756d56e20a1 Kees Cook          2018-06-29  647  		     sun6i_dsi_build_blk1_pkt(0, buffer, hbp));
133add5b5ad42b Maxime Ripard      2018-04-04  648  
c51756d56e20a1 Kees Cook          2018-06-29  649  	/* frontporch */
133add5b5ad42b Maxime Ripard      2018-04-04  650  	regmap_write(dsi->regs, SUN6I_DSI_BLK_HFP0_REG,
133add5b5ad42b Maxime Ripard      2018-04-04  651  		     sun6i_dsi_build_blk0_pkt(device->channel, hfp));
133add5b5ad42b Maxime Ripard      2018-04-04  652  	regmap_write(dsi->regs, SUN6I_DSI_BLK_HFP1_REG,
c51756d56e20a1 Kees Cook          2018-06-29  653  		     sun6i_dsi_build_blk1_pkt(0, buffer, hfp));
133add5b5ad42b Maxime Ripard      2018-04-04  654  
c51756d56e20a1 Kees Cook          2018-06-29  655  	/* hblk */
133add5b5ad42b Maxime Ripard      2018-04-04  656  	regmap_write(dsi->regs, SUN6I_DSI_BLK_HBLK0_REG,
133add5b5ad42b Maxime Ripard      2018-04-04  657  		     sun6i_dsi_build_blk0_pkt(device->channel, hblk));
133add5b5ad42b Maxime Ripard      2018-04-04  658  	regmap_write(dsi->regs, SUN6I_DSI_BLK_HBLK1_REG,
c51756d56e20a1 Kees Cook          2018-06-29  659  		     sun6i_dsi_build_blk1_pkt(0, buffer, hblk));
133add5b5ad42b Maxime Ripard      2018-04-04  660  
c51756d56e20a1 Kees Cook          2018-06-29  661  	/* vblk */
133add5b5ad42b Maxime Ripard      2018-04-04  662  	regmap_write(dsi->regs, SUN6I_DSI_BLK_VBLK0_REG,
133add5b5ad42b Maxime Ripard      2018-04-04  663  		     sun6i_dsi_build_blk0_pkt(device->channel, vblk));
133add5b5ad42b Maxime Ripard      2018-04-04  664  	regmap_write(dsi->regs, SUN6I_DSI_BLK_VBLK1_REG,
c51756d56e20a1 Kees Cook          2018-06-29  665  		     sun6i_dsi_build_blk1_pkt(0, buffer, vblk));
c51756d56e20a1 Kees Cook          2018-06-29  666  
c51756d56e20a1 Kees Cook          2018-06-29  667  	kfree(buffer);
133add5b5ad42b Maxime Ripard      2018-04-04  668  }
133add5b5ad42b Maxime Ripard      2018-04-04  669  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
