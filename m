Content-Type: multipart/mixed; boundary="===============6768521874478168978=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/arm/arm-smmu/arm-smmu.c:831 arm_smmu_init_domain_context() warn: should '~0 << ias' be a 64 bit
Date: Fri, 26 Feb 2021 16:22:17 +0800
Message-ID: <202102261607.jnpLC122-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6768521874478168978==
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
head:   2c87f7a38f930ef6f6a7bdd04aeb82ce3971b54b
commit: 67f1a7a314a2c29832ae604f839653408492ee5d iommu/arm-smmu: Add suppor=
t for split pagetables
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-m031-20210226 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/iommu/arm/arm-smmu/arm-smmu.c:831 arm_smmu_init_domain_context() wa=
rn: should '~0 << ias' be a 64 bit type?

Old smatch warnings:
drivers/iommu/arm/arm-smmu/arm-smmu.c:686 arm_smmu_init_domain_context() wa=
rn: missing error code 'ret'
drivers/iommu/arm/arm-smmu/arm-smmu.c:1855 arm_smmu_device_cfg_probe() warn=
: should '2 * size << smmu->pgshift' be a 64 bit type?

vim +831 drivers/iommu/arm/arm-smmu/arm-smmu.c

45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  666  =

45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  667  static int arm_smmu_init_domain_context(struct iommu_domain *d=
omain,
44680eedf9409d drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  668  					struct arm_smmu_device *smmu)
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  669  {
a18037b27ebd23 drivers/iommu/arm-smmu.c              Mitchel Humpherys 2014=
-07-30  670  	int irq, start, ret =3D 0;
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  671  	unsigned long ias, oas;
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  672  	struct io_pgtable_ops *pgtbl_ops;
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  673  	struct io_pgtable_cfg pgtbl_cfg;
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  674  	enum io_pgtable_fmt fmt;
1d672638fca24d drivers/iommu/arm-smmu.c              Joerg Roedel      2015=
-03-26  675  	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain=
);
44680eedf9409d drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  676  	struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
aa7ec73297df57 drivers/iommu/arm-smmu.c              Krishna Reddy     2020=
-07-18  677  	irqreturn_t (*context_fault)(int irq, void *dev);
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  678  =

518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  679  	mutex_lock(&smmu_domain->init_mutex);
a18037b27ebd23 drivers/iommu/arm-smmu.c              Mitchel Humpherys 2014=
-07-30  680  	if (smmu_domain->smmu)
a18037b27ebd23 drivers/iommu/arm-smmu.c              Mitchel Humpherys 2014=
-07-30  681  		goto out_unlock;
a18037b27ebd23 drivers/iommu/arm-smmu.c              Mitchel Humpherys 2014=
-07-30  682  =

61bc671179f190 drivers/iommu/arm-smmu.c              Will Deacon       2017=
-01-06  683  	if (domain->type =3D=3D IOMMU_DOMAIN_IDENTITY) {
61bc671179f190 drivers/iommu/arm-smmu.c              Will Deacon       2017=
-01-06  684  		smmu_domain->stage =3D ARM_SMMU_DOMAIN_BYPASS;
61bc671179f190 drivers/iommu/arm-smmu.c              Will Deacon       2017=
-01-06  685  		smmu_domain->smmu =3D smmu;
61bc671179f190 drivers/iommu/arm-smmu.c              Will Deacon       2017=
-01-06  686  		goto out_unlock;
61bc671179f190 drivers/iommu/arm-smmu.c              Will Deacon       2017=
-01-06  687  	}
61bc671179f190 drivers/iommu/arm-smmu.c              Will Deacon       2017=
-01-06  688  =

45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  689  	/*
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  690  	 * Mapping the requested stage onto what we support is surpri=
singly
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  691  	 * complicated, mainly because the spec allows S1+S2 SMMUs wi=
thout
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  692  	 * support for nested translation. That means we end up with =
the
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  693  	 * following table:
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  694  	 *
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  695  	 * Requested        Supported        Actual
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  696  	 *     S1               N              S1
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  697  	 *     S1             S1+S2            S1
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  698  	 *     S1               S2             S2
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  699  	 *     S1               S1             S1
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  700  	 *     N                N              N
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  701  	 *     N              S1+S2            S2
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  702  	 *     N                S2             S2
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  703  	 *     N                S1             S1
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  704  	 *
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  705  	 * Note that you can't actually request stage-2 mappings.
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  706  	 */
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  707  	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1))
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  708  		smmu_domain->stage =3D ARM_SMMU_DOMAIN_S2;
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  709  	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  710  		smmu_domain->stage =3D ARM_SMMU_DOMAIN_S1;
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  711  =

7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  712  	/*
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  713  	 * Choosing a suitable context format is even more fiddly. Un=
til we
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  714  	 * grow some way for the caller to express a preference, and/=
or move
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  715  	 * the decision into the io-pgtable code where it arguably be=
longs,
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  716  	 * just aim for the closest thing to the rest of the system, =
and hope
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  717  	 * that the hardware isn't esoteric enough that we can't assu=
me AArch64
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  718  	 * support to be a superset of AArch32 support...
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  719  	 */
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  720  	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_L)
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  721  		cfg->fmt =3D ARM_SMMU_CTX_FMT_AARCH32_L;
6070529bebd26e drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-08-11  722  	if (IS_ENABLED(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) &&
6070529bebd26e drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-08-11  723  	    !IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_ARM_LPAE)=
 &&
6070529bebd26e drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-08-11  724  	    (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_S) &&
6070529bebd26e drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-08-11  725  	    (smmu_domain->stage =3D=3D ARM_SMMU_DOMAIN_S1))
6070529bebd26e drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-08-11  726  		cfg->fmt =3D ARM_SMMU_CTX_FMT_AARCH32_S;
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  727  	if ((IS_ENABLED(CONFIG_64BIT) || cfg->fmt =3D=3D ARM_SMMU_CTX=
_FMT_NONE) &&
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  728  	    (smmu->features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  729  			       ARM_SMMU_FEAT_FMT_AARCH64_16K |
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  730  			       ARM_SMMU_FEAT_FMT_AARCH64_4K)))
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  731  		cfg->fmt =3D ARM_SMMU_CTX_FMT_AARCH64;
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  732  =

7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  733  	if (cfg->fmt =3D=3D ARM_SMMU_CTX_FMT_NONE) {
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  734  		ret =3D -EINVAL;
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  735  		goto out_unlock;
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  736  	}
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  737  =

c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  738  	switch (smmu_domain->stage) {
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  739  	case ARM_SMMU_DOMAIN_S1:
44680eedf9409d drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  740  		cfg->cbar =3D CBAR_TYPE_S1_TRANS_S2_BYPASS;
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  741  		start =3D smmu->num_s2_context_banks;
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  742  		ias =3D smmu->va_size;
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  743  		oas =3D smmu->ipa_size;
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  744  		if (cfg->fmt =3D=3D ARM_SMMU_CTX_FMT_AARCH64) {
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  745  			fmt =3D ARM_64_LPAE_S1;
6070529bebd26e drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-08-11  746  		} else if (cfg->fmt =3D=3D ARM_SMMU_CTX_FMT_AARCH32_L) {
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  747  			fmt =3D ARM_32_LPAE_S1;
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  748  			ias =3D min(ias, 32UL);
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  749  			oas =3D min(oas, 40UL);
6070529bebd26e drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-08-11  750  		} else {
6070529bebd26e drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-08-11  751  			fmt =3D ARM_V7S;
6070529bebd26e drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-08-11  752  			ias =3D min(ias, 32UL);
6070529bebd26e drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-08-11  753  			oas =3D min(oas, 32UL);
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  754  		}
abfd6fe0cd535d drivers/iommu/arm-smmu.c              Will Deacon       2019=
-07-02  755  		smmu_domain->flush_ops =3D &arm_smmu_s1_tlb_ops;
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  756  		break;
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  757  	case ARM_SMMU_DOMAIN_NESTED:
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  758  		/*
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  759  		 * We will likely want to change this if/when KVM gets
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  760  		 * involved.
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  761  		 */
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  762  	case ARM_SMMU_DOMAIN_S2:
9c5c92e35cf5c4 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  763  		cfg->cbar =3D CBAR_TYPE_S2_TRANS;
9c5c92e35cf5c4 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  764  		start =3D 0;
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  765  		ias =3D smmu->ipa_size;
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  766  		oas =3D smmu->pa_size;
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  767  		if (cfg->fmt =3D=3D ARM_SMMU_CTX_FMT_AARCH64) {
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  768  			fmt =3D ARM_64_LPAE_S2;
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  769  		} else {
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  770  			fmt =3D ARM_32_LPAE_S2;
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  771  			ias =3D min(ias, 40UL);
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  772  			oas =3D min(oas, 40UL);
7602b8710645da drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-28  773  		}
11febfca241965 drivers/iommu/arm-smmu.c              Robin Murphy      2017=
-03-30  774  		if (smmu->version =3D=3D ARM_SMMU_V2)
abfd6fe0cd535d drivers/iommu/arm-smmu.c              Will Deacon       2019=
-07-02  775  			smmu_domain->flush_ops =3D &arm_smmu_s2_tlb_ops_v2;
11febfca241965 drivers/iommu/arm-smmu.c              Robin Murphy      2017=
-03-30  776  		else
abfd6fe0cd535d drivers/iommu/arm-smmu.c              Will Deacon       2019=
-07-02  777  			smmu_domain->flush_ops =3D &arm_smmu_s2_tlb_ops_v1;
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  778  		break;
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  779  	default:
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  780  		ret =3D -EINVAL;
c752ce45b213de drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  781  		goto out_unlock;
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  782  	}
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  783  	ret =3D __arm_smmu_alloc_bitmap(smmu->context_map, start,
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  784  				      smmu->num_context_banks);
287980e49ffc0f drivers/iommu/arm-smmu.c              Arnd Bergmann     2016=
-05-27  785  	if (ret < 0)
a18037b27ebd23 drivers/iommu/arm-smmu.c              Mitchel Humpherys 2014=
-07-30  786  		goto out_unlock;
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  787  =

44680eedf9409d drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  788  	cfg->cbndx =3D ret;
b7862e3559f9ab drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-04-13  789  	if (smmu->version < ARM_SMMU_V2) {
44680eedf9409d drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  790  		cfg->irptndx =3D atomic_inc_return(&smmu->irptndx);
44680eedf9409d drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  791  		cfg->irptndx %=3D smmu->num_context_irqs;
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  792  	} else {
44680eedf9409d drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  793  		cfg->irptndx =3D cfg->cbndx;
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  794  	}
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  795  =

280b683ceaceb7 drivers/iommu/arm-smmu.c              Robin Murphy      2017=
-03-30  796  	if (smmu_domain->stage =3D=3D ARM_SMMU_DOMAIN_S2)
ba7e4a08bbf744 drivers/iommu/arm-smmu.c              Robin Murphy      2019=
-08-15  797  		cfg->vmid =3D cfg->cbndx + 1;
280b683ceaceb7 drivers/iommu/arm-smmu.c              Robin Murphy      2017=
-03-30  798  	else
ba7e4a08bbf744 drivers/iommu/arm-smmu.c              Robin Murphy      2019=
-08-15  799  		cfg->asid =3D cfg->cbndx;
ba7e4a08bbf744 drivers/iommu/arm-smmu.c              Robin Murphy      2019=
-08-15  800  =

ba7e4a08bbf744 drivers/iommu/arm-smmu.c              Robin Murphy      2019=
-08-15  801  	smmu_domain->smmu =3D smmu;
280b683ceaceb7 drivers/iommu/arm-smmu.c              Robin Murphy      2017=
-03-30  802  =

518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  803  	pgtbl_cfg =3D (struct io_pgtable_cfg) {
d546635731317a drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-05-09  804  		.pgsize_bitmap	=3D smmu->pgsize_bitmap,
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  805  		.ias		=3D ias,
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  806  		.oas		=3D oas,
4f41845b340783 drivers/iommu/arm-smmu.c              Will Deacon       2019=
-06-25  807  		.coherent_walk	=3D smmu->features & ARM_SMMU_FEAT_COHERENT_W=
ALK,
696bcfb7098620 drivers/iommu/arm-smmu.c              Robin Murphy      2019=
-09-18  808  		.tlb		=3D smmu_domain->flush_ops,
2df7a25ce4a790 drivers/iommu/arm-smmu.c              Robin Murphy      2015=
-07-29  809  		.iommu_dev	=3D smmu->dev,
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  810  	};
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  811  =

dd147a89f37d5a drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     2020=
-09-05  812  	if (smmu->impl && smmu->impl->init_context) {
dd147a89f37d5a drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     2020=
-09-05  813  		ret =3D smmu->impl->init_context(smmu_domain, &pgtbl_cfg);
dd147a89f37d5a drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     2020=
-09-05  814  		if (ret)
dd147a89f37d5a drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     2020=
-09-05  815  			goto out_clear_smmu;
dd147a89f37d5a drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     2020=
-09-05  816  	}
dd147a89f37d5a drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     2020=
-09-05  817  =

44f6876a00e83d drivers/iommu/arm-smmu.c              Robin Murphy      2018=
-09-20  818  	if (smmu_domain->non_strict)
44f6876a00e83d drivers/iommu/arm-smmu.c              Robin Murphy      2018=
-09-20  819  		pgtbl_cfg.quirks |=3D IO_PGTABLE_QUIRK_NON_STRICT;
44f6876a00e83d drivers/iommu/arm-smmu.c              Robin Murphy      2018=
-09-20  820  =

518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  821  	pgtbl_ops =3D alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_doma=
in);
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  822  	if (!pgtbl_ops) {
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  823  		ret =3D -ENOMEM;
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  824  		goto out_clear_smmu;
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  825  	}
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  826  =

d546635731317a drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-05-09  827  	/* Update the domain's page sizes to reflect the page table f=
ormat */
d546635731317a drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-05-09  828  	domain->pgsize_bitmap =3D pgtbl_cfg.pgsize_bitmap;
67f1a7a314a2c2 drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     2020=
-09-05  829  =

67f1a7a314a2c2 drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     2020=
-09-05  830  	if (pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
67f1a7a314a2c2 drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     2020=
-09-05 @831  		domain->geometry.aperture_start =3D ~0UL << ias;
67f1a7a314a2c2 drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     2020=
-09-05  832  		domain->geometry.aperture_end =3D ~0UL;
67f1a7a314a2c2 drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     2020=
-09-05  833  	} else {
455eb7d34ad11b drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-09-12  834  		domain->geometry.aperture_end =3D (1UL << ias) - 1;
67f1a7a314a2c2 drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     2020=
-09-05  835  	}
67f1a7a314a2c2 drivers/iommu/arm/arm-smmu/arm-smmu.c Jordan Crouse     2020=
-09-05  836  =

455eb7d34ad11b drivers/iommu/arm-smmu.c              Robin Murphy      2016=
-09-12  837  	domain->geometry.force_aperture =3D true;
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  838  =

518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  839  	/* Initialise the context bank with our page table cfg */
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  840  	arm_smmu_init_context_bank(smmu_domain, &pgtbl_cfg);
90df373cc62e52 drivers/iommu/arm-smmu.c              Robin Murphy      2017=
-08-08  841  	arm_smmu_write_context_bank(smmu, cfg->cbndx);
a18037b27ebd23 drivers/iommu/arm-smmu.c              Mitchel Humpherys 2014=
-07-30  842  =

518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  843  	/*
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  844  	 * Request context fault interrupt. Do this last to avoid the
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  845  	 * handler seeing a half-initialised domain state.
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  846  	 */
44680eedf9409d drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  847  	irq =3D smmu->irqs[smmu->num_global_irqs + cfg->irptndx];
aa7ec73297df57 drivers/iommu/arm-smmu.c              Krishna Reddy     2020=
-07-18  848  =

aa7ec73297df57 drivers/iommu/arm-smmu.c              Krishna Reddy     2020=
-07-18  849  	if (smmu->impl && smmu->impl->context_fault)
aa7ec73297df57 drivers/iommu/arm-smmu.c              Krishna Reddy     2020=
-07-18  850  		context_fault =3D smmu->impl->context_fault;
aa7ec73297df57 drivers/iommu/arm-smmu.c              Krishna Reddy     2020=
-07-18  851  	else
aa7ec73297df57 drivers/iommu/arm-smmu.c              Krishna Reddy     2020=
-07-18  852  		context_fault =3D arm_smmu_context_fault;
aa7ec73297df57 drivers/iommu/arm-smmu.c              Krishna Reddy     2020=
-07-18  853  =

aa7ec73297df57 drivers/iommu/arm-smmu.c              Krishna Reddy     2020=
-07-18  854  	ret =3D devm_request_irq(smmu->dev, irq, context_fault,
bee140044579fb drivers/iommu/arm-smmu.c              Peng Fan          2016=
-07-04  855  			       IRQF_SHARED, "arm-smmu-context-fault", domain);
287980e49ffc0f drivers/iommu/arm-smmu.c              Arnd Bergmann     2016=
-05-27  856  	if (ret < 0) {
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  857  		dev_err(smmu->dev, "failed to request context IRQ %d (%u)\n",
44680eedf9409d drivers/iommu/arm-smmu.c              Will Deacon       2014=
-06-25  858  			cfg->irptndx, irq);
fba6e960772b7b drivers/iommu/arm-smmu.c              Will Deacon       2020=
-01-10  859  		cfg->irptndx =3D ARM_SMMU_INVALID_IRPTNDX;
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  860  	}
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  861  =

518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  862  	mutex_unlock(&smmu_domain->init_mutex);
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  863  =

518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  864  	/* Publish page table ops for map/unmap */
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  865  	smmu_domain->pgtbl_ops =3D pgtbl_ops;
a9a1b0b53d8b7c drivers/iommu/arm-smmu.c              Will Deacon       2014=
-05-01  866  	return 0;
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  867  =

518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  868  out_clear_smmu:
6db7bfb431220d drivers/iommu/arm-smmu.c              Liu Xiang         2019=
-09-16  869  	__arm_smmu_free_bitmap(smmu->context_map, cfg->cbndx);
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  870  	smmu_domain->smmu =3D NULL;
a18037b27ebd23 drivers/iommu/arm-smmu.c              Mitchel Humpherys 2014=
-07-30  871  out_unlock:
518f7136244c16 drivers/iommu/arm-smmu.c              Will Deacon       2014=
-11-14  872  	mutex_unlock(&smmu_domain->init_mutex);
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  873  	return ret;
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  874  }
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon       2013=
-06-24  875  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6768521874478168978==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
rZK8AQA=
--===============6768521874478168978==--

