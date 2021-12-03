Content-Type: multipart/mixed; boundary="===============1608319876949644716=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:568:59: warning: Uninitialized variable: peer_adev [uninitvar]
Date: Sat, 04 Dec 2021 00:09:01 +0800
Message-ID: <202112032317.OQnNOJfM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1608319876949644716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jonathan Kim <jonathan.kim@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Felix Kuehling <felix.kuehling@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5f58da2befa58edf3a70b91ed87ed9bf77f1e70e
commit: 3f46c4e9ce25bbcb9d619dbce57c8737c856b272 drm/amdkfd: report xgmi ba=
ndwidth between direct peers to the kfd
date:   4 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 4 months ago
compiler: alpha-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/radeon/r600.c:2655:0: warning: failed to expand 'WREG32'=
, it is invalid to use a preprocessor directive as macro parameter [preproc=
essorErrorDirective]
   #ifdef __BIG_ENDIAN
   ^
--
>> drivers/gpu/drm/radeon/evergreen.c:2970:0: warning: failed to expand 'WR=
EG32', it is invalid to use a preprocessor directive as macro parameter [pr=
eprocessorErrorDirective]
   #ifdef __BIG_ENDIAN
   ^
--
>> drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4115:7: warning: Identical inner '=
if' condition is always true. [identicalInnerCondition]
     if (grbm_soft_reset) {
         ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4104:6: note: outer condition: grb=
m_soft_reset
    if (grbm_soft_reset) {
        ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4115:7: note: identical inner cond=
ition: grbm_soft_reset
     if (grbm_soft_reset) {
         ^
>> drivers/gpu/drm/radeon/cik.c:9712:7: warning: Identical inner 'if' condi=
tion is always true. [identicalInnerCondition]
     if (!disable_plloff_in_l1) {
         ^
   drivers/gpu/drm/radeon/cik.c:9671:41: note: 'disable_l1' is assigned val=
ue 'false' here.
    bool disable_l0s =3D false, disable_l1 =3D false, disable_plloff_in_l1 =
=3D false;
                                           ^
   drivers/gpu/drm/radeon/cik.c:9671:71: note: 'disable_plloff_in_l1' is as=
signed value 'false' here.
    bool disable_l0s =3D false, disable_l1 =3D false, disable_plloff_in_l1 =
=3D false;
                                                                         ^
   drivers/gpu/drm/radeon/cik.c:9706:6: note: outer condition: !disable_l1
    if (!disable_l1) {
        ^
   drivers/gpu/drm/radeon/cik.c:9712:7: note: identical inner condition: !d=
isable_plloff_in_l1
     if (!disable_plloff_in_l1) {
         ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7589:7: warning: Identical inner =
'if' condition is always true. [identicalInnerCondition]
     if (grbm_soft_reset) {
         ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7579:6: note: outer condition: gr=
bm_soft_reset
    if (grbm_soft_reset) {
        ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7589:7: note: identical inner con=
dition: grbm_soft_reset
     if (grbm_soft_reset) {
         ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7450:6: warning: Unused variable:=
 r [unusedVariable]
    int r;
        ^
>> drivers/gpu/drm/nouveau/dispnv04/hw.h:267:2: warning: Non-boolean value =
returned from function returning bool [returnNonBoolInBooleanFunction]
    return NVReadVgaCrtc(dev, 0, NV_CIO_CRE_44) & 0x4;
    ^
   drivers/gpu/drm/nouveau/dispnv04/hw.h:283:2: warning: Non-boolean value =
returned from function returning bool [returnNonBoolInBooleanFunction]
    return waslocked;
    ^
>> drivers/gpu/drm/nouveau/dispnv04/hw.h:379:15: warning: Same value in bot=
h branches of ternary operator. [duplicateValueTernary]
     *curctl1 |=3D MASK(NV_CIO_CRE_HCUR_ADDR1_ENABLE);
                 ^
   drivers/gpu/drm/nouveau/dispnv04/hw.h:381:16: warning: Same value in bot=
h branches of ternary operator. [duplicateValueTernary]
     *curctl1 &=3D ~MASK(NV_CIO_CRE_HCUR_ADDR1_ENABLE);
                  ^
>> drivers/gpu/drm/nouveau/dispnv04/crtc.c:351:36: warning: Same value in b=
oth branches of ternary operator. [duplicateValueTernary]
    regp->CRTC[NV_CIO_CR_HRE_INDEX] =3D XLATE(horizBlankEnd, 5, NV_CIO_CR_H=
RE_HBE_5) |
                                      ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:354:36: warning: Same value in b=
oth branches of ternary operator. [duplicateValueTernary]
    regp->CRTC[NV_CIO_CR_OVL_INDEX] =3D XLATE(vertStart, 9, NV_CIO_CR_OVL_V=
RS_9) |
                                      ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:355:8: warning: Same value in bo=
th branches of ternary operator. [duplicateValueTernary]
          XLATE(vertDisplay, 9, NV_CIO_CR_OVL_VDE_9) |
          ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:356:8: warning: Same value in bo=
th branches of ternary operator. [duplicateValueTernary]
          XLATE(vertTotal, 9, NV_CIO_CR_OVL_VDT_9) |
          ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:358:8: warning: Same value in bo=
th branches of ternary operator. [duplicateValueTernary]
          XLATE(vertBlankStart, 8, NV_CIO_CR_OVL_VBS_8) |
          ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:359:8: warning: Same value in bo=
th branches of ternary operator. [duplicateValueTernary]
          XLATE(vertStart, 8, NV_CIO_CR_OVL_VRS_8) |
          ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:360:8: warning: Same value in bo=
th branches of ternary operator. [duplicateValueTernary]
          XLATE(vertDisplay, 8, NV_CIO_CR_OVL_VDE_8) |
          ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:361:8: warning: Same value in bo=
th branches of ternary operator. [duplicateValueTernary]
          XLATE(vertTotal, 8, NV_CIO_CR_OVL_VDT_8);
          ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:363:81: warning: Same value in b=
oth branches of ternary operator. [duplicateValueTernary]
    regp->CRTC[NV_CIO_CR_CELL_HT_INDEX] =3D ((mode->flags & DRM_MODE_FLAG_D=
BLSCAN) ? MASK(NV_CIO_CR_CELL_HT_SCANDBL) : 0) |
                                                                           =
        ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:365:12: warning: Same value in b=
oth branches of ternary operator. [duplicateValueTernary]
              XLATE(vertBlankStart, 9, NV_CIO_CR_CELL_HT_VBS_9);
              ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:391:3: warning: Same value in bo=
th branches of ternary operator. [duplicateValueTernary]
     XLATE(fb->pitches[0] / 8, 11, NV_CIO_CRE_42_OFFSET_11);
     ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:393:10: warning: Same value in b=
oth branches of ternary operator. [duplicateValueTernary]
            MASK(NV_CIO_CRE_RPC1_LARGE) : 0x00;
            ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:394:37: warning: Same value in b=
oth branches of ternary operator. [duplicateValueTernary]
    regp->CRTC[NV_CIO_CRE_LSR_INDEX] =3D XLATE(horizBlankEnd, 6, NV_CIO_CRE=
_LSR_HBE_6) |
                                       ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:395:9: warning: Same value in bo=
th branches of ternary operator. [duplicateValueTernary]
           XLATE(vertBlankStart, 10, NV_CIO_CRE_LSR_VBS_10) |
           ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:396:9: warning: Same value in bo=
th branches of ternary operator. [duplicateValueTernary]
           XLATE(vertStart, 10, NV_CIO_CRE_LSR_VRS_10) |
           ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:397:9: warning: Same value in bo=
th branches of ternary operator. [duplicateValueTernary]
           XLATE(vertDisplay, 10, NV_CIO_CRE_LSR_VDE_10) |
           ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:398:9: warning: Same value in bo=
th branches of ternary operator. [duplicateValueTernary]
           XLATE(vertTotal, 10, NV_CIO_CRE_LSR_VDT_10);
           ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:399:38: warning: Same value in b=
oth branches of ternary operator. [duplicateValueTernary]
    regp->CRTC[NV_CIO_CRE_HEB__INDEX] =3D XLATE(horizStart, 8, NV_CIO_CRE_H=
EB_HRS_8) |
                                        ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:400:10: warning: Same value in b=
oth branches of ternary operator. [duplicateValueTernary]
            XLATE(horizBlankStart, 8, NV_CIO_CRE_HEB_HBS_8) |
            ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:401:10: warning: Same value in b=
oth branches of ternary operator. [duplicateValueTernary]
            XLATE(horizDisplay, 8, NV_CIO_CRE_HEB_HDE_8) |
            ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:402:10: warning: Same value in b=
oth branches of ternary operator. [duplicateValueTernary]
            XLATE(horizTotal, 8, NV_CIO_CRE_HEB_HDT_8);
            ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:403:37: warning: Same value in b=
oth branches of ternary operator. [duplicateValueTernary]
    regp->CRTC[NV_CIO_CRE_EBR_INDEX] =3D XLATE(vertBlankStart, 11, NV_CIO_C=
RE_EBR_VBS_11) |
                                       ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:404:9: warning: Same value in bo=
th branches of ternary operator. [duplicateValueTernary]
           XLATE(vertStart, 11, NV_CIO_CRE_EBR_VRS_11) |
           ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:405:9: warning: Same value in bo=
th branches of ternary operator. [duplicateValueTernary]
           XLATE(vertDisplay, 11, NV_CIO_CRE_EBR_VDE_11) |
           ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:406:9: warning: Same value in bo=
th branches of ternary operator. [duplicateValueTernary]
           XLATE(vertTotal, 11, NV_CIO_CRE_EBR_VDT_11);
           ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:411:40: warning: Same value in b=
oth branches of ternary operator. [duplicateValueTernary]
     regp->CRTC[NV_CIO_CRE_HEB__INDEX] |=3D XLATE(horizTotal, 8, NV_CIO_CRE=
_HEB_ILC_8);
                                          ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:875:3: warning: Same value in bo=
th branches of ternary operator. [duplicateValueTernary]
     XLATE(drm_fb->pitches[0] / 8, 11, NV_CIO_CRE_42_OFFSET_11);
     ^
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:738:10: warning: Same value in b=
oth branches of ternary operator. [duplicateValueTernary]
     tmp |=3D MASK(NV_CIO_CRE_RCR_ENDIAN_BIG);
            ^
--
>> drivers/net/ethernet/chelsio/cxgb4vf/sge.c:932:6: warning: Suspicious co=
ndition (assignment + comparison); Clarify expression with parentheses. [cl=
arifyCondition]
    for (i =3D (nfrags !=3D si->nr_frags); nfrags >=3D 2; nfrags -=3D 2, to=
++) {
        ^
>> drivers/gpu/drm/nouveau/dispnv50/disp.c:176:0: warning: syntax error [sy=
ntaxError]
   =

   ^
--
>> drivers/net/ethernet/chelsio/cxgb4/sge.c:868:6: warning: Suspicious cond=
ition (assignment + comparison); Clarify expression with parentheses. [clar=
ifyCondition]
    for (i =3D (nfrags !=3D si->nr_frags); nfrags >=3D 2; nfrags -=3D 2, to=
++) {
        ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:568:59: warning: Uninitialize=
d variable: peer_adev [uninitvar]
    num_links =3D is_min ? 1 : amdgpu_xgmi_get_num_links(adev, peer_adev);
                                                             ^

vim +568 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c

db8b62c04b2344 Shaoyun Liu  2018-07-06  555  =

3f46c4e9ce25bb Jonathan Kim 2021-05-12  556  int amdgpu_amdkfd_get_xgmi_ban=
dwidth_mbytes(struct kgd_dev *dst, struct kgd_dev *src, bool is_min)
3f46c4e9ce25bb Jonathan Kim 2021-05-12  557  {
3f46c4e9ce25bb Jonathan Kim 2021-05-12  558  	struct amdgpu_device *adev =
=3D (struct amdgpu_device *)dst, *peer_adev;
3f46c4e9ce25bb Jonathan Kim 2021-05-12  559  	int num_links;
3f46c4e9ce25bb Jonathan Kim 2021-05-12  560  =

3f46c4e9ce25bb Jonathan Kim 2021-05-12  561  	if (adev->asic_type !=3D CHIP=
_ALDEBARAN)
3f46c4e9ce25bb Jonathan Kim 2021-05-12  562  		return 0;
3f46c4e9ce25bb Jonathan Kim 2021-05-12  563  =

3f46c4e9ce25bb Jonathan Kim 2021-05-12  564  	if (src)
3f46c4e9ce25bb Jonathan Kim 2021-05-12  565  		peer_adev =3D (struct amdgpu=
_device *)src;
3f46c4e9ce25bb Jonathan Kim 2021-05-12  566  =

3f46c4e9ce25bb Jonathan Kim 2021-05-12  567  	/* num links returns 0 for in=
direct peers since indirect route is unknown. */
3f46c4e9ce25bb Jonathan Kim 2021-05-12 @568  	num_links =3D is_min ? 1 : am=
dgpu_xgmi_get_num_links(adev, peer_adev);
3f46c4e9ce25bb Jonathan Kim 2021-05-12  569  	if (num_links < 0) {
3f46c4e9ce25bb Jonathan Kim 2021-05-12  570  		DRM_ERROR("amdgpu: failed to=
 get xgmi num links between node %d and %d. ret =3D %d\n",
3f46c4e9ce25bb Jonathan Kim 2021-05-12  571  			adev->gmc.xgmi.physical_nod=
e_id,
3f46c4e9ce25bb Jonathan Kim 2021-05-12  572  			peer_adev->gmc.xgmi.physica=
l_node_id, num_links);
3f46c4e9ce25bb Jonathan Kim 2021-05-12  573  		num_links =3D 0;
3f46c4e9ce25bb Jonathan Kim 2021-05-12  574  	}
3f46c4e9ce25bb Jonathan Kim 2021-05-12  575  =

3f46c4e9ce25bb Jonathan Kim 2021-05-12  576  	/* Aldebaran xGMI DPM is defe=
atured so assume x16 x 25Gbps for bandwidth. */
3f46c4e9ce25bb Jonathan Kim 2021-05-12  577  	return (num_links * 16 * 2500=
0)/BITS_PER_BYTE;
3f46c4e9ce25bb Jonathan Kim 2021-05-12  578  }
3f46c4e9ce25bb Jonathan Kim 2021-05-12  579  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1608319876949644716==--

