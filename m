Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6336347A5D
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jul 2024 16:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721146569; cv=none; b=BzW36Ukq0Ab3TIEllbOjrE7qfVYWldoV46A41Cv7oDCsUwtstESj6sptV58c3vx0/oiNBova0Kc6+34Iy8krlfyp8kNMCxulK5c4R+YLvUxvSuATJAVq8sxQMmGu3yD74v6Hxb4Q+bIvxlTlTP00F0MsJdrxFqUm0eh27wKEZWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721146569; c=relaxed/simple;
	bh=ylP+Uq+pyvbn6orFcJdCZs++7VspQG+IKuLCPOTi/So=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K7YMF6Q9tNi0bGZtxvv0MM6hIrkIjEZa20fajCSn1sa0j3doWqhtkJBPiFCjp+hCoiE61YABiM2sP2HGwOQY0XSczuelRk6LX7QWWszYhGivT5OFizJ+uSEESrmuySkL3do9CNy3lHO7cBAC4I3moPYgmkPyaOCo74mqdPeRIuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fw8qLvEV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fw8qLvEV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721146568; x=1752682568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ylP+Uq+pyvbn6orFcJdCZs++7VspQG+IKuLCPOTi/So=;
  b=Fw8qLvEVINrlPV07jqhW9f0CIH1DnMceG+mnvvIIzjuxSzzdy2XfD7WO
   t3u5yqFkdya/cgfijHL4aBcmJIxRs0MVOPmBJXGmvb8dUyZw8GArVQ6EF
   aqBm5d4WJhSFoNzBF7tHojYD2rzYV24SaT5VTnGafNQrN9G/ewCmzwEfz
   rAo7UHqlc/YldIvpXkFvMbXSMVqSBQfNzAx9sBbJtQ+4BpYWhQ+Ycr3P9
   47Y9tT8aCCjmMd3tb1sF+6vhr9uXcWmbKrvWrfA/k6DMI1nAKBaqfO8aY
   1/VhYpf1LCk2VJKTx4w537JvrLu91C7o6rcJ1zN9Ol7isKsVCu0+8fjlJ
   g==;
X-CSE-ConnectionGUID: Ukr5dU4sQ+K9IdY/xQiYeQ==
X-CSE-MsgGUID: 7MJf0Ov5TTqQi4aYwoh/5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29985360"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="29985360"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 09:16:07 -0700
X-CSE-ConnectionGUID: LEJsU5WcS82FRkPX7WdZXw==
X-CSE-MsgGUID: QonUU4vtTiSdWHrypOI6Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="73288206"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jul 2024 09:16:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTkqR-000fQw-1b;
	Tue, 16 Jul 2024 16:16:03 +0000
Date: Wed, 17 Jul 2024 00:15:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-per-rtg-inodes 3/3] fs/xfs/libxfs/xfs_rtgroup.c:624
 xfs_rtginode_create() warn: variable dereferenced before check 'upd.ip' (see
 line 606)
Message-ID: <202407170031.36YDa20N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-per-rtg-inodes
head:   97bcfdc4558fc6300487e92a782d1dd9228a1fc4
commit: 97bcfdc4558fc6300487e92a782d1dd9228a1fc4 [3/3] xfs: add a per-RTG inode abstraction
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240716 (https://download.01.org/0day-ci/archive/20240717/202407170031.36YDa20N-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407170031.36YDa20N-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_rtgroup.c:624 xfs_rtginode_create() warn: variable dereferenced before check 'upd.ip' (see line 606)
fs/xfs/libxfs/xfs_rtgroup.c:604 xfs_rtginode_create() warn: missing unwind goto?

vim +624 fs/xfs/libxfs/xfs_rtgroup.c

97bcfdc4558fc6 Christoph Hellwig 2024-07-12  577  
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  578  /* Add a metadata inode for a realtime rmap btree. */
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  579  int
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  580  xfs_rtginode_create(
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  581  	struct xfs_rtgroup	*rtg,
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  582  	enum xfs_rtg_inodes	type,
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  583  	bool			init)
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  584  {
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  585  	const struct xfs_rtginode_ops *ops = &xfs_rtginode_ops[type];
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  586  	struct xfs_mount	*mp = rtg->rtg_mount;
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  587  	struct xfs_imeta_update	upd = { };
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  588  	const char		*path;
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  589  	int			error;
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  590  
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  591  	if (!ops->has(rtg->rtg_mount))
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  592  		return 0;
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  593  
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  594  	path = xfs_rtginode_path(rtg->rtg_rgno, type);
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  595  	if (!path)
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  596  		return -ENOMEM;
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  597  
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  598  	error = xfs_imeta_start_create(mp->m_rtdirip, path, &upd);
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  599  	if (error)
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  600  		goto out_path;
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  601  
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  602  	error = xfs_imeta_create(&upd, S_IFREG);
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  603  	if (error)
97bcfdc4558fc6 Christoph Hellwig 2024-07-12 @604  		return error;
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  605  
97bcfdc4558fc6 Christoph Hellwig 2024-07-12 @606  	lockdep_set_class_and_subclass(&upd.ip->i_lock, &rtg->lock_class, type);
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  607  
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  608  	error = ops->create(rtg, upd.ip, upd.tp, init);
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  609  	if (error)
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  610  		goto out_cancel;
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  611  
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  612  	error = xfs_imeta_commit(&upd);
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  613  	if (error)
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  614  		goto out_path;
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  615  
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  616  	kfree(path);
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  617  	xfs_finish_inode_setup(upd.ip);
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  618  	rtg->rtg_inodes[type] = upd.ip;
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  619  	return 0;
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  620  
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  621  out_cancel:
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  622  	xfs_imeta_cancel(&upd, error);
97bcfdc4558fc6 Christoph Hellwig 2024-07-12  623  	/* Have to finish setting up the inode to ensure it's deleted. */
97bcfdc4558fc6 Christoph Hellwig 2024-07-12 @624  	if (upd.ip) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
