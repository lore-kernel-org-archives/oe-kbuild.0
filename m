Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B152EEE68
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jun 2026 21:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781558004; cv=none; b=lUfrMjlCIS6xf4a50hu1fTR7db0X/1UK9GMdk1IajQ2d03h+noAPT1VdcVKBJDyqK1iHbOLucXgZ0X0IindD/D6rF+N/++UK1Xd6GNikiU5Ud8M7aEs6Cwz0dv9DTcMgF8gUDkY+5eQjGCdX82WQhf2tQB+mfgsn36M3JLuAg/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781558004; c=relaxed/simple;
	bh=hPeD37fxXT3bOj9V7+pHZfZUTB1//2i3JAgwDdrF35w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sgpXy0Uw8J+7C3osLIeI6f8TpghLsF+5o2aIkhD/59V/mwyAyNOyEo7X6x0toEQ9UMJVj0gNQvGdn2bV7dSoAdJdmGPhEvXjsqnXrWxwh5deXVBmBiC/8h56wvc+1WbJTNCx7L0q6W7DH2vVtBrzTtalVsZsWaHOmgszHXtQmio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8uvWGJs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8uvWGJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781558002; x=1813094002;
  h=date:from:to:cc:subject:message-id;
  bh=hPeD37fxXT3bOj9V7+pHZfZUTB1//2i3JAgwDdrF35w=;
  b=a8uvWGJsbjSVnrvAUlPaQIpy8bkcI/6AOrru7i8s4aFb1LtUydVEnfro
   6DlMsppRtpIBC7s6xhZ2qL2VxcAT7Eb0sk95BphoTdv11WcgYEqjw7Fad
   U9g/S0/04fsoPS7flUcIQLlEVCMdsv8uBI4sigyqkSXkUc9KLpHBKqqOo
   xjg9g4MQG0ID8GTLHKe/GIbz/5dY7oSVx2QkEeU5lPsuqWprC/rA1uOCk
   hp/YXvqdKqsA9doqOGrjmjGNo1/y7wL1M39XYOUkWHeG5sbaKzSilLY4i
   zh0B8eUYbE8xt2+hzt4v7ZiNxSy2g8lSMN55TtFjiigDj6qx27Yzk48Wh
   g==;
X-CSE-ConnectionGUID: VkKysI6KQUWHDVOO0L6o+Q==
X-CSE-MsgGUID: D3ykWow1RoWQZqhLWyVEZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="85944276"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="85944276"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 14:13:21 -0700
X-CSE-ConnectionGUID: YtyIFFd1Tdiomeyd+BZKnA==
X-CSE-MsgGUID: QjCPM0LfRkW+sqwIaxWUOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="241206285"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jun 2026 14:13:19 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZEcO-00000000SOQ-3JTx;
	Mon, 15 Jun 2026 21:13:16 +0000
Date: Tue, 16 Jun 2026 05:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9791/14023]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_hdmi_frl.c:781
 hdmi_frl_verify_link_cap() error: we previously assumed 'link->local_sink'
 could be null (see line 776)
Message-ID: <202606160512.NM58W8KB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Harry Wentland <harry.wentland@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Fangzhi Zuo <Jerry.Zuo@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
commit: cbb8e2044b9e936dfa66f1d4a2f835316c741a67 [9791/14023] drm/amd/display: Add DC link support for FRL
:::::: branch date: 5 hours ago
:::::: commit date: 12 days ago
config: i386-randconfig-141-20260611 (https://download.01.org/0day-ci/archive/20260616/202606160512.NM58W8KB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606160512.NM58W8KB-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_hdmi_frl.c:781 hdmi_frl_verify_link_cap() error: we previously assumed 'link->local_sink' could be null (see line 776)
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_hdmi_frl.c:928 hdmi_frl_set_preferred_link_settings() warn: variable dereferenced before check 'pipe->stream_res.hpo_frl_stream_enc' (see line 916)

vim +781 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_hdmi_frl.c

cbb8e2044b9e93 Harry Wentland 2026-04-24   744  
cbb8e2044b9e93 Harry Wentland 2026-04-24   745  void hdmi_frl_verify_link_cap(struct dc_link *link,
cbb8e2044b9e93 Harry Wentland 2026-04-24   746  		struct dc_hdmi_frl_link_settings *known_limit_link_setting)
cbb8e2044b9e93 Harry Wentland 2026-04-24   747  {
cbb8e2044b9e93 Harry Wentland 2026-04-24   748  	struct dc_hdmi_frl_link_settings cur_link_setting = {0};
cbb8e2044b9e93 Harry Wentland 2026-04-24   749  	struct dc_hdmi_frl_link_settings *cur = &cur_link_setting;
cbb8e2044b9e93 Harry Wentland 2026-04-24   750  	bool success = false;
cbb8e2044b9e93 Harry Wentland 2026-04-24   751  	enum link_result status = LINK_RESULT_UNKNOWN;
cbb8e2044b9e93 Harry Wentland 2026-04-24   752  	enum clock_source_id frl_phy_clock_source_id;
cbb8e2044b9e93 Harry Wentland 2026-04-24   753  	unsigned int t_id = link->link_enc->transmitter;
cbb8e2044b9e93 Harry Wentland 2026-04-24   754  	struct link_resource link_res = {.hpo_frl_link_enc = link->hpo_frl_link_enc};
cbb8e2044b9e93 Harry Wentland 2026-04-24   755  	struct dc_stream_state *link_stream = NULL;
cbb8e2044b9e93 Harry Wentland 2026-04-24   756  	struct dc_stream_state *stream = NULL;
cbb8e2044b9e93 Harry Wentland 2026-04-24   757  	int i;
cbb8e2044b9e93 Harry Wentland 2026-04-24   758  
cbb8e2044b9e93 Harry Wentland 2026-04-24   759  	DC_LOGGER_INIT(link->ctx->logger);
cbb8e2044b9e93 Harry Wentland 2026-04-24   760  
cbb8e2044b9e93 Harry Wentland 2026-04-24   761  	link->frl_flags.force_frl_rate =
cbb8e2044b9e93 Harry Wentland 2026-04-24   762  			link->ctx->dc->debug.force_frl_rate;
cbb8e2044b9e93 Harry Wentland 2026-04-24   763  	link->frl_flags.force_frl_always =
cbb8e2044b9e93 Harry Wentland 2026-04-24   764  			link->preferred_hdmi_frl_settings.force_frl_always ||
cbb8e2044b9e93 Harry Wentland 2026-04-24   765  			link->ctx->dc->debug.force_frl_always;
cbb8e2044b9e93 Harry Wentland 2026-04-24   766  	link->frl_flags.force_frl_max =
cbb8e2044b9e93 Harry Wentland 2026-04-24   767  			link->preferred_hdmi_frl_settings.force_frl_max ||
cbb8e2044b9e93 Harry Wentland 2026-04-24   768  			link->ctx->dc->debug.force_frl_max ? true :
cbb8e2044b9e93 Harry Wentland 2026-04-24   769  			hdmi_frl_test_max_rate(link->ddc);
cbb8e2044b9e93 Harry Wentland 2026-04-24   770  	link->frl_flags.apply_vsdb_rcc_wa =
cbb8e2044b9e93 Harry Wentland 2026-04-24   771  			link->ctx->dc->debug.apply_vsdb_rcc_wa;
cbb8e2044b9e93 Harry Wentland 2026-04-24   772  
cbb8e2044b9e93 Harry Wentland 2026-04-24   773  	if (link->frl_flags.force_frl_rate == 0xF)
cbb8e2044b9e93 Harry Wentland 2026-04-24   774  		return;
cbb8e2044b9e93 Harry Wentland 2026-04-24   775  
cbb8e2044b9e93 Harry Wentland 2026-04-24  @776  	if (link->local_sink &&
cbb8e2044b9e93 Harry Wentland 2026-04-24   777  		link->local_sink->edid_caps.panel_patch.force_frl)
cbb8e2044b9e93 Harry Wentland 2026-04-24   778  			link->frl_flags.force_frl_always = true;
cbb8e2044b9e93 Harry Wentland 2026-04-24   779  
cbb8e2044b9e93 Harry Wentland 2026-04-24   780  	if (!link->frl_flags.force_frl_max &&
cbb8e2044b9e93 Harry Wentland 2026-04-24  @781  			link->local_sink->edid_caps.panel_patch.hdmi_comp_auto) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   782  		link->frl_flags.force_frl_max = true;
cbb8e2044b9e93 Harry Wentland 2026-04-24   783  	}
cbb8e2044b9e93 Harry Wentland 2026-04-24   784  
cbb8e2044b9e93 Harry Wentland 2026-04-24   785  	if (link->local_sink &&
cbb8e2044b9e93 Harry Wentland 2026-04-24   786  		link->local_sink->edid_caps.panel_patch.vsdb_rcc_wa)
cbb8e2044b9e93 Harry Wentland 2026-04-24   787  			link->frl_flags.apply_vsdb_rcc_wa = true;
cbb8e2044b9e93 Harry Wentland 2026-04-24   788  
cbb8e2044b9e93 Harry Wentland 2026-04-24   789  	frl_phy_clock_source_id = hdmi_frl_find_matching_phypll(link);
cbb8e2044b9e93 Harry Wentland 2026-04-24   790  
cbb8e2044b9e93 Harry Wentland 2026-04-24   791  	cur_link_setting = *known_limit_link_setting;
cbb8e2044b9e93 Harry Wentland 2026-04-24   792  
cbb8e2044b9e93 Harry Wentland 2026-04-24   793  	if (link->frl_flags.force_frl_rate != 0) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   794  		cur->frl_link_rate = (cur_link_setting.frl_link_rate <
cbb8e2044b9e93 Harry Wentland 2026-04-24   795  				link->frl_flags.force_frl_rate) ?
cbb8e2044b9e93 Harry Wentland 2026-04-24   796  						cur_link_setting.frl_link_rate :
cbb8e2044b9e93 Harry Wentland 2026-04-24   797  						link->frl_flags.force_frl_rate;
cbb8e2044b9e93 Harry Wentland 2026-04-24   798  		link->frl_verified_link_cap = *cur;
cbb8e2044b9e93 Harry Wentland 2026-04-24   799  		return;
cbb8e2044b9e93 Harry Wentland 2026-04-24   800  	}
cbb8e2044b9e93 Harry Wentland 2026-04-24   801  
cbb8e2044b9e93 Harry Wentland 2026-04-24   802  	if (link->local_sink) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   803  		if (link->local_sink->edid_caps.panel_patch.hdmi_spe_handling) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   804  			link->dc->hwss.disable_link_output(link, &link_res, link->connector_signal);
cbb8e2044b9e93 Harry Wentland 2026-04-24   805  			link->dc->res_pool->clock_sources[t_id]->funcs->cs_power_down(
cbb8e2044b9e93 Harry Wentland 2026-04-24   806  				link->dc->res_pool->clock_sources[t_id]);
cbb8e2044b9e93 Harry Wentland 2026-04-24   807  			link->frl_verified_link_cap = *cur;
cbb8e2044b9e93 Harry Wentland 2026-04-24   808  			return;
cbb8e2044b9e93 Harry Wentland 2026-04-24   809  		}
cbb8e2044b9e93 Harry Wentland 2026-04-24   810  		/* Monitor patch do decrease 10G to 8G*/
cbb8e2044b9e93 Harry Wentland 2026-04-24   811  		if (link->local_sink->edid_caps.panel_patch.block_10g) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   812  			if (cur->frl_link_rate == HDMI_FRL_LINK_RATE_10GBPS)
cbb8e2044b9e93 Harry Wentland 2026-04-24   813  				cur->frl_link_rate--;
cbb8e2044b9e93 Harry Wentland 2026-04-24   814  		}
cbb8e2044b9e93 Harry Wentland 2026-04-24   815  	}
cbb8e2044b9e93 Harry Wentland 2026-04-24   816  
cbb8e2044b9e93 Harry Wentland 2026-04-24   817  	link->frl_link_settings = cur_link_setting;
cbb8e2044b9e93 Harry Wentland 2026-04-24   818  	/* disable PHY first for PNP */
cbb8e2044b9e93 Harry Wentland 2026-04-24   819  	if (link->dc->ctx->dce_version <= DCN_VERSION_3_0)
cbb8e2044b9e93 Harry Wentland 2026-04-24   820  		link->dc->hwss.disable_link_output(link, &link_res, SIGNAL_TYPE_HDMI_FRL);
cbb8e2044b9e93 Harry Wentland 2026-04-24   821  	else
cbb8e2044b9e93 Harry Wentland 2026-04-24   822  		link->dc->hwss.disable_link_output(link, &link_res, link->connector_signal);
cbb8e2044b9e93 Harry Wentland 2026-04-24   823  
cbb8e2044b9e93 Harry Wentland 2026-04-24   824  	link->dc->res_pool->clock_sources[t_id]->funcs->cs_power_down(
cbb8e2044b9e93 Harry Wentland 2026-04-24   825  			link->dc->res_pool->clock_sources[t_id]);
cbb8e2044b9e93 Harry Wentland 2026-04-24   826  	/*Either enable PHY ourselves or use VBIOS*/
cbb8e2044b9e93 Harry Wentland 2026-04-24   827  
cbb8e2044b9e93 Harry Wentland 2026-04-24   828  	FRL_INFO("FRL LINK TRAINING: Validation\n");
cbb8e2044b9e93 Harry Wentland 2026-04-24   829  
cbb8e2044b9e93 Harry Wentland 2026-04-24   830  	status = hdmi_frl_perform_link_training_with_fallback(link, &link_res, frl_phy_clock_source_id);
cbb8e2044b9e93 Harry Wentland 2026-04-24   831  
cbb8e2044b9e93 Harry Wentland 2026-04-24   832  	if (status == LINK_RESULT_SUCCESS) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   833  		cur->frl_link_rate = link->frl_link_settings.frl_link_rate;
cbb8e2044b9e93 Harry Wentland 2026-04-24   834  		cur->frl_num_lanes = link->frl_link_settings.frl_num_lanes;
cbb8e2044b9e93 Harry Wentland 2026-04-24   835  		success = true;
cbb8e2044b9e93 Harry Wentland 2026-04-24   836  		link->frl_verified_link_cap = *cur;
cbb8e2044b9e93 Harry Wentland 2026-04-24   837  	}
cbb8e2044b9e93 Harry Wentland 2026-04-24   838  	if (!success) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   839  		link->frl_verified_link_cap.frl_link_rate = HDMI_FRL_LINK_RATE_DISABLE;
cbb8e2044b9e93 Harry Wentland 2026-04-24   840  		link->frl_verified_link_cap.frl_num_lanes = 3;
cbb8e2044b9e93 Harry Wentland 2026-04-24   841  	}
cbb8e2044b9e93 Harry Wentland 2026-04-24   842  
cbb8e2044b9e93 Harry Wentland 2026-04-24   843  	for (i = 0; i < MAX_STREAMS; i++) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   844  		stream = link->dc->current_state->streams[i];
cbb8e2044b9e93 Harry Wentland 2026-04-24   845  		if (stream && stream->link == link) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   846  			link_stream = stream;
cbb8e2044b9e93 Harry Wentland 2026-04-24   847  			break;
cbb8e2044b9e93 Harry Wentland 2026-04-24   848  		}
cbb8e2044b9e93 Harry Wentland 2026-04-24   849  	}
cbb8e2044b9e93 Harry Wentland 2026-04-24   850  
cbb8e2044b9e93 Harry Wentland 2026-04-24   851  	if (link_stream) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   852  		link->dc->hwss.disable_link_output(link, &link_res, link_stream->signal);
cbb8e2044b9e93 Harry Wentland 2026-04-24   853  	}
cbb8e2044b9e93 Harry Wentland 2026-04-24   854  }
cbb8e2044b9e93 Harry Wentland 2026-04-24   855  
cbb8e2044b9e93 Harry Wentland 2026-04-24   856  void hdmi_frl_set_preferred_link_settings(struct dc *dc,
cbb8e2044b9e93 Harry Wentland 2026-04-24   857  		struct dc_hdmi_frl_link_settings *link_setting,
cbb8e2044b9e93 Harry Wentland 2026-04-24   858  		struct dc_hdmi_frl_link_training_overrides *lt_overrides,
cbb8e2044b9e93 Harry Wentland 2026-04-24   859  		struct dc_link *link)
cbb8e2044b9e93 Harry Wentland 2026-04-24   860  {
cbb8e2044b9e93 Harry Wentland 2026-04-24   861  	int i;
cbb8e2044b9e93 Harry Wentland 2026-04-24   862  	struct pipe_ctx *pipe;
cbb8e2044b9e93 Harry Wentland 2026-04-24   863  	struct dc_stream_state *link_stream = 0;
cbb8e2044b9e93 Harry Wentland 2026-04-24   864  	struct pipe_ctx *link_pipe = 0;
cbb8e2044b9e93 Harry Wentland 2026-04-24   865  	struct pipe_ctx *odm_pipe;
cbb8e2044b9e93 Harry Wentland 2026-04-24   866  	int opp_cnt = 1;
cbb8e2044b9e93 Harry Wentland 2026-04-24   867  	enum link_result link_stat = LINK_RESULT_UNKNOWN;
cbb8e2044b9e93 Harry Wentland 2026-04-24   868  	enum clock_source_id frl_phy_clock_source_id;
cbb8e2044b9e93 Harry Wentland 2026-04-24   869  	struct dc_stream_state *temp_stream = &dc->scratch.temp_stream;
cbb8e2044b9e93 Harry Wentland 2026-04-24   870  
cbb8e2044b9e93 Harry Wentland 2026-04-24   871  	DC_LOGGER_INIT(link->ctx->logger);
cbb8e2044b9e93 Harry Wentland 2026-04-24   872  
cbb8e2044b9e93 Harry Wentland 2026-04-24   873  	for (i = 0; i < MAX_PIPES; i++) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   874  		pipe = &dc->current_state->res_ctx.pipe_ctx[i];
cbb8e2044b9e93 Harry Wentland 2026-04-24   875  		if (pipe->stream && pipe->stream->link) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   876  			if (pipe->stream->link == link) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   877  				link_stream = pipe->stream;
cbb8e2044b9e93 Harry Wentland 2026-04-24   878  				link_pipe = pipe;
cbb8e2044b9e93 Harry Wentland 2026-04-24   879  				break;
cbb8e2044b9e93 Harry Wentland 2026-04-24   880  			}
cbb8e2044b9e93 Harry Wentland 2026-04-24   881  		}
cbb8e2044b9e93 Harry Wentland 2026-04-24   882  	}
cbb8e2044b9e93 Harry Wentland 2026-04-24   883  
cbb8e2044b9e93 Harry Wentland 2026-04-24   884  	/* Stream not found */
cbb8e2044b9e93 Harry Wentland 2026-04-24   885  	if (i == MAX_PIPES)
cbb8e2044b9e93 Harry Wentland 2026-04-24   886  		return;
cbb8e2044b9e93 Harry Wentland 2026-04-24   887  
cbb8e2044b9e93 Harry Wentland 2026-04-24   888  	FRL_INFO("FRL LINK TRAINING:  Preferred link Update = %d.\n", link_setting->frl_link_rate);
cbb8e2044b9e93 Harry Wentland 2026-04-24   889  
cbb8e2044b9e93 Harry Wentland 2026-04-24   890  	frl_validate_mode_timing(link, &link_stream->timing, link_setting);
cbb8e2044b9e93 Harry Wentland 2026-04-24   891  
cbb8e2044b9e93 Harry Wentland 2026-04-24   892  	if (lt_overrides)
cbb8e2044b9e93 Harry Wentland 2026-04-24   893  		link->preferred_hdmi_frl_settings = *lt_overrides;
cbb8e2044b9e93 Harry Wentland 2026-04-24   894  	else
cbb8e2044b9e93 Harry Wentland 2026-04-24   895  		memset(&link->preferred_hdmi_frl_settings, 0, sizeof(link->preferred_hdmi_frl_settings));
cbb8e2044b9e93 Harry Wentland 2026-04-24   896  
cbb8e2044b9e93 Harry Wentland 2026-04-24   897  	link_stream->link->frl_link_settings = *link_setting;
cbb8e2044b9e93 Harry Wentland 2026-04-24   898  	link_stream->link->frl_verified_link_cap = *link_setting;
cbb8e2044b9e93 Harry Wentland 2026-04-24   899  
cbb8e2044b9e93 Harry Wentland 2026-04-24   900  	while (link_stat != LINK_RESULT_SUCCESS) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   901  		link_set_dpms_off(pipe);
cbb8e2044b9e93 Harry Wentland 2026-04-24   902  		/* For DCN3.0, can also have 4:1 combine mode.
cbb8e2044b9e93 Harry Wentland 2026-04-24   903  		 * TODO: Add function get_odm_combine_mode that has different
cbb8e2044b9e93 Harry Wentland 2026-04-24   904  		 *       implementation for DCN2/DCN3AG and DCN3.0
cbb8e2044b9e93 Harry Wentland 2026-04-24   905  		 */
cbb8e2044b9e93 Harry Wentland 2026-04-24   906  		for (odm_pipe = pipe->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
cbb8e2044b9e93 Harry Wentland 2026-04-24   907  			opp_cnt++;
cbb8e2044b9e93 Harry Wentland 2026-04-24   908  
cbb8e2044b9e93 Harry Wentland 2026-04-24   909  		memcpy(temp_stream, link_stream, sizeof(struct dc_stream_state));
cbb8e2044b9e93 Harry Wentland 2026-04-24   910  		/* Modify patched_crtc_timing as required for padding */
cbb8e2044b9e93 Harry Wentland 2026-04-24   911  		if (link_pipe->dsc_padding_params.dsc_hactive_padding) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   912  			temp_stream->timing.h_addressable = link_stream->timing.h_addressable + link_pipe->dsc_padding_params.dsc_hactive_padding;
cbb8e2044b9e93 Harry Wentland 2026-04-24   913  			temp_stream->timing.h_total = link_stream->timing.h_total + link_pipe->dsc_padding_params.dsc_htotal_padding;
cbb8e2044b9e93 Harry Wentland 2026-04-24   914  		}
cbb8e2044b9e93 Harry Wentland 2026-04-24   915  
cbb8e2044b9e93 Harry Wentland 2026-04-24  @916  		pipe->stream_res.hpo_frl_stream_enc->funcs->hdmi_frl_set_stream_attribute(
cbb8e2044b9e93 Harry Wentland 2026-04-24   917  			pipe->stream_res.hpo_frl_stream_enc,
cbb8e2044b9e93 Harry Wentland 2026-04-24   918  			&temp_stream->timing,
cbb8e2044b9e93 Harry Wentland 2026-04-24   919  			&link_stream->link->frl_link_settings.borrow_params,
cbb8e2044b9e93 Harry Wentland 2026-04-24   920  			opp_cnt);
cbb8e2044b9e93 Harry Wentland 2026-04-24   921  
cbb8e2044b9e93 Harry Wentland 2026-04-24   922  		if (pipe->stream_res.tg->funcs->set_out_mux)
cbb8e2044b9e93 Harry Wentland 2026-04-24   923  			pipe->stream_res.tg->funcs->set_out_mux(pipe->stream_res.tg, OUT_MUX_HPO_FRL);
cbb8e2044b9e93 Harry Wentland 2026-04-24   924  
cbb8e2044b9e93 Harry Wentland 2026-04-24   925  		if ((!link_stream->link->link_enc) ||
cbb8e2044b9e93 Harry Wentland 2026-04-24   926  				(!link_stream->link->hpo_frl_link_enc) ||
cbb8e2044b9e93 Harry Wentland 2026-04-24   927  				(!link_stream->ctx->dc->res_pool->dccg->funcs->enable_hdmicharclk) ||
cbb8e2044b9e93 Harry Wentland 2026-04-24  @928  				(!(pipe->stream_res.hpo_frl_stream_enc)))
cbb8e2044b9e93 Harry Wentland 2026-04-24   929  			return;
cbb8e2044b9e93 Harry Wentland 2026-04-24   930  
cbb8e2044b9e93 Harry Wentland 2026-04-24   931  		switch (link_stream->link->frl_link_settings.frl_link_rate) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   932  		case HDMI_FRL_LINK_RATE_3GBPS:
cbb8e2044b9e93 Harry Wentland 2026-04-24   933  			pipe->stream_res.pix_clk_params.requested_sym_clk = 166667;
cbb8e2044b9e93 Harry Wentland 2026-04-24   934  			break;
cbb8e2044b9e93 Harry Wentland 2026-04-24   935  		case HDMI_FRL_LINK_RATE_6GBPS:
cbb8e2044b9e93 Harry Wentland 2026-04-24   936  		case HDMI_FRL_LINK_RATE_6GBPS_4LANE:
cbb8e2044b9e93 Harry Wentland 2026-04-24   937  			pipe->stream_res.pix_clk_params.requested_sym_clk = 333333;
cbb8e2044b9e93 Harry Wentland 2026-04-24   938  			break;
cbb8e2044b9e93 Harry Wentland 2026-04-24   939  		case HDMI_FRL_LINK_RATE_8GBPS:
cbb8e2044b9e93 Harry Wentland 2026-04-24   940  			pipe->stream_res.pix_clk_params.requested_sym_clk = 444444;
cbb8e2044b9e93 Harry Wentland 2026-04-24   941  			break;
cbb8e2044b9e93 Harry Wentland 2026-04-24   942  		case HDMI_FRL_LINK_RATE_10GBPS:
cbb8e2044b9e93 Harry Wentland 2026-04-24   943  			pipe->stream_res.pix_clk_params.requested_sym_clk = 555555;
cbb8e2044b9e93 Harry Wentland 2026-04-24   944  			break;
cbb8e2044b9e93 Harry Wentland 2026-04-24   945  		case HDMI_FRL_LINK_RATE_12GBPS:
cbb8e2044b9e93 Harry Wentland 2026-04-24   946  			pipe->stream_res.pix_clk_params.requested_sym_clk = 666667;
cbb8e2044b9e93 Harry Wentland 2026-04-24   947  			break;
cbb8e2044b9e93 Harry Wentland 2026-04-24   948  		case HDMI_FRL_LINK_RATE_16GBPS:
cbb8e2044b9e93 Harry Wentland 2026-04-24   949  			pipe->stream_res.pix_clk_params.requested_sym_clk = 888889;
cbb8e2044b9e93 Harry Wentland 2026-04-24   950  			break;
cbb8e2044b9e93 Harry Wentland 2026-04-24   951  		case HDMI_FRL_LINK_RATE_20GBPS:
cbb8e2044b9e93 Harry Wentland 2026-04-24   952  			pipe->stream_res.pix_clk_params.requested_sym_clk = 1111111;
cbb8e2044b9e93 Harry Wentland 2026-04-24   953  			break;
cbb8e2044b9e93 Harry Wentland 2026-04-24   954  		case HDMI_FRL_LINK_RATE_24GBPS:
cbb8e2044b9e93 Harry Wentland 2026-04-24   955  			pipe->stream_res.pix_clk_params.requested_sym_clk = 1333333;
cbb8e2044b9e93 Harry Wentland 2026-04-24   956  			break;
cbb8e2044b9e93 Harry Wentland 2026-04-24   957  		default:
cbb8e2044b9e93 Harry Wentland 2026-04-24   958  			break;
cbb8e2044b9e93 Harry Wentland 2026-04-24   959  		}
cbb8e2044b9e93 Harry Wentland 2026-04-24   960  
cbb8e2044b9e93 Harry Wentland 2026-04-24   961  		link_stream->phy_pix_clk = pipe->stream_res.pix_clk_params.requested_sym_clk;
cbb8e2044b9e93 Harry Wentland 2026-04-24   962  
cbb8e2044b9e93 Harry Wentland 2026-04-24   963  		memset(&link_stream->link->cur_link_settings, 0,
cbb8e2044b9e93 Harry Wentland 2026-04-24   964  				sizeof(struct dc_link_settings));
cbb8e2044b9e93 Harry Wentland 2026-04-24   965  
cbb8e2044b9e93 Harry Wentland 2026-04-24   966  		/* Find proper clock source in HDMI FRL mode for phy used for DCCG */
cbb8e2044b9e93 Harry Wentland 2026-04-24   967  		frl_phy_clock_source_id = hdmi_frl_find_matching_phypll(link);
cbb8e2044b9e93 Harry Wentland 2026-04-24   968  
cbb8e2044b9e93 Harry Wentland 2026-04-24   969  		dc->hwss.setup_hdmi_frl_link(link,
cbb8e2044b9e93 Harry Wentland 2026-04-24   970  				(pipe->stream_res.hpo_frl_stream_enc->id - ENGINE_ID_HPO_0),
cbb8e2044b9e93 Harry Wentland 2026-04-24   971  				frl_phy_clock_source_id);
cbb8e2044b9e93 Harry Wentland 2026-04-24   972  
cbb8e2044b9e93 Harry Wentland 2026-04-24   973  		FRL_INFO("FRL LINK TRAINING:  Start forced link training at %d. \n",
cbb8e2044b9e93 Harry Wentland 2026-04-24   974  				link_stream->link->frl_link_settings.frl_link_rate);
cbb8e2044b9e93 Harry Wentland 2026-04-24   975  		link_stat = hdmi_frl_perform_link_training_with_retries(link_stream->link);
cbb8e2044b9e93 Harry Wentland 2026-04-24   976  
cbb8e2044b9e93 Harry Wentland 2026-04-24   977  		/* Enable FRL packet transmission */
cbb8e2044b9e93 Harry Wentland 2026-04-24   978  		if (link_stat == LINK_RESULT_SUCCESS) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   979  			link_stream->link->hpo_frl_link_enc->funcs->enable_output(
cbb8e2044b9e93 Harry Wentland 2026-04-24   980  					link_stream->link->hpo_frl_link_enc);
cbb8e2044b9e93 Harry Wentland 2026-04-24   981  			if (link_stream->link->frl_flags.apply_vsdb_rcc_wa)
cbb8e2044b9e93 Harry Wentland 2026-04-24   982  				link_stream->link->hpo_frl_link_enc->funcs->apply_vsdb_rcc_wa(link_stream->link->hpo_frl_link_enc);
cbb8e2044b9e93 Harry Wentland 2026-04-24   983  			hdmi_frl_poll_start(link_stream->link->ddc);
cbb8e2044b9e93 Harry Wentland 2026-04-24   984  
cbb8e2044b9e93 Harry Wentland 2026-04-24   985  			/* Set HDMISTREAMCLK source to DTBCLK0 and bypass DTO */
cbb8e2044b9e93 Harry Wentland 2026-04-24   986  			if (dc->res_pool->dccg->funcs->set_hdmistreamclk) {
cbb8e2044b9e93 Harry Wentland 2026-04-24   987  				dc->res_pool->dccg->funcs->set_hdmistreamclk(
cbb8e2044b9e93 Harry Wentland 2026-04-24   988  						dc->res_pool->dccg,
cbb8e2044b9e93 Harry Wentland 2026-04-24   989  						DTBCLK0,
cbb8e2044b9e93 Harry Wentland 2026-04-24   990  						pipe->stream_res.tg->inst);
cbb8e2044b9e93 Harry Wentland 2026-04-24   991  			}
cbb8e2044b9e93 Harry Wentland 2026-04-24   992  
cbb8e2044b9e93 Harry Wentland 2026-04-24   993  			pipe->stream_res.hpo_frl_stream_enc->funcs->hdmi_frl_enable(
cbb8e2044b9e93 Harry Wentland 2026-04-24   994  				pipe->stream_res.hpo_frl_stream_enc,
cbb8e2044b9e93 Harry Wentland 2026-04-24   995  				pipe->stream_res.tg->inst);
cbb8e2044b9e93 Harry Wentland 2026-04-24   996  			resource_build_info_frame(pipe);
cbb8e2044b9e93 Harry Wentland 2026-04-24   997  			link_stream->ctx->dc->hwss.update_info_frame(pipe);
cbb8e2044b9e93 Harry Wentland 2026-04-24   998  
cbb8e2044b9e93 Harry Wentland 2026-04-24   999  			link_stream->ctx->dc->hwss.enable_audio_stream(pipe);
cbb8e2044b9e93 Harry Wentland 2026-04-24  1000  			link_stream->ctx->dc->hwss.enable_stream(pipe);
cbb8e2044b9e93 Harry Wentland 2026-04-24  1001  			link_stream->ctx->dc->hwss.unblank_stream(pipe,
cbb8e2044b9e93 Harry Wentland 2026-04-24  1002  				&pipe->stream->link->cur_link_settings);
cbb8e2044b9e93 Harry Wentland 2026-04-24  1003  			FRL_INFO("FRL LINK TRAINING:  Forced link training successful. \n");
cbb8e2044b9e93 Harry Wentland 2026-04-24  1004  		}
cbb8e2044b9e93 Harry Wentland 2026-04-24  1005  		if (link_stat == LINK_RESULT_LOWER_LINKRATE) {
cbb8e2044b9e93 Harry Wentland 2026-04-24  1006  			link_stream->link->frl_link_settings.frl_link_rate--;
cbb8e2044b9e93 Harry Wentland 2026-04-24  1007  			if (link_stream->link->frl_link_settings.frl_link_rate >
cbb8e2044b9e93 Harry Wentland 2026-04-24  1008  				 HDMI_FRL_LINK_RATE_6GBPS)
cbb8e2044b9e93 Harry Wentland 2026-04-24  1009  				link_stream->link->frl_link_settings.frl_num_lanes = 4;
cbb8e2044b9e93 Harry Wentland 2026-04-24  1010  			else
cbb8e2044b9e93 Harry Wentland 2026-04-24  1011  				link_stream->link->frl_link_settings.frl_num_lanes = 3;
cbb8e2044b9e93 Harry Wentland 2026-04-24  1012  			FRL_INFO("FRL LINK TRAINING:  Lower link rate = %d.\n",
cbb8e2044b9e93 Harry Wentland 2026-04-24  1013  				link_stream->link->frl_link_settings.frl_link_rate);
cbb8e2044b9e93 Harry Wentland 2026-04-24  1014  		}
cbb8e2044b9e93 Harry Wentland 2026-04-24  1015  		if (link_stat == LINK_RESULT_FALLBACK) {
cbb8e2044b9e93 Harry Wentland 2026-04-24  1016  			FRL_INFO("FRL LINK TRAINING: Forced Link Training failed.  Fallback to TMDS. \n");
cbb8e2044b9e93 Harry Wentland 2026-04-24  1017  			break;
cbb8e2044b9e93 Harry Wentland 2026-04-24  1018  		}
cbb8e2044b9e93 Harry Wentland 2026-04-24  1019  	}
cbb8e2044b9e93 Harry Wentland 2026-04-24  1020  }
cbb8e2044b9e93 Harry Wentland 2026-04-24  1021  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
