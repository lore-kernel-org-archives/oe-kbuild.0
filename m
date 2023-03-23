Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA891C04
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Mar 2023 05:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679550854; x=1711086854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B0AK8699+qv871rXgRu4JwIfnTHk1/hncKETPaoZCTk=;
  b=JWBaFThgHJRfjCxm4YFh12QF1oMKKIs+DLLgvEkNiXQC+k7V6pUpNZRy
   W0x7GZtfY/1ifavKt1L1VXrMkCOTnS71QB+3eg/RZxrZll70WvrR75Yg/
   7D0HYwnb9wTaBe/9wcGkROgyoEqyaZw7EhWIGcm2pOeMkYMTmyBLhXB/G
   +geZ2kwauMMkt/C1Aoc7y0iZ9U38VmF2mmNmaCj83sggf+GYLblmwQXY1
   MIW7wwez/xh3Xs738++W6X5ME+NM0OLUUcY0Evi2JJlONSjEpfzObFZMN
   pJhv679PxYMnpipCg/t9WludnjzwjlMhAZ5b5OoBrCIfX0X+kzucXFvkl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319055110"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="319055110"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 22:54:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="806127072"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="806127072"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Mar 2023 22:54:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfDtr-000E1A-0m;
	Thu, 23 Mar 2023 05:54:11 +0000
Date: Thu, 23 Mar 2023 13:53:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/iommufd/selftest.c:371 iommufd_test_md_check_pa()
 error: uninitialized symbol 'mock'.
Message-ID: <202303231330.lOV3AUTd-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fff5a5e7f528b2ed2c335991399a766c2cf01103
commit: f4b20bb34c83dceade5470288f48f94ce3598ada iommufd: Add kernel support for testing iommufd
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: s390-randconfig-m031-20230321 (https://download.01.org/0day-ci/archive/20230323/202303231330.lOV3AUTd-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303231330.lOV3AUTd-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/selftest.c:371 iommufd_test_md_check_pa() error: uninitialized symbol 'mock'.

vim +/mock +371 drivers/iommu/iommufd/selftest.c

f4b20bb34c83dc Jason Gunthorpe 2022-11-29  334  
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  335  /* Check that every pfn under each iova matches the pfn under a user VA */
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  336  static int iommufd_test_md_check_pa(struct iommufd_ucmd *ucmd,
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  337  				    unsigned int mockpt_id, unsigned long iova,
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  338  				    size_t length, void __user *uptr)
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  339  {
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  340  	struct iommufd_hw_pagetable *hwpt;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  341  	struct mock_iommu_domain *mock;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  342  	int rc;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  343  
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  344  	if (iova % MOCK_IO_PAGE_SIZE || length % MOCK_IO_PAGE_SIZE ||
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  345  	    (uintptr_t)uptr % MOCK_IO_PAGE_SIZE)
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  346  		return -EINVAL;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  347  
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  348  	hwpt = get_md_pagetable(ucmd, mockpt_id, &mock);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  349  	if (IS_ERR(hwpt))
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  350  		return PTR_ERR(hwpt);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  351  
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  352  	for (; length; length -= MOCK_IO_PAGE_SIZE) {
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  353  		struct page *pages[1];
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  354  		unsigned long pfn;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  355  		long npages;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  356  		void *ent;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  357  
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  358  		npages = get_user_pages_fast((uintptr_t)uptr & PAGE_MASK, 1, 0,
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  359  					     pages);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  360  		if (npages < 0) {
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  361  			rc = npages;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  362  			goto out_put;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  363  		}
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  364  		if (WARN_ON(npages != 1)) {
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  365  			rc = -EFAULT;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  366  			goto out_put;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  367  		}
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  368  		pfn = page_to_pfn(pages[0]);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  369  		put_page(pages[0]);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  370  
f4b20bb34c83dc Jason Gunthorpe 2022-11-29 @371  		ent = xa_load(&mock->pfns, iova / MOCK_IO_PAGE_SIZE);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  372  		if (!ent ||
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  373  		    (xa_to_value(ent) & MOCK_PFN_MASK) * MOCK_IO_PAGE_SIZE !=
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  374  			    pfn * PAGE_SIZE + ((uintptr_t)uptr % PAGE_SIZE)) {
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  375  			rc = -EINVAL;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  376  			goto out_put;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  377  		}
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  378  		iova += MOCK_IO_PAGE_SIZE;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  379  		uptr += MOCK_IO_PAGE_SIZE;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  380  	}
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  381  	rc = 0;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  382  
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  383  out_put:
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  384  	iommufd_put_object(&hwpt->obj);
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  385  	return rc;
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  386  }
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  387  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
