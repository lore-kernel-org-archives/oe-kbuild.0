Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C53627182B
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Feb 2025 03:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739329727; cv=none; b=pCHs6oGWj1wu8MaLHJrb7egH3bUCGlkYLR4JXvDQJddCK0nrNJYxpt5QNVJwqA2JvbbT9H54p4avpc2Uwfxzr0ANJWWepRcLgcPqzyhiw86asMWTOlo5wKvchzYupk76dcJtAxtPLnTmKbOZ4HFmnfeFij1gsxAwoqhpoveuBqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739329727; c=relaxed/simple;
	bh=f4tXBnf/JNKHwX5DNz5/3OTrdmu5bHtlzuxK3n8veaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gdyid3rWtcAaiAlHN/VdsFZVEGkllFwfXK4Eu3oRv9Cce7m1A/BuxuYeVo981+3vksaEvI+ujRoX/mtC3fb99bzs2eiUrnOvOyv4APCuHiOaC0+Me6lBxqaI+jAfTdNXfyTRt/6eUU77CmdhYLCqCCY00ILXS0czua2SAsgfR/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ckl7+AIN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ckl7+AIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739329724; x=1770865724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f4tXBnf/JNKHwX5DNz5/3OTrdmu5bHtlzuxK3n8veaY=;
  b=Ckl7+AINGkbjAq3AiwOyHRxQQC3dP1Cp9ZSvukT/nlTuKmTsI01X83is
   Uoie6pVV6X1GV49E3dHWZ2hby8f2qjP2dj0tKpLeFyx/cUIMSDFvFFgcs
   gc85vNW9Qb8QaDb9ChAMlrxx8m2JGMcUTD75lGYguOVJedbB13bvf6B5w
   a/fxyL2FYXQ0Fhg+ZxTiebF05c2tNXETHtXxhxYX67GKYWoiaJxQEvfWl
   UZ3WNKARlhcg1z2p27zxL6ZISav/wl6+gxbqbLbjEmLAWpizR1dUn4lF7
   IKm3EOVczaoodQQ5nJmQdKgjj/eN3RFoUJApbVhIqzswV7t35lQl2Xi2j
   Q==;
X-CSE-ConnectionGUID: p1QCobamTbq3QhjPVkLpHQ==
X-CSE-MsgGUID: vIm23FiCRLC/rKGNf5utow==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51401487"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51401487"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 19:08:43 -0800
X-CSE-ConnectionGUID: VaUd/FBzSCalrbKC+fhx2g==
X-CSE-MsgGUID: 39NNvn9cTo61mDFHHURhfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117867219"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Feb 2025 19:08:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti37A-00152d-0K;
	Wed, 12 Feb 2025 03:08:40 +0000
Date: Wed, 12 Feb 2025 11:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm/amd/display: restore edid reading from a given i2c
 adapter
Message-ID: <202502121000.EBCEdoo9-lkp@intel.com>
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
In-Reply-To: <20250209225843.7412-1-mwen@igalia.com>
References: <20250209225843.7412-1-mwen@igalia.com>
TO: Melissa Wen <mwen@igalia.com>
TO: harry.wentland@amd.com
TO: sunpeng.li@amd.com
TO: Rodrigo.Siqueira@amd.com
TO: alexander.deucher@amd.com
TO: christian.koenig@amd.com
TO: Xinhui.Pan@amd.com
TO: airlied@gmail.com
TO: simona@ffwll.ch
TO: alex.hung@amd.com
TO: mwen@igalia.com
TO: mario.limonciello@amd.com
CC: amd-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
CC: kernel-dev@igalia.com

Hi Melissa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master drm/drm-next v6.14-rc2 next-20250210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Melissa-Wen/drm-amd-display-restore-edid-reading-from-a-given-i2c-adapter/20250210-070016
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250209225843.7412-1-mwen%40igalia.com
patch subject: [PATCH] drm/amd/display: restore edid reading from a given i2c adapter
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250211 (https://download.01.org/0day-ci/archive/20250212/202502121000.EBCEdoo9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502121000.EBCEdoo9-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7201 amdgpu_dm_connector_funcs_force() warn: variable dereferenced before check 'dc_link' (see line 7187)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5767 fill_dc_dirty_rects() warn: iterator 'i' not incremented
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:12110 parse_edid_displayid_vrr() warn: variable dereferenced before check 'edid_ext' (see line 12106)

vim +/dc_link +7201 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

14f04fa4834a515 Alex Deucher  2020-02-04  7178  
dae343b343ff741 Arnd Bergmann 2023-05-01  7179  static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
0ba4a784a14592a Alex Hung     2023-04-05  7180  {
0ba4a784a14592a Alex Hung     2023-04-05  7181  	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
0ba4a784a14592a Alex Hung     2023-04-05  7182  	struct dc_link *dc_link = aconnector->dc_link;
0ba4a784a14592a Alex Hung     2023-04-05  7183  	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
48edb2a4256eedf Melissa Wen   2024-09-27  7184  	const struct drm_edid *drm_edid;
be1aae525741575 Melissa Wen   2025-02-09  7185  	struct i2c_adapter *ddc;
0ba4a784a14592a Alex Hung     2023-04-05  7186  
be1aae525741575 Melissa Wen   2025-02-09 @7187  	if (dc_link->aux_mode)
be1aae525741575 Melissa Wen   2025-02-09  7188  		ddc = &aconnector->dm_dp_aux.aux.ddc;
be1aae525741575 Melissa Wen   2025-02-09  7189  	else
be1aae525741575 Melissa Wen   2025-02-09  7190  		ddc = &aconnector->i2c->base;
be1aae525741575 Melissa Wen   2025-02-09  7191  
be1aae525741575 Melissa Wen   2025-02-09  7192  	drm_edid = drm_edid_read_ddc(connector, ddc);
48edb2a4256eedf Melissa Wen   2024-09-27  7193  	drm_edid_connector_update(connector, drm_edid);
48edb2a4256eedf Melissa Wen   2024-09-27  7194  	if (!drm_edid) {
0e859faf8670a78 Alex Hung     2023-08-25  7195  		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
0ba4a784a14592a Alex Hung     2023-04-05  7196  		return;
0e859faf8670a78 Alex Hung     2023-08-25  7197  	}
0ba4a784a14592a Alex Hung     2023-04-05  7198  
48edb2a4256eedf Melissa Wen   2024-09-27  7199  	aconnector->drm_edid = drm_edid;
0ba4a784a14592a Alex Hung     2023-04-05  7200  	/* Update emulated (virtual) sink's EDID */
0ba4a784a14592a Alex Hung     2023-04-05 @7201  	if (dc_em_sink && dc_link) {
48edb2a4256eedf Melissa Wen   2024-09-27  7202  		// FIXME: Get rid of drm_edid_raw()
48edb2a4256eedf Melissa Wen   2024-09-27  7203  		const struct edid *edid = drm_edid_raw(drm_edid);
48edb2a4256eedf Melissa Wen   2024-09-27  7204  
0ba4a784a14592a Alex Hung     2023-04-05  7205  		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
48edb2a4256eedf Melissa Wen   2024-09-27  7206  		memmove(dc_em_sink->dc_edid.raw_edid, edid,
48edb2a4256eedf Melissa Wen   2024-09-27  7207  			(edid->extensions + 1) * EDID_LENGTH);
0ba4a784a14592a Alex Hung     2023-04-05  7208  		dm_helpers_parse_edid_caps(
0ba4a784a14592a Alex Hung     2023-04-05  7209  			dc_link,
0ba4a784a14592a Alex Hung     2023-04-05  7210  			&dc_em_sink->dc_edid,
0ba4a784a14592a Alex Hung     2023-04-05  7211  			&dc_em_sink->edid_caps);
0ba4a784a14592a Alex Hung     2023-04-05  7212  	}
0ba4a784a14592a Alex Hung     2023-04-05  7213  }
0ba4a784a14592a Alex Hung     2023-04-05  7214  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
