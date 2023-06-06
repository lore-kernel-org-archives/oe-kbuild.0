Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17AE17AB4
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jun 2023 13:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686058109; x=1717594109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ePkOYrD5pfn4a0OxfTcI+wlBSHbRpy7VRO86KRY2n8E=;
  b=XSEOpTjFbq7SLd8+De7CKpz5rnyTjTElEdtVUzEmH6ncBVtCltRK6oeh
   9LhF0yv2NbbRJ2qb2coozqum4OPu8SjIgrKnhtbn8dqDfp36q35CUnlXO
   Y36QZmD/v+hEi8ziJoB/vHyyon/n0UwL3dH4agH6NYsYCVPJKZPUSs9n8
   BIjF3b3h5zlUkMmbI9/yHjEQ5BqjZWRw6mEj+dNdD5zb15vR0i7yXURvh
   XG5uBEl29htWpb5AQVlVFfp4s1s7QZBl7FGItKt+fdLQM24SowxjOYQDW
   SmQf8S8yWnvVCaDZho9cegxOoSgAErQ01t0TNmyn40gsYJ2GMB46YfbFW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="346273579"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="346273579"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 06:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="1039173697"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="1039173697"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Jun 2023 06:28:27 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6Wja-0005Hr-2G;
	Tue, 06 Jun 2023 13:28:26 +0000
Date: Tue, 6 Jun 2023 21:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/industrialio-gts-helper.c:394
 iio_gts_build_avail_time_table() warn: double check that we're allocating
 correct size: 4 vs 8
Message-ID: <202306062106.tYrl7eCa-lkp@intel.com>
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
head:   f8dba31b0a826e691949cd4fdfa5c30defaac8c5
commit: e65065132fa6d9e1fd3b7418eae5215e3b7bf6c7 iio: gts-helpers: fix integration time units
date:   3 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-m001-20230605 (https://download.01.org/0day-ci/archive/20230606/202306062106.tYrl7eCa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306062106.tYrl7eCa-lkp@intel.com/

New smatch warnings:
drivers/iio/industrialio-gts-helper.c:394 iio_gts_build_avail_time_table() warn: double check that we're allocating correct size: 4 vs 8

Old smatch warnings:
drivers/iio/industrialio-gts-helper.c:246 gain_to_scaletables() warn: double check that we're allocating correct size: 4 vs 8
drivers/iio/industrialio-gts-helper.c:269 gain_to_scaletables() error: uninitialized symbol 'ret'.
drivers/iio/industrialio-gts-helper.c:302 iio_gts_build_avail_scale_table() warn: double check that we're allocating correct size: 4 vs 8

vim +394 drivers/iio/industrialio-gts-helper.c

e65065132fa6d9 Matti Vaittinen 2023-04-17  350  
38416c28e16890 Matti Vaittinen 2023-03-31  351  /**
38416c28e16890 Matti Vaittinen 2023-03-31  352   * iio_gts_build_avail_time_table - build table of available integration times
38416c28e16890 Matti Vaittinen 2023-03-31  353   * @gts:	Gain time scale descriptor
38416c28e16890 Matti Vaittinen 2023-03-31  354   *
38416c28e16890 Matti Vaittinen 2023-03-31  355   * Build the table which can represent the available times to be returned
38416c28e16890 Matti Vaittinen 2023-03-31  356   * to users using the read_avail-callback.
38416c28e16890 Matti Vaittinen 2023-03-31  357   *
38416c28e16890 Matti Vaittinen 2023-03-31  358   * NOTE: Space allocated for the tables must be freed using
38416c28e16890 Matti Vaittinen 2023-03-31  359   * iio_gts_purge_avail_time_table() when the tables are no longer needed.
38416c28e16890 Matti Vaittinen 2023-03-31  360   *
38416c28e16890 Matti Vaittinen 2023-03-31  361   * Return: 0 on success.
38416c28e16890 Matti Vaittinen 2023-03-31  362   */
38416c28e16890 Matti Vaittinen 2023-03-31  363  static int iio_gts_build_avail_time_table(struct iio_gts *gts)
38416c28e16890 Matti Vaittinen 2023-03-31  364  {
e65065132fa6d9 Matti Vaittinen 2023-04-17  365  	int *times, i, j, idx = 0, *int_micro_times;
38416c28e16890 Matti Vaittinen 2023-03-31  366  
38416c28e16890 Matti Vaittinen 2023-03-31  367  	if (!gts->num_itime)
38416c28e16890 Matti Vaittinen 2023-03-31  368  		return 0;
38416c28e16890 Matti Vaittinen 2023-03-31  369  
38416c28e16890 Matti Vaittinen 2023-03-31  370  	times = kcalloc(gts->num_itime, sizeof(int), GFP_KERNEL);
38416c28e16890 Matti Vaittinen 2023-03-31  371  	if (!times)
38416c28e16890 Matti Vaittinen 2023-03-31  372  		return -ENOMEM;
38416c28e16890 Matti Vaittinen 2023-03-31  373  
38416c28e16890 Matti Vaittinen 2023-03-31  374  	/* Sort times from all tables to one and remove duplicates */
38416c28e16890 Matti Vaittinen 2023-03-31  375  	for (i = gts->num_itime - 1; i >= 0; i--) {
38416c28e16890 Matti Vaittinen 2023-03-31  376  		int new = gts->itime_table[i].time_us;
38416c28e16890 Matti Vaittinen 2023-03-31  377  
38416c28e16890 Matti Vaittinen 2023-03-31  378  		if (times[idx] < new) {
38416c28e16890 Matti Vaittinen 2023-03-31  379  			times[idx++] = new;
38416c28e16890 Matti Vaittinen 2023-03-31  380  			continue;
38416c28e16890 Matti Vaittinen 2023-03-31  381  		}
38416c28e16890 Matti Vaittinen 2023-03-31  382  
38416c28e16890 Matti Vaittinen 2023-03-31  383  		for (j = 0; j <= idx; j++) {
38416c28e16890 Matti Vaittinen 2023-03-31  384  			if (times[j] > new) {
38416c28e16890 Matti Vaittinen 2023-03-31  385  				memmove(&times[j + 1], &times[j],
38416c28e16890 Matti Vaittinen 2023-03-31  386  					(idx - j) * sizeof(int));
38416c28e16890 Matti Vaittinen 2023-03-31  387  				times[j] = new;
38416c28e16890 Matti Vaittinen 2023-03-31  388  				idx++;
38416c28e16890 Matti Vaittinen 2023-03-31  389  			}
38416c28e16890 Matti Vaittinen 2023-03-31  390  		}
38416c28e16890 Matti Vaittinen 2023-03-31  391  	}
e65065132fa6d9 Matti Vaittinen 2023-04-17  392  
e65065132fa6d9 Matti Vaittinen 2023-04-17  393  	/* create a list of times formatted as list of IIO_VAL_INT_PLUS_MICRO */
e65065132fa6d9 Matti Vaittinen 2023-04-17 @394  	int_micro_times = kcalloc(idx, sizeof(int) * 2, GFP_KERNEL);
e65065132fa6d9 Matti Vaittinen 2023-04-17  395  	if (int_micro_times) {
38416c28e16890 Matti Vaittinen 2023-03-31  396  		/*
e65065132fa6d9 Matti Vaittinen 2023-04-17  397  		 * This is just to survive a unlikely corner-case where times in
e65065132fa6d9 Matti Vaittinen 2023-04-17  398  		 * the given time table were not unique. Else we could just
e65065132fa6d9 Matti Vaittinen 2023-04-17  399  		 * trust the gts->num_itime.
38416c28e16890 Matti Vaittinen 2023-03-31  400  		 */
38416c28e16890 Matti Vaittinen 2023-03-31  401  		gts->num_avail_time_tables = idx;
e65065132fa6d9 Matti Vaittinen 2023-04-17  402  		iio_gts_us_to_int_micro(times, int_micro_times, idx);
e65065132fa6d9 Matti Vaittinen 2023-04-17  403  	}
e65065132fa6d9 Matti Vaittinen 2023-04-17  404  
e65065132fa6d9 Matti Vaittinen 2023-04-17  405  	gts->avail_time_tables = int_micro_times;
e65065132fa6d9 Matti Vaittinen 2023-04-17  406  	kfree(times);
e65065132fa6d9 Matti Vaittinen 2023-04-17  407  
e65065132fa6d9 Matti Vaittinen 2023-04-17  408  	if (!int_micro_times)
e65065132fa6d9 Matti Vaittinen 2023-04-17  409  		return -ENOMEM;
38416c28e16890 Matti Vaittinen 2023-03-31  410  
38416c28e16890 Matti Vaittinen 2023-03-31  411  	return 0;
38416c28e16890 Matti Vaittinen 2023-03-31  412  }
38416c28e16890 Matti Vaittinen 2023-03-31  413  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
