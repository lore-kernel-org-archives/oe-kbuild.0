Content-Type: multipart/mixed; boundary="===============7703408025861660345=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1346:6: warning: Possible null pointer dereference: master [nullPointer]
Date: Wed, 08 Dec 2021 01:30:53 +0800
Message-ID: <202112080003.r3vU2JGE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7703408025861660345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Jean-Philippe Brucker" <jean-philippe@linaro.org>
CC: Will Deacon <will@kernel.org>
CC: Eric Auger <eric.auger@redhat.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: 395ad89d11fd93f79a6b942e91fc409807a63c4b iommu/arm-smmu-v3: Add sta=
ll support for platform devices
date:   6 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 months ago
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1346:6: warning: Possible nu=
ll pointer dereference: master [nullPointer]
    if (master->ats_enabled)
        ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1365:29: note: Calling funct=
ion 'arm_smmu_write_strtab_ent', 1st argument 'NULL' value is 0
     arm_smmu_write_strtab_ent(NULL, -1, strtab);
                               ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1346:6: note: Null pointer d=
ereference
    if (master->ats_enabled)
        ^

vim +1346 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1217  =

8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1218  static void arm_smmu_write_strtab_ent(struct arm_sm=
mu_master *master, u32 sid,
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1219  				      __le64 *dst)
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1220  {
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1221  	/*
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1222  	 * This is hideously complicated, but we only real=
ly care about
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1223  	 * three cases at the moment:
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1224  	 *
beb3c6a066bff1 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2017-01-06  1225  	 * 1. Invalid (all zero) -> bypass/fault (init)
beb3c6a066bff1 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2017-01-06  1226  	 * 2. Bypass/fault -> translation/bypass (attach)
beb3c6a066bff1 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2017-01-06  1227  	 * 3. Translation/bypass -> bypass/fault (detach)
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1228  	 *
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1229  	 * Given that we can't update the STE atomically a=
nd the SMMU
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1230  	 * doesn't read the thing in a defined order, that=
 leaves us
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1231  	 * with the following maintenance requirements:
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1232  	 *
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1233  	 * 1. Update Config, return (init time STEs aren't=
 live)
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1234  	 * 2. Write everything apart from dword 0, sync, w=
rite dword 0, sync
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1235  	 * 3. Update Config, sync
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1236  	 */
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1237  	u64 val =3D le64_to_cpu(dst[0]);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1238  	bool ste_live =3D false;
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1239  	struct arm_smmu_device *smmu =3D NULL;
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1240  	struct arm_smmu_s1_cfg *s1_cfg =3D NULL;
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1241  	struct arm_smmu_s2_cfg *s2_cfg =3D NULL;
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1242  	struct arm_smmu_domain *smmu_domain =3D NULL;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1243  	struct arm_smmu_cmdq_ent prefetch_cmd =3D {
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1244  		.opcode		=3D CMDQ_OP_PREFETCH_CFG,
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1245  		.prefetch	=3D {
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1246  			.sid	=3D sid,
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1247  		},
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1248  	};
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1249  =

8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1250  	if (master) {
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1251  		smmu_domain =3D master->domain;
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1252  		smmu =3D master->smmu;
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1253  	}
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1254  =

8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1255  	if (smmu_domain) {
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1256  		switch (smmu_domain->stage) {
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1257  		case ARM_SMMU_DOMAIN_S1:
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1258  			s1_cfg =3D &smmu_domain->s1_cfg;
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1259  			break;
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1260  		case ARM_SMMU_DOMAIN_S2:
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1261  		case ARM_SMMU_DOMAIN_NESTED:
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1262  			s2_cfg =3D &smmu_domain->s2_cfg;
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1263  			break;
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1264  		default:
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1265  			break;
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1266  		}
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1267  	}
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1268  =

48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1269  	if (val & STRTAB_STE_0_V) {
ba08bdcbf7fd6c drivers/iommu/arm-smmu-v3.c                 Robin Murphy    =
      2018-03-26  1270  		switch (FIELD_GET(STRTAB_STE_0_CFG, val)) {
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1271  		case STRTAB_STE_0_CFG_BYPASS:
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1272  			break;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1273  		case STRTAB_STE_0_CFG_S1_TRANS:
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1274  		case STRTAB_STE_0_CFG_S2_TRANS:
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1275  			ste_live =3D true;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1276  			break;
5bc0a11664e17e drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2016-08-16  1277  		case STRTAB_STE_0_CFG_ABORT:
11f4fe9ba3c85a drivers/iommu/arm-smmu-v3.c                 Anders Roxell   =
      2019-07-30  1278  			BUG_ON(!disable_bypass);
5bc0a11664e17e drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2016-08-16  1279  			break;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1280  		default:
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1281  			BUG(); /* STE corruption */
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1282  		}
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1283  	}
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1284  =

810871c57011eb drivers/iommu/arm-smmu-v3.c                 Nate Watterson  =
      2016-12-20  1285  	/* Nuke the existing STE_0 value, as we're going t=
o rewrite it */
beb3c6a066bff1 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2017-01-06  1286  	val =3D STRTAB_STE_0_V;
beb3c6a066bff1 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2017-01-06  1287  =

beb3c6a066bff1 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2017-01-06  1288  	/* Bypass/fault */
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1289  	if (!smmu_domain || !(s1_cfg || s2_cfg)) {
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1290  		if (!smmu_domain && disable_bypass)
ba08bdcbf7fd6c drivers/iommu/arm-smmu-v3.c                 Robin Murphy    =
      2018-03-26  1291  			val |=3D FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE=
_0_CFG_ABORT);
beb3c6a066bff1 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2017-01-06  1292  		else
ba08bdcbf7fd6c drivers/iommu/arm-smmu-v3.c                 Robin Murphy    =
      2018-03-26  1293  			val |=3D FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE=
_0_CFG_BYPASS);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1294  =

48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1295  		dst[0] =3D cpu_to_le64(val);
ba08bdcbf7fd6c drivers/iommu/arm-smmu-v3.c                 Robin Murphy    =
      2018-03-26  1296  		dst[1] =3D cpu_to_le64(FIELD_PREP(STRTAB_STE_1_SH=
CFG,
ba08bdcbf7fd6c drivers/iommu/arm-smmu-v3.c                 Robin Murphy    =
      2018-03-26  1297  						STRTAB_STE_1_SHCFG_INCOMING));
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1298  		dst[2] =3D 0; /* Nuke the VMID */
704c038255d44e drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2017-10-05  1299  		/*
704c038255d44e drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2017-10-05  1300  		 * The SMMU can perform negative caching, so we m=
ust sync
704c038255d44e drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2017-10-05  1301  		 * the STE regardless of whether the old value wa=
s live.
704c038255d44e drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2017-10-05  1302  		 */
704c038255d44e drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2017-10-05  1303  		if (smmu)
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1304  			arm_smmu_sync_ste_for_sid(smmu, sid);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1305  		return;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1306  	}
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1307  =

8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1308  	if (s1_cfg) {
9111aebf770d6a drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Br=
ucker 2021-01-22  1309  		u64 strw =3D smmu->features & ARM_SMMU_FEAT_E2H ?
9111aebf770d6a drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Br=
ucker 2021-01-22  1310  			STRTAB_STE_1_STRW_EL2 : STRTAB_STE_1_STRW_NSEL1;
9111aebf770d6a drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Br=
ucker 2021-01-22  1311  =

48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1312  		BUG_ON(ste_live);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1313  		dst[1] =3D cpu_to_le64(
87f42391f6a57c drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2020-01-15  1314  			 FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1D=
SS_SSID0) |
ba08bdcbf7fd6c drivers/iommu/arm-smmu-v3.c                 Robin Murphy    =
      2018-03-26  1315  			 FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C=
_CACHE_WBRA) |
ba08bdcbf7fd6c drivers/iommu/arm-smmu-v3.c                 Robin Murphy    =
      2018-03-26  1316  			 FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C=
_CACHE_WBRA) |
ba08bdcbf7fd6c drivers/iommu/arm-smmu-v3.c                 Robin Murphy    =
      2018-03-26  1317  			 FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH)=
 |
9111aebf770d6a drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Br=
ucker 2021-01-22  1318  			 FIELD_PREP(STRTAB_STE_1_STRW, strw));
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1319  =

9cff86fd2b960f drivers/iommu/arm-smmu-v3.c                 Yisheng Xie     =
      2017-09-21  1320  		if (smmu->features & ARM_SMMU_FEAT_STALLS &&
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Br=
ucker 2021-05-26  1321  		    !master->stall_enabled)
6380be0535fd60 drivers/iommu/arm-smmu-v3.c                 Prem Mallappa   =
      2015-12-14  1322  			dst[1] |=3D cpu_to_le64(STRTAB_STE_1_S1STALLD);
6380be0535fd60 drivers/iommu/arm-smmu-v3.c                 Prem Mallappa   =
      2015-12-14  1323  =

7bc4f3fae9537d drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2020-01-15  1324  		val |=3D (s1_cfg->cdcfg.cdtab_dma & STRTAB_STE_0_=
S1CTXPTR_MASK) |
87f42391f6a57c drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2020-01-15  1325  			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1=
_TRANS) |
87f42391f6a57c drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2020-01-15  1326  			FIELD_PREP(STRTAB_STE_0_S1CDMAX, s1_cfg->s1cdmax=
) |
87f42391f6a57c drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2020-01-15  1327  			FIELD_PREP(STRTAB_STE_0_S1FMT, s1_cfg->s1fmt);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1328  	}
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1329  =

8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1330  	if (s2_cfg) {
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1331  		BUG_ON(ste_live);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1332  		dst[2] =3D cpu_to_le64(
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1333  			 FIELD_PREP(STRTAB_STE_2_S2VMID, s2_cfg->vmid) |
8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1334  			 FIELD_PREP(STRTAB_STE_2_VTCR, s2_cfg->vtcr) |
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1335  #ifdef __BIG_ENDIAN
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1336  			 STRTAB_STE_2_S2ENDI |
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1337  #endif
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1338  			 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1339  			 STRTAB_STE_2_S2R);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1340  =

8be39a1a04c149 drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1341  		dst[3] =3D cpu_to_le64(s2_cfg->vttbr & STRTAB_STE=
_3_S2TTB_MASK);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1342  =

ba08bdcbf7fd6c drivers/iommu/arm-smmu-v3.c                 Robin Murphy    =
      2018-03-26  1343  		val |=3D FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_=
0_CFG_S2_TRANS);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1344  	}
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1345  =

9ce27afc0830fc drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17 @1346  	if (master->ats_enabled)
9ce27afc0830fc drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1347  		dst[1] |=3D cpu_to_le64(FIELD_PREP(STRTAB_STE_1_E=
ATS,
9ce27afc0830fc drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1348  						 STRTAB_STE_1_EATS_TRANS));
9ce27afc0830fc drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Br=
ucker 2019-04-17  1349  =

48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1350  	arm_smmu_sync_ste_for_sid(smmu, sid);
d71e01716b3606 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2020-01-15  1351  	/* See comment in arm_smmu_write_ctx_desc() */
d71e01716b3606 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2020-01-15  1352  	WRITE_ONCE(dst[0], cpu_to_le64(val));
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1353  	arm_smmu_sync_ste_for_sid(smmu, sid);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1354  =

48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1355  	/* It's likely that we'll want to use the new STE =
soon */
5e92946c39ca6a drivers/iommu/arm-smmu-v3.c                 Zhen Lei        =
      2015-07-07  1356  	if (!(smmu->options & ARM_SMMU_OPT_SKIP_PREFETCH))
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1357  		arm_smmu_cmdq_issue_cmd(smmu, &prefetch_cmd);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1358  }
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon     =
      2015-05-27  1359  =


:::::: The code at line 1346 was first introduced by commit
:::::: 9ce27afc0830fca07daa3baeb4da44423b0673ef iommu/arm-smmu-v3: Add supp=
ort for PCI ATS

:::::: TO: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7703408025861660345==--

