Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D3E425CEE
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jun 2026 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605757; cv=none; b=dpdWCa5k0untHCgHyH9JD+9GVE2oRLELgp09fdkZ8ZofWGlWTGCsXXKPkXlG9JRtzIE1lxvW+PglAgP1lqWMTqMEHSsRpFeKloI6JFSwnEA/dziccWKrWjNLae7kUzLhX+w0ohVyJ1yALaIyIF1/FsMubjQkeBxolZRbDhWSDeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605757; c=relaxed/simple;
	bh=zXD5LLB1gwYZhoCR/V8iJ/aQeEc2XCk1EUtet0W/5js=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A1qb0SvU/PjzhBBklUxzNqVvGSHjhs+eJDvWeuKIeSj5zvHjtpYASkSjwxWeHwK7UkxExNU6LiDRTJlPkVHKecCzFbLNCWVEvaseQcQ5NZ4rR0oKBlrmqbZ8duIVb0tdF2t54CNa6v797Y6t+w0FikOxmZ6Ad78jMT0mZ5TOySs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNv2s8EP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNv2s8EP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781605756; x=1813141756;
  h=date:from:to:cc:subject:message-id;
  bh=zXD5LLB1gwYZhoCR/V8iJ/aQeEc2XCk1EUtet0W/5js=;
  b=RNv2s8EPwrkYlrw+dwp27ofwjfxC/vKAJfq+b208bpfd5FpfDPfjOuM7
   3fJSiSecfFEyM/fdZlzrxIwi/8TdgDn0OyH9DeILyOuRWajzBzRCvAcWp
   0wuVTUzNokNBDsiNfys9gq4DyqdDFokciYtFWL6coC1pbbELgU7pWR0IS
   BuZn4cMpR4VDMGkz2YdxEuZzrZj3TWNhgCK/9Ygurf3hnUHm6WEs+AqzR
   OmFgDEG3Q2Er4EEkhVlx4TL82UmSA6ATeY1V2MacO2t7ujHLda25j+JbV
   YY/2kxhV4XVN+uT32bJv4KUuAV5sj/RjMXz83gKIaOnjVDP4DxH3qUGee
   w==;
X-CSE-ConnectionGUID: wD8ac9bkQs6CuAVPIgIpNg==
X-CSE-MsgGUID: NX/rVWggTFmbAeJxAkggIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93038699"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="93038699"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 03:29:12 -0700
X-CSE-ConnectionGUID: iWapVs5zQhio8cfZkqg8uA==
X-CSE-MsgGUID: QZaemGArTceYlaniu6ekLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="252038091"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Jun 2026 03:29:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZR2a-00000000T2c-2A4o;
	Tue, 16 Jun 2026 10:29:08 +0000
Date: Tue, 16 Jun 2026 18:28:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9794/14023]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_hdcp.c:584
 update_config() error: we previously assumed 'aconnector->dc_sink' could be
 null (see line 559)
Message-ID: <202606161822.yCBePSkO-lkp@intel.com>
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
commit: 5c9b8b27a883822fe5812bed23bca7ffeb4301f7 [9794/14023] drm/amd/display: Tie FRL support into amdgpu_dm
:::::: branch date: 18 hours ago
:::::: commit date: 13 days ago
config: i386-randconfig-141-20260611 (https://download.01.org/0day-ci/archive/20260616/202606161822.yCBePSkO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606161822.yCBePSkO-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_hdcp.c:584 update_config() error: we previously assumed 'aconnector->dc_sink' could be null (see line 559)

vim +584 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_hdcp.c

ef9de1876aa7743 Bhawanpreet Lakha      2020-06-01  534  
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  535  static void update_config(void *handle, struct cp_psp_stream_config *config)
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  536  {
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  537  	struct hdcp_workqueue *hdcp_work = handle;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  538  	struct amdgpu_dm_connector *aconnector = config->dm_stream_ctx;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  539  	int link_index = aconnector->dc_link->link_index;
be593d9d91c5a3a Chris Bainbridge       2025-04-17  540  	unsigned int conn_index = aconnector->base.index;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  541  	struct mod_hdcp_display *display = &hdcp_work[link_index].display;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  542  	struct mod_hdcp_link *link = &hdcp_work[link_index].link;
393e83484839970 Bhawanpreet Lakha      2023-07-24  543  	struct hdcp_workqueue *hdcp_w = &hdcp_work[link_index];
4d31819a3746b1f Wayne Lin              2022-05-31  544  	struct dc_sink *sink = NULL;
035f54969bb2c1a Aurabindo Pillai       2021-08-13  545  	bool link_is_hdcp14 = false;
face6a3615a6494 Wenjing Liu            2025-10-03  546  	const struct dc *dc = aconnector->dc_link->dc;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  547  
a30a8c2f884c283 Bhawanpreet Lakha      2019-12-06  548  	if (config->dpms_off) {
a30a8c2f884c283 Bhawanpreet Lakha      2019-12-06  549  		hdcp_remove_display(hdcp_work, link_index, aconnector);
a30a8c2f884c283 Bhawanpreet Lakha      2019-12-06  550  		return;
a30a8c2f884c283 Bhawanpreet Lakha      2019-12-06  551  	}
3528cae940d75f3 Leo (Hanghong  Ma      2020-05-08  552) 
3528cae940d75f3 Leo (Hanghong  Ma      2020-05-08  553) 	memset(display, 0, sizeof(*display));
3528cae940d75f3 Leo (Hanghong  Ma      2020-05-08  554) 	memset(link, 0, sizeof(*link));
3528cae940d75f3 Leo (Hanghong  Ma      2020-05-08  555) 
3528cae940d75f3 Leo (Hanghong  Ma      2020-05-08  556) 	display->index = aconnector->base.index;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  557  	display->state = MOD_HDCP_DISPLAY_ACTIVE;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  558  
4d31819a3746b1f Wayne Lin              2022-05-31 @559  	if (aconnector->dc_sink)
4d31819a3746b1f Wayne Lin              2022-05-31  560  		sink = aconnector->dc_sink;
4d31819a3746b1f Wayne Lin              2022-05-31  561  	else if (aconnector->dc_em_sink)
4d31819a3746b1f Wayne Lin              2022-05-31  562  		sink = aconnector->dc_em_sink;
4d31819a3746b1f Wayne Lin              2022-05-31  563  
a19de9dbb4d293c Srinivasan Shanmugam   2023-07-13  564  	if (sink)
4d31819a3746b1f Wayne Lin              2022-05-31  565  		link->mode = mod_hdcp_signal_type_to_operation_mode(sink->sink_signal);
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  566  
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  567  	display->controller = CONTROLLER_ID_D0 + config->otg_inst;
aac6d4391a0a354 Wenjing Liu            2020-12-10  568  	display->dig_fe = config->dig_fe;
aac6d4391a0a354 Wenjing Liu            2020-12-10  569  	link->dig_be = config->dig_be;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  570  	link->ddc_line = aconnector->dc_link->ddc_hw_inst + 1;
bf62221e9d0e1e4 Nicholas Kazlauskas    2021-05-19  571  	display->stream_enc_idx = config->stream_enc_idx;
bf62221e9d0e1e4 Nicholas Kazlauskas    2021-05-19  572  	link->link_enc_idx = config->link_enc_idx;
f51d22b0d04aa33 Qingqing Zhuo          2022-06-03  573  	link->dio_output_id = config->dio_output_idx;
bf62221e9d0e1e4 Nicholas Kazlauskas    2021-05-19  574  	link->phy_idx = config->phy_idx;
10a36226157035e Wayne Lin              2022-04-13  575  
4d31819a3746b1f Wayne Lin              2022-05-31  576  	if (sink)
4d31819a3746b1f Wayne Lin              2022-05-31  577  		link_is_hdcp14 = dc_link_is_hdcp14(aconnector->dc_link, sink->sink_signal);
035f54969bb2c1a Aurabindo Pillai       2021-08-13  578  	link->hdcp_supported_informational = link_is_hdcp14;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  579  	link->dp.rev = aconnector->dc_link->dpcd_caps.dpcd_rev.raw;
aac6d4391a0a354 Wenjing Liu            2020-12-10  580  	link->dp.assr_enabled = config->assr_enabled;
aac6d4391a0a354 Wenjing Liu            2020-12-10  581  	link->dp.mst_enabled = config->mst_enabled;
c32699caeca802c Jasdeep Dhillon        2023-01-25  582  	link->dp.dp2_enabled = config->dp2_enabled;
f51d22b0d04aa33 Qingqing Zhuo          2022-06-03  583  	link->dp.usb4_enabled = config->usb4_enabled;
5c9b8b27a883822 Harry Wentland         2026-04-24 @584  	if (aconnector->dc_sink->sink_signal == SIGNAL_TYPE_HDMI_FRL)
5c9b8b27a883822 Harry Wentland         2026-04-24  585  		link->hdmi.frl_enabled = config->frl_enabled;
4fe1fdcc230189b Wenjing Liu            2021-03-10  586  	display->adjust.disable = MOD_HDCP_DISPLAY_DISABLE_AUTHENTICATION;
28f7e8971846519 Bhawanpreet Lakha      2023-02-17  587  	link->adjust.auth_delay = 2;
9fd2da71c301184 Oleh Kuzhylnyi         2025-08-18  588  	link->adjust.retry_limit = MAX_NUM_OF_ATTEMPTS;
c2850c125d919ef Bhawanpreet Lakha      2020-03-30  589  	link->adjust.hdcp1.disable = 0;
face6a3615a6494 Wenjing Liu            2025-10-03  590  	link->adjust.hdcp2.use_fw_locality_check = (dc->caps.fused_io_supported || dc->debug.hdcp_lc_force_fw_enable);
face6a3615a6494 Wenjing Liu            2025-10-03  591  	link->adjust.hdcp2.use_sw_locality_fallback = dc->debug.hdcp_lc_enable_sw_fallback;
393e83484839970 Bhawanpreet Lakha      2023-07-24  592  	hdcp_w->encryption_status[display->index] = MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  593  
caa18dd6dd9305d Dingchen (David  Zhang 2021-05-31  594) 	DRM_DEBUG_DRIVER("[HDCP_DM] display %d, CP %d, type %d\n", aconnector->base.index,
a19de9dbb4d293c Srinivasan Shanmugam   2023-07-13  595  			 (!!aconnector->base.state) ?
a19de9dbb4d293c Srinivasan Shanmugam   2023-07-13  596  			 aconnector->base.state->content_protection : -1,
a19de9dbb4d293c Srinivasan Shanmugam   2023-07-13  597  			 (!!aconnector->base.state) ?
a19de9dbb4d293c Srinivasan Shanmugam   2023-07-13  598  			 aconnector->base.state->hdcp_content_type : -1);
26739690354b699 Dingchen (David  Zhang 2021-01-08  599) 
6b675ab8efbf2bc Mario Limonciello      2025-02-28  600  	guard(mutex)(&hdcp_w->mutex);
393e83484839970 Bhawanpreet Lakha      2023-07-24  601  
393e83484839970 Bhawanpreet Lakha      2023-07-24  602  	mod_hdcp_add_display(&hdcp_w->hdcp, link, display, &hdcp_w->output);
be593d9d91c5a3a Chris Bainbridge       2025-04-17  603  	drm_connector_get(&aconnector->base);
be593d9d91c5a3a Chris Bainbridge       2025-04-17  604  	if (hdcp_w->aconnector[conn_index])
be593d9d91c5a3a Chris Bainbridge       2025-04-17  605  		drm_connector_put(&hdcp_w->aconnector[conn_index]->base);
be593d9d91c5a3a Chris Bainbridge       2025-04-17  606  	hdcp_w->aconnector[conn_index] = aconnector;
393e83484839970 Bhawanpreet Lakha      2023-07-24  607  	process_output(hdcp_w);
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  608  }
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  609  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
