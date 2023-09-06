Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870456AB3
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Sep 2023 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694032924; x=1725568924;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZNFR0CpNgKVZCg2IeBqAr9T9DNxu6qNOSMdBaZOJCr0=;
  b=bj7NgC80zR3kLbbiqSJwPwEM0aT2Ndb2HwJYMFK5ecIRq45DnZsEaRxo
   dfGV4zZnYiVzVRAtowk3d4MzxKcIFtSqR2w77Ywe+3ZJpWsUUD0MHwe0i
   n9TXNaqt0lYwdrYgDSLxD8yRg8piPFFBk62i7pcnRijxl4ms2JNS2Ovzw
   Ky7vQPAGQOe+sty3FStTBcKFRUPgmJITpKENY8hw9LRHk0YTCGmS+nNZ7
   kndgknbPcogYvC04tj9IIu75bX8WibOxmVBhO0mLo6/Doeb2AASoCQliD
   FEUMVo4tzVMXFbH6Kdyj16xzbgDp2fPwkwgj61/t1IwQ7Ke8QGJSIZcmw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379888198"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="379888198"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 13:42:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741711705"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="741711705"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Sep 2023 13:42:02 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdzLc-0000Zb-0b;
	Wed, 06 Sep 2023 20:42:00 +0000
Date: Thu, 7 Sep 2023 04:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/3] drm/tests/drm_exec: Add a test for object freeing
 within drm_exec_fini()
Message-ID: <202309070408.Sg3LIgiM-lkp@intel.com>
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
In-Reply-To: <20230905085832.2103-3-thomas.hellstrom@linux.intel.com>
References: <20230905085832.2103-3-thomas.hellstrom@linux.intel.com>
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
TO: intel-xe@lists.freedesktop.org
TO: dri-devel@lists.freedesktop.org
CC: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: "Christian König" <christian.koenig@amd.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-tip/drm-tip linus/master next-20230906]
[cannot apply to drm-intel/for-linux-next-fixes v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-kunit-Avoid-a-driver-uaf/20230905-170142
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230905085832.2103-3-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH 2/3] drm/tests/drm_exec: Add a test for object freeing within drm_exec_fini()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20230905 (https://download.01.org/0day-ci/archive/20230907/202309070408.Sg3LIgiM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230907/202309070408.Sg3LIgiM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309070408.Sg3LIgiM-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/tests/drm_exec_test.c:213 test_early_put() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/gpu/drm/tests/drm_exec_test.c:166 test_prepare_array() error: uninitialized symbol 'ret'.
drivers/gpu/drm/tests/drm_exec_test.c:224 test_multiple_loops() warn: ignoring unreachable code.
drivers/gpu/drm/tests/drm_exec_test.c:231 test_multiple_loops() warn: ignoring unreachable code.

vim +/ret +213 drivers/gpu/drm/tests/drm_exec_test.c

2cdef8976237635 Thomas Hellström 2023-09-05  176  
2cdef8976237635 Thomas Hellström 2023-09-05  177  /*
2cdef8976237635 Thomas Hellström 2023-09-05  178   * Check that freeing objects from within drm_exec_fini()
2cdef8976237635 Thomas Hellström 2023-09-05  179   * behaves as expected.
2cdef8976237635 Thomas Hellström 2023-09-05  180   */
2cdef8976237635 Thomas Hellström 2023-09-05  181  static void test_early_put(struct kunit *test)
2cdef8976237635 Thomas Hellström 2023-09-05  182  {
2cdef8976237635 Thomas Hellström 2023-09-05  183  	struct drm_exec_priv *priv = test->priv;
2cdef8976237635 Thomas Hellström 2023-09-05  184  	struct drm_gem_object *gobj1;
2cdef8976237635 Thomas Hellström 2023-09-05  185  	struct drm_gem_object *gobj2;
2cdef8976237635 Thomas Hellström 2023-09-05  186  	struct drm_gem_object *array[2];
2cdef8976237635 Thomas Hellström 2023-09-05  187  	struct drm_exec exec;
2cdef8976237635 Thomas Hellström 2023-09-05  188  	int ret;
2cdef8976237635 Thomas Hellström 2023-09-05  189  
2cdef8976237635 Thomas Hellström 2023-09-05  190  	gobj1 = kzalloc(sizeof(*gobj1), GFP_KERNEL);
2cdef8976237635 Thomas Hellström 2023-09-05  191  	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, gobj1);
2cdef8976237635 Thomas Hellström 2023-09-05  192  	if (!gobj1)
2cdef8976237635 Thomas Hellström 2023-09-05  193  		return;
2cdef8976237635 Thomas Hellström 2023-09-05  194  
2cdef8976237635 Thomas Hellström 2023-09-05  195  	gobj2 = kzalloc(sizeof(*gobj2), GFP_KERNEL);
2cdef8976237635 Thomas Hellström 2023-09-05  196  	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, gobj2);
2cdef8976237635 Thomas Hellström 2023-09-05  197  	if (!gobj2) {
2cdef8976237635 Thomas Hellström 2023-09-05  198  		kfree(gobj1);
2cdef8976237635 Thomas Hellström 2023-09-05  199  		return;
2cdef8976237635 Thomas Hellström 2023-09-05  200  	}
2cdef8976237635 Thomas Hellström 2023-09-05  201  
2cdef8976237635 Thomas Hellström 2023-09-05  202  	gobj1->funcs = &put_funcs;
2cdef8976237635 Thomas Hellström 2023-09-05  203  	gobj2->funcs = &put_funcs;
2cdef8976237635 Thomas Hellström 2023-09-05  204  	array[0] = gobj1;
2cdef8976237635 Thomas Hellström 2023-09-05  205  	array[1] = gobj2;
2cdef8976237635 Thomas Hellström 2023-09-05  206  	drm_gem_private_object_init(priv->drm, gobj1, PAGE_SIZE);
2cdef8976237635 Thomas Hellström 2023-09-05  207  	drm_gem_private_object_init(priv->drm, gobj2, PAGE_SIZE);
2cdef8976237635 Thomas Hellström 2023-09-05  208  
2cdef8976237635 Thomas Hellström 2023-09-05  209  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
2cdef8976237635 Thomas Hellström 2023-09-05  210  	drm_exec_until_all_locked(&exec)
2cdef8976237635 Thomas Hellström 2023-09-05  211  		ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
2cdef8976237635 Thomas Hellström 2023-09-05  212  					     1);
2cdef8976237635 Thomas Hellström 2023-09-05 @213  	KUNIT_EXPECT_EQ(test, ret, 0);
2cdef8976237635 Thomas Hellström 2023-09-05  214  	drm_gem_object_put(gobj1);
2cdef8976237635 Thomas Hellström 2023-09-05  215  	drm_gem_object_put(gobj2);
2cdef8976237635 Thomas Hellström 2023-09-05  216  	drm_exec_fini(&exec);
2cdef8976237635 Thomas Hellström 2023-09-05  217  }
2cdef8976237635 Thomas Hellström 2023-09-05  218  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
