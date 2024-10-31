Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2367E28FD
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Oct 2024 02:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730343052; cv=none; b=BPRFaT/b8fShEs7c2u8c0aG3WWtCH7bMs0BoDrYwd23xrV7bdcAJfOvj+4lbpUD6uzInzGbtlHvQDu52CuDMYzjCkyU2WC06FREZJr0/tWW0jU4/GF98Tu9wOFIUKenU5ZP52EVsvRn/L8cLrW/2nR7CoDW+YIBJbGfjRaAZCZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730343052; c=relaxed/simple;
	bh=0U956QjESfWmcJ/kIDfohpEt1kwR6kAG+t1jZnPQGjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eZfma2IK9uC2oLP6LqtDMVRrpcroQutu6SmQWKHQnP+2KniVu1tF0sqzkTBBBvsdqcF1khkQV+OC8jBKR8k4LoyrMdskS1jIiHO/TNq8GUrHY4UxVBpbvdG4ttTZNRVjWmboD6+CBUtPpng3LENmLeMyf9NeMS2kBwEU109KWqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWyFp9sw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWyFp9sw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730343050; x=1761879050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0U956QjESfWmcJ/kIDfohpEt1kwR6kAG+t1jZnPQGjA=;
  b=BWyFp9swEX86umfzC7J2rr47hpWLxRLcDLnx530PdAeIMN0kRMKzKcKS
   JUKxf7J0waZeAW+BhmkQfACUSBYmFTa4MWN83pcY88V/afCrqFMFFngR9
   kAmk62JmOGSGT8RmXr7e0hnzEZr7ulf6vGvWFGePWKpdGhHJs4cIZXxGV
   mXrHmowg4NN90yUCyaOAlm2FVYUHG8zUUT2TBjQPjRZAgEYHOkTuLRDdr
   eGAB0PwIFJO2Mxk3tFNrZ+G12adyBY2uuRAtrBrVJSNi0DP5FMI7sy/W1
   UicPxN8Q0EmvXZoHBYXM8S+JArIAy/O7cgb5M5Qj7B8PKRFx7edc4NPgx
   Q==;
X-CSE-ConnectionGUID: F9EiH60ZRe+E6P5aN/LeUA==
X-CSE-MsgGUID: Bcg/4YJSSJe6WeeqvcW7jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="29485557"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="29485557"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 19:50:49 -0700
X-CSE-ConnectionGUID: RdlzZ22hSpizFGF/FCqKyw==
X-CSE-MsgGUID: SoImXxCZQ5G3pcdLo8qqWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="87286438"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Oct 2024 19:50:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6LGn-000fa4-2b;
	Thu, 31 Oct 2024 02:50:45 +0000
Date: Thu, 31 Oct 2024 10:50:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/xfs/scrub/orphanage.c:495:9-16: Missing call to dput() at line
 501.
Message-ID: <202410311031.fBcDKD5n-lkp@intel.com>
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
head:   0fc810ae3ae110f9e2fcccce80fc8c8d62f97907
commit: 5e1c7d0b29f7e05b01e448d2579a469cf3a0d350 xfs: invalidate dentries for a file before moving it to the orphanage
date:   6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-104-20241031 (https://download.01.org/0day-ci/archive/20241031/202410311031.fBcDKD5n-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410311031.fBcDKD5n-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/orphanage.c:495:9-16: Missing call to dput() at line 501.

vim +495 fs/xfs/scrub/orphanage.c

73597e3e42b4a15 Darrick J. Wong 2024-04-15  460  
73597e3e42b4a15 Darrick J. Wong 2024-04-15  461  /*
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22  462   * Invalidate all dentries for the name that was added to the orphanage
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22  463   * directory, and all dentries pointing to the child inode that was moved.
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22  464   *
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22  465   * There should not be any positive entries for the name, since we've
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22  466   * maintained our lock on the orphanage directory.
73597e3e42b4a15 Darrick J. Wong 2024-04-15  467   */
73597e3e42b4a15 Darrick J. Wong 2024-04-15  468  static void
73597e3e42b4a15 Darrick J. Wong 2024-04-15  469  xrep_adoption_zap_dcache(
73597e3e42b4a15 Darrick J. Wong 2024-04-15  470  	struct xrep_adoption	*adopt)
73597e3e42b4a15 Darrick J. Wong 2024-04-15  471  {
73597e3e42b4a15 Darrick J. Wong 2024-04-15  472  	struct qstr		qname = QSTR_INIT(adopt->xname->name,
73597e3e42b4a15 Darrick J. Wong 2024-04-15  473  						  adopt->xname->len);
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22  474  	struct xfs_scrub	*sc = adopt->sc;
73597e3e42b4a15 Darrick J. Wong 2024-04-15  475  	struct dentry		*d_orphanage, *d_child;
73597e3e42b4a15 Darrick J. Wong 2024-04-15  476  
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22  477  	/* Invalidate all dentries for the adoption name */
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22  478  	d_orphanage = d_find_alias(VFS_I(sc->orphanage));
73597e3e42b4a15 Darrick J. Wong 2024-04-15  479  	if (!d_orphanage)
73597e3e42b4a15 Darrick J. Wong 2024-04-15  480  		return;
73597e3e42b4a15 Darrick J. Wong 2024-04-15  481  
73597e3e42b4a15 Darrick J. Wong 2024-04-15  482  	d_child = d_hash_and_lookup(d_orphanage, &qname);
73597e3e42b4a15 Darrick J. Wong 2024-04-15  483  	while (d_child != NULL) {
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22  484  		trace_xrep_adoption_invalidate_child(sc->mp, d_child);
73597e3e42b4a15 Darrick J. Wong 2024-04-15  485  
73597e3e42b4a15 Darrick J. Wong 2024-04-15  486  		ASSERT(d_is_negative(d_child));
73597e3e42b4a15 Darrick J. Wong 2024-04-15  487  		d_invalidate(d_child);
73597e3e42b4a15 Darrick J. Wong 2024-04-15  488  		dput(d_child);
73597e3e42b4a15 Darrick J. Wong 2024-04-15  489  		d_child = d_lookup(d_orphanage, &qname);
73597e3e42b4a15 Darrick J. Wong 2024-04-15  490  	}
73597e3e42b4a15 Darrick J. Wong 2024-04-15  491  
73597e3e42b4a15 Darrick J. Wong 2024-04-15  492  	dput(d_orphanage);
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22  493  
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22  494  	/* Invalidate all the dentries pointing down to this file. */
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22 @495  	while ((d_child = d_find_alias(VFS_I(sc->ip))) != NULL) {
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22  496  		trace_xrep_adoption_invalidate_child(sc->mp, d_child);
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22  497  
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22  498  		d_invalidate(d_child);
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22  499  		dput(d_child);
5e1c7d0b29f7e05 Darrick J. Wong 2024-04-22  500  	}
73597e3e42b4a15 Darrick J. Wong 2024-04-15 @501  }
73597e3e42b4a15 Darrick J. Wong 2024-04-15  502  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
