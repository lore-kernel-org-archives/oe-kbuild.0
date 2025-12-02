Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3011548C
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 15:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764690880; cv=none; b=o71Co968eLMoiKKI1xu/5EbB6kOT1Mmttarmn/xqKE26ukwmLwTV64+jUK2urRBwwno1tTc96ZWlQywDI4ZZLmD4pphIhljirrNR5OCQbxdseX2IXnetPxHzsmLXCB1Lhad6Q1EMxwyvfPGNN1LJ/vWNc65L2DXBN4tu6wkzDaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764690880; c=relaxed/simple;
	bh=I4AipIwPXlWTdIEhCHo9xDQadZ2cRJUOgrt6csD8Qj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aeVn2c//iR/VPw1ra3wy974ETKR7T1JJVZsR0k3yXCL24lZdiW2vv8uNbK82jOZn9BLDi5frV/MAIzULEJwLEj4Sv+xeAhGPQnBQCEYyIPBiPhtfPmEH0O1SWFNFwRj553SwTIY1T0F/qsmq0Pd1f41C6MQZXrpDzcL55YiG6/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eiRaBITd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiRaBITd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764690878; x=1796226878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I4AipIwPXlWTdIEhCHo9xDQadZ2cRJUOgrt6csD8Qj0=;
  b=eiRaBITdYBiKfinFVdenCxvvLOhYv6Gl8493QYPdQIlND9/Iciy2tZsz
   2azC9zsMTFRytvBKdsBWnSt1pGaJUqgcJv03mOcHuQd0MIatlAHn/SYrF
   VE3a5FhRJ8YWQKlqKPd8HpgNrYxJT5DqM5K1KI9I+KDA+k7GP71f8vc5p
   tvCTcQYOTofBVTuOo+aheH+mUqNYIPPwQRnEf0TiCXMOrHeGn+/YAyK/1
   AdWx1h639TEXuQ6zuDOkIi4uG7E3Pm8USDHZD8fKZy/bphwgcqUcJAbWw
   aCHaEKZZupBT0jW9YiitlzaUqaHIgaaxJ/c3TI22Jj3CghbHu1u9FBCtT
   A==;
X-CSE-ConnectionGUID: S5KMFkA9QfOLpPh3xu5ljw==
X-CSE-MsgGUID: XVjV1OssQG+fvSKhVirPoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="92140739"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="92140739"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 07:54:38 -0800
X-CSE-ConnectionGUID: O/BTFhCRSJiN6YHGPI00NQ==
X-CSE-MsgGUID: Hq8GVT2YRBSsZp0XQQwxRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="199535397"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 02 Dec 2025 07:54:36 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQSi2-000000002un-1ya8;
	Tue, 02 Dec 2025 15:54:34 +0000
Date: Tue, 2 Dec 2025 16:54:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/i915/display/intel_plane.c:367:41: error: 'struct
 drm_plane_state' has no member named 'color_pipeline'
Message-ID: <202512021600.Mshrv4gu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245, commit: 48efaffc43c79a3f7b5fb6145876b14fe11b5ef3"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
CC: 0day robot <lkp@intel.com>
CC: Uma Shankar <uma.shankar@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
head:   a475844eaf5f5246fea92d8289f2c8555f2c0c7e
commit: 48efaffc43c79a3f7b5fb6145876b14fe11b5ef3 drm/i915/color: Add framework to program CSC
date:   32 hours ago
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251202/202512021600.Mshrv4gu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021600.Mshrv4gu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021600.Mshrv4gu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_colorop.h:9,
                    from drivers/gpu/drm/i915/display/intel_plane.c:52:
   drivers/gpu/drm/i915/display/intel_display_types.h:1993:28: error: field 'base' has incomplete type
    1993 |         struct drm_colorop base;
         |                            ^~~~
   drivers/gpu/drm/i915/display/intel_plane.c: In function 'intel_plane_color_copy_uapi_to_hw_state':
>> drivers/gpu/drm/i915/display/intel_plane.c:367:41: error: 'struct drm_plane_state' has no member named 'color_pipeline'
     367 |         iter_colorop = plane_state->uapi.color_pipeline;
         |                                         ^
>> drivers/gpu/drm/i915/display/intel_plane.c:370:17: error: implicit declaration of function 'for_each_new_colorop_in_state'; did you mean 'for_each_new_crtc_in_state'? [-Wimplicit-function-declaration]
     370 |                 for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 for_each_new_crtc_in_state
>> drivers/gpu/drm/i915/display/intel_plane.c:370:84: error: expected ';' before '{' token
     370 |                 for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
         |                                                                                    ^~
         |                                                                                    ;
>> drivers/gpu/drm/i915/display/intel_plane.c:360:35: warning: unused variable 'blob' [-Wunused-variable]
     360 |         struct drm_property_blob *blob;
         |                                   ^~~~
>> drivers/gpu/drm/i915/display/intel_plane.c:359:31: warning: unused variable 'intel_colorop' [-Wunused-variable]
     359 |         struct intel_colorop *intel_colorop;
         |                               ^~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_plane.c: At top level:
>> drivers/gpu/drm/i915/display/intel_plane.c:341:1: warning: 'intel_plane_colorop_replace_blob' defined but not used [-Wunused-function]
     341 | intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +367 drivers/gpu/drm/i915/display/intel_plane.c

6f60de67d7e4ae drivers/gpu/drm/i915/display/intel_atomic_plane.c Vinod Govindapillai   2025-02-28  339  
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  340  static bool
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01 @341  intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  342  				 struct intel_colorop *intel_colorop,
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  343  				 struct drm_property_blob *blob)
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  344  {
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  345  	if (intel_colorop->id == INTEL_PLANE_CB_CSC)
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  346  		return drm_property_replace_blob(&plane_state->hw.ctm, blob);
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  347  
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  348  	return false;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  349  }
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  350  
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  351  static void
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  352  intel_plane_color_copy_uapi_to_hw_state(struct intel_plane_state *plane_state,
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  353  					const struct intel_plane_state *from_plane_state,
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  354  					struct intel_crtc *crtc)
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  355  {
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  356  	struct drm_colorop *iter_colorop, *colorop;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  357  	struct drm_colorop_state *new_colorop_state;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  358  	struct drm_atomic_state *state = plane_state->uapi.state;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01 @359  	struct intel_colorop *intel_colorop;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01 @360  	struct drm_property_blob *blob;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  361  	int i = 0;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  362  	struct intel_atomic_state *intel_atomic_state = to_intel_atomic_state(state);
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  363  	struct intel_crtc_state *new_crtc_state = intel_atomic_state ?
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  364  		intel_atomic_get_new_crtc_state(intel_atomic_state, crtc) : NULL;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  365  	bool changed = false;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  366  
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01 @367  	iter_colorop = plane_state->uapi.color_pipeline;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  368  
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  369  	while (iter_colorop) {
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01 @370  		for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  371  			if (new_colorop_state->colorop == iter_colorop) {
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  372  				blob = new_colorop_state->bypass ? NULL : new_colorop_state->data;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  373  				intel_colorop = to_intel_colorop(colorop);
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  374  				changed |= intel_plane_colorop_replace_blob(plane_state,
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  375  									    intel_colorop,
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  376  									    blob);
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  377  			}
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  378  		}
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  379  		iter_colorop = iter_colorop->next;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  380  	}
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  381  
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  382  	if (new_crtc_state && changed)
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  383  		new_crtc_state->plane_color_changed = true;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  384  }
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  385  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
