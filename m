Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60BB16F0FE
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Oct 2025 01:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761613425; cv=none; b=ooqyTxQ4vTU1GWLuZjepR0qierHa/cIiP2MTdOWSeFJQtuEAQvOdYqw6VjeSxsFBAhaqbPyrQcR8u4xUVRTMPpIcRVEwGs4dyCe6oSg1w2DXScekknrHPnKnht4f5KewajmvCo4QVHNRFZQ/mwKY779JJOlMfAR5fPScuSAykPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761613425; c=relaxed/simple;
	bh=K3hBgUYi0i3qPbZbailMIqI+DUlItRlQB0q5OPgo3yc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fDvS9SsHcMmoV/vVpzRO3wyXXTYITVFun41MxX12qvrPhs7uO55VKEmk9EivWtt7fCeGGz0ZyzHRjI0iMP/KuPQglWpyGiaEpfYH/82U/62t7F/1zD1ABcIL00dlmeIgk0H40dnm2V5sBxRzduvyJPEYQ6H2FvRqxXNaQOlFKBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PrXHcl1q; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PrXHcl1q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761613424; x=1793149424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K3hBgUYi0i3qPbZbailMIqI+DUlItRlQB0q5OPgo3yc=;
  b=PrXHcl1qWSqA97M3C6ziI97h/pPajxYU1CCz2GusIU280OwWDxD4/u87
   VkysvF3gYaqFCZaHxJeuXP2Xm6+ina4bg7OppOKUsDrMiFGFAROl/zgTX
   nMsVSKh+TvmfEWnGrRZh/ORE/J19abDFbgX+sdETiKxZzuQACCdCUzZcR
   PqEOdAIbfgN7g2XqEotG+QEUCyqw8BhtRqqUUpO9nBsmuCCI1gK/o2wIC
   GcRpwsJ/2j0bDmo9UEsvAfM0n3wmVR0ES7rjXX93F5r1rNgSV2xO+J8y8
   7YLrt4EL2LRJYmB8t/dAThfx4cqtbtw3vZGSqmtJsA3nDzFjCO70lAz//
   w==;
X-CSE-ConnectionGUID: ePxkt21aQQiQGwG8mpP4xA==
X-CSE-MsgGUID: rYuASXFFRimW5v5CqeHWJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63612247"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="63612247"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 18:03:43 -0700
X-CSE-ConnectionGUID: w2HuNgrVQ0SO/UiYZf3jpg==
X-CSE-MsgGUID: u6GmCe2QTuyhvMPFTPLtIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="185285486"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Oct 2025 18:03:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDY7f-000IcX-0W;
	Tue, 28 Oct 2025 01:03:39 +0000
Date: Tue, 28 Oct 2025 09:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm/fb-helper: Allocate and release fb_info in single
 place
Message-ID: <202510280851.jRzrud3s-lkp@intel.com>
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
In-Reply-To: <20251026173944.219373-1-tzimmermann@suse.de>
References: <20251026173944.219373-1-tzimmermann@suse.de>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: javierm@redhat.com
TO: airlied@gmail.com
TO: simona@ffwll.ch
TO: linux@armlinux.org.uk
TO: maarten.lankhorst@linux.intel.com
TO: mripard@kernel.org
TO: inki.dae@samsung.com
TO: sw0312.kim@samsung.com
TO: kyungmin.park@samsung.com
TO: patrik.r.jakobsson@gmail.com
TO: jani.nikula@linux.intel.com
TO: rodrigo.vivi@intel.com
TO: robin.clark@oss.qualcomm.com
TO: lumag@kernel.org
TO: abhinav.kumar@linux.dev
TO: sean@poorly.run
TO: marijn.suijten@somainline.org
TO: tomi.valkeinen@ideasonboard.com
TO: alexander.deucher@amd.com
TO: christian.koenig@amd.com
TO: thierry.reding@gmail.com
TO: mperttunen@nvidia.com
TO: jonathanh@nvidia.com
CC: dri-devel@lists.freedesktop.org
CC: intel-gfx@lists.freedesktop.org
CC: intel-xe@lists.freedesktop.org
CC: linux-arm-msm@vger.kernel.org
CC: freedreno@lists.freedesktop.org
CC: amd-gfx@lists.freedesktop.org
CC: linux-tegra@vger.kernel.org

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on drm-i915/for-linux-next drm-i915/for-linux-next-fixes tegra/for-next linus/master v6.18-rc3 next-20251027]
[cannot apply to rmk-arm/drm-armada-devel rmk-arm/drm-armada-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-fb-helper-Allocate-and-release-fb_info-in-single-place/20251027-014054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20251026173944.219373-1-tzimmermann%40suse.de
patch subject: [PATCH] drm/fb-helper: Allocate and release fb_info in single place
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: i386-randconfig-141-20251027 (https://download.01.org/0day-ci/archive/20251028/202510280851.jRzrud3s-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510280851.jRzrud3s-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_fbdev_ttm.c:208 drm_fbdev_ttm_driver_fbdev_probe() error: uninitialized symbol 'info'.

vim +/info +208 drivers/gpu/drm/drm_fbdev_ttm.c

8ab59da26bc0ae drivers/gpu/drm/drm_fbdev_generic.c Thomas Zimmermann 2022-11-03  169  
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  170  /*
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  171   * struct drm_driver
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  172   */
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  173  
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  174  int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  175  				     struct drm_fb_helper_surface_size *sizes)
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  176  {
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  177  	struct drm_client_dev *client = &fb_helper->client;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  178  	struct drm_device *dev = fb_helper->dev;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  179  	struct drm_client_buffer *buffer;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  180  	struct fb_info *info;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  181  	size_t screen_size;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  182  	void *screen_buffer;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  183  	u32 format;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  184  	int ret;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  185  
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  186  	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  187  		    sizes->surface_width, sizes->surface_height,
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  188  		    sizes->surface_bpp);
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  189  
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  190  	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  191  					     sizes->surface_depth);
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  192  	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  193  					       sizes->surface_height, format);
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  194  	if (IS_ERR(buffer))
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  195  		return PTR_ERR(buffer);
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  196  
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  197  	fb_helper->funcs = &drm_fbdev_ttm_helper_funcs;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  198  	fb_helper->buffer = buffer;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  199  	fb_helper->fb = buffer->fb;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  200  
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  201  	screen_size = buffer->gem->size;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  202  	screen_buffer = vzalloc(screen_size);
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  203  	if (!screen_buffer) {
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  204  		ret = -ENOMEM;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  205  		goto err_drm_client_framebuffer_delete;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  206  	}
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  207  
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24 @208  	drm_fb_helper_fill_info(info, fb_helper, sizes);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
