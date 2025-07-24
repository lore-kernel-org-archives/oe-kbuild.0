Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BD525E47D
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Jul 2025 10:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753351571; cv=none; b=N61ChGksbbHyiXZxmJAUhIp3tW1WIXwFFhNI2i6l0t8p66kr7Q7as8LUO+gIwZrXs0Xye5E5cMdsuTb7rAysW2CYgGkPfI/MJZI5iyt2TultL61XRdX26YZd8RwrxPA/97brdZ0VNHr4pfJo+dY5rwac7Pe7pffQoqJVMvpNlSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753351571; c=relaxed/simple;
	bh=tYj2t1Af53Hcm1inCzWgqrP2lMw8ZGbvl4pi98DCXbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mxlC570VwZa8QDQxWeNRBDvL6C+XZp0GRLSFZx3PstTQLUF9EIuLTlRCL5mQHbVt38S8PLuAEvjSBcrOud70KqhFN8jiKRjsVzSXIMvcpErMPsMSFZh62VjrQ+Gs8F3a/t6XX0W1e1C2LMkFimg2KaDgbVLv5Rh6b5AlzBC1Eos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6Lb0dEg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6Lb0dEg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753351570; x=1784887570;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tYj2t1Af53Hcm1inCzWgqrP2lMw8ZGbvl4pi98DCXbk=;
  b=Q6Lb0dEgBGStnsOr71sDWvYhz+C28UAHkEOhL5GLRvtF8cHwX03Qo3jU
   GEYeXGgN6DuL2TPoeM6U1AbCml3hF1DiHShkNRkK64tH35Osv7Ur8eYyy
   oprtpsQBxMH6FwxkiQ5/ln73FsM+T53scs45pKiO9uuPMU3IB68B0xp49
   nFSVLgxbdUCRemTYERYa6FsNdmJdaAeKuArUMCCXc33jAtNYCz/+untbp
   pJaOZwmKIsmfF+SfA1+vjReD5dEBRRsqop9zVxKaWE0/N5UlUcy3Nn7Bd
   /iBgnSdI3zJ5ut+Am/YoFZ1j3L4s1Ya6mAZnwCFo4AKDI3Wr+cBBfMZql
   g==;
X-CSE-ConnectionGUID: mDJO8xtyQ7yLzCrv+VvOlQ==
X-CSE-MsgGUID: jzl6y2xZQ+OuxTKD2Bkd/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55748149"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="55748149"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 03:06:09 -0700
X-CSE-ConnectionGUID: y26RrT5mQOWlPaQBTv35lg==
X-CSE-MsgGUID: SozqGAjpQ8WNAknwgM1ENQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="160418542"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 03:06:08 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uespx-000KIp-1z;
	Thu, 24 Jul 2025 10:06:05 +0000
Date: Thu, 24 Jul 2025 18:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm: don't run atomic_async_check for disabled planes
Message-ID: <202507241702.ubJUAj1f-lkp@intel.com>
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
In-Reply-To: <20250723150413.18445-1-xaver.hugl@kde.org>
References: <20250723150413.18445-1-xaver.hugl@kde.org>
TO: Xaver Hugl <xaver.hugl@kde.org>
TO: dri-devel@lists.freedesktop.org
CC: xaver.hugl@kde.org
CC: andrealmeid@igalia.com
CC: chris@kode54.net
CC: naveen1.kumar@intel.com
CC: ville.syrjala@linux.intel.com
CC: mdaenzer@redhat.com
CC: intel-gfx@lists.freedesktop.org
CC: amd-gfx@lists.freedesktop.org

Hi Xaver,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.16-rc7 next-20250724]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip drm/drm-next drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xaver-Hugl/drm-don-t-run-atomic_async_check-for-disabled-planes/20250723-231133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250723150413.18445-1-xaver.hugl%40kde.org
patch subject: [PATCH] drm: don't run atomic_async_check for disabled planes
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: m68k-randconfig-r073-20250724 (https://download.01.org/0day-ci/archive/20250724/202507241702.ubJUAj1f-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507241702.ubJUAj1f-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_atomic_uapi.c:1093 drm_atomic_set_property() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1093 drivers/gpu/drm/drm_atomic_uapi.c

0e26cc72c71cb98 André Almeida 2023-11-22  1009  
72fdb40c1a4b48f Simona Vetter 2018-09-05  1010  int drm_atomic_set_property(struct drm_atomic_state *state,
36e4523aaf4a35d Simona Vetter 2019-02-28  1011  			    struct drm_file *file_priv,
72fdb40c1a4b48f Simona Vetter 2018-09-05  1012  			    struct drm_mode_object *obj,
72fdb40c1a4b48f Simona Vetter 2018-09-05  1013  			    struct drm_property *prop,
0e26cc72c71cb98 André Almeida 2023-11-22  1014  			    u64 prop_value,
0e26cc72c71cb98 André Almeida 2023-11-22  1015  			    bool async_flip)
72fdb40c1a4b48f Simona Vetter 2018-09-05  1016  {
72fdb40c1a4b48f Simona Vetter 2018-09-05  1017  	struct drm_mode_object *ref;
0e26cc72c71cb98 André Almeida 2023-11-22  1018  	u64 old_val;
72fdb40c1a4b48f Simona Vetter 2018-09-05  1019  	int ret;
72fdb40c1a4b48f Simona Vetter 2018-09-05  1020  
72fdb40c1a4b48f Simona Vetter 2018-09-05  1021  	if (!drm_property_change_valid_get(prop, prop_value, &ref))
72fdb40c1a4b48f Simona Vetter 2018-09-05  1022  		return -EINVAL;
72fdb40c1a4b48f Simona Vetter 2018-09-05  1023  
72fdb40c1a4b48f Simona Vetter 2018-09-05  1024  	switch (obj->type) {
72fdb40c1a4b48f Simona Vetter 2018-09-05  1025  	case DRM_MODE_OBJECT_CONNECTOR: {
72fdb40c1a4b48f Simona Vetter 2018-09-05  1026  		struct drm_connector *connector = obj_to_connector(obj);
72fdb40c1a4b48f Simona Vetter 2018-09-05  1027  		struct drm_connector_state *connector_state;
72fdb40c1a4b48f Simona Vetter 2018-09-05  1028  
72fdb40c1a4b48f Simona Vetter 2018-09-05  1029  		connector_state = drm_atomic_get_connector_state(state, connector);
72fdb40c1a4b48f Simona Vetter 2018-09-05  1030  		if (IS_ERR(connector_state)) {
72fdb40c1a4b48f Simona Vetter 2018-09-05  1031  			ret = PTR_ERR(connector_state);
72fdb40c1a4b48f Simona Vetter 2018-09-05  1032  			break;
72fdb40c1a4b48f Simona Vetter 2018-09-05  1033  		}
72fdb40c1a4b48f Simona Vetter 2018-09-05  1034  
0e26cc72c71cb98 André Almeida 2023-11-22  1035  		if (async_flip) {
0e26cc72c71cb98 André Almeida 2023-11-22  1036  			ret = drm_atomic_connector_get_property(connector, connector_state,
0e26cc72c71cb98 André Almeida 2023-11-22  1037  								prop, &old_val);
0e26cc72c71cb98 André Almeida 2023-11-22  1038  			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
0e26cc72c71cb98 André Almeida 2023-11-22  1039  			break;
0e26cc72c71cb98 André Almeida 2023-11-22  1040  		}
0e26cc72c71cb98 André Almeida 2023-11-22  1041  
72fdb40c1a4b48f Simona Vetter 2018-09-05  1042  		ret = drm_atomic_connector_set_property(connector,
36e4523aaf4a35d Simona Vetter 2019-02-28  1043  				connector_state, file_priv,
36e4523aaf4a35d Simona Vetter 2019-02-28  1044  				prop, prop_value);
72fdb40c1a4b48f Simona Vetter 2018-09-05  1045  		break;
72fdb40c1a4b48f Simona Vetter 2018-09-05  1046  	}
72fdb40c1a4b48f Simona Vetter 2018-09-05  1047  	case DRM_MODE_OBJECT_CRTC: {
72fdb40c1a4b48f Simona Vetter 2018-09-05  1048  		struct drm_crtc *crtc = obj_to_crtc(obj);
72fdb40c1a4b48f Simona Vetter 2018-09-05  1049  		struct drm_crtc_state *crtc_state;
72fdb40c1a4b48f Simona Vetter 2018-09-05  1050  
72fdb40c1a4b48f Simona Vetter 2018-09-05  1051  		crtc_state = drm_atomic_get_crtc_state(state, crtc);
72fdb40c1a4b48f Simona Vetter 2018-09-05  1052  		if (IS_ERR(crtc_state)) {
72fdb40c1a4b48f Simona Vetter 2018-09-05  1053  			ret = PTR_ERR(crtc_state);
72fdb40c1a4b48f Simona Vetter 2018-09-05  1054  			break;
72fdb40c1a4b48f Simona Vetter 2018-09-05  1055  		}
72fdb40c1a4b48f Simona Vetter 2018-09-05  1056  
0e26cc72c71cb98 André Almeida 2023-11-22  1057  		if (async_flip) {
0e26cc72c71cb98 André Almeida 2023-11-22  1058  			ret = drm_atomic_crtc_get_property(crtc, crtc_state,
0e26cc72c71cb98 André Almeida 2023-11-22  1059  							   prop, &old_val);
0e26cc72c71cb98 André Almeida 2023-11-22  1060  			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
0e26cc72c71cb98 André Almeida 2023-11-22  1061  			break;
0e26cc72c71cb98 André Almeida 2023-11-22  1062  		}
0e26cc72c71cb98 André Almeida 2023-11-22  1063  
72fdb40c1a4b48f Simona Vetter 2018-09-05  1064  		ret = drm_atomic_crtc_set_property(crtc,
72fdb40c1a4b48f Simona Vetter 2018-09-05  1065  				crtc_state, prop, prop_value);
72fdb40c1a4b48f Simona Vetter 2018-09-05  1066  		break;
72fdb40c1a4b48f Simona Vetter 2018-09-05  1067  	}
72fdb40c1a4b48f Simona Vetter 2018-09-05  1068  	case DRM_MODE_OBJECT_PLANE: {
72fdb40c1a4b48f Simona Vetter 2018-09-05  1069  		struct drm_plane *plane = obj_to_plane(obj);
6252c8e12558e38 Xaver Hugl    2025-07-23  1070  		struct drm_plane_state *old_plane_state;
72fdb40c1a4b48f Simona Vetter 2018-09-05  1071  		struct drm_plane_state *plane_state;
0e26cc72c71cb98 André Almeida 2023-11-22  1072  		struct drm_mode_config *config = &plane->dev->mode_config;
fd40a63c63a182a André Almeida 2025-01-27  1073  		const struct drm_plane_helper_funcs *plane_funcs = plane->helper_private;
72fdb40c1a4b48f Simona Vetter 2018-09-05  1074  
72fdb40c1a4b48f Simona Vetter 2018-09-05  1075  		plane_state = drm_atomic_get_plane_state(state, plane);
72fdb40c1a4b48f Simona Vetter 2018-09-05  1076  		if (IS_ERR(plane_state)) {
72fdb40c1a4b48f Simona Vetter 2018-09-05  1077  			ret = PTR_ERR(plane_state);
72fdb40c1a4b48f Simona Vetter 2018-09-05  1078  			break;
72fdb40c1a4b48f Simona Vetter 2018-09-05  1079  		}
72fdb40c1a4b48f Simona Vetter 2018-09-05  1080  
fd40a63c63a182a André Almeida 2025-01-27  1081  		if (async_flip) {
fd40a63c63a182a André Almeida 2025-01-27  1082  			/* check if the prop does a nop change */
fd40a63c63a182a André Almeida 2025-01-27  1083  			if ((prop != config->prop_fb_id &&
f85de245c6a8e26 André Almeida 2024-07-02  1084  			     prop != config->prop_in_fence_fd &&
fd40a63c63a182a André Almeida 2025-01-27  1085  			     prop != config->prop_fb_damage_clips)) {
0e26cc72c71cb98 André Almeida 2023-11-22  1086  				ret = drm_atomic_plane_get_property(plane, plane_state,
0e26cc72c71cb98 André Almeida 2023-11-22  1087  								    prop, &old_val);
0e26cc72c71cb98 André Almeida 2023-11-22  1088  				ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
fd40a63c63a182a André Almeida 2025-01-27  1089  			}
fd40a63c63a182a André Almeida 2025-01-27  1090  
6252c8e12558e38 Xaver Hugl    2025-07-23  1091  			old_plane_state = drm_atomic_get_old_plane_state(state, plane);
6252c8e12558e38 Xaver Hugl    2025-07-23  1092  			if (IS_ERR(old_plane_state)) {
6252c8e12558e38 Xaver Hugl    2025-07-23 @1093  				ret = PTR_ERR(plane_state);
6252c8e12558e38 Xaver Hugl    2025-07-23  1094  				break;
6252c8e12558e38 Xaver Hugl    2025-07-23  1095  			}
6252c8e12558e38 Xaver Hugl    2025-07-23  1096  
fd40a63c63a182a André Almeida 2025-01-27  1097  			/* ask the driver if this non-primary plane is supported */
6252c8e12558e38 Xaver Hugl    2025-07-23  1098  			if (plane->type != DRM_PLANE_TYPE_PRIMARY &&
6252c8e12558e38 Xaver Hugl    2025-07-23  1099  					(plane_state->visible || old_plane_state->visible)) {
fd40a63c63a182a André Almeida 2025-01-27  1100  				ret = -EINVAL;
fd40a63c63a182a André Almeida 2025-01-27  1101  
fd40a63c63a182a André Almeida 2025-01-27  1102  				if (plane_funcs && plane_funcs->atomic_async_check)
fd40a63c63a182a André Almeida 2025-01-27  1103  					ret = plane_funcs->atomic_async_check(plane, state, true);
fd40a63c63a182a André Almeida 2025-01-27  1104  
fd40a63c63a182a André Almeida 2025-01-27  1105  				if (ret) {
fd40a63c63a182a André Almeida 2025-01-27  1106  					drm_dbg_atomic(prop->dev,
fd40a63c63a182a André Almeida 2025-01-27  1107  						       "[PLANE:%d:%s] does not support async flips\n",
fd40a63c63a182a André Almeida 2025-01-27  1108  						       obj->id, plane->name);
0e26cc72c71cb98 André Almeida 2023-11-22  1109  					break;
fd40a63c63a182a André Almeida 2025-01-27  1110  				}
fd40a63c63a182a André Almeida 2025-01-27  1111  			}
0e26cc72c71cb98 André Almeida 2023-11-22  1112  		}
0e26cc72c71cb98 André Almeida 2023-11-22  1113  
72fdb40c1a4b48f Simona Vetter 2018-09-05  1114  		ret = drm_atomic_plane_set_property(plane,
36e4523aaf4a35d Simona Vetter 2019-02-28  1115  				plane_state, file_priv,
36e4523aaf4a35d Simona Vetter 2019-02-28  1116  				prop, prop_value);
72fdb40c1a4b48f Simona Vetter 2018-09-05  1117  		break;
72fdb40c1a4b48f Simona Vetter 2018-09-05  1118  	}
72fdb40c1a4b48f Simona Vetter 2018-09-05  1119  	default:
e51259d7194b120 Simon Ser     2022-10-19  1120  		drm_dbg_atomic(prop->dev, "[OBJECT:%d] has no properties\n", obj->id);
72fdb40c1a4b48f Simona Vetter 2018-09-05  1121  		ret = -EINVAL;
72fdb40c1a4b48f Simona Vetter 2018-09-05  1122  		break;
72fdb40c1a4b48f Simona Vetter 2018-09-05  1123  	}
72fdb40c1a4b48f Simona Vetter 2018-09-05  1124  
72fdb40c1a4b48f Simona Vetter 2018-09-05  1125  	drm_property_change_valid_put(prop, ref);
72fdb40c1a4b48f Simona Vetter 2018-09-05  1126  	return ret;
72fdb40c1a4b48f Simona Vetter 2018-09-05  1127  }
72fdb40c1a4b48f Simona Vetter 2018-09-05  1128  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
