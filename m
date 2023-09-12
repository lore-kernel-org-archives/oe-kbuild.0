Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511B3623
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Sep 2023 00:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694479024; x=1726015024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zvYsMXxysP+6X5JRr6PEXNdOZHTIOcdIAnG/xeYXEYM=;
  b=fxZwsjK++1mmsDMXnNGp5IPM/k7BAM5X6UxQdZ/CQfufUPK3gKPpxAYD
   tiwpVklOentL7ts9AYtWxJi8ArR4NQbPzokr0orz892OgwuujsrLnFcli
   uGf7UtRCCRii+Wolnc3NXo1M+X7k3FXeoimdCEiUcT+fm/SAclIIikWwn
   Kn347cPU58UtMx7sXUtRHoXntM35s0SgPgRMnYeDt63O3gJjS/+EK0tJL
   8YME1yeRA1Nwk1y8tvn2VrTpgOa0xscv+6L0QswzawkzVofLOeZFprEon
   qtXEV4Go+Bb6yslluYo0mxejfKul/Ri8jUB0zpMiUr4VlAPx+jchVYt35
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444680138"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="444680138"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 17:37:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813593501"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="813593501"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Sep 2023 17:37:01 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfrOl-0006zO-13;
	Tue, 12 Sep 2023 00:36:59 +0000
Date: Tue, 12 Sep 2023 08:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [skeggsb-nouveau:00.02-gsp-rm 10/88]
 drivers/gpu/drm/nouveau/dispnv50/disp.c:2565 nv50_display_read_hw_or_state()
 error: uninitialized symbol 'head_idx'.
Message-ID: <202309120801.w9evdkkZ-lkp@intel.com>
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
TO: Lyude Paul <lyude@redhat.com>
CC: Ben Skeggs <bskeggs@redhat.com>

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   89551217290c31848a7662d659ced417db386bc7
commit: c38b1778a9baee914921a6743ba924907b96caa2 [10/88] drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state
:::::: branch date: 27 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20230911 (https://download.01.org/0day-ci/archive/20230912/202309120801.w9evdkkZ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230912/202309120801.w9evdkkZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309120801.w9evdkkZ-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/dispnv50/disp.c:2565 nv50_display_read_hw_or_state() error: uninitialized symbol 'head_idx'.

vim +/head_idx +2565 drivers/gpu/drm/nouveau/dispnv50/disp.c

26f6d88b3270605 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs 2011-07-04  2523  
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2524  static inline void
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2525  nv50_display_read_hw_or_state(struct drm_device *dev, struct nv50_disp *disp,
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2526  			      struct nouveau_encoder *outp)
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2527  {
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2528  	struct drm_crtc *crtc;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2529  	struct drm_connector_list_iter conn_iter;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2530  	struct drm_connector *conn;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2531  	struct nv50_head_atom *armh;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2532  	const u32 encoder_mask = drm_encoder_mask(&outp->base.base);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2533  	bool found_conn = false, found_head = false;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2534  	u8 proto;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2535  	int head_idx;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2536  	int ret;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2537  
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2538  	switch (outp->dcb->type) {
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2539  	case DCB_OUTPUT_TMDS:
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2540  		ret = nvif_outp_inherit_tmds(&outp->outp, &proto);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2541  		break;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2542  	case DCB_OUTPUT_DP:
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2543  		ret = nvif_outp_inherit_dp(&outp->outp, &proto);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2544  		break;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2545  	case DCB_OUTPUT_LVDS:
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2546  		ret = nvif_outp_inherit_lvds(&outp->outp, &proto);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2547  		break;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2548  	case DCB_OUTPUT_ANALOG:
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2549  		ret = nvif_outp_inherit_rgb_crt(&outp->outp, &proto);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2550  		break;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2551  	default:
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2552  		drm_dbg_kms(dev, "Readback for %s not implemented yet, skipping\n",
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2553  			    outp->base.base.name);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2554  		drm_WARN_ON(dev, true);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2555  		return;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2556  	}
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2557  	if (ret >= 0) {
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2558  		head_idx = ret;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2559  		ret = 0;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2560  	} else if (ret == -ENODEV) {
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2561  		return;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2562  	}
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2563  
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2564  	drm_for_each_crtc(crtc, dev) {
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11 @2565  		if (crtc->index != head_idx)
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2566  			continue;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2567  
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2568  		armh = nv50_head_atom(crtc->state);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2569  		found_head = true;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2570  		break;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2571  	}
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2572  	if (drm_WARN_ON(dev, !found_head))
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2573  		return;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2574  
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2575  	/* Figure out which connector is being used by this encoder */
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2576  	drm_connector_list_iter_begin(dev, &conn_iter);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2577  	nouveau_for_each_non_mst_connector_iter(conn, &conn_iter) {
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2578  		if (nouveau_connector(conn)->index == outp->dcb->connector) {
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2579  			found_conn = true;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2580  			break;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2581  		}
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2582  	}
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2583  	drm_connector_list_iter_end(&conn_iter);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2584  	if (drm_WARN_ON(dev, !found_conn))
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2585  		return;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2586  
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2587  	armh->state.encoder_mask = encoder_mask;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2588  	armh->state.connector_mask = drm_connector_mask(conn);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2589  	armh->state.active = true;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2590  	armh->state.enable = true;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2591  	pm_runtime_get_noresume(dev->dev);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2592  
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2593  	outp->crtc = crtc;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2594  	outp->ctrl = NVVAL(NV507D, SOR_SET_CONTROL, PROTOCOL, proto) | BIT(crtc->index);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2595  
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2596  	drm_connector_get(conn);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2597  	conn->state->crtc = crtc;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2598  	conn->state->best_encoder = &outp->base.base;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2599  }
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2600  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
