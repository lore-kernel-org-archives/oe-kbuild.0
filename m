Content-Type: multipart/mixed; boundary="===============1408485484467096754=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:222 dcn21_set_backlight_level() error: we previously assumed 'panel_cntl' could be null (see line 213)
Date: Sat, 18 Dec 2021 21:44:03 +0800
Message-ID: <202112182118.FZN5I3gV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1408485484467096754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jake Wang <haonan.wang2@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9eaa88c7036eda3f6c215f87ca693594cf90559b
commit: e922057b556d37c54f8f88e44f7d7b731d6365b1 drm/amd/display: Added sup=
port for multiple eDP BL control
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-m001-20211207 (https://download.01.org/0day-ci/ar=
chive/20211218/202112182118.FZN5I3gV-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:222 dcn21_set_=
backlight_level() error: we previously assumed 'panel_cntl' could be null (=
see line 213)

vim +/panel_cntl +222 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_=
hwseq.c

474ac4a875ca6f Yongqiang Sun 2020-04-27  197  =

474ac4a875ca6f Yongqiang Sun 2020-04-27  198  bool dcn21_set_backlight_leve=
l(struct pipe_ctx *pipe_ctx,
474ac4a875ca6f Yongqiang Sun 2020-04-27  199  		uint32_t backlight_pwm_u16_=
16,
474ac4a875ca6f Yongqiang Sun 2020-04-27  200  		uint32_t frame_ramp)
474ac4a875ca6f Yongqiang Sun 2020-04-27  201  {
474ac4a875ca6f Yongqiang Sun 2020-04-27  202  	union dmub_rb_cmd cmd;
474ac4a875ca6f Yongqiang Sun 2020-04-27  203  	struct dc_context *dc =3D pi=
pe_ctx->stream->ctx;
474ac4a875ca6f Yongqiang Sun 2020-04-27  204  	struct abm *abm =3D pipe_ctx=
->stream_res.abm;
474ac4a875ca6f Yongqiang Sun 2020-04-27  205  	uint32_t otg_inst =3D pipe_c=
tx->stream_res.tg->inst;
474ac4a875ca6f Yongqiang Sun 2020-04-27  206  	struct panel_cntl *panel_cnt=
l =3D pipe_ctx->stream->link->panel_cntl;
474ac4a875ca6f Yongqiang Sun 2020-04-27  207  =

474ac4a875ca6f Yongqiang Sun 2020-04-27  208  	if (dc->dc->res_pool->dmcu) {
474ac4a875ca6f Yongqiang Sun 2020-04-27  209  		dce110_set_backlight_level(=
pipe_ctx, backlight_pwm_u16_16, frame_ramp);
474ac4a875ca6f Yongqiang Sun 2020-04-27  210  		return true;
474ac4a875ca6f Yongqiang Sun 2020-04-27  211  	}
474ac4a875ca6f Yongqiang Sun 2020-04-27  212  =

474ac4a875ca6f Yongqiang Sun 2020-04-27 @213  	if (abm && panel_cntl)
474ac4a875ca6f Yongqiang Sun 2020-04-27  214  		dmub_abm_set_pipe(abm, otg_=
inst, SET_ABM_PIPE_NORMAL, panel_cntl->inst);
474ac4a875ca6f Yongqiang Sun 2020-04-27  215  =

148816f93fa0db Wyatt Wood    2021-01-18  216  	memset(&cmd, 0, sizeof(cmd));
474ac4a875ca6f Yongqiang Sun 2020-04-27  217  	cmd.abm_set_backlight.header=
.type =3D DMUB_CMD__ABM;
474ac4a875ca6f Yongqiang Sun 2020-04-27  218  	cmd.abm_set_backlight.header=
.sub_type =3D DMUB_CMD__ABM_SET_BACKLIGHT;
474ac4a875ca6f Yongqiang Sun 2020-04-27  219  	cmd.abm_set_backlight.abm_se=
t_backlight_data.frame_ramp =3D frame_ramp;
474ac4a875ca6f Yongqiang Sun 2020-04-27  220  	cmd.abm_set_backlight.abm_se=
t_backlight_data.backlight_user_level =3D backlight_pwm_u16_16;
e922057b556d37 Jake Wang     2021-04-01  221  	cmd.abm_set_backlight.abm_se=
t_backlight_data.version =3D DMUB_CMD_ABM_SET_BACKLIGHT_VERSION_1;
e922057b556d37 Jake Wang     2021-04-01 @222  	cmd.abm_set_backlight.abm_se=
t_backlight_data.panel_mask =3D (0x01 << panel_cntl->inst);
474ac4a875ca6f Yongqiang Sun 2020-04-27  223  	cmd.abm_set_backlight.header=
.payload_bytes =3D sizeof(struct dmub_cmd_abm_set_backlight_data);
474ac4a875ca6f Yongqiang Sun 2020-04-27  224  =

474ac4a875ca6f Yongqiang Sun 2020-04-27  225  	dc_dmub_srv_cmd_queue(dc->dm=
ub_srv, &cmd);
474ac4a875ca6f Yongqiang Sun 2020-04-27  226  	dc_dmub_srv_cmd_execute(dc->=
dmub_srv);
474ac4a875ca6f Yongqiang Sun 2020-04-27  227  	dc_dmub_srv_wait_idle(dc->dm=
ub_srv);
474ac4a875ca6f Yongqiang Sun 2020-04-27  228  =

474ac4a875ca6f Yongqiang Sun 2020-04-27  229  	return true;
474ac4a875ca6f Yongqiang Sun 2020-04-27  230  }
474ac4a875ca6f Yongqiang Sun 2020-04-27  231  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1408485484467096754==--

