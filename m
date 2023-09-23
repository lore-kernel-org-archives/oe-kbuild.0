Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B446C2567
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Sep 2023 12:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695473322; x=1727009322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l2vkxKf8+8LnpLfqIB3Fw5Ay4qF7/lUAgldCAL1Dh/I=;
  b=Lk3N0oPsw9egruRSJriwpVOzwMC8MoSarjBCCpVp0wa1u8MgjbRE6LFk
   1PDZ2qm5CU6PTGnZwfSaj3lnSr40tlwNQfq2Gzhn6yLLaOP1fQ5W4qBxN
   VGbiWeBjLL15iRJ6VLNA3py8eE2+uzeNqLOZzfnlTaS/1TvswjbITthdB
   076jeu58agQCS/QqVgD2+CC9SSbpMsBWJz3erwaRv4Gjth1/wAEfg27/L
   1VetvQodnZiwv5KggCtHpdS/PoL8uG8BF+cE2SNZ2Uv4GYm3ORCrYEVIQ
   J89ovPB6hXyRHzSUTNBDei+lhY6K4u+HVudJRO+fYixUQa3EVytfVu+fG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="371331989"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="371331989"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 05:48:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="921483349"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="921483349"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 23 Sep 2023 05:48:40 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk23q-0002N5-1e;
	Sat, 23 Sep 2023 12:48:38 +0000
Date: Sat, 23 Sep 2023 20:48:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c:374
 rzg2l_mipi_dsi_set_display_timing() error: uninitialized symbol
 'vich1ppsetr'.
Message-ID: <202309232010.o121lZbM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d90b0276af8f25a0b8ae081a30d1b2a61263393b
commit: 11696c5e89245a1d360f75be3dfc4960b25a265a drm: Place Renesas drivers in a separate dir
date:   4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230923/202309232010.o121lZbM-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230923/202309232010.o121lZbM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309232010.o121lZbM-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c:374 rzg2l_mipi_dsi_set_display_timing() error: uninitialized symbol 'vich1ppsetr'.

vim +/vich1ppsetr +374 drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c

7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  346  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  347  static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  348  					      const struct drm_display_mode *mode)
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  349  {
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  350  	u32 vich1ppsetr;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  351  	u32 vich1vssetr;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  352  	u32 vich1vpsetr;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  353  	u32 vich1hssetr;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  354  	u32 vich1hpsetr;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  355  	int dsi_format;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  356  	u32 delay[2];
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  357  	u8 index;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  358  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  359  	/* Configuration for Pixel Packet */
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  360  	dsi_format = mipi_dsi_pixel_format_to_bpp(dsi->format);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  361  	switch (dsi_format) {
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  362  	case 24:
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  363  		vich1ppsetr = VICH1PPSETR_DT_RGB24;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  364  		break;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  365  	case 18:
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  366  		vich1ppsetr = VICH1PPSETR_DT_RGB18;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  367  		break;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  368  	}
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  369  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  370  	if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) &&
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  371  	    !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST))
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  372  		vich1ppsetr |= VICH1PPSETR_TXESYNC_PULSE;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  373  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20 @374  	rzg2l_mipi_dsi_link_write(dsi, VICH1PPSETR, vich1ppsetr);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  375  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  376  	/* Configuration for Video Parameters */
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  377  	vich1vssetr = VICH1VSSETR_VACTIVE(mode->vdisplay) |
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  378  		      VICH1VSSETR_VSA(mode->vsync_end - mode->vsync_start);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  379  	vich1vssetr |= (mode->flags & DRM_MODE_FLAG_PVSYNC) ?
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  380  			VICH1VSSETR_VSPOL_HIGH : VICH1VSSETR_VSPOL_LOW;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  381  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  382  	vich1vpsetr = VICH1VPSETR_VFP(mode->vsync_start - mode->vdisplay) |
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  383  		      VICH1VPSETR_VBP(mode->vtotal - mode->vsync_end);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  384  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  385  	vich1hssetr = VICH1HSSETR_HACTIVE(mode->hdisplay) |
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  386  		      VICH1HSSETR_HSA(mode->hsync_end - mode->hsync_start);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  387  	vich1hssetr |= (mode->flags & DRM_MODE_FLAG_PHSYNC) ?
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  388  			VICH1HSSETR_HSPOL_HIGH : VICH1HSSETR_HSPOL_LOW;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  389  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  390  	vich1hpsetr = VICH1HPSETR_HFP(mode->hsync_start - mode->hdisplay) |
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  391  		      VICH1HPSETR_HBP(mode->htotal - mode->hsync_end);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  392  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  393  	rzg2l_mipi_dsi_link_write(dsi, VICH1VSSETR, vich1vssetr);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  394  	rzg2l_mipi_dsi_link_write(dsi, VICH1VPSETR, vich1vpsetr);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  395  	rzg2l_mipi_dsi_link_write(dsi, VICH1HSSETR, vich1hssetr);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  396  	rzg2l_mipi_dsi_link_write(dsi, VICH1HPSETR, vich1hpsetr);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  397  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  398  	/*
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  399  	 * Configuration for Delay Value
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  400  	 * Delay value based on 2 ranges of video clock.
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  401  	 * 74.25MHz is videoclock of HD@60p or FHD@30p
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  402  	 */
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  403  	if (mode->clock > 74250) {
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  404  		delay[0] = 231;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  405  		delay[1] = 216;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  406  	} else {
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  407  		delay[0] = 220;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  408  		delay[1] = 212;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  409  	}
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  410  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  411  	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  412  		index = 0;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  413  	else
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  414  		index = 1;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  415  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  416  	rzg2l_mipi_dsi_link_write(dsi, VICH1SET1R,
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  417  				  VICH1SET1R_DLY(delay[index]));
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  418  }
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  419  

:::::: The code at line 374 was first introduced by commit
:::::: 7a043f978ed1433bddb088a732e9bb91501ebd76 drm: rcar-du: Add RZ/G2L DSI driver

:::::: TO: Biju Das <biju.das.jz@bp.renesas.com>
:::::: CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
