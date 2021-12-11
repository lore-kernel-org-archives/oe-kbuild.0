Content-Type: multipart/mixed; boundary="===============4556361858326756370=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hwseq.c:765 dcn30_apply_idle_power_optimizations() error: we previously assumed 'stream' could be null (see line 749)
Date: Sun, 12 Dec 2021 02:19:10 +0800
Message-ID: <202112120210.IMVuMFg2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4556361858326756370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Joshua Aberback <joshua.aberback@amd.com>
CC: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6f513529296fd4f696afb4354c46508abe646541
commit: ea7154d8d9fb26129f51e4d763febe97a13228a5 drm/amd/display: Update dc=
n30_apply_idle_power_optimizations() code
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-m001-20211207 (https://download.01.org/0day-ci/ar=
chive/20211212/202112120210.IMVuMFg2-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hwseq.c:765 dcn30_appl=
y_idle_power_optimizations() error: we previously assumed 'stream' could be=
 null (see line 749)
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hwseq.c:767 dcn30_appl=
y_idle_power_optimizations() error: we previously assumed 'plane' could be =
null (see line 749)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hwseq.c:483 dcn30_init=
_hw() warn: variable dereferenced before check 'res_pool->dccg' (see line 4=
35)
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hwseq.c:636 dcn30_init=
_hw() error: we previously assumed 'dc->clk_mgr' could be null (see line 43=
1)

vim +/stream +765 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hwse=
q.c

d99f13878d6f9c Bhawanpreet Lakha 2020-05-21  709  =

d99f13878d6f9c Bhawanpreet Lakha 2020-05-21  710  bool dcn30_apply_idle_pow=
er_optimizations(struct dc *dc, bool enable)
d99f13878d6f9c Bhawanpreet Lakha 2020-05-21  711  {
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  712  	union dmub_rb_cmd cmd;
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  713  	uint32_t tmr_delay =3D 0=
, tmr_scale =3D 0;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  714  	struct dc_cursor_attribu=
tes cursor_attr;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  715  	bool cursor_cache_enable=
 =3D false;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  716  	struct dc_stream_state *=
stream =3D NULL;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  717  	struct dc_plane_state *p=
lane =3D NULL;
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  718  =

d99f13878d6f9c Bhawanpreet Lakha 2020-05-21  719  	if (!dc->ctx->dmub_srv)
d99f13878d6f9c Bhawanpreet Lakha 2020-05-21  720  		return false;
d99f13878d6f9c Bhawanpreet Lakha 2020-05-21  721  =

d99f13878d6f9c Bhawanpreet Lakha 2020-05-21  722  	if (enable) {
48e48e59847821 Zhan Liu          2020-08-28  723  		if (dc->current_state) {
48e48e59847821 Zhan Liu          2020-08-28  724  			int i;
48e48e59847821 Zhan Liu          2020-08-28  725  =

48e48e59847821 Zhan Liu          2020-08-28  726  			/* First, check no-mem=
ory-requests case */
48e48e59847821 Zhan Liu          2020-08-28  727  			for (i =3D 0; i < dc->=
current_state->stream_count; i++) {
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  728  				if (dc->current_state=
->stream_status[i].plane_count)
48e48e59847821 Zhan Liu          2020-08-28  729  					/* Fail eligibility =
on a visible stream */
48e48e59847821 Zhan Liu          2020-08-28  730  					break;
48e48e59847821 Zhan Liu          2020-08-28  731  			}
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  732  =

ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  733  			if (i =3D=3D dc->curre=
nt_state->stream_count) {
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  734  				/* Enable no-memory-r=
equests case */
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  735  				memset(&cmd, 0, sizeo=
f(cmd));
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  736  				cmd.mall.header.type =
=3D DMUB_CMD__MALL;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  737  				cmd.mall.header.sub_t=
ype =3D DMUB_CMD__MALL_ACTION_NO_DF_REQ;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  738  				cmd.mall.header.paylo=
ad_bytes =3D sizeof(cmd.mall) - sizeof(cmd.mall.header);
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  739  =

ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  740  				dc_dmub_srv_cmd_queue=
(dc->ctx->dmub_srv, &cmd);
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  741  				dc_dmub_srv_cmd_execu=
te(dc->ctx->dmub_srv);
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  742  =

ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  743  				return true;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  744  			}
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  745  =

ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  746  			stream =3D dc->current=
_state->streams[0];
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  747  			plane =3D (stream ? dc=
->current_state->stream_status[0].plane_states[0] : NULL);
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  748  =

ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19 @749  			if (stream && plane) {
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  750  				cursor_cache_enable =
=3D stream->cursor_position.enable &&
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  751  						plane->address.grph=
.cursor_cache_addr.quad_part;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  752  				cursor_attr =3D strea=
m->cursor_attributes;
a87a9a73d0e283 Alex Deucher      2020-10-26  753  			}
a87a9a73d0e283 Alex Deucher      2020-10-26  754  =

ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  755  			/*
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  756  			 * Second, check MALL =
eligibility
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  757  			 *
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  758  			 * single display only=
, single surface only, 8 and 16 bit formats only, no VM,
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  759  			 * do not use MALL for=
 displays that support PSR as they use D0i3.2 in DMCUB FW
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  760  			 *
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  761  			 * TODO: When we imple=
ment multi-display, PSR displays will be allowed if there is
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  762  			 * a non-PSR display p=
resent, since in that case we can't do D0i3.2
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  763  			 */
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  764  			if (dc->current_state-=
>stream_count =3D=3D 1 &&
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19 @765  					stream->link->psr_se=
ttings.psr_version =3D=3D DC_PSR_VERSION_UNSUPPORTED &&
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  766  					dc->current_state->s=
tream_status[0].plane_count =3D=3D 1 &&
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19 @767  					plane->format <=3D S=
URFACE_PIXEL_FORMAT_GRPH_ABGR16161616F &&
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  768  					plane->format >=3D S=
URFACE_PIXEL_FORMAT_GRPH_ARGB8888 &&
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  769  					plane->address.page_=
table_base.quad_part =3D=3D 0 &&
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  770  					dc->hwss.does_plane_=
fit_in_mall &&
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  771  					dc->hwss.does_plane_=
fit_in_mall(dc, plane,
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  772  							cursor_cache_enabl=
e ? &cursor_attr : NULL)) {
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  773  				unsigned int v_total =
=3D stream->adjust.v_total_max ?
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  774  						stream->adjust.v_to=
tal_max : stream->timing.v_total;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  775  				unsigned int refresh_=
hz =3D (unsigned long long) stream->timing.pix_clk_100hz *
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  776  						100LL /	(v_total * =
stream->timing.h_total);
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  777  =

52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  778  				/*
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  779  				 * one frame time in =
microsec:
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  780  				 * Delay_Us =3D 10000=
00 / refresh
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  781  				 * dynamic_delay_us =
=3D 1000000 / refresh + 2 * stutter_period
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  782  				 *
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  783  				 * one frame time mod=
ified by 'additional timer percent' (p):
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  784  				 * Delay_Us_modified =
=3D dynamic_delay_us + dynamic_delay_us * p / 100
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  785  				 *                   =
=3D dynamic_delay_us * (1 + p / 100)
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  786  				 *                   =
=3D (1000000 / refresh + 2 * stutter_period) * (100 + p) / 100
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  787  				 *                   =
=3D (1000000 + 2 * stutter_period * refresh) * (100 + p) / (100 * refresh)
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  788  				 *
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  789  				 * formula for timer =
duration based on parameters, from regspec:
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  790  				 * dynamic_delay_us =
=3D 65.28 * (64 + MallFrameCacheTmrDly) * 2^MallFrameCacheTmrScale
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  791  				 *
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  792  				 * dynamic_delay_us /=
 65.28 =3D (64 + MallFrameCacheTmrDly) * 2^MallFrameCacheTmrScale
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  793  				 * (dynamic_delay_us =
/ 65.28) / 2^MallFrameCacheTmrScale =3D 64 + MallFrameCacheTmrDly
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  794  				 * MallFrameCacheTmrD=
ly =3D ((dynamic_delay_us / 65.28) / 2^MallFrameCacheTmrScale) - 64
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  795  				 *                   =
   =3D (1000000 + 2 * stutter_period * refresh) * (100 + p) / (100 * refres=
h) / 65.28 / 2^MallFrameCacheTmrScale - 64
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  796  				 *                   =
   =3D (1000000 + 2 * stutter_period * refresh) * (100 + p) / (refresh * 65=
28 * 2^MallFrameCacheTmrScale) - 64
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  797  				 *
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  798  				 * need to round up t=
he result of the division before the subtraction
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  799  				 */
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  800  				unsigned int denom =
=3D refresh_hz * 6528;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  801  				unsigned int stutter_=
period =3D dc->current_state->perf_params.stutter_period_us;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  802  =

ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  803  				tmr_delay =3D (((1000=
000LL + 2 * stutter_period * refresh_hz) *
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  804  						(100LL + dc->debug.=
mall_additional_timer_percent) + denom - 1) /
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  805  						denom) - 64LL;
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  806  =

52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  807  				/* scale should be in=
creased until it fits into 6 bits */
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  808  				while (tmr_delay & ~0=
x3F) {
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  809  					tmr_scale++;
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  810  =

52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  811  					if (tmr_scale > 3) {
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  812  						/* Delay exceeds ra=
nge of hysteresis timer */
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  813  						ASSERT(false);
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  814  						return false;
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  815  					}
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  816  =

52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  817  					denom *=3D 2;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  818  					tmr_delay =3D (((100=
0000LL + 2 * stutter_period * refresh_hz) *
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  819  							(100LL + dc->debug=
.mall_additional_timer_percent) + denom - 1) /
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  820  							denom) - 64LL;
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  821  				}
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  822  =

ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  823  				/* Copy HW cursor */
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  824  				if (cursor_cache_enab=
le) {
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  825  					memset(&cmd, 0, size=
of(cmd));
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  826  					cmd.mall.header.type=
 =3D DMUB_CMD__MALL;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  827  					cmd.mall.header.sub_=
type =3D DMUB_CMD__MALL_ACTION_COPY_CURSOR;
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  828  					cmd.mall.header.payl=
oad_bytes =3D
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  829  							sizeof(cmd.mall) -=
 sizeof(cmd.mall.header);
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  830  =

ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  831  					switch (cursor_attr.=
color_format) {
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  832  					case CURSOR_MODE_MON=
O:
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  833  						cmd.mall.cursor_bpp=
 =3D 2;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  834  						break;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  835  					case CURSOR_MODE_COL=
OR_1BIT_AND:
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  836  					case CURSOR_MODE_COL=
OR_PRE_MULTIPLIED_ALPHA:
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  837  					case CURSOR_MODE_COL=
OR_UN_PRE_MULTIPLIED_ALPHA:
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  838  						cmd.mall.cursor_bpp=
 =3D 32;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  839  						break;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  840  =

ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  841  					case CURSOR_MODE_COL=
OR_64BIT_FP_PRE_MULTIPLIED:
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  842  					case CURSOR_MODE_COL=
OR_64BIT_FP_UN_PRE_MULTIPLIED:
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  843  						cmd.mall.cursor_bpp=
 =3D 64;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  844  						break;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  845  					}
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  846  =

ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  847  					cmd.mall.cursor_copy=
_src.quad_part =3D cursor_attr.address.quad_part;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  848  					cmd.mall.cursor_copy=
_dst.quad_part =3D
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  849  							plane->address.grp=
h.cursor_cache_addr.quad_part;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  850  					cmd.mall.cursor_widt=
h =3D cursor_attr.width;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  851  					cmd.mall.cursor_heig=
ht =3D cursor_attr.height;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  852  					cmd.mall.cursor_pitc=
h =3D cursor_attr.pitch;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  853  =

ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  854  					dc_dmub_srv_cmd_queu=
e(dc->ctx->dmub_srv, &cmd);
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  855  					dc_dmub_srv_cmd_exec=
ute(dc->ctx->dmub_srv);
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  856  					dc_dmub_srv_wait_idl=
e(dc->ctx->dmub_srv);
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  857  =

ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  858  					/* Use copied cursor=
, and it's okay to not switch back */
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  859  					cursor_attr.address.=
quad_part =3D
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  860  							plane->address.grp=
h.cursor_cache_addr.quad_part;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  861  					dc_stream_set_cursor=
_attributes(stream, &cursor_attr);
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  862  				}
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  863  =

ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  864  				/* Enable MALL */
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  865  				memset(&cmd, 0, sizeo=
f(cmd));
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  866  				cmd.mall.header.type =
=3D DMUB_CMD__MALL;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  867  				cmd.mall.header.sub_t=
ype =3D DMUB_CMD__MALL_ACTION_ALLOW;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  868  				cmd.mall.header.paylo=
ad_bytes =3D sizeof(cmd.mall) - sizeof(cmd.mall.header);
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  869  				cmd.mall.tmr_delay =
=3D tmr_delay;
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  870  				cmd.mall.tmr_scale =
=3D tmr_scale;
ea7154d8d9fb26 Bhawanpreet Lakha 2021-01-19  871  				cmd.mall.debug_bits =
=3D dc->debug.mall_error_as_fatal;
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  872  =

52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  873  				dc_dmub_srv_cmd_queue=
(dc->ctx->dmub_srv, &cmd);
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  874  				dc_dmub_srv_cmd_execu=
te(dc->ctx->dmub_srv);
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  875  =

52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  876  				return true;
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  877  			}
d99f13878d6f9c Bhawanpreet Lakha 2020-05-21  878  		}
d99f13878d6f9c Bhawanpreet Lakha 2020-05-21  879  =

48e48e59847821 Zhan Liu          2020-08-28  880  		/* No applicable optimi=
zations */
d99f13878d6f9c Bhawanpreet Lakha 2020-05-21  881  		return false;
d99f13878d6f9c Bhawanpreet Lakha 2020-05-21  882  	}
d99f13878d6f9c Bhawanpreet Lakha 2020-05-21  883  =

52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  884  	/* Disable MALL */
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  885  	memset(&cmd, 0, sizeof(c=
md));
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  886  	cmd.mall.header.type =3D=
 DMUB_CMD__MALL;
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  887  	cmd.mall.header.sub_type=
 =3D DMUB_CMD__MALL_ACTION_DISALLOW;
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  888  	cmd.mall.header.payload_=
bytes =3D
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  889  		sizeof(cmd.mall) - size=
of(cmd.mall.header);
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  890  =

52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  891  	dc_dmub_srv_cmd_queue(dc=
->ctx->dmub_srv, &cmd);
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  892  	dc_dmub_srv_cmd_execute(=
dc->ctx->dmub_srv);
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  893  	dc_dmub_srv_wait_idle(dc=
->ctx->dmub_srv);
52f2e83e2fe559 Bhawanpreet Lakha 2020-05-29  894  =

d99f13878d6f9c Bhawanpreet Lakha 2020-05-21  895  	return true;
d99f13878d6f9c Bhawanpreet Lakha 2020-05-21  896  }
3e19095534caec Joshua Aberback   2020-04-29  897  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4556361858326756370==--

