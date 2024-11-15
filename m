Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78092145A0B
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Nov 2024 03:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731641514; cv=none; b=uWsOPfKsMkYd2IsoDHdq4FMHe7Wkk3w2X8eIHAj8Djy1yxb7LHXxW8Nz/EDQOfOe+GB7qnRkDJ5gd7YnXVAgm/NY8tWMd+gajt7wicpOMLsqjkEX7q1J0HiuXEH0uUtVtQUJ8RhWQ1tEruCFzCVh+oJGUlbAVAIVktJzMHCQrQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731641514; c=relaxed/simple;
	bh=G31YxZ/BY4HFOgNWdBNtt34rWsPcSaO5hp0EZB00L7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hlBOQtdQ++6gBo3gxM6ODu6kwHxYAiQ3o3KtImu6ilwrJoKbls0fc24As0WrwMuVbyJWt2WYHNNymfYjFE3bHIlsIFgg8zjc68HUyGlhntoolPD9liHAglNljoeoZ2wSEUazCvkRYc0RjHuGu7p/e+0w/3rLLLEts8ozDN14jAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYqYJ7p7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYqYJ7p7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731641511; x=1763177511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G31YxZ/BY4HFOgNWdBNtt34rWsPcSaO5hp0EZB00L7A=;
  b=cYqYJ7p7n7LvcjDG/eLye8BMTLDiqFphsSTbm9HLeDmjY3xvqAR25L2P
   yw1W8QZviYDekZU8NPPJOz/arOG8cXZJNpplWcxAJ2/uDwNRncPJ49FZ4
   5Tt32jlV7MEcejecBLn4Vx0Lo0tGhLptLxiTUWtqWffmoxAqMTPaVjCJ1
   reELfXBInhSfBeiXzmaLlIXqO0AjNSAaMY9O9lMmRaz4jxfyzWYuudjPE
   YxwXxPJ5fXO1m5s+I2m6MZDXKz/Z3JY/tesxJFGVcK0P2HJJU0QEIbgo1
   1LxHO7MNHbhsCtH5iKCPvjGNjMgk2knxZPDhTxriqNCz/lhz4xfSr23cX
   w==;
X-CSE-ConnectionGUID: RWAKEYSuTx2/MJX9YvxApg==
X-CSE-MsgGUID: hCdLeyCbTyKpW2SYTKrd0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="19235961"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="19235961"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 19:31:50 -0800
X-CSE-ConnectionGUID: sUPfFUcTQRaxMGlu6ljQvQ==
X-CSE-MsgGUID: MABuUsKnQrOAt8ryV7Lu0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="111700550"
Received: from lkp-server02.sh.intel.com (HELO 481373e0caf0) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Nov 2024 19:31:38 -0800
Received: from kbuild by 481373e0caf0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBn3Y-00006X-0p;
	Fri, 15 Nov 2024 03:31:36 +0000
Date: Fri, 15 Nov 2024 11:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/xfs/scrub/orphanage.c:495:9-16: Missing call to dput() at line
 501.
Message-ID: <202411151139.s0oyah9w-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cfaaa7d010d1fc58f9717fcc8591201e741d2d49
commit: 5e1c7d0b29f7e05b01e448d2579a469cf3a0d350 xfs: invalidate dentries for a file before moving it to the orphanage
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: parisc-randconfig-r054-20241115 (https://download.01.org/0day-ci/archive/20241115/202411151139.s0oyah9w-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411151139.s0oyah9w-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/orphanage.c:495:9-16: Missing call to dput() at line 501.

vim +495 fs/xfs/scrub/orphanage.c

73597e3e42b4a1 Darrick J. Wong 2024-04-15  460  
73597e3e42b4a1 Darrick J. Wong 2024-04-15  461  /*
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  462   * Invalidate all dentries for the name that was added to the orphanage
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  463   * directory, and all dentries pointing to the child inode that was moved.
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  464   *
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  465   * There should not be any positive entries for the name, since we've
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  466   * maintained our lock on the orphanage directory.
73597e3e42b4a1 Darrick J. Wong 2024-04-15  467   */
73597e3e42b4a1 Darrick J. Wong 2024-04-15  468  static void
73597e3e42b4a1 Darrick J. Wong 2024-04-15  469  xrep_adoption_zap_dcache(
73597e3e42b4a1 Darrick J. Wong 2024-04-15  470  	struct xrep_adoption	*adopt)
73597e3e42b4a1 Darrick J. Wong 2024-04-15  471  {
73597e3e42b4a1 Darrick J. Wong 2024-04-15  472  	struct qstr		qname = QSTR_INIT(adopt->xname->name,
73597e3e42b4a1 Darrick J. Wong 2024-04-15  473  						  adopt->xname->len);
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  474  	struct xfs_scrub	*sc = adopt->sc;
73597e3e42b4a1 Darrick J. Wong 2024-04-15  475  	struct dentry		*d_orphanage, *d_child;
73597e3e42b4a1 Darrick J. Wong 2024-04-15  476  
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  477  	/* Invalidate all dentries for the adoption name */
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  478  	d_orphanage = d_find_alias(VFS_I(sc->orphanage));
73597e3e42b4a1 Darrick J. Wong 2024-04-15  479  	if (!d_orphanage)
73597e3e42b4a1 Darrick J. Wong 2024-04-15  480  		return;
73597e3e42b4a1 Darrick J. Wong 2024-04-15  481  
73597e3e42b4a1 Darrick J. Wong 2024-04-15  482  	d_child = d_hash_and_lookup(d_orphanage, &qname);
73597e3e42b4a1 Darrick J. Wong 2024-04-15  483  	while (d_child != NULL) {
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  484  		trace_xrep_adoption_invalidate_child(sc->mp, d_child);
73597e3e42b4a1 Darrick J. Wong 2024-04-15  485  
73597e3e42b4a1 Darrick J. Wong 2024-04-15  486  		ASSERT(d_is_negative(d_child));
73597e3e42b4a1 Darrick J. Wong 2024-04-15  487  		d_invalidate(d_child);
73597e3e42b4a1 Darrick J. Wong 2024-04-15  488  		dput(d_child);
73597e3e42b4a1 Darrick J. Wong 2024-04-15  489  		d_child = d_lookup(d_orphanage, &qname);
73597e3e42b4a1 Darrick J. Wong 2024-04-15  490  	}
73597e3e42b4a1 Darrick J. Wong 2024-04-15  491  
73597e3e42b4a1 Darrick J. Wong 2024-04-15  492  	dput(d_orphanage);
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  493  
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  494  	/* Invalidate all the dentries pointing down to this file. */
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22 @495  	while ((d_child = d_find_alias(VFS_I(sc->ip))) != NULL) {
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  496  		trace_xrep_adoption_invalidate_child(sc->mp, d_child);
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  497  
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  498  		d_invalidate(d_child);
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  499  		dput(d_child);
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  500  	}
73597e3e42b4a1 Darrick J. Wong 2024-04-15 @501  }
73597e3e42b4a1 Darrick J. Wong 2024-04-15  502  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
