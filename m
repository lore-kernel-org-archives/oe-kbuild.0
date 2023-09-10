Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8751C3F
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Sep 2023 23:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694388635; x=1725924635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JtYw0zgOqiEr5Ni4H0+YLRgbzzmQ/d7TcUrag78x+Bs=;
  b=bih4XgSdZ3P7AUofe/dwCE4p61zIRXSAdrdsRCdfWsu/GpVzS2MY+yXs
   qzvmGO4T3sw/WKUEo3lVVIHCKxRO3b0+u1102CzeM89Qhgv+jinFbhnRN
   flJf8LJi/CT7CEuzhoJAG96HyTANRzD7dMvHEgdoNUW0mCQSXWZr0/nnA
   8ktvBvKgQmxUa0kE2XzJUucXtwuuubsHFGwOy1+DcgS2RKUqBzo+1nBZW
   i/biEEOQ8IVtjrMmr0Lu3A0Wl6ttdaPhFiI6aNZWUIqKKtmH3MdkUt3X2
   E6b+X6jvvVcvsCyc+7LkL4fa2eSTq7EOfoQ4E/MuPJbjOrrXjenm/7vKV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="368197165"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="368197165"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 16:30:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="772370302"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="772370302"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Sep 2023 16:30:33 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfTst-0005Xw-0G;
	Sun, 10 Sep 2023 23:30:31 +0000
Date: Mon, 11 Sep 2023 07:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13768/14143] lib/kunit/executor_test.c:39
 parse_filter_test() error: double free of 'filter.suite_glob'
Message-ID: <202309110737.57hC1jVf-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jinjie Ruan <ruanjinjie@huawei.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Rae Moar <rmoar@google.com>
CC: David Gow <davidgow@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   af3c30d33476bc2694b0d699173544b07f7ae7de
commit: 2b56a4b79b7b3086e842d39611db4e19b19dbe2a [13768/14143] kunit: Fix possible null-ptr-deref in kunit_parse_glob_filter()
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20230910 (https://download.01.org/0day-ci/archive/20230911/202309110737.57hC1jVf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230911/202309110737.57hC1jVf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309110737.57hC1jVf-lkp@intel.com/

smatch warnings:
lib/kunit/executor_test.c:39 parse_filter_test() error: double free of 'filter.suite_glob'
lib/kunit/executor_test.c:40 parse_filter_test() error: double free of 'filter.test_glob'

vim +39 lib/kunit/executor_test.c

a127b154a8f231 Daniel Latypov 2021-09-14  25  
a127b154a8f231 Daniel Latypov 2021-09-14  26  static void parse_filter_test(struct kunit *test)
a127b154a8f231 Daniel Latypov 2021-09-14  27  {
529534e8cba3e6 Rae Moar       2023-07-25  28  	struct kunit_glob_filter filter = {NULL, NULL};
a127b154a8f231 Daniel Latypov 2021-09-14  29  
529534e8cba3e6 Rae Moar       2023-07-25  30  	kunit_parse_glob_filter(&filter, "suite");
a127b154a8f231 Daniel Latypov 2021-09-14  31  	KUNIT_EXPECT_STREQ(test, filter.suite_glob, "suite");
a127b154a8f231 Daniel Latypov 2021-09-14  32  	KUNIT_EXPECT_FALSE(test, filter.test_glob);
a127b154a8f231 Daniel Latypov 2021-09-14  33  	kfree(filter.suite_glob);
a127b154a8f231 Daniel Latypov 2021-09-14  34  	kfree(filter.test_glob);
a127b154a8f231 Daniel Latypov 2021-09-14  35  
529534e8cba3e6 Rae Moar       2023-07-25  36  	kunit_parse_glob_filter(&filter, "suite.test");
a127b154a8f231 Daniel Latypov 2021-09-14  37  	KUNIT_EXPECT_STREQ(test, filter.suite_glob, "suite");
a127b154a8f231 Daniel Latypov 2021-09-14  38  	KUNIT_EXPECT_STREQ(test, filter.test_glob, "test");
a127b154a8f231 Daniel Latypov 2021-09-14 @39  	kfree(filter.suite_glob);
a127b154a8f231 Daniel Latypov 2021-09-14 @40  	kfree(filter.test_glob);
a127b154a8f231 Daniel Latypov 2021-09-14  41  }
1d71307a6f94df Daniel Latypov 2021-04-20  42  

:::::: The code at line 39 was first introduced by commit
:::::: a127b154a8f231709754b5d56a501163dd837459 kunit: tool: allow filtering test cases via glob

:::::: TO: Daniel Latypov <dlatypov@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
