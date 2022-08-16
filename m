Content-Type: multipart/mixed; boundary="===============8437782486349376369=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [broonie-misc:arm64-sysreg-gen-4 4/28] drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:153:50: error: use of undeclared identifier 'ID_AA64MMFR0_PARANGE_SHIFT'
Date: Tue, 16 Aug 2022 11:49:11 +0800
Message-ID: <202208161156.9HEoSNJb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8437782486349376369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git ar=
m64-sysreg-gen-4
head:   36985fd29b63e897332d6d831d3aa03ea8722f3c
commit: e520c3303ffbf18b004d7cc16d60141def9bf675 [4/28] arm64/sysreg: Add _=
EL1 into ID_AA64MMFR0_EL1 definition names
:::::: branch date: 14 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-r022-20220815 (https://download.01.org/0day-ci/arc=
hive/20220816/202208161156.9HEoSNJb-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3=
bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git/=
commit/?id=3De520c3303ffbf18b004d7cc16d60141def9bf675
        git remote add broonie-misc https://git.kernel.org/pub/scm/linux/ke=
rnel/git/broonie/misc.git
        git fetch --no-tags broonie-misc arm64-sysreg-gen-4
        git checkout e520c3303ffbf18b004d7cc16d60141def9bf675
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 O=3Dbuild_dir ARCH=3Darm64 SHELL=3D/bin/bash drivers/iommu/arm/arm-smmu-v=
3/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:153:50: error: use of un=
declared identifier 'ID_AA64MMFR0_PARANGE_SHIFT'
           par =3D cpuid_feature_extract_unsigned_field(reg, ID_AA64MMFR0_P=
ARANGE_SHIFT);
                                                           ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:428:50: error: use of un=
declared identifier 'ID_AA64MMFR0_PARANGE_SHIFT'
           fld =3D cpuid_feature_extract_unsigned_field(reg, ID_AA64MMFR0_P=
ARANGE_SHIFT);
                                                           ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:434:50: error: use of un=
declared identifier 'ID_AA64MMFR0_ASID_SHIFT'
           fld =3D cpuid_feature_extract_unsigned_field(reg, ID_AA64MMFR0_A=
SID_SHIFT);
                                                           ^
   3 errors generated.


vim +/ID_AA64MMFR0_PARANGE_SHIFT +153 drivers/iommu/arm/arm-smmu-v3/arm-smm=
u-v3-sva.c

3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18   91  =

3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18   92  static struct arm_smm=
u_ctx_desc *arm_smmu_alloc_shared_cd(struct mm_struct *mm)
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18   93  {
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18   94  	u16 asid;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18   95  	int err =3D 0;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18   96  	u64 tcr, par, reg;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18   97  	struct arm_smmu_ctx_=
desc *cd;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18   98  	struct arm_smmu_ctx_=
desc *ret =3D NULL;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18   99  =

cbd23144f7662b Jean-Philippe Brucker 2022-04-26  100  	/* Don't free the mm=
 until we release the ASID */
cbd23144f7662b Jean-Philippe Brucker 2022-04-26  101  	mmgrab(mm);
cbd23144f7662b Jean-Philippe Brucker 2022-04-26  102  =

3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  103  	asid =3D arm64_mm_co=
ntext_get(mm);
cbd23144f7662b Jean-Philippe Brucker 2022-04-26  104  	if (!asid) {
cbd23144f7662b Jean-Philippe Brucker 2022-04-26  105  		err =3D -ESRCH;
cbd23144f7662b Jean-Philippe Brucker 2022-04-26  106  		goto out_drop_mm;
cbd23144f7662b Jean-Philippe Brucker 2022-04-26  107  	}
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  108  =

3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  109  	cd =3D kzalloc(sizeo=
f(*cd), GFP_KERNEL);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  110  	if (!cd) {
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  111  		err =3D -ENOMEM;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  112  		goto out_put_contex=
t;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  113  	}
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  114  =

3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  115  	refcount_set(&cd->re=
fs, 1);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  116  =

3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  117  	mutex_lock(&arm_smmu=
_asid_lock);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  118  	ret =3D arm_smmu_sha=
re_asid(mm, asid);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  119  	if (ret) {
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  120  		mutex_unlock(&arm_s=
mmu_asid_lock);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  121  		goto out_free_cd;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  122  	}
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  123  =

3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  124  	err =3D xa_insert(&a=
rm_smmu_asid_xa, asid, cd, GFP_KERNEL);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  125  	mutex_unlock(&arm_sm=
mu_asid_lock);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  126  =

3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  127  	if (err)
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  128  		goto out_free_asid;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  129  =

3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  130  	tcr =3D FIELD_PREP(C=
TXDESC_CD_0_TCR_T0SZ, 64ULL - vabits_actual) |
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  131  	      FIELD_PREP(CTX=
DESC_CD_0_TCR_IRGN0, ARM_LPAE_TCR_RGN_WBWA) |
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  132  	      FIELD_PREP(CTX=
DESC_CD_0_TCR_ORGN0, ARM_LPAE_TCR_RGN_WBWA) |
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  133  	      FIELD_PREP(CTX=
DESC_CD_0_TCR_SH0, ARM_LPAE_TCR_SH_IS) |
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  134  	      CTXDESC_CD_0_T=
CR_EPD1 | CTXDESC_CD_0_AA64;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  135  =

3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  136  	switch (PAGE_SIZE) {
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  137  	case SZ_4K:
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  138  		tcr |=3D FIELD_PREP=
(CTXDESC_CD_0_TCR_TG0, ARM_LPAE_TCR_TG0_4K);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  139  		break;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  140  	case SZ_16K:
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  141  		tcr |=3D FIELD_PREP=
(CTXDESC_CD_0_TCR_TG0, ARM_LPAE_TCR_TG0_16K);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  142  		break;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  143  	case SZ_64K:
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  144  		tcr |=3D FIELD_PREP=
(CTXDESC_CD_0_TCR_TG0, ARM_LPAE_TCR_TG0_64K);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  145  		break;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  146  	default:
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  147  		WARN_ON(1);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  148  		err =3D -EINVAL;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  149  		goto out_free_asid;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  150  	}
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  151  =

3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  152  	reg =3D read_sanitis=
ed_ftr_reg(SYS_ID_AA64MMFR0_EL1);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18 @153  	par =3D cpuid_featur=
e_extract_unsigned_field(reg, ID_AA64MMFR0_PARANGE_SHIFT);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  154  	tcr |=3D FIELD_PREP(=
CTXDESC_CD_0_TCR_IPS, par);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  155  =

3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  156  	cd->ttbr =3D virt_to=
_phys(mm->pgd);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  157  	cd->tcr =3D tcr;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  158  	/*
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  159  	 * MAIR value is pre=
tty much constant and global, so we can just get it
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  160  	 * from the current =
CPU register
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  161  	 */
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  162  	cd->mair =3D read_sy=
sreg(mair_el1);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  163  	cd->asid =3D asid;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  164  	cd->mm =3D mm;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  165  =

3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  166  	return cd;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  167  =

3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  168  out_free_asid:
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  169  	arm_smmu_free_asid(c=
d);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  170  out_free_cd:
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  171  	kfree(cd);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  172  out_put_context:
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  173  	arm64_mm_context_put=
(mm);
cbd23144f7662b Jean-Philippe Brucker 2022-04-26  174  out_drop_mm:
cbd23144f7662b Jean-Philippe Brucker 2022-04-26  175  	mmdrop(mm);
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  176  	return err < 0 ? ERR=
_PTR(err) : ret;
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  177  }
3f1ce8e85ee06d Jean-Philippe Brucker 2020-09-18  178  =


:::::: The code@line 153 was first introduced by commit
:::::: 3f1ce8e85ee06dbe6a8b2e037e9b35f6b32e9ab3 iommu/arm-smmu-v3: Share pr=
ocess page tables

:::::: TO: Jean-Philippe Brucker <jean-philippe@linaro.org>
:::::: CC: Will Deacon <will@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8437782486349376369==--

