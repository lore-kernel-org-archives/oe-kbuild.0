Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB8E500962
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 17:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767893164; cv=none; b=WiLyOO/Ndjz2iohg9MlyCC2LUFAy8c5GkZe9Ti6L14DKykLY+by5QVH7woXJqRBkbbw6cqHWpVSXtBiolF8GLzR6TL6pQ5CpbpKb1lrek4cjE6JpoWtkahZqNTNLQMxXdUTWOej0dQwBSbSQ3d52L6QaxVY8j4fVmiHT97fFYfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767893164; c=relaxed/simple;
	bh=oqKKNhvUnbvseSIQiMTf9QVEeqzcVbCY4Pk/nKRuPUU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tpHyDy1KzirI9KSsrCRT+juXVcU/vpQ/4ublgP0yHa68qJ/KV2ola7qfgYf3EuDPVIUUGNUoFh/GeXqU/l+gCwfzTbUlXvBkuL41ypnEIskJ9SNuZMQmlXGajqTx2q/5KVryZoP8GpbtfVR9DPBGcQPt7LzKcgZH2K+cc3zgFhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URz5pzTo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URz5pzTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767893162; x=1799429162;
  h=date:from:to:cc:subject:message-id;
  bh=oqKKNhvUnbvseSIQiMTf9QVEeqzcVbCY4Pk/nKRuPUU=;
  b=URz5pzTodKHro1Zh0wnU4qNEDde+2Bx3zdrlsVSqjQjCqEkWgHyVIgcO
   fyoV1Bv/H31Aak8HipkoKWHKNlcsY4dMUXjf5KX5t6Kly443jjLHMKpTa
   xEd141H/oFR4MN0pM84WOqqxgoyL/GGxk2Zfb3m208SwVYzmXqF7lnTlc
   cdNUs08mhMgjoG2wGcqL+vn8zbAiGmHmXuLUSTBiBuXkP/og70yUrzuKB
   cbt235onhgLWtdYEMtrqkOlg0SAYVnTg+7FRUlVQsg0x53WvhuNr6/Mcp
   w0p4CULeRpYGSRK6vhRXUgxwWOgwotvyMpwKiQ3NUHFkUz+A6Aae89cIq
   Q==;
X-CSE-ConnectionGUID: GhcU0Re9Tw6ZXVXfuBDhWQ==
X-CSE-MsgGUID: vqqswZUoTwmyk8HgftZ7nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79996876"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="79996876"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 09:26:01 -0800
X-CSE-ConnectionGUID: ZBHJb7QiSjCCjtZfzdr51g==
X-CSE-MsgGUID: eIQFjt+EQ4CrqY8CveHNWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203688647"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2026 09:26:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdtll-000000004zp-3mLg;
	Thu, 08 Jan 2026 17:25:57 +0000
Date: Fri, 09 Jan 2026 01:24:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:373
 rzg2l_mipi_dsi_set_display_timing() error: uninitialized symbol
 'vich1ppsetr'.
Message-ID: <202601090110.t6s3iaxo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   79b95d74470dd97d7d0908d5a3c0734a23e51aa4
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   8 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 months ago
config: um-randconfig-r072-20260108 (https://download.01.org/0day-ci/archive/20260109/202601090110.t6s3iaxo-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601090110.t6s3iaxo-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:373 rzg2l_mipi_dsi_set_display_timing() error: uninitialized symbol 'vich1ppsetr'.

vim +/vich1ppsetr +373 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c

7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  345  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  346  static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  347  					      const struct drm_display_mode *mode)
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  348  {
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  349  	u32 vich1ppsetr;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  350  	u32 vich1vssetr;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  351  	u32 vich1vpsetr;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  352  	u32 vich1hssetr;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  353  	u32 vich1hpsetr;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  354  	int dsi_format;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  355  	u32 delay[2];
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  356  	u8 index;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  357  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  358  	/* Configuration for Pixel Packet */
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  359  	dsi_format = mipi_dsi_pixel_format_to_bpp(dsi->format);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  360  	switch (dsi_format) {
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  361  	case 24:
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  362  		vich1ppsetr = VICH1PPSETR_DT_RGB24;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  363  		break;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  364  	case 18:
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  365  		vich1ppsetr = VICH1PPSETR_DT_RGB18;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  366  		break;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  367  	}
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  368  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  369  	if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) &&
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  370  	    !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST))
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  371  		vich1ppsetr |= VICH1PPSETR_TXESYNC_PULSE;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  372  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20 @373  	rzg2l_mipi_dsi_link_write(dsi, VICH1PPSETR, vich1ppsetr);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  374  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  375  	/* Configuration for Video Parameters */
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  376  	vich1vssetr = VICH1VSSETR_VACTIVE(mode->vdisplay) |
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  377  		      VICH1VSSETR_VSA(mode->vsync_end - mode->vsync_start);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  378  	vich1vssetr |= (mode->flags & DRM_MODE_FLAG_PVSYNC) ?
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  379  			VICH1VSSETR_VSPOL_HIGH : VICH1VSSETR_VSPOL_LOW;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  380  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  381  	vich1vpsetr = VICH1VPSETR_VFP(mode->vsync_start - mode->vdisplay) |
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  382  		      VICH1VPSETR_VBP(mode->vtotal - mode->vsync_end);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  383  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  384  	vich1hssetr = VICH1HSSETR_HACTIVE(mode->hdisplay) |
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  385  		      VICH1HSSETR_HSA(mode->hsync_end - mode->hsync_start);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  386  	vich1hssetr |= (mode->flags & DRM_MODE_FLAG_PHSYNC) ?
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  387  			VICH1HSSETR_HSPOL_HIGH : VICH1HSSETR_HSPOL_LOW;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  388  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  389  	vich1hpsetr = VICH1HPSETR_HFP(mode->hsync_start - mode->hdisplay) |
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  390  		      VICH1HPSETR_HBP(mode->htotal - mode->hsync_end);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  391  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  392  	rzg2l_mipi_dsi_link_write(dsi, VICH1VSSETR, vich1vssetr);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  393  	rzg2l_mipi_dsi_link_write(dsi, VICH1VPSETR, vich1vpsetr);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  394  	rzg2l_mipi_dsi_link_write(dsi, VICH1HSSETR, vich1hssetr);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  395  	rzg2l_mipi_dsi_link_write(dsi, VICH1HPSETR, vich1hpsetr);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  396  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  397  	/*
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  398  	 * Configuration for Delay Value
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  399  	 * Delay value based on 2 ranges of video clock.
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  400  	 * 74.25MHz is videoclock of HD@60p or FHD@30p
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  401  	 */
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  402  	if (mode->clock > 74250) {
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  403  		delay[0] = 231;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  404  		delay[1] = 216;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  405  	} else {
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  406  		delay[0] = 220;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  407  		delay[1] = 212;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  408  	}
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  409  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  410  	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  411  		index = 0;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  412  	else
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  413  		index = 1;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  414  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  415  	rzg2l_mipi_dsi_link_write(dsi, VICH1SET1R,
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  416  				  VICH1SET1R_DLY(delay[index]));
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  417  }
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c Biju Das 2022-09-20  418  

:::::: The code at line 373 was first introduced by commit
:::::: 7a043f978ed1433bddb088a732e9bb91501ebd76 drm: rcar-du: Add RZ/G2L DSI driver

:::::: TO: Biju Das <biju.das.jz@bp.renesas.com>
:::::: CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
