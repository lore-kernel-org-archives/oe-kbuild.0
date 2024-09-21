Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E32F9DF
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Sep 2024 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726909482; cv=none; b=n4XYTz4ta6gbb3HTPMYPFn7DrUUcTBsQ1+SZv6Qba3sgilNrtOOP4cWhZbKIWpPPMwLsLhgfO4cZUMvwgSTS/TSOUNa6VNC0g0VYNHsCWpjVOeWBL1IgIdVWIVLr98zdnqssRhRtDqWPpmdHorUSHX94pDWgJOt6+W+9ub5Revk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726909482; c=relaxed/simple;
	bh=S1/kBrVLcfT7dTtYI+QQa4G1oFgPNr2ugr08Z/L3v1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QQyCu5AxuT+4N/0KMO/bChL9FibDtRHYTuE1X2M1lAsq8uFxA5xP3v3DMrH+i456AC8hEF4mK0DHXEO4Kk5OLE1O9cUHoKVpX4uxwD34S0lTAK+FWad+ZR0X3WZRVVqIuVaVnE1WG18Ahyhuikjmo6zJ5DqW1JOm/+MmwNjUFVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WK1+sgyQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WK1+sgyQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726909480; x=1758445480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S1/kBrVLcfT7dTtYI+QQa4G1oFgPNr2ugr08Z/L3v1k=;
  b=WK1+sgyQxsOyMmZ84k4iSrVnQn0+Z6sRurY+LcC7ktK8ZAIAxJK93PEg
   0eSWuEzxH9sGG7SUYHr2uzf3gTo48Oc4kL8rqKn+T7xLK2dNso42wZ1Aa
   MkbTBwcnnnecmeSFqfQWac406ciazU0UnNjx4fJ6Nnqhmd86Kp/6YEHXd
   I+jM7N6i2B5KPDpsWYyZyQyrjtkxZQBAhLo3R1HPWDzUzmUz1VzRSHaTu
   Mb9gfwuaS+APnRWhbDiaTofIKQHk7XV3wU4v8qtkhWDE2iGLrCYXPEG6u
   gPhDpimF8rkbAl99Kf/f3QO0IVP4n9P6EQUMlZ4X5ES+k0KXIB+HYo5J5
   A==;
X-CSE-ConnectionGUID: 53HcKH7KTzCcoPBgnbq0IQ==
X-CSE-MsgGUID: L4Zdahf7Ql6lc4ZHjb8rzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="37289291"
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="37289291"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 02:04:39 -0700
X-CSE-ConnectionGUID: 8Trk8kdkT9ul8Ko0mE/lcA==
X-CSE-MsgGUID: ALOEA8JwSOaUCjllHvdtog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="101399525"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Sep 2024 02:04:38 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srw2e-000FHz-0n;
	Sat, 21 Sep 2024 09:04:36 +0000
Date: Sat, 21 Sep 2024 17:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/xfs/scrub/orphanage.c:495:9-16: Missing call to dput() at line
 501.
Message-ID: <202409211636.sDz0opbP-lkp@intel.com>
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
head:   1868f9d0260e9afaf7c6436d14923ae12eaea465
commit: 5e1c7d0b29f7e05b01e448d2579a469cf3a0d350 xfs: invalidate dentries for a file before moving it to the orphanage
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-104-20240921 (https://download.01.org/0day-ci/archive/20240921/202409211636.sDz0opbP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409211636.sDz0opbP-lkp@intel.com/

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
