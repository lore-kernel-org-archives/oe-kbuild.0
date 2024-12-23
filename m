Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9653E28FF
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Dec 2024 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734960954; cv=none; b=k2zXpXMe63UBuNLCTKyUl8oRn7PopdPpCsUcfgKq7dNJLhUIOJFl2gJElEhMkf0cme482M5Snal1CaBAnWDNl6VXNkgdEBZNF7klPlLbVfJA8BiBs2L5ioXCOi40rRln/W6wH3JZ6Golowv2n1flE2WW8xJ/tQ4gDvVxvU4jZRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734960954; c=relaxed/simple;
	bh=MSoiyJYW7kex9xdnqgikyrHVWGZueu1STkk+423OMH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zh2a3ML7xZF6RKhsivIRF6QUqsAEObJiPiG37UkcYTWGmy0e+rBjeYQvqddw/Sv5rkdnZbjkrcgbHQT3R5Mao47NuT8rtfGIUT3dsJuf1hpBlO4V8Kr3WkAD4b6i+iygU+5JPRUK/NSQqxda2lac/uefjp8IaHT4BieMPCaufTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvs8VJIO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvs8VJIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734960952; x=1766496952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MSoiyJYW7kex9xdnqgikyrHVWGZueu1STkk+423OMH8=;
  b=hvs8VJIO5dX/6YWBtH4BecHXTrOUmo5nKAVjuU0o/cqXXvNLNdCJqBoO
   OdL6LerGGwV2zuf9bCBOnuF5I/Ji9S2hT2q+md0OMBunoueMGOe09OWSP
   xlLeMyKtQYs/fbVpUybymXFNW2ytVQcOttrUq5qfmTLjZGJfqolmTMWvn
   bhYE6FDgFRSQR2tfqFTgX/eDjnuBiJg5tRnHvoDtFLG7JrdzpPA/1OeS/
   ogRXZthKJa8mK0ytq9M6hDhdUJFks4ccA9pKhp3z3Fgbk9yJAXslQrDgf
   5+W9MAOISOlMojkiCHDDw4TUZXpIaU+ZuHPu8CsYtYaR5EZ/bu5wMqosy
   g==;
X-CSE-ConnectionGUID: nblzeAstS6eaD6e3rG/T4A==
X-CSE-MsgGUID: mE6QMC6fTpSLL0imx9GZ7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46846213"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="46846213"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 05:35:51 -0800
X-CSE-ConnectionGUID: 4A1prn0sRja6Sw1v5RC1VQ==
X-CSE-MsgGUID: rOX15KVQTYiSNS/+zNW2Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103828524"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Dec 2024 05:35:49 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPib5-0003cd-28;
	Mon, 23 Dec 2024 13:35:47 +0000
Date: Mon, 23 Dec 2024 21:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3205/5236]
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2666 vop2_setup_layer_mixer()
 error: uninitialized symbol 'old_win'.
Message-ID: <202412232121.J7FqM7Ct-lkp@intel.com>
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
TO: Andy Yan <andy.yan@rock-chips.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: 0ca953ac226eaffbe1a795f5e517095a8d494921 [3205/5236] drm/rockchip: vop2: Fix the windows switch between different layers
:::::: branch date: 3 days ago
:::::: commit date: 9 days ago
config: powerpc-randconfig-r072-20241223 (https://download.01.org/0day-ci/archive/20241223/202412232121.J7FqM7Ct-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412232121.J7FqM7Ct-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2666 vop2_setup_layer_mixer() error: uninitialized symbol 'old_win'.

Old smatch warnings:
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:692 vop2_afbc_transform_offset() error: uninitialized symbol 'tx'.
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:693 vop2_afbc_transform_offset() error: uninitialized symbol 'ty'.

vim +/old_win +2666 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

604be85547ce4d Andy Yan 2022-04-22  2537  
604be85547ce4d Andy Yan 2022-04-22  2538  static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
604be85547ce4d Andy Yan 2022-04-22  2539  {
604be85547ce4d Andy Yan 2022-04-22  2540  	struct vop2 *vop2 = vp->vop2;
604be85547ce4d Andy Yan 2022-04-22  2541  	struct drm_plane *plane;
604be85547ce4d Andy Yan 2022-04-22  2542  	u32 layer_sel = 0;
604be85547ce4d Andy Yan 2022-04-22  2543  	u32 port_sel;
0ca953ac226eaf Andy Yan 2024-12-14  2544  	u8 layer_id;
0ca953ac226eaf Andy Yan 2024-12-14  2545  	u8 old_layer_id;
0ca953ac226eaf Andy Yan 2024-12-14  2546  	u8 layer_sel_id;
0ca953ac226eaf Andy Yan 2024-12-14  2547  	unsigned int ofs;
dd49ee4614cfb0 Andy Yan 2023-12-11  2548  	u32 ovl_ctrl;
604be85547ce4d Andy Yan 2022-04-22  2549  	int i;
604be85547ce4d Andy Yan 2022-04-22  2550  	struct vop2_video_port *vp0 = &vop2->vps[0];
604be85547ce4d Andy Yan 2022-04-22  2551  	struct vop2_video_port *vp1 = &vop2->vps[1];
604be85547ce4d Andy Yan 2022-04-22  2552  	struct vop2_video_port *vp2 = &vop2->vps[2];
dd49ee4614cfb0 Andy Yan 2023-12-11  2553  	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(vp->crtc.state);
604be85547ce4d Andy Yan 2022-04-22  2554  
dd49ee4614cfb0 Andy Yan 2023-12-11  2555  	ovl_ctrl = vop2_readl(vop2, RK3568_OVL_CTRL);
dd49ee4614cfb0 Andy Yan 2023-12-11  2556  	ovl_ctrl |= RK3568_OVL_CTRL__LAYERSEL_REGDONE_IMD;
dd49ee4614cfb0 Andy Yan 2023-12-11  2557  	if (vcstate->yuv_overlay)
dd49ee4614cfb0 Andy Yan 2023-12-11  2558  		ovl_ctrl |= RK3568_OVL_CTRL__YUV_MODE(vp->id);
dd49ee4614cfb0 Andy Yan 2023-12-11  2559  	else
dd49ee4614cfb0 Andy Yan 2023-12-11  2560  		ovl_ctrl &= ~RK3568_OVL_CTRL__YUV_MODE(vp->id);
dd49ee4614cfb0 Andy Yan 2023-12-11  2561  
dd49ee4614cfb0 Andy Yan 2023-12-11  2562  	vop2_writel(vop2, RK3568_OVL_CTRL, ovl_ctrl);
dd49ee4614cfb0 Andy Yan 2023-12-11  2563  
604be85547ce4d Andy Yan 2022-04-22  2564  	port_sel = vop2_readl(vop2, RK3568_OVL_PORT_SEL);
604be85547ce4d Andy Yan 2022-04-22  2565  	port_sel &= RK3568_OVL_PORT_SEL__SEL_PORT;
604be85547ce4d Andy Yan 2022-04-22  2566  
604be85547ce4d Andy Yan 2022-04-22  2567  	if (vp0->nlayers)
604be85547ce4d Andy Yan 2022-04-22  2568  		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT0_MUX,
604be85547ce4d Andy Yan 2022-04-22  2569  				     vp0->nlayers - 1);
604be85547ce4d Andy Yan 2022-04-22  2570  	else
604be85547ce4d Andy Yan 2022-04-22  2571  		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT0_MUX, 8);
604be85547ce4d Andy Yan 2022-04-22  2572  
604be85547ce4d Andy Yan 2022-04-22  2573  	if (vp1->nlayers)
604be85547ce4d Andy Yan 2022-04-22  2574  		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT1_MUX,
604be85547ce4d Andy Yan 2022-04-22  2575  				     (vp0->nlayers + vp1->nlayers - 1));
604be85547ce4d Andy Yan 2022-04-22  2576  	else
604be85547ce4d Andy Yan 2022-04-22  2577  		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT1_MUX, 8);
604be85547ce4d Andy Yan 2022-04-22  2578  
604be85547ce4d Andy Yan 2022-04-22  2579  	if (vp2->nlayers)
604be85547ce4d Andy Yan 2022-04-22  2580  		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT2_MUX,
604be85547ce4d Andy Yan 2022-04-22  2581  			(vp2->nlayers + vp1->nlayers + vp0->nlayers - 1));
604be85547ce4d Andy Yan 2022-04-22  2582  	else
2bdb481bf7a93c Andy Yan 2024-04-22  2583  		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT2_MUX, 8);
604be85547ce4d Andy Yan 2022-04-22  2584  
604be85547ce4d Andy Yan 2022-04-22  2585  	layer_sel = vop2_readl(vop2, RK3568_OVL_LAYER_SEL);
604be85547ce4d Andy Yan 2022-04-22  2586  
604be85547ce4d Andy Yan 2022-04-22  2587  	ofs = 0;
604be85547ce4d Andy Yan 2022-04-22  2588  	for (i = 0; i < vp->id; i++)
604be85547ce4d Andy Yan 2022-04-22  2589  		ofs += vop2->vps[i].nlayers;
604be85547ce4d Andy Yan 2022-04-22  2590  
604be85547ce4d Andy Yan 2022-04-22  2591  	drm_atomic_crtc_for_each_plane(plane, &vp->crtc) {
604be85547ce4d Andy Yan 2022-04-22  2592  		struct vop2_win *win = to_vop2_win(plane);
0ca953ac226eaf Andy Yan 2024-12-14  2593  		struct vop2_win *old_win;
0ca953ac226eaf Andy Yan 2024-12-14  2594  
0ca953ac226eaf Andy Yan 2024-12-14  2595  		layer_id = (u8)(plane->state->normalized_zpos + ofs);
0ca953ac226eaf Andy Yan 2024-12-14  2596  
0ca953ac226eaf Andy Yan 2024-12-14  2597  		/*
0ca953ac226eaf Andy Yan 2024-12-14  2598  		 * Find the layer this win bind in old state.
0ca953ac226eaf Andy Yan 2024-12-14  2599  		 */
0ca953ac226eaf Andy Yan 2024-12-14  2600  		for (old_layer_id = 0; old_layer_id < vop2->data->win_size; old_layer_id++) {
0ca953ac226eaf Andy Yan 2024-12-14  2601  			layer_sel_id = (layer_sel >> (4 * old_layer_id)) & 0xf;
0ca953ac226eaf Andy Yan 2024-12-14  2602  			if (layer_sel_id == win->data->layer_sel_id)
0ca953ac226eaf Andy Yan 2024-12-14  2603  				break;
0ca953ac226eaf Andy Yan 2024-12-14  2604  		}
0ca953ac226eaf Andy Yan 2024-12-14  2605  
0ca953ac226eaf Andy Yan 2024-12-14  2606  		/*
0ca953ac226eaf Andy Yan 2024-12-14  2607  		 * Find the win bind to this layer in old state
0ca953ac226eaf Andy Yan 2024-12-14  2608  		 */
0ca953ac226eaf Andy Yan 2024-12-14  2609  		for (i = 0; i < vop2->data->win_size; i++) {
0ca953ac226eaf Andy Yan 2024-12-14  2610  			old_win = &vop2->win[i];
0ca953ac226eaf Andy Yan 2024-12-14  2611  			layer_sel_id = (layer_sel >> (4 * layer_id)) & 0xf;
0ca953ac226eaf Andy Yan 2024-12-14  2612  			if (layer_sel_id == old_win->data->layer_sel_id)
0ca953ac226eaf Andy Yan 2024-12-14  2613  				break;
0ca953ac226eaf Andy Yan 2024-12-14  2614  		}
604be85547ce4d Andy Yan 2022-04-22  2615  
604be85547ce4d Andy Yan 2022-04-22  2616  		switch (win->data->phys_id) {
604be85547ce4d Andy Yan 2022-04-22  2617  		case ROCKCHIP_VOP2_CLUSTER0:
604be85547ce4d Andy Yan 2022-04-22  2618  			port_sel &= ~RK3568_OVL_PORT_SEL__CLUSTER0;
604be85547ce4d Andy Yan 2022-04-22  2619  			port_sel |= FIELD_PREP(RK3568_OVL_PORT_SEL__CLUSTER0, vp->id);
604be85547ce4d Andy Yan 2022-04-22  2620  			break;
604be85547ce4d Andy Yan 2022-04-22  2621  		case ROCKCHIP_VOP2_CLUSTER1:
604be85547ce4d Andy Yan 2022-04-22  2622  			port_sel &= ~RK3568_OVL_PORT_SEL__CLUSTER1;
604be85547ce4d Andy Yan 2022-04-22  2623  			port_sel |= FIELD_PREP(RK3568_OVL_PORT_SEL__CLUSTER1, vp->id);
604be85547ce4d Andy Yan 2022-04-22  2624  			break;
5a028e8f062fc8 Andy Yan 2023-12-11  2625  		case ROCKCHIP_VOP2_CLUSTER2:
5a028e8f062fc8 Andy Yan 2023-12-11  2626  			port_sel &= ~RK3588_OVL_PORT_SEL__CLUSTER2;
5a028e8f062fc8 Andy Yan 2023-12-11  2627  			port_sel |= FIELD_PREP(RK3588_OVL_PORT_SEL__CLUSTER2, vp->id);
5a028e8f062fc8 Andy Yan 2023-12-11  2628  			break;
5a028e8f062fc8 Andy Yan 2023-12-11  2629  		case ROCKCHIP_VOP2_CLUSTER3:
5a028e8f062fc8 Andy Yan 2023-12-11  2630  			port_sel &= ~RK3588_OVL_PORT_SEL__CLUSTER3;
5a028e8f062fc8 Andy Yan 2023-12-11  2631  			port_sel |= FIELD_PREP(RK3588_OVL_PORT_SEL__CLUSTER3, vp->id);
5a028e8f062fc8 Andy Yan 2023-12-11  2632  			break;
604be85547ce4d Andy Yan 2022-04-22  2633  		case ROCKCHIP_VOP2_ESMART0:
604be85547ce4d Andy Yan 2022-04-22  2634  			port_sel &= ~RK3568_OVL_PORT_SEL__ESMART0;
604be85547ce4d Andy Yan 2022-04-22  2635  			port_sel |= FIELD_PREP(RK3568_OVL_PORT_SEL__ESMART0, vp->id);
604be85547ce4d Andy Yan 2022-04-22  2636  			break;
604be85547ce4d Andy Yan 2022-04-22  2637  		case ROCKCHIP_VOP2_ESMART1:
604be85547ce4d Andy Yan 2022-04-22  2638  			port_sel &= ~RK3568_OVL_PORT_SEL__ESMART1;
604be85547ce4d Andy Yan 2022-04-22  2639  			port_sel |= FIELD_PREP(RK3568_OVL_PORT_SEL__ESMART1, vp->id);
604be85547ce4d Andy Yan 2022-04-22  2640  			break;
5a028e8f062fc8 Andy Yan 2023-12-11  2641  		case ROCKCHIP_VOP2_ESMART2:
5a028e8f062fc8 Andy Yan 2023-12-11  2642  			port_sel &= ~RK3588_OVL_PORT_SEL__ESMART2;
5a028e8f062fc8 Andy Yan 2023-12-11  2643  			port_sel |= FIELD_PREP(RK3588_OVL_PORT_SEL__ESMART2, vp->id);
5a028e8f062fc8 Andy Yan 2023-12-11  2644  			break;
5a028e8f062fc8 Andy Yan 2023-12-11  2645  		case ROCKCHIP_VOP2_ESMART3:
5a028e8f062fc8 Andy Yan 2023-12-11  2646  			port_sel &= ~RK3588_OVL_PORT_SEL__ESMART3;
5a028e8f062fc8 Andy Yan 2023-12-11  2647  			port_sel |= FIELD_PREP(RK3588_OVL_PORT_SEL__ESMART3, vp->id);
5a028e8f062fc8 Andy Yan 2023-12-11  2648  			break;
604be85547ce4d Andy Yan 2022-04-22  2649  		case ROCKCHIP_VOP2_SMART0:
604be85547ce4d Andy Yan 2022-04-22  2650  			port_sel &= ~RK3568_OVL_PORT_SEL__SMART0;
604be85547ce4d Andy Yan 2022-04-22  2651  			port_sel |= FIELD_PREP(RK3568_OVL_PORT_SEL__SMART0, vp->id);
604be85547ce4d Andy Yan 2022-04-22  2652  			break;
604be85547ce4d Andy Yan 2022-04-22  2653  		case ROCKCHIP_VOP2_SMART1:
604be85547ce4d Andy Yan 2022-04-22  2654  			port_sel &= ~RK3568_OVL_PORT_SEL__SMART1;
604be85547ce4d Andy Yan 2022-04-22  2655  			port_sel |= FIELD_PREP(RK3568_OVL_PORT_SEL__SMART1, vp->id);
604be85547ce4d Andy Yan 2022-04-22  2656  			break;
604be85547ce4d Andy Yan 2022-04-22  2657  		}
604be85547ce4d Andy Yan 2022-04-22  2658  
0ca953ac226eaf Andy Yan 2024-12-14  2659  		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(layer_id, 0x7);
0ca953ac226eaf Andy Yan 2024-12-14  2660  		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(layer_id, win->data->layer_sel_id);
0ca953ac226eaf Andy Yan 2024-12-14  2661  		/*
0ca953ac226eaf Andy Yan 2024-12-14  2662  		 * When we bind a window from layerM to layerN, we also need to move the old
0ca953ac226eaf Andy Yan 2024-12-14  2663  		 * window on layerN to layerM to avoid one window selected by two or more layers.
0ca953ac226eaf Andy Yan 2024-12-14  2664  		 */
0ca953ac226eaf Andy Yan 2024-12-14  2665  		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(old_layer_id, 0x7);
0ca953ac226eaf Andy Yan 2024-12-14 @2666  		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(old_layer_id, old_win->data->layer_sel_id);
604be85547ce4d Andy Yan 2022-04-22  2667  	}
604be85547ce4d Andy Yan 2022-04-22  2668  
604be85547ce4d Andy Yan 2022-04-22  2669  	vop2_writel(vop2, RK3568_OVL_LAYER_SEL, layer_sel);
604be85547ce4d Andy Yan 2022-04-22  2670  	vop2_writel(vop2, RK3568_OVL_PORT_SEL, port_sel);
604be85547ce4d Andy Yan 2022-04-22  2671  }
604be85547ce4d Andy Yan 2022-04-22  2672  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
