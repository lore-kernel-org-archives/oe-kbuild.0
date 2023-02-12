Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBBBEA0
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Feb 2023 02:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676168375; x=1707704375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qfGLUbBFb8NveHPwZBSJ5LhGTowNffwQbWzHtSGiR24=;
  b=kxTVWrk12oMwdthRvYqpwWvUyQjs7JBXAfbF2LGqNG9UvK6JwThKUcyj
   cePatSyja866dIzCoW5RWt7Y6u4DQ8hBszO+5dIFg6Q7XuSHld7IR2mzM
   RxouRe+CeF+uB+Gmjkfc5D/BXZMuIAPefNTWXEnMipv73mBRmgMsE7I5T
   unhe6rbFioue8AKxHVmoH2Q/PK0HIympZ2Xjf+s6kAigM+ytZWTd5Hsm7
   uKYt4/1trcTlVcj59EElZQHi/UoNZQEIibluhRMkZVsT3R/fsrIyav/Jb
   buT7Kpf64+U99F5YVINNMMl5btTW+rX2sTcVimVMVEgt1bycLoBmSBJsn
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="328380451"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="328380451"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 18:19:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="757176029"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="757176029"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Feb 2023 18:19:32 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pR1xj-0006xB-2O;
	Sun, 12 Feb 2023 02:19:31 +0000
Date: Sun, 12 Feb 2023 10:18:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/iommufd/selftest.c:371 iommufd_test_md_check_pa()
 error: uninitialized symbol 'mock'.
Message-ID: <202302121041.rhE12hKn-lkp@intel.com>
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
head:   f339c2597ebb00e738f2b6328c14804ed19f5d57
commit: f4b20bb34c83dceade5470288f48f94ce3598ada iommufd: Add kernel support for testing iommufd
date:   2 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 2 months ago
config: parisc-randconfig-m031-20230209 (https://download.01.org/0day-ci/archive/20230212/202302121041.rhE12hKn-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302121041.rhE12hKn-lkp@intel.com/

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
