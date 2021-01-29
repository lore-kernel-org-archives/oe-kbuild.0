Content-Type: multipart/mixed; boundary="===============3749870273814975074=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [agd5f:drm-next 50/60] drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:999 amdgpu_info_ioctl() warn: possible memory leak of 'caps'
Date: Fri, 29 Jan 2021 10:52:11 +0800
Message-ID: <202101291053.Bimdgb2e-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3749870273814975074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Alex Deucher <alexander.deucher@amd.com>
CC: Leo Liu <leo.liu@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   92d7537f76bdb5485d663b49d79297769a0e0aa9
commit: 555fc7fbb2a2b2a13c8d59946ede06c8fe6b85bd [50/60] drm/amdgpu: add IN=
FO ioctl support for querying video caps
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-m001-20210128 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:999 amdgpu_info_ioctl() warn: possi=
ble memory leak of 'caps'

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1004 amdgpu_info_ioctl() warn: poss=
ible memory leak of 'caps'
drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1010 amdgpu_info_ioctl() warn: poss=
ible memory leak of 'caps'

vim +/caps +999 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c

a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   477  =

a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   478  /*
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   479   * Userspa=
ce get information ioctl
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   480   */
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   481  /**
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   482   * amdgpu_=
info_ioctl - answer a device specific request.
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   483   *
8970b698b0cee4 Lee Jones                  2020-11-12   484   * @dev: drm de=
vice pointer
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   485   * @data: =
request object
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   486   * @filp: =
drm filp
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   487   *
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   488   * This fu=
nction is used to pass device specific parameters to the userspace
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   489   * drivers=
.  Examples include: pci device id, pipeline parms, tiling params,
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   490   * etc. (a=
ll asics).
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   491   * Returns=
 0 on success, -EINVAL on failure.
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   492   */
5088d6572e8ff6 Luben Tuikov               2020-11-04   493  int amdgpu_info=
_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   494  {
1348969ab68cb8 Luben Tuikov               2020-08-24   495  	struct amdgpu_=
device *adev =3D drm_to_adev(dev);
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   496  	struct dr=
m_amdgpu_info *info =3D data;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   497  	struct am=
dgpu_mode_info *minfo =3D &adev->mode_info;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   498  	void __us=
er *out =3D (void __user *)(uintptr_t)info->return_pointer;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   499  	uint32_t =
size =3D info->return_size;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   500  	struct dr=
m_crtc *crtc;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   501  	uint32_t =
ui32 =3D 0;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   502  	uint64_t =
ui64 =3D 0;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   503  	int i, fo=
und;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   504  	int ui32_=
size =3D sizeof(ui32);
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   505  =

a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   506  	if (!info=
->return_size || !info->return_pointer)
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   507  		return -=
EINVAL;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   508  =

a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   509  	switch (i=
nfo->query) {
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   510  	case AMDG=
PU_INFO_ACCEL_WORKING:
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   511  		ui32 =3D=
 adev->accel_working;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   512  		return c=
opy_to_user(out, &ui32, min(size, 4u)) ? -EFAULT : 0;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   513  	case AMDG=
PU_INFO_CRTC_FROM_ID:
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   514  		for (i =
=3D 0, found =3D 0; i < adev->mode_info.num_crtc; i++) {
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   515  			crtc =
=3D (struct drm_crtc *)minfo->crtcs[i];
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   516  			if (crt=
c && crtc->base.id =3D=3D info->mode_crtc.id) {
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   517  				struct=
 amdgpu_crtc *amdgpu_crtc =3D to_amdgpu_crtc(crtc);
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   518  				ui32 =
=3D amdgpu_crtc->crtc_id;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   519  				found =
=3D 1;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   520  				break;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   521  			}
d38ceaf99ed015 Alex Deucher               2015-04-20   522  		}
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   523  		if (!fou=
nd) {
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   524  			DRM_DEB=
UG_KMS("unknown crtc id %d\n", info->mode_crtc.id);
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   525  			return =
-EINVAL;
d38ceaf99ed015 Alex Deucher               2015-04-20   526  		}
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   527  		return c=
opy_to_user(out, &ui32, min(size, 4u)) ? -EFAULT : 0;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   528  	case AMDG=
PU_INFO_HW_IP_INFO: {
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   529  		struct d=
rm_amdgpu_info_hw_ip ip =3D {};
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   530  		int ret;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   531  =

a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   532  		ret =3D =
amdgpu_hw_ip_info(adev, info, &ip);
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   533  		if (ret)
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   534  			return =
ret;
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   535  =

a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   536  		ret =3D =
copy_to_user(out, &ip, min((size_t)size, sizeof(ip)));
a245daf3d7a143 Christian K=C3=B6nig            2018-08-01   537  		return r=
et ? -EFAULT : 0;
d38ceaf99ed015 Alex Deucher               2015-04-20   538  	}
d38ceaf99ed015 Alex Deucher               2015-04-20   539  	case AMDGPU_IN=
FO_HW_IP_COUNT: {
5fc3aeeb9e553a yanyang1                   2015-05-22   540  		enum amd_ip_b=
lock_type type;
d38ceaf99ed015 Alex Deucher               2015-04-20   541  		uint32_t coun=
t =3D 0;
d38ceaf99ed015 Alex Deucher               2015-04-20   542  =

d38ceaf99ed015 Alex Deucher               2015-04-20   543  		switch (info-=
>query_hw_ip.type) {
d38ceaf99ed015 Alex Deucher               2015-04-20   544  		case AMDGPU_H=
W_IP_GFX:
5fc3aeeb9e553a yanyang1                   2015-05-22   545  			type =3D AMD=
_IP_BLOCK_TYPE_GFX;
d38ceaf99ed015 Alex Deucher               2015-04-20   546  			break;
d38ceaf99ed015 Alex Deucher               2015-04-20   547  		case AMDGPU_H=
W_IP_COMPUTE:
5fc3aeeb9e553a yanyang1                   2015-05-22   548  			type =3D AMD=
_IP_BLOCK_TYPE_GFX;
d38ceaf99ed015 Alex Deucher               2015-04-20   549  			break;
d38ceaf99ed015 Alex Deucher               2015-04-20   550  		case AMDGPU_H=
W_IP_DMA:
5fc3aeeb9e553a yanyang1                   2015-05-22   551  			type =3D AMD=
_IP_BLOCK_TYPE_SDMA;
d38ceaf99ed015 Alex Deucher               2015-04-20   552  			break;
d38ceaf99ed015 Alex Deucher               2015-04-20   553  		case AMDGPU_H=
W_IP_UVD:
5fc3aeeb9e553a yanyang1                   2015-05-22   554  			type =3D AMD=
_IP_BLOCK_TYPE_UVD;
d38ceaf99ed015 Alex Deucher               2015-04-20   555  			break;
d38ceaf99ed015 Alex Deucher               2015-04-20   556  		case AMDGPU_H=
W_IP_VCE:
5fc3aeeb9e553a yanyang1                   2015-05-22   557  			type =3D AMD=
_IP_BLOCK_TYPE_VCE;
d38ceaf99ed015 Alex Deucher               2015-04-20   558  			break;
63defd3f677ef4 Leo Liu                    2017-01-10   559  		case AMDGPU_H=
W_IP_UVD_ENC:
63defd3f677ef4 Leo Liu                    2017-01-10   560  			type =3D AMD=
_IP_BLOCK_TYPE_UVD;
63defd3f677ef4 Leo Liu                    2017-01-10   561  			break;
bdc799e5eee551 Leo Liu                    2017-01-25   562  		case AMDGPU_H=
W_IP_VCN_DEC:
cefbc5989f63d3 Leo Liu                    2017-02-21   563  		case AMDGPU_H=
W_IP_VCN_ENC:
bdc799e5eee551 Leo Liu                    2017-01-25   564  			type =3D AMD=
_IP_BLOCK_TYPE_VCN;
bdc799e5eee551 Leo Liu                    2017-01-25   565  			break;
52f2e779ad86da Leo Liu                    2019-11-08   566  		case AMDGPU_H=
W_IP_VCN_JPEG:
52f2e779ad86da Leo Liu                    2019-11-08   567  			type =3D (am=
dgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_JPEG)) ?
52f2e779ad86da Leo Liu                    2019-11-08   568  				AMD_IP_BLOC=
K_TYPE_JPEG : AMD_IP_BLOCK_TYPE_VCN;
52f2e779ad86da Leo Liu                    2019-11-08   569  			break;
d38ceaf99ed015 Alex Deucher               2015-04-20   570  		default:
d38ceaf99ed015 Alex Deucher               2015-04-20   571  			return -EINV=
AL;
d38ceaf99ed015 Alex Deucher               2015-04-20   572  		}
d38ceaf99ed015 Alex Deucher               2015-04-20   573  =

d38ceaf99ed015 Alex Deucher               2015-04-20   574  		for (i =3D 0;=
 i < adev->num_ip_blocks; i++)
a1255107212675 Alex Deucher               2016-10-13   575  			if (adev->ip=
_blocks[i].version->type =3D=3D type &&
a1255107212675 Alex Deucher               2016-10-13   576  			    adev->ip=
_blocks[i].status.valid &&
d38ceaf99ed015 Alex Deucher               2015-04-20   577  			    count < =
AMDGPU_HW_IP_INSTANCE_MAX_COUNT)
d38ceaf99ed015 Alex Deucher               2015-04-20   578  				count++;
d38ceaf99ed015 Alex Deucher               2015-04-20   579  =

d38ceaf99ed015 Alex Deucher               2015-04-20   580  		return copy_t=
o_user(out, &count, min(size, 4u)) ? -EFAULT : 0;
d38ceaf99ed015 Alex Deucher               2015-04-20   581  	}
d38ceaf99ed015 Alex Deucher               2015-04-20   582  	case AMDGPU_IN=
FO_TIMESTAMP:
b95e31fddabbc3 Alex Deucher               2016-07-07   583  		ui64 =3D amdg=
pu_gfx_get_gpu_clock_counter(adev);
d38ceaf99ed015 Alex Deucher               2015-04-20   584  		return copy_t=
o_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
d38ceaf99ed015 Alex Deucher               2015-04-20   585  	case AMDGPU_IN=
FO_FW_VERSION: {
d38ceaf99ed015 Alex Deucher               2015-04-20   586  		struct drm_am=
dgpu_info_firmware fw_info;
000cab9a61ea9e Huang Rui                  2016-06-12   587  		int ret;
d38ceaf99ed015 Alex Deucher               2015-04-20   588  =

d38ceaf99ed015 Alex Deucher               2015-04-20   589  		/* We only su=
pport one instance of each IP block right now. */
d38ceaf99ed015 Alex Deucher               2015-04-20   590  		if (info->que=
ry_fw.ip_instance !=3D 0)
d38ceaf99ed015 Alex Deucher               2015-04-20   591  			return -EINV=
AL;
d38ceaf99ed015 Alex Deucher               2015-04-20   592  =

000cab9a61ea9e Huang Rui                  2016-06-12   593  		ret =3D amdgp=
u_firmware_info(&fw_info, &info->query_fw, adev);
000cab9a61ea9e Huang Rui                  2016-06-12   594  		if (ret)
000cab9a61ea9e Huang Rui                  2016-06-12   595  			return ret;
000cab9a61ea9e Huang Rui                  2016-06-12   596  =

d38ceaf99ed015 Alex Deucher               2015-04-20   597  		return copy_t=
o_user(out, &fw_info,
d38ceaf99ed015 Alex Deucher               2015-04-20   598  				    min((si=
ze_t)size, sizeof(fw_info))) ? -EFAULT : 0;
d38ceaf99ed015 Alex Deucher               2015-04-20   599  	}
d38ceaf99ed015 Alex Deucher               2015-04-20   600  	case AMDGPU_IN=
FO_NUM_BYTES_MOVED:
d38ceaf99ed015 Alex Deucher               2015-04-20   601  		ui64 =3D atom=
ic64_read(&adev->num_bytes_moved);
d38ceaf99ed015 Alex Deucher               2015-04-20   602  		return copy_t=
o_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
83a59b6338c714 Marek Ol=C5=A1=C3=A1k                2016-08-17   603  	case=
 AMDGPU_INFO_NUM_EVICTIONS:
83a59b6338c714 Marek Ol=C5=A1=C3=A1k                2016-08-17   604  		ui6=
4 =3D atomic64_read(&adev->num_evictions);
83a59b6338c714 Marek Ol=C5=A1=C3=A1k                2016-08-17   605  		ret=
urn copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
68e2c5ffeb164f Marek Ol=C5=A1=C3=A1k                2017-05-17   606  	case=
 AMDGPU_INFO_NUM_VRAM_CPU_PAGE_FAULTS:
68e2c5ffeb164f Marek Ol=C5=A1=C3=A1k                2017-05-17   607  		ui6=
4 =3D atomic64_read(&adev->num_vram_cpu_page_faults);
68e2c5ffeb164f Marek Ol=C5=A1=C3=A1k                2017-05-17   608  		ret=
urn copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
d38ceaf99ed015 Alex Deucher               2015-04-20   609  	case AMDGPU_IN=
FO_VRAM_USAGE:
6c28aed6e5b7fa Dave Airlie                2020-08-04   610  		ui64 =3D amdg=
pu_vram_mgr_usage(ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM));
d38ceaf99ed015 Alex Deucher               2015-04-20   611  		return copy_t=
o_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
d38ceaf99ed015 Alex Deucher               2015-04-20   612  	case AMDGPU_IN=
FO_VIS_VRAM_USAGE:
6c28aed6e5b7fa Dave Airlie                2020-08-04   613  		ui64 =3D amdg=
pu_vram_mgr_vis_usage(ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM));
d38ceaf99ed015 Alex Deucher               2015-04-20   614  		return copy_t=
o_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
d38ceaf99ed015 Alex Deucher               2015-04-20   615  	case AMDGPU_IN=
FO_GTT_USAGE:
6c28aed6e5b7fa Dave Airlie                2020-08-04   616  		ui64 =3D amdg=
pu_gtt_mgr_usage(ttm_manager_type(&adev->mman.bdev, TTM_PL_TT));
d38ceaf99ed015 Alex Deucher               2015-04-20   617  		return copy_t=
o_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
d38ceaf99ed015 Alex Deucher               2015-04-20   618  	case AMDGPU_IN=
FO_GDS_CONFIG: {
d38ceaf99ed015 Alex Deucher               2015-04-20   619  		struct drm_am=
dgpu_info_gds gds_info;
d38ceaf99ed015 Alex Deucher               2015-04-20   620  =

c92b90ccc20bb5 Alex Deucher               2015-04-30   621  		memset(&gds_i=
nfo, 0, sizeof(gds_info));
dca29491c37fd9 Christian K=C3=B6nig            2019-05-10   622  		gds_info=
.compute_partition_size =3D adev->gds.gds_size;
dca29491c37fd9 Christian K=C3=B6nig            2019-05-10   623  		gds_info=
.gds_total_size =3D adev->gds.gds_size;
dca29491c37fd9 Christian K=C3=B6nig            2019-05-10   624  		gds_info=
.gws_per_compute_partition =3D adev->gds.gws_size;
dca29491c37fd9 Christian K=C3=B6nig            2019-05-10   625  		gds_info=
.oa_per_compute_partition =3D adev->gds.oa_size;
d38ceaf99ed015 Alex Deucher               2015-04-20   626  		return copy_t=
o_user(out, &gds_info,
d38ceaf99ed015 Alex Deucher               2015-04-20   627  				    min((si=
ze_t)size, sizeof(gds_info))) ? -EFAULT : 0;
d38ceaf99ed015 Alex Deucher               2015-04-20   628  	}
d38ceaf99ed015 Alex Deucher               2015-04-20   629  	case AMDGPU_IN=
FO_VRAM_GTT: {
d38ceaf99ed015 Alex Deucher               2015-04-20   630  		struct drm_am=
dgpu_info_vram_gtt vram_gtt;
d38ceaf99ed015 Alex Deucher               2015-04-20   631  =

a5ccfe5c20740f Michel D=C3=A4nzer              2018-07-11   632  		vram_gtt=
.vram_size =3D adev->gmc.real_vram_size -
9d1b3c78052e87 Christian K=C3=B6nig            2019-08-30   633  			atomic6=
4_read(&adev->vram_pin_size) -
9d1b3c78052e87 Christian K=C3=B6nig            2019-08-30   634  			AMDGPU_=
VM_RESERVED_VRAM;
9d1b3c78052e87 Christian K=C3=B6nig            2019-08-30   635  		vram_gtt=
.vram_cpu_accessible_size =3D
9d1b3c78052e87 Christian K=C3=B6nig            2019-08-30   636  			min(ade=
v->gmc.visible_vram_size -
9d1b3c78052e87 Christian K=C3=B6nig            2019-08-30   637  			    ato=
mic64_read(&adev->visible_pin_size),
9d1b3c78052e87 Christian K=C3=B6nig            2019-08-30   638  			    vra=
m_gtt.vram_size);
6c28aed6e5b7fa Dave Airlie                2020-08-04   639  		vram_gtt.gtt_=
size =3D ttm_manager_type(&adev->mman.bdev, TTM_PL_TT)->size;
09628c3f68c6ec Christian K=C3=B6nig            2017-06-30   640  		vram_gtt=
.gtt_size *=3D PAGE_SIZE;
a5ccfe5c20740f Michel D=C3=A4nzer              2018-07-11   641  		vram_gtt=
.gtt_size -=3D atomic64_read(&adev->gart_pin_size);
d38ceaf99ed015 Alex Deucher               2015-04-20   642  		return copy_t=
o_user(out, &vram_gtt,
d38ceaf99ed015 Alex Deucher               2015-04-20   643  				    min((si=
ze_t)size, sizeof(vram_gtt))) ? -EFAULT : 0;
d38ceaf99ed015 Alex Deucher               2015-04-20   644  	}
e0adf6c86ceb71 Junwei Zhang               2016-09-29   645  	case AMDGPU_IN=
FO_MEMORY: {
e0adf6c86ceb71 Junwei Zhang               2016-09-29   646  		struct drm_am=
dgpu_memory_info mem;
9de59bc201496f Dave Airlie                2020-08-04   647  		struct ttm_re=
source_manager *vram_man =3D
6c28aed6e5b7fa Dave Airlie                2020-08-04   648  			ttm_manager_=
type(&adev->mman.bdev, TTM_PL_VRAM);
9de59bc201496f Dave Airlie                2020-08-04   649  		struct ttm_re=
source_manager *gtt_man =3D
6c28aed6e5b7fa Dave Airlie                2020-08-04   650  			ttm_manager_=
type(&adev->mman.bdev, TTM_PL_TT);
e0adf6c86ceb71 Junwei Zhang               2016-09-29   651  		memset(&mem, =
0, sizeof(mem));
770d13b19fdf36 Christian K=C3=B6nig            2018-01-12   652  		mem.vram=
.total_heap_size =3D adev->gmc.real_vram_size;
a5ccfe5c20740f Michel D=C3=A4nzer              2018-07-11   653  		mem.vram=
.usable_heap_size =3D adev->gmc.real_vram_size -
9d1b3c78052e87 Christian K=C3=B6nig            2019-08-30   654  			atomic6=
4_read(&adev->vram_pin_size) -
9d1b3c78052e87 Christian K=C3=B6nig            2019-08-30   655  			AMDGPU_=
VM_RESERVED_VRAM;
3c848bb38aca1f Christian K=C3=B6nig            2017-08-07   656  		mem.vram=
.heap_usage =3D
6c28aed6e5b7fa Dave Airlie                2020-08-04   657  			amdgpu_vram_=
mgr_usage(vram_man);
e0adf6c86ceb71 Junwei Zhang               2016-09-29   658  		mem.vram.max_=
allocation =3D mem.vram.usable_heap_size * 3 / 4;
e0adf6c86ceb71 Junwei Zhang               2016-09-29   659  =

e0adf6c86ceb71 Junwei Zhang               2016-09-29   660  		mem.cpu_acces=
sible_vram.total_heap_size =3D
770d13b19fdf36 Christian K=C3=B6nig            2018-01-12   661  			adev->g=
mc.visible_vram_size;
9d1b3c78052e87 Christian K=C3=B6nig            2019-08-30   662  		mem.cpu_=
accessible_vram.usable_heap_size =3D
9d1b3c78052e87 Christian K=C3=B6nig            2019-08-30   663  			min(ade=
v->gmc.visible_vram_size -
9d1b3c78052e87 Christian K=C3=B6nig            2019-08-30   664  			    ato=
mic64_read(&adev->visible_pin_size),
9d1b3c78052e87 Christian K=C3=B6nig            2019-08-30   665  			    mem=
.vram.usable_heap_size);
e0adf6c86ceb71 Junwei Zhang               2016-09-29   666  		mem.cpu_acces=
sible_vram.heap_usage =3D
6c28aed6e5b7fa Dave Airlie                2020-08-04   667  			amdgpu_vram_=
mgr_vis_usage(vram_man);
e0adf6c86ceb71 Junwei Zhang               2016-09-29   668  		mem.cpu_acces=
sible_vram.max_allocation =3D
e0adf6c86ceb71 Junwei Zhang               2016-09-29   669  			mem.cpu_acce=
ssible_vram.usable_heap_size * 3 / 4;
e0adf6c86ceb71 Junwei Zhang               2016-09-29   670  =

6c28aed6e5b7fa Dave Airlie                2020-08-04   671  		mem.gtt.total=
_heap_size =3D gtt_man->size;
09628c3f68c6ec Christian K=C3=B6nig            2017-06-30   672  		mem.gtt.=
total_heap_size *=3D PAGE_SIZE;
a5ccfe5c20740f Michel D=C3=A4nzer              2018-07-11   673  		mem.gtt.=
usable_heap_size =3D mem.gtt.total_heap_size -
a5ccfe5c20740f Michel D=C3=A4nzer              2018-07-11   674  			atomic6=
4_read(&adev->gart_pin_size);
9255d77d8cfd71 Christian K=C3=B6nig            2017-08-07   675  		mem.gtt.=
heap_usage =3D
6c28aed6e5b7fa Dave Airlie                2020-08-04   676  			amdgpu_gtt_m=
gr_usage(gtt_man);
e0adf6c86ceb71 Junwei Zhang               2016-09-29   677  		mem.gtt.max_a=
llocation =3D mem.gtt.usable_heap_size * 3 / 4;
e0adf6c86ceb71 Junwei Zhang               2016-09-29   678  =

e0adf6c86ceb71 Junwei Zhang               2016-09-29   679  		return copy_t=
o_user(out, &mem,
e0adf6c86ceb71 Junwei Zhang               2016-09-29   680  				    min((si=
ze_t)size, sizeof(mem)))
cfa32556e58d8a Junwei Zhang               2016-09-21   681  				    ? -EFAU=
LT : 0;
cfa32556e58d8a Junwei Zhang               2016-09-21   682  	}
d38ceaf99ed015 Alex Deucher               2015-04-20   683  	case AMDGPU_IN=
FO_READ_MMR_REG: {
0d2edd3791bb17 Dan Carpenter              2015-09-23   684  		unsigned n, a=
lloc_size;
d38ceaf99ed015 Alex Deucher               2015-04-20   685  		uint32_t *reg=
s;
d38ceaf99ed015 Alex Deucher               2015-04-20   686  		unsigned se_n=
um =3D (info->read_mmr_reg.instance >>
d38ceaf99ed015 Alex Deucher               2015-04-20   687  				   AMDGPU_I=
NFO_MMR_SE_INDEX_SHIFT) &
d38ceaf99ed015 Alex Deucher               2015-04-20   688  				  AMDGPU_IN=
FO_MMR_SE_INDEX_MASK;
d38ceaf99ed015 Alex Deucher               2015-04-20   689  		unsigned sh_n=
um =3D (info->read_mmr_reg.instance >>
d38ceaf99ed015 Alex Deucher               2015-04-20   690  				   AMDGPU_I=
NFO_MMR_SH_INDEX_SHIFT) &
d38ceaf99ed015 Alex Deucher               2015-04-20   691  				  AMDGPU_IN=
FO_MMR_SH_INDEX_MASK;
d38ceaf99ed015 Alex Deucher               2015-04-20   692  =

d38ceaf99ed015 Alex Deucher               2015-04-20   693  		/* set full m=
asks if the userspace set all bits
d38ceaf99ed015 Alex Deucher               2015-04-20   694  		 * in the bit=
fields */
d38ceaf99ed015 Alex Deucher               2015-04-20   695  		if (se_num =
=3D=3D AMDGPU_INFO_MMR_SE_INDEX_MASK)
d38ceaf99ed015 Alex Deucher               2015-04-20   696  			se_num =3D 0=
xffffffff;
b5b97cab55eb71 Alex Deucher               2020-08-25   697  		else if (se_n=
um >=3D AMDGPU_GFX_MAX_SE)
b5b97cab55eb71 Alex Deucher               2020-08-25   698  			return -EINV=
AL;
d38ceaf99ed015 Alex Deucher               2015-04-20   699  		if (sh_num =
=3D=3D AMDGPU_INFO_MMR_SH_INDEX_MASK)
d38ceaf99ed015 Alex Deucher               2015-04-20   700  			sh_num =3D 0=
xffffffff;
b5b97cab55eb71 Alex Deucher               2020-08-25   701  		else if (sh_n=
um >=3D AMDGPU_GFX_MAX_SH_PER_SE)
b5b97cab55eb71 Alex Deucher               2020-08-25   702  			return -EINV=
AL;
d38ceaf99ed015 Alex Deucher               2015-04-20   703  =

73d8e6c7b841d9 Trek                       2019-08-31   704  		if (info->rea=
d_mmr_reg.count > 128)
73d8e6c7b841d9 Trek                       2019-08-31   705  			return -EINV=
AL;
73d8e6c7b841d9 Trek                       2019-08-31   706  =

0d2edd3791bb17 Dan Carpenter              2015-09-23   707  		regs =3D kmal=
loc_array(info->read_mmr_reg.count, sizeof(*regs), GFP_KERNEL);
d38ceaf99ed015 Alex Deucher               2015-04-20   708  		if (!regs)
d38ceaf99ed015 Alex Deucher               2015-04-20   709  			return -ENOM=
EM;
0d2edd3791bb17 Dan Carpenter              2015-09-23   710  		alloc_size =
=3D info->read_mmr_reg.count * sizeof(*regs);
d38ceaf99ed015 Alex Deucher               2015-04-20   711  =

ca9317b9183b93 Alex Deucher               2019-11-14   712  		amdgpu_gfx_of=
f_ctrl(adev, false);
ca9317b9183b93 Alex Deucher               2019-11-14   713  		for (i =3D 0;=
 i < info->read_mmr_reg.count; i++) {
d38ceaf99ed015 Alex Deucher               2015-04-20   714  			if (amdgpu_a=
sic_read_register(adev, se_num, sh_num,
d38ceaf99ed015 Alex Deucher               2015-04-20   715  						      inf=
o->read_mmr_reg.dword_offset + i,
d38ceaf99ed015 Alex Deucher               2015-04-20   716  						      &re=
gs[i])) {
d38ceaf99ed015 Alex Deucher               2015-04-20   717  				DRM_DEBUG_K=
MS("unallowed offset %#x\n",
d38ceaf99ed015 Alex Deucher               2015-04-20   718  					      info=
->read_mmr_reg.dword_offset + i);
d38ceaf99ed015 Alex Deucher               2015-04-20   719  				kfree(regs);
ca9317b9183b93 Alex Deucher               2019-11-14   720  				amdgpu_gfx_=
off_ctrl(adev, true);
d38ceaf99ed015 Alex Deucher               2015-04-20   721  				return -EFA=
ULT;
d38ceaf99ed015 Alex Deucher               2015-04-20   722  			}
ca9317b9183b93 Alex Deucher               2019-11-14   723  		}
ca9317b9183b93 Alex Deucher               2019-11-14   724  		amdgpu_gfx_of=
f_ctrl(adev, true);
d38ceaf99ed015 Alex Deucher               2015-04-20   725  		n =3D copy_to=
_user(out, regs, min(size, alloc_size));
d38ceaf99ed015 Alex Deucher               2015-04-20   726  		kfree(regs);
d38ceaf99ed015 Alex Deucher               2015-04-20   727  		return n ? -E=
FAULT : 0;
d38ceaf99ed015 Alex Deucher               2015-04-20   728  	}
d38ceaf99ed015 Alex Deucher               2015-04-20   729  	case AMDGPU_IN=
FO_DEV_INFO: {
a5a52a43eac068 Lee Jones                  2020-11-06   730  		struct drm_am=
dgpu_info_device *dev_info;
5b565e0e5a9872 Christian K=C3=B6nig            2017-11-07   731  		uint64_t=
 vm_size;
a5a52a43eac068 Lee Jones                  2020-11-06   732  		int ret;
a5a52a43eac068 Lee Jones                  2020-11-06   733  =

a5a52a43eac068 Lee Jones                  2020-11-06   734  		dev_info =3D =
kzalloc(sizeof(*dev_info), GFP_KERNEL);
a5a52a43eac068 Lee Jones                  2020-11-06   735  		if (!dev_info)
a5a52a43eac068 Lee Jones                  2020-11-06   736  			return -ENOM=
EM;
d38ceaf99ed015 Alex Deucher               2015-04-20   737  =

8f66090b7bb7f2 Thomas Zimmermann          2021-01-07   738  		dev_info->dev=
ice_id =3D adev->pdev->device;
a5a52a43eac068 Lee Jones                  2020-11-06   739  		dev_info->chi=
p_rev =3D adev->rev_id;
a5a52a43eac068 Lee Jones                  2020-11-06   740  		dev_info->ext=
ernal_rev =3D adev->external_rev_id;
8f66090b7bb7f2 Thomas Zimmermann          2021-01-07   741  		dev_info->pci=
_rev =3D adev->pdev->revision;
a5a52a43eac068 Lee Jones                  2020-11-06   742  		dev_info->fam=
ily =3D adev->family;
a5a52a43eac068 Lee Jones                  2020-11-06   743  		dev_info->num=
_shader_engines =3D adev->gfx.config.max_shader_engines;
a5a52a43eac068 Lee Jones                  2020-11-06   744  		dev_info->num=
_shader_arrays_per_engine =3D adev->gfx.config.max_sh_per_se;
d38ceaf99ed015 Alex Deucher               2015-04-20   745  		/* return all=
 clocks in KHz */
a5a52a43eac068 Lee Jones                  2020-11-06   746  		dev_info->gpu=
_counter_freq =3D amdgpu_asic_get_xclk(adev) * 10;
32bf7106e072b5 Ken Wang                   2015-06-03   747  		if (adev->pm.=
dpm_enabled) {
a5a52a43eac068 Lee Jones                  2020-11-06   748  			dev_info->ma=
x_engine_clock =3D amdgpu_dpm_get_sclk(adev, false) * 10;
a5a52a43eac068 Lee Jones                  2020-11-06   749  			dev_info->ma=
x_memory_clock =3D amdgpu_dpm_get_mclk(adev, false) * 10;
32bf7106e072b5 Ken Wang                   2015-06-03   750  		} else {
a5a52a43eac068 Lee Jones                  2020-11-06   751  			dev_info->ma=
x_engine_clock =3D adev->clock.default_sclk * 10;
a5a52a43eac068 Lee Jones                  2020-11-06   752  			dev_info->ma=
x_memory_clock =3D adev->clock.default_mclk * 10;
32bf7106e072b5 Ken Wang                   2015-06-03   753  		}
a5a52a43eac068 Lee Jones                  2020-11-06   754  		dev_info->ena=
bled_rb_pipes_mask =3D adev->gfx.config.backend_enable_mask;
a5a52a43eac068 Lee Jones                  2020-11-06   755  		dev_info->num=
_rb_pipes =3D adev->gfx.config.max_backends_per_se *
0b10029d826ed8 Alex Deucher               2016-06-17   756  			adev->gfx.co=
nfig.max_shader_engines;
a5a52a43eac068 Lee Jones                  2020-11-06   757  		dev_info->num=
_hw_gfx_contexts =3D adev->gfx.config.max_hw_contexts;
a5a52a43eac068 Lee Jones                  2020-11-06   758  		dev_info->_pa=
d =3D 0;
a5a52a43eac068 Lee Jones                  2020-11-06   759  		dev_info->ids=
_flags =3D 0;
2f7d10b393c83a Jammy Zhou                 2015-07-22   760  		if (adev->fla=
gs & AMD_IS_APU)
a5a52a43eac068 Lee Jones                  2020-11-06   761  			dev_info->id=
s_flags |=3D AMDGPU_IDS_FLAGS_FUSION;
f92d5c6123f4f0 Jack Xiao                  2019-01-10   762  		if (amdgpu_mc=
bp || amdgpu_sriov_vf(adev))
a5a52a43eac068 Lee Jones                  2020-11-06   763  			dev_info->id=
s_flags |=3D AMDGPU_IDS_FLAGS_PREEMPTION;
16c642ec3fe9a1 Pierre-Eric Pelloux-Prayer 2020-07-30   764  		if (amdgpu_is=
_tmz(adev))
a5a52a43eac068 Lee Jones                  2020-11-06   765  			dev_info->id=
s_flags |=3D AMDGPU_IDS_FLAGS_TMZ;
5b565e0e5a9872 Christian K=C3=B6nig            2017-11-07   766  =

5b565e0e5a9872 Christian K=C3=B6nig            2017-11-07   767  		vm_size =
=3D adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
a3e9a15a25d5df Christian K=C3=B6nig            2018-01-22   768  		vm_size =
-=3D AMDGPU_VA_RESERVED_SIZE;
6b034e25c86805 Christian K=C3=B6nig            2018-01-29   769  =

6b034e25c86805 Christian K=C3=B6nig            2018-01-29   770  		/* Older=
 VCE FW versions are buggy and can handle only 40bits */
09b6f25b55d9c6 Christian K=C3=B6nig            2018-08-15   771  		if (adev=
->vce.fw_version &&
09b6f25b55d9c6 Christian K=C3=B6nig            2018-08-15   772  		    adev=
->vce.fw_version < AMDGPU_VCE_FW_53_45)
6b034e25c86805 Christian K=C3=B6nig            2018-01-29   773  			vm_size=
 =3D min(vm_size, 1ULL << 40);
6b034e25c86805 Christian K=C3=B6nig            2018-01-29   774  =

a5a52a43eac068 Lee Jones                  2020-11-06   775  		dev_info->vir=
tual_address_offset =3D AMDGPU_VA_RESERVED_SIZE;
a5a52a43eac068 Lee Jones                  2020-11-06   776  		dev_info->vir=
tual_address_max =3D
ad9a5b78f585e9 Christian K=C3=B6nig            2018-08-27   777  			min(vm_=
size, AMDGPU_GMC_HOLE_START);
5b565e0e5a9872 Christian K=C3=B6nig            2017-11-07   778  =

ad9a5b78f585e9 Christian K=C3=B6nig            2018-08-27   779  		if (vm_s=
ize > AMDGPU_GMC_HOLE_START) {
a5a52a43eac068 Lee Jones                  2020-11-06   780  			dev_info->hi=
gh_va_offset =3D AMDGPU_GMC_HOLE_END;
a5a52a43eac068 Lee Jones                  2020-11-06   781  			dev_info->hi=
gh_va_max =3D AMDGPU_GMC_HOLE_END | vm_size;
a5a52a43eac068 Lee Jones                  2020-11-06   782  		}
a5a52a43eac068 Lee Jones                  2020-11-06   783  		dev_info->vir=
tual_address_alignment =3D max((int)PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
a5a52a43eac068 Lee Jones                  2020-11-06   784  		dev_info->pte=
_fragment_size =3D (1 << adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_=
SIZE;
a5a52a43eac068 Lee Jones                  2020-11-06   785  		dev_info->gar=
t_page_size =3D AMDGPU_GPU_PAGE_SIZE;
a5a52a43eac068 Lee Jones                  2020-11-06   786  		dev_info->cu_=
active_number =3D adev->gfx.cu_info.number;
a5a52a43eac068 Lee Jones                  2020-11-06   787  		dev_info->cu_=
ao_mask =3D adev->gfx.cu_info.ao_cu_mask;
a5a52a43eac068 Lee Jones                  2020-11-06   788  		dev_info->ce_=
ram_size =3D adev->gfx.ce_ram_size;
a5a52a43eac068 Lee Jones                  2020-11-06   789  		memcpy(&dev_i=
nfo->cu_ao_bitmap[0], &adev->gfx.cu_info.ao_cu_bitmap[0],
dbfe85ea496728 Flora Cui                  2017-06-20   790  		       sizeof=
(adev->gfx.cu_info.ao_cu_bitmap));
a5a52a43eac068 Lee Jones                  2020-11-06   791  		memcpy(&dev_i=
nfo->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
7dae69a2905c34 Alex Deucher               2016-05-03   792  		       sizeof=
(adev->gfx.cu_info.bitmap));
a5a52a43eac068 Lee Jones                  2020-11-06   793  		dev_info->vra=
m_type =3D adev->gmc.vram_type;
a5a52a43eac068 Lee Jones                  2020-11-06   794  		dev_info->vra=
m_bit_width =3D adev->gmc.vram_width;
a5a52a43eac068 Lee Jones                  2020-11-06   795  		dev_info->vce=
_harvest_config =3D adev->vce.harvest_config;
a5a52a43eac068 Lee Jones                  2020-11-06   796  		dev_info->gc_=
double_offchip_lds_buf =3D
df6e2c4aeb263f Junwei Zhang               2017-02-17   797  			adev->gfx.co=
nfig.double_offchip_lds_buf;
a5a52a43eac068 Lee Jones                  2020-11-06   798  		dev_info->wav=
e_front_size =3D adev->gfx.cu_info.wave_front_size;
a5a52a43eac068 Lee Jones                  2020-11-06   799  		dev_info->num=
_shader_visible_vgprs =3D adev->gfx.config.max_gprs;
a5a52a43eac068 Lee Jones                  2020-11-06   800  		dev_info->num=
_cu_per_sh =3D adev->gfx.config.max_cu_per_sh;
a5a52a43eac068 Lee Jones                  2020-11-06   801  		dev_info->num=
_tcc_blocks =3D adev->gfx.config.max_texture_channel_caches;
a5a52a43eac068 Lee Jones                  2020-11-06   802  		dev_info->gs_=
vgt_table_depth =3D adev->gfx.config.gs_vgt_table_depth;
a5a52a43eac068 Lee Jones                  2020-11-06   803  		dev_info->gs_=
prim_buffer_depth =3D adev->gfx.config.gs_prim_buffer_depth;
a5a52a43eac068 Lee Jones                  2020-11-06   804  		dev_info->max=
_gs_waves_per_vgt =3D adev->gfx.config.max_gs_threads;
bce23e00f3369c Alex Deucher               2017-03-28   805  =

be9250fb962d36 Hawking Zhang              2018-06-12   806  		if (adev->fam=
ily >=3D AMDGPU_FAMILY_NV)
a5a52a43eac068 Lee Jones                  2020-11-06   807  			dev_info->pa=
_sc_tile_steering_override =3D
be9250fb962d36 Hawking Zhang              2018-06-12   808  				adev->gfx.c=
onfig.pa_sc_tile_steering_override;
be9250fb962d36 Hawking Zhang              2018-06-12   809  =

a5a52a43eac068 Lee Jones                  2020-11-06   810  		dev_info->tcc=
_disabled_mask =3D adev->gfx.config.tcc_disabled_mask;
815fb4c9d7da86 Marek Ol=C5=A1=C3=A1k                2019-09-24   811  =

a5a52a43eac068 Lee Jones                  2020-11-06   812  		ret =3D copy_=
to_user(out, dev_info,
a5a52a43eac068 Lee Jones                  2020-11-06   813  				   min((siz=
e_t)size, sizeof(*dev_info))) ? -EFAULT : 0;
a5a52a43eac068 Lee Jones                  2020-11-06   814  		kfree(dev_inf=
o);
a5a52a43eac068 Lee Jones                  2020-11-06   815  		return ret;
d38ceaf99ed015 Alex Deucher               2015-04-20   816  	}
07fecde5d3ece7 Alex Deucher               2016-10-07   817  	case AMDGPU_IN=
FO_VCE_CLOCK_TABLE: {
07fecde5d3ece7 Alex Deucher               2016-10-07   818  		unsigned i;
07fecde5d3ece7 Alex Deucher               2016-10-07   819  		struct drm_am=
dgpu_info_vce_clock_table vce_clk_table =3D {};
07fecde5d3ece7 Alex Deucher               2016-10-07   820  		struct amd_vc=
e_state *vce_state;
07fecde5d3ece7 Alex Deucher               2016-10-07   821  =

07fecde5d3ece7 Alex Deucher               2016-10-07   822  		for (i =3D 0;=
 i < AMDGPU_VCE_CLOCK_TABLE_ENTRIES; i++) {
07fecde5d3ece7 Alex Deucher               2016-10-07   823  			vce_state =
=3D amdgpu_dpm_get_vce_clock_state(adev, i);
07fecde5d3ece7 Alex Deucher               2016-10-07   824  			if (vce_stat=
e) {
07fecde5d3ece7 Alex Deucher               2016-10-07   825  				vce_clk_tab=
le.entries[i].sclk =3D vce_state->sclk;
07fecde5d3ece7 Alex Deucher               2016-10-07   826  				vce_clk_tab=
le.entries[i].mclk =3D vce_state->mclk;
07fecde5d3ece7 Alex Deucher               2016-10-07   827  				vce_clk_tab=
le.entries[i].eclk =3D vce_state->evclk;
07fecde5d3ece7 Alex Deucher               2016-10-07   828  				vce_clk_tab=
le.num_valid_entries++;
07fecde5d3ece7 Alex Deucher               2016-10-07   829  			}
07fecde5d3ece7 Alex Deucher               2016-10-07   830  		}
07fecde5d3ece7 Alex Deucher               2016-10-07   831  =

07fecde5d3ece7 Alex Deucher               2016-10-07   832  		return copy_t=
o_user(out, &vce_clk_table,
07fecde5d3ece7 Alex Deucher               2016-10-07   833  				    min((si=
ze_t)size, sizeof(vce_clk_table))) ? -EFAULT : 0;
07fecde5d3ece7 Alex Deucher               2016-10-07   834  	}
40ee5888faecf4 Evan Quan                  2016-12-07   835  	case AMDGPU_IN=
FO_VBIOS: {
40ee5888faecf4 Evan Quan                  2016-12-07   836  		uint32_t bios=
_size =3D adev->bios_size;
40ee5888faecf4 Evan Quan                  2016-12-07   837  =

40ee5888faecf4 Evan Quan                  2016-12-07   838  		switch (info-=
>vbios_info.type) {
40ee5888faecf4 Evan Quan                  2016-12-07   839  		case AMDGPU_I=
NFO_VBIOS_SIZE:
40ee5888faecf4 Evan Quan                  2016-12-07   840  			return copy_=
to_user(out, &bios_size,
40ee5888faecf4 Evan Quan                  2016-12-07   841  					min((size_=
t)size, sizeof(bios_size)))
40ee5888faecf4 Evan Quan                  2016-12-07   842  					? -EFAULT =
: 0;
40ee5888faecf4 Evan Quan                  2016-12-07   843  		case AMDGPU_I=
NFO_VBIOS_IMAGE: {
40ee5888faecf4 Evan Quan                  2016-12-07   844  			uint8_t *bio=
s;
40ee5888faecf4 Evan Quan                  2016-12-07   845  			uint32_t bio=
s_offset =3D info->vbios_info.offset;
40ee5888faecf4 Evan Quan                  2016-12-07   846  =

40ee5888faecf4 Evan Quan                  2016-12-07   847  			if (bios_off=
set >=3D bios_size)
40ee5888faecf4 Evan Quan                  2016-12-07   848  				return -EIN=
VAL;
40ee5888faecf4 Evan Quan                  2016-12-07   849  =

40ee5888faecf4 Evan Quan                  2016-12-07   850  			bios =3D ade=
v->bios + bios_offset;
40ee5888faecf4 Evan Quan                  2016-12-07   851  			return copy_=
to_user(out, bios,
40ee5888faecf4 Evan Quan                  2016-12-07   852  					    min((s=
ize_t)size, (size_t)(bios_size - bios_offset)))
40ee5888faecf4 Evan Quan                  2016-12-07   853  					? -EFAULT =
: 0;
40ee5888faecf4 Evan Quan                  2016-12-07   854  		}
40ee5888faecf4 Evan Quan                  2016-12-07   855  		default:
40ee5888faecf4 Evan Quan                  2016-12-07   856  			DRM_DEBUG_KM=
S("Invalid request %d\n",
40ee5888faecf4 Evan Quan                  2016-12-07   857  					info->vbio=
s_info.type);
40ee5888faecf4 Evan Quan                  2016-12-07   858  			return -EINV=
AL;
40ee5888faecf4 Evan Quan                  2016-12-07   859  		}
40ee5888faecf4 Evan Quan                  2016-12-07   860  	}
44879b6261530b Arindam Nath               2016-12-12   861  	case AMDGPU_IN=
FO_NUM_HANDLES: {
44879b6261530b Arindam Nath               2016-12-12   862  		struct drm_am=
dgpu_info_num_handles handle;
44879b6261530b Arindam Nath               2016-12-12   863  =

44879b6261530b Arindam Nath               2016-12-12   864  		switch (info-=
>query_hw_ip.type) {
44879b6261530b Arindam Nath               2016-12-12   865  		case AMDGPU_H=
W_IP_UVD:
44879b6261530b Arindam Nath               2016-12-12   866  			/* Starting =
Polaris, we support unlimited UVD handles */
44879b6261530b Arindam Nath               2016-12-12   867  			if (adev->as=
ic_type < CHIP_POLARIS10) {
44879b6261530b Arindam Nath               2016-12-12   868  				handle.uvd_=
max_handles =3D adev->uvd.max_handles;
44879b6261530b Arindam Nath               2016-12-12   869  				handle.uvd_=
used_handles =3D amdgpu_uvd_used_handles(adev);
44879b6261530b Arindam Nath               2016-12-12   870  =

44879b6261530b Arindam Nath               2016-12-12   871  				return copy=
_to_user(out, &handle,
44879b6261530b Arindam Nath               2016-12-12   872  					min((size_=
t)size, sizeof(handle))) ? -EFAULT : 0;
44879b6261530b Arindam Nath               2016-12-12   873  			} else {
44879b6261530b Arindam Nath               2016-12-12   874  				return -ENO=
DATA;
44879b6261530b Arindam Nath               2016-12-12   875  			}
44879b6261530b Arindam Nath               2016-12-12   876  =

44879b6261530b Arindam Nath               2016-12-12   877  			break;
44879b6261530b Arindam Nath               2016-12-12   878  		default:
44879b6261530b Arindam Nath               2016-12-12   879  			return -EINV=
AL;
44879b6261530b Arindam Nath               2016-12-12   880  		}
44879b6261530b Arindam Nath               2016-12-12   881  	}
5ebbac4b5c9159 Alex Deucher               2017-03-08   882  	case AMDGPU_IN=
FO_SENSOR: {
b13aa1091fb200 Rex Zhu                    2018-03-26   883  		if (!adev->pm=
.dpm_enabled)
5ebbac4b5c9159 Alex Deucher               2017-03-08   884  			return -ENOE=
NT;
5ebbac4b5c9159 Alex Deucher               2017-03-08   885  =

5ebbac4b5c9159 Alex Deucher               2017-03-08   886  		switch (info-=
>sensor_info.type) {
5ebbac4b5c9159 Alex Deucher               2017-03-08   887  		case AMDGPU_I=
NFO_SENSOR_GFX_SCLK:
5ebbac4b5c9159 Alex Deucher               2017-03-08   888  			/* get sclk =
in Mhz */
5ebbac4b5c9159 Alex Deucher               2017-03-08   889  			if (amdgpu_d=
pm_read_sensor(adev,
5ebbac4b5c9159 Alex Deucher               2017-03-08   890  						   AMDGPU=
_PP_SENSOR_GFX_SCLK,
5ebbac4b5c9159 Alex Deucher               2017-03-08   891  						   (void =
*)&ui32, &ui32_size)) {
5ebbac4b5c9159 Alex Deucher               2017-03-08   892  				return -EIN=
VAL;
5ebbac4b5c9159 Alex Deucher               2017-03-08   893  			}
5ebbac4b5c9159 Alex Deucher               2017-03-08   894  			ui32 /=3D 10=
0;
5ebbac4b5c9159 Alex Deucher               2017-03-08   895  			break;
5ebbac4b5c9159 Alex Deucher               2017-03-08   896  		case AMDGPU_I=
NFO_SENSOR_GFX_MCLK:
5ebbac4b5c9159 Alex Deucher               2017-03-08   897  			/* get mclk =
in Mhz */
5ebbac4b5c9159 Alex Deucher               2017-03-08   898  			if (amdgpu_d=
pm_read_sensor(adev,
5ebbac4b5c9159 Alex Deucher               2017-03-08   899  						   AMDGPU=
_PP_SENSOR_GFX_MCLK,
5ebbac4b5c9159 Alex Deucher               2017-03-08   900  						   (void =
*)&ui32, &ui32_size)) {
5ebbac4b5c9159 Alex Deucher               2017-03-08   901  				return -EIN=
VAL;
5ebbac4b5c9159 Alex Deucher               2017-03-08   902  			}
5ebbac4b5c9159 Alex Deucher               2017-03-08   903  			ui32 /=3D 10=
0;
5ebbac4b5c9159 Alex Deucher               2017-03-08   904  			break;
5ebbac4b5c9159 Alex Deucher               2017-03-08   905  		case AMDGPU_I=
NFO_SENSOR_GPU_TEMP:
5ebbac4b5c9159 Alex Deucher               2017-03-08   906  			/* get tempe=
rature in millidegrees C */
5ebbac4b5c9159 Alex Deucher               2017-03-08   907  			if (amdgpu_d=
pm_read_sensor(adev,
5ebbac4b5c9159 Alex Deucher               2017-03-08   908  						   AMDGPU=
_PP_SENSOR_GPU_TEMP,
5ebbac4b5c9159 Alex Deucher               2017-03-08   909  						   (void =
*)&ui32, &ui32_size)) {
5ebbac4b5c9159 Alex Deucher               2017-03-08   910  				return -EIN=
VAL;
5ebbac4b5c9159 Alex Deucher               2017-03-08   911  			}
5ebbac4b5c9159 Alex Deucher               2017-03-08   912  			break;
5ebbac4b5c9159 Alex Deucher               2017-03-08   913  		case AMDGPU_I=
NFO_SENSOR_GPU_LOAD:
5ebbac4b5c9159 Alex Deucher               2017-03-08   914  			/* get GPU l=
oad */
5ebbac4b5c9159 Alex Deucher               2017-03-08   915  			if (amdgpu_d=
pm_read_sensor(adev,
5ebbac4b5c9159 Alex Deucher               2017-03-08   916  						   AMDGPU=
_PP_SENSOR_GPU_LOAD,
5ebbac4b5c9159 Alex Deucher               2017-03-08   917  						   (void =
*)&ui32, &ui32_size)) {
5ebbac4b5c9159 Alex Deucher               2017-03-08   918  				return -EIN=
VAL;
5ebbac4b5c9159 Alex Deucher               2017-03-08   919  			}
5ebbac4b5c9159 Alex Deucher               2017-03-08   920  			break;
5ebbac4b5c9159 Alex Deucher               2017-03-08   921  		case AMDGPU_I=
NFO_SENSOR_GPU_AVG_POWER:
5ebbac4b5c9159 Alex Deucher               2017-03-08   922  			/* get avera=
ge GPU power */
5ebbac4b5c9159 Alex Deucher               2017-03-08   923  			if (amdgpu_d=
pm_read_sensor(adev,
5ebbac4b5c9159 Alex Deucher               2017-03-08   924  						   AMDGPU=
_PP_SENSOR_GPU_POWER,
5b79d0482f3c1e Rex Zhu                    2018-04-04   925  						   (void =
*)&ui32, &ui32_size)) {
5ebbac4b5c9159 Alex Deucher               2017-03-08   926  				return -EIN=
VAL;
5ebbac4b5c9159 Alex Deucher               2017-03-08   927  			}
5b79d0482f3c1e Rex Zhu                    2018-04-04   928  			ui32 >>=3D 8;
5ebbac4b5c9159 Alex Deucher               2017-03-08   929  			break;
5ebbac4b5c9159 Alex Deucher               2017-03-08   930  		case AMDGPU_I=
NFO_SENSOR_VDDNB:
5ebbac4b5c9159 Alex Deucher               2017-03-08   931  			/* get VDDNB=
 in millivolts */
5ebbac4b5c9159 Alex Deucher               2017-03-08   932  			if (amdgpu_d=
pm_read_sensor(adev,
5ebbac4b5c9159 Alex Deucher               2017-03-08   933  						   AMDGPU=
_PP_SENSOR_VDDNB,
5ebbac4b5c9159 Alex Deucher               2017-03-08   934  						   (void =
*)&ui32, &ui32_size)) {
5ebbac4b5c9159 Alex Deucher               2017-03-08   935  				return -EIN=
VAL;
5ebbac4b5c9159 Alex Deucher               2017-03-08   936  			}
5ebbac4b5c9159 Alex Deucher               2017-03-08   937  			break;
5ebbac4b5c9159 Alex Deucher               2017-03-08   938  		case AMDGPU_I=
NFO_SENSOR_VDDGFX:
5ebbac4b5c9159 Alex Deucher               2017-03-08   939  			/* get VDDGF=
X in millivolts */
5ebbac4b5c9159 Alex Deucher               2017-03-08   940  			if (amdgpu_d=
pm_read_sensor(adev,
5ebbac4b5c9159 Alex Deucher               2017-03-08   941  						   AMDGPU=
_PP_SENSOR_VDDGFX,
5ebbac4b5c9159 Alex Deucher               2017-03-08   942  						   (void =
*)&ui32, &ui32_size)) {
5ebbac4b5c9159 Alex Deucher               2017-03-08   943  				return -EIN=
VAL;
5ebbac4b5c9159 Alex Deucher               2017-03-08   944  			}
5ebbac4b5c9159 Alex Deucher               2017-03-08   945  			break;
60bbade2a63de3 Rex Zhu                    2018-01-17   946  		case AMDGPU_I=
NFO_SENSOR_STABLE_PSTATE_GFX_SCLK:
60bbade2a63de3 Rex Zhu                    2018-01-17   947  			/* get stabl=
e pstate sclk in Mhz */
60bbade2a63de3 Rex Zhu                    2018-01-17   948  			if (amdgpu_d=
pm_read_sensor(adev,
60bbade2a63de3 Rex Zhu                    2018-01-17   949  						   AMDGPU=
_PP_SENSOR_STABLE_PSTATE_SCLK,
60bbade2a63de3 Rex Zhu                    2018-01-17   950  						   (void =
*)&ui32, &ui32_size)) {
60bbade2a63de3 Rex Zhu                    2018-01-17   951  				return -EIN=
VAL;
60bbade2a63de3 Rex Zhu                    2018-01-17   952  			}
60bbade2a63de3 Rex Zhu                    2018-01-17   953  			ui32 /=3D 10=
0;
60bbade2a63de3 Rex Zhu                    2018-01-17   954  			break;
60bbade2a63de3 Rex Zhu                    2018-01-17   955  		case AMDGPU_I=
NFO_SENSOR_STABLE_PSTATE_GFX_MCLK:
60bbade2a63de3 Rex Zhu                    2018-01-17   956  			/* get stabl=
e pstate mclk in Mhz */
60bbade2a63de3 Rex Zhu                    2018-01-17   957  			if (amdgpu_d=
pm_read_sensor(adev,
60bbade2a63de3 Rex Zhu                    2018-01-17   958  						   AMDGPU=
_PP_SENSOR_STABLE_PSTATE_MCLK,
60bbade2a63de3 Rex Zhu                    2018-01-17   959  						   (void =
*)&ui32, &ui32_size)) {
60bbade2a63de3 Rex Zhu                    2018-01-17   960  				return -EIN=
VAL;
60bbade2a63de3 Rex Zhu                    2018-01-17   961  			}
60bbade2a63de3 Rex Zhu                    2018-01-17   962  			ui32 /=3D 10=
0;
60bbade2a63de3 Rex Zhu                    2018-01-17   963  			break;
5ebbac4b5c9159 Alex Deucher               2017-03-08   964  		default:
5ebbac4b5c9159 Alex Deucher               2017-03-08   965  			DRM_DEBUG_KM=
S("Invalid request %d\n",
5ebbac4b5c9159 Alex Deucher               2017-03-08   966  				      info-=
>sensor_info.type);
5ebbac4b5c9159 Alex Deucher               2017-03-08   967  			return -EINV=
AL;
5ebbac4b5c9159 Alex Deucher               2017-03-08   968  		}
5ebbac4b5c9159 Alex Deucher               2017-03-08   969  		return copy_t=
o_user(out, &ui32, min(size, 4u)) ? -EFAULT : 0;
5ebbac4b5c9159 Alex Deucher               2017-03-08   970  	}
1f7251b73e0839 Christian K=C3=B6nig            2017-10-09   971  	case AMDG=
PU_INFO_VRAM_LOST_COUNTER:
1f7251b73e0839 Christian K=C3=B6nig            2017-10-09   972  		ui32 =3D=
 atomic_read(&adev->vram_lost_counter);
1f7251b73e0839 Christian K=C3=B6nig            2017-10-09   973  		return c=
opy_to_user(out, &ui32, min(size, 4u)) ? -EFAULT : 0;
5cb771143ed955 xinhui pan                 2018-12-17   974  	case AMDGPU_IN=
FO_RAS_ENABLED_FEATURES: {
5cb771143ed955 xinhui pan                 2018-12-17   975  		struct amdgpu=
_ras *ras =3D amdgpu_ras_get_context(adev);
1febb00ecb1af5 xinhui pan                 2019-03-07   976  		uint64_t ras_=
mask;
5cb771143ed955 xinhui pan                 2018-12-17   977  =

5cb771143ed955 xinhui pan                 2018-12-17   978  		if (!ras)
5cb771143ed955 xinhui pan                 2018-12-17   979  			return -EINV=
AL;
1febb00ecb1af5 xinhui pan                 2019-03-07   980  		ras_mask =3D =
(uint64_t)ras->supported << 32 | ras->features;
1febb00ecb1af5 xinhui pan                 2019-03-07   981  =

1febb00ecb1af5 xinhui pan                 2019-03-07   982  		return copy_t=
o_user(out, &ras_mask,
1febb00ecb1af5 xinhui pan                 2019-03-07   983  				min_t(u64, =
size, sizeof(ras_mask))) ?
5cb771143ed955 xinhui pan                 2018-12-17   984  			-EFAULT : 0;
5cb771143ed955 xinhui pan                 2018-12-17   985  	}
555fc7fbb2a2b2 Alex Deucher               2021-01-07   986  	case AMDGPU_IN=
FO_VIDEO_CAPS: {
555fc7fbb2a2b2 Alex Deucher               2021-01-07   987  		const struct =
amdgpu_video_codecs *codecs;
555fc7fbb2a2b2 Alex Deucher               2021-01-07   988  		struct drm_am=
dgpu_info_video_caps *caps;
555fc7fbb2a2b2 Alex Deucher               2021-01-07   989  		int r;
555fc7fbb2a2b2 Alex Deucher               2021-01-07   990  =

555fc7fbb2a2b2 Alex Deucher               2021-01-07   991  	        caps =
=3D kzalloc(sizeof(*caps), GFP_KERNEL);
555fc7fbb2a2b2 Alex Deucher               2021-01-07   992  		if (!caps)
555fc7fbb2a2b2 Alex Deucher               2021-01-07   993  			return -ENOM=
EM;
555fc7fbb2a2b2 Alex Deucher               2021-01-07   994  =

555fc7fbb2a2b2 Alex Deucher               2021-01-07   995  		switch (info-=
>video_cap.type) {
555fc7fbb2a2b2 Alex Deucher               2021-01-07   996  		case AMDGPU_I=
NFO_VIDEO_CAPS_DECODE:
555fc7fbb2a2b2 Alex Deucher               2021-01-07   997  			r =3D amdgpu=
_asic_query_video_codecs(adev, false, &codecs);
555fc7fbb2a2b2 Alex Deucher               2021-01-07   998  			if (r)
555fc7fbb2a2b2 Alex Deucher               2021-01-07  @999  				return -EIN=
VAL;
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1000  			break;
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1001  		case AMDGPU_I=
NFO_VIDEO_CAPS_ENCODE:
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1002  			r =3D amdgpu=
_asic_query_video_codecs(adev, true, &codecs);
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1003  			if (r)
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1004  				return -EIN=
VAL;
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1005  			break;
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1006  			break;
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1007  		default:
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1008  			DRM_DEBUG_KM=
S("Invalid request %d\n",
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1009  				      info-=
>video_cap.type);
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1010  			return -EINV=
AL;
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1011  		}
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1012  		for (i =3D 0;=
 i < codecs->codec_count; i++) {
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1013  			int idx =3D =
codecs->codec_array[i].codec_type;
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1014  =

555fc7fbb2a2b2 Alex Deucher               2021-01-07  1015  			switch (idx)=
 {
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1016  			case AMDGPU_=
VIDEO_CODEC_TYPE_MPEG2:
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1017  			case AMDGPU_=
VIDEO_CODEC_TYPE_MPEG4:
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1018  			case AMDGPU_=
VIDEO_CODEC_TYPE_MPEG4_AVC:
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1019  			case AMDGPU_=
VIDEO_CODEC_TYPE_VC1:
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1020  			case AMDGPU_=
VIDEO_CODEC_TYPE_HEVC:
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1021  			case AMDGPU_=
VIDEO_CODEC_TYPE_JPEG:
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1022  			case AMDGPU_=
VIDEO_CODEC_TYPE_VP9:
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1023  			case AMDGPU_=
VIDEO_CODEC_TYPE_AV1:
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1024  				caps->codec=
_info[idx].valid =3D 1;
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1025  				caps->codec=
_info[idx].max_width =3D
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1026  					codecs->co=
dec_array[i].max_width;
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1027  				caps->codec=
_info[idx].max_height =3D
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1028  					codecs->co=
dec_array[i].max_height;
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1029  				caps->codec=
_info[idx].max_level =3D
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1030  					codecs->co=
dec_array[i].max_level;
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1031  				break;
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1032  			default:
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1033  				break;
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1034  			}
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1035  		}
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1036  		r =3D copy_to=
_user(out, caps,
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1037  				 min((size_=
t)size, sizeof(*caps))) ? -EFAULT : 0;
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1038  		kfree(caps);
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1039  		return r;
555fc7fbb2a2b2 Alex Deucher               2021-01-07  1040  	}
d38ceaf99ed015 Alex Deucher               2015-04-20  1041  	default:
d38ceaf99ed015 Alex Deucher               2015-04-20  1042  		DRM_DEBUG_KMS=
("Invalid request %d\n", info->query);
d38ceaf99ed015 Alex Deucher               2015-04-20  1043  		return -EINVA=
L;
d38ceaf99ed015 Alex Deucher               2015-04-20  1044  	}
d38ceaf99ed015 Alex Deucher               2015-04-20  1045  	return 0;
d38ceaf99ed015 Alex Deucher               2015-04-20  1046  }
d38ceaf99ed015 Alex Deucher               2015-04-20  1047  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3749870273814975074==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
FwIA
--===============3749870273814975074==--

