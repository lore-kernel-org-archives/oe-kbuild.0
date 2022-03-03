Content-Type: multipart/mixed; boundary="===============0621069391480106167=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:1018 dce110_edp_backlight_control() error: we previously assumed 'link->panel_cntl' could be null (see line 977)
Date: Fri, 04 Mar 2022 03:02:09 +0800
Message-ID: <202203040239.BsQMEFBL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0621069391480106167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jake Wang <haonan.wang2@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Aric Cyr <Aric.Cyr@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5859a2b1991101d6b978f3feb5325dad39421f29
commit: 06ddcee49a35981835e04910bef462a09f108984 drm/amd/display: Added mul=
ti instance support for panel control
date:   12 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 12 months ago
config: powerpc-randconfig-m031-20220301 (https://download.01.org/0day-ci/a=
rchive/20220304/202203040239.BsQMEFBL-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:1018 =
dce110_edp_backlight_control() error: we previously assumed 'link->panel_cn=
tl' could be null (see line 977)

vim +1018 drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequenc=
er.c

cf3a2627597794 Jun Lei           2020-11-24   957  =

5eefbc40173644 Yue Hin Lau       2017-09-15   958  /*todo: cloned in stream=
 enc, fix*/
5eefbc40173644 Yue Hin Lau       2017-09-15   959  /*
5eefbc40173644 Yue Hin Lau       2017-09-15   960   * @brief
5eefbc40173644 Yue Hin Lau       2017-09-15   961   * eDP only. Control the=
 backlight of the eDP panel
5eefbc40173644 Yue Hin Lau       2017-09-15   962   */
8a31820b12187c Martin Leung      2019-07-09   963  void dce110_edp_backligh=
t_control(
5eefbc40173644 Yue Hin Lau       2017-09-15   964  		struct dc_link *link,
5eefbc40173644 Yue Hin Lau       2017-09-15   965  		bool enable)
5eefbc40173644 Yue Hin Lau       2017-09-15   966  {
069d418f412ec4 Andrew Jiang      2017-09-26   967  	struct dc_context *ctx =
=3D link->ctx;
5eefbc40173644 Yue Hin Lau       2017-09-15   968  	struct bp_transmitter_c=
ontrol cntl =3D { 0 };
06ddcee49a3598 Jake Wang         2021-02-23   969  	uint8_t panel_instance;
5eefbc40173644 Yue Hin Lau       2017-09-15   970  =

069d418f412ec4 Andrew Jiang      2017-09-26   971  	if (dal_graphics_object=
_id_get_connector_id(link->link_enc->connector)
5eefbc40173644 Yue Hin Lau       2017-09-15   972  		!=3D CONNECTOR_ID_EDP)=
 {
5eefbc40173644 Yue Hin Lau       2017-09-15   973  		BREAK_TO_DEBUGGER();
5eefbc40173644 Yue Hin Lau       2017-09-15   974  		return;
5eefbc40173644 Yue Hin Lau       2017-09-15   975  	}
5eefbc40173644 Yue Hin Lau       2017-09-15   976  =

014427adc5565a Sherry            2020-11-11  @977  	if (link->panel_cntl) {
014427adc5565a Sherry            2020-11-11   978  		bool is_backlight_on =
=3D link->panel_cntl->funcs->is_panel_backlight_on(link->panel_cntl);
014427adc5565a Sherry            2020-11-11   979  =

014427adc5565a Sherry            2020-11-11   980  		if ((enable && is_back=
light_on) || (!enable && !is_backlight_on)) {
1296423bf23c7a Bhawanpreet Lakha 2018-02-20   981  			DC_LOG_HW_RESUME_S3(
014427adc5565a Sherry            2020-11-11   982  				"%s: panel already p=
owered up/off. Do nothing.\n",
5eefbc40173644 Yue Hin Lau       2017-09-15   983  				__func__);
5eefbc40173644 Yue Hin Lau       2017-09-15   984  			return;
5eefbc40173644 Yue Hin Lau       2017-09-15   985  		}
014427adc5565a Sherry            2020-11-11   986  	}
5eefbc40173644 Yue Hin Lau       2017-09-15   987  =

5eefbc40173644 Yue Hin Lau       2017-09-15   988  	/* Send VBIOS command t=
o control eDP panel backlight */
5eefbc40173644 Yue Hin Lau       2017-09-15   989  =

1296423bf23c7a Bhawanpreet Lakha 2018-02-20   990  	DC_LOG_HW_RESUME_S3(
5eefbc40173644 Yue Hin Lau       2017-09-15   991  			"%s: backlight action=
: %s\n",
5eefbc40173644 Yue Hin Lau       2017-09-15   992  			__func__, (enable ? "=
On":"Off"));
5eefbc40173644 Yue Hin Lau       2017-09-15   993  =

5eefbc40173644 Yue Hin Lau       2017-09-15   994  	cntl.action =3D enable ?
5eefbc40173644 Yue Hin Lau       2017-09-15   995  		TRANSMITTER_CONTROL_BA=
CKLIGHT_ON :
5eefbc40173644 Yue Hin Lau       2017-09-15   996  		TRANSMITTER_CONTROL_BA=
CKLIGHT_OFF;
8740196935625d Andrew Jiang      2017-09-25   997  =

5eefbc40173644 Yue Hin Lau       2017-09-15   998  	/*cntl.engine_id =3D ct=
x->engine;*/
5eefbc40173644 Yue Hin Lau       2017-09-15   999  	cntl.transmitter =3D li=
nk->link_enc->transmitter;
5eefbc40173644 Yue Hin Lau       2017-09-15  1000  	cntl.connector_obj_id =
=3D link->link_enc->connector;
5eefbc40173644 Yue Hin Lau       2017-09-15  1001  	/*todo: unhardcode*/
5eefbc40173644 Yue Hin Lau       2017-09-15  1002  	cntl.lanes_number =3D L=
ANE_COUNT_FOUR;
5eefbc40173644 Yue Hin Lau       2017-09-15  1003  	cntl.hpd_sel =3D link->=
link_enc->hpd_source;
cf1835f03ffb3b Charlene Liu      2018-01-08  1004  	cntl.signal =3D SIGNAL_=
TYPE_EDP;
5eefbc40173644 Yue Hin Lau       2017-09-15  1005  =

5eefbc40173644 Yue Hin Lau       2017-09-15  1006  	/* For eDP, the followi=
ng delays might need to be considered
5eefbc40173644 Yue Hin Lau       2017-09-15  1007  	 * after link training =
completed:
5eefbc40173644 Yue Hin Lau       2017-09-15  1008  	 * idle period - min. a=
ccounts for required BS-Idle pattern,
5eefbc40173644 Yue Hin Lau       2017-09-15  1009  	 * max. allows for sour=
ce frame synchronization);
5eefbc40173644 Yue Hin Lau       2017-09-15  1010  	 * 50 msec max. delay f=
rom valid video data from source
5eefbc40173644 Yue Hin Lau       2017-09-15  1011  	 * to video on dislpay =
or backlight enable.
5eefbc40173644 Yue Hin Lau       2017-09-15  1012  	 *
5eefbc40173644 Yue Hin Lau       2017-09-15  1013  	 * Disable the delay fo=
r now.
5eefbc40173644 Yue Hin Lau       2017-09-15  1014  	 * Enable it in the fut=
ure if necessary.
5eefbc40173644 Yue Hin Lau       2017-09-15  1015  	 */
5eefbc40173644 Yue Hin Lau       2017-09-15  1016  	/* dc_service_sleep_in_=
milliseconds(50); */
5180d4a4766d7d Charlene Liu      2018-01-18  1017  		/*edp 1.2*/
06ddcee49a3598 Jake Wang         2021-02-23 @1018  	panel_instance =3D link=
->panel_cntl->inst;
5180d4a4766d7d Charlene Liu      2018-01-18  1019  	if (cntl.action =3D=3D =
TRANSMITTER_CONTROL_BACKLIGHT_ON)
5180d4a4766d7d Charlene Liu      2018-01-18  1020  		edp_receiver_ready_T7(=
link);
8a0e210c048e97 Chris Park        2020-08-05  1021  =

8a0e210c048e97 Chris Park        2020-08-05  1022  	if (ctx->dc->ctx->dmub_=
srv &&
8a0e210c048e97 Chris Park        2020-08-05  1023  			ctx->dc->debug.dmub_c=
ommand_table) {
8a0e210c048e97 Chris Park        2020-08-05  1024  		if (cntl.action =3D=3D=
 TRANSMITTER_CONTROL_BACKLIGHT_ON)
8a0e210c048e97 Chris Park        2020-08-05  1025  			ctx->dc_bios->funcs->=
enable_lvtma_control(ctx->dc_bios,
06ddcee49a3598 Jake Wang         2021-02-23  1026  					LVTMA_CONTROL_LCD_B=
LON,
06ddcee49a3598 Jake Wang         2021-02-23  1027  					panel_instance);
8a0e210c048e97 Chris Park        2020-08-05  1028  		else
8a0e210c048e97 Chris Park        2020-08-05  1029  			ctx->dc_bios->funcs->=
enable_lvtma_control(ctx->dc_bios,
06ddcee49a3598 Jake Wang         2021-02-23  1030  					LVTMA_CONTROL_LCD_B=
LOFF,
06ddcee49a3598 Jake Wang         2021-02-23  1031  					panel_instance);
8a0e210c048e97 Chris Park        2020-08-05  1032  	}
8a0e210c048e97 Chris Park        2020-08-05  1033  =

069d418f412ec4 Andrew Jiang      2017-09-26  1034  	link_transmitter_contro=
l(ctx->dc_bios, &cntl);
96577cf82a1331 Hersen Wu         2020-01-14  1035  =

96577cf82a1331 Hersen Wu         2020-01-14  1036  	if (enable && link->dpc=
d_sink_ext_caps.bits.oled)
96577cf82a1331 Hersen Wu         2020-01-14  1037  		msleep(OLED_POST_T7_DE=
LAY);
96577cf82a1331 Hersen Wu         2020-01-14  1038  =

96577cf82a1331 Hersen Wu         2020-01-14  1039  	if (link->dpcd_sink_ext=
_caps.bits.oled ||
96577cf82a1331 Hersen Wu         2020-01-14  1040  		link->dpcd_sink_ext_ca=
ps.bits.hdr_aux_backlight_control =3D=3D 1 ||
96577cf82a1331 Hersen Wu         2020-01-14  1041  		link->dpcd_sink_ext_ca=
ps.bits.sdr_aux_backlight_control =3D=3D 1)
96577cf82a1331 Hersen Wu         2020-01-14  1042  		dc_link_backlight_enab=
le_aux(link, enable);
96577cf82a1331 Hersen Wu         2020-01-14  1043  =

69b9723a81e74e Charlene Liu      2018-01-18  1044  	/*edp 1.2*/
5180d4a4766d7d Charlene Liu      2018-01-18  1045  	if (cntl.action =3D=3D =
TRANSMITTER_CONTROL_BACKLIGHT_OFF)
3a372bed1e337e Hugo Hu           2020-10-06  1046  		edp_add_delay_for_T9(l=
ink);
96577cf82a1331 Hersen Wu         2020-01-14  1047  =

96577cf82a1331 Hersen Wu         2020-01-14  1048  	if (!enable && link->dp=
cd_sink_ext_caps.bits.oled)
96577cf82a1331 Hersen Wu         2020-01-14  1049  		msleep(OLED_PRE_T11_DE=
LAY);
5eefbc40173644 Yue Hin Lau       2017-09-15  1050  }
5eefbc40173644 Yue Hin Lau       2017-09-15  1051  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0621069391480106167==--

