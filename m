Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E938384258
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 15:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263320; cv=none; b=fWgdtQIuG/8ImxvwKlOHjT8MVKlNW0opd8dwAWwpb7vK0RPtfCekcWadSRT80mLiWutHYLEamhm/J3c45YHWOTbAQ1gCs5R2oOuKVGo1CbW8DRUnFHIZsXpZJjCbGEyNk89KVFO2miqtNs+pFBXJqQ9ZUAb8N2MLejzf7oUYRAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263320; c=relaxed/simple;
	bh=o8+aVDhARCrGvck6fKXhyDw/hPQ6ZX7yyMrhOCEIPh4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=utzFZ9UTGMVIrOZ3GFxghchBnIgOGbNq57o7yEnovmeDphNYkUNVxSoHhQZ0Ims73D0hIJ1RZsU3q6MJ+N0aKIjxXvSAcitiQvl9pwZ5wnaUCjSaBHntWwWzXqRuG/CnK4YsXQics3g4LKD2ea+F0KmNTlD63Hsc2teXK+4enrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mF1+BroN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mF1+BroN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790263320; x=1821799320;
  h=date:from:to:cc:subject:message-id;
  bh=o8+aVDhARCrGvck6fKXhyDw/hPQ6ZX7yyMrhOCEIPh4=;
  b=mF1+BroNZkludzE8lpbiY2iOY1YJ4Af1LwQmzc+Te720QLEFYJ3+2V4t
   EcUcpq3EH6lzDgywRp8uv8cV6KIZ8YTBuX0TK/XkYwXYcWp/x2dOoWFAj
   311YXo3GTnbdNYRqjRTBbEqZG7vfMQ7Dqw6FwselGsYmy1hnwQMOE0SMo
   fufNqWVzv54PZRyqtszT2/bz2etBuDqxl6IxhPmLAyl5QcT9viRpSibw6
   BAjOnnW0A1WLVhNEKGe49zvvh8/c6igYYdih5u1FZlOaP2l5K9eIjAAQ2
   K6Ds9dcOhgavQHaay5mCrIl406052OplgpRSIOsmyhAMC3FIE91V4zozo
   A==;
X-CSE-ConnectionGUID: 5vm0UVMWRui3ZTODMmawPQ==
X-CSE-MsgGUID: 0KGUvcL6RF2Lzh52ISYpGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89900273"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="89900273"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 08:21:30 -0700
X-CSE-ConnectionGUID: BCwa+CJDTda9fFLUSBoNPw==
X-CSE-MsgGUID: ypWej6r8QqK+6mBcD/k6Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="273172500"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 24 Sep 2026 08:21:29 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9lGI-000000000Lw-0pWj;
	Thu, 24 Sep 2026 15:21:26 +0000
Date: Thu, 24 Sep 2026 17:21:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/crc/crc64-neon.c:22 crc64_nvme_neon() warn: statement
 has no effect 'uint64x2_t'
Message-ID: <202609241758.XPJQfSEm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62f4c998b297cf233997a2b4cd6fc2d2df0319c9
commit: 061cef5fcee5a4bbaa8726f8c5fc1d5e2f89bff7 lib/crc: Turn NEON intrinsics crc64 implementation into common code
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r2200-20260923 (https://download.01.org/0day-ci/archive/20260924/202609241758.XPJQfSEm-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 4b99afb361a8cfd45fc17aebc637688661e9e472)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 061cef5fcee5 ("lib/crc: Turn NEON intrinsics crc64 implementation into common code")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609241758.XPJQfSEm-lkp@intel.com/

New smatch warnings:
lib/crc/crc64-neon.c:22 crc64_nvme_neon() warn: statement has no effect 'uint64x2_t'

Old smatch warnings:
lib/crc/crc64-neon.c:23 crc64_nvme_neon() warn: statement has no effect 'uint64x2_t'
lib/crc/crc64-neon.c:24 crc64_nvme_neon() warn: statement has no effect 'uint64x2_t'
lib/crc/crc64-neon.c:41 crc64_nvme_neon() warn: statement has no effect 'uint64x2_t'
lib/crc/crc64-neon.c:42 crc64_nvme_neon() warn: statement has no effect 'uint64x2_t'

vim +/uint64x2_t +22 lib/crc/crc64-neon.c

63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  12  
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  13  /* x^191 mod G, x^127 mod G */
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  14  static const u64 fold_consts_val[2] = { 0xeadc41fd2ba3d420ULL,
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  15  					0x21e9761e252621acULL };
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  16  /* floor(x^127 / G), (G - x^64) / x */
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  17  static const u64 bconsts_val[2] = { 0x27ecfa329aef9f77ULL,
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  18  				    0x34d926535897936aULL };
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  19  
061cef5fcee5a4 lib/crc/crc64-neon.c             Ard Biesheuvel 2026-04-22  20  u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len)
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  21  {
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30 @22  	uint64x2_t fold_consts = vld1q_u64(fold_consts_val);

:::::: The code at line 22 was first introduced by commit
:::::: 8fdef85d601db670e9c178314eedffe7bbb07e52 lib/crc: arm64: Simplify intrinsics implementation

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
