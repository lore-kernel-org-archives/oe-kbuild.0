Content-Type: multipart/mixed; boundary="===============7446359339707849999=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/arm/arm-smmu/arm-smmu.c:831 arm_smmu_init_domain_context() warn: should '~0 << ias' be a 64 bit
Date: Thu, 22 Oct 2020 20:29:37 +0800
Message-ID: <202010222034.fmcZGZGr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7446359339707849999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jordan Crouse <jcrouse@codeaurora.org>
CC: Will Deacon <will@kernel.org>
CC: Rob Clark <robdclark@chromium.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f804b3159482eedbb4250b1e9248c308fb63b805
commit: 67f1a7a314a2c29832ae604f839653408492ee5d iommu/arm-smmu: Add suppor=
t for split pagetables
date:   4 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-m021-20201022 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/iommu/arm/arm-smmu/arm-smmu.c:831 arm_smmu_init_domain_context() wa=
rn: should '~0 << ias' be a 64 bit type?

Old smatch warnings:
drivers/iommu/arm/arm-smmu/arm-smmu.c:1855 arm_smmu_device_cfg_probe() warn=
: should '2 * size << smmu->pgshift' be a 64 bit type?

vim +831 drivers/iommu/arm/arm-smmu/arm-smmu.c

45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  666  =

45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  667  static int arm_smmu_init_domain_context(struct iommu_domain *=
domain,
44680eedf9409da drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  668  					struct arm_smmu_device *smmu)
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  669  {
a18037b27ebd23e drivers/iommu/arm-smmu.c              Mitchel Humpherys 201=
4-07-30  670  	int irq, start, ret =3D 0;
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  671  	unsigned long ias, oas;
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  672  	struct io_pgtable_ops *pgtbl_ops;
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  673  	struct io_pgtable_cfg pgtbl_cfg;
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  674  	enum io_pgtable_fmt fmt;
1d672638fca24db drivers/iommu/arm-smmu.c              Joerg Roedel      201=
5-03-26  675  	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domai=
n);
44680eedf9409da drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  676  	struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
aa7ec73297df57a drivers/iommu/arm-smmu.c              Krishna Reddy     202=
0-07-18  677  	irqreturn_t (*context_fault)(int irq, void *dev);
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  678  =

518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  679  	mutex_lock(&smmu_domain->init_mutex);
a18037b27ebd23e drivers/iommu/arm-smmu.c              Mitchel Humpherys 201=
4-07-30  680  	if (smmu_domain->smmu)
a18037b27ebd23e drivers/iommu/arm-smmu.c              Mitchel Humpherys 201=
4-07-30  681  		goto out_unlock;
a18037b27ebd23e drivers/iommu/arm-smmu.c              Mitchel Humpherys 201=
4-07-30  682  =

61bc671179f1906 drivers/iommu/arm-smmu.c              Will Deacon       201=
7-01-06  683  	if (domain->type =3D=3D IOMMU_DOMAIN_IDENTITY) {
61bc671179f1906 drivers/iommu/arm-smmu.c              Will Deacon       201=
7-01-06  684  		smmu_domain->stage =3D ARM_SMMU_DOMAIN_BYPASS;
61bc671179f1906 drivers/iommu/arm-smmu.c              Will Deacon       201=
7-01-06  685  		smmu_domain->smmu =3D smmu;
61bc671179f1906 drivers/iommu/arm-smmu.c              Will Deacon       201=
7-01-06  686  		goto out_unlock;
61bc671179f1906 drivers/iommu/arm-smmu.c              Will Deacon       201=
7-01-06  687  	}
61bc671179f1906 drivers/iommu/arm-smmu.c              Will Deacon       201=
7-01-06  688  =

45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  689  	/*
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  690  	 * Mapping the requested stage onto what we support is surpr=
isingly
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  691  	 * complicated, mainly because the spec allows S1+S2 SMMUs w=
ithout
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  692  	 * support for nested translation. That means we end up with=
 the
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  693  	 * following table:
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  694  	 *
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  695  	 * Requested        Supported        Actual
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  696  	 *     S1               N              S1
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  697  	 *     S1             S1+S2            S1
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  698  	 *     S1               S2             S2
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  699  	 *     S1               S1             S1
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  700  	 *     N                N              N
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  701  	 *     N              S1+S2            S2
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  702  	 *     N                S2             S2
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  703  	 *     N                S1             S1
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  704  	 *
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  705  	 * Note that you can't actually request stage-2 mappings.
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  706  	 */
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  707  	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1))
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  708  		smmu_domain->stage =3D ARM_SMMU_DOMAIN_S2;
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  709  	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  710  		smmu_domain->stage =3D ARM_SMMU_DOMAIN_S1;
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  711  =

7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  712  	/*
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  713  	 * Choosing a suitable context format is even more fiddly. U=
ntil we
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  714  	 * grow some way for the caller to express a preference, and=
/or move
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  715  	 * the decision into the io-pgtable code where it arguably b=
elongs,
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  716  	 * just aim for the closest thing to the rest of the system,=
 and hope
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  717  	 * that the hardware isn't esoteric enough that we can't ass=
ume AArch64
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  718  	 * support to be a superset of AArch32 support...
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  719  	 */
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  720  	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_L)
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  721  		cfg->fmt =3D ARM_SMMU_CTX_FMT_AARCH32_L;
6070529bebd26e0 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-08-11  722  	if (IS_ENABLED(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) &&
6070529bebd26e0 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-08-11  723  	    !IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_ARM_LPAE=
) &&
6070529bebd26e0 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-08-11  724  	    (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_S) &&
6070529bebd26e0 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-08-11  725  	    (smmu_domain->stage =3D=3D ARM_SMMU_DOMAIN_S1))
6070529bebd26e0 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-08-11  726  		cfg->fmt =3D ARM_SMMU_CTX_FMT_AARCH32_S;
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  727  	if ((IS_ENABLED(CONFIG_64BIT) || cfg->fmt =3D=3D ARM_SMMU_CT=
X_FMT_NONE) &&
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  728  	    (smmu->features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  729  			       ARM_SMMU_FEAT_FMT_AARCH64_16K |
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  730  			       ARM_SMMU_FEAT_FMT_AARCH64_4K)))
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  731  		cfg->fmt =3D ARM_SMMU_CTX_FMT_AARCH64;
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  732  =

7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  733  	if (cfg->fmt =3D=3D ARM_SMMU_CTX_FMT_NONE) {
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  734  		ret =3D -EINVAL;
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  735  		goto out_unlock;
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  736  	}
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  737  =

c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  738  	switch (smmu_domain->stage) {
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  739  	case ARM_SMMU_DOMAIN_S1:
44680eedf9409da drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  740  		cfg->cbar =3D CBAR_TYPE_S1_TRANS_S2_BYPASS;
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  741  		start =3D smmu->num_s2_context_banks;
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  742  		ias =3D smmu->va_size;
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  743  		oas =3D smmu->ipa_size;
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  744  		if (cfg->fmt =3D=3D ARM_SMMU_CTX_FMT_AARCH64) {
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  745  			fmt =3D ARM_64_LPAE_S1;
6070529bebd26e0 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-08-11  746  		} else if (cfg->fmt =3D=3D ARM_SMMU_CTX_FMT_AARCH32_L) {
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  747  			fmt =3D ARM_32_LPAE_S1;
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  748  			ias =3D min(ias, 32UL);
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  749  			oas =3D min(oas, 40UL);
6070529bebd26e0 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-08-11  750  		} else {
6070529bebd26e0 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-08-11  751  			fmt =3D ARM_V7S;
6070529bebd26e0 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-08-11  752  			ias =3D min(ias, 32UL);
6070529bebd26e0 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-08-11  753  			oas =3D min(oas, 32UL);
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  754  		}
abfd6fe0cd535d3 drivers/iommu/arm-smmu.c              Will Deacon       201=
9-07-02  755  		smmu_domain->flush_ops =3D &arm_smmu_s1_tlb_ops;
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  756  		break;
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  757  	case ARM_SMMU_DOMAIN_NESTED:
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  758  		/*
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  759  		 * We will likely want to change this if/when KVM gets
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  760  		 * involved.
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  761  		 */
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  762  	case ARM_SMMU_DOMAIN_S2:
9c5c92e35cf5c4f drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  763  		cfg->cbar =3D CBAR_TYPE_S2_TRANS;
9c5c92e35cf5c4f drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  764  		start =3D 0;
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  765  		ias =3D smmu->ipa_size;
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  766  		oas =3D smmu->pa_size;
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  767  		if (cfg->fmt =3D=3D ARM_SMMU_CTX_FMT_AARCH64) {
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  768  			fmt =3D ARM_64_LPAE_S2;
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  769  		} else {
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  770  			fmt =3D ARM_32_LPAE_S2;
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  771  			ias =3D min(ias, 40UL);
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  772  			oas =3D min(oas, 40UL);
7602b8710645da4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-28  773  		}
11febfca2419652 drivers/iommu/arm-smmu.c              Robin Murphy      201=
7-03-30  774  		if (smmu->version =3D=3D ARM_SMMU_V2)
abfd6fe0cd535d3 drivers/iommu/arm-smmu.c              Will Deacon       201=
9-07-02  775  			smmu_domain->flush_ops =3D &arm_smmu_s2_tlb_ops_v2;
11febfca2419652 drivers/iommu/arm-smmu.c              Robin Murphy      201=
7-03-30  776  		else
abfd6fe0cd535d3 drivers/iommu/arm-smmu.c              Will Deacon       201=
9-07-02  777  			smmu_domain->flush_ops =3D &arm_smmu_s2_tlb_ops_v1;
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  778  		break;
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  779  	default:
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  780  		ret =3D -EINVAL;
c752ce45b213de8 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  781  		goto out_unlock;
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  782  	}
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  783  	ret =3D __arm_smmu_alloc_bitmap(smmu->context_map, start,
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  784  				      smmu->num_context_banks);
287980e49ffc0f6 drivers/iommu/arm-smmu.c              Arnd Bergmann     201=
6-05-27  785  	if (ret < 0)
a18037b27ebd23e drivers/iommu/arm-smmu.c              Mitchel Humpherys 201=
4-07-30  786  		goto out_unlock;
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  787  =

44680eedf9409da drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  788  	cfg->cbndx =3D ret;
b7862e3559f9ab4 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-04-13  789  	if (smmu->version < ARM_SMMU_V2) {
44680eedf9409da drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  790  		cfg->irptndx =3D atomic_inc_return(&smmu->irptndx);
44680eedf9409da drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  791  		cfg->irptndx %=3D smmu->num_context_irqs;
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  792  	} else {
44680eedf9409da drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  793  		cfg->irptndx =3D cfg->cbndx;
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  794  	}
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  795  =

280b683ceaceb75 drivers/iommu/arm-smmu.c              Robin Murphy      201=
7-03-30  796  	if (smmu_domain->stage =3D=3D ARM_SMMU_DOMAIN_S2)
ba7e4a08bbf7441 drivers/iommu/arm-smmu.c              Robin Murphy      201=
9-08-15  797  		cfg->vmid =3D cfg->cbndx + 1;
280b683ceaceb75 drivers/iommu/arm-smmu.c              Robin Murphy      201=
7-03-30  798  	else
ba7e4a08bbf7441 drivers/iommu/arm-smmu.c              Robin Murphy      201=
9-08-15  799  		cfg->asid =3D cfg->cbndx;
ba7e4a08bbf7441 drivers/iommu/arm-smmu.c              Robin Murphy      201=
9-08-15  800  =

ba7e4a08bbf7441 drivers/iommu/arm-smmu.c              Robin Murphy      201=
9-08-15  801  	smmu_domain->smmu =3D smmu;
280b683ceaceb75 drivers/iommu/arm-smmu.c              Robin Murphy      201=
7-03-30  802  =

518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  803  	pgtbl_cfg =3D (struct io_pgtable_cfg) {
d546635731317a5 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-05-09  804  		.pgsize_bitmap	=3D smmu->pgsize_bitmap,
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  805  		.ias		=3D ias,
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  806  		.oas		=3D oas,
4f41845b340783e drivers/iommu/arm-smmu.c              Will Deacon       201=
9-06-25  807  		.coherent_walk	=3D smmu->features & ARM_SMMU_FEAT_COHERENT_=
WALK,
696bcfb70986207 drivers/iommu/arm-smmu.c              Robin Murphy      201=
9-09-18  808  		.tlb		=3D smmu_domain->flush_ops,
2df7a25ce4a7909 drivers/iommu/arm-smmu.c              Robin Murphy      201=
5-07-29  809  		.iommu_dev	=3D smmu->dev,
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  810  	};
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  811  =

dd147a89f37d5ad drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     202=
0-09-05  812  	if (smmu->impl && smmu->impl->init_context) {
dd147a89f37d5ad drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     202=
0-09-05  813  		ret =3D smmu->impl->init_context(smmu_domain, &pgtbl_cfg);
dd147a89f37d5ad drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     202=
0-09-05  814  		if (ret)
dd147a89f37d5ad drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     202=
0-09-05  815  			goto out_clear_smmu;
dd147a89f37d5ad drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     202=
0-09-05  816  	}
dd147a89f37d5ad drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     202=
0-09-05  817  =

44f6876a00e83df drivers/iommu/arm-smmu.c              Robin Murphy      201=
8-09-20  818  	if (smmu_domain->non_strict)
44f6876a00e83df drivers/iommu/arm-smmu.c              Robin Murphy      201=
8-09-20  819  		pgtbl_cfg.quirks |=3D IO_PGTABLE_QUIRK_NON_STRICT;
44f6876a00e83df drivers/iommu/arm-smmu.c              Robin Murphy      201=
8-09-20  820  =

518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  821  	pgtbl_ops =3D alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_dom=
ain);
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  822  	if (!pgtbl_ops) {
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  823  		ret =3D -ENOMEM;
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  824  		goto out_clear_smmu;
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  825  	}
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  826  =

d546635731317a5 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-05-09  827  	/* Update the domain's page sizes to reflect the page table =
format */
d546635731317a5 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-05-09  828  	domain->pgsize_bitmap =3D pgtbl_cfg.pgsize_bitmap;
67f1a7a314a2c29 drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     202=
0-09-05  829  =

67f1a7a314a2c29 drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     202=
0-09-05  830  	if (pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
67f1a7a314a2c29 drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     202=
0-09-05 @831  		domain->geometry.aperture_start =3D ~0UL << ias;
67f1a7a314a2c29 drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     202=
0-09-05  832  		domain->geometry.aperture_end =3D ~0UL;
67f1a7a314a2c29 drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     202=
0-09-05  833  	} else {
455eb7d34ad11b0 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-09-12  834  		domain->geometry.aperture_end =3D (1UL << ias) - 1;
67f1a7a314a2c29 drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     202=
0-09-05  835  	}
67f1a7a314a2c29 drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     202=
0-09-05  836  =

455eb7d34ad11b0 drivers/iommu/arm-smmu.c              Robin Murphy      201=
6-09-12  837  	domain->geometry.force_aperture =3D true;
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  838  =

518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  839  	/* Initialise the context bank with our page table cfg */
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  840  	arm_smmu_init_context_bank(smmu_domain, &pgtbl_cfg);
90df373cc62e527 drivers/iommu/arm-smmu.c              Robin Murphy      201=
7-08-08  841  	arm_smmu_write_context_bank(smmu, cfg->cbndx);
a18037b27ebd23e drivers/iommu/arm-smmu.c              Mitchel Humpherys 201=
4-07-30  842  =

518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  843  	/*
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  844  	 * Request context fault interrupt. Do this last to avoid the
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  845  	 * handler seeing a half-initialised domain state.
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  846  	 */
44680eedf9409da drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  847  	irq =3D smmu->irqs[smmu->num_global_irqs + cfg->irptndx];
aa7ec73297df57a drivers/iommu/arm-smmu.c              Krishna Reddy     202=
0-07-18  848  =

aa7ec73297df57a drivers/iommu/arm-smmu.c              Krishna Reddy     202=
0-07-18  849  	if (smmu->impl && smmu->impl->context_fault)
aa7ec73297df57a drivers/iommu/arm-smmu.c              Krishna Reddy     202=
0-07-18  850  		context_fault =3D smmu->impl->context_fault;
aa7ec73297df57a drivers/iommu/arm-smmu.c              Krishna Reddy     202=
0-07-18  851  	else
aa7ec73297df57a drivers/iommu/arm-smmu.c              Krishna Reddy     202=
0-07-18  852  		context_fault =3D arm_smmu_context_fault;
aa7ec73297df57a drivers/iommu/arm-smmu.c              Krishna Reddy     202=
0-07-18  853  =

aa7ec73297df57a drivers/iommu/arm-smmu.c              Krishna Reddy     202=
0-07-18  854  	ret =3D devm_request_irq(smmu->dev, irq, context_fault,
bee140044579fbf drivers/iommu/arm-smmu.c              Peng Fan          201=
6-07-04  855  			       IRQF_SHARED, "arm-smmu-context-fault", domain);
287980e49ffc0f6 drivers/iommu/arm-smmu.c              Arnd Bergmann     201=
6-05-27  856  	if (ret < 0) {
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  857  		dev_err(smmu->dev, "failed to request context IRQ %d (%u)\n=
",
44680eedf9409da drivers/iommu/arm-smmu.c              Will Deacon       201=
4-06-25  858  			cfg->irptndx, irq);
fba6e960772b7b6 drivers/iommu/arm-smmu.c              Will Deacon       202=
0-01-10  859  		cfg->irptndx =3D ARM_SMMU_INVALID_IRPTNDX;
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  860  	}
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  861  =

518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  862  	mutex_unlock(&smmu_domain->init_mutex);
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  863  =

518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  864  	/* Publish page table ops for map/unmap */
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  865  	smmu_domain->pgtbl_ops =3D pgtbl_ops;
a9a1b0b53d8b7ca drivers/iommu/arm-smmu.c              Will Deacon       201=
4-05-01  866  	return 0;
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  867  =

518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  868  out_clear_smmu:
6db7bfb431220d7 drivers/iommu/arm-smmu.c              Liu Xiang         201=
9-09-16  869  	__arm_smmu_free_bitmap(smmu->context_map, cfg->cbndx);
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  870  	smmu_domain->smmu =3D NULL;
a18037b27ebd23e drivers/iommu/arm-smmu.c              Mitchel Humpherys 201=
4-07-30  871  out_unlock:
518f7136244c167 drivers/iommu/arm-smmu.c              Will Deacon       201=
4-11-14  872  	mutex_unlock(&smmu_domain->init_mutex);
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  873  	return ret;
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  874  }
45ae7cff3684ab4 drivers/iommu/arm-smmu.c              Will Deacon       201=
3-06-24  875  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7446359339707849999==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICCd4kV8AAy5jb25maWcAjDxJc+O20vf8CtXkkhyS522cSX3lAwSCFCKCYABSlnxhOR5N4srY
zvPykvn3XzfABYCamuQwsdCNxtY7Gvz2m28X7O316eH29f7u9vPnL4vf94/759vX/cfFp/vP+/9b
ZHpR6WYhMtn8CMjl/ePbP/+5P/9wuXj/488/nvzwfHe+WO+fH/efF/zp8dP972/Q+/7p8Ztvv+G6
ymXRcd5thLFSV10jts3Vu9/v7n74efFdtv/t/vZx8fOP50Dm9P33/q93QTdpu4Lzqy9DUzGRuvr5
5PzkZACU2dh+dv7+xP030ilZVYzgk4D8itmOWdUVutHTIAFAVqWsxASS5tfuWpv11LJsZZk1Uomu
YctSdFabZoI2KyNYBmRyDf8AisWusDPfLgq3zZ8XL/vXt7+mvVoavRZVB1tlVR0MXMmmE9WmYwYW
K5Vsrs7PxglrVUsYuxE2GLvUnJXDqt+9iybcWVY2QeOKbUS3FqYSZVfcyGDgELIEyBkNKm8UoyHb
m7keeg5wQQNubJMB5NtFDwvmu7h/WTw+veJmfhNDhzmnvXDCYa8Uvr05BoXJHwdfHAPjQogZZyJn
bdm4sw7OZmheadtUTImrd989Pj3uv3830bU7u5E1J8estZXbTv3ailaQCNes4avuAD7wltHWdkoo
bXYdaxrGV+FutlaUcknSZS1oDIKiO1JmYEyHAXMHPi0HsQAJW7y8/fby5eV1/zCJRSEqYSR3Algb
vQxkMgTZlb4Omcdk0Go7e90ZYUWV0b34KuR4bMm0YrKK26xUFFK3ksLgcnYxNGe2EVpOYJhOlZUg
j/QkFGsMHBRsBchtow2NhcswG9agLlU6S1RTrg0XWa91ZFVMUFszYwUihacXUs7Esi1yGx/l/vHj
4ulTciiTXtV8bXULY3omynQwojvhEMWx9Req84aVMmON6ErYs47veEkcr9Oxm4lbErCjJzaiaoj9
DYCoYFnGWagpKTQFJ8uyX1oST2nbtTVOOdFUXth43brpGus0fmIxjuI4GWjuH/bPL5QYNJKvwTYI
4PNgXpXuVjdoBZSuwuOFxhomrDPJCTn0vWQWbrZri0jIYoVM18+V5I6D6QbKxwih6gboVrTyGRA2
umyrhpkdMdEeJ9jBvhPX0OegWbpNcBsJm/yf5vblz8UrTHFxC9N9eb19fVnc3t09vT2+3j/+nmwt
ngrjjq4Xn3GiKCKOBScwuaClzVBBcQFaE1AbEglP3DassfSeWEnu879YzUQEVyKtLp2qCMm5jTG8
XViCvWAHO4AdbrVvHKnDz05sgbkoBW8jCo5m0oTLdzR6iSJAB01tJqj2xjCeAJAw7G5ZTiIRQCoB
GtKKgi9L6YR73N94U0a9uvZ/BJp2PW6O5mHzCrQu6veHyQVDfysHsyTz5ursZNpVWTVrcMJykeCc
nkf6pK1s71byFUzbKaiBue3dH/uPb5/3z4tP+9vXt+f9i2vuF0NAI818zaqmW6LWBrptpVjdNeWy
y8vWrgItXRjd1oFGrVkhvNyJwEKBe8AjafH9/KxJHu8RapnRMtDDTTbjpfXwHJjrRphjKJnYSE4r
nx4DRCWV1GSWwuTE6pzFpBQrOGlgb0EFRJ4SGJWKXqzTKzMwcLBMAhuOQmYACHS3aPzvaZ4rwde1
Bl5DFQ4+Bb0NnrdY22i3LhpnZ3MLKwZ9AN6JoNxXI0oW+EDLco1778y+CRwv95spoOatf+DpmiwJ
PqAhiTmgpQ81Jl2UJc56iKqTrhdJzxlXfKk1mpde7qcN5Z0GA6PkjUBfyzGGNopVnHSdE2wLfwQe
GXgyTeDIeHmX2elligOalgtn17y2S30Obus1zAVUPU4mOIE6n354bT39TkZSEGFI5LVwubYQjULn
pPe6jnAGgdHDc+/2pv6P9ydCQ4MqMf3dVUqGsXaghUWZwwmZkPDBRkxWmYHzm7f0BNtGbCcq7icI
VzBSrUOP08qiYmUesLRbS9jgfMiwwa5ARQa+sdSRb6G71iQOxYCZbSRMvd/eYL+A3pIZI0M1vEaU
nbKHLV3kM4+tbltQbhu5EdF+1fnRQ0dOcVFpTkmPMzCYQpkmCdQqnpwXBCS/Tr+cNk3aoLvIMpGl
HA+Dd6mvX/PTk4vBNvb5qHr//Onp+eH28W6/EP/bP4KzxMA8cnSXwGWdHJ+Y4rhMPycHhBV3G+Wi
M9I5+5cjDgNulB9usKWx3taqZmCdzZqWuJLREbct2yXlj5V6GYk19IejMWDJ+9wCTW3V5jm4Hs7k
j2Ep6Z/rXJZRuOn0lLM8NvSw4pzXgLz9cNmdBzoefofmwjam5U77ZYJDyBswvG6bum06p4Obq3f7
z5/Oz37A1ORoUtBhAqvV2bauo8wc+FV87Z3HA5hSgTfpmFmhf2QqMEfSx4ZXH47B2fbq9JJGGM72
K3QitIjcGLNb1mVh0m0ARFrSU2W7wVR0ecYPu4Ccy6XBCDyLjfgoyRhOoKLYUjAGDkSHidLExI0Y
wB7A411dAKs0iTBb0XgXywdfRgRLcr76AHLKAEgZzBGs2mo9g+f4lUTz85FLYSqfQQFTZOWyTKds
W1sLOIQZsHOd3daxslu1YCTL5QEFx1J20CAwJSdBEZMD03clu9l1hZ3r3rpcVwDOwXQKZsodxwRQ
aFPqwkcKJegVMBRjHNFnsy3D40GmxzMQ3GeYnLKsn5/u9i8vT8+L1y9/+cAyiih6QjcQw3dz/rhV
VA4WF5kL1rRGeK84VEMIVLXLS5EkC11mubQr0tVswCb7zHxEz7MpOE2GsvSIIbYNHC2yC+EmIAI1
bIQASg1TvLWlHXZEYWqiTwQgo9m3eaeWEuLFwBXwbYfBRTSAyfj52el2Zo0j+/Rp25zJsg0tb898
0sjoRHwgoJUElQouOqazcLGUzl/tQNzANQG3tmijawc4ULaRpgkJD22zIRNOaLVBPVQugUW7zcCg
06pFRfRbgx1Nxvd5x7rFxBZwftn03ts0mQ19tuMkj6R5UtQhIB+JqIsPl3ZL0kcQDXh/BNBYOq2P
MKUoDlCXzn5OmKDLwLdXUtKERvBxuDoKpe871HpmYeufZto/0O3ctFbTakKJPAf5ipNcE/RaVpje
5zMT6cHndJZCgcWboVsIcEWK7ekRaFfOMALfGbmd3e+NZPy8O5sHzuwdOtczvcBxUzNSd5CBG1Sc
qXAJ3rb73NRliFKezsO8hsQYget6F5NGP7oGE+STE7ZVMRjYPW7gqt7yVXF5kTbrTdwCzpRUrXIm
IGdKlrt4Uk71QDStbOBASgZqEC1UF8XiiL9R2wPbNTm8mN/FkF6UoKmCfBkMDtrX78Bhszv4yNcd
IGAxDhtXuyJO6I90QOhYS+nlAQM828oq0TBytFZx335A+WbF9FZSqnZVC68aI7WcKUngVs4Tsx1M
AnyxpSjA0T2lgXgpdwDqw5IDwNQAUy3RX40vlRyDwWbWKUPjkejDZndFTqBDQN43xlZXGIg4fDKn
v6d3iSK8Y5wRL8UTswsNmPEtRcH47gCUMs7QHLGH8zAqLjF8pOi7+z+7Aj+Gov8LMuxDJHMrAfFT
ORld7xUGkezD0+P969NzdF8ShMyDwFdJPuYAw7C6PAbneCkSOXUhjvOq9HWa7u1jy5n5RsftNh0k
Owww41+Idnq5TJlK2Bo87yRIBTapS/xHhFm3RoNGXAZBjPywDj08z0jIN0CxrWknUkkOOgYU8KwH
CGpshuWc7xPuYaXxFg98QZJYD7ug/JwednlRhPtl6xI8xPMoMzq0ntE+6wA+pb0p0AM6zyESvDr5
h5/E1Tv9HOKdr1nC9rxmGN000jaSp+FUDqoCSICuYUSw5yKQebDT8IMnjVfuAQfLElmqHPxkvMhu
xVU09bpJZ4p2DwJ7bTEdZtrhwjI6XWQPdDLVMPCE6gnMnL0vD8BLpeury4vRI2xMpLTxNwaEspE3
pHfvtzh1qsF0WwgzUc7R8mcJGPR5pg/CKavYXGQIPmedons90Nit22rkiq/EYRMqZbQIPLznCEcV
OWXBrOCYggkRVzfd6ckJLUM33dn7WdB53CsidxJkQ26uTgO+X4utiCwQN8yuuqwlI+16tbMSjRkI
gUExOu2laLrsEC6Dhyx+rD8rZVFB/7O4hM6nozaZjfaOq8ylfYBdqXgb9lvmu67Mmm6q25gU9pG0
Q8RYXi4HSViBZJQHKa4ex2uZGg1FE96V1k9/758XYBxuf98/7B9f3WiM13Lx9BfWKkaJjj79QweJ
lB8d52yQbDC7g1+DGXJHYUFU9bqtk+Uo0BxNXymFXeowa+daYEMb0FnOHjrNB6SmROZUhIW4zvUt
SEn3tGpu/HSSQYzYdHojjJGZCLNhMXnBqeKhEIOls1+yBvTlLm1tmybWha55A6PrOdI5O+yQaVJB
OpgLD4z4tautTYaf3PrRD6HBcc1MDDyYzNSNFYWBo6eT6A6398QS2ry1EL91mQU5ymUZ3piOGVbf
3clAWxeGZekEUxjBIXQVn1sDl3iLQN8T+DlqiEhAFcwurRfbyQ2P+9sl7Qj5vjNFBOHuQKyz0kfQ
jMharI3DmsBrZtBelFSx0SRzrBaB5Mbt/b1kPAQCyAlkdZNTnmskRFtQWPQR1OANdroG3pEzWY7h
COBvUgidPVdj9DbouVxeTYVSi/x5/9+3/ePdl8XL3e3nyNcfhCaOJJ0YFXqDZaEYCjcz4MPCtBGM
cjYTxTr4UPuKZILLdpJWhIubbeHI6LoPqgumK1zVxr/voqtMwHxmKlyoHgDr6zc3ZMVAuG3xekmM
YZUz8HFJYfwRYVAroI9wmvfVw8Qzn1KeWXx8vv9fdLU6uWD1QXTn+JJzHAuHms+n95r7KJLbjUpf
d3HSkcT4KY6AA8BgsOM7ga1zCpSmNsp5ubUQGRhkn5oxsgrqTmh4am9jLMlXcyCrZDL5C5+GhtkR
1yHuCCtXGHw2M/lSV4VpqzRIxeYVcO7shouJASPF5rjj5Y/b5/3HwL0iF1PK5dw63W0j1ryx2oc8
oe9I66uRLeXHz/tYe/UmOy6PxBsC5O6SZdlcEVmIp0TVzkjKiNMIPTvOcBtBmh0PGm4u0sW6FY1h
pxOnFO3rPq7bn+Xby9Cw+A4M+2L/evfj96H/i9a+0Bih0ubIgZXyP4+gZNIIsqzOg1kV+H/YhCPG
LZ5C3DYMHGWJoJ1Xy7MT2OhfWzlTN4E35suWso/9XTom/YLg3gZJHMsxIkp/r0xqUyF82ka5F9G8
f39ySnlFEKRUKffvbL4Mz3TmsPxB3j/ePn9ZiIe3z7eJkPXhWp/iHWgd4Me+DXhRWFagIWAf3IL8
/vnhb5DjRZZqdWYU7IFy7m2juQ591hHkYpP+KUWgXDxCPfUlT0tklLLNpVHOfYNo0E90AFx3PO+r
0Sb9GLYO0erUZ8nVxU/bbVdtDIvLxXqAhRlSAV+hdVGKcTJh1x6EmVCXG54LuEUux4v8gOfUFvz8
eloANti49rpvgpjwQOk2+9+fbxefhlPztjisCp5BGMAH5x1xyHoTZOHw+rMFbr9hff5qOFyIRTbb
96dnUZNdsdOukmnb2fvLtLWpGbgtV8kjudvnuz/uX/d3mB344eP+L5gvargD6+JzJHEa2iVSkrah
8AWN8S7cXO2LmagTc3swwCdSQwuGBIf3I2tfwEGQ+6VVeIexDPOJLoPJYcY7i4nHPH7Q5ybgbjtd
6r+tXK4GS3c5RpiH2Tr31q+RVbe01yx90ydhQ7DaiCjJWadVJ74Vqy4ogK7p9p4MvmXMqcLVvK18
XZcwBqNqdzURMZNDi0pAp8djjuJK63UCRD2O0agsWt0Sb4EsbLuzyP6VVLJrrlpJmwbzVn198iEC
hDp9NmoG6O1Wpw423c/cPwr1dW3d9UqCNZcHJQxYZWS7bFcxVMvujZDvkeCdny1lg4nSLj1GfMAK
TmH/BDQ9HQgnQVSrzBcF9TwUW0CPF1VkxgeHj1FnO66uuyUs1BegJzAl0bWbwNZNJ0Fype/AdK2p
ukrDkUTFrmklKMEnGOujZ+xq9X3N01DLf0CEGH+o+zT9FmHqlTpPSpIpaFhp26Mp1XYFw7RPn6DB
Bw0kGJ+uUCg933k58S9K+ivzZDJ9q7/znIFlup0pd5M17/wTwuFFMbHUPmnel/sFam2mPeiJG1wC
NyTAg4K1KUkbQWYTOW4BslmBEvSH6Aqb0pMmHnelDKuRIVRaiTxoogpvkVApYzkg3mdReAjDGuI0
2es22AExcQ1m0aTdQYqHyyrBQQ6CdCqAWkwjo7rHkngjygPmsB7i7meiAs1pblEBa2pytqBgSG0Z
9xpLWXtHO9YJEKPiTQGcAbhMWTCGxufosuiz7ucHAJYYhdG5Rb2Hp0YpYYixQbf2763NdVC2egSU
dvd7S3anQNNu1nAK52fDlUusfEfjDBYkssAja6PKCqvDybR6UGIPXgw3O/dA0jtNXG9++O32BcLv
P31V+l/PT5/u+5Te5KkCWr8NxwZwaIOPk1zhHBsp2hX8bgOmf2VF1oN/xb0bSBnYd3ydEcqve8Jg
sTB/Kg7pZSIVEv88GrY35OMe1FZks+8xAqcb1Mms0vf3vrs1fPjwxdxLigFzJpLuwcjzRsxUnPY4
WGB8DZbVWlBf0yM0iBfcvRT9jqMCTgQp26mlLik+A25XA9Y6flsStgZezHQ5Magm9wJ0vOaagqxy
5prGVqdTANRW/hscoPpAh+NJ8LSie7p58yEsBGWEuLkPHGSOjHt6Po9irikElIUKDhLvw0pW17jJ
LMvwVDqfZCX0yPDopVuKHP+H3kT8bD/AdTek3bUB4mIswxH/7O/eXm9/+7x3n2NZuBqX1yDkWcoq
Vw1q+Iko/IjjHTcH9F/GbDRahOG96peEluVGhu+t+2ZgLR6T7D2iUZ7nJutWovYPT89fFmpKUB2E
b0eLLYYqDsWqlkUVvVMJh4dReQPfOabWuRJH3y8wyhM5H4+l3i9+pKAIr2z7+Y7PrUNS7j7a3UX7
CraLaf/AjCWmzVXCGIHcHLkgShaGpVYQQ5wueVWA1/iOK7umu7yIyph8abNGwxwFqJZKcAxc4gy8
/xRCZq4uTn6+pCVvrtD8oH2qi7gGx9+CPPmwj9ROlGNFVRuGrz/WwRlz8Ch9rUo4Mo+fMPStN7UO
k1g3yzYLc1Y35zm4I1Q/6x+FTRpraHHcQ6QcMOkzRN9RXicbHlthaLumK899Xf5heTws35Vwph8V
GAaHEGgJbsJKsfBTFNhcCGRQVzLkCpYI1YRg53myyPrPC/R0MqNTUu1f/356/hOviIiSC5CEtaBS
xaD+Aw8Lf2FuMVy5a8sko+1nU8680siNctqYhOJT6rWgroelX9J0aLV/OosfFKGTzjW+4cRLPDAs
WD1KxSqAVFfhJ2jc7y5b8ToZDJtdcdjcYIhgmKHhuC5Zy2PAAg2FUC31ssBjdE1bVSJWwLsKFJJe
S0Hvtu+4aejrcYTmuj0Gm4alB8Bj6Rj9rsPBwBeaB0Jwq8mqKgcdlxs2IsMlTQ2vh+aYfJvV8wzq
MAy7/goGQuFcIPrQO5rRYXT4sxi5jXLmBhzeLkOzNmj7AX717u7tt/u7dzF1lb1PvNSR6zaXMZtu
Lntex0iIruBzSP55PJZsdhmjr9Fx9ZfHjvby6NleEocbz0HJmn4b4qAJz4YgK5uDVUNbd2movXfg
KgMXynkdza4WB709px2ZKmqauuw/NTcjCQ7R7f483IrisiuvvzaeQwOTQb9A8sdcl8cJqRp4Zx7S
rVv8sh0mumdVB34aCXNIaLuO4oD34xICYAVVPfeBHkD2eSgSuqyPAEEJZXxmNRK/djKjls3MR06a
uW+2ga9KtpdnMyP8P2dP09w4ruNfyenVe4epsWTLlg9zoCXaZkdfEWlb7osq08l7k9qepCvJ7M7+
+yVIySIlwO7aQ8/EBEjxAwQBEAA3tUhR2chaBoGBSC9pRleENnbMWNHGszDAfS1SnhQcP+yyLMEj
kJhiGb52TRjhTbEKD3Kv9iX1+aWWYSoiYEtwzmFMER6pBvNBZ6tJEyyuPi3AbK2Ffq0RurLiRi8f
A5H5iDZWVrw4ypNQCc7UjhKykNHbQWvD9/RpkVfEEWnTw+Cf3EtaDrI9TTk+GMDI5lp/ksDtKayH
WtEfKJJxvqteULdpdgCnqgWecNHBSTImpcB4rzliG9B8zq2fy2Pz4MkxkPbii5+00BVe7z6fPz5H
VjTTu3u14zjZmX1Wl/r0LDWfK/HQlUnzI4ArNDuLxvKapdS8ENtgQ/hwbvUE1RQ32rb3CaYlnkSt
FXbp567Y7mCbBZM5vABen5+fPu4+3+5+f9bjBGPBExgK7vQ5YxAGc0BfAmoNKCKQyaCxOQYcx/aT
0KU4393eC9TbBlZl7cjb9rdRkf3MLB2Ado9NmMDlm4RX+5ZKjVlsiVydUh9cGX5wG0F1i8OwE7hn
UpAGoVOBe60Poi+5zSZzaQJU9PKIaidc7ZVWjnveM74d6DZNr+ilz//98g3xGLHIwj+G4Dd1alWJ
c3sw/tG5lXhD0MXGdIL7+ACUySr3mjEll3DDUVsGdt2T1EcDe8hPIeNpozxErXTjMoDxgZKYVAoQ
4/00npUr9Gs8uxWaNgZAYLeCHY7kwgKwKHF+DzDNsmkYwxm1+WR3kTrwuc5zHNyfxkwFyr69vX6+
v32HVHeD86k/lw2kp8F5hANvk4qe8gbsNyQUrPxMCWLrmm8wECtxgQtagOy+rdofihS0JiJWb4LI
E5ZPJiV9/nj5z+sJ/HhgfpI3/Yf868ePt/dP1xfoGpo12L79rqfz5TuAn8lmrmDZdXh8eoaYTAMe
1gryhU7auo17cXbEF/5CFPz16cfby+vn2K+RF6lxOEDPYa/ipamP/3n5/PbHbTKDLMNWWFIczxF1
vbVhEySsTgd7YpXkiWCugGlLzEVWmwiM2UEL1tDbDeOXb4/vT3e/v788/cfP6nKGUHKc2NLlKlzj
wnQczta4pK9B8yUu0qtEYHlou9H0WZ2H05tVYiTeDD5hL9+6E+auHF8iHOzV6Z5nlets4BVDdOPe
y7F9VHm1la5NxJZowc0mmR2MXYoVKctGGW37wdT2Mxc/RZNu/bexP+X3N03p70Oftyezmm5/L0XG
JpxCjlDngqdRNRv8D4eBDLWM48p4ElCwPvtt2hUMr795dA2/42Fc5EFwZICcj97dUC9FmutJF0po
l5AwKa3FkVDCOwR+rAkLiEUAi0LXjFbSwH0DW628fSilY4NwO2xaYOYKr2vHkCjSjK3fI43z8F+S
bEF6q4MqifTlAD4eMsgqtdHHkRLuBbZWCbuLm35z8J13Z2V/tyJMJmUyEznU/XNc7npnXMryaeEp
mNTNc1FOP14/TBtMks2ktpg71yXgr2d8XgyJb8fpJTSV8yKxdyIc5aoEP7g4uz8ZgdRjeuCBDE70
cKtW1m2Gn7YbFbSUFcLAGlzC2QupF1D/aDNCo3rQu0oLzgKLyMj3orXL5XmB96NwNIxSi/yE89Ou
cP1B4Ver97twHb9MYQ5ZiC3gTx9b1Fu8ymHTTAC5/zCD/jm16NmD6PH98wXW5+7H4/uHpx9AJVav
wMtMSfe0A8AmyZfzprFAbNI0Th+MbBtw+2Y91+pWK4o7rthuGKsDVHXjlwNRVjLD2tPEapy7r4Cs
Cyhcfho/h99+CcgGjCev8RRyY+qnaOCABVGLLiueTqiZ54P+U0tmkADaJqBU74+vH9bv/y57/N/J
zJdlJcdLCF8VcOust6Y18EzWs2b5r3WZ/7r9/vihhZo/Xn5MA8DM2mzFuPUvPOUJxVEBQTPG8VMP
XVNgWjN3B55jVQ8sys7b2fscQDb6OD7DXeaJESbpDjH7WcQdL3Ou0Kz1gALMbsOK+/YkUrVvA7+z
I2h4FbqYDlQESFk4Hjh1V3ipAcFEWp6gdhVMd57ap1dG5VoSYv6egdKD1oNGZMzy8YYexVV4MLaR
nJDQr9CbVVkef/xwohCNXclgPX6DXAMjoizB2NLATMNtwZhn7M+Qu2Lc8a6480IkJq1H2lWQSQhc
J0aLIpMonCUpvTIFVwaHRFAyiohsFPYDEJ8EkfDbjBFWX9PTBLMkWMhY7RhKW1aUxVlLxoRDmkq7
GLVjrbcjLseZ1jIGucDRpb61lDYH/vP3f/8CutTjy+vz051uszsoMR3NfDFPoggLxwJgyhQz0+UT
9aW4PdVCGQ9osT2Pl3TAGu04d08n+yqc34fR0qc1KVUYjTaNzGxQkkdWozgl06ZKa8wI8PLxX7+U
r78kMGUTm5zf8zLZzdE1uD291jyuFSJ/a0GJDbnxZlIfJQAZE1VX3E2snWWSZnrkTm6+iSdZLg+o
L42Lpddswjg7UNjAMbSb0KnH4E5myMRHtKTdXsbdm/ZhzszsZZVmEHf/sP8Pta6e3/1pPWvQo9Sg
+XTxYN4XGxTo7hO3G550spxyKlts/CMX5hpWCzX4tgdUkH1bSZi3AcHyBWmTSvwMVpdGlZjaw0b4
c6EL2lPmpEBzndZ6hA3fdI+ohTN/uAAFBz88a1GPscsOfCN82jYZUUfOdftNnujTc0lcOpZb5Bvj
/C828GKc16UrwnRa15HIeBEZfTjXOryWfgeT0Pvb59u3t+8eNxCS6Rq4NaioxhHBA6SLmbfM4Jhz
zE7oldvD+uXjm6Od9eNPozBq2rQqnTR1TqHRcVEAKLSDWnnI87NRSd3supscoqKIe2VWKEIqseSY
C0grhBOtEtvcMDy8fiLX81AuZni6UHBN1dQuMeuYVn6zUkISSkjAIEaPiuy1Mp1huXGMhpmUooCL
noEeTDHQd125k1ilch3PQuZfCQmZhevZbI4PyQBDLLOVlt5kCe9aaRQtpHi2sw602Qer1bW6pkvr
mRtdkSfLeRQ6KyyDZRz6dtG9Xkb0MkNzEaUnr9Uqxxy5zJAUd3dtxkanRdrubg9kuuWJ151jxQrU
5JmE4/1sSzTV6o6wug0DP52YdQXnJhx5sJv3JGLKNRWFi2F2hsLIMRvawi755Bg3Z80yXk3R1/Ok
WboDu5Q3zQL3neowtObSxut9xYmUyB0a58FsNmKRvUe5P2ZnwjarYDbZcV0U9N+PH3fi9ePz/a8/
zRMMXTKKT1CCoZ2771qeuXvS/OflB/zp8kAFeg3al/9Hu1PKz4ScAwvDOL+5IQKtqso8rmW5D5Fc
6ALV/24gqAbHOFpT9TFHbtjE6+fz97tck/E/7t6fv5t3Yd2bm76JshrnVhheD7zSxIXUkn3piYXg
KMeyBCI2CTnBoNSQ14/C2DOtQGtlBVNx4Mkn7gpk3mnkXUSL9BKPLsFXpROBJ/sQgG2fhaWXoJEK
Qwe3B4m9zga+SnfBfL24++f25f35pP/9a/q5rag5eGC409aXteWemJMLBuVENSCU8oyv57XuOevD
Ek16JeQsNJZxTHbQnbDp8UfvWHXRK4O5tSxSyqHPnPQoBIaxO7Aad+riDyZ/wRUXcMUpmZ8lRyoz
uKhI0LGhIKDMEF4DG701D4SlYEfZdlgix3eQw7j0X7IkrqrVAe+gLm+PZmXMe7BE7SNXhE+b8awh
aa7IciqzWT12Nuy128/3l9//AlYi7Y0qc2IIPe2/v+7+ySqO1wvERiqfMI9aGNA8aZ74mU55hktJ
8yQK8MvQzpCiEVa4cjAgxPgl7FELDBw/V9W52pdoQlRnDCxllfJTjHZFJoko8IEbDey4v0u5Cubo
oxRupYwloN/7zwhLuC+RBIcYqio+Tg/JRwKWc91oDlMlbw0iZ1/duCoP5N1q6J9xEAQtRePZFX8e
3eocvy/vlrnIE4o3FIK4T4cMQs1uQ7uL0T4rF2h7xO6g3EnQXLJQwvPaYg/jR0WRenWCTypsq9LT
M5jKKK/hjFKYsgAfGEAogrhFmYe6rP1xmpK22MQxmsLXqWxfFfaZwmaB7+xNksPU46xwUzT4ZCQU
pSuxKwuc/UBjOIew6WPHJgS3Iqbp+ANORplENwXmy+fUgQqj7I36pCJcJOGs0WvGU6YpdRSDgDV9
FO5bEi5ozzPpu3V2Ra3CyesCxmf1AsaXdwAfMfuO2zNR177BKJHx+m/cqs8r0LfG3AdrVCZ+gmtc
B3WrmHhTj/STBnzLcOJICzRUz2kw9Y8VG0WVCcyk5tbqvEuHD2Uh8QLeoUiJRzed9nh+yLiXjW3D
w5t951/95+Ad0JbV+oT0LP9bpUmTSgu+VbspFGm25hxiv72NsSXkt63M2m1OHBUArB7anPIK3wlW
6EGQdYErJZPqSI8PX4SSXlay7hzb5scvQXyD09ocaegUX3wnPCuXaKJ9GrZjNuAgaM1ry2lwNVuQ
5/a+kBAKg7txA5Dk1Ro4vz7S/YGd3CzCDkjEYdQ0OKh7BGTYwjgN8S6BvIc3I6wAO5zP6vIjEaHX
UFVIoUMsyK/jK/Mlv7GHc1Yfuf9+V35cLhBO6MBJ+s9BhcG9HfNjVRESWsOCZUx+Tt7v8DHL+/MN
2SrXI2NF6bGoPGs0qRKPTmVNRBuZNVSeroK3pxv9EUntE969jOMFPi0AivDz04L0F/GQwHv5Vbc6
Mdvg/Sk7buwcZ0kYf1kSh2SRNOFCQ3Gwnu2Vpp2f+KrkOb5t83Ptu7Lo38GMIIEtZ1lx43MFU93H
hvPSFuFykYznMWp2d9vkWvkZPSsiQ2JTHBsiq4LbXF0WZY6z7MLvu3GVh0QcWj3MwRV2zD6nLcTz
9Qw5S1hDMV7WxPFqjZueCw5PV1Cge9JY2Lshk8GNh0wR/vunNJ79feMkKI4i9bUok1soJbXJKvmJ
mSvvhT9x+5bizZAf/4YcaLMw6M/uRDG6Z9Jqst6IaMNnDp69W/TRMLdxXkjIQIbS0ENW7vxXAR4y
ppk8rrw8ZKQypNtseNFS4Ac0Lt7tyAGMzrmnx1lvTUq4qPObq1Sn3tDq5WxxYwPXHOwXnjAcB/M1
EXsMIFXiu7uOg+X61sf0ajP/JdA9ed7V7IhdsLntQfxqja5z54zhfQqkidtqjeRuGkoXUGas3up/
nvhMuiBsE3B3T26ZL7QU6j8sIpN1OJtjnkNeLX8WhVwTrEiDgvUNIpC59OhG5sk6WF+1FhqUhAjN
4JUgVRX41joICGMBABe3Dh1ZJuAr2uAWU6nMueqNR+V6U/3E0h98bYBV1TnnDBcugLyI6KkE4oML
4lgVWGZ3txPnoqzk2X8e/pS0TXbbOKH4/qA8Rm1LbtTya4g2ZUdRwH00xYocHFIEVvCQgpYTIVeC
JHI2dDg4bGSmnPb76B9z+mdb7wVhiAToEdIkCoU50TrNnsTXws+9Y0vaU0QR9QUBf4HLadxe4buN
d5f6rLky3x1Olun1vEkEjahH9sFuzwIgJN4B3KYpFWNQVXQ2HbkJKBkICAN5knro1P5MRS1b9QCk
+/U6It4Bryr8iJIj64+5mdm/fXz+8vHy9Hx3kJv+BtFgPT8/dVHhAOnj49nT44/P5/fpVehpxKz7
wHQtmWF3CoA+3ILk9qDFYMq7pNA/rz2UpPbRRLpEG83dbEIuyDEiI9DesIeARq+GjkG1FKOIWvAx
wNevFjL33dWQRgetHANyLeiSc+rqdAi4Zn6IuQe7CEUYUAoc4IZiueWKwP96TpnEQeYqhBe+pbTb
xTU7J9N4F27yG9ydXiBFwT+n6Rz+BXkQPp6f7z7/6LEQx+UTdZ+cg4aEG6k7E11LZ+TSTEAK/KQE
HoIlBBjsOTJF3BZef/z1SXpHiKI6OEthfrYZT53ANFu23ULaQJNXwnOCARhk7xglGfHgNnXjvfXb
9yA5U7VoOsglRuY7vJHy8qqZyr8fPS/ErlIJKU75cdJYVw4JGw7NeFAXqNT8UisjzW/BLFxcxzn/
tlrGPsqX8mw/PZoDfrw2A/yoGVQ/RLsiVEYGW+GenzclBBy7Zp+uTHNH7FRzwFUUhTO3jz4sjm9W
j9fD7A4Qdb9xAk4u5Q8qmEUzpAIAVjggDJYYIO3y6NTLOELA2T30YFpur2HQEUO0x7XhmmgQoGCO
NawStlwESxwSL4IYgViiRjuT5fE8xFmDhzPH7BbOB5rVPMJWKE8k+t28qoMQU5MuGPb9EviNNlDw
kyKcQS44kEIJDJ3Y4X5Bgmfz4oZYKyQqAFnQMku3AnRh88LAdWSpyhM7MUyKdXDM2x4JK5AZ1f3B
SU53wNRCQOJBLkN8hCoPW1Uekj2eyHLAO2WL2RzbIY2y/RnxH8O68FOh51uQ0Y94g8mgmPx1mNGk
A0O3LWMceIBTCKEOFa/9EGkXzlK5iheez6oPXsWrFfL5CdL6ahPrsSPnNVRJyOs+KsZuPQzjKp43
iuxYj9Cq+c0hHjQ/Ek0i6mH1XfjmEAazYH4FGJITBCIeJPwXSRFHs+hGT5JznKicBYsZ/jEL3wUB
CVdKVqOIIwTBix1A4F4IwRS+uPmFRfcJfE46lBEpIJgpW89cX3cPdi6Y3gA4cM/ySu5HXqEuAueo
3cFD2bGMNUNcON5Ok8xnqFrtYvUXxWhfd2WZioYYh0g5r3CY1ro16REVBby3i4PkUp5Xy4DozKH4
Sqwsv1fbMAhXBDRjBTlJGWGEcXBODMzLp3iGvhI3xbxCX/q0DoL4Zjv66I7g4hgdTp7LIFiQX+DZ
Fh6dEBWmInqY5gexRnmzPMCT7MRCiYI3giDw/H4VEBtjrxItF1Bd1yCTyuUW8cMjyypqZkv8IzWT
1YbX9Rnenj6R8yR2aF4GF8f8XUOgF9WK+fskCI9cFxFitOfzqIE5vfHZQ7LRbJZY/ctpgJNqqmJ4
Fu9nTr2Tli1RX1Afab1qiI0MsFmEn+8Ac1+Ym8DmnunUHb3cmNDtUo5iTLFFbGSb1fpMJigxCear
mDgdzd9C6x5zcnG1DAwsFlMZRnjhbNZcOXksBrlnLfjWCWyxCB7XAVvhZn3x6CZhBLOu81ZJgh+L
DJ4UImDyGqeTKgjnmHeFj5Rv/VQiHvRQLG6dhPJQb1nC57RcIJt4GS2IWavkMpqtCPr+ytUyDEny
+Gquh2/0ry73eSeIEXSoFYTI3WGdCC/8myVbqgXVYIHfAHUItfhaFpCKs9ICPpWJ3WAaKVQThekL
KehvtMgXeeaDzogxb2Z6XEqh13SdKSiR1X09rVvloPS1R7ExyX2udLJXENvqVFPZ/q3pqFmtlut5
N25EI2JNvA6jtiyuNmP5BXzNDm2yKrnW813rRjeXFYP886NSY0zYaBmJ1ygo5UmZEjAzN9NhJLCL
h+6RAzkJSEOvNQBVICY6pjItIQDsKn0Ik5VLcSKLXG+aknrwHeY1xEZ9ITLVdWbDE69zdrWNMzem
5ysYSR7MsKt0C4VQo8ykk6LIhDVVqBl5xbFXjzrN1yrjHo2MdecOxSziNR37lIGfwRTPwzpYs+x0
FyXbaLaca2rNsYvRC1IcrRZjGqtO+UCZ43Y17HqPDIXWpWL1Gdy5OiIeNWP1oxsbziB1uxJvYjmf
NjFCs3JMe5UR+VliembaZPOr3FSz5nC5piciydncE9O94vHp2LWZcs0uIHmI/mvD0LdG7OjrY7jU
xNixcmR6AGEZYbwewVs5DXlg45lrtp9dBH/LmCceq2vUrgWPVc/NkT7Uubjo5I5HjlgQIbYGZA9z
H13mmFOLAW1nzpuEfYkV3YYBmfIw7cJ8x/hBMCkJxyVzzwWuK8O0LAuKFuMGoqiPUt0/vj+Z/Izi
1/IObmG8J7ZqV4hDsk2MMMzPVsSzRTgu1P/t4ti94kTFYbIKvHPdQqpEVBIT2yw4ExsNHjdXs9Mw
z7aoC+6yyONvyBDeySA/okdsKo6aLMHhjlWymgwS5ESshjXn+104UBL9juXcn6u+pC1kFMVIebZw
W74U8/wQzO5xx9sL0jaPx7kmujBIjDaGQG3kAs9eRP7x+P74De7eJ/k6lPICIo7UK07ruK3U2THY
2iwEZKF9+/K3MLpkb8nM6ymQQrN7jrFLAfX+8vh9mivHmq+QN9Y7QBya1BTTQi06VTU32fimSeZc
PJtpxSO/HhQso2jG2qOWmBl1c+Dib+GaHhMLXKTExu0Snc4Z0Us3c7oL4A2rqf4Twr2LkhsVGOOa
Ltb/cfZlzXEjSZrv+yv4NFNtuzWF+xizfkACyEyIuIRAZoJ6gbElVhWtSVFLUt3S/voNj8ARhwfI
mgeJpH+OuA+PCD/qbjwxJ4kehnYQa7fKFxY0o3zo8zpDFTelBrjQ5cNUnwxXZpLK0jtRZNB/E9jo
UG6PBeonX2QrW2IYNVWR4QBzRzqP6vrp669Apemz4c00YxC/C1MC7Ly1VfaUFig06vdxnq03sYmF
nnRcowqhyLKZUVFtwjAaSpMLsLmsRyoaYMf3ub5S+EuBKMwiNc0PBs9AE1yCHSweEmcuVJrWg0H/
aeawg4KEBr3miYlOiV3eZYnByH7imlyibrFM2+SHPgEvCLhWu8z6FluxH4LBYHsxsYAO+lvJwM1a
8iYT3VvfTInu5ltwZ7DpmWCweSvbt/JgXEW9L/PhLVbmMXqzRLBsfrJd3KJ7TqU1uKxYcqkM1uRz
Jud8d3qz7ZrL5pJBRyAqQSgbrjLHqrTvSiYbITOspnOPeU831K8eD4Y5WDefGpNFzAkUMHtDWDxw
Gz0S5WAvlwrUcCTn2gKd1YYmrvproiTQlat7/MJg8neRbnjaKNqqoDJ3nZWGkJAUvk7JuKtkFw2k
hXCngDAWCiNf121awblJZBOEfp7GrkcwStlN+qFcd3CfpErg1imSPJJt1pfXotSftC0YcxqW1aa+
abGQHqBPd/UZkTjXT2/qlKnvoAdTCH4AAbg86fS8UsVHZpJ2jicpUBTtrD2Kjn5j8dYUqospAszk
ldWgKNSmUegGP+bJM3cllXnV6UT7p8rxuL3naynMcX2WvIhSXB3JxxbVxKAj85Ae8/SaRdSTn4RS
+q/Fsu/zMmXergXuoSjLG5NrKP1csZxp2Rij8/cEAYxaydZYwsBBNo9VoA0luAPQ9RBFF/nguBAo
VNDv8oMUYBmoTA8GnGvKZO77V6EdKaukKUiJ1WmYVfGq7w+v998e7n7QukK5mF9WRKCDz5Jux0+X
NNGyzGuDdeGUgzacEAY8nuuMl33queKD5wy0aRL7ni1NDwn6sZFqW9SwemIf07be+LAqh7QtJW+p
m60npz/FtIBjoiEPUgmhUSC15OGPp+f71z8fX6RhQoWiQyPF0J6JbbrHiFwveD5MywkvmS0HcPDq
vw6Aae27ooWj9D+fXl7fiDjDsy1s3yBLLHhgcOA448MGXmWhb4iOymHwiLOFUykOu+9hHcWt+qV3
KEoutJsLESSGoIkcrAwxmCnYFsWAm04BWrPXNsNbBODMepNOJDxKMRtVBfH92NwXFA9cXHKe4Dgw
XBdT+FwY7vo51nZ6nBxY20wDh6QV4uoPlsufL693j1f/gIgTk+PtXx7pYHz4eXX3+I+7L2CW8dvE
9Ss9o4JH7r9pw5LJF4ZuT/rYllcaoIykZPHhBjp3CzAbTrSFIxmGjUagxyEncrFX7gldNIPUz8br
BnVcw+AurUi/U8doShcQ0y4O+GSFpX6W5aQ41MzXIubW2MiLHnQZU3Gg4lXZdHKD5nt6PlAzzw+O
ZZ4eeZWjnqAAY9LHo0oZeczoov4wB6OX5vbhSM/L6tsNTNLKtPSDXnDZqs8aADStctAVwA+fvDCy
1E+u84ruIOZNMSf4gw5gfeDLSsOcGgaoWjMDz4E3IN8MhidQWFC4gG7EG029WYZx/9QMupRyX9B9
aRlu6qBoKzq+DQGNAUadFzBkSOQhwR0Oi3eNQO0K2aqbrT1u6ng2pjnI0ONY0U1XvObky2PV56mc
JcSoUSitbMfAaKieMQPoLNl7Sj6MGKpdSfoTbkPIwFMdFGPrXJTK01PKxxM9PSlzg93zjbtWDo8F
CHa3iDKMmGMpthXMcQjlLC9Vr+alh0QUwVJZUYayjUVnNaxvU3Z/zO2cflAZ/uvtA+whv3ER5nYy
1jPsQH3SkJEeY7RdqHn9kwt5UzrCViRLZ/SMdt2rS58oOypzoDCEu54OZZojMkGOQ2U2edicdspQ
hP1MGQ98i2MejdUCciftZgfiCwtImm+wGP3wCsehpVyucBpKIaI1pUzRftYKZReUzCOIrQ3ZIpFG
BWz6/KdEY4dV/pBDxZXq9gXGTLpKvprVEnzFbyvllJIudr1BofVHWYWfM1ZJloxuiE5o/hkVSE4k
6XqprswYGH5yBxkyNskfKDE5DRo9cAecOB4J0q4gp3zE9cYZXPS7hPlVEIiruz2ROD0EyHmv0oZC
v0wPS3InXzaDN1AY4sMZijoZUClJ8ptYk43EzEGX08zcCHPsifGMZFAP7Qg3uObPZTGHRaGo4Oe+
kFuQyinqkCrbKPLssevNcS+g+GrZJQYmk8BvKXahJ3HsU7mck8giTywmsKgFhXhvNaqZzNqICiVj
K8UFZLVjDx8Qn0CmN3QVL+obtaVBNnE808sEZeiLraEMn4+2ZV2rZW863OkoixJSpK6jfsCII/lo
yonKMI46CTmNPZpKdPBpwqyWZaqiSgI0Kt4EW7UnqR3Ro6BluMAHjiMEeEaDg3BY7gbKfpT0Uxmx
2BdnZTIz6UgtbcvsME1NxMQhJZUeRoKnEEFJQikWSEVadrNIZBriQ6EMMiYtKRYJC92x6HxX41th
TKpnSQY2bVoW+z28WJm+H4ZYLs7AnAMpZdkIL83gEpPVGdKDUyT6Y98etFX2E20rbaJoHFU7HjZm
E/gwfhT2V+EeTfdfDx3AzJkX/jlKzLQxy5fwbPgUijGyvC42TQuBZU2RM1gbl3ngDJY2UsoEDdnK
NpibOqnkgVIV8l90BlVMwRcuU8W0j8Tg/qvVrffbvr36/PD0+Z/YRS0FR9uPopHdeGvfTpb/kzsN
MDOv8/7SdNfM8wrcqZM+qSDunOgC4PbLFxbNkUrSLOOX/zJnqY7b9YlCK/bywjBdyf4UCJVowA4M
9DdBG2mKTqsBXNTEEmRPZtx3tkKs0tZxiRXJZngaKi1mKqojZLB9S9rvZ2SX3PRdUuCvnDNTegRr
nnOR4yoiM1t5QyUIPXK4mmPXDCbr5SXDpK6bukyuDQ5YZrY8Szp6ZscfGGcuKuHRM99bWeZUHuvJ
7tThyh0z2yGvirp4s2RFmr/J8wHuALs32cr8UrxdLrqVdAXJ327+vjjomSo8cHOBjBXY+H3sPCwy
hJLkNyMfs71jclW3VCGrIg+7nVwYjmO7T/U5w+nKm6AA7k+1CYXv2L0eWl8KdlESuonBoZjCF6Iu
63QuBy8HB92tkoQepu2qc/nbiaBhpXS2xN5OZodd9ulsqbWdTP6uZMJoM5UQszrQuGJro+nj7erG
2N2vzuVu5eBt5+C/q19i397KI9isY/BGJYOtCbiyhZuZRNs9HqNe/RA2H8+EHEPHMrQzYIG3gcWm
olHUTfDHJ4UtNMSc1dgMzpJVNvxxUWN7a+oDk2uueuiHZiwyrhgMDd7MenBnmbi6+3J/29/98+rb
/dfPr8+I2nEOgeLoMVt6vTZ9pQk5oMaQ6DVJiReWNjJiGOCagFhYjGGL4AqyMoFFA2zBtRkPiOnb
jsgxTqEdlY+K7qPql5kLhEZdBJYYuSF7TGOHgZOoKWfGPdBYw9oBLIDp4+23b3dfrlhuyAUzL3mV
tdihg4PsZlDOSrgak1PKLkmLu8RjMChSv1Gp9QFGTbtAD58calq1MXZRQESDUk7N60+SewJObbn3
GyWFQWvgQfJpya0aBvyqnNtmpYYIAty2cIh8/BGcwTzoDNloTePDBEM/qRUCHYM9czQgTDfjGOHH
Onok+nVCwQpCGUVi6rbljeAw0YtypXkBKQASXTaJCP1G6+x9aJt0zPloYR2CaVbxAdFHoZYmMQ8g
CrnSVS+j8sjhWjqXooYoa+bCXYgdpF4kM8xHzq0mXZQLGPXuxzd6GtabevIXpo5iNv0tbYQyumMc
Jkw7yVVrPlFZVFhtyAOGyo4TDKaO6uDr2yJ1IttSycSLpxYWnl6U2vPlbJ+9o1UcS6nIZIitVYKb
RZrqwO0hlbLyl3KFWLZu7LnaECnbKES9509dwjYv9SNuPW2QKqZWBDv5CNczWjli21iz/mM1RIHa
C4tjKyUxbhhrSmv1j6EMf82hxbrg6L04qXMVeu9qm5RRhYqbePeR4WjJW5cexxtcJWoat5tgMa9h
m0w553LwkyLfFLLUdQzNgzTDcsG4OfiZKUmMbMh8VcCOVhxOXTeK1FnZFqQhnTKThg6cTrmi4h5S
LHnyHQ5dfkikp2eebZNen0S/pvYstdi//vt+ej1GLlIv9vQ0yvz5NXhvr0wZcbwIl76FlAbsFUlM
xL5Ua/lXQL5KWOnkUIiNhNRIrCl5uP2XaCR4mRW8IPpbJaXP6UTSWl7IUFdLEt9lCHMvKXHInmDk
jzHBX+JwjB9HqD8V6WPXMtTHtaV2FwBzWV13TDtDjwpcEZ6lL8bRFgGuOYUCNv5FlFse/kmU26G4
5ckjQTh/gTH4mJzRUPIM63Iiht0UiEwf75rvfAaUa+shYJPmZdMviSvl4TxMSZRTmj32/iYyd3CD
3xnTAucVfVOjV5FiKpO20yMGfhpMqXO7eGPa5NS25Y3aEJzKT2oG7HipRCX4Nks4rr8IJFk67pKe
rg2Sc4XZFwr7Cl+kuEcFeBc6YQ9jE86zFc0OaHtvJAsK+AcYWVRisgJsb5hKS4+0fRR7viSqzBjz
gYKmv3BcHMsQ03VmgQkUYAKGyCBOPYkuXWJJCCb/zAxkJxgwzW0BRKlvICgPI2+ktPsIQ2vAWmeC
jA7AVL5j9nGrFbiTQ6y2SWyj94VLJzNXKmuFl65V6LPLlWksCdQoGvenvBwPyemQ6wmBK72QWwpp
pZuwrd5gLI549JpLPjtW0ZFUdqI1k9mEEm8EZ2CWbzUAxHTxOkCkR9KhdEYMqsxrEdi4QXLq3UC8
sBXKbHt+iJRh9qWEfhPFMVo8Opw828flIoknxk8ZIo/jh2/yhKgeucDh09LoNQAgipEOIdXO9UJ9
urOxB9Y3TuzZ+hic3Q/rrdj1dP2SxKIlK7ovuPhxYh3u5t1jqUoWx7Ho10zZF9if47mQtG05cdJk
PCLxHurb1/t/3WGuGsBpCgEHZK4tapasdM8WLn8leoTxV7bl2NgHAEgNJ0OYSChzxIbsXNuUqo26
GhY4YkeySFyAPhxsC6tET5vJwrPrQ1y1WuZAm4YCgWMAQkM5vNBHSk7cEKsQSSeVNBUYinGf1GAt
S48/kt3HzHIdQbRiXM9kZrGtN3n2SWX7xw0hYilSlUH0te6AWxUvbFRmyglqgbuwdBWztkHaj0Vp
QbvRZD+zMPRDi/ThrrfH9tzrLTwBEHy9qwiWZUr/SwrYhDr8/n5mzEiABoJacRvt5CwvS7oQVljv
Tt68cO/XEhM6dQv/mnYY7omEc0BYiAH9Fm5kLR9VtRM4Imd/0Ku0D3039IneD7OnP+46VM+TpMdq
q3sPpW9HpNJzpIBjkUrP8UDlzQQlIzP6WBwD27WwohVFw5fxzTFQwAXyRvlBjR3mop41u8FGuuFD
iopTM0wnbGc7DrKolEWdJ4dcz4nvqsjqxIHQCKiO1VTYoGsncsXIagk2traPbhIAOYYjhcTjbLUR
4/B8PGcnMBTJCZB1hPmRxjYJAAIrQDJhiB0bgCDCgTjEWppd+5kemGUmg0GlwBQoZls4j4tpWEgc
nqOPGAb4SMsyIEbGGC91jAzkKm1dVGapyqHLD7BB6lifcuezeqXyeu/YuyrVZ7O2i6eSDvQ8NqrA
Rcdqhb6RCLCLDLQKExMoFV0LKB271lvhCN00IZjJ9mfoBkDp+IFgZUA1OgQYGRmU6qKLSBX7jovf
o0s8HnaBIXP4WAbch8RWgYHDc0K9l+o+5dezBZHuthc87elERroXgBDrYQqEkeVgzY7YPyocTZqO
bSS7axAwncie6ETb4pbZ+WulMpBBVHewWuxy0APJdaDYVWO637dIYkVN2lM3Fi1pCbrPdq7voPak
AkdkBejkLrqW+B76/LGwkDKIqBCCj0HHtwL8xUfaxranYZ+6kY0017RH4MsS2wwM9v0Ck2O9Y2Wn
TP5WG/C1NsKL6Hqeh0pAcA0RRNFm5u2Q081ua5L1LfEsumHreVPEd4MQOUae0iy2LLRQADlGt2uc
Z8ja3H5j0/xUBmbvbVPdLhXsNRt1EyMgKNcCi7x97LGhQcnY0YCS3R/YIkGBdHusIE4X1GNDlVMx
Ad1ociqne9bWpkE5HNtCljwKBHAPjHUWRMv1wmpraM4s2NbBsZ2LiQ+k70noI0ICPVhRSQRb1FLb
ibLIRgQwFiTJibAqMCjcbvqENkG0vYTViWPFWMsDYnRdt7C4zhuiW5+GmN7gAh+r1EdErb5qbcvB
6s2QrQHBGNAmo8j2kgwMDjpgKOLbW7lCkNy0PU1HKu17CgdRgLmwWDh627HRvM995KBRrWeGS+SG
oXvA8gUosk2e6lae+D08ztaBmHGg8ihDtuY/ZSjpJtCjtx4cDGrUYnnlCZzwuDd8T7H8uHV/wJ+z
Zk0Ak1OWZVaBQ6p33E/115aN7kBMgkukcK8TCaJ6Gj3czzykT/qCGDx+z0x5lXeHvAY/vdNTKVzv
JDdjRf5u6WmajiAzfukKFhBu7DsqMK0L1YxnOXc1cmjOtHx5CwEIcqyCIuMebrPIMTEY1GOfgPNm
uCrCw25MH8hp64V9s5DAALba7L/Nsr1Zpiw/77v8o9DnWkdBSALu1kxLXrXRXhiu3ZkHyXM2hF0y
XV2gp0mnU8HieC3fFJX09e4BzN2eHzHHzSyYMR9ZaZlUkm99KpuN7TW8BVctVsiFkSdCmnTMeoJx
rrORsrqeNSAFElMDFjzHSd9hMy21YOAkdSsxvIlYkXbPT7dfPj89mhtwUoPAlgJwI1Cj7SGxkG6z
dMYisAL2dz9uX2gNXl6fvz/efX19MZe0L1gXYWtWsVlIMBJHR6nE4W2MY8B9LOesS0Lf2az/2zXk
+m23jy/fv/6BDqxZ18zAsjQQXSMafX6LOhjrjGMJf/x++0C7BhseS65GnrUVPg1OHISbLcxMx7cY
ro9JBsHi0hN73tlivSR9eswadB8mO7oYEFLsJNfnRPC3AiyEeVX5KX2VFhDpHP96RlUiePdUv1qr
LLEYCsu+psNaTjnrijN7/i+YF2pT6jIb3u4rm+Hdnk7hBKk1kOW/eFlBDRTnXnBlDUmWSppyX+uh
pDgBlbTT8wIzS36FWGPEufZVko5pVWuFe0frzDpQq2/O379//Qym13P8A22xqvbZ7FZ81agBGj2C
ogoDAPLoEYcWnoKU7+CZ1EbNA5nZ+qT4/VNMLUl6Jwotxbs5Q0SXNVI2tLp+bBlOW4whi/3Qri5Y
THGWtKJTs9LkyzmgqwZMK022+RbokrU3b0/F2Gkhur7e9pQc4U8nC47e366obB4LbQ9Pjaie+4LK
akuQ1vSGib8OCQxak+nvmjM1wJ57FtCVW42rTKnJ5MNN3ZCxbBOCCfSsG1LbleyEBOIo+YIRAb3n
WydwYoW2BFBUilUNDt17Cf7ge+zTkZa3SIV7F6DRLLmlgpQUl6c+npLuenFNiA4HiO9SGLThATN6
Fl0kSdb76bGHTRd3IrEWCOI/sMPce/hwB4+MSYvvDdQPSf2JLnxNhq5vwLFYdUjfRVFbRYb7vxU3
zyaGBxY2M/iEVrW+Jiqz/9DGAKOjWn4rHAVYYvJVwEKPPOwSZYKj2ArVdYlpqiJJRXGMqeysaKR9
1AeuISzCDJuTnN/q1qrmnwYeVkxeA9VIY0Ds8h4L0AaQrmq4RHWTgpouVNkD1mQIowQeZQlXk2Wh
XBLMBETEe99ycXNgBqd+70dmnOSp5h9PhAsvDAZkZySVb9kISbF0YPTrm4iOYG1tn4KQwfxHck92
g2+pe3KygzgpOLHpW7k9JweS9NimlOeGpOL1OtCkUL98aRXQyXBLoTG1TzWVsjqpY6lNyirBnY6C
BZZtGXQwuQEXfh2lxUBl2U8WX2oBON24X/fFZIKmdhD7LjK4T14YYrSEAuwojTRR9c1uQTThhSJ0
hXWFATfHa9RH5owkp0yKqzsFbtQ/uJS2E7rIhCwr13e1RRGPIyMyzGZz0meaBa8o9y2GhzpRb6YZ
0KQIJng5nprzpfJtg1+0GTZ24aWCVVtprwpbqynVQ9WXJpDf1mq0qXpqUoCYfHTNLL5l1Jhfionr
BLBVoL94ERpKm6OV69BpMUdp0CAGEG1J66u9KclLmjFXmlJi62F+bZw5fuNyKhK99ZvOU8vHc7xU
Ib0lhKpiorIC+2LI6RBtyp5rfS2VWlkg9sqJRXuqyalCXc2tzHC/yq5XF3ZxTVr5qOhzUBYYjQfs
SiLxFU6AMt+VddsFrKY/cL1VgYmf/LbzZ9sL3ijzVCyzBjty6ox0rwOTILQyyoFwRRQTBqE/+ZnJ
hPjoGEhiR9R/VhAbS22f1PQs7vt4SzM0irZbURYLVnpBytiVbRElMHBCGw1RujDRVToQbdIFhG7b
oY0XmmHYSVBkiULHkHAU4q27SAVYln3q+hEeUFnmCkJcj2Tlmg8F72DzUVcsEg8/SSAVZWobXozV
lEGB8SvpXKBADjqZGYSPZuR4oJbfYOeussXYWUZhiuRXbBVFrRkEpukoL4sTMh5GrgmKYrwF2ijy
Y0MDUOyNNRROSrZhJgAW4YeslandFQYRVuBJk9hDT54SD7qSCYcqLOX96VNuo9KFwHSma1BgWKgZ
+MYSxXhidGlsLxWeLvPP37UV5ixE4SJVBpxY7TkuedtUwBPZjWeuYIeUYsM8SWCajmGbJSXlgQqL
pu2Oiz67pgHb9e10GOe5y/e7034rsfaCP8mLfExQG88VahEiMNL6WUGCNTCFIsdDN1cGhTX2FSiV
2YGLTkg4qzhuYOEdwk9czvZisxzikFIJRzkcs13H+J2hpstxzFRkdsR6ozem09VmxSZp3zTQy2RX
7KTgL53xDiKdricEYz1KqZu+2Be5FGe3yiGUEKAgYDUd9o7EeSZcEMRFMpWFyx5Lmpx2WXdmEbBI
XuaplMHqxmwWzF9/fhNdNUzFSyp2OT+VQMuDCq1lQ8+q5zcrATFqeohqehZSkzi6JGNxtlGQZJ0J
mn1qmXBmMC7WQHTHJtd+/vBcZHkzSnHcpvZomG1aKVrBZufd3OWsVc/3X+6evPL+6/cfV0/f4Owj
NCtP+eyVwiRdafLZWaBDX+a0L8UTNIeT7Lwck5bO4RA/JFVFTQdyl9SHHLv7Z8kfnUCwt2SkKq8c
+k9uBIawp7ixpEmn9Deiope6yfK/Cx4gsPYQhp8Q3mxtLXWWLM0OrW0cYwJbl388Qb/zFuNueB7u
bl/u4EvW4X/evjJfy3fMQ/MXvTTd3f/9fvfyepXwY70Yk0p8RTfWgjFl93/cv94+XPVnrHYwdCo8
hg9Atej/gvEmA+3wpO3hKG8HckKTO2ze4VhXM6YcQusRuhoUTT2WDSH0v4Ocy6nMhSE1VROpiLiG
LK+kvNZTzLDf7x9e755p496+0II83H1+hd9fr/5zz4CrR/Hj/9T7HZ6kzQsLXzCW9pAiQ7KlpPBC
QwTqlQHVuFzhQHp14XTaCwX7zfhlnyd+KOu+T0kmSRhaASp9TV/u6dFA3MEZmV/5SVNtQgoyP3QL
D+kLpKYDsUB6vVgdxMfFQuOKsKN/l3zqc8N7GWc45JUS0F5ty6Jr2rRCbUmnJtvbwb4qkLZkQIdf
FM6t2XUJLaK5uSF2qNpI/U17bJpaz/FTU/ZdgZ1c2IJLJUdH2fxXOrLkMzpdYxvRdGRFsoqvaMUB
Ta9KylIOZAeDYtkMpzGBNg4wLuv7Bh8sBu9KEHbnd+fM9mOEiU3//f3z3QUcBv1S5Hl+Zbux97er
hMeQErZRKNm+6PKsF3YngTgWdXvCdntRMYuTbr9+vn94uH3+iah6cBmn75P0OO8iyfcv909Uavj8
BC7B/s/Vt+enz3cvL090tQPv/o/3P6Qk+E7cn/nlvrLl91kSenLAkgWII9Q33YLbcSw+p0z0PAk8
209RumPpGVWkdfFbcI6nxHVlRfeZ7rse/kK8MpSug92ETUUqz65jJUXquDu1uCdaPdfTJCQqpnP7
MiUvoKOWm5MA1TohqdpB/xBCT4+7fj9SFFfmfFdns3HRZWRhVLufrvqBP7lcmVKW2Fex0ZgEFfPA
RF2vAwewTWzFA9FZl0SG8wciUYaRh4zKCYBvjNnt+siO9U8p2ceuoRY0CNQSXhNL8mY7DdgyCmjJ
Aw2AndW2LZysTxS42Qxl35YyslnL/tz6tqenCmQf6SQKhJbhSWviuDiRhVmxzHAMzn/U/ICqNRxQ
baQQ53ZwHXmjFQYejOdbabgjozi09TUnHRw/8iQ3p8pQFnK5+7qRtt7bjCya7gljPtT6mpNRbtfT
Go+RY5Tsi68KEhmfL7EbxdoillxHETLwjiRyLKS1lpYRWuv+kS44/7oD3eIriLCrNdupzQLPcu1E
720OqYoUUpZ68usO9xtn+fxEeeiKBw94aAlgaQt950jEGm2nwJWis+7q9ftXegZQkgVRAqw67Wml
nzWkFX6+gd+/fL6je/fXuycIln338E1Pb2n20LWQ6V75TmhwF8UZTC+2U/V7UGEtMnVuz0KHuYD8
sHP7ePd8S7/5SveU6SpCX/rbvqjhmqNUB9Ox8H1t+hcVbTxtvWfUGKP6EUYNPb2tgI4qZSywi2bh
+tqcbM5O4CFrFNB981YOMLYJMjqmrLDAIZ6bH3j4k9TMECiqaUgK6HOsACMSC9BRc7UZDh1fW4Io
VXreW6iBpy2FQNUXSEgB440ifRg15xhNNw58hGq7kT6OziQIHG0kVn1cWZZWO0Z2NZkPyLa+HFNy
a7k2Mp/7uLdQA8wVt21EuKHA2TJ4YBY4XOw5YsWRopLOcq02dbVWq+kZ07JRqPKrplQPhWOXJXBS
1sgffK/Ws/WvgyRBqcgySOlenh7wy5KFxd8l+y2Oqkha7C6Lw3kf5dfIWYL4aehW+EaFL5Bs7Swp
TT+yzVuyH+kNlVyHri4eZJc41NdLoAbaiKbUyArHc1qJe5NUEn6Kfbh9+dO4nmetHfhIJ4D6Fuqz
Y4EDLxAzlrNZnGlvbYQHYgeBI+2s6hfC2Rgw4fC9lDcdMieKLB6Frzvje5+egnIvf6qZmg1P+PvL
69Pj/f+7gwtGttFr53DGDxHAW9FProjBsThyxPVJQSMn3gIl/UQt3dA2onEUhQaQ3QSavmSg4cuK
FJbsWUBCe8dC/aaoTPKLn4YaFG1lNifAzm4Kk+0aavmxty3bWIohdSwH97Mhs/mWSWVdYvMsXKlP
LOxQ0sR8Ymh3hobac9uEpp5HIvEoJqEguIqqX/ooEh1Viug+pb1t7G6GonYgKpOhZFPmDo7mHvc4
giZKJUTzGIqijgT0Yzwgn1SCUxLjO7M8vR3bN8yIoo9t1zBFO7rem7psKF3L7vaG0VnZmU0bzjM0
DcN3tIaeuGhiy5W4jr3cXcFD1f756esr/WR5GGEqkS+v9LB9+/zl6peX21d6PLh/vfvb1e8C61QM
uM8k/c6KYulGZSIbXbhw/GzF1g/DIxBDxbuSiRjYtvUDo9oyEaaI6C2M0aIoI67NZgZW1c8sDur/
vqIbAT0Ovj7f3z4YK511w7Wc+rwCp06WaW1RwJwzVLWqo8gLHaWsjLiUlJJ+JcbOkPJKB8dTlI91
HFWjYPn2rq0U5VNJu9EN1DpxMnYQYjX2j7bn6P1HF9JIJe4CaWovnNiYYgPgjTGFLa5TD0VW5KqJ
QsdZFqrRN3/lBMrwOufEHmI9qWkRyGzTTrBy8X4y9QPPVRnAdH2CKSUTeToBRgwRotYndGiqE6Un
dMNT+OjMUVw+seGyi4LE3mg6WlwmlCyjuL/6xTi/5L5sI1yNeAEHrXpOiLQOJSojmg1OVyHSGZ3J
lJKevCMbHy4eJtiwB/GhD7CG6l1UTWyeSa7vKsUpdtDg1Q4np2oGFAgBMD2qc7jVUlMdeQlVxJyq
AZzsY76JSx/l6VurvRtghmW8l6iw7lid2neU6tmyojsAXV86kcHt2orjd9nLcmyq3afMpnsxaCE0
2jo+HSq0+2kY2Om0gRi3DFgzInVa8aZ2bJTqYotiOM+mpCc0z/rp+fXPq4SeQe8/33797frp+e72
61W/TrHfUratZf3ZWDI6Zh3LUqZT0/m2o26rQLTVmbNL6alQ3avLQ9a7rproRPXVhp3oqGsojtMe
08Ypm8eWaQtKTpHvKEXltJG/yUppTcjZw1xwLJnZy1pWkGx7MRM/jdUOphMv0jY9tpg6FpGykHf9
//hL+fYp2DJgkoXHhFRJ/UdI8Orp68PPSWb8rS1LOVXplnfdz2iV6FqvDu8VYsdafgGQp7My0nwz
cPX70zMXcjQxy42Hmw/KKKp3R1HhfaHFGq1VW57RHLX3wSrCQyMlLaiaECcqUxSO76465El0KNXS
AlHddpN+R0VUV18hgsBXZN5icHzL1wYxO+s4W7IHrN0G01aAj013Ii4eUpN9TtKmd3BvH+z7vMzl
QEJ8W396fHz6ynwFPf9++/nu6pe89i3Hsf8maqVpN2XzkmshkmCLP2eYDjfc38/T08PL1Su8+/3r
7uHp29XXu38bBfxTVd2Me0lN0KSNwRI/PN9++/P+88vVy/dv3+iiLMozyQG9czwkY9IJQaAmAtOh
O7QnWX8OQHIp+vSYdw3uOKCohrFoT2fXpPqbdYKuPP2DvQyN2U5SXQJ61tIFcWBBNrIcc7fBmFj8
DJKXe9CXkRO+rggMhla09Jvp+90M/dSTozlXpB/7pm3K5nAzdvmeyHx7pmcqOgzTwOacd1z3iG6j
OlzmyfXYHm+IEswNOMomyUZ6uM5AT6e6JKJl69Qy0gMr0A55NTJXM0itoMImDL4jR1BxwlBCezpb
9gInnd9fr+hSqdyfSn0HviXSI5X2cPOdmYUUpR3gtpwzSz207OowjlBpV+XytUCiphJz+aWrhPvn
9WVWIMtF6pIsN/j7BzipMjppjHDdnM55YsaL2EbXfwqdaUepM+RMO9aY1rm6HPb4SwXr9yrxTWs0
VITgV1Vswh6Sg8m/LuAfB9xtFWC7Jj1ulLnoehbYF3PSAAxtUueLZ7zs/uXbw+3Pq/b2692D1H8K
Iqaw64rsoMwnluqKSImv+8Xu+f7LH+I7BWsnptlfDPSXIYyk3VREs1Yclua0leZwcVegDEvN8ybv
6+RcnI14WnR0ix0/0vUL5emL+gb4jkPk+iHmanTmKMoidhxJlBYh18NfCkUeD731mDmqwqLHqI89
lkOXt0mLGizNHKQPfdHYRqCHrt+p86ktTcFlWYvvmoG9DpnH5r5rSK+mWuaHJL0xfJQP3DgFTHDo
Bkawgdl0BajTM1X0j6eiuybyKIMQ811SZ8yjG39Ye759vLv6x/fff6fLXaa+r9G9L60yiAWy5kZp
zPrmRiSJuuLzTsT2JaQyNIFd0/Rwwkx0ExPIcg9qp2XZ5akOpE17QxNPNKCokkO+Kwv5E0K3TTQt
ANC0AMDTok2fF4d6zOusSCTvaKxK/XFC0HEBLPSHzrHiNL++zNfklVo0ome3PVge7POuy7NRtKtm
0kp62gkP1ZBzkl6XxeHYS9SqyfJpL5dT7ouS1Z5OggM6UP68ff7y79vnO8ynJ3QHWzVMzdBW+F0H
fFi2BLQLTTgVGY2f3uzyTj1MrHDSpUqH0d/AtsWUXkIlDtoN+N7GikJ6I0ilX/Sacc/uVeTxVnvi
tQX030HuvMNOnn30b1A2/7snt+q5w27sKNK0eQ0SNpFSJXbG/ZM9SsnUdN0q8BMVRbvibMSK0MM3
ehjZeWT5If4oCQPRHJ4ZMjULUtBP/Y1teO7kqAki+LkSkORMp78RLYwj+2xuuTpv6JpS4KpvFL++
McQHo5ibGaQzyLJpsqYxBCbcgRvywDFWtKdyTG4e4kmHG5qwOWxMNKUicYGG56XgpYp8y5eG86Xq
6dFi7PjyJqZ0yOkCZSzBkOC3opCk4q4Deu048oDAY5lmxl7oTa6b2Xgxfsb8XuFFgVgmh6H3fPH6
DOo2x6CUi5klEaqEwAYXc7+ifFDldOrUTWVsJ7imc0xp7jp6fiTHXDZhYoMclELM9Q3xt/OqHbOC
SM70Z5pgS2j4koswfdsc6fIp2JxSaBIwZi0dTGbhPpxvP//z4f6PP1+v/uOK9vNsi4rccVCUW1uC
PWaBegFfNk2Jce3FFZ/cREkhbWesvWCPHCuuenBZkdVTBpIsi5C4mTCztL6UeYYnQJJj0mEX2CuL
asUt5D45UcWhKArMUIhCuks94TPuogevBvP9Ym3Xg/HEaMe1ke+jNVxi+upFBfm5SzBo8XOHFtXk
NnfN80zbNCxb/PNdFtgW9iQltFSXDmldY0WbXEqJZ8s3JstyzQcHGVxUPGaiwwp6fm3kvyCK4Gmg
C2+NA0xMEhcLAUvLU+84ysl1Krl2eTmnTZpTna1ZkVp4I6V/jIozLyC1aaURxiJPYz+SEgLrwbw+
0J1N/4TkH7XVAeh0BrZU7iJjs9/DTZ2MfqCdI2cBFG5ox6zERRfWFG0IgWtEdFGeC84qiIwRVgHJ
nFnOGe5w6cadkb+7jpzq7BSB7ldjgodohLy7Jh33SqLnvNs1JGfgnqjVWdGi7nFBg5Ua7lkNuZ6r
hPTiReTUTyM5cKcjch+dqBwsP88unQfX54ZMkjQOaU9meap+uWnASfGCoLFjWFcVanMkmR0ZXEMx
uCSqIp6Mk+Jo8JbH4L4oBkMM3wVmB8LKzHSKIoM2yww727Ap9hjAF0OELYrt+ig0BDWCSZZYtuHy
mMFVobgBlifVcHPIDVFZa+ZQ0YkMwZI4HJjiLdWTB3NznbmDc2bIaubph7259FnSlclGox9YqCgj
XCY3m5/z5A1RFefkzTBP3ozTfQE/LzHQcJYCLE+PjYvHeGHzrs6Kg7lJObzR5pwh+/BmCuaen5Mw
c+Q1sd3Q3PYcNw+9fRWZ4v1R9JgR82wH0DzN6S5mhxu9xvxrR4O55DODOYvrpjvYjm2e8WVTmnu/
HAIv8HLzulsVQ9Lhp1qA68rxzetFmw5HQ4woinZF2xeGQynDq9ygyTOhsTlnhvrmr0lucMTLtsIi
iYyh31b8jSWenTEbYp4a58ExhUKk6E21V9ZaduQ6Zr8yA0YpLhcbhwkfLKiQt3z1v5RPqEjFXkvp
IfVT/nfH8iJpax0gBB7cdGsb/cb+CF4OLgX6Cj2JVmmRaBLM0DbpdY7GK4GPMra0p3tFWGxSjcCF
DPDu9lNF5pA0svipsc2ipo6As3wkwwwnjslQjIVDzCBps0KvErxnQlY4kH6ie0no2HE1xPBQROXN
9Kj1z8rc9X7g+YzLPB3WTN0fb3J1ed0UJsk46SseikAt0gLwKwA0lF7NQoE4tFqMkbedVob05lCf
MB9C0/eBy4I/kPFyLEhf6mJq3sbAooSGUURlUhxq9vRCU9KmIXlKJ/8LoL60f767e/l8+3B3lban
RZ1+Un1ZWSfXRMgn/y2YGE+V3JOSCqIdMr4BIQky5ACoPiLDjaV1ogfMAWtOlh4xz+eFBwarodVn
ntxcsCLdFyWO5XhFQakFDmJ0uuIg1Ok0yBjQ+ehTOmo63yqtf/9f1XD1j6fb5y+sE7SKs+TeqPhc
lKl5Z9O1rSEilZiO1GMROLaFDfjroru+NE22OVp5KUxHO4byCCFcv6bMz3mprG4UocK90s6cOC97
epYs0WNCLnmJKU/OaSR9U9Eq7gtnccSjJYezGcKObH2xXVhyTeXoa7PQIXKarwdWrqR9D9f17j1c
h9J8dF+50vo9aaX7d3FVtPveyVdiimzixjjxVhAmzdwB13le7RLTBcHKV3G3RoZUWMjJPbzQZ+UN
FXHrw1gn1YYcu366u+nTju+K1tu7ovqNb7/3mxTuGcmFfRU6/5Ov3rNry19VCZUJrNiCKBR/8dOa
3Tl4f6FF2KcphDh3hr/6GZNg3L/6VU4i1w7+6ld1w26c3v4MwoDu+vQsyyZcYw1Wc3EHSR4fnv64
/3z17eH2lf79+CLv4HQoNvWYFCd1IkzAcKCjN8vMh6OVr28UPpwrq0Cngk6+Xr2VlZmgbbp9ol6v
SkxFvQE2p96EsitjdvdprjbbTGkab9aIMRa1OaU2w16DVh4ox3jqi5Jg5eVj4lCe0IY4DHJldAbb
SWjXJOhlpsQCF/s99ma4DDvG3ceWLTmVeceQU3IdiCHaoXCWQ09M8LylU1lANojpbYKEvRzFi/Zj
ZAWDCU4AFs3XZpj0aKIT/0h2hirAwa1qah2c4wFju9ISK1gR882MyrgzM2pyo5l1Xrjfx803h23e
a9eJIvaqNOlDvsXuxvF46E583G8yk6QiJzku9Ias3d19vXu5fQH0RT/mkKNHjwCowAaxmtHbjHfk
o2VTdMg5G6ij4vxQx8bJv7XeDsByIltyEWn2osCtJ0Hx/8/YszW3jfP6V/K4O3O+OZZsXfxIUbLN
jW4RZcfpi6YndbOZbZNOkp3dfr/+EKQuJAXKfejFAAiCF4EgCQJLR+oDjTNLn05ULU82IFGe9nVT
JVdsJUUspK7qrMHC3KIl1MI7NHipX2pbrQ7QrqBpi+kENm7p2uL58e1VRux9e32Bu0sZ/f4GlN9n
fV5gGzoVKF9sU5ekkzToyU1fHL7sBt1NK4J0x20tMUzeX5deWR7fvv3z/AKxxWbT3vqaZBbXYT0y
EXGP6FXBTO5jGaxMElfvyErmPSOrIKk8UYQI9QUxrseXGjHvwjbbm94UWmxT/Yufp7jGdYwwhjO4
yZzfNSskX0IeJ6Qjc3gq5pImFnqMkJITK6nookVtMVAVlHB0sRoITnTxQALyhndC888MkxFZ0GTh
UkMjsxY7x0ioA5Sbf54//nSPClrFGsuBgAtDkmzIO3edGBa+hR76Q2w/si47GaGSfnmGzes8lqw+
MKe7AJCcWc7KM65VepxabhxmvEbnODY+t7t6T+xDpE/IAZaOdNk9AtU6LWx1OgvKIu3zC/YDLDQI
5sg82nB5rtSM6/h2PMDHFJk8OSdHzKgfcF6kR28zMWcnJlzAmEmhZ1iO3wiQI8RURY/lAed5wja7
Xz5pH+isII822e3G0yPo6nA9nI8G3wQxKtjtJgiwKK8aQaiH8NHhG7ytt8EafWiiEQQBJmVOg9BH
6kpSP1aIWWVJ23GKeYUNBFbmtxHM10Guv2w3EYgQCoF0ukIELkSIiQ1uEfkGcwE1KAJkivYIfIYq
JDosCrU0LpIiQpu+8UO0gRtfd0c04A7Ro0FyVMDIcyQq14nOZ2Ty9Ahnt6y9NS7peoNLut5sMTgE
EV+h4qtDscWVHs6/5kzVzR669OOJfQd0xiMPm5EC7mOtUkdpONxH+lTB8S7tcagm3LdFaAaKG5eP
sqxg37lau6/x5fGI3BrHmHu6QbIOIuSaSKICTEFKjB7fzkBsZbxnXJh1tL6ilBXZFpllqlYMwYt4
64WQ2HSy0hdo+pRFcyJhq3phjAw5IKIYmck9Ah9cidyiW50edaUvBip0egAyDp3cBeoXuAOVi/t6
hXV2j3C2WCKdLEX3IjNtwLiZSqyLa+D5/zq6AVDXu0FSodzhcAf7pptcrKTIRIHjJUw3AByj5/sW
ohIi/TwmqZnBxQ4x5chiPGDwXhyx4xZzRgBvLToi/lY5zZbOdRwm5mBdz7f2vPDXaKgQnSJcIaZE
j+jHB+UM6OVBFlSbIET1Em/JenHBAYIAXaw47IDJkj3eEu4HAdIqiQgdiAgzBwTCzqmuoyI0hbRB
4eNchQGK6HiZw8RDVF67I9s4whBT5g9UyAl9ZbB0SvSrHAnW3hlVgBOBf944Q73j1MuW00SLfJs9
MqVnb4P1NV8T348yVGKuTK+lqoEk2GClZWKV9dIGRCb9XgdY4T4f+FLhIg489AsADBoW0SBAphfA
Y6SPIOeLhyhKgPvo3ktmiXG7oI4k2JsVnQAz9QAeOKQM0Fkuc9lgj38NAmSFAHiM6AMBjzEbTMFd
u4AeuzyXITH9CrGkJRyvchu6psE2XNqHAUGETl2JwR/O6iRoFoCB4FO+jlFj5ZM8GNqGVvAq3aKM
0LQEI0UbrrHto4QjdoGAh3gXgZNAcOX4rZy/bcAofGSa9D4IqGqpSSi2bcQR+8k4dzLYKoPAdRes
oe1az+jBxehc2p94HVg6P44XQJ2b+Nkl8kTvQay2TVbuWyzHniBryL1+S3Q8oEEfgF/vyjqIwX9c
HiF8GxSYBdMCerKBZHhT4yWMNsezLagEdjvseFmiayPAuQQdwYnYhCVZfqt7EQAMwlc1DzaMiV82
sDruSWPCCkJJnj/Y0tZNlbLb7AEzXyQrGS3ZLkUfpH+vo4wYhX1VNowba9wEdXdOBiGudqbgkNxW
v12XsE9CZBO0z4qE6XdiErhrrJL7vGpYdeQmVHBrq6M9vLcP1kDdk7ytahN2Ytk9r0pGrXoeGhVi
y+o5BjkaHa1nrVXfHyTR33YCqL1n5YHM2N5mJWfis6iwaB5AkNO6us+sOaHe4xqAsjpVFqwS++TM
9EjT4fADzQsxEux2xoNL1hyLJM9qkvoKNbIF5H67WeETBLD3hyzLucFRTe49o4UY1sye9Dm8SLdF
L8iDTHOLqmEgaDI1Wx2dWTDaVLzatTPGFTgHZXiYB0lwzFsmp5qDddkyswlV02a3JqgmZStUgZjJ
hpbUwO4vrM5akj+UZ4ujUCI5TVGgFVBHx4wvep3tHSjFTMMvSSRRTuA1vviGFmgaJtZpJ5oTZmUi
NZDS3cJsHa+zDIIJWX3L24wU9rAKoJh1YrlAcyxLimNZ57ZWaQprLPdNlpWEm/p0BFqDZkpQkKb9
o3qAShwitEx+uUYxoa24aKarxEGoDEs/tgfImdo/ZR0xOnT28R1h1e1qvraUJWNFZWu0MyuLmZSf
sqayG2YSPKRiVXV+jlwov6rpDsdkNnAKQ4XwVdH/cq3LeW1kOcMMgjGcIGq0wHXeYLhogfx0WsXg
5ePy7YYJ9WOyGSVXTiCCoLPMl4kvzmJ8raRXOZhCPOmqA2WuwE6ARxLBAxiSgbcNwx2ggOCY1wxs
OieB+G/pCjkAeNLAOkJ4d6CpVbujhHq0LHsNiOSFs5WmGuD1nz/fnx/FMOaffxphUscqyqqWDM80
c4SeAyzI3p2Wmih9LiAy5mIvocg/Pm3EbnFeth/NhXZYQpJ0n+G6uH2oM/z4Awo2lZgQKkAqSlMU
2EFNIay1llFNgQ6QMb94n2zo++vbT/7x/PgXNgBjoWPJyS4Tay8/FvM4uDqXw+v7xw2dot+mC1xb
tis6R7zJkegPuaKX3TrGl5iRsAm22Aa3zO7lEqfZOeKXeqeFwTppfhimz4STNoJYNlFVJemSBhbd
EoI5HO4h0my5z9KhuwUF1s2yIBFLGP6sQaH5OtwEWJwAiZaRZYxt7QTGemXCakvDAIQL758z4Mo7
W9Cakm2gXy7rUPldWgUkaCZjvd5usJOxEWte9PZgCLvi7i4pRIAdmY3oUD8glFAVxwaOk9sjn1Wp
AvC4OIpV0PM3fKXnTFVV3RdWLzTZHoL8Vs1skoEDwMpZxSyYjoQW1FtHsT2KLSVhsIpsaE6DrXUi
O86EAH8cKfFV66MB85QEWbnzvaQYN+zTNFcOVN+eX/76zftdastmn0i84PX3CwTRRRbzm98mE+j3
aRFXXQR2YTFrQF3Eq2BhPhT5WXS7Gw9vbtxYYf5GcYLrH9WxYu0ujr2PtpuM74u1Zx4xjR3Wvj0/
PRlHG4qz0Cd7I5iODu4D1eC4SmihQ9XOZtmAL1rM+jRIDpmwbZOMtLMOHyiW9xkGKUVj8BokhApT
mbUPzupsQwWnSrMdEZq6M8dCdvXzjw9IHPF+86H6e5qI5eXj6/O3D4jm/Pry9fnp5jcYlo/Pb0+X
D3sWjt3fELG5z8rWMQSUiOEh9lfYI8WmkFHn6JRZa8Uox+lqefiG2d9mz/ae4CMTQqlYpFjChNGJ
G0ZM/F2yhJTYNMmEwpNPFBntOG2OWrx3iZrFawXo1BGSRoWxhaClZtQfiXTF8+mRcCoqdJ9xjKVk
KlJH/O8BHTnCI0h8Fp0d0RF6dOAvoFnsx1GAO58OBNsoWOKwdkXv6dGuMNkKna29RYLzGleSqnSw
WWQe2fH3540PF8o3sR8u8ncmGuzRrkw8vXRrdIlSzYYj5Wn2NS2VgR9+6gCxkG7C2It7zMgdcNL6
Q5inBVHxvIz5O0Hns1hFAi/IPIYy4Q8l7dqz2P6RBM7the0IgQ6V8a9FcS5IpyI8mLA+7uNQjptY
+XJ4hJBc6AwibO89vD/XRIfADQKE70dodYAUSR6aY0jUAZslM2OhjLFFPM8RBUaij2WI773Se1Sc
YVxVnAMl/6CxCrEfSKkFVFt2AQs3M6jYYRLjCf7t2ixd0J10sDfjTNZWtwGshVFFdyin7lzh1gU8
a3MVK5N617cfxddiX+7E5Wcnrn/EcQ1bHB1BYuAdi7P0mvobNSrYmMmNuL/qSJ2YvawQ3koNxgRm
hUUoP2QLpPzGPz2UdxBCtDaG85M1Q+AZ7IHPQPTOKCUf3B1gynTFvmgxhPZ13cvmyuQkM6jxMfSE
+LP/Az+aovLdMM0GRSSazgnvrLnH5TTIhCXGceUMb81cIzLwhKMGKa/W92reW18zPEDARlbO0w7O
3nlCmjHlgZgn9NszvC5AFJ3VEPETAtY7lEsf1KYhLNW4J8fdEHpEexsD/Hcs14aD30uocYDVF0er
E4iuqE7ZFMJeFxOwQ4IYR+oJRSTs59oiGBI2mLKPfXM8QxDcnBhVHtINaFZEVNB4hFPGIFCtXqSW
QXLV+QO8wuWuSNWQDEdeGOQQfRKpQicwgtlriNmVjUlidDt60njasUpo40JsouA8zNOyB+3kMcJY
XlKWlaRFGyQJXO8OJbJwGdawhGLRGjW0JYzKLiJ2wNjW5pTWxgSH33Arj5EeKt5KPkYBCS0dB4cK
C0wX0PKL7E+UkbwR6vwOHu29v379uDn8/HF5+8/p5unvy/sHdv59EIPjSjt+hcvEZN9kDwke5Kgl
e5VLYDQ54JJbV0IK4twejGi1A5RfKvuUdbeJEQEMISvIWadcWaQF43SYG7Z8XVLpEWR7oJk+qgfW
pOmf3Jpwzk9dWtYzOOPEWWtNc8MVSwObjiY6AndI1yjWmJ6Z8LHn46xj7xrrGLUcR3yxjnRHtB4O
7q6i41kl9jXQGw6CmvrrsMfbVY8U4dqOtWqTis85duwydArsjG6YUoTqTrIjlHth4WETmfBVfE0s
WXypTh7rLspaKQc83KywYUxb3xUtUqNwZLTRKbDzXB0fzIUCcISC/TMmaiEMVYJrxp5klweO2JHD
xBC6W/zx/G5hYgIRY03VeSEiBoOZy/zVLWZd9TQ0PMOLhmrWuKKmITbl0zvPT2bgUmDaTpjJpq+z
icUWV52iQMQYEF44V2ICl5Okpo5PS3y1BDsemtAp8eafg4AX5nHUhDg6TviGPoMrmDs8q8SgS4Nr
Wo4trPKTJJRNutduAU3UR9lR7vyoHT4TU8+m5K6LhFpDX4yaZKAAN3hl4xBdYVPAswCMwd2RSGcg
UU+9yCT2g/lsFcD51wzADlHWt+pfFXXTreiXlDy2RBq7N6tbFqe0o2CLfyVNdZSpjrQubNpcNAYd
54q2WVV2GXj+WDaccjYQE/394/PT88uTfT9OHh8v3y5vr98vH8aVABGbAy/0V4Zncw+0XVeHh98m
K8X+5fO31yeZMrRPk/v4+iLq/7AuJkkaxei6IxB+bORFXGSpVzqg/+/5P1+e3y6PsP9xVt9Ga9uq
MOu7xk2x+/zj86Mge3m8ONs8NQzU60+jD6INLsN1vn3ePxBszEjMf758/Hl5f7aaunWl9pYoPL+B
k7NkXV4+/nl9+0t21c//Xt7+54Z9/3H5IsWljg4PtnYa3b6qX2TWz94PMZtFycvb088bOfFgjjNq
1pVFcYC3y81Acmgu76/f4Hbx6mD63PO9lZ4T5lrZ0Y0H+Tgn4VVumwB1BFdbmE455xp7xTSrIEhA
thfGRHpybOok1UF63S0QqLhapzTDzA5FAic1mrZWwDHM0sl4HqaQ/FiejXwDynHm5IhjrQqx+riG
YwhsA1wfHqYaU/nrPObLJi9f3l6fvxhzQqaNxS+j7HvVUQ8oLtrY9CGaO/AKJFignj3vIJgEJBec
uuBYMv7AeU2061TI9LSzUx4JSEf2heeHm9tuh/HviZI0DNcb81FFj4I0mJtV4sjvN1JEqaNs4Ejj
qZNEiySQJ9MLsYdBGsHaXyECKAz23EMn0N9XGXAPhW9iFzycwWuaCs2B9WtD4jhakIyH6con85oE
3PN8D+HIs1qYk0ssD563msvIeer58RbjKDD4S0uDAGe5XiPCAzxA4GNK0jk83p4Q0SCZKWT4cYrW
5jz2V1jPH6kXeo7cZj3eiF4ygOtUlIv0x0w95l7ea1et9onWbCPdlVRi8s/vf10+sFTLFmbky7I8
TY7cTplzlztORs9xOEXe7S/0MCVXqItw4z5ol8qTt87h2UcPjTAqR+4Y2yLLc1JW5ykSoc5furN0
h6qtc/QYrCfQzdgqFybvufIiLa3eAbI90VxLLyR+yFziVXV7rOeEEFRfqMjMOIsqIOSkZKLvLHpo
71U1s37pt9fR6VCFgGwKsTp/vbxdwKb4IuyYpxfDOmHUkUEaauH1LOfMYKX9WkUmuwNP8XjFWsMK
co6iMHZuNTU6ocbwkIYa2YGFgcMzQKPitMBPtg0ahzerTsMCVypliyr4FaoN7nKhESWFF8fOk7WB
iqY0ixxZenQyDhlcO4p7WmiEfTz5a2T7rGDlVSoiHyZc7Q2/qLnriEzgl8J86ZWdGfzrSjoEJDn3
Vn5MhIbIU4cLuMZQXp1eI7KyEGIk1bkkzoONcc4Xtd+5MxbJBlJ4hOXgBBOGsFuSd627JyGdQuR5
wpZ2zIOeRhhDS/gOcipcJej2pHV0X09160pTNBDMczvMSA6N48Cyx5eOyHYTfrk8x/0QAN2I6Z3A
K8bryuPAhFYI6WntPio3SPF0ZSZV6HAdsqgcmZBMqmgb05PLD8pUub4jrVWT8UwY0syVO6I9JtdY
aDS/0rqk4i3isMheni4vz48yOB/mPC72mlnJaEf3R+mA49AsNpkf4IdWNp2jv20yh2bXyc6ey73L
pHJlfxuoWnqE/kLXerSztP0sA2dDqjr8ukVSXL48f24vfwE7vct1Pdf6kfvCRKdy30RMVGEUXjUT
gCq6+kEB1Ta6ThWFjjRNNtUv1Bh7Lj1rUkXOw3udKv4VqsBxOrg8lI71dn9lwep9Za6u//MI0pNK
AP8ob6WRL5D5v0S2WV8jUybajp0cmUHAoQtnoTPoz4ZskPhfRW85hqkbWHDAvW8JGy9it2b+S1Uj
xR0/tDFo4RKtzvH3NId7XrMSxHaoAP769xvsDOxYA9LZvqu0N5YKIkNOG63gjXSHDdYGNDu1NlT+
7EAWgzLJU6Q8cJX3ZiNwSCg1PAMY2zjYI/NEryPJEG93gYLt1WMnZ7pYcNGsE/sVwq5ti2blreZi
sXMN7oHuKuW5ZrhAUN3nTmmalMyrVFGd3QwhPjQT+z03hToFdeNPQg+tVk6pypoW0dBoY49MUkg0
27UtXeBOeLH1Q4S9/n3DzEiTM4gBX47j+8hrLsxlpPuHqtqc8GguKHipusrIx9/+vIwwVOEM1i01
OOCKfm3F7CK1k33ftprxltCDPvV7jPJXzbWjCrG9P0UFLPTyBaR+lSOztNUMczHsM7gZr2WGKpRC
d+6NYI+5a905leWGqWtqbn8n4HlqgaQytmGHXs/QokWgRXv0DX/13qVTmJNohOOhXFsYvmZZ3wCI
mbY0zeozvsk5CLtNzNKiwR8YjGj0PrHH1oZEShyZpOyBd7RdmB8cErFTc6ypGGgP+y7nFuVVCiFA
5Th8GkhcePl8VeXWYG24saxuw16x1p1xmhCWJ5X2+BK6pACIfg89ZttIHOlma4rdFQ0vAYwKpJsz
qSmXadOsZaVO6awSbULTIr0bpJtUbMjgsYEJlQkRrGbImhkuqnIPJfo7BgWa3hqpk2G4NxSbAOUi
Wn9+usgnXzd8FhVAlgZv0X0LTy5svhMGsrpcQ48ewQt0UjcZb0UcJCMzdLpca6FZv3SV3CG1Dt6P
kLGmPTTVcY/58MqQ87LA1LAJNr4nn8/EmYuutuKumM0yOz+UFV+CzqtiNYBPBZo/XXRkx4GZ7irR
w4Rpw2VvJw8yXU/yMHSGw9DeCpud3s+bZJIQpNGTIhAfh6tL1LTvm97fcX9//bj8eHt9nNuhTQbR
O4TVqbnrT7COqgsOSz+d6qNYg1QZ7TZ8Vouq/cf39yek4lp8xIbWAYD08sbMMYmUTdub0VxsDADm
bJVzNfoBmPJpowD5fez8vCqIWEVvfuM/3z8u32+qlxv65/OP32/e4e3xV/EhpZb7TZ+NChJ6zDph
SMBVnojhTNXDYWOaEX50vJTTUnBRVu4wdz1FUowk+oBhkimRRVsuX3CJIcacOrvWrCT5G1ZNWFm1
CGcagpdVVc+K1D5RRXSx5rXrS/HWU1GxsZvFEct347OR5O3185fH1+/u5iTCyuVtosuAFlKOMOf6
f6ccpXevb+zO4jy5uVwhVW+IIa+qzUATTqzPMZ4gZ1ZSHfGJXdG//7o49numu2KPfWQ9tqwzI7jN
nGMfqWM6BkFmdr98a1FDQGeVu4bQneaUD9AaHv7eN8RI5QIITmuOhqwDZFEInD5oqEBS1Lv/5+za
mhvHdfRfSc3TbtVMHUuyfHk4D4ok25pIllqU3e5+cWUSz7Rrkziby5np8+sXICkboMD0nH3o6hgA
KYoiQZAEPrzfPsDXdMcAtxRQte09YU9GQF1LwVaaV5YpM240EVSPDLTScxtpEGumwvTRDQFt0tTP
6Vqpfo7x2pJGzgEmvjofYsJZlLv8LltyUKEnmMXaoka/WV4TtRVqskysrMgGS3JT7TMwA4q1Eio8
Q1wg3mFTyrlj6vQcELityy5Z5r00b7cWiiQh1iWebctG74qH6kePpd3x4fjknXk2snDrnjfZzyQU
5i366l4Y9fhVf2stuvgXoPPBos0/nePezM+r5QkEn050ClvWfllve/zPep3lVULjU6hQk7c6J8+a
Js1kAohNqJItB4wkAgidoZoklaATWUVgaBXb3H2JzNVCaKPZYWS9NfS7O1Yc7oEIWz46ATlzePO3
pGAcCnKDr7DPtwzwgZH7lq/rtPmBSNPwDTgXurjNLSQFlu+6VEfj6b7M/3q7Oz3ZkPJhjxrhfQIb
t18TfiTSs9riq+/2shfZNaEHccdKLFQyH3sugqyIF77D8m1U9rqLxnPpnMCKVckuGMdTEi1yYUQR
dUe/0KfTyTwaMJpuHRuHX043Ch0WOR33NSjWdrP5NEoGdFXF8Sgc1NbDlJElFMz19gs5yO2CfRnC
MkFTl+ujrUWVhvv8mkPr2xMpEfuroM+BHxjctqA69ULbp8QNn5B5/Dyju8gDhIt4V/UaEcKch90s
ioWW4mQLTQImpdRC8+dCiWUGovqpCrXZWSSkIuqz9eBi20fDsAUGi8OPnPCZu2BPlLCqk2xXRmPi
dmUJGhucuZobsgwKrrnT0KllavIuDIgO7Ph1lTjX1BfGmMZbmN88Q4WlOfkdrqsUZo7GkZGcYLMk
dLAgksjjFQPDqs1G0nw3nLkTft1mIgQ3QZXUjdpHzH1Wf+2uZyW7QrKebnYqm196U//kKQ4Myfly
N7v015tgFMh3llUahWJUZVUl03FMBoYl2OodImsGEicUUR0IszFNZAGEeRwHe45LYKkugQWUVLsU
vrd8lwu8SRh78vOmiYtec1ZlN7MoCKluu5ldJzFzzf9/RKqcB73JngJzHExEJ3pjNA9aub0Y7BFK
kYrImLOZNg0nE/57Hji/Q64OgCIFFQJjPOVVTUYTp8lA2ReYxxzDhTFiQJpgTM7RAbDYTZzfsz3x
vkUKTe6Av+eOPgOKPJwxKmgm+xYAay5mm0DGeO48YD6XDpGTbD6eTGnrC+0MB+YL6yZzGgFUuSV4
rOAwKQuW0CTOQl3rpRvAxhntBk/Slo+nMjwRL/Sxm1MqTdHfZdCGCx8T9nm5WTJH5bpsfAJ4J1e2
aNL5JFbFbBxJbuarHUaN03VwrdOn+yrqTxDlDgBDfJrxbjTgjC4Nk7fsHGKXhuMpmUiawCAUkTCf
OBLzKbueBGtwFErZQ5ATwGcg2k5TZpyASeSc+iIxNAI9eSc04r5KmwhGDKkOCGOeywJJc9E1XocI
dbn21gFrFsE/WPdU+Xr/NbA9SRvYhJNw7vke62QDU5u1AG+gPdLazt3iMDLeE84dUFPNdvDRdrVp
Fz++0OZx8UG9WmDLXulCB3LMrg0QpWb5pa2941Cl4XQ4THtmk0N59iySrdpZBCnH9O2ZsQt4eINx
H/DPQ+1pko5mwcdsEYS1Z47VKGQj0DCCMPCgtVn+aIYOwN6Kg3CmRjFZxix5EqhJSMJLNBlqCmJH
VE3ndGuEtAq2VzveZ0DuynQc80lkMx/DlBE/l3aCjqyCu9RlT1x2/XD7T4NLFy+np7er/OmeGAdo
97U52CZlLtRJStij/+eH4+9Hx7yYRRPSYasqHYcxq+xSyhwgfTs8akxodXh6PTlBluhlsW9Wfsxz
I5F/ra0I2SZW+WTGrHX87VrrmuZY62mqZqISKpJPenLQbAWVmo5G8uKv0iwa7V0gwJ6JqS7aAjfC
y8ZJH9oo0QTefp3Nd9QKHHSdSUVzvLcEHZmZnh4fT088C4w1/c2GUOuyRw+73yGSDyjXT4dQpWwV
ylrn5lpJNX25c5v4jkM1ttxqI9/9D6tgG9fOeazMY/afw7O6z8Yim/kDU+nWTADZno5HGiyPWGtx
NJG+HzJmTsB0PA7ljR6y3FhqypI3z3E8D1sNb+Y8Bum+ElHrCo9kSz+ehOPWtZ/jCQ07NL/dGYXU
+cSTKQ+Y05jt+OH3zGnSdCJNSM0Y86LTUcsJA2M9Gslm92xGo+5SGBlZwoyJTI3HoRy9A7ZW4HNc
RztsIq5q1SSMKCg4GE1xMGUmErqfMyNqPA/DwfKcDNfyHmaPrl0IuDMLNfL2d06OY5qd2dCmURC4
cvAdQqqCPpwkZ+iG+/fHx+/25J+vNvbgPdtUFUMydnnmqFc6hhhInk/IWIA6a4Ju2OLl8L/vh6e7
72cwgH8joHaWqX80Zdnfbxt3I+1Fcvt2evlHdnx9ezn+9o7oCQ4qgZM80PFY8lSh62i+3b4efilB
7HB/VZ5Oz1f/BU3476vfz018JU2kymcxjmK2OQXCNKAv/5/W3Zf7QfcwFfnH95fT693p+QAv3i/i
ly2pCiaj2YhOSiRh8u0BaeKSQp6ALsl2rRqLYALX1RKeQ9d//M1XAkszGuzilLhLVAhbH1E7kfVQ
W9wRuRyqmk00ot1vCe6Jol1kTHnPaVrRLSOD5jKYW8PeNev84fbh7Rsxm3rqy9tVe/t2uKpOT8c3
16Ja5OOxrP80Z8yUUTQK6IGnpTAFID6PMGkTTQPfH4/3x7fvwlCpwihgG51s1XnOQVdo04+kMxGW
SqcqMgOR3jM7FYZEqZnffJBYmjNIVt0mlJYgVYD9R9Qp/g7ZZxy8sI1VAiWJYP6Ph9vX95fD4wFs
63fowMHcYWfOljQZkqaxO3fGMzYdioDPJUPxLMqWyc5RF7tazab0iKCncKv6THW68Kbaiat4sd7u
i7QaI+Q1dca6UB17jnK4NQccmIMTPQc5/CRjia9MJSQbsVTVJFPEK5PTeR84PNaPbrmIbeA+GBi0
AvzEHJibUi+LoEmacPzj2xuZcBd1kDawUy3lQJ0k+xWmUiRuhZJsgydJVIWXqBvIsCwjzB/MtHeT
qbkMPa5Zc6a/VwFLV4u/6YBOwcoJZhwmEEiinQWMKCQ3mvB7MqEwEMsmTJrRiDmHGxq8wmgkYb0W
n9QE1ERC0cPP2w9VhvNRwIxYzgulA2/NCqi9R+9pSiXSm5Z6Cv+qkiCkKHJt047ikGZ9te2wGW1o
ToWujUfSxy638GXHqWIrASwWI7aZsTQ5+m1dJx4kj7rpYEiwA5EG3iEcIVXeVxdBEElLGDLo3aHq
bqKIjkmYdZttoUImY0lcx1zITBV0qYrGAVkkNYHeNPbd28G3jCesfzVpJjUcOdMp+WpAGMcRWag2
Kg5mIXEt2qbr0n4BRonI6NnmlT46onPE0DyhqttyEojYyV/hK4XhiBmWXKkYn7nbP54Ob+ZWSljf
b2bzKVvfk5vRXD7vtTemVbIkZxOEOLy0vbCUJyobmKDMfnAdijXkXV3lmCOQGXtVGsXhmHWm1eT6
qT7Drh8QqyqNZ+NoOBEtg68fLpOnjrfMtorYiT2nyxVaXr80976F0oczn/T94e34/HD4y3W1xHMe
F/e+r42WsdbO3cPxyTcw6JnTOi2LtdD9RMZ4J+zburvkpj0vnsJzdAv6nEFXvyBW2dM97FWfDnwv
ih41bbtpOuI64XxqE0Blg4KGvhCC9N+UxbwuspR9M7n9dnV/AiMc9t/38O+P9wf4+/n0etT4foO+
1svWeN/Uis/lH1fBdnzPpzewS44Xhw96WBNO5UDpDDF2PZdF8dg9CGEwV4ZAvJjwJARXWEYIIn47
BSTQotIDUZiZK11Tulsbz7uK/QDf5I0nqqua+TCK31OzKW2OAl4Or2j2CerzuhlNRtWS6sMm5DY+
/na3vJrmmOJZuYJVQMZnyRqw+X6gJXXebDI5Gw6zWaQN9q7ox9GUAd/kGYrHKLdMtggDLQroDUyl
Yn7VqH9z/Wdp3DEEaBEZU1adm5dzzX9NFQ+WDYfbCfF4RBPJNuFoQgp+bRIwVCcDAq++Jzq6ejBC
Lib+E0IwDgeOiuZRPFi6mbAde6e/jo+4VUVFcH98NXidQx2Cdmo8opfRRZa0mJM132/pNL4O4A0u
Yk3BfarbBSKGivdyql3Qwwi1m0cBMzeBEssONFCS6AU0i6IRzQW4LeOoHO3OJsS5Xz98+/8YTnPO
zrcQXpMf7/ygLrNqHR6f8dSQK4TLPENlPkpgwcorGewGz57nos0JGrWo9gi4W9XGTZwcgVxmOtbM
rujL3Xw0CeRTcMP0gLN2FeywJM81zSCn3h2shnRw6d9hxhaDKJjFEzqkpZ4i249OhnDZVrmb8bcf
qjQXJfwYpl5D4iC1AuOeHV4+lPBiIVkBF5OJcvMWrKVLx2iaDfdhxD6enb+SyQvlvtOquPYAriK3
qPzvW1Q7abG1rHDKLk4NEdZdOVJc883w9lSpk6FGbuvLJg1mu91epf53sA42H/CV8qZFuQhYsEGv
lA5O8zQeI3wwe43b/N7PxVNMJ2OdxW5HOoHmhIOuInwo9DHvGEHOGdaNnlMvkTCU2LSZI4bGrkBC
uAGnsdpNxNtpOrzA8zJdkadJw5sCtFU7mKzd55I3BgiY5JFLGTQK9xN8HQIwFu2nq7tvx+dhtvSk
3C8K6oCaZBgjDgUutL7HYX+RIgdWQbYI9uz2k6woeoH2axL4pTo1nuGmr5VDNygklCPjPGY1M029
vED+dd2o/ZK+J1SBMMDNqsCEmUWW01BumNbAV13OvM+Ruu5gz0hfvg9ahurSurou1mL8U1nX6yVG
emIit8bJBEp5lYtB1u8L3Q94blWTpDe4BLDDhDpBaAmdrMKDV6bxkqF0nXYibrLBRIMfXVuXTgSW
4SXdaipd4lvuTgWj3bCU0fjeYgPlz8jWt2dYqwvhyZjotUgHM9LKZN0VnwZUo3uH9fs0IeEaQKl9
0l67taJLnksTQE4MwwQL1koNG2G89Dy+aUbERQzlTH3J7D5Qa7mqCeJBH6k6RejsYUM0NNMHrThD
r3mbggn8yEm4AXPqYfgQQM/LRAS+/lagWX25Uu+/verouotKQ+zLFjQFsC/VEOK+KppCQ5QzzQkM
4wCIqatF7W4kEN6ir+AjufmgJsIHs0gDTYIESfd5RnICcsjbj4XM2yOTrA2ajl2m6Y48zhlUS1iV
U0QVoM3WtX6U2w+wHO/D2RpMKVVIm1omoyt4dFmDxlRVE9mms2cZ32h/T+lRj0FVK6Wfxx915vIJ
o+HnEw038NHXNH6o+Vo3TNpjMFB7UKe5+xCr/vWA0Bj5nkr6KC7b25QTN1vMhil9B3TsQl/XALaO
+IyPBtxZdCyIMsFiNR5Nh6PImDtAhh8pb6O2aYL5eN+EG14oS2ZmFLtNz6pZMNl92PtJNYnHuBJl
Ita2xh2xCxCfC6BfmqLJI3comYjCvKo8+xUQYQlExZWWK5Xzu2JkrLHdiEWCj2uTRlo/i6zMQeLX
PCWGRZWyfoKfngShyCl1Ohuj6A4vv59eHvV2/tE4KbCEfX3TPxA769+EryxgL6Ue4HL4dmyX7GRy
6A3IddbWNGbcEvZgC2WI6dSkPh4N+HNK9ZmWf/rtiAnbf/72p/3jX0/35q+fyInt4IkfQ+qc80jY
8llCLiDXsKUmy7X+ed47M6I2CIuBLJLrtO4ap87zzi5H6JbKxxUKYvyHqfEykmD7lS82ivnyamX4
aYG1y3eY5l3QI19liSxz1na6dmkB7wWEhuL6Jb660S2Ig0+662x+D17EFNouJqD2dH3yYU2PneJr
qn32equgd5cN2Ue2CHGvmsGnsGEHfYN6KqJXGZq1PFafr95ebu/0AaS7o4J3Zb6MeMHd1ejTWrAb
vwsLIc88YEQgo50CvVxVb9o012GxdekB/byIrWCF6K7zRELFM+qsW7FzcEvzHiacBZJUDGQ985ee
ilUn4VCd2bBqyu3pPnzaBT2q92EafrC+kGvj4u99tWx7+1d4jiuyT7jjiIZZa1ATOS6s54K9jBr4
8jkSKcc7d6VwIevfwOXZtY6d65+ZFew+dnUocK/bIluSbYJtyKLN86/5gGsf0qDKHiB66PrafFnQ
YCNNzBal0ytA2S8qpgYofS9D4jAR2zZfDaYhH1WSLDZiaXmRZh+hasxnIMW7XFJKOqchdNPu4t1E
rpsFoJ4NxuAsp/OQZ6E3ZBWMR5InDrI1CsEjpZwTMQ7vuQdIhA2o8obZO6oQgQBVWVR4/kAlgWRW
I8TCkZXSWWS9zPxi+kob/l7nqaSzYMShwOUtg9EYUxxm+xnTwed77HTdOTqYXIgDUzrdL/b5p5zf
IQwAIPt7UY7KYdy0jw+HK2NOUvCWFCZgvv9cw9KCYer0wm6b4HVUl+8XCoOCFZtSCq++C/j4KYGP
yHcIikhNlJ6yv0bAYfiUhIfp0jUOsXObhcgxCOTzhUlIIx+zTKftl6YreJpwYGxhm91Jm4+FEvKr
G5KoyjVHI86wJyTeIp82NQ8I1wRMqa03gnooLWTsmqYFrpX/nLRrlpfakPslhRE7UIrsiYuq22+l
OwTDCZ0KDAbIxZDddPVCjaGrZH9GzXa4fb9ARwGHeRPKVpHNY74g1981fLQy+eKhgeLMihYm4B7+
u7yAJJCUnxMwZhZ1Wdaf6ZsRYTTSJT1CRKocuqZuvvQKMr29+3Ygk2eh9OzhI89MKNUlndx7vQSe
itSwn/UB/Bop/8VYL1Ff4+ZuXxYeXWAbbTZwr4f3+9PV76AKBppAB5Q7N3NIuvEE3mkmnq9R/BhN
bBAxq6rXRVe3g+rAZi+zNhfvc3Rh2EAlbbrSPbgh2uImb9dUszh7oa5qeOM14aKkfFepILNLuk52
KVptljBrr8WRDja9zrgFVixLTYX/6dnBfA2GHU/0HaZ5R1WH+NG5mJkLlAeo6BsqRfZ7/ePIbzrF
9W92wWcobrdQJgtINpS97EXa1nWHEvJWTzdND1QvHzVGmS+T9AvoYfHlrRCOALCrs7Xzrj2w6iZr
CC4vfYaEnwdTD8EuYJmoyakBLjbuT+wN9kA3bl1t1i09XjC/90vF9KCl+md0mjcrWaumhaNS4bdR
MaKXNnITVH2g5FSebtq+g2m3aKnPeYIJmParRMkQhFpq06SJJ7GB5g8mEGUOEHQvVE8akDMf95wN
fPYvngQYWvBvtO+jEZjWWeJd6Aar3Jk1b+QvtaZu7PCjx/j950/H19NsFs9/CciJEQpAA3KtMceR
DHDChKZ/S2gqg88woZkY/eWIsKNghyc5UzgixCeMc2jcjcNhkQgOTxrtjkjkrXj8QcU/fhcajO9w
5t6K55EcecyFfvwh5tT5i3M0wo3YrumYcwpV4wDczzxVBWE88r4JMCVzEmUSlRaF/KjAHT49w/ch
e37kKygFVFN+7CsoOUxR/tR99Z4h3S2zd4x8JT3OXUzEP1Fv6mK2F5N79MwN/5BVkuLRZrIektMc
NvupRIfNyKatBU5bJ12RrN1307wvbVGW4o1cL7JM8lJ64BI2KjdDcgENRLjQ78OHFeuNmDyDvXGR
rKWy3aa9KTwLG8psuoUMdpKVslW+WRc4I0Q7m+2vDVDD4e79Bf0gT8/oAE5sbVzSaIPxN+xePm1y
1e39axUYKwrMfMTqhBKwV1xKS5DdEueZ9Jh9toJNeN4mg0SIvZWC9gLsnPdZlSt9T961RcoMql7k
g9LUHNX6wyQagGFfJh0/hgNrDTfY5mSYPQbDElK9866g01d52cgJgWxKgUvLEzLySlX98ycMHL8/
/fn08/fbx9ufH06398/Hp59fb38/QD3H+5+PT2+HP/BT/fzb8+8/ma93c3h5Ojxcfbt9uT9oF9/L
V7S41o+nl+9Xx6cjRhke/31rI9ntcwvY/uArpDf7db3mGJDIQk8NMNHSc/PdZOOOMJ57emXPyNZi
k3q2/43OuCDuiD1bcjii6vM++OX789vp6u70crg6vVx9Ozw8UzwCIwyvt2SJMxg5HNLzJBOJQ1F1
kxbNih5HOYxhETRwReJQtKWHLheaKHg27x7dhntb0nMGRW6aZih90zTDGmD/IYiCHkyWQqdYOjPl
LAvnlmS3s4Ln/RVeZKpB9ctFEM6qTTlgrDelTBw2Xf8nfP1NtwJtNqDrjCdu96miygbEZbnB2ybU
HJhb+3yR/f7bw/Hul/85fL+602P5j5fb52/fB0O4VcmgymwldGSeZp79U89vMzFjSN8Bm3abh3Ec
zPs5lry/fcOYlrvbt8P9Vf6k24lhRH8e375dJa+vp7ujZmW3b7eDhqdpNewLgZauYLFJwlFTl18w
rpRtMvspuCzU/1V2LMtx48Z7vsK1p6QqcVmyrHgPPoAkZoYevsSHZqQLS2srWtWuZJceW/78dDdA
sgE0GOewKw+6CYJAo9FvnIh5ttPM64v8UnhSQ9fAvpw67+auBSrk8fDtKzemTSNKUmF+040UlzMB
+5Do074LPlanSYBXtAfhdfXa6xozRLfxKOwMOG7ptoJgD+zm6Q4oPgNRph/KAKCxkPns9r15/j02
fSUvYTPxuVJJk3qED1kj2kt4LFi77P7u9vklfG+bvj8Np8U0G4eoQCEEXllYBMN8FxJ7OR5Fnp4U
aq9Pw4U27eEiwTv6k3dZvgkZG/Xvz2V06crsTGgT8HLYFrrAv8KatGXm7TUJQyyLtcBPP5zLXb+P
XBs8beSdkpS8BWo6Dpo/8ET5pfl92Fi+D59H50VSbwXy6Lftya8r9HFoPlAVJSOU3H//3fFYzvwr
XHRoG/s8PLShucqj1KqqIckjpiiL0aaSgjqTYH3Y5CLNGkBgWJxoVJUaFK7wLEoV6guxh7o+pD5s
Ddcw051AMBv6u/a9+526VpJxdVpbVXSKF7fwjh3hpZ133b0PbRtdCYe/aR+7Tp+OH3ghtZnyzoSX
9XrlTO4Ptbhatn2Z96BXiwDjCNhn+u3hO+YdelWv5nXYFNEr3+2BdS3Fdlrgx7NQtiquQ74Ebbvw
mLju+mySkNqbx6/fHt5Urw+/3T5NNbccBWfeFF0+pg0KzYGk1CZUUHYI6Q0hkVPJwDx7tIAinfoI
CBo/532vW40BnM2V8EIUgvGKvxUjuIc4qRk/hdxG7mX28VDVCcnFaFp/3v/2dAOa3dO315f7R+HY
x1I1EqOjdmBKwdpQbRtzJE4x6cLUMKz4aiCS2dCspxiKOJBF+l3vgQvJITiLfP90YoM0n1/rTydr
KGuvj578y9c5gnSINJ+g/jzvDsL0qu6qLDVaX8hw0181bjHKBdwMSWGxuiFBxJCQsBjSf0ibeKbb
yZ/v7x5NlueX32+//HH/eOdcKUY+xrFvh84akto8dr+4QQUySffohJaRJ2f0Twxj+v4kr1R7ZWIi
Np/mCkyxnVDkFZZjblW1dU8zzEyS40eSHGSPS912zIE7JWiAWFKlzdW4aSmyn+vVHKXQVQRa6X4c
+pz7gybQJq8y+F8LkwVD4M7jNssZX8aLjjWozGUCY+RRo2hCU0XYcZPSHZdc55hAXnPXl81yPclE
Uuh3By44blCusBFiOf84wkBfLBAfsP7Klg5xNl4K2iewXKfp5NzFCEVuGGE/jM7Jnr53TjPUBdh9
p2wPEQR2gE6uZDWVIZwJj6r2ED91ESPJY2JQei4LfC7LTZkjDBhBqCylzCkzKzaLi11VWV2yzxde
CUc/SiRezQVsxYBIv/0a2VFekbTBbKXXtYgN4oLQNwkRS/sDxxbfCeKFgE7NDH8GHK+xmc0L/SYz
Dpsb20qJEY2szlqUXJ3LDhkLV5EU5AXc72ArCnNvMboGtkcw3iT9LIw3sorLPIzb69y5zmsGJAA4
FSHFNb9EyQHUkfazkFOQWVr1vAa46vBeUNjql3hZcKtYEgyyi9wNqDdNGIYxOjwH251rniq8TaOj
+3VGYKQYm+3CEIDpN+gK8PkUwlSWtWM/np85bLQ75HVfOCkuhIzJcn7wxfTItjDfzTblTqd7vOOl
Uv3AK/lnF5zzFnXi/lp4FHOJYoAE67q4RocIHyAm7oLsIMXjlE3u1CfEFBOMIYbjh1fkxFSCaQkv
s64OF3arewwwrTeZEjIS8ZmRc1wH0NNJxIM3a1S35mgb3vrxB2f31IQhgzAvThbSFOWV7g+qYE5B
asp0UzNc2FmlYgUa6uSz2jKNA51U1ZZPPavR4kkMrndnEn2o9fvT/ePLH6ZuycPt813ouSNpZE/T
4cgYphnDUGSLusmLGIt6W4DEUcx+g39HMS6GXPefzmYqgP2KjrSghxkjwUAsO5BMF8qNcL2qFF6f
GtsADty/uuKqTGoUMHXbAhbfCoQN/4EQldS2WLqd9+hcznrw/Z+3/3q5f7Ci3zOhfjHtT+HM64qc
EOWAJg/cm4zEWhgVBcx+Onl3esaJogHehXlTPF6uBU3L3HvelXyOdhqLDmBkKJCguBXN93ZAxnjh
QJl3pepTxrR8CI1prKviyp+zTY15MJuhMg+oIsfSd9xuaT6qqSleWH7cRG9hxHgz8Kn/6cn9G7+7
3m6J7Pa317s7dA/mj88vT69YN5XnAahtTnGfvDIDa5x9lGa9Pr37cSJhmcR/uQdbFKBDfzjeEfrL
L97Hd8F0TPFuqnACmWcourAIocRIfdnn7/aETluBAojNEufabzOHg+NvSYubZOoh6VQFsmaV96CG
2pFaJILxzgxy3yop68YAE7x3vPP6MFdHBh0ReZVazivAmAMzAMY1f4oo3EUw4Zn+0tgBcZf53BnX
OClKQB97vM4j4go3HSIiHdVyiAR2Ux/k8hcEhB3V1ZWXcuBCYPHNQkXynF3ka91KJrlltMBwNiFV
tnWmMHRfFgRnsjHIh6M/r7xlVv96DJhkpyb99ri5baRe3Ihp07GJJ5fsPUT7dq1B4CuA+4SPT5CV
FTRREQMeZ7JFAdh7ZrE0aMrE7Vf6uyz/9wRitsGgAupcmr0+zWWpFH0RXdtdvt15gu88QTR6TCXY
mAyEcAJCYJrSgPcKt2xoiTJQDAM3JLqwEpCCdefdce7ttGANdl7xGuPcQ/w39bfvz/98gzcdvH43
B8fu5vGOC0EKK+DAsVU7+TxOM2YPDczaZoAkfw79p3dstetNj2HWA9JkD6RXR2LxVZv9DJ4Bjjss
c9CrTiacwwUczXBAZ7Vs1CKmaN4m2rHWJ8pEf8HB+/UVT1vO7xwSD0KjqVlIHZnCc4QuXcrC+d1r
7dcHtLyo1bp0HTrGpobe+IXD//35+/0jeujh2x5eX25/3MI/bl++vH379h/M3IbpXNTvliRvXxNo
WiBwKbvLAFp1MF1UMNOydY7AOBn+9kG9cuj1UQdyQAcfjo8Fh5CMfjgYyNjBPmwUVz/tmw6dk2lh
WmlgnrZIiQK6CSfdAqJMBBRtlLu7QutGehFOLvkcrGrTue8cYRugejpaq9hE3/OXSRrR/7Hes5RA
2RLAMzaF2vK0G6d9rEoW8EVsjhD4tJBIDLM3DhX6+mAbGPPWCoPfmzMpwq7+MCLK15uXmzcom3xB
c7JzPz3NZd4FhNTYRp83igoSgSjpL0drLHuKTs1qpOMczlqsfByIMA7fiIzYfVXawuRUfW4K4xun
XDpIzMTuqJT52TyqWCyJ6YAKwyYQOxwM/rQwFYgCIs1I99t5wVgIA21kJA1qZvenJ94LWjn/EWH6
gueMTDU+nS/3dvGFVYfaRRGadogCeTK96mtRjEbP20KjIQur6saMlKlfdMTPats6dAvi+07GmdTt
zbQ94sDxkPc7NPh0P4Fm8x/RDuGjW7SScpWhP3Q2eCiYzUfLhpikefqdpPZB04vHBjCb/zh6X2Te
mrpcmYw1/g3sdDMV4Ttpr/AHGFmPVj3UqP3pZF1Zza07OLUNzaGH9jXxs4L3TcK0/yKLKNi8vC9G
OwyZy5auZ4L0KEcWf0nwDRGcCbWfBVt1uy3c6OL2AkSqTbyD+dHpAz3Be2Vou0Oh+jUEzOwPNvfy
9XajGTKTVAxLR12lmm5XhwQ2ASarh7fYCRwlWNmwrSlz3A+8ntqt4wq+1Tyg5aCeAfATHb8xbdqA
BoHbyyrYinPrMnvoHbW16aMfb7fBXLJpEUln6h0TYGq7UrVirUG2H2Y8pxyEfYsqyLSOE7K6WL2C
w6BZOTDYC2PI4V4kA6V3drB5w10YHF54zuUZqPe7ND95/+sZWfV9DW0hZoVlBqV5ZqqhqZRkbT5U
1pQO2h8fz6WD1hN2Ak4QCkMhjlZtcTWZaZ3qdMeP56O1oxIPGRr5qUhfWbKNPECF6Y4Zj1q12kKR
bIqBhzgRk583sZRNi7c50tq9O36UgwkZhpYr488YA/0RlmjGsFvYGbYxdKtWlW7UWqNWkmvNoxgF
JL3PSndlzj3MbF2scdCVLpoBczNQgI+a1YfqYIqB+dbcWbJxSY37Jvrb5xeUz1GvTL/9dft0c8cu
2tjjy5dB0k9m1HGa3e8xbfpI+yPYZAZKUgBqG3LulJWC0SFAd418NnZvYQKMLXjGYKemygtjHZs0
qYXzIGiD6ovMmNwuZ8Ot5HYxNpMOmHx9OZ2cbBu0IMTQSW2U0ClYbZEf91kvKybGQIAMvYMNEkcp
8wr9CnLlMMKIPp8skinQ5AoDTjCCdgVOXta6qLF+aRSLCBMPhfXO4NzFYzdmtSRl9vxMjNOgr93p
I5ofV6bDePJMzoZ4SlqsLnWj+ah9D4BeLA9E4DmWyH0qyftybYkADuReyMzM2M+HfAV6JJ95HD6Z
AuMYLYaEUA5dHCcavkjQPJOL45t5IfdqbNaKfenWkzJTUjcydyD4ZRnY6J35Qt2LSqsEHTeblYXA
ILMduknh6JaZA4ZWweBWZSTqa5O35UG5t5Ab2qKaJlKQAAFEnmoC30QAi0rzYDDMuckjp9i5aImf
EiMpu9MfvGPWXmFLukxBkpfUYkORk3/d35wUSxeRuKaeI0ZzM+u8Wj7gzp/v5ijKZ1+QyOgGDJJl
qcy7DhlIVqdDaSXw/wKXQI2/8IYCAA==
--===============7446359339707849999==--

