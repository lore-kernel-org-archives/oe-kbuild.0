Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AE617D5
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Apr 2023 14:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682693858; x=1714229858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=596EhxdEHL1VzLpJ3xk9sP5Mt/bL7Wv2yz7cv1+rzrE=;
  b=JKUJ8eIatmYgpk54vP1vRn1YVkwZRmFxXDDVch7X+ElHXdA+y4jFxdJi
   qFvaASb8ozaVczHqZEEGZZG39pI1njEFcH3aElz4X4HfGmySo/U1d94gY
   RA4vhjE2YOwTFfjtfADlctad0KpnBPkS/4AmmjeYqDDl6WYbk+rGU0SZ2
   js0VUKfEEVLK3oF1GscQBNrVcA97FEhDRt+Up+OQ/Md9ArtMNalUUNvla
   ifEPBpvjeg0GEI2N+UtLN/PVHbyW/NB/Tp3k5zxZ+l59aFOyqhyggSYRd
   EPtuJK/V5NUkcu6wlDTZn0t+p/gZ61H1EPNT+UoEpK/BM//Ljx1cUag57
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="413159180"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="413159180"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 07:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="1024630216"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="1024630216"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Apr 2023 07:57:36 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psPXT-0000WH-2a;
	Fri, 28 Apr 2023 14:57:35 +0000
Date: Fri, 28 Apr 2023 22:57:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jgunthorpe:iommufd_hwpt 22/33]
 drivers/iommu/iommufd/hw_pagetable.c:113 iommufd_hw_pagetable_alloc() warn:
 passing zero to 'ERR_PTR'
Message-ID: <202304282208.X1RCSlRp-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Lu Baolu <baolu.lu@linux.intel.com>

tree:   https://github.com/jgunthorpe/linux iommufd_hwpt
head:   107e409f65cf19c88339c2a12d2cdc9342a846b5
commit: f8f80e2c0831d5fdcb7487de3c54ddd2cc7ece5a [22/33] iommufd: Add enforced_cache_coherency to iommufd_hw_pagetable_alloc()
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: powerpc-randconfig-m041-20230427 (https://download.01.org/0day-ci/archive/20230428/202304282208.X1RCSlRp-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304282208.X1RCSlRp-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:113 iommufd_hw_pagetable_alloc() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +113 drivers/iommu/iommufd/hw_pagetable.c

f8f80e2c0831d5 Jason Gunthorpe 2023-02-16   41  
ea4acfac57b9de Jason Gunthorpe 2022-11-29   42  /**
ea4acfac57b9de Jason Gunthorpe 2022-11-29   43   * iommufd_hw_pagetable_alloc() - Get an iommu_domain for a device
ea4acfac57b9de Jason Gunthorpe 2022-11-29   44   * @ictx: iommufd context
ea4acfac57b9de Jason Gunthorpe 2022-11-29   45   * @ioas: IOAS to associate the domain with
339fbf3ae14426 Jason Gunthorpe 2023-03-01   46   * @idev: Device to get an iommu_domain for
339fbf3ae14426 Jason Gunthorpe 2023-03-01   47   * @immediate_attach: True if idev should be attached to the hwpt
ea4acfac57b9de Jason Gunthorpe 2022-11-29   48   *
339fbf3ae14426 Jason Gunthorpe 2023-03-01   49   * Allocate a new iommu_domain and return it as a hw_pagetable. The HWPT
339fbf3ae14426 Jason Gunthorpe 2023-03-01   50   * will be linked to the given ioas and upon return the underlying iommu_domain
339fbf3ae14426 Jason Gunthorpe 2023-03-01   51   * is fully popoulated.
ea4acfac57b9de Jason Gunthorpe 2022-11-29   52   */
ea4acfac57b9de Jason Gunthorpe 2022-11-29   53  struct iommufd_hw_pagetable *
ea4acfac57b9de Jason Gunthorpe 2022-11-29   54  iommufd_hw_pagetable_alloc(struct iommufd_ctx *ictx, struct iommufd_ioas *ioas,
339fbf3ae14426 Jason Gunthorpe 2023-03-01   55  			   struct iommufd_device *idev, bool immediate_attach)
ea4acfac57b9de Jason Gunthorpe 2022-11-29   56  {
ea4acfac57b9de Jason Gunthorpe 2022-11-29   57  	struct iommufd_hw_pagetable *hwpt;
ea4acfac57b9de Jason Gunthorpe 2022-11-29   58  	int rc;
ea4acfac57b9de Jason Gunthorpe 2022-11-29   59  
339fbf3ae14426 Jason Gunthorpe 2023-03-01   60  	lockdep_assert_held(&ioas->mutex);
339fbf3ae14426 Jason Gunthorpe 2023-03-01   61  
ea4acfac57b9de Jason Gunthorpe 2022-11-29   62  	hwpt = iommufd_object_alloc(ictx, hwpt, IOMMUFD_OBJ_HW_PAGETABLE);
ea4acfac57b9de Jason Gunthorpe 2022-11-29   63  	if (IS_ERR(hwpt))
ea4acfac57b9de Jason Gunthorpe 2022-11-29   64  		return hwpt;
ea4acfac57b9de Jason Gunthorpe 2022-11-29   65  
ea4acfac57b9de Jason Gunthorpe 2022-11-29   66  	INIT_LIST_HEAD(&hwpt->hwpt_item);
ea4acfac57b9de Jason Gunthorpe 2022-11-29   67  	/* Pairs with iommufd_hw_pagetable_destroy() */
ea4acfac57b9de Jason Gunthorpe 2022-11-29   68  	refcount_inc(&ioas->obj.users);
ea4acfac57b9de Jason Gunthorpe 2022-11-29   69  	hwpt->ioas = ioas;
25cde97d953208 Jason Gunthorpe 2023-03-01   70  
339fbf3ae14426 Jason Gunthorpe 2023-03-01   71  	hwpt->domain = iommu_domain_alloc(idev->dev->bus);
25cde97d953208 Jason Gunthorpe 2023-03-01   72  	if (!hwpt->domain) {
25cde97d953208 Jason Gunthorpe 2023-03-01   73  		rc = -ENOMEM;
25cde97d953208 Jason Gunthorpe 2023-03-01   74  		goto out_abort;
25cde97d953208 Jason Gunthorpe 2023-03-01   75  	}
25cde97d953208 Jason Gunthorpe 2023-03-01   76  
f8f80e2c0831d5 Jason Gunthorpe 2023-02-16   77  	/*
f8f80e2c0831d5 Jason Gunthorpe 2023-02-16   78  	 * Set the coherency mode before we do iopt_table_add_domain() as some
f8f80e2c0831d5 Jason Gunthorpe 2023-02-16   79  	 * iommus have a per-PTE bit that controls it and need to decide before
f8f80e2c0831d5 Jason Gunthorpe 2023-02-16   80  	 * doing any maps. It is an iommu driver bug to report
f8f80e2c0831d5 Jason Gunthorpe 2023-02-16   81  	 * IOMMU_CAP_ENFORCE_CACHE_COHERENCY but fail enforce_cache_coherency on
f8f80e2c0831d5 Jason Gunthorpe 2023-02-16   82  	 * a new domain.
f8f80e2c0831d5 Jason Gunthorpe 2023-02-16   83  	 */
f8f80e2c0831d5 Jason Gunthorpe 2023-02-16   84  	if (idev->enforce_cache_coherency) {
f8f80e2c0831d5 Jason Gunthorpe 2023-02-16   85  		rc = iommufd_hw_pagetable_enforce_cc(hwpt);
f8f80e2c0831d5 Jason Gunthorpe 2023-02-16   86  		if (WARN_ON(rc))
f8f80e2c0831d5 Jason Gunthorpe 2023-02-16   87  			goto out_abort;
f8f80e2c0831d5 Jason Gunthorpe 2023-02-16   88  	}
f8f80e2c0831d5 Jason Gunthorpe 2023-02-16   89  
339fbf3ae14426 Jason Gunthorpe 2023-03-01   90  	/*
339fbf3ae14426 Jason Gunthorpe 2023-03-01   91  	 * immediate_attach exists only to accommodate iommu drivers that cannot
339fbf3ae14426 Jason Gunthorpe 2023-03-01   92  	 * directly allocate a domain. These drivers do not finish creating the
339fbf3ae14426 Jason Gunthorpe 2023-03-01   93  	 * domain until attach is completed. Thus we must have this call
339fbf3ae14426 Jason Gunthorpe 2023-03-01   94  	 * sequence. Once those drivers are fixed this should be removed.
339fbf3ae14426 Jason Gunthorpe 2023-03-01   95  	 */
339fbf3ae14426 Jason Gunthorpe 2023-03-01   96  	if (immediate_attach) {
339fbf3ae14426 Jason Gunthorpe 2023-03-01   97  		rc = iommufd_hw_pagetable_attach(hwpt, idev);
339fbf3ae14426 Jason Gunthorpe 2023-03-01   98  		if (rc)
eea45e2be4bbcf Jason Gunthorpe 2023-02-16   99  			goto out_abort;
339fbf3ae14426 Jason Gunthorpe 2023-03-01  100  	}
339fbf3ae14426 Jason Gunthorpe 2023-03-01  101  
339fbf3ae14426 Jason Gunthorpe 2023-03-01  102  	rc = iopt_table_add_domain(&hwpt->ioas->iopt, hwpt->domain);
339fbf3ae14426 Jason Gunthorpe 2023-03-01  103  	if (rc)
339fbf3ae14426 Jason Gunthorpe 2023-03-01  104  		goto out_detach;
339fbf3ae14426 Jason Gunthorpe 2023-03-01  105  	list_add_tail(&hwpt->hwpt_item, &hwpt->ioas->hwpt_list);
ea4acfac57b9de Jason Gunthorpe 2022-11-29  106  	return hwpt;
ea4acfac57b9de Jason Gunthorpe 2022-11-29  107  
339fbf3ae14426 Jason Gunthorpe 2023-03-01  108  out_detach:
339fbf3ae14426 Jason Gunthorpe 2023-03-01  109  	if (immediate_attach)
eea45e2be4bbcf Jason Gunthorpe 2023-02-16  110  		iommufd_hw_pagetable_detach(idev);
ea4acfac57b9de Jason Gunthorpe 2022-11-29  111  out_abort:
25cde97d953208 Jason Gunthorpe 2023-03-01  112  	iommufd_object_abort_and_destroy(ictx, &hwpt->obj);
ea4acfac57b9de Jason Gunthorpe 2022-11-29 @113  	return ERR_PTR(rc);

:::::: The code at line 113 was first introduced by commit
:::::: ea4acfac57b9dee57a7d5840359a41cc3251de92 iommufd: Add a HW pagetable object

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
