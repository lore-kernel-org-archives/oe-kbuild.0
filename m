Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025665;
	b=FZe8US1fFcstqTtXq75oir5Tpz0FLjAOTC9yAzbC8ANdnASaiJRmc5mowdjP30M+P+FX
	 OzCp5NzLjWZPCK68M1je8TH4gnz11ZKjTgbEbrsNWI8rj5PFHeEa0kpcOU27SeW/kiXwc
	 +kvT1Ld5jsCFobAeV3oJzzbVM8dBNBqEkN48VtNQPvvhE9WQCJ5K2h6muLKspBr6K715J
	 ybmxY2un+W8N0YM9gOul7zJ8GQs3ccW2p8cu5et7PJux/5m/OThZQ6QCYRjCeX1HuWBi5
	 tv+pOjwKXH54AXbCFJfilYcgBtG6cmvZQGdGkto8XEXKIvAS+Ev3mvrdFCmku06Wu1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025665;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=eQz1OlHOSvF9O8jnBZ1mj85Tzq2wHsB9EVP7wbW/k5Y=;
	b=pzgEgD3nS33eLaksuBLt+kTaAFs8LG66CLM0/9zY8E+vXYd3HIpCz/cfIbpIgro8xAe7
	 JSyk36Zs5GUaxAiYPWG+V5o8p2P0Ledtc+igHS+2Iu1HuYYJgF+mX4rQT8pql4PIaTcKN
	 C6+hLM2B6sGu8sQuwsI3YKLGTJCs0RzX1B10YkJs5mMy1/DZ0mgpe2l5zvkbtA6gg8//4
	 w/yc0dzDoEI/wvT520E46NPxe5XFEMddiDK6ePBFEAdMatHM/l1gMLpmnMEfJhYJZSn5S
	 CKuWQsJpj1qgB1LRSmZfzcw9wld0j2FLOIxAIf99WotyEhPXweBTFJSw5DqVCsHV85g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lbNA+h8d;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33317606A32C
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 04:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33317606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lbNA+h8d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794025663; x=1825561663;
  h=date:from:to:cc:subject:message-id;
  bh=m7hAL+bmDMNFgn9TYgP0LbGrV8z59ABMSKFb0Bl6GLk=;
  b=lbNA+h8dQnDnWRgZhghSmisytV9MYDAftDAfZx46Ytjg3oiFC2havnJ7
   4mBz/brvToBRRALxtV8GrZRBiYYNg+jsCFaBIRqn/P1jOtcfYjCn7kAKR
   PL3WoAzodmEubUXAAvZJozPKcmR9eE5td2+ZsJPCzV7Tg/nXocmT9YGRT
   FsnNqQU0vRh0kD/0jMxjLhPGMQtw+aGxL67eh8xMP4GmJ+1lvwRKsfqD7
   LcsxmwAXvy9HqZ6PXpb2SxmV1nA36sb7/+e6414IX0YcQhj5Lf82y3KYd
   HM2+N9qPHL4RCh1zccJEw/1rAIqgS+4smslyr8J2j30kGPWapCJEfB6NU
   g==;
X-CSE-ConnectionGUID: PM/yTlpiS3y3YdgV1v2gBA==
X-CSE-MsgGUID: rWehMTSNTaCYDpD9/yv5wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2833887"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2833887"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 20:27:42 -0800
X-CSE-ConnectionGUID: /usd5LdtQ5GnbtImVVAbSg==
X-CSE-MsgGUID: YeAXfSVbQmaxBYu8jZbqsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7589230"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2026 20:27:41 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPY1i-00000000AXf-14Bg;
	Sat, 07 Nov 2026 04:27:38 +0000
Date: Sat, 07 Nov 2026 05:27:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [drm-misc:drm-misc-next 32/48]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c:3322
 amdgpu_dm_connector_init_helper() error: we previously assumed
 'aconnector->base.state' could be null (see line 3230)
Message-ID: <202611070550.m6aIjVTi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: dri-devel@lists.freedesktop.org
TO: Maxime Ripard <mripard@kernel.org>
CC: Leo Li <sunpeng.li@amd.com>
CC: Thomas Zimmermann <tzimmermann@suse.de>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   2d5a8313d9cf989b8f53a5689a96e891bf99fb2c
commit: efb3523ce260fbb7b89c870bc2c31c384ec98a9e [32/48] drm/amdgpu: dm: Convert to atomic_create_state
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-2200-20261106 (https://download.01.org/0day-ci/archive/20261107/202611070550.m6aIjVTi-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611070550.m6aIjVTi-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c:3322 amdgpu_dm_connector_init_helper() error: we previously assumed 'aconnector->base.state' could be null (see line 3230)

vim +3322 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c

0e967e086e7519 Alex Hung     2026-04-27  3217  
0e967e086e7519 Alex Hung     2026-04-27  3218  void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
0e967e086e7519 Alex Hung     2026-04-27  3219  				     struct amdgpu_dm_connector *aconnector,
0e967e086e7519 Alex Hung     2026-04-27  3220  				     int connector_type,
0e967e086e7519 Alex Hung     2026-04-27  3221  				     struct dc_link *link,
0e967e086e7519 Alex Hung     2026-04-27  3222  				     int link_index)
0e967e086e7519 Alex Hung     2026-04-27  3223  {
0e967e086e7519 Alex Hung     2026-04-27  3224  	struct amdgpu_device *adev = drm_to_adev(dm->ddev);
0e967e086e7519 Alex Hung     2026-04-27  3225  
0e967e086e7519 Alex Hung     2026-04-27  3226  	/*
0e967e086e7519 Alex Hung     2026-04-27  3227  	 * Some of the properties below require access to state, like bpc.
0e967e086e7519 Alex Hung     2026-04-27  3228  	 * Allocate some default initial connector state with our reset helper.
0e967e086e7519 Alex Hung     2026-04-27  3229  	 */
efb3523ce260fb Maxime Ripard 2026-10-30 @3230  	if (!aconnector->base.state &&
efb3523ce260fb Maxime Ripard 2026-10-30  3231  	    aconnector->base.funcs->atomic_create_state) {
efb3523ce260fb Maxime Ripard 2026-10-30  3232  		struct drm_connector_state *conn_state;
efb3523ce260fb Maxime Ripard 2026-10-30  3233  
efb3523ce260fb Maxime Ripard 2026-10-30  3234  		conn_state = aconnector->base.funcs->atomic_create_state(&aconnector->base);
efb3523ce260fb Maxime Ripard 2026-10-30  3235  		if (IS_ERR(conn_state))
efb3523ce260fb Maxime Ripard 2026-10-30  3236  			return;
efb3523ce260fb Maxime Ripard 2026-10-30  3237  
efb3523ce260fb Maxime Ripard 2026-10-30  3238  		aconnector->base.state = conn_state;
efb3523ce260fb Maxime Ripard 2026-10-30  3239  	}
0e967e086e7519 Alex Hung     2026-04-27  3240  
0e967e086e7519 Alex Hung     2026-04-27  3241  	aconnector->connector_id = link_index;
0e967e086e7519 Alex Hung     2026-04-27  3242  	aconnector->bl_idx = -1;
0e967e086e7519 Alex Hung     2026-04-27  3243  	aconnector->dc_link = link;
0e967e086e7519 Alex Hung     2026-04-27  3244  	aconnector->base.interlace_allowed = false;
0e967e086e7519 Alex Hung     2026-04-27  3245  	aconnector->base.doublescan_allowed = false;
0e967e086e7519 Alex Hung     2026-04-27  3246  	aconnector->base.stereo_allowed = false;
0e967e086e7519 Alex Hung     2026-04-27  3247  	aconnector->base.dpms = DRM_MODE_DPMS_OFF;
0e967e086e7519 Alex Hung     2026-04-27  3248  	aconnector->hpd.hpd = AMDGPU_HPD_NONE; /* not used */
0e967e086e7519 Alex Hung     2026-04-27  3249  	aconnector->audio_inst = -1;
0e967e086e7519 Alex Hung     2026-04-27  3250  	aconnector->pack_sdp_v1_3 = false;
0e967e086e7519 Alex Hung     2026-04-27  3251  	aconnector->as_type = ADAPTIVE_SYNC_TYPE_NONE;
0e967e086e7519 Alex Hung     2026-04-27  3252  	memset(&aconnector->vsdb_info, 0, sizeof(aconnector->vsdb_info));
0e967e086e7519 Alex Hung     2026-04-27  3253  	mutex_init(&aconnector->hpd_lock);
0e967e086e7519 Alex Hung     2026-04-27  3254  	mutex_init(&aconnector->handle_mst_msg_ready);
0e967e086e7519 Alex Hung     2026-04-27  3255  
0e967e086e7519 Alex Hung     2026-04-27  3256  	/*
0e967e086e7519 Alex Hung     2026-04-27  3257  	 * If HDMI HPD debounce delay is set, use the minimum between selected
0e967e086e7519 Alex Hung     2026-04-27  3258  	 * value and AMDGPU_DM_MAX_HDMI_HPD_DEBOUNCE_MS
0e967e086e7519 Alex Hung     2026-04-27  3259  	 */
0e967e086e7519 Alex Hung     2026-04-27  3260  	if (amdgpu_hdmi_hpd_debounce_delay_ms) {
0e967e086e7519 Alex Hung     2026-04-27  3261  		aconnector->hdmi_hpd_debounce_delay_ms = min(amdgpu_hdmi_hpd_debounce_delay_ms,
0e967e086e7519 Alex Hung     2026-04-27  3262  							     AMDGPU_DM_MAX_HDMI_HPD_DEBOUNCE_MS);
0e967e086e7519 Alex Hung     2026-04-27  3263  		INIT_DELAYED_WORK(&aconnector->hdmi_hpd_debounce_work, amdgpu_dm_hdmi_hpd_debounce_work);
0e967e086e7519 Alex Hung     2026-04-27  3264  		aconnector->hdmi_prev_sink = NULL;
0e967e086e7519 Alex Hung     2026-04-27  3265  	} else {
0e967e086e7519 Alex Hung     2026-04-27  3266  		aconnector->hdmi_hpd_debounce_delay_ms = 0;
0e967e086e7519 Alex Hung     2026-04-27  3267  	}
0e967e086e7519 Alex Hung     2026-04-27  3268  
0e967e086e7519 Alex Hung     2026-04-27  3269  	dm->hdmi_frl_status_polling_delay_ms = 200;
0e967e086e7519 Alex Hung     2026-04-27  3270  	INIT_DELAYED_WORK(&dm->hdmi_frl_status_polling_work, hdmi_frl_status_polling_work);
0e967e086e7519 Alex Hung     2026-04-27  3271  	/*
0e967e086e7519 Alex Hung     2026-04-27  3272  	 * configure support HPD hot plug connector_>polled default value is 0
0e967e086e7519 Alex Hung     2026-04-27  3273  	 * which means HPD hot plug not supported
0e967e086e7519 Alex Hung     2026-04-27  3274  	 */
0e967e086e7519 Alex Hung     2026-04-27  3275  	switch (connector_type) {
0e967e086e7519 Alex Hung     2026-04-27  3276  	case DRM_MODE_CONNECTOR_HDMIA:
0e967e086e7519 Alex Hung     2026-04-27  3277  		aconnector->base.polled = DRM_CONNECTOR_POLL_HPD;
0e967e086e7519 Alex Hung     2026-04-27  3278  		aconnector->base.ycbcr_420_allowed =
0e967e086e7519 Alex Hung     2026-04-27  3279  			link->link_enc->features.hdmi_ycbcr420_supported ? true : false;
0e967e086e7519 Alex Hung     2026-04-27  3280  		break;
0e967e086e7519 Alex Hung     2026-04-27  3281  	case DRM_MODE_CONNECTOR_DisplayPort:
0e967e086e7519 Alex Hung     2026-04-27  3282  		aconnector->base.polled = DRM_CONNECTOR_POLL_HPD;
0e967e086e7519 Alex Hung     2026-04-27  3283  		link->link_enc = link_enc_cfg_get_link_enc(link);
0e967e086e7519 Alex Hung     2026-04-27  3284  		ASSERT(link->link_enc);
0e967e086e7519 Alex Hung     2026-04-27  3285  		if (link->link_enc)
0e967e086e7519 Alex Hung     2026-04-27  3286  			aconnector->base.ycbcr_420_allowed =
0e967e086e7519 Alex Hung     2026-04-27  3287  			link->link_enc->features.dp_ycbcr420_supported ? true : false;
0e967e086e7519 Alex Hung     2026-04-27  3288  		break;
0e967e086e7519 Alex Hung     2026-04-27  3289  	case DRM_MODE_CONNECTOR_DVID:
0e967e086e7519 Alex Hung     2026-04-27  3290  		aconnector->base.polled = DRM_CONNECTOR_POLL_HPD;
0e967e086e7519 Alex Hung     2026-04-27  3291  		break;
0e967e086e7519 Alex Hung     2026-04-27  3292  	case DRM_MODE_CONNECTOR_DVII:
0e967e086e7519 Alex Hung     2026-04-27  3293  	case DRM_MODE_CONNECTOR_VGA:
0e967e086e7519 Alex Hung     2026-04-27  3294  		aconnector->base.polled =
0e967e086e7519 Alex Hung     2026-04-27  3295  			DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
0e967e086e7519 Alex Hung     2026-04-27  3296  		break;
0e967e086e7519 Alex Hung     2026-04-27  3297  	default:
0e967e086e7519 Alex Hung     2026-04-27  3298  		break;
0e967e086e7519 Alex Hung     2026-04-27  3299  	}
0e967e086e7519 Alex Hung     2026-04-27  3300  
0e967e086e7519 Alex Hung     2026-04-27  3301  	drm_object_attach_property(&aconnector->base.base,
0e967e086e7519 Alex Hung     2026-04-27  3302  				dm->ddev->mode_config.scaling_mode_property,
0e967e086e7519 Alex Hung     2026-04-27  3303  				DRM_MODE_SCALE_NONE);
0e967e086e7519 Alex Hung     2026-04-27  3304  
0e967e086e7519 Alex Hung     2026-04-27  3305  	if (connector_type == DRM_MODE_CONNECTOR_HDMIA
0e967e086e7519 Alex Hung     2026-04-27  3306  		|| (connector_type == DRM_MODE_CONNECTOR_DisplayPort && !aconnector->mst_root))
0e967e086e7519 Alex Hung     2026-04-27  3307  		drm_connector_attach_broadcast_rgb_property(&aconnector->base);
0e967e086e7519 Alex Hung     2026-04-27  3308  
0e967e086e7519 Alex Hung     2026-04-27  3309  	drm_object_attach_property(&aconnector->base.base,
0e967e086e7519 Alex Hung     2026-04-27  3310  				adev->mode_info.underscan_property,
0e967e086e7519 Alex Hung     2026-04-27  3311  				UNDERSCAN_OFF);
0e967e086e7519 Alex Hung     2026-04-27  3312  	drm_object_attach_property(&aconnector->base.base,
0e967e086e7519 Alex Hung     2026-04-27  3313  				adev->mode_info.underscan_hborder_property,
0e967e086e7519 Alex Hung     2026-04-27  3314  				0);
0e967e086e7519 Alex Hung     2026-04-27  3315  	drm_object_attach_property(&aconnector->base.base,
0e967e086e7519 Alex Hung     2026-04-27  3316  				adev->mode_info.underscan_vborder_property,
0e967e086e7519 Alex Hung     2026-04-27  3317  				0);
0e967e086e7519 Alex Hung     2026-04-27  3318  
0e967e086e7519 Alex Hung     2026-04-27  3319  	if (!aconnector->mst_root)
0e967e086e7519 Alex Hung     2026-04-27  3320  		drm_connector_attach_max_bpc_property(&aconnector->base, 8, 16);
0e967e086e7519 Alex Hung     2026-04-27  3321  
0e967e086e7519 Alex Hung     2026-04-27 @3322  	aconnector->base.state->max_bpc = 16;
0e967e086e7519 Alex Hung     2026-04-27  3323  	aconnector->base.state->max_requested_bpc = aconnector->base.state->max_bpc;
0e967e086e7519 Alex Hung     2026-04-27  3324  
0e967e086e7519 Alex Hung     2026-04-27  3325  	if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
0e967e086e7519 Alex Hung     2026-04-27  3326  		/* Content Type is currently only implemented for HDMI. */
0e967e086e7519 Alex Hung     2026-04-27  3327  		drm_connector_attach_content_type_property(&aconnector->base);
0e967e086e7519 Alex Hung     2026-04-27  3328  	}
0e967e086e7519 Alex Hung     2026-04-27  3329  
0e967e086e7519 Alex Hung     2026-04-27  3330  	if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
0e967e086e7519 Alex Hung     2026-04-27  3331  		if (!drm_mode_create_hdmi_colorspace_property(&aconnector->base, supported_colorspaces))
0e967e086e7519 Alex Hung     2026-04-27  3332  			drm_connector_attach_colorspace_property(&aconnector->base);
0e967e086e7519 Alex Hung     2026-04-27  3333  	} else if ((connector_type == DRM_MODE_CONNECTOR_DisplayPort && !aconnector->mst_root) ||
0e967e086e7519 Alex Hung     2026-04-27  3334  		   connector_type == DRM_MODE_CONNECTOR_eDP) {
0e967e086e7519 Alex Hung     2026-04-27  3335  		if (!drm_mode_create_dp_colorspace_property(&aconnector->base, supported_colorspaces))
0e967e086e7519 Alex Hung     2026-04-27  3336  			drm_connector_attach_colorspace_property(&aconnector->base);
0e967e086e7519 Alex Hung     2026-04-27  3337  	}
0e967e086e7519 Alex Hung     2026-04-27  3338  
0e967e086e7519 Alex Hung     2026-04-27  3339  	if (connector_type == DRM_MODE_CONNECTOR_HDMIA ||
0e967e086e7519 Alex Hung     2026-04-27  3340  	    connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
0e967e086e7519 Alex Hung     2026-04-27  3341  	    connector_type == DRM_MODE_CONNECTOR_eDP) {
0e967e086e7519 Alex Hung     2026-04-27  3342  		drm_connector_attach_hdr_output_metadata_property(&aconnector->base);
0e967e086e7519 Alex Hung     2026-04-27  3343  
0461ba9a7994a9 Dave Airlie   2026-07-07  3344  		if (!aconnector->mst_root) {
0e967e086e7519 Alex Hung     2026-04-27  3345  			drm_connector_attach_vrr_capable_property(&aconnector->base);
0461ba9a7994a9 Dave Airlie   2026-07-07  3346  			drm_connector_attach_color_format_property(&aconnector->base,
0461ba9a7994a9 Dave Airlie   2026-07-07  3347  								   supported_colorformats);
0461ba9a7994a9 Dave Airlie   2026-07-07  3348  		}
0e967e086e7519 Alex Hung     2026-04-27  3349  
0e967e086e7519 Alex Hung     2026-04-27  3350  
0e967e086e7519 Alex Hung     2026-04-27  3351  		if (adev->dm.hdcp_workqueue)
0e967e086e7519 Alex Hung     2026-04-27  3352  			drm_connector_attach_content_protection_property(&aconnector->base, true);
0e967e086e7519 Alex Hung     2026-04-27  3353  	}
0e967e086e7519 Alex Hung     2026-04-27  3354  
0e967e086e7519 Alex Hung     2026-04-27  3355  	if (connector_type == DRM_MODE_CONNECTOR_eDP) {
0e967e086e7519 Alex Hung     2026-04-27  3356  		struct drm_privacy_screen *privacy_screen;
0e967e086e7519 Alex Hung     2026-04-27  3357  
0e967e086e7519 Alex Hung     2026-04-27  3358  		drm_connector_attach_panel_type_property(&aconnector->base);
0e967e086e7519 Alex Hung     2026-04-27  3359  
0e967e086e7519 Alex Hung     2026-04-27  3360  		privacy_screen = drm_privacy_screen_get(adev_to_drm(adev)->dev, NULL);
0e967e086e7519 Alex Hung     2026-04-27  3361  		if (!IS_ERR(privacy_screen)) {
0e967e086e7519 Alex Hung     2026-04-27  3362  			drm_connector_attach_privacy_screen_provider(&aconnector->base,
0e967e086e7519 Alex Hung     2026-04-27  3363  								     privacy_screen);
0e967e086e7519 Alex Hung     2026-04-27  3364  		} else if (PTR_ERR(privacy_screen) != -ENODEV) {
0e967e086e7519 Alex Hung     2026-04-27  3365  			drm_warn(adev_to_drm(adev), "Error getting privacy-screen\n");
0e967e086e7519 Alex Hung     2026-04-27  3366  		}
0e967e086e7519 Alex Hung     2026-04-27  3367  	}
0e967e086e7519 Alex Hung     2026-04-27  3368  }
94be315afbd42b Alex Hung     2026-08-29  3369  EXPORT_IF_KUNIT(amdgpu_dm_connector_init_helper);
0e967e086e7519 Alex Hung     2026-04-27  3370  

:::::: The code at line 3322 was first introduced by commit
:::::: 0e967e086e7519966816b76a6309b4516d365aa5 drm/amd/display: Extract connector and encoder code to amdgpu_dm_connector

:::::: TO: Alex Hung <alex.hung@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
