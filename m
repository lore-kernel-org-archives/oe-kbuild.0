Content-Type: multipart/mixed; boundary="===============0979372412771032571=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:587 dpia_training_eq_non_transparent() error: uninitialized symbol 'wait_time_microsec'.
Date: Sun, 19 Jun 2022 16:19:09 +0800
Message-ID: <202206191650.G13nLcLl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0979372412771032571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jimmy Kizito <Jimmy.Kizito@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Jun Lei <Jun.Lei@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 847a9038c2d025b32cd7ddcc2ccfa0e82a8ded53 drm/amd/display: Implement=
 DPIA equalisation phase
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: parisc-randconfig-m031-20220619 (https://download.01.org/0day-ci/ar=
chive/20220619/202206191650.G13nLcLl-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:587 dpia_train=
ing_eq_non_transparent() error: uninitialized symbol 'wait_time_microsec'.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:158 convert_tr=
ng_ptn_to_trng_stg() error: uninitialized symbol 'ts'.
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:803 dc_link_dp=
ia_perform_link_training() warn: always true condition '(repeater_id >=3D 0=
) =3D> (0-255 >=3D 0)'
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:803 dc_link_dp=
ia_perform_link_training() warn: always true condition '(repeater_id >=3D 0=
) =3D> (0-255 >=3D 0)'

vim +/wait_time_microsec +587 drivers/gpu/drm/amd/amdgpu/../display/dc/core=
/dc_link_dpia.c

847a9038c2d025b Jimmy Kizito 2021-04-19  497  =

847a9038c2d025b Jimmy Kizito 2021-04-19  498  /* Execute equalization phase=
 of link training for specified hop in display
847a9038c2d025b Jimmy Kizito 2021-04-19  499   * path in non-transparent mo=
de:
847a9038c2d025b Jimmy Kizito 2021-04-19  500   * - driver issues both DPCD =
and SET_CONFIG transactions.
847a9038c2d025b Jimmy Kizito 2021-04-19  501   * - TPSx is transmitted for =
any hops downstream of DPOA.
847a9038c2d025b Jimmy Kizito 2021-04-19  502   * - Drive (VS/PE) only trans=
mitted for the hop immediately downstream of DPOA.
847a9038c2d025b Jimmy Kizito 2021-04-19  503   * - EQ for the first hop (DP=
TX-to-DPIA) is assumed to be successful.
847a9038c2d025b Jimmy Kizito 2021-04-19  504   * - DPRX EQ only reported su=
ccessful when both DPRX and DPIA requirements
847a9038c2d025b Jimmy Kizito 2021-04-19  505   * (clk sync packets sent) fu=
lfilled.
847a9038c2d025b Jimmy Kizito 2021-04-19  506   *
847a9038c2d025b Jimmy Kizito 2021-04-19  507   * @param link DPIA link bein=
g trained.
847a9038c2d025b Jimmy Kizito 2021-04-19  508   * @param lt_settings link_se=
tting and drive settings (voltage swing and pre-emphasis).
847a9038c2d025b Jimmy Kizito 2021-04-19  509   * @param hop The Hop in disp=
lay path. DPRX =3D 0.
847a9038c2d025b Jimmy Kizito 2021-04-19  510   */
847a9038c2d025b Jimmy Kizito 2021-04-19  511  static enum link_training_res=
ult dpia_training_eq_non_transparent(struct dc_link *link,
847a9038c2d025b Jimmy Kizito 2021-04-19  512  		struct link_training_settin=
gs *lt_settings,
847a9038c2d025b Jimmy Kizito 2021-04-19  513  		uint32_t hop)
847a9038c2d025b Jimmy Kizito 2021-04-19  514  {
847a9038c2d025b Jimmy Kizito 2021-04-19  515  	enum link_training_result re=
sult =3D LINK_TRAINING_EQ_FAIL_EQ;
847a9038c2d025b Jimmy Kizito 2021-04-19  516  	uint8_t repeater_cnt =3D 0; =
/* Number of hops/repeaters in display path. */
847a9038c2d025b Jimmy Kizito 2021-04-19  517  	uint32_t retries_eq =3D 0;
847a9038c2d025b Jimmy Kizito 2021-04-19  518  	enum dc_status status;
847a9038c2d025b Jimmy Kizito 2021-04-19  519  	enum dc_dp_training_pattern =
tr_pattern;
847a9038c2d025b Jimmy Kizito 2021-04-19  520  	uint32_t wait_time_microsec;
847a9038c2d025b Jimmy Kizito 2021-04-19  521  	struct link_training_setting=
s req_settings;
847a9038c2d025b Jimmy Kizito 2021-04-19  522  	enum dc_lane_count lane_coun=
t =3D lt_settings->link_settings.lane_count;
847a9038c2d025b Jimmy Kizito 2021-04-19  523  	union lane_align_status_upda=
ted dpcd_lane_status_updated =3D { {0} };
847a9038c2d025b Jimmy Kizito 2021-04-19  524  	union lane_status dpcd_lane_=
status[LANE_COUNT_DP_MAX] =3D { { {0} } };
847a9038c2d025b Jimmy Kizito 2021-04-19  525  	uint8_t set_cfg_data;
847a9038c2d025b Jimmy Kizito 2021-04-19  526  	enum dpia_set_config_ts ts;
847a9038c2d025b Jimmy Kizito 2021-04-19  527  =

847a9038c2d025b Jimmy Kizito 2021-04-19  528  	/* Training pattern is TPS4 =
for repeater;
847a9038c2d025b Jimmy Kizito 2021-04-19  529  	 * TPS2/3/4 for DPRX dependi=
ng on what it supports.
847a9038c2d025b Jimmy Kizito 2021-04-19  530  	 */
847a9038c2d025b Jimmy Kizito 2021-04-19  531  	if (hop =3D=3D DPRX)
847a9038c2d025b Jimmy Kizito 2021-04-19  532  		tr_pattern =3D lt_settings-=
>pattern_for_eq;
847a9038c2d025b Jimmy Kizito 2021-04-19  533  	else
847a9038c2d025b Jimmy Kizito 2021-04-19  534  		tr_pattern =3D DP_TRAINING_=
PATTERN_SEQUENCE_4;
847a9038c2d025b Jimmy Kizito 2021-04-19  535  =

847a9038c2d025b Jimmy Kizito 2021-04-19  536  	repeater_cnt =3D dp_convert_=
to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
847a9038c2d025b Jimmy Kizito 2021-04-19  537  =

847a9038c2d025b Jimmy Kizito 2021-04-19  538  	for (retries_eq =3D 0; retri=
es_eq < LINK_TRAINING_MAX_RETRY_COUNT; retries_eq++) {
847a9038c2d025b Jimmy Kizito 2021-04-19  539  		/* DPTX-to-DPIA equalizatio=
n always successful. */
847a9038c2d025b Jimmy Kizito 2021-04-19  540  		if (hop =3D=3D repeater_cnt=
) {
847a9038c2d025b Jimmy Kizito 2021-04-19  541  			result =3D LINK_TRAINING_S=
UCCESS;
847a9038c2d025b Jimmy Kizito 2021-04-19  542  			break;
847a9038c2d025b Jimmy Kizito 2021-04-19  543  		}
847a9038c2d025b Jimmy Kizito 2021-04-19  544  =

847a9038c2d025b Jimmy Kizito 2021-04-19  545  		/* Instruct DPOA to transmi=
t TPSn then update DPCD. */
847a9038c2d025b Jimmy Kizito 2021-04-19  546  		if (retries_eq =3D=3D 0) {
847a9038c2d025b Jimmy Kizito 2021-04-19  547  			ts =3D convert_trng_ptn_to=
_trng_stg(tr_pattern);
847a9038c2d025b Jimmy Kizito 2021-04-19  548  			status =3D core_link_send_=
set_config(link,
847a9038c2d025b Jimmy Kizito 2021-04-19  549  					DPIA_SET_CFG_SET_TRAININ=
G,
847a9038c2d025b Jimmy Kizito 2021-04-19  550  					ts);
847a9038c2d025b Jimmy Kizito 2021-04-19  551  			if (status !=3D DC_OK) {
847a9038c2d025b Jimmy Kizito 2021-04-19  552  				result =3D LINK_TRAINING_=
ABORT;
847a9038c2d025b Jimmy Kizito 2021-04-19  553  				break;
847a9038c2d025b Jimmy Kizito 2021-04-19  554  			}
847a9038c2d025b Jimmy Kizito 2021-04-19  555  			status =3D dpcd_set_lt_pat=
tern(link, tr_pattern, hop);
847a9038c2d025b Jimmy Kizito 2021-04-19  556  			if (status !=3D DC_OK) {
847a9038c2d025b Jimmy Kizito 2021-04-19  557  				result =3D LINK_TRAINING_=
ABORT;
847a9038c2d025b Jimmy Kizito 2021-04-19  558  				break;
847a9038c2d025b Jimmy Kizito 2021-04-19  559  			}
847a9038c2d025b Jimmy Kizito 2021-04-19  560  		}
847a9038c2d025b Jimmy Kizito 2021-04-19  561  =

847a9038c2d025b Jimmy Kizito 2021-04-19  562  		/* Update DPOA drive settin=
gs then DPCD. DPOA only adjusts
847a9038c2d025b Jimmy Kizito 2021-04-19  563  		 * drive settings for hop i=
mmediately downstream.
847a9038c2d025b Jimmy Kizito 2021-04-19  564  		 */
847a9038c2d025b Jimmy Kizito 2021-04-19  565  		if (hop =3D=3D repeater_cnt=
 - 1) {
847a9038c2d025b Jimmy Kizito 2021-04-19  566  			set_cfg_data =3D dpia_buil=
d_set_config_data(DPIA_SET_CFG_SET_VSPE,
847a9038c2d025b Jimmy Kizito 2021-04-19  567  								  link,
847a9038c2d025b Jimmy Kizito 2021-04-19  568  								  lt_settings);
847a9038c2d025b Jimmy Kizito 2021-04-19  569  			status =3D core_link_send_=
set_config(link,
847a9038c2d025b Jimmy Kizito 2021-04-19  570  							   DPIA_SET_CFG_SET_VS=
PE,
847a9038c2d025b Jimmy Kizito 2021-04-19  571  							   set_cfg_data);
847a9038c2d025b Jimmy Kizito 2021-04-19  572  			if (status !=3D DC_OK) {
847a9038c2d025b Jimmy Kizito 2021-04-19  573  				result =3D LINK_TRAINING_=
ABORT;
847a9038c2d025b Jimmy Kizito 2021-04-19  574  				break;
847a9038c2d025b Jimmy Kizito 2021-04-19  575  			}
847a9038c2d025b Jimmy Kizito 2021-04-19  576  		}
847a9038c2d025b Jimmy Kizito 2021-04-19  577  		status =3D dpcd_set_lane_se=
ttings(link, lt_settings, hop);
847a9038c2d025b Jimmy Kizito 2021-04-19  578  		if (status !=3D DC_OK) {
847a9038c2d025b Jimmy Kizito 2021-04-19  579  			result =3D LINK_TRAINING_A=
BORT;
847a9038c2d025b Jimmy Kizito 2021-04-19  580  			break;
847a9038c2d025b Jimmy Kizito 2021-04-19  581  		}
847a9038c2d025b Jimmy Kizito 2021-04-19  582  =

847a9038c2d025b Jimmy Kizito 2021-04-19  583  		/* Extend wait time on seco=
nd equalisation attempt on final hop to
847a9038c2d025b Jimmy Kizito 2021-04-19  584  		 * ensure clock sync packet=
s have been sent.
847a9038c2d025b Jimmy Kizito 2021-04-19  585  		 */
847a9038c2d025b Jimmy Kizito 2021-04-19  586  		if (hop =3D=3D DPRX && retr=
ies_eq =3D=3D 1)
847a9038c2d025b Jimmy Kizito 2021-04-19 @587  			wait_time_microsec =3D max=
(wait_time_microsec, (uint32_t)DPIA_CLK_SYNC_DELAY);
847a9038c2d025b Jimmy Kizito 2021-04-19  588  		else
847a9038c2d025b Jimmy Kizito 2021-04-19  589  			wait_time_microsec =3D dpi=
a_get_eq_aux_rd_interval(link, lt_settings, hop);
847a9038c2d025b Jimmy Kizito 2021-04-19  590  =

847a9038c2d025b Jimmy Kizito 2021-04-19  591  		dp_wait_for_training_aux_rd=
_interval(link, wait_time_microsec);
847a9038c2d025b Jimmy Kizito 2021-04-19  592  =

847a9038c2d025b Jimmy Kizito 2021-04-19  593  		/* Read status and adjustme=
nt requests from DPCD. */
847a9038c2d025b Jimmy Kizito 2021-04-19  594  		status =3D dp_get_lane_stat=
us_and_drive_settings(link,
847a9038c2d025b Jimmy Kizito 2021-04-19  595  				lt_settings,
847a9038c2d025b Jimmy Kizito 2021-04-19  596  				dpcd_lane_status,
847a9038c2d025b Jimmy Kizito 2021-04-19  597  				&dpcd_lane_status_updated,
847a9038c2d025b Jimmy Kizito 2021-04-19  598  				&req_settings,
847a9038c2d025b Jimmy Kizito 2021-04-19  599  				hop);
847a9038c2d025b Jimmy Kizito 2021-04-19  600  		if (status !=3D DC_OK) {
847a9038c2d025b Jimmy Kizito 2021-04-19  601  			result =3D LINK_TRAINING_A=
BORT;
847a9038c2d025b Jimmy Kizito 2021-04-19  602  			break;
847a9038c2d025b Jimmy Kizito 2021-04-19  603  		}
847a9038c2d025b Jimmy Kizito 2021-04-19  604  =

847a9038c2d025b Jimmy Kizito 2021-04-19  605  		/* CR can still fail during=
 EQ phase. Fail training if CR fails. */
847a9038c2d025b Jimmy Kizito 2021-04-19  606  		if (!dp_is_cr_done(lane_cou=
nt, dpcd_lane_status)) {
847a9038c2d025b Jimmy Kizito 2021-04-19  607  			result =3D LINK_TRAINING_E=
Q_FAIL_CR;
847a9038c2d025b Jimmy Kizito 2021-04-19  608  			break;
847a9038c2d025b Jimmy Kizito 2021-04-19  609  		}
847a9038c2d025b Jimmy Kizito 2021-04-19  610  =

847a9038c2d025b Jimmy Kizito 2021-04-19  611  		if (dp_is_ch_eq_done(lane_c=
ount, dpcd_lane_status) &&
847a9038c2d025b Jimmy Kizito 2021-04-19  612  		    dp_is_symbol_locked(lin=
k->cur_link_settings.lane_count, dpcd_lane_status) &&
847a9038c2d025b Jimmy Kizito 2021-04-19  613  		    dp_is_interlane_aligned=
(dpcd_lane_status_updated)) {
847a9038c2d025b Jimmy Kizito 2021-04-19  614  			result =3D  LINK_TRAINING_=
SUCCESS;
847a9038c2d025b Jimmy Kizito 2021-04-19  615  			break;
847a9038c2d025b Jimmy Kizito 2021-04-19  616  		}
847a9038c2d025b Jimmy Kizito 2021-04-19  617  =

847a9038c2d025b Jimmy Kizito 2021-04-19  618  		/* Update VS/PE. */
847a9038c2d025b Jimmy Kizito 2021-04-19  619  		dp_update_drive_settings(lt=
_settings, req_settings);
847a9038c2d025b Jimmy Kizito 2021-04-19  620  	}
847a9038c2d025b Jimmy Kizito 2021-04-19  621  =

847a9038c2d025b Jimmy Kizito 2021-04-19  622  	/* Abort link training if eq=
ualization failed due to HPD unplug. */
847a9038c2d025b Jimmy Kizito 2021-04-19  623  	if (!link->hpd_status)
847a9038c2d025b Jimmy Kizito 2021-04-19  624  		result =3D LINK_TRAINING_AB=
ORT;
847a9038c2d025b Jimmy Kizito 2021-04-19  625  =

847a9038c2d025b Jimmy Kizito 2021-04-19  626  	DC_LOG_HW_LINK_TRAINING("%s\=
n DPIA(%d) equalization\n"
847a9038c2d025b Jimmy Kizito 2021-04-19  627  		" - hop(%d)\n - result(%d)\=
n - retries(%d)\n",
847a9038c2d025b Jimmy Kizito 2021-04-19  628  		__func__,
847a9038c2d025b Jimmy Kizito 2021-04-19  629  		link->link_id.enum_id - ENU=
M_ID_1,
847a9038c2d025b Jimmy Kizito 2021-04-19  630  		hop,
847a9038c2d025b Jimmy Kizito 2021-04-19  631  		result,
847a9038c2d025b Jimmy Kizito 2021-04-19  632  		retries_eq);
847a9038c2d025b Jimmy Kizito 2021-04-19  633  =

847a9038c2d025b Jimmy Kizito 2021-04-19  634  	return result;
847a9038c2d025b Jimmy Kizito 2021-04-19  635  }
847a9038c2d025b Jimmy Kizito 2021-04-19  636  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0979372412771032571==--

