Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB6C3B18A
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jan 2024 09:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705916869; cv=none; b=X9oLDOU6v8SYwuzVZOZNuQb5QM/XO/2hCMPx6I/4lskw9fMD+R+21DQ7JJvVX7Rq3SjfbyP/XfGLGixOaU5vhXjvi08lxpUoaB0qfxVYMteHvIn2FBIf8n5HutGMWzxxIyOrubHLTaBLwwcbKK6CWgXwe/apfo7n/S+S2YMyphY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705916869; c=relaxed/simple;
	bh=mWC7pYmmMOD/J3dmo3wyZMQIN7xhFC5/y50g7YrCl9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JVzDahBIsBh2ui6vvnhmvg4npar768BQe4e17or2RlSTt+gH4kf7g2QdPVe+Ned3kv+yrUi8VRm+FYtB5XUpYGeX8u1iiEGBnApffz8CtEbIKfIKRjwenC4u2awMMgBJpIfvasmi+KpD9n4Nru2mJgYMSlhKhjqQuvRDc9mFtXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=He0yh88G; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="He0yh88G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705916868; x=1737452868;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mWC7pYmmMOD/J3dmo3wyZMQIN7xhFC5/y50g7YrCl9I=;
  b=He0yh88GJxd8Tctwx8da57EAL8sFUROlywVQX1c4I0wksDUYT500odPG
   yJeuto1mOO+G/OTgCr/wzwMtOS1KZxRyPLzdwFfVJeGfFlX+ZJ72DhlcO
   MgeSGgyKyW2YCHuVIFtFZUgriOWFknbiMBUaAlUMUxCnryvwamvQiUCwD
   HtQKbBZ8CAOVCX924Sh0l+xPw/u/oFwd19lJx3rjRt20a6BwYdvm9V2vT
   GTXssv+tOz0+R2FiSXSWskeDfnUl1lQqBGdAPIZatSHPvSrv4oUTUt7P0
   B6aKz+McRRl90FU4FiYU4Pxse4+GGlgpXkp0E0tHjYilFzvQzC96BRc8+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="19722011"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="19722011"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 01:47:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="27299507"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Jan 2024 01:47:46 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRqu7-0006Xs-0p;
	Mon, 22 Jan 2024 09:47:43 +0000
Date: Mon, 22 Jan 2024 17:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [vsyrjala:sel_fetch_redo_2 9/15]
 drivers/gpu/drm/i915/display/intel_psr.c:1948:1-3: WARNING: possible
 condition with no effect (if == else)
Message-ID: <202401221744.6cgejStW-lkp@intel.com>
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
TO: "Ville Syrjälä" <ville.syrjala@linux.intel.com>

tree:   https://github.com/vsyrjala/linux.git sel_fetch_redo_2
head:   fca92680c3b70f0c2bf60799a185c78755fbef40
commit: 2b3cd12bc66ff46cdd03883c8ebb9e42b9f0c14d [9/15] drm/i915/psr: Rewrite PSR2 selective fetch area calculations
:::::: branch date: 3 days ago
:::::: commit date: 10 weeks ago
config: i386-randconfig-054-20240122 (https://download.01.org/0day-ci/archive/20240122/202401221744.6cgejStW-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401221744.6cgejStW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_psr.c:1948:1-3: WARNING: possible condition with no effect (if == else)

vim +1948 drivers/gpu/drm/i915/display/intel_psr.c

73262db68c27ed José Roberto de Souza 2021-09-22  1928  
c22cf04c6ab1d9 Jouni Högander        2023-01-30  1929  void intel_psr2_program_plane_sel_fetch_arm(struct intel_plane *plane,
c22cf04c6ab1d9 Jouni Högander        2023-01-30  1930  					    const struct intel_crtc_state *crtc_state,
c22cf04c6ab1d9 Jouni Högander        2023-01-30  1931  					    const struct intel_plane_state *plane_state)
c22cf04c6ab1d9 Jouni Högander        2023-01-30  1932  {
c22cf04c6ab1d9 Jouni Högander        2023-01-30  1933  	struct drm_i915_private *i915 = to_i915(plane->base.dev);
c22cf04c6ab1d9 Jouni Högander        2023-01-30  1934  	enum pipe pipe = plane->pipe;
2b3cd12bc66ff4 Ville Syrjälä         2023-11-15  1935  	u32 ctl = 0;
c22cf04c6ab1d9 Jouni Högander        2023-01-30  1936  
2b3cd12bc66ff4 Ville Syrjälä         2023-11-15  1937  	if (!HAS_PSR2_SEL_FETCH(i915))
c22cf04c6ab1d9 Jouni Högander        2023-01-30  1938  		return;
c22cf04c6ab1d9 Jouni Högander        2023-01-30  1939  
2b3cd12bc66ff4 Ville Syrjälä         2023-11-15  1940  	if (crtc_state->enable_psr2_sel_fetch &&
2b3cd12bc66ff4 Ville Syrjälä         2023-11-15  1941  	    drm_rect_visible(&plane_state->sel_fetch.dst)) {
c22cf04c6ab1d9 Jouni Högander        2023-01-30  1942  		if (plane->id == PLANE_CURSOR)
2b3cd12bc66ff4 Ville Syrjälä         2023-11-15  1943  			ctl = plane_state->ctl;
c22cf04c6ab1d9 Jouni Högander        2023-01-30  1944  		else
2b3cd12bc66ff4 Ville Syrjälä         2023-11-15  1945  			ctl = PLANE_SEL_FETCH_CTL_ENABLE;
2b3cd12bc66ff4 Ville Syrjälä         2023-11-15  1946  	}
2b3cd12bc66ff4 Ville Syrjälä         2023-11-15  1947  
2b3cd12bc66ff4 Ville Syrjälä         2023-11-15 @1948  	if (plane->id == PLANE_CURSOR)
2b3cd12bc66ff4 Ville Syrjälä         2023-11-15  1949  		intel_de_write_fw(i915, PLANE_SEL_FETCH_CTL(pipe, plane->id), ctl);
2b3cd12bc66ff4 Ville Syrjälä         2023-11-15  1950  	else
2b3cd12bc66ff4 Ville Syrjälä         2023-11-15  1951  		intel_de_write_fw(i915, PLANE_SEL_FETCH_CTL(pipe, plane->id), ctl);
c22cf04c6ab1d9 Jouni Högander        2023-01-30  1952  }
c22cf04c6ab1d9 Jouni Högander        2023-01-30  1953  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
