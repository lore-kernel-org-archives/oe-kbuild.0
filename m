Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9D71DA0E8
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Sep 2024 14:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725460045; cv=none; b=j1m7nBbn3h2wL2R0z/QnaD627KVD5jT3DFF8GnUFt6vDV9a40B8dbpBg5b/yEz9F6lKQV4ZWLPjRAF9R+GoN4zRhrAk2SkwSjor9g7bg1IQRleEiu4sCPotA3yCii/Y9H9HbohHgOIPd6RUypm/q3vrRqtoPBrRJUMbdazwMEtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725460045; c=relaxed/simple;
	bh=gciUNLK2X1Xj6aYCrhQuCenJ67tWRd6b8KODGOIwaqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f97+eNNvuNNaynRZMkTVaNMGc11WoVc5CeOE3t0b5ylkORgwENV8s4PGq4JXe6k7UpC8oMPVH1GokqgQnulys6742034hPXMz1H6WRRXTu55gE/oGgnIMqRPgN15cC/3VAzntU3ovJg2ln4f0JL4eUsL+YyQeXbTy+hyOrDggmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZO6VOS99; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZO6VOS99"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725460043; x=1756996043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gciUNLK2X1Xj6aYCrhQuCenJ67tWRd6b8KODGOIwaqo=;
  b=ZO6VOS99Dijqk9KcboGyIY2DVyEkBKtTtP1Jooz3roHHKVPvOkexHaYp
   FNqfg8AzBLZgTwhdv8xDmF7zQOVGBRH3AZZWI/cs/Nw+fT6M9bHws7pkB
   40a3gkWo7ILskywrFFnhBzjD1DBJHJD0zVYn8ra6CU25Geb8pvhLqxiLH
   9K5NuLzHTKVudbDMbEKxgmsDo1n8tjiuKBhdst53YGlL1xegyUSXG7GG/
   J/f5Pqkp1YEHhP0FEEQ7zXDNVNSKH5pMX5zdhaMxNaLPmjj6TTGvBcLCl
   Q+P16fdCmonsb2LmRTd+HGTBToSbil3MB+D9/khJG1m5z1l8Cjb2HS2Jn
   w==;
X-CSE-ConnectionGUID: x2FLub6nRtGaaVkN/ZRgKw==
X-CSE-MsgGUID: a1Jg3++pRz+qPyFT3jKm/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="23990113"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="23990113"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 07:27:22 -0700
X-CSE-ConnectionGUID: ZPckWJrQTDuavVfVZBCYhQ==
X-CSE-MsgGUID: 58sGhbnQQ2yxCv3dPH8gJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="69914559"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Sep 2024 07:27:21 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slqyd-0008B9-0Z;
	Wed, 04 Sep 2024 14:27:19 +0000
Date: Wed, 4 Sep 2024 22:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [perf-tools-next:tmp.perf-tools-next 93/112]
 tools/perf/util/syscalltbl.c: asm/syscalls_32.c is included more than once.
Message-ID: <202409042238.sTHv6ZeK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arnaldo Carvalho de Melo <acme@redhat.com>
CC: Ian Rogers <irogers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git tmp.perf-tools-next
head:   f76e3525acf395f22712fc9120de555fb4b1a52f
commit: 0e7eb23668948585f3f0ea8c6249338f33fde872 [93/112] perf tools: Build x86 32-bit syscall table from arch/x86/entry/syscalls/syscall_32.tbl
:::::: branch date: 19 hours ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409042238.sTHv6ZeK-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   tools/perf/util/syscalltbl.c: asm/syscalls.c is included more than once.
>> tools/perf/util/syscalltbl.c: asm/syscalls_32.c is included more than once.
   tools/perf/util/syscalltbl.c: asm/syscalls_64.c is included more than once.

vim +22 tools/perf/util/syscalltbl.c

    16	
    17	#if defined(__x86_64__)
    18	#include <asm/syscalls_64.c>
    19	const int syscalltbl_native_max_id = SYSCALLTBL_x86_64_MAX_ID;
    20	static const char *const *syscalltbl_native = syscalltbl_x86_64;
    21	#elif defined(__i386__)
  > 22	#include <asm/syscalls_32.c>
    23	const int syscalltbl_native_max_id = SYSCALLTBL_x86_MAX_ID;
    24	static const char *const *syscalltbl_native = syscalltbl_x86;
    25	#elif defined(__s390x__)
    26	#include <asm/syscalls_64.c>
    27	const int syscalltbl_native_max_id = SYSCALLTBL_S390_64_MAX_ID;
    28	static const char *const *syscalltbl_native = syscalltbl_s390_64;
    29	#elif defined(__powerpc64__)
    30	#include <asm/syscalls_64.c>
    31	const int syscalltbl_native_max_id = SYSCALLTBL_POWERPC_64_MAX_ID;
    32	static const char *const *syscalltbl_native = syscalltbl_powerpc_64;
    33	#elif defined(__powerpc__)
  > 34	#include <asm/syscalls_32.c>
    35	const int syscalltbl_native_max_id = SYSCALLTBL_POWERPC_32_MAX_ID;
    36	static const char *const *syscalltbl_native = syscalltbl_powerpc_32;
    37	#elif defined(__aarch64__)
    38	#include <asm/syscalls.c>
    39	const int syscalltbl_native_max_id = SYSCALLTBL_ARM64_MAX_ID;
    40	static const char *const *syscalltbl_native = syscalltbl_arm64;
    41	#elif defined(__mips__)
    42	#include <asm/syscalls_n64.c>
    43	const int syscalltbl_native_max_id = SYSCALLTBL_MIPS_N64_MAX_ID;
    44	static const char *const *syscalltbl_native = syscalltbl_mips_n64;
    45	#elif defined(__loongarch__)
    46	#include <asm/syscalls.c>
    47	const int syscalltbl_native_max_id = SYSCALLTBL_LOONGARCH_MAX_ID;
    48	static const char *const *syscalltbl_native = syscalltbl_loongarch;
    49	#endif
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
