Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C68A2D
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Oct 2023 00:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCxEs0LE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697416941; x=1728952941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4tUPlIvdtXnIs/+IAd8mE9M4px45XbFnL4kYzW0MA0A=;
  b=RCxEs0LELwDsW2KV0V4kdC2izEplm+meGqDFwO/QhIdjrueFV0VFN+eA
   JaVKDj5FSS+uU0udnjk/GYdk5VwJSxHTrzqfQAtxqAHusBWekXEaacnWr
   L5at8NvMENFwa4BUvfyWn+dr6bPzXGhBDIM7M/YfNtVG9E2jPbHAWNnQ0
   sMPmf7yDJ1tLc1lcSpkeUFQdo1RlMBnSuGH+2rYrgy8/PTtf7n7Ntsys7
   14DmTsImmzuLcGkzLiIALpZ2S0YfyGrOkfYwtp9TbpzoUr0F096qjgTp2
   Yn49d3hGCahgvEEjWqJCDwUNqe2bp991cjvADmD1aUTuZfWe1mxRR2qEl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="451909918"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="451909918"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 17:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="846197695"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="846197695"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Oct 2023 17:42:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsBgX-0007yc-1J;
	Mon, 16 Oct 2023 00:42:17 +0000
Date: Mon, 16 Oct 2023 08:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vireshk-pm:opp/required-opps 19/19] drivers/opp/of.c:183
 _opp_table_alloc_required_tables() warn: double check that we're allocating
 correct size: 8 vs 16
Message-ID: <202310160808.mQP87W9A-lkp@intel.com>
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
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/required-opps
head:   3799a6551d89a14a1057127dff1e92cbfb073984
commit: 3799a6551d89a14a1057127dff1e92cbfb073984 [19/19] OPP: Call dev_pm_opp_set_opp() for required OPPs
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20231015 (https://download.01.org/0day-ci/archive/20231016/202310160808.mQP87W9A-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160808.mQP87W9A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310160808.mQP87W9A-lkp@intel.com/

smatch warnings:
drivers/opp/of.c:183 _opp_table_alloc_required_tables() warn: double check that we're allocating correct size: 8 vs 16
drivers/opp/core.c:2587 dev_pm_opp_set_config() error: uninitialized symbol 'ret'.

vim +183 drivers/opp/of.c

5d6d106fa45501 Viresh Kumar       2018-06-07  156  
5d6d106fa45501 Viresh Kumar       2018-06-07  157  /*
5d6d106fa45501 Viresh Kumar       2018-06-07  158   * Populate all devices and opp tables which are part of "required-opps" list.
5d6d106fa45501 Viresh Kumar       2018-06-07  159   * Checking only the first OPP node should be enough.
5d6d106fa45501 Viresh Kumar       2018-06-07  160   */
5d6d106fa45501 Viresh Kumar       2018-06-07  161  static void _opp_table_alloc_required_tables(struct opp_table *opp_table,
5d6d106fa45501 Viresh Kumar       2018-06-07  162  					     struct device *dev,
5d6d106fa45501 Viresh Kumar       2018-06-07  163  					     struct device_node *opp_np)
5d6d106fa45501 Viresh Kumar       2018-06-07  164  {
5d6d106fa45501 Viresh Kumar       2018-06-07  165  	struct opp_table **required_opp_tables;
5d6d106fa45501 Viresh Kumar       2018-06-07  166  	struct device_node *required_np, *np;
7eba0c7641b000 Viresh Kumar       2019-11-25  167  	bool lazy = false;
3799a6551d89a1 Viresh Kumar       2023-10-13  168  	int count, i, size;
5d6d106fa45501 Viresh Kumar       2018-06-07  169  
5d6d106fa45501 Viresh Kumar       2018-06-07  170  	/* Traversing the first OPP node is all we need */
5d6d106fa45501 Viresh Kumar       2018-06-07  171  	np = of_get_next_available_child(opp_np, NULL);
5d6d106fa45501 Viresh Kumar       2018-06-07  172  	if (!np) {
6ee70e8c34e37a Nicola Mazzucato   2020-12-08  173  		dev_warn(dev, "Empty OPP table\n");
6ee70e8c34e37a Nicola Mazzucato   2020-12-08  174  
5d6d106fa45501 Viresh Kumar       2018-06-07  175  		return;
5d6d106fa45501 Viresh Kumar       2018-06-07  176  	}
5d6d106fa45501 Viresh Kumar       2018-06-07  177  
5d6d106fa45501 Viresh Kumar       2018-06-07  178  	count = of_count_phandle_with_args(np, "required-opps", NULL);
8b7912f4cb6c29 Pavankumar Kondeti 2021-09-30  179  	if (count <= 0)
5d6d106fa45501 Viresh Kumar       2018-06-07  180  		goto put_np;
5d6d106fa45501 Viresh Kumar       2018-06-07  181  
3799a6551d89a1 Viresh Kumar       2023-10-13  182  	size = sizeof(*required_opp_tables) + sizeof(*opp_table->required_devs);
3799a6551d89a1 Viresh Kumar       2023-10-13 @183  	required_opp_tables = kcalloc(count, size, GFP_KERNEL);
c0ab9e0812da8e Viresh Kumar       2019-05-08  184  	if (!required_opp_tables)
5d6d106fa45501 Viresh Kumar       2018-06-07  185  		goto put_np;
5d6d106fa45501 Viresh Kumar       2018-06-07  186  
5d6d106fa45501 Viresh Kumar       2018-06-07  187  	opp_table->required_opp_tables = required_opp_tables;
3799a6551d89a1 Viresh Kumar       2023-10-13  188  	opp_table->required_devs = (void *)(required_opp_tables + count);
5d6d106fa45501 Viresh Kumar       2018-06-07  189  	opp_table->required_opp_count = count;
5d6d106fa45501 Viresh Kumar       2018-06-07  190  
5d6d106fa45501 Viresh Kumar       2018-06-07  191  	for (i = 0; i < count; i++) {
5d6d106fa45501 Viresh Kumar       2018-06-07  192  		required_np = of_parse_required_opp(np, i);
5d6d106fa45501 Viresh Kumar       2018-06-07  193  		if (!required_np)
5d6d106fa45501 Viresh Kumar       2018-06-07  194  			goto free_required_tables;
5d6d106fa45501 Viresh Kumar       2018-06-07  195  
5d6d106fa45501 Viresh Kumar       2018-06-07  196  		required_opp_tables[i] = _find_table_of_opp_np(required_np);
5d6d106fa45501 Viresh Kumar       2018-06-07  197  		of_node_put(required_np);
5d6d106fa45501 Viresh Kumar       2018-06-07  198  
4fa82a87ba55f5 Hsin-Yi Wang       2021-06-16  199  		if (IS_ERR(required_opp_tables[i]))
7eba0c7641b000 Viresh Kumar       2019-11-25  200  			lazy = true;
5d6d106fa45501 Viresh Kumar       2018-06-07  201  	}
5d6d106fa45501 Viresh Kumar       2018-06-07  202  
7eba0c7641b000 Viresh Kumar       2019-11-25  203  	/* Let's do the linking later on */
64aaeb708245ac Viresh Kumar       2023-06-08  204  	if (lazy) {
64aaeb708245ac Viresh Kumar       2023-06-08  205  		/*
64aaeb708245ac Viresh Kumar       2023-06-08  206  		 * The OPP table is not held while allocating the table, take it
64aaeb708245ac Viresh Kumar       2023-06-08  207  		 * now to avoid corruption to the lazy_opp_tables list.
64aaeb708245ac Viresh Kumar       2023-06-08  208  		 */
64aaeb708245ac Viresh Kumar       2023-06-08  209  		mutex_lock(&opp_table_lock);
7eba0c7641b000 Viresh Kumar       2019-11-25  210  		list_add(&opp_table->lazy, &lazy_opp_tables);
64aaeb708245ac Viresh Kumar       2023-06-08  211  		mutex_unlock(&opp_table_lock);
58b984a1144b0d Viresh Kumar       2023-10-12  212  	}
7eba0c7641b000 Viresh Kumar       2019-11-25  213  
5d6d106fa45501 Viresh Kumar       2018-06-07  214  	goto put_np;
5d6d106fa45501 Viresh Kumar       2018-06-07  215  
5d6d106fa45501 Viresh Kumar       2018-06-07  216  free_required_tables:
5d6d106fa45501 Viresh Kumar       2018-06-07  217  	_opp_table_free_required_tables(opp_table);
5d6d106fa45501 Viresh Kumar       2018-06-07  218  put_np:
5d6d106fa45501 Viresh Kumar       2018-06-07  219  	of_node_put(np);
5d6d106fa45501 Viresh Kumar       2018-06-07  220  }
5d6d106fa45501 Viresh Kumar       2018-06-07  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
