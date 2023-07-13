Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786841F929
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Jul 2023 20:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689281171; x=1720817171;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bKGMDekm1r1KHuIGJUk6KJb82ZlmEf3btDj3S96VLcg=;
  b=ET6257r+43QgpsQ3aLRGNaJt3IDVaSrzn+eTFbI5KKF3C95zxgGmQ4sS
   mP67Ae1350otp5xs9GTGkYlkkKBUrauJsG986Xyl5VYUx9YS/M32B/L3o
   5jNnRkDhG9Qg+nLocpTqdwSwl7QbrjJmxb1KjdGFRrATFCzgXTOnWdScF
   CqsqRgX4groIbds4pf/Na9JJjGWtKAF+Yh2wrrOt8/6Elcy/4CQravkA0
   t8iA6riQ6HCv888yhU+V0gKyF6OSUgrCv4t5xLW9+4B7faRxnBwSU0fOY
   Mh+FQlqgABPf9AsabZaGYvRLVQue3N0fKgu8HvC28eUNMyhGBMsW5s082
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="355248253"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="355248253"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 13:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="716088913"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="716088913"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Jul 2023 13:46:09 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK3CS-0006u5-1u;
	Thu, 13 Jul 2023 20:46:08 +0000
Date: Fri, 14 Jul 2023 04:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1840/2369]
 drivers/gpu/drm/tests/drm_exec_test.c:137 test_prepare_array() error:
 uninitialized symbol 'ret'.
Message-ID: <202307140443.C6nJFUJV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Christian König" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3262265625831348cfb3128d35907ead75d8bf7
commit: 9710631cc8f367da04879760b892a8fc7aac9f45 [1840/2369] drm: add drm_exec selftests v4
:::::: branch date: 18 hours ago
:::::: commit date: 32 hours ago
config: m68k-randconfig-m041-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140443.C6nJFUJV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140443.C6nJFUJV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307140443.C6nJFUJV-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/tests/drm_exec_test.c:137 test_prepare_array() error: uninitialized symbol 'ret'.

vim +/ret +137 drivers/gpu/drm/tests/drm_exec_test.c

9710631cc8f367 Christian König 2022-04-13  121  
9710631cc8f367 Christian König 2022-04-13  122  static void test_prepare_array(struct kunit *test)
9710631cc8f367 Christian König 2022-04-13  123  {
9710631cc8f367 Christian König 2022-04-13  124  	struct drm_gem_object gobj1 = { };
9710631cc8f367 Christian König 2022-04-13  125  	struct drm_gem_object gobj2 = { };
9710631cc8f367 Christian König 2022-04-13  126  	struct drm_gem_object *array[] = { &gobj1, &gobj2 };
9710631cc8f367 Christian König 2022-04-13  127  	struct drm_exec exec;
9710631cc8f367 Christian König 2022-04-13  128  	int ret;
9710631cc8f367 Christian König 2022-04-13  129  
9710631cc8f367 Christian König 2022-04-13  130  	drm_gem_private_object_init(&dev, &gobj1, PAGE_SIZE);
9710631cc8f367 Christian König 2022-04-13  131  	drm_gem_private_object_init(&dev, &gobj2, PAGE_SIZE);
9710631cc8f367 Christian König 2022-04-13  132  
9710631cc8f367 Christian König 2022-04-13  133  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
9710631cc8f367 Christian König 2022-04-13  134  	drm_exec_until_all_locked(&exec)
9710631cc8f367 Christian König 2022-04-13  135  		ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
9710631cc8f367 Christian König 2022-04-13  136  					     1);
9710631cc8f367 Christian König 2022-04-13 @137  	KUNIT_EXPECT_EQ(test, ret, 0);
9710631cc8f367 Christian König 2022-04-13  138  	drm_exec_fini(&exec);
9710631cc8f367 Christian König 2022-04-13  139  }
9710631cc8f367 Christian König 2022-04-13  140  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
