Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCF17F
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Jul 2023 20:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688935798; x=1720471798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wEypsFe218V7/xMc92PPv+ObXBiz9yhD2Ys/otIjzik=;
  b=a0ljtS01TUizbFmpi6WBSWhlefNcpm9kvTwyNaLX4bRcBJJIG/AnhAk+
   MoIpZT94Dw19PLRYxznRGBCCpnjqF0uJ/hUGWNu95Dt1HywzwW9R/Pzcd
   aI0deN3XX2FfqvuSD8INHZCXJEYpe78jvLUipK8KHfs9xgW597njSM1e5
   ONGmyZjiitYHLLNLFCV6tRgXW6JZzSKNktaihcOCPmvNAos9GCEwys/lE
   UpgCDR7zADnYi62x+g3Z4ou0Y+DD403EsQQONHCupscMHDd9RCxxL+A0h
   5psirU6+UHyovdiHhptcf130u1Gnn9MylKTe59ROsec6vFZcLtX28fkx4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="344541579"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="344541579"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2023 13:49:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="720493572"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="720493572"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Jul 2023 13:49:55 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIbLv-0003NY-0J;
	Sun, 09 Jul 2023 20:49:55 +0000
Date: Mon, 10 Jul 2023 04:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [drm-misc:drm-misc-next 2/3]
 drivers/gpu/drm/loongson/lsdc_plane.c:199
 lsdc_cursor_plane_atomic_async_check() warn: variable dereferenced before
 check 'state' (see line 180)
Message-ID: <202307100423.rV7D05Uq-lkp@intel.com>
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
CC: dri-devel@lists.freedesktop.org
TO: Sui Jingfeng <suijingfeng@loongson.cn>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   8d1077cf2e43b15fefd76ebec2b71541eb27ef2c
commit: f39db26c54281da6a785259498ca74b5e470476f [2/3] drm: Add kms driver for loongson display controller
:::::: branch date: 6 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-m021-20230710 (https://download.01.org/0day-ci/archive/20230710/202307100423.rV7D05Uq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230710/202307100423.rV7D05Uq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307100423.rV7D05Uq-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/loongson/lsdc_plane.c:199 lsdc_cursor_plane_atomic_async_check() warn: variable dereferenced before check 'state' (see line 180)

vim +/state +199 drivers/gpu/drm/loongson/lsdc_plane.c

f39db26c54281d Sui Jingfeng 2023-06-15  173  
f39db26c54281d Sui Jingfeng 2023-06-15  174  static int lsdc_cursor_plane_atomic_async_check(struct drm_plane *plane,
f39db26c54281d Sui Jingfeng 2023-06-15  175  						struct drm_atomic_state *state)
f39db26c54281d Sui Jingfeng 2023-06-15  176  {
f39db26c54281d Sui Jingfeng 2023-06-15  177  	struct drm_plane_state *new_state;
f39db26c54281d Sui Jingfeng 2023-06-15  178  	struct drm_crtc_state *crtc_state;
f39db26c54281d Sui Jingfeng 2023-06-15  179  
f39db26c54281d Sui Jingfeng 2023-06-15 @180  	new_state = drm_atomic_get_new_plane_state(state, plane);
f39db26c54281d Sui Jingfeng 2023-06-15  181  
f39db26c54281d Sui Jingfeng 2023-06-15  182  	if (!plane->state || !plane->state->fb) {
f39db26c54281d Sui Jingfeng 2023-06-15  183  		drm_dbg(plane->dev, "%s: state is NULL\n", plane->name);
f39db26c54281d Sui Jingfeng 2023-06-15  184  		return -EINVAL;
f39db26c54281d Sui Jingfeng 2023-06-15  185  	}
f39db26c54281d Sui Jingfeng 2023-06-15  186  
f39db26c54281d Sui Jingfeng 2023-06-15  187  	if (new_state->crtc_w != new_state->crtc_h) {
f39db26c54281d Sui Jingfeng 2023-06-15  188  		drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
f39db26c54281d Sui Jingfeng 2023-06-15  189  			new_state->crtc_w, new_state->crtc_h);
f39db26c54281d Sui Jingfeng 2023-06-15  190  		return -EINVAL;
f39db26c54281d Sui Jingfeng 2023-06-15  191  	}
f39db26c54281d Sui Jingfeng 2023-06-15  192  
f39db26c54281d Sui Jingfeng 2023-06-15  193  	if (new_state->crtc_w != 64 && new_state->crtc_w != 32) {
f39db26c54281d Sui Jingfeng 2023-06-15  194  		drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
f39db26c54281d Sui Jingfeng 2023-06-15  195  			new_state->crtc_w, new_state->crtc_h);
f39db26c54281d Sui Jingfeng 2023-06-15  196  		return -EINVAL;
f39db26c54281d Sui Jingfeng 2023-06-15  197  	}
f39db26c54281d Sui Jingfeng 2023-06-15  198  
f39db26c54281d Sui Jingfeng 2023-06-15 @199  	if (state) {
f39db26c54281d Sui Jingfeng 2023-06-15  200  		crtc_state = drm_atomic_get_existing_crtc_state(state, new_state->crtc);
f39db26c54281d Sui Jingfeng 2023-06-15  201  	} else {
f39db26c54281d Sui Jingfeng 2023-06-15  202  		crtc_state = plane->crtc->state;
f39db26c54281d Sui Jingfeng 2023-06-15  203  		drm_dbg(plane->dev, "%s: atomic state is NULL\n", plane->name);
f39db26c54281d Sui Jingfeng 2023-06-15  204  	}
f39db26c54281d Sui Jingfeng 2023-06-15  205  
f39db26c54281d Sui Jingfeng 2023-06-15  206  	if (!crtc_state->active)
f39db26c54281d Sui Jingfeng 2023-06-15  207  		return -EINVAL;
f39db26c54281d Sui Jingfeng 2023-06-15  208  
f39db26c54281d Sui Jingfeng 2023-06-15  209  	if (plane->state->crtc != new_state->crtc ||
f39db26c54281d Sui Jingfeng 2023-06-15  210  	    plane->state->src_w != new_state->src_w ||
f39db26c54281d Sui Jingfeng 2023-06-15  211  	    plane->state->src_h != new_state->src_h ||
f39db26c54281d Sui Jingfeng 2023-06-15  212  	    plane->state->crtc_w != new_state->crtc_w ||
f39db26c54281d Sui Jingfeng 2023-06-15  213  	    plane->state->crtc_h != new_state->crtc_h)
f39db26c54281d Sui Jingfeng 2023-06-15  214  		return -EINVAL;
f39db26c54281d Sui Jingfeng 2023-06-15  215  
f39db26c54281d Sui Jingfeng 2023-06-15  216  	if (new_state->visible != plane->state->visible)
f39db26c54281d Sui Jingfeng 2023-06-15  217  		return -EINVAL;
f39db26c54281d Sui Jingfeng 2023-06-15  218  
f39db26c54281d Sui Jingfeng 2023-06-15  219  	return drm_atomic_helper_check_plane_state(plane->state,
f39db26c54281d Sui Jingfeng 2023-06-15  220  						   crtc_state,
f39db26c54281d Sui Jingfeng 2023-06-15  221  						   DRM_PLANE_NO_SCALING,
f39db26c54281d Sui Jingfeng 2023-06-15  222  						   DRM_PLANE_NO_SCALING,
f39db26c54281d Sui Jingfeng 2023-06-15  223  						   true, true);
f39db26c54281d Sui Jingfeng 2023-06-15  224  }
f39db26c54281d Sui Jingfeng 2023-06-15  225  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
