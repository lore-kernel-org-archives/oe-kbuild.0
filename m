Content-Type: multipart/mixed; boundary="===============2919446068425506603=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:311 dc_dmub_srv_p_state_delegate() warn: variable dereferenced before check 'dc' (see line 309)
Date: Thu, 25 Aug 2022 22:17:21 +0800
Message-ID: <202208252240.i49DVUes-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2919446068425506603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c40e8341e3b3bb27e3a65b06b5b454626234c4f0
commit: 00fa7f031dd4b885175da390e24cb02f6a45977e drm/amd/display: Add basic=
 infrastructure for enabling FAMS
date:   7 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 7 weeks ago
config: microblaze-randconfig-m041-20220824 (https://download.01.org/0day-c=
i/archive/20220825/202208252240.i49DVUes-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:311 dc_dmub_srv_p_st=
ate_delegate() warn: variable dereferenced before check 'dc' (see line 309)

vim +/dc +311 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c

00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  302  =

00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  303  bool dc_dmub_srv_p_state_=
delegate(struct dc *dc, bool should_manage_pstate, struct dc_state *context)
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  304  {
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  305  	union dmub_rb_cmd cmd =
=3D { 0 };
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  306  	struct dmub_cmd_fw_assis=
ted_mclk_switch_config *config_data =3D &cmd.fw_assisted_mclk_switch.config=
_data;
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  307  	int i =3D 0;
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  308  	int ramp_up_num_steps =
=3D 1; // TODO: Ramp is currently disabled. Reenable it.
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16 @309  	uint8_t visual_confirm_e=
nabled =3D dc->debug.visual_confirm =3D=3D VISUAL_CONFIRM_FAMS;
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  310  =

00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16 @311  	if (dc =3D=3D NULL)
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  312  		return false;
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  313  =

00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  314  	// Format command.
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  315  	cmd.fw_assisted_mclk_swi=
tch.header.type =3D DMUB_CMD__FW_ASSISTED_MCLK_SWITCH;
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  316  	cmd.fw_assisted_mclk_swi=
tch.header.sub_type =3D DMUB_CMD__FAMS_SETUP_FW_CTRL;
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  317  	cmd.fw_assisted_mclk_swi=
tch.config_data.fams_enabled =3D should_manage_pstate;
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  318  	cmd.fw_assisted_mclk_swi=
tch.config_data.visual_confirm_enabled =3D visual_confirm_enabled;
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  319  =

00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  320  	for (i =3D 0; context &&=
 i < context->stream_count; i++) {
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  321  		struct dc_stream_state =
*stream =3D context->streams[i];
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  322  		uint8_t min_refresh_in_=
hz =3D (stream->timing.min_refresh_in_uhz + 999999) / 1000000;
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  323  		int  tg_inst =3D dc_dmu=
b_srv_get_timing_generator_offset(dc, stream);
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  324  =

00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  325  		config_data->pipe_data[=
tg_inst].pix_clk_100hz =3D stream->timing.pix_clk_100hz;
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  326  		config_data->pipe_data[=
tg_inst].min_refresh_in_hz =3D min_refresh_in_hz;
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  327  		config_data->pipe_data[=
tg_inst].max_ramp_step =3D ramp_up_num_steps;
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  328  		config_data->pipe_data[=
tg_inst].pipes =3D dc_dmub_srv_get_pipes_for_stream(dc, stream);
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  329  	}
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  330  =

00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  331  	cmd.fw_assisted_mclk_swi=
tch.header.payload_bytes =3D
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  332  		sizeof(cmd.fw_assisted_=
mclk_switch) - sizeof(cmd.fw_assisted_mclk_switch.header);
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  333  =

00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  334  	// Send the command to t=
he DMCUB.
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  335  	dc_dmub_srv_cmd_queue(dc=
->ctx->dmub_srv, &cmd);
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  336  	dc_dmub_srv_cmd_execute(=
dc->ctx->dmub_srv);
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  337  	dc_dmub_srv_wait_idle(dc=
->ctx->dmub_srv);
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  338  =

00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  339  	return true;
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  340  }
00fa7f031dd4b88 Rodrigo Siqueira 2022-06-16  341  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2919446068425506603==--

