Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685B844AB7E
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 08:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151829; cv=none; b=MLW5yd5zGPftWL1gHr4Bc/yhh8J9DuBe6s4kNCEFPUfya3qlX3tIYCcxmmIVSiTj/GLNx696ubal3XLzg1q8re27ikBelMX5VRZdnq249Y4tsjNH8ZD+77DwbhjU1IBDgFzfNvwW7jT6tWPPKCpwa3wwWghn0RTf6VqG+gJcR7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151829; c=relaxed/simple;
	bh=5lGzHhmSYBH55laYq+tlEYuQZ051dHY26ERQTBnfy5s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g/qnnnLt1qJFx50UDwiP/7YkRllnw6htX7pZsMPgZn3VuFMmjG6N148jU64hUJUy5+SF0b4+nqLxZ6DgJjVeB350RUz8oofL9ilGlkXM/SlKy3RMiuWBVwYzTMjef3xXBmY7KN/Z+NXvbyRgDUtbiG5J5gTi8E05K6DWIlp3yDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCixvFky; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCixvFky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790151824; x=1821687824;
  h=date:from:to:cc:subject:message-id;
  bh=5lGzHhmSYBH55laYq+tlEYuQZ051dHY26ERQTBnfy5s=;
  b=YCixvFkyqa4x5UOwez8TzpZUIzdllRUMEn3oJxDfQLLKXNORfLHjamCU
   RdDqBmTH1bdSA/bNauIDcGtLvHvYANbi1Nq60PjNodaUZTCJT2uT3lkqG
   M+O4AjMMqNJXmSdAFrXcjzRfiu7IlJCKHo2nnRtdEjstx1vjhbDvAA0zt
   apSxYcfmBeNmFFbMA4wmsmYfFwo6cLVq0djXNgen90LWjNxg5Hzz+3v7g
   MEtXkRjS04qA6PNr5BEW6FsfEcYr+GS4+QH+5iaZkTOANJOuE08x7Ai/1
   9XBNJ3RH8/vxHQEGq9LARCGUBst0JVxzdsHIJY85U0hQVYHSi1s/X8o7h
   Q==;
X-CSE-ConnectionGUID: bm3/6+V0R72O7vO2aupfMQ==
X-CSE-MsgGUID: LiG1FjbGTAejyIK2o7Mwwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="108319974"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="108319974"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 01:23:41 -0700
X-CSE-ConnectionGUID: 9ymPaskFT1uj4IyEc3T6og==
X-CSE-MsgGUID: e5SoPibhSy+ZqkmRjLnwJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="270032588"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2026 01:23:40 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9IGO-000000000Zz-3MUz;
	Wed, 23 Sep 2026 08:23:36 +0000
Date: Wed, 23 Sep 2026 10:22:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7416/8910]
 drivers/power/sequencing/pwrseq-kunit.c:248 pwrseq_circular_deps() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202609231008.4BkhtDFU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: c42e50314a7629ada42a605666b18e22867a6b44 [7416/8910] power: sequencing: add kunit test cases
:::::: branch date: 19 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-2200-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231008.4BkhtDFU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609231008.4BkhtDFU-lkp@intel.com/

New smatch warnings:
drivers/power/sequencing/pwrseq-kunit.c:248 pwrseq_circular_deps() warn: passing zero to 'PTR_ERR'
drivers/power/sequencing/pwrseq-kunit.c:309 pwrseq_circular_deps_chain() warn: passing zero to 'PTR_ERR'
drivers/power/sequencing/pwrseq-kunit.c:382 pwrseq_register_invalid_args() warn: passing zero to 'PTR_ERR'
drivers/power/sequencing/pwrseq-kunit.c:427 pwrseq_register_target_without_unit() warn: passing zero to 'PTR_ERR'
drivers/power/sequencing/pwrseq-kunit.c:968 pwrseq_get_target_not_found() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/power/sequencing/pwrseq-kunit.c:388 pwrseq_register_invalid_args() warn: passing zero to 'PTR_ERR'
drivers/power/sequencing/pwrseq-kunit.c:394 pwrseq_register_invalid_args() warn: passing zero to 'PTR_ERR'
drivers/power/sequencing/pwrseq-kunit.c:399 pwrseq_register_invalid_args() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +248 drivers/power/sequencing/pwrseq-kunit.c

c42e50314a7629a Bartosz Golaszewski 2026-09-09  200  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  201  /*
c42e50314a7629a Bartosz Golaszewski 2026-09-09  202   * Test that registering a power sequencer whose unit dependency graph
c42e50314a7629a Bartosz Golaszewski 2026-09-09  203   * contains a two-node cycle (A -> B -> A) is rejected with -EINVAL.
c42e50314a7629a Bartosz Golaszewski 2026-09-09  204   */
c42e50314a7629a Bartosz Golaszewski 2026-09-09  205  static void pwrseq_circular_deps(struct kunit *test)
c42e50314a7629a Bartosz Golaszewski 2026-09-09  206  {
c42e50314a7629a Bartosz Golaszewski 2026-09-09  207  	const struct pwrseq_unit_data *unit_a_deps[2] = { };
c42e50314a7629a Bartosz Golaszewski 2026-09-09  208  	const struct pwrseq_unit_data *unit_b_deps[2] = { };
c42e50314a7629a Bartosz Golaszewski 2026-09-09  209  	const struct pwrseq_target_data *targets[2] = { };
c42e50314a7629a Bartosz Golaszewski 2026-09-09  210  	struct platform_device *pdev = test->priv;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  211  	struct pwrseq_unit_data unit_a, unit_b;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  212  	struct pwrseq_target_data target;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  213  	struct pwrseq_device *pwrseq;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  214  	struct pwrseq_config config;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  215  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  216  	unit_a = (struct pwrseq_unit_data){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  217  		.name = "unit-a",
c42e50314a7629a Bartosz Golaszewski 2026-09-09  218  		.deps = unit_a_deps,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  219  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  220  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  221  	unit_b = (struct pwrseq_unit_data){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  222  		.name = "unit-b",
c42e50314a7629a Bartosz Golaszewski 2026-09-09  223  		.deps = unit_b_deps,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  224  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  225  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  226  	unit_a_deps[0] = &unit_b;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  227  	unit_b_deps[0] = &unit_a;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  228  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  229  	target = (struct pwrseq_target_data){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  230  		.name = "test-target",
c42e50314a7629a Bartosz Golaszewski 2026-09-09  231  		.unit = &unit_a,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  232  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  233  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  234  	targets[0] = &target;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  235  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  236  	config = (struct pwrseq_config){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  237  		.parent = &pdev->dev,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  238  		.match = pwrseq_test_no_match,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  239  		.targets = targets,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  240  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  241  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  242  	kunit_warning_suppress(test) {
c42e50314a7629a Bartosz Golaszewski 2026-09-09  243  		pwrseq = kunit_pwrseq_device_register(test, &config);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  244  		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  245  	}
c42e50314a7629a Bartosz Golaszewski 2026-09-09  246  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  247  	KUNIT_EXPECT_TRUE(test, IS_ERR(pwrseq));
c42e50314a7629a Bartosz Golaszewski 2026-09-09 @248  	KUNIT_EXPECT_EQ(test, PTR_ERR(pwrseq), -EINVAL);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  249  }
c42e50314a7629a Bartosz Golaszewski 2026-09-09  250  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  251  /*
c42e50314a7629a Bartosz Golaszewski 2026-09-09  252   * Test that a longer chain cycle (A -> B -> C -> D -> A) is also rejected
c42e50314a7629a Bartosz Golaszewski 2026-09-09  253   * with -EINVAL.
c42e50314a7629a Bartosz Golaszewski 2026-09-09  254   */
c42e50314a7629a Bartosz Golaszewski 2026-09-09  255  static void pwrseq_circular_deps_chain(struct kunit *test)
c42e50314a7629a Bartosz Golaszewski 2026-09-09  256  {
c42e50314a7629a Bartosz Golaszewski 2026-09-09  257  	struct pwrseq_unit_data unit_a, unit_b, unit_c, unit_d;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  258  	const struct pwrseq_unit_data *unit_a_deps[2] = { };
c42e50314a7629a Bartosz Golaszewski 2026-09-09  259  	const struct pwrseq_unit_data *unit_b_deps[2] = { };
c42e50314a7629a Bartosz Golaszewski 2026-09-09  260  	const struct pwrseq_unit_data *unit_c_deps[2] = { };
c42e50314a7629a Bartosz Golaszewski 2026-09-09  261  	const struct pwrseq_unit_data *unit_d_deps[2] = { };
c42e50314a7629a Bartosz Golaszewski 2026-09-09  262  	const struct pwrseq_target_data *targets[2] = { };
c42e50314a7629a Bartosz Golaszewski 2026-09-09  263  	struct platform_device *pdev = test->priv;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  264  	struct pwrseq_target_data target;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  265  	struct pwrseq_device *pwrseq;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  266  	struct pwrseq_config config;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  267  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  268  	unit_a = (struct pwrseq_unit_data){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  269  		.name = "unit-a",
c42e50314a7629a Bartosz Golaszewski 2026-09-09  270  		.deps = unit_a_deps,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  271  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  272  	unit_b = (struct pwrseq_unit_data){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  273  		.name = "unit-b",
c42e50314a7629a Bartosz Golaszewski 2026-09-09  274  		.deps = unit_b_deps,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  275  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  276  	unit_c = (struct pwrseq_unit_data){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  277  		.name = "unit-c",
c42e50314a7629a Bartosz Golaszewski 2026-09-09  278  		.deps = unit_c_deps,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  279  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  280  	unit_d = (struct pwrseq_unit_data){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  281  		.name = "unit-d",
c42e50314a7629a Bartosz Golaszewski 2026-09-09  282  		.deps = unit_d_deps,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  283  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  284  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  285  	unit_a_deps[0] = &unit_b;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  286  	unit_b_deps[0] = &unit_c;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  287  	unit_c_deps[0] = &unit_d;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  288  	unit_d_deps[0] = &unit_a;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  289  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  290  	target = (struct pwrseq_target_data){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  291  		.name = "test-target",
c42e50314a7629a Bartosz Golaszewski 2026-09-09  292  		.unit = &unit_a,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  293  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  294  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  295  	targets[0] = &target;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  296  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  297  	config = (struct pwrseq_config){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  298  		.parent = &pdev->dev,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  299  		.match = pwrseq_test_no_match,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  300  		.targets = targets,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  301  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  302  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  303  	kunit_warning_suppress(test) {
c42e50314a7629a Bartosz Golaszewski 2026-09-09  304  		pwrseq = kunit_pwrseq_device_register(test, &config);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  305  		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  306  	}
c42e50314a7629a Bartosz Golaszewski 2026-09-09  307  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  308  	KUNIT_EXPECT_TRUE(test, IS_ERR(pwrseq));
c42e50314a7629a Bartosz Golaszewski 2026-09-09 @309  	KUNIT_EXPECT_EQ(test, PTR_ERR(pwrseq), -EINVAL);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  310  }
c42e50314a7629a Bartosz Golaszewski 2026-09-09  311  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  312  /*
c42e50314a7629a Bartosz Golaszewski 2026-09-09  313   * Test that a valid acyclic dependency graph (A -> B) registers successfully.
c42e50314a7629a Bartosz Golaszewski 2026-09-09  314   */
c42e50314a7629a Bartosz Golaszewski 2026-09-09  315  static void pwrseq_register_valid(struct kunit *test)
c42e50314a7629a Bartosz Golaszewski 2026-09-09  316  {
c42e50314a7629a Bartosz Golaszewski 2026-09-09  317  	const struct pwrseq_unit_data *unit_a_deps[2] = { };
c42e50314a7629a Bartosz Golaszewski 2026-09-09  318  	const struct pwrseq_target_data *targets[2] = { };
c42e50314a7629a Bartosz Golaszewski 2026-09-09  319  	struct platform_device *pdev = test->priv;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  320  	struct pwrseq_unit_data unit_a, unit_b;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  321  	struct pwrseq_target_data target;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  322  	struct pwrseq_device *pwrseq;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  323  	struct pwrseq_config config;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  324  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  325  	unit_b = (struct pwrseq_unit_data){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  326  		.name = "unit-b",
c42e50314a7629a Bartosz Golaszewski 2026-09-09  327  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  328  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  329  	unit_a_deps[0] = &unit_b;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  330  	unit_a = (struct pwrseq_unit_data){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  331  		.name = "unit-a",
c42e50314a7629a Bartosz Golaszewski 2026-09-09  332  		.deps = unit_a_deps,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  333  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  334  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  335  	target = (struct pwrseq_target_data){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  336  		.name = "test-target",
c42e50314a7629a Bartosz Golaszewski 2026-09-09  337  		.unit = &unit_a,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  338  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  339  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  340  	targets[0] = &target;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  341  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  342  	config = (struct pwrseq_config){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  343  		.parent = &pdev->dev,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  344  		.match = pwrseq_test_no_match,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  345  		.targets = targets,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  346  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  347  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  348  	pwrseq = kunit_pwrseq_device_register(test, &config);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  349  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pwrseq);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  350  }
c42e50314a7629a Bartosz Golaszewski 2026-09-09  351  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  352  /*
c42e50314a7629a Bartosz Golaszewski 2026-09-09  353   * Test that registration is rejected with -EINVAL when .parent, .match or
c42e50314a7629a Bartosz Golaszewski 2026-09-09  354   * .targets is missing, or when .targets is a non-NULL but empty array.
c42e50314a7629a Bartosz Golaszewski 2026-09-09  355   */
c42e50314a7629a Bartosz Golaszewski 2026-09-09  356  static void pwrseq_register_invalid_args(struct kunit *test)
c42e50314a7629a Bartosz Golaszewski 2026-09-09  357  {
c42e50314a7629a Bartosz Golaszewski 2026-09-09  358  	const struct pwrseq_target_data *empty_targets[1] = { };
c42e50314a7629a Bartosz Golaszewski 2026-09-09  359  	const struct pwrseq_target_data *targets[2] = { };
c42e50314a7629a Bartosz Golaszewski 2026-09-09  360  	struct platform_device *pdev = test->priv;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  361  	struct pwrseq_target_data target;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  362  	struct pwrseq_unit_data unit;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  363  	struct pwrseq_device *pwrseq;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  364  	struct pwrseq_config config;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  365  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  366  	unit = (struct pwrseq_unit_data){ .name = "unit-a" };
c42e50314a7629a Bartosz Golaszewski 2026-09-09  367  	target = (struct pwrseq_target_data){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  368  		.name = "test-target",
c42e50314a7629a Bartosz Golaszewski 2026-09-09  369  		.unit = &unit,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  370  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  371  	targets[0] = &target;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  372  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  373  	config = (struct pwrseq_config){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  374  		.parent = &pdev->dev,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  375  		.match = pwrseq_test_no_match,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  376  		.targets = targets,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  377  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  378  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  379  	config.parent = NULL;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  380  	pwrseq = kunit_pwrseq_device_register(test, &config);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  381  	KUNIT_EXPECT_TRUE(test, IS_ERR(pwrseq));
c42e50314a7629a Bartosz Golaszewski 2026-09-09 @382  	KUNIT_EXPECT_EQ(test, PTR_ERR(pwrseq), -EINVAL);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  383  	config.parent = &pdev->dev;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  384  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  385  	config.match = NULL;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  386  	pwrseq = kunit_pwrseq_device_register(test, &config);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  387  	KUNIT_EXPECT_TRUE(test, IS_ERR(pwrseq));
c42e50314a7629a Bartosz Golaszewski 2026-09-09  388  	KUNIT_EXPECT_EQ(test, PTR_ERR(pwrseq), -EINVAL);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  389  	config.match = pwrseq_test_no_match;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  390  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  391  	config.targets = NULL;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  392  	pwrseq = kunit_pwrseq_device_register(test, &config);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  393  	KUNIT_EXPECT_TRUE(test, IS_ERR(pwrseq));
c42e50314a7629a Bartosz Golaszewski 2026-09-09  394  	KUNIT_EXPECT_EQ(test, PTR_ERR(pwrseq), -EINVAL);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  395  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  396  	config.targets = empty_targets;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  397  	pwrseq = kunit_pwrseq_device_register(test, &config);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  398  	KUNIT_EXPECT_TRUE(test, IS_ERR(pwrseq));
c42e50314a7629a Bartosz Golaszewski 2026-09-09  399  	KUNIT_EXPECT_EQ(test, PTR_ERR(pwrseq), -EINVAL);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  400  }
c42e50314a7629a Bartosz Golaszewski 2026-09-09  401  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  402  /*
c42e50314a7629a Bartosz Golaszewski 2026-09-09  403   * Test that a target without a unit is rejected with -EINVAL.
c42e50314a7629a Bartosz Golaszewski 2026-09-09  404   */
c42e50314a7629a Bartosz Golaszewski 2026-09-09  405  static void pwrseq_register_target_without_unit(struct kunit *test)
c42e50314a7629a Bartosz Golaszewski 2026-09-09  406  {
c42e50314a7629a Bartosz Golaszewski 2026-09-09  407  	const struct pwrseq_target_data *targets[2] = { };
c42e50314a7629a Bartosz Golaszewski 2026-09-09  408  	struct platform_device *pdev = test->priv;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  409  	struct pwrseq_target_data target;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  410  	struct pwrseq_device *pwrseq;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  411  	struct pwrseq_config config;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  412  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  413  	target = (struct pwrseq_target_data){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  414  		.name = "test-target",
c42e50314a7629a Bartosz Golaszewski 2026-09-09  415  		.unit = NULL,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  416  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  417  	targets[0] = &target;
c42e50314a7629a Bartosz Golaszewski 2026-09-09  418  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  419  	config = (struct pwrseq_config){
c42e50314a7629a Bartosz Golaszewski 2026-09-09  420  		.parent = &pdev->dev,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  421  		.match = pwrseq_test_no_match,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  422  		.targets = targets,
c42e50314a7629a Bartosz Golaszewski 2026-09-09  423  	};
c42e50314a7629a Bartosz Golaszewski 2026-09-09  424  
c42e50314a7629a Bartosz Golaszewski 2026-09-09  425  	pwrseq = kunit_pwrseq_device_register(test, &config);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  426  	KUNIT_EXPECT_TRUE(test, IS_ERR(pwrseq));
c42e50314a7629a Bartosz Golaszewski 2026-09-09 @427  	KUNIT_EXPECT_EQ(test, PTR_ERR(pwrseq), -EINVAL);
c42e50314a7629a Bartosz Golaszewski 2026-09-09  428  }
c42e50314a7629a Bartosz Golaszewski 2026-09-09  429  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
