Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2184D620
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Apr 2023 03:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682221563; x=1713757563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OCWnJetm8iE/O15anVyyyDgkwER1uptqFwD8ZG4VLIk=;
  b=ENr1JPeRXPXplgJCcGDKRI7jPnedwWxzglNcfxzM+UD8XfjgPaGiXEGz
   28CzvAKiPpbhs1/iL4MLzjL0jyTfsmiubpt18jBtnGk3ow+jrcgcow4EH
   HRxL84DVExHZT9D+YJxIfgbmDuGfYbpUSv9Dp0cdoiCf9xKs07D1HXsFB
   R7wgJwur8lide2qZmar4d0h1o3B8OS6LCL/EaBnIx0soOs/UteVu5eqP9
   nYdE3ETNVeYfSzIVvvMxP10Rd91IXddeo0ccAP/wQnancao4AEf6ELMQ9
   D20Nlsc7+xLHd//GLkHoCx0eUsbYPtuE2ay4Ri7+bWtcqkZbc3JUjgoSh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="374183146"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="374183146"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 20:46:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="1022297081"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="1022297081"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Apr 2023 20:46:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqQfn-000hg8-32;
	Sun, 23 Apr 2023 03:45:59 +0000
Date: Sun, 23 Apr 2023 11:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] iio: gts-helpers: fix integration time units
Message-ID: <202304231128.2wtp08sj-lkp@intel.com>
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
In-Reply-To: <eeacd192c259e885850b5a2dd8b776bccfc44fa8.1681722914.git.mazziesaccount@gmail.com>
References: <eeacd192c259e885850b5a2dd8b776bccfc44fa8.1681722914.git.mazziesaccount@gmail.com>
TO: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen <mazziesaccount@gmail.com>
TO: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen <mazziesaccount@gmail.com>
CC: Jonathan Cameron <jic23@kernel.org>
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Matti,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c86b0e73f0bebbb0245ef2bac4cf269d61ff828c]

url:    https://github.com/intel-lab-lkp/linux/commits/Matti-Vaittinen/iio-bu27034-Fix-integration-time/20230417-172240
base:   c86b0e73f0bebbb0245ef2bac4cf269d61ff828c
patch link:    https://lore.kernel.org/r/eeacd192c259e885850b5a2dd8b776bccfc44fa8.1681722914.git.mazziesaccount%40gmail.com
patch subject: [PATCH 2/2] iio: gts-helpers: fix integration time units
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: parisc-randconfig-m031-20230421 (https://download.01.org/0day-ci/archive/20230423/202304231128.2wtp08sj-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304231128.2wtp08sj-lkp@intel.com/

New smatch warnings:
drivers/iio/industrialio-gts-helper.c:395 iio_gts_build_avail_time_table() warn: double check that we're allocating correct size: 4 vs 8

Old smatch warnings:
drivers/iio/industrialio-gts-helper.c:246 gain_to_scaletables() warn: double check that we're allocating correct size: 4 vs 8
drivers/iio/industrialio-gts-helper.c:269 gain_to_scaletables() error: uninitialized symbol 'ret'.
drivers/iio/industrialio-gts-helper.c:302 iio_gts_build_avail_scale_table() warn: double check that we're allocating correct size: 4 vs 8

vim +395 drivers/iio/industrialio-gts-helper.c

0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  350  
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
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  365  	int *times, i, j, idx = 0, *int_micro_times;
38416c28e16890 Matti Vaittinen 2023-03-31  366  
38416c28e16890 Matti Vaittinen 2023-03-31  367  	if (!gts->num_itime)
38416c28e16890 Matti Vaittinen 2023-03-31  368  		return 0;
38416c28e16890 Matti Vaittinen 2023-03-31  369  
38416c28e16890 Matti Vaittinen 2023-03-31  370  	times = kcalloc(gts->num_itime, sizeof(int), GFP_KERNEL);
38416c28e16890 Matti Vaittinen 2023-03-31  371  	if (!times)
38416c28e16890 Matti Vaittinen 2023-03-31  372  		return -ENOMEM;
38416c28e16890 Matti Vaittinen 2023-03-31  373  
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  374  
38416c28e16890 Matti Vaittinen 2023-03-31  375  	/* Sort times from all tables to one and remove duplicates */
38416c28e16890 Matti Vaittinen 2023-03-31  376  	for (i = gts->num_itime - 1; i >= 0; i--) {
38416c28e16890 Matti Vaittinen 2023-03-31  377  		int new = gts->itime_table[i].time_us;
38416c28e16890 Matti Vaittinen 2023-03-31  378  
38416c28e16890 Matti Vaittinen 2023-03-31  379  		if (times[idx] < new) {
38416c28e16890 Matti Vaittinen 2023-03-31  380  			times[idx++] = new;
38416c28e16890 Matti Vaittinen 2023-03-31  381  			continue;
38416c28e16890 Matti Vaittinen 2023-03-31  382  		}
38416c28e16890 Matti Vaittinen 2023-03-31  383  
38416c28e16890 Matti Vaittinen 2023-03-31  384  		for (j = 0; j <= idx; j++) {
38416c28e16890 Matti Vaittinen 2023-03-31  385  			if (times[j] > new) {
38416c28e16890 Matti Vaittinen 2023-03-31  386  				memmove(&times[j + 1], &times[j],
38416c28e16890 Matti Vaittinen 2023-03-31  387  					(idx - j) * sizeof(int));
38416c28e16890 Matti Vaittinen 2023-03-31  388  				times[j] = new;
38416c28e16890 Matti Vaittinen 2023-03-31  389  				idx++;
38416c28e16890 Matti Vaittinen 2023-03-31  390  			}
38416c28e16890 Matti Vaittinen 2023-03-31  391  		}
38416c28e16890 Matti Vaittinen 2023-03-31  392  	}
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  393  
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  394  	/* create a list of times formatted as list of IIO_VAL_INT_PLUS_MICRO */
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17 @395  	int_micro_times = kcalloc(idx, sizeof(int) * 2, GFP_KERNEL);
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  396  	if (int_micro_times) {
38416c28e16890 Matti Vaittinen 2023-03-31  397  		/*
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  398  		 * This is just to survive a unlikely corner-case where times in
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  399  		 * the given time table were not unique. Else we could just
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  400  		 * trust the gts->num_itime.
38416c28e16890 Matti Vaittinen 2023-03-31  401  		 */
38416c28e16890 Matti Vaittinen 2023-03-31  402  		gts->num_avail_time_tables = idx;
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  403  		iio_gts_us_to_int_micro(times, int_micro_times, idx);
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  404  	}
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  405  
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  406  	gts->avail_time_tables = int_micro_times;
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  407  	kfree(times);
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  408  
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  409  	if (!int_micro_times)
0cfd72b41d5fe0 Matti Vaittinen 2023-04-17  410  		return -ENOMEM;
38416c28e16890 Matti Vaittinen 2023-03-31  411  
38416c28e16890 Matti Vaittinen 2023-03-31  412  	return 0;
38416c28e16890 Matti Vaittinen 2023-03-31  413  }
38416c28e16890 Matti Vaittinen 2023-03-31  414  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
