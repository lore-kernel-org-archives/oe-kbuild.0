Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B028D2FE57D
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Aug 2025 15:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755097310; cv=none; b=t9Lt5JnJvYDRe6v3dvkcxBorWgAnqIKK3XgbbPXyh1o6VI2kMq9ufmLKm22FyRKyD5AQ2VEXnLmxzNoswMyQQv1udXCu7oL8AU7bj5vG9oPVMz4aEAJC7MyXZ+Kr0sWaJdkI6JpkDaMmyEG3t5EG6l1tvnMA17TL1MU0ShVcujI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755097310; c=relaxed/simple;
	bh=bAsiwIg6hffXvKA5vNmPSh4WAWkyepTjAWvLO9IwOso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RgT74Mxw0Qa+TxAMfP7zAKSJNq3UkAkd1IR9ahmY6e283rZ+EFcSOrBvfa1qlcQpGWRpfbrJkXLpJRwlW4DOj0hhdDzWkoMJ5LijMOC8FOGWSTiTK87bw/aeZBwM4UyKsXJu7qxFziEJ1cwPnSyxp6Gib9htyVkHxYeYp6E2AW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gws4rwAe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gws4rwAe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755097309; x=1786633309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bAsiwIg6hffXvKA5vNmPSh4WAWkyepTjAWvLO9IwOso=;
  b=gws4rwAeT75uBv8g4570tGWvQWnp8Esfdvrmj11DPWpyB6x0AJ5xXie7
   vujwig1XMrFw2VNLXq1mq07dxWOiBayaxpvdgl6DgZbjayCpaU1dltDAh
   1YOpFV0WGY/5nyWa/8HnJizTYsGNGI3bFNB1vPD26SbZMrAMcm6/eQDX/
   0gVgERjkAcjixEjZPEB7E18vLqNvmmbPFdGYvnu4a28qjUlULQ9uyVZOu
   C1aQiZquVqd+AQGHRxOnPrXFltZzncCHcLkVRTFStqgI+0JHQ6rwt8xgR
   tuAaA+cSvTpYFhmOsHiMEbcH5y/uCeAHaduvQNfsnAxMuRtsbLwq/tG6H
   g==;
X-CSE-ConnectionGUID: l5zX/QP2RFOozdQ+2SFHjQ==
X-CSE-MsgGUID: pYlqegF0RyiQVqSEN7ofiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61013496"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="61013496"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 08:01:48 -0700
X-CSE-ConnectionGUID: uIbGA3D2QtWIJ4ui+awXuQ==
X-CSE-MsgGUID: wVPEZEVhT4qv5BmZNdr6+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="170942870"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 13 Aug 2025 08:01:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umCyu-000A0m-0j;
	Wed, 13 Aug 2025 15:01:38 +0000
Date: Wed, 13 Aug 2025 23:00:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hyperv:hyperv-next-staging 4/9]
 include/asm-generic/mshyperv.h:239:4: error: call to
 '__compiletime_assert_878' declared with 'error' attribute: BUILD_BUG_ON
 failed: HV_HVCALL_ARG_PAGES == 1
Message-ID: <202508132201.zXd4byMl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Michael Kelley <mhklinux@outlook.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: Easwar Hariharan <eahariha@linux.microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next-staging
head:   ee8b3b85ffbc4dc06a598a12185537dae67714ab
commit: 1b201a9393f76966b25219b0ecc25c1697fc780a [4/9] Drivers: hv: Use hv_setup_*() to set up hypercall arguments
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-buildonly-randconfig-002-20250813 (https://download.01.org/0day-ci/archive/20250813/202508132201.zXd4byMl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508132201.zXd4byMl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508132201.zXd4byMl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hv/hv_proc.c:10:
   In file included from arch/x86/include/asm/mshyperv.h:327:
>> include/asm-generic/mshyperv.h:239:4: error: call to '__compiletime_assert_878' declared with 'error' attribute: BUILD_BUG_ON failed: HV_HVCALL_ARG_PAGES == 1
     239 |                         BUILD_BUG_ON(HV_HVCALL_ARG_PAGES == 1);
         |                         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:65:1: note: expanded from here
      65 | __compiletime_assert_878
         | ^
   1 error generated.


vim +239 include/asm-generic/mshyperv.h

badc96b0c180aaf Michael Kelley 2025-07-17  167  
badc96b0c180aaf Michael Kelley 2025-07-17  168  /*
badc96b0c180aaf Michael Kelley 2025-07-17  169   * Allocate space for hypercall input and output arguments from the
badc96b0c180aaf Michael Kelley 2025-07-17  170   * pre-allocated per-cpu hyperv_pcpu_args page(s). A NULL value for the input
badc96b0c180aaf Michael Kelley 2025-07-17  171   * or output indicates to allocate no space for that argument. For input and
badc96b0c180aaf Michael Kelley 2025-07-17  172   * for output, specify the size of the fixed portion, and the size of an
badc96b0c180aaf Michael Kelley 2025-07-17  173   * element in a variable size array. A zero value for entry_size indicates
badc96b0c180aaf Michael Kelley 2025-07-17  174   * there is no array. The fixed size space for the input is zero'ed.
badc96b0c180aaf Michael Kelley 2025-07-17  175   *
badc96b0c180aaf Michael Kelley 2025-07-17  176   * When variable size arrays are present, the function returns the number of
badc96b0c180aaf Michael Kelley 2025-07-17  177   * elements (i.e, the batch size) that fit in the available space.
badc96b0c180aaf Michael Kelley 2025-07-17  178   *
badc96b0c180aaf Michael Kelley 2025-07-17  179   * The four "size" arguments must be constants so the compiler can do most of
badc96b0c180aaf Michael Kelley 2025-07-17  180   * the calculations. Then the generated inline code is no larger than if open
badc96b0c180aaf Michael Kelley 2025-07-17  181   * coding the access to the hyperv_pcpu_arg and doing memset() on the input.
badc96b0c180aaf Michael Kelley 2025-07-17  182   *
badc96b0c180aaf Michael Kelley 2025-07-17  183   * This function must be called with interrupts disabled so the thread is not
badc96b0c180aaf Michael Kelley 2025-07-17  184   * rescheduled onto another vCPU while accessing the per-cpu args page.
badc96b0c180aaf Michael Kelley 2025-07-17  185   */
badc96b0c180aaf Michael Kelley 2025-07-17  186  static inline int hv_setup_inout_array(void *input, u32 in_size, u32 in_entry_size,
badc96b0c180aaf Michael Kelley 2025-07-17  187  					void *output, u32 out_size, u32 out_entry_size)
badc96b0c180aaf Michael Kelley 2025-07-17  188  {
badc96b0c180aaf Michael Kelley 2025-07-17  189  	u32 in_batch_count = 0, out_batch_count = 0, batch_count;
badc96b0c180aaf Michael Kelley 2025-07-17  190  	u32 in_total_size, out_total_size, offset;
badc96b0c180aaf Michael Kelley 2025-07-17  191  	u32 batch_space = HV_HYP_PAGE_SIZE * HV_HVCALL_ARG_PAGES;
badc96b0c180aaf Michael Kelley 2025-07-17  192  	void *space;
badc96b0c180aaf Michael Kelley 2025-07-17  193  
badc96b0c180aaf Michael Kelley 2025-07-17  194  	/*
badc96b0c180aaf Michael Kelley 2025-07-17  195  	 * If input and output have arrays, allocate half the space to input
badc96b0c180aaf Michael Kelley 2025-07-17  196  	 * and half to output. If only input has an array, the array can use
badc96b0c180aaf Michael Kelley 2025-07-17  197  	 * all the space except for the fixed size output (but not to exceed
badc96b0c180aaf Michael Kelley 2025-07-17  198  	 * one page), and vice versa.
badc96b0c180aaf Michael Kelley 2025-07-17  199  	 */
badc96b0c180aaf Michael Kelley 2025-07-17  200  	if (in_entry_size && out_entry_size)
badc96b0c180aaf Michael Kelley 2025-07-17  201  		batch_space = batch_space / 2;
badc96b0c180aaf Michael Kelley 2025-07-17  202  	else if (in_entry_size)
badc96b0c180aaf Michael Kelley 2025-07-17  203  		batch_space = min(HV_HYP_PAGE_SIZE, batch_space - out_size);
badc96b0c180aaf Michael Kelley 2025-07-17  204  	else if (out_entry_size)
badc96b0c180aaf Michael Kelley 2025-07-17  205  		batch_space = min(HV_HYP_PAGE_SIZE, batch_space - in_size);
badc96b0c180aaf Michael Kelley 2025-07-17  206  
badc96b0c180aaf Michael Kelley 2025-07-17  207  	if (in_entry_size)
badc96b0c180aaf Michael Kelley 2025-07-17  208  		in_batch_count = (batch_space - in_size) / in_entry_size;
badc96b0c180aaf Michael Kelley 2025-07-17  209  	if (out_entry_size)
badc96b0c180aaf Michael Kelley 2025-07-17  210  		out_batch_count = (batch_space - out_size) / out_entry_size;
badc96b0c180aaf Michael Kelley 2025-07-17  211  
badc96b0c180aaf Michael Kelley 2025-07-17  212  	/*
badc96b0c180aaf Michael Kelley 2025-07-17  213  	 * If input and output have arrays, use the smaller of the two batch
badc96b0c180aaf Michael Kelley 2025-07-17  214  	 * counts, in case they are different. If only one has an array, use
badc96b0c180aaf Michael Kelley 2025-07-17  215  	 * that batch count. batch_count will be zero if neither has an array.
badc96b0c180aaf Michael Kelley 2025-07-17  216  	 */
badc96b0c180aaf Michael Kelley 2025-07-17  217  	if (in_batch_count && out_batch_count)
badc96b0c180aaf Michael Kelley 2025-07-17  218  		batch_count = min(in_batch_count, out_batch_count);
badc96b0c180aaf Michael Kelley 2025-07-17  219  	else
badc96b0c180aaf Michael Kelley 2025-07-17  220  		batch_count = in_batch_count | out_batch_count;
badc96b0c180aaf Michael Kelley 2025-07-17  221  
badc96b0c180aaf Michael Kelley 2025-07-17  222  	in_total_size = ALIGN(in_size + (in_entry_size * batch_count), 8);
badc96b0c180aaf Michael Kelley 2025-07-17  223  	out_total_size = ALIGN(out_size + (out_entry_size * batch_count), 8);
badc96b0c180aaf Michael Kelley 2025-07-17  224  
badc96b0c180aaf Michael Kelley 2025-07-17  225  	space = *this_cpu_ptr(hyperv_pcpu_arg);
badc96b0c180aaf Michael Kelley 2025-07-17  226  	if (input) {
badc96b0c180aaf Michael Kelley 2025-07-17  227  		*(void **)input = space;
badc96b0c180aaf Michael Kelley 2025-07-17  228  		if (space)
badc96b0c180aaf Michael Kelley 2025-07-17  229  			/* Zero the fixed size portion, not any array portion */
badc96b0c180aaf Michael Kelley 2025-07-17  230  			memset(space, 0, ALIGN(in_size, 8));
badc96b0c180aaf Michael Kelley 2025-07-17  231  	}
badc96b0c180aaf Michael Kelley 2025-07-17  232  
badc96b0c180aaf Michael Kelley 2025-07-17  233  	if (output) {
badc96b0c180aaf Michael Kelley 2025-07-17  234  		if (in_total_size + out_total_size <= HV_HYP_PAGE_SIZE) {
badc96b0c180aaf Michael Kelley 2025-07-17  235  			offset = in_total_size;
badc96b0c180aaf Michael Kelley 2025-07-17  236  		} else {
badc96b0c180aaf Michael Kelley 2025-07-17  237  			offset = HV_HYP_PAGE_SIZE;
badc96b0c180aaf Michael Kelley 2025-07-17  238  			/* Need more than 1 page, but only 1 was allocated */
badc96b0c180aaf Michael Kelley 2025-07-17 @239  			BUILD_BUG_ON(HV_HVCALL_ARG_PAGES == 1);
badc96b0c180aaf Michael Kelley 2025-07-17  240  		}
badc96b0c180aaf Michael Kelley 2025-07-17  241  		*(void **)output = space + offset;
badc96b0c180aaf Michael Kelley 2025-07-17  242  	}
badc96b0c180aaf Michael Kelley 2025-07-17  243  
badc96b0c180aaf Michael Kelley 2025-07-17  244  	return batch_count;
badc96b0c180aaf Michael Kelley 2025-07-17  245  }
badc96b0c180aaf Michael Kelley 2025-07-17  246  

:::::: The code at line 239 was first introduced by commit
:::::: badc96b0c180aaf04e5419b9a8ba9efdc43bcafa Drivers: hv: Introduce hv_setup_*() functions for hypercall arguments

:::::: TO: Michael Kelley <mhklinux@outlook.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
