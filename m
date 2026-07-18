Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6693F2EA154
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jul 2026 08:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784362794; cv=none; b=pk7hHrGUW/TN0D+rJFYI6bY6zDRz04/S3vdrfWVvnl5aGhYKxeesRSK32/I/N/OY8mHVjT7PyKa4g4SjQ57Kt5IZMi4o85+il9MQH16lu1tdD/26cNm0mwKVprjDKgK5EB2Kivif0NIc3CzSusTcUvGEp4PimPND8TenCo1y96w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784362794; c=relaxed/simple;
	bh=tUHDIfep2jjo5YabSHwGuvdlbF83spHDGt79ZFIT0zs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uP9Thd1+umkT6HdnwG5VnIa7nVE3LVebEeFx1Rvg0LDhgrgg/bJZgOzXYSh0NNizjGvViB2aBvTVvqFG9ycUwtoye1CLiQqovgug8Jkq3sbLiVLBhTOnz1WpXDXkiNPwleOEBEsOxuhawxNoitYAJaDqg70GWcgjZsQbhnkcung=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bf8/42Se; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bf8/42Se"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784362792; x=1815898792;
  h=date:from:to:cc:subject:message-id;
  bh=tUHDIfep2jjo5YabSHwGuvdlbF83spHDGt79ZFIT0zs=;
  b=Bf8/42Se3M4MJV14k4xy/nxnYzgW2Sg/mzPgwquqnnhcVmFpaa87Qj4y
   RBhvOxprjHKy2UbpPX3eE/0ioB0a+SpKXyB3hrYGHMxMjSSMTGfXMNBdD
   07VP8mh39vrMCYHCn3Ot5v2GHMnE9I+JRy11UjsHdkMg3g0RP0jyyYDpJ
   j04aLNsDhEn8BYqte1MHpOk3lQ3qky5KTZhdVW5aBjPALFgOVTG2ZoW9P
   /OdB7c4682p94Rm/a3g8xB79MuF+6WBC4Vd1DfaySoA2q8RISUjZ6p/26
   7+lvf/j9Mg4n4ZRj0slt4NPuoIEOrsUhUC0aPmoqsyl3VvJ6KbH5HKVTp
   w==;
X-CSE-ConnectionGUID: f03I1PAsRbKfmkBAUQ6kQQ==
X-CSE-MsgGUID: OHTDW0p5Q9yIeM+6CmyCmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="107807752"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="107807752"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 01:19:52 -0700
X-CSE-ConnectionGUID: QfMT9Z/KS0+r7GeApMJFbg==
X-CSE-MsgGUID: pkR6ZcABQ0ykpAFgfA4/1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="258987959"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 18 Jul 2026 01:19:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl0Gw-00000000TaE-3Zpo;
	Sat, 18 Jul 2026 08:19:47 +0000
Date: Sat, 18 Jul 2026 16:19:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-crc 32/51] fs/xfs/xfs_ioend.c:37
 xfs_ioend_submit_read() warn: bitwise AND condition is false here
Message-ID: <202607181645.Qk1wIJ3K-lkp@intel.com>
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
head:   ef3d55d014b3a800421b9dae3ac182577bfe2bd7
commit: 379f52bd4b1661b47a36af3e559630fce9f470c4 [32/51] xfs: add a xfs_ioend_read helper
:::::: branch date: 16 hours ago
:::::: commit date: 18 hours ago
config: nios2-randconfig-r071-20260718 (https://download.01.org/0day-ci/archive/20260718/202607181645.Qk1wIJ3K-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607181645.Qk1wIJ3K-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_ioend.c:37 xfs_ioend_submit_read() warn: bitwise AND condition is false here

vim +37 fs/xfs/xfs_ioend.c

379f52bd4b1661b Christoph Hellwig 2026-07-07  28  
379f52bd4b1661b Christoph Hellwig 2026-07-07  29  void
379f52bd4b1661b Christoph Hellwig 2026-07-07  30  xfs_ioend_submit_read(
379f52bd4b1661b Christoph Hellwig 2026-07-07  31  	struct inode		*inode,
379f52bd4b1661b Christoph Hellwig 2026-07-07  32  	struct bio		*bio,
379f52bd4b1661b Christoph Hellwig 2026-07-07  33  	loff_t			file_offset,
379f52bd4b1661b Christoph Hellwig 2026-07-07  34  	const struct iomap	*iomap,
379f52bd4b1661b Christoph Hellwig 2026-07-07  35  	u16			flags)
379f52bd4b1661b Christoph Hellwig 2026-07-07  36  {
379f52bd4b1661b Christoph Hellwig 2026-07-07 @37  	if (iomap->flags & IOMAP_F_INTEGRITY)
379f52bd4b1661b Christoph Hellwig 2026-07-07  38  		flags |= IOMAP_IOEND_INTEGRITY;
379f52bd4b1661b Christoph Hellwig 2026-07-07  39  	iomap_init_ioend(inode, bio, file_offset, flags);
379f52bd4b1661b Christoph Hellwig 2026-07-07  40  	bio->bi_end_io = xfs_end_bio_read;
379f52bd4b1661b Christoph Hellwig 2026-07-07  41  	bio_set_flag(bio, BIO_COMPLETE_IN_TASK);
379f52bd4b1661b Christoph Hellwig 2026-07-07  42  	submit_bio(bio);
d0a5f1a4fad0025 Christoph Hellwig 2026-06-25  43  }
d0a5f1a4fad0025 Christoph Hellwig 2026-06-25  44  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
