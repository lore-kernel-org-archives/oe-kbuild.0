Content-Type: multipart/mixed; boundary="===============8352311764111884073=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/powerplay/smu_cmn.c:485:9: warning: Identical condition 'ret', second condition is always false
Date: Sun, 04 Oct 2020 13:53:00 +0800
Message-ID: <202010041357.KuaD3KDn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8352311764111884073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Evan Quan <evan.quan@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   22fbc037cd32e4e6771d2271b565806cfb8c134c
commit: caad2613dc4bd7396f1f0d32f5f0e650f9d8ebc4 drm/amd/powerplay: move ta=
ble setting common code to smu_cmn.c
date:   2 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 2 months ago
compiler: riscv32-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +/ret +485 drivers/gpu/drm/amd/powerplay/smu_cmn.c

7dbf78051f75f15 Evan Quan 2020-07-07  304  =

7dbf78051f75f15 Evan Quan 2020-07-07  305  size_t smu_cmn_get_pp_feature_ma=
sk(struct smu_context *smu,
7dbf78051f75f15 Evan Quan 2020-07-07  306  				   char *buf)
7dbf78051f75f15 Evan Quan 2020-07-07  307  {
7dbf78051f75f15 Evan Quan 2020-07-07  308  	uint32_t feature_mask[2] =3D { =
0 };
7dbf78051f75f15 Evan Quan 2020-07-07  309  	int32_t feature_index =3D 0;
7dbf78051f75f15 Evan Quan 2020-07-07  310  	uint32_t count =3D 0;
7dbf78051f75f15 Evan Quan 2020-07-07  311  	uint32_t sort_feature[SMU_FEATU=
RE_COUNT];
7dbf78051f75f15 Evan Quan 2020-07-07  312  	uint64_t hw_feature_count =3D 0;
7dbf78051f75f15 Evan Quan 2020-07-07  313  	size_t size =3D 0;
7dbf78051f75f15 Evan Quan 2020-07-07  314  	int ret =3D 0, i;
7dbf78051f75f15 Evan Quan 2020-07-07  315  =

7dbf78051f75f15 Evan Quan 2020-07-07  316  	ret =3D smu_cmn_get_enabled_mas=
k(smu,
7dbf78051f75f15 Evan Quan 2020-07-07  317  				       feature_mask,
7dbf78051f75f15 Evan Quan 2020-07-07  318  				       2);
7dbf78051f75f15 Evan Quan 2020-07-07  319  	if (ret)
7dbf78051f75f15 Evan Quan 2020-07-07  320  		return 0;
7dbf78051f75f15 Evan Quan 2020-07-07  321  =

7dbf78051f75f15 Evan Quan 2020-07-07  322  	size =3D  sprintf(buf + size, "=
features high: 0x%08x low: 0x%08x\n",
7dbf78051f75f15 Evan Quan 2020-07-07  323  			feature_mask[1], feature_mask=
[0]);
7dbf78051f75f15 Evan Quan 2020-07-07  324  =

7dbf78051f75f15 Evan Quan 2020-07-07  325  	for (i =3D 0; i < SMU_FEATURE_C=
OUNT; i++) {
7dbf78051f75f15 Evan Quan 2020-07-07  326  		feature_index =3D smu_cmn_to_a=
sic_specific_index(smu,
7dbf78051f75f15 Evan Quan 2020-07-07  327  							       CMN2ASIC_MAPPING_F=
EATURE,
7dbf78051f75f15 Evan Quan 2020-07-07  328  							       i);
7dbf78051f75f15 Evan Quan 2020-07-07  329  		if (feature_index < 0)
7dbf78051f75f15 Evan Quan 2020-07-07  330  			continue;
7dbf78051f75f15 Evan Quan 2020-07-07  331  		sort_feature[feature_index] =
=3D i;
7dbf78051f75f15 Evan Quan 2020-07-07  332  		hw_feature_count++;
7dbf78051f75f15 Evan Quan 2020-07-07  333  	}
7dbf78051f75f15 Evan Quan 2020-07-07  334  =

7dbf78051f75f15 Evan Quan 2020-07-07  335  	for (i =3D 0; i < hw_feature_co=
unt; i++) {
7dbf78051f75f15 Evan Quan 2020-07-07 @336  		size +=3D sprintf(buf + size, =
"%02d. %-20s (%2d) : %s\n",
7dbf78051f75f15 Evan Quan 2020-07-07  337  			       count++,
7dbf78051f75f15 Evan Quan 2020-07-07  338  			       smu_get_feature_name(s=
mu, sort_feature[i]),
7dbf78051f75f15 Evan Quan 2020-07-07  339  			       i,
7dbf78051f75f15 Evan Quan 2020-07-07  340  			       !!smu_cmn_feature_is_e=
nabled(smu, sort_feature[i]) ?
7dbf78051f75f15 Evan Quan 2020-07-07  341  			       "enabled" : "disabled"=
);
7dbf78051f75f15 Evan Quan 2020-07-07  342  	}
7dbf78051f75f15 Evan Quan 2020-07-07  343  =

7dbf78051f75f15 Evan Quan 2020-07-07  344  	return size;
7dbf78051f75f15 Evan Quan 2020-07-07  345  }
7dbf78051f75f15 Evan Quan 2020-07-07  346  =

7dbf78051f75f15 Evan Quan 2020-07-07  347  int smu_cmn_set_pp_feature_mask(=
struct smu_context *smu,
7dbf78051f75f15 Evan Quan 2020-07-07  348  				uint64_t new_mask)
7dbf78051f75f15 Evan Quan 2020-07-07  349  {
7dbf78051f75f15 Evan Quan 2020-07-07  350  	int ret =3D 0;
7dbf78051f75f15 Evan Quan 2020-07-07  351  	uint32_t feature_mask[2] =3D { =
0 };
7dbf78051f75f15 Evan Quan 2020-07-07  352  	uint64_t feature_2_enabled =3D =
0;
7dbf78051f75f15 Evan Quan 2020-07-07  353  	uint64_t feature_2_disabled =3D=
 0;
7dbf78051f75f15 Evan Quan 2020-07-07  354  	uint64_t feature_enables =3D 0;
7dbf78051f75f15 Evan Quan 2020-07-07  355  =

7dbf78051f75f15 Evan Quan 2020-07-07  356  	ret =3D smu_cmn_get_enabled_mas=
k(smu,
7dbf78051f75f15 Evan Quan 2020-07-07  357  				       feature_mask,
7dbf78051f75f15 Evan Quan 2020-07-07  358  				       2);
7dbf78051f75f15 Evan Quan 2020-07-07  359  	if (ret)
7dbf78051f75f15 Evan Quan 2020-07-07  360  		return ret;
7dbf78051f75f15 Evan Quan 2020-07-07  361  =

7dbf78051f75f15 Evan Quan 2020-07-07  362  	feature_enables =3D ((uint64_t)=
feature_mask[1] << 32 |
7dbf78051f75f15 Evan Quan 2020-07-07  363  			   (uint64_t)feature_mask[0]);
7dbf78051f75f15 Evan Quan 2020-07-07  364  =

7dbf78051f75f15 Evan Quan 2020-07-07  365  	feature_2_enabled  =3D ~feature=
_enables & new_mask;
7dbf78051f75f15 Evan Quan 2020-07-07  366  	feature_2_disabled =3D feature_=
enables & ~new_mask;
7dbf78051f75f15 Evan Quan 2020-07-07  367  =

7dbf78051f75f15 Evan Quan 2020-07-07  368  	if (feature_2_enabled) {
7dbf78051f75f15 Evan Quan 2020-07-07  369  		ret =3D smu_cmn_feature_update=
_enable_state(smu,
7dbf78051f75f15 Evan Quan 2020-07-07  370  							  feature_2_enabled,
7dbf78051f75f15 Evan Quan 2020-07-07  371  							  true);
7dbf78051f75f15 Evan Quan 2020-07-07  372  		if (ret)
7dbf78051f75f15 Evan Quan 2020-07-07  373  			return ret;
7dbf78051f75f15 Evan Quan 2020-07-07  374  	}
7dbf78051f75f15 Evan Quan 2020-07-07  375  	if (feature_2_disabled) {
7dbf78051f75f15 Evan Quan 2020-07-07  376  		ret =3D smu_cmn_feature_update=
_enable_state(smu,
7dbf78051f75f15 Evan Quan 2020-07-07  377  							  feature_2_disabled,
7dbf78051f75f15 Evan Quan 2020-07-07  378  							  false);
7dbf78051f75f15 Evan Quan 2020-07-07  379  		if (ret)
7dbf78051f75f15 Evan Quan 2020-07-07  380  			return ret;
7dbf78051f75f15 Evan Quan 2020-07-07  381  	}
7dbf78051f75f15 Evan Quan 2020-07-07  382  =

7dbf78051f75f15 Evan Quan 2020-07-07  383  	return ret;
7dbf78051f75f15 Evan Quan 2020-07-07  384  }
af5ba6d21a70e50 Evan Quan 2020-07-07  385  =

af5ba6d21a70e50 Evan Quan 2020-07-07  386  int smu_cmn_disable_all_features=
_with_exception(struct smu_context *smu,
af5ba6d21a70e50 Evan Quan 2020-07-07  387  						enum smu_feature_mask mask)
af5ba6d21a70e50 Evan Quan 2020-07-07  388  {
af5ba6d21a70e50 Evan Quan 2020-07-07  389  	uint64_t features_to_disable =
=3D U64_MAX;
af5ba6d21a70e50 Evan Quan 2020-07-07  390  	int skipped_feature_id;
af5ba6d21a70e50 Evan Quan 2020-07-07  391  =

af5ba6d21a70e50 Evan Quan 2020-07-07  392  	skipped_feature_id =3D smu_cmn_=
to_asic_specific_index(smu,
af5ba6d21a70e50 Evan Quan 2020-07-07  393  							    CMN2ASIC_MAPPING_FEAT=
URE,
af5ba6d21a70e50 Evan Quan 2020-07-07  394  							    mask);
af5ba6d21a70e50 Evan Quan 2020-07-07  395  	if (skipped_feature_id < 0)
af5ba6d21a70e50 Evan Quan 2020-07-07  396  		return -EINVAL;
af5ba6d21a70e50 Evan Quan 2020-07-07  397  =

af5ba6d21a70e50 Evan Quan 2020-07-07  398  	features_to_disable &=3D ~(1ULL=
 << skipped_feature_id);
af5ba6d21a70e50 Evan Quan 2020-07-07  399  =

af5ba6d21a70e50 Evan Quan 2020-07-07  400  	return smu_cmn_feature_update_e=
nable_state(smu,
af5ba6d21a70e50 Evan Quan 2020-07-07  401  						   features_to_disable,
af5ba6d21a70e50 Evan Quan 2020-07-07  402  						   0);
af5ba6d21a70e50 Evan Quan 2020-07-07  403  }
a7bae0619903196 Evan Quan 2020-07-07  404  =

a7bae0619903196 Evan Quan 2020-07-07  405  int smu_cmn_get_smc_version(stru=
ct smu_context *smu,
a7bae0619903196 Evan Quan 2020-07-07  406  			    uint32_t *if_version,
a7bae0619903196 Evan Quan 2020-07-07  407  			    uint32_t *smu_version)
a7bae0619903196 Evan Quan 2020-07-07  408  {
a7bae0619903196 Evan Quan 2020-07-07  409  	int ret =3D 0;
a7bae0619903196 Evan Quan 2020-07-07  410  =

a7bae0619903196 Evan Quan 2020-07-07  411  	if (!if_version && !smu_version)
a7bae0619903196 Evan Quan 2020-07-07  412  		return -EINVAL;
a7bae0619903196 Evan Quan 2020-07-07  413  =

a7bae0619903196 Evan Quan 2020-07-07  414  	if (smu->smc_fw_if_version && s=
mu->smc_fw_version)
a7bae0619903196 Evan Quan 2020-07-07  415  	{
a7bae0619903196 Evan Quan 2020-07-07  416  		if (if_version)
a7bae0619903196 Evan Quan 2020-07-07  417  			*if_version =3D smu->smc_fw_i=
f_version;
a7bae0619903196 Evan Quan 2020-07-07  418  =

a7bae0619903196 Evan Quan 2020-07-07  419  		if (smu_version)
a7bae0619903196 Evan Quan 2020-07-07  420  			*smu_version =3D smu->smc_fw_=
version;
a7bae0619903196 Evan Quan 2020-07-07  421  =

a7bae0619903196 Evan Quan 2020-07-07  422  		return 0;
a7bae0619903196 Evan Quan 2020-07-07  423  	}
a7bae0619903196 Evan Quan 2020-07-07  424  =

a7bae0619903196 Evan Quan 2020-07-07  425  	if (if_version) {
a7bae0619903196 Evan Quan 2020-07-07  426  		ret =3D smu_send_smc_msg(smu, =
SMU_MSG_GetDriverIfVersion, if_version);
a7bae0619903196 Evan Quan 2020-07-07  427  		if (ret)
a7bae0619903196 Evan Quan 2020-07-07  428  			return ret;
a7bae0619903196 Evan Quan 2020-07-07  429  =

a7bae0619903196 Evan Quan 2020-07-07  430  		smu->smc_fw_if_version =3D *if=
_version;
a7bae0619903196 Evan Quan 2020-07-07  431  	}
a7bae0619903196 Evan Quan 2020-07-07  432  =

a7bae0619903196 Evan Quan 2020-07-07  433  	if (smu_version) {
a7bae0619903196 Evan Quan 2020-07-07  434  		ret =3D smu_send_smc_msg(smu, =
SMU_MSG_GetSmuVersion, smu_version);
a7bae0619903196 Evan Quan 2020-07-07  435  		if (ret)
a7bae0619903196 Evan Quan 2020-07-07  436  			return ret;
a7bae0619903196 Evan Quan 2020-07-07  437  =

a7bae0619903196 Evan Quan 2020-07-07  438  		smu->smc_fw_version =3D *smu_v=
ersion;
a7bae0619903196 Evan Quan 2020-07-07  439  	}
a7bae0619903196 Evan Quan 2020-07-07  440  =

a7bae0619903196 Evan Quan 2020-07-07  441  	return ret;
a7bae0619903196 Evan Quan 2020-07-07  442  }
caad2613dc4bd73 Evan Quan 2020-07-07  443  =

caad2613dc4bd73 Evan Quan 2020-07-07  444  int smu_cmn_update_table(struct =
smu_context *smu,
caad2613dc4bd73 Evan Quan 2020-07-07  445  			 enum smu_table_id table_inde=
x,
caad2613dc4bd73 Evan Quan 2020-07-07  446  			 int argument,
caad2613dc4bd73 Evan Quan 2020-07-07  447  			 void *table_data,
caad2613dc4bd73 Evan Quan 2020-07-07  448  			 bool drv2smu)
caad2613dc4bd73 Evan Quan 2020-07-07  449  {
caad2613dc4bd73 Evan Quan 2020-07-07  450  	struct smu_table_context *smu_t=
able =3D &smu->smu_table;
caad2613dc4bd73 Evan Quan 2020-07-07  451  	struct amdgpu_device *adev =3D =
smu->adev;
caad2613dc4bd73 Evan Quan 2020-07-07  452  	struct smu_table *table =3D &sm=
u_table->driver_table;
caad2613dc4bd73 Evan Quan 2020-07-07  453  	int table_id =3D smu_cmn_to_asi=
c_specific_index(smu,
caad2613dc4bd73 Evan Quan 2020-07-07  454  						      CMN2ASIC_MAPPING_TAB=
LE,
caad2613dc4bd73 Evan Quan 2020-07-07  455  						      table_index);
caad2613dc4bd73 Evan Quan 2020-07-07  456  	uint32_t table_size;
caad2613dc4bd73 Evan Quan 2020-07-07  457  	int ret =3D 0;
caad2613dc4bd73 Evan Quan 2020-07-07  458  	if (!table_data || table_id >=
=3D SMU_TABLE_COUNT || table_id < 0)
caad2613dc4bd73 Evan Quan 2020-07-07  459  		return -EINVAL;
caad2613dc4bd73 Evan Quan 2020-07-07  460  =

caad2613dc4bd73 Evan Quan 2020-07-07  461  	table_size =3D smu_table->table=
s[table_index].size;
caad2613dc4bd73 Evan Quan 2020-07-07  462  =

caad2613dc4bd73 Evan Quan 2020-07-07  463  	if (drv2smu) {
caad2613dc4bd73 Evan Quan 2020-07-07  464  		memcpy(table->cpu_addr, table_=
data, table_size);
caad2613dc4bd73 Evan Quan 2020-07-07  465  		/*
caad2613dc4bd73 Evan Quan 2020-07-07  466  		 * Flush hdp cache: to guard t=
he content seen by
caad2613dc4bd73 Evan Quan 2020-07-07  467  		 * GPU is consitent with CPU.
caad2613dc4bd73 Evan Quan 2020-07-07  468  		 */
caad2613dc4bd73 Evan Quan 2020-07-07  469  		amdgpu_asic_flush_hdp(adev, NU=
LL);
caad2613dc4bd73 Evan Quan 2020-07-07  470  	}
caad2613dc4bd73 Evan Quan 2020-07-07  471  =

caad2613dc4bd73 Evan Quan 2020-07-07  472  	ret =3D smu_send_smc_msg_with_p=
aram(smu, drv2smu ?
caad2613dc4bd73 Evan Quan 2020-07-07  473  					  SMU_MSG_TransferTableDram=
2Smu :
caad2613dc4bd73 Evan Quan 2020-07-07  474  					  SMU_MSG_TransferTableSmu2=
Dram,
caad2613dc4bd73 Evan Quan 2020-07-07  475  					  table_id | ((argument & 0=
xFFFF) << 16),
caad2613dc4bd73 Evan Quan 2020-07-07  476  					  NULL);
caad2613dc4bd73 Evan Quan 2020-07-07  477  	if (ret)
caad2613dc4bd73 Evan Quan 2020-07-07  478  		return ret;
caad2613dc4bd73 Evan Quan 2020-07-07  479  =

caad2613dc4bd73 Evan Quan 2020-07-07  480  	if (!drv2smu) {
caad2613dc4bd73 Evan Quan 2020-07-07  481  		amdgpu_asic_flush_hdp(adev, NU=
LL);
caad2613dc4bd73 Evan Quan 2020-07-07  482  		memcpy(table_data, table->cpu_=
addr, table_size);
caad2613dc4bd73 Evan Quan 2020-07-07  483  	}
caad2613dc4bd73 Evan Quan 2020-07-07  484  =

caad2613dc4bd73 Evan Quan 2020-07-07 @485  	return ret;
caad2613dc4bd73 Evan Quan 2020-07-07  486  }
caad2613dc4bd73 Evan Quan 2020-07-07  487  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8352311764111884073==--

