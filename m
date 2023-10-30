Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B417F14F96
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Oct 2023 12:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKV5T3IZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698668513; x=1730204513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=80M+GuMe9x6/WE8i+rKLUHooxHyshFhWNNL52VOW/Ek=;
  b=fKV5T3IZIkljXLYM7GoLYYvNXAbwT1LupDOwEq8zYXuhTot97rDVQZtr
   uc1LeuEMCMbiTyXsR5QdFMzweTfOnEY/ZwD2lauYPSRq2Ri3xwkBW202N
   ewMw7U7ol72xUxi5Q9biY2MZRzRLWHlvSo7x/Zu1ZAH3ngQWTp9IT1fF2
   shtPUwMRcyiUBaXs3g1NRTldxwHk8E1PCXedmoolHzfEiZPKr6M3z2Myj
   uecksXyXvTMQ0zVtOYGPQg4agO5JW+Pzd8eGwqoW77nMruyZafPpN2TIt
   L2S/vOFwrOITNIrhrutsJf/KfBNtWvGEty5YKOFL3JUyXh7H/Wu1ALx/8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="6693809"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="6693809"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 05:21:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="763896459"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="763896459"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Oct 2023 05:21:51 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxRHA-000DFi-2k;
	Mon, 30 Oct 2023 12:21:48 +0000
Date: Mon, 30 Oct 2023 20:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/infiniband/hw/hfi1/verbs.c:1661 hfi1_alloc_hw_device_stats()
 error: we previously assumed 'dev_cntr_descs' could be null (see line 1650)
Message-ID: <202310302056.cSOLYCdt-lkp@intel.com>
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
TO: Dean Luick <dean.luick@cornelisnetworks.com>
CC: Leon Romanovsky <leon@kernel.org>
CC: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffc253263a1375a65fa6c9f62a893e9767fbebfa
commit: ef90f0a1913e8b60101c374010847615172a77d1 IB/hfi1: Split IB counter allocation
date:   10 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20231030 (https://download.01.org/0day-ci/archive/20231030/202310302056.cSOLYCdt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231030/202310302056.cSOLYCdt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310302056.cSOLYCdt-lkp@intel.com/

smatch warnings:
drivers/infiniband/hw/hfi1/verbs.c:1661 hfi1_alloc_hw_device_stats() error: we previously assumed 'dev_cntr_descs' could be null (see line 1650)

vim +/dev_cntr_descs +1661 drivers/infiniband/hw/hfi1/verbs.c

b7481944b06e99 Jianxin Xiong   2016-12-07  1647  
ef90f0a1913e8b Dean Luick      2023-01-09  1648  static struct rdma_hw_stats *hfi1_alloc_hw_device_stats(struct ib_device *ibdev)
b7481944b06e99 Jianxin Xiong   2016-12-07  1649  {
ef90f0a1913e8b Dean Luick      2023-01-09 @1650  	if (!dev_cntr_descs) {
4b5f4d3fb40898 Jason Gunthorpe 2021-06-11  1651  		struct hfi1_devdata *dd = dd_from_ibdev(ibdev);
ef90f0a1913e8b Dean Luick      2023-01-09  1652  		int i, err;
b7481944b06e99 Jianxin Xiong   2016-12-07  1653  
ef90f0a1913e8b Dean Luick      2023-01-09  1654  		err = init_cntr_names(dd->cntrnames, dd->cntrnameslen,
ef90f0a1913e8b Dean Luick      2023-01-09  1655  				      num_driver_cntrs,
13f30b0fa0a9fa Aharon Landau   2021-10-08  1656  				      &num_dev_cntrs, &dev_cntr_descs);
4b5f4d3fb40898 Jason Gunthorpe 2021-06-11  1657  		if (err)
ef90f0a1913e8b Dean Luick      2023-01-09  1658  			return NULL;
b7481944b06e99 Jianxin Xiong   2016-12-07  1659  
b7481944b06e99 Jianxin Xiong   2016-12-07  1660  		for (i = 0; i < num_driver_cntrs; i++)
ef90f0a1913e8b Dean Luick      2023-01-09 @1661  			dev_cntr_descs[num_dev_cntrs + i].name =
ef90f0a1913e8b Dean Luick      2023-01-09  1662  							driver_cntr_names[i];
b7481944b06e99 Jianxin Xiong   2016-12-07  1663  	}
13f30b0fa0a9fa Aharon Landau   2021-10-08  1664  	return rdma_alloc_hw_stats_struct(dev_cntr_descs,
b7481944b06e99 Jianxin Xiong   2016-12-07  1665  					  num_dev_cntrs + num_driver_cntrs,
b7481944b06e99 Jianxin Xiong   2016-12-07  1666  					  RDMA_HW_STATS_DEFAULT_LIFESPAN);
4b5f4d3fb40898 Jason Gunthorpe 2021-06-11  1667  }
4b5f4d3fb40898 Jason Gunthorpe 2021-06-11  1668  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
