Content-Type: multipart/mixed; boundary="===============2331601657187025616=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/arm/arm-smmu/arm-smmu.c:682 arm_smmu_init_domain_context() warn: missing error code 'ret'
Date: Tue, 12 Jan 2021 21:14:15 +0800
Message-ID: <202101122105.svfhkcyO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2331601657187025616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Will Deacon <will@kernel.org>

Hi Will,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a0d54b4f5b219fb31f0776e9f53aa137e78ae431
commit: e86d1aa8b60f7ea18d36f50296d7d20eb2852e7e iommu/arm-smmu: Move Arm S=
MMU drivers into their own subdirectory
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-m031-20210112 (attached as .config)
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iommu/arm/arm-smmu/arm-smmu.c:682 arm_smmu_init_domain_context() wa=
rn: missing error code 'ret'
drivers/iommu/arm/arm-smmu/arm-smmu.c:1843 arm_smmu_device_cfg_probe() warn=
: should '2 * size << smmu->pgshift' be a 64 bit type?

vim +/ret +682 drivers/iommu/arm/arm-smmu/arm-smmu.c

45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  662=
  =

45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  663=
  static int arm_smmu_init_domain_context(struct iommu_domain *domain,
44680eedf9409daf drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  664=
  					struct arm_smmu_device *smmu)
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  665=
  {
a18037b27ebd23ed drivers/iommu/arm-smmu.c Mitchel Humpherys 2014-07-30  666=
  	int irq, start, ret =3D 0;
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  667=
  	unsigned long ias, oas;
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  668=
  	struct io_pgtable_ops *pgtbl_ops;
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  669=
  	struct io_pgtable_cfg pgtbl_cfg;
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  670=
  	enum io_pgtable_fmt fmt;
1d672638fca24db2 drivers/iommu/arm-smmu.c Joerg Roedel      2015-03-26  671=
  	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
44680eedf9409daf drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  672=
  	struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
aa7ec73297df57a8 drivers/iommu/arm-smmu.c Krishna Reddy     2020-07-18  673=
  	irqreturn_t (*context_fault)(int irq, void *dev);
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  674=
  =

518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  675=
  	mutex_lock(&smmu_domain->init_mutex);
a18037b27ebd23ed drivers/iommu/arm-smmu.c Mitchel Humpherys 2014-07-30  676=
  	if (smmu_domain->smmu)
a18037b27ebd23ed drivers/iommu/arm-smmu.c Mitchel Humpherys 2014-07-30  677=
  		goto out_unlock;
a18037b27ebd23ed drivers/iommu/arm-smmu.c Mitchel Humpherys 2014-07-30  678=
  =

61bc671179f19060 drivers/iommu/arm-smmu.c Will Deacon       2017-01-06  679=
  	if (domain->type =3D=3D IOMMU_DOMAIN_IDENTITY) {
61bc671179f19060 drivers/iommu/arm-smmu.c Will Deacon       2017-01-06  680=
  		smmu_domain->stage =3D ARM_SMMU_DOMAIN_BYPASS;
61bc671179f19060 drivers/iommu/arm-smmu.c Will Deacon       2017-01-06  681=
  		smmu_domain->smmu =3D smmu;
61bc671179f19060 drivers/iommu/arm-smmu.c Will Deacon       2017-01-06 @682=
  		goto out_unlock;
61bc671179f19060 drivers/iommu/arm-smmu.c Will Deacon       2017-01-06  683=
  	}
61bc671179f19060 drivers/iommu/arm-smmu.c Will Deacon       2017-01-06  684=
  =

45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  685=
  	/*
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  686=
  	 * Mapping the requested stage onto what we support is surprisingly
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  687=
  	 * complicated, mainly because the spec allows S1+S2 SMMUs without
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  688=
  	 * support for nested translation. That means we end up with the
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  689=
  	 * following table:
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  690=
  	 *
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  691=
  	 * Requested        Supported        Actual
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  692=
  	 *     S1               N              S1
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  693=
  	 *     S1             S1+S2            S1
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  694=
  	 *     S1               S2             S2
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  695=
  	 *     S1               S1             S1
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  696=
  	 *     N                N              N
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  697=
  	 *     N              S1+S2            S2
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  698=
  	 *     N                S2             S2
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  699=
  	 *     N                S1             S1
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  700=
  	 *
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  701=
  	 * Note that you can't actually request stage-2 mappings.
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  702=
  	 */
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  703=
  	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1))
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  704=
  		smmu_domain->stage =3D ARM_SMMU_DOMAIN_S2;
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  705=
  	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  706=
  		smmu_domain->stage =3D ARM_SMMU_DOMAIN_S1;
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  707=
  =

7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  708=
  	/*
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  709=
  	 * Choosing a suitable context format is even more fiddly. Until we
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  710=
  	 * grow some way for the caller to express a preference, and/or move
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  711=
  	 * the decision into the io-pgtable code where it arguably belongs,
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  712=
  	 * just aim for the closest thing to the rest of the system, and hope
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  713=
  	 * that the hardware isn't esoteric enough that we can't assume AArch64
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  714=
  	 * support to be a superset of AArch32 support...
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  715=
  	 */
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  716=
  	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_L)
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  717=
  		cfg->fmt =3D ARM_SMMU_CTX_FMT_AARCH32_L;
6070529bebd26e0a drivers/iommu/arm-smmu.c Robin Murphy      2016-08-11  718=
  	if (IS_ENABLED(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) &&
6070529bebd26e0a drivers/iommu/arm-smmu.c Robin Murphy      2016-08-11  719=
  	    !IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_ARM_LPAE) &&
6070529bebd26e0a drivers/iommu/arm-smmu.c Robin Murphy      2016-08-11  720=
  	    (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_S) &&
6070529bebd26e0a drivers/iommu/arm-smmu.c Robin Murphy      2016-08-11  721=
  	    (smmu_domain->stage =3D=3D ARM_SMMU_DOMAIN_S1))
6070529bebd26e0a drivers/iommu/arm-smmu.c Robin Murphy      2016-08-11  722=
  		cfg->fmt =3D ARM_SMMU_CTX_FMT_AARCH32_S;
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  723=
  	if ((IS_ENABLED(CONFIG_64BIT) || cfg->fmt =3D=3D ARM_SMMU_CTX_FMT_NONE) =
&&
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  724=
  	    (smmu->features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  725=
  			       ARM_SMMU_FEAT_FMT_AARCH64_16K |
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  726=
  			       ARM_SMMU_FEAT_FMT_AARCH64_4K)))
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  727=
  		cfg->fmt =3D ARM_SMMU_CTX_FMT_AARCH64;
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  728=
  =

7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  729=
  	if (cfg->fmt =3D=3D ARM_SMMU_CTX_FMT_NONE) {
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  730=
  		ret =3D -EINVAL;
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  731=
  		goto out_unlock;
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  732=
  	}
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  733=
  =

c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  734=
  	switch (smmu_domain->stage) {
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  735=
  	case ARM_SMMU_DOMAIN_S1:
44680eedf9409daf drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  736=
  		cfg->cbar =3D CBAR_TYPE_S1_TRANS_S2_BYPASS;
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  737=
  		start =3D smmu->num_s2_context_banks;
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  738=
  		ias =3D smmu->va_size;
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  739=
  		oas =3D smmu->ipa_size;
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  740=
  		if (cfg->fmt =3D=3D ARM_SMMU_CTX_FMT_AARCH64) {
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  741=
  			fmt =3D ARM_64_LPAE_S1;
6070529bebd26e0a drivers/iommu/arm-smmu.c Robin Murphy      2016-08-11  742=
  		} else if (cfg->fmt =3D=3D ARM_SMMU_CTX_FMT_AARCH32_L) {
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  743=
  			fmt =3D ARM_32_LPAE_S1;
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  744=
  			ias =3D min(ias, 32UL);
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  745=
  			oas =3D min(oas, 40UL);
6070529bebd26e0a drivers/iommu/arm-smmu.c Robin Murphy      2016-08-11  746=
  		} else {
6070529bebd26e0a drivers/iommu/arm-smmu.c Robin Murphy      2016-08-11  747=
  			fmt =3D ARM_V7S;
6070529bebd26e0a drivers/iommu/arm-smmu.c Robin Murphy      2016-08-11  748=
  			ias =3D min(ias, 32UL);
6070529bebd26e0a drivers/iommu/arm-smmu.c Robin Murphy      2016-08-11  749=
  			oas =3D min(oas, 32UL);
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  750=
  		}
abfd6fe0cd535d31 drivers/iommu/arm-smmu.c Will Deacon       2019-07-02  751=
  		smmu_domain->flush_ops =3D &arm_smmu_s1_tlb_ops;
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  752=
  		break;
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  753=
  	case ARM_SMMU_DOMAIN_NESTED:
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  754=
  		/*
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  755=
  		 * We will likely want to change this if/when KVM gets
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  756=
  		 * involved.
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  757=
  		 */
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  758=
  	case ARM_SMMU_DOMAIN_S2:
9c5c92e35cf5c4f7 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  759=
  		cfg->cbar =3D CBAR_TYPE_S2_TRANS;
9c5c92e35cf5c4f7 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  760=
  		start =3D 0;
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  761=
  		ias =3D smmu->ipa_size;
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  762=
  		oas =3D smmu->pa_size;
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  763=
  		if (cfg->fmt =3D=3D ARM_SMMU_CTX_FMT_AARCH64) {
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  764=
  			fmt =3D ARM_64_LPAE_S2;
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  765=
  		} else {
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  766=
  			fmt =3D ARM_32_LPAE_S2;
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  767=
  			ias =3D min(ias, 40UL);
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  768=
  			oas =3D min(oas, 40UL);
7602b8710645da48 drivers/iommu/arm-smmu.c Robin Murphy      2016-04-28  769=
  		}
11febfca2419652f drivers/iommu/arm-smmu.c Robin Murphy      2017-03-30  770=
  		if (smmu->version =3D=3D ARM_SMMU_V2)
abfd6fe0cd535d31 drivers/iommu/arm-smmu.c Will Deacon       2019-07-02  771=
  			smmu_domain->flush_ops =3D &arm_smmu_s2_tlb_ops_v2;
11febfca2419652f drivers/iommu/arm-smmu.c Robin Murphy      2017-03-30  772=
  		else
abfd6fe0cd535d31 drivers/iommu/arm-smmu.c Will Deacon       2019-07-02  773=
  			smmu_domain->flush_ops =3D &arm_smmu_s2_tlb_ops_v1;
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  774=
  		break;
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  775=
  	default:
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  776=
  		ret =3D -EINVAL;
c752ce45b213de85 drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  777=
  		goto out_unlock;
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  778=
  	}
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  779=
  	ret =3D __arm_smmu_alloc_bitmap(smmu->context_map, start,
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  780=
  				      smmu->num_context_banks);
287980e49ffc0f6d drivers/iommu/arm-smmu.c Arnd Bergmann     2016-05-27  781=
  	if (ret < 0)
a18037b27ebd23ed drivers/iommu/arm-smmu.c Mitchel Humpherys 2014-07-30  782=
  		goto out_unlock;
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  783=
  =

44680eedf9409daf drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  784=
  	cfg->cbndx =3D ret;
b7862e3559f9ab4a drivers/iommu/arm-smmu.c Robin Murphy      2016-04-13  785=
  	if (smmu->version < ARM_SMMU_V2) {
44680eedf9409daf drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  786=
  		cfg->irptndx =3D atomic_inc_return(&smmu->irptndx);
44680eedf9409daf drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  787=
  		cfg->irptndx %=3D smmu->num_context_irqs;
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  788=
  	} else {
44680eedf9409daf drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  789=
  		cfg->irptndx =3D cfg->cbndx;
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  790=
  	}
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  791=
  =

280b683ceaceb750 drivers/iommu/arm-smmu.c Robin Murphy      2017-03-30  792=
  	if (smmu_domain->stage =3D=3D ARM_SMMU_DOMAIN_S2)
ba7e4a08bbf74416 drivers/iommu/arm-smmu.c Robin Murphy      2019-08-15  793=
  		cfg->vmid =3D cfg->cbndx + 1;
280b683ceaceb750 drivers/iommu/arm-smmu.c Robin Murphy      2017-03-30  794=
  	else
ba7e4a08bbf74416 drivers/iommu/arm-smmu.c Robin Murphy      2019-08-15  795=
  		cfg->asid =3D cfg->cbndx;
ba7e4a08bbf74416 drivers/iommu/arm-smmu.c Robin Murphy      2019-08-15  796=
  =

ba7e4a08bbf74416 drivers/iommu/arm-smmu.c Robin Murphy      2019-08-15  797=
  	smmu_domain->smmu =3D smmu;
ba7e4a08bbf74416 drivers/iommu/arm-smmu.c Robin Murphy      2019-08-15  798=
  	if (smmu->impl && smmu->impl->init_context) {
ba7e4a08bbf74416 drivers/iommu/arm-smmu.c Robin Murphy      2019-08-15  799=
  		ret =3D smmu->impl->init_context(smmu_domain);
ba7e4a08bbf74416 drivers/iommu/arm-smmu.c Robin Murphy      2019-08-15  800=
  		if (ret)
ba7e4a08bbf74416 drivers/iommu/arm-smmu.c Robin Murphy      2019-08-15  801=
  			goto out_unlock;
ba7e4a08bbf74416 drivers/iommu/arm-smmu.c Robin Murphy      2019-08-15  802=
  	}
280b683ceaceb750 drivers/iommu/arm-smmu.c Robin Murphy      2017-03-30  803=
  =

518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  804=
  	pgtbl_cfg =3D (struct io_pgtable_cfg) {
d546635731317a5f drivers/iommu/arm-smmu.c Robin Murphy      2016-05-09  805=
  		.pgsize_bitmap	=3D smmu->pgsize_bitmap,
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  806=
  		.ias		=3D ias,
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  807=
  		.oas		=3D oas,
4f41845b340783ea drivers/iommu/arm-smmu.c Will Deacon       2019-06-25  808=
  		.coherent_walk	=3D smmu->features & ARM_SMMU_FEAT_COHERENT_WALK,
696bcfb709862077 drivers/iommu/arm-smmu.c Robin Murphy      2019-09-18  809=
  		.tlb		=3D smmu_domain->flush_ops,
2df7a25ce4a79092 drivers/iommu/arm-smmu.c Robin Murphy      2015-07-29  810=
  		.iommu_dev	=3D smmu->dev,
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  811=
  	};
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  812=
  =

44f6876a00e83df5 drivers/iommu/arm-smmu.c Robin Murphy      2018-09-20  813=
  	if (smmu_domain->non_strict)
44f6876a00e83df5 drivers/iommu/arm-smmu.c Robin Murphy      2018-09-20  814=
  		pgtbl_cfg.quirks |=3D IO_PGTABLE_QUIRK_NON_STRICT;
44f6876a00e83df5 drivers/iommu/arm-smmu.c Robin Murphy      2018-09-20  815=
  =

518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  816=
  	pgtbl_ops =3D alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  817=
  	if (!pgtbl_ops) {
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  818=
  		ret =3D -ENOMEM;
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  819=
  		goto out_clear_smmu;
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  820=
  	}
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  821=
  =

d546635731317a5f drivers/iommu/arm-smmu.c Robin Murphy      2016-05-09  822=
  	/* Update the domain's page sizes to reflect the page table format */
d546635731317a5f drivers/iommu/arm-smmu.c Robin Murphy      2016-05-09  823=
  	domain->pgsize_bitmap =3D pgtbl_cfg.pgsize_bitmap;
455eb7d34ad11b09 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  824=
  	domain->geometry.aperture_end =3D (1UL << ias) - 1;
455eb7d34ad11b09 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  825=
  	domain->geometry.force_aperture =3D true;
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  826=
  =

518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  827=
  	/* Initialise the context bank with our page table cfg */
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  828=
  	arm_smmu_init_context_bank(smmu_domain, &pgtbl_cfg);
90df373cc62e527b drivers/iommu/arm-smmu.c Robin Murphy      2017-08-08  829=
  	arm_smmu_write_context_bank(smmu, cfg->cbndx);
a18037b27ebd23ed drivers/iommu/arm-smmu.c Mitchel Humpherys 2014-07-30  830=
  =

518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  831=
  	/*
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  832=
  	 * Request context fault interrupt. Do this last to avoid the
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  833=
  	 * handler seeing a half-initialised domain state.
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  834=
  	 */
44680eedf9409daf drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  835=
  	irq =3D smmu->irqs[smmu->num_global_irqs + cfg->irptndx];
aa7ec73297df57a8 drivers/iommu/arm-smmu.c Krishna Reddy     2020-07-18  836=
  =

aa7ec73297df57a8 drivers/iommu/arm-smmu.c Krishna Reddy     2020-07-18  837=
  	if (smmu->impl && smmu->impl->context_fault)
aa7ec73297df57a8 drivers/iommu/arm-smmu.c Krishna Reddy     2020-07-18  838=
  		context_fault =3D smmu->impl->context_fault;
aa7ec73297df57a8 drivers/iommu/arm-smmu.c Krishna Reddy     2020-07-18  839=
  	else
aa7ec73297df57a8 drivers/iommu/arm-smmu.c Krishna Reddy     2020-07-18  840=
  		context_fault =3D arm_smmu_context_fault;
aa7ec73297df57a8 drivers/iommu/arm-smmu.c Krishna Reddy     2020-07-18  841=
  =

aa7ec73297df57a8 drivers/iommu/arm-smmu.c Krishna Reddy     2020-07-18  842=
  	ret =3D devm_request_irq(smmu->dev, irq, context_fault,
bee140044579fbfd drivers/iommu/arm-smmu.c Peng Fan          2016-07-04  843=
  			       IRQF_SHARED, "arm-smmu-context-fault", domain);
287980e49ffc0f6d drivers/iommu/arm-smmu.c Arnd Bergmann     2016-05-27  844=
  	if (ret < 0) {
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  845=
  		dev_err(smmu->dev, "failed to request context IRQ %d (%u)\n",
44680eedf9409daf drivers/iommu/arm-smmu.c Will Deacon       2014-06-25  846=
  			cfg->irptndx, irq);
fba6e960772b7b68 drivers/iommu/arm-smmu.c Will Deacon       2020-01-10  847=
  		cfg->irptndx =3D ARM_SMMU_INVALID_IRPTNDX;
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  848=
  	}
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  849=
  =

518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  850=
  	mutex_unlock(&smmu_domain->init_mutex);
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  851=
  =

518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  852=
  	/* Publish page table ops for map/unmap */
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  853=
  	smmu_domain->pgtbl_ops =3D pgtbl_ops;
a9a1b0b53d8b7ca6 drivers/iommu/arm-smmu.c Will Deacon       2014-05-01  854=
  	return 0;
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  855=
  =

518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  856=
  out_clear_smmu:
6db7bfb431220d78 drivers/iommu/arm-smmu.c Liu Xiang         2019-09-16  857=
  	__arm_smmu_free_bitmap(smmu->context_map, cfg->cbndx);
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  858=
  	smmu_domain->smmu =3D NULL;
a18037b27ebd23ed drivers/iommu/arm-smmu.c Mitchel Humpherys 2014-07-30  859=
  out_unlock:
518f7136244c1675 drivers/iommu/arm-smmu.c Will Deacon       2014-11-14  860=
  	mutex_unlock(&smmu_domain->init_mutex);
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  861=
  	return ret;
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  862=
  }
45ae7cff3684ab45 drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  863=
  =


:::::: The code at line 682 was first introduced by commit
:::::: 61bc671179f19060be883068b6d3d82ae0b24bc0 iommu/arm-smmu: Install byp=
ass S2CRs for IOMMU_DOMAIN_IDENTITY domains

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2331601657187025616==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2331601657187025616==--

