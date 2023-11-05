Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C266EAE7
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 21:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0vS8G7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699220572; x=1730756572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OhjovxoLauogHb70w7uwHvSiBb3Q8dvcU8USB85ktFg=;
  b=F0vS8G7/ZsGZV5WF5RoL5dJhgN7oULHWtwonmft4p4oW2mJ7ts/4Y1hq
   YeIwNil0eSa0cdmTHbBdHtzmLW3qA1rDsiIshaTZ7yJqUuwPlCmEfhuKw
   k2hCMizbPUN/h+m5gHN+2QJEAErGyhGvitu6LEWt56Qi5OARdhMhhnnAM
   l6CaOtSa4hZT5rUcqQ63uU+1iJ/ZdrDlAT/pIP38S6rlfUxl7UlthLYfp
   x52Y1p1inJLrKZHGPpPyi8QJerl5iHGje+DpS2b6yXOG6rfk3XIH4Qg2Q
   wkh6e46CqT4jR24It3xFu+YRborRa1vFy4Cle3ttU/FLOUUip+lOxj++0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379572212"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="379572212"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 13:42:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="10276314"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Nov 2023 13:42:50 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzktL-0005oe-2A;
	Sun, 05 Nov 2023 21:42:47 +0000
Date: Mon, 6 Nov 2023 05:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/kunit/executor_test.c:39 parse_filter_test() error: double free
 of 'filter.suite_glob'
Message-ID: <202311060553.9KUDbtVR-lkp@intel.com>
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
TO: Jinjie Ruan <ruanjinjie@huawei.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Rae Moar <rmoar@google.com>
CC: David Gow <davidgow@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1cfb751165ef685b80635218beff38d6afbce4e2
commit: 2b56a4b79b7b3086e842d39611db4e19b19dbe2a kunit: Fix possible null-ptr-deref in kunit_parse_glob_filter()
date:   9 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-161-20231104 (https://download.01.org/0day-ci/archive/20231106/202311060553.9KUDbtVR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311060553.9KUDbtVR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311060553.9KUDbtVR-lkp@intel.com/

New smatch warnings:
lib/kunit/executor_test.c:39 parse_filter_test() error: double free of 'filter.suite_glob'

Old smatch warnings:
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
a127b154a8f231 Daniel Latypov 2021-09-14  40  	kfree(filter.test_glob);
a127b154a8f231 Daniel Latypov 2021-09-14  41  }
1d71307a6f94df Daniel Latypov 2021-04-20  42  

:::::: The code at line 39 was first introduced by commit
:::::: a127b154a8f231709754b5d56a501163dd837459 kunit: tool: allow filtering test cases via glob

:::::: TO: Daniel Latypov <dlatypov@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
