Content-Type: multipart/mixed; boundary="===============2298446087898524465=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [agd5f:drm-next 429/599] drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1278 gfx_v11_0_rlc_backdoor_autoload_copy_ucode() warn: should '1 << id' be a 64 bit type?
Date: Sun, 08 May 2022 22:13:31 +0800
Message-ID: <202205082233.0Gm8B7A4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2298446087898524465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hawking Zhang <Hawking.Zhang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Wenhui Sheng <Wenhui.Sheng@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   3170f5f234272247989fafee4cba4cbbc822631c
commit: 3d879e81f0f9ed5d33b5eda0fe5226c884bb8073 [429/599] drm/amdgpu: add =
init support for GFX11 (v2)
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: csky-randconfig-m031-20220508 (https://download.01.org/0day-ci/arch=
ive/20220508/202205082233.0Gm8B7A4-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1278 gfx_v11_0_rlc_backdoor_autoload=
_copy_ucode() warn: should '1 << id' be a 64 bit type?

vim +1278 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c

3d879e81f0f9ed Hawking Zhang 2022-04-13  1249  =

3d879e81f0f9ed Hawking Zhang 2022-04-13  1250  static void gfx_v11_0_rlc_ba=
ckdoor_autoload_copy_ucode(struct amdgpu_device *adev,
3d879e81f0f9ed Hawking Zhang 2022-04-13  1251  					      SOC21_FIRMWARE_ID=
 id,
3d879e81f0f9ed Hawking Zhang 2022-04-13  1252  			    		      const void *f=
w_data,
3d879e81f0f9ed Hawking Zhang 2022-04-13  1253  					      uint32_t fw_size,
3d879e81f0f9ed Hawking Zhang 2022-04-13  1254  					      uint32_t *fw_auto=
load_mask)
3d879e81f0f9ed Hawking Zhang 2022-04-13  1255  {
3d879e81f0f9ed Hawking Zhang 2022-04-13  1256  	uint32_t toc_offset;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1257  	uint32_t toc_fw_size;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1258  	char *ptr =3D adev->gfx.rlc=
.rlc_autoload_ptr;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1259  =

3d879e81f0f9ed Hawking Zhang 2022-04-13  1260  	if (id <=3D SOC21_FIRMWARE_=
ID_INVALID || id >=3D SOC21_FIRMWARE_ID_MAX)
3d879e81f0f9ed Hawking Zhang 2022-04-13  1261  		return;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1262  =

3d879e81f0f9ed Hawking Zhang 2022-04-13  1263  	toc_offset =3D rlc_autoload=
_info[id].offset;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1264  	toc_fw_size =3D rlc_autoloa=
d_info[id].size;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1265  =

3d879e81f0f9ed Hawking Zhang 2022-04-13  1266  	if (fw_size =3D=3D 0)
3d879e81f0f9ed Hawking Zhang 2022-04-13  1267  		fw_size =3D toc_fw_size;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1268  =

3d879e81f0f9ed Hawking Zhang 2022-04-13  1269  	if (fw_size > toc_fw_size)
3d879e81f0f9ed Hawking Zhang 2022-04-13  1270  		fw_size =3D toc_fw_size;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1271  =

3d879e81f0f9ed Hawking Zhang 2022-04-13  1272  	memcpy(ptr + toc_offset, fw=
_data, fw_size);
3d879e81f0f9ed Hawking Zhang 2022-04-13  1273  =

3d879e81f0f9ed Hawking Zhang 2022-04-13  1274  	if (fw_size < toc_fw_size)
3d879e81f0f9ed Hawking Zhang 2022-04-13  1275  		memset(ptr + toc_offset + =
fw_size, 0, toc_fw_size - fw_size);
3d879e81f0f9ed Hawking Zhang 2022-04-13  1276  =

3d879e81f0f9ed Hawking Zhang 2022-04-13  1277  	if ((id !=3D SOC21_FIRMWARE=
_ID_RS64_PFP) && (id !=3D SOC21_FIRMWARE_ID_RS64_ME))
3d879e81f0f9ed Hawking Zhang 2022-04-13 @1278  		*(uint64_t *)fw_autoload_m=
ask |=3D 1 << id;
3d879e81f0f9ed Hawking Zhang 2022-04-13  1279  }
3d879e81f0f9ed Hawking Zhang 2022-04-13  1280  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2298446087898524465==--

