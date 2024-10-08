Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0223F1C9B61
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Oct 2024 12:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728391883; cv=none; b=MwXe3JNcNyfqfmQhDeN54BDVQCxWEolQlADB7sERWhI/s4Zv7Y62FJWjiH1d3yXenYp2QQYY2OiuntUUbP8kW2CMNln16miDAJ6Gua8rQIezCPDB462ME6Q4fa36+cq/MqqcAB1Qt3DneiMUDa9z+prS4zKjls/GrZQBqbKJ34o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728391883; c=relaxed/simple;
	bh=hpb1SwfflLwnXIOoNbZhXoKJK3zRlSdKVcTBt+YrMZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZLoREyxn3MuVv2CnsrOMRtssJKWO6vG5L6cKXT8gQ0ZyU7mEkgeuxlcnoli6OHe9W3C1F5Fzh0xTFB/vZtrUwJQuEPRCTPlm4NAGwiY7kFlmsNHRvV3FKluwblq5Xb0+zPBPbN7/2tuHbjZly3n27Tk+tlVQtztqhlKgJjjiR9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0kPDMtQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0kPDMtQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728391882; x=1759927882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hpb1SwfflLwnXIOoNbZhXoKJK3zRlSdKVcTBt+YrMZM=;
  b=n0kPDMtQ/njxlg429SMitW3ms36xn+UOtgAbXfiUmOCjwxdcrYegkq7M
   l988tLyIc1CiFIEpdh8OzOl02QBmlU1Q6lFi6bGomtrVTK32Gk4ngPCPR
   x3y4Arq8brMtQe9lIy98sEA6F+hqP8sYvVD3FamZSjLVpKm3iXGvKAwKm
   IdozVpaJ0MowUwDC2xH5XzJjKh+LU7i/MFbKvvAt0XFdaAHATffLlPO5/
   7B8tB+SE6+leM34h7ZjSf3EFQUgkWPT0+hQpU2yvosVFqzwdmrcyThHgB
   Ni7lcfbkGIZNtbt1Y31bgSSm0h8AKlNbAIRqQuZX0xoHQQDtXf2B8CCK+
   w==;
X-CSE-ConnectionGUID: IlFoVDywQf6O93LRiUHuFw==
X-CSE-MsgGUID: 8qSd4x7ySZ6w8Cy/K6W76A==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38948849"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="38948849"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 05:51:22 -0700
X-CSE-ConnectionGUID: ykRedXPOT6O6hHaOHcm/DQ==
X-CSE-MsgGUID: wUv7tyBeTwqq47zM0F07jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="75698570"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Oct 2024 05:51:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy9gM-000762-0R;
	Tue, 08 Oct 2024 12:51:18 +0000
Date: Tue, 8 Oct 2024 20:50:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linyunsheng:net-pp-inflight-fix_v3 3/3]
 include/linux/atomic/atomic-arch-fallback.h:846:16: sparse: sparse: constant
 integer operation overflow
Message-ID: <202410082056.oGrW6vdm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/atomic/atomic-arch-fallback.h:846:16: sparse: sparse: constant integer operation overflow"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yunsheng Lin <linyunsheng@huawei.com>

tree:   https://github.com/gestionlin/linux.git net-pp-inflight-fix_v3
head:   bd72d37cdf0449e8175e573706b55a1b5186287a
commit: bd72d37cdf0449e8175e573706b55a1b5186287a [3/3] page_pool: fix IOMMU crash when driver has already unbound
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-121-20241008 (https://download.01.org/0day-ci/archive/20241008/202410082056.oGrW6vdm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410082056.oGrW6vdm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410082056.oGrW6vdm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/page_pool.c: note: in included file (through include/linux/atomic.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
>> include/linux/atomic/atomic-arch-fallback.h:846:16: sparse: sparse: constant integer operation overflow
>> include/linux/atomic/atomic-arch-fallback.h:846:16: sparse: sparse: constant integer operation overflow

vim +846 include/linux/atomic/atomic-arch-fallback.h

37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  825  
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  826  /**
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  827   * raw_atomic_sub_return_release() - atomic subtract with release ordering
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  828   * @i: int value to subtract
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  829   * @v: pointer to atomic_t
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  830   *
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  831   * Atomically updates @v to (@v - @i) with release ordering.
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  832   *
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  833   * Safe to use in noinstr code; prefer atomic_sub_return_release() elsewhere.
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  834   *
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  835   * Return: The updated value of @v.
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  836   */
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  837  static __always_inline int
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  838  raw_atomic_sub_return_release(int i, atomic_t *v)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  839  {
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  840  #if defined(arch_atomic_sub_return_release)
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  841  	return arch_atomic_sub_return_release(i, v);
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  842  #elif defined(arch_atomic_sub_return_relaxed)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  843  	__atomic_release_fence();
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  844  	return arch_atomic_sub_return_relaxed(i, v);
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  845  #elif defined(arch_atomic_sub_return)
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05 @846  	return arch_atomic_sub_return(i, v);
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  847  #else
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  848  #error "Unable to define raw_atomic_sub_return_release"
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  849  #endif
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  850  }
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  851  

:::::: The code at line 846 was first introduced by commit
:::::: 1d78814d41701c216e28fcf2656526146dec4a1a locking/atomic: scripts: simplify raw_atomic*() definitions

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
