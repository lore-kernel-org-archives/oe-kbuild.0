Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A27224CC
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Apr 2024 05:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712296719; cv=none; b=tXY+zVKb+kPkgbRxrET8uZivT8tUqmDvUKh+APXJ8U+VKK824OA2fm0jL2k5ICSW7En3eOIiWdN5g8YCJBPzhpbtlKyyuQU96DZzznvrncwxHnotwC7QL/Qwdxih4sVmHwdjpgCWk2qdLMDCkxBwL8MYRbs4ZRXXwEIarMh4uiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712296719; c=relaxed/simple;
	bh=i5ov2AEx2kn+qfO9B3/aez8kUSRgfVwlXLRgFFnTc9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e6OlIulhkrZfzXC1t0pYGU7wTuNfE4i7flkJaxU8CG1Od+3nyXWf236LjkOIbDhLfwihWsBbZsRa4MEDI1CeUeEtRJTPtjnXGGijyIIHQLze7YPjFQNYcJZL9dTNtAeXZLwS6V6046iF1Lq1PHHDjjqH3Csg2Pw+9fRlxLZ7xu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+LcV3eQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+LcV3eQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712296717; x=1743832717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i5ov2AEx2kn+qfO9B3/aez8kUSRgfVwlXLRgFFnTc9w=;
  b=N+LcV3eQzg1cd2WY66uw3Eil7reC1u8c1ILk8eXJHtQZ5VLTjimI2Inq
   C3t9uK9O3aoUpvqjiBYMmtJVvaBLCfe7mazunDypCmQFZ9osb/n3Lvxg0
   QKW2DmRrvorQJGOGOosSC+cuQ6MN2o7Cpl+wPtmSZsDlhj6f72r7vMIh1
   Qb3l8O0YvEKK/aU2tswphjH3BKO/NydsR7VytdWPftyDCRToLJGXYe6E3
   c/Q8Lv40q1+w1aKXds1QLvFvBJAPNEoHAfMf1ZRss4F1mlr3WcQP86vGC
   Ibo+qDSrlygZiyz+O8QkViecMdrLt6H2Q6dW8xyhhunScCWpNre4JHbOY
   Q==;
X-CSE-ConnectionGUID: YL6ctHfFT4uVDMHBEoK+jg==
X-CSE-MsgGUID: FUJYDj/OQuirVn/gjmbEDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="18966826"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18966826"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 22:58:32 -0700
X-CSE-ConnectionGUID: OwmQy4T0Qie06OQ5mvwkOw==
X-CSE-MsgGUID: o49sTfn4Tya+17PNrmBPPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="42228962"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Apr 2024 22:58:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rscaq-0001xI-2Q;
	Fri, 05 Apr 2024 05:58:28 +0000
Date: Fri, 5 Apr 2024 13:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 7/7] drm/udl: Remove struct udl_connector
Message-ID: <202404051359.Y6AgUwFi-lkp@intel.com>
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
In-Reply-To: <20240404150857.5520-8-tzimmermann@suse.de>
References: <20240404150857.5520-8-tzimmermann@suse.de>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: javierm@redhat.com
TO: jani.nikula@linux.intel.com
TO: airlied@redhat.com
TO: sean@poorly.run
CC: dri-devel@lists.freedesktop.org
CC: Thomas Zimmermann <tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.9-rc2 next-20240405]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-edid-Implement-drm_probe_ddc-with-drm_edid_probe_custom/20240404-231057
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240404150857.5520-8-tzimmermann%40suse.de
patch subject: [PATCH 7/7] drm/udl: Remove struct udl_connector
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: parisc-randconfig-r071-20240405 (https://download.01.org/0day-ci/archive/20240405/202404051359.Y6AgUwFi-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404051359.Y6AgUwFi-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/udl/udl_modeset.c:527 udl_modeset_init() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +527 drivers/gpu/drm/udl/udl_modeset.c

5320918b9a87865 Dave Airlie       2010-12-15  478  
5320918b9a87865 Dave Airlie       2010-12-15  479  int udl_modeset_init(struct drm_device *dev)
5320918b9a87865 Dave Airlie       2010-12-15  480  {
6ae355a260d25d2 Daniel Vetter     2020-04-15  481  	struct udl_device *udl = to_udl(dev);
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  482  	struct drm_plane *primary_plane;
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  483  	struct drm_crtc *crtc;
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  484  	struct drm_encoder *encoder;
e829cf0b30b4b55 Thomas Zimmermann 2019-12-10  485  	struct drm_connector *connector;
e829cf0b30b4b55 Thomas Zimmermann 2019-12-10  486  	int ret;
e829cf0b30b4b55 Thomas Zimmermann 2019-12-10  487  
fe5b7c86d6068ac Daniel Vetter     2020-03-23  488  	ret = drmm_mode_config_init(dev);
fe5b7c86d6068ac Daniel Vetter     2020-03-23  489  	if (ret)
fe5b7c86d6068ac Daniel Vetter     2020-03-23  490  		return ret;
5320918b9a87865 Dave Airlie       2010-12-15  491  
5320918b9a87865 Dave Airlie       2010-12-15  492  	dev->mode_config.min_width = 640;
5320918b9a87865 Dave Airlie       2010-12-15  493  	dev->mode_config.min_height = 480;
5320918b9a87865 Dave Airlie       2010-12-15  494  	dev->mode_config.max_width = 2048;
5320918b9a87865 Dave Airlie       2010-12-15  495  	dev->mode_config.max_height = 2048;
d8177841aa8a5d3 Thomas Zimmermann 2019-12-10  496  	dev->mode_config.preferred_depth = 16;
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  497  	dev->mode_config.funcs = &udl_mode_config_funcs;
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  498  
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  499  	primary_plane = &udl->primary_plane;
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  500  	ret = drm_universal_plane_init(dev, primary_plane, 0,
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  501  				       &udl_primary_plane_funcs,
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  502  				       udl_primary_plane_formats,
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  503  				       ARRAY_SIZE(udl_primary_plane_formats),
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  504  				       udl_primary_plane_fmtmods,
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  505  				       DRM_PLANE_TYPE_PRIMARY, NULL);
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  506  	if (ret)
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  507  		return ret;
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  508  	drm_plane_helper_add(primary_plane, &udl_primary_plane_helper_funcs);
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  509  	drm_plane_enable_fb_damage_clips(primary_plane);
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  510  
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  511  	crtc = &udl->crtc;
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  512  	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  513  					&udl_crtc_funcs, NULL);
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  514  	if (ret)
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  515  		return ret;
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  516  	drm_crtc_helper_add(crtc, &udl_crtc_helper_funcs);
5320918b9a87865 Dave Airlie       2010-12-15  517  
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  518  	encoder = &udl->encoder;
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  519  	ret = drm_encoder_init(dev, encoder, &udl_encoder_funcs, DRM_MODE_ENCODER_DAC, NULL);
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  520  	if (ret)
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  521  		return ret;
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  522  	encoder->possible_crtcs = drm_crtc_mask(crtc);
5320918b9a87865 Dave Airlie       2010-12-15  523  
a80d9e00c8195dc Thomas Zimmermann 2024-04-04  524  	connector = &udl->connector;
a80d9e00c8195dc Thomas Zimmermann 2024-04-04  525  	ret = drm_connector_init(dev, connector, &udl_connector_funcs, DRM_MODE_CONNECTOR_VGA);
a80d9e00c8195dc Thomas Zimmermann 2024-04-04  526  	if (ret)
fe5b7c86d6068ac Daniel Vetter     2020-03-23 @527  		return PTR_ERR(connector);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
