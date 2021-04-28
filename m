Content-Type: multipart/mixed; boundary="===============0471661930829763782=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/iommu/arm/arm-smmu/qcom_iommu.c:248 qcom_iommu_init_domain() warn: missing error code 'ret'
Date: Wed, 28 Apr 2021 14:29:34 +0300
Message-ID: <20210428112934.GB1959@kadam>
In-Reply-To: <202104260724.4WtK2AyM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0471661930829763782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Oops, sorry.  I didn't mean to sent that.

regards,
dan carpenter

On Wed, Apr 28, 2021 at 02:26:51PM +0300, Dan Carpenter wrote:
> CC: kbuild-all(a)lists.01.org
> CC: linux-kernel(a)vger.kernel.org
> TO: Will Deacon <will@kernel.org>
> =

> Hi Will,
> =

> First bad commit (maybe !=3D root cause):
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   9f4ad9e425a1d3b6a34617b8ea226d56a119a717
> commit: e86d1aa8b60f7ea18d36f50296d7d20eb2852e7e iommu/arm-smmu: Move Arm=
 SMMU drivers into their own subdirectory
> date:   9 months ago
> config: i386-randconfig-m021-20210426 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> smatch warnings:
> drivers/iommu/arm/arm-smmu/qcom_iommu.c:248 qcom_iommu_init_domain() warn=
: missing error code 'ret'
> =

> vim +/ret +248 drivers/iommu/arm/arm-smmu/qcom_iommu.c
> =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  234  =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  235  s=
tatic int qcom_iommu_init_domain(struct iommu_domain *domain,
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  236  	=
			  struct qcom_iommu_dev *qcom_iommu,
> 09b5dfff9ad68f drivers/iommu/qcom_iommu.c Joerg Roedel 2020-03-26  237  	=
			  struct device *dev)
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  238  {
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  239  	=
struct qcom_iommu_domain *qcom_domain =3D to_qcom_iommu_domain(domain);
> 09b5dfff9ad68f drivers/iommu/qcom_iommu.c Joerg Roedel 2020-03-26  240  	=
struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  241  	=
struct io_pgtable_ops *pgtbl_ops;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  242  	=
struct io_pgtable_cfg pgtbl_cfg;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  243  	=
int i, ret =3D 0;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  244  	=
u32 reg;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  245  =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  246  	=
mutex_lock(&qcom_domain->init_mutex);
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  247  	=
if (qcom_domain->iommu)
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09 @248  	=
	goto out_unlock;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  249  =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  250  	=
pgtbl_cfg =3D (struct io_pgtable_cfg) {
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  251  	=
	.pgsize_bitmap	=3D qcom_iommu_ops.pgsize_bitmap,
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  252  	=
	.ias		=3D 32,
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  253  	=
	.oas		=3D 40,
> 298f78895b0819 drivers/iommu/qcom_iommu.c Will Deacon  2019-07-02  254  	=
	.tlb		=3D &qcom_flush_ops,
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  255  	=
	.iommu_dev	=3D qcom_iommu->dev,
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  256  	=
};
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  257  =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  258  	=
qcom_domain->iommu =3D qcom_iommu;
> 09b5dfff9ad68f drivers/iommu/qcom_iommu.c Joerg Roedel 2020-03-26  259  	=
pgtbl_ops =3D alloc_io_pgtable_ops(ARM_32_LPAE_S1, &pgtbl_cfg, dev);
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  260  	=
if (!pgtbl_ops) {
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  261  	=
	dev_err(qcom_iommu->dev, "failed to allocate pagetable ops\n");
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  262  	=
	ret =3D -ENOMEM;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  263  	=
	goto out_clear_iommu;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  264  	}
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  265  =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  266  	=
/* Update the domain's page sizes to reflect the page table format */
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  267  	=
domain->pgsize_bitmap =3D pgtbl_cfg.pgsize_bitmap;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  268  	=
domain->geometry.aperture_end =3D (1ULL << pgtbl_cfg.ias) - 1;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  269  	=
domain->geometry.force_aperture =3D true;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  270  =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  271  	=
for (i =3D 0; i < fwspec->num_ids; i++) {
> 09b5dfff9ad68f drivers/iommu/qcom_iommu.c Joerg Roedel 2020-03-26  272  	=
	struct qcom_iommu_ctx *ctx =3D to_ctx(dev, fwspec->ids[i]);
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  273  =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  274  	=
	if (!ctx->secure_init) {
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  275  	=
		ret =3D qcom_scm_restore_sec_cfg(qcom_iommu->sec_id, ctx->asid);
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  276  	=
		if (ret) {
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  277  	=
			dev_err(qcom_iommu->dev, "secure init failed: %d\n", ret);
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  278  	=
			goto out_clear_iommu;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  279  	=
		}
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  280  	=
		ctx->secure_init =3D true;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  281  	=
	}
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  282  =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  283  	=
	/* TTBRs */
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  284  	=
	iommu_writeq(ctx, ARM_SMMU_CB_TTBR0,
> d1e5f26f14272b drivers/iommu/qcom_iommu.c Robin Murphy 2019-10-25  285  	=
			pgtbl_cfg.arm_lpae_s1_cfg.ttbr |
> fba6e960772b7b drivers/iommu/qcom_iommu.c Will Deacon  2020-01-10  286  	=
			FIELD_PREP(ARM_SMMU_TTBRn_ASID, ctx->asid));
> fb485eb18e632f drivers/iommu/qcom_iommu.c Robin Murphy 2019-10-25  287  	=
	iommu_writeq(ctx, ARM_SMMU_CB_TTBR1, 0);
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  288  =

> 620565a76bb316 drivers/iommu/qcom_iommu.c Robin Murphy 2019-08-15  289  	=
	/* TCR */
> 620565a76bb316 drivers/iommu/qcom_iommu.c Robin Murphy 2019-08-15  290  	=
	iommu_writel(ctx, ARM_SMMU_CB_TCR2,
> fb485eb18e632f drivers/iommu/qcom_iommu.c Robin Murphy 2019-10-25  291  	=
			arm_smmu_lpae_tcr2(&pgtbl_cfg));
> 620565a76bb316 drivers/iommu/qcom_iommu.c Robin Murphy 2019-08-15  292  	=
	iommu_writel(ctx, ARM_SMMU_CB_TCR,
> fba6e960772b7b drivers/iommu/qcom_iommu.c Will Deacon  2020-01-10  293  	=
		     arm_smmu_lpae_tcr(&pgtbl_cfg) | ARM_SMMU_TCR_EAE);
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  294  =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  295  	=
	/* MAIRs (stage-1 only) */
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  296  	=
	iommu_writel(ctx, ARM_SMMU_CB_S1_MAIR0,
> 205577ab6f7ade drivers/iommu/qcom_iommu.c Robin Murphy 2019-10-25  297  	=
			pgtbl_cfg.arm_lpae_s1_cfg.mair);
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  298  	=
	iommu_writel(ctx, ARM_SMMU_CB_S1_MAIR1,
> 205577ab6f7ade drivers/iommu/qcom_iommu.c Robin Murphy 2019-10-25  299  	=
			pgtbl_cfg.arm_lpae_s1_cfg.mair >> 32);
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  300  =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  301  	=
	/* SCTLR */
> fba6e960772b7b drivers/iommu/qcom_iommu.c Will Deacon  2020-01-10  302  	=
	reg =3D ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE |
> fba6e960772b7b drivers/iommu/qcom_iommu.c Will Deacon  2020-01-10  303  	=
	      ARM_SMMU_SCTLR_AFE | ARM_SMMU_SCTLR_TRE |
> fba6e960772b7b drivers/iommu/qcom_iommu.c Will Deacon  2020-01-10  304  	=
	      ARM_SMMU_SCTLR_M | ARM_SMMU_SCTLR_S1_ASIDPNE |
> fba6e960772b7b drivers/iommu/qcom_iommu.c Will Deacon  2020-01-10  305  	=
	      ARM_SMMU_SCTLR_CFCFG;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  306  =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  307  	=
	if (IS_ENABLED(CONFIG_BIG_ENDIAN))
> fba6e960772b7b drivers/iommu/qcom_iommu.c Will Deacon  2020-01-10  308  	=
		reg |=3D ARM_SMMU_SCTLR_E;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  309  =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  310  	=
	iommu_writel(ctx, ARM_SMMU_CB_SCTLR, reg);
> 049541e178d5b1 drivers/iommu/qcom_iommu.c Rob Clark    2017-11-03  311  =

> 049541e178d5b1 drivers/iommu/qcom_iommu.c Rob Clark    2017-11-03  312  	=
	ctx->domain =3D domain;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  313  	}
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  314  =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  315  	=
mutex_unlock(&qcom_domain->init_mutex);
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  316  =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  317  	=
/* Publish page table ops for map/unmap */
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  318  	=
qcom_domain->pgtbl_ops =3D pgtbl_ops;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  319  =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  320  	=
return 0;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  321  =

> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  322  o=
ut_clear_iommu:
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  323  	=
qcom_domain->iommu =3D NULL;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  324  o=
ut_unlock:
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  325  	=
mutex_unlock(&qcom_domain->init_mutex);
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  326  	=
return ret;
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  327  }
> 0ae349a0f33fb0 drivers/iommu/qcom_iommu.c Rob Clark    2017-08-09  328  =

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0471661930829763782==--

