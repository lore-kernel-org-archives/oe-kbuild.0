Content-Type: multipart/mixed; boundary="===============6396659875530646575=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/marvell/octeontx2/otx2_cptpf_ucode.c:1121 otx2_cpt_create_eng_grps() warn: missing error code 'ret'
Date: Sat, 13 Aug 2022 18:44:09 +0800
Message-ID: <202208131854.VO0GSvsH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6396659875530646575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Srujana Challa <schalla@marvell.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Shijith Thotton <sthotton@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   69dac8e431af26173ca0a1ebc87054e01c585bcc
commit: d9d7749773e8895aaedc11f1d2885a9eee5c73ac crypto: octeontx2 - add ap=
is for custom engine groups
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
config: s390-randconfig-m031-20220810 (https://download.01.org/0day-ci/arch=
ive/20220813/202208131854.VO0GSvsH-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/crypto/marvell/octeontx2/otx2_cptpf_ucode.c:1121 otx2_cpt_create_en=
g_grps() warn: missing error code 'ret'
drivers/crypto/marvell/octeontx2/otx2_cptpf_ucode.c:1564 otx2_cpt_dl_custom=
_egrp_create() warn: variable dereferenced before check 'val' (see line 155=
7)
drivers/crypto/marvell/octeontx2/otx2_cptpf_ucode.c:1707 otx2_cpt_dl_custom=
_egrp_delete() warn: potential spectre issue 'eng_grps->grp' [r] (local cap)

Old smatch warnings:
drivers/crypto/marvell/octeontx2/otx2_cptpf_ucode.c:1576 otx2_cpt_dl_custom=
_egrp_create() warn: variable dereferenced before check 'val' (see line 155=
7)
drivers/crypto/marvell/octeontx2/otx2_cptpf_ucode.c:1588 otx2_cpt_dl_custom=
_egrp_create() warn: variable dereferenced before check 'val' (see line 155=
7)

vim +/ret +1121 drivers/crypto/marvell/octeontx2/otx2_cptpf_ucode.c

43ac0b824f1cb7 Srujana Challa 2021-01-15  1105  =

40a645f753b323 Srujana Challa 2021-05-25  1106  int otx2_cpt_create_eng_grp=
s(struct otx2_cptpf_dev *cptpf,
43ac0b824f1cb7 Srujana Challa 2021-01-15  1107  			     struct otx2_cpt_eng=
_grps *eng_grps)
43ac0b824f1cb7 Srujana Challa 2021-01-15  1108  {
43ac0b824f1cb7 Srujana Challa 2021-01-15  1109  	struct otx2_cpt_uc_info_t =
*uc_info[OTX2_CPT_MAX_ETYPES_PER_GRP] =3D {  };
43ac0b824f1cb7 Srujana Challa 2021-01-15  1110  	struct otx2_cpt_engines en=
gs[OTX2_CPT_MAX_ETYPES_PER_GRP] =3D { {0} };
40a645f753b323 Srujana Challa 2021-05-25  1111  	struct pci_dev *pdev =3D c=
ptpf->pdev;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1112  	struct fw_info_t fw_info;
d9d7749773e889 Srujana Challa 2021-12-01  1113  	int ret =3D 0;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1114  =

d9d7749773e889 Srujana Challa 2021-12-01  1115  	mutex_lock(&eng_grps->lock=
);
43ac0b824f1cb7 Srujana Challa 2021-01-15  1116  	/*
43ac0b824f1cb7 Srujana Challa 2021-01-15  1117  	 * We don't create engine =
groups if it was already
43ac0b824f1cb7 Srujana Challa 2021-01-15  1118  	 * made (when user enabled=
 VFs for the first time)
43ac0b824f1cb7 Srujana Challa 2021-01-15  1119  	 */
43ac0b824f1cb7 Srujana Challa 2021-01-15  1120  	if (eng_grps->is_grps_crea=
ted)
d9d7749773e889 Srujana Challa 2021-12-01 @1121  		goto unlock;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1122  =

43ac0b824f1cb7 Srujana Challa 2021-01-15  1123  	ret =3D cpt_ucode_load_fw(=
pdev, &fw_info);
43ac0b824f1cb7 Srujana Challa 2021-01-15  1124  	if (ret)
d9d7749773e889 Srujana Challa 2021-12-01  1125  		goto unlock;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1126  =

43ac0b824f1cb7 Srujana Challa 2021-01-15  1127  	/*
43ac0b824f1cb7 Srujana Challa 2021-01-15  1128  	 * Create engine group wit=
h SE engines for kernel
43ac0b824f1cb7 Srujana Challa 2021-01-15  1129  	 * crypto functionality (s=
ymmetric crypto)
43ac0b824f1cb7 Srujana Challa 2021-01-15  1130  	 */
43ac0b824f1cb7 Srujana Challa 2021-01-15  1131  	uc_info[0] =3D get_ucode(&=
fw_info, OTX2_CPT_SE_TYPES);
43ac0b824f1cb7 Srujana Challa 2021-01-15  1132  	if (uc_info[0] =3D=3D NULL=
) {
43ac0b824f1cb7 Srujana Challa 2021-01-15  1133  		dev_err(&pdev->dev, "Unab=
le to find firmware for SE\n");
43ac0b824f1cb7 Srujana Challa 2021-01-15  1134  		ret =3D -EINVAL;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1135  		goto release_fw;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1136  	}
43ac0b824f1cb7 Srujana Challa 2021-01-15  1137  	engs[0].type =3D OTX2_CPT_=
SE_TYPES;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1138  	engs[0].count =3D eng_grps=
->avail.max_se_cnt;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1139  =

43ac0b824f1cb7 Srujana Challa 2021-01-15  1140  	ret =3D create_engine_grou=
p(&pdev->dev, eng_grps, engs, 1,
43ac0b824f1cb7 Srujana Challa 2021-01-15  1141  				  (void **) uc_info, 1);
43ac0b824f1cb7 Srujana Challa 2021-01-15  1142  	if (ret)
43ac0b824f1cb7 Srujana Challa 2021-01-15  1143  		goto release_fw;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1144  =

43ac0b824f1cb7 Srujana Challa 2021-01-15  1145  	/*
43ac0b824f1cb7 Srujana Challa 2021-01-15  1146  	 * Create engine group wit=
h SE+IE engines for IPSec.
43ac0b824f1cb7 Srujana Challa 2021-01-15  1147  	 * All SE engines will be =
shared with engine group 0.
43ac0b824f1cb7 Srujana Challa 2021-01-15  1148  	 */
43ac0b824f1cb7 Srujana Challa 2021-01-15  1149  	uc_info[0] =3D get_ucode(&=
fw_info, OTX2_CPT_SE_TYPES);
43ac0b824f1cb7 Srujana Challa 2021-01-15  1150  	uc_info[1] =3D get_ucode(&=
fw_info, OTX2_CPT_IE_TYPES);
43ac0b824f1cb7 Srujana Challa 2021-01-15  1151  =

43ac0b824f1cb7 Srujana Challa 2021-01-15  1152  	if (uc_info[1] =3D=3D NULL=
) {
43ac0b824f1cb7 Srujana Challa 2021-01-15  1153  		dev_err(&pdev->dev, "Unab=
le to find firmware for IE");
43ac0b824f1cb7 Srujana Challa 2021-01-15  1154  		ret =3D -EINVAL;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1155  		goto delete_eng_grp;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1156  	}
43ac0b824f1cb7 Srujana Challa 2021-01-15  1157  	engs[0].type =3D OTX2_CPT_=
SE_TYPES;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1158  	engs[0].count =3D eng_grps=
->avail.max_se_cnt;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1159  	engs[1].type =3D OTX2_CPT_=
IE_TYPES;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1160  	engs[1].count =3D eng_grps=
->avail.max_ie_cnt;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1161  =

43ac0b824f1cb7 Srujana Challa 2021-01-15  1162  	ret =3D create_engine_grou=
p(&pdev->dev, eng_grps, engs, 2,
43ac0b824f1cb7 Srujana Challa 2021-01-15  1163  				  (void **) uc_info, 1);
43ac0b824f1cb7 Srujana Challa 2021-01-15  1164  	if (ret)
43ac0b824f1cb7 Srujana Challa 2021-01-15  1165  		goto delete_eng_grp;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1166  =

43ac0b824f1cb7 Srujana Challa 2021-01-15  1167  	/*
43ac0b824f1cb7 Srujana Challa 2021-01-15  1168  	 * Create engine group wit=
h AE engines for asymmetric
43ac0b824f1cb7 Srujana Challa 2021-01-15  1169  	 * crypto functionality.
43ac0b824f1cb7 Srujana Challa 2021-01-15  1170  	 */
43ac0b824f1cb7 Srujana Challa 2021-01-15  1171  	uc_info[0] =3D get_ucode(&=
fw_info, OTX2_CPT_AE_TYPES);
43ac0b824f1cb7 Srujana Challa 2021-01-15  1172  	if (uc_info[0] =3D=3D NULL=
) {
43ac0b824f1cb7 Srujana Challa 2021-01-15  1173  		dev_err(&pdev->dev, "Unab=
le to find firmware for AE");
43ac0b824f1cb7 Srujana Challa 2021-01-15  1174  		ret =3D -EINVAL;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1175  		goto delete_eng_grp;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1176  	}
43ac0b824f1cb7 Srujana Challa 2021-01-15  1177  	engs[0].type =3D OTX2_CPT_=
AE_TYPES;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1178  	engs[0].count =3D eng_grps=
->avail.max_ae_cnt;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1179  =

43ac0b824f1cb7 Srujana Challa 2021-01-15  1180  	ret =3D create_engine_grou=
p(&pdev->dev, eng_grps, engs, 1,
43ac0b824f1cb7 Srujana Challa 2021-01-15  1181  				  (void **) uc_info, 1);
43ac0b824f1cb7 Srujana Challa 2021-01-15  1182  	if (ret)
43ac0b824f1cb7 Srujana Challa 2021-01-15  1183  		goto delete_eng_grp;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1184  =

43ac0b824f1cb7 Srujana Challa 2021-01-15  1185  	eng_grps->is_grps_created =
=3D true;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1186  =

43ac0b824f1cb7 Srujana Challa 2021-01-15  1187  	cpt_ucode_release_fw(&fw_i=
nfo);
40a645f753b323 Srujana Challa 2021-05-25  1188  =

40a645f753b323 Srujana Challa 2021-05-25  1189  	if (is_dev_otx2(pdev))
d9d7749773e889 Srujana Challa 2021-12-01  1190  		goto unlock;
40a645f753b323 Srujana Challa 2021-05-25  1191  	/*
40a645f753b323 Srujana Challa 2021-05-25  1192  	 * Configure engine group =
mask to allow context prefetching
40a645f753b323 Srujana Challa 2021-05-25  1193  	 * for the groups.
40a645f753b323 Srujana Challa 2021-05-25  1194  	 */
40a645f753b323 Srujana Challa 2021-05-25  1195  	otx2_cpt_write_af_reg(&cpt=
pf->afpf_mbox, pdev, CPT_AF_CTL,
40a645f753b323 Srujana Challa 2021-05-25  1196  			      OTX2_CPT_ALL_ENG_G=
RPS_MASK << 3 | BIT_ULL(16),
40a645f753b323 Srujana Challa 2021-05-25  1197  			      BLKADDR_CPT0);
40a645f753b323 Srujana Challa 2021-05-25  1198  	/*
40a645f753b323 Srujana Challa 2021-05-25  1199  	 * Set interval to periodi=
cally flush dirty data for the next
40a645f753b323 Srujana Challa 2021-05-25  1200  	 * CTX cache entry. Set th=
e interval count to maximum supported
40a645f753b323 Srujana Challa 2021-05-25  1201  	 * value.
40a645f753b323 Srujana Challa 2021-05-25  1202  	 */
40a645f753b323 Srujana Challa 2021-05-25  1203  	otx2_cpt_write_af_reg(&cpt=
pf->afpf_mbox, pdev, CPT_AF_CTX_FLUSH_TIMER,
40a645f753b323 Srujana Challa 2021-05-25  1204  			      CTX_FLUSH_TIMER_CN=
T, BLKADDR_CPT0);
d9d7749773e889 Srujana Challa 2021-12-01  1205  	mutex_unlock(&eng_grps->lo=
ck);
43ac0b824f1cb7 Srujana Challa 2021-01-15  1206  	return 0;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1207  =

43ac0b824f1cb7 Srujana Challa 2021-01-15  1208  delete_eng_grp:
43ac0b824f1cb7 Srujana Challa 2021-01-15  1209  	delete_engine_grps(pdev, e=
ng_grps);
43ac0b824f1cb7 Srujana Challa 2021-01-15  1210  release_fw:
43ac0b824f1cb7 Srujana Challa 2021-01-15  1211  	cpt_ucode_release_fw(&fw_i=
nfo);
d9d7749773e889 Srujana Challa 2021-12-01  1212  unlock:
d9d7749773e889 Srujana Challa 2021-12-01  1213  	mutex_unlock(&eng_grps->lo=
ck);
43ac0b824f1cb7 Srujana Challa 2021-01-15  1214  	return ret;
43ac0b824f1cb7 Srujana Challa 2021-01-15  1215  }
43ac0b824f1cb7 Srujana Challa 2021-01-15  1216  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6396659875530646575==--

