Content-Type: multipart/mixed; boundary="===============3698793001108578308=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [baolu:iommu/next/20200514 4/16] drivers/iommu/intel-svm.c:369 intel_svm_bind_gpasid() error: 'svm' dereferencing possible ERR_PTR()
Date: Thu, 14 May 2020 18:34:35 +0800
Message-ID: <202005141819.xsD3Ilze%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3698793001108578308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Baolu Lu <baolu.lu@intel.com>
TO: Lu Baolu <baolu.lu@linux.intel.com>

tree:   baolu/iommu/next/20200514
head:   28c528ddc9501f8caba71dba375bd1d35403dd4b
commit: 64e95c1afbadc5601bc100f6424b1848888613f7 [4/16] iommu/vt-d: Add bin=
d guest PASID support
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iommu/intel-svm.c:369 intel_svm_bind_gpasid() error: 'svm' derefere=
ncing possible ERR_PTR()

git remote add baolu git://bee.sh.intel.com/git/blu2/usb.git
git remote update baolu
git checkout 64e95c1afbadc5601bc100f6424b1848888613f7
vim +/svm +369 drivers/iommu/intel-svm.c

2f26e0a9c9860d David Woodhouse 2015-09-09  224  =

034d473109e907 Jacob Pan       2020-01-02  225  #define for_each_svm_dev(sd=
ev, svm, d)			\
034d473109e907 Jacob Pan       2020-01-02  226  	list_for_each_entry((sdev)=
, &(svm)->devs, list)	\
034d473109e907 Jacob Pan       2020-01-02  227  		if ((d) !=3D (sdev)->dev)=
 {} else
034d473109e907 Jacob Pan       2020-01-02  228  =

64e95c1afbadc5 Jacob Pan       2020-05-14  229  int intel_svm_bind_gpasid(s=
truct iommu_domain *domain, struct device *dev,
64e95c1afbadc5 Jacob Pan       2020-05-14  230  			  struct iommu_gpasid_bi=
nd_data *data)
64e95c1afbadc5 Jacob Pan       2020-05-14  231  {
64e95c1afbadc5 Jacob Pan       2020-05-14  232  	struct intel_iommu *iommu =
=3D intel_svm_device_to_iommu(dev);
64e95c1afbadc5 Jacob Pan       2020-05-14  233  	struct dmar_domain *dmar_d=
omain;
64e95c1afbadc5 Jacob Pan       2020-05-14  234  	struct intel_svm_dev *sdev;
64e95c1afbadc5 Jacob Pan       2020-05-14  235  	struct intel_svm *svm;
64e95c1afbadc5 Jacob Pan       2020-05-14  236  	int ret =3D 0;
64e95c1afbadc5 Jacob Pan       2020-05-14  237  =

64e95c1afbadc5 Jacob Pan       2020-05-14  238  	if (WARN_ON(!iommu) || !da=
ta)
64e95c1afbadc5 Jacob Pan       2020-05-14  239  		return -EINVAL;
64e95c1afbadc5 Jacob Pan       2020-05-14  240  =

64e95c1afbadc5 Jacob Pan       2020-05-14  241  	if (data->version !=3D IOM=
MU_GPASID_BIND_VERSION_1 ||
64e95c1afbadc5 Jacob Pan       2020-05-14  242  	    data->format !=3D IOMM=
U_PASID_FORMAT_INTEL_VTD)
64e95c1afbadc5 Jacob Pan       2020-05-14  243  		return -EINVAL;
64e95c1afbadc5 Jacob Pan       2020-05-14  244  =

64e95c1afbadc5 Jacob Pan       2020-05-14  245  	if (dev_is_pci(dev)) {
64e95c1afbadc5 Jacob Pan       2020-05-14  246  		/* VT-d supports devices =
with full 20 bit PASIDs only */
64e95c1afbadc5 Jacob Pan       2020-05-14  247  		if (pci_max_pasids(to_pci=
_dev(dev)) !=3D PASID_MAX)
64e95c1afbadc5 Jacob Pan       2020-05-14  248  			return -EINVAL;
64e95c1afbadc5 Jacob Pan       2020-05-14  249  	} else {
64e95c1afbadc5 Jacob Pan       2020-05-14  250  		return -ENOTSUPP;
64e95c1afbadc5 Jacob Pan       2020-05-14  251  	}
64e95c1afbadc5 Jacob Pan       2020-05-14  252  =

64e95c1afbadc5 Jacob Pan       2020-05-14  253  	/*
64e95c1afbadc5 Jacob Pan       2020-05-14  254  	 * We only check host PASI=
D range, we have no knowledge to check
64e95c1afbadc5 Jacob Pan       2020-05-14  255  	 * guest PASID range.
64e95c1afbadc5 Jacob Pan       2020-05-14  256  	 */
64e95c1afbadc5 Jacob Pan       2020-05-14  257  	if (data->hpasid <=3D 0 ||=
 data->hpasid >=3D PASID_MAX)
64e95c1afbadc5 Jacob Pan       2020-05-14  258  		return -EINVAL;
64e95c1afbadc5 Jacob Pan       2020-05-14  259  =

64e95c1afbadc5 Jacob Pan       2020-05-14  260  	dmar_domain =3D to_dmar_do=
main(domain);
64e95c1afbadc5 Jacob Pan       2020-05-14  261  =

64e95c1afbadc5 Jacob Pan       2020-05-14  262  	mutex_lock(&pasid_mutex);
64e95c1afbadc5 Jacob Pan       2020-05-14  263  	svm =3D ioasid_find(NULL, =
data->hpasid, NULL);
64e95c1afbadc5 Jacob Pan       2020-05-14  264  	if (IS_ERR(svm)) {
64e95c1afbadc5 Jacob Pan       2020-05-14  265  		ret =3D PTR_ERR(svm);
64e95c1afbadc5 Jacob Pan       2020-05-14  266  		goto out;
64e95c1afbadc5 Jacob Pan       2020-05-14  267  	}
64e95c1afbadc5 Jacob Pan       2020-05-14  268  =

64e95c1afbadc5 Jacob Pan       2020-05-14  269  	if (svm) {
64e95c1afbadc5 Jacob Pan       2020-05-14  270  		/*
64e95c1afbadc5 Jacob Pan       2020-05-14  271  		 * If we found svm for th=
e PASID, there must be at
64e95c1afbadc5 Jacob Pan       2020-05-14  272  		 * least one device bond,=
 otherwise svm should be freed.
64e95c1afbadc5 Jacob Pan       2020-05-14  273  		 */
64e95c1afbadc5 Jacob Pan       2020-05-14  274  		if (WARN_ON(list_empty(&s=
vm->devs))) {
64e95c1afbadc5 Jacob Pan       2020-05-14  275  			ret =3D -EINVAL;
64e95c1afbadc5 Jacob Pan       2020-05-14  276  			goto out;
64e95c1afbadc5 Jacob Pan       2020-05-14  277  		}
64e95c1afbadc5 Jacob Pan       2020-05-14  278  =

64e95c1afbadc5 Jacob Pan       2020-05-14  279  		for_each_svm_dev(sdev, sv=
m, dev) {
64e95c1afbadc5 Jacob Pan       2020-05-14  280  			/*
64e95c1afbadc5 Jacob Pan       2020-05-14  281  			 * For devices with aux =
domains, we should allow
64e95c1afbadc5 Jacob Pan       2020-05-14  282  			 * multiple bind calls w=
ith the same PASID and pdev.
64e95c1afbadc5 Jacob Pan       2020-05-14  283  			 */
64e95c1afbadc5 Jacob Pan       2020-05-14  284  			if (iommu_dev_feature_en=
abled(dev,
64e95c1afbadc5 Jacob Pan       2020-05-14  285  						      IOMMU_DEV_FEAT_=
AUX)) {
64e95c1afbadc5 Jacob Pan       2020-05-14  286  				sdev->users++;
64e95c1afbadc5 Jacob Pan       2020-05-14  287  			} else {
64e95c1afbadc5 Jacob Pan       2020-05-14  288  				dev_warn_ratelimited(de=
v,
64e95c1afbadc5 Jacob Pan       2020-05-14  289  						     "Already bound w=
ith PASID %u\n",
64e95c1afbadc5 Jacob Pan       2020-05-14  290  						     svm->pasid);
64e95c1afbadc5 Jacob Pan       2020-05-14  291  				ret =3D -EBUSY;
64e95c1afbadc5 Jacob Pan       2020-05-14  292  			}
64e95c1afbadc5 Jacob Pan       2020-05-14  293  			goto out;
64e95c1afbadc5 Jacob Pan       2020-05-14  294  		}
64e95c1afbadc5 Jacob Pan       2020-05-14  295  	} else {
64e95c1afbadc5 Jacob Pan       2020-05-14  296  		/* We come here when PASI=
D has never been bond to a device. */
64e95c1afbadc5 Jacob Pan       2020-05-14  297  		svm =3D kzalloc(sizeof(*s=
vm), GFP_KERNEL);
64e95c1afbadc5 Jacob Pan       2020-05-14  298  		if (!svm) {
64e95c1afbadc5 Jacob Pan       2020-05-14  299  			ret =3D -ENOMEM;
64e95c1afbadc5 Jacob Pan       2020-05-14  300  			goto out;
64e95c1afbadc5 Jacob Pan       2020-05-14  301  		}
64e95c1afbadc5 Jacob Pan       2020-05-14  302  		/* REVISIT: upper layer/V=
FIO can track host process that bind
64e95c1afbadc5 Jacob Pan       2020-05-14  303  		 * the PASID. ioasid_set =
=3D mm might be sufficient for vfio to
64e95c1afbadc5 Jacob Pan       2020-05-14  304  		 * check pasid VMM owners=
hip. We can drop the following line
64e95c1afbadc5 Jacob Pan       2020-05-14  305  		 * once VFIO and IOASID s=
et check is in place.
64e95c1afbadc5 Jacob Pan       2020-05-14  306  		 */
64e95c1afbadc5 Jacob Pan       2020-05-14  307  		svm->mm =3D get_task_mm(c=
urrent);
64e95c1afbadc5 Jacob Pan       2020-05-14  308  		svm->pasid =3D data->hpas=
id;
64e95c1afbadc5 Jacob Pan       2020-05-14  309  		if (data->flags & IOMMU_S=
VA_GPASID_VAL) {
64e95c1afbadc5 Jacob Pan       2020-05-14  310  			svm->gpasid =3D data->gp=
asid;
64e95c1afbadc5 Jacob Pan       2020-05-14  311  			svm->flags |=3D SVM_FLAG=
_GUEST_PASID;
64e95c1afbadc5 Jacob Pan       2020-05-14  312  		}
64e95c1afbadc5 Jacob Pan       2020-05-14  313  		ioasid_set_data(data->hpa=
sid, svm);
64e95c1afbadc5 Jacob Pan       2020-05-14  314  		INIT_LIST_HEAD_RCU(&svm->=
devs);
64e95c1afbadc5 Jacob Pan       2020-05-14  315  		mmput(svm->mm);
64e95c1afbadc5 Jacob Pan       2020-05-14  316  	}
64e95c1afbadc5 Jacob Pan       2020-05-14  317  	sdev =3D kzalloc(sizeof(*s=
dev), GFP_KERNEL);
64e95c1afbadc5 Jacob Pan       2020-05-14  318  	if (!sdev) {
64e95c1afbadc5 Jacob Pan       2020-05-14  319  		ret =3D -ENOMEM;
64e95c1afbadc5 Jacob Pan       2020-05-14  320  		goto out;
64e95c1afbadc5 Jacob Pan       2020-05-14  321  	}
64e95c1afbadc5 Jacob Pan       2020-05-14  322  	sdev->dev =3D dev;
64e95c1afbadc5 Jacob Pan       2020-05-14  323  =

64e95c1afbadc5 Jacob Pan       2020-05-14  324  	/* Only count users if dev=
ice has aux domains */
64e95c1afbadc5 Jacob Pan       2020-05-14  325  	if (iommu_dev_feature_enab=
led(dev, IOMMU_DEV_FEAT_AUX))
64e95c1afbadc5 Jacob Pan       2020-05-14  326  		sdev->users =3D 1;
64e95c1afbadc5 Jacob Pan       2020-05-14  327  =

64e95c1afbadc5 Jacob Pan       2020-05-14  328  	/* Set up device context e=
ntry for PASID if not enabled already */
64e95c1afbadc5 Jacob Pan       2020-05-14  329  	ret =3D intel_iommu_enable=
_pasid(iommu, sdev->dev);
64e95c1afbadc5 Jacob Pan       2020-05-14  330  	if (ret) {
64e95c1afbadc5 Jacob Pan       2020-05-14  331  		dev_err_ratelimited(dev, =
"Failed to enable PASID capability\n");
64e95c1afbadc5 Jacob Pan       2020-05-14  332  		kfree(sdev);
64e95c1afbadc5 Jacob Pan       2020-05-14  333  		goto out;
64e95c1afbadc5 Jacob Pan       2020-05-14  334  	}
64e95c1afbadc5 Jacob Pan       2020-05-14  335  =

64e95c1afbadc5 Jacob Pan       2020-05-14  336  	/*
64e95c1afbadc5 Jacob Pan       2020-05-14  337  	 * PASID table is per devi=
ce for better security. Therefore, for
64e95c1afbadc5 Jacob Pan       2020-05-14  338  	 * each bind of a new devi=
ce even with an existing PASID, we need to
64e95c1afbadc5 Jacob Pan       2020-05-14  339  	 * call the nested mode se=
tup function here.
64e95c1afbadc5 Jacob Pan       2020-05-14  340  	 */
64e95c1afbadc5 Jacob Pan       2020-05-14  341  	spin_lock(&iommu->lock);
64e95c1afbadc5 Jacob Pan       2020-05-14  342  	ret =3D intel_pasid_setup_=
nested(iommu,
64e95c1afbadc5 Jacob Pan       2020-05-14  343  				       dev,
64e95c1afbadc5 Jacob Pan       2020-05-14  344  				       (pgd_t *)data->g=
pgd,
64e95c1afbadc5 Jacob Pan       2020-05-14  345  				       data->hpasid,
64e95c1afbadc5 Jacob Pan       2020-05-14  346  				       &data->vtd,
64e95c1afbadc5 Jacob Pan       2020-05-14  347  				       dmar_domain,
64e95c1afbadc5 Jacob Pan       2020-05-14  348  				       data->addr_width=
);
64e95c1afbadc5 Jacob Pan       2020-05-14  349  	spin_unlock(&iommu->lock);
64e95c1afbadc5 Jacob Pan       2020-05-14  350  	if (ret) {
64e95c1afbadc5 Jacob Pan       2020-05-14  351  		dev_err_ratelimited(dev, =
"Failed to set up PASID %llu in nested mode, Err %d\n",
64e95c1afbadc5 Jacob Pan       2020-05-14  352  				    data->hpasid, ret);
64e95c1afbadc5 Jacob Pan       2020-05-14  353  		/*
64e95c1afbadc5 Jacob Pan       2020-05-14  354  		 * PASID entry should be =
in cleared state if nested mode
64e95c1afbadc5 Jacob Pan       2020-05-14  355  		 * set up failed. So we o=
nly need to clear IOASID tracking
64e95c1afbadc5 Jacob Pan       2020-05-14  356  		 * data such that free ca=
ll will succeed.
64e95c1afbadc5 Jacob Pan       2020-05-14  357  		 */
64e95c1afbadc5 Jacob Pan       2020-05-14  358  		kfree(sdev);
64e95c1afbadc5 Jacob Pan       2020-05-14  359  		goto out;
64e95c1afbadc5 Jacob Pan       2020-05-14  360  	}
64e95c1afbadc5 Jacob Pan       2020-05-14  361  =

64e95c1afbadc5 Jacob Pan       2020-05-14  362  	svm->flags |=3D SVM_FLAG_G=
UEST_MODE;
64e95c1afbadc5 Jacob Pan       2020-05-14  363  =

64e95c1afbadc5 Jacob Pan       2020-05-14  364  	init_rcu_head(&sdev->rcu);
64e95c1afbadc5 Jacob Pan       2020-05-14  365  	list_add_rcu(&sdev->list, =
&svm->devs);
64e95c1afbadc5 Jacob Pan       2020-05-14  366   out:
64e95c1afbadc5 Jacob Pan       2020-05-14  367  	if (list_empty(&svm->devs)=
) {
64e95c1afbadc5 Jacob Pan       2020-05-14  368  		ioasid_set_data(data->hpa=
sid, NULL);
64e95c1afbadc5 Jacob Pan       2020-05-14 @369  		kfree(svm);
64e95c1afbadc5 Jacob Pan       2020-05-14  370  	}
64e95c1afbadc5 Jacob Pan       2020-05-14  371  =

64e95c1afbadc5 Jacob Pan       2020-05-14  372  	mutex_unlock(&pasid_mutex);
64e95c1afbadc5 Jacob Pan       2020-05-14  373  	return ret;
64e95c1afbadc5 Jacob Pan       2020-05-14  374  }
64e95c1afbadc5 Jacob Pan       2020-05-14  375  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3698793001108578308==--

