Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB52397338
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jun 2026 07:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781594919; cv=none; b=BPQOg8s29+0AyxXPiesvQNcYY/y/hM6M1I7LK4QpHlpxX5iOAinf1H2+HgvH87j4HBwuhFCnJbm6HRz++uT7fAZ//qXmXB1+awMT92DI6MFpaWvPEsY51edpIUUTLYwqiQaQh9c1ahxoJMrahIB1mATuaNgNlWnfyWm1N1f0bNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781594919; c=relaxed/simple;
	bh=KmixkQKmyMSsbTbrtZQ4HVzI2fmGpuYfBFAgCq/qysM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fMPAjcpTod0vkrB+l6uMQbzDmufvcsuq9EkU5ILwWo7u8rjfI0S8V6h3V2R4a/4z1w7bKlftsg59aDo7WtVtC4jvPT6QgQ0GJK6n5gCF34GFVFvXkXXPYD5RkY8URJXLMfLwnczuTIHemvUIGRApTHFeseTA53eJrP+IKS3zkVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q30tLhMO; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q30tLhMO"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-517a5cafc3dso46852741cf.3
        for <oe-kbuild@lists.linux.dev>; Tue, 16 Jun 2026 00:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781594917; x=1782199717; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t6jj1GbYdEFlVQkO0CyOO83MTFHg2HEfsxMSazDBBpE=;
        b=Q30tLhMO8cTnqD+2cuMRqzp0APgP+Qtxl2BiT5OuqxohCwvvvDy3pWQxCBNyw+Fk/a
         qrke/FqA3jdjW5iK2zxM8OYuxrKP829RLBf3coy7h/ati9HKxwbFbRMcjNuPkC7dOYXN
         fBze1wDIAUwPDXdt6gzjvOFDOkxXv6lE7w+1jfbFxtLCgE4l2o9rAWs0/0Ls5sd2swDJ
         vRiRGh5H6y+8Wp6PBxYQjg6uywaxYbG9fLUMXD04+zeCr+hArQW0H9B1jlsaKX2aX6e8
         WosGguRUcu+tRfUFhuuc3FZRPL3ztTK8Sfffv52c2OUx0o8msN6chtZawgu4oypodh3Q
         pi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594917; x=1782199717;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6jj1GbYdEFlVQkO0CyOO83MTFHg2HEfsxMSazDBBpE=;
        b=XlLmcx5ORFaAlIgSEDUzOvoLNbPl8/bbe5jkVowl3Wh8oQKsesfy9dKOpgmt1OlGl/
         B6Mtm9RCOTcnyFXRZYYQ0T+4KHDu41uaCzHhu+FCUgnsgg7EaiRc2FgSiwn00mBO26DL
         JBzgsSoiQjsMKAOaPVwPNwMGtj0mVybBVcFZAQWRyxtUMuaiCwYVzQIF06lLsmwMkG9f
         D5rqg5j+9jFxOrMnP29LM+8sakmG7pi7wiJYyLIbPDSynYK7GuyR8/TW5DmbQ+DzXTcd
         j5X5523mt9VaIr314QIsUHL5Zeuupa9px371XSxg5jEtMYTiED1SV+4KqLpWoKX7rBnX
         pzoQ==
X-Gm-Message-State: AOJu0YwwQ9Y8NQR6S7pEWCjbCivOGhZD216FO4KFcSznrw6ovH5Eltr1
	Kcaq1ENfZa0X6Z7WWmw9ajAm3qJFaIUtHAh6LIAFnkOU2HC2trijE4M+hXerFCqCCKw=
X-Gm-Gg: Acq92OFAZlKtrvhgWCbGRLq500noCTsZnk0sbGA4RbBqTyspG+mZXoFxkizW3w0XHGy
	1VNG8hkDn1j0C07Gbh/o4fur0HJCspWBNzDw6IGba72VnSFDdabIbeM77H6+WPACGwjHT6eUvJu
	D/mexlfqxXhA1kGp1/8hHV6JDKOQzKpYrOj08ZBHKfmZA4+TdCCXtexJqqFJq7KABXC7u9QUk0k
	wO95q6gGmAw45H56+vUWa4owmFKc7YNJEiy9ELAkcvk0JLCZaFVN8RUbj4Dl5c4ZOap3bReWSbE
	mUYsS+z1oveEayFQ6nqs7O3YIxB5JNZ7sS44ythiybvAiT9z6rmtT4Dbd6XBFyys37ZD+ZAOtLl
	T1fAW9I412dDyjt6IyoYpMuLZrY/m/NLqma9RmEi0DYlULKS9Vye0F9RXO/4Cs0uEtwUUjSo2Qd
	P80dGN0dAGDdOj8bqGVAv1lnD/YOI=
X-Received: by 2002:a05:622a:111:b0:517:83e5:7859 with SMTP id d75a77b69052e-51991aee144mr33035191cf.53.1781594915849;
        Tue, 16 Jun 2026 00:28:35 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb6442d8sm131440821cf.11.2026.06.16.00.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:28:34 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:28:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Harry Wentland <harry.wentland@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: [linux-next:master 9791/14023]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_hdmi_frl.c:781
 hdmi_frl_verify_link_cap() error: we previously assumed 'link->local_sink'
 could be null (see line 776)
Message-ID: <202606160512.NM58W8KB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260616072826.jk-3EIBVWFlkmRRKws3t1Lga24bxA5DmhEegUveHCWA@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
commit: cbb8e2044b9e936dfa66f1d4a2f835316c741a67 [9791/14023] drm/amd/display: Add DC link support for FRL
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
                                                            ^^^^^^^^^^^^^^^^
Check for NULL

cbb8e2044b9e93 Harry Wentland 2026-04-24   777  		link->local_sink->edid_caps.panel_patch.force_frl)
cbb8e2044b9e93 Harry Wentland 2026-04-24   778  			link->frl_flags.force_frl_always = true;
cbb8e2044b9e93 Harry Wentland 2026-04-24   779  
cbb8e2044b9e93 Harry Wentland 2026-04-24   780  	if (!link->frl_flags.force_frl_max &&
cbb8e2044b9e93 Harry Wentland 2026-04-24  @781  			link->local_sink->edid_caps.panel_patch.hdmi_comp_auto) {
                                                                        ^^^^^^^^^^^^^^^^^^^
Unchecked dereference

cbb8e2044b9e93 Harry Wentland 2026-04-24   782  		link->frl_flags.force_frl_max = true;
cbb8e2044b9e93 Harry Wentland 2026-04-24   783  	}
cbb8e2044b9e93 Harry Wentland 2026-04-24   784  
cbb8e2044b9e93 Harry Wentland 2026-04-24   785  	if (link->local_sink &&
                                                            ^^^^^^^^^^^^^^^^
More checks

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

[ snip ]

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
                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Unchecked dereference

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
                                                                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Checked too late.

cbb8e2044b9e93 Harry Wentland 2026-04-24   929  			return;
cbb8e2044b9e93 Harry Wentland 2026-04-24   930  
cbb8e2044b9e93 Harry Wentland 2026-04-24   931  		switch (link_stream->link->frl_link_settings.frl_link_rate) {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

