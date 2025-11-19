Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA5E340A64
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 10:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763549918; cv=none; b=Xd9SCI/1r90QC/VhA/hctwIICUI5hM9knzt/KohLxgosQlYdD8pXcCykAJYydrGqHaag0jUE2gwAGAekUccYIaRooT3ohwT26ZdfVNs4ern8zfJngrFeD3N+sQ2dQMayw8xILiYwdE3BGqeIaUnQncZlaH6k8w4R6BHdgMwbeFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763549918; c=relaxed/simple;
	bh=Uh3TIOrI/KvGiFFdPa6K8zlexv30UHPbV/ic1/B3h6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=huva88vgAOyAVq/D15L2GaD1j1N6fPmfQ7Z1j4vB2OtcscIpYheNNyXNFfHQHkDLsH4MBtihO0wWJMv1gZhKSlf0plXnrMW49sB7ke1KAl24H0rV89hJJ70Z9dsgnV9TldCUVzQD+UhmDKSCtdLreBaMfRmJPx2La6W1qX1V9s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEWk9TGq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEWk9TGq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763549916; x=1795085916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uh3TIOrI/KvGiFFdPa6K8zlexv30UHPbV/ic1/B3h6I=;
  b=ZEWk9TGqtG26eaeZsQTs0M1kykxYBUE/9yc++fdx5LVYsWjLWo57A4K6
   bgqDZr1JxgHEiLLELKMDBE/b9+vKjnYUPRzN5hcFEitt8pIte46tHX58y
   r+2PHooi5MyswyIFASpUCAexdZPw+ojB++0F/JRZ+KgN7/sDT/3jPyrxz
   43pUFBBFdFirUjiz9cM9YUJiI0Dhkufvao2+Zgqtl98vUeTTVmMVW20wo
   QHwJAKMDCbmctJk8dO20t9Ev9tXGqN0J8mm7Ox+rgbMmxdLgMvQK0u+2P
   dGwb9BSknGdL5k1A39x9TOaOJHTj/K3MQWOES6CFL8PC/yNfKIxHf6Htc
   A==;
X-CSE-ConnectionGUID: xwiPAMeGQwOXvYnL0Y+7+A==
X-CSE-MsgGUID: /bfFkVLVSEq+nrIgBWXEIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="69438923"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="69438923"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 02:58:36 -0800
X-CSE-ConnectionGUID: lSlkTTR6TPCmly6E01Y99A==
X-CSE-MsgGUID: uZyi6BwWTv+X+VEjt5ohCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191059168"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Nov 2025 02:58:35 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLftR-0002nD-0M;
	Wed, 19 Nov 2025 10:58:33 +0000
Date: Wed, 19 Nov 2025 18:57:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:objtool-split-fix 3/4] ld.lld: error: undefined symbol:
 boot_cpu_data
Message-ID: <202511191848.fETruKPW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-split-fix
head:   0bef6d9464b6e3f95945b07ed48571e9c323987a
commit: 270f4606de3bda5ae7882f56ee52ad76fd5e8089 [3/4] objtool: Improve alias handling
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251119/202511191848.fETruKPW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191848.fETruKPW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511191848.fETruKPW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: boot_cpu_data
   >>> referenced by p6.c
   >>>               arch/x86/events/intel/p6.o:(p6_pmu_init) in archive vmlinux.a
   >>> referenced by p6.c
   >>>               arch/x86/events/intel/p6.o:(p6_pmu_rdpmc_quirk) in archive vmlinux.a
   >>> referenced by usercopy_64.c
   >>>               arch/x86/lib/usercopy_64.o:(arch_wb_cache_pmem) in archive vmlinux.a
   >>> referenced 1295 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
