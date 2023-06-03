Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE6B290B
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Jun 2023 19:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685821974; x=1717357974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ic5S9+CcOh4iFqiZtI6q7TRxbiBk87lqy7LGq3tvirY=;
  b=QIC+fM8u4U50l1i7w3Oy/vtzdP8ANt1ckNFU7VIZ9wmwIOejWFAH2tuo
   pOIWj+qsSRBpBzwVWZz8cMx+YdRDUYy1fdfRnXgWSKzE3O4ommGvtaGkn
   3iTuhl7B6RBjmCvfEfYB8WIKUjAXgHcfj3uwV/KvS3n1BbzDbYb1hNkPk
   3bqTSH6QO7j7rNRiOcEW6Z7rnQZEfe0lX2hDzLS9O4lXN9HkGA0I8VVjn
   gEcwz6Rra1O7r4KYqOJLpHCk3Jmv87GpZtx8QhUCFK2USgb/UV2FU+/e8
   4QBditmsKSewRo4yB3wN0spVBa3KEJII6XIMJc3cVFCDcgnLBGCz0m2YX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="336469151"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="336469151"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 12:52:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="778080925"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="778080925"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Jun 2023 12:52:52 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5XIy-0001xz-0G;
	Sat, 03 Jun 2023 19:52:52 +0000
Date: Sun, 4 Jun 2023 03:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6592/6849] lib/kunit/test.c:336 __kunit_abort()
 warn: ignoring unreachable code.
Message-ID: <202306040351.gL71B0Xz-lkp@intel.com>
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
TO: David Gow <davidgow@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Daniel Latypov <dlatypov@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc708bbd8260ee4eb3428b0109f5f3be661fae46
commit: 260755184cbdb267a046e7ffd397c1d2ba09bb5e [6592/6849] kunit: Move kunit_abort() call out of kunit_do_failed_assertion()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-m041-20230531 (https://download.01.org/0day-ci/archive/20230604/202306040351.gL71B0Xz-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306040351.gL71B0Xz-lkp@intel.com/

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
