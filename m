Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA32C2EEE80
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 18:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786645138; cv=none; b=beiVxOXTtKwarAUJwbcCSL059jS/Q9eS0xzeEUvY5rkCbcRbvq6+fbcM9IcFjLoAHNJFl19x+BP8w9VouRbyQG/fCAT+ELFTzydGP6OcV6GZXNp/ilywveY00XFK04w5cS1Yx1QizpHuIts5kfYqaMEyk8BTXcsz3BwzTUruzWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786645138; c=relaxed/simple;
	bh=IAdvHdeFc8vUt4X/RRnQfzgk3dIwso1ebRfpFMfR/JI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R7FsmJIPjDMHJWJIYjChoKvHtFsCO+tlEbo8NGjc2nCOrlbAPw8rCUv0ChouZob9tDzE535PzKtWRfDoZxXyKbRkHiFlDO81KTb6GubGMduVLR3addYZeByrGaW2q0ydeEK2T4UhtCQEIHo0k2MZFzsCvemABRevaua03OHaAfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUAgEuDh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUAgEuDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786645137; x=1818181137;
  h=date:from:to:cc:subject:message-id;
  bh=IAdvHdeFc8vUt4X/RRnQfzgk3dIwso1ebRfpFMfR/JI=;
  b=FUAgEuDhmNSuO/VcHCoE5fcewur9xvLm4Ck1sQmB+HC/QO9TSHjnihMv
   zRSGQaIuuVxqXHV0xjeo/O1FtPGiaUCl9O/4GsLD2j+ubAE1PTlg1rLzO
   IVBAvHcWLK5+hQrN66gH9ht/nGHDaWwfClz1S8T+/z5zsA0Kv+g4dADMJ
   1FjXLMPVJjMvfWCkxrANubWVFoJnLLnbKR6kL/0F7sQOSpOsgh2vZcG/K
   Fe6WdIvxrlfYxhA41GMJbEYnCGLzSRFoUygsiJGkJpdyyRhL8LfVTI2zo
   0cSNTfr6MFsY0fQlwvE+cPnSes6ZW7GLuOwgZmw4KhXB5glr1YxASbiRb
   Q==;
X-CSE-ConnectionGUID: yYGG5/mBRYiuFYb0u+SB/w==
X-CSE-MsgGUID: LxFWWpBpT+62knWk/XkGCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="91102123"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="91102123"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 11:18:56 -0700
X-CSE-ConnectionGUID: nps/4I/tSOqGYRApHEiBcw==
X-CSE-MsgGUID: Yl7ttiA4Sl2Dm6NrTQvM5Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Aug 2026 11:18:55 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wua0y-00000000WAo-2rZ8;
	Thu, 13 Aug 2026 18:18:52 +0000
Date: Fri, 14 Aug 2026 02:18:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/iomap/internal.h:15 iomap_max_bio_size() warn: bitwise
 AND condition is false here
Message-ID: <202608140215.2Da1tHVz-lkp@intel.com>
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
CC: Christian Brauner <brauner@kernel.org>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d6d817622b0a9721e3cc404df3469171582be13
commit: 0b10a370529cbd7b918c1eef43d409e43d9e0b78 iomap: support T10 protection information
date:   5 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-r072-20260813 (https://download.01.org/0day-ci/archive/20260814/202608140215.2Da1tHVz-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0b10a370529c ("iomap: support T10 protection information")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608140215.2Da1tHVz-lkp@intel.com/

New smatch warnings:
fs/iomap/internal.h:15 iomap_max_bio_size() warn: bitwise AND condition is false here
fs/iomap/ioend.c:150 iomap_ioend_writeback_submit() warn: bitwise AND condition is false here
fs/iomap/internal.h:15 iomap_max_bio_size() warn: bitwise AND condition is false here
fs/iomap/internal.h:15 iomap_max_bio_size() warn: bitwise AND condition is false here

Old smatch warnings:
fs/iomap/bio.c:42 iomap_bio_submit_read() warn: bitwise AND condition is false here
fs/iomap/bio.c:126 iomap_bio_read_folio_range_sync() warn: bitwise AND condition is false here
fs/iomap/bio.c:129 iomap_bio_read_folio_range_sync() warn: bitwise AND condition is false here
fs/iomap/direct-io.c:377 iomap_dio_bio_iter_one() warn: bitwise AND condition is false here

vim +15 fs/iomap/internal.h

63b66913d11c5f Christoph Hellwig 2025-02-06   6  
0b10a370529cbd Christoph Hellwig 2026-02-23   7  /*
0b10a370529cbd Christoph Hellwig 2026-02-23   8   * Normally we can build bios as big as the data structure supports.
0b10a370529cbd Christoph Hellwig 2026-02-23   9   *
0b10a370529cbd Christoph Hellwig 2026-02-23  10   * But for integrity protected I/O we need to respect the maximum size of the
0b10a370529cbd Christoph Hellwig 2026-02-23  11   * single contiguous allocation for the integrity buffer.
0b10a370529cbd Christoph Hellwig 2026-02-23  12   */
0b10a370529cbd Christoph Hellwig 2026-02-23  13  static inline size_t iomap_max_bio_size(const struct iomap *iomap)
0b10a370529cbd Christoph Hellwig 2026-02-23  14  {
0b10a370529cbd Christoph Hellwig 2026-02-23 @15  	if (iomap->flags & IOMAP_F_INTEGRITY)
0b10a370529cbd Christoph Hellwig 2026-02-23  16  		return max_integrity_io_size(bdev_limits(iomap->bdev));
0b10a370529cbd Christoph Hellwig 2026-02-23  17  	return BIO_MAX_SIZE;
0b10a370529cbd Christoph Hellwig 2026-02-23  18  }
0b10a370529cbd Christoph Hellwig 2026-02-23  19  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
