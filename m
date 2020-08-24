Content-Type: multipart/mixed; boundary="===============6043697707673135545=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c:856:13: warning: Variable 'bp_result' is reassigned a value before the old one has been used.
Date: Tue, 25 Aug 2020 02:10:54 +0800
Message-ID: <202008250246.ypI5Zmkd%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6043697707673135545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chris Park <Chris.Park@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d012a7190fc1fd72ed48911e77ca97ba4521bccd
commit: 5dea2142a86d9aafca07f1318851fb729577f03a drm/amd/display: Call DMUB=
 for eDP power control
date:   6 days ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 days ago
compiler: alpha-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dc=
e110_hw_sequencer.c:
>> drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c:856:13: warn=
ing: Variable 'bp_result' is reassigned a value before the old one has been=
 used. [redundantAssignment]
     bp_result =3D link_transmitter_control(ctx->dc_bios, &cntl);
               ^
   drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c:849:15: note=
: Variable 'bp_result' is reassigned a value before the old one has been us=
ed.
       bp_result =3D ctx->dc_bios->funcs->enable_lvtma_control(ctx->dc_bios,
                 ^
   drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c:856:13: note=
: Variable 'bp_result' is reassigned a value before the old one has been us=
ed.
     bp_result =3D link_transmitter_control(ctx->dc_bios, &cntl);
               ^
>> drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c:856:13: warn=
ing: Variable 'bp_result' is reassigned a value before the old one has been=
 used. [redundantAssignment]
     bp_result =3D link_transmitter_control(ctx->dc_bios, &cntl);
               ^
   drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c:852:15: note=
: Variable 'bp_result' is reassigned a value before the old one has been us=
ed.
       bp_result =3D ctx->dc_bios->funcs->enable_lvtma_control(ctx->dc_bios,
                 ^
   drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c:856:13: note=
: Variable 'bp_result' is reassigned a value before the old one has been us=
ed.
     bp_result =3D link_transmitter_control(ctx->dc_bios, &cntl);
               ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D5dea2142a86d9aafca07f1318851fb729577f03a
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 5dea2142a86d9aafca07f1318851fb729577f03a
vim +/bp_result +856 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequen=
cer.c

8740196935625d Andrew Jiang      2017-09-25  783  =

8a31820b12187c Martin Leung      2019-07-09  784  void dce110_edp_power_con=
trol(
069d418f412ec4 Andrew Jiang      2017-09-26  785  		struct dc_link *link,
8740196935625d Andrew Jiang      2017-09-25  786  		bool power_up)
8740196935625d Andrew Jiang      2017-09-25  787  {
069d418f412ec4 Andrew Jiang      2017-09-26  788  	struct dc_context *ctx =
=3D link->ctx;
8740196935625d Andrew Jiang      2017-09-25  789  	struct bp_transmitter_co=
ntrol cntl =3D { 0 };
8740196935625d Andrew Jiang      2017-09-25  790  	enum bp_result bp_result;
8740196935625d Andrew Jiang      2017-09-25  791  =

8740196935625d Andrew Jiang      2017-09-25  792  =

069d418f412ec4 Andrew Jiang      2017-09-26  793  	if (dal_graphics_object_=
id_get_connector_id(link->link_enc->connector)
8740196935625d Andrew Jiang      2017-09-25  794  			!=3D CONNECTOR_ID_EDP)=
 {
8740196935625d Andrew Jiang      2017-09-25  795  		BREAK_TO_DEBUGGER();
8740196935625d Andrew Jiang      2017-09-25  796  		return;
8740196935625d Andrew Jiang      2017-09-25  797  	}
8740196935625d Andrew Jiang      2017-09-25  798  =

ffadb9d6520843 Anthony Koo       2020-04-17  799  	if (!link->panel_cntl)
904fb6e0f4e815 Anthony Koo       2020-03-28  800  		return;
904fb6e0f4e815 Anthony Koo       2020-03-28  801  =

d4caa72e275c19 Anthony Koo       2020-04-08  802  	if (power_up !=3D
d4caa72e275c19 Anthony Koo       2020-04-08  803  		link->panel_cntl->funcs=
->is_panel_powered_on(link->panel_cntl)) {
8740196935625d Andrew Jiang      2017-09-25  804  		/* Send VBIOS command t=
o prompt eDP panel power */
78d5d04d118d55 Charlene Liu      2018-03-20  805  		if (power_up) {
78d5d04d118d55 Charlene Liu      2018-03-20  806  			unsigned long long cur=
rent_ts =3D dm_get_timestamp(ctx);
78d5d04d118d55 Charlene Liu      2018-03-20  807  			unsigned long long dur=
ation_in_ms =3D
93ed1814c668fb Hugo Hu           2018-06-18  808  					div64_u64(dm_get_ela=
pse_time_in_ns(
78d5d04d118d55 Charlene Liu      2018-03-20  809  							ctx,
78d5d04d118d55 Charlene Liu      2018-03-20  810  							current_ts,
93ed1814c668fb Hugo Hu           2018-06-18  811  							link->link_trace.t=
ime_stamp.edp_poweroff), 1000000);
78d5d04d118d55 Charlene Liu      2018-03-20  812  			unsigned long long wai=
t_time_ms =3D 0;
78d5d04d118d55 Charlene Liu      2018-03-20  813  =

78d5d04d118d55 Charlene Liu      2018-03-20  814  			/* max 500ms from LCDV=
DD off to on */
6c4fff068f7940 Yue Hin Lau       2018-06-27  815  			unsigned long long edp=
_poweroff_time_ms =3D 500;
ff58798725ba9c Hugo Hu           2018-06-15  816  =

6c4fff068f7940 Yue Hin Lau       2018-06-27  817  			if (link->local_sink !=
=3D NULL)
6c4fff068f7940 Yue Hin Lau       2018-06-27  818  				edp_poweroff_time_ms =
=3D
6c4fff068f7940 Yue Hin Lau       2018-06-27  819  						500 + link->local_s=
ink->edid_caps.panel_patch.extra_t12_ms;
78d5d04d118d55 Charlene Liu      2018-03-20  820  			if (link->link_trace.t=
ime_stamp.edp_poweroff =3D=3D 0)
ff58798725ba9c Hugo Hu           2018-06-15  821  				wait_time_ms =3D edp_=
poweroff_time_ms;
ff58798725ba9c Hugo Hu           2018-06-15  822  			else if (duration_in_m=
s < edp_poweroff_time_ms)
ff58798725ba9c Hugo Hu           2018-06-15  823  				wait_time_ms =3D edp_=
poweroff_time_ms - duration_in_ms;
78d5d04d118d55 Charlene Liu      2018-03-20  824  =

78d5d04d118d55 Charlene Liu      2018-03-20  825  			if (wait_time_ms) {
78d5d04d118d55 Charlene Liu      2018-03-20  826  				msleep(wait_time_ms);
78d5d04d118d55 Charlene Liu      2018-03-20  827  				dm_output_to_console(=
"%s: wait %lld ms to power on eDP.\n",
78d5d04d118d55 Charlene Liu      2018-03-20  828  						__func__, wait_time=
_ms);
78d5d04d118d55 Charlene Liu      2018-03-20  829  			}
78d5d04d118d55 Charlene Liu      2018-03-20  830  =

78d5d04d118d55 Charlene Liu      2018-03-20  831  		}
8740196935625d Andrew Jiang      2017-09-25  832  =

1296423bf23c7a Bhawanpreet Lakha 2018-02-20  833  		DC_LOG_HW_RESUME_S3(
8740196935625d Andrew Jiang      2017-09-25  834  				"%s: Panel Power acti=
on: %s\n",
8740196935625d Andrew Jiang      2017-09-25  835  				__func__, (power_up ?=
 "On":"Off"));
8740196935625d Andrew Jiang      2017-09-25  836  =

8740196935625d Andrew Jiang      2017-09-25  837  		cntl.action =3D power_u=
p ?
8740196935625d Andrew Jiang      2017-09-25  838  			TRANSMITTER_CONTROL_PO=
WER_ON :
8740196935625d Andrew Jiang      2017-09-25  839  			TRANSMITTER_CONTROL_PO=
WER_OFF;
069d418f412ec4 Andrew Jiang      2017-09-26  840  		cntl.transmitter =3D li=
nk->link_enc->transmitter;
069d418f412ec4 Andrew Jiang      2017-09-26  841  		cntl.connector_obj_id =
=3D link->link_enc->connector;
8740196935625d Andrew Jiang      2017-09-25  842  		cntl.coherent =3D false;
8740196935625d Andrew Jiang      2017-09-25  843  		cntl.lanes_number =3D L=
ANE_COUNT_FOUR;
069d418f412ec4 Andrew Jiang      2017-09-26  844  		cntl.hpd_sel =3D link->=
link_enc->hpd_source;
5dea2142a86d9a Chris Park        2020-08-05  845  =

5dea2142a86d9a Chris Park        2020-08-05  846  		if (ctx->dc->ctx->dmub_=
srv &&
5dea2142a86d9a Chris Park        2020-08-05  847  				ctx->dc->debug.dmub_c=
ommand_table) {
5dea2142a86d9a Chris Park        2020-08-05  848  			if (cntl.action =3D=3D=
 TRANSMITTER_CONTROL_POWER_ON)
5dea2142a86d9a Chris Park        2020-08-05  849  				bp_result =3D ctx->dc=
_bios->funcs->enable_lvtma_control(ctx->dc_bios,
5dea2142a86d9a Chris Park        2020-08-05  850  						LVTMA_CONTROL_POWER=
_ON);
5dea2142a86d9a Chris Park        2020-08-05  851  			else
5dea2142a86d9a Chris Park        2020-08-05  852  				bp_result =3D ctx->dc=
_bios->funcs->enable_lvtma_control(ctx->dc_bios,
5dea2142a86d9a Chris Park        2020-08-05  853  						LVTMA_CONTROL_POWER=
_OFF);
5dea2142a86d9a Chris Park        2020-08-05  854  		}
5dea2142a86d9a Chris Park        2020-08-05  855  =

8740196935625d Andrew Jiang      2017-09-25 @856  		bp_result =3D link_tran=
smitter_control(ctx->dc_bios, &cntl);
8740196935625d Andrew Jiang      2017-09-25  857  =

78d5d04d118d55 Charlene Liu      2018-03-20  858  		if (!power_up)
78d5d04d118d55 Charlene Liu      2018-03-20  859  			/*save driver power of=
f time stamp*/
78d5d04d118d55 Charlene Liu      2018-03-20  860  			link->link_trace.time_=
stamp.edp_poweroff =3D dm_get_timestamp(ctx);
78d5d04d118d55 Charlene Liu      2018-03-20  861  		else
78d5d04d118d55 Charlene Liu      2018-03-20  862  			link->link_trace.time_=
stamp.edp_poweron =3D dm_get_timestamp(ctx);
78d5d04d118d55 Charlene Liu      2018-03-20  863  =

8740196935625d Andrew Jiang      2017-09-25  864  		if (bp_result !=3D BP_R=
ESULT_OK)
1296423bf23c7a Bhawanpreet Lakha 2018-02-20  865  			DC_LOG_ERROR(
8740196935625d Andrew Jiang      2017-09-25  866  					"%s: Panel Power bp_=
result: %d\n",
8740196935625d Andrew Jiang      2017-09-25  867  					__func__, bp_result);
8740196935625d Andrew Jiang      2017-09-25  868  	} else {
1296423bf23c7a Bhawanpreet Lakha 2018-02-20  869  		DC_LOG_HW_RESUME_S3(
8740196935625d Andrew Jiang      2017-09-25  870  				"%s: Skipping Panel P=
ower action: %s\n",
8740196935625d Andrew Jiang      2017-09-25  871  				__func__, (power_up ?=
 "On":"Off"));
8740196935625d Andrew Jiang      2017-09-25  872  	}
8740196935625d Andrew Jiang      2017-09-25  873  }
5eefbc40173644 Yue Hin Lau       2017-09-15  874  =


:::::: The code at line 856 was first introduced by commit
:::::: 8740196935625dfb171ab115120315060e4a8a41 drm/amd/display: Move power=
 control from link encoder to hwsequencer

:::::: TO: Andrew Jiang <Andrew.Jiang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6043697707673135545==--

