Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F94418C04
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 21:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OvoITzMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699219414; x=1730755414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vbjiMu9m9MqGP3rzvmVfCodrva2jpwiF43cUCLLrrOM=;
  b=OvoITzMT7OW59HQ5ZNCfRXfEz9AGoPoZp8G6F9Jr1M4PTOUlC335GXHJ
   OIRMih2W4CxOidbcdtjvkQtMo4g5s84fN0mYTsmiX13tHQ4J1TI3XVH+C
   cbTFZkgVTMBXcM3DocY8kTq7/IkaClrsig22Nuu+RqBbjKqv/+VyIEs4c
   QA/kyd6c3bD7AzgWFy41D+nr7D18mjV18uE0NluHnkHph+8fiQRhnZoh7
   8YqCLZyyNfTtHs5Ysq/taSiLGLhxfajWd2l0m7SI5kA6HDIcikiZgBFKj
   4LCkA3C9/qHGOlpSovIGwDQ1uK6RResbitmKdsd0OXTrLxGl0CAP5NXnI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="393064911"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="393064911"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 13:23:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="832547110"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="832547110"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Nov 2023 13:23:32 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzkag-0005o8-0w;
	Sun, 05 Nov 2023 21:23:30 +0000
Date: Mon, 6 Nov 2023 05:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/industrialio-gts-helper.c:394
 iio_gts_build_avail_time_table() warn: double check that we're allocating
 correct size: 4 vs 8
Message-ID: <202311060512.PJRWOKtb-lkp@intel.com>
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
head:   77fa2fbe87fc605c4bfa87dff87be9bfded0e9a3
commit: e65065132fa6d9e1fd3b7418eae5215e3b7bf6c7 iio: gts-helpers: fix integration time units
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231106/202311060512.PJRWOKtb-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311060512.PJRWOKtb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311060512.PJRWOKtb-lkp@intel.com/

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
