Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9BF10940
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 15:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dH2lGBZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699199435; x=1730735435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TPDIW4M+c+odopIK0i9ag03++/o4UGtp1wRT+FGk4tA=;
  b=dH2lGBZ0rEuyI9c7q8chSzX3asZM4P2kTHS6Zy5xVCSORzawaSDlKIcQ
   SnhuvZfxsdjJzYnJrKM+IU/yl9eUdKglYjqDmXuLCMsb2T/LIGbjZjyMc
   j+JZUbqe5FAVS+UePzd0QwJ3f9SPcKeFpInzK5ERk3PQCTkv8r3bU9Nj+
   GyTOj15S9rwGRWrPHqvQeGGkuiXk05XHrd66vCs592mbnQ3U25OmaK92v
   7CpUQfQxWMp/FnRAuuiatV6WRrEiBQJTg3WvoLRQnLH24gdhgMZi4FFi0
   Ohb1OsBDI97WNth2FzV4XHaQ5c1QmUnNa2hXYTkDS3NZyQr8mq8hjH3EZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2138011"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="2138011"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 07:50:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="885684640"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="885684640"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Nov 2023 07:50:32 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzfOP-0005ZQ-2r;
	Sun, 05 Nov 2023 15:50:29 +0000
Date: Sun, 5 Nov 2023 23:49:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/industrialio-gts-helper.c:246 gain_to_scaletables()
 warn: double check that we're allocating correct size: 4 vs 8
Message-ID: <202311052321.mvBY03CX-lkp@intel.com>
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
TO: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen <mazziesaccount@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c41041124bd14dd6610da256a3da4e5b74ce6b1
commit: e52afbd61039e2c5a4e611e23b4aa963d34a4aef iio: light: ROHM BU27034 Ambient Light Sensor
date:   7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231105/202311052321.mvBY03CX-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231105/202311052321.mvBY03CX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311052321.mvBY03CX-lkp@intel.com/

smatch warnings:
drivers/iio/industrialio-gts-helper.c:246 gain_to_scaletables() warn: double check that we're allocating correct size: 4 vs 8
drivers/iio/industrialio-gts-helper.c:269 gain_to_scaletables() error: uninitialized symbol 'ret'.
drivers/iio/industrialio-gts-helper.c:302 iio_gts_build_avail_scale_table() warn: double check that we're allocating correct size: 4 vs 8

vim +246 drivers/iio/industrialio-gts-helper.c

38416c28e16890 Matti Vaittinen 2023-03-31  180  
38416c28e16890 Matti Vaittinen 2023-03-31  181  static int gain_to_scaletables(struct iio_gts *gts, int **gains, int **scales)
38416c28e16890 Matti Vaittinen 2023-03-31  182  {
38416c28e16890 Matti Vaittinen 2023-03-31  183  	int ret, i, j, new_idx, time_idx;
38416c28e16890 Matti Vaittinen 2023-03-31  184  	int *all_gains;
38416c28e16890 Matti Vaittinen 2023-03-31  185  	size_t gain_bytes;
38416c28e16890 Matti Vaittinen 2023-03-31  186  
38416c28e16890 Matti Vaittinen 2023-03-31  187  	for (i = 0; i < gts->num_itime; i++) {
38416c28e16890 Matti Vaittinen 2023-03-31  188  		/*
38416c28e16890 Matti Vaittinen 2023-03-31  189  		 * Sort the tables for nice output and for easier finding of
38416c28e16890 Matti Vaittinen 2023-03-31  190  		 * unique values.
38416c28e16890 Matti Vaittinen 2023-03-31  191  		 */
38416c28e16890 Matti Vaittinen 2023-03-31  192  		sort(gains[i], gts->num_hwgain, sizeof(int), iio_gts_gain_cmp,
38416c28e16890 Matti Vaittinen 2023-03-31  193  		     NULL);
38416c28e16890 Matti Vaittinen 2023-03-31  194  
38416c28e16890 Matti Vaittinen 2023-03-31  195  		/* Convert gains to scales */
38416c28e16890 Matti Vaittinen 2023-03-31  196  		for (j = 0; j < gts->num_hwgain; j++) {
38416c28e16890 Matti Vaittinen 2023-03-31  197  			ret = iio_gts_total_gain_to_scale(gts, gains[i][j],
38416c28e16890 Matti Vaittinen 2023-03-31  198  							  &scales[i][2 * j],
38416c28e16890 Matti Vaittinen 2023-03-31  199  							  &scales[i][2 * j + 1]);
38416c28e16890 Matti Vaittinen 2023-03-31  200  			if (ret)
38416c28e16890 Matti Vaittinen 2023-03-31  201  				return ret;
38416c28e16890 Matti Vaittinen 2023-03-31  202  		}
38416c28e16890 Matti Vaittinen 2023-03-31  203  	}
38416c28e16890 Matti Vaittinen 2023-03-31  204  
38416c28e16890 Matti Vaittinen 2023-03-31  205  	gain_bytes = array_size(gts->num_hwgain, sizeof(int));
38416c28e16890 Matti Vaittinen 2023-03-31  206  	all_gains = kcalloc(gts->num_itime, gain_bytes, GFP_KERNEL);
38416c28e16890 Matti Vaittinen 2023-03-31  207  	if (!all_gains)
38416c28e16890 Matti Vaittinen 2023-03-31  208  		return -ENOMEM;
38416c28e16890 Matti Vaittinen 2023-03-31  209  
38416c28e16890 Matti Vaittinen 2023-03-31  210  	/*
38416c28e16890 Matti Vaittinen 2023-03-31  211  	 * We assume all the gains for same integration time were unique.
38416c28e16890 Matti Vaittinen 2023-03-31  212  	 * It is likely the first time table had greatest time multiplier as
38416c28e16890 Matti Vaittinen 2023-03-31  213  	 * the times are in the order of preference and greater times are
38416c28e16890 Matti Vaittinen 2023-03-31  214  	 * usually preferred. Hence we start from the last table which is likely
38416c28e16890 Matti Vaittinen 2023-03-31  215  	 * to have the smallest total gains.
38416c28e16890 Matti Vaittinen 2023-03-31  216  	 */
38416c28e16890 Matti Vaittinen 2023-03-31  217  	time_idx = gts->num_itime - 1;
38416c28e16890 Matti Vaittinen 2023-03-31  218  	memcpy(all_gains, gains[time_idx], gain_bytes);
38416c28e16890 Matti Vaittinen 2023-03-31  219  	new_idx = gts->num_hwgain;
38416c28e16890 Matti Vaittinen 2023-03-31  220  
38416c28e16890 Matti Vaittinen 2023-03-31  221  	while (time_idx--) {
38416c28e16890 Matti Vaittinen 2023-03-31  222  		for (j = 0; j < gts->num_hwgain; j++) {
38416c28e16890 Matti Vaittinen 2023-03-31  223  			int candidate = gains[time_idx][j];
38416c28e16890 Matti Vaittinen 2023-03-31  224  			int chk;
38416c28e16890 Matti Vaittinen 2023-03-31  225  
38416c28e16890 Matti Vaittinen 2023-03-31  226  			if (candidate > all_gains[new_idx - 1]) {
38416c28e16890 Matti Vaittinen 2023-03-31  227  				all_gains[new_idx] = candidate;
38416c28e16890 Matti Vaittinen 2023-03-31  228  				new_idx++;
38416c28e16890 Matti Vaittinen 2023-03-31  229  
38416c28e16890 Matti Vaittinen 2023-03-31  230  				continue;
38416c28e16890 Matti Vaittinen 2023-03-31  231  			}
38416c28e16890 Matti Vaittinen 2023-03-31  232  			for (chk = 0; chk < new_idx; chk++)
38416c28e16890 Matti Vaittinen 2023-03-31  233  				if (candidate <= all_gains[chk])
38416c28e16890 Matti Vaittinen 2023-03-31  234  					break;
38416c28e16890 Matti Vaittinen 2023-03-31  235  
38416c28e16890 Matti Vaittinen 2023-03-31  236  			if (candidate == all_gains[chk])
38416c28e16890 Matti Vaittinen 2023-03-31  237  				continue;
38416c28e16890 Matti Vaittinen 2023-03-31  238  
38416c28e16890 Matti Vaittinen 2023-03-31  239  			memmove(&all_gains[chk + 1], &all_gains[chk],
38416c28e16890 Matti Vaittinen 2023-03-31  240  				(new_idx - chk) * sizeof(int));
38416c28e16890 Matti Vaittinen 2023-03-31  241  			all_gains[chk] = candidate;
38416c28e16890 Matti Vaittinen 2023-03-31  242  			new_idx++;
38416c28e16890 Matti Vaittinen 2023-03-31  243  		}
38416c28e16890 Matti Vaittinen 2023-03-31  244  	}
38416c28e16890 Matti Vaittinen 2023-03-31  245  
38416c28e16890 Matti Vaittinen 2023-03-31 @246  	gts->avail_all_scales_table = kcalloc(new_idx, 2 * sizeof(int),
38416c28e16890 Matti Vaittinen 2023-03-31  247  					      GFP_KERNEL);
38416c28e16890 Matti Vaittinen 2023-03-31  248  	if (!gts->avail_all_scales_table) {
38416c28e16890 Matti Vaittinen 2023-03-31  249  		ret = -ENOMEM;
38416c28e16890 Matti Vaittinen 2023-03-31  250  		goto free_out;
38416c28e16890 Matti Vaittinen 2023-03-31  251  	}
38416c28e16890 Matti Vaittinen 2023-03-31  252  	gts->num_avail_all_scales = new_idx;
38416c28e16890 Matti Vaittinen 2023-03-31  253  
38416c28e16890 Matti Vaittinen 2023-03-31  254  	for (i = 0; i < gts->num_avail_all_scales; i++) {
38416c28e16890 Matti Vaittinen 2023-03-31  255  		ret = iio_gts_total_gain_to_scale(gts, all_gains[i],
38416c28e16890 Matti Vaittinen 2023-03-31  256  					&gts->avail_all_scales_table[i * 2],
38416c28e16890 Matti Vaittinen 2023-03-31  257  					&gts->avail_all_scales_table[i * 2 + 1]);
38416c28e16890 Matti Vaittinen 2023-03-31  258  
38416c28e16890 Matti Vaittinen 2023-03-31  259  		if (ret) {
38416c28e16890 Matti Vaittinen 2023-03-31  260  			kfree(gts->avail_all_scales_table);
38416c28e16890 Matti Vaittinen 2023-03-31  261  			gts->num_avail_all_scales = 0;
38416c28e16890 Matti Vaittinen 2023-03-31  262  			goto free_out;
38416c28e16890 Matti Vaittinen 2023-03-31  263  		}
38416c28e16890 Matti Vaittinen 2023-03-31  264  	}
38416c28e16890 Matti Vaittinen 2023-03-31  265  
38416c28e16890 Matti Vaittinen 2023-03-31  266  free_out:
38416c28e16890 Matti Vaittinen 2023-03-31  267  	kfree(all_gains);
38416c28e16890 Matti Vaittinen 2023-03-31  268  
38416c28e16890 Matti Vaittinen 2023-03-31 @269  	return ret;
38416c28e16890 Matti Vaittinen 2023-03-31  270  }
38416c28e16890 Matti Vaittinen 2023-03-31  271  
38416c28e16890 Matti Vaittinen 2023-03-31  272  /**
38416c28e16890 Matti Vaittinen 2023-03-31  273   * iio_gts_build_avail_scale_table - create tables of available scales
38416c28e16890 Matti Vaittinen 2023-03-31  274   * @gts:	Gain time scale descriptor
38416c28e16890 Matti Vaittinen 2023-03-31  275   *
38416c28e16890 Matti Vaittinen 2023-03-31  276   * Build the tables which can represent the available scales based on the
38416c28e16890 Matti Vaittinen 2023-03-31  277   * originally given gain and time tables. When both time and gain tables are
38416c28e16890 Matti Vaittinen 2023-03-31  278   * given this results:
38416c28e16890 Matti Vaittinen 2023-03-31  279   * 1. A set of tables representing available scales for each supported
38416c28e16890 Matti Vaittinen 2023-03-31  280   *    integration time.
38416c28e16890 Matti Vaittinen 2023-03-31  281   * 2. A single table listing all the unique scales that any combination of
38416c28e16890 Matti Vaittinen 2023-03-31  282   *    supported gains and times can provide.
38416c28e16890 Matti Vaittinen 2023-03-31  283   *
38416c28e16890 Matti Vaittinen 2023-03-31  284   * NOTE: Space allocated for the tables must be freed using
38416c28e16890 Matti Vaittinen 2023-03-31  285   * iio_gts_purge_avail_scale_table() when the tables are no longer needed.
38416c28e16890 Matti Vaittinen 2023-03-31  286   *
38416c28e16890 Matti Vaittinen 2023-03-31  287   * Return: 0 on success.
38416c28e16890 Matti Vaittinen 2023-03-31  288   */
38416c28e16890 Matti Vaittinen 2023-03-31  289  static int iio_gts_build_avail_scale_table(struct iio_gts *gts)
38416c28e16890 Matti Vaittinen 2023-03-31  290  {
38416c28e16890 Matti Vaittinen 2023-03-31  291  	int **per_time_gains, **per_time_scales, i, j, ret = -ENOMEM;
38416c28e16890 Matti Vaittinen 2023-03-31  292  
38416c28e16890 Matti Vaittinen 2023-03-31  293  	per_time_gains = kcalloc(gts->num_itime, sizeof(*per_time_gains), GFP_KERNEL);
38416c28e16890 Matti Vaittinen 2023-03-31  294  	if (!per_time_gains)
38416c28e16890 Matti Vaittinen 2023-03-31  295  		return ret;
38416c28e16890 Matti Vaittinen 2023-03-31  296  
38416c28e16890 Matti Vaittinen 2023-03-31  297  	per_time_scales = kcalloc(gts->num_itime, sizeof(*per_time_scales), GFP_KERNEL);
38416c28e16890 Matti Vaittinen 2023-03-31  298  	if (!per_time_scales)
38416c28e16890 Matti Vaittinen 2023-03-31  299  		goto free_gains;
38416c28e16890 Matti Vaittinen 2023-03-31  300  
38416c28e16890 Matti Vaittinen 2023-03-31  301  	for (i = 0; i < gts->num_itime; i++) {
38416c28e16890 Matti Vaittinen 2023-03-31 @302  		per_time_scales[i] = kcalloc(gts->num_hwgain, 2 * sizeof(int),
38416c28e16890 Matti Vaittinen 2023-03-31  303  					     GFP_KERNEL);
38416c28e16890 Matti Vaittinen 2023-03-31  304  		if (!per_time_scales[i])
38416c28e16890 Matti Vaittinen 2023-03-31  305  			goto err_free_out;
38416c28e16890 Matti Vaittinen 2023-03-31  306  
38416c28e16890 Matti Vaittinen 2023-03-31  307  		per_time_gains[i] = kcalloc(gts->num_hwgain, sizeof(int),
38416c28e16890 Matti Vaittinen 2023-03-31  308  					    GFP_KERNEL);
38416c28e16890 Matti Vaittinen 2023-03-31  309  		if (!per_time_gains[i]) {
38416c28e16890 Matti Vaittinen 2023-03-31  310  			kfree(per_time_scales[i]);
38416c28e16890 Matti Vaittinen 2023-03-31  311  			goto err_free_out;
38416c28e16890 Matti Vaittinen 2023-03-31  312  		}
38416c28e16890 Matti Vaittinen 2023-03-31  313  
38416c28e16890 Matti Vaittinen 2023-03-31  314  		for (j = 0; j < gts->num_hwgain; j++)
38416c28e16890 Matti Vaittinen 2023-03-31  315  			per_time_gains[i][j] = gts->hwgain_table[j].gain *
38416c28e16890 Matti Vaittinen 2023-03-31  316  					       gts->itime_table[i].mul;
38416c28e16890 Matti Vaittinen 2023-03-31  317  	}
38416c28e16890 Matti Vaittinen 2023-03-31  318  
38416c28e16890 Matti Vaittinen 2023-03-31  319  	ret = gain_to_scaletables(gts, per_time_gains, per_time_scales);
38416c28e16890 Matti Vaittinen 2023-03-31  320  	if (ret)
38416c28e16890 Matti Vaittinen 2023-03-31  321  		goto err_free_out;
38416c28e16890 Matti Vaittinen 2023-03-31  322  
38416c28e16890 Matti Vaittinen 2023-03-31  323  	kfree(per_time_gains);
38416c28e16890 Matti Vaittinen 2023-03-31  324  	gts->per_time_avail_scale_tables = per_time_scales;
38416c28e16890 Matti Vaittinen 2023-03-31  325  
38416c28e16890 Matti Vaittinen 2023-03-31  326  	return 0;
38416c28e16890 Matti Vaittinen 2023-03-31  327  
38416c28e16890 Matti Vaittinen 2023-03-31  328  err_free_out:
38416c28e16890 Matti Vaittinen 2023-03-31  329  	for (i--; i; i--) {
38416c28e16890 Matti Vaittinen 2023-03-31  330  		kfree(per_time_scales[i]);
38416c28e16890 Matti Vaittinen 2023-03-31  331  		kfree(per_time_gains[i]);
38416c28e16890 Matti Vaittinen 2023-03-31  332  	}
38416c28e16890 Matti Vaittinen 2023-03-31  333  	kfree(per_time_scales);
38416c28e16890 Matti Vaittinen 2023-03-31  334  free_gains:
38416c28e16890 Matti Vaittinen 2023-03-31  335  	kfree(per_time_gains);
38416c28e16890 Matti Vaittinen 2023-03-31  336  
38416c28e16890 Matti Vaittinen 2023-03-31  337  	return ret;
38416c28e16890 Matti Vaittinen 2023-03-31  338  }
38416c28e16890 Matti Vaittinen 2023-03-31  339  

:::::: The code at line 246 was first introduced by commit
:::::: 38416c28e16890b52fdd5eb73479299ec3f062f3 iio: light: Add gain-time-scale helpers

:::::: TO: Matti Vaittinen <mazziesaccount@gmail.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
