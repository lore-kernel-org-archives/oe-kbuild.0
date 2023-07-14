Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04EF10F4
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Jul 2023 03:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689304582; x=1720840582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IhU9qaCmTDS2hstOvmy8kgZTAuDEdUwalyoSPI0Tm+g=;
  b=SV9lOH+no4ZQ64IEvCmRYHpvaXKiskBs0c2YOPJHEdxbQJezRQJrl1R8
   kxJVtzXClpmL2KgpL9ippz+4278ithuQISzDFc05OQBNefiGBVcGlxKdx
   GeZ0hbQ2CirVksQKUsu81Zauz787PMlV7QXEkuA/ymzY2WBPYdUn/Jh8R
   AObr94X9m0koJ8RUW0mHRBqpC3QuFr76txXBPxIfvKwlY7jDPy7r6NtUu
   8NkYLy+AnLfsXFjKk+hmz8IXHw4V0yz05P0xgrjlZZ7JaoLeMZ45RYvMy
   9kU5hHj1Cq0czjNdicQZu2KeHirb1IekuA4uV3+3a2e153mYrSsLvYbhk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="350249439"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="350249439"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 20:16:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787698504"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="787698504"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Jul 2023 20:16:20 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK9I4-000785-06;
	Fri, 14 Jul 2023 03:16:20 +0000
Date: Fri, 14 Jul 2023 11:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [yiliu1765-iommufd:wip/iommufd_pasid 67/73]
 drivers/iommu/iommufd/pasid.c:29:1-3: WARNING: possible condition with no
 effect (if == else)
Message-ID: <202307141101.6mFGzFS2-lkp@intel.com>
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

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid
head:   e3941047a07be80cb3b87129cb372c1e6e7f4ced
commit: 0fb50342800a867a8e56866fddd1f3d0752c45a9 [67/73] iommufd: Allow attach/replace hwpt per pasid
:::::: branch date: 14 hours ago
:::::: commit date: 19 hours ago
config: arc-randconfig-r061-20230713 (https://download.01.org/0day-ci/archive/20230714/202307141101.6mFGzFS2-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141101.6mFGzFS2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307141101.6mFGzFS2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iommu/iommufd/pasid.c:29:1-3: WARNING: possible condition with no effect (if == else)

vim +29 drivers/iommu/iommufd/pasid.c

0fb50342800a86 Kevin Tian 2023-05-22   9  
0fb50342800a86 Kevin Tian 2023-05-22  10  static int __iommufd_device_pasid_do_attach(struct iommufd_device *idev,
0fb50342800a86 Kevin Tian 2023-05-22  11  					    u32 pasid,
0fb50342800a86 Kevin Tian 2023-05-22  12  					    struct iommufd_hw_pagetable *hwpt,
0fb50342800a86 Kevin Tian 2023-05-22  13  					    bool replace)
0fb50342800a86 Kevin Tian 2023-05-22  14  {
0fb50342800a86 Kevin Tian 2023-05-22  15  	int rc;
0fb50342800a86 Kevin Tian 2023-05-22  16  
0fb50342800a86 Kevin Tian 2023-05-22  17  	/*
0fb50342800a86 Kevin Tian 2023-05-22  18  	 * Try to upgrade the domain we have. This is also required for
0fb50342800a86 Kevin Tian 2023-05-22  19  	 * pasid attach since pasid only matters for identifying a hwpt
0fb50342800a86 Kevin Tian 2023-05-22  20  	 * while cache coherency is about memory access semantics post
0fb50342800a86 Kevin Tian 2023-05-22  21  	 * walking hwpt.
0fb50342800a86 Kevin Tian 2023-05-22  22  	 */
0fb50342800a86 Kevin Tian 2023-05-22  23  	if (idev->enforce_cache_coherency) {
0fb50342800a86 Kevin Tian 2023-05-22  24  		rc = iommufd_hw_pagetable_enforce_cc(hwpt);
0fb50342800a86 Kevin Tian 2023-05-22  25  		if (rc)
0fb50342800a86 Kevin Tian 2023-05-22  26  			return rc;
0fb50342800a86 Kevin Tian 2023-05-22  27  	}
0fb50342800a86 Kevin Tian 2023-05-22  28  
0fb50342800a86 Kevin Tian 2023-05-22 @29  	if (!replace)
0fb50342800a86 Kevin Tian 2023-05-22  30  		rc = iommu_attach_device_pasid(hwpt->domain, idev->dev, pasid);
0fb50342800a86 Kevin Tian 2023-05-22  31  	else
0fb50342800a86 Kevin Tian 2023-05-22  32  		/* FIXEME: need a pasid replace IOMMU API */
0fb50342800a86 Kevin Tian 2023-05-22  33  		rc = iommu_attach_device_pasid(hwpt->domain, idev->dev, pasid);
0fb50342800a86 Kevin Tian 2023-05-22  34  	if (rc)
0fb50342800a86 Kevin Tian 2023-05-22  35  		return rc;
0fb50342800a86 Kevin Tian 2023-05-22  36  
0fb50342800a86 Kevin Tian 2023-05-22  37  	xa_store(&idev->pasid_hwpts, pasid, hwpt, GFP_KERNEL);
0fb50342800a86 Kevin Tian 2023-05-22  38  	refcount_inc(&hwpt->obj.users);
0fb50342800a86 Kevin Tian 2023-05-22  39  	return 0;
0fb50342800a86 Kevin Tian 2023-05-22  40  }
0fb50342800a86 Kevin Tian 2023-05-22  41  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
