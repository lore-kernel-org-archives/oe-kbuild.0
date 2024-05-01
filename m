Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCB51C68E
	for <oe-kbuild@lists.linux.dev>; Wed,  1 May 2024 14:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714574306; cv=none; b=rNBOFiGh69ZYp7u881rFgviTJcwo6MAQ+/PL+FDtOOneDBORSn7uqQQ8SjOg+FbcOOfe2WmCgOiQdK+nHj2RkfvgRZo3tXv2+PEWy7GPQC0mhLfxwl29pmOUHfUNYVPEvHr9kZU50shUfosFi37EtvAhrAClFsmz0LaaTCP1W60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714574306; c=relaxed/simple;
	bh=6tmmFgKRqGmuz/znymeYhrbhTYQ3GD9lKyRjUxixr8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EtxBuktGYhEjpCFcOdBpaACCgoAh8dcxa3wZuX4P2TENCLpif/r2Oo6Z3HKQ3MwSs3yPMCh94LjR2ITjQU5R/z3C71P0CPNxDQzDg+pNOTQxbRcbYhXbB6ZL5Ti/wppNNnYOQmTJHAU/TTsRFCDGucHw0j5NbgVR7tsgXtmNsFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkEYo4Eo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkEYo4Eo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714574305; x=1746110305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6tmmFgKRqGmuz/znymeYhrbhTYQ3GD9lKyRjUxixr8I=;
  b=YkEYo4Eormc2XI/wsTLqxjb2whRImtcpD6+A3dSn60NjoEbq3c0EXooj
   x99zSXSK5IaiQEZGW37xnCFpUp4DBK2hJKYbPaHw6TrEk1m9FlDtoi3z0
   vhP6MXdKemhSHj/3jqy6JGoIGeLY5YvnCLQi/l9mqS64NqgkXjZdL2X/M
   uLTTpLtlQm8z5oRh9XmXrkjU8LxQtFrV1G7TQ+mNZnOEqIxYeCGhvk/dC
   n560GQ3KNiIdGVZXxFJg03dNTXrY3DGJVEDBnAA+nAUZ/y7bQjrzCzodd
   mh6+O0xFFtfTbqzC7MrZ5DrRwwtKd2rt7GY0FBednqdAAjsQPS6AmGF1W
   A==;
X-CSE-ConnectionGUID: d0KmvZ+ORUejV6/3qZ+myQ==
X-CSE-MsgGUID: j2+WonLURwKHd3d01GdYsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10131815"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="10131815"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 07:38:24 -0700
X-CSE-ConnectionGUID: 6UhHvs3SSPaBog3z+FgSlg==
X-CSE-MsgGUID: scN+N066RG2l4Wauc23uNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="64279295"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 May 2024 07:38:23 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2B6C-0009c4-1c;
	Wed, 01 May 2024 14:38:20 +0000
Date: Wed, 1 May 2024 22:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:timestats-hoist 169/464]
 fs/xfs/scrub/orphanage.c:495:9-16: Missing call to dput() at line 501.
Message-ID: <202405012240.dEcFooB6-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   506e7e6f31fbd22bbf6fb3ad2e66cd0d3761d2f2
commit: 5316671eec5d6d369121ccaaa21f8cbbad59600d [169/464] xfs: invalidate dentries for a file before moving it to the orphanage
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-r063-20240501 (https://download.01.org/0day-ci/archive/20240501/202405012240.dEcFooB6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405012240.dEcFooB6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/orphanage.c:495:9-16: Missing call to dput() at line 501.

vim +495 fs/xfs/scrub/orphanage.c

87aff44c9e2fa9 Darrick J. Wong 2024-01-09  460  
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  461  /*
5316671eec5d6d Darrick J. Wong 2024-04-10  462   * Invalidate all dentries for the name that was added to the orphanage
5316671eec5d6d Darrick J. Wong 2024-04-10  463   * directory, and all dentries pointing to the child inode that was moved.
5316671eec5d6d Darrick J. Wong 2024-04-10  464   *
5316671eec5d6d Darrick J. Wong 2024-04-10  465   * There should not be any positive entries for the name, since we've
5316671eec5d6d Darrick J. Wong 2024-04-10  466   * maintained our lock on the orphanage directory.
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  467   */
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  468  static void
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  469  xrep_adoption_zap_dcache(
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  470  	struct xrep_adoption	*adopt)
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  471  {
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  472  	struct qstr		qname = QSTR_INIT(adopt->xname->name,
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  473  						  adopt->xname->len);
5316671eec5d6d Darrick J. Wong 2024-04-10  474  	struct xfs_scrub	*sc = adopt->sc;
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  475  	struct dentry		*d_orphanage, *d_child;
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  476  
5316671eec5d6d Darrick J. Wong 2024-04-10  477  	/* Invalidate all dentries for the adoption name */
5316671eec5d6d Darrick J. Wong 2024-04-10  478  	d_orphanage = d_find_alias(VFS_I(sc->orphanage));
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  479  	if (!d_orphanage)
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  480  		return;
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  481  
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  482  	d_child = d_hash_and_lookup(d_orphanage, &qname);
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  483  	while (d_child != NULL) {
5316671eec5d6d Darrick J. Wong 2024-04-10  484  		trace_xrep_adoption_invalidate_child(sc->mp, d_child);
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  485  
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  486  		ASSERT(d_is_negative(d_child));
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  487  		d_invalidate(d_child);
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  488  		dput(d_child);
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  489  		d_child = d_lookup(d_orphanage, &qname);
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  490  	}
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  491  
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  492  	dput(d_orphanage);
5316671eec5d6d Darrick J. Wong 2024-04-10  493  
5316671eec5d6d Darrick J. Wong 2024-04-10  494  	/* Invalidate all the dentries pointing down to this file. */
5316671eec5d6d Darrick J. Wong 2024-04-10 @495  	while ((d_child = d_find_alias(VFS_I(sc->ip))) != NULL) {
5316671eec5d6d Darrick J. Wong 2024-04-10  496  		trace_xrep_adoption_invalidate_child(sc->mp, d_child);
5316671eec5d6d Darrick J. Wong 2024-04-10  497  
5316671eec5d6d Darrick J. Wong 2024-04-10  498  		d_invalidate(d_child);
5316671eec5d6d Darrick J. Wong 2024-04-10  499  		dput(d_child);
5316671eec5d6d Darrick J. Wong 2024-04-10  500  	}
87aff44c9e2fa9 Darrick J. Wong 2024-01-09 @501  }
87aff44c9e2fa9 Darrick J. Wong 2024-01-09  502  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
