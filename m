Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF42175A60
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jul 2026 01:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785030138; cv=none; b=f89hUHQsUlhrq0ZRCfNK3lZlsClALYE8sFy6IvWz8AQliNUICxvzWlEOYI1ek5qUM5t9x5O6RauDyLNb+dh936b0wpu3JWGGlW3uLhI2VKeziRAGppTpMrOS1sRrQLmbnkxLDL1NjHDcDTlXghxt9A0Jb2NH0Gvr3eckW1RsUt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785030138; c=relaxed/simple;
	bh=6Ou+PI2ZLRrIqGbnRXyAyzWwzUnCWwRcGbEKvVwhAsI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tyKulNwGu0o15F6ggxosfHnF2Mp3lynFlTBTzvl7dxVHNJkKchONgc7WX9t3ru4Gcnls1SAJn9hu/wHSjsgfKtKeu7ll+FD4nOaie8V8w/lcx6MU0/KWD49mZrmRn6eocAR81paCdksCbaZ1TPLkLtaXdA2FQtmQCKY6MV4VIh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwciPEMO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwciPEMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785030133; x=1816566133;
  h=date:from:to:cc:subject:message-id;
  bh=6Ou+PI2ZLRrIqGbnRXyAyzWwzUnCWwRcGbEKvVwhAsI=;
  b=mwciPEMOQD1Ylw+Xkrr8AjPzTCEo0eTcvQdqmBfJF7mEIEq0fASYFia/
   OHJ5tR7biDt32W2/dLESIM7hyDbrkvkYSr7IzAPx6CoXliy6WZpewJR9Q
   uSjJzKzfvo0XLNfGMbaG5RbxkGrDSt1RU7iZnHspelGueZlaO+qbOqUa0
   abVIzf33bMglEFFw5iP2GIi8ELkPdLBfLWZs2/v9lscRAGyTlrajEi52C
   Cbnk2/wUD11i5Eyy+tfnXVcwdCg2S2ougAfbO+DFbjJfrRUodXGHP/lIJ
   VwITfIu6ir29y8pdKJYmzxsntcOyaSKciqz+eSFmiw4fxCF9Z7xmJ05Gu
   A==;
X-CSE-ConnectionGUID: x8WRoeuERU2KlYUC0JsGbw==
X-CSE-MsgGUID: zP2i7aWGQT+KaMFxFthQrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="96798936"
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="96798936"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 18:42:13 -0700
X-CSE-ConnectionGUID: BjcrnsGcTeuVtlNqVPaeHw==
X-CSE-MsgGUID: v8mRg8qDSOuhriAPzzibTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="262833742"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Jul 2026 18:42:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnnsU-00000000cCZ-33fm;
	Sun, 26 Jul 2026 01:42:07 +0000
Date: Sun, 26 Jul 2026 09:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-crc 20/59] fs/xfs/xfs_ioend.c:28
 xfs_end_io_read() warn: bitwise AND condition is false here
Message-ID: <202607260930.j3A7TSNe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   10c7aa6f2c85085eec34737be592d6ae69583782
commit: 5ca814cfff91f77e81966416c9d00673f0f29ebb [20/59] iomap,xfs: move integrity verification to the file system
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20260725 (https://download.01.org/0day-ci/archive/20260726/202607260930.j3A7TSNe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607260930.j3A7TSNe-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_ioend.c:28 xfs_end_io_read() warn: bitwise AND condition is false here

Old smatch warnings:
fs/xfs/xfs_ioend.c:42 xfs_ioend_submit_read() warn: bitwise AND condition is false here

vim +28 fs/xfs/xfs_ioend.c

8870db508b563d Christoph Hellwig 2026-07-22  20  
8870db508b563d Christoph Hellwig 2026-07-22  21  static void
8870db508b563d Christoph Hellwig 2026-07-22  22  xfs_end_io_read(
8870db508b563d Christoph Hellwig 2026-07-22  23  	struct bio		*bio)
8870db508b563d Christoph Hellwig 2026-07-22  24  {
8870db508b563d Christoph Hellwig 2026-07-22  25  	struct iomap_ioend	*ioend = iomap_ioend_from_bio(bio);
8870db508b563d Christoph Hellwig 2026-07-22  26  	int			error = blk_status_to_errno(bio->bi_status);
8870db508b563d Christoph Hellwig 2026-07-22  27  
5ca814cfff91f7 Christoph Hellwig 2026-07-22 @28  	if (!error && (ioend->io_flags & IOMAP_IOEND_INTEGRITY))
5ca814cfff91f7 Christoph Hellwig 2026-07-22  29  		error = iomap_ioend_integrity_verify(ioend);
5ca814cfff91f7 Christoph Hellwig 2026-07-22  30  
8870db508b563d Christoph Hellwig 2026-07-22  31  	iomap_finish_ioends(ioend, error);
8870db508b563d Christoph Hellwig 2026-07-22  32  }
8870db508b563d Christoph Hellwig 2026-07-22  33  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
