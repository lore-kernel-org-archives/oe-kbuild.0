Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AD07F
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Apr 2023 03:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682135256; x=1713671256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gdcCiMIIq8vtwhXq7ypLsMOfOaOKwovEL2ytpL+C6kg=;
  b=VGW8P8h10jxOgz8fkwx9CcH80aLJJPxQLREm7yeIQPUyrNCYu5sTD1mi
   zf77YsWes8xysG3Ci0zj+L5X0kHg3HBQueySom48B6cKIgasr1AKul0ap
   Kc+FT+KjCfpWGfYttx0JkbfZHnPk+iTiGYlR0osC30im4YV4QslTImIJs
   5BGcaQ2AMcS2XyOV9sfUo+dVrEqylrueFINeUgKfunU8FAtPfCXtuSURT
   qSlPN/kD6QyjcI1suHsJWJ9/pN3TXijJwOwm4iHTIwjFtQOAD3lYHaJdZ
   XA4iQE2PSQKiZTf4/nsinN0J1cosmAUeg2FKkbTihkT4Sbcgq9qQeoPFJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="409065027"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="409065027"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 20:47:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="761788258"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="761788258"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2023 20:47:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq4Dl-000h2q-1T;
	Sat, 22 Apr 2023 03:47:33 +0000
Date: Sat, 22 Apr 2023 11:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/iommufd/selftest.c:371 iommufd_test_md_check_pa()
 error: uninitialized symbol 'mock'.
Message-ID: <202304221112.F06Eedyi-lkp@intel.com>
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
head:   8e41e0a575664d26bb87e012c39435c4c3914ed9
commit: f4b20bb34c83dceade5470288f48f94ce3598ada iommufd: Add kernel support for testing iommufd
date:   5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 months ago
config: s390-randconfig-m031-20230421 (https://download.01.org/0day-ci/archive/20230422/202304221112.F06Eedyi-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304221112.F06Eedyi-lkp@intel.com/

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
