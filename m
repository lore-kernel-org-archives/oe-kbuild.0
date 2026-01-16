Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A3D30FC20
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 00:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768525110; cv=none; b=fyVK3evyrLxHI2Vpp0L9/5BjUiQ5yk1AAah6EcTuiMgqiD1ln8PpzPL7pfm7/mq7c6xWvoHrQ9ZVkYL4aOS1r0MHgJoWnomQ2GaFMhVTb6LDSXQpBmtOB7tZ+BuyhqG3LFM3ETTt5HHfphNfDjVidoYlNldBEJO2ySfYpQmT2ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768525110; c=relaxed/simple;
	bh=6SmE4QFQbRsoYCPH0LBA38S2Z160F6rBzmBvSZKKwRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LqdSfRFT6uylfP6pj1zXEb/7eQkeTZwLOawXszgKaQT1iNkjfLErfuvlGiS2dzr9hMOFCdTILvE1Wfd5RbKGBDvOc1XY803ztakmFKsFoJUGlXFyRArps/WSe7u6DMKgpFWasyZdGIeoUfgkqw/uEI3HISllsXjuNQShbFrCfJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IY4Yc4p5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IY4Yc4p5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768525109; x=1800061109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6SmE4QFQbRsoYCPH0LBA38S2Z160F6rBzmBvSZKKwRM=;
  b=IY4Yc4p5wvll/5PEz/fFbzV9qHfrUe0j8mD7EgEhXuAyRi/9HUDIYXqj
   FWcKGHMhb4VpqxJDYt1UWbCVZ8be+L7xhFbYkAuKjid/yvCWKOVY49lK/
   bF9daXCa5UY/raRB57n578LfrvY4GGCIjj7X3sJxMh23B7prv4hxt6Q5b
   zEZBeRzLwnnij3BXVRziSoBgxlv/KHeT8ZW/8Mvqn+K8oOwxUMd5qMbyl
   tmb/3PcPkmHkRelFFOCCqZWLW9WxQqJEsl58klJhIqeI1RbZMoZuM9rCG
   6eh9nLEQAuYEL4Bv9WL6fyvdk852En2RYGj0csFWlgHr1RtKZC9hGwcPy
   A==;
X-CSE-ConnectionGUID: jZPdtJoJQWCa6rtHduXXUw==
X-CSE-MsgGUID: eeOiLg/vSBCHacqHu7pMzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87417690"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="87417690"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 16:58:26 -0800
X-CSE-ConnectionGUID: Rb2qO0+7RTS2oabhZWw04A==
X-CSE-MsgGUID: mLPVJa8dReST6WkfZjeIVw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jan 2026 16:58:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgYAQ-00000000KB6-3eRH;
	Fri, 16 Jan 2026 00:58:22 +0000
Date: Fri, 16 Jan 2026 08:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH 3/4] sysctl: support encoding values directly in the
 table entry
Message-ID: <202601160850.i6bVRfFi-lkp@intel.com>
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
In-Reply-To: <907e4f14cedb2bfb2810dec255b930d59b821dc2.1768324215.git.wen.yang@linux.dev>
References: <907e4f14cedb2bfb2810dec255b930d59b821dc2.1768324215.git.wen.yang@linux.dev>
TO: wen.yang@linux.dev

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on sysctl/sysctl-next]
[also build test WARNING on next-20260115]
[cannot apply to linus/master mcgrof/sysctl-next v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wen-yang-linux-dev/sysctl-add-SYSCTL_ENTRY-SYSCTL_RANGE_ENTRY-helpers-for-ctl_table-init/20260114-014339
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git sysctl-next
patch link:    https://lore.kernel.org/r/907e4f14cedb2bfb2810dec255b930d59b821dc2.1768324215.git.wen.yang%40linux.dev
patch subject: [RFC PATCH 3/4] sysctl: support encoding values directly in the table entry
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: m68k-randconfig-r071-20260116 (https://download.01.org/0day-ci/archive/20260116/202601160850.i6bVRfFi-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601160850.i6bVRfFi-lkp@intel.com/

smatch warnings:
kernel/sysctl-test.c:320 sysctl_test_api_dointvec_write_range_check() warn: (struct ctl_table)->procname cannot be NULL. Expression : test_cases[0]->procname
kernel/sysctl-test.c:320 sysctl_test_api_dointvec_write_range_check() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : test_cases[0]->proc_handler

vim +320 kernel/sysctl-test.c

2cb80dbbbaba4f Iurii Zaikin 2019-09-23  302  
ca5cba219ba481 Wen Yang     2026-01-14  303  /*
ca5cba219ba481 Wen Yang     2026-01-14  304   * Test that writing values within the specified range succeeds,
ca5cba219ba481 Wen Yang     2026-01-14  305   * and ensures out-of-range writes are correctly rejected.
ca5cba219ba481 Wen Yang     2026-01-14  306   */
ca5cba219ba481 Wen Yang     2026-01-14  307  static void sysctl_test_api_dointvec_write_range_check(struct kunit *test)
ca5cba219ba481 Wen Yang     2026-01-14  308  {
ca5cba219ba481 Wen Yang     2026-01-14  309  	int data = 0;
ca5cba219ba481 Wen Yang     2026-01-14  310  	size_t len;
ca5cba219ba481 Wen Yang     2026-01-14  311  	loff_t pos;
ca5cba219ba481 Wen Yang     2026-01-14  312  	char *buffer;
ca5cba219ba481 Wen Yang     2026-01-14  313  	char __user *user_buffer;
ca5cba219ba481 Wen Yang     2026-01-14  314  
ca5cba219ba481 Wen Yang     2026-01-14  315  	/* Prepare bound variables for pointer modes */
ca5cba219ba481 Wen Yang     2026-01-14  316  	int min_bounds[] = {10, 0, 15, 0};
ca5cba219ba481 Wen Yang     2026-01-14  317  	int max_bounds[] = {90, 75, 0, 0};
ca5cba219ba481 Wen Yang     2026-01-14  318  
ca5cba219ba481 Wen Yang     2026-01-14  319  	/* Initialize test tables using macro */
ca5cba219ba481 Wen Yang     2026-01-14 @320  	struct ctl_table test_cases[] = {
ca5cba219ba481 Wen Yang     2026-01-14  321  		/* PTR_PTR: both pointers */
ca5cba219ba481 Wen Yang     2026-01-14  322  		SYSCTL_RANGE_ENTRY("ptr_ptr", &data, int, 0644,
ca5cba219ba481 Wen Yang     2026-01-14  323  				&min_bounds[0], &max_bounds[0]),
ca5cba219ba481 Wen Yang     2026-01-14  324  		/* VAL_PTR: min is value, max is pointer */
ca5cba219ba481 Wen Yang     2026-01-14  325  		SYSCTL_RANGE_ENTRY("val_ptr", &data, int, 0644,
ca5cba219ba481 Wen Yang     2026-01-14  326  				25, &max_bounds[1]),
ca5cba219ba481 Wen Yang     2026-01-14  327  		/* PTR_VAL: min is pointer, max is value */
ca5cba219ba481 Wen Yang     2026-01-14  328  		SYSCTL_RANGE_ENTRY("ptr_val", &data, int, 0644,
ca5cba219ba481 Wen Yang     2026-01-14  329  				&min_bounds[2], 85),
ca5cba219ba481 Wen Yang     2026-01-14  330  		/* VAL_VAL: both values */
ca5cba219ba481 Wen Yang     2026-01-14  331  		SYSCTL_RANGE_ENTRY("val_val", &data, int, 0644,
ca5cba219ba481 Wen Yang     2026-01-14  332  				20, 80),
ca5cba219ba481 Wen Yang     2026-01-14  333  	};
ca5cba219ba481 Wen Yang     2026-01-14  334  
ca5cba219ba481 Wen Yang     2026-01-14  335  	/* Test parameters for each mode */
ca5cba219ba481 Wen Yang     2026-01-14  336  	const struct {
ca5cba219ba481 Wen Yang     2026-01-14  337  		int min, max;
ca5cba219ba481 Wen Yang     2026-01-14  338  		const char *valid;
ca5cba219ba481 Wen Yang     2026-01-14  339  		const char *below_min;
ca5cba219ba481 Wen Yang     2026-01-14  340  		const char *above_max;
ca5cba219ba481 Wen Yang     2026-01-14  341  	} test_params[] = {
ca5cba219ba481 Wen Yang     2026-01-14  342  		{10, 90, "50", "5",  "95"},  /* PTR_PTR */
ca5cba219ba481 Wen Yang     2026-01-14  343  		{25, 75, "50", "20", "80"},  /* VAL_PTR */
ca5cba219ba481 Wen Yang     2026-01-14  344  		{15, 85, "50", "10", "90"},  /* PTR_VAL */
ca5cba219ba481 Wen Yang     2026-01-14  345  		{20, 80, "50", "15", "85"},  /* VAL_VAL */
ca5cba219ba481 Wen Yang     2026-01-14  346  	};
ca5cba219ba481 Wen Yang     2026-01-14  347  
ca5cba219ba481 Wen Yang     2026-01-14  348  	for (int i = 0; i < 4; i++) {
ca5cba219ba481 Wen Yang     2026-01-14  349  		struct ctl_table *table = &test_cases[i];
ca5cba219ba481 Wen Yang     2026-01-14  350  		const typeof(test_params[0]) *param = &test_params[i];
ca5cba219ba481 Wen Yang     2026-01-14  351  
ca5cba219ba481 Wen Yang     2026-01-14  352  		/* Verify flags auto-detection */
ca5cba219ba481 Wen Yang     2026-01-14  353  		KUNIT_EXPECT_EQ(test, table->flags, i);
ca5cba219ba481 Wen Yang     2026-01-14  354  		KUNIT_EXPECT_EQ(test, (int)table->min_is_value, (i & 1) != 0);
ca5cba219ba481 Wen Yang     2026-01-14  355  		KUNIT_EXPECT_EQ(test, (int)table->max_is_value, (i & 2) != 0);
ca5cba219ba481 Wen Yang     2026-01-14  356  
ca5cba219ba481 Wen Yang     2026-01-14  357  		/* Verify union access */
ca5cba219ba481 Wen Yang     2026-01-14  358  		if (table->min_is_value) {
ca5cba219ba481 Wen Yang     2026-01-14  359  			KUNIT_EXPECT_EQ(test, table->min, (unsigned long)param->min);
ca5cba219ba481 Wen Yang     2026-01-14  360  		} else {
ca5cba219ba481 Wen Yang     2026-01-14  361  			KUNIT_EXPECT_PTR_EQ(test, table->extra1, &min_bounds[i]);
ca5cba219ba481 Wen Yang     2026-01-14  362  			KUNIT_EXPECT_EQ(test, *(int *)table->extra1, param->min);
ca5cba219ba481 Wen Yang     2026-01-14  363  		}
ca5cba219ba481 Wen Yang     2026-01-14  364  
ca5cba219ba481 Wen Yang     2026-01-14  365  		if (table->max_is_value) {
ca5cba219ba481 Wen Yang     2026-01-14  366  			KUNIT_EXPECT_EQ(test, table->max, (unsigned long)param->max);
ca5cba219ba481 Wen Yang     2026-01-14  367  		} else {
ca5cba219ba481 Wen Yang     2026-01-14  368  			KUNIT_EXPECT_PTR_EQ(test, table->extra2, &max_bounds[i]);
ca5cba219ba481 Wen Yang     2026-01-14  369  			KUNIT_EXPECT_EQ(test, *(int *)table->extra2, param->max);
ca5cba219ba481 Wen Yang     2026-01-14  370  		}
ca5cba219ba481 Wen Yang     2026-01-14  371  
ca5cba219ba481 Wen Yang     2026-01-14  372  		/* Test valid value in range */
ca5cba219ba481 Wen Yang     2026-01-14  373  		data = 0;
ca5cba219ba481 Wen Yang     2026-01-14  374  		len = strlen(param->valid);
ca5cba219ba481 Wen Yang     2026-01-14  375  		pos = 0;
ca5cba219ba481 Wen Yang     2026-01-14  376  		buffer = kunit_kzalloc(test, len, GFP_USER);
ca5cba219ba481 Wen Yang     2026-01-14  377  		user_buffer = (char __user *)buffer;
ca5cba219ba481 Wen Yang     2026-01-14  378  		memcpy(buffer, param->valid, len);
ca5cba219ba481 Wen Yang     2026-01-14  379  
ca5cba219ba481 Wen Yang     2026-01-14  380  		KUNIT_EXPECT_EQ(test, 0, proc_dointvec_minmax(table, KUNIT_PROC_WRITE,
ca5cba219ba481 Wen Yang     2026-01-14  381  					user_buffer, &len, &pos));
ca5cba219ba481 Wen Yang     2026-01-14  382  		KUNIT_EXPECT_EQ(test, strlen(param->valid), len);
ca5cba219ba481 Wen Yang     2026-01-14  383  		KUNIT_EXPECT_EQ(test, strlen(param->valid), pos);
ca5cba219ba481 Wen Yang     2026-01-14  384  		KUNIT_EXPECT_EQ(test, 50, data);
ca5cba219ba481 Wen Yang     2026-01-14  385  
ca5cba219ba481 Wen Yang     2026-01-14  386  		/* Test min boundary */
ca5cba219ba481 Wen Yang     2026-01-14  387  		data = 0;
ca5cba219ba481 Wen Yang     2026-01-14  388  		char min_str[16];
ca5cba219ba481 Wen Yang     2026-01-14  389  		snprintf(min_str, sizeof(min_str), "%d", param->min);
ca5cba219ba481 Wen Yang     2026-01-14  390  		len = strlen(min_str);
ca5cba219ba481 Wen Yang     2026-01-14  391  		pos = 0;
ca5cba219ba481 Wen Yang     2026-01-14  392  		buffer = kunit_kzalloc(test, len, GFP_USER);
ca5cba219ba481 Wen Yang     2026-01-14  393  		user_buffer = (char __user *)buffer;
ca5cba219ba481 Wen Yang     2026-01-14  394  		memcpy(buffer, min_str, len);
ca5cba219ba481 Wen Yang     2026-01-14  395  
ca5cba219ba481 Wen Yang     2026-01-14  396  		KUNIT_EXPECT_EQ(test, 0, proc_dointvec_minmax(table, KUNIT_PROC_WRITE,
ca5cba219ba481 Wen Yang     2026-01-14  397  					user_buffer, &len, &pos));
ca5cba219ba481 Wen Yang     2026-01-14  398  		KUNIT_EXPECT_EQ(test, strlen(min_str), len);
ca5cba219ba481 Wen Yang     2026-01-14  399  		KUNIT_EXPECT_EQ(test, strlen(min_str), pos);
ca5cba219ba481 Wen Yang     2026-01-14  400  		KUNIT_EXPECT_EQ(test, param->min, data);
ca5cba219ba481 Wen Yang     2026-01-14  401  
ca5cba219ba481 Wen Yang     2026-01-14  402  		/* Test max boundary */
ca5cba219ba481 Wen Yang     2026-01-14  403  		data = 0;
ca5cba219ba481 Wen Yang     2026-01-14  404  		char max_str[16];
ca5cba219ba481 Wen Yang     2026-01-14  405  		snprintf(max_str, sizeof(max_str), "%d", param->max);
ca5cba219ba481 Wen Yang     2026-01-14  406  		len = strlen(max_str);
ca5cba219ba481 Wen Yang     2026-01-14  407  		pos = 0;
ca5cba219ba481 Wen Yang     2026-01-14  408  		buffer = kunit_kzalloc(test, len, GFP_USER);
ca5cba219ba481 Wen Yang     2026-01-14  409  		user_buffer = (char __user *)buffer;
ca5cba219ba481 Wen Yang     2026-01-14  410  		memcpy(buffer, max_str, len);
ca5cba219ba481 Wen Yang     2026-01-14  411  
ca5cba219ba481 Wen Yang     2026-01-14  412  		KUNIT_EXPECT_EQ(test, 0, proc_dointvec_minmax(table, KUNIT_PROC_WRITE,
ca5cba219ba481 Wen Yang     2026-01-14  413  					user_buffer, &len, &pos));
ca5cba219ba481 Wen Yang     2026-01-14  414  		KUNIT_EXPECT_EQ(test, strlen(max_str), len);
ca5cba219ba481 Wen Yang     2026-01-14  415  		KUNIT_EXPECT_EQ(test, strlen(max_str), pos);
ca5cba219ba481 Wen Yang     2026-01-14  416  		KUNIT_EXPECT_EQ(test, param->max, data);
ca5cba219ba481 Wen Yang     2026-01-14  417  
ca5cba219ba481 Wen Yang     2026-01-14  418  		/* Test below min - should fail */
ca5cba219ba481 Wen Yang     2026-01-14  419  		data = 0;
ca5cba219ba481 Wen Yang     2026-01-14  420  		len = strlen(param->below_min);
ca5cba219ba481 Wen Yang     2026-01-14  421  		pos = 0;
ca5cba219ba481 Wen Yang     2026-01-14  422  		buffer = kunit_kzalloc(test, len, GFP_USER);
ca5cba219ba481 Wen Yang     2026-01-14  423  		user_buffer = (char __user *)buffer;
ca5cba219ba481 Wen Yang     2026-01-14  424  		memcpy(buffer, param->below_min, len);
ca5cba219ba481 Wen Yang     2026-01-14  425  
ca5cba219ba481 Wen Yang     2026-01-14  426  		KUNIT_EXPECT_EQ(test, -EINVAL, proc_dointvec_minmax(table, KUNIT_PROC_WRITE,
ca5cba219ba481 Wen Yang     2026-01-14  427  					user_buffer, &len, &pos));
ca5cba219ba481 Wen Yang     2026-01-14  428  		KUNIT_EXPECT_EQ(test, 0, data);
ca5cba219ba481 Wen Yang     2026-01-14  429  
ca5cba219ba481 Wen Yang     2026-01-14  430  		/* Test above max - should fail */
ca5cba219ba481 Wen Yang     2026-01-14  431  		data = 0;
ca5cba219ba481 Wen Yang     2026-01-14  432  		len = strlen(param->above_max);
ca5cba219ba481 Wen Yang     2026-01-14  433  		pos = 0;
ca5cba219ba481 Wen Yang     2026-01-14  434  		buffer = kunit_kzalloc(test, len, GFP_USER);
ca5cba219ba481 Wen Yang     2026-01-14  435  		user_buffer = (char __user *)buffer;
ca5cba219ba481 Wen Yang     2026-01-14  436  		memcpy(buffer, param->above_max, len);
ca5cba219ba481 Wen Yang     2026-01-14  437  
ca5cba219ba481 Wen Yang     2026-01-14  438  		KUNIT_EXPECT_EQ(test, -EINVAL, proc_dointvec_minmax(table, KUNIT_PROC_WRITE,
ca5cba219ba481 Wen Yang     2026-01-14  439  					user_buffer, &len, &pos));
ca5cba219ba481 Wen Yang     2026-01-14  440  		KUNIT_EXPECT_EQ(test, 0, data);
ca5cba219ba481 Wen Yang     2026-01-14  441  	}
ca5cba219ba481 Wen Yang     2026-01-14  442  }
ca5cba219ba481 Wen Yang     2026-01-14  443  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
