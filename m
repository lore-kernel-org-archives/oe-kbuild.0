Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C594657CD
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 21:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774994270; cv=none; b=F1SbQP/LuYGhoB8K305cRMu9FRRytoltQWAGAONmIWK5gwOG4PRKhXPXUNnspUZzN0ygVTtlOraaEGLavI1r+buxSBXkg8+nUhgssLOWpSYGxD0SAy1qH0LUwkGs57eb87i4fpcI4Ep/iIwheDKJIxJkqtb+paD+AhWSTKm3VSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774994270; c=relaxed/simple;
	bh=qMCaCPqhliFvUUUmgsWksNp5pOiKFRZKcFRf+ddNuC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hYjG3mE5OBA3LkkQo6Yiq/ZDA4mRCUd9GmPbNUvvjNnx3fPKmqYG5zVC6/e3XBwrmmB/COijSwMdP3HV1fwlfBeONlu7LMo0c/Afy3O+FjuyMGW9uUknMI0Cs1cbwvBGt0I7OPWWuSFAshU1Y0JkUkYMnIpaGorTnck1nWg7Dm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYmWNx2/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYmWNx2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774994269; x=1806530269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qMCaCPqhliFvUUUmgsWksNp5pOiKFRZKcFRf+ddNuC8=;
  b=aYmWNx2/qBkMJW74QPVgfewrcXsqs/lBKICD0ifpK7N3p7GULxHa0P3/
   tcKXeBnF+acMnyooZ0vftDJuuGTSWkn0XeKG0Buwotfu8P89BipxIReX0
   ogdEgJDFWw+OwKMlDI9TheZYm4X7dZmFnwf2iVCe3NJVj7A/FWUgBcEUr
   3/AMzYAi8UG6w8AdaIdf7vhNsqZxEK9btbmtImWsxEUxf63m62n9nB5Uc
   lmYMqXsPrGQFglDMFrJ2ZyIMiJXJsNo5ejz7LygDGxZgWHOKAYOYkx5/m
   Pg4cXKjG9G5j+V7CVhWj0lVrK6A25lZnwhEdpnTV7h/OMUmg2DYkXGFe1
   w==;
X-CSE-ConnectionGUID: wVUuyKm5RGeAHckP7wTIDw==
X-CSE-MsgGUID: Eq5mZnE8RlS7ydnxUXcg4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75059276"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75059276"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 14:57:48 -0700
X-CSE-ConnectionGUID: fRyz+jMcTcqbDVCI3Bd7CQ==
X-CSE-MsgGUID: LQy9NEA3Sg6l2f5tvcNiRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226478116"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Mar 2026 14:57:47 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7h5k-000000004Kn-34Th;
	Tue, 31 Mar 2026 21:57:44 +0000
Date: Wed, 1 Apr 2026 05:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/5] lib/crc: arm64: Simplify intrinsics implementation
Message-ID: <202604010522.5iUE599X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/crc/arm64/crc64-neon-inner.c:29:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260330144630.33026-11-ardb@kernel.org>
References: <20260330144630.33026-11-ardb@kernel.org>
TO: Ard Biesheuvel <ardb@kernel.org>
TO: linux-crypto@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Demian Shulhan <demyansh@gmail.com>
CC: Eric Biggers <ebiggers@kernel.org>

Hi Ard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 63432fd625372a0e79fb00a4009af204f4edc013]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/lib-crc-arm64-Drop-unnecessary-chunking-logic-from-crc64/20260331-150617
base:   63432fd625372a0e79fb00a4009af204f4edc013
patch link:    https://lore.kernel.org/r/20260330144630.33026-11-ardb%40kernel.org
patch subject: [PATCH 4/5] lib/crc: arm64: Simplify intrinsics implementation
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-r134-20260401 (https://download.01.org/0day-ci/archive/20260401/202604010522.5iUE599X-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010522.5iUE599X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604010522.5iUE599X-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/crc/arm64/crc64-neon-inner.c: note: in included file (through arch/arm64/include/asm/neon-intrinsics.h):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/crc/arm64/crc64-neon-inner.c:18:26: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:18:26: sparse: sparse: got pmull64
   lib/crc/arm64/crc64-neon-inner.c:22:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon-inner.c:22:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon-inner.c:27:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:27:20: sparse: sparse: got m
>> lib/crc/arm64/crc64-neon-inner.c:29:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/crc/arm64/crc64-neon-inner.c:29:16: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:29:16: sparse: sparse: got vreinterpretq_u64_p128
   lib/crc/arm64/crc64-neon-inner.c:30:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon-inner.c:30:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon-inner.c:36:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon-inner.c:36:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon-inner.c:41:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:41:20: sparse: sparse: got v0
   lib/crc/arm64/crc64-neon-inner.c:42:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:42:20: sparse: sparse: got zero
   lib/crc/arm64/crc64-neon-inner.c:44:14: sparse: sparse: Expected ) in function declarator
   lib/crc/arm64/crc64-neon-inner.c:44:14: sparse: sparse: got ;
>> lib/crc/arm64/crc64-neon-inner.c:44:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/crc/arm64/crc64-neon-inner.c:44:16: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon-inner.c:44:16: sparse: sparse: got )
   lib/crc/arm64/crc64-neon-inner.c:47:19: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:47:19: sparse: sparse: got +=
   lib/crc/arm64/crc64-neon-inner.c:48:21: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:48:21: sparse: sparse: got -=
   lib/crc/arm64/crc64-neon-inner.c:49:25: sparse: sparse: Expected ) in function declarator
   lib/crc/arm64/crc64-neon-inner.c:49:25: sparse: sparse: got <
>> lib/crc/arm64/crc64-neon-inner.c:49:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/crc/arm64/crc64-neon-inner.c:53:9: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon-inner.c:53:9: sparse: sparse: got }
   lib/crc/arm64/crc64-neon-inner.c:59:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:59:20: sparse: sparse: got bconsts
   lib/crc/arm64/crc64-neon-inner.c:60:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:60:20: sparse: sparse: got final
   lib/crc/arm64/crc64-neon-inner.c:62:12: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:62:12: sparse: sparse: got ^=
   lib/crc/arm64/crc64-neon-inner.c:64:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/crc/arm64/crc64-neon-inner.c:64:16: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:64:16: sparse: sparse: got vgetq_lane_u64
   lib/crc/arm64/crc64-neon-inner.c:65:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon-inner.c:65:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon-inner.c:52:22: sparse: sparse: undefined identifier 'pmull64'
   lib/crc/arm64/crc64-neon-inner.c:52:49: sparse: sparse: undefined identifier 'pmull64_high'

vim +/return +29 lib/crc/arm64/crc64-neon-inner.c

63432fd625372a Demian Shulhan 2026-03-29  23  
38163ec975bb4f Ard Biesheuvel 2026-03-30  24  static inline uint64x2_t pmull64_high(uint64x2_t a, uint64x2_t b)
38163ec975bb4f Ard Biesheuvel 2026-03-30  25  {
38163ec975bb4f Ard Biesheuvel 2026-03-30  26  	poly64x2_t l = vreinterpretq_p64_u64(a);
38163ec975bb4f Ard Biesheuvel 2026-03-30  27  	poly64x2_t m = vreinterpretq_p64_u64(b);
63432fd625372a Demian Shulhan 2026-03-29  28  
38163ec975bb4f Ard Biesheuvel 2026-03-30 @29  	return vreinterpretq_u64_p128(vmull_high_p64(l, m));
38163ec975bb4f Ard Biesheuvel 2026-03-30  30  }
63432fd625372a Demian Shulhan 2026-03-29  31  
38163ec975bb4f Ard Biesheuvel 2026-03-30  32  static inline uint64x2_t pmull64_hi_lo(uint64x2_t a, uint64x2_t b)
38163ec975bb4f Ard Biesheuvel 2026-03-30  33  {
38163ec975bb4f Ard Biesheuvel 2026-03-30  34  	return vreinterpretq_u64_p128(vmull_p64(vgetq_lane_u64(a, 1),
38163ec975bb4f Ard Biesheuvel 2026-03-30  35  						vgetq_lane_u64(b, 0)));
38163ec975bb4f Ard Biesheuvel 2026-03-30  36  }
63432fd625372a Demian Shulhan 2026-03-29  37  
38163ec975bb4f Ard Biesheuvel 2026-03-30  38  u64 crc64_nvme_arm64_c(u64 crc, const u8 *p, size_t len)
38163ec975bb4f Ard Biesheuvel 2026-03-30  39  {
38163ec975bb4f Ard Biesheuvel 2026-03-30  40  	uint64x2_t fold_consts = vld1q_u64(fold_consts_val);
38163ec975bb4f Ard Biesheuvel 2026-03-30  41  	uint64x2_t v0 = { crc, 0 };
38163ec975bb4f Ard Biesheuvel 2026-03-30  42  	uint64x2_t zero = { };
63432fd625372a Demian Shulhan 2026-03-29  43  
38163ec975bb4f Ard Biesheuvel 2026-03-30 @44  	for (;;) {
38163ec975bb4f Ard Biesheuvel 2026-03-30  45  		v0 ^= vreinterpretq_u64_u8(vld1q_u8(p));
63432fd625372a Demian Shulhan 2026-03-29  46  
63432fd625372a Demian Shulhan 2026-03-29  47  		p += 16;
63432fd625372a Demian Shulhan 2026-03-29  48  		len -= 16;
38163ec975bb4f Ard Biesheuvel 2026-03-30 @49  		if (len < 16)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
