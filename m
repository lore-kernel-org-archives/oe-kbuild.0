Content-Type: multipart/mixed; boundary="===============3889019834094614195=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_apg.c:124:2: warning: Value stored to 'speakers' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 30 Nov 2021 04:22:37 +0800
Message-ID: <202111300439.S9nMj4kS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3889019834094614195==
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
head:   d58071a8a76d779eedab38033ae4c821c30295a5
commit: 61452908a79ec936660494fb4b9f2a35ee42e6e0 drm/amd/display: Add DP 2.=
0 Audio Package Generator
date:   3 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-c007-20211128 (https://download.01.org/0day-ci/ar=
chive/20211130/202111300439.S9nMj4kS-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D61452908a79ec936660494fb4b9f2a35ee42e6e0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 61452908a79ec936660494fb4b9f2a35ee42e6e0
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1557:11: note: Returning from 'am=
dgpu_vm_level_shift'
                   shift =3D amdgpu_vm_level_shift(adev, cursor.level);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1557:3: note: The value 429496729=
5 is assigned to 'shift'
                   shift =3D amdgpu_vm_level_shift(adev, cursor.level);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1559:15: note: Field 'unlocked' i=
s true
                   if (params->unlocked) {
                               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1559:3: note: Taking true branch
                   if (params->unlocked) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1561:8: note: Assuming the condit=
ion is false
                           if (amdgpu_vm_pt_descendant(adev, &cursor))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1561:4: note: Taking false branch
                           if (amdgpu_vm_pt_descendant(adev, &cursor))
                           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1588:7: note: Assuming 'pt' is no=
n-null
                   if (!pt) {
                       ^~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1588:3: note: Taking false branch
                   if (!pt) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1606:41: note: The result of the =
left shift is undefined due to shifting by '4294967295', which is greater o=
r equal to the width of type 'uint64_t'
                   incr =3D (uint64_t)AMDGPU_GPU_PAGE_SIZE << shift;
                                                         ^  ~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   7 warnings generated.
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_apg.c:124:2: warnin=
g: Value stored to 'speakers' is never read [clang-analyzer-deadcode.DeadSt=
ores]
           speakers =3D audio_info->flags.info.ALLSPEAKERS;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_apg.c:124:2: note: =
Value stored to 'speakers' is never read
           speakers =3D audio_info->flags.info.ALLSPEAKERS;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_apg.c:125:2: warnin=
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/nfs/nfs4session.c:127:10: warning: The left operand of '=3D=3D' is a =
garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (*p =3D=3D NULL) {
                          ^
   fs/nfs/nfs4session.c:405:2: note: Loop condition is true.  Entering loop=
 body
           for (;;) {
           ^
   fs/nfs/nfs4session.c:406:8: note: Calling 'nfs41_try_wake_next_slot_tabl=
e_entry'
                   if (!nfs41_try_wake_next_slot_table_entry(tbl))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:393:27: note: Calling 'nfs4_alloc_slot'
           struct nfs4_slot *slot =3D nfs4_alloc_slot(tbl);
                                    ^~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:247:2: note: Loop condition is false.  Exiting loop
           dprintk("--> %s used_slots=3D%04lx highest_used=3D%u max_slots=
=3D%u\n",
           ^
   include/linux/sunrpc/debug.h:25:2: note: expanded from macro 'dprintk'
           dfprintk(FACILITY, fmt, ##__VA_ARGS__)
           ^
   include/linux/sunrpc/debug.h:70:34: note: expanded from macro 'dfprintk'
   # define dfprintk(fac, fmt, ...)        do {} while (0)
                                           ^
   fs/nfs/nfs4session.c:251:6: note: Assuming 'slotid' is <=3D field 'max_s=
lotid'
           if (slotid <=3D tbl->max_slotid) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:251:2: note: Taking true branch
           if (slotid <=3D tbl->max_slotid) {
           ^
   fs/nfs/nfs4session.c:252:9: note: Calling 'nfs4_find_or_create_slot'
                   ret =3D nfs4_find_or_create_slot(tbl, slotid, 1, GFP_NOW=
AIT);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/nfs/nfs4session.c:126:2: note: Loop condition is true.  Entering loop=
 body
           for (;;) {
           ^
   fs/nfs/nfs4session.c:127:7: note: Assuming the condition is true
                   if (*p =3D=3D NULL) {
                       ^~~~~~~~~~
   fs/nfs/nfs4session.c:127:3: note: Taking true branch
                   if (*p =3D=3D NULL) {
                   ^
   fs/nfs/nfs4session.c:128:9: note: Calling 'nfs4_new_slot'
                           *p =3D nfs4_new_slot(tbl, tbl->max_slots,
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:109:9: note: Calling 'kzalloc'
           slot =3D kzalloc(sizeof(*slot), gfp_mask);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Uninitialized value stored to field 'n=
ext'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:109:9: note: Returning from 'kzalloc'
           slot =3D kzalloc(sizeof(*slot), gfp_mask);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:110:6: note: Assuming 'slot' is non-null
           if (slot) {
               ^~~~
   fs/nfs/nfs4session.c:110:2: note: Taking true branch
           if (slot) {
           ^
   fs/nfs/nfs4session.c:128:9: note: Returning from 'nfs4_new_slot'
                           *p =3D nfs4_new_slot(tbl, tbl->max_slots,
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:130:4: note: Taking false branch
                           if (*p =3D=3D NULL)
                           ^
   fs/nfs/nfs4session.c:135:7: note: Assuming 'slotid' is not equal to fiel=
d 'slot_nr'
                   if (slot->slot_nr =3D=3D slotid)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:135:3: note: Taking false branch
                   if (slot->slot_nr =3D=3D slotid)
                   ^
   fs/nfs/nfs4session.c:126:2: note: Loop condition is true.  Entering loop=
 body
           for (;;) {

vim +/speakers +124 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_ap=
g.c

61452908a79ec9 Fangzhi Zuo 2021-06-09  108  =

61452908a79ec9 Fangzhi Zuo 2021-06-09  109  static void apg31_se_audio_setu=
p(
61452908a79ec9 Fangzhi Zuo 2021-06-09  110  	struct apg *apg,
61452908a79ec9 Fangzhi Zuo 2021-06-09  111  	unsigned int az_inst,
61452908a79ec9 Fangzhi Zuo 2021-06-09  112  	struct audio_info *audio_info)
61452908a79ec9 Fangzhi Zuo 2021-06-09  113  {
61452908a79ec9 Fangzhi Zuo 2021-06-09  114  	struct dcn31_apg *apg31 =3D DC=
N31_APG_FROM_APG(apg);
61452908a79ec9 Fangzhi Zuo 2021-06-09  115  =

61452908a79ec9 Fangzhi Zuo 2021-06-09  116  	uint32_t speakers =3D 0;
61452908a79ec9 Fangzhi Zuo 2021-06-09  117  	uint32_t channels =3D 0;
61452908a79ec9 Fangzhi Zuo 2021-06-09  118  =

61452908a79ec9 Fangzhi Zuo 2021-06-09  119  	ASSERT(audio_info);
61452908a79ec9 Fangzhi Zuo 2021-06-09  120  	/* This should not happen.it d=
oes so we don't get BSOD*/
61452908a79ec9 Fangzhi Zuo 2021-06-09  121  	if (audio_info =3D=3D NULL)
61452908a79ec9 Fangzhi Zuo 2021-06-09  122  		return;
61452908a79ec9 Fangzhi Zuo 2021-06-09  123  =

61452908a79ec9 Fangzhi Zuo 2021-06-09 @124  	speakers =3D audio_info->flags=
.info.ALLSPEAKERS;
61452908a79ec9 Fangzhi Zuo 2021-06-09 @125  	channels =3D speakers_to_chann=
els(audio_info->flags.speaker_flags).all;
61452908a79ec9 Fangzhi Zuo 2021-06-09  126  =

61452908a79ec9 Fangzhi Zuo 2021-06-09  127  	/* DisplayPort only allows for=
 one audio stream with stream ID 0 */
61452908a79ec9 Fangzhi Zuo 2021-06-09  128  	REG_UPDATE(APG_CONTROL2, APG_D=
P_AUDIO_STREAM_ID, 0);
61452908a79ec9 Fangzhi Zuo 2021-06-09  129  =

61452908a79ec9 Fangzhi Zuo 2021-06-09  130  	/* When running in "pair mode"=
, pairs of audio channels have their own enable
61452908a79ec9 Fangzhi Zuo 2021-06-09  131  	 * this is for really old audi=
o drivers */
61452908a79ec9 Fangzhi Zuo 2021-06-09  132  	REG_UPDATE(APG_DBG_GEN_CONTROL=
, APG_DBG_AUDIO_CHANNEL_ENABLE, 0xF);
61452908a79ec9 Fangzhi Zuo 2021-06-09  133  	// REG_UPDATE(APG_DBG_GEN_CONT=
ROL, APG_DBG_AUDIO_CHANNEL_ENABLE, channels);
61452908a79ec9 Fangzhi Zuo 2021-06-09  134  =

61452908a79ec9 Fangzhi Zuo 2021-06-09  135  	/* Disable forced mem power of=
f */
61452908a79ec9 Fangzhi Zuo 2021-06-09  136  	REG_UPDATE(APG_MEM_PWR, APG_ME=
M_PWR_FORCE, 0);
61452908a79ec9 Fangzhi Zuo 2021-06-09  137  =

61452908a79ec9 Fangzhi Zuo 2021-06-09  138  	apg31_enable(apg);
61452908a79ec9 Fangzhi Zuo 2021-06-09  139  }
61452908a79ec9 Fangzhi Zuo 2021-06-09  140  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3889019834094614195==--

