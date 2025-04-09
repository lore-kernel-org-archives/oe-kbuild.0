Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90001E25F2
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Apr 2025 19:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744227891; cv=none; b=uMvG+N2QjMSK0F1UnqVLngLQarhhfwXqgKt1dNtVdrQ0usUJsIR/IqRP6OUhSizBlgmg6PQ6RBmGzbAF+p+eBvnBCGFy9kF4kxcM+4+MzvYV1TIqCyvd8NxrRDudjpTxKLBCOqzAf2LIdVVmkXrKm//Ih19Yb4olqiPAYlczWNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744227891; c=relaxed/simple;
	bh=5K6OIrM/R+4CBAhu3ZErXCoMzNqto7VWhxLWyMTBeZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dtd9xCWL8o8smuEdvMRdjKDBjmNGHiioHs0a3iQXzhovt7TsNilhy96bYg+toP4gFJmMOR4+BVstOgspjnfLLf+d03cHqZADTI3VgLdefjWpCKB2rvSJ0RwFpT5CdW7KINKZVqKu22dIW0ON+IQ7rWP+p10uOfuBoT6vtRsQW3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a7NUi9kU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7NUi9kU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744227889; x=1775763889;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5K6OIrM/R+4CBAhu3ZErXCoMzNqto7VWhxLWyMTBeZY=;
  b=a7NUi9kUjk7PRJxIlwvRVlSePbGtq4flxlTmMInppzeQhgOXOW9oL7jE
   4Sgl1PDgirx3x39RxrlvA5//y/2SG4WqsWDZFGcEUUctQ0abTUQWVN1HW
   mllTTSbKZBwcCsM5RZrdceQQOE4KmF2XHixUHRaGflJBvFM/6PqSOq7NJ
   k4EnaMWKRbKDIRe9TT7ZWn3mxfrbfqGjh3UpiA8wk7SnOXzJbOL89HTJ3
   3W3DghsxgbD/8dDgip0idg9EDInGTwhV7foekhEE37d4QyHZpV2hRheDm
   V0dvRy4YcmYSDtKGjtQEbXm9bz/n2q2gS3KyYULbe5nGRUPEiUPPBX352
   Q==;
X-CSE-ConnectionGUID: NEcaE4EaSgaZMByBlDUQcw==
X-CSE-MsgGUID: dj0Ba57aRFG/ayEsdGPISw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="56390064"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="56390064"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 12:44:48 -0700
X-CSE-ConnectionGUID: egh6Z+C7TiqAmrvkh97oEw==
X-CSE-MsgGUID: EoXmQX2YQeWP/D9n6ytdKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="129238899"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Apr 2025 12:44:47 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2bLo-0009FX-1M;
	Wed, 09 Apr 2025 19:44:44 +0000
Date: Thu, 10 Apr 2025 03:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/5] drm/i915/plane: rename intel_atomic_plane.[ch] to
 intel_plane.[ch]
Message-ID: <202504100334.QozsgOJz-lkp@intel.com>
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
In-Reply-To: <6a8b41453944c9787405d549caf8c1214dae3800.1744129283.git.jani.nikula@intel.com>
References: <6a8b41453944c9787405d549caf8c1214dae3800.1744129283.git.jani.nikula@intel.com>
TO: Jani Nikula <jani.nikula@intel.com>
TO: intel-gfx@lists.freedesktop.org
TO: intel-xe@lists.freedesktop.org
CC: jani.nikula@intel.com

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on next-20250409]
[cannot apply to drm-xe/drm-xe-next linus/master v6.15-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-i915-plane-rename-intel_atomic_plane-ch-to-intel_plane-ch/20250409-002500
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/6a8b41453944c9787405d549caf8c1214dae3800.1744129283.git.jani.nikula%40intel.com
patch subject: [PATCH 1/5] drm/i915/plane: rename intel_atomic_plane.[ch] to intel_plane.[ch]
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-141-20250410 (https://download.01.org/0day-ci/archive/20250410/202504100334.QozsgOJz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504100334.QozsgOJz-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_plane.c:672 intel_plane_atomic_check_with_state() error: we previously assumed 'fb' could be null (see line 660)

vim +/fb +672 drivers/gpu/drm/i915/display/intel_plane.c

c17897428e1d25 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-02-11  640  
b2b55502d683c7 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2017-08-23  641  int intel_plane_atomic_check_with_state(const struct intel_crtc_state *old_crtc_state,
790cc9941b137e drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-01-11  642  					struct intel_crtc_state *new_crtc_state,
b2b55502d683c7 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2017-08-23  643  					const struct intel_plane_state *old_plane_state,
790cc9941b137e drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-01-11  644  					struct intel_plane_state *new_plane_state)
ea2c67bb4affa8 drivers/gpu/drm/i915/intel_atomic_plane.c         Matt Roper        2014-12-23  645  {
f90a85e76c2a89 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-10-31  646  	struct intel_plane *plane = to_intel_plane(new_plane_state->uapi.plane);
7d8d2cbce5af5e drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2020-01-10  647  	const struct drm_framebuffer *fb = new_plane_state->hw.fb;
da20eabd2c6976 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten Lankhorst 2015-06-15  648  	int ret;
ea2c67bb4affa8 drivers/gpu/drm/i915/intel_atomic_plane.c         Matt Roper        2014-12-23  649  
cb1824bb1ec6b4 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2020-03-18  650  	intel_plane_set_invisible(new_crtc_state, new_plane_state);
ee42ec19ca2e55 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2020-11-24  651  	new_crtc_state->enabled_planes &= ~BIT(plane->id);
62ef0dd3cc0c21 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten Lankhorst 2018-09-20  652  
7b3cb17a48dc1b drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-10-31  653  	if (!new_plane_state->hw.crtc && !old_plane_state->hw.crtc)
c196e1d66c36b0 drivers/gpu/drm/i915/intel_atomic_plane.c         Matt Roper        2015-01-21  654  		return 0;
c196e1d66c36b0 drivers/gpu/drm/i915/intel_atomic_plane.c         Matt Roper        2015-01-21  655  
790cc9941b137e drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-01-11  656  	ret = plane->check_plane(new_crtc_state, new_plane_state);
c389c9c4d981e4 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten Lankhorst 2015-06-15  657  	if (ret)
da20eabd2c6976 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten Lankhorst 2015-06-15  658  		return ret;
da20eabd2c6976 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten Lankhorst 2015-06-15  659  
97bc7ffa1b1e9a drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2021-03-05 @660  	if (fb)
97bc7ffa1b1e9a drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2021-03-05  661  		new_crtc_state->enabled_planes |= BIT(plane->id);
97bc7ffa1b1e9a drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2021-03-05  662  
e9728bd888e1fa drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2017-03-02  663  	/* FIXME pre-g4x don't work like this */
f90a85e76c2a89 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-10-31  664  	if (new_plane_state->uapi.visible)
790cc9941b137e drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-01-11  665  		new_crtc_state->active_planes |= BIT(plane->id);
e9728bd888e1fa drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2017-03-02  666  
3358e2ca0ebd64 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-02-11  667  	if (new_plane_state->uapi.visible &&
3358e2ca0ebd64 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-02-11  668  	    intel_plane_is_scaled(new_plane_state))
3358e2ca0ebd64 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-02-11  669  		new_crtc_state->scaled_planes |= BIT(plane->id);
3358e2ca0ebd64 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-02-11  670  
f90a85e76c2a89 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-10-31  671  	if (new_plane_state->uapi.visible &&
4941f35b48f7f3 drivers/gpu/drm/i915/display/intel_atomic_plane.c Imre Deak         2019-12-21 @672  	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
790cc9941b137e drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-01-11  673  		new_crtc_state->nv12_planes |= BIT(plane->id);
8e021151948c56 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten Lankhorst 2018-05-12  674  
f90a85e76c2a89 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-10-31  675  	if (new_plane_state->uapi.visible &&
d1d23d7f4be6a6 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2019-09-13  676  	    fb->format->format == DRM_FORMAT_C8)
02c52f1ed20aba drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-02-07  677  		new_crtc_state->c8_planes |= BIT(plane->id);
02c52f1ed20aba drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-02-07  678  
f90a85e76c2a89 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-10-31  679  	if (new_plane_state->uapi.visible || old_plane_state->uapi.visible)
790cc9941b137e drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-01-11  680  		new_crtc_state->update_planes |= BIT(plane->id);
afbd8a722bd64e drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2018-11-27  681  
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  682  	if (new_plane_state->uapi.visible &&
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  683  	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier)) {
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  684  		new_crtc_state->data_rate_y[plane->id] =
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  685  			intel_plane_data_rate(new_crtc_state, new_plane_state, 0);
c457d9cf256e94 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-05-24  686  		new_crtc_state->data_rate[plane->id] =
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  687  			intel_plane_data_rate(new_crtc_state, new_plane_state, 1);
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  688  
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  689  		new_crtc_state->rel_data_rate_y[plane->id] =
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  690  			intel_plane_relative_data_rate(new_crtc_state,
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  691  						       new_plane_state, 0);
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  692  		new_crtc_state->rel_data_rate[plane->id] =
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  693  			intel_plane_relative_data_rate(new_crtc_state,
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  694  						       new_plane_state, 1);
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  695  	} else if (new_plane_state->uapi.visible) {
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  696  		new_crtc_state->data_rate[plane->id] =
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  697  			intel_plane_data_rate(new_crtc_state, new_plane_state, 0);
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  698  
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  699  		new_crtc_state->rel_data_rate[plane->id] =
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  700  			intel_plane_relative_data_rate(new_crtc_state,
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  701  						       new_plane_state, 0);
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  702  	}
c457d9cf256e94 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-05-24  703  
4f25720b2c04a3 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-06-28  704  	return intel_plane_atomic_calc_changes(old_crtc_state, new_crtc_state,
4f25720b2c04a3 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-06-28  705  					       old_plane_state, new_plane_state);
4f25720b2c04a3 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-06-28  706  }
4f25720b2c04a3 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-06-28  707  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
