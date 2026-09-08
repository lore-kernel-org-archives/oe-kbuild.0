Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53CD274641
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Sep 2026 02:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836271; cv=none; b=cHlraByu2Jsr2l05eCJxAIezDVQRwniHhW4Y3e+w/gnMyYln5wgLw6QIXsFm+GHKEFtl9Kfi0QtsflwXcPaK2kgA0eHnHn0o2ODVwB8WvcfSwyLKJbQooa7Wevq8gAZ7LvmQ7iUdMYvxZ6zfzRN8YifeALQa+h3crK/h0quQDLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836271; c=relaxed/simple;
	bh=kgJVnT6c9Zds8cSa9LLFDaBRhCdwK0wemYYjLKOq4fc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lY953wejgceoQdSthbsW+woPyhiRQ6JwllYCRAukm2jldvYyVcVP7VeaSYkws33Adfp/v+iN/mTauduAD1dyi9tGmMIDz930ZX2OURaJsZJkawg3W/6Y51ED6+E1HNTp7gXN9baVB42eOpdgETAh8cEKVpdcEyz5vwefPdyyV/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBAy3sR0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBAy3sR0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788836270; x=1820372270;
  h=date:from:to:cc:subject:message-id;
  bh=kgJVnT6c9Zds8cSa9LLFDaBRhCdwK0wemYYjLKOq4fc=;
  b=mBAy3sR06/6gWwKZfwh/yPK3/uo1FjPHCwI80ecvGp4hF+pg+VtCUoDP
   S288hQyBpXB0nnsbvwvGUr2LSJSBJPaql5kNfKIs3bsjBync/OtJY9Q88
   bqwzcFMmvzVwwhL1Z3QQWj52yfnSNUw2EfgDgYpV07tAQB/mI1ajhgThn
   4KInzWSytZU/WUA87lP34yhg6v5NOpcGNTzJhdR6xGrLqUTx8UpCunl/1
   NQdMpGVQLlt8g2kVm7v7Q3hxblPz52RVVyWjS4KkoJTb64HAhpvizmJEu
   tAMb989/YVoBXiMP3T/0IwUopIDtZjFYQ3GqE+vp62f0FRge/qH62A1v9
   w==;
X-CSE-ConnectionGUID: RkHgf89jRbm0yFZz/iE3iA==
X-CSE-MsgGUID: LoGj1LecSuO4zovfhaCkhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89074730"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89074730"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 19:57:49 -0700
X-CSE-ConnectionGUID: +bQtoMCNTsGVYqe/fjac/A==
X-CSE-MsgGUID: sj1E7SZzQOKu/tmKaZE7/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="269537317"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Sep 2026 19:57:48 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3m1p-000000001a1-3DYG;
	Tue, 08 Sep 2026 02:57:45 +0000
Date: Tue, 08 Sep 2026 10:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-misc:lazy-bounce 9/17] fs/xfs/xfs_zone_alloc.c:894
 xfs_submit_zoned_bio() warn: bitwise AND condition is false here
Message-ID: <202609081026.AV6VsNaA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git lazy-bounce
head:   c9e46748d6d2c19935c022d43c11875c4495bfe5
commit: 26fc998807ae6d7e337a0591a2d0131bac587d92 [9/17] xfs: move PI generation into xfs_submit_zoned_bio
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: openrisc-randconfig-r073-20260907 (https://download.01.org/0day-ci/archive/20260908/202609081026.AV6VsNaA-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609081026.AV6VsNaA-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_zone_alloc.c:894 xfs_submit_zoned_bio() warn: bitwise AND condition is false here

vim +894 fs/xfs/xfs_zone_alloc.c

f3e2e53823b98d Hans Holmberg     2025-05-14  876  
0989dfa61f4381 Christoph Hellwig 2025-06-05  877  static void
0989dfa61f4381 Christoph Hellwig 2025-06-05  878  xfs_submit_zoned_bio(
0989dfa61f4381 Christoph Hellwig 2025-06-05  879  	struct iomap_ioend	*ioend,
0989dfa61f4381 Christoph Hellwig 2025-06-05  880  	struct xfs_open_zone	*oz,
0989dfa61f4381 Christoph Hellwig 2025-06-05  881  	bool			is_seq)
0989dfa61f4381 Christoph Hellwig 2025-06-05  882  {
0989dfa61f4381 Christoph Hellwig 2025-06-05  883  	ioend->io_bio.bi_iter.bi_sector = ioend->io_sector;
0989dfa61f4381 Christoph Hellwig 2025-06-05  884  	ioend->io_private = oz;
0989dfa61f4381 Christoph Hellwig 2025-06-05  885  	atomic_inc(&oz->oz_ref); /* for xfs_zoned_end_io */
0989dfa61f4381 Christoph Hellwig 2025-06-05  886  
0989dfa61f4381 Christoph Hellwig 2025-06-05  887  	if (is_seq) {
0989dfa61f4381 Christoph Hellwig 2025-06-05  888  		ioend->io_bio.bi_opf &= ~REQ_OP_WRITE;
0989dfa61f4381 Christoph Hellwig 2025-06-05  889  		ioend->io_bio.bi_opf |= REQ_OP_ZONE_APPEND;
0989dfa61f4381 Christoph Hellwig 2025-06-05  890  	} else {
0989dfa61f4381 Christoph Hellwig 2025-06-05  891  		xfs_mark_rtg_boundary(ioend);
0989dfa61f4381 Christoph Hellwig 2025-06-05  892  	}
0989dfa61f4381 Christoph Hellwig 2025-06-05  893  
26fc998807ae6d Christoph Hellwig 2026-07-27 @894  	if (ioend->io_flags & IOMAP_IOEND_INTEGRITY)
26fc998807ae6d Christoph Hellwig 2026-07-27  895  		fs_bio_integrity_generate(&ioend->io_bio);
0989dfa61f4381 Christoph Hellwig 2025-06-05  896  	submit_bio(&ioend->io_bio);
0989dfa61f4381 Christoph Hellwig 2025-06-05  897  }
0989dfa61f4381 Christoph Hellwig 2025-06-05  898  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
