Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE1D231A21
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jul 2026 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785077627; cv=none; b=pzukTmeBLex519Dy2vUj+pt+3T0jatXuuLn6gm9z4gD5IRxLfe031e2aYMSXHLU8Xnbu+Q+Fpe1RV4ETIzNApyff1N1yDqQ5tKzioSyqk7mQsjto0clnKSTCyXdnOarFsulq9Ul4zBrM5IJPBm1pq+l8Pf75P7LZAegdHIdFXZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785077627; c=relaxed/simple;
	bh=G6dptW+6ydrP2NIjXWOtVIsd4ZkSKcQh2W2MZg6Ar0U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KLhcS21/FTZLGu5bKZcier28d7SthakMkf02kFbUBt7JljHzFNL5nLyv31LSBQzngSVMoizRtfvSMVxE059HiWCcCN+bsIMpqhnKnYkeDiAM3BVej66Htj6mZeJWwaCZi73X9ctPia0iY3FRGr3hKPemB/KfaZMK6bQ7yxiTozQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVIreFF1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVIreFF1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785077626; x=1816613626;
  h=date:from:to:cc:subject:message-id;
  bh=G6dptW+6ydrP2NIjXWOtVIsd4ZkSKcQh2W2MZg6Ar0U=;
  b=GVIreFF1fJqPdcCRpC6pM0sHIGUbLcSXMC6RcuSzrnwrcnTZHe7mVEdx
   +yBbIhH1hjalX2DZijuGx4nYYQFoLkZBCXZaDREoEegCAtH2Ng13GWUnR
   nxRVOOVhiABVbpLPm00kGkrfvRNopWUwGqlaKDVIHOCWeLPIJBjB9WfIq
   OzhfEx6mWsYPkIxLHZqPv846oNJiK+ly+IliLEydVMghEkrgZx6qiIWwS
   uYB/aSNa6fyK7wR6iHjCBPYdElDpnBQstFuhsJqYBb6ti0vhqBS3jlMgQ
   W0xFfpA4vIV5Jk1n65kpD9tTqEpiPZ67mOXyUqSKCt8U5ENVzcFVAbfBd
   g==;
X-CSE-ConnectionGUID: mLWZ58wmQoed3HFrpbm0qA==
X-CSE-MsgGUID: ckh8uQsMRvaLYlVaCoyPcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="85708092"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="85708092"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 07:53:45 -0700
X-CSE-ConnectionGUID: V1JrZw7yTvCiUG50zSVr/w==
X-CSE-MsgGUID: Lv0adKhMQMyksgFMTvoTKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="259252533"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Jul 2026 07:53:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wo0EX-00000000cZ8-31cB;
	Sun, 26 Jul 2026 14:53:41 +0000
Date: Sun, 26 Jul 2026 22:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-crc 17/59] fs/xfs/xfs_zone_alloc.c:872
 xfs_zone_alloc_and_submit() warn: bitwise AND condition is false here
Message-ID: <202607262252.pmFy7h0Q-lkp@intel.com>
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
commit: f7e123ba2514857fccbda3a1d0f0b9f83cf224da [17/59] xfs: move PI generation into xfs_zone_alloc_and_submit
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20260726 (https://download.01.org/0day-ci/archive/20260726/202607262252.pmFy7h0Q-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607262252.pmFy7h0Q-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_zone_alloc.c:872 xfs_zone_alloc_and_submit() warn: bitwise AND condition is false here

vim +872 fs/xfs/xfs_zone_alloc.c

0989dfa61f4381 Christoph Hellwig 2025-06-05  855  
4e4d5207557770 Christoph Hellwig 2025-02-13  856  void
4e4d5207557770 Christoph Hellwig 2025-02-13  857  xfs_zone_alloc_and_submit(
4e4d5207557770 Christoph Hellwig 2025-02-13  858  	struct iomap_ioend	*ioend,
4e4d5207557770 Christoph Hellwig 2025-02-13  859  	struct xfs_open_zone	**oz)
4e4d5207557770 Christoph Hellwig 2025-02-13  860  {
4e4d5207557770 Christoph Hellwig 2025-02-13  861  	struct xfs_inode	*ip = XFS_I(ioend->io_inode);
4e4d5207557770 Christoph Hellwig 2025-02-13  862  	struct xfs_mount	*mp = ip->i_mount;
64d0361114fdea Hans Holmberg     2025-01-31  863  	enum rw_hint		write_hint = xfs_inode_write_hint(ip);
4e4d5207557770 Christoph Hellwig 2025-02-13  864  	bool			pack_tight = xfs_zoned_pack_tight(ip);
4e4d5207557770 Christoph Hellwig 2025-02-13  865  	unsigned int		alloc_len;
4e4d5207557770 Christoph Hellwig 2025-02-13  866  	struct iomap_ioend	*split;
4e4d5207557770 Christoph Hellwig 2025-02-13  867  	bool			is_seq;
4e4d5207557770 Christoph Hellwig 2025-02-13  868  
4e4d5207557770 Christoph Hellwig 2025-02-13  869  	if (xfs_is_shutdown(mp))
4e4d5207557770 Christoph Hellwig 2025-02-13  870  		goto out_error;
4e4d5207557770 Christoph Hellwig 2025-02-13  871  
f7e123ba251485 Christoph Hellwig 2026-07-19 @872  	if (ioend->io_flags & IOMAP_IOEND_INTEGRITY)
f7e123ba251485 Christoph Hellwig 2026-07-19  873  		fs_bio_integrity_generate(&ioend->io_bio);
f7e123ba251485 Christoph Hellwig 2026-07-19  874  
4e4d5207557770 Christoph Hellwig 2025-02-13  875  	/*
d004d70d6cdf03 Christoph Hellwig 2025-08-18  876  	 * If we don't have a locally cached zone in this write context, see if
d004d70d6cdf03 Christoph Hellwig 2025-08-18  877  	 * the inode is still associated with a zone and use that if so.
4e4d5207557770 Christoph Hellwig 2025-02-13  878  	 */
f3e2e53823b98d Hans Holmberg     2025-05-14  879  	if (!*oz)
ca3d643a970139 Christoph Hellwig 2025-10-17  880  		*oz = xfs_get_cached_zone(ip);
f3e2e53823b98d Hans Holmberg     2025-05-14  881  
4e4d5207557770 Christoph Hellwig 2025-02-13  882  	if (!*oz) {
4e4d5207557770 Christoph Hellwig 2025-02-13  883  select_zone:
64d0361114fdea Hans Holmberg     2025-01-31  884  		*oz = xfs_select_zone(mp, write_hint, pack_tight);
4e4d5207557770 Christoph Hellwig 2025-02-13  885  		if (!*oz)
4e4d5207557770 Christoph Hellwig 2025-02-13  886  			goto out_error;
ca3d643a970139 Christoph Hellwig 2025-10-17  887  		xfs_set_cached_zone(ip, *oz);
4e4d5207557770 Christoph Hellwig 2025-02-13  888  	}
4e4d5207557770 Christoph Hellwig 2025-02-13  889  
4e4d5207557770 Christoph Hellwig 2025-02-13  890  	alloc_len = xfs_zone_alloc_blocks(*oz, XFS_B_TO_FSB(mp, ioend->io_size),
4e4d5207557770 Christoph Hellwig 2025-02-13  891  			&ioend->io_sector, &is_seq);
4e4d5207557770 Christoph Hellwig 2025-02-13  892  	if (!alloc_len) {
4e4d5207557770 Christoph Hellwig 2025-02-13  893  		xfs_open_zone_put(*oz);
4e4d5207557770 Christoph Hellwig 2025-02-13  894  		goto select_zone;
4e4d5207557770 Christoph Hellwig 2025-02-13  895  	}
4e4d5207557770 Christoph Hellwig 2025-02-13  896  
4e4d5207557770 Christoph Hellwig 2025-02-13  897  	while ((split = iomap_split_ioend(ioend, alloc_len, is_seq))) {
4e4d5207557770 Christoph Hellwig 2025-02-13  898  		if (IS_ERR(split))
4e4d5207557770 Christoph Hellwig 2025-02-13  899  			goto out_split_error;
4e4d5207557770 Christoph Hellwig 2025-02-13  900  		alloc_len -= split->io_bio.bi_iter.bi_size;
4e4d5207557770 Christoph Hellwig 2025-02-13  901  		xfs_submit_zoned_bio(split, *oz, is_seq);
4e4d5207557770 Christoph Hellwig 2025-02-13  902  		if (!alloc_len) {
4e4d5207557770 Christoph Hellwig 2025-02-13  903  			xfs_open_zone_put(*oz);
4e4d5207557770 Christoph Hellwig 2025-02-13  904  			goto select_zone;
4e4d5207557770 Christoph Hellwig 2025-02-13  905  		}
4e4d5207557770 Christoph Hellwig 2025-02-13  906  	}
4e4d5207557770 Christoph Hellwig 2025-02-13  907  
4e4d5207557770 Christoph Hellwig 2025-02-13  908  	xfs_submit_zoned_bio(ioend, *oz, is_seq);
4e4d5207557770 Christoph Hellwig 2025-02-13  909  	return;
4e4d5207557770 Christoph Hellwig 2025-02-13  910  
4e4d5207557770 Christoph Hellwig 2025-02-13  911  out_split_error:
4e4d5207557770 Christoph Hellwig 2025-02-13  912  	ioend->io_bio.bi_status = errno_to_blk_status(PTR_ERR(split));
4e4d5207557770 Christoph Hellwig 2025-02-13  913  out_error:
4e4d5207557770 Christoph Hellwig 2025-02-13  914  	bio_io_error(&ioend->io_bio);
4e4d5207557770 Christoph Hellwig 2025-02-13  915  }
4e4d5207557770 Christoph Hellwig 2025-02-13  916  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
