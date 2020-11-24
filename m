Content-Type: multipart/mixed; boundary="===============6073658400241199450=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [radeon-alex:drm-next 126/295] drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:601:11: warning: Returning pointer to local variable 'formats' that will be invalid when returning.
Date: Wed, 25 Nov 2020 07:14:45 +0800
Message-ID: <202011250735.TcbfAQsc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6073658400241199450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: dri-devel(a)lists.freedesktop.org
TO: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   git://people.freedesktop.org/~agd5f/linux.git drm-next
head:   7ff818f97c306f3e557d724bcebb1df31685f122
commit: 816853f9dc4057b6c7ee3c45ca9bd5905649092e [126/295] drm/amd/display:=
 Set new format info for converted metadata.
:::::: branch date: 6 hours ago
:::::: commit date: 11 days ago
compiler: alpha-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/am=
dgpu_dm_debugfs.c:
>> drivers/gpu/drm/amd/display/dc/core/dc_link.c:3530:6: warning: Uninitial=
ized variable: link_stream [uninitvar]
    if (link_stream->dpms_off)
        ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:2718:42: warning: Uninitialized =
variable: fw_ver [uninitvar]
    return snprintf(buf, PAGE_SIZE, "%xn", fw_ver);
                                            ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/am=
dgpu_dm_debugfs.c:
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c:814:6: warning=
: Variable 'res' is reassigned a value before the old one has been used. 'b=
reak;' missing? [redundantAssignInSwitch]
    res =3D 0;
        ^
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c:771:0: note: V=
ariable 'res' is reassigned a value before the old one has been used. 'brea=
k;' missing?
    int res =3D -ENODEV;
   ^
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c:814:6: note: V=
ariable 'res' is reassigned a value before the old one has been used. 'brea=
k;' missing?
    res =3D 0;
        ^
>> drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c:528:55: warning: Boolean=
 result is used in bitwise operation. Clarify expression with parentheses. =
[clarifyCondition]
    request.address =3D (uint8_t) ((payload->address << 1) | !payload->writ=
e);
                                                         ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1193:16: warning: Shifting signe=
d 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
       dev, pipe, GET_DISTANCE_TO_VBLANKSTART,
                  ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:181:2: warning: Address of loc=
al auto-variable assigned to a function parameter. [autoVariables]
    *f =3D &fence->base;
    ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:601:11: warning: Returning p=
ointer to local variable 'formats' that will be invalid when returning. [re=
turnDanglingLifetime]
      return &formats[i];
             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:601:11: note: Address of var=
iable taken here.
      return &formats[i];
             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:594:49: note: Variable creat=
ed here.
   lookup_format_info(const struct drm_format_info formats[],
                                                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:601:11: note: Returning poin=
ter to local variable 'formats' that will be invalid when returning.
      return &formats[i];
             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1125:14: warning: Shifting s=
igned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigne=
d]
    if (flags & GET_DISTANCE_TO_VBLANKSTART) {
                ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1152:14: warning: Shifting s=
igned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigne=
d]
    if (flags & GET_DISTANCE_TO_VBLANKSTART) {
                ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:322:69: warning: Function 'amdg=
pu_ring_emit_reg_write_reg_wait_helper' argument order different: declarati=
on 'ring, reg0, val0, reg1, val1' definition 'ring, reg0, reg1, ref, mask' =
[funcArgOrderDifferent]
   void amdgpu_ring_emit_reg_write_reg_wait_helper(struct amdgpu_ring *ring,
                                                                       ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h:290:69: note: Function 'amdgpu_=
ring_emit_reg_write_reg_wait_helper' argument order different: declaration =
'ring, reg0, val0, reg1, val1' definition 'ring, reg0, reg1, ref, mask'
   void amdgpu_ring_emit_reg_write_reg_wait_helper(struct amdgpu_ring *ring,
                                                                       ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:322:69: note: Function 'amdgpu_=
ring_emit_reg_write_reg_wait_helper' argument order different: declaration =
'ring, reg0, val0, reg1, val1' definition 'ring, reg0, reg1, ref, mask'
   void amdgpu_ring_emit_reg_write_reg_wait_helper(struct amdgpu_ring *ring,
                                                                       ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:578:17: warning: Boolean result =
is used in bitwise operation. Clarify expression with parentheses. [clarify=
Condition]
    if (!(!!enable ^ !!amdgpu_ras_is_feature_enabled(adev, head)))
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:631:17: warning: Boolean result =
is used in bitwise operation. Clarify expression with parentheses. [clarify=
Condition]
    if (!(!!enable ^ !!amdgpu_ras_is_feature_enabled(adev, head))) {
                   ^
>> drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:851:4: warning: Variable 'r' is r=
eassigned a value before the old one has been used. 'break;' missing? [redu=
ndantAssignInSwitch]
    r =3D amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VMC,
      ^
   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:822:5: note: Variable 'r' is reas=
signed a value before the old one has been used. 'break;' missing?
     r =3D amdgpu_atomfirmware_get_vram_info(adev,
       ^
   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:851:4: note: Variable 'r' is reas=
signed a value before the old one has been used. 'break;' missing?
    r =3D amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VMC,
      ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c:4407:7: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
         PACKET3_MAP_QUEUES_ME(ring->me =3D=3D 1 ? 0 : 1)); /* doorbell */
         ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7181:9: warning: Identical condit=
ion 'r', second condition is always false [identicalConditionAfterEarlyExit]
    return r;
           ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7175:6: note: first condition
    if (r)
        ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7181:9: note: second condition
    return r;
           ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7340:7: warning: Identical inner =
'if' condition is always true. [identicalInnerCondition]
     if (grbm_soft_reset) {
         ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7330:6: note: outer condition: gr=
bm_soft_reset
    if (grbm_soft_reset) {
        ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7340:7: note: identical inner con=
dition: grbm_soft_reset
     if (grbm_soft_reset) {
         ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7209:6: warning: Unused variable:=
 r [unusedVariable]
    int r;
        ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1664:9: warning: Identical conditi=
on 'r', second condition is always false [identicalConditionAfterEarlyExit]
    return r;
           ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1661:6: note: first condition
    if (r)
        ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1664:9: note: second condition
    return r;
           ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:3912:9: warning: Identical conditi=
on 'r', second condition is always false [identicalConditionAfterEarlyExit]
    return r;
           ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:3909:6: note: first condition
    if (r)
        ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:3912:9: note: second condition
    return r;
           ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4035:7: warning: Identical inner '=
if' condition is always true. [identicalInnerCondition]
     if (grbm_soft_reset) {
         ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4024:6: note: outer condition: grb=
m_soft_reset
    if (grbm_soft_reset) {
        ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4035:7: note: identical inner cond=
ition: grbm_soft_reset
     if (grbm_soft_reset) {
         ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4432:27: warning: Shifting signed =
32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    amdgpu_ring_write(ring, (PACKET3_DMA_DATA_CP_SYNC |
                             ^

vim +/formats +601 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c

816853f9dc4057b Bas Nieuwenhuizen 2020-11-11  592  =

816853f9dc4057b Bas Nieuwenhuizen 2020-11-11  593  static const struct drm_=
format_info *
816853f9dc4057b Bas Nieuwenhuizen 2020-11-11  594  lookup_format_info(const=
 struct drm_format_info formats[],
816853f9dc4057b Bas Nieuwenhuizen 2020-11-11  595  		  int num_formats, u32=
 format)
816853f9dc4057b Bas Nieuwenhuizen 2020-11-11  596  {
816853f9dc4057b Bas Nieuwenhuizen 2020-11-11  597  	int i;
816853f9dc4057b Bas Nieuwenhuizen 2020-11-11  598  =

816853f9dc4057b Bas Nieuwenhuizen 2020-11-11  599  	for (i =3D 0; i < num_f=
ormats; i++) {
816853f9dc4057b Bas Nieuwenhuizen 2020-11-11  600  		if (formats[i].format =
=3D=3D format)
816853f9dc4057b Bas Nieuwenhuizen 2020-11-11 @601  			return &formats[i];
816853f9dc4057b Bas Nieuwenhuizen 2020-11-11  602  	}
816853f9dc4057b Bas Nieuwenhuizen 2020-11-11  603  =

816853f9dc4057b Bas Nieuwenhuizen 2020-11-11  604  	return NULL;
816853f9dc4057b Bas Nieuwenhuizen 2020-11-11  605  }
816853f9dc4057b Bas Nieuwenhuizen 2020-11-11  606  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6073658400241199450==--

