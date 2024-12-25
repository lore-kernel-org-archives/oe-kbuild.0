Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A218F2B9A6
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Dec 2024 21:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735160585; cv=none; b=pHIF/0j2Z5uvewJoltTgCTyOG0OK4vgN+2QiLzLQO8UmuoUmuXkodnhGLzEfSM5u5NS0udvDd46WrVQ+4DnuLkK3il0GeANhYK5nJD3Dhbhu9+en0XbRWwDhUTouIly7lb9HMVlnyeh5uwkwAexxOoFf5tIUfS35H2+hO6MXt/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735160585; c=relaxed/simple;
	bh=euKILrllvfs1TA1DePj6hFCuKWQK3F5OtITTXnh2J7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DOqwM0RQ1iz2wkbhHgAJVWzqolqBH1D0kXuumazPLxWDjrDGUmfNyPec2CY3mchA3Dy+5O2Xp+1bomEfeUmgwH00zOnApvo5ZEAyGpqERbOOko+YvKqPJTxqbrx0Sh6Tv/syva1BfDPVmHu0LQ1mXA+nrlCYaWrHfIOA65sGe+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxNrBAFX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxNrBAFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735160583; x=1766696583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=euKILrllvfs1TA1DePj6hFCuKWQK3F5OtITTXnh2J7c=;
  b=fxNrBAFXFrk9DbF0yF+F71rFsOA21UO6ivjmDU7HcWQ8ka1jppGK4ccq
   HiOBgIwtjzHiSGhHtvXyFYSSJ4cjHR6KFLE5kFIVAlhYgxjDPJnAt9v4D
   iK6UwOVqKnKWPfW6DakT0j4g715PSpeF9qvCgnYEXsut2Qefn6IieWLoD
   1Qw8X++3AHY8PiNOWR6IzBNVseNdsxlP0fNAOSrkrg+swvFEtuSksP6sz
   s2WNBTGNQW4XynbD1UPHtdnto9NLacYzVsVKiE1eRPZw9q4RyzmZls1Os
   M4oHKy5bMlFKolW2KSbxMf/nzOJViqBu0G66sYkrE/E13kxfqgvT7n9so
   w==;
X-CSE-ConnectionGUID: s5TbYDhNR72inUAGX+01Zg==
X-CSE-MsgGUID: UMZVMHVTSYW0ZG0kMeaZww==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35712082"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="35712082"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 13:03:02 -0800
X-CSE-ConnectionGUID: dvELh8H0S0OP2wOf49mC2A==
X-CSE-MsgGUID: nAMgu3LXSh+bT0vtx0lXSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="130624833"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Dec 2024 13:03:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQYWw-000296-1g;
	Wed, 25 Dec 2024 21:02:58 +0000
Date: Thu, 26 Dec 2024 05:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/bpf/kmem_cache_iter.c:13:7-15: WARNING use flexible-array
 member instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202412260400.BelOqEz4-lkp@intel.com>
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
TO: Namhyung Kim <namhyung@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe
commit: 2e9a548009c2d804e55cdd5b0e9903756cf7d9b3 bpf: Add open coded version of kmem_cache iterator
date:   8 weeks ago
:::::: branch date: 28 hours ago
:::::: commit date: 8 weeks ago
config: powerpc-randconfig-r052-20241225 (https://download.01.org/0day-ci/archive/20241226/202412260400.BelOqEz4-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412260400.BelOqEz4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/kmem_cache_iter.c:13:7-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +13 kernel/bpf/kmem_cache_iter.c

4971266e1595f7 Namhyung Kim 2024-10-10  10  
2e9a548009c2d8 Namhyung Kim 2024-10-30  11  /* open-coded version */
2e9a548009c2d8 Namhyung Kim 2024-10-30  12  struct bpf_iter_kmem_cache {
2e9a548009c2d8 Namhyung Kim 2024-10-30 @13  	__u64 __opaque[1];
2e9a548009c2d8 Namhyung Kim 2024-10-30  14  } __attribute__((aligned(8)));
2e9a548009c2d8 Namhyung Kim 2024-10-30  15  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
