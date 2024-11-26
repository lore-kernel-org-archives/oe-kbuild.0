Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD152940D
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Nov 2024 02:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732588168; cv=none; b=q+56La04k4KupEj9FZzS9/8U1yzZOc9ekCDZuiWJgP/bn67rkOy82o7yxYpNk5JUrTipGb1id4m6gijxSr2eVSwacqzIzrnRe7H9YQPFhj1x1MEMWGgKLfF+bW96T5Ks+ealVN/RgUOuRuIv9hUKEpZeojd1W/FlNcSs9cHBm/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732588168; c=relaxed/simple;
	bh=stgdTo6CLb4bsYIIYTuhfKakTxdRzU5lE4UDEWPtMSc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tQg7e9eBFpIC1IC55YfqYs2fS6faI/sQajm9LD+ZBL9iDBet+yYizutenxLnqXqKZnK1MgNPs6DdAxl6q+CaDrZhUmCfT0uN4hoZoQ7dYWz1b3HsRdfwbd+no1gqcldLlixtyAfSFvO3R4iZ1/Lyyc+4b0x7iUBkHbWyJ9BmoSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C59dhtLp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C59dhtLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732588166; x=1764124166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=stgdTo6CLb4bsYIIYTuhfKakTxdRzU5lE4UDEWPtMSc=;
  b=C59dhtLpKt7gnQHCXyILeo3QGDsW8LRIKq5LZkNRYhZQJlGaPSkypJTV
   kt/1uGDoGBmJR+i+p6crAsXRCH9KWa2muvaVKD8w+E91k1iCmHjC0nYSR
   xMifsB4ebPujDGMu2L2FA0K1QkJzCpVIVw90HRAAV726dILjyjboqsrdx
   raWGdEBbXGbRsaMe+xcljvJ+oh/NOuN9vYFKcnIAFsG5+WZt4xuQDUVIe
   vKq0DHBLx58JUYEd1jDPf4k5D/irU/ekGpvNN9OwWtWT58rPqof8rh4jz
   qC55CGLgkxAAEQAXCteu92NvR+INzcjoJmyn/u648jfNCsA0jlqUpAUtE
   A==;
X-CSE-ConnectionGUID: ASLtYrBvQK+p3gmrLMdwSA==
X-CSE-MsgGUID: SQARMrzdRdKsDaG4E661eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32581664"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="32581664"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 18:29:24 -0800
X-CSE-ConnectionGUID: 28yBL/teQmOca/AhWvPDAw==
X-CSE-MsgGUID: xMcw+etISFa1IG6wUvbDKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="128976966"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Nov 2024 18:29:23 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFlKL-0006zb-01;
	Tue, 26 Nov 2024 02:29:21 +0000
Date: Tue, 26 Nov 2024 10:28:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/kexec/ranges.c:564 get_crash_memory_ranges() warn:
 iterator 'i' not incremented
Message-ID: <202411261041.Nr7VE7WO-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Sourabh Jain <sourabhjain@linux.ibm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>

Hi Sourabh,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f16d5e6f220661f73b36a4be1b21575651d8833
commit: f5f0da5a7b18fab383bac92044fd8f4f288c9d38 powerpc/kexec: move *_memory_ranges functions to ranges.c
date:   7 months ago
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
config: powerpc-randconfig-r072-20241126 (https://download.01.org/0day-ci/archive/20241126/202411261041.Nr7VE7WO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411261041.Nr7VE7WO-lkp@intel.com/

smatch warnings:
arch/powerpc/kexec/ranges.c:564 get_crash_memory_ranges() warn: iterator 'i' not incremented

vim +/i +564 arch/powerpc/kexec/ranges.c

f5f0da5a7b18fa Sourabh Jain 2024-03-26  547  
f5f0da5a7b18fa Sourabh Jain 2024-03-26  548  #ifdef CONFIG_CRASH_DUMP
f5f0da5a7b18fa Sourabh Jain 2024-03-26  549  /**
f5f0da5a7b18fa Sourabh Jain 2024-03-26  550   * get_crash_memory_ranges - Get crash memory ranges. This list includes
f5f0da5a7b18fa Sourabh Jain 2024-03-26  551   *                           first/crashing kernel's memory regions that
f5f0da5a7b18fa Sourabh Jain 2024-03-26  552   *                           would be exported via an elfcore.
f5f0da5a7b18fa Sourabh Jain 2024-03-26  553   * @mem_ranges:              Range list to add the memory ranges to.
f5f0da5a7b18fa Sourabh Jain 2024-03-26  554   *
f5f0da5a7b18fa Sourabh Jain 2024-03-26  555   * Returns 0 on success, negative errno on error.
f5f0da5a7b18fa Sourabh Jain 2024-03-26  556   */
f5f0da5a7b18fa Sourabh Jain 2024-03-26  557  int get_crash_memory_ranges(struct crash_mem **mem_ranges)
f5f0da5a7b18fa Sourabh Jain 2024-03-26  558  {
f5f0da5a7b18fa Sourabh Jain 2024-03-26  559  	phys_addr_t base, end;
f5f0da5a7b18fa Sourabh Jain 2024-03-26  560  	struct crash_mem *tmem;
f5f0da5a7b18fa Sourabh Jain 2024-03-26  561  	u64 i;
f5f0da5a7b18fa Sourabh Jain 2024-03-26  562  	int ret;
f5f0da5a7b18fa Sourabh Jain 2024-03-26  563  
f5f0da5a7b18fa Sourabh Jain 2024-03-26 @564  	for_each_mem_range(i, &base, &end) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
