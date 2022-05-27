Content-Type: multipart/mixed; boundary="===============8565779665054508965=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1292 gfx_v11_0_rlc_backdoor_autoload_copy_ucode() warn: should '1 << id' be a 64 bit type?
Date: Fri, 27 May 2022 18:28:57 +0800
Message-ID: <202205271813.mDvYkTtW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8565779665054508965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

Hi Alex,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7e284070abe53d448517b80493863595af4ab5f0
commit: 98bae89647603309ca2a5f172299ecc31c5d2db0 drm/amdgpu/gfx11: remove s=
ome register fields that no longer exist
date:   3 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 weeks ago
config: arc-randconfig-m031-20220524 (https://download.01.org/0day-ci/archi=
ve/20220527/202205271813.mDvYkTtW-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1292 gfx_v11_0_rlc_backdoor_autoload=
_copy_ucode() warn: should '1 << id' be a 64 bit type?

vim +1292 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c

3d879e81f0f9ed Hawking Zhang 2022-04-13  1263  =

3d879e81f0f9ed Hawking Zhang 2022-04-13  1264  static void gfx_v11_0_rlc_ba=
ckdoor_autoload_copy_ucode(struct amdgpu_device *adev,
3d879e81f0f9ed Hawking Zhang 2022-04-13  1265  					      SOC21_FIRMWARE_ID=
 id,
3d879e81f0f9ed Hawking Zhang 2022-04-13  1266  			    		      const void *f=
w_data,
3d879e81f0f9ed Hawking Zhang 2022-04-13  1267  					      uint32_t fw_size,
3d879e81f0f9ed Hawking Zhang 2022-04-13  1268  					      uint32_t *fw_auto=
load_mask)
3d879e81f0f9ed Hawking Zhang 2022-04-13  1269  {
3d879e81f0f9ed Hawking Zhang 2022-04-13  1270  	uint32_t toc_offset;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1271  	uint32_t toc_fw_size;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1272  	char *ptr =3D adev->gfx.rlc=
.rlc_autoload_ptr;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1273  =

3d879e81f0f9ed Hawking Zhang 2022-04-13  1274  	if (id <=3D SOC21_FIRMWARE_=
ID_INVALID || id >=3D SOC21_FIRMWARE_ID_MAX)
3d879e81f0f9ed Hawking Zhang 2022-04-13  1275  		return;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1276  =

3d879e81f0f9ed Hawking Zhang 2022-04-13  1277  	toc_offset =3D rlc_autoload=
_info[id].offset;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1278  	toc_fw_size =3D rlc_autoloa=
d_info[id].size;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1279  =

3d879e81f0f9ed Hawking Zhang 2022-04-13  1280  	if (fw_size =3D=3D 0)
3d879e81f0f9ed Hawking Zhang 2022-04-13  1281  		fw_size =3D toc_fw_size;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1282  =

3d879e81f0f9ed Hawking Zhang 2022-04-13  1283  	if (fw_size > toc_fw_size)
3d879e81f0f9ed Hawking Zhang 2022-04-13  1284  		fw_size =3D toc_fw_size;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1285  =

3d879e81f0f9ed Hawking Zhang 2022-04-13  1286  	memcpy(ptr + toc_offset, fw=
_data, fw_size);
3d879e81f0f9ed Hawking Zhang 2022-04-13  1287  =

3d879e81f0f9ed Hawking Zhang 2022-04-13  1288  	if (fw_size < toc_fw_size)
3d879e81f0f9ed Hawking Zhang 2022-04-13  1289  		memset(ptr + toc_offset + =
fw_size, 0, toc_fw_size - fw_size);
3d879e81f0f9ed Hawking Zhang 2022-04-13  1290  =

3d879e81f0f9ed Hawking Zhang 2022-04-13  1291  	if ((id !=3D SOC21_FIRMWARE=
_ID_RS64_PFP) && (id !=3D SOC21_FIRMWARE_ID_RS64_ME))
3d879e81f0f9ed Hawking Zhang 2022-04-13 @1292  		*(uint64_t *)fw_autoload_m=
ask |=3D 1 << id;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1293  }
3d879e81f0f9ed Hawking Zhang 2022-04-13  1294  =


:::::: The code@line 1292 was first introduced by commit
:::::: 3d879e81f0f9ed5d33b5eda0fe5226c884bb8073 drm/amdgpu: add init suppor=
t for GFX11 (v2)

:::::: TO: Hawking Zhang <Hawking.Zhang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8565779665054508965==--

