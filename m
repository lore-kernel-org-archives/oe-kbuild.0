Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291F9C151
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Aug 2023 10:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693045782; x=1724581782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H0eGfeDjjkRNPubRN07lj5WQXexnU4tnkgEzw62jaos=;
  b=hKQEhEzH9soE4mcMEXfFqGPeFk2KloinzA+kYEqkGAhBRaTkYh79jujT
   XuLu2VJL+uUBCnYE5ITK5bRW6tbb5oy3RBeIEFGXyFVvAihrpJn/IcJBo
   Vo5G/2+g22PjjghoUTWrTcsDQ0IA31JY1HiWkJ7VFSeZ5U63vPOmjIez4
   CioGA4a6UkFbK1KEHAPny29H1o16M8m175/pxJco3AkK1BtoUJWMPfn7D
   HB+eiXn8btzIyetcCz6SmuOU+aRr7KU/949XpNOVLbUjmCT+8cT95hELp
   6FtT3+95e+2ppb9V71OqTTlYCoHVZMSKHDVmY6RwIHsc5CsdpSIW6swWv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="359857843"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="359857843"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 03:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="1068513381"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="1068513381"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2023 03:29:39 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZqXz-0004c1-00;
	Sat, 26 Aug 2023 10:29:39 +0000
Date: Sat, 26 Aug 2023 18:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/kunit/test.c:336 __kunit_abort() warn: ignoring unreachable code.
Message-ID: <202308261835.XGKyoddf-lkp@intel.com>
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
head:   7d2f353b2682dcfe5f9bc71e5b61d5b61770d98e
commit: 260755184cbdb267a046e7ffd397c1d2ba09bb5e kunit: Move kunit_abort() call out of kunit_do_failed_assertion()
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20230823 (https://download.01.org/0day-ci/archive/20230826/202308261835.XGKyoddf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261835.XGKyoddf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308261835.XGKyoddf-lkp@intel.com/

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
