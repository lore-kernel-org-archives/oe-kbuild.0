Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8978199EAD
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Aug 2026 10:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785580494; cv=none; b=dReN9ebmvmMmPeARjVSzY6IlLbN8Rp45LifgU+Iby9ZC9WW8gaHA+nTlzrkTI/j/oCzGgmdHkuqTQOtbLK1KbxeIIaJ6rdWVchUqFp45ZQZBQjLocjG6lwcbWkJ1M0qzjMPSRSdIEOBrFPwQODsW5VAtcNqmMDO+gq9ca9n4qYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785580494; c=relaxed/simple;
	bh=VhpaT5yscuGEYkHcmjV1aJudWYYtsTwKsdQiLSFOZOo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KbE0mTzb1xSI7ZqiXdLN5+AWcsct4RLSsUzI2I9qdsJmjtcInyUy1n5AG/4kpdmHgs9mu8SvzWKEoFSkyAD8jP7z44KZXDiZ5C7Xq0CzU7xEhZCWOCwPmutsn5aLQyedSSA5A4q92LKk4u18jbcVwti3sAd85y7VLDFO3VXTPhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJHYCfsW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJHYCfsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785580492; x=1817116492;
  h=date:from:to:cc:subject:message-id;
  bh=VhpaT5yscuGEYkHcmjV1aJudWYYtsTwKsdQiLSFOZOo=;
  b=cJHYCfsWnwgXzsrkou2K7M3EdYaV4itXesmFBk5+h6bPAqawjUkq0MFd
   jwjiRTwDvoI+3J59O85IbZTyYKF5zqmWGYbnAbDOSDhc6UQIXeTD5yVxE
   wS6ADTWPDF+G8uPwcuhFUajMF9+igrC83tV9dVGoGStHvF0/6tsuZX1q9
   w/fZfgQcUmHfEyt1i80phPsfZ8TmdBbtQYFLRmT3qqHgnELIcUh5KWrfA
   dDiFrX/wQmz7fh9Jqs2PhpIbEUgvc4u6T/pCap3LR//6joKBAlhDpzQ6n
   cYDDEV/0ef4TquYXfWtL1KvT0NXuJ+sNfusbIZ0Bdfeg3qmXz2RiWlq8U
   w==;
X-CSE-ConnectionGUID: qU0a6JKGTGiYgJY9Sz83LQ==
X-CSE-MsgGUID: arJtcAyeRdGPVe0Ij/kwBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="85323131"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="85323131"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 03:34:51 -0700
X-CSE-ConnectionGUID: OFOi3L2qQMSvBYJRTNSCpA==
X-CSE-MsgGUID: /pqxr1nLQFimSpLS8EpSEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="290732214"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Aug 2026 03:34:50 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq73H-0000000039Z-3Svi;
	Sat, 01 Aug 2026 10:34:47 +0000
Date: Sat, 01 Aug 2026 18:34:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: include/asm-generic/div64.h:164 (null)() warn: right
 shifting more than type allows 32 vs 32
Message-ID: <202608011841.SjkLddw6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ba098e6b6ff0db8edf28528d1552be261af30d4
commit: 769d603fc44f896e7f61de7f0cdb8b78d46bc8c8 raid6: hide internals
date:   9 weeks ago
:::::: branch date: 34 hours ago
:::::: commit date: 9 weeks ago
config: powerpc-randconfig-r073-20260801 (https://download.01.org/0day-ci/archive/20260801/202608011841.SjkLddw6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 769d603fc44f ("raid6: hide internals")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608011841.SjkLddw6-lkp@intel.com/

smatch warnings:
include/asm-generic/div64.h:164 (null)() warn: right shifting more than type allows 32 vs 32

vim +164 include/asm-generic/div64.h

461a5e51060c93 Nicolas Pitre 2015-10-30  125  
f682b27c57aec2 Nicolas Pitre 2015-10-30  126  #ifndef __arch_xprod_64
f682b27c57aec2 Nicolas Pitre 2015-10-30  127  /*
f682b27c57aec2 Nicolas Pitre 2015-10-30  128   * Default C implementation for __arch_xprod_64()
f682b27c57aec2 Nicolas Pitre 2015-10-30  129   *
f682b27c57aec2 Nicolas Pitre 2015-10-30  130   * Prototype: uint64_t __arch_xprod_64(const uint64_t m, uint64_t n, bool bias)
f682b27c57aec2 Nicolas Pitre 2015-10-30  131   * Semantic:  retval = ((bias ? m : 0) + m * n) >> 64
f682b27c57aec2 Nicolas Pitre 2015-10-30  132   *
f682b27c57aec2 Nicolas Pitre 2015-10-30  133   * The product is a 128-bit value, scaled down to 64 bits.
00a31dd3acea0f Nicolas Pitre 2024-10-03  134   * Hoping for compile-time optimization of  conditional code.
f682b27c57aec2 Nicolas Pitre 2015-10-30  135   * Architectures may provide their own optimized assembly implementation.
f682b27c57aec2 Nicolas Pitre 2015-10-30  136   */
d533cb2d2af400 Nicolas Pitre 2024-10-03  137  #ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
d533cb2d2af400 Nicolas Pitre 2024-10-03  138  static __always_inline
d533cb2d2af400 Nicolas Pitre 2024-10-03  139  #else
d533cb2d2af400 Nicolas Pitre 2024-10-03  140  static inline
d533cb2d2af400 Nicolas Pitre 2024-10-03  141  #endif
d533cb2d2af400 Nicolas Pitre 2024-10-03  142  uint64_t __arch_xprod_64(const uint64_t m, uint64_t n, bool bias)
f682b27c57aec2 Nicolas Pitre 2015-10-30  143  {
f682b27c57aec2 Nicolas Pitre 2015-10-30  144  	uint32_t m_lo = m;
f682b27c57aec2 Nicolas Pitre 2015-10-30  145  	uint32_t m_hi = m >> 32;
f682b27c57aec2 Nicolas Pitre 2015-10-30  146  	uint32_t n_lo = n;
f682b27c57aec2 Nicolas Pitre 2015-10-30  147  	uint32_t n_hi = n >> 32;
00a31dd3acea0f Nicolas Pitre 2024-10-03  148  	uint64_t x, y;
f682b27c57aec2 Nicolas Pitre 2015-10-30  149  
00a31dd3acea0f Nicolas Pitre 2024-10-03  150  	/* Determine if overflow handling can be dispensed with. */
00a31dd3acea0f Nicolas Pitre 2024-10-03  151  	bool no_ovf = __builtin_constant_p(m) &&
00a31dd3acea0f Nicolas Pitre 2024-10-03  152  		      ((m >> 32) + (m & 0xffffffff) < 0x100000000);
f682b27c57aec2 Nicolas Pitre 2015-10-30  153  
00a31dd3acea0f Nicolas Pitre 2024-10-03  154  	if (no_ovf) {
00a31dd3acea0f Nicolas Pitre 2024-10-03  155  		x = (uint64_t)m_lo * n_lo + (bias ? m : 0);
00a31dd3acea0f Nicolas Pitre 2024-10-03  156  		x >>= 32;
00a31dd3acea0f Nicolas Pitre 2024-10-03  157  		x += (uint64_t)m_lo * n_hi;
00a31dd3acea0f Nicolas Pitre 2024-10-03  158  		x += (uint64_t)m_hi * n_lo;
00a31dd3acea0f Nicolas Pitre 2024-10-03  159  		x >>= 32;
00a31dd3acea0f Nicolas Pitre 2024-10-03  160  		x += (uint64_t)m_hi * n_hi;
f682b27c57aec2 Nicolas Pitre 2015-10-30  161  	} else {
00a31dd3acea0f Nicolas Pitre 2024-10-03  162  		x = (uint64_t)m_lo * n_lo + (bias ? m_lo : 0);
00a31dd3acea0f Nicolas Pitre 2024-10-03  163  		y = (uint64_t)m_lo * n_hi + (uint32_t)(x >> 32) + (bias ? m_hi : 0);
00a31dd3acea0f Nicolas Pitre 2024-10-03 @164  		x = (uint64_t)m_hi * n_hi + (uint32_t)(y >> 32);
00a31dd3acea0f Nicolas Pitre 2024-10-03  165  		y = (uint64_t)m_hi * n_lo + (uint32_t)y;
00a31dd3acea0f Nicolas Pitre 2024-10-03  166  		x += (uint32_t)(y >> 32);
f682b27c57aec2 Nicolas Pitre 2015-10-30  167  	}
f682b27c57aec2 Nicolas Pitre 2015-10-30  168  
00a31dd3acea0f Nicolas Pitre 2024-10-03  169  	return x;
f682b27c57aec2 Nicolas Pitre 2015-10-30  170  }
f682b27c57aec2 Nicolas Pitre 2015-10-30  171  #endif
f682b27c57aec2 Nicolas Pitre 2015-10-30  172  

:::::: The code at line 164 was first introduced by commit
:::::: 00a31dd3acea0f88f947fc71e268ebb34b59f218 asm-generic/div64: optimize/simplify __div64_const32()

:::::: TO: Nicolas Pitre <npitre@baylibre.com>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
