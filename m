Content-Type: multipart/mixed; boundary="===============3955154871673669669=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1443:42: warning: Uninitialized variable: obj->head [uninitvar]
Date: Sun, 17 Apr 2022 07:16:16 +0800
Message-ID: <202204170739.QD5u2WjC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3955154871673669669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: yipechai <YiPeng.Chai@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Tao Zhou <tao.zhou1@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   90ea17a9e27b5778ec517efb1ce0b81d36905654
commit: 867e24ca4945249baf34ea07ae6b27ca927210a1 drm/amdgpu: define amdgpu_=
ras_late_init to call all ras blocks' .ras_late_init
date:   8 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 weeks ago
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 867e24ca4945249baf34ea07ae6b27ca927210a1
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/gpu/ipu-v3/ipu-dc.c:347:13: warning: Variable 'channel_offsets' =
can be declared with const [constVariable]
    static int channel_offsets[] =3D { 0, 0x1c, 0x38, 0x54, 0x58, 0x5c,
               ^
   drivers/gpu/ipu-v3/ipu-prv.h:146:25: warning: Shifting signed 32-bit val=
ue by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    IPU_CONF_CSI_SEL  =3D (1 << 31),
                           ^
   drivers/gpu/ipu-v3/ipu-prv.h:146:25: warning: Signed integer overflow fo=
r expression '1<<31'. [integerOverflow]
    IPU_CONF_CSI_SEL  =3D (1 << 31),
                           ^
>> drivers/gpu/ipu-v3/ipu-dc.c:114:18: warning: Signed integer overflow for=
 expression '0xffff<<(16*(event&0x1))'. [integerOverflow]
    reg &=3D ~(0xffff << (16 * (event & 0x1)));
                    ^
>> drivers/gpu/ipu-v3/ipu-dc.c:290:18: warning: Signed integer overflow for=
 expression '0xffff<<(16*(ptr&0x1))'. [integerOverflow]
    reg &=3D ~(0xffff << (16 * (ptr & 0x1)));
                    ^
>> drivers/gpu/ipu-v3/ipu-dc.c:304:24: warning: Signed integer overflow for=
 expression '0xffff<<(16*(map&0x1))'. [integerOverflow]
    writel(reg & ~(0xffff << (16 * (map & 0x1))),
                          ^
--
   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/am=
dgpu_dm_helpers.c:
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:902:9: warning=
: Parameter 'pvMem' can be declared with const [constParameter]
     void *pvMem)
           ^
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:909:20: warnin=
g: Uninitialized variable: da->cpu_ptr [uninitvar]
     if (pvMem =3D=3D da->cpu_ptr) {
                      ^
>> drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c:263:27: warning: Paramet=
er 'config' can be declared with const [constParameter]
     struct mod_hdcp_config *config)
                             ^
>> drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c:293:25: warning: Paramet=
er 'link' can be declared with const [constParameter]
     struct mod_hdcp_link *link, struct mod_hdcp_display *display,
                           ^
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:840:17: warning: Signed integer=
 overflow for expression '0x8<<28'. [integerOverflow]
      *rlcg_flag =3D AMDGPU_RLCG_GC_WRITE_LEGACY;
                   ^
>> drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c:505:15: warning: Parameter 'addr' =
can be declared with const [constParameter]
       uint64_t *addr, uint64_t *flags)
                 ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:381:30: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
     ib->ptr[ib->length_dw++] =3D PACKET3(PACKET3_SET_SH_REG, 1);
                                ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:389:29: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    ib->ptr[ib->length_dw++] =3D PACKET3(PACKET3_SET_SH_REG, 2);
                               ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:396:29: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    ib->ptr[ib->length_dw++] =3D PACKET3(PACKET3_SET_SH_REG, 3);
                               ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:404:29: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    ib->ptr[ib->length_dw++] =3D PACKET3(PACKET3_DISPATCH_DIRECT, 3);
                               ^
>> drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c:726:15: warning: Parameter 'addr' =
can be declared with const [constParameter]
       uint64_t *addr, uint64_t *flags)
                 ^
>> drivers/gpu/drm/amd/display/dc/core/dc_resource.c:423:24: warning: Param=
eter 'clock_source' can be declared with const [constParameter]
     struct clock_source *clock_source)
                          ^
>> drivers/gpu/drm/amd/display/dc/core/dc_resource.c:1292:27: warning: Para=
meter 'stream' can be declared with const [constParameter]
     struct dc_stream_state *stream)
                             ^
   drivers/gpu/drm/amd/display/dc/core/dc_resource.c:1479:27: warning: Para=
meter 'stream' can be declared with const [constParameter]
     struct dc_stream_state *stream,
                             ^
>> drivers/gpu/drm/amd/display/dc/core/dc_resource.c:1480:26: warning: Para=
meter 'plane_state' can be declared with const [constParameter]
     struct dc_plane_state *plane_state,
                            ^
>> drivers/gpu/drm/amd/display/dc/core/dc_resource.c:1715:26: warning: Para=
meter 'stream_enc' can be declared with const [constParameter]
     struct stream_encoder *stream_enc,
                            ^
>> drivers/gpu/drm/amd/display/dc/core/dc_resource.c:1729:33: warning: Para=
meter 'hpo_dp_stream_enc' can be declared with const [constParameter]
     struct hpo_dp_stream_encoder *hpo_dp_stream_enc,
                                   ^
>> drivers/gpu/drm/amd/display/dc/core/dc_resource.c:1832:17: warning: Para=
meter 'audio' can be declared with const [constParameter]
     struct audio *audio,
                   ^
>> drivers/gpu/drm/amd/display/dc/core/dc.c:433:27: warning: Parameter 'str=
eam' can be declared with const [constParameter]
     struct dc_stream_state *stream,
                             ^
>> drivers/gpu/drm/amd/display/dc/core/dc.c:461:28: warning: Parameter 'str=
eams' can be declared with const [constParameter]
     struct dc_stream_state **streams, int num_streams,
                              ^
   drivers/gpu/drm/amd/display/dc/core/dc.c:579:69: warning: Parameter 'str=
eam' can be declared with const [constParameter]
   bool dc_stream_configure_crc(struct dc *dc, struct dc_stream_state *stre=
am,
                                                                       ^
   drivers/gpu/drm/amd/display/dc/core/dc.c:645:63: warning: Parameter 'str=
eam' can be declared with const [constParameter]
   bool dc_stream_get_crc(struct dc *dc, struct dc_stream_state *stream,
                                                                 ^
   drivers/gpu/drm/amd/display/dc/core/dc.c:770:28: warning: Parameter 'str=
eams' can be declared with const [constParameter]
     struct dc_stream_state **streams,
                              ^
   drivers/gpu/drm/amd/display/dc/core/dc.c:1039:32: warning: Parameter 'st=
ream' can be declared with const [constParameter]
          struct dc_stream_state *stream, bool lock)
                                  ^
   drivers/gpu/drm/amd/display/dc/core/dc.c:1610:27: warning: Parameter 'st=
ream' can be declared with const [constParameter]
     struct dc_stream_state *stream)
                             ^
>> drivers/gpu/drm/amd/display/dc/core/dc.c:1618:26: warning: Parameter 'pl=
ane_state' can be declared with const [constParameter]
     struct dc_plane_state *plane_state)
                            ^
   drivers/gpu/drm/amd/display/dc/core/dc.c:2456:26: warning: Parameter 'st=
ream' can be declared with const [constParameter]
    struct dc_stream_state *stream)
                            ^
   drivers/gpu/drm/amd/display/dc/core/dc.c:1858:27: warning: Parameter 'st=
ream' can be declared with const [constParameter]
     struct dc_stream_state *stream,
                             ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1443:42: warning: Uninitialized =
variable: obj->head [uninitvar]
     if (amdgpu_ras_is_supported(adev, obj->head.block) &&
                                            ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1437:35: note: Assuming conditio=
n is false
    if (!IS_ENABLED(CONFIG_DEBUG_FS) || !con)
                                     ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1443:42: note: Uninitialized var=
iable: obj->head
     if (amdgpu_ras_is_supported(adev, obj->head.block) &&
                                            ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2503:44: warning: Uninitialized =
variable: obj->head [uninitvar]
      if (!amdgpu_ras_is_supported(adev, obj->head.block)) {
                                              ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2483:25: note: Assuming conditio=
n is false
    if (!adev->ras_enabled || !con) {
                           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2503:44: note: Uninitialized var=
iable: obj->head
      if (!amdgpu_ras_is_supported(adev, obj->head.block)) {
                                              ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2532:14: warning: Uninitialized =
variable: node->ras_obj [uninitvar]
     if (!node->ras_obj) {
                ^
>> drivers/gpu/drm/amd/display/dc/core/dc_link.c:4478:32: warning: Paramete=
r 'link_setting' can be declared with const [constParameter]
         struct dc_link_settings *link_setting,
                                  ^
>> drivers/gpu/drm/amd/display/dc/core/dc_link.c:4523:43: warning: Paramete=
r 'lt_overrides' can be declared with const [constParameter]
          struct dc_link_training_overrides *lt_overrides,
                                             ^
>> drivers/gpu/drm/amd/display/dc/core/dc_link.c:4794:61: warning: Paramete=
r 'map' can be declared with const [constParameter]
   void dc_restore_link_res_map(const struct dc *dc, uint32_t *map)
                                                               ^
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c:2507:36: warning: =
syntax error [syntaxError]
      "Failed to upload FuseOVerride!",
                                      ^
--
           ^
   drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c:5100:9: note: status is=
 overwritten
    status =3D core_link_read_dpcd(link, DP_SET_POWER,
           ^
>> drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c:3199:27: warning: Param=
eter 'known_limit_link_setting' can be declared with const [constParameter]
    struct dc_link_settings *known_limit_link_setting,
                             ^
>> drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c:4448:6: warning: Uninit=
ialized variable: pipe_ctx [uninitvar]
    if (pipe_ctx =3D=3D NULL || pipe_ctx->stream =3D=3D NULL)
        ^
   drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c:4442:16: note: Assuming=
 condition is false
    for (i =3D 0; i < MAX_PIPES; i++) {
                  ^
   drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c:4448:6: note: Uninitial=
ized variable: pipe_ctx
    if (pipe_ctx =3D=3D NULL || pipe_ctx->stream =3D=3D NULL)
        ^
>> drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c:34:35: warning: Uninitia=
lized variable: msg [uninitvar]
     container_of(hdr, typeof(*msg), msg.hdr);
                                     ^
--
>> drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c:34:35: warning: Uninitia=
lized variable: msg [uninitvar]
     container_of(hdr, typeof(*msg), msg.hdr);
                                     ^
   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c:139:35: warning: Uniniti=
alized variable: msg [uninitvar]
     container_of(hdr, typeof(*msg), msg.hdr);
                                     ^
--
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:9587:19: warning: Either the cond=
ition 'i<4' is redundant or the array 'cu_info->bitmap[4][4]' is accessed a=
t index cu_info->bitmap[4][*], which is out of bounds. [arrayIndexOutOfBoun=
dsCond]
      cu_info->bitmap[i][j] =3D bitmap;
                     ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:9583:10: note: Assuming that cond=
ition 'i<4' is not redundant
      if (i < 4 && j < 2)
            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:9587:19: note: Array index out of=
 bounds
      cu_info->bitmap[i][j] =3D bitmap;
                     ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7616:7: warning: Identical inner =
'if' condition is always true. [identicalInnerCondition]
     if (grbm_soft_reset) {
         ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7606:6: note: outer condition: gr=
bm_soft_reset
    if (grbm_soft_reset) {
        ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7616:7: note: identical inner con=
dition: grbm_soft_reset
     if (grbm_soft_reset) {
         ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3476:30: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_SET_RESOURCES, 6));
                                ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3495:30: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_MAP_QUEUES, 5));
                                ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3521:30: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_UNMAP_QUEUES, 4));
                                ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3548:30: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_QUERY_STATUS, 5));
                                ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3552:6: warning: Signed integer o=
verflow for expression '2<<30'. [integerOverflow]
        PACKET3_QUERY_STATUS_COMMAND(2));
        ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3566:30: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_INVALIDATE_TLBS, 0));
                                ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3702:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3715:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_WAIT_REG_MEM, 5));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3756:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_SET_UCONFIG_REG, 1));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3801:14: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    ib.ptr[0] =3D PACKET3(PACKET3_WRITE_DATA, 3);
                ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4298:32: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    buffer[count++] =3D cpu_to_le32(PACKET3(PACKET3_PREAMBLE_CNTL, 0));
                                  ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4301:32: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    buffer[count++] =3D cpu_to_le32(PACKET3(PACKET3_CONTEXT_CONTROL, 1));
                                  ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4309:18: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
        cpu_to_le32(PACKET3(PACKET3_SET_CONTEXT_REG, ext->reg_count));
                    ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4322:32: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    buffer[count++] =3D cpu_to_le32(PACKET3(PACKET3_SET_CONTEXT_REG, 1));
                                  ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4326:32: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    buffer[count++] =3D cpu_to_le32(PACKET3(PACKET3_PREAMBLE_CNTL, 0));
                                  ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4329:32: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    buffer[count++] =3D cpu_to_le32(PACKET3(PACKET3_CLEAR_STATE, 0));
                                  ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6159:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_PREAMBLE_CNTL, 0));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6162:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_CONTEXT_CONTROL, 1));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6170:9: warning: Signed integer o=
verflow for expression '3<<30'. [integerOverflow]
           PACKET3(PACKET3_SET_CONTEXT_REG,
           ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6182:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_SET_CONTEXT_REG, 1));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6186:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_PREAMBLE_CNTL, 0));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6189:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_CLEAR_STATE, 0));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6192:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_SET_BASE, 2));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6209:27: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
     amdgpu_ring_write(ring, PACKET3(PACKET3_CLEAR_STATE, 0));
                             ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8525:12: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
     header =3D PACKET3(PACKET3_INDIRECT_BUFFER_CNST, 2);
              ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8527:12: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
     header =3D PACKET3(PACKET3_INDIRECT_BUFFER, 2);
              ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8572:27: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
     amdgpu_ring_write(ring, PACKET3(PACKET3_SET_CONFIG_REG, 1));
                             ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8577:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_INDIRECT_BUFFER, 2));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8595:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_RELEASE_MEM, 6));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8639:27: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
     amdgpu_ring_write(ring, PACKET3(PACKET3_PFP_SYNC_ME, 0));
                             ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8653:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8662:27: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
     amdgpu_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
                             ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8673:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_SWITCH_BUFFER, 0));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8706:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_CONTEXT_CONTROL, 1));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8715:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_COND_EXEC, 3));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8795:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, cnt));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8796:27: warning: Signed integer =
overflow for expression '2<<30'. [integerOverflow]
    amdgpu_ring_write(ring, (WRITE_DATA_ENGINE_SEL(2) |
                             ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8829:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, cnt));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8854:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_FRAME_CONTROL, 0));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8863:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_COPY_DATA, 4));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8891:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:9272:26: warning: Signed integer =
overflow for expression '3<<30'. [integerOverflow]
    amdgpu_ring_write(ring, PACKET3(PACKET3_ACQUIRE_MEM, 6));
                            ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:9303:9: warning: Signed integer o=
verflow for expression '3<<30'. [integerOverflow]
    .nop =3D PACKET3(PACKET3_NOP, 0x3FFF),
           ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:9358:9: warning: Signed integer o=
verflow for expression '3<<30'. [integerOverflow]
    .nop =3D PACKET3(PACKET3_NOP, 0x3FFF),
           ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:9394:9: warning: Signed integer o=
verflow for expression '3<<30'. [integerOverflow]
    .nop =3D PACKET3(PACKET3_NOP, 0x3FFF),
           ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:9550:25: warning: Signed integer =
overflow for expression '3<<(2*wgp_idx)'. [integerOverflow]
     cu_bitmap_per_wgp =3D 3 << (2 * wgp_idx);
                           ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:9548:28: note: Assuming that cond=
ition 'wgp_idx<16' is not redundant
    for (wgp_idx =3D 0; wgp_idx < 16; wgp_idx++) {
                              ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:9550:25: note: Integer overflow
     cu_bitmap_per_wgp =3D 3 << (2 * wgp_idx);
                           ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7477:6: warning: Unused variable:=
 r [unusedVariable]
    int r;
        ^

vim +1443 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c

c030f2e4166c3f xinhui pan    2018-10-31  1425  =

f9317014ea517e Tao Zhou      2020-03-06  1426  void amdgpu_ras_debugfs_crea=
te_all(struct amdgpu_device *adev)
f9317014ea517e Tao Zhou      2020-03-06  1427  {
f9317014ea517e Tao Zhou      2020-03-06  1428  	struct amdgpu_ras *con =3D =
amdgpu_ras_get_context(adev);
88293c03c87e4d Nirmoy Das    2021-02-10  1429  	struct dentry *dir;
c1509f3f6fa41a Stanley.Yang  2020-03-12  1430  	struct ras_manager *obj;
f9317014ea517e Tao Zhou      2020-03-06  1431  	struct ras_fs_if fs_info;
f9317014ea517e Tao Zhou      2020-03-06  1432  =

f9317014ea517e Tao Zhou      2020-03-06  1433  	/*
f9317014ea517e Tao Zhou      2020-03-06  1434  	 * it won't be called in re=
sume path, no need to check
f9317014ea517e Tao Zhou      2020-03-06  1435  	 * suspend and gpu reset st=
atus
f9317014ea517e Tao Zhou      2020-03-06  1436  	 */
cedf788459683b Arnd Bergmann 2020-12-04  1437  	if (!IS_ENABLED(CONFIG_DEBU=
G_FS) || !con)
f9317014ea517e Tao Zhou      2020-03-06  1438  		return;
f9317014ea517e Tao Zhou      2020-03-06  1439  =

88293c03c87e4d Nirmoy Das    2021-02-10  1440  	dir =3D amdgpu_ras_debugfs_=
create_ctrl_node(adev);
f9317014ea517e Tao Zhou      2020-03-06  1441  =

c1509f3f6fa41a Stanley.Yang  2020-03-12  1442  	list_for_each_entry(obj, &c=
on->head, node) {
f9317014ea517e Tao Zhou      2020-03-06 @1443  		if (amdgpu_ras_is_supporte=
d(adev, obj->head.block) &&
f9317014ea517e Tao Zhou      2020-03-06  1444  			(obj->attr_inuse =3D=3D 1=
)) {
f9317014ea517e Tao Zhou      2020-03-06  1445  			sprintf(fs_info.debugfs_n=
ame, "%s_err_inject",
640ae42efb828b John Clements 2021-09-22  1446  					get_ras_block_str(&obj-=
>head));
f9317014ea517e Tao Zhou      2020-03-06  1447  			fs_info.head =3D obj->hea=
d;
88293c03c87e4d Nirmoy Das    2021-02-10  1448  			amdgpu_ras_debugfs_create=
(adev, &fs_info, dir);
f9317014ea517e Tao Zhou      2020-03-06  1449  		}
f9317014ea517e Tao Zhou      2020-03-06  1450  	}
c030f2e4166c3f xinhui pan    2018-10-31  1451  }
c030f2e4166c3f xinhui pan    2018-10-31  1452  =


:::::: The code at line 1443 was first introduced by commit
:::::: f9317014ea517e13a59b9d437948c5ab17ce4ed7 drm/amdgpu: add function to=
 creat all ras debugfs node

:::::: TO: Tao Zhou <tao.zhou1@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3955154871673669669==--

