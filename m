Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2925E228CBC
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 09:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765617266; cv=none; b=o5+ZIsUSePgv48a7Z3kxqGORIa7wiJPi4xwaqRzWak1qdJeBHP7r/826n63dtTaVP2ntSd5qFNp8TvItOeXsFs1qChmaeXqea/I83x6jjkPm7cY7iURtHxjFxV3gN9ShBiNPVeBMx6o8s3LvpB/E5UIMUFxABzzeWfUXxo9JIUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765617266; c=relaxed/simple;
	bh=bo6bZvfxJEIu8JcvrOVjmOyqcyolZMGyueTYRhz1/jM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VnzsxgPY3TONLPgI9UBuV6F+ft1rfEgMOb3jc+owT5y3jrDCrSxe3pyy3RgoY7iHlwlKU26jixkVzcbu0b5VQXDp5cgBpg+HAt0O+zds6N6R2mxJae5K5PjLfKcuin8xuame/LDBS5p0lTX5X0FIIsbrAWeHY71zy5PR1xrn8iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STz5lFF/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STz5lFF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765617265; x=1797153265;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bo6bZvfxJEIu8JcvrOVjmOyqcyolZMGyueTYRhz1/jM=;
  b=STz5lFF/IPG0Xp3Ie9qSaU8rppJGTE+uOhfk3TurQFo79+c44HSOoPX6
   LGsLkcvsSWl3SBExrKbUcNbvPcYzuD95J2coNkM4hKSOGuvBa6L3oJEIu
   2IR1j8hHuPwUGQiRzoYlpbcMqztbBcUsZWFYt1qQuilJOKTpc/cXhOA0a
   o9u1rnT9q3iyKIB7cK0O2+He9zI8v5eXmq5meliaj9ykARsYfMN4LRcCo
   a09bGrTardCZ3h8UQEokTo+9SwwFm9NX8i/J8j/ANAuT2h1bPwox0tZZF
   noDw6BQZeTRLmZxHxE2sazMm65AvU8i4HazFoU+XMlAZRuiOgSy3H9u+W
   A==;
X-CSE-ConnectionGUID: ljqaHK9FRnawrBUvvnQ9ig==
X-CSE-MsgGUID: XJqVVfsNS4m2U4jVbzHQRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67676906"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67676906"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 01:14:25 -0800
X-CSE-ConnectionGUID: SJB5KBXcSIC1OCwvGcHCoA==
X-CSE-MsgGUID: YW5cGzRBTaiYEnWYnSDoIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="228344280"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Dec 2025 01:14:23 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vULhk-000000007Or-2tfw;
	Sat, 13 Dec 2025 09:14:20 +0000
Date: Sat, 13 Dec 2025 17:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/display/intel_plane.c:687
 intel_plane_atomic_check_with_state() error: we previously assumed 'fb'
 could be null (see line 675)
Message-ID: <202512131726.qq3Ii5CP-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Jani Nikula <jani.nikula@intel.com>
CC: Gustavo Sousa <gustavo.sousa@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: a649c2abfae0c68d07f127ff4e570c44636afe7e drm/i915/plane: rename intel_atomic_plane.[ch] to intel_plane.[ch]
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131726.qq3Ii5CP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131726.qq3Ii5CP-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_plane.c:687 intel_plane_atomic_check_with_state() error: we previously assumed 'fb' could be null (see line 675)

vim +/fb +687 drivers/gpu/drm/i915/display/intel_plane.c

c17897428e1d259 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-02-11  655  
b2b55502d683c72 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2017-08-23  656  int intel_plane_atomic_check_with_state(const struct intel_crtc_state *old_crtc_state,
790cc9941b137e0 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-01-11  657  					struct intel_crtc_state *new_crtc_state,
b2b55502d683c72 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2017-08-23  658  					const struct intel_plane_state *old_plane_state,
790cc9941b137e0 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-01-11  659  					struct intel_plane_state *new_plane_state)
ea2c67bb4affa84 drivers/gpu/drm/i915/intel_atomic_plane.c         Matt Roper        2014-12-23  660  {
f90a85e76c2a89e drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-10-31  661  	struct intel_plane *plane = to_intel_plane(new_plane_state->uapi.plane);
7d8d2cbce5af5ed drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2020-01-10  662  	const struct drm_framebuffer *fb = new_plane_state->hw.fb;
da20eabd2c69761 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten Lankhorst 2015-06-15  663  	int ret;
ea2c67bb4affa84 drivers/gpu/drm/i915/intel_atomic_plane.c         Matt Roper        2014-12-23  664  
cb1824bb1ec6b46 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2020-03-18  665  	intel_plane_set_invisible(new_crtc_state, new_plane_state);
ee42ec19ca2e557 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2020-11-24  666  	new_crtc_state->enabled_planes &= ~BIT(plane->id);
62ef0dd3cc0c217 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten Lankhorst 2018-09-20  667  
7b3cb17a48dc1b3 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-10-31  668  	if (!new_plane_state->hw.crtc && !old_plane_state->hw.crtc)
c196e1d66c36b07 drivers/gpu/drm/i915/intel_atomic_plane.c         Matt Roper        2015-01-21  669  		return 0;
c196e1d66c36b07 drivers/gpu/drm/i915/intel_atomic_plane.c         Matt Roper        2015-01-21  670  
790cc9941b137e0 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-01-11  671  	ret = plane->check_plane(new_crtc_state, new_plane_state);
c389c9c4d981e49 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten Lankhorst 2015-06-15  672  	if (ret)
da20eabd2c69761 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten Lankhorst 2015-06-15  673  		return ret;
da20eabd2c69761 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten Lankhorst 2015-06-15  674  
97bc7ffa1b1e9a8 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2021-03-05 @675  	if (fb)
97bc7ffa1b1e9a8 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2021-03-05  676  		new_crtc_state->enabled_planes |= BIT(plane->id);
97bc7ffa1b1e9a8 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2021-03-05  677  
e9728bd888e1fa2 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2017-03-02  678  	/* FIXME pre-g4x don't work like this */
f90a85e76c2a89e drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-10-31  679  	if (new_plane_state->uapi.visible)
790cc9941b137e0 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-01-11  680  		new_crtc_state->active_planes |= BIT(plane->id);
e9728bd888e1fa2 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2017-03-02  681  
3358e2ca0ebd645 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-02-11  682  	if (new_plane_state->uapi.visible &&
3358e2ca0ebd645 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-02-11  683  	    intel_plane_is_scaled(new_plane_state))
3358e2ca0ebd645 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-02-11  684  		new_crtc_state->scaled_planes |= BIT(plane->id);
3358e2ca0ebd645 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-02-11  685  
f90a85e76c2a89e drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-10-31  686  	if (new_plane_state->uapi.visible &&
4941f35b48f7f32 drivers/gpu/drm/i915/display/intel_atomic_plane.c Imre Deak         2019-12-21 @687  	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
790cc9941b137e0 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-01-11  688  		new_crtc_state->nv12_planes |= BIT(plane->id);
8e021151948c56e drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten Lankhorst 2018-05-12  689  
f90a85e76c2a89e drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-10-31  690  	if (new_plane_state->uapi.visible &&
d1d23d7f4be6a61 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2019-09-13  691  	    fb->format->format == DRM_FORMAT_C8)
02c52f1ed20aba1 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-02-07  692  		new_crtc_state->c8_planes |= BIT(plane->id);
02c52f1ed20aba1 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-02-07  693  
f90a85e76c2a89e drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-10-31  694  	if (new_plane_state->uapi.visible || old_plane_state->uapi.visible)
790cc9941b137e0 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-01-11  695  		new_crtc_state->update_planes |= BIT(plane->id);
afbd8a722bd64e0 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2018-11-27  696  
943ed3cc02191b2 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  697  	if (new_plane_state->uapi.visible &&
943ed3cc02191b2 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  698  	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier)) {
943ed3cc02191b2 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  699  		new_crtc_state->data_rate_y[plane->id] =
943ed3cc02191b2 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  700  			intel_plane_data_rate(new_crtc_state, new_plane_state, 0);
c457d9cf256e942 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-05-24  701  		new_crtc_state->data_rate[plane->id] =
943ed3cc02191b2 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  702  			intel_plane_data_rate(new_crtc_state, new_plane_state, 1);
c034363ca898ea0 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  703  
c034363ca898ea0 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  704  		new_crtc_state->rel_data_rate_y[plane->id] =
c034363ca898ea0 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  705  			intel_plane_relative_data_rate(new_crtc_state,
c034363ca898ea0 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  706  						       new_plane_state, 0);
c034363ca898ea0 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  707  		new_crtc_state->rel_data_rate[plane->id] =
c034363ca898ea0 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  708  			intel_plane_relative_data_rate(new_crtc_state,
c034363ca898ea0 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  709  						       new_plane_state, 1);
943ed3cc02191b2 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  710  	} else if (new_plane_state->uapi.visible) {
943ed3cc02191b2 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  711  		new_crtc_state->data_rate[plane->id] =
943ed3cc02191b2 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  712  			intel_plane_data_rate(new_crtc_state, new_plane_state, 0);
c034363ca898ea0 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  713  
c034363ca898ea0 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  714  		new_crtc_state->rel_data_rate[plane->id] =
c034363ca898ea0 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  715  			intel_plane_relative_data_rate(new_crtc_state,
c034363ca898ea0 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  716  						       new_plane_state, 0);
943ed3cc02191b2 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrjälä     2022-03-03  717  	}
c457d9cf256e942 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrjälä     2019-05-24  718  
4f25720b2c04a38 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-06-28  719  	return intel_plane_atomic_calc_changes(old_crtc_state, new_crtc_state,
4f25720b2c04a38 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-06-28  720  					       old_plane_state, new_plane_state);
4f25720b2c04a38 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-06-28  721  }
4f25720b2c04a38 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten Lankhorst 2019-06-28  722  

:::::: The code at line 687 was first introduced by commit
:::::: 4941f35b48f7f329bdf2ccad17d6fdb2190f8d34 drm/i915: Make sure CCS YUV semiplanar format checks work

:::::: TO: Imre Deak <imre.deak@intel.com>
:::::: CC: Imre Deak <imre.deak@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
