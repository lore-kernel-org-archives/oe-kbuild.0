Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92122313E15
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jun 2026 06:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505320; cv=none; b=JErmnJUQrtdAWet2UITw2xdDFDkK5VR6Ge1NLLSk3+6gWZ89WWuHCNdtBgplam9sVWDq8zfdMJ92gcCvmY7TPQmI/S9fNoWXL0fm3W7iEB9PBJyzqNHWcJ2i3g1QORQ4jGk4JRkuz0lLAj1regy22aq36FtiWnN1o9kuvq4NcQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505320; c=relaxed/simple;
	bh=r+vg0vkd8B95Oa/TdThzlXYhQU1pfllQ4ZCHjiq3OZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ACAdAbBpxURld6PGBB/j/oJSoJQV2LfpuZpM1bNXAbATfbmxkA6uoloVtsJ7g6GC1XFwM+kA/wf4lbNGjytSp7c616oKblHIv72qGt/7xyGWa5FrfJDNigRCuzVQl7tFdswMS8Q6MvqCe12R/Bn+Qo24/to+PTK3d5sAEemamDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFx1oTpz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFx1oTpz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781505319; x=1813041319;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=r+vg0vkd8B95Oa/TdThzlXYhQU1pfllQ4ZCHjiq3OZ0=;
  b=YFx1oTpzRF7jSLeztumBIoPKnKNFUxdSq32zZ82rM0nZdiO/sSs+CbYT
   4FCdY5LS8pn7XqNKxQ2CedVGibgyird6YvOjA5IOWQXAy539V+9NNUINJ
   lnOwj+6npS0qsUcQjt+1g7rOYhn/bFxvDTatH+lC5mxCGygrwIS8nrmQN
   UcBx7UA8/sjr43ECxo135jviPYvn11TSQYpZNT2KAZLwkqAm0St9E4tuj
   DeRAMiiMwNGJXLSSq27EDG9ycoXvVokxqtIqBHdPcKfr0gUpf7o/kPtEc
   SwALHIGDaZLeWO3M/jqEPM2aei4hbEB/F+0FRnOAXBIhqK/iJEUmMtib6
   g==;
X-CSE-ConnectionGUID: 76CvvXMUScq5kA4zw0X0AA==
X-CSE-MsgGUID: EwOIvcDzSqyc3RnH8iVorA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="86137551"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="86137551"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 23:35:18 -0700
X-CSE-ConnectionGUID: N9Y+Q+8DR2OXqIPSot1GNA==
X-CSE-MsgGUID: Y2EBt7A2TqaOH7OHQZTJcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="243233704"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jun 2026 23:35:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZ0ug-00000000RYA-1kLO;
	Mon, 15 Jun 2026 06:35:14 +0000
Date: Mon, 15 Jun 2026 14:34:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9857/13763]
 drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:1251
 dce110_disable_stream() warn: if statement not indented
Message-ID: <202606151447.2PCTpSnO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Harry Wentland <harry.wentland@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Fangzhi Zuo <Jerry.Zuo@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: 6cb49315791ec281fda07519708dd88ff072b0bf [9857/13763] drm/amd/displ=
ay: Tie FRL programming together in HWSS
:::::: branch date: 3 days ago
:::::: commit date: 12 days ago
config: i386-randconfig-141-20260611 (https://download.01.org/0day-ci/archi=
ve/20260615/202606151447.2PCTpSnO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606151447.2PCTpSnO-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:1251 dc=
e110_disable_stream() warn: if statement not indented
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn30/dcn30_hwseq.c:881 dcn30=
_update_info_frame() error: we previously assumed 'pipe_ctx->stream_res.str=
eam_enc' could be null (see line 869)
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn31/dcn31_hwseq.c:398 dcn31=
_update_info_frame() error: we previously assumed 'pipe_ctx->stream_res.str=
eam_enc' could be null (see line 386)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn31/dcn31_hwseq.c:735 dcn31=
_set_backlight_level() warn: inconsistent indenting

vim +1251 drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq=
.c

4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Harry Wentland 2017-09-12  1200 =20
574304041bb950 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Su Sung Chung  2019-07-25  1201  void dce110_disable_stream(struct pipe_ctx=
 *pipe_ctx)
1a05873f21d619 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Anthony Koo    2018-05-10  1202  {
1a05873f21d619 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Anthony Koo    2018-05-10  1203  	struct dc_stream_state *stream =3D pipe_c=
tx->stream;
ceb3dbb4690db8 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Jun Lei        2018-11-09  1204  	struct dc_link *link =3D stream->link;
1a05873f21d619 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Anthony Koo    2018-05-10  1205  	struct dc *dc =3D pipe_ctx->stream->ctx->=
dc;
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Wenjing Liu    2022-01-28  1206  	const struct link_hwss *link_hwss =3D get=
_link_hwss(link, &pipe_ctx->link_res);
7462475e3a06fb drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Wenjing Liu    2022-12-05  1207  	struct dccg *dccg =3D dc->res_pool->dccg;
7462475e3a06fb drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Wenjing Liu    2022-12-05  1208  	struct timing_generator *tg =3D pipe_ctx-=
>stream_res.tg;
8e40dd932037d5 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Charlene Liu   2025-04-08  1209  	struct dtbclk_dto_params dto_params =3D {=
0};
7462475e3a06fb drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Wenjing Liu    2022-12-05  1210  	int dp_hpo_inst;
d2957868401660 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Peichen Huang  2025-01-17  1211  	struct link_encoder *link_enc =3D pipe_ct=
x->link_res.dio_link_enc;
927e784c180c94 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Taimur Hassan  2023-07-17  1212  	struct stream_encoder *stream_enc =3D pip=
e_ctx->stream_res.stream_enc;
1a05873f21d619 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Anthony Koo    2018-05-10  1213 =20
d2957868401660 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Peichen Huang  2025-01-17  1214  	if (!dc->config.unify_link_enc_assignment)
d2957868401660 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Peichen Huang  2025-01-17  1215  		link_enc =3D link_enc_cfg_get_link_enc(l=
ink);
d2957868401660 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Peichen Huang  2025-01-17  1216 =20
ac42fd639550b3 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Wenjing Liu    2019-07-10  1217  	if (dc_is_hdmi_tmds_signal(pipe_ctx->stre=
am->signal)) {
1a05873f21d619 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Anthony Koo    2018-05-10  1218  		pipe_ctx->stream_res.stream_enc->funcs->=
stop_hdmi_info_packets(
1a05873f21d619 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Anthony Koo    2018-05-10  1219  			pipe_ctx->stream_res.stream_enc);
ac42fd639550b3 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Wenjing Liu    2019-07-10  1220  		pipe_ctx->stream_res.stream_enc->funcs->=
hdmi_reset_stream_attribute(
ac42fd639550b3 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Wenjing Liu    2019-07-10  1221  			pipe_ctx->stream_res.stream_enc);
ac42fd639550b3 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Wenjing Liu    2019-07-10  1222  	}
1a05873f21d619 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Anthony Koo    2018-05-10  1223 =20
6cb49315791ec2 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Harry Wentland 2026-04-24  1224  	if (dc_is_hdmi_frl_signal(pipe_ctx->strea=
m->signal))
6cb49315791ec2 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Harry Wentland 2026-04-24  1225  		pipe_ctx->stream_res.hpo_frl_stream_enc-=
>funcs->stop_hdmi_info_packets(
6cb49315791ec2 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Harry Wentland 2026-04-24  1226  			pipe_ctx->stream_res.hpo_frl_stream_enc=
);
98ce7d32e2154a drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Wenjing Liu    2023-02-23  1227  	if (dc->link_srv->dp_is_128b_132b_signal(=
pipe_ctx)) {
f01ee019586220 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Fangzhi Zuo    2021-08-03  1228  		pipe_ctx->stream_res.hpo_dp_stream_enc->=
funcs->stop_dp_info_packets(
f01ee019586220 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Fangzhi Zuo    2021-08-03  1229  					pipe_ctx->stream_res.hpo_dp_stream_en=
c);
f01ee019586220 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Fangzhi Zuo    2021-08-03  1230  	} else if (dc_is_dp_signal(pipe_ctx->stre=
am->signal))
1a05873f21d619 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Anthony Koo    2018-05-10  1231  		pipe_ctx->stream_res.stream_enc->funcs->=
stop_dp_info_packets(
1a05873f21d619 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Anthony Koo    2018-05-10  1232  			pipe_ctx->stream_res.stream_enc);
1a05873f21d619 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Anthony Koo    2018-05-10  1233 =20
574304041bb950 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Su Sung Chung  2019-07-25  1234  	dc->hwss.disable_audio_stream(pipe_ctx);
904623ee5936e2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Yongqiang Sun  2017-11-24  1235 =20
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Wenjing Liu    2022-01-28  1236  	link_hwss->reset_stream_encoder(pipe_ctx);
64d283cb379ead drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Jimmy Kizito   2021-08-10  1237 =20
cac9f51d73ba4f drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Alex Deucher   2023-09-20  1238  	if (dc->link_srv->dp_is_128b_132b_signal(=
pipe_ctx) && dccg) {
8e40dd932037d5 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Charlene Liu   2025-04-08  1239  		dto_params.otg_inst =3D tg->inst;
8e40dd932037d5 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Charlene Liu   2025-04-08  1240  		dto_params.timing =3D &pipe_ctx->stream-=
>timing;
7462475e3a06fb drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Wenjing Liu    2022-12-05  1241  		dp_hpo_inst =3D pipe_ctx->stream_res.hpo=
_dp_stream_enc->inst;
6f6583e58d1ddf drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Muhammad Ahmed 2023-08-23  1242  		if (dccg) {
7462475e3a06fb drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Wenjing Liu    2022-12-05  1243  			dccg->funcs->disable_symclk32_se(dccg, =
dp_hpo_inst);
7462475e3a06fb drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Wenjing Liu    2022-12-05  1244  			dccg->funcs->set_dpstreamclk(dccg, REFC=
LK, tg->inst, dp_hpo_inst);
f6d7238c924b63 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Ausef Yousof   2025-05-29  1245  			if (!(dc->ctx->dce_version >=3D DCN_VER=
SION_3_5)) {
8e40dd932037d5 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Charlene Liu   2025-04-08  1246  				if (dccg && dccg->funcs->set_dtbclk_dt=
o)
8e40dd932037d5 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Charlene Liu   2025-04-08  1247  					dccg->funcs->set_dtbclk_dto(dccg, &dt=
o_params);
6f6583e58d1ddf drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Muhammad Ahmed 2023-08-23  1248  			}
90bc60cef2a3ca drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Ausef Yousof   2025-05-28  1249  		}
7f7925e258288c drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Muhammad Ahmed 2023-08-23  1250  	} else if (dccg && dccg->funcs->disable_s=
ymclk_se) {
6cb49315791ec2 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Harry Wentland 2026-04-24 @1251  		if (pipe_ctx->stream->signal !=3D SIGNAL=
_TYPE_HDMI_FRL)
ec4b70db47e792 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Taimur Hassan  2023-07-17  1252  		dccg->funcs->disable_symclk_se(dccg, str=
eam_enc->stream_enc_inst,
ec4b70db47e792 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Taimur Hassan  2023-07-17  1253  					       link_enc->transmitter - TRANSM=
ITTER_UNIPHY_A);
7f7925e258288c drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Muhammad Ahmed 2023-08-23  1254  	}
9f556ac2e3c2a1 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Timur Krist=C3=B3f  2026-01-26  1255 =20
cea8349e4494d2 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Roman Li       2026-04-15  1256  	if (link->ext_enc_id.id)
cea8349e4494d2 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c   =
Roman Li       2026-04-15  1257  		dce110_external_encoder_control(EXTERNAL=
_ENCODER_CONTROL_DISABLE, link, NULL);
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Harry Wentland 2017-09-12  1258  }
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
Harry Wentland 2017-09-12  1259 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
