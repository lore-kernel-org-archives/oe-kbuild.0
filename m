Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D884F2D2398
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763739481; cv=none; b=dHgNTl6sY/810ovBaVix/HVoEXZHuSIPIwmlBIX0nhtqhXnQywMxSluS4HGejZ11AB01buLRSmnWk5MxyKfpPBKbvvyz1xMcKgd14Avs481jUfaP8CP3zSESCTgtvHgE23JnQVLql47qpRJZz4oAzbyncMLC3A1LqVKZ5LGNDnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763739481; c=relaxed/simple;
	bh=mbBz6seu0Lhc1rWI0V+QPM9ojjY+TvwCl0BzCCO5QFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KjhR4213coy4w8CMQXT8JYHtlvEzr9fVj10dhAEnRPDwcUalRpPWtLUD641ix268fS0aEtU2MXraPCrh3oxYC9oq8Om+MPVfn5K/7+KN6ZNEgBrecNpZ6jGIHk46+0N7WqJkAmCQtdY/fo2MmNvYCXO9Iyk/x6HJ+URwWJKDOsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0v86PWc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0v86PWc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763739480; x=1795275480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mbBz6seu0Lhc1rWI0V+QPM9ojjY+TvwCl0BzCCO5QFU=;
  b=V0v86PWcjCEfWi8iTxGik+8jVAPG+dfKRsTvjhmJAKkpx4+BahUz5G72
   u8MVgku98bcFd2Tpoq7czsM1f5aI244yNUrPMO0gtl/5icAXwoJtEBfEb
   EW55bQahqsxqJfiLXZVEFtB4qhza9IzPfNyqeDFKYezzhJI88lLrKRPa4
   52mf+YbGeIobny2GSScyhzIu2umOzpTgaNt+gqHptGOXmtZQPEgqK/0cL
   4UvVDFSuNPnF7lhC9M54NmeV0mKACR3blm3UD3Fzl4xZzfm6Z3fZUP2Sh
   0zzF/RJ2wyinv7YXTOHWnOjP/uf1/TiG8jVzAf2+WVndqCRNcWAMzfzlu
   A==;
X-CSE-ConnectionGUID: 35wqYyYGR4am1bu4zl/pPw==
X-CSE-MsgGUID: 90/YsNtxRwOD7t9CDMHmig==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65783590"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65783590"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 07:37:59 -0800
X-CSE-ConnectionGUID: ZwleP1JGQcCOPgwtR9Z1bw==
X-CSE-MsgGUID: DzSRK72kSzq/OTITFar2ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="196006116"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Nov 2025 07:37:58 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMTCu-0006X3-0n;
	Fri, 21 Nov 2025 15:37:56 +0000
Date: Fri, 21 Nov 2025 23:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error[E0609]: no field `queue` on type `gendisk`
Message-ID: <202511212346.Illwra9j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um-randconfig-001-20251121 results in a lot of rust failure"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andreas Hindborg <a.hindborg@kernel.org>
CC: Jens Axboe <axboe@kernel.dk>
CC: Alice Ryhl <aliceryhl@google.com>
CC: Daniel Almeida <daniel.almeida@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
commit: 90d952fac8ac1aa6cb21aad7010d33af4d309f4a rust: block: add `GenDisk` private data support
date:   3 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511212346.Illwra9j-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511212346.Illwra9j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511212346.Illwra9j-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `queue` on type `gendisk`
   --> rust/kernel/block/mq/gen_disk.rs:214:53
   |
   214 |         let queue_data = unsafe { (*(*self.gendisk).queue).queuedata };
   |                                                     ^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `queue` on type `blk_mq_hw_ctx`
   --> rust/kernel/block/mq/operations.rs:101:45
   |
   101 |         let queue_data = unsafe { (*(*hctx).queue).queuedata };
   |                                             ^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `queue` on type `blk_mq_hw_ctx`
   --> rust/kernel/block/mq/operations.rs:136:45
   |
   136 |         let queue_data = unsafe { (*(*hctx).queue).queuedata };
   |                                             ^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
