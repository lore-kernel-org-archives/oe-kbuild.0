Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFC81103
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Sep 2024 04:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727065953; cv=none; b=Dgr8YZvWyw7BE1gqyzKspfi6Lx7+JXe1Rm2nyvgdTBRBhHgvC5tK2xN3iuVvrGexOqu+ICKGGpjq0SodM/tggqkHDsqEHAScD0H/05J/8OjTIyt6axes8I6oFVkLa3/3suB+LTx963273CX0JpcPRiXkgpQ+KcV/l26hsbKAj/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727065953; c=relaxed/simple;
	bh=rCTuGibWn/WgZi8Ul9dgkRV+2KZlCvXzGxmtQK1pLdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ispmLcbB5RK5IPXxT35jgdgInJyWZHd4MFLd4Gz9SDj+psmmegTMgl5puJP8JYubo9p6PtErFTi8yNtY1Qqd9UYOU/KXA4tZWVSrEtxENFhMDlsXapoj7M0p3cjvFKtKaPPexsNO54rbYmjk2lGAht6MFIcCZVAFqSpHaLR9hFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIiAFQXm; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIiAFQXm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727065952; x=1758601952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rCTuGibWn/WgZi8Ul9dgkRV+2KZlCvXzGxmtQK1pLdw=;
  b=CIiAFQXmeJQX53Dc6LkQ/R1udjEeIQsTDpe7u/ju1VreAw90quymZFsM
   GCA+VB41CAjDiXbM0L3NUreaG/KFxDLssd8cMryDWBb9NkGKoW820P4m6
   b+D5XBArusz749z/tQ3jULrw+5DDK22S/Pr12XTg+JJ7pGU6Rr6hJkIgU
   pwHSlSmZuyKkYB3VAJr0EhuMiVazGhS/bCE7efxLCgkPrFczLXpnKjKqq
   5vrkgfpLGXnxQjX1yQWRi09cVi2VhkWt5o9u6jb+uFhZAeN/4/AkDny69
   VDBHBcYj7sJ3ysX3wHa/m5+ZElDY1GaSYNs8ChS98s2cwurM5YokN/iya
   A==;
X-CSE-ConnectionGUID: 8zyJuYdZQJukp5i8n2Nl+Q==
X-CSE-MsgGUID: U9n7dKpXTvWuHDig0YUNPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26150020"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="26150020"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 21:32:31 -0700
X-CSE-ConnectionGUID: mKtfW/hkQKyUV9tTCsbxbQ==
X-CSE-MsgGUID: iOO/tS9sRomZq9NfBdTNsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="71088451"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Sep 2024 21:32:30 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssakN-000Gtc-2V;
	Mon, 23 Sep 2024 04:32:27 +0000
Date: Mon, 23 Sep 2024 12:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/kexec/ranges.c:564 get_crash_memory_ranges() warn:
 iterator 'i' not incremented
Message-ID: <202409231201.8KF58u41-lkp@intel.com>
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
head:   de5cb0dcb74c294ec527eddfe5094acfdb21ff21
commit: f5f0da5a7b18fab383bac92044fd8f4f288c9d38 powerpc/kexec: move *_memory_ranges functions to ranges.c
date:   5 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-r072-20240923 (https://download.01.org/0day-ci/archive/20240923/202409231201.8KF58u41-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409231201.8KF58u41-lkp@intel.com/

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
