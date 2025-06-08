Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADE11372
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Jun 2025 03:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749353836; cv=none; b=ZcSQ7bCi2moJf2hM+R1IGH1AHi1IswV+LTsTNBmjunftlsXVPaD+JY42/Tc6w5+t6UO6BwNXZT9ahkiV7JNmlmE9AUWCfCeTO8fppgo4URoxGmGsarjLKiCxjf4X1pKAj9TEUQkFuQabblTWan946g1cjyk3brvULw+rpdkhLTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749353836; c=relaxed/simple;
	bh=63Jjsaqi8A0/6Dpimhwint2UWBuDC9SGoX1fws0bZC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uV+x+KbgKJwO1lREZ2jiW0I4vUYODLb/gqydwBHXbdDdchD1IUQjuEB41wyocYTDa26XVqujgC1niptmd3e+J4RE3+j+yaLdbnACwWGNc63tpkDQPE4imc7Ke9EvKAa1TTa6GKNQT1JyH1RusW119KJiCCFjhx/E1fS/m952Rnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6sWVrv9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6sWVrv9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749353834; x=1780889834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=63Jjsaqi8A0/6Dpimhwint2UWBuDC9SGoX1fws0bZC4=;
  b=a6sWVrv9PohkiIRHbTTkI9A+C0oh1DYegasYHHOya8CQQm91U4AgqhJL
   ykIQp0qn/sZ3ZDhzGuY037nYsJcdJZEKXGM1OU9pOEap1BC67xbLdt2/3
   WMOaPbFLgT9RvUpt38BxJRmXQYW9FdXJN4AqJFh7fEXxLLstbpko0K+FE
   82THyzqC/DqbMrOOAGlF7BDjrQOpmCCqAlJQYm70MABcfOkm0psxd4DAT
   LcdebwKU8bx5YUnpWdVLz+aRorG00y5rAycDC2t6hV1hKgFf/o6zXcjz5
   HhWB7ZwoHaJ99Nu06v0YBBhLe5g/cjsBatVtnGixRFxyhj+ms4xKV+TFK
   Q==;
X-CSE-ConnectionGUID: 7KdomjRdS9qjZA2fHdaHJQ==
X-CSE-MsgGUID: eppfKzoSSU+f8dPpS3jMrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="51558369"
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="51558369"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 20:37:14 -0700
X-CSE-ConnectionGUID: C5gdoOp2S7up7BVt4E+q0g==
X-CSE-MsgGUID: QL0oTRK/S2iZrzhGBsdU+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="151061721"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jun 2025 20:37:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uO6qM-0006Aj-2n;
	Sun, 08 Jun 2025 03:37:10 +0000
Date: Sun, 8 Jun 2025 11:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/memblock.c:972 memmap_init_kho_scratch_pages() warn: iterator 'i'
 not incremented
Message-ID: <202506081129.Sw8zhZ5u-lkp@intel.com>
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
TO: Alexander Graf <graf@amazon.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
CC: Changyuan Lyu <changyuanl@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8630c59e99363c4b655788fd01134aef9bcd9264
commit: 2b082d6f6200a386ef6229f4319c0d95c120a840 x86/Kconfig: enable kexec handover for 64 bits
date:   4 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20250608 (https://download.01.org/0day-ci/archive/20250608/202506081129.Sw8zhZ5u-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506081129.Sw8zhZ5u-lkp@intel.com/

smatch warnings:
mm/memblock.c:972 memmap_init_kho_scratch_pages() warn: iterator 'i' not incremented

vim +/i +972 mm/memblock.c

b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  956) 
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  957) __init void memmap_init_kho_scratch_pages(void)
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  958) {
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  959) 	phys_addr_t start, end;
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  960) 	unsigned long pfn;
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  961) 	int nid;
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  962) 	u64 i;
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  963) 
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  964) 	if (!IS_ENABLED(CONFIG_DEFERRED_STRUCT_PAGE_INIT))
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  965) 		return;
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  966) 
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  967) 	/*
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  968) 	 * Initialize struct pages for free scratch memory.
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  969) 	 * The struct pages for reserved scratch memory will be set up in
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  970) 	 * reserve_bootmem_region()
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  971) 	 */
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09 @972) 	__for_each_mem_range(i, &memblock.memory, NULL, NUMA_NO_NODE,
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  973) 			     MEMBLOCK_KHO_SCRATCH, &start, &end, &nid) {
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  974) 		for (pfn = PFN_UP(start); pfn < PFN_DOWN(end); pfn++)
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  975) 			init_deferred_page(pfn, nid);
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  976) 	}
b8a8f96a6dce52 Mike Rapoport (Microsoft  2025-05-09  977) }
d59f43b5748092 Alexander Graf            2025-05-09  978  #endif
d59f43b5748092 Alexander Graf            2025-05-09  979  

:::::: The code at line 972 was first introduced by commit
:::::: b8a8f96a6dce527ad316184ff1e20f238ed413d8 memblock: introduce memmap_init_kho_scratch()

:::::: TO: Mike Rapoport (Microsoft) <rppt@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
