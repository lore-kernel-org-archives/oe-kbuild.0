Content-Type: multipart/mixed; boundary="===============1823704615419014133=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 13949/14198] drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1133 amdgpu_discovery_reg_base_init() error: testing array offset 'adev->vcn.num_vcn_inst' after use.
Date: Sat, 28 May 2022 00:20:09 +0800
Message-ID: <202205280055.X7671nNw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1823704615419014133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alex Deucher <alexander.deucher@amd.com>
CC: Guchun Chen <guchun.chen@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d3fde8ff50ab265749704bd7fbcf70d35235421f
commit: a0ccc717c4ab3ef572f023fdceffb4b6df496a0d [13949/14198] drm/amdgpu/d=
iscovery: validate VCN and SDMA instances
:::::: branch date: 10 hours ago
:::::: commit date: 21 hours ago
config: arc-randconfig-m031-20220524 (https://download.01.org/0day-ci/archi=
ve/20220528/202205280055.X7671nNw-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1133 amdgpu_discovery_reg_bas=
e_init() error: testing array offset 'adev->vcn.num_vcn_inst' after use.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1454 amdgpu_discovery_get_vcn=
_info() error: buffer overflow 'adev->vcn.vcn_codec_disable_mask' 2 <=3D 3

vim +1133 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c

a6c40b178092f41 Luben Tuikov    2022-02-03  1064  =

e24d0e91b336762 Alex Deucher    2022-03-30  1065  static int amdgpu_discove=
ry_reg_base_init(struct amdgpu_device *adev)
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1066  {
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1067  	struct binary_header *bh=
dr;
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1068  	struct ip_discovery_head=
er *ihdr;
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1069  	struct die_header *dhdr;
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1070  	struct ip *ip;
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1071  	uint16_t die_offset;
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1072  	uint16_t ip_offset;
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1073  	uint16_t num_dies;
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1074  	uint16_t num_ips;
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1075  	uint8_t num_base_address;
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1076  	int hw_ip;
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1077  	int i, j, k;
dffa11b4f74b157 Monk Liu        2020-03-04  1078  	int r;
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1079  =

dffa11b4f74b157 Monk Liu        2020-03-04  1080  	r =3D amdgpu_discovery_i=
nit(adev);
dffa11b4f74b157 Monk Liu        2020-03-04  1081  	if (r) {
dffa11b4f74b157 Monk Liu        2020-03-04  1082  		DRM_ERROR("amdgpu_disco=
very_init failed\n");
dffa11b4f74b157 Monk Liu        2020-03-04  1083  		return r;
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1084  	}
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1085  =

72de33f8f7ba0f4 Alex Deucher    2020-07-29  1086  	bhdr =3D (struct binary_=
header *)adev->mman.discovery_bin;
72de33f8f7ba0f4 Alex Deucher    2020-07-29  1087  	ihdr =3D (struct ip_disc=
overy_header *)(adev->mman.discovery_bin +
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1088  			le16_to_cpu(bhdr->tabl=
e_list[IP_DISCOVERY].offset));
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1089  	num_dies =3D le16_to_cpu=
(ihdr->num_dies);
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1090  =

437298b833996de Xiaojie Yuan    2019-03-27  1091  	DRM_DEBUG("number of die=
s: %d\n", num_dies);
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1092  =

f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1093  	for (i =3D 0; i < num_di=
es; i++) {
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1094  		die_offset =3D le16_to_=
cpu(ihdr->die_info[i].die_offset);
72de33f8f7ba0f4 Alex Deucher    2020-07-29  1095  		dhdr =3D (struct die_he=
ader *)(adev->mman.discovery_bin + die_offset);
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1096  		num_ips =3D le16_to_cpu=
(dhdr->num_ips);
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1097  		ip_offset =3D die_offse=
t + sizeof(*dhdr);
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1098  =

437298b833996de Xiaojie Yuan    2019-03-27  1099  		if (le16_to_cpu(dhdr->d=
ie_id) !=3D i) {
437298b833996de Xiaojie Yuan    2019-03-27  1100  			DRM_ERROR("invalid die=
 id %d, expected %d\n",
437298b833996de Xiaojie Yuan    2019-03-27  1101  					le16_to_cpu(dhdr->di=
e_id), i);
437298b833996de Xiaojie Yuan    2019-03-27  1102  			return -EINVAL;
437298b833996de Xiaojie Yuan    2019-03-27  1103  		}
437298b833996de Xiaojie Yuan    2019-03-27  1104  =

437298b833996de Xiaojie Yuan    2019-03-27  1105  		DRM_DEBUG("number of ha=
rdware IPs on die%d: %d\n",
437298b833996de Xiaojie Yuan    2019-03-27  1106  				le16_to_cpu(dhdr->die=
_id), num_ips);
437298b833996de Xiaojie Yuan    2019-03-27  1107  =

f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1108  		for (j =3D 0; j < num_i=
ps; j++) {
72de33f8f7ba0f4 Alex Deucher    2020-07-29  1109  			ip =3D (struct ip *)(a=
dev->mman.discovery_bin + ip_offset);
5039f5298880f7a Ernst Sj=C3=B6strand 2021-09-26  1110  =

5039f5298880f7a Ernst Sj=C3=B6strand 2021-09-26  1111  			if (amdgpu_discov=
ery_validate_ip(ip))
5039f5298880f7a Ernst Sj=C3=B6strand 2021-09-26  1112  				goto next_ip;
5039f5298880f7a Ernst Sj=C3=B6strand 2021-09-26  1113  =

f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1114  			num_base_address =3D i=
p->num_base_address;
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1115  =

437298b833996de Xiaojie Yuan    2019-03-27  1116  			DRM_DEBUG("%s(%d) #%d =
v%d.%d.%d:\n",
437298b833996de Xiaojie Yuan    2019-03-27  1117  				  hw_id_names[le16_to=
_cpu(ip->hw_id)],
437298b833996de Xiaojie Yuan    2019-03-27  1118  				  le16_to_cpu(ip->hw_=
id),
437298b833996de Xiaojie Yuan    2019-03-27  1119  				  ip->number_instance,
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1120  				  ip->major, ip->mino=
r,
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1121  				  ip->revision);
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1122  =

baf3f8f37406257 Alex Deucher    2021-11-30  1123  			if (le16_to_cpu(ip->hw=
_id) =3D=3D VCN_HWID) {
c40bdfb2ffa4cf1 Leslie Shi      2021-12-08  1124  				/* Bit [5:0]: origina=
l revision value
baf3f8f37406257 Alex Deucher    2021-11-30  1125  				 * Bit [7:6]: en/deco=
de capability:
baf3f8f37406257 Alex Deucher    2021-11-30  1126  				 *     0b00 : VCN fun=
ction normally
baf3f8f37406257 Alex Deucher    2021-11-30  1127  				 *     0b10 : encode =
is disabled
baf3f8f37406257 Alex Deucher    2021-11-30  1128  				 *     0b01 : decode =
is disabled
baf3f8f37406257 Alex Deucher    2021-11-30  1129  				 */
c40bdfb2ffa4cf1 Leslie Shi      2021-12-08  1130  				adev->vcn.vcn_config[=
adev->vcn.num_vcn_inst] =3D
c40bdfb2ffa4cf1 Leslie Shi      2021-12-08  1131  					ip->revision & 0xc0;
baf3f8f37406257 Alex Deucher    2021-11-30  1132  				ip->revision &=3D ~0x=
c0;
a0ccc717c4ab3ef Alex Deucher    2022-05-16 @1133  				if (adev->vcn.num_vcn=
_inst < AMDGPU_MAX_VCN_INSTANCES)
7cbe08a930a132d Alex Deucher    2021-08-09  1134  					adev->vcn.num_vcn_in=
st++;
a0ccc717c4ab3ef Alex Deucher    2022-05-16  1135  				else
a0ccc717c4ab3ef Alex Deucher    2022-05-16  1136  					dev_err(adev->dev, "=
Too many VCN instances: %d vs %d\n",
a0ccc717c4ab3ef Alex Deucher    2022-05-16  1137  						adev->vcn.num_vcn_i=
nst + 1,
a0ccc717c4ab3ef Alex Deucher    2022-05-16  1138  						AMDGPU_MAX_VCN_INST=
ANCES);
baf3f8f37406257 Alex Deucher    2021-11-30  1139  			}
5c3720be7d46581 Alex Deucher    2021-08-09  1140  			if (le16_to_cpu(ip->hw=
_id) =3D=3D SDMA0_HWID ||
5c3720be7d46581 Alex Deucher    2021-08-09  1141  			    le16_to_cpu(ip->hw=
_id) =3D=3D SDMA1_HWID ||
5c3720be7d46581 Alex Deucher    2021-08-09  1142  			    le16_to_cpu(ip->hw=
_id) =3D=3D SDMA2_HWID ||
a0ccc717c4ab3ef Alex Deucher    2022-05-16  1143  			    le16_to_cpu(ip->hw=
_id) =3D=3D SDMA3_HWID) {
a0ccc717c4ab3ef Alex Deucher    2022-05-16  1144  				if (adev->sdma.num_in=
stances < AMDGPU_MAX_SDMA_INSTANCES)
5c3720be7d46581 Alex Deucher    2021-08-09  1145  					adev->sdma.num_insta=
nces++;
a0ccc717c4ab3ef Alex Deucher    2022-05-16  1146  				else
a0ccc717c4ab3ef Alex Deucher    2022-05-16  1147  					dev_err(adev->dev, "=
Too many SDMA instances: %d vs %d\n",
a0ccc717c4ab3ef Alex Deucher    2022-05-16  1148  						adev->sdma.num_inst=
ances + 1,
a0ccc717c4ab3ef Alex Deucher    2022-05-16  1149  						AMDGPU_MAX_SDMA_INS=
TANCES);
a0ccc717c4ab3ef Alex Deucher    2022-05-16  1150  			}
7cbe08a930a132d Alex Deucher    2021-08-09  1151  =

a2efebf1a4f8b2b Alex Deucher    2022-03-31  1152  			if (le16_to_cpu(ip->hw=
_id) =3D=3D UMC_HWID)
a2efebf1a4f8b2b Alex Deucher    2022-03-31  1153  				adev->gmc.num_umc++;
a2efebf1a4f8b2b Alex Deucher    2022-03-31  1154  =

f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1155  			for (k =3D 0; k < num_=
base_address; k++) {
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1156  				/*
966f1d8fd05fd1e Xiaojie Yuan    2019-03-27  1157  				 * convert the endian=
ness of base addresses in place,
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1158  				 * so that we don't n=
eed to convert them when accessing adev->reg_offset.
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1159  				 */
966f1d8fd05fd1e Xiaojie Yuan    2019-03-27  1160  				ip->base_address[k] =
=3D le32_to_cpu(ip->base_address[k]);
966f1d8fd05fd1e Xiaojie Yuan    2019-03-27  1161  				DRM_DEBUG("\t0x%08x\n=
", ip->base_address[k]);
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1162  			}
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1163  =

437298b833996de Xiaojie Yuan    2019-03-27  1164  			for (hw_ip =3D 0; hw_i=
p < MAX_HWIP; hw_ip++) {
437298b833996de Xiaojie Yuan    2019-03-27  1165  				if (hw_id_map[hw_ip] =
=3D=3D le16_to_cpu(ip->hw_id)) {
91aeda1811665a4 Alex Deucher    2020-02-19  1166  					DRM_DEBUG("set regis=
ter base offset for %s\n",
437298b833996de Xiaojie Yuan    2019-03-27  1167  							hw_id_names[le16_t=
o_cpu(ip->hw_id)]);
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1168  					adev->reg_offset[hw_=
ip][ip->number_instance] =3D
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1169  						ip->base_address;
1d789535a03679e Alex Deucher    2021-10-04  1170  					/* Instance support =
is somewhat inconsistent.
1d789535a03679e Alex Deucher    2021-10-04  1171  					 * SDMA is a good ex=
ample.  Sienna cichlid has 4 total
1d789535a03679e Alex Deucher    2021-10-04  1172  					 * SDMA instances, e=
ach enumerated separately (HWIDs
1d789535a03679e Alex Deucher    2021-10-04  1173  					 * 42, 43, 68, 69). =
 Arcturus has 8 total SDMA instances,
1d789535a03679e Alex Deucher    2021-10-04  1174  					 * but they are enum=
erated as multiple instances of the
1d789535a03679e Alex Deucher    2021-10-04  1175  					 * same HWIDs (4x HW=
ID 42, 4x HWID 43).  UMC is another
1d789535a03679e Alex Deucher    2021-10-04  1176  					 * example.  On most=
 chips there are multiple instances
1d789535a03679e Alex Deucher    2021-10-04  1177  					 * with the same HWI=
D.
1d789535a03679e Alex Deucher    2021-10-04  1178  					 */
1d789535a03679e Alex Deucher    2021-10-04  1179  					adev->ip_versions[hw=
_ip][ip->number_instance] =3D
54d2b1f402b6fef Alex Deucher    2021-07-20  1180  						IP_VERSION(ip->majo=
r, ip->minor, ip->revision);
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1181  				}
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1182  			}
437298b833996de Xiaojie Yuan    2019-03-27  1183  =

5039f5298880f7a Ernst Sj=C3=B6strand 2021-09-26  1184  next_ip:
73bce7a423c3bb7 Lijo Lazar      2022-04-08  1185  			ip_offset +=3D struct_=
size(ip, base_address, ip->num_base_address);
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1186  		}
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1187  	}
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1188  =

a6c40b178092f41 Luben Tuikov    2022-02-03  1189  	amdgpu_discovery_sysfs_i=
nit(adev);
a6c40b178092f41 Luben Tuikov    2022-02-03  1190  =

f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1191  	return 0;
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1192  }
f39f5bb1c9d68d5 Xiaojie Yuan    2019-06-20  1193  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1823704615419014133==--

