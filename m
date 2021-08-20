Content-Type: multipart/mixed; boundary="===============0069934690302330621=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3622/9113] drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:6211:6: warning: Unused variable: i [unusedVariable]
Date: Fri, 20 Aug 2021 12:31:47 +0800
Message-ID: <202108201214.1Jeq4gwl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0069934690302330621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alex Deucher <alexander.deucher@amd.com>
CC: Roman Li <Roman.Li@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   33e65b1f975cd2814fc0ea9617250fc4c1d7a553
commit: 7fd13baeb7a3a48cae12c36c52f06bf4e9e7d728 [3622/9113] drm/amdgpu/dis=
play: add support for multiple backlights
:::::: branch date: 19 hours ago
:::::: commit date: 3 weeks ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_=
display_rq_dlg_calc.c:
>> drivers/gpu/drm/amd/display/dc/dml/dml_inline_defs.h:100:28: warning: Ca=
sting from double* to integer* is not portable due to different binary data=
 representations on different platforms. [invalidPointerCast]
    unsigned long long ix =3D *((unsigned long long *)&x);
                              ^
>> drivers/gpu/drm/amd/display/dc/dml/dml_inline_defs.h:100:28: warning: Ca=
sting from double* to integer* is not portable due to different binary data=
 representations on different platforms. [invalidPointerCast]
    unsigned long long ix =3D *((unsigned long long *)&x);
                              ^
--
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20=
/display_mode_vba_20v2.c:
   drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c:3410:7:=
 warning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D =
0' is always true. [redundantCondition]
         && mode_lib->vba.SourcePixelFormat[k] !=3D dm_mono_16
         ^
   drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c:3428:7:=
 warning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D =
0' is always true. [redundantCondition]
         && mode_lib->vba.SourcePixelFormat[k] !=3D dm_mono_16
         ^
   drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c:3490:5:=
 warning: Redundant condition: If 'EXPR =3D=3D 0', the comparison 'EXPR =3D=
=3D 0' is always true. [redundantCondition]
       || mode_lib->vba.SourcePixelFormat[k] =3D=3D dm_mono_16) {
       ^
   drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c:3877:5:=
 warning: Redundant condition: If 'EXPR =3D=3D 0', the comparison 'EXPR =3D=
=3D 0' is always true. [redundantCondition]
       || mode_lib->vba.SourcePixelFormat[k] =3D=3D dm_mono_16
       ^
   drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c:4661:7:=
 warning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D =
0' is always true. [redundantCondition]
         && mode_lib->vba.SourcePixelFormat[k] !=3D dm_mono_16
         ^
   drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c:5120:5:=
 warning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D =
0' is always true. [redundantCondition]
       && mode_lib->vba.SourcePixelFormat[k] !=3D dm_mono_16
       ^
>> drivers/gpu/drm/amd/display/dc/dml/dml_inline_defs.h:100:28: warning: Ca=
sting from double* to integer* is not portable due to different binary data=
 representations on different platforms. [invalidPointerCast]
    unsigned long long ix =3D *((unsigned long long *)&x);
                              ^
>> drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c:718:20=
: warning: Boolean result is used in bitwise operation. Clarify expression =
with parentheses. [clarifyCondition]
     if (!surf_linear & (log2_dpte_req_height_ptes =3D=3D 0) & surf_vert) /=
/reduced, in this case, will have page fault within a group
                      ^
>> drivers/gpu/drm/amd/display/dc/dml/dml_inline_defs.h:100:28: warning: Ca=
sting from double* to integer* is not portable due to different binary data=
 representations on different platforms. [invalidPointerCast]
    unsigned long long ix =3D *((unsigned long long *)&x);
                              ^
>> drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c:656:19=
: warning: Boolean result is used in bitwise operation. Clarify expression =
with parentheses. [clarifyCondition]
    if (!surf_linear & (log2_dpte_req_height_ptes =3D=3D 0) & surf_vert) //=
reduced, in this case, will have page fault within a group
                     ^
>> drivers/gpu/drm/amd/display/dc/dml/dml_inline_defs.h:100:28: warning: Ca=
sting from double* to integer* is not portable due to different binary data=
 representations on different platforms. [invalidPointerCast]
    unsigned long long ix =3D *((unsigned long long *)&x);
                              ^
>> drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c:709:20=
: warning: Boolean result is used in bitwise operation. Clarify expression =
with parentheses. [clarifyCondition]
     if (!surf_linear & (log2_dpte_req_height_ptes =3D=3D 0) & surf_vert) /=
/reduced, in this case, will have page fault within a group
                      ^
>> drivers/gpu/drm/amd/display/dc/dml/dml_inline_defs.h:100:28: warning: Ca=
sting from double* to integer* is not portable due to different binary data=
 representations on different platforms. [invalidPointerCast]
    unsigned long long ix =3D *((unsigned long long *)&x);
                              ^
>> drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c:662:20=
: warning: Boolean result is used in bitwise operation. Clarify expression =
with parentheses. [clarifyCondition]
     if (!surf_linear & (log2_dpte_req_height_ptes =3D=3D 0) & surf_vert) /=
/reduced, in this case, will have page fault within a group
                      ^
>> drivers/gpu/drm/amd/display/dc/dml/dml_inline_defs.h:100:28: warning: Ca=
sting from double* to integer* is not portable due to different binary data=
 representations on different platforms. [invalidPointerCast]
    unsigned long long ix =3D *((unsigned long long *)&x);
                              ^
   drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c:1715:62: =
warning: Redundant condition: If 'EXPR =3D=3D 0', the comparison 'EXPR =3D=
=3D 0' is always true. [redundantCondition]
     } else if (mode_lib->vba.SourcePixelFormat[k] =3D=3D dm_444_16 || mode=
_lib->vba.SourcePixelFormat[k] =3D=3D dm_mono_16) {
                                                                ^
   drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c:1718:61: =
warning: Redundant condition: If 'EXPR =3D=3D 8', the comparison 'EXPR =3D=
=3D 8' is always true. [redundantCondition]
     } else if (mode_lib->vba.SourcePixelFormat[k] =3D=3D dm_444_8 || mode_=
lib->vba.SourcePixelFormat[k] =3D=3D dm_mono_8) {
                                                               ^
   drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c:3414:7: w=
arning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D 0'=
 is always true. [redundantCondition]
         && mode_lib->vba.SourcePixelFormat[k] !=3D dm_mono_16
         ^
   drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c:3432:7: w=
arning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D 0'=
 is always true. [redundantCondition]
         && mode_lib->vba.SourcePixelFormat[k] !=3D dm_mono_16
         ^
   drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c:3494:5: w=
arning: Redundant condition: If 'EXPR =3D=3D 0', the comparison 'EXPR =3D=
=3D 0' is always true. [redundantCondition]
       || mode_lib->vba.SourcePixelFormat[k] =3D=3D dm_mono_16) {
       ^
   drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c:3843:5: w=
arning: Redundant condition: If 'EXPR =3D=3D 0', the comparison 'EXPR =3D=
=3D 0' is always true. [redundantCondition]
       || mode_lib->vba.SourcePixelFormat[k] =3D=3D dm_mono_16
       ^
   drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c:4474:7: w=
arning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D 0'=
 is always true. [redundantCondition]
         && mode_lib->vba.SourcePixelFormat[k] !=3D dm_mono_16
         ^
   drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c:5109:5: w=
arning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D 0'=
 is always true. [redundantCondition]
       && mode_lib->vba.SourcePixelFormat[k] !=3D dm_mono_16
       ^
>> drivers/gpu/drm/amd/display/dc/dml/dml_inline_defs.h:100:28: warning: Ca=
sting from double* to integer* is not portable due to different binary data=
 representations on different platforms. [invalidPointerCast]
    unsigned long long ix =3D *((unsigned long long *)&x);
                              ^
>> drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:656:=
19: warning: Boolean result is used in bitwise operation. Clarify expressio=
n with parentheses. [clarifyCondition]
    if (!surf_linear & (log2_dpte_req_height_ptes =3D=3D 0) & surf_vert) //=
reduced, in this case, will have page fault within a group
                     ^
>> drivers/gpu/drm/amd/display/dc/dml/dml_inline_defs.h:100:28: warning: Ca=
sting from double* to integer* is not portable due to different binary data=
 representations on different platforms. [invalidPointerCast]
    unsigned long long ix =3D *((unsigned long long *)&x);
                              ^
>> drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c:1293:26: warning=
: Array index 'i' is used before limits check. [arrayIndexThenCheck]
      if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j] && i < num_dcf=
clk_sta_targets) {
                            ^
--
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn=
30_resource.c:
>> drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c:2447:26: warning: =
Array index 'i' is used before limits check. [arrayIndexThenCheck]
      if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j] && i < num_dcf=
clk_sta_targets) {
                            ^
>> drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c:1904:23: warning: =
Uninitialized variable: vlevel [uninitvar]
    if (fast_validate || vlevel =3D=3D context->bw_ctx.dml.soc.num_states ||
                         ^
--
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/s=
mu10_hwmgr.c:
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c:1053:12: warning: %=
d in format string (no. 1) requires 'int' but the argument type is 'unsigne=
d int'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "%d: %uMhz %sn",
              ^
   drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c:1463:11: warning: %=
d in format string (no. 1) requires 'int' but the argument type is 'unsigne=
d int'. [invalidPrintfArgType_sint]
     size +=3D sprintf(buf + size, "%3d %14s%s: %14d %3d %10d %14dn",
             ^
   drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c:3303:7: w=
arning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D 0'=
 is always true. [redundantCondition]
         && mode_lib->vba.SourcePixelFormat[k] !=3D dm_mono_16
         ^
   drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c:3321:7: w=
arning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D 0'=
 is always true. [redundantCondition]
         && mode_lib->vba.SourcePixelFormat[k] !=3D dm_mono_16
         ^
   drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c:3383:5: w=
arning: Redundant condition: If 'EXPR =3D=3D 0', the comparison 'EXPR =3D=
=3D 0' is always true. [redundantCondition]
       || mode_lib->vba.SourcePixelFormat[k] =3D=3D dm_mono_16) {
       ^
   drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c:3770:5: w=
arning: Redundant condition: If 'EXPR =3D=3D 0', the comparison 'EXPR =3D=
=3D 0' is always true. [redundantCondition]
       || mode_lib->vba.SourcePixelFormat[k] =3D=3D dm_mono_16
       ^
   drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c:4535:7: w=
arning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D 0'=
 is always true. [redundantCondition]
         && mode_lib->vba.SourcePixelFormat[k] !=3D dm_mono_16
         ^
   drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c:5000:5: w=
arning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D 0'=
 is always true. [redundantCondition]
       && mode_lib->vba.SourcePixelFormat[k] !=3D dm_mono_16
       ^
>> drivers/gpu/drm/amd/display/dc/dml/dml_inline_defs.h:100:28: warning: Ca=
sting from double* to integer* is not portable due to different binary data=
 representations on different platforms. [invalidPointerCast]
    unsigned long long ix =3D *((unsigned long long *)&x);
                              ^
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:6211:6: warning: Unuse=
d variable: i [unusedVariable]
    int i;
        ^
   drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c:3985:47: =
warning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D 0=
' is always true. [redundantCondition]
         && v->SourcePixelFormat[k] !=3D dm_444_16 && v->SourcePixelFormat[=
k] !=3D dm_mono_16
                                                 ^
   drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c:3995:47: =
warning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D 0=
' is always true. [redundantCondition]
         && v->SourcePixelFormat[k] !=3D dm_444_16 && v->SourcePixelFormat[=
k] !=3D dm_mono_16
                                                 ^
   drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c:5657:5: w=
arning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D 0'=
 is always true. [redundantCondition]
       && v->SourcePixelFormat[k] !=3D dm_mono_16 && v->SourcePixelFormat[k=
] !=3D dm_rgbe
       ^
   drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c:6934:116:=
 warning: Redundant condition: If 'EXPR =3D=3D 0', the comparison 'EXPR =3D=
=3D 0' is always true. [redundantCondition]
     if ((SourcePixelFormat[k] =3D=3D dm_444_64 || SourcePixelFormat[k] =3D=
=3D dm_444_32 || SourcePixelFormat[k] =3D=3D dm_444_16 || SourcePixelFormat=
[k] =3D=3D dm_mono_16
                                                                           =
                                           ^
>> drivers/gpu/drm/amd/display/dc/dml/dml_inline_defs.h:100:28: warning: Ca=
sting from double* to integer* is not portable due to different binary data=
 representations on different platforms. [invalidPointerCast]
    unsigned long long ix =3D *((unsigned long long *)&x);
                              ^
   drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c:3668:7: w=
arning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D 0'=
 is always true. [redundantCondition]
         && v->SourcePixelFormat[k] !=3D dm_mono_16
         ^
   drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c:3688:7: w=
arning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D 0'=
 is always true. [redundantCondition]
         && v->SourcePixelFormat[k] !=3D dm_mono_16
         ^
   drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c:5267:124:=
 warning: Redundant condition: If 'EXPR !=3D 0', the comparison 'EXPR !=3D =
0' is always true. [redundantCondition]
     if (v->SourcePixelFormat[k] !=3D dm_444_64 && v->SourcePixelFormat[k] =
!=3D dm_444_32 && v->SourcePixelFormat[k] !=3D dm_444_16 && v->SourcePixelF=
ormat[k] !=3D dm_mono_16
                                                                           =
                                                   ^
   drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c:6342:5: w=
arning: Redundant condition: If 'EXPR =3D=3D 0', the comparison 'EXPR =3D=
=3D 0' is always true. [redundantCondition]
       || SourcePixelFormat[k] =3D=3D dm_mono_16
       ^
>> drivers/gpu/drm/amd/display/dc/dml/dml_inline_defs.h:100:28: warning: Ca=
sting from double* to integer* is not portable due to different binary data=
 representations on different platforms. [invalidPointerCast]
    unsigned long long ix =3D *((unsigned long long *)&x);
                              ^

vim +6211 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

526c654a8a0641 Emily Deng        2019-05-31  6204  =

7578ecda14d521 Alex Deucher      2017-10-10  6205  static void amdgpu_dm_co=
nnector_destroy(struct drm_connector *connector)
e7b07ceef2a650 Harry Wentland    2017-08-10  6206  {
c84dec2fe8837f Harry Wentland    2017-09-05  6207  	struct amdgpu_dm_connec=
tor *aconnector =3D to_amdgpu_dm_connector(connector);
e7b07ceef2a650 Harry Wentland    2017-08-10  6208  	const struct dc_link *l=
ink =3D aconnector->dc_link;
1348969ab68cb8 Luben Tuikov      2020-08-24  6209  	struct amdgpu_device *a=
dev =3D drm_to_adev(connector->dev);
e7b07ceef2a650 Harry Wentland    2017-08-10  6210  	struct amdgpu_display_m=
anager *dm =3D &adev->dm;
7fd13baeb7a3a4 Alex Deucher      2021-07-08 @6211  	int i;
ada8ce1530a7d1 Harry Wentland    2018-04-20  6212  =

5dff80bdce9e38 Andrey Grodzovsky 2020-10-14  6213  	/*
5dff80bdce9e38 Andrey Grodzovsky 2020-10-14  6214  	 * Call only if mst_mgr=
 was iniitalized before since it's not done
5dff80bdce9e38 Andrey Grodzovsky 2020-10-14  6215  	 * for all connector ty=
pes.
5dff80bdce9e38 Andrey Grodzovsky 2020-10-14  6216  	 */
5dff80bdce9e38 Andrey Grodzovsky 2020-10-14  6217  	if (aconnector->mst_mgr=
.dev)
5dff80bdce9e38 Andrey Grodzovsky 2020-10-14  6218  		drm_dp_mst_topology_mg=
r_destroy(&aconnector->mst_mgr);
5dff80bdce9e38 Andrey Grodzovsky 2020-10-14  6219  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0069934690302330621==--

