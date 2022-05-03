Content-Type: multipart/mixed; boundary="===============1413507768583060750=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6728/8237] drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1433 amdgpu_discovery_get_vcn_info() error: buffer overflow 'adev->vcn.vcn_codec_disable_mask' 2 <= 3
Date: Tue, 03 May 2022 20:41:02 +0800
Message-ID: <202205032029.WhMJzKlz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1413507768583060750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   44a2f39e611ac0bc1f17c288a583d7f2e5684aa7
commit: 622469c87fc3e6c90a980be3e2287d82bd55c977 [6728/8237] drm/amdgpu/dis=
covery: add a function to parse the vcn info table
:::::: branch date: 5 hours ago
:::::: commit date: 5 days ago
config: ia64-randconfig-m031-20220501 (https://download.01.org/0day-ci/arch=
ive/20220503/202205032029.WhMJzKlz-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1433 amdgpu_discovery_get_vcn=
_info() error: buffer overflow 'adev->vcn.vcn_codec_disable_mask' 2 <=3D 3

vim +1433 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c

622469c87fc3e6 Alex Deucher 2022-03-30  1402  =

622469c87fc3e6 Alex Deucher 2022-03-30  1403  int amdgpu_discovery_get_vcn_=
info(struct amdgpu_device *adev)
622469c87fc3e6 Alex Deucher 2022-03-30  1404  {
622469c87fc3e6 Alex Deucher 2022-03-30  1405  	struct binary_header *bhdr;
622469c87fc3e6 Alex Deucher 2022-03-30  1406  	union vcn_info *vcn_info;
622469c87fc3e6 Alex Deucher 2022-03-30  1407  	u16 offset;
622469c87fc3e6 Alex Deucher 2022-03-30  1408  	int v;
622469c87fc3e6 Alex Deucher 2022-03-30  1409  =

622469c87fc3e6 Alex Deucher 2022-03-30  1410  	if (!adev->mman.discovery_bi=
n) {
622469c87fc3e6 Alex Deucher 2022-03-30  1411  		DRM_ERROR("ip discovery uni=
nitialized\n");
622469c87fc3e6 Alex Deucher 2022-03-30  1412  		return -EINVAL;
622469c87fc3e6 Alex Deucher 2022-03-30  1413  	}
622469c87fc3e6 Alex Deucher 2022-03-30  1414  =

622469c87fc3e6 Alex Deucher 2022-03-30  1415  	if (adev->vcn.num_vcn_inst >=
 VCN_INFO_TABLE_MAX_NUM_INSTANCES) {
622469c87fc3e6 Alex Deucher 2022-03-30  1416  		dev_err(adev->dev, "invalid=
 vcn instances\n");
622469c87fc3e6 Alex Deucher 2022-03-30  1417  		return -EINVAL;
622469c87fc3e6 Alex Deucher 2022-03-30  1418  	}
622469c87fc3e6 Alex Deucher 2022-03-30  1419  =

622469c87fc3e6 Alex Deucher 2022-03-30  1420  	bhdr =3D (struct binary_head=
er *)adev->mman.discovery_bin;
622469c87fc3e6 Alex Deucher 2022-03-30  1421  	offset =3D le16_to_cpu(bhdr-=
>table_list[VCN_INFO].offset);
622469c87fc3e6 Alex Deucher 2022-03-30  1422  =

622469c87fc3e6 Alex Deucher 2022-03-30  1423  	if (!offset) {
622469c87fc3e6 Alex Deucher 2022-03-30  1424  		dev_err(adev->dev, "invalid=
 vcn table offset\n");
622469c87fc3e6 Alex Deucher 2022-03-30  1425  		return -EINVAL;
622469c87fc3e6 Alex Deucher 2022-03-30  1426  	}
622469c87fc3e6 Alex Deucher 2022-03-30  1427  =

622469c87fc3e6 Alex Deucher 2022-03-30  1428  	vcn_info =3D (union vcn_info=
 *)(adev->mman.discovery_bin + offset);
622469c87fc3e6 Alex Deucher 2022-03-30  1429  =

622469c87fc3e6 Alex Deucher 2022-03-30  1430  	switch (le16_to_cpu(vcn_info=
->v1.header.version_major)) {
622469c87fc3e6 Alex Deucher 2022-03-30  1431  	case 1:
622469c87fc3e6 Alex Deucher 2022-03-30  1432  		for (v =3D 0; v < adev->vcn=
.num_vcn_inst; v++) {
622469c87fc3e6 Alex Deucher 2022-03-30 @1433  			adev->vcn.vcn_codec_disabl=
e_mask[v] =3D
622469c87fc3e6 Alex Deucher 2022-03-30  1434  				le32_to_cpu(vcn_info->v1.=
instance_info[v].fuse_data.all_bits);
622469c87fc3e6 Alex Deucher 2022-03-30  1435  		}
622469c87fc3e6 Alex Deucher 2022-03-30  1436  		break;
622469c87fc3e6 Alex Deucher 2022-03-30  1437  	default:
622469c87fc3e6 Alex Deucher 2022-03-30  1438  		dev_err(adev->dev,
622469c87fc3e6 Alex Deucher 2022-03-30  1439  			"Unhandled VCN info table =
%d.%d\n",
622469c87fc3e6 Alex Deucher 2022-03-30  1440  			le16_to_cpu(vcn_info->v1.h=
eader.version_major),
622469c87fc3e6 Alex Deucher 2022-03-30  1441  			le16_to_cpu(vcn_info->v1.h=
eader.version_minor));
622469c87fc3e6 Alex Deucher 2022-03-30  1442  		return -EINVAL;
622469c87fc3e6 Alex Deucher 2022-03-30  1443  	}
622469c87fc3e6 Alex Deucher 2022-03-30  1444  	return 0;
f39f5bb1c9d68d Xiaojie Yuan 2019-06-20  1445  }
795d08391b8627 Alex Deucher 2021-07-20  1446  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1413507768583060750==--

