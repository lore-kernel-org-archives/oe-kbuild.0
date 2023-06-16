Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27468808
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jun 2023 03:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686887589; x=1718423589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KnUSwK/mzc7onm9UaFS+3bLseJkHJFCGQUiRxRPy7CI=;
  b=gXS++VfMox/1c3J4uRz4h6uG8qO/mjWEDZUn1SkBwe7fUPKMj9Rpw2I3
   U5tTpijMwAOeZLhZQqyje7K6RjRdC1QATXh93wygXfjVPFr9+bgz05JB5
   zC2JWmUo25S56HG4k3+rsm0bzH6kgZeDJX3BJVKmo6uJ2DXUiNfwta+vo
   YGqn1vN3BAKPX4ynZwXttkl04KGZmu3prir2FBP+5gwO96SyIiwdpERxk
   IgEhaTRqLV/EwCE3tBz4p15o5hoFuaJVTUsiCXcJk+6cxtSG5VAmTKqg5
   vLR/eeMJw8LGzVOJr7aoDHDtsp0U70djisLlqNYg0wdLf9pWGJ45L5waj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="425041189"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="425041189"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 20:53:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="715851813"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="715851813"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Jun 2023 20:53:07 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA0WI-0000mL-0u;
	Fri, 16 Jun 2023 03:53:06 +0000
Date: Fri, 16 Jun 2023 11:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [coresight:next 11/21]
 drivers/hwtracing/coresight/coresight-core.c:349 coresight_enable_link()
 warn: passing a valid pointer to 'PTR_ERR'
Message-ID: <202306161134.akhjL4Ok-lkp@intel.com>
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
TO: James Clark <james.clark@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>
CC: Mike Leach <mike.leach@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git next
head:   3b79104f80036231a40ba5d15c3e329985029a0f
commit: ae7f2b5a7b569f8ede4af9e215515e5a0b824edd [11/21] coresight: Make refcount a property of the connection
:::::: branch date: 20 hours ago
:::::: commit date: 11 days ago
config: arm-randconfig-m031-20230611 (https://download.01.org/0day-ci/archive/20230616/202306161134.akhjL4Ok-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306161134.akhjL4Ok-lkp@intel.com/

New smatch warnings:
drivers/hwtracing/coresight/coresight-core.c:349 coresight_enable_link() warn: passing a valid pointer to 'PTR_ERR'

Old smatch warnings:
drivers/hwtracing/coresight/coresight-core.c:351 coresight_enable_link() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +349 drivers/hwtracing/coresight/coresight-core.c

a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  332  
b3e94405941e69 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-02-17  333  static int coresight_enable_link(struct coresight_device *csdev,
b3e94405941e69 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-02-17  334  				 struct coresight_device *parent,
b3e94405941e69 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-02-17  335  				 struct coresight_device *child)
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  336  {
edda32dabedb01 drivers/hwtracing/coresight/coresight.c      Yabin Cui        2019-11-04  337  	int ret = 0;
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  338  	int link_subtype;
ae7f2b5a7b569f drivers/hwtracing/coresight/coresight-core.c James Clark      2023-04-25  339  	struct coresight_connection *inconn, *outconn;
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  340  
b3e94405941e69 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-02-17  341  	if (!parent || !child)
b3e94405941e69 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-02-17  342  		return -EINVAL;
b3e94405941e69 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-02-17  343  
ae7f2b5a7b569f drivers/hwtracing/coresight/coresight-core.c James Clark      2023-04-25  344  	inconn = coresight_find_out_connection(parent, csdev);
ae7f2b5a7b569f drivers/hwtracing/coresight/coresight-core.c James Clark      2023-04-25  345  	outconn = coresight_find_out_connection(csdev, child);
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  346  	link_subtype = csdev->subtype.link_subtype;
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  347  
ae7f2b5a7b569f drivers/hwtracing/coresight/coresight-core.c James Clark      2023-04-25  348  	if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_MERG && IS_ERR(inconn))
ae7f2b5a7b569f drivers/hwtracing/coresight/coresight-core.c James Clark      2023-04-25 @349  		return PTR_ERR(inconn);
ae7f2b5a7b569f drivers/hwtracing/coresight/coresight-core.c James Clark      2023-04-25  350  	if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_SPLIT && IS_ERR(outconn))
ae7f2b5a7b569f drivers/hwtracing/coresight/coresight-core.c James Clark      2023-04-25  351  		return PTR_ERR(outconn);
fe470f5f7f684e drivers/hwtracing/coresight/coresight.c      Suzuki K Poulose 2018-07-11  352  
177af8285b59a3 drivers/hwtracing/coresight/coresight.c      Mike Leach       2020-03-20  353  	if (link_ops(csdev)->enable) {
177af8285b59a3 drivers/hwtracing/coresight/coresight.c      Mike Leach       2020-03-20  354  		ret = coresight_control_assoc_ectdev(csdev, true);
177af8285b59a3 drivers/hwtracing/coresight/coresight.c      Mike Leach       2020-03-20  355  		if (!ret) {
ae7f2b5a7b569f drivers/hwtracing/coresight/coresight-core.c James Clark      2023-04-25  356  			ret = link_ops(csdev)->enable(csdev, inconn, outconn);
177af8285b59a3 drivers/hwtracing/coresight/coresight.c      Mike Leach       2020-03-20  357  			if (ret)
177af8285b59a3 drivers/hwtracing/coresight/coresight.c      Mike Leach       2020-03-20  358  				coresight_control_assoc_ectdev(csdev, false);
177af8285b59a3 drivers/hwtracing/coresight/coresight.c      Mike Leach       2020-03-20  359  		}
177af8285b59a3 drivers/hwtracing/coresight/coresight.c      Mike Leach       2020-03-20  360  	}
177af8285b59a3 drivers/hwtracing/coresight/coresight.c      Mike Leach       2020-03-20  361  
edda32dabedb01 drivers/hwtracing/coresight/coresight.c      Yabin Cui        2019-11-04  362  	if (!ret)
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  363  		csdev->enable = true;
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  364  
edda32dabedb01 drivers/hwtracing/coresight/coresight.c      Yabin Cui        2019-11-04  365  	return ret;
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  366  }
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  367  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
