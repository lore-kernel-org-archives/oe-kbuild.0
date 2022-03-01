Content-Type: multipart/mixed; boundary="===============5238653793908485688=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:1018 dce110_edp_backlight_control() error: we previously assumed 'link->panel_cntl' could be null (see line 977)
Date: Wed, 02 Mar 2022 01:28:53 +0800
Message-ID: <202203020137.M32nCNIJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5238653793908485688==
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
head:   719fce7539cd3e186598e2aed36325fe892150cf
commit: 06ddcee49a35981835e04910bef462a09f108984 drm/amd/display: Added mul=
ti instance support for panel control
date:   11 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 11 months ago
config: powerpc-randconfig-m031-20220301 (https://download.01.org/0day-ci/a=
rchive/20220302/202203020137.M32nCNIJ-lkp(a)intel.com/config)
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

cf3a26275977947 Jun Lei           2020-11-24   957  =

5eefbc40173644b Yue Hin Lau       2017-09-15   958  /*todo: cloned in strea=
m enc, fix*/
5eefbc40173644b Yue Hin Lau       2017-09-15   959  /*
5eefbc40173644b Yue Hin Lau       2017-09-15   960   * @brief
5eefbc40173644b Yue Hin Lau       2017-09-15   961   * eDP only. Control th=
e backlight of the eDP panel
5eefbc40173644b Yue Hin Lau       2017-09-15   962   */
8a31820b12187c7 Martin Leung      2019-07-09   963  void dce110_edp_backlig=
ht_control(
5eefbc40173644b Yue Hin Lau       2017-09-15   964  		struct dc_link *link,
5eefbc40173644b Yue Hin Lau       2017-09-15   965  		bool enable)
5eefbc40173644b Yue Hin Lau       2017-09-15   966  {
069d418f412ec4b Andrew Jiang      2017-09-26   967  	struct dc_context *ctx=
 =3D link->ctx;
5eefbc40173644b Yue Hin Lau       2017-09-15   968  	struct bp_transmitter_=
control cntl =3D { 0 };
06ddcee49a35981 Jake Wang         2021-02-23   969  	uint8_t panel_instance;
5eefbc40173644b Yue Hin Lau       2017-09-15   970  =

069d418f412ec4b Andrew Jiang      2017-09-26   971  	if (dal_graphics_objec=
t_id_get_connector_id(link->link_enc->connector)
5eefbc40173644b Yue Hin Lau       2017-09-15   972  		!=3D CONNECTOR_ID_EDP=
) {
5eefbc40173644b Yue Hin Lau       2017-09-15   973  		BREAK_TO_DEBUGGER();
5eefbc40173644b Yue Hin Lau       2017-09-15   974  		return;
5eefbc40173644b Yue Hin Lau       2017-09-15   975  	}
5eefbc40173644b Yue Hin Lau       2017-09-15   976  =

014427adc5565a0 Sherry            2020-11-11  @977  	if (link->panel_cntl) {
014427adc5565a0 Sherry            2020-11-11   978  		bool is_backlight_on =
=3D link->panel_cntl->funcs->is_panel_backlight_on(link->panel_cntl);
014427adc5565a0 Sherry            2020-11-11   979  =

014427adc5565a0 Sherry            2020-11-11   980  		if ((enable && is_bac=
klight_on) || (!enable && !is_backlight_on)) {
1296423bf23c7a5 Bhawanpreet Lakha 2018-02-20   981  			DC_LOG_HW_RESUME_S3(
014427adc5565a0 Sherry            2020-11-11   982  				"%s: panel already =
powered up/off. Do nothing.\n",
5eefbc40173644b Yue Hin Lau       2017-09-15   983  				__func__);
5eefbc40173644b Yue Hin Lau       2017-09-15   984  			return;
5eefbc40173644b Yue Hin Lau       2017-09-15   985  		}
014427adc5565a0 Sherry            2020-11-11   986  	}
5eefbc40173644b Yue Hin Lau       2017-09-15   987  =

5eefbc40173644b Yue Hin Lau       2017-09-15   988  	/* Send VBIOS command =
to control eDP panel backlight */
5eefbc40173644b Yue Hin Lau       2017-09-15   989  =

1296423bf23c7a5 Bhawanpreet Lakha 2018-02-20   990  	DC_LOG_HW_RESUME_S3(
5eefbc40173644b Yue Hin Lau       2017-09-15   991  			"%s: backlight actio=
n: %s\n",
5eefbc40173644b Yue Hin Lau       2017-09-15   992  			__func__, (enable ? =
"On":"Off"));
5eefbc40173644b Yue Hin Lau       2017-09-15   993  =

5eefbc40173644b Yue Hin Lau       2017-09-15   994  	cntl.action =3D enable=
 ?
5eefbc40173644b Yue Hin Lau       2017-09-15   995  		TRANSMITTER_CONTROL_B=
ACKLIGHT_ON :
5eefbc40173644b Yue Hin Lau       2017-09-15   996  		TRANSMITTER_CONTROL_B=
ACKLIGHT_OFF;
8740196935625df Andrew Jiang      2017-09-25   997  =

5eefbc40173644b Yue Hin Lau       2017-09-15   998  	/*cntl.engine_id =3D c=
tx->engine;*/
5eefbc40173644b Yue Hin Lau       2017-09-15   999  	cntl.transmitter =3D l=
ink->link_enc->transmitter;
5eefbc40173644b Yue Hin Lau       2017-09-15  1000  	cntl.connector_obj_id =
=3D link->link_enc->connector;
5eefbc40173644b Yue Hin Lau       2017-09-15  1001  	/*todo: unhardcode*/
5eefbc40173644b Yue Hin Lau       2017-09-15  1002  	cntl.lanes_number =3D =
LANE_COUNT_FOUR;
5eefbc40173644b Yue Hin Lau       2017-09-15  1003  	cntl.hpd_sel =3D link-=
>link_enc->hpd_source;
cf1835f03ffb3b5 Charlene Liu      2018-01-08  1004  	cntl.signal =3D SIGNAL=
_TYPE_EDP;
5eefbc40173644b Yue Hin Lau       2017-09-15  1005  =

5eefbc40173644b Yue Hin Lau       2017-09-15  1006  	/* For eDP, the follow=
ing delays might need to be considered
5eefbc40173644b Yue Hin Lau       2017-09-15  1007  	 * after link training=
 completed:
5eefbc40173644b Yue Hin Lau       2017-09-15  1008  	 * idle period - min. =
accounts for required BS-Idle pattern,
5eefbc40173644b Yue Hin Lau       2017-09-15  1009  	 * max. allows for sou=
rce frame synchronization);
5eefbc40173644b Yue Hin Lau       2017-09-15  1010  	 * 50 msec max. delay =
from valid video data from source
5eefbc40173644b Yue Hin Lau       2017-09-15  1011  	 * to video on dislpay=
 or backlight enable.
5eefbc40173644b Yue Hin Lau       2017-09-15  1012  	 *
5eefbc40173644b Yue Hin Lau       2017-09-15  1013  	 * Disable the delay f=
or now.
5eefbc40173644b Yue Hin Lau       2017-09-15  1014  	 * Enable it in the fu=
ture if necessary.
5eefbc40173644b Yue Hin Lau       2017-09-15  1015  	 */
5eefbc40173644b Yue Hin Lau       2017-09-15  1016  	/* dc_service_sleep_in=
_milliseconds(50); */
5180d4a4766d7df Charlene Liu      2018-01-18  1017  		/*edp 1.2*/
06ddcee49a35981 Jake Wang         2021-02-23 @1018  	panel_instance =3D lin=
k->panel_cntl->inst;
5180d4a4766d7df Charlene Liu      2018-01-18  1019  	if (cntl.action =3D=3D=
 TRANSMITTER_CONTROL_BACKLIGHT_ON)
5180d4a4766d7df Charlene Liu      2018-01-18  1020  		edp_receiver_ready_T7=
(link);
8a0e210c048e97f Chris Park        2020-08-05  1021  =

8a0e210c048e97f Chris Park        2020-08-05  1022  	if (ctx->dc->ctx->dmub=
_srv &&
8a0e210c048e97f Chris Park        2020-08-05  1023  			ctx->dc->debug.dmub_=
command_table) {
8a0e210c048e97f Chris Park        2020-08-05  1024  		if (cntl.action =3D=
=3D TRANSMITTER_CONTROL_BACKLIGHT_ON)
8a0e210c048e97f Chris Park        2020-08-05  1025  			ctx->dc_bios->funcs-=
>enable_lvtma_control(ctx->dc_bios,
06ddcee49a35981 Jake Wang         2021-02-23  1026  					LVTMA_CONTROL_LCD_=
BLON,
06ddcee49a35981 Jake Wang         2021-02-23  1027  					panel_instance);
8a0e210c048e97f Chris Park        2020-08-05  1028  		else
8a0e210c048e97f Chris Park        2020-08-05  1029  			ctx->dc_bios->funcs-=
>enable_lvtma_control(ctx->dc_bios,
06ddcee49a35981 Jake Wang         2021-02-23  1030  					LVTMA_CONTROL_LCD_=
BLOFF,
06ddcee49a35981 Jake Wang         2021-02-23  1031  					panel_instance);
8a0e210c048e97f Chris Park        2020-08-05  1032  	}
8a0e210c048e97f Chris Park        2020-08-05  1033  =

069d418f412ec4b Andrew Jiang      2017-09-26  1034  	link_transmitter_contr=
ol(ctx->dc_bios, &cntl);
96577cf82a13317 Hersen Wu         2020-01-14  1035  =

96577cf82a13317 Hersen Wu         2020-01-14  1036  	if (enable && link->dp=
cd_sink_ext_caps.bits.oled)
96577cf82a13317 Hersen Wu         2020-01-14  1037  		msleep(OLED_POST_T7_D=
ELAY);
96577cf82a13317 Hersen Wu         2020-01-14  1038  =

96577cf82a13317 Hersen Wu         2020-01-14  1039  	if (link->dpcd_sink_ex=
t_caps.bits.oled ||
96577cf82a13317 Hersen Wu         2020-01-14  1040  		link->dpcd_sink_ext_c=
aps.bits.hdr_aux_backlight_control =3D=3D 1 ||
96577cf82a13317 Hersen Wu         2020-01-14  1041  		link->dpcd_sink_ext_c=
aps.bits.sdr_aux_backlight_control =3D=3D 1)
96577cf82a13317 Hersen Wu         2020-01-14  1042  		dc_link_backlight_ena=
ble_aux(link, enable);
96577cf82a13317 Hersen Wu         2020-01-14  1043  =

69b9723a81e74e5 Charlene Liu      2018-01-18  1044  	/*edp 1.2*/
5180d4a4766d7df Charlene Liu      2018-01-18  1045  	if (cntl.action =3D=3D=
 TRANSMITTER_CONTROL_BACKLIGHT_OFF)
3a372bed1e337ef Hugo Hu           2020-10-06  1046  		edp_add_delay_for_T9(=
link);
96577cf82a13317 Hersen Wu         2020-01-14  1047  =

96577cf82a13317 Hersen Wu         2020-01-14  1048  	if (!enable && link->d=
pcd_sink_ext_caps.bits.oled)
96577cf82a13317 Hersen Wu         2020-01-14  1049  		msleep(OLED_PRE_T11_D=
ELAY);
5eefbc40173644b Yue Hin Lau       2017-09-15  1050  }
5eefbc40173644b Yue Hin Lau       2017-09-15  1051  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5238653793908485688==--

