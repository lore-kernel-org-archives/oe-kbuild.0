Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47849219EF
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Aug 2023 20:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691786639; x=1723322639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LQRJK8TDoQuMrQX0N0l1BaJWMlHdhXzPvkwrm9zp3fc=;
  b=hlZFQhYpTtbgIZN/gqx8ScVqUyJRSFA8/EHSsaaDJtNulJT13maIkprU
   ZhtPw/nencxJT3bCs0MGfvONsNvMsl/CCu87eXjQkLoK+fQ0SfTI7eFzf
   RnNlxqpICbgtHX2UQ+WMsomrHHIwapy7ffR8XD3VMPhybX5Pb02dtRnsE
   UBo8Rzjhz95N7V4WM1rgO1MYfdHBy5EO2bMXPbE64rOQpbJg7fOkYC4OR
   n7+S74TJ0pSohKUj3EMYYuGn8U5QbnKMw4yvdcDIysjLCPAlN4wg/JvpC
   NjbOeB8o4FWUfFxEFCoN0U6huYzxq6VQ2YZvibthGaDHY7Kk27u6zJReA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="370660939"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="370660939"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 13:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="732784317"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="732784317"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Aug 2023 13:43:52 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUYz9-00081P-17;
	Fri, 11 Aug 2023 20:43:51 +0000
Date: Sat, 12 Aug 2023 04:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/infiniband/hw/hfi1/verbs.c:1661 hfi1_alloc_hw_device_stats()
 error: we previously assumed 'dev_cntr_descs' could be null (see line 1650)
Message-ID: <202308120410.cpPKwe9p-lkp@intel.com>
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
head:   9106536c1aa37bcf60202ad93bb8b94bcd29f3f0
commit: ef90f0a1913e8b60101c374010847615172a77d1 IB/hfi1: Split IB counter allocation
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-m001-20230811 (https://download.01.org/0day-ci/archive/20230812/202308120410.cpPKwe9p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120410.cpPKwe9p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308120410.cpPKwe9p-lkp@intel.com/

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
