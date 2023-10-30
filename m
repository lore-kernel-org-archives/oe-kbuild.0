Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074CED51E
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Oct 2023 21:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtFsUjuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698700058; x=1730236058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Eow12kofi6elSelAgSIZqhagBEI01OJJPhz6stKoQzk=;
  b=YtFsUjuBlM+NuLh/sm7jXu5UJ9UY2D30UTpFIYt6jkTkYuEiXMUZUpsr
   i5yNfsqcxkW/8p2hDswZ5fFgiOR2fHZ3vywerMxS6SXL2Z8t8dWmMHX87
   SNGkadSrBpc1CBdytycAqI90sngI0VJxdVgTmpbb1BVtxr83oQB58b1pF
   cRxNQONsVtVxueVbxy6isGtm27dWYJ5cx0Is9h0SeYfoVPah4CgPOJE+l
   SSSYjlVNUQ1YaQMpvD+HS9xs0M9+fZdXDMr5DMdXAjz9iX9XZfXSYcASt
   /gy/D9rqbjjPw3wq5jF+Z5JMsO3v3BmVBpCokQCIbqIuF/sdFyUEftVJT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1040756"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="1040756"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 14:07:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="877267140"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="877267140"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 Oct 2023 14:07:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxZTx-000DYx-1g;
	Mon, 30 Oct 2023 21:07:33 +0000
Date: Tue, 31 Oct 2023 05:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [lubaolu-intel-iommu:iommufd-io-pgfault-delivery-v2 17/20]
 drivers/iommu/iommufd/hw_pagetable.c:49 iommufd_compose_fault_message()
 warn: 'idev' is an error pointer or valid
Message-ID: <202310310432.BjthwGZA-lkp@intel.com>
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
TO: Baolu Lu <baolu.lu@linux.intel.com>

tree:   https://github.com/LuBaolu/intel-iommu.git iommufd-io-pgfault-delivery-v2
head:   357b5abcba0477f7f1391dd0fa3a919a6f06bdf0
commit: b3223c85771c7546d53192aa7a53fc3e5823272a [17/20] iommufd: Deliver fault messages to user space
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20231030 (https://download.01.org/0day-ci/archive/20231031/202310310432.BjthwGZA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231031/202310310432.BjthwGZA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310310432.BjthwGZA-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:49 iommufd_compose_fault_message() warn: 'idev' is an error pointer or valid

Old smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:108 hwpt_fault_fops_read() warn: maybe return -EFAULT instead of the bytes remaining?

vim +/idev +49 drivers/iommu/iommufd/hw_pagetable.c

ea4acfac57b9de Jason Gunthorpe 2022-11-29  42  
b3223c85771c75 Lu Baolu        2023-10-10  43  static int iommufd_compose_fault_message(struct iommu_fault *fault,
b3223c85771c75 Lu Baolu        2023-10-10  44  					 struct iommu_hwpt_pgfault *hwpt_fault,
b3223c85771c75 Lu Baolu        2023-10-10  45  					 struct device *dev)
b3223c85771c75 Lu Baolu        2023-10-10  46  {
b3223c85771c75 Lu Baolu        2023-10-10  47  	struct iommufd_device *idev = iopf_pasid_cookie_get(dev, IOMMU_NO_PASID);
b3223c85771c75 Lu Baolu        2023-10-10  48  
b3223c85771c75 Lu Baolu        2023-10-10 @49  	if (!idev)
b3223c85771c75 Lu Baolu        2023-10-10  50  		return -ENODEV;
b3223c85771c75 Lu Baolu        2023-10-10  51  
b3223c85771c75 Lu Baolu        2023-10-10  52  	if (IS_ERR(idev))
b3223c85771c75 Lu Baolu        2023-10-10  53  		return PTR_ERR(idev);
b3223c85771c75 Lu Baolu        2023-10-10  54  
b3223c85771c75 Lu Baolu        2023-10-10  55  	hwpt_fault->size = sizeof(*hwpt_fault);
b3223c85771c75 Lu Baolu        2023-10-10  56  	hwpt_fault->flags = fault->prm.flags;
b3223c85771c75 Lu Baolu        2023-10-10  57  	hwpt_fault->dev_id = idev->obj.id;
b3223c85771c75 Lu Baolu        2023-10-10  58  	hwpt_fault->pasid = fault->prm.pasid;
b3223c85771c75 Lu Baolu        2023-10-10  59  	hwpt_fault->grpid = fault->prm.grpid;
b3223c85771c75 Lu Baolu        2023-10-10  60  	hwpt_fault->perm = fault->prm.perm;
b3223c85771c75 Lu Baolu        2023-10-10  61  	hwpt_fault->addr = fault->prm.addr;
b3223c85771c75 Lu Baolu        2023-10-10  62  	hwpt_fault->private_data[0] = fault->prm.private_data[0];
b3223c85771c75 Lu Baolu        2023-10-10  63  	hwpt_fault->private_data[1] = fault->prm.private_data[1];
b3223c85771c75 Lu Baolu        2023-10-10  64  
b3223c85771c75 Lu Baolu        2023-10-10  65  	return 0;
b3223c85771c75 Lu Baolu        2023-10-10  66  }
b3223c85771c75 Lu Baolu        2023-10-10  67  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
