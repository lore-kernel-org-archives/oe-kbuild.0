Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7FF1FC2
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Apr 2023 12:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681041632; x=1712577632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u5hj+WIaNYYFf3mzQRgaUyHKdARvk9nljRC0ogaMwpU=;
  b=csGZN07yMYLCU5BL88RjZKXKqSqS1QNFgm4R1IonTPF5Q8ZwtMe10Ip7
   ZIU9KXuAHsaZarHjxAi/r0FdkqgF0qPS9XYxCHR6KSB7gLHvm0GPeFxN9
   2rd51qGGRbsqWmijCooRkRYj+G2yxaDFjkc8Mat3YuJlF0vITJDUIFhoz
   oVuEESoxPkdVt3qPgjcut5MHB5uSh1F/c3jCKwHIVZOJVP6o92P7P557Q
   4+1n9SXzxCIEA5XAAcPiOyE3gO/5mRW7+p1ioIs08Y9wrvZcVBnaD3kzT
   O+Gq/VUQVJKOiruA/u9eYc3q79lTbT3pyFTL4QIp7v4dR8q8USfChAEds
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="345875467"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="345875467"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 05:00:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="811871875"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="811871875"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Apr 2023 05:00:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plTie-000UVH-30;
	Sun, 09 Apr 2023 12:00:28 +0000
Date: Sun, 9 Apr 2023 19:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for
 reading IOR state
Message-ID: <202304091929.Sr0CfHlN-lkp@intel.com>
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
In-Reply-To: <20230407222133.1425969-2-lyude@redhat.com>
References: <20230407222133.1425969-2-lyude@redhat.com>
TO: Lyude Paul <lyude@redhat.com>
TO: dri-devel@lists.freedesktop.org
TO: nouveau@lists.freedesktop.org
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: Karol Herbst <kherbst@redhat.com>
CC: Jani Nikula <jani.nikula@intel.com>
CC: open list <linux-kernel@vger.kernel.org>
CC: Ben Skeggs <bskeggs@redhat.com>
CC: Dave Airlie <airlied@redhat.com>
CC: Kees Cook <keescook@chromium.org>

Hi Lyude,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/drm-nouveau-kms-Add-INHERIT-ioctl-to-nvkm-nvif-for-reading-IOR-state/20230408-062329
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230407222133.1425969-2-lyude%40redhat.com
patch subject: [PATCH 2/2] drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-randconfig-m031-20230409 (https://download.01.org/0day-ci/archive/20230409/202304091929.Sr0CfHlN-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304091929.Sr0CfHlN-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/nouveau/dispnv50/disp.c:2518 nv50_display_read_hw_or_state() error: uninitialized symbol 'head_idx'.

Old smatch warnings:
drivers/gpu/drm/nouveau/dispnv50/disp.c:2311 nv50_disp_outp_atomic_check_clr() warn: passing a valid pointer to 'PTR_ERR'
drivers/gpu/drm/nouveau/dispnv50/disp.c:2340 nv50_disp_outp_atomic_check_set() warn: passing a valid pointer to 'PTR_ERR'

vim +/head_idx +2518 drivers/gpu/drm/nouveau/dispnv50/disp.c

26f6d88b327060 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs 2011-07-04  2476  
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2477  static inline void
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2478  nv50_display_read_hw_or_state(struct drm_device *dev, struct nv50_disp *disp,
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2479  			      struct nouveau_encoder *outp)
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2480  {
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2481  	struct drm_crtc *crtc;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2482  	struct drm_connector_list_iter conn_iter;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2483  	struct drm_connector *conn;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2484  	struct nv50_head_atom *armh;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2485  	const u32 encoder_mask = drm_encoder_mask(&outp->base.base);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2486  	bool found_conn = false, found_head = false;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2487  	u8 proto;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2488  	int head_idx;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2489  	int ret;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2490  
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2491  	switch (outp->dcb->type) {
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2492  	case DCB_OUTPUT_TMDS:
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2493  		ret = nvif_outp_inherit_tmds(&outp->outp, &proto);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2494  		break;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2495  	case DCB_OUTPUT_DP:
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2496  		ret = nvif_outp_inherit_dp(&outp->outp, &proto);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2497  		break;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2498  	case DCB_OUTPUT_LVDS:
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2499  		ret = nvif_outp_inherit_lvds(&outp->outp, &proto);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2500  		break;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2501  	case DCB_OUTPUT_ANALOG:
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2502  		ret = nvif_outp_inherit_rgb_crt(&outp->outp, &proto);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2503  		break;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2504  	default:
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2505  		drm_dbg_kms(dev, "Readback for %s not implemented yet, skipping\n",
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2506  			    outp->base.base.name);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2507  		drm_WARN_ON(dev, true);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2508  		return;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2509  	}
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2510  	if (ret >= 0) {
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2511  		head_idx = ret;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2512  		ret = 0;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2513  	} else if (ret == -ENODEV) {
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2514  		return;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2515  	}
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2516  
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2517  	drm_for_each_crtc(crtc, dev) {
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07 @2518  		if (crtc->index != head_idx)
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2519  			continue;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2520  
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2521  		armh = nv50_head_atom(crtc->state);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2522  		found_head = true;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2523  		break;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2524  	}
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2525  	if (drm_WARN_ON(dev, !found_head))
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2526  		return;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2527  
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2528  	/* Figure out which connector is being used by this encoder */
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2529  	drm_connector_list_iter_begin(dev, &conn_iter);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2530  	nouveau_for_each_non_mst_connector_iter(conn, &conn_iter) {
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2531  		if (nouveau_connector(conn)->index == outp->dcb->connector) {
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2532  			found_conn = true;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2533  			break;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2534  		}
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2535  	}
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2536  	drm_connector_list_iter_end(&conn_iter);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2537  	if (drm_WARN_ON(dev, !found_conn))
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2538  		return;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2539  
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2540  	armh->state.encoder_mask = encoder_mask;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2541  	armh->state.connector_mask = drm_connector_mask(conn);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2542  	armh->state.active = true;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2543  	armh->state.enable = true;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2544  
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2545  	outp->crtc = crtc;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2546  	outp->ctrl = NVVAL(NV507D, SOR_SET_CONTROL, PROTOCOL, proto) | BIT(crtc->index);
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2547  
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2548  	conn->state->crtc = crtc;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2549  	conn->state->best_encoder = &outp->base.base;
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2550  }
a3d963915cf6f2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-04-07  2551  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
