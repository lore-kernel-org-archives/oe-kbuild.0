Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA4C3019D6
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Jun 2026 03:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782270416; cv=none; b=pO8pNzpcNYIwFd2xCW/MesO8xirX+s1tgBAswzZpUF51R4XE847bLpwUKCY8+8/mBTA2kIGuBz7idB0/utDsO1fjLEpLs8gmELTRy2X3HLwT1niIrhzBDBQ2LLZOhGZzw3e+12mdsCAwj5vX8n26+Wfr/VL/c4orpww2Q4Gb+Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782270416; c=relaxed/simple;
	bh=zGTaScU9iRx3GUq6vIcBQMnxbB6cMNfWbJ3nL4PBdyI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nVGF6T35gbZboun3EkPD83doyEGheR64RKELxl6T9r9qRSP/jHNKO2nYYf52CPv56IUaAPNhifnEZGOhCTJJ1PaqOYQDoE3gJC6OZEBz1VPoIFW8niTb7meJwd95B3ZfxCURRB//Tgc1UjtRLVK0ZrZxQSFp1agv0WTsw/uz1dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FNYRBhqs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNYRBhqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782270415; x=1813806415;
  h=date:from:to:cc:subject:message-id;
  bh=zGTaScU9iRx3GUq6vIcBQMnxbB6cMNfWbJ3nL4PBdyI=;
  b=FNYRBhqswWoFM1KXJ3pfvY75gvdE3CeAV/4/vuC3NaaQyWQq8BKxKfcE
   OE1b4XzdIywNSB6pVQ5Td+WdxuGCkRBaytDXrGRFn2dtEkXcOpK1/XcVx
   FbxiDXd6UiqW73NqrQytksEPKq2+qwMf1MHRmMWXjRtHQm+W/ySDvJgEw
   UPDaeHZGsxkgZWmgpUM7gV3hAMcQdLFRrrhas99D8IVVKJu9HEdg0F8Bw
   EAGDzASQ9qrbrC2/CUTESxMUzPWzWQxnDIBqmVG47WEYPa+AOsCLGfYlz
   tNzZvfDA1PvplhmXouOlf8omptuw1T2vk2465GZmFT8c9ZEGJLqnpBzN8
   g==;
X-CSE-ConnectionGUID: 7ZmuJeR3SXWwGr5moXJyNQ==
X-CSE-MsgGUID: 36m9a3TDSECV6pzyOWOjbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82891912"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82891912"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 20:06:54 -0700
X-CSE-ConnectionGUID: DXDENS2OQx+lLEwLcv/20w==
X-CSE-MsgGUID: 6I6DCt89TtORsMndYgMuRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="245556854"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jun 2026 20:06:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcDwa-0000000035B-3NAS;
	Wed, 24 Jun 2026 03:06:42 +0000
Date: Wed, 24 Jun 2026 11:05:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-misc:iomap-read-submit-bio 2/3] fs/iomap/bio.c:87
 iomap_bio_submit_read_endio() warn: bitwise AND condition is false here
Message-ID: <202606241035.5HSfVWfm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git iomap-read-submit-bio
head:   ab994a4e103a93169f4765bda3aec003e085e8f5
commit: 06936fbbb2a3169efb61903db1f63db815ac334e [2/3] iomap: consolidate bio submission
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: xtensa-randconfig-r073-20260624 (https://download.01.org/0day-ci/archive/20260624/202606241035.5HSfVWfm-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606241035.5HSfVWfm-lkp@intel.com/

New smatch warnings:
fs/iomap/bio.c:87 iomap_bio_submit_read_endio() warn: bitwise AND condition is false here

Old smatch warnings:
fs/iomap/internal.h:15 iomap_max_bio_size() warn: bitwise AND condition is false here
fs/iomap/bio.c:177 iomap_bio_read_folio_range_sync() warn: bitwise AND condition is false here
fs/iomap/bio.c:180 iomap_bio_read_folio_range_sync() warn: bitwise AND condition is false here

vim +87 fs/iomap/bio.c

f621324dfb3d67 Darrick J. Wong   2026-03-23  80  
06936fbbb2a316 Christoph Hellwig 2026-06-23  81  void iomap_bio_submit_read_endio(const struct iomap_iter *iter,
06936fbbb2a316 Christoph Hellwig 2026-06-23  82  		struct iomap_read_folio_ctx *ctx, bio_end_io_t end_io)
c2b1adc4624573 Christoph Hellwig 2025-09-25  83  {
c2b1adc4624573 Christoph Hellwig 2025-09-25  84  	struct bio *bio = ctx->read_ctx;
c2b1adc4624573 Christoph Hellwig 2025-09-25  85  
06936fbbb2a316 Christoph Hellwig 2026-06-23  86  	bio->bi_end_io = end_io;
0b10a370529cbd Christoph Hellwig 2026-02-23 @87  	if (iter->iomap.flags & IOMAP_F_INTEGRITY)
0b10a370529cbd Christoph Hellwig 2026-02-23  88  		fs_bio_integrity_alloc(bio);
c2b1adc4624573 Christoph Hellwig 2025-09-25  89  	submit_bio(bio);
c2b1adc4624573 Christoph Hellwig 2025-09-25  90  }
06936fbbb2a316 Christoph Hellwig 2026-06-23  91  EXPORT_SYMBOL_GPL(iomap_bio_submit_read_endio);
06936fbbb2a316 Christoph Hellwig 2026-06-23  92  

:::::: The code at line 87 was first introduced by commit
:::::: 0b10a370529cbd7b918c1eef43d409e43d9e0b78 iomap: support T10 protection information

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christian Brauner <brauner@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
