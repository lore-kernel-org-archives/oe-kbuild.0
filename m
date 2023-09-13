Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11101DDD1
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Sep 2023 09:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694597049; x=1726133049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=upbVvyjnR6Q3U+hxneIEcfNGy2zishyZBWTa1ZB+IcE=;
  b=DiYCfYHZzO0QQPhCxr9TAvLWqGq8BUwOvYnkw7rxNKeXcVQ8JcXKNC17
   s3QdHbkQjKLlPkm4lIRes0YbDV48zQYCA5pqygW4nZVawfUq++YiJh9r8
   4e1dcJgyJMv//IDST+eEVophkVEczlWcHANrDrkZNcb7CrIH+7vWQkKH1
   ilACJYttFQpncPHutR++aNvAeEOGcQQagD0cbWG1Qixlk38DSEh/hTyHJ
   jQzr5nvVYk1ENvp4dsS/QK2A7FJLZzOsKwciMJIP9I9j3R71QMr4MREOm
   AxSnxdJasBoHf1sRGcBGUlh35vWolXDqINBfkYKi11diHIqnnnHC/75+q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="464978737"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="464978737"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 02:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="867716481"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="867716481"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Sep 2023 02:24:06 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgM6O-0000KP-1o;
	Wed, 13 Sep 2023 09:24:04 +0000
Date: Wed, 13 Sep 2023 17:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [skeggsb-nouveau:00.02-gsp-rm 10/88]
 drivers/gpu/drm/nouveau/dispnv50/disp.c:2565 nv50_display_read_hw_or_state()
 error: uninitialized symbol 'head_idx'.
Message-ID: <202309131758.bxLkhXD8-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20230911 (https://download.01.org/0day-ci/archive/20230913/202309131758.bxLkhXD8-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230913/202309131758.bxLkhXD8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309131758.bxLkhXD8-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/dispnv50/disp.c:2565 nv50_display_read_hw_or_state() error: uninitialized symbol 'head_idx'.

vim +/head_idx +2565 drivers/gpu/drm/nouveau/dispnv50/disp.c

26f6d88b327060 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs 2011-07-04  2523  
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2524  static inline void
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2525  nv50_display_read_hw_or_state(struct drm_device *dev, struct nv50_disp *disp,
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2526  			      struct nouveau_encoder *outp)
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2527  {
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2528  	struct drm_crtc *crtc;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2529  	struct drm_connector_list_iter conn_iter;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2530  	struct drm_connector *conn;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2531  	struct nv50_head_atom *armh;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2532  	const u32 encoder_mask = drm_encoder_mask(&outp->base.base);
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2533  	bool found_conn = false, found_head = false;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2534  	u8 proto;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2535  	int head_idx;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2536  	int ret;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2537  
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2538  	switch (outp->dcb->type) {
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2539  	case DCB_OUTPUT_TMDS:
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2540  		ret = nvif_outp_inherit_tmds(&outp->outp, &proto);
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2541  		break;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2542  	case DCB_OUTPUT_DP:
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2543  		ret = nvif_outp_inherit_dp(&outp->outp, &proto);
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2544  		break;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2545  	case DCB_OUTPUT_LVDS:
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2546  		ret = nvif_outp_inherit_lvds(&outp->outp, &proto);
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2547  		break;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2548  	case DCB_OUTPUT_ANALOG:
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2549  		ret = nvif_outp_inherit_rgb_crt(&outp->outp, &proto);
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2550  		break;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2551  	default:
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2552  		drm_dbg_kms(dev, "Readback for %s not implemented yet, skipping\n",
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2553  			    outp->base.base.name);
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2554  		drm_WARN_ON(dev, true);
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2555  		return;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2556  	}
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2557  	if (ret >= 0) {
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2558  		head_idx = ret;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2559  		ret = 0;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2560  	} else if (ret == -ENODEV) {
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2561  		return;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2562  	}
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2563  
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2564  	drm_for_each_crtc(crtc, dev) {
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11 @2565  		if (crtc->index != head_idx)
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2566  			continue;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2567  
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2568  		armh = nv50_head_atom(crtc->state);
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2569  		found_head = true;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2570  		break;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2571  	}
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2572  	if (drm_WARN_ON(dev, !found_head))
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2573  		return;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2574  
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2575  	/* Figure out which connector is being used by this encoder */
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2576  	drm_connector_list_iter_begin(dev, &conn_iter);
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2577  	nouveau_for_each_non_mst_connector_iter(conn, &conn_iter) {
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2578  		if (nouveau_connector(conn)->index == outp->dcb->connector) {
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2579  			found_conn = true;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2580  			break;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2581  		}
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2582  	}
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2583  	drm_connector_list_iter_end(&conn_iter);
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2584  	if (drm_WARN_ON(dev, !found_conn))
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2585  		return;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2586  
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2587  	armh->state.encoder_mask = encoder_mask;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2588  	armh->state.connector_mask = drm_connector_mask(conn);
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2589  	armh->state.active = true;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2590  	armh->state.enable = true;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2591  	pm_runtime_get_noresume(dev->dev);
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2592  
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2593  	outp->crtc = crtc;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2594  	outp->ctrl = NVVAL(NV507D, SOR_SET_CONTROL, PROTOCOL, proto) | BIT(crtc->index);
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2595  
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2596  	drm_connector_get(conn);
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2597  	conn->state->crtc = crtc;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2598  	conn->state->best_encoder = &outp->base.base;
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2599  }
c38b1778a9baee drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2600  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
