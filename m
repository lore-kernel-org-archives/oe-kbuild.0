Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5872E1A6823
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Aug 2026 19:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786131243; cv=none; b=NadrIUFNSlwFTy4NEvZWL+SPNtZ79nv/5AAJYnLq5gWJnR8xnmk1rguC+WbFkgZF8TKgoMABlxKqMuxE9Mpq6tiKqwd4Ln/QG/F2a/F+42uzc2cn3i32MqzUkSpTYYT2904e9HyUfS2ipb80HNsHJN5ZR3ydpD5ef4Ipr1Ab2wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786131243; c=relaxed/simple;
	bh=FF3sHTWBTCNub3eWl2MvP5EIBwfGF3LtOEa/LsxZRmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=o0+TlO/iZPTa7SDLVfdaTt8wjGgHGtjWToiVXsadOkSb1kSe3puJsma3yiK9ontx9Bnztvt/Mo7B7i9JTuAmwTRrlLXl9kCaQItq9JD8tx7Ty12FIIC9ggtEs/2fwY05ys3HAUlnp5t+1xVzkoyf4ayl1M7WUoKKzTDo9KEwjnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfJYUVOY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfJYUVOY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786131241; x=1817667241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FF3sHTWBTCNub3eWl2MvP5EIBwfGF3LtOEa/LsxZRmc=;
  b=GfJYUVOYG+OKWHS35/tSt3RuKVvruIatgY4qEZIR4+QWcXOzoNWjiGmD
   F44zH1tE0jUnoCbcY2u+8Fs8SZEMh6xFqYCnNKQTA5/XXRklgLpLjOdXo
   yqx1UTBJ3aJ7/Y0l1QLBtKU6FguAHmic85fX7v4GJenSPGqs3Cy1/4xfG
   P0UBuV1UBkFXL49UKuqSP/zzPRVt5flIU2CwTOTgT31VHMss5pswF3J2m
   P4rVo0AgLVx9xtJYXY9xETm69zo5FPpdlcm1LqO/GnlRdHsy01uNmXDAw
   9rK7Iy9EHVQi+1yNObPFgR8KeJO0phReAxmeo3lKqk0DDHab2XHvKgF28
   w==;
X-CSE-ConnectionGUID: yD3/1DPeRs2M5KG/aozkVg==
X-CSE-MsgGUID: jDTrkn6VQoSLWFmexO1rXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="90425901"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90425901"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 12:34:01 -0700
X-CSE-ConnectionGUID: WA6B9ujUSEqFtaeo5LfjFA==
X-CSE-MsgGUID: OqyQ96+1SF66N3FqRkajQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="256243318"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Aug 2026 12:33:59 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsQKL-00000000J2z-14MJ;
	Fri, 07 Aug 2026 19:33:57 +0000
Date: Sat, 08 Aug 2026 03:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/amdgpu=5Fdm/tests/amd?=
 =?us-ascii?Q?gpu=5Fdm=5Fwb=5Ftest.c:363:44:?= error: 'struct
 drm_writeback_connector' has no member named 'encoder'
Message-ID: <202608080346.yGgBfsZ8-lkp@intel.com>
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
date:   23 hours ago
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260808/202608080346.yGgBfsZ8-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608080346.yGgBfsZ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608080346.yGgBfsZ8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/err.h:5,
                    from include/kunit/assert.h:12,
                    from include/kunit/test.h:12,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:8:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c: In function 'dm_test_wb_connector_init_success':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:363:44: error: 'struct drm_writeback_connector' has no member named 'encoder'
     363 |         KUNIT_EXPECT_TRUE(test, wbcon->base.encoder.funcs != NULL);
         |                                            ^
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/kunit/test.h:801:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     801 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:997:9: note: in expansion of macro 'KUNIT_TRUE_MSG_ASSERTION'
     997 |         KUNIT_TRUE_MSG_ASSERTION(test,                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:994:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE_MSG'
     994 |         KUNIT_EXPECT_TRUE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:363:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE'
     363 |         KUNIT_EXPECT_TRUE(test, wbcon->base.encoder.funcs != NULL);
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:364:42: error: 'struct drm_writeback_connector' has no member named 'encoder'
     364 |         KUNIT_EXPECT_EQ(test, wbcon->base.encoder.possible_crtcs, 0x1);
         |                                          ^
   include/kunit/test.h:840:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1037:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1037 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1034:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:364:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     364 |         KUNIT_EXPECT_EQ(test, wbcon->base.encoder.possible_crtcs, 0x1);
         |         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:364:42: error: 'struct drm_writeback_connector' has no member named 'encoder'
     364 |         KUNIT_EXPECT_EQ(test, wbcon->base.encoder.possible_crtcs, 0x1);
         |                                          ^
   include/kunit/test.h:840:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1037:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1037 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1034:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:364:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     364 |         KUNIT_EXPECT_EQ(test, wbcon->base.encoder.possible_crtcs, 0x1);
         |         ^~~~~~~~~~~~~~~


vim +363 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c

682710244fa3176 Alex Hung 2026-06-15  320  
682710244fa3176 Alex Hung 2026-06-15  321  /**
682710244fa3176 Alex Hung 2026-06-15  322   * dm_test_wb_connector_init_success - Verify writeback connector initialization
682710244fa3176 Alex Hung 2026-06-15  323   * @test: KUnit test context
682710244fa3176 Alex Hung 2026-06-15  324   *
682710244fa3176 Alex Hung 2026-06-15  325   * Uses a DRM mock device embedded in struct amdgpu_device to verify that
682710244fa3176 Alex Hung 2026-06-15  326   * amdgpu_dm_wb_connector_init() initializes the writeback connector, stores
682710244fa3176 Alex Hung 2026-06-15  327   * the DC link, installs connector state through reset, and wires the expected
682710244fa3176 Alex Hung 2026-06-15  328   * DRM callbacks.
682710244fa3176 Alex Hung 2026-06-15  329   */
682710244fa3176 Alex Hung 2026-06-15  330  static void dm_test_wb_connector_init_success(struct kunit *test)
682710244fa3176 Alex Hung 2026-06-15  331  {
682710244fa3176 Alex Hung 2026-06-15  332  	struct amdgpu_dm_wb_connector *wbcon;
682710244fa3176 Alex Hung 2026-06-15  333  	struct amdgpu_display_manager *dm;
682710244fa3176 Alex Hung 2026-06-15  334  	struct amdgpu_device *adev;
682710244fa3176 Alex Hung 2026-06-15  335  	struct dc_link *link;
682710244fa3176 Alex Hung 2026-06-15  336  	struct dc *dc;
682710244fa3176 Alex Hung 2026-06-15  337  	int ret;
682710244fa3176 Alex Hung 2026-06-15  338  
a532f8d7e4c96a3 Alex Hung 2026-06-18  339  	adev = dm_kunit_alloc_adev(test);
682710244fa3176 Alex Hung 2026-06-15  340  	adev->mode_info.num_crtc = 1;
682710244fa3176 Alex Hung 2026-06-15  341  	dm = &adev->dm;
682710244fa3176 Alex Hung 2026-06-15  342  	dm->adev = adev;
682710244fa3176 Alex Hung 2026-06-15  343  
682710244fa3176 Alex Hung 2026-06-15  344  	dc = kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
682710244fa3176 Alex Hung 2026-06-15  345  	KUNIT_ASSERT_NOT_NULL(test, dc);
682710244fa3176 Alex Hung 2026-06-15  346  
682710244fa3176 Alex Hung 2026-06-15  347  	link = kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
682710244fa3176 Alex Hung 2026-06-15  348  	KUNIT_ASSERT_NOT_NULL(test, link);
682710244fa3176 Alex Hung 2026-06-15  349  
682710244fa3176 Alex Hung 2026-06-15  350  	dc->links[0] = link;
682710244fa3176 Alex Hung 2026-06-15  351  	dm->dc = dc;
682710244fa3176 Alex Hung 2026-06-15  352  
682710244fa3176 Alex Hung 2026-06-15  353  	wbcon = kunit_kzalloc(test, sizeof(*wbcon), GFP_KERNEL);
682710244fa3176 Alex Hung 2026-06-15  354  	KUNIT_ASSERT_NOT_NULL(test, wbcon);
682710244fa3176 Alex Hung 2026-06-15  355  
682710244fa3176 Alex Hung 2026-06-15  356  	ret = amdgpu_dm_wb_connector_init(dm, wbcon, 0);
682710244fa3176 Alex Hung 2026-06-15  357  
682710244fa3176 Alex Hung 2026-06-15  358  	KUNIT_EXPECT_EQ(test, ret, 0);
682710244fa3176 Alex Hung 2026-06-15  359  	KUNIT_EXPECT_PTR_EQ(test, wbcon->link, link);
682710244fa3176 Alex Hung 2026-06-15  360  	KUNIT_EXPECT_TRUE(test, wbcon->base.base.funcs != NULL);
682710244fa3176 Alex Hung 2026-06-15  361  	KUNIT_EXPECT_TRUE(test, wbcon->base.base.helper_private != NULL);
682710244fa3176 Alex Hung 2026-06-15  362  	KUNIT_EXPECT_TRUE(test, wbcon->base.base.state != NULL);
682710244fa3176 Alex Hung 2026-06-15 @363  	KUNIT_EXPECT_TRUE(test, wbcon->base.encoder.funcs != NULL);
682710244fa3176 Alex Hung 2026-06-15  364  	KUNIT_EXPECT_EQ(test, wbcon->base.encoder.possible_crtcs, 0x1);
682710244fa3176 Alex Hung 2026-06-15  365  }
682710244fa3176 Alex Hung 2026-06-15  366  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
