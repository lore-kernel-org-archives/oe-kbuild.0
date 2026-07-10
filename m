Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBCA2F362B
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jul 2026 20:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717159; cv=none; b=hVDSgT9UECKdLfS/aym5yhXfqrfaVQ7pNzANmWfcSiwP5sU6O4JBbiX4BHDfU/JY9Cz8Q1sVFHFCNjRsh4LTxWvfB2+V/3EVMb5ifnlitXyCIj+1/uA8L6pJwiZJF0ka6+km6wkBe6zqXOYjLJT4frHhML5r5iNX7lfv5g8Vce0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717159; c=relaxed/simple;
	bh=xZ3daUJ8Y+3FEVZQJCjONJqU9dia8d5xKWnVBAOyyaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MQ3nBtdkVd4JYDFoPoxIfHS9+u8N0fGVsDlkQw+3OwqEGGz0HJKuJqhjnx4BWgmHyY1usmXNS7prw1w9tpAEBMBWmK8c9aLW25E1CVKidgMuGfEhTaKwCekJ9raC3VQDR3N9MOhtK5qQwPVhREqgXXkPSnrSGkoxRLD5I6X3xZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCdnvp2+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCdnvp2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783717159; x=1815253159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xZ3daUJ8Y+3FEVZQJCjONJqU9dia8d5xKWnVBAOyyaQ=;
  b=hCdnvp2+UNH3W8Xp7uVYDaAAGxMXebCYa+pgYDaHIdSBWG7JXbp1LxhO
   InKGoq3L3ZJ7NLvt8SXYReTfwy74vJtYaodfc+pHoIFoUFKwxXP4E6cPm
   ed6Bbi46qmsJYxzSLYUlnWQ/42sQDFlggy/tTrSoYXBClkXayNfVcY+m6
   nQJgrcjyIncrwrHGyFiwBbOs0gSwwV51dUx19WB1rcNifHObXCTuabFf3
   6Bbh11zFbSX8KvdqMvgPGKWp3rbPqKFUjPE9TgBYb/u62D+WtloZ8hKgq
   LO6A65mwy4bxlCUDCH8vR4t7hBj8RHOSO3t5TMdiDrrTBbFeWmE3OXxQx
   Q==;
X-CSE-ConnectionGUID: IOmWhadaT92MYYnOp1tD4A==
X-CSE-MsgGUID: 9FhlFrLAT6uQPqiW0eqifA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88331042"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88331042"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 13:59:18 -0700
X-CSE-ConnectionGUID: v/w++1jETVeskSEM5NRhQQ==
X-CSE-MsgGUID: g3fFFxOrQ06DiHd2740YBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253242482"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 10 Jul 2026 13:59:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiIJW-00000000JOP-1vLo;
	Fri, 10 Jul 2026 20:59:14 +0000
Date: Sat, 11 Jul 2026 04:58:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] Revert "arm64: Enable vmalloc-huge with ptdump"
Message-ID: <202607110447.q52CyOJd-lkp@intel.com>
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
In-Reply-To: <20260710-series-vmap-race-fix-v1-2-5b3794c113fe@kernel.org>
References: <20260710-series-vmap-race-fix-v1-2-5b3794c113fe@kernel.org>
TO: Lorenzo Stoakes <ljs@kernel.org>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Suren Baghdasaryan <surenb@google.com>
TO: "Liam R. Howlett" <liam@infradead.org>
TO: Vlastimil Babka <vbabka@kernel.org>
TO: Shakeel Butt <shakeel.butt@linux.dev>
TO: David Hildenbrand <david@kernel.org>
TO: Mike Rapoport <rppt@kernel.org>
TO: Michal Hocko <mhocko@suse.com>
TO: Uladzislau Rezki <urezki@gmail.com>
TO: Toshi Kani <toshi.kani@hpe.com>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
CC: David Carlier <devnexen@gmail.com>
CC: Dev Jain <dev.jain@arm.com>
CC: Ryan Roberts <ryan.roberts@arm.com>
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Lorenzo Stoakes <ljs@kernel.org>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a635d6748234582ea287c5ffeae28b9b23f91c7e]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-vmalloc-acquire-init_mm-read-lock-on-huge-vmap-promotion/20260710-185124
base:   a635d6748234582ea287c5ffeae28b9b23f91c7e
patch link:    https://lore.kernel.org/r/20260710-series-vmap-race-fix-v1-2-5b3794c113fe%40kernel.org
patch subject: [PATCH 2/2] Revert "arm64: Enable vmalloc-huge with ptdump"
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: mips-randconfig-r073-20260710 (https://download.01.org/0day-ci/archive/20260711/202607110447.q52CyOJd-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607110447.q52CyOJd-lkp@intel.com/

smatch warnings:
include/linux/mmap_lock.h:624 class_mmap_read_lock_try_constructor() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +624 include/linux/mmap_lock.h

9740ca4e95b43b Michel Lespinasse 2020-06-08  621  
c042c505210dc3 Peter Zijlstra    2025-04-16  622  DEFINE_GUARD(mmap_read_lock, struct mm_struct *,
c042c505210dc3 Peter Zijlstra    2025-04-16  623  	     mmap_read_lock(_T), mmap_read_unlock(_T))
b5a299112e7d1e Lorenzo Stoakes   2026-07-10 @624  DEFINE_GUARD_COND(mmap_read_lock, _try, mmap_read_trylock(_T))
c042c505210dc3 Peter Zijlstra    2025-04-16  625  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
