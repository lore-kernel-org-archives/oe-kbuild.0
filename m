Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81900CA6E
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 15:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691161720; x=1722697720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8CkJiRq3YCW+s7+98uPoL/4PtDrVzrMpl73Ir+4s8L4=;
  b=Cer3EKA3auuTJCXI4AeGvnkrx2SLoOx2GXubbJiJ6mCcTEcYSNRlXitG
   YhowFk5nMN8+E3TDTYs9XwV06gIpG6LG9gV6bTwrHketX+dxfBDB4uTTa
   0lHAETfLkSY80LpN8pZOTyjGRkWSZql0nWQU4ywDfY7kbY4qDBZ0a4kTV
   5GjD3uDSIdLQNxCMJCmighvlvFaz/lZwBwQ7+eEbY/AsM3hkRYFvQ7bIE
   hV1+tL7oHVP9vqOw3pegHVIMOJB5rcD1EOMKDTSK/uM1LyPg8ljy+H/DV
   GZT6tewuIEz2dAkab1A2oBMcEGoIa0uEM3efDvbFao6K6VgREuvMjUx+C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="372919812"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="372919812"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 08:08:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="1060759467"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="1060759467"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Aug 2023 08:08:37 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRwPt-0002ux-01;
	Fri, 04 Aug 2023 15:08:37 +0000
Date: Fri, 4 Aug 2023 23:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v16 08/14] remoteproc: mediatek: Probe SCP cluster on
 multi-core SCP
Message-ID: <202308042238.WSseyykL-lkp@intel.com>
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
In-Reply-To: <20230728023959.12293-9-tinghan.shen@mediatek.com>
References: <20230728023959.12293-9-tinghan.shen@mediatek.com>
TO: Tinghan Shen <tinghan.shen@mediatek.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Mathieu Poirier <mathieu.poirier@linaro.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Tinghan Shen <tinghan.shen@mediatek.com>
CC: linux-remoteproc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: Project_Global_Chrome_Upstream_Group@mediatek.com

Hi Tinghan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on robh/for-next linus/master v6.5-rc4 next-20230804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tinghan-Shen/dt-bindings-remoteproc-mediatek-Improve-the-rpmsg-subnode-definition/20230728-104236
base:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20230728023959.12293-9-tinghan.shen%40mediatek.com
patch subject: [PATCH v16 08/14] remoteproc: mediatek: Probe SCP cluster on multi-core SCP
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: riscv-randconfig-m031-20230730 (https://download.01.org/0day-ci/archive/20230804/202308042238.WSseyykL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308042238.WSseyykL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308042238.WSseyykL-lkp@intel.com/

smatch warnings:
drivers/remoteproc/mtk_scp.c:1031 scp_add_multi_core() error: uninitialized symbol 'scp'.

vim +/scp +1031 drivers/remoteproc/mtk_scp.c

76e4473e739c8f Tinghan Shen 2023-07-28   978  
9d6dcc98542358 Tinghan Shen 2023-07-28   979  static int scp_add_multi_core(struct platform_device *pdev,
9d6dcc98542358 Tinghan Shen 2023-07-28   980  			      struct mtk_scp_of_cluster *scp_cluster)
9d6dcc98542358 Tinghan Shen 2023-07-28   981  {
9d6dcc98542358 Tinghan Shen 2023-07-28   982  	struct device *dev = &pdev->dev;
9d6dcc98542358 Tinghan Shen 2023-07-28   983  	struct device_node *np = dev_of_node(dev);
9d6dcc98542358 Tinghan Shen 2023-07-28   984  	struct platform_device *cpdev;
9d6dcc98542358 Tinghan Shen 2023-07-28   985  	struct device_node *child;
9d6dcc98542358 Tinghan Shen 2023-07-28   986  	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
9d6dcc98542358 Tinghan Shen 2023-07-28   987  	const struct mtk_scp_of_data **cluster_of_data;
9d6dcc98542358 Tinghan Shen 2023-07-28   988  	struct mtk_scp *scp, *temp;
9d6dcc98542358 Tinghan Shen 2023-07-28   989  	int core_id = 0;
9d6dcc98542358 Tinghan Shen 2023-07-28   990  	int ret;
9d6dcc98542358 Tinghan Shen 2023-07-28   991  
9d6dcc98542358 Tinghan Shen 2023-07-28   992  	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
9d6dcc98542358 Tinghan Shen 2023-07-28   993  
9d6dcc98542358 Tinghan Shen 2023-07-28   994  	for_each_available_child_of_node(np, child) {
9d6dcc98542358 Tinghan Shen 2023-07-28   995  		if (!cluster_of_data[core_id]) {
9d6dcc98542358 Tinghan Shen 2023-07-28   996  			ret = -EINVAL;
9d6dcc98542358 Tinghan Shen 2023-07-28   997  			dev_err(dev, "Not support core %d\n", core_id);
9d6dcc98542358 Tinghan Shen 2023-07-28   998  			of_node_put(child);
9d6dcc98542358 Tinghan Shen 2023-07-28   999  			goto init_fail;
9d6dcc98542358 Tinghan Shen 2023-07-28  1000  		}
9d6dcc98542358 Tinghan Shen 2023-07-28  1001  
9d6dcc98542358 Tinghan Shen 2023-07-28  1002  		cpdev = of_find_device_by_node(child);
9d6dcc98542358 Tinghan Shen 2023-07-28  1003  		if (!cpdev) {
9d6dcc98542358 Tinghan Shen 2023-07-28  1004  			ret = -ENODEV;
9d6dcc98542358 Tinghan Shen 2023-07-28  1005  			dev_err(dev, "Not found platform device for core %d\n", core_id);
9d6dcc98542358 Tinghan Shen 2023-07-28  1006  			of_node_put(child);
9d6dcc98542358 Tinghan Shen 2023-07-28  1007  			goto init_fail;
9d6dcc98542358 Tinghan Shen 2023-07-28  1008  		}
9d6dcc98542358 Tinghan Shen 2023-07-28  1009  
9d6dcc98542358 Tinghan Shen 2023-07-28  1010  		scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id]);
9d6dcc98542358 Tinghan Shen 2023-07-28  1011  		put_device(&cpdev->dev);
9d6dcc98542358 Tinghan Shen 2023-07-28  1012  		if (IS_ERR(scp)) {
9d6dcc98542358 Tinghan Shen 2023-07-28  1013  			ret = PTR_ERR(scp);
9d6dcc98542358 Tinghan Shen 2023-07-28  1014  			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
9d6dcc98542358 Tinghan Shen 2023-07-28  1015  			of_node_put(child);
9d6dcc98542358 Tinghan Shen 2023-07-28  1016  			goto init_fail;
9d6dcc98542358 Tinghan Shen 2023-07-28  1017  		}
9d6dcc98542358 Tinghan Shen 2023-07-28  1018  
9d6dcc98542358 Tinghan Shen 2023-07-28  1019  		ret = rproc_add(scp->rproc);
9d6dcc98542358 Tinghan Shen 2023-07-28  1020  		if (ret) {
9d6dcc98542358 Tinghan Shen 2023-07-28  1021  			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
9d6dcc98542358 Tinghan Shen 2023-07-28  1022  			of_node_put(child);
9d6dcc98542358 Tinghan Shen 2023-07-28  1023  			scp_free(scp);
9d6dcc98542358 Tinghan Shen 2023-07-28  1024  			goto init_fail;
9d6dcc98542358 Tinghan Shen 2023-07-28  1025  		}
9d6dcc98542358 Tinghan Shen 2023-07-28  1026  
9d6dcc98542358 Tinghan Shen 2023-07-28  1027  		list_add_tail(&scp->elem, scp_list);
9d6dcc98542358 Tinghan Shen 2023-07-28  1028  		core_id++;
9d6dcc98542358 Tinghan Shen 2023-07-28  1029  	}
9d6dcc98542358 Tinghan Shen 2023-07-28  1030  
9d6dcc98542358 Tinghan Shen 2023-07-28 @1031  	platform_set_drvdata(pdev, scp);
9d6dcc98542358 Tinghan Shen 2023-07-28  1032  
9d6dcc98542358 Tinghan Shen 2023-07-28  1033  	return 0;
9d6dcc98542358 Tinghan Shen 2023-07-28  1034  
9d6dcc98542358 Tinghan Shen 2023-07-28  1035  init_fail:
9d6dcc98542358 Tinghan Shen 2023-07-28  1036  	list_for_each_entry_safe_reverse(scp, temp, scp_list, elem) {
9d6dcc98542358 Tinghan Shen 2023-07-28  1037  		list_del(&scp->elem);
9d6dcc98542358 Tinghan Shen 2023-07-28  1038  		rproc_del(scp->rproc);
9d6dcc98542358 Tinghan Shen 2023-07-28  1039  		scp_free(scp);
9d6dcc98542358 Tinghan Shen 2023-07-28  1040  	}
9d6dcc98542358 Tinghan Shen 2023-07-28  1041  
9d6dcc98542358 Tinghan Shen 2023-07-28  1042  	return ret;
9d6dcc98542358 Tinghan Shen 2023-07-28  1043  }
9d6dcc98542358 Tinghan Shen 2023-07-28  1044  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
