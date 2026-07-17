Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE27D394461
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jul 2026 23:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784331871; cv=none; b=CDMMcE9CRUOsxOsVAGLTEMWXjoKnWa/vqk/rgCRCSBsKIv/SfY3P3HIaPZlN5OX6xQnpAOxi0khDQ02my06KwYr5Lh4zFbW5jHZZeweyRHEF67xLhGDtwUmezqA7sS5rztsPOfjjZCHb11W4P5FZDIl/SzPHxTuhoidvaaXkDKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784331871; c=relaxed/simple;
	bh=aOqG5tXEPLB5UuIOiUq0ni2Q9KEw2B/lRQVtkq3dkWw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tgl86yKuBu+fCpgzEmS/dDU1fx9gn6pDFOnlRE6U5rBNhizwJwXv+4HhWYH7Skn9hmtBZZl4f8XBR9OB/r2oYau6S2UfUeBf7tGM/n/fv7VQcuFlGJ6XElpiVznAp9c52J5g5zW0PyxVUkzaeXiBYJYnPzyqGLCbv54ad7vB18g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPu5tm47; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPu5tm47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784331867; x=1815867867;
  h=date:from:to:cc:subject:message-id;
  bh=aOqG5tXEPLB5UuIOiUq0ni2Q9KEw2B/lRQVtkq3dkWw=;
  b=WPu5tm47QKKVnz6IFXxIiAztG7vKrtV6jZGYx0FuLiSOm81nSY/qapj6
   afUqh0b6r1Zewhl+Vi8tvP1M50blK2Gz/tkNCNh2pIP6cWbV0Pret/S2D
   yXTR0s4xnQMHQ85As7t4cWRzI/v9kxabsNGpEM5zInnGs13FLgorg0Qmp
   ya6skck1OcWEJDgX2oGsU2SS4HQLRsjQTKFHnfDj+GL4U/AVqo0WSultv
   XPcRWBry/3mHcP3tcYI5ICzo6SX/Ee0NjgpLlf/NmxS64LPSbIkNmny8S
   Zf2EPNbCGz9sR59FUTWkhvpFh4AkU7nBtJsnCA0Xon1Ia7RlAxIlKkyFu
   Q==;
X-CSE-ConnectionGUID: vez5+XhURsqxh6cq6Lo/cg==
X-CSE-MsgGUID: DXx0eLZfS6OMgbWK+t2o8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="96141559"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="96141559"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 16:44:27 -0700
X-CSE-ConnectionGUID: UexHglMrR/Wk4z4MbnWcsw==
X-CSE-MsgGUID: Ucp8spUJRNCNpYUxjtLMdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="254281611"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jul 2026 16:44:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wksE0-00000000TFg-2VTI;
	Fri, 17 Jul 2026 23:44:16 +0000
Date: Sat, 18 Jul 2026 07:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5630/7063]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dpms.c:2683
 link_set_dpms_on() error: we previously assumed 'stream->sink' could be null
 (see line 2507)
Message-ID: <202607180711.3QLyVbER-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dominik Kaszewski <dominik.kaszewski@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
CC: George Zhang <george.zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
commit: 8fa813b7fd1eccbed13e126166cf764f1f11a7d3 [5630/7063] drm/amd/display: Remove sink usage from DPMS
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-r073-20260717 (https://download.01.org/0day-ci/archive/20260718/202607180711.3QLyVbER-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607180711.3QLyVbER-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dpms.c:2683 link_set_dpms_on() error: we previously assumed 'stream->sink' could be null (see line 2507)

vim +2683 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dpms.c

54618888d1ea7a Wenjing Liu       2023-01-18  2485  
54618888d1ea7a Wenjing Liu       2023-01-18  2486  void link_set_dpms_on(
54618888d1ea7a Wenjing Liu       2023-01-18  2487  		struct dc_state *state,
54618888d1ea7a Wenjing Liu       2023-01-18  2488  		struct pipe_ctx *pipe_ctx)
54618888d1ea7a Wenjing Liu       2023-01-18  2489  {
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2490  	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
54618888d1ea7a Wenjing Liu       2023-01-18  2491  	struct dc_stream_state *stream = pipe_ctx->stream;
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2492  	struct dc *dc = stream->ctx->dc;
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2493  	struct dc_link *link = stream->link;
54618888d1ea7a Wenjing Liu       2023-01-18  2494  	enum dc_status status;
d2957868401660 Peichen Huang     2025-01-17  2495  	struct link_encoder *link_enc = pipe_ctx->link_res.dio_link_enc;
54618888d1ea7a Wenjing Liu       2023-01-18  2496  	enum otg_out_mux_dest otg_out_dest = OUT_MUX_DIO;
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2497  	struct vpg *vpg = get_vpg(pipe_ctx);
d0e9de7a81503c Alex Deucher      2025-11-25  2498  	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
25879d7b4986be Qingqing Zhuo     2023-03-16  2499  	bool apply_edp_fast_boot_optimization =
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2500  		stream->apply_edp_fast_boot_optimization;
5d72e247e58c96 Hamza Mahfooz     2023-09-20  2501  
ed6941b6321001 Wenjing Liu       2023-01-27  2502  	ASSERT(is_master_pipe_for_link(link, pipe_ctx));
ed6941b6321001 Wenjing Liu       2023-01-27  2503  
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2504  	if (dc_is_virtual_signal(stream->signal))
83b5b7bb867318 Wenjing Liu       2023-08-24  2505  		return;
54618888d1ea7a Wenjing Liu       2023-01-18  2506  
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19 @2507  	if (stream->sink) {
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2508  		if (stream->sink->sink_signal != SIGNAL_TYPE_VIRTUAL &&
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2509  			stream->sink->sink_signal != SIGNAL_TYPE_NONE) {
9aeb31b2456452 Peichen Huang     2025-11-18  2510  			DC_LOG_DC("%s pipe_ctx dispname=%s signal=%x link=%d sink_count=%d\n", __func__,
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2511  			stream->sink->edid_caps.display_name,
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2512  			stream->signal,
9aeb31b2456452 Peichen Huang     2025-11-18  2513  			link->link_index,
9aeb31b2456452 Peichen Huang     2025-11-18  2514  			link->sink_count);
54618888d1ea7a Wenjing Liu       2023-01-18  2515  		}
54618888d1ea7a Wenjing Liu       2023-01-18  2516  	}
54618888d1ea7a Wenjing Liu       2023-01-18  2517  
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2518  	link_wait_for_unlocked(link);
d2957868401660 Peichen Huang     2025-01-17  2519  	if (!dc->config.unify_link_enc_assignment)
54618888d1ea7a Wenjing Liu       2023-01-18  2520  		link_enc = link_enc_cfg_get_link_enc(link);
54618888d1ea7a Wenjing Liu       2023-01-18  2521  	ASSERT(link_enc);
54618888d1ea7a Wenjing Liu       2023-01-18  2522  
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2523  	if (!dc_is_virtual_signal(stream->signal)
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2524  			&& !dc_is_hdmi_frl_signal(stream->signal)
98ce7d32e2154a Wenjing Liu       2023-02-23  2525  			&& !dp_is_128b_132b_signal(pipe_ctx)) {
54618888d1ea7a Wenjing Liu       2023-01-18  2526  		if (link_enc)
54618888d1ea7a Wenjing Liu       2023-01-18  2527  			link_enc->funcs->setup(
54618888d1ea7a Wenjing Liu       2023-01-18  2528  				link_enc,
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2529  				stream->signal);
54618888d1ea7a Wenjing Liu       2023-01-18  2530  	}
54618888d1ea7a Wenjing Liu       2023-01-18  2531  
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2532  	link->link_state_valid = true;
54618888d1ea7a Wenjing Liu       2023-01-18  2533  
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2534  	if (dc_is_hdmi_frl_signal(stream->signal))
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2535  		hdmi_frl_decide_link_settings(stream, &link->frl_link_settings, &pipe_ctx->dsc_padding_params);
cbb8e2044b9e93 Harry Wentland    2026-04-24  2536  
54618888d1ea7a Wenjing Liu       2023-01-18  2537  	if (pipe_ctx->stream_res.tg->funcs->set_out_mux) {
98ce7d32e2154a Wenjing Liu       2023-02-23  2538  		if (dp_is_128b_132b_signal(pipe_ctx))
54618888d1ea7a Wenjing Liu       2023-01-18  2539  			otg_out_dest = OUT_MUX_HPO_DP;
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2540  		else if (dc_is_hdmi_frl_signal(stream->signal))
cbb8e2044b9e93 Harry Wentland    2026-04-24  2541  			otg_out_dest = OUT_MUX_HPO_FRL;
54618888d1ea7a Wenjing Liu       2023-01-18  2542  		else
54618888d1ea7a Wenjing Liu       2023-01-18  2543  			otg_out_dest = OUT_MUX_DIO;
54618888d1ea7a Wenjing Liu       2023-01-18  2544  		pipe_ctx->stream_res.tg->funcs->set_out_mux(pipe_ctx->stream_res.tg, otg_out_dest);
54618888d1ea7a Wenjing Liu       2023-01-18  2545  	}
54618888d1ea7a Wenjing Liu       2023-01-18  2546  
d0e9de7a81503c Alex Deucher      2025-11-25  2547  	link_hwss->setup_stream_attribute(pipe_ctx);
d0e9de7a81503c Alex Deucher      2025-11-25  2548  
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2549  	stream->apply_edp_fast_boot_optimization = false;
54618888d1ea7a Wenjing Liu       2023-01-18  2550  
54618888d1ea7a Wenjing Liu       2023-01-18  2551  	// Enable VPG before building infoframe
54618888d1ea7a Wenjing Liu       2023-01-18  2552  	if (vpg && vpg->funcs->vpg_poweron)
54618888d1ea7a Wenjing Liu       2023-01-18  2553  		vpg->funcs->vpg_poweron(vpg);
54618888d1ea7a Wenjing Liu       2023-01-18  2554  
54618888d1ea7a Wenjing Liu       2023-01-18  2555  	resource_build_info_frame(pipe_ctx);
54618888d1ea7a Wenjing Liu       2023-01-18  2556  	dc->hwss.update_info_frame(pipe_ctx);
54618888d1ea7a Wenjing Liu       2023-01-18  2557  
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2558  	if (dc_is_dp_signal(stream->signal))
98ce7d32e2154a Wenjing Liu       2023-02-23  2559  		dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME);
54618888d1ea7a Wenjing Liu       2023-01-18  2560  
54618888d1ea7a Wenjing Liu       2023-01-18  2561  	/* Do not touch link on seamless boot optimization. */
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2562  	if (stream->apply_seamless_boot_optimization) {
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2563  		stream->dpms_off = false;
54618888d1ea7a Wenjing Liu       2023-01-18  2564  
54618888d1ea7a Wenjing Liu       2023-01-18  2565  		/* Still enable stream features & audio on seamless boot for DP external displays */
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2566  		if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT) {
54618888d1ea7a Wenjing Liu       2023-01-18  2567  			enable_stream_features(pipe_ctx);
54618888d1ea7a Wenjing Liu       2023-01-18  2568  			dc->hwss.enable_audio_stream(pipe_ctx);
54618888d1ea7a Wenjing Liu       2023-01-18  2569  		}
54618888d1ea7a Wenjing Liu       2023-01-18  2570  
54618888d1ea7a Wenjing Liu       2023-01-18  2571  		update_psp_stream_config(pipe_ctx, false);
54618888d1ea7a Wenjing Liu       2023-01-18  2572  		return;
54618888d1ea7a Wenjing Liu       2023-01-18  2573  	}
54618888d1ea7a Wenjing Liu       2023-01-18  2574  
54618888d1ea7a Wenjing Liu       2023-01-18  2575  	/* eDP lit up by bios already, no need to enable again. */
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2576  	if (stream->signal == SIGNAL_TYPE_EDP &&
54618888d1ea7a Wenjing Liu       2023-01-18  2577  				apply_edp_fast_boot_optimization &&
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2578  				!stream->timing.flags.DSC &&
54618888d1ea7a Wenjing Liu       2023-01-18  2579  				!pipe_ctx->next_odm_pipe) {
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2580  		stream->dpms_off = false;
54618888d1ea7a Wenjing Liu       2023-01-18  2581  		update_psp_stream_config(pipe_ctx, false);
18f0817d2e9af4 Aurabindo Pillai  2025-05-02  2582  
18f0817d2e9af4 Aurabindo Pillai  2025-05-02  2583  		if (link->is_dds) {
18f0817d2e9af4 Aurabindo Pillai  2025-05-02  2584  			uint32_t post_oui_delay = 30; // 30ms
18f0817d2e9af4 Aurabindo Pillai  2025-05-02  2585  
18f0817d2e9af4 Aurabindo Pillai  2025-05-02  2586  			dpcd_set_source_specific_data(link);
18f0817d2e9af4 Aurabindo Pillai  2025-05-02  2587  			msleep(post_oui_delay);
18f0817d2e9af4 Aurabindo Pillai  2025-05-02  2588  		}
18f0817d2e9af4 Aurabindo Pillai  2025-05-02  2589  
54618888d1ea7a Wenjing Liu       2023-01-18  2590  		return;
54618888d1ea7a Wenjing Liu       2023-01-18  2591  	}
54618888d1ea7a Wenjing Liu       2023-01-18  2592  
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2593  	if (stream->dpms_off)
54618888d1ea7a Wenjing Liu       2023-01-18  2594  		return;
54618888d1ea7a Wenjing Liu       2023-01-18  2595  
230dced3e2b712 Peichen Huang     2024-12-25  2596  	/* For Dp tunneling link, a pending HPD means that we have a race condition between processing
230dced3e2b712 Peichen Huang     2024-12-25  2597  	 * current link and processing the pending HPD. If we enable the link now, we may end up with a
230dced3e2b712 Peichen Huang     2024-12-25  2598  	 * link that is not actually connected to a sink. So we skip enabling the link in this case.
230dced3e2b712 Peichen Huang     2024-12-25  2599  	 */
230dced3e2b712 Peichen Huang     2024-12-25  2600  	if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA && link->is_hpd_pending) {
230dced3e2b712 Peichen Huang     2024-12-25  2601  		DC_LOG_DEBUG("%s, Link%d HPD is pending, not enable it.\n", __func__, link->link_index);
230dced3e2b712 Peichen Huang     2024-12-25  2602  		return;
230dced3e2b712 Peichen Huang     2024-12-25  2603  	}
230dced3e2b712 Peichen Huang     2024-12-25  2604  
54618888d1ea7a Wenjing Liu       2023-01-18  2605  	/* Have to setup DSC before DIG FE and BE are connected (which happens before the
54618888d1ea7a Wenjing Liu       2023-01-18  2606  	 * link training). This is to make sure the bandwidth sent to DIG BE won't be
54618888d1ea7a Wenjing Liu       2023-01-18  2607  	 * bigger than what the link and/or DIG BE can handle. VBID[6]/CompressedStream_flag
54618888d1ea7a Wenjing Liu       2023-01-18  2608  	 * will be automatically set at a later time when the video is enabled
54618888d1ea7a Wenjing Liu       2023-01-18  2609  	 * (DP_VID_STREAM_EN = 1).
54618888d1ea7a Wenjing Liu       2023-01-18  2610  	 */
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2611  	if (stream->timing.flags.DSC) {
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2612  		if (dc_is_dp_signal(stream->signal) ||
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2613  		    dc_is_virtual_signal(stream->signal))
54618888d1ea7a Wenjing Liu       2023-01-18  2614  			link_set_dsc_enable(pipe_ctx, true);
54618888d1ea7a Wenjing Liu       2023-01-18  2615  	}
54618888d1ea7a Wenjing Liu       2023-01-18  2616  
5a113e15d15605 Peichen Huang     2025-12-15  2617  	if (link->replay_settings.config.replay_supported && !dc_is_embedded_signal(link->connector_signal))
5a113e15d15605 Peichen Huang     2025-12-15  2618  		dp_setup_replay(link, stream);
5a113e15d15605 Peichen Huang     2025-12-15  2619  
54618888d1ea7a Wenjing Liu       2023-01-18  2620  	status = enable_link(state, pipe_ctx);
54618888d1ea7a Wenjing Liu       2023-01-18  2621  
54618888d1ea7a Wenjing Liu       2023-01-18  2622  	if (status != DC_OK) {
54618888d1ea7a Wenjing Liu       2023-01-18  2623  		DC_LOG_WARNING("enabling link %u failed: %d\n",
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2624  		link->link_index,
54618888d1ea7a Wenjing Liu       2023-01-18  2625  		status);
54618888d1ea7a Wenjing Liu       2023-01-18  2626  
54618888d1ea7a Wenjing Liu       2023-01-18  2627  		/* Abort stream enable *unless* the failure was due to
54618888d1ea7a Wenjing Liu       2023-01-18  2628  		 * DP link training - some DP monitors will recover and
54618888d1ea7a Wenjing Liu       2023-01-18  2629  		 * show the stream anyway. But MST displays can't proceed
54618888d1ea7a Wenjing Liu       2023-01-18  2630  		 * without link training.
54618888d1ea7a Wenjing Liu       2023-01-18  2631  		 */
cbb8e2044b9e93 Harry Wentland    2026-04-24  2632  			if ((status != DC_FAIL_DP_LINK_TRAINING &&
cbb8e2044b9e93 Harry Wentland    2026-04-24  2633  					status != DC_FAIL_HDMI_FRL_LINK_TRAINING) ||
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2634  					stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2635  			if (false == link->link_status.link_active)
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2636  				disable_link(link, &pipe_ctx->link_res,
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2637  						stream->signal);
54618888d1ea7a Wenjing Liu       2023-01-18  2638  			BREAK_TO_DEBUGGER();
54618888d1ea7a Wenjing Liu       2023-01-18  2639  			return;
54618888d1ea7a Wenjing Liu       2023-01-18  2640  		}
54618888d1ea7a Wenjing Liu       2023-01-18  2641  	}
54618888d1ea7a Wenjing Liu       2023-01-18  2642  
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2643  	if (stream->timing.flags.DSC && dc_is_hdmi_frl_signal(stream->signal))
547cc004c3c180 Harry Wentland    2026-04-23  2644  		//TODO: bring HDMI FRL in line with DP
547cc004c3c180 Harry Wentland    2026-04-23  2645  		link_set_dsc_on_stream(pipe_ctx, true);
547cc004c3c180 Harry Wentland    2026-04-23  2646  
54618888d1ea7a Wenjing Liu       2023-01-18  2647  	/* turn off otg test pattern if enable */
54618888d1ea7a Wenjing Liu       2023-01-18  2648  	if (pipe_ctx->stream_res.tg->funcs->set_test_pattern)
54618888d1ea7a Wenjing Liu       2023-01-18  2649  		pipe_ctx->stream_res.tg->funcs->set_test_pattern(pipe_ctx->stream_res.tg,
54618888d1ea7a Wenjing Liu       2023-01-18  2650  				CONTROLLER_DP_TEST_PATTERN_VIDEOMODE,
54618888d1ea7a Wenjing Liu       2023-01-18  2651  				COLOR_DEPTH_UNDEFINED);
54618888d1ea7a Wenjing Liu       2023-01-18  2652  
54618888d1ea7a Wenjing Liu       2023-01-18  2653  	/* This second call is needed to reconfigure the DIG
54618888d1ea7a Wenjing Liu       2023-01-18  2654  	 * as a workaround for the incorrect value being applied
54618888d1ea7a Wenjing Liu       2023-01-18  2655  	 * from transmitter control.
54618888d1ea7a Wenjing Liu       2023-01-18  2656  	 */
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2657  	if (!(dc_is_virtual_signal(stream->signal) ||
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2658  			dc_is_hdmi_frl_signal(stream->signal) ||
7b1b3f5818c33d Charlene Liu      2023-03-10  2659  			dp_is_128b_132b_signal(pipe_ctx))) {
e0b394a87a1116 Qingqing Zhuo     2023-08-03  2660  
54618888d1ea7a Wenjing Liu       2023-01-18  2661  			if (link_enc)
54618888d1ea7a Wenjing Liu       2023-01-18  2662  				link_enc->funcs->setup(
54618888d1ea7a Wenjing Liu       2023-01-18  2663  					link_enc,
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2664  					stream->signal);
e0b394a87a1116 Qingqing Zhuo     2023-08-03  2665  
7b1b3f5818c33d Charlene Liu      2023-03-10  2666  		}
54618888d1ea7a Wenjing Liu       2023-01-18  2667  
54618888d1ea7a Wenjing Liu       2023-01-18  2668  	dc->hwss.enable_stream(pipe_ctx);
54618888d1ea7a Wenjing Liu       2023-01-18  2669  
54618888d1ea7a Wenjing Liu       2023-01-18  2670  	/* Set DPS PPS SDP (AKA "info frames") */
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2671  	if (stream->timing.flags.DSC) {
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2672  		if (dc_is_dp_signal(stream->signal) ||
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2673  				dc_is_virtual_signal(stream->signal)) {
54618888d1ea7a Wenjing Liu       2023-01-18  2674  			dp_set_dsc_on_rx(pipe_ctx, true);
54618888d1ea7a Wenjing Liu       2023-01-18  2675  			link_set_dsc_pps_packet(pipe_ctx, true, true);
54618888d1ea7a Wenjing Liu       2023-01-18  2676  		}
54618888d1ea7a Wenjing Liu       2023-01-18  2677  	}
54618888d1ea7a Wenjing Liu       2023-01-18  2678  
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19  2679  	if (dc_is_dp_signal(stream->signal))
1619d4168b9797 George Shen       2024-12-09  2680  		dp_set_hblank_reduction_on_rx(pipe_ctx);
1619d4168b9797 George Shen       2024-12-09  2681  
17accf4f228c68 Cruise Hung       2025-04-25  2682  	if (pipe_ctx->link_config.dp_tunnel_settings.should_use_dp_bw_allocation)
8fa813b7fd1ecc Dominik Kaszewski 2026-06-19 @2683  		allocate_usb4_bandwidth(stream);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
