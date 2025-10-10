Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735D927F003
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Oct 2025 18:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760121078; cv=none; b=g/fxquYRT4e9rC2Mi33Kkj/m0snPPEdjdEgmml2TKw+aMfatn+j7wqk5sY33VxuioBfpzcoLVPI/QktPR9z4XNR6cYBkqUDQnSP2aHTPvOc5nLjZVI90BTnczGtHDVG7h/jjcFcRYfZhpIlx4+FP/mSadqz3feasdmnlTVbHA2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760121078; c=relaxed/simple;
	bh=dJ3TQ3ISXdWdtMg4N+wFKTtd7Fg/1TcMW3OSsRV84mc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b1CMphHCESTZ92LDWlhD6L/k+N7Nrf9f+m0BV+5wLg6fCvkfaWPo9Sd/wShgHqSDy7DJH+dgPrTKuGmGq/A3IJlHdEKl/22HKWgpXwnFgo5BPdn3+LDLt9vFd2zCKcE1n6GDdXF36uDRcSZIyTFg++M3K8rwn+3pRC0KS2u8DSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhI78dFm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhI78dFm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760121074; x=1791657074;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dJ3TQ3ISXdWdtMg4N+wFKTtd7Fg/1TcMW3OSsRV84mc=;
  b=PhI78dFm/+OJFYC0pYao2LjTT7rmPbAAKLhQF2pZiSV2IP7Kz6jWBfLv
   5q3q0NGdmDdFP0TcV+nmJ1grwCRQnBgyQXebk6C2hvp8nyeDfDinShrY8
   JPcfRNOKRDDUMT2uo0Ge8F4dbEIfGjkoxcLruJS/FQ2m4xawu+EfgpJM+
   pcqrtCDAhKkQ/VrGjiMKOghGZJmaNJz4OMkaypurTgvcV9v9wCRIcnMnq
   gowm8ON7Q/c3lcoWJ4JWpI4HaX7i/VkiVfGnPTSkZPVunqnfJKwfiLsqZ
   dNjYNN78cbPu8Kz7mbHSdDaGtGbJBRlTqqeQdhExrkuYUjT+03CdYpsD6
   A==;
X-CSE-ConnectionGUID: cWbWImVHQ7K13xHmALNE+Q==
X-CSE-MsgGUID: DAXgl5/pT12gF4M6xcTOLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="64966079"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="64966079"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 11:31:12 -0700
X-CSE-ConnectionGUID: qFn5j2ZGSg+udy0+jzqttg==
X-CSE-MsgGUID: QdFxKLRmQOiTJvvj17ZsTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="185297841"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Oct 2025 11:31:11 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7HtU-00033f-2h;
	Fri, 10 Oct 2025 18:31:08 +0000
Date: Sat, 11 Oct 2025 02:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] drm/amd: Permit DC_FP_START/END only in non-FP
 compilation units
Message-ID: <202510110219.Z6t2PJbZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251009150621.3886079-2-ardb+git@google.com>
References: <20251009150621.3886079-2-ardb+git@google.com>
TO: Ard Biesheuvel <ardb+git@google.com>
TO: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Austin Zheng <austin.zheng@amd.com>
CC: Jun Lei <jun.lei@amd.com>
CC: Harry Wentland <harry.wentland@amd.com>
CC: Leo Li <sunpeng.li@amd.com>
CC: Rodrigo Siqueira <siqueira@igalia.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian König" <christian.koenig@amd.com>
CC: amd-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org

Hi Ard,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/drm-amd-Permit-DC_FP_START-END-only-in-non-FP-compilation-units/20251010-120206
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20251009150621.3886079-2-ardb%2Bgit%40google.com
patch subject: [PATCH] drm/amd: Permit DC_FP_START/END only in non-FP compilation units
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-071-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110219.Z6t2PJbZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110219.Z6t2PJbZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510110219.Z6t2PJbZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_wrapper.c:563:2: error: call to '__compiletime_assert_610' declared with 'error' attribute: BUILD_BUG failed
     563 |         DC_FP_START();
         |         ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.h:38:23: note: expanded from macro 'DC_FP_START'
      38 | #define DC_FP_START()   BUILD_BUG()
         |                         ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:583:2: note: expanded from macro '_compiletime_assert'
     583 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:576:4: note: expanded from macro '__compiletime_assert'
     576 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:39:1: note: expanded from here
      39 | __compiletime_assert_610
         | ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_wrapper.c:615:2: error: call to '__compiletime_assert_612' declared with 'error' attribute: BUILD_BUG failed
     615 |         DC_FP_START();
         |         ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.h:38:23: note: expanded from macro 'DC_FP_START'
      38 | #define DC_FP_START()   BUILD_BUG()
         |                         ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:583:2: note: expanded from macro '_compiletime_assert'
     583 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:576:4: note: expanded from macro '__compiletime_assert'
     576 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:45:1: note: expanded from here
      45 | __compiletime_assert_612
         | ^
   2 errors generated.


vim +563 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_wrapper.c

7966f319c66d94 Qingqing Zhuo    2023-07-28  547  
269c1d1443d668 Yan Li           2025-05-14  548  bool dml2_validate(const struct dc *in_dc, struct dc_state *context, struct dml2_context *dml2,
269c1d1443d668 Yan Li           2025-05-14  549  	enum dc_validate_mode validate_mode)
7966f319c66d94 Qingqing Zhuo    2023-07-28  550  {
7966f319c66d94 Qingqing Zhuo    2023-07-28  551  	bool out = false;
7966f319c66d94 Qingqing Zhuo    2023-07-28  552  
cc263c3a0c9f38 Joshua Aberback  2024-03-07  553  	if (!dml2)
7966f319c66d94 Qingqing Zhuo    2023-07-28  554  		return false;
cc263c3a0c9f38 Joshua Aberback  2024-03-07  555  	dml2_apply_debug_options(in_dc, dml2);
7966f319c66d94 Qingqing Zhuo    2023-07-28  556  
00c391102abc13 Aurabindo Pillai 2024-03-20  557  	/* DML2.1 validation path */
00c391102abc13 Aurabindo Pillai 2024-03-20  558  	if (dml2->architecture == dml2_architecture_21) {
269c1d1443d668 Yan Li           2025-05-14  559  		out = dml21_validate(in_dc, context, dml2, validate_mode);
00c391102abc13 Aurabindo Pillai 2024-03-20  560  		return out;
00c391102abc13 Aurabindo Pillai 2024-03-20  561  	}
7966f319c66d94 Qingqing Zhuo    2023-07-28  562  
366e77cd4923c3 Huacai Chen      2025-03-27 @563  	DC_FP_START();
366e77cd4923c3 Huacai Chen      2025-03-27  564  
269c1d1443d668 Yan Li           2025-05-14  565  	/* Use dml_validate_only for DC_VALIDATE_MODE_ONLY and DC_VALIDATE_MODE_AND_STATE_INDEX path */
269c1d1443d668 Yan Li           2025-05-14  566  	if (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING)
b02b0fc488ba6e Yan Li           2025-05-21  567  		out = dml2_validate_only(context, validate_mode);
7966f319c66d94 Qingqing Zhuo    2023-07-28  568  	else
b02b0fc488ba6e Yan Li           2025-05-21  569  		out = dml2_validate_and_build_resource(in_dc, context, validate_mode);
366e77cd4923c3 Huacai Chen      2025-03-27  570  
366e77cd4923c3 Huacai Chen      2025-03-27  571  	DC_FP_END();
366e77cd4923c3 Huacai Chen      2025-03-27  572  
7966f319c66d94 Qingqing Zhuo    2023-07-28  573  	return out;
7966f319c66d94 Qingqing Zhuo    2023-07-28  574  }
7966f319c66d94 Qingqing Zhuo    2023-07-28  575  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
