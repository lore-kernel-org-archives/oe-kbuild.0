Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AED138E
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzADo6VN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585173; x=1733121173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CBaPZfL0NDpow5zeDLrcRDKupNJbJtoNUMdpPXDk21g=;
  b=FzADo6VNL1RlhkXIz4U2htg6MSDTtO3WkE1F9B1v6OTAxWhNTa7YgASJ
   DToyECXHKZHPmZNAySD7GxC4TYyvwob9wP06zJvrPrNQGvISE4SLdVS0x
   bhYrtMb04FLA0kpdGa006BmVPn+3yHYFIMcq7oc9LXA19wbo/eqwAN1WB
   V9SuXTjVzZo5ST1sdjy0IKWLFCahpa5YKDyLCX6N6XK53dG9Uhm20Urlg
   Pobuy1a3u8XyovXJ9+caFtJ3ORGCtYd13SUkkPO8gnWTiPXIQCjLtKJkU
   lqnXAB+g/BmCb6L/DBTXPQCquhQIdJnBEPvTRB8wi0tNG06SveTTxuWpK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180407"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180407"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="914081665"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="914081665"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2023 22:32:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006L2-09;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/remoteproc/mtk_scp.c:1037 scp_add_multi_core() error:
 uninitialized symbol 'scp'.
Message-ID: <202312030812.Fv5G90V3-lkp@intel.com>
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
TO: Tinghan Shen <tinghan.shen@mediatek.com>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 1fdbf0cdde98c113b17f8cd089a892c5f0437d3e remoteproc: mediatek: Probe SCP cluster on multi-core SCP
date:   3 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 3 months ago
config: hexagon-randconfig-r071-20231124 (https://download.01.org/0day-ci/archive/20231203/202312030812.Fv5G90V3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312030812.Fv5G90V3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312030812.Fv5G90V3-lkp@intel.com/

smatch warnings:
drivers/remoteproc/mtk_scp.c:1037 scp_add_multi_core() error: uninitialized symbol 'scp'.

vim +/scp +1037 drivers/remoteproc/mtk_scp.c

eaf5b89953b0f8 Tinghan Shen 2023-09-01   978  
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   979  static int scp_add_multi_core(struct platform_device *pdev,
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   980  			      struct mtk_scp_of_cluster *scp_cluster)
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   981  {
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   982  	struct device *dev = &pdev->dev;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   983  	struct device_node *np = dev_of_node(dev);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   984  	struct platform_device *cpdev;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   985  	struct device_node *child;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   986  	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   987  	const struct mtk_scp_of_data **cluster_of_data;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   988  	struct mtk_scp *scp, *temp;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   989  	int core_id = 0;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   990  	int ret;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   991  
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   992  	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   993  
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   994  	for_each_available_child_of_node(np, child) {
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   995  		if (!cluster_of_data[core_id]) {
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   996  			ret = -EINVAL;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   997  			dev_err(dev, "Not support core %d\n", core_id);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   998  			of_node_put(child);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01   999  			goto init_fail;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1000  		}
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1001  
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1002  		cpdev = of_find_device_by_node(child);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1003  		if (!cpdev) {
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1004  			ret = -ENODEV;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1005  			dev_err(dev, "Not found platform device for core %d\n", core_id);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1006  			of_node_put(child);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1007  			goto init_fail;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1008  		}
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1009  
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1010  		scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id]);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1011  		put_device(&cpdev->dev);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1012  		if (IS_ERR(scp)) {
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1013  			ret = PTR_ERR(scp);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1014  			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1015  			of_node_put(child);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1016  			goto init_fail;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1017  		}
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1018  
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1019  		ret = rproc_add(scp->rproc);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1020  		if (ret) {
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1021  			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1022  			of_node_put(child);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1023  			scp_free(scp);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1024  			goto init_fail;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1025  		}
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1026  
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1027  		list_add_tail(&scp->elem, scp_list);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1028  		core_id++;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1029  	}
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1030  
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1031  	/*
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1032  	 * Here we are setting the platform device for @pdev to the last @scp that was
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1033  	 * created, which is needed because (1) scp_rproc_init() is calling
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1034  	 * platform_set_drvdata() on the child platform devices and (2) we need a handle to
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1035  	 * the cluster list in scp_remove().
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1036  	 */
1fdbf0cdde98c1 Tinghan Shen 2023-09-01 @1037  	platform_set_drvdata(pdev, scp);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1038  
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1039  	return 0;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1040  
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1041  init_fail:
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1042  	list_for_each_entry_safe_reverse(scp, temp, scp_list, elem) {
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1043  		list_del(&scp->elem);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1044  		rproc_del(scp->rproc);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1045  		scp_free(scp);
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1046  	}
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1047  
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1048  	return ret;
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1049  }
1fdbf0cdde98c1 Tinghan Shen 2023-09-01  1050  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
