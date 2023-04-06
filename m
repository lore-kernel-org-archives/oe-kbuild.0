Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5D2AD29
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Apr 2023 17:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680802205; x=1712338205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gf/iCbIDDWAQ0ca7UpzhWzci4axVQVNmeP9MU5gKLCU=;
  b=b3g7IHhd5Nj3a/KOCyiQTwhVlEw+1tMB7zxe1sTMFu2YRFZv7QwGl/fI
   TR6LcsVMs45r0zhdqrW4KCyi4KOate1Ozq+mbn6bl7dyKYO6DMYokfht9
   aZ6RkKinG4qAYYVKalmcLB90qO2ShFc6uHc1eAFIxuoxBGxPjJcovGWua
   gGlrhfDO+B912dtI+QyK0dWBETBD4c66SCxXGuC1tk9z1vxSpo+thM2+5
   5kwx3iNCqaIzddbfdMuS2WOz0o7T33neWr1toC6Bd67QfYpyvlv4gEMWi
   pzeEsWsK9ebE+xR752lUVxpEG1YEuMRu9UufPdx4JQsFvoHZOjZlOAx9X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="323172000"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="323172000"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 10:30:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="798410537"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="798410537"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2023 10:30:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkTQv-000RZ8-1c;
	Thu, 06 Apr 2023 17:30:01 +0000
Date: Fri, 7 Apr 2023 01:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-03292023-yi 9/42]
 drivers/iommu/iommufd/hw_pagetable.c:143 iommufd_hw_pagetable_alloc() error:
 uninitialized symbol 'rc'.
Message-ID: <202304070109.JNljFPM5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yi Liu <yi.l.liu@intel.com>
TO: Kevin Tian <kevin.tian@intel.com>

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-03292023-yi
head:   032ce679f2322b426350f8721d7a1afca1bb7aab
commit: c1cf862f230cf33abdfd85051027ada354fecf14 [9/42] iommufd: Pass parent hwpt and user_data to iommufd_hw_pagetable_alloc()
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-m021-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070109.JNljFPM5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304070109.JNljFPM5-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:143 iommufd_hw_pagetable_alloc() error: uninitialized symbol 'rc'.

vim +/rc +143 drivers/iommu/iommufd/hw_pagetable.c

403bdbf937722d2 Jason Gunthorpe 2023-02-16   45  
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   46  /**
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   47   * iommufd_hw_pagetable_alloc() - Get an iommu_domain for a device
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   48   * @ictx: iommufd context
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   49   * @ioas: IOAS to associate the domain with
339fbf3ae144263 Jason Gunthorpe 2023-03-01   50   * @idev: Device to get an iommu_domain for
c1cf862f230cf33 Yi Liu          2023-03-03   51   * @parent: Optional parent HWPT to associate with the domain with
c1cf862f230cf33 Yi Liu          2023-03-03   52   * @user_data: Optional user_data pointer
339fbf3ae144263 Jason Gunthorpe 2023-03-01   53   * @immediate_attach: True if idev should be attached to the hwpt
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   54   *
339fbf3ae144263 Jason Gunthorpe 2023-03-01   55   * Allocate a new iommu_domain and return it as a hw_pagetable. The HWPT
339fbf3ae144263 Jason Gunthorpe 2023-03-01   56   * will be linked to the given ioas and upon return the underlying iommu_domain
339fbf3ae144263 Jason Gunthorpe 2023-03-01   57   * is fully popoulated.
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   58   */
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   59  struct iommufd_hw_pagetable *
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   60  iommufd_hw_pagetable_alloc(struct iommufd_ctx *ictx, struct iommufd_ioas *ioas,
c1cf862f230cf33 Yi Liu          2023-03-03   61  			   struct iommufd_device *idev,
c1cf862f230cf33 Yi Liu          2023-03-03   62  			   struct iommufd_hw_pagetable *parent,
c1cf862f230cf33 Yi Liu          2023-03-03   63  			   void *user_data, bool immediate_attach)
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   64  {
298c389caeaf008 Yi Liu          2023-01-19   65  	const struct iommu_ops *ops = dev_iommu_ops(idev->dev);
c1cf862f230cf33 Yi Liu          2023-03-03   66  	struct iommu_domain *parent_domain = NULL;
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   67  	struct iommufd_hw_pagetable *hwpt;
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   68  	int rc;
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   69  
339fbf3ae144263 Jason Gunthorpe 2023-03-01   70  	lockdep_assert_held(&ioas->mutex);
339fbf3ae144263 Jason Gunthorpe 2023-03-01   71  
c1cf862f230cf33 Yi Liu          2023-03-03   72  	if ((user_data || parent) && !ops->domain_alloc_user)
c1cf862f230cf33 Yi Liu          2023-03-03   73  		return ERR_PTR(-EOPNOTSUPP);
c1cf862f230cf33 Yi Liu          2023-03-03   74  
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   75  	hwpt = iommufd_object_alloc(ictx, hwpt, IOMMUFD_OBJ_HW_PAGETABLE);
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   76  	if (IS_ERR(hwpt))
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   77  		return hwpt;
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   78  
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   79  	INIT_LIST_HEAD(&hwpt->hwpt_item);
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   80  	/* Pairs with iommufd_hw_pagetable_destroy() */
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   81  	refcount_inc(&ioas->obj.users);
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   82  	hwpt->ioas = ioas;
c1cf862f230cf33 Yi Liu          2023-03-03   83  	if (parent) {
c1cf862f230cf33 Yi Liu          2023-03-03   84  		hwpt->parent = parent;
c1cf862f230cf33 Yi Liu          2023-03-03   85  		parent_domain = parent->domain;
c1cf862f230cf33 Yi Liu          2023-03-03   86  		refcount_inc(&parent->obj.users);
c1cf862f230cf33 Yi Liu          2023-03-03   87  	}
25cde97d953208b Jason Gunthorpe 2023-03-01   88  
298c389caeaf008 Yi Liu          2023-01-19   89  	if (ops->domain_alloc_user)
c1cf862f230cf33 Yi Liu          2023-03-03   90  		hwpt->domain = ops->domain_alloc_user(idev->dev,
c1cf862f230cf33 Yi Liu          2023-03-03   91  						      parent_domain, user_data);
298c389caeaf008 Yi Liu          2023-01-19   92  	else
339fbf3ae144263 Jason Gunthorpe 2023-03-01   93  		hwpt->domain = iommu_domain_alloc(idev->dev->bus);
25cde97d953208b Jason Gunthorpe 2023-03-01   94  	if (!hwpt->domain) {
25cde97d953208b Jason Gunthorpe 2023-03-01   95  		rc = -ENOMEM;
25cde97d953208b Jason Gunthorpe 2023-03-01   96  		goto out_abort;
25cde97d953208b Jason Gunthorpe 2023-03-01   97  	}
25cde97d953208b Jason Gunthorpe 2023-03-01   98  
c1cf862f230cf33 Yi Liu          2023-03-03   99  	/* It must be either NESTED or UNMANAGED, depending on parent_domain */
c1cf862f230cf33 Yi Liu          2023-03-03  100  	if (WARN_ON((parent_domain && hwpt->domain->type != IOMMU_DOMAIN_NESTED) ||
c1cf862f230cf33 Yi Liu          2023-03-03  101  	            (!parent_domain && hwpt->domain->type != IOMMU_DOMAIN_UNMANAGED)))
c1cf862f230cf33 Yi Liu          2023-03-03  102  		goto out_abort;
c1cf862f230cf33 Yi Liu          2023-03-03  103  
403bdbf937722d2 Jason Gunthorpe 2023-02-16  104  	/*
403bdbf937722d2 Jason Gunthorpe 2023-02-16  105  	 * Set the coherency mode before we do iopt_table_add_domain() as some
403bdbf937722d2 Jason Gunthorpe 2023-02-16  106  	 * iommus have a per-PTE bit that controls it and need to decide before
403bdbf937722d2 Jason Gunthorpe 2023-02-16  107  	 * doing any maps. It is an iommu driver bug to report
403bdbf937722d2 Jason Gunthorpe 2023-02-16  108  	 * IOMMU_CAP_ENFORCE_CACHE_COHERENCY but fail enforce_cache_coherency on
403bdbf937722d2 Jason Gunthorpe 2023-02-16  109  	 * a new domain.
403bdbf937722d2 Jason Gunthorpe 2023-02-16  110  	 */
403bdbf937722d2 Jason Gunthorpe 2023-02-16  111  	if (idev->enforce_cache_coherency) {
403bdbf937722d2 Jason Gunthorpe 2023-02-16  112  		rc = iommufd_hw_pagetable_enforce_cc(hwpt);
403bdbf937722d2 Jason Gunthorpe 2023-02-16  113  		if (WARN_ON(rc))
403bdbf937722d2 Jason Gunthorpe 2023-02-16  114  			goto out_abort;
403bdbf937722d2 Jason Gunthorpe 2023-02-16  115  	}
403bdbf937722d2 Jason Gunthorpe 2023-02-16  116  
339fbf3ae144263 Jason Gunthorpe 2023-03-01  117  	/*
339fbf3ae144263 Jason Gunthorpe 2023-03-01  118  	 * immediate_attach exists only to accommodate iommu drivers that cannot
339fbf3ae144263 Jason Gunthorpe 2023-03-01  119  	 * directly allocate a domain. These drivers do not finish creating the
339fbf3ae144263 Jason Gunthorpe 2023-03-01  120  	 * domain until attach is completed. Thus we must have this call
339fbf3ae144263 Jason Gunthorpe 2023-03-01  121  	 * sequence. Once those drivers are fixed this should be removed.
36a117b606efcce Jason Gunthorpe 2023-02-16  122  	 *
36a117b606efcce Jason Gunthorpe 2023-02-16  123  	 * Note we hold the igroup->lock here which prevents any other thread
36a117b606efcce Jason Gunthorpe 2023-02-16  124  	 * from observing igroup->hwpt until we finish setting it up.
339fbf3ae144263 Jason Gunthorpe 2023-03-01  125  	 */
339fbf3ae144263 Jason Gunthorpe 2023-03-01  126  	if (immediate_attach) {
339fbf3ae144263 Jason Gunthorpe 2023-03-01  127  		rc = iommufd_hw_pagetable_attach(hwpt, idev);
339fbf3ae144263 Jason Gunthorpe 2023-03-01  128  		if (rc)
36a117b606efcce Jason Gunthorpe 2023-02-16  129  			goto out_abort;
339fbf3ae144263 Jason Gunthorpe 2023-03-01  130  	}
339fbf3ae144263 Jason Gunthorpe 2023-03-01  131  
339fbf3ae144263 Jason Gunthorpe 2023-03-01  132  	rc = iopt_table_add_domain(&hwpt->ioas->iopt, hwpt->domain);
339fbf3ae144263 Jason Gunthorpe 2023-03-01  133  	if (rc)
339fbf3ae144263 Jason Gunthorpe 2023-03-01  134  		goto out_detach;
339fbf3ae144263 Jason Gunthorpe 2023-03-01  135  	list_add_tail(&hwpt->hwpt_item, &hwpt->ioas->hwpt_list);
ea4acfac57b9dee Jason Gunthorpe 2022-11-29  136  	return hwpt;
ea4acfac57b9dee Jason Gunthorpe 2022-11-29  137  
339fbf3ae144263 Jason Gunthorpe 2023-03-01  138  out_detach:
339fbf3ae144263 Jason Gunthorpe 2023-03-01  139  	if (immediate_attach)
36a117b606efcce Jason Gunthorpe 2023-02-16  140  		iommufd_hw_pagetable_detach(idev);
ea4acfac57b9dee Jason Gunthorpe 2022-11-29  141  out_abort:
25cde97d953208b Jason Gunthorpe 2023-03-01  142  	iommufd_object_abort_and_destroy(ictx, &hwpt->obj);
ea4acfac57b9dee Jason Gunthorpe 2022-11-29 @143  	return ERR_PTR(rc);
ea4acfac57b9dee Jason Gunthorpe 2022-11-29  144  }
654fb5316ca27c6 Jason Gunthorpe 2023-02-16  145  

:::::: The code at line 143 was first introduced by commit
:::::: ea4acfac57b9dee57a7d5840359a41cc3251de92 iommufd: Add a HW pagetable object

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
