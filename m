Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845B23246ED
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Aug 2026 05:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786165834; cv=none; b=ZdeDi0Qa0si0spYGUh061dT6QOwCdVavkurYokAyrXFqlpgrmeS7TxCodnVb5OJE6//X9A2qoLHFc4Mmm5aEABGd4UTbAebwS6u6L6a9a3/BiNFB4D8ZFqjnHd/vaeB3/cKwxTRQTi6qVMGeRPVjQyvDbNoa+7EKCt42UeGyuss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786165834; c=relaxed/simple;
	bh=DKDKn5FOzJ9ULnX5NDQLVyA1IrvAYo8xlGenVHLYWQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Mc1OQwMUJe/y5GporDmaZ1EBE3W0aXnVx73ZqVFYIiRpKpWNpWaQ43NPTt5/SxNCHD4dd8FaBvTNSyMhvHIzRyBIMPKbI5zwlOXvuQ14QQeDnYAi30l/ci/miPkm08XMJgHpLV3Vo4xwt2XvAUGZb6Gj5SH2hu/lh/HHQXw6ReY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zf99an/T; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zf99an/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786165832; x=1817701832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DKDKn5FOzJ9ULnX5NDQLVyA1IrvAYo8xlGenVHLYWQ0=;
  b=Zf99an/TndlHz4orxZSyRWMn15YVBrw4tK7jVLgwSmr7SfxiGe9CzxMV
   LwGx3w4CwJOF/6w5DGYcuIBCPlH1Ahw3YJjEh9M/07+Kl1KXNPzFuTexE
   YB2P1ywxi0rbkMl3K0QhsZbjTVfWNy9wLY3xzmKY3u4ACBInDE3WdE57Z
   ubhS8p7GfU3Z3D1NCqlHDZ9IJOQ/HpnxyJr1nM9wfHxS6jMUq6SlwRpI9
   osFjDwN4Gp5rvZJdHT58mQyNeUJ34kSH9/6vGh5+OOzWGk6Z/4egdNBZQ
   1ZQvMlkgrW4r1v0nKgi1/M4z69Dgldft37iJb/xg6YZqMJaPjIZqihDY6
   w==;
X-CSE-ConnectionGUID: zT5FywJDQOqZ81f/5QotpA==
X-CSE-MsgGUID: cyJEuYqUR6K3b8Uobma2ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86648693"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="86648693"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 22:10:32 -0700
X-CSE-ConnectionGUID: a7lee78eRXqNbdJCiDYbgw==
X-CSE-MsgGUID: CxtV4EfrRVCiRNIHdRj0nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="259257677"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2026 22:10:30 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsZKG-00000000JmH-2TCZ;
	Sat, 08 Aug 2026 05:10:28 +0000
Date: Sat, 08 Aug 2026 13:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/amdgpu=5Fdm/tests/amd?=
 =?us-ascii?Q?gpu=5Fdm=5Fwb=5Ftest.c:363:38:?= error: no member named
 'encoder' in 'struct drm_writeback_connector'
Message-ID: <202608081250.LsbKHHc0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/John-Harrison/drm-managed-implement-managed-versions-of-kzalloc_obj-objs/20260807-033852, commit: 8f32f6ce121579639f52d30cd5ec2dafee5c9189"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dmitry Baryshkov <lumag@kernel.org>
CC: 0day robot <lkp@intel.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>
CC: Louis Chauvet <louis.chauvet@bootlin.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/John-Harrison/drm-managed-implement-managed-versions-of-kzalloc_obj-objs/20260807-033852
head:   260c8b52af1b6d6dd5da419fcfc9a2b5bc3eed95
commit: 8f32f6ce121579639f52d30cd5ec2dafee5c9189 drm: writeback: drop excess connector initialization functions
date:   33 hours ago
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: arm64-randconfig-r064-20260807 (https://download.01.org/0day-ci/archive/20260808/202608081250.LsbKHHc0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608081250.LsbKHHc0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608081250.LsbKHHc0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:363:38: error: no member named 'encoder' in 'struct drm_writeback_connector'
     363 |         KUNIT_EXPECT_TRUE(test, wbcon->base.encoder.funcs != NULL);
         |                                 ~~~~~~~~~~~ ^
   include/kunit/test.h:994:30: note: expanded from macro 'KUNIT_EXPECT_TRUE'
     994 |         KUNIT_EXPECT_TRUE_MSG(test, condition, NULL)
         |                                     ^~~~~~~~~
   include/kunit/test.h:999:6: note: expanded from macro 'KUNIT_EXPECT_TRUE_MSG'
     999 |                                  condition,                                    \
         |                                  ^~~~~~~~~
   include/kunit/test.h:803:10: note: expanded from macro 'KUNIT_TRUE_MSG_ASSERTION'
     803 |                               condition,                                       \
         |                               ^~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:32:34: note: expanded from macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:363:38: error: no member named 'encoder' in 'struct drm_writeback_connector'
     363 |         KUNIT_EXPECT_TRUE(test, wbcon->base.encoder.funcs != NULL);
         |                                 ~~~~~~~~~~~ ^
   include/kunit/test.h:994:30: note: expanded from macro 'KUNIT_EXPECT_TRUE'
     994 |         KUNIT_EXPECT_TRUE_MSG(test, condition, NULL)
         |                                     ^~~~~~~~~
   include/kunit/test.h:999:6: note: expanded from macro 'KUNIT_EXPECT_TRUE_MSG'
     999 |                                  condition,                                    \
         |                                  ^~~~~~~~~
   include/kunit/test.h:803:10: note: expanded from macro 'KUNIT_TRUE_MSG_ASSERTION'
     803 |                               condition,                                       \
         |                               ^~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:34:19: note: expanded from macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:363:38: error: no member named 'encoder' in 'struct drm_writeback_connector'
     363 |         KUNIT_EXPECT_TRUE(test, wbcon->base.encoder.funcs != NULL);
         |                                 ~~~~~~~~~~~ ^
   include/kunit/test.h:994:30: note: expanded from macro 'KUNIT_EXPECT_TRUE'
     994 |         KUNIT_EXPECT_TRUE_MSG(test, condition, NULL)
         |                                     ^~~~~~~~~
   include/kunit/test.h:999:6: note: expanded from macro 'KUNIT_EXPECT_TRUE_MSG'
     999 |                                  condition,                                    \
         |                                  ^~~~~~~~~
   include/kunit/test.h:803:10: note: expanded from macro 'KUNIT_TRUE_MSG_ASSERTION'
     803 |                               condition,                                       \
         |                               ^~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:32:34: note: expanded from macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:363:38: error: no member named 'encoder' in 'struct drm_writeback_connector'
     363 |         KUNIT_EXPECT_TRUE(test, wbcon->base.encoder.funcs != NULL);
         |                                 ~~~~~~~~~~~ ^
   include/kunit/test.h:994:30: note: expanded from macro 'KUNIT_EXPECT_TRUE'
     994 |         KUNIT_EXPECT_TRUE_MSG(test, condition, NULL)
         |                                     ^~~~~~~~~
   include/kunit/test.h:999:6: note: expanded from macro 'KUNIT_EXPECT_TRUE_MSG'
     999 |                                  condition,                                    \
         |                                  ^~~~~~~~~
   include/kunit/test.h:803:10: note: expanded from macro 'KUNIT_TRUE_MSG_ASSERTION'
     803 |                               condition,                                       \
         |                               ^~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:34:19: note: expanded from macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:363:38: error: no member named 'encoder' in 'struct drm_writeback_connector'
     363 |         KUNIT_EXPECT_TRUE(test, wbcon->base.encoder.funcs != NULL);
         |                                 ~~~~~~~~~~~ ^
   include/kunit/test.h:994:30: note: expanded from macro 'KUNIT_EXPECT_TRUE'
     994 |         KUNIT_EXPECT_TRUE_MSG(test, condition, NULL)
         |                                     ^~~~~~~~~
   include/kunit/test.h:999:6: note: expanded from macro 'KUNIT_EXPECT_TRUE_MSG'
     999 |                                  condition,                                    \
         |                                  ^~~~~~~~~
   include/kunit/test.h:803:10: note: expanded from macro 'KUNIT_TRUE_MSG_ASSERTION'
     803 |                               condition,                                       \
         |                               ^~~~~~~~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:363:38: error: no member named 'encoder' in 'struct drm_writeback_connector'
     363 |         KUNIT_EXPECT_TRUE(test, wbcon->base.encoder.funcs != NULL);
         |                                 ~~~~~~~~~~~ ^
   include/kunit/test.h:994:30: note: expanded from macro 'KUNIT_EXPECT_TRUE'
     994 |         KUNIT_EXPECT_TRUE_MSG(test, condition, NULL)
         |                                     ^~~~~~~~~
   include/kunit/test.h:999:6: note: expanded from macro 'KUNIT_EXPECT_TRUE_MSG'
     999 |                                  condition,                                    \
         |                                  ^~~~~~~~~
   include/kunit/test.h:803:10: note: expanded from macro 'KUNIT_TRUE_MSG_ASSERTION'
     803 |                               condition,                                       \
         |                               ^~~~~~~~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:364:36: error: no member named 'encoder' in 'struct drm_writeback_connector'
     364 |         KUNIT_EXPECT_EQ(test, wbcon->base.encoder.possible_crtcs, 0x1);
         |                               ~~~~~~~~~~~ ^
   include/kunit/test.h:1034:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:1039:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
    1039 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:874:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     874 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:840:15: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:364:36: error: no member named 'encoder' in 'struct drm_writeback_connector'
     364 |         KUNIT_EXPECT_EQ(test, wbcon->base.encoder.possible_crtcs, 0x1);
         |                               ~~~~~~~~~~~ ^
   include/kunit/test.h:1034:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:1039:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
    1039 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:874:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     874 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:840:31: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   8 errors generated.


vim +363 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c

682710244fa317 Alex Hung 2026-06-15  320  
682710244fa317 Alex Hung 2026-06-15  321  /**
682710244fa317 Alex Hung 2026-06-15  322   * dm_test_wb_connector_init_success - Verify writeback connector initialization
682710244fa317 Alex Hung 2026-06-15  323   * @test: KUnit test context
682710244fa317 Alex Hung 2026-06-15  324   *
682710244fa317 Alex Hung 2026-06-15  325   * Uses a DRM mock device embedded in struct amdgpu_device to verify that
682710244fa317 Alex Hung 2026-06-15  326   * amdgpu_dm_wb_connector_init() initializes the writeback connector, stores
682710244fa317 Alex Hung 2026-06-15  327   * the DC link, installs connector state through reset, and wires the expected
682710244fa317 Alex Hung 2026-06-15  328   * DRM callbacks.
682710244fa317 Alex Hung 2026-06-15  329   */
682710244fa317 Alex Hung 2026-06-15  330  static void dm_test_wb_connector_init_success(struct kunit *test)
682710244fa317 Alex Hung 2026-06-15  331  {
682710244fa317 Alex Hung 2026-06-15  332  	struct amdgpu_dm_wb_connector *wbcon;
682710244fa317 Alex Hung 2026-06-15  333  	struct amdgpu_display_manager *dm;
682710244fa317 Alex Hung 2026-06-15  334  	struct amdgpu_device *adev;
682710244fa317 Alex Hung 2026-06-15  335  	struct dc_link *link;
682710244fa317 Alex Hung 2026-06-15  336  	struct dc *dc;
682710244fa317 Alex Hung 2026-06-15  337  	int ret;
682710244fa317 Alex Hung 2026-06-15  338  
a532f8d7e4c96a Alex Hung 2026-06-18  339  	adev = dm_kunit_alloc_adev(test);
682710244fa317 Alex Hung 2026-06-15  340  	adev->mode_info.num_crtc = 1;
682710244fa317 Alex Hung 2026-06-15  341  	dm = &adev->dm;
682710244fa317 Alex Hung 2026-06-15  342  	dm->adev = adev;
682710244fa317 Alex Hung 2026-06-15  343  
682710244fa317 Alex Hung 2026-06-15  344  	dc = kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
682710244fa317 Alex Hung 2026-06-15  345  	KUNIT_ASSERT_NOT_NULL(test, dc);
682710244fa317 Alex Hung 2026-06-15  346  
682710244fa317 Alex Hung 2026-06-15  347  	link = kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
682710244fa317 Alex Hung 2026-06-15  348  	KUNIT_ASSERT_NOT_NULL(test, link);
682710244fa317 Alex Hung 2026-06-15  349  
682710244fa317 Alex Hung 2026-06-15  350  	dc->links[0] = link;
682710244fa317 Alex Hung 2026-06-15  351  	dm->dc = dc;
682710244fa317 Alex Hung 2026-06-15  352  
682710244fa317 Alex Hung 2026-06-15  353  	wbcon = kunit_kzalloc(test, sizeof(*wbcon), GFP_KERNEL);
682710244fa317 Alex Hung 2026-06-15  354  	KUNIT_ASSERT_NOT_NULL(test, wbcon);
682710244fa317 Alex Hung 2026-06-15  355  
682710244fa317 Alex Hung 2026-06-15  356  	ret = amdgpu_dm_wb_connector_init(dm, wbcon, 0);
682710244fa317 Alex Hung 2026-06-15  357  
682710244fa317 Alex Hung 2026-06-15  358  	KUNIT_EXPECT_EQ(test, ret, 0);
682710244fa317 Alex Hung 2026-06-15  359  	KUNIT_EXPECT_PTR_EQ(test, wbcon->link, link);
682710244fa317 Alex Hung 2026-06-15  360  	KUNIT_EXPECT_TRUE(test, wbcon->base.base.funcs != NULL);
682710244fa317 Alex Hung 2026-06-15  361  	KUNIT_EXPECT_TRUE(test, wbcon->base.base.helper_private != NULL);
682710244fa317 Alex Hung 2026-06-15  362  	KUNIT_EXPECT_TRUE(test, wbcon->base.base.state != NULL);
682710244fa317 Alex Hung 2026-06-15 @363  	KUNIT_EXPECT_TRUE(test, wbcon->base.encoder.funcs != NULL);
682710244fa317 Alex Hung 2026-06-15  364  	KUNIT_EXPECT_EQ(test, wbcon->base.encoder.possible_crtcs, 0x1);
682710244fa317 Alex Hung 2026-06-15  365  }
682710244fa317 Alex Hung 2026-06-15  366  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
