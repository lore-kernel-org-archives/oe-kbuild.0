Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE3C168CE
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 18:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxEsLyeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699207244; x=1730743244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I/ip8b8Nu/cycF13H/IRzuKBgBtvIB/gb6v4nQDgaDU=;
  b=dxEsLyeMzZq7PYqahQ67bUFGpqfBIyL/7gEvNh7yeQoQYhzCB+nXLPmH
   HFCPX3c5E8RLSlnoTcfbrYyj1XCfGr0JuRstYRyDalseC2epejm3FI0g0
   K4F1m45PNOGtqf+Z6ZQDVYL+fYt4VtimW69ByLatT9jBN1LAr1AgBeTY7
   +M6kMqBJyEIBGbSNan+T4ZuQ5a9XN2py/EKNKMapypg0yOf2RU1A84h2q
   TOAGcE+0S0lgZejNGXl49bzoiOca6jFba9LjY4ZFeQikgYqWqycjDqzRR
   YgY0AGfcG/bK+rhjdU3abAU1XpVENamT7nh1mODEz1XdHF/le4/MbDF3a
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="453469448"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="453469448"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 10:00:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="905846283"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="905846283"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2023 10:00:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzhQN-0005ga-2z;
	Sun, 05 Nov 2023 18:00:39 +0000
Date: Mon, 6 Nov 2023 02:00:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/kunit/test.c:336 __kunit_abort() warn: ignoring unreachable code.
Message-ID: <202311060111.NyzqrICu-lkp@intel.com>
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
TO: David Gow <davidgow@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Daniel Latypov <dlatypov@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c41041124bd14dd6610da256a3da4e5b74ce6b1
commit: 260755184cbdb267a046e7ffd397c1d2ba09bb5e kunit: Move kunit_abort() call out of kunit_do_failed_assertion()
date:   5 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20231104 (https://download.01.org/0day-ci/archive/20231106/202311060111.NyzqrICu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311060111.NyzqrICu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311060111.NyzqrICu-lkp@intel.com/

smatch warnings:
lib/kunit/test.c:336 __kunit_abort() warn: ignoring unreachable code.

vim +336 lib/kunit/test.c

73cda7bb8bfb1d Brendan Higgins 2019-09-23  325  
260755184cbdb2 David Gow       2023-05-31  326  void __noreturn __kunit_abort(struct kunit *test)
5f3e06208920ee Brendan Higgins 2019-09-23  327  {
5f3e06208920ee Brendan Higgins 2019-09-23  328  	kunit_try_catch_throw(&test->try_catch); /* Does not return. */
5f3e06208920ee Brendan Higgins 2019-09-23  329  
5f3e06208920ee Brendan Higgins 2019-09-23  330  	/*
5f3e06208920ee Brendan Higgins 2019-09-23  331  	 * Throw could not abort from test.
5f3e06208920ee Brendan Higgins 2019-09-23  332  	 *
5f3e06208920ee Brendan Higgins 2019-09-23  333  	 * XXX: we should never reach this line! As kunit_try_catch_throw is
5f3e06208920ee Brendan Higgins 2019-09-23  334  	 * marked __noreturn.
5f3e06208920ee Brendan Higgins 2019-09-23  335  	 */
5f3e06208920ee Brendan Higgins 2019-09-23 @336  	WARN_ONCE(true, "Throw could not abort from test!\n");
5f3e06208920ee Brendan Higgins 2019-09-23  337  }
260755184cbdb2 David Gow       2023-05-31  338  EXPORT_SYMBOL_GPL(__kunit_abort);
5f3e06208920ee Brendan Higgins 2019-09-23  339  

:::::: The code at line 336 was first introduced by commit
:::::: 5f3e06208920ee78b68cf3527f40ffbff83cb3bc kunit: test: add support for test abort

:::::: TO: Brendan Higgins <brendanhiggins@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
