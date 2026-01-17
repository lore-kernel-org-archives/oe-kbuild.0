Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3649C2472A6
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 21:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768685422; cv=none; b=HVMH0pgf4oLy4kI055f0omgQJVZBzwxhFCsiyEiKxOQkNNbUkXdufweg/g9CNDc7+LP6Z+7v7idD3Y5K86Sb4v7wN2Pl1+u3kAm9SFENxy5ljaR8IM54oj2ewJaChP+ij/ZyB06EvI5bGYt0DP7euQgJQusPSXnh1KxNegzHo6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768685422; c=relaxed/simple;
	bh=81rYkLweCed7M5P8nrlohHIFwIl2BCvqE4bhnBZH938=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VoG58FSwWsoHRVpPXpIzyQVO71XknOaSpT/BnL6Y0lc0XW88KiDdCLISxPUjSxMeFYZbDYP2Di7j7PwWg/d+pH2UrUYnoiUSJZaT17nx0lB52Qd1JkD6526j1idblOhPzlIr1lxWGZFUvnIGehAesI2xn1nGkCQWkeHuu3LGqKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mr4/jLCb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mr4/jLCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768685420; x=1800221420;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=81rYkLweCed7M5P8nrlohHIFwIl2BCvqE4bhnBZH938=;
  b=Mr4/jLCbG0i6KZXUDynX/N4MMSjMZZbuaDCq7S9lVmrmdHpM12n7nb+r
   cr5+82yiAFdEY6HmsgSz+1vboIjntimuMK3OVH1TFvtce1O+xY4//9DS/
   oaua5z9i3Tc9xrJ7mkSWyHzd5hhJwGQK7mv07HWOluBXffZEmoQ6GJX3G
   mwGLy9thEy3WVeDyukPDxYOVSaNcv4og3W/L1onPt41J8jvn0FlEeJiAt
   1mX99B7KgG9bMwbALyaY4a4EZ8+800dRlSQKXwiVtwRJFZNDxe8Oq6UIt
   ztYkshNB3c1QDUoHHz0I4BMI9ILNmI07qkgARsgZpxg3fFjbw9nF38RF3
   Q==;
X-CSE-ConnectionGUID: 0nXfjkusR+GMCt3PDoflbQ==
X-CSE-MsgGUID: EDX1TzsRTvmqTzj4evewXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69858706"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="69858706"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 13:30:19 -0800
X-CSE-ConnectionGUID: aA7fRqisQyW5LkR2hI9Fqg==
X-CSE-MsgGUID: NSHvM+ymS3CJRB5O5bPPNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="205925024"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jan 2026 13:30:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhDs7-00000000MES-44zf;
	Sat, 17 Jan 2026 21:30:15 +0000
Date: Sun, 18 Jan 2026 05:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:951:5-20: WARNING:
 Unsigned expression compared with zero: init_hdr_offset < 0
Message-ID: <202601180524.AJ54mMAy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Ellen Pan <yunru.pan@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d12453c7e281d236f77b5c7d7cccbf9e5dfadfe5
commit: 00dc2ff519781309f1f1ff344a638f61c33884c7 drm/amdgpu: Make SR-IOV cr=
itical region checks overflow-safe
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-101-20260112 (https://download.01.org/0day-ci/arc=
hive/20260118/202601180524.AJ54mMAy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601180524.AJ54mMAy-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:951:5-20: WARNING: Unsigned exp=
ression compared with zero: init_hdr_offset < 0

vim +951 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c

07009df6494dc9 Ellen Pan            2025-10-07   936 =20
07009df6494dc9 Ellen Pan            2025-10-07   937  int amdgpu_virt_init_=
critical_region(struct amdgpu_device *adev)
07009df6494dc9 Ellen Pan            2025-10-07   938  {
07009df6494dc9 Ellen Pan            2025-10-07   939  	struct amd_sriov_msg=
_init_data_header *init_data_hdr =3D NULL;
00dc2ff5197813 Srinivasan Shanmugam 2025-10-22   940  	u64 init_hdr_offset =
=3D adev->virt.init_data_header.offset;
00dc2ff5197813 Srinivasan Shanmugam 2025-10-22   941  	u64 init_hdr_size =
=3D (u64)adev->virt.init_data_header.size_kb << 10; /* KB =E2=86=92 bytes */
00dc2ff5197813 Srinivasan Shanmugam 2025-10-22   942  	u64 vram_size;
00dc2ff5197813 Srinivasan Shanmugam 2025-10-22   943  	u64 end;
07009df6494dc9 Ellen Pan            2025-10-07   944  	int r =3D 0;
07009df6494dc9 Ellen Pan            2025-10-07   945  	uint8_t checksum =3D =
0;
07009df6494dc9 Ellen Pan            2025-10-07   946 =20
07009df6494dc9 Ellen Pan            2025-10-07   947  	/* Skip below init i=
f critical region version !=3D v2 */
07009df6494dc9 Ellen Pan            2025-10-07   948  	if (adev->virt.req_i=
nit_data_ver !=3D GPU_CRIT_REGION_V2)
07009df6494dc9 Ellen Pan            2025-10-07   949  		return 0;
07009df6494dc9 Ellen Pan            2025-10-07   950 =20
07009df6494dc9 Ellen Pan            2025-10-07  @951  	if (init_hdr_offset =
< 0) {
07009df6494dc9 Ellen Pan            2025-10-07   952  		dev_err(adev->dev, =
"Invalid init header offset\n");
07009df6494dc9 Ellen Pan            2025-10-07   953  		return -EINVAL;
07009df6494dc9 Ellen Pan            2025-10-07   954  	}
07009df6494dc9 Ellen Pan            2025-10-07   955 =20
07009df6494dc9 Ellen Pan            2025-10-07   956  	vram_size =3D RREG32=
(mmRCC_CONFIG_MEMSIZE);
07009df6494dc9 Ellen Pan            2025-10-07   957  	if (!vram_size || vr=
am_size =3D=3D U32_MAX)
07009df6494dc9 Ellen Pan            2025-10-07   958  		return -EINVAL;
07009df6494dc9 Ellen Pan            2025-10-07   959  	vram_size <<=3D 20;
07009df6494dc9 Ellen Pan            2025-10-07   960 =20
00dc2ff5197813 Srinivasan Shanmugam 2025-10-22   961  	if (check_add_overfl=
ow(init_hdr_offset, init_hdr_size, &end) || end > vram_size) {
07009df6494dc9 Ellen Pan            2025-10-07   962  		dev_err(adev->dev, =
"init_data_header exceeds VRAM size, exiting\n");
07009df6494dc9 Ellen Pan            2025-10-07   963  		return -EINVAL;
07009df6494dc9 Ellen Pan            2025-10-07   964  	}
07009df6494dc9 Ellen Pan            2025-10-07   965 =20
07009df6494dc9 Ellen Pan            2025-10-07   966  	/* Allocate for init=
_data_hdr */
07009df6494dc9 Ellen Pan            2025-10-07   967  	init_data_hdr =3D kz=
alloc(sizeof(struct amd_sriov_msg_init_data_header), GFP_KERNEL);
07009df6494dc9 Ellen Pan            2025-10-07   968  	if (!init_data_hdr)
07009df6494dc9 Ellen Pan            2025-10-07   969  		return -ENOMEM;
07009df6494dc9 Ellen Pan            2025-10-07   970 =20
07009df6494dc9 Ellen Pan            2025-10-07   971  	amdgpu_device_vram_a=
ccess(adev, (uint64_t)init_hdr_offset, (uint32_t *)init_data_hdr,
07009df6494dc9 Ellen Pan            2025-10-07   972  					sizeof(struct am=
d_sriov_msg_init_data_header), false);
07009df6494dc9 Ellen Pan            2025-10-07   973 =20
07009df6494dc9 Ellen Pan            2025-10-07   974  	/* Table validation =
*/
07009df6494dc9 Ellen Pan            2025-10-07   975  	if (strncmp(init_dat=
a_hdr->signature,
07009df6494dc9 Ellen Pan            2025-10-07   976  				AMDGPU_SRIOV_CRIT=
_DATA_SIGNATURE,
07009df6494dc9 Ellen Pan            2025-10-07   977  				AMDGPU_SRIOV_CRIT=
_DATA_SIG_LEN) !=3D 0) {
07009df6494dc9 Ellen Pan            2025-10-07   978  		dev_err(adev->dev, =
"Invalid init data signature: %.4s\n",
07009df6494dc9 Ellen Pan            2025-10-07   979  			init_data_hdr->sig=
nature);
07009df6494dc9 Ellen Pan            2025-10-07   980  		r =3D -EINVAL;
07009df6494dc9 Ellen Pan            2025-10-07   981  		goto out;
07009df6494dc9 Ellen Pan            2025-10-07   982  	}
07009df6494dc9 Ellen Pan            2025-10-07   983 =20
07009df6494dc9 Ellen Pan            2025-10-07   984  	checksum =3D amdgpu_=
virt_crit_region_calc_checksum(
07009df6494dc9 Ellen Pan            2025-10-07   985  			(uint8_t *)&init_d=
ata_hdr->initdata_offset,
07009df6494dc9 Ellen Pan            2025-10-07   986  			(uint8_t *)init_da=
ta_hdr +
07009df6494dc9 Ellen Pan            2025-10-07   987  			sizeof(struct amd_=
sriov_msg_init_data_header));
07009df6494dc9 Ellen Pan            2025-10-07   988  	if (checksum !=3D in=
it_data_hdr->checksum) {
07009df6494dc9 Ellen Pan            2025-10-07   989  		dev_err(adev->dev, =
"Found unmatching checksum from calculation 0x%x and init_data 0x%x\n",
07009df6494dc9 Ellen Pan            2025-10-07   990  				checksum, init_da=
ta_hdr->checksum);
07009df6494dc9 Ellen Pan            2025-10-07   991  		r =3D -EINVAL;
07009df6494dc9 Ellen Pan            2025-10-07   992  		goto out;
07009df6494dc9 Ellen Pan            2025-10-07   993  	}
07009df6494dc9 Ellen Pan            2025-10-07   994 =20
07009df6494dc9 Ellen Pan            2025-10-07   995  	memset(&adev->virt.c=
rit_regn, 0, sizeof(adev->virt.crit_regn));
07009df6494dc9 Ellen Pan            2025-10-07   996  	memset(adev->virt.cr=
it_regn_tbl, 0, sizeof(adev->virt.crit_regn_tbl));
07009df6494dc9 Ellen Pan            2025-10-07   997 =20
07009df6494dc9 Ellen Pan            2025-10-07   998  	adev->virt.crit_regn=
.offset =3D init_data_hdr->initdata_offset;
07009df6494dc9 Ellen Pan            2025-10-07   999  	adev->virt.crit_regn=
.size_kb =3D init_data_hdr->initdata_size_in_kb;
07009df6494dc9 Ellen Pan            2025-10-07  1000 =20
07009df6494dc9 Ellen Pan            2025-10-07  1001  	/* Validation and in=
itialization for each table entry */
07009df6494dc9 Ellen Pan            2025-10-07  1002  	if (IS_SRIOV_CRIT_RE=
GN_ENTRY_VALID(init_data_hdr, AMD_SRIOV_MSG_IPD_TABLE_ID)) {
07009df6494dc9 Ellen Pan            2025-10-07  1003  		if (!init_data_hdr-=
>ip_discovery_size_in_kb ||
07009df6494dc9 Ellen Pan            2025-10-07  1004  				init_data_hdr->ip=
_discovery_size_in_kb > DISCOVERY_TMR_SIZE) {
07009df6494dc9 Ellen Pan            2025-10-07  1005  			dev_err(adev->dev,=
 "Invalid %s size: 0x%x\n",
07009df6494dc9 Ellen Pan            2025-10-07  1006  				amdgpu_virt_dynam=
ic_crit_table_name[AMD_SRIOV_MSG_IPD_TABLE_ID],
07009df6494dc9 Ellen Pan            2025-10-07  1007  				init_data_hdr->ip=
_discovery_size_in_kb);
07009df6494dc9 Ellen Pan            2025-10-07  1008  			r =3D -EINVAL;
07009df6494dc9 Ellen Pan            2025-10-07  1009  			goto out;
07009df6494dc9 Ellen Pan            2025-10-07  1010  		}
07009df6494dc9 Ellen Pan            2025-10-07  1011 =20
07009df6494dc9 Ellen Pan            2025-10-07  1012  		adev->virt.crit_reg=
n_tbl[AMD_SRIOV_MSG_IPD_TABLE_ID].offset =3D
07009df6494dc9 Ellen Pan            2025-10-07  1013  			init_data_hdr->ip_=
discovery_offset;
07009df6494dc9 Ellen Pan            2025-10-07  1014  		adev->virt.crit_reg=
n_tbl[AMD_SRIOV_MSG_IPD_TABLE_ID].size_kb =3D
07009df6494dc9 Ellen Pan            2025-10-07  1015  			init_data_hdr->ip_=
discovery_size_in_kb;
07009df6494dc9 Ellen Pan            2025-10-07  1016  	}
07009df6494dc9 Ellen Pan            2025-10-07  1017 =20
07009df6494dc9 Ellen Pan            2025-10-07  1018  	if (IS_SRIOV_CRIT_RE=
GN_ENTRY_VALID(init_data_hdr, AMD_SRIOV_MSG_VBIOS_IMG_TABLE_ID)) {
07009df6494dc9 Ellen Pan            2025-10-07  1019  		if (!init_data_hdr-=
>vbios_img_size_in_kb) {
07009df6494dc9 Ellen Pan            2025-10-07  1020  			dev_err(adev->dev,=
 "Invalid %s size: 0x%x\n",
07009df6494dc9 Ellen Pan            2025-10-07  1021  				amdgpu_virt_dynam=
ic_crit_table_name[AMD_SRIOV_MSG_VBIOS_IMG_TABLE_ID],
07009df6494dc9 Ellen Pan            2025-10-07  1022  				init_data_hdr->vb=
ios_img_size_in_kb);
07009df6494dc9 Ellen Pan            2025-10-07  1023  			r =3D -EINVAL;
07009df6494dc9 Ellen Pan            2025-10-07  1024  			goto out;
07009df6494dc9 Ellen Pan            2025-10-07  1025  		}
07009df6494dc9 Ellen Pan            2025-10-07  1026 =20
07009df6494dc9 Ellen Pan            2025-10-07  1027  		adev->virt.crit_reg=
n_tbl[AMD_SRIOV_MSG_VBIOS_IMG_TABLE_ID].offset =3D
07009df6494dc9 Ellen Pan            2025-10-07  1028  			init_data_hdr->vbi=
os_img_offset;
07009df6494dc9 Ellen Pan            2025-10-07  1029  		adev->virt.crit_reg=
n_tbl[AMD_SRIOV_MSG_VBIOS_IMG_TABLE_ID].size_kb =3D
07009df6494dc9 Ellen Pan            2025-10-07  1030  			init_data_hdr->vbi=
os_img_size_in_kb;
07009df6494dc9 Ellen Pan            2025-10-07  1031  	}
07009df6494dc9 Ellen Pan            2025-10-07  1032 =20
07009df6494dc9 Ellen Pan            2025-10-07  1033  	if (IS_SRIOV_CRIT_RE=
GN_ENTRY_VALID(init_data_hdr, AMD_SRIOV_MSG_RAS_TELEMETRY_TABLE_ID)) {
07009df6494dc9 Ellen Pan            2025-10-07  1034  		if (!init_data_hdr-=
>ras_tele_info_size_in_kb) {
07009df6494dc9 Ellen Pan            2025-10-07  1035  			dev_err(adev->dev,=
 "Invalid %s size: 0x%x\n",
07009df6494dc9 Ellen Pan            2025-10-07  1036  				amdgpu_virt_dynam=
ic_crit_table_name[AMD_SRIOV_MSG_RAS_TELEMETRY_TABLE_ID],
07009df6494dc9 Ellen Pan            2025-10-07  1037  				init_data_hdr->ra=
s_tele_info_size_in_kb);
07009df6494dc9 Ellen Pan            2025-10-07  1038  			r =3D -EINVAL;
07009df6494dc9 Ellen Pan            2025-10-07  1039  			goto out;
07009df6494dc9 Ellen Pan            2025-10-07  1040  		}
07009df6494dc9 Ellen Pan            2025-10-07  1041 =20
07009df6494dc9 Ellen Pan            2025-10-07  1042  		adev->virt.crit_reg=
n_tbl[AMD_SRIOV_MSG_RAS_TELEMETRY_TABLE_ID].offset =3D
07009df6494dc9 Ellen Pan            2025-10-07  1043  			init_data_hdr->ras=
_tele_info_offset;
07009df6494dc9 Ellen Pan            2025-10-07  1044  		adev->virt.crit_reg=
n_tbl[AMD_SRIOV_MSG_RAS_TELEMETRY_TABLE_ID].size_kb =3D
07009df6494dc9 Ellen Pan            2025-10-07  1045  			init_data_hdr->ras=
_tele_info_size_in_kb;
07009df6494dc9 Ellen Pan            2025-10-07  1046  	}
07009df6494dc9 Ellen Pan            2025-10-07  1047 =20
07009df6494dc9 Ellen Pan            2025-10-07  1048  	if (IS_SRIOV_CRIT_RE=
GN_ENTRY_VALID(init_data_hdr, AMD_SRIOV_MSG_DATAEXCHANGE_TABLE_ID)) {
07009df6494dc9 Ellen Pan            2025-10-07  1049  		if (!init_data_hdr-=
>dataexchange_size_in_kb) {
07009df6494dc9 Ellen Pan            2025-10-07  1050  			dev_err(adev->dev,=
 "Invalid %s size: 0x%x\n",
07009df6494dc9 Ellen Pan            2025-10-07  1051  				amdgpu_virt_dynam=
ic_crit_table_name[AMD_SRIOV_MSG_DATAEXCHANGE_TABLE_ID],
07009df6494dc9 Ellen Pan            2025-10-07  1052  				init_data_hdr->da=
taexchange_size_in_kb);
07009df6494dc9 Ellen Pan            2025-10-07  1053  			r =3D -EINVAL;
07009df6494dc9 Ellen Pan            2025-10-07  1054  			goto out;
07009df6494dc9 Ellen Pan            2025-10-07  1055  		}
07009df6494dc9 Ellen Pan            2025-10-07  1056 =20
07009df6494dc9 Ellen Pan            2025-10-07  1057  		adev->virt.crit_reg=
n_tbl[AMD_SRIOV_MSG_DATAEXCHANGE_TABLE_ID].offset =3D
07009df6494dc9 Ellen Pan            2025-10-07  1058  			init_data_hdr->dat=
aexchange_offset;
07009df6494dc9 Ellen Pan            2025-10-07  1059  		adev->virt.crit_reg=
n_tbl[AMD_SRIOV_MSG_DATAEXCHANGE_TABLE_ID].size_kb =3D
07009df6494dc9 Ellen Pan            2025-10-07  1060  			init_data_hdr->dat=
aexchange_size_in_kb;
07009df6494dc9 Ellen Pan            2025-10-07  1061  	}
07009df6494dc9 Ellen Pan            2025-10-07  1062 =20
07009df6494dc9 Ellen Pan            2025-10-07  1063  	if (IS_SRIOV_CRIT_RE=
GN_ENTRY_VALID(init_data_hdr, AMD_SRIOV_MSG_BAD_PAGE_INFO_TABLE_ID)) {
07009df6494dc9 Ellen Pan            2025-10-07  1064  		if (!init_data_hdr-=
>bad_page_size_in_kb) {
07009df6494dc9 Ellen Pan            2025-10-07  1065  			dev_err(adev->dev,=
 "Invalid %s size: 0x%x\n",
07009df6494dc9 Ellen Pan            2025-10-07  1066  				amdgpu_virt_dynam=
ic_crit_table_name[AMD_SRIOV_MSG_BAD_PAGE_INFO_TABLE_ID],
07009df6494dc9 Ellen Pan            2025-10-07  1067  				init_data_hdr->ba=
d_page_size_in_kb);
07009df6494dc9 Ellen Pan            2025-10-07  1068  			r =3D -EINVAL;
07009df6494dc9 Ellen Pan            2025-10-07  1069  			goto out;
07009df6494dc9 Ellen Pan            2025-10-07  1070  		}
07009df6494dc9 Ellen Pan            2025-10-07  1071 =20
07009df6494dc9 Ellen Pan            2025-10-07  1072  		adev->virt.crit_reg=
n_tbl[AMD_SRIOV_MSG_BAD_PAGE_INFO_TABLE_ID].offset =3D
07009df6494dc9 Ellen Pan            2025-10-07  1073  			init_data_hdr->bad=
_page_info_offset;
07009df6494dc9 Ellen Pan            2025-10-07  1074  		adev->virt.crit_reg=
n_tbl[AMD_SRIOV_MSG_BAD_PAGE_INFO_TABLE_ID].size_kb =3D
07009df6494dc9 Ellen Pan            2025-10-07  1075  			init_data_hdr->bad=
_page_size_in_kb;
07009df6494dc9 Ellen Pan            2025-10-07  1076  	}
07009df6494dc9 Ellen Pan            2025-10-07  1077 =20
b4a8fcc7826ad2 Ellen Pan            2025-10-07  1078  	/* Validation for cr=
itical region info */
b4a8fcc7826ad2 Ellen Pan            2025-10-07  1079  	if (adev->virt.crit_=
regn_tbl[AMD_SRIOV_MSG_IPD_TABLE_ID].size_kb > DISCOVERY_TMR_SIZE) {
b4a8fcc7826ad2 Ellen Pan            2025-10-07  1080  		dev_err(adev->dev, =
"Invalid IP discovery size: 0x%x\n",
b4a8fcc7826ad2 Ellen Pan            2025-10-07  1081  				adev->virt.crit_r=
egn_tbl[AMD_SRIOV_MSG_IPD_TABLE_ID].size_kb);
b4a8fcc7826ad2 Ellen Pan            2025-10-07  1082  		r =3D -EINVAL;
b4a8fcc7826ad2 Ellen Pan            2025-10-07  1083  		goto out;
b4a8fcc7826ad2 Ellen Pan            2025-10-07  1084  	}
b4a8fcc7826ad2 Ellen Pan            2025-10-07  1085 =20
13ccaa84430efa Ellen Pan            2025-10-08  1086  	/* reserved memory s=
tarts from crit region base offset with the size of 5MB */
13ccaa84430efa Ellen Pan            2025-10-08  1087  	adev->mman.fw_vram_u=
sage_start_offset =3D adev->virt.crit_regn.offset;
13ccaa84430efa Ellen Pan            2025-10-08  1088  	adev->mman.fw_vram_u=
sage_size =3D adev->virt.crit_regn.size_kb << 10;
13ccaa84430efa Ellen Pan            2025-10-08  1089  	dev_info(adev->dev,
13ccaa84430efa Ellen Pan            2025-10-08  1090  		"critical region v%=
d requested to reserve memory start at %08llx with %llu KB.\n",
13ccaa84430efa Ellen Pan            2025-10-08  1091  			init_data_hdr->ver=
sion,
13ccaa84430efa Ellen Pan            2025-10-08  1092  			adev->mman.fw_vram=
_usage_start_offset,
13ccaa84430efa Ellen Pan            2025-10-08  1093  			adev->mman.fw_vram=
_usage_size >> 10);
13ccaa84430efa Ellen Pan            2025-10-08  1094 =20
07009df6494dc9 Ellen Pan            2025-10-07  1095  	adev->virt.is_dynami=
c_crit_regn_enabled =3D true;
07009df6494dc9 Ellen Pan            2025-10-07  1096 =20
07009df6494dc9 Ellen Pan            2025-10-07  1097  out:
07009df6494dc9 Ellen Pan            2025-10-07  1098  	kfree(init_data_hdr);
07009df6494dc9 Ellen Pan            2025-10-07  1099  	init_data_hdr =3D NU=
LL;
07009df6494dc9 Ellen Pan            2025-10-07  1100 =20
07009df6494dc9 Ellen Pan            2025-10-07  1101  	return r;
07009df6494dc9 Ellen Pan            2025-10-07  1102  }
07009df6494dc9 Ellen Pan            2025-10-07  1103 =20

:::::: The code at line 951 was first introduced by commit
:::::: 07009df6494dc9272b233eeddc10d26f545ff09a drm/amdgpu: Introduce SRIOV=
 critical regions v2 during VF init

:::::: TO: Ellen Pan <yunru.pan@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
