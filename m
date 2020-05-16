Content-Type: multipart/mixed; boundary="===============0458809241505155378=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v13 4/8] iommu/vt-d: Add bind guest PASID support
Date: Sat, 16 May 2020 12:59:24 +0800
Message-ID: <202005161254.pLfxU66P%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0458809241505155378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1589410909-38925-5-git-send-email-jacob.jun.pan@linux.intel=
.com>
References: <1589410909-38925-5-git-send-email-jacob.jun.pan@linux.intel.=
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

>> drivers/iommu/intel-svm.c:342:49: sparse: sparse: non size-preserving in=
teger to pointer cast

# https://github.com/0day-ci/linux/commit/1503f7f9276292f51f303aae7bd50cb57=
fb16249
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 1503f7f9276292f51f303aae7bd50cb57fb16249
vim +342 drivers/iommu/intel-svm.c

2f26e0a9c9860db David Woodhouse 2015-09-09  224  =

034d473109e9078 Jacob Pan       2020-01-02  225  #define for_each_svm_dev(s=
dev, svm, d)			\
034d473109e9078 Jacob Pan       2020-01-02  226  	list_for_each_entry((sdev=
), &(svm)->devs, list)	\
034d473109e9078 Jacob Pan       2020-01-02  227  		if ((d) !=3D (sdev)->dev=
) {} else
034d473109e9078 Jacob Pan       2020-01-02  228  =

1503f7f9276292f Jacob Pan       2020-05-13  229  int intel_svm_bind_gpasid(=
struct iommu_domain *domain, struct device *dev,
1503f7f9276292f Jacob Pan       2020-05-13  230  			  struct iommu_gpasid_b=
ind_data *data)
1503f7f9276292f Jacob Pan       2020-05-13  231  {
1503f7f9276292f Jacob Pan       2020-05-13  232  	struct intel_iommu *iommu=
 =3D intel_svm_device_to_iommu(dev);
1503f7f9276292f Jacob Pan       2020-05-13  233  	struct dmar_domain *dmar_=
domain;
1503f7f9276292f Jacob Pan       2020-05-13  234  	struct intel_svm_dev *sde=
v;
1503f7f9276292f Jacob Pan       2020-05-13  235  	struct intel_svm *svm;
1503f7f9276292f Jacob Pan       2020-05-13  236  	int ret =3D 0;
1503f7f9276292f Jacob Pan       2020-05-13  237  =

1503f7f9276292f Jacob Pan       2020-05-13  238  	if (WARN_ON(!iommu) || !d=
ata)
1503f7f9276292f Jacob Pan       2020-05-13  239  		return -EINVAL;
1503f7f9276292f Jacob Pan       2020-05-13  240  =

1503f7f9276292f Jacob Pan       2020-05-13  241  	if (data->version !=3D IO=
MMU_GPASID_BIND_VERSION_1 ||
1503f7f9276292f Jacob Pan       2020-05-13  242  	    data->format !=3D IOM=
MU_PASID_FORMAT_INTEL_VTD)
1503f7f9276292f Jacob Pan       2020-05-13  243  		return -EINVAL;
1503f7f9276292f Jacob Pan       2020-05-13  244  =

1503f7f9276292f Jacob Pan       2020-05-13  245  	if (dev_is_pci(dev)) {
1503f7f9276292f Jacob Pan       2020-05-13  246  		/* VT-d supports devices=
 with full 20 bit PASIDs only */
1503f7f9276292f Jacob Pan       2020-05-13  247  		if (pci_max_pasids(to_pc=
i_dev(dev)) !=3D PASID_MAX)
1503f7f9276292f Jacob Pan       2020-05-13  248  			return -EINVAL;
1503f7f9276292f Jacob Pan       2020-05-13  249  	} else {
1503f7f9276292f Jacob Pan       2020-05-13  250  		return -ENOTSUPP;
1503f7f9276292f Jacob Pan       2020-05-13  251  	}
1503f7f9276292f Jacob Pan       2020-05-13  252  =

1503f7f9276292f Jacob Pan       2020-05-13  253  	/*
1503f7f9276292f Jacob Pan       2020-05-13  254  	 * We only check host PAS=
ID range, we have no knowledge to check
1503f7f9276292f Jacob Pan       2020-05-13  255  	 * guest PASID range.
1503f7f9276292f Jacob Pan       2020-05-13  256  	 */
1503f7f9276292f Jacob Pan       2020-05-13  257  	if (data->hpasid <=3D 0 |=
| data->hpasid >=3D PASID_MAX)
1503f7f9276292f Jacob Pan       2020-05-13  258  		return -EINVAL;
1503f7f9276292f Jacob Pan       2020-05-13  259  =

1503f7f9276292f Jacob Pan       2020-05-13  260  	dmar_domain =3D to_dmar_d=
omain(domain);
1503f7f9276292f Jacob Pan       2020-05-13  261  =

1503f7f9276292f Jacob Pan       2020-05-13  262  	mutex_lock(&pasid_mutex);
1503f7f9276292f Jacob Pan       2020-05-13  263  	svm =3D ioasid_find(NULL,=
 data->hpasid, NULL);
1503f7f9276292f Jacob Pan       2020-05-13  264  	if (IS_ERR(svm)) {
1503f7f9276292f Jacob Pan       2020-05-13  265  		ret =3D PTR_ERR(svm);
1503f7f9276292f Jacob Pan       2020-05-13  266  		goto out;
1503f7f9276292f Jacob Pan       2020-05-13  267  	}
1503f7f9276292f Jacob Pan       2020-05-13  268  =

1503f7f9276292f Jacob Pan       2020-05-13  269  	if (svm) {
1503f7f9276292f Jacob Pan       2020-05-13  270  		/*
1503f7f9276292f Jacob Pan       2020-05-13  271  		 * If we found svm for t=
he PASID, there must be at
1503f7f9276292f Jacob Pan       2020-05-13  272  		 * least one device bond=
, otherwise svm should be freed.
1503f7f9276292f Jacob Pan       2020-05-13  273  		 */
1503f7f9276292f Jacob Pan       2020-05-13  274  		if (WARN_ON(list_empty(&=
svm->devs))) {
1503f7f9276292f Jacob Pan       2020-05-13  275  			ret =3D -EINVAL;
1503f7f9276292f Jacob Pan       2020-05-13  276  			goto out;
1503f7f9276292f Jacob Pan       2020-05-13  277  		}
1503f7f9276292f Jacob Pan       2020-05-13  278  =

1503f7f9276292f Jacob Pan       2020-05-13  279  		for_each_svm_dev(sdev, s=
vm, dev) {
1503f7f9276292f Jacob Pan       2020-05-13  280  			/*
1503f7f9276292f Jacob Pan       2020-05-13  281  			 * For devices with aux=
 domains, we should allow multiple
1503f7f9276292f Jacob Pan       2020-05-13  282  			 * bind calls with the =
same PASID and pdev.
1503f7f9276292f Jacob Pan       2020-05-13  283  			 */
1503f7f9276292f Jacob Pan       2020-05-13  284  			if (iommu_dev_feature_e=
nabled(dev, IOMMU_DEV_FEAT_AUX)) {
1503f7f9276292f Jacob Pan       2020-05-13  285  				sdev->users++;
1503f7f9276292f Jacob Pan       2020-05-13  286  			} else {
1503f7f9276292f Jacob Pan       2020-05-13  287  				dev_warn_ratelimited(d=
ev, "Already bound with PASID %u\n",
1503f7f9276292f Jacob Pan       2020-05-13  288  						svm->pasid);
1503f7f9276292f Jacob Pan       2020-05-13  289  				ret =3D -EBUSY;
1503f7f9276292f Jacob Pan       2020-05-13  290  			}
1503f7f9276292f Jacob Pan       2020-05-13  291  			goto out;
1503f7f9276292f Jacob Pan       2020-05-13  292  		}
1503f7f9276292f Jacob Pan       2020-05-13  293  	} else {
1503f7f9276292f Jacob Pan       2020-05-13  294  		/* We come here when PAS=
ID has never been bond to a device. */
1503f7f9276292f Jacob Pan       2020-05-13  295  		svm =3D kzalloc(sizeof(*=
svm), GFP_KERNEL);
1503f7f9276292f Jacob Pan       2020-05-13  296  		if (!svm) {
1503f7f9276292f Jacob Pan       2020-05-13  297  			ret =3D -ENOMEM;
1503f7f9276292f Jacob Pan       2020-05-13  298  			goto out;
1503f7f9276292f Jacob Pan       2020-05-13  299  		}
1503f7f9276292f Jacob Pan       2020-05-13  300  		/* REVISIT: upper layer/=
VFIO can track host process that bind
1503f7f9276292f Jacob Pan       2020-05-13  301  		 * the PASID. ioasid_set=
 =3D mm might be sufficient for vfio to
1503f7f9276292f Jacob Pan       2020-05-13  302  		 * check pasid VMM owner=
ship. We can drop the following line
1503f7f9276292f Jacob Pan       2020-05-13  303  		 * once VFIO and IOASID =
set check is in place.
1503f7f9276292f Jacob Pan       2020-05-13  304  		 */
1503f7f9276292f Jacob Pan       2020-05-13  305  		svm->mm =3D get_task_mm(=
current);
1503f7f9276292f Jacob Pan       2020-05-13  306  		svm->pasid =3D data->hpa=
sid;
1503f7f9276292f Jacob Pan       2020-05-13  307  		if (data->flags & IOMMU_=
SVA_GPASID_VAL) {
1503f7f9276292f Jacob Pan       2020-05-13  308  			svm->gpasid =3D data->g=
pasid;
1503f7f9276292f Jacob Pan       2020-05-13  309  			svm->flags |=3D SVM_FLA=
G_GUEST_PASID;
1503f7f9276292f Jacob Pan       2020-05-13  310  		}
1503f7f9276292f Jacob Pan       2020-05-13  311  		ioasid_set_data(data->hp=
asid, svm);
1503f7f9276292f Jacob Pan       2020-05-13  312  		INIT_LIST_HEAD_RCU(&svm-=
>devs);
1503f7f9276292f Jacob Pan       2020-05-13  313  		mmput(svm->mm);
1503f7f9276292f Jacob Pan       2020-05-13  314  	}
1503f7f9276292f Jacob Pan       2020-05-13  315  	sdev =3D kzalloc(sizeof(*=
sdev), GFP_KERNEL);
1503f7f9276292f Jacob Pan       2020-05-13  316  	if (!sdev) {
1503f7f9276292f Jacob Pan       2020-05-13  317  		ret =3D -ENOMEM;
1503f7f9276292f Jacob Pan       2020-05-13  318  		goto out;
1503f7f9276292f Jacob Pan       2020-05-13  319  	}
1503f7f9276292f Jacob Pan       2020-05-13  320  	sdev->dev =3D dev;
1503f7f9276292f Jacob Pan       2020-05-13  321  =

1503f7f9276292f Jacob Pan       2020-05-13  322  	/* Only count users if de=
vice has aux domains */
1503f7f9276292f Jacob Pan       2020-05-13  323  	if (iommu_dev_feature_ena=
bled(dev, IOMMU_DEV_FEAT_AUX))
1503f7f9276292f Jacob Pan       2020-05-13  324  		sdev->users =3D 1;
1503f7f9276292f Jacob Pan       2020-05-13  325  =

1503f7f9276292f Jacob Pan       2020-05-13  326  	/* Set up device context =
entry for PASID if not enabled already */
1503f7f9276292f Jacob Pan       2020-05-13  327  	ret =3D intel_iommu_enabl=
e_pasid(iommu, sdev->dev);
1503f7f9276292f Jacob Pan       2020-05-13  328  	if (ret) {
1503f7f9276292f Jacob Pan       2020-05-13  329  		dev_err_ratelimited(dev,=
 "Failed to enable PASID capability\n");
1503f7f9276292f Jacob Pan       2020-05-13  330  		kfree(sdev);
1503f7f9276292f Jacob Pan       2020-05-13  331  		goto out;
1503f7f9276292f Jacob Pan       2020-05-13  332  	}
1503f7f9276292f Jacob Pan       2020-05-13  333  =

1503f7f9276292f Jacob Pan       2020-05-13  334  	/*
1503f7f9276292f Jacob Pan       2020-05-13  335  	 * PASID table is per dev=
ice for better security. Therefore, for
1503f7f9276292f Jacob Pan       2020-05-13  336  	 * each bind of a new dev=
ice even with an existing PASID, we need to
1503f7f9276292f Jacob Pan       2020-05-13  337  	 * call the nested mode s=
etup function here.
1503f7f9276292f Jacob Pan       2020-05-13  338  	 */
1503f7f9276292f Jacob Pan       2020-05-13  339  	spin_lock(&iommu->lock);
1503f7f9276292f Jacob Pan       2020-05-13  340  	ret =3D intel_pasid_setup=
_nested(iommu,
1503f7f9276292f Jacob Pan       2020-05-13  341  				       dev,
1503f7f9276292f Jacob Pan       2020-05-13 @342  				       (pgd_t *)data->=
gpgd,
1503f7f9276292f Jacob Pan       2020-05-13  343  				       data->hpasid,
1503f7f9276292f Jacob Pan       2020-05-13  344  				       &data->vtd,
1503f7f9276292f Jacob Pan       2020-05-13  345  				       dmar_domain,
1503f7f9276292f Jacob Pan       2020-05-13  346  				       data->addr_widt=
h);
1503f7f9276292f Jacob Pan       2020-05-13  347  	spin_unlock(&iommu->lock);
1503f7f9276292f Jacob Pan       2020-05-13  348  	if (ret) {
1503f7f9276292f Jacob Pan       2020-05-13  349  		dev_err_ratelimited(dev,=
 "Failed to set up PASID %llu in nested mode, Err %d\n",
1503f7f9276292f Jacob Pan       2020-05-13  350  				    data->hpasid, ret);
1503f7f9276292f Jacob Pan       2020-05-13  351  		/*
1503f7f9276292f Jacob Pan       2020-05-13  352  		 * PASID entry should be=
 in cleared state if nested mode
1503f7f9276292f Jacob Pan       2020-05-13  353  		 * set up failed. So we =
only need to clear IOASID tracking
1503f7f9276292f Jacob Pan       2020-05-13  354  		 * data such that free c=
all will succeed.
1503f7f9276292f Jacob Pan       2020-05-13  355  		 */
1503f7f9276292f Jacob Pan       2020-05-13  356  		kfree(sdev);
1503f7f9276292f Jacob Pan       2020-05-13  357  		goto out;
1503f7f9276292f Jacob Pan       2020-05-13  358  	}
1503f7f9276292f Jacob Pan       2020-05-13  359  =

1503f7f9276292f Jacob Pan       2020-05-13  360  	svm->flags |=3D SVM_FLAG_=
GUEST_MODE;
1503f7f9276292f Jacob Pan       2020-05-13  361  =

1503f7f9276292f Jacob Pan       2020-05-13  362  	init_rcu_head(&sdev->rcu);
1503f7f9276292f Jacob Pan       2020-05-13  363  	list_add_rcu(&sdev->list,=
 &svm->devs);
1503f7f9276292f Jacob Pan       2020-05-13  364   out:
1503f7f9276292f Jacob Pan       2020-05-13  365  	if (list_empty(&svm->devs=
)) {
1503f7f9276292f Jacob Pan       2020-05-13  366  		ioasid_set_data(data->hp=
asid, NULL);
1503f7f9276292f Jacob Pan       2020-05-13  367  		kfree(svm);
1503f7f9276292f Jacob Pan       2020-05-13  368  	}
1503f7f9276292f Jacob Pan       2020-05-13  369  =

1503f7f9276292f Jacob Pan       2020-05-13  370  	mutex_unlock(&pasid_mutex=
);
1503f7f9276292f Jacob Pan       2020-05-13  371  	return ret;
1503f7f9276292f Jacob Pan       2020-05-13  372  }
1503f7f9276292f Jacob Pan       2020-05-13  373  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0458809241505155378==--

