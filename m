Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B1D79DE
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Apr 2023 19:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680377920; x=1711913920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=co3tRIUYgjEPpaB9B6NkbjfV5lXbBvf2dwLIQnqJuME=;
  b=j0eIs4FEYSLxf83uYbmrjWPX9jGow7g2yvOLdAAD9J2o/UZ7/MYUgAJS
   xAJ/bZA7a2MDAS/eTe//b5YapG2Vgo+1hC4V2/a6qTBWFRNsvsNyEyb1/
   EjrOW3v+rlY9oNsrQr5gwM2E4VKX1GzA9OWVscFMaAp6NYSe2MEqaf+EM
   7poDkksQPsU35nHgrX1BcfyYiWg1A+sYpphu5BAeVFUw62bQ5bsiKAntw
   LHocSQpo8MUqAHW6/dFHRC4LU9wRL7hISAlz4Jc4CbKRdeZL0nxR/skZC
   qcW3a/R4bNDz1rGkaRS55nLupma43jYON8ciDwqEmI1d637f+pCyfMqrV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="406721506"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="406721506"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 12:38:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="796523412"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="796523412"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Apr 2023 12:38:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pih3d-000Mzj-07;
	Sat, 01 Apr 2023 19:38:37 +0000
Date: Sun, 2 Apr 2023 03:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1] kunit: add tests for using current KUnit test field
Message-ID: <202304020301.XyNDdSxT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/kunit/kunit-test.c:543:17: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230330220506.1399796-1-rmoar@google.com>
References: <20230330220506.1399796-1-rmoar@google.com>
TO: Rae Moar <rmoar@google.com>
TO: brendanhiggins@google.com
TO: davidgow@google.com
TO: dlatypov@google.com
CC: skhan@linuxfoundation.org
CC: kunit-dev@googlegroups.com
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: Rae Moar <rmoar@google.com>

Hi Rae,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 7232282dd47cce6a780c9414bd9baccf232c7686]

url:    https://github.com/intel-lab-lkp/linux/commits/Rae-Moar/kunit-add-tests-for-using-current-KUnit-test-field/20230331-060845
base:   7232282dd47cce6a780c9414bd9baccf232c7686
patch link:    https://lore.kernel.org/r/20230330220506.1399796-1-rmoar%40google.com
patch subject: [PATCH v1] kunit: add tests for using current KUnit test field
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-randconfig-c005-20230329 (https://download.01.org/0day-ci/archive/20230402/202304020301.XyNDdSxT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/0e7eb97c1d33565b326162a07e499413eb4809fb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rae-Moar/kunit-add-tests-for-using-current-KUnit-test-field/20230331-060845
        git checkout 0e7eb97c1d33565b326162a07e499413eb4809fb
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304020301.XyNDdSxT-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:617:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
                                       left, op, right,                           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:584:31: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
           const typeof(left) __left = (left);                                    \
                                        ^~~~
   include/kunit/resource.h:200:7: note: 'name' is non-null
           if (!name)
                ^~~~
   include/kunit/resource.h:200:2: note: Taking false branch
           if (!name)
           ^
   include/kunit/resource.h:204:6: note: Assuming 'existing' is non-null
           if (existing) {
               ^~~~~~~~
   include/kunit/resource.h:204:2: note: Taking true branch
           if (existing) {
           ^
   include/kunit/resource.h:206:3: note: Returning without writing to 'res->data'
                   return -EEXIST;
                   ^
   lib/kunit/kunit-test.c:376:4: note: Returning from 'kunit_add_named_resource'
                           kunit_add_named_resource(test, NULL, NULL, &res1,
                           ^
   include/kunit/test.h:773:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/kunit/test.h:778:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
                                      left, ==, right,                            \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:617:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
                                       left, op, right,                           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:584:31: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
           const typeof(left) __left = (left);                                    \
                                        ^~~~
   lib/kunit/kunit-test.c:375:2: note: Taking false branch
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:773:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:776:2: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
           KUNIT_BINARY_INT_ASSERTION(test,                                       \
           ^
   include/kunit/test.h:613:2: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                                      \
           ^
   include/kunit/test.h:592:2: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
           if (likely(__left op __right))                                         \
           ^
   lib/kunit/kunit-test.c:375:2: note: Loop condition is false.  Exiting loop
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:773:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:776:2: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
           KUNIT_BINARY_INT_ASSERTION(test,                                       \
           ^
   include/kunit/test.h:613:2: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                                      \
           ^
   include/kunit/test.h:595:2: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
           _KUNIT_FAILED(test,                                                    \
           ^
   include/kunit/test.h:482:94: note: expanded from macro '_KUNIT_FAILED'
   #define _KUNIT_FAILED(test, assert_type, assert_class, assert_format, INITIALIZER, fmt, ...) do { \
                                                                                                ^
   lib/kunit/kunit-test.c:375:2: note: Loop condition is false.  Exiting loop
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:773:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:776:2: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
           KUNIT_BINARY_INT_ASSERTION(test,                                       \
           ^
   include/kunit/test.h:613:2: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                                      \
           ^
   include/kunit/test.h:582:24: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
                                       ...)                                       \
                                                                                  ^
   lib/kunit/kunit-test.c:379:2: note: Assigned value is garbage or undefined
           KUNIT_EXPECT_PTR_EQ(test, res1.data, (void *)&ctx);
           ^
   include/kunit/test.h:794:2: note: expanded from macro 'KUNIT_EXPECT_PTR_EQ'
           KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:797:2: note: expanded from macro 'KUNIT_EXPECT_PTR_EQ_MSG'
           KUNIT_BINARY_PTR_ASSERTION(test,                                       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:628:2: note: expanded from macro 'KUNIT_BINARY_PTR_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                                      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:584:2: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
           const typeof(left) __left = (left);                                    \
           ^                           ~~~~~~
>> lib/kunit/kunit-test.c:543:17: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           current_test = current->kunit_test;
                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   lib/kunit/kunit-test.c:543:17: note: Dereference of null pointer
           current_test = current->kunit_test;
                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   lib/kunit/kunit-test.c:560:18: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           current_test2 = current->kunit_test;
                           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   lib/kunit/kunit-test.c:555:2: note: Assuming '__left' is equal to '__right'
           KUNIT_EXPECT_PTR_EQ(test, test, current_test1);
           ^
   include/kunit/test.h:794:2: note: expanded from macro 'KUNIT_EXPECT_PTR_EQ'
           KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:797:2: note: expanded from macro 'KUNIT_EXPECT_PTR_EQ_MSG'
           KUNIT_BINARY_PTR_ASSERTION(test,                                       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:628:2: note: expanded from macro 'KUNIT_BINARY_PTR_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                                      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:592:13: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
           if (likely(__left op __right))                                         \
               ~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   lib/kunit/kunit-test.c:555:2: note: Taking true branch
           KUNIT_EXPECT_PTR_EQ(test, test, current_test1);
           ^
   include/kunit/test.h:794:2: note: expanded from macro 'KUNIT_EXPECT_PTR_EQ'
           KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:797:2: note: expanded from macro 'KUNIT_EXPECT_PTR_EQ_MSG'
           KUNIT_BINARY_PTR_ASSERTION(test,                                       \
           ^
   include/kunit/test.h:628:2: note: expanded from macro 'KUNIT_BINARY_PTR_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                                      \
           ^
   include/kunit/test.h:592:2: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
           if (likely(__left op __right))                                         \
           ^
   lib/kunit/kunit-test.c:555:2: note:  Execution continues on line 560
           KUNIT_EXPECT_PTR_EQ(test, test, current_test1);
           ^
   include/kunit/test.h:794:2: note: expanded from macro 'KUNIT_EXPECT_PTR_EQ'
           KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:797:2: note: expanded from macro 'KUNIT_EXPECT_PTR_EQ_MSG'
           KUNIT_BINARY_PTR_ASSERTION(test,                                       \
           ^
   include/kunit/test.h:628:2: note: expanded from macro 'KUNIT_BINARY_PTR_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                                      \
           ^
   include/kunit/test.h:593:3: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
                   break;                                                         \
                   ^
   lib/kunit/kunit-test.c:560:18: note: Dereference of null pointer
           current_test2 = current->kunit_test;
                           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   lib/kunit/kunit-test.c:571:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           current->kunit_test = &fake;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   lib/kunit/kunit-test.c:570:2: note: Assuming '__left' is equal to '__right'
           KUNIT_EXPECT_EQ(test, fake.status, KUNIT_SUCCESS);
           ^
   include/kunit/test.h:773:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:776:2: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
           KUNIT_BINARY_INT_ASSERTION(test,                                       \

vim +543 lib/kunit/kunit-test.c

6d2426b2f258da David Gow 2021-06-24  535  
0e7eb97c1d3356 Rae Moar  2023-03-30  536  static void kunit_current_kunit_test_field(struct kunit *test)
0e7eb97c1d3356 Rae Moar  2023-03-30  537  {
0e7eb97c1d3356 Rae Moar  2023-03-30  538  	struct kunit *current_test;
0e7eb97c1d3356 Rae Moar  2023-03-30  539  
0e7eb97c1d3356 Rae Moar  2023-03-30  540  	/* Check to ensure the result of current->kunit_test
0e7eb97c1d3356 Rae Moar  2023-03-30  541  	 * is equivalent to current test.
0e7eb97c1d3356 Rae Moar  2023-03-30  542  	 */
0e7eb97c1d3356 Rae Moar  2023-03-30 @543  	current_test = current->kunit_test;
0e7eb97c1d3356 Rae Moar  2023-03-30  544  	KUNIT_EXPECT_PTR_EQ(test, test, current_test);
0e7eb97c1d3356 Rae Moar  2023-03-30  545  }
0e7eb97c1d3356 Rae Moar  2023-03-30  546  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
