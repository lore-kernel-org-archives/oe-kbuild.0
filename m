Content-Type: multipart/mixed; boundary="===============7266553932380107242=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c:446:3: warning: Value stored to 'sdp_stream_enable' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 01 Dec 2021 18:31:55 +0800
Message-ID: <202112011804.OXORFy0x-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7266553932380107242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Fangzhi Zuo <Jerry.Zuo@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
commit: 83228ebb82e4fe2e5513f35d9b0b0eded3c44cbc drm/amd/display: Add DP 2.=
0 HPO Stream Encoder
date:   3 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-c007-20211128 (https://download.01.org/0day-ci/ar=
chive/20211201/202112011804.OXORFy0x-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D83228ebb82e4fe2e5513f35d9b0b0eded3c44cbc
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 83228ebb82e4fe2e5513f35d9b0b0eded3c44cbc
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:114:9: note: 2nd fun=
ction call argument is an uninitialized value
                   ret =3D cdns_mhdp_secure_mailbox_write(mhdp, header[i]);
                         ^                                    ~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:426:2: warning: 4th =
function call argument is an uninitialized value [clang-analyzer-core.CallA=
ndMessage]
           dev_err(mhdp->dev, "HDCP authentication failed (%d tries/%d)\n",
           ^
   include/linux/dev_printk.h:112:2: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:535:8: note: Calling=
 '_cdns_mhdp_hdcp_enable'
           ret =3D _cdns_mhdp_hdcp_enable(mhdp, content_type);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:406:6: note: 'ret' d=
eclared without an initial value
           int ret, tries =3D 3;
               ^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:409:2: note: Loop co=
ndition is true.  Entering loop body
           for (i =3D 0; i < tries; i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: Assumin=
g 'content_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: Left si=
de of '||' is false
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:411:7: note: Assumin=
g 'content_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE1
                       content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE1) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:409:2: note: Loop co=
ndition is true.  Entering loop body
           for (i =3D 0; i < tries; i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: Left si=
de of '||' is false
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:411:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE1
                       content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE1) {
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:409:2: note: Loop co=
ndition is true.  Entering loop body
           for (i =3D 0; i < tries; i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: Left si=
de of '||' is false
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:411:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE1
                       content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE1) {
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:409:2: note: Loop co=
ndition is false. Execution continues on line 426
           for (i =3D 0; i < tries; i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:426:2: note: 4th fun=
ction call argument is an uninitialized value
           dev_err(mhdp->dev, "HDCP authentication failed (%d tries/%d)\n",
           ^
   include/linux/dev_printk.h:112:2: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^                             ~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_apg.c:124:2: warnin=
g: Value stored to 'speakers' is never read [clang-analyzer-deadcode.DeadSt=
ores]
           speakers =3D audio_info->flags.info.ALLSPEAKERS;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_apg.c:124:2: note: =
Value stored to 'speakers' is never read
           speakers =3D audio_info->flags.info.ALLSPEAKERS;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_apg.c:125:2: warnin=
g: Value stored to 'channels' is never read [clang-analyzer-deadcode.DeadSt=
ores]
           channels =3D speakers_to_channels(audio_info->flags.speaker_flag=
s).all;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_apg.c:125:2: note: =
Value stored to 'channels' is never read
           channels =3D speakers_to_channels(audio_info->flags.speaker_flag=
s).all;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 5 warnings (3 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hpo_dp_stream_encod=
er.c:446:3: warning: Value stored to 'sdp_stream_enable' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   sdp_stream_enable =3D true;
                   ^                   ~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hpo_dp_stream_encod=
er.c:446:3: note: Value stored to 'sdp_stream_enable' is never read
                   sdp_stream_enable =3D true;
                   ^                   ~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hpo_dp_stream_encod=
er.c:453:3: warning: Value stored to 'sdp_stream_enable' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   sdp_stream_enable =3D true;
                   ^                   ~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hpo_dp_stream_encod=
er.c:453:3: note: Value stored to 'sdp_stream_enable' is never read
                   sdp_stream_enable =3D true;
                   ^                   ~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hpo_dp_stream_encod=
er.c:460:3: warning: Value stored to 'sdp_stream_enable' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   sdp_stream_enable =3D true;
                   ^                   ~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hpo_dp_stream_encod=
er.c:460:3: note: Value stored to 'sdp_stream_enable' is never read
                   sdp_stream_enable =3D true;
                   ^                   ~~~~
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (9 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2882:6: wa=
rning: Access to field 'disable_edc_leakage_controller' results in a derefe=
rence of a null pointer (loaded from variable 'data') [clang-analyzer-core.=
NullDereference]
           if (data->disable_edc_leakage_controller)
               ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2914:6: no=
te: Assuming 'data' is not equal to NULL
           if (data =3D=3D NULL)
               ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2914:2: no=
te: Taking false branch
           if (data =3D=3D NULL)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2918:2: no=
te: Calling 'smu7_patch_voltage_workaround'
           smu7_patch_voltage_workaround(hwmgr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2451:6: no=
te: Assuming 'table_info' is equal to NULL
           if (table_info !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2451:2: no=
te: Taking false branch
           if (table_info !=3D NULL) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2455:3: no=
te: Returning without writing to 'hwmgr->backend'
                   return 0;
                   ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2918:2: no=
te: Returning from 'smu7_patch_voltage_workaround'
           smu7_patch_voltage_workaround(hwmgr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2922:2: no=
te: Taking false branch
           if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps,
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2933:6: no=
te: Assuming field 'pp_table_version' is not equal to PP_TABLE_V1
           if (hwmgr->pp_table_version =3D=3D PP_TABLE_V1) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2933:2: no=
te: Taking false branch
           if (hwmgr->pp_table_version =3D=3D PP_TABLE_V1) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2936:13: n=
ote: Assuming field 'pp_table_version' is not equal to PP_TABLE_V0
           } else if (hwmgr->pp_table_version =3D=3D PP_TABLE_V0) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2936:9: no=
te: Taking false branch
           } else if (hwmgr->pp_table_version =3D=3D PP_TABLE_V0) {
                  ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2944:6: no=
te: Assuming 'result' is not equal to 0
           if (0 =3D=3D result) {
               ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2944:2: no=
te: Taking false branch
           if (0 =3D=3D result) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2968:3: no=
te: Calling 'smu7_hwmgr_backend_fini'
                   smu7_hwmgr_backend_fini(hwmgr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2839:2: no=
te: Null pointer value stored to field 'backend'
           hwmgr->backend =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2968:3: no=
te: Returning from 'smu7_hwmgr_backend_fini'
                   smu7_hwmgr_backend_fini(hwmgr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2971:11: n=
ote: Calling 'smu7_update_edc_leakage_table'
           result =3D smu7_update_edc_leakage_table(hwmgr);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2877:2: no=
te: 'data' initialized to a null pointer value
           struct smu7_hwmgr *data =3D (struct smu7_hwmgr *)(hwmgr->backend=
);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2882:6: no=
te: Access to field 'disable_edc_leakage_controller' results in a dereferen=
ce of a null pointer (loaded from variable 'data')
           if (data->disable_edc_leakage_controller)
               ^~~~
   Suppressed 11 warnings (10 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/sdp_stream_enable +446 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31=
/dcn31_hpo_dp_stream_encoder.c

83228ebb82e4fe Fangzhi Zuo 2021-06-09  432  =

83228ebb82e4fe Fangzhi Zuo 2021-06-09  433  static void dcn31_hpo_dp_stream=
_enc_update_dp_info_packets(
83228ebb82e4fe Fangzhi Zuo 2021-06-09  434  		struct hpo_dp_stream_encoder =
*enc,
83228ebb82e4fe Fangzhi Zuo 2021-06-09  435  		const struct encoder_info_fra=
me *info_frame)
83228ebb82e4fe Fangzhi Zuo 2021-06-09  436  {
83228ebb82e4fe Fangzhi Zuo 2021-06-09  437  	struct dcn31_hpo_dp_stream_enc=
oder *enc3 =3D DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
83228ebb82e4fe Fangzhi Zuo 2021-06-09  438  	uint32_t dmdata_packet_enabled=
 =3D 0;
83228ebb82e4fe Fangzhi Zuo 2021-06-09  439  	bool sdp_stream_enable =3D fal=
se;
83228ebb82e4fe Fangzhi Zuo 2021-06-09  440  =

83228ebb82e4fe Fangzhi Zuo 2021-06-09  441  	if (info_frame->vsc.valid) {
83228ebb82e4fe Fangzhi Zuo 2021-06-09  442  		enc->vpg->funcs->update_gener=
ic_info_packet(
83228ebb82e4fe Fangzhi Zuo 2021-06-09  443  				enc->vpg,
83228ebb82e4fe Fangzhi Zuo 2021-06-09  444  				0,  /* packetIndex */
83228ebb82e4fe Fangzhi Zuo 2021-06-09  445  				&info_frame->vsc);
83228ebb82e4fe Fangzhi Zuo 2021-06-09 @446  		sdp_stream_enable =3D true;
83228ebb82e4fe Fangzhi Zuo 2021-06-09  447  	}
83228ebb82e4fe Fangzhi Zuo 2021-06-09  448  	if (info_frame->spd.valid) {
83228ebb82e4fe Fangzhi Zuo 2021-06-09  449  		enc->vpg->funcs->update_gener=
ic_info_packet(
83228ebb82e4fe Fangzhi Zuo 2021-06-09  450  				enc->vpg,
83228ebb82e4fe Fangzhi Zuo 2021-06-09  451  				2,  /* packetIndex */
83228ebb82e4fe Fangzhi Zuo 2021-06-09  452  				&info_frame->spd);
83228ebb82e4fe Fangzhi Zuo 2021-06-09  453  		sdp_stream_enable =3D true;
83228ebb82e4fe Fangzhi Zuo 2021-06-09  454  	}
83228ebb82e4fe Fangzhi Zuo 2021-06-09  455  	if (info_frame->hdrsmd.valid) {
83228ebb82e4fe Fangzhi Zuo 2021-06-09  456  		enc->vpg->funcs->update_gener=
ic_info_packet(
83228ebb82e4fe Fangzhi Zuo 2021-06-09  457  				enc->vpg,
83228ebb82e4fe Fangzhi Zuo 2021-06-09  458  				3,  /* packetIndex */
83228ebb82e4fe Fangzhi Zuo 2021-06-09  459  				&info_frame->hdrsmd);
83228ebb82e4fe Fangzhi Zuo 2021-06-09  460  		sdp_stream_enable =3D true;
83228ebb82e4fe Fangzhi Zuo 2021-06-09  461  	}
83228ebb82e4fe Fangzhi Zuo 2021-06-09  462  	/* enable/disable transmission=
 of packet(s).
83228ebb82e4fe Fangzhi Zuo 2021-06-09  463  	 * If enabled, packet transmis=
sion begins on the next frame
83228ebb82e4fe Fangzhi Zuo 2021-06-09  464  	 */
83228ebb82e4fe Fangzhi Zuo 2021-06-09  465  	REG_UPDATE(DP_SYM32_ENC_SDP_GS=
P_CONTROL0, GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, info_frame->vsc.valid=
);
83228ebb82e4fe Fangzhi Zuo 2021-06-09  466  	REG_UPDATE(DP_SYM32_ENC_SDP_GS=
P_CONTROL2, GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, info_frame->spd.valid=
);
83228ebb82e4fe Fangzhi Zuo 2021-06-09  467  	REG_UPDATE(DP_SYM32_ENC_SDP_GS=
P_CONTROL3, GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, info_frame->hdrsmd.va=
lid);
83228ebb82e4fe Fangzhi Zuo 2021-06-09  468  =

83228ebb82e4fe Fangzhi Zuo 2021-06-09  469  	/* check if dynamic metadata p=
acket transmission is enabled */
83228ebb82e4fe Fangzhi Zuo 2021-06-09  470  	REG_GET(DP_SYM32_ENC_SDP_METAD=
ATA_PACKET_CONTROL,
83228ebb82e4fe Fangzhi Zuo 2021-06-09  471  			METADATA_PACKET_ENABLE, &dmd=
ata_packet_enabled);
83228ebb82e4fe Fangzhi Zuo 2021-06-09  472  =

83228ebb82e4fe Fangzhi Zuo 2021-06-09  473  	/* Enable secondary data path =
*/
83228ebb82e4fe Fangzhi Zuo 2021-06-09  474  	REG_UPDATE(DP_SYM32_ENC_SDP_CO=
NTROL,
83228ebb82e4fe Fangzhi Zuo 2021-06-09  475  			SDP_STREAM_ENABLE, 1);
83228ebb82e4fe Fangzhi Zuo 2021-06-09  476  }
83228ebb82e4fe Fangzhi Zuo 2021-06-09  477  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7266553932380107242==--

