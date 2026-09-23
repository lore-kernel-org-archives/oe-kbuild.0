Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FF937BE98
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 03:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135453; cv=none; b=gAnc5Ja6EixNUyJ/GxOAHAUyaBROjukajIz4BI0XiZAKhGBiwCsShPPXOCYtvCB4UAMT4zXvMuJWgeaCzHlQe3KidCXau+iIylF4CLOJNVMZ4SO9cCfZ9nxvi8haDZneJLgg7IQIFrNKX7K8jEZppT5TRNL3kMCdxdLcoeIdd30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135453; c=relaxed/simple;
	bh=E0NM8yDjAyqf9z7ZkSXqoa8WGHRbR7KqUV3qoqHZw8s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S0sSHK39/kX/pDfm2HwvbO6EegR1QDlVuZzRuIXotE8PsczRkDQDq5q09YoC7GU8h6GFjvsLg7NDooSs/q9dvVu5uOIxzD75aVqXgH5Dk22MazKGTLADPg3Gw2sOCti0X8J144FiidH8pwQ0Fbhic6f/r69wKnFYMXd4Grp4ndU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0u1Eej2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0u1Eej2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790135450; x=1821671450;
  h=date:from:to:cc:subject:message-id;
  bh=E0NM8yDjAyqf9z7ZkSXqoa8WGHRbR7KqUV3qoqHZw8s=;
  b=c0u1Eej2yGT4GzRBPTrqHNZadZLED5b5+Q8jC5TTv7x8Q/xPViclH2rJ
   b9TolQMl8Qb0Vqww/0hk86Ul66HNWcWpY5YhOumtzeTq/NLthyrLWcmPb
   7iQ/2vLlWn6X/rAYpliNz1WsI5QY+unr1UGmT4WIYZmhhKXMk8wA4HSrb
   hLox/rn7BWHShg0DMJc41j+N41uYAaLqHOk0I6I2+y0xZNfuS5RdwbyVL
   J0itIWZxoNerzuHj7k49npvdJ4RSWxvCOhgbEHgayFhdNTCjvnPwWP52r
   wgj+z9S1tqDqnI1ff+h3jFTTrb6UY3Ha0VMTIj7SOcVxGOl/vgODxliKQ
   w==;
X-CSE-ConnectionGUID: P2knFJUKSoSyFTKecEBOHA==
X-CSE-MsgGUID: mwsLjmakS6mtQ4EmGKX4xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="89927852"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="89927852"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 20:50:50 -0700
X-CSE-ConnectionGUID: bdUyhl5eRfSMDdjmgWPGkw==
X-CSE-MsgGUID: gfT+l7seRze1UkJsXxvXjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="4713475"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 22 Sep 2026 20:50:49 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9E0M-000000000Sx-2Nyv;
	Wed, 23 Sep 2026 03:50:46 +0000
Date: Wed, 23 Sep 2026 05:50:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7149/8910]
 drivers/gpu/drm/display/drm_hdmi_helper.c:656 drm_connector_hdmi_sync_scdc()
 warn: variable dereferenced before check 'connector' (see line 650)
Message-ID: <202609230549.j4KCLEad-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: Maxime Ripard <mripard@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: d653818324edc79d8dd55f77496220d3849910d0 [7149/8910] drm/display: hdmi: Add HDMI 2.0 scrambling management helpers
:::::: branch date: 14 hours ago
:::::: commit date: 3 days ago
config: alpha-randconfig-r2201-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230549.j4KCLEad-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609230549.j4KCLEad-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/display/drm_hdmi_helper.c:656 drm_connector_hdmi_sync_scdc() warn: variable dereferenced before check 'connector' (see line 650)

vim +/connector +656 drivers/gpu/drm/display/drm_hdmi_helper.c

d653818324edc79 Cristian Ciocaltea 2026-09-01  625  
d653818324edc79 Cristian Ciocaltea 2026-09-01  626  /**
d653818324edc79 Cristian Ciocaltea 2026-09-01  627   * drm_connector_hdmi_sync_scdc() - resync the sink-side SCDC upon reconnect
d653818324edc79 Cristian Ciocaltea 2026-09-01  628   * @connector: connector
d653818324edc79 Cristian Ciocaltea 2026-09-01  629   * @plugged: connector plugged status event
d653818324edc79 Cristian Ciocaltea 2026-09-01  630   * @ctx: initialized lock acquisition context
d653818324edc79 Cristian Ciocaltea 2026-09-01  631   *
d653818324edc79 Cristian Ciocaltea 2026-09-01  632   * When receiving hotplug disconnect/reconnect event, while the display is
d653818324edc79 Cristian Ciocaltea 2026-09-01  633   * still active (CRTC enabled), the SCDC status on the sink side is reset
d653818324edc79 Cristian Ciocaltea 2026-09-01  634   * and must be explicitly restored.
d653818324edc79 Cristian Ciocaltea 2026-09-01  635   *
d653818324edc79 Cristian Ciocaltea 2026-09-01  636   * The typical solution for this is to trigger an empty modeset in
d653818324edc79 Cristian Ciocaltea 2026-09-01  637   * drm_connector_helper_funcs.detect_ctx(), which is what this helper does
d653818324edc79 Cristian Ciocaltea 2026-09-01  638   * by triggering a CRTC reset on reconnection.
d653818324edc79 Cristian Ciocaltea 2026-09-01  639   *
d653818324edc79 Cristian Ciocaltea 2026-09-01  640   * When making use of the HDMI connector framework, this is automatically
d653818324edc79 Cristian Ciocaltea 2026-09-01  641   * triggered via drm_atomic_helper_connector_hdmi_hotplug().
d653818324edc79 Cristian Ciocaltea 2026-09-01  642   *
d653818324edc79 Cristian Ciocaltea 2026-09-01  643   * Returns:
d653818324edc79 Cristian Ciocaltea 2026-09-01  644   * Zero on success, an error code otherwise, including -EDEADLK.
d653818324edc79 Cristian Ciocaltea 2026-09-01  645   */
d653818324edc79 Cristian Ciocaltea 2026-09-01  646  int drm_connector_hdmi_sync_scdc(struct drm_connector *connector, bool plugged,
d653818324edc79 Cristian Ciocaltea 2026-09-01  647  				 struct drm_modeset_acquire_ctx *ctx)
d653818324edc79 Cristian Ciocaltea 2026-09-01  648  {
d653818324edc79 Cristian Ciocaltea 2026-09-01  649  	struct drm_connector_hdmi *hdmi = &connector->hdmi;
d653818324edc79 Cristian Ciocaltea 2026-09-01 @650  	struct drm_device *dev = connector->dev;
d653818324edc79 Cristian Ciocaltea 2026-09-01  651  	struct drm_connector_state *conn_state;
d653818324edc79 Cristian Ciocaltea 2026-09-01  652  	struct drm_crtc *crtc;
d653818324edc79 Cristian Ciocaltea 2026-09-01  653  	u8 config;
d653818324edc79 Cristian Ciocaltea 2026-09-01  654  	int ret;
d653818324edc79 Cristian Ciocaltea 2026-09-01  655  
d653818324edc79 Cristian Ciocaltea 2026-09-01 @656  	if (!connector || !plugged || !ctx)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
