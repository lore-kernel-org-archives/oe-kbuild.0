Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1006E8C04
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jun 2023 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687781833; x=1719317833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6dlwR/czVv81w56DNPNy6xSxmgJ1zbzxpwopeo0gQ0k=;
  b=oIgjte7WBBUBiWFnpbyneAYGYFAaAXW3EY4k2L/V5WwVxCyvMR1sW3fe
   biE/ME2kxCCQQmeyrIQGIpaZdkItbB905qAuPsH5Yi1qJ1J3iF+ky5zH6
   +/nTCP0zwZ69uQZWF+KyrcpSOlj64NAEdzJ+2bAWypu03V580+JUMmw+V
   QMFtQ1XkpjUzZNm0qptlx+94XgrQbCe4dpVfHP8o3pVX+kalJ/jtch8e4
   lMtHh1cglCBvv002FVU+qX7ztlTvs0Oc8WMgb2+yM7JQF9Hz6+fz0STyw
   OO5jVsOlHvWgapdftFVUoGFsAKyjbH7ybT72GU8iMTFUuAZv7l5fIrIXO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="341590582"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="341590582"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 05:17:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="781414290"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="781414290"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Jun 2023 05:17:08 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDl9X-000Agx-38;
	Mon, 26 Jun 2023 12:17:07 +0000
Date: Mon, 26 Jun 2023 20:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vireshk-pm:opp/linux-next 8/8] drivers/opp/of.c:516
 dev_pm_opp_of_find_icc_paths() warn: passing zero to 'dev_err_probe'
Message-ID: <202306262008.guNLgjt6-lkp@intel.com>
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
TO: Andrew Halaney <ahalaney@redhat.com>
CC: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next
head:   fa155f4f834882a79788218aea4914568b41dd0f
commit: fa155f4f834882a79788218aea4914568b41dd0f [8/8] OPP: Use dev_err_probe() when failing to get icc_path
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: openrisc-randconfig-m041-20230625 (https://download.01.org/0day-ci/archive/20230626/202306262008.guNLgjt6-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306262008.guNLgjt6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306262008.guNLgjt6-lkp@intel.com/

smatch warnings:
drivers/opp/of.c:516 dev_pm_opp_of_find_icc_paths() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +516 drivers/opp/of.c

45679f9b508f10 Sibi Sankar      2020-05-28  476  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  477  int dev_pm_opp_of_find_icc_paths(struct device *dev,
6d3f922c46f2e9 Georgi Djakov    2020-05-12  478  				 struct opp_table *opp_table)
6d3f922c46f2e9 Georgi Djakov    2020-05-12  479  {
6d3f922c46f2e9 Georgi Djakov    2020-05-12  480  	struct device_node *np;
45679f9b508f10 Sibi Sankar      2020-05-28  481  	int ret, i, count, num_paths;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  482  	struct icc_path **paths;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  483  
45679f9b508f10 Sibi Sankar      2020-05-28  484  	ret = _bandwidth_supported(dev, opp_table);
6ee70e8c34e37a Nicola Mazzucato 2020-12-08  485  	if (ret == -EINVAL)
6ee70e8c34e37a Nicola Mazzucato 2020-12-08  486  		return 0; /* Empty OPP table is a valid corner-case, let's not fail */
6ee70e8c34e37a Nicola Mazzucato 2020-12-08  487  	else if (ret <= 0)
45679f9b508f10 Sibi Sankar      2020-05-28  488  		return ret;
45679f9b508f10 Sibi Sankar      2020-05-28  489  
45679f9b508f10 Sibi Sankar      2020-05-28  490  	ret = 0;
45679f9b508f10 Sibi Sankar      2020-05-28  491  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  492  	np = of_node_get(dev->of_node);
6d3f922c46f2e9 Georgi Djakov    2020-05-12  493  	if (!np)
6d3f922c46f2e9 Georgi Djakov    2020-05-12  494  		return 0;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  495  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  496  	count = of_count_phandle_with_args(np, "interconnects",
6d3f922c46f2e9 Georgi Djakov    2020-05-12  497  					   "#interconnect-cells");
6d3f922c46f2e9 Georgi Djakov    2020-05-12  498  	of_node_put(np);
6d3f922c46f2e9 Georgi Djakov    2020-05-12  499  	if (count < 0)
6d3f922c46f2e9 Georgi Djakov    2020-05-12  500  		return 0;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  501  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  502  	/* two phandles when #interconnect-cells = <1> */
6d3f922c46f2e9 Georgi Djakov    2020-05-12  503  	if (count % 2) {
6d3f922c46f2e9 Georgi Djakov    2020-05-12  504  		dev_err(dev, "%s: Invalid interconnects values\n", __func__);
6d3f922c46f2e9 Georgi Djakov    2020-05-12  505  		return -EINVAL;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  506  	}
6d3f922c46f2e9 Georgi Djakov    2020-05-12  507  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  508  	num_paths = count / 2;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  509  	paths = kcalloc(num_paths, sizeof(*paths), GFP_KERNEL);
6d3f922c46f2e9 Georgi Djakov    2020-05-12  510  	if (!paths)
6d3f922c46f2e9 Georgi Djakov    2020-05-12  511  		return -ENOMEM;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  512  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  513  	for (i = 0; i < num_paths; i++) {
6d3f922c46f2e9 Georgi Djakov    2020-05-12  514  		paths[i] = of_icc_get_by_index(dev, i);
6d3f922c46f2e9 Georgi Djakov    2020-05-12  515  		if (IS_ERR(paths[i])) {
fa155f4f834882 Andrew Halaney   2023-06-23 @516  			ret = dev_err_probe(dev, ret, "%s: Unable to get path%d\n", __func__, i);
6d3f922c46f2e9 Georgi Djakov    2020-05-12  517  			goto err;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  518  		}
6d3f922c46f2e9 Georgi Djakov    2020-05-12  519  	}
6d3f922c46f2e9 Georgi Djakov    2020-05-12  520  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  521  	if (opp_table) {
6d3f922c46f2e9 Georgi Djakov    2020-05-12  522  		opp_table->paths = paths;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  523  		opp_table->path_count = num_paths;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  524  		return 0;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  525  	}
6d3f922c46f2e9 Georgi Djakov    2020-05-12  526  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  527  err:
6d3f922c46f2e9 Georgi Djakov    2020-05-12  528  	while (i--)
6d3f922c46f2e9 Georgi Djakov    2020-05-12  529  		icc_put(paths[i]);
6d3f922c46f2e9 Georgi Djakov    2020-05-12  530  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  531  	kfree(paths);
6d3f922c46f2e9 Georgi Djakov    2020-05-12  532  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  533  	return ret;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  534  }
6d3f922c46f2e9 Georgi Djakov    2020-05-12  535  EXPORT_SYMBOL_GPL(dev_pm_opp_of_find_icc_paths);
6d3f922c46f2e9 Georgi Djakov    2020-05-12  536  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
