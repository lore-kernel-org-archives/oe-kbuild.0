Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E171B7468
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Mar 2023 19:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679946867; x=1711482867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=14KtqhdIr2/mOICbUWsMvwFncSPOHjS3AYCYnceN3VM=;
  b=cvPL6BRVoFWX2biWXlALo2byvStw8igQxNCl6rM46lhiQKNth2MDwbAn
   lBIeBYQ8dfx2bu+j6T7vcf5OpP/mMzZRvwDS8l7HqLvWGQaE7CViUjbv3
   kNAzHucAtndggsJ2mUGTVuu+LodNmwtoUeMGVUyTDAP0NXnwOEvt8Y24e
   b6LhR3x9ecrEE3JWS51kvUj9zi0w1bAceZB8OWkEBJEIk4RcP7Q1LePhQ
   HriszfxnX7/z2qp3HcoDduMXV8D+IRoW4sowwLTra3+8afdhv2bYpW2dC
   VMWerM5wvfy7jFWDfVMXSG2DW+wD6B/g0fARbKGNamI61U8U30xd/zrBP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="342778746"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="342778746"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 12:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="713977907"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="713977907"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Mar 2023 12:54:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgsvB-000Hxj-11;
	Mon, 27 Mar 2023 19:54:25 +0000
Date: Tue, 28 Mar 2023 03:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 4/7] iio: test: test gain-time-scale helpers
Message-ID: <202303280303.NIkXCv1z-lkp@intel.com>
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
In-Reply-To: <9ea9df22b8f2d20b93ebec8c98f3cb3755631927.1679915278.git.mazziesaccount@gmail.com>
References: <9ea9df22b8f2d20b93ebec8c98f3cb3755631927.1679915278.git.mazziesaccount@gmail.com>
TO: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen <mazziesaccount@gmail.com>
TO: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen <mazziesaccount@gmail.com>
CC: Jonathan Cameron <jic23@kernel.org>
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Liam Beguin <liambeguin@gmail.com>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-iio@vger.kernel.org
CC: Stephen Boyd <sboyd@kernel.org>
CC: David Gow <davidgow@google.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

Hi Matti,

I love your patch! Perhaps something to improve:

[auto build test WARNING on eeac8ede17557680855031c6f305ece2378af326]

url:    https://github.com/intel-lab-lkp/linux/commits/Matti-Vaittinen/dt-bindings-iio-light-Support-ROHM-BU27034/20230327-193728
base:   eeac8ede17557680855031c6f305ece2378af326
patch link:    https://lore.kernel.org/r/9ea9df22b8f2d20b93ebec8c98f3cb3755631927.1679915278.git.mazziesaccount%40gmail.com
patch subject: [PATCH v6 4/7] iio: test: test gain-time-scale helpers
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: parisc-randconfig-m031-20230326 (https://download.01.org/0day-ci/archive/20230328/202303280303.NIkXCv1z-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303280303.NIkXCv1z-lkp@intel.com/

smatch warnings:
drivers/iio/industrialio-gts-helper.c:246 gain_to_scaletables() warn: double check that we're allocating correct size: 4 vs 8
drivers/iio/industrialio-gts-helper.c:269 gain_to_scaletables() error: uninitialized symbol 'ret'.
drivers/iio/industrialio-gts-helper.c:302 iio_gts_build_avail_scale_table() warn: double check that we're allocating correct size: 4 vs 8

vim +246 drivers/iio/industrialio-gts-helper.c

e28184de561c92 Matti Vaittinen 2023-03-27  180  
e28184de561c92 Matti Vaittinen 2023-03-27  181  static int gain_to_scaletables(struct iio_gts *gts, int **gains, int **scales)
e28184de561c92 Matti Vaittinen 2023-03-27  182  {
e28184de561c92 Matti Vaittinen 2023-03-27  183  	int ret, i, j, new_idx, time_idx;
e28184de561c92 Matti Vaittinen 2023-03-27  184  	int *all_gains;
e28184de561c92 Matti Vaittinen 2023-03-27  185  	size_t gain_bytes;
e28184de561c92 Matti Vaittinen 2023-03-27  186  
e28184de561c92 Matti Vaittinen 2023-03-27  187  	for (i = 0; i < gts->num_itime; i++) {
e28184de561c92 Matti Vaittinen 2023-03-27  188  		/*
e28184de561c92 Matti Vaittinen 2023-03-27  189  		 * Sort the tables for nice output and for easier finding of
e28184de561c92 Matti Vaittinen 2023-03-27  190  		 * unique values.
e28184de561c92 Matti Vaittinen 2023-03-27  191  		 */
e28184de561c92 Matti Vaittinen 2023-03-27  192  		sort(gains[i], gts->num_hwgain, sizeof(int), iio_gts_gain_cmp,
e28184de561c92 Matti Vaittinen 2023-03-27  193  		     NULL);
e28184de561c92 Matti Vaittinen 2023-03-27  194  
e28184de561c92 Matti Vaittinen 2023-03-27  195  		/* Convert gains to scales */
e28184de561c92 Matti Vaittinen 2023-03-27  196  		for (j = 0; j < gts->num_hwgain; j++) {
e28184de561c92 Matti Vaittinen 2023-03-27  197  			ret = iio_gts_total_gain_to_scale(gts, gains[i][j],
e28184de561c92 Matti Vaittinen 2023-03-27  198  							  &scales[i][2 * j],
e28184de561c92 Matti Vaittinen 2023-03-27  199  							  &scales[i][2 * j + 1]);
e28184de561c92 Matti Vaittinen 2023-03-27  200  			if (ret)
e28184de561c92 Matti Vaittinen 2023-03-27  201  				return ret;
e28184de561c92 Matti Vaittinen 2023-03-27  202  		}
e28184de561c92 Matti Vaittinen 2023-03-27  203  	}
e28184de561c92 Matti Vaittinen 2023-03-27  204  
e28184de561c92 Matti Vaittinen 2023-03-27  205  	gain_bytes = array_size(gts->num_hwgain, sizeof(int));
e28184de561c92 Matti Vaittinen 2023-03-27  206  	all_gains = kcalloc(gts->num_itime, gain_bytes, GFP_KERNEL);
e28184de561c92 Matti Vaittinen 2023-03-27  207  	if (!all_gains)
e28184de561c92 Matti Vaittinen 2023-03-27  208  		return -ENOMEM;
e28184de561c92 Matti Vaittinen 2023-03-27  209  
e28184de561c92 Matti Vaittinen 2023-03-27  210  	/*
e28184de561c92 Matti Vaittinen 2023-03-27  211  	 * We assume all the gains for same integration time were unique.
e28184de561c92 Matti Vaittinen 2023-03-27  212  	 * It is likely the first time table had greatest time multiplier as
e28184de561c92 Matti Vaittinen 2023-03-27  213  	 * the times are in the order of preference and greater times are
e28184de561c92 Matti Vaittinen 2023-03-27  214  	 * usually preferred. Hence we start from the last table which is likely
e28184de561c92 Matti Vaittinen 2023-03-27  215  	 * to have the smallest total gains.
e28184de561c92 Matti Vaittinen 2023-03-27  216  	 */
e28184de561c92 Matti Vaittinen 2023-03-27  217  	time_idx = gts->num_itime - 1;
e28184de561c92 Matti Vaittinen 2023-03-27  218  	memcpy(all_gains, gains[time_idx], gain_bytes);
e28184de561c92 Matti Vaittinen 2023-03-27  219  	new_idx = gts->num_hwgain;
e28184de561c92 Matti Vaittinen 2023-03-27  220  
e28184de561c92 Matti Vaittinen 2023-03-27  221  	while (time_idx--) {
e28184de561c92 Matti Vaittinen 2023-03-27  222  		for (j = 0; j < gts->num_hwgain; j++) {
e28184de561c92 Matti Vaittinen 2023-03-27  223  			int candidate = gains[time_idx][j];
e28184de561c92 Matti Vaittinen 2023-03-27  224  			int chk;
e28184de561c92 Matti Vaittinen 2023-03-27  225  
e28184de561c92 Matti Vaittinen 2023-03-27  226  			if (candidate > all_gains[new_idx - 1]) {
e28184de561c92 Matti Vaittinen 2023-03-27  227  				all_gains[new_idx] = candidate;
e28184de561c92 Matti Vaittinen 2023-03-27  228  				new_idx++;
e28184de561c92 Matti Vaittinen 2023-03-27  229  
e28184de561c92 Matti Vaittinen 2023-03-27  230  				continue;
e28184de561c92 Matti Vaittinen 2023-03-27  231  			}
e28184de561c92 Matti Vaittinen 2023-03-27  232  			for (chk = 0; chk < new_idx; chk++)
e28184de561c92 Matti Vaittinen 2023-03-27  233  				if (candidate <= all_gains[chk])
e28184de561c92 Matti Vaittinen 2023-03-27  234  					break;
e28184de561c92 Matti Vaittinen 2023-03-27  235  
e28184de561c92 Matti Vaittinen 2023-03-27  236  			if (candidate == all_gains[chk])
e28184de561c92 Matti Vaittinen 2023-03-27  237  				continue;
e28184de561c92 Matti Vaittinen 2023-03-27  238  
e28184de561c92 Matti Vaittinen 2023-03-27  239  			memmove(&all_gains[chk + 1], &all_gains[chk],
e28184de561c92 Matti Vaittinen 2023-03-27  240  				(new_idx - chk) * sizeof(int));
e28184de561c92 Matti Vaittinen 2023-03-27  241  			all_gains[chk] = candidate;
e28184de561c92 Matti Vaittinen 2023-03-27  242  			new_idx++;
e28184de561c92 Matti Vaittinen 2023-03-27  243  		}
e28184de561c92 Matti Vaittinen 2023-03-27  244  	}
e28184de561c92 Matti Vaittinen 2023-03-27  245  
e28184de561c92 Matti Vaittinen 2023-03-27 @246  	gts->avail_all_scales_table = kcalloc(new_idx, 2 * sizeof(int),
e28184de561c92 Matti Vaittinen 2023-03-27  247  					      GFP_KERNEL);
e28184de561c92 Matti Vaittinen 2023-03-27  248  	if (!gts->avail_all_scales_table) {
e28184de561c92 Matti Vaittinen 2023-03-27  249  		ret = -ENOMEM;
e28184de561c92 Matti Vaittinen 2023-03-27  250  		goto free_out;
e28184de561c92 Matti Vaittinen 2023-03-27  251  	}
e28184de561c92 Matti Vaittinen 2023-03-27  252  	gts->num_avail_all_scales = new_idx;
e28184de561c92 Matti Vaittinen 2023-03-27  253  
e28184de561c92 Matti Vaittinen 2023-03-27  254  	for (i = 0; i < gts->num_avail_all_scales; i++) {
e28184de561c92 Matti Vaittinen 2023-03-27  255  		ret = iio_gts_total_gain_to_scale(gts, all_gains[i],
e28184de561c92 Matti Vaittinen 2023-03-27  256  					&gts->avail_all_scales_table[i * 2],
e28184de561c92 Matti Vaittinen 2023-03-27  257  					&gts->avail_all_scales_table[i * 2 + 1]);
e28184de561c92 Matti Vaittinen 2023-03-27  258  
e28184de561c92 Matti Vaittinen 2023-03-27  259  		if (ret) {
e28184de561c92 Matti Vaittinen 2023-03-27  260  			kfree(gts->avail_all_scales_table);
e28184de561c92 Matti Vaittinen 2023-03-27  261  			gts->num_avail_all_scales = 0;
e28184de561c92 Matti Vaittinen 2023-03-27  262  			goto free_out;
e28184de561c92 Matti Vaittinen 2023-03-27  263  		}
e28184de561c92 Matti Vaittinen 2023-03-27  264  	}
e28184de561c92 Matti Vaittinen 2023-03-27  265  
e28184de561c92 Matti Vaittinen 2023-03-27  266  free_out:
e28184de561c92 Matti Vaittinen 2023-03-27  267  	kfree(all_gains);
e28184de561c92 Matti Vaittinen 2023-03-27  268  
e28184de561c92 Matti Vaittinen 2023-03-27 @269  	return ret;
e28184de561c92 Matti Vaittinen 2023-03-27  270  }
e28184de561c92 Matti Vaittinen 2023-03-27  271  
e28184de561c92 Matti Vaittinen 2023-03-27  272  /**
e28184de561c92 Matti Vaittinen 2023-03-27  273   * iio_gts_build_avail_scale_table - create tables of available scales
e28184de561c92 Matti Vaittinen 2023-03-27  274   * @gts:	Gain time scale descriptor
e28184de561c92 Matti Vaittinen 2023-03-27  275   *
e28184de561c92 Matti Vaittinen 2023-03-27  276   * Build the tables which can represent the available scales based on the
e28184de561c92 Matti Vaittinen 2023-03-27  277   * originally given gain and time tables. When both time and gain tables are
e28184de561c92 Matti Vaittinen 2023-03-27  278   * given this results:
e28184de561c92 Matti Vaittinen 2023-03-27  279   * 1. A set of tables representing available scales for each supported
e28184de561c92 Matti Vaittinen 2023-03-27  280   *    integration time.
e28184de561c92 Matti Vaittinen 2023-03-27  281   * 2. A single table listing all the unique scales that any combination of
e28184de561c92 Matti Vaittinen 2023-03-27  282   *    supported gains and times can provide.
e28184de561c92 Matti Vaittinen 2023-03-27  283   *
e28184de561c92 Matti Vaittinen 2023-03-27  284   * NOTE: Space allocated for the tables must be freed using
e28184de561c92 Matti Vaittinen 2023-03-27  285   * iio_gts_purge_avail_scale_table() when the tables are no longer needed.
e28184de561c92 Matti Vaittinen 2023-03-27  286   *
e28184de561c92 Matti Vaittinen 2023-03-27  287   * Return: 0 on success.
e28184de561c92 Matti Vaittinen 2023-03-27  288   */
e28184de561c92 Matti Vaittinen 2023-03-27  289  static int iio_gts_build_avail_scale_table(struct iio_gts *gts)
e28184de561c92 Matti Vaittinen 2023-03-27  290  {
e28184de561c92 Matti Vaittinen 2023-03-27  291  	int **per_time_gains, **per_time_scales, i, j, ret = -ENOMEM;
e28184de561c92 Matti Vaittinen 2023-03-27  292  
e28184de561c92 Matti Vaittinen 2023-03-27  293  	per_time_gains = kcalloc(gts->num_itime, sizeof(*per_time_gains), GFP_KERNEL);
e28184de561c92 Matti Vaittinen 2023-03-27  294  	if (!per_time_gains)
e28184de561c92 Matti Vaittinen 2023-03-27  295  		return ret;
e28184de561c92 Matti Vaittinen 2023-03-27  296  
e28184de561c92 Matti Vaittinen 2023-03-27  297  	per_time_scales = kcalloc(gts->num_itime, sizeof(*per_time_scales), GFP_KERNEL);
e28184de561c92 Matti Vaittinen 2023-03-27  298  	if (!per_time_scales)
e28184de561c92 Matti Vaittinen 2023-03-27  299  		goto free_gains;
e28184de561c92 Matti Vaittinen 2023-03-27  300  
e28184de561c92 Matti Vaittinen 2023-03-27  301  	for (i = 0; i < gts->num_itime; i++) {
e28184de561c92 Matti Vaittinen 2023-03-27 @302  		per_time_scales[i] = kcalloc(gts->num_hwgain, 2 * sizeof(int),
e28184de561c92 Matti Vaittinen 2023-03-27  303  					     GFP_KERNEL);
e28184de561c92 Matti Vaittinen 2023-03-27  304  		if (!per_time_scales[i])
e28184de561c92 Matti Vaittinen 2023-03-27  305  			goto err_free_out;
e28184de561c92 Matti Vaittinen 2023-03-27  306  
e28184de561c92 Matti Vaittinen 2023-03-27  307  		per_time_gains[i] = kcalloc(gts->num_hwgain, sizeof(int),
e28184de561c92 Matti Vaittinen 2023-03-27  308  					    GFP_KERNEL);
e28184de561c92 Matti Vaittinen 2023-03-27  309  		if (!per_time_gains[i]) {
e28184de561c92 Matti Vaittinen 2023-03-27  310  			kfree(per_time_scales[i]);
e28184de561c92 Matti Vaittinen 2023-03-27  311  			goto err_free_out;
e28184de561c92 Matti Vaittinen 2023-03-27  312  		}
e28184de561c92 Matti Vaittinen 2023-03-27  313  
e28184de561c92 Matti Vaittinen 2023-03-27  314  		for (j = 0; j < gts->num_hwgain; j++)
e28184de561c92 Matti Vaittinen 2023-03-27  315  			per_time_gains[i][j] = gts->hwgain_table[j].gain *
e28184de561c92 Matti Vaittinen 2023-03-27  316  					       gts->itime_table[i].mul;
e28184de561c92 Matti Vaittinen 2023-03-27  317  	}
e28184de561c92 Matti Vaittinen 2023-03-27  318  
e28184de561c92 Matti Vaittinen 2023-03-27  319  	ret = gain_to_scaletables(gts, per_time_gains, per_time_scales);
e28184de561c92 Matti Vaittinen 2023-03-27  320  	if (ret)
e28184de561c92 Matti Vaittinen 2023-03-27  321  		goto err_free_out;
e28184de561c92 Matti Vaittinen 2023-03-27  322  
e28184de561c92 Matti Vaittinen 2023-03-27  323  	kfree(per_time_gains);
e28184de561c92 Matti Vaittinen 2023-03-27  324  	gts->per_time_avail_scale_tables = per_time_scales;
e28184de561c92 Matti Vaittinen 2023-03-27  325  
e28184de561c92 Matti Vaittinen 2023-03-27  326  	return 0;
e28184de561c92 Matti Vaittinen 2023-03-27  327  
e28184de561c92 Matti Vaittinen 2023-03-27  328  err_free_out:
e28184de561c92 Matti Vaittinen 2023-03-27  329  	for (i--; i; i--) {
e28184de561c92 Matti Vaittinen 2023-03-27  330  		kfree(per_time_scales[i]);
e28184de561c92 Matti Vaittinen 2023-03-27  331  		kfree(per_time_gains[i]);
e28184de561c92 Matti Vaittinen 2023-03-27  332  	}
e28184de561c92 Matti Vaittinen 2023-03-27  333  	kfree(per_time_scales);
e28184de561c92 Matti Vaittinen 2023-03-27  334  free_gains:
e28184de561c92 Matti Vaittinen 2023-03-27  335  	kfree(per_time_gains);
e28184de561c92 Matti Vaittinen 2023-03-27  336  
e28184de561c92 Matti Vaittinen 2023-03-27  337  	return ret;
e28184de561c92 Matti Vaittinen 2023-03-27  338  }
e28184de561c92 Matti Vaittinen 2023-03-27  339  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
