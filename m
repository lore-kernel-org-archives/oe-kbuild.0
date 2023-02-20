Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7196A1119
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Feb 2023 09:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676884632; x=1708420632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N0U7hZb4I0ZPBDzlah6Hk3/LH2RHDQAkH5SCD1BeHwA=;
  b=OKpKEDJZ4hPhnCRNTn4g8sPvSCLzQHb9PCMQyngTGRndMm5a4OthBNND
   Tj2epcPea1WEejxa4Cna9csUUs4qv3eG/+IkcCoQHVnomotIH5EOA65/e
   zcU1/lwuCBlE++kq/n0KjxuF9vhsz73VlXhjN9zbruZzN834pyz8d/PIh
   JrUpQb3Mly3ekfSpFIh8eIRfrjdB7707Zh2fOoaogIO7JUfG2w/YZZquv
   cqQoSTV+xJPgrv0Y27gfPNAJlR2UeWXpVMYOMf8n/bT3WdAvVEiaaa3wm
   daxyFrcZB4ywcMJKCSPelbU1kXr+/KxiEPbKLLFGYPDhPqwKA4fCd3lM2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="394842375"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="394842375"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 01:17:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="664574163"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="664574163"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Feb 2023 01:17:09 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU2IH-000Dp3-0i;
	Mon, 20 Feb 2023 09:17:09 +0000
Date: Mon, 20 Feb 2023 17:16:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2492/13681]
 drivers/infiniband/hw/hfi1/verbs.c:1661 hfi1_alloc_hw_device_stats() error:
 we previously assumed 'dev_cntr_descs' could be null (see line 1650)
Message-ID: <202302201710.aojo2ybx-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dean Luick <dean.luick@cornelisnetworks.com>
CC: Leon Romanovsky <leon@kernel.org>
CC: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d2af0fa4bfa4ec29d03b449ccd43fee39501112d
commit: ef90f0a1913e8b60101c374010847615172a77d1 [2492/13681] IB/hfi1: Split IB counter allocation
:::::: branch date: 4 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230220/202302201710.aojo2ybx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302201710.aojo2ybx-lkp@intel.com/

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
https://github.com/intel/lkp-tests
