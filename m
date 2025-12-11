Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A19821CC4F
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765441792; cv=none; b=XPUAQ4GYRAJ1Qw1X3AC6645lAHad5V180Q5tA5nJQTQSgMZeWQodG7mVrgvHvBvBP1Rni98rEJ5ALVMELN1cOlzeIM1zRZ0F9B45HD61T9636WQsKdh/qRFhqTmXPHCbxVn4iREa6qrfGnZz5afqLzXjb92vKtIGXkMWFzbgRHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765441792; c=relaxed/simple;
	bh=GZ1o1bUKUSvqFH/1ofiDx6a2zRkG5xhiKOrFOuxre6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZWOTVTWEGwVOx5Mf7cfMp7N742+C6Q0mVkRF44fqKCfoMKjxrDJB47vbfPUzXZSj9X9r7+PnGZv4KHASMDM6o1SBYP8QPS+OivWYcol0hnT8st8JEFtjAJyoh+Sta4fvs0++VNzCXu5UTP6W/11jV3WUDRc797uLb6fbjRzJwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOYQiCNd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOYQiCNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765441791; x=1796977791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GZ1o1bUKUSvqFH/1ofiDx6a2zRkG5xhiKOrFOuxre6E=;
  b=JOYQiCNdXfK4nDu1EjVWXypeORK9SfnUhcTRqsaAcdrL/EdkD9SOWgkj
   FZacZkchQrHvw6X9BeFQr7P66Ghwi5Z4/2LyXfzZAetO+Y5BMfn0+dVjL
   0RKIJcWhsr+ydUF060NmgeHAts/bLyOQ8/7uw2HtAnQWJB4FKozVOdufs
   5oJuC5bQyr3bHrhnwIF8k3lp1dZFLlk0bdGtgcVAdQ07KC7Pe1YQmAxtj
   mNIxUEhpLXSStN4jKigtKa8t2DA4aMcj/rf3lJwwJZAgFNLPgB3wDgEy/
   j2eAV9dkauo5jmPbdYjAoIn4UPZmjT0nHfduWKU3JAHvb2iUEh++7EBBb
   g==;
X-CSE-ConnectionGUID: rpnYSj1aQKe3zhIwTppQlw==
X-CSE-MsgGUID: 65Vkfh18RieV2tGC3dZgGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78039048"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78039048"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 00:29:50 -0800
X-CSE-ConnectionGUID: mdGhy963SDif2dfuJ9UYRg==
X-CSE-MsgGUID: C+OJJBroQ/6VUsTzODz2eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196638168"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Dec 2025 00:29:49 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTc3W-000000004PP-2mV1;
	Thu, 11 Dec 2025 08:29:46 +0000
Date: Thu, 11 Dec 2025 16:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/cfi.c:40:1: sparse: sparse: unknown escape sequence: '\%'
Message-ID: <202512111655.WXps9QJU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: kernel/cfi.c:40:1: sparse: sparse: unknown escape sequence: '\%'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <kees@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Nathan Chancellor <nathan@kernel.org>

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 23ef9d439769d5f35353650e771c63d13824235b kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-123-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111655.WXps9QJU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111655.WXps9QJU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512111655.WXps9QJU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/cfi.c:40:1: sparse: sparse: unknown escape sequence: '%'
>> kernel/cfi.c:40:1: sparse: sparse: unknown escape sequence: '%'
   kernel/cfi.c:43:1: sparse: sparse: unknown escape sequence: '%'
   kernel/cfi.c:43:1: sparse: sparse: unknown escape sequence: '%'

vim +40 kernel/cfi.c

cf68fffb66d60d Sami Tolvanen 2021-04-08  31  
f1befc82addda9 Sami Tolvanen 2025-08-01  32  /*
f1befc82addda9 Sami Tolvanen 2025-08-01  33   * Declare two non-existent functions with types that match bpf_func_t and
f1befc82addda9 Sami Tolvanen 2025-08-01  34   * bpf_callback_t pointers, and use DEFINE_CFI_TYPE to define type hash
f1befc82addda9 Sami Tolvanen 2025-08-01  35   * variables for each function type. The cfi_bpf_* variables are used by
f1befc82addda9 Sami Tolvanen 2025-08-01  36   * arch-specific BPF JIT implementations to ensure indirectly callable JIT
f1befc82addda9 Sami Tolvanen 2025-08-01  37   * code has matching CFI type hashes.
f1befc82addda9 Sami Tolvanen 2025-08-01  38   */
f1befc82addda9 Sami Tolvanen 2025-08-01  39  extern typeof(*(bpf_func_t)0) __bpf_prog_runX;
f1befc82addda9 Sami Tolvanen 2025-08-01 @40  DEFINE_CFI_TYPE(cfi_bpf_hash, __bpf_prog_runX);
f1befc82addda9 Sami Tolvanen 2025-08-01  41  

:::::: The code at line 40 was first introduced by commit
:::::: f1befc82addda926c8301436123d041bf3249505 cfi: Move BPF CFI types and helpers to generic code

:::::: TO: Sami Tolvanen <samitolvanen@google.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
