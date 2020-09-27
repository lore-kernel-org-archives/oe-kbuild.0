Content-Type: multipart/mixed; boundary="===============4351945184186221633=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c:856:13: warning: Variable 'bp_result' is reassigned a value before the old one has been used.
Date: Sun, 27 Sep 2020 11:57:07 +0800
Message-ID: <202009271102.Z7CHr0Aa%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4351945184186221633==
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
head:   a1bffa48745afbb54cb4f873bba783b2ae8be042
commit: 5dea2142a86d9aafca07f1318851fb729577f03a drm/amd/display: Call DMUB=
 for eDP power control
date:   6 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 weeks ago
compiler: hppa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   In file included from drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/vega=
20_hwmgr.c:
>> drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:2107:9: warning: Iden=
tical condition 'ret', second condition is always false [identicalCondition=
AfterEarlyExit]
    return ret;
           ^
   drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:2098:6: note: first c=
ondition
    if (ret)
        ^
   drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:2107:9: note: second =
condition
    return ret;
           ^
>> drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:3198:10: warning: %ll=
x in format string (no. 1) requires 'unsigned long long' but the argument t=
ype is 'unsigned long'. [invalidPrintfArgType_uint]
    size +=3D sprintf(buf + size, "Current ppfeatures: 0x%016llxn", feature=
s_enabled);
            ^
>> drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:3290:12: warning: %u =
in format string (no. 1) requires 'unsigned int' but the argument type is '=
signed int'. [invalidPrintfArgType_uint]
      size +=3D sprintf(buf + size, "0: %uMhz * (DPM disabled)n",
              ^
   drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:3308:12: warning: %u =
in format string (no. 1) requires 'unsigned int' but the argument type is '=
signed int'. [invalidPrintfArgType_uint]
      size +=3D sprintf(buf + size, "0: %uMhz * (DPM disabled)n",
              ^
   drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:3326:12: warning: %u =
in format string (no. 1) requires 'unsigned int' but the argument type is '=
signed int'. [invalidPrintfArgType_uint]
      size +=3D sprintf(buf + size, "0: %uMhz * (DPM disabled)n",
              ^
   drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:3356:12: warning: %u =
in format string (no. 1) requires 'unsigned int' but the argument type is '=
signed int'. [invalidPrintfArgType_uint]
      size +=3D sprintf(buf + size, "0: %uMhz * (DPM disabled)n",
              ^
   drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:3446:12: warning: %u =
in format string (no. 1) requires 'unsigned int' but the argument type is '=
signed int'. [invalidPrintfArgType_uint]
      size +=3D sprintf(buf + size, "SCLK: %7uMhz %10uMhzn",
              ^
   drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:3446:12: warning: %u =
in format string (no. 2) requires 'unsigned int' but the argument type is '=
signed int'. [invalidPrintfArgType_uint]
      size +=3D sprintf(buf + size, "SCLK: %7uMhz %10uMhzn",
              ^
   drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:3452:12: warning: %u =
in format string (no. 1) requires 'unsigned int' but the argument type is '=
signed int'. [invalidPrintfArgType_uint]
      size +=3D sprintf(buf + size, "MCLK: %7uMhz %10uMhzn",
              ^
   drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:3452:12: warning: %u =
in format string (no. 2) requires 'unsigned int' but the argument type is '=
signed int'. [invalidPrintfArgType_uint]
      size +=3D sprintf(buf + size, "MCLK: %7uMhz %10uMhzn",
              ^
   drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:3463:12: warning: %u =
in format string (no. 1) requires 'unsigned int' but the argument type is '=
signed int'. [invalidPrintfArgType_uint]
      size +=3D sprintf(buf + size, "VDDC_CURVE_SCLK[0]: %7uMhz %10uMhzn",
              ^
   drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:3463:12: warning: %u =
in format string (no. 2) requires 'unsigned int' but the argument type is '=
signed int'. [invalidPrintfArgType_uint]
      size +=3D sprintf(buf + size, "VDDC_CURVE_SCLK[0]: %7uMhz %10uMhzn",
              ^
   drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:3469:12: warning: %u =
in format string (no. 1) requires 'unsigned int' but the argument type is '=
signed int'. [invalidPrintfArgType_uint]
      size +=3D sprintf(buf + size, "VDDC_CURVE_SCLK[1]: %7uMhz %10uMhzn",
              ^
   drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:3469:12: warning: %u =
in format string (no. 2) requires 'unsigned int' but the argument type is '=
signed int'. [invalidPrintfArgType_uint]
      size +=3D sprintf(buf + size, "VDDC_CURVE_SCLK[1]: %7uMhz %10uMhzn",
              ^
   drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:3475:12: warning: %u =
in format string (no. 1) requires 'unsigned int' but the argument type is '=
signed int'. [invalidPrintfArgType_uint]
      size +=3D sprintf(buf + size, "VDDC_CURVE_SCLK[2]: %7uMhz %10uMhzn",
              ^
   drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:3475:12: warning: %u =
in format string (no. 2) requires 'unsigned int' but the argument type is '=
signed int'. [invalidPrintfArgType_uint]
      size +=3D sprintf(buf + size, "VDDC_CURVE_SCLK[2]: %7uMhz %10uMhzn",
              ^
>> drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:3940:11: warning: %d =
in format string (no. 1) requires 'int' but the argument type is 'unsigned =
int'. [invalidPrintfArgType_sint]
     size +=3D sprintf(buf + size, "%2d %14s%s:n",
             ^
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

vim +/bp_result +856 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequen=
cer.c

8740196935625df Andrew Jiang      2017-09-25  783  =

8a31820b12187c7 Martin Leung      2019-07-09  784  void dce110_edp_power_co=
ntrol(
069d418f412ec4b Andrew Jiang      2017-09-26  785  		struct dc_link *link,
8740196935625df Andrew Jiang      2017-09-25  786  		bool power_up)
8740196935625df Andrew Jiang      2017-09-25  787  {
069d418f412ec4b Andrew Jiang      2017-09-26  788  	struct dc_context *ctx =
=3D link->ctx;
8740196935625df Andrew Jiang      2017-09-25  789  	struct bp_transmitter_c=
ontrol cntl =3D { 0 };
8740196935625df Andrew Jiang      2017-09-25  790  	enum bp_result bp_resul=
t;
8740196935625df Andrew Jiang      2017-09-25  791  =

8740196935625df Andrew Jiang      2017-09-25  792  =

069d418f412ec4b Andrew Jiang      2017-09-26  793  	if (dal_graphics_object=
_id_get_connector_id(link->link_enc->connector)
8740196935625df Andrew Jiang      2017-09-25  794  			!=3D CONNECTOR_ID_EDP=
) {
8740196935625df Andrew Jiang      2017-09-25  795  		BREAK_TO_DEBUGGER();
8740196935625df Andrew Jiang      2017-09-25  796  		return;
8740196935625df Andrew Jiang      2017-09-25  797  	}
8740196935625df Andrew Jiang      2017-09-25  798  =

ffadb9d65208435 Anthony Koo       2020-04-17  799  	if (!link->panel_cntl)
904fb6e0f4e8158 Anthony Koo       2020-03-28  800  		return;
904fb6e0f4e8158 Anthony Koo       2020-03-28  801  =

d4caa72e275c192 Anthony Koo       2020-04-08  802  	if (power_up !=3D
d4caa72e275c192 Anthony Koo       2020-04-08  803  		link->panel_cntl->func=
s->is_panel_powered_on(link->panel_cntl)) {
8740196935625df Andrew Jiang      2017-09-25  804  		/* Send VBIOS command =
to prompt eDP panel power */
78d5d04d118d55b Charlene Liu      2018-03-20  805  		if (power_up) {
78d5d04d118d55b Charlene Liu      2018-03-20  806  			unsigned long long cu=
rrent_ts =3D dm_get_timestamp(ctx);
78d5d04d118d55b Charlene Liu      2018-03-20  807  			unsigned long long du=
ration_in_ms =3D
93ed1814c668fb1 Hugo Hu           2018-06-18  808  					div64_u64(dm_get_el=
apse_time_in_ns(
78d5d04d118d55b Charlene Liu      2018-03-20  809  							ctx,
78d5d04d118d55b Charlene Liu      2018-03-20  810  							current_ts,
93ed1814c668fb1 Hugo Hu           2018-06-18  811  							link->link_trace.=
time_stamp.edp_poweroff), 1000000);
78d5d04d118d55b Charlene Liu      2018-03-20  812  			unsigned long long wa=
it_time_ms =3D 0;
78d5d04d118d55b Charlene Liu      2018-03-20  813  =

78d5d04d118d55b Charlene Liu      2018-03-20  814  			/* max 500ms from LCD=
VDD off to on */
6c4fff068f79409 Yue Hin Lau       2018-06-27  815  			unsigned long long ed=
p_poweroff_time_ms =3D 500;
ff58798725ba9c7 Hugo Hu           2018-06-15  816  =

6c4fff068f79409 Yue Hin Lau       2018-06-27  817  			if (link->local_sink =
!=3D NULL)
6c4fff068f79409 Yue Hin Lau       2018-06-27  818  				edp_poweroff_time_ms=
 =3D
6c4fff068f79409 Yue Hin Lau       2018-06-27  819  						500 + link->local_=
sink->edid_caps.panel_patch.extra_t12_ms;
78d5d04d118d55b Charlene Liu      2018-03-20  820  			if (link->link_trace.=
time_stamp.edp_poweroff =3D=3D 0)
ff58798725ba9c7 Hugo Hu           2018-06-15  821  				wait_time_ms =3D edp=
_poweroff_time_ms;
ff58798725ba9c7 Hugo Hu           2018-06-15  822  			else if (duration_in_=
ms < edp_poweroff_time_ms)
ff58798725ba9c7 Hugo Hu           2018-06-15  823  				wait_time_ms =3D edp=
_poweroff_time_ms - duration_in_ms;
78d5d04d118d55b Charlene Liu      2018-03-20  824  =

78d5d04d118d55b Charlene Liu      2018-03-20  825  			if (wait_time_ms) {
78d5d04d118d55b Charlene Liu      2018-03-20  826  				msleep(wait_time_ms);
78d5d04d118d55b Charlene Liu      2018-03-20  827  				dm_output_to_console=
("%s: wait %lld ms to power on eDP.\n",
78d5d04d118d55b Charlene Liu      2018-03-20  828  						__func__, wait_tim=
e_ms);
78d5d04d118d55b Charlene Liu      2018-03-20  829  			}
78d5d04d118d55b Charlene Liu      2018-03-20  830  =

78d5d04d118d55b Charlene Liu      2018-03-20  831  		}
8740196935625df Andrew Jiang      2017-09-25  832  =

1296423bf23c7a5 Bhawanpreet Lakha 2018-02-20  833  		DC_LOG_HW_RESUME_S3(
8740196935625df Andrew Jiang      2017-09-25  834  				"%s: Panel Power act=
ion: %s\n",
8740196935625df Andrew Jiang      2017-09-25  835  				__func__, (power_up =
? "On":"Off"));
8740196935625df Andrew Jiang      2017-09-25  836  =

8740196935625df Andrew Jiang      2017-09-25  837  		cntl.action =3D power_=
up ?
8740196935625df Andrew Jiang      2017-09-25  838  			TRANSMITTER_CONTROL_P=
OWER_ON :
8740196935625df Andrew Jiang      2017-09-25  839  			TRANSMITTER_CONTROL_P=
OWER_OFF;
069d418f412ec4b Andrew Jiang      2017-09-26  840  		cntl.transmitter =3D l=
ink->link_enc->transmitter;
069d418f412ec4b Andrew Jiang      2017-09-26  841  		cntl.connector_obj_id =
=3D link->link_enc->connector;
8740196935625df Andrew Jiang      2017-09-25  842  		cntl.coherent =3D fals=
e;
8740196935625df Andrew Jiang      2017-09-25  843  		cntl.lanes_number =3D =
LANE_COUNT_FOUR;
069d418f412ec4b Andrew Jiang      2017-09-26  844  		cntl.hpd_sel =3D link-=
>link_enc->hpd_source;
5dea2142a86d9aa Chris Park        2020-08-05  845  =

5dea2142a86d9aa Chris Park        2020-08-05  846  		if (ctx->dc->ctx->dmub=
_srv &&
5dea2142a86d9aa Chris Park        2020-08-05  847  				ctx->dc->debug.dmub_=
command_table) {
5dea2142a86d9aa Chris Park        2020-08-05  848  			if (cntl.action =3D=
=3D TRANSMITTER_CONTROL_POWER_ON)
5dea2142a86d9aa Chris Park        2020-08-05  849  				bp_result =3D ctx->d=
c_bios->funcs->enable_lvtma_control(ctx->dc_bios,
5dea2142a86d9aa Chris Park        2020-08-05  850  						LVTMA_CONTROL_POWE=
R_ON);
5dea2142a86d9aa Chris Park        2020-08-05  851  			else
5dea2142a86d9aa Chris Park        2020-08-05  852  				bp_result =3D ctx->d=
c_bios->funcs->enable_lvtma_control(ctx->dc_bios,
5dea2142a86d9aa Chris Park        2020-08-05  853  						LVTMA_CONTROL_POWE=
R_OFF);
5dea2142a86d9aa Chris Park        2020-08-05  854  		}
5dea2142a86d9aa Chris Park        2020-08-05  855  =

8740196935625df Andrew Jiang      2017-09-25 @856  		bp_result =3D link_tra=
nsmitter_control(ctx->dc_bios, &cntl);
8740196935625df Andrew Jiang      2017-09-25  857  =

78d5d04d118d55b Charlene Liu      2018-03-20  858  		if (!power_up)
78d5d04d118d55b Charlene Liu      2018-03-20  859  			/*save driver power o=
ff time stamp*/
78d5d04d118d55b Charlene Liu      2018-03-20  860  			link->link_trace.time=
_stamp.edp_poweroff =3D dm_get_timestamp(ctx);
78d5d04d118d55b Charlene Liu      2018-03-20  861  		else
78d5d04d118d55b Charlene Liu      2018-03-20  862  			link->link_trace.time=
_stamp.edp_poweron =3D dm_get_timestamp(ctx);
78d5d04d118d55b Charlene Liu      2018-03-20  863  =

8740196935625df Andrew Jiang      2017-09-25  864  		if (bp_result !=3D BP_=
RESULT_OK)
1296423bf23c7a5 Bhawanpreet Lakha 2018-02-20  865  			DC_LOG_ERROR(
8740196935625df Andrew Jiang      2017-09-25  866  					"%s: Panel Power bp=
_result: %d\n",
8740196935625df Andrew Jiang      2017-09-25  867  					__func__, bp_result=
);
8740196935625df Andrew Jiang      2017-09-25  868  	} else {
1296423bf23c7a5 Bhawanpreet Lakha 2018-02-20  869  		DC_LOG_HW_RESUME_S3(
8740196935625df Andrew Jiang      2017-09-25  870  				"%s: Skipping Panel =
Power action: %s\n",
8740196935625df Andrew Jiang      2017-09-25  871  				__func__, (power_up =
? "On":"Off"));
8740196935625df Andrew Jiang      2017-09-25  872  	}
8740196935625df Andrew Jiang      2017-09-25  873  }
5eefbc40173644b Yue Hin Lau       2017-09-15  874  =


:::::: The code at line 856 was first introduced by commit
:::::: 8740196935625dfb171ab115120315060e4a8a41 drm/amd/display: Move power=
 control from link encoder to hwsequencer

:::::: TO: Andrew Jiang <Andrew.Jiang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4351945184186221633==--

