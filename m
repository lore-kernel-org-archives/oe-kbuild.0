Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A002E9EC7
	for <oe-kbuild@lists.linux.dev>; Fri, 22 May 2026 02:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779416227; cv=none; b=ZSLIKEMq9lf6l79FWrWUzHG0uG19mUejLikV5Q0iuPtuUFK5YivzEjiuC9ah0PkEeLHdM/cPMU9ZC8gVCvysihKUcy/7Z2YvYIiYERAP4EUI8mYRSYekLiEioMqvNc2suwmyTjQR2fDIqOwEXH8Aehj5DdV5o41tTrseH4W4VaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779416227; c=relaxed/simple;
	bh=8PI34EGgDybRrgmxkKnGgyiTPT6NfSkpKt3AS4yAJKU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MpC6SyGCSSSA/9jWOwyeL7NuC0lDKYbAzEQ4iisPL+UxpaLxzLYtJiyEsT/cUY0SYAXEBFRiPz/yRu236Qps+P6wCXU1DE0I7WgtWLrlNYzH6kq2t2eMQ7Zs25/cgyQWiS3masCarC1ejcUPrdyLusi13KnZIOsFiDqmrJnUeWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ByAo8wDM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ByAo8wDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779416224; x=1810952224;
  h=date:from:to:cc:subject:message-id;
  bh=8PI34EGgDybRrgmxkKnGgyiTPT6NfSkpKt3AS4yAJKU=;
  b=ByAo8wDMfS4etEwS6rcW0LmjKOslbSWyblsiLi207SDBG3OME3wZXNri
   RQN8+5qAw0La9pGcz0luQlnHJPOO3XExg2+GePUrXv6bFraR1Az3eMOf7
   kJglwg0yKo8NftTydbgn5q/5AxYv6K9zaONRh1lePM50lxGBxpphshkke
   Uud7GjMFukbV5ZVQjBS75jRkdtk+0IftE1gp27IUg8AVrVCFKu6OAY6OZ
   WQjjp+nE646rfX+6wbxDWRyJuYbl0dnZzn7q3bOq9sbs3D8ojv+Q7Qqcc
   VLdyyQcTo6IEtKeHhfvk4hUdTfP3CTAHFbaCCYrK9hbGrvWPLqg9RGvQq
   Q==;
X-CSE-ConnectionGUID: 1HRgyXjPTe2ZDHqrIgRF6Q==
X-CSE-MsgGUID: ZKO6teMOSQCsdJ+kJzmo/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90642967"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="90642967"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:17:04 -0700
X-CSE-ConnectionGUID: 4/dxv0QYQPKNVzJuXrGURg==
X-CSE-MsgGUID: a5yJoCu6RS6Uk5a1iARlTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="240792962"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 May 2026 19:17:03 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQFRc-000000001Zl-1N1z;
	Fri, 22 May 2026 02:17:00 +0000
Date: Fri, 22 May 2026 10:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:fuse-root-nodeid 28/49] fs/fuse/fuse_iomap.c:584
 fuse_iomap_set_inline() warn: missing unwind goto?
Message-ID: <202605221003.zJ4WCw9G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-root-nodeid
head:   e5ba64aeafff2b259cddc8f2cd0da04dab9fa9b0
commit: 309fee2fd13d726eedba13d5080b8551fefee78f [28/49] fuse: implement inline data file IO via iomap
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: powerpc-randconfig-r073-20260522 (https://download.01.org/0day-ci/archive/20260522/202605221003.zJ4WCw9G-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605221003.zJ4WCw9G-lkp@intel.com/

smatch warnings:
fs/fuse/fuse_iomap.c:584 fuse_iomap_set_inline() warn: missing unwind goto?

vim +584 fs/fuse/fuse_iomap.c

309fee2fd13d72 Darrick J. Wong 2026-02-22  544  
309fee2fd13d72 Darrick J. Wong 2026-02-22  545  /* Set up inline data buffers for iomap_begin */
309fee2fd13d72 Darrick J. Wong 2026-02-22  546  static int fuse_iomap_set_inline(struct inode *inode, unsigned opflags,
309fee2fd13d72 Darrick J. Wong 2026-02-22  547  				 loff_t pos, loff_t count,
309fee2fd13d72 Darrick J. Wong 2026-02-22  548  				 struct iomap *iomap, struct iomap *srcmap)
309fee2fd13d72 Darrick J. Wong 2026-02-22  549  {
309fee2fd13d72 Darrick J. Wong 2026-02-22  550  	int err;
309fee2fd13d72 Darrick J. Wong 2026-02-22  551  
309fee2fd13d72 Darrick J. Wong 2026-02-22  552  	if (opflags & IOMAP_REPORT)
309fee2fd13d72 Darrick J. Wong 2026-02-22  553  		return 0;
309fee2fd13d72 Darrick J. Wong 2026-02-22  554  
309fee2fd13d72 Darrick J. Wong 2026-02-22  555  	if (fuse_is_iomap_file_write(opflags)) {
309fee2fd13d72 Darrick J. Wong 2026-02-22  556  		if (iomap->type == IOMAP_INLINE) {
309fee2fd13d72 Darrick J. Wong 2026-02-22  557  			err = fuse_iomap_inline_alloc(inode, iomap);
309fee2fd13d72 Darrick J. Wong 2026-02-22  558  			if (err)
309fee2fd13d72 Darrick J. Wong 2026-02-22  559  				return err;
309fee2fd13d72 Darrick J. Wong 2026-02-22  560  		}
309fee2fd13d72 Darrick J. Wong 2026-02-22  561  
309fee2fd13d72 Darrick J. Wong 2026-02-22  562  		if (srcmap->type == IOMAP_INLINE) {
309fee2fd13d72 Darrick J. Wong 2026-02-22  563  			/* inline data read in preparation for write */
309fee2fd13d72 Darrick J. Wong 2026-02-22  564  			err = fuse_iomap_inline_alloc(inode, srcmap);
309fee2fd13d72 Darrick J. Wong 2026-02-22  565  			if (err)
309fee2fd13d72 Darrick J. Wong 2026-02-22  566  				goto out_iomap;
309fee2fd13d72 Darrick J. Wong 2026-02-22  567  
309fee2fd13d72 Darrick J. Wong 2026-02-22  568  			err = fuse_iomap_inline_read(inode, pos, count,
309fee2fd13d72 Darrick J. Wong 2026-02-22  569  						     srcmap);
309fee2fd13d72 Darrick J. Wong 2026-02-22  570  			if (err)
309fee2fd13d72 Darrick J. Wong 2026-02-22  571  				goto out_srcmap;
309fee2fd13d72 Darrick J. Wong 2026-02-22  572  		} else if (iomap->type == IOMAP_INLINE &&
309fee2fd13d72 Darrick J. Wong 2026-02-22  573  			   srcmap->type == IOMAP_HOLE) {
309fee2fd13d72 Darrick J. Wong 2026-02-22  574  			/* pure overwrite of inline data */
309fee2fd13d72 Darrick J. Wong 2026-02-22  575  			err = fuse_iomap_inline_read(inode, pos, count,
309fee2fd13d72 Darrick J. Wong 2026-02-22  576  						     iomap);
309fee2fd13d72 Darrick J. Wong 2026-02-22  577  			if (err)
309fee2fd13d72 Darrick J. Wong 2026-02-22  578  				goto out_iomap;
309fee2fd13d72 Darrick J. Wong 2026-02-22  579  		}
309fee2fd13d72 Darrick J. Wong 2026-02-22  580  	} else if (iomap->type == IOMAP_INLINE) {
309fee2fd13d72 Darrick J. Wong 2026-02-22  581  		/* inline data read */
309fee2fd13d72 Darrick J. Wong 2026-02-22  582  		err = fuse_iomap_inline_alloc(inode, iomap);
309fee2fd13d72 Darrick J. Wong 2026-02-22  583  		if (err)
309fee2fd13d72 Darrick J. Wong 2026-02-22 @584  			return err;
309fee2fd13d72 Darrick J. Wong 2026-02-22  585  
309fee2fd13d72 Darrick J. Wong 2026-02-22  586  		err = fuse_iomap_inline_read(inode, pos, count, iomap);
309fee2fd13d72 Darrick J. Wong 2026-02-22  587  		if (err)
309fee2fd13d72 Darrick J. Wong 2026-02-22  588  			goto out_iomap;
309fee2fd13d72 Darrick J. Wong 2026-02-22  589  	}
309fee2fd13d72 Darrick J. Wong 2026-02-22  590  
309fee2fd13d72 Darrick J. Wong 2026-02-22  591  	return 0;
309fee2fd13d72 Darrick J. Wong 2026-02-22  592  
309fee2fd13d72 Darrick J. Wong 2026-02-22  593  out_srcmap:
309fee2fd13d72 Darrick J. Wong 2026-02-22  594  	fuse_iomap_inline_free(srcmap);
309fee2fd13d72 Darrick J. Wong 2026-02-22  595  out_iomap:
309fee2fd13d72 Darrick J. Wong 2026-02-22  596  	fuse_iomap_inline_free(iomap);
309fee2fd13d72 Darrick J. Wong 2026-02-22  597  	return err;
309fee2fd13d72 Darrick J. Wong 2026-02-22  598  }
309fee2fd13d72 Darrick J. Wong 2026-02-22  599  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
