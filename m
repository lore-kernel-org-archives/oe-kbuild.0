Content-Type: multipart/mixed; boundary="===============2763096857843306380=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v13 3/8] iommu/vt-d: Add nested translation helper function
Date: Sat, 16 May 2020 05:11:59 +0800
Message-ID: <202005160522.pbziV3Eg%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2763096857843306380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1589410909-38925-4-git-send-email-jacob.jun.pan@linux.intel=
.com>
References: <1589410909-38925-4-git-send-email-jacob.jun.pan@linux.intel.=
com>
TO: Jacob Pan <jacob.jun.pan@linux.intel.com>

Hi Jacob,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.7-rc5 next-20200515]
[cannot apply to iommu/next linux/master]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Jacob-Pan/Nested-Shared-Vi=
rtual-Address-SVA-VT-d-support/20200514-070150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
24085f70a6e1b0cb647ec92623284641d8270637
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/iommu/intel-pasid.c:743:33: sparse: sparse: non size-preserving =
pointer to integer cast
   drivers/iommu/intel-pasid.c:744:17: sparse: sparse: non size-preserving =
pointer to integer cast
   drivers/iommu/intel-pasid.c:749:35: sparse: sparse: non size-preserving =
pointer to integer cast

# https://github.com/0day-ci/linux/commit/f7bb13d830a2527772eceb1fcb7d76a82=
e20ae72
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout f7bb13d830a2527772eceb1fcb7d76a82e20ae72
vim +743 drivers/iommu/intel-pasid.c

f7bb13d830a252 Jacob Pan 2020-05-13  664  =

f7bb13d830a252 Jacob Pan 2020-05-13  665  /**
f7bb13d830a252 Jacob Pan 2020-05-13  666   * intel_pasid_setup_nested() - S=
et up PASID entry for nested translation.
f7bb13d830a252 Jacob Pan 2020-05-13  667   * This could be used for guest s=
hared virtual address. In this case, the
f7bb13d830a252 Jacob Pan 2020-05-13  668   * first level page tables are us=
ed for GVA-GPA translation in the guest,
f7bb13d830a252 Jacob Pan 2020-05-13  669   * second level page tables are u=
sed for GPA-HPA translation.
f7bb13d830a252 Jacob Pan 2020-05-13  670   *
f7bb13d830a252 Jacob Pan 2020-05-13  671   * @iommu:      IOMMU which the d=
evice belong to
f7bb13d830a252 Jacob Pan 2020-05-13  672   * @dev:        Device to be set =
up for translation
f7bb13d830a252 Jacob Pan 2020-05-13  673   * @gpgd:       FLPTPTR: First Le=
vel Page translation pointer in GPA
f7bb13d830a252 Jacob Pan 2020-05-13  674   * @pasid:      PASID to be progr=
ammed in the device PASID table
f7bb13d830a252 Jacob Pan 2020-05-13  675   * @pasid_data: Additional PASID =
info from the guest bind request
f7bb13d830a252 Jacob Pan 2020-05-13  676   * @domain:     Domain info for s=
etting up second level page tables
f7bb13d830a252 Jacob Pan 2020-05-13  677   * @addr_width: Address width of =
the first level (guest)
f7bb13d830a252 Jacob Pan 2020-05-13  678   */
f7bb13d830a252 Jacob Pan 2020-05-13  679  int intel_pasid_setup_nested(stru=
ct intel_iommu *iommu, struct device *dev,
f7bb13d830a252 Jacob Pan 2020-05-13  680  			     pgd_t *gpgd, int pasid,
f7bb13d830a252 Jacob Pan 2020-05-13  681  			     struct iommu_gpasid_bind_=
data_vtd *pasid_data,
f7bb13d830a252 Jacob Pan 2020-05-13  682  			     struct dmar_domain *domai=
n, int addr_width)
f7bb13d830a252 Jacob Pan 2020-05-13  683  {
f7bb13d830a252 Jacob Pan 2020-05-13  684  	struct pasid_entry *pte;
f7bb13d830a252 Jacob Pan 2020-05-13  685  	struct dma_pte *pgd;
f7bb13d830a252 Jacob Pan 2020-05-13  686  	int ret =3D 0;
f7bb13d830a252 Jacob Pan 2020-05-13  687  	u64 pgd_val;
f7bb13d830a252 Jacob Pan 2020-05-13  688  	int agaw;
f7bb13d830a252 Jacob Pan 2020-05-13  689  	u16 did;
f7bb13d830a252 Jacob Pan 2020-05-13  690  =

f7bb13d830a252 Jacob Pan 2020-05-13  691  	if (!ecap_nest(iommu->ecap)) {
f7bb13d830a252 Jacob Pan 2020-05-13  692  		pr_err_ratelimited("IOMMU: %s: =
No nested translation support\n",
f7bb13d830a252 Jacob Pan 2020-05-13  693  				   iommu->name);
f7bb13d830a252 Jacob Pan 2020-05-13  694  		return -EINVAL;
f7bb13d830a252 Jacob Pan 2020-05-13  695  	}
f7bb13d830a252 Jacob Pan 2020-05-13  696  =

f7bb13d830a252 Jacob Pan 2020-05-13  697  	if (!(domain->flags & DOMAIN_FLA=
G_NESTING_MODE)) {
f7bb13d830a252 Jacob Pan 2020-05-13  698  		pr_err_ratelimited("Domain is n=
ot in nesting mode, %x\n",
f7bb13d830a252 Jacob Pan 2020-05-13  699  				   domain->flags);
f7bb13d830a252 Jacob Pan 2020-05-13  700  		return -EINVAL;
f7bb13d830a252 Jacob Pan 2020-05-13  701  	}
f7bb13d830a252 Jacob Pan 2020-05-13  702  =

f7bb13d830a252 Jacob Pan 2020-05-13  703  	pte =3D intel_pasid_get_entry(de=
v, pasid);
f7bb13d830a252 Jacob Pan 2020-05-13  704  	if (WARN_ON(!pte))
f7bb13d830a252 Jacob Pan 2020-05-13  705  		return -EINVAL;
f7bb13d830a252 Jacob Pan 2020-05-13  706  =

f7bb13d830a252 Jacob Pan 2020-05-13  707  	/*
f7bb13d830a252 Jacob Pan 2020-05-13  708  	 * Caller must ensure PASID entr=
y is not in use, i.e. not bind the
f7bb13d830a252 Jacob Pan 2020-05-13  709  	 * same PASID to the same device=
 twice.
f7bb13d830a252 Jacob Pan 2020-05-13  710  	 */
f7bb13d830a252 Jacob Pan 2020-05-13  711  	if (pasid_pte_is_present(pte))
f7bb13d830a252 Jacob Pan 2020-05-13  712  		return -EBUSY;
f7bb13d830a252 Jacob Pan 2020-05-13  713  =

f7bb13d830a252 Jacob Pan 2020-05-13  714  	pasid_clear_entry(pte);
f7bb13d830a252 Jacob Pan 2020-05-13  715  =

f7bb13d830a252 Jacob Pan 2020-05-13  716  	/* Sanity checking performed by =
caller to make sure address
f7bb13d830a252 Jacob Pan 2020-05-13  717  	 * width matching in two dimensi=
ons:
f7bb13d830a252 Jacob Pan 2020-05-13  718  	 * 1. CPU vs. IOMMU
f7bb13d830a252 Jacob Pan 2020-05-13  719  	 * 2. Guest vs. Host.
f7bb13d830a252 Jacob Pan 2020-05-13  720  	 */
f7bb13d830a252 Jacob Pan 2020-05-13  721  	switch (addr_width) {
f7bb13d830a252 Jacob Pan 2020-05-13  722  #ifdef CONFIG_X86
f7bb13d830a252 Jacob Pan 2020-05-13  723  	case ADDR_WIDTH_5LEVEL:
f7bb13d830a252 Jacob Pan 2020-05-13  724  		if (cpu_feature_enabled(X86_FEA=
TURE_LA57) &&
f7bb13d830a252 Jacob Pan 2020-05-13  725  		    cap_5lp_support(iommu->cap)=
) {
f7bb13d830a252 Jacob Pan 2020-05-13  726  			pasid_set_flpm(pte, 1);
f7bb13d830a252 Jacob Pan 2020-05-13  727  		} else {
f7bb13d830a252 Jacob Pan 2020-05-13  728  			dev_err_ratelimited(dev, "5-le=
vel paging not supported\n");
f7bb13d830a252 Jacob Pan 2020-05-13  729  			return -EINVAL;
f7bb13d830a252 Jacob Pan 2020-05-13  730  		}
f7bb13d830a252 Jacob Pan 2020-05-13  731  		break;
f7bb13d830a252 Jacob Pan 2020-05-13  732  #endif
f7bb13d830a252 Jacob Pan 2020-05-13  733  	case ADDR_WIDTH_4LEVEL:
f7bb13d830a252 Jacob Pan 2020-05-13  734  		pasid_set_flpm(pte, 0);
f7bb13d830a252 Jacob Pan 2020-05-13  735  		break;
f7bb13d830a252 Jacob Pan 2020-05-13  736  	default:
f7bb13d830a252 Jacob Pan 2020-05-13  737  		dev_err_ratelimited(dev, "Inval=
id guest address width %d\n",
f7bb13d830a252 Jacob Pan 2020-05-13  738  				    addr_width);
f7bb13d830a252 Jacob Pan 2020-05-13  739  		return -EINVAL;
f7bb13d830a252 Jacob Pan 2020-05-13  740  	}
f7bb13d830a252 Jacob Pan 2020-05-13  741  =

f7bb13d830a252 Jacob Pan 2020-05-13  742  	/* First level PGD is in GPA, mu=
st be supported by the second level */
f7bb13d830a252 Jacob Pan 2020-05-13 @743  	if ((unsigned long long)gpgd > d=
omain->max_addr) {

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2763096857843306380==--

