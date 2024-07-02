Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13721BB68D
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jul 2024 15:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719933345; cv=none; b=U6y/B6GfmB2d9U6AtCSxuPRH3bE4kX53UFmvq496f9fuDxOyOzlnMfRw0sSJjzNfdD9/mDHOPAkTVuQ7ZA3l/JUdHKIpfjQsfLsPO6UJa6jRfMR3d6dJYrCM2eSqdFD6/N6VpMDCcUMvefxpr87H/9RJElH4L+5ZzkHJdGPIkyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719933345; c=relaxed/simple;
	bh=4f+/X0V+ULggu0FM5ghf7ejycIq4q5ejEumu51ALfK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dutav2oFT7evStfAb0aO39F9Gwr2f5RyjdPW15YHTCVi5l/mMf41EnPdsFdq5ZpCDY/DX0ycgK4ZVMmgRIJIHjXPxtI4Ik9Pb7fC6+NUZ0eEk1Jd105O/95Od2aAqaDoq6qOjT2lZzTmcLQMIN0DjHNLhxx7RQdzdMb5GJXVIb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0V4MpO6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0V4MpO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719933344; x=1751469344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4f+/X0V+ULggu0FM5ghf7ejycIq4q5ejEumu51ALfK4=;
  b=O0V4MpO6scWer9qnkMCtmr7QqrhrgTU91I3yx0pG05cYlgRnfbp3MvuN
   zlYz3VT4D6LcmUs812CQ4TZkuo3mo38t66CaPPsR0siSvR1H8ciMr9RUf
   bifbnPHd12ODUAVEpxjYuRuT6eEUwlj0Yd06bqJknoOh3A3bpt0z5wIdF
   NNUSvXMRRIg+pZZUEzy161x6oFkdJJ1JYjazmNElJHGsLFhxx6xaC8mXi
   Z6k/GPZrSfgegHT5sc/pYGqKMnp2Zizoj+4edlfg57XR4/Mr2bSiDMz6R
   YiHv6M8PZYMRxnro7+C182tvyIA1jyB206NYt0ujbYSwxrEQB9fNBMw/5
   w==;
X-CSE-ConnectionGUID: 0q80n+uwSXyO84XEP8YnMQ==
X-CSE-MsgGUID: 9BoGUwoBSVewPAbW+2IX5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28248685"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="28248685"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 08:15:42 -0700
X-CSE-ConnectionGUID: H5abxUuxQx+I1lUPtn0ypQ==
X-CSE-MsgGUID: RTLrw/skQqy/l68y7Q6xag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="46003163"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jul 2024 08:15:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOfEJ-000OK8-1S;
	Tue, 02 Jul 2024 15:15:39 +0000
Date: Tue, 2 Jul 2024 23:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/kexec/ranges.c:564 get_crash_memory_ranges() warn:
 iterator 'i' not incremented
Message-ID: <202407022313.HxA5KNM3-lkp@intel.com>
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
head:   1dfe225e9af5bd3399a1dbc6a4df6a6041ff9c23
commit: f5f0da5a7b18fab383bac92044fd8f4f288c9d38 powerpc/kexec: move *_memory_ranges functions to ranges.c
date:   2 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 2 months ago
config: powerpc-randconfig-r081-20240701 (https://download.01.org/0day-ci/archive/20240702/202407022313.HxA5KNM3-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407022313.HxA5KNM3-lkp@intel.com/

smatch warnings:
arch/powerpc/kexec/ranges.c:564 get_crash_memory_ranges() warn: iterator 'i' not incremented

vim +/i +564 arch/powerpc/kexec/ranges.c

f5f0da5a7b18fab Sourabh Jain 2024-03-26  547  
f5f0da5a7b18fab Sourabh Jain 2024-03-26  548  #ifdef CONFIG_CRASH_DUMP
f5f0da5a7b18fab Sourabh Jain 2024-03-26  549  /**
f5f0da5a7b18fab Sourabh Jain 2024-03-26  550   * get_crash_memory_ranges - Get crash memory ranges. This list includes
f5f0da5a7b18fab Sourabh Jain 2024-03-26  551   *                           first/crashing kernel's memory regions that
f5f0da5a7b18fab Sourabh Jain 2024-03-26  552   *                           would be exported via an elfcore.
f5f0da5a7b18fab Sourabh Jain 2024-03-26  553   * @mem_ranges:              Range list to add the memory ranges to.
f5f0da5a7b18fab Sourabh Jain 2024-03-26  554   *
f5f0da5a7b18fab Sourabh Jain 2024-03-26  555   * Returns 0 on success, negative errno on error.
f5f0da5a7b18fab Sourabh Jain 2024-03-26  556   */
f5f0da5a7b18fab Sourabh Jain 2024-03-26  557  int get_crash_memory_ranges(struct crash_mem **mem_ranges)
f5f0da5a7b18fab Sourabh Jain 2024-03-26  558  {
f5f0da5a7b18fab Sourabh Jain 2024-03-26  559  	phys_addr_t base, end;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  560  	struct crash_mem *tmem;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  561  	u64 i;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  562  	int ret;
f5f0da5a7b18fab Sourabh Jain 2024-03-26  563  
f5f0da5a7b18fab Sourabh Jain 2024-03-26 @564  	for_each_mem_range(i, &base, &end) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
