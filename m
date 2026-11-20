Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203451;
	b=P4wNVSIN7ReIxdAcnOVCJPtH1QyipMtSvBzosc1KAebC9b2wEfEL7OcRQ4NMFykl34Ij
	 nLtZilGoB6AEspX1312WD9SxV6m2nyWMg4Sv/1NACkI79jR9p7rF2A49Loh8CsFgKkSiH
	 xnLU0CSOQmpAuNSOoQ0y6iPWznj4N6mxOotzuTznEtUjXOjg4dSxyYXYhVTVYs63D2L38
	 kLYiMWpFszP5K/BdYpX4xo8eB/puraWFLFEijkCXL21f8t1vYGaZnMxoM4a0CgUsrSUqt
	 iuJTvPgkFowzrV6B5SjxsPtnUYUovcaQhK7cxm1X4HrGQT8twlDspA1kcZT+RChcU0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203451;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=RBRuLgr8xYUyGv2WZaC+diOpn8SesJTXtPBxj4WBVgg=;
	b=IYLqswOQR1uN+FH0QkZUFmR/sCZ0Fvtf+LEcr3Tu5A3NmxOmcgI3cwKO9CBDO2iz4zGs
	 lshQ2M/RChfzlWx6zHbz5+Lchc7xuzhzVIvacEYoTOnk7nq0vGHIQBkz0IOLGDvkZV89O
	 1+7W9V4bE39o6o84o4WyP1WRfvfYVpkXmEtfZOZTbs97SCNL2qB61U7zqkhcWCyi+E3ui
	 qqJh4I3Y9/O13qTf9M79NJxJgrInhwQQqWlQfpCIBh+56h6oZv0uUkpctVumZjWzBL/UH
	 zpl6z7o9KA5bRxbWJo2eKXu7ww+U2Ux0BbouBm/fYUv49KfX6SUNwGyLgEP4KpgPZnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GwQYSvK2;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E246A606A6C3
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Nov 2026 19:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E246A606A6C3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GwQYSvK2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795203450; x=1826739450;
  h=date:from:to:cc:subject:message-id;
  bh=C8XxyZQ1CpM9vRUOJgE3Iyfdp3p+l2lwGqE9plvdlEc=;
  b=GwQYSvK2Qwev7XU4zmqPDZXLYw6H6IXOk9UJDEpEKlhcy3wRlmCIYTWq
   gSG9nqub8sP810Bd2NqCBkgKNHNo0nMP6hmdpwxoRtFYU4rD4IY3JrPIv
   /9W9nH9Un5EOCtO9FBAjPUO0o0pRVQW52sVBYPZogIwjlym8YgNPEBdon
   yD8wcstQsDQO3oVaFAYcZ1o5kZiGMrhsEvMl7j2McJu15umQtQnOG3oO8
   Prnu/SG5LIAdFYZXochDGL1DT/ngvtGkfWXvbgkzcfg+YgN/b1WsgCdcb
   vQAwb6B2tn6ajRxYLoRqzeyhufd1k0sKcd0vbYfJcIrfFfzvXqeMBKer+
   Q==;
X-CSE-ConnectionGUID: OLcp+0a1S8CuYsvjLPL6yQ==
X-CSE-MsgGUID: cKyuUFIMSBCsvDWGjOIcrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4120974"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4120974"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 11:37:29 -0800
X-CSE-ConnectionGUID: HfNg6/KIQiygJ52GsQ4H3Q==
X-CSE-MsgGUID: ifvs6TWfRjujhRntzO00DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10713642"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 20 Nov 2026 11:37:28 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUUQG-0000000047F-3YiY;
	Fri, 20 Nov 2026 19:37:24 +0000
Date: Fri, 20 Nov 2026 20:37:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.6 95/95]
 drivers/gpu/drm/mediatek/mtk_crtc.c:1725:4-14: second lock on line 1725
Message-ID: <20261120202730.BTnerBv1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   af253fd0d3a923c12f5c6ff2b1b62fd4e69a0106
commit: 4876f9b7bf17811098b5e368678b82d1cb31e6cc [95/95] CHROMIUM: drm/mediatek: Hold hw_lock in the fast_modeset CMDQ path
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-r2109-20261112 (https://download.01.org/0day-ci/archive/20261120/20261120202730.BTnerBv1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261120202730.BTnerBv1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_crtc.c:1725:4-14: second lock on line 1725

vim +1725 drivers/gpu/drm/mediatek/mtk_crtc.c

119f5173628aa7 drivers/gpu/drm/mediatek/mtk_drm_crtc.c CK Hu            2016-01-04  1702  
c2f7b7f40b5eb8 drivers/gpu/drm/mediatek/mtk_drm_crtc.c Hsiao Chien Sung 2024-03-22  1703  static void mtk_crtc_atomic_begin(struct drm_crtc *crtc,
f6ebe9f9c9233a drivers/gpu/drm/mediatek/mtk_drm_crtc.c Maxime Ripard    2020-10-28  1704  				  struct drm_atomic_state *state)
119f5173628aa7 drivers/gpu/drm/mediatek/mtk_drm_crtc.c CK Hu            2016-01-04  1705  {
536e89daf375ca drivers/gpu/drm/mediatek/mtk_crtc.c     Jason-JH.Lin     2024-04-03  1706  	struct mtk_drm_private *priv = crtc->dev->dev_private;
253f28b6237264 drivers/gpu/drm/mediatek/mtk_drm_crtc.c Maxime Ripard    2020-11-05  1707  	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
253f28b6237264 drivers/gpu/drm/mediatek/mtk_drm_crtc.c Maxime Ripard    2020-11-05  1708  									  crtc);
253f28b6237264 drivers/gpu/drm/mediatek/mtk_drm_crtc.c Maxime Ripard    2020-11-05  1709  	struct mtk_crtc_state *mtk_crtc_state = to_mtk_crtc_state(crtc_state);
c2f7b7f40b5eb8 drivers/gpu/drm/mediatek/mtk_drm_crtc.c Hsiao Chien Sung 2024-03-22  1710  	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
7d6e9cb7b95165 drivers/gpu/drm/mediatek/mtk_drm_crtc.c Jason-JH.Lin     2023-09-20  1711  	unsigned long flags;
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1712  	struct cmdq_pkt *cmdq_handle = NULL;
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1713  
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1714  	if (mtk_crtc_state->fast_modeset) {
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1715  		dev_dbg(crtc->dev->dev, "crtc%d go fast_modeset flow to vrefresh:%d",
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1716  			drm_crtc_index(crtc), drm_mode_vrefresh(&crtc_state->adjusted_mode));
c6dbb11a1eef50 drivers/gpu/drm/mediatek/mtk_crtc.c     Yihuan Lai       2026-09-07  1717  		for (int i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
c6dbb11a1eef50 drivers/gpu/drm/mediatek/mtk_crtc.c     Yihuan Lai       2026-09-07  1718  			struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[i];
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1719  
c6dbb11a1eef50 drivers/gpu/drm/mediatek/mtk_crtc.c     Yihuan Lai       2026-09-07  1720  			if (!comp->funcs || !comp->funcs->update_config)
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1721  				continue;
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1722  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1723  			if (mtk_crtc->cmdq_client.chan) {
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1724  				cmdq_handle = &mtk_crtc->cmdq_handle;
4876f9b7bf1781 drivers/gpu/drm/mediatek/mtk_crtc.c     Fei Shao         2026-11-03 @1725  				mutex_lock(&mtk_crtc->hw_lock);
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1726  				mbox_flush(mtk_crtc->cmdq_client.chan, 2000);
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1727  				cmdq_handle->cmd_buf_size = 0;
813387789ac385 drivers/gpu/drm/mediatek/mtk_crtc.c     Fei Shao         2026-10-02  1728  				reinit_completion(&cmdq_handle->done);
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1729  				cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1730  				cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1731  			}
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1732  #endif
c6dbb11a1eef50 drivers/gpu/drm/mediatek/mtk_crtc.c     Yihuan Lai       2026-09-07  1733  			comp->funcs->update_config(comp->dev, crtc_state, cmdq_handle);
8ab11eb6e73708 drivers/gpu/drm/mediatek/mtk_crtc.c     Nancy Lin        2025-05-06  1734  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
