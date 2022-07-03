Content-Type: multipart/mixed; boundary="===============6194244519965882594=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10578:9: warning: use of NULL 'data' where non-null expected [CWE-476]
Date: Mon, 04 Jul 2022 02:02:35 +0800
Message-ID: <202207040137.CaIRtCJF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6194244519965882594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10578:9: warni=
ng: use of NULL 'data' where non-null expected [CWE-476] [-Wanalyzer-null-a=
rgument]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Stylon Wang <stylon.wang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   69cb6c6556ad89620547318439d6be8bb1629a5a
commit: 46db138dc83ae16e188038358c925c560110f804 drm/amd/display: Add Frees=
ync HDMI support to DM with DMUB
date:   12 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220703 (https://download.01.org/0day-ci/archi=
ve/20220704/202207040137.CaIRtCJF-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D46db138dc83ae16e188038358c925c560110f804
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 46db138dc83ae16e188038358c925c560110f804
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
       |      |                    ~
       |      |                    |
       |      |                    (8) ...to here
       |      |                    (9) following 'false' branch (when 'old_=
plane_crtc' is non-NULL)...
       |
     'dm_update_plane_state': event 10
       |
       |include/drm/drm_atomic.h:542:21:
       |  542 |         return state->crtcs[drm_crtc_index(crtc)].old_state;
       |      |                ~~~~~^~~~~~~
       |      |                     |
       |      |                     (10) ...to here
       |
     'dm_update_plane_state': event 11
       |
       |drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9953:20:
       | 9953 |                 if (!dm_old_crtc_state->stream)
       |      |                    ^
       |      |                    |
       |      |                    (11) following 'false' branch...
       |
     'dm_update_plane_state': event 12
       |
       |include/drm/drm_print.h:516:9:
       |  516 |         __drm_dbg(DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (12) ...to here
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9956:17: not=
e: in expansion of macro 'DRM_DEBUG_ATOMIC'
       | 9956 |                 DRM_DEBUG_ATOMIC("Disabling DRM plane: %d o=
n DRM crtc %d\n",
       |      |                 ^~~~~~~~~~~~~~~~
       |
     'dm_update_plane_state': event 13
       |
       | 9959 |                 ret =3D dm_atomic_get_state(state, &dm_stat=
e);
       |      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (13) calling 'dm_atomic_get_state' fr=
om 'dm_update_plane_state'
       |
       +--> 'dm_atomic_get_state': events 14-18
              |
              | 3287 | static int dm_atomic_get_state(struct drm_atomic_sta=
te *state,
              |      |            ^~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (14) entry to 'dm_atomic_get_state'
              |......
              | 3295 |         if (*dm_state)
              |      |            ~~~~~~~~~~
              |      |            ||
              |      |            |(15) 'dm_state' is NULL
              |      |            (16) following 'false' branch...
              |......
              | 3298 |         priv_state =3D drm_atomic_get_private_obj_st=
ate(state, &dm->atomic_obj);
              |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                      |
              |      |                      (17) ...to here
              | 3299 |         if (IS_ERR(priv_state))
              |      |            ~
              |      |            |
              |      |            (18) following 'true' branch...
              |
            'dm_atomic_get_state': event 19
              |
              |include/linux/err.h:31:16:
              |   31 |         return (long) ptr;
              |      |                ^~~~~~~~~~
              |      |                |
              |      |                (19) ...to here
              |
       <------+
       |
     'dm_update_plane_state': events 20-24
       |
       |drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9959:23:
       | 9959 |                 ret =3D dm_atomic_get_state(state, &dm_stat=
e);
       |      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (20) returning to 'dm_update_plane_st=
ate' from 'dm_atomic_get_state'
       | 9960 |                 if (ret)
       |      |                    ~   =

       |      |                    |
       |      |                    (21) following 'false' branch (when 'ret=
 =3D=3D 0')...
       |......
       | 9963 |                 if (!dc_remove_plane_from_context(
       |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                      |
       |      |                      (22) ...to here
       |      |                      (24) dereference of NULL 'dm_state'
       | 9964 |                                 dc,
       |      |                                 ~~~
       | 9965 |                                 dm_old_crtc_state->stream,
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
       | 9966 |                                 dm_old_plane_state->dc_stat=
e,
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       | 9967 |                                 dm_state->context)) {
       |      |                                 ~~~~~~~~~~~~~~~~~~
       |      |                                         |
       |      |                                         (23) 'dm_state' is =
NULL
       |
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function=
 'dm_edid_parser_send_cea':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10578:9: war=
ning: use of NULL 'data' where non-null expected [CWE-476] [-Wanalyzer-null=
-argument]
   10578 |         memcpy(input->payload, data, length);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'parse_hdmi_amd_vsdb': events 1-2
       |
       |10678 | static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *=
aconnector,
       |      |            ^~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'parse_hdmi_amd_vsdb'
       |......
       |10687 |         if (edid =3D=3D NULL || edid->extensions =3D=3D 0)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |
     'parse_hdmi_amd_vsdb': event 3
       |
       |cc1:
       | (3): ...to here
       |
     'parse_hdmi_amd_vsdb': events 4-10
       |
       |10691 |         for (i =3D 0; i < edid->extensions; i++) {
       |      |                     ~~^~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (4) following 'false' branch...
       |......
       |10697 |         if (i =3D=3D edid->extensions)
       |      |            ~           =

       |      |            |
       |      |            (5) ...to here
       |      |            (6) following 'false' branch...
       |......
       |10701 |         if (edid_ext[0] !=3D CEA_EXT)
       |      |            ~~~~~~~~~~~~
       |      |            |        |
       |      |            |        (7) ...to here
       |      |            (8) following 'false' branch...
       |......
       |10704 |         valid_vsdb_found =3D parse_edid_cea(aconnector, edi=
d_ext, EDID_LENGTH, vsdb_info);
       |      |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                            |
       |      |                            (9) ...to here
       |      |                            (10) calling 'parse_edid_cea' fr=
om 'parse_hdmi_amd_vsdb'
       |
       +--> 'parse_edid_cea': events 11-14
              |
              |10666 | static bool parse_edid_cea(struct amdgpu_dm_connecto=
r *aconnector,
              |      |             ^~~~~~~~~~~~~~
              |      |             |
              |      |             (11) entry to 'parse_edid_cea'
              |......
              |10672 |         if (adev->dm.dmub_srv)
              |      |            ~ =

              |      |            |
              |      |            (12) following 'true' branch...
              |10673 |                 return parse_edid_cea_dmub(&adev->dm=
, edid_ext, len, vsdb_info);
              |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (13) ...to here
              |      |                        (14) calling 'parse_edid_cea_=
dmub' from 'parse_edid_cea'
              |
              +--> 'parse_edid_cea_dmub': events 15-20
                     |
                     |10650 | static bool parse_edid_cea_dmub(struct amdgpu=
_display_manager *dm,
                     |      |             ^~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (15) entry to 'parse_edid_cea_dmu=
b'
                     |......
                     |10657 |         for (i =3D 0; i < len; i +=3D 8) {
                     |      |                     ~~~~~~~
                     |      |                       |
                     |      |                       (16) following 'true' b=
ranch (when 'i < len')...
                     |10658 |                 /* send 8 bytes a time */
                     |10659 |                 if (!dm_edid_parser_send_cea(=
dm, i, len, &edid_ext[i], 8, vsdb_info))
                     |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                      |
                     |      |                      (17) ...to here
                     |      |                      (18) 'edid_ext' is NULL
                     |      |                      (19) 'edid_ext' is NULL
                     |      |                      (20) calling 'dm_edid_pa=
rser_send_cea' from 'parse_edid_cea_dmub'
                     |
                     +--> 'dm_edid_parser_send_cea': events 21-24
                            |
                            |10552 | static bool dm_edid_parser_send_cea(st=
ruct amdgpu_display_manager *dm,
                            |      |             ^~~~~~~~~~~~~~~~~~~~~~~
                            |      |             |
                            |      |             (21) entry to 'dm_edid_par=
ser_send_cea'
                            |......
                            |10564 |         if (length > DMUB_EDID_CEA_DAT=
A_CHUNK_BYTES)
                            |      |            ~ =

                            |      |            |
                            |      |            (22) following 'false' bran=
ch (when 'length <=3D 8')...
                            |......
                            |10571 |         cmd.edid_cea.header.type =3D D=
MUB_CMD__EDID_CEA;
                            |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
                            |      |                                  |
                            |      |                                  (23) =
...to here
                            |......
                            |10578 |         memcpy(input->payload, data, l=
ength);
                            |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~

vim +/data +10578 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm=
.c

f9b4f20c4777bd Stylon Wang 2020-12-04  10551  =

46db138dc83ae1 Stylon Wang 2021-05-29  10552  static bool dm_edid_parser_se=
nd_cea(struct amdgpu_display_manager *dm,
46db138dc83ae1 Stylon Wang 2021-05-29  10553  		unsigned int offset,
46db138dc83ae1 Stylon Wang 2021-05-29  10554  		unsigned int total_length,
46db138dc83ae1 Stylon Wang 2021-05-29  10555  		uint8_t *data,
46db138dc83ae1 Stylon Wang 2021-05-29  10556  		unsigned int length,
46db138dc83ae1 Stylon Wang 2021-05-29  10557  		struct amdgpu_hdmi_vsdb_inf=
o *vsdb)
46db138dc83ae1 Stylon Wang 2021-05-29  10558  {
46db138dc83ae1 Stylon Wang 2021-05-29  10559  	bool res;
46db138dc83ae1 Stylon Wang 2021-05-29  10560  	union dmub_rb_cmd cmd;
46db138dc83ae1 Stylon Wang 2021-05-29  10561  	struct dmub_cmd_send_edid_ce=
a *input;
46db138dc83ae1 Stylon Wang 2021-05-29  10562  	struct dmub_cmd_edid_cea_out=
put *output;
46db138dc83ae1 Stylon Wang 2021-05-29  10563  =

46db138dc83ae1 Stylon Wang 2021-05-29  10564  	if (length > DMUB_EDID_CEA_D=
ATA_CHUNK_BYTES)
46db138dc83ae1 Stylon Wang 2021-05-29  10565  		return false;
46db138dc83ae1 Stylon Wang 2021-05-29  10566  =

46db138dc83ae1 Stylon Wang 2021-05-29  10567  	memset(&cmd, 0, sizeof(cmd));
46db138dc83ae1 Stylon Wang 2021-05-29  10568  =

46db138dc83ae1 Stylon Wang 2021-05-29  10569  	input =3D &cmd.edid_cea.data=
.input;
46db138dc83ae1 Stylon Wang 2021-05-29  10570  =

46db138dc83ae1 Stylon Wang 2021-05-29  10571  	cmd.edid_cea.header.type =3D=
 DMUB_CMD__EDID_CEA;
46db138dc83ae1 Stylon Wang 2021-05-29  10572  	cmd.edid_cea.header.sub_type=
 =3D 0;
46db138dc83ae1 Stylon Wang 2021-05-29  10573  	cmd.edid_cea.header.payload_=
bytes =3D
46db138dc83ae1 Stylon Wang 2021-05-29  10574  		sizeof(cmd.edid_cea) - size=
of(cmd.edid_cea.header);
46db138dc83ae1 Stylon Wang 2021-05-29  10575  	input->offset =3D offset;
46db138dc83ae1 Stylon Wang 2021-05-29  10576  	input->length =3D length;
46db138dc83ae1 Stylon Wang 2021-05-29  10577  	input->total_length =3D tota=
l_length;
46db138dc83ae1 Stylon Wang 2021-05-29 @10578  	memcpy(input->payload, data,=
 length);
46db138dc83ae1 Stylon Wang 2021-05-29  10579  =

46db138dc83ae1 Stylon Wang 2021-05-29  10580  	res =3D dc_dmub_srv_cmd_with=
_reply_data(dm->dc->ctx->dmub_srv, &cmd);
46db138dc83ae1 Stylon Wang 2021-05-29  10581  	if (!res) {
46db138dc83ae1 Stylon Wang 2021-05-29  10582  		DRM_ERROR("EDID CEA parser =
failed\n");
46db138dc83ae1 Stylon Wang 2021-05-29  10583  		return false;
46db138dc83ae1 Stylon Wang 2021-05-29  10584  	}
46db138dc83ae1 Stylon Wang 2021-05-29  10585  =

46db138dc83ae1 Stylon Wang 2021-05-29  10586  	output =3D &cmd.edid_cea.dat=
a.output;
46db138dc83ae1 Stylon Wang 2021-05-29  10587  =

46db138dc83ae1 Stylon Wang 2021-05-29  10588  	if (output->type =3D=3D DMUB=
_CMD__EDID_CEA_ACK) {
46db138dc83ae1 Stylon Wang 2021-05-29  10589  		if (!output->ack.success) {
46db138dc83ae1 Stylon Wang 2021-05-29  10590  			DRM_ERROR("EDID CEA ack fa=
iled at offset %d\n",
46db138dc83ae1 Stylon Wang 2021-05-29  10591  					output->ack.offset);
46db138dc83ae1 Stylon Wang 2021-05-29  10592  		}
46db138dc83ae1 Stylon Wang 2021-05-29  10593  	} else if (output->type =3D=
=3D DMUB_CMD__EDID_CEA_AMD_VSDB) {
46db138dc83ae1 Stylon Wang 2021-05-29  10594  		if (!output->amd_vsdb.vsdb_=
found)
46db138dc83ae1 Stylon Wang 2021-05-29  10595  			return false;
46db138dc83ae1 Stylon Wang 2021-05-29  10596  =

46db138dc83ae1 Stylon Wang 2021-05-29  10597  		vsdb->freesync_supported =
=3D output->amd_vsdb.freesync_supported;
46db138dc83ae1 Stylon Wang 2021-05-29  10598  		vsdb->amd_vsdb_version =3D =
output->amd_vsdb.amd_vsdb_version;
46db138dc83ae1 Stylon Wang 2021-05-29  10599  		vsdb->min_refresh_rate_hz =
=3D output->amd_vsdb.min_frame_rate;
46db138dc83ae1 Stylon Wang 2021-05-29  10600  		vsdb->max_refresh_rate_hz =
=3D output->amd_vsdb.max_frame_rate;
46db138dc83ae1 Stylon Wang 2021-05-29  10601  	} else {
46db138dc83ae1 Stylon Wang 2021-05-29  10602  		DRM_ERROR("Unknown EDID CEA=
 parser results\n");
46db138dc83ae1 Stylon Wang 2021-05-29  10603  		return false;
46db138dc83ae1 Stylon Wang 2021-05-29  10604  	}
46db138dc83ae1 Stylon Wang 2021-05-29  10605  =

46db138dc83ae1 Stylon Wang 2021-05-29  10606  	return true;
46db138dc83ae1 Stylon Wang 2021-05-29  10607  }
46db138dc83ae1 Stylon Wang 2021-05-29  10608  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6194244519965882594==--

