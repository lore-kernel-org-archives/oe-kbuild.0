Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD79EEAFA
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Jul 2025 01:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753924002; cv=none; b=RsbpQKh86MPyVzEKNMzvZVr4xevy+/t54eTwAT8nhjJ3zhXKdCktbPMKcwnJHJuy63JCA+uY/qIDn7W93YxJx/N50di/LNY05HJ8FdxGMqBLnUswaFeD4A3yyLcESBmvd6057t/c3YD2B4x4tRv9blVPdK7dpyfuckHhAb4Euuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753924002; c=relaxed/simple;
	bh=j5NEQJxaJfup8ucw4Acr/FFUBwwLfSSUUGBlHyk2l+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j6XPboQeuVOJKzbF80EN1kupZB1DQA8PSeq7oz4VpmRDPV4Cjo17+o80NrpeEiLDQ717eY7Us1seGq4YIfy7ZVjN7ZvwQb3cjFeY5OujaC+uDEFRf96C9aTW6DIu3xkTOoOv/bYLre78fupB+AVpWlIk2iBkoziFwKyTeG9MBCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drtEfsJY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drtEfsJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753924000; x=1785460000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j5NEQJxaJfup8ucw4Acr/FFUBwwLfSSUUGBlHyk2l+Q=;
  b=drtEfsJYJyWc3rymBoRJ0bpohGcad8LpVCkZETiO+YoIXC28a67RLzZ3
   N4Nua9HVA6egMPv1DwIhPdBCGlCKzeJQZwjAU+MFi9AkLjFUnFOKYF6aF
   0qkU85+FJk5PUGS/kzKFPQZPRtNE8MW9/Tjk+tky/1aLzXs3lYe/nJ6CC
   l5qZjQPbQE8w1OCWNBpLsQ4tNcETb5dCiP0hLLz3uTpaHq2Id28nTBJlb
   5uHny+pT/2qcDvyGqCWTXoDVtdpYZlC1O1h5WeJwZqAnVppSBEWo17++v
   YEW89Lyg/+1J/wsIAQ/N2nVkWD/tLZTbMHWlq36OJ5G3qdcGqFMHHQhA/
   A==;
X-CSE-ConnectionGUID: XMZsaovGTQG9I9RIzl2JMg==
X-CSE-MsgGUID: MVgEDrXGQk2y6/7EWR/1ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56105226"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="56105226"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:06:37 -0700
X-CSE-ConnectionGUID: I5mgF+JpQTy2y2G+ybw8Ig==
X-CSE-MsgGUID: DCS8mhYPQyqyUsDMwf8FHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="162409969"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Jul 2025 18:06:36 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhHkf-0003Ho-2U;
	Thu, 31 Jul 2025 01:06:33 +0000
Date: Thu, 31 Jul 2025 09:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 6/9] kunit: Enable direct registration of parameter
 arrays to a KUnit test
Message-ID: <202507310854.pZvIcswn-lkp@intel.com>
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
In-Reply-To: <20250729193647.3410634-7-marievic@google.com>
References: <20250729193647.3410634-7-marievic@google.com>
TO: Marie Zhussupova <marievic@google.com>
TO: rmoar@google.com
TO: davidgow@google.com
TO: shuah@kernel.org
TO: brendan.higgins@linux.dev
CC: elver@google.com
CC: dvyukov@google.com
CC: lucas.demarchi@intel.com
CC: thomas.hellstrom@linux.intel.com
CC: rodrigo.vivi@intel.com
CC: linux-kselftest@vger.kernel.org
CC: kunit-dev@googlegroups.com
CC: kasan-dev@googlegroups.com
CC: intel-xe@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: Marie Zhussupova <marievic@google.com>

Hi Marie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/kunit]
[also build test WARNING on shuah-kselftest/kunit-fixes drm-xe/drm-xe-next linus/master v6.16 next-20250730]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marie-Zhussupova/kunit-Add-parent-kunit-for-parameterized-test-context/20250730-033818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git kunit
patch link:    https://lore.kernel.org/r/20250729193647.3410634-7-marievic%40google.com
patch subject: [PATCH 6/9] kunit: Enable direct registration of parameter arrays to a KUnit test
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: nios2-randconfig-r072-20250731 (https://download.01.org/0day-ci/archive/20250731/202507310854.pZvIcswn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507310854.pZvIcswn-lkp@intel.com/

New smatch warnings:
lib/kunit/test.c:723 kunit_run_tests() error: we previously assumed 'test_case->generate_params' could be null (see line 714)

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +723 lib/kunit/test.c

03806177fa4cbb Marie Zhussupova    2025-07-29  680  
914cc63eea6fbe Brendan Higgins     2019-09-23  681  int kunit_run_tests(struct kunit_suite *suite)
914cc63eea6fbe Brendan Higgins     2019-09-23  682  {
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  683  	char param_desc[KUNIT_PARAM_DESC_SIZE];
914cc63eea6fbe Brendan Higgins     2019-09-23  684  	struct kunit_case *test_case;
acd8e8407b8fcc David Gow           2021-08-03  685  	struct kunit_result_stats suite_stats = { 0 };
acd8e8407b8fcc David Gow           2021-08-03  686  	struct kunit_result_stats total_stats = { 0 };
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  687  	const void *curr_param;
914cc63eea6fbe Brendan Higgins     2019-09-23  688  
c272612cb4a2f7 David Gow           2022-07-01  689  	/* Taint the kernel so we know we've run tests. */
c272612cb4a2f7 David Gow           2022-07-01  690  	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
c272612cb4a2f7 David Gow           2022-07-01  691  
1cdba21db2ca31 Daniel Latypov      2022-04-29  692  	if (suite->suite_init) {
1cdba21db2ca31 Daniel Latypov      2022-04-29  693  		suite->suite_init_err = suite->suite_init(suite);
1cdba21db2ca31 Daniel Latypov      2022-04-29  694  		if (suite->suite_init_err) {
1cdba21db2ca31 Daniel Latypov      2022-04-29  695  			kunit_err(suite, KUNIT_SUBTEST_INDENT
1cdba21db2ca31 Daniel Latypov      2022-04-29  696  				  "# failed to initialize (%d)", suite->suite_init_err);
1cdba21db2ca31 Daniel Latypov      2022-04-29  697  			goto suite_end;
1cdba21db2ca31 Daniel Latypov      2022-04-29  698  		}
1cdba21db2ca31 Daniel Latypov      2022-04-29  699  	}
1cdba21db2ca31 Daniel Latypov      2022-04-29  700  
cae56e1740f559 Daniel Latypov      2022-04-29  701  	kunit_print_suite_start(suite);
914cc63eea6fbe Brendan Higgins     2019-09-23  702  
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  703  	kunit_suite_for_each_test_case(suite, test_case) {
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  704  		struct kunit test = { .param_value = NULL, .param_index = 0 };
acd8e8407b8fcc David Gow           2021-08-03  705  		struct kunit_result_stats param_stats = { 0 };
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  706  
887d85a0736ff3 Rae Moar            2023-03-08  707  		kunit_init_test(&test, test_case->name, test_case->log);
03806177fa4cbb Marie Zhussupova    2025-07-29  708  		__kunit_init_parent_test(test_case, &test);
03806177fa4cbb Marie Zhussupova    2025-07-29  709  
529534e8cba3e6 Rae Moar            2023-07-25  710  		if (test_case->status == KUNIT_SKIPPED) {
529534e8cba3e6 Rae Moar            2023-07-25  711  			/* Test marked as skip */
529534e8cba3e6 Rae Moar            2023-07-25  712  			test.status = KUNIT_SKIPPED;
529534e8cba3e6 Rae Moar            2023-07-25  713  			kunit_update_stats(&param_stats, test.status);
44c50ed8e59936 Marie Zhussupova    2025-07-29 @714  		} else if (!test_case->generate_params && !test.params_data.params) {
37dbb4c7c7442d David Gow           2021-11-02  715  			/* Non-parameterised test. */
529534e8cba3e6 Rae Moar            2023-07-25  716  			test_case->status = KUNIT_SKIPPED;
37dbb4c7c7442d David Gow           2021-11-02  717  			kunit_run_case_catch_errors(suite, test_case, &test);
37dbb4c7c7442d David Gow           2021-11-02  718  			kunit_update_stats(&param_stats, test.status);
03806177fa4cbb Marie Zhussupova    2025-07-29  719  		} else if (test_case->status != KUNIT_FAILURE) {
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  720  			/* Get initial param. */
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  721  			param_desc[0] = '\0';
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  722  			/* TODO: Make generate_params try-catch */
13ee0c64bd88a3 Marie Zhussupova    2025-07-29 @723  			curr_param = test_case->generate_params(&test, NULL, param_desc);
529534e8cba3e6 Rae Moar            2023-07-25  724  			test_case->status = KUNIT_SKIPPED;
6c738b52316c58 Rae Moar            2022-11-23  725  			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
6c738b52316c58 Rae Moar            2022-11-23  726  				  "KTAP version 1\n");
44b7da5fcd4c99 David Gow           2021-11-02  727  			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
44b7da5fcd4c99 David Gow           2021-11-02  728  				  "# Subtest: %s", test_case->name);
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  729  
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  730  			while (curr_param) {
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  731  				struct kunit param_test = {
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  732  					.param_value = curr_param,
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  733  					.param_index = ++test.param_index,
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  734  					.parent = &test,
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  735  				};
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  736  				kunit_init_test(&param_test, test_case->name, test_case->log);
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  737  				kunit_run_case_catch_errors(suite, test_case, &param_test);
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  738  
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  739  				if (param_desc[0] == '\0') {
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  740  					snprintf(param_desc, sizeof(param_desc),
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  741  						 "param-%d", test.param_index);
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  742  				}
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  743  
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  744  				kunit_print_ok_not_ok(&param_test, KUNIT_LEVEL_CASE_PARAM,
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  745  						      param_test.status,
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  746  						      param_test.param_index,
b1eaa8b2a55c9d Michal Wajdeczko    2023-05-17  747  						      param_desc,
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  748  						      param_test.status_comment);
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  749  
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  750  				kunit_update_stats(&param_stats, param_test.status);
ee5f8cc2770b2f Michal Wajdeczko    2023-08-31  751  
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  752  				/* Get next param. */
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  753  				param_desc[0] = '\0';
13ee0c64bd88a3 Marie Zhussupova    2025-07-29  754  				curr_param = test_case->generate_params(&test, curr_param,
13ee0c64bd88a3 Marie Zhussupova    2025-07-29  755  									param_desc);
37dbb4c7c7442d David Gow           2021-11-02  756  			}
37dbb4c7c7442d David Gow           2021-11-02  757  		}
acd8e8407b8fcc David Gow           2021-08-03  758  
39e92cb1e4a1f6 Rae Moar            2023-07-25  759  		kunit_print_attr((void *)test_case, true, KUNIT_LEVEL_CASE);
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  760  
acd8e8407b8fcc David Gow           2021-08-03  761  		kunit_print_test_stats(&test, param_stats);
acd8e8407b8fcc David Gow           2021-08-03  762  
b1eaa8b2a55c9d Michal Wajdeczko    2023-05-17  763  		kunit_print_ok_not_ok(&test, KUNIT_LEVEL_CASE, test_case->status,
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  764  				      kunit_test_case_num(suite, test_case),
6d2426b2f258da David Gow           2021-06-24  765  				      test_case->name,
6d2426b2f258da David Gow           2021-06-24  766  				      test.status_comment);
acd8e8407b8fcc David Gow           2021-08-03  767  
acd8e8407b8fcc David Gow           2021-08-03  768  		kunit_update_stats(&suite_stats, test_case->status);
acd8e8407b8fcc David Gow           2021-08-03  769  		kunit_accumulate_stats(&total_stats, param_stats);
03806177fa4cbb Marie Zhussupova    2025-07-29  770  		/*
03806177fa4cbb Marie Zhussupova    2025-07-29  771  		 * TODO: Put into a try catch. Since we don't need suite->exit
03806177fa4cbb Marie Zhussupova    2025-07-29  772  		 * for it we can't reuse kunit_try_run_cleanup for this yet.
03806177fa4cbb Marie Zhussupova    2025-07-29  773  		 */
03806177fa4cbb Marie Zhussupova    2025-07-29  774  		if (test_case->param_exit)
03806177fa4cbb Marie Zhussupova    2025-07-29  775  			test_case->param_exit(&test);
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  776  		/* TODO: Put this kunit_cleanup into a try-catch. */
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  777  		kunit_cleanup(&test);
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  778  	}
914cc63eea6fbe Brendan Higgins     2019-09-23  779  
1cdba21db2ca31 Daniel Latypov      2022-04-29  780  	if (suite->suite_exit)
1cdba21db2ca31 Daniel Latypov      2022-04-29  781  		suite->suite_exit(suite);
1cdba21db2ca31 Daniel Latypov      2022-04-29  782  
acd8e8407b8fcc David Gow           2021-08-03  783  	kunit_print_suite_stats(suite, suite_stats, total_stats);
1cdba21db2ca31 Daniel Latypov      2022-04-29  784  suite_end:
cae56e1740f559 Daniel Latypov      2022-04-29  785  	kunit_print_suite_end(suite);
914cc63eea6fbe Brendan Higgins     2019-09-23  786  
914cc63eea6fbe Brendan Higgins     2019-09-23  787  	return 0;
914cc63eea6fbe Brendan Higgins     2019-09-23  788  }
c475c77d5b5639 Alan Maguire        2020-01-06  789  EXPORT_SYMBOL_GPL(kunit_run_tests);
914cc63eea6fbe Brendan Higgins     2019-09-23  790  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
