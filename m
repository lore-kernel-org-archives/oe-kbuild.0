Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857F07E
	for <oe-kbuild@lists.linux.dev>; Sat, 27 May 2023 20:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685218936; x=1716754936;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MZbzZLJ2IgSrQkuA6oMHj+c5gT2hBawUK9w8YGThtYI=;
  b=oBKeXJWI0b3mXrUr7fNsY+9RgM82iBMT8CxLID2ElTkHuxt9rd8tAOdC
   XX+iecTHf5+Ih48KIGTQcN+I3bwMWxzQVHv/ACD5n++1vf91uTFCaoO0V
   IrYuvHB1cbhh0w5bubQvg8gh6CsGey44O3IrmZHtn7IbpGsaRxpGz89uA
   uyijKz4b2jqr3DOaL49ZEuouXQXNq0HA8fg/Tbdgto6+IhIB/QdO6JNGK
   2C0L1dvJmGVVPwngBV5q/lAWyaqaFzbYVcRRBwgT2zQPRJUtNkwNHA2d5
   K0gmUuEJmmVa9sZxW0MDciZzesIIlbItISikBdAwMR9M78yo5RkzSGFKJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="440795920"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="440795920"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 13:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="708763108"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="708763108"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 May 2023 13:22:14 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q30QX-000KAk-0w;
	Sat, 27 May 2023 20:22:13 +0000
Date: Sun, 28 May 2023 04:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 01/15] drm/i915/plane: warn on non-zero plane
 offset
Message-ID: <202305280453.8yzCMS2i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <0988d237e56c56568f035053da8e2e2308a17d3a.1685119007.git.jani.nikula@intel.com>
References: <0988d237e56c56568f035053da8e2e2308a17d3a.1685119007.git.jani.nikula@intel.com>
TO: Jani Nikula <jani.nikula@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: jani.nikula@intel.com

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-i915-plane-warn-on-non-zero-plane-offset/20230527-003951
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/0988d237e56c56568f035053da8e2e2308a17d3a.1685119007.git.jani.nikula%40intel.com
patch subject: [Intel-gfx] [PATCH 01/15] drm/i915/plane: warn on non-zero plane offset
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-m031-20230526 (https://download.01.org/0day-ci/archive/20230528/202305280453.8yzCMS2i-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305280453.8yzCMS2i-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/i9xx_plane.c:1040 i9xx_get_initial_plane_config() error: uninitialized symbol 'offset'.

vim +/offset +1040 drivers/gpu/drm/i915/display/i9xx_plane.c

2a3014490cd18a Dave Airlie   2021-02-05   973  
2a3014490cd18a Dave Airlie   2021-02-05   974  void
2a3014490cd18a Dave Airlie   2021-02-05   975  i9xx_get_initial_plane_config(struct intel_crtc *crtc,
2a3014490cd18a Dave Airlie   2021-02-05   976  			      struct intel_initial_plane_config *plane_config)
2a3014490cd18a Dave Airlie   2021-02-05   977  {
2a3014490cd18a Dave Airlie   2021-02-05   978  	struct drm_device *dev = crtc->base.dev;
2a3014490cd18a Dave Airlie   2021-02-05   979  	struct drm_i915_private *dev_priv = to_i915(dev);
2a3014490cd18a Dave Airlie   2021-02-05   980  	struct intel_plane *plane = to_intel_plane(crtc->base.primary);
2a3014490cd18a Dave Airlie   2021-02-05   981  	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
2a3014490cd18a Dave Airlie   2021-02-05   982  	enum pipe pipe;
2a3014490cd18a Dave Airlie   2021-02-05   983  	u32 val, base, offset;
2a3014490cd18a Dave Airlie   2021-02-05   984  	int fourcc, pixel_format;
2a3014490cd18a Dave Airlie   2021-02-05   985  	unsigned int aligned_height;
2a3014490cd18a Dave Airlie   2021-02-05   986  	struct drm_framebuffer *fb;
2a3014490cd18a Dave Airlie   2021-02-05   987  	struct intel_framebuffer *intel_fb;
2a3014490cd18a Dave Airlie   2021-02-05   988  
2a3014490cd18a Dave Airlie   2021-02-05   989  	if (!plane->get_hw_state(plane, &pipe))
2a3014490cd18a Dave Airlie   2021-02-05   990  		return;
2a3014490cd18a Dave Airlie   2021-02-05   991  
2a3014490cd18a Dave Airlie   2021-02-05   992  	drm_WARN_ON(dev, pipe != crtc->pipe);
2a3014490cd18a Dave Airlie   2021-02-05   993  
2a3014490cd18a Dave Airlie   2021-02-05   994  	intel_fb = kzalloc(sizeof(*intel_fb), GFP_KERNEL);
2a3014490cd18a Dave Airlie   2021-02-05   995  	if (!intel_fb) {
2a3014490cd18a Dave Airlie   2021-02-05   996  		drm_dbg_kms(&dev_priv->drm, "failed to alloc fb\n");
2a3014490cd18a Dave Airlie   2021-02-05   997  		return;
2a3014490cd18a Dave Airlie   2021-02-05   998  	}
2a3014490cd18a Dave Airlie   2021-02-05   999  
2a3014490cd18a Dave Airlie   2021-02-05  1000  	fb = &intel_fb->base;
2a3014490cd18a Dave Airlie   2021-02-05  1001  
2a3014490cd18a Dave Airlie   2021-02-05  1002  	fb->dev = dev;
2a3014490cd18a Dave Airlie   2021-02-05  1003  
2a3014490cd18a Dave Airlie   2021-02-05  1004  	val = intel_de_read(dev_priv, DSPCNTR(i9xx_plane));
2a3014490cd18a Dave Airlie   2021-02-05  1005  
005e95377249cb Matt Roper    2021-03-19  1006  	if (DISPLAY_VER(dev_priv) >= 4) {
428cb15d5b0031 Ville Syrjälä 2022-01-21  1007  		if (val & DISP_TILED) {
2a3014490cd18a Dave Airlie   2021-02-05  1008  			plane_config->tiling = I915_TILING_X;
2a3014490cd18a Dave Airlie   2021-02-05  1009  			fb->modifier = I915_FORMAT_MOD_X_TILED;
2a3014490cd18a Dave Airlie   2021-02-05  1010  		}
2a3014490cd18a Dave Airlie   2021-02-05  1011  
428cb15d5b0031 Ville Syrjälä 2022-01-21  1012  		if (val & DISP_ROTATE_180)
2a3014490cd18a Dave Airlie   2021-02-05  1013  			plane_config->rotation = DRM_MODE_ROTATE_180;
2a3014490cd18a Dave Airlie   2021-02-05  1014  	}
2a3014490cd18a Dave Airlie   2021-02-05  1015  
2a3014490cd18a Dave Airlie   2021-02-05  1016  	if (IS_CHERRYVIEW(dev_priv) && pipe == PIPE_B &&
428cb15d5b0031 Ville Syrjälä 2022-01-21  1017  	    val & DISP_MIRROR)
2a3014490cd18a Dave Airlie   2021-02-05  1018  		plane_config->rotation |= DRM_MODE_REFLECT_X;
2a3014490cd18a Dave Airlie   2021-02-05  1019  
428cb15d5b0031 Ville Syrjälä 2022-01-21  1020  	pixel_format = val & DISP_FORMAT_MASK;
2a3014490cd18a Dave Airlie   2021-02-05  1021  	fourcc = i9xx_format_to_fourcc(pixel_format);
2a3014490cd18a Dave Airlie   2021-02-05  1022  	fb->format = drm_format_info(fourcc);
2a3014490cd18a Dave Airlie   2021-02-05  1023  
2a3014490cd18a Dave Airlie   2021-02-05  1024  	if (IS_HASWELL(dev_priv) || IS_BROADWELL(dev_priv)) {
2a3014490cd18a Dave Airlie   2021-02-05  1025  		offset = intel_de_read(dev_priv, DSPOFFSET(i9xx_plane));
428cb15d5b0031 Ville Syrjälä 2022-01-21  1026  		base = intel_de_read(dev_priv, DSPSURF(i9xx_plane)) & DISP_ADDR_MASK;
005e95377249cb Matt Roper    2021-03-19  1027  	} else if (DISPLAY_VER(dev_priv) >= 4) {
2a3014490cd18a Dave Airlie   2021-02-05  1028  		if (plane_config->tiling)
2a3014490cd18a Dave Airlie   2021-02-05  1029  			offset = intel_de_read(dev_priv,
2a3014490cd18a Dave Airlie   2021-02-05  1030  					       DSPTILEOFF(i9xx_plane));
2a3014490cd18a Dave Airlie   2021-02-05  1031  		else
2a3014490cd18a Dave Airlie   2021-02-05  1032  			offset = intel_de_read(dev_priv,
2a3014490cd18a Dave Airlie   2021-02-05  1033  					       DSPLINOFF(i9xx_plane));
428cb15d5b0031 Ville Syrjälä 2022-01-21  1034  		base = intel_de_read(dev_priv, DSPSURF(i9xx_plane)) & DISP_ADDR_MASK;
2a3014490cd18a Dave Airlie   2021-02-05  1035  	} else {
2a3014490cd18a Dave Airlie   2021-02-05  1036  		base = intel_de_read(dev_priv, DSPADDR(i9xx_plane));
2a3014490cd18a Dave Airlie   2021-02-05  1037  	}
2a3014490cd18a Dave Airlie   2021-02-05  1038  	plane_config->base = base;
2a3014490cd18a Dave Airlie   2021-02-05  1039  
40c3d9e9221e23 Jani Nikula   2023-05-26 @1040  	drm_WARN_ON(&dev_priv->drm, offset != 0);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
