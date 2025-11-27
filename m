Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3021EEB3
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 00:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764201760; cv=none; b=n6whRUz4168t8IKYRtPiRSCvQbFWF3Nbha2RP1KTxre2wzU38Amhf1p1XxmunWG0Z+lXDQXRNdwKXrQwM2dhBBrUBb0VqXnFAL5f/vZ2aAgTf+a+n48lVmvmSkKZKKKBS9kiHNKneuDWxsz6KyH4NJTb+b6UmU4B5Qoe36SExVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764201760; c=relaxed/simple;
	bh=7W94Xujg7j+UiEsF2i5nTK36GZl/YX9Xz3riA5hS+FA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fT676CwOp7t2QBGnjIgcFul/YjG4dGc26nXlxQXrAvSr94yGIU5ZhB3+a4OLKXT5uWutv/9r2MkFnlT2pK56uxjkXWqWSh5Ez74FzfonpwK5ISXPV7z4LT8BxIsHQdzfrgr1npLFpNLMYiWrW5NDk1cWPMwYok4NwrrlDwhCx3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvZPOv7c; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvZPOv7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764201758; x=1795737758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7W94Xujg7j+UiEsF2i5nTK36GZl/YX9Xz3riA5hS+FA=;
  b=cvZPOv7cWFJb0f2XDE5Z4Lc1X8fXHy6rg8ty1I9NxT64YkrZrDG3oKXu
   pgiCrM8JXxHC9y3thJZwBzgsGCHhXDmT4eC1VoRBEWR682+tdoLOwLg3b
   AxxvKwDYcHUIgdn1jCpTxRKRc5oQwxUFtyXjxSeR3z/ZXCJiy4QM9qKSf
   tqSS0EKxTn6UiiPjWu1txzbODw93VDYG4KHdj3FclOZDQ4ac2PODXoBMq
   EIO9yXiTFuQY22CeRatEJSWgH0Pcy+Qm2EexE2VlU2EDzJy5lTZMjmQlA
   iqgi1Ak9Qg6eFQ+T4NYiNaAIW0wSgwc7y5MxtzjgflPwJ3gnSTVno/Hzm
   g==;
X-CSE-ConnectionGUID: /8T6VgDDSgiMbmXnqyPdjg==
X-CSE-MsgGUID: +cQ89684TVSYmZvrFymBHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76936179"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76936179"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 16:02:38 -0800
X-CSE-ConnectionGUID: HFNr0Zh6TGuQQr55PrWxQw==
X-CSE-MsgGUID: OyyzuxkxTIiL7IJl/1KL+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="197411538"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Nov 2025 16:02:32 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOPSv-000000001Yf-2HJZ;
	Thu, 27 Nov 2025 00:02:29 +0000
Date: Thu, 27 Nov 2025 01:02:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-5.10 3333/3333] test_encl.c:36:3: error: incompatible
 function pointer types initializing 'const void (*)(void *)' with an
 expression of type 'void (void *)'
Message-ID: <202511270143.e1Ftgp7w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   18627faf2934ad96de2e45368ec4cf2444343b22
commit: 542b6f40c3a55b186ba771af7c1afc2687e92971 [3333/3333] selftests/sgx: Provide per-op parameter structs for the test enclave
:::::: branch date: 14 hours ago
:::::: commit date: 3 years, 2 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251127/202511270143.e1Ftgp7w-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 226765b60cc54e03386f38874a177c906f5aa6e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270143.e1Ftgp7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511270143.e1Ftgp7w-lkp@intel.com/

All errors (new ones prefixed by >>):

>> test_encl.c:36:3: error: incompatible function pointer types initializing 'const void (*)(void *)' with an expression of type 'void (void *)' [-Wincompatible-function-pointer-types]
      36 |                 do_encl_op_put,
         |                 ^~~~~~~~~~~~~~
   test_encl.c:37:3: error: incompatible function pointer types initializing 'const void (*)(void *)' with an expression of type 'void (void *)' [-Wincompatible-function-pointer-types]
      37 |                 do_encl_op_get,
         |                 ^~~~~~~~~~~~~~
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
