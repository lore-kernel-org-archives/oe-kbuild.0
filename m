Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CDE289E36
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757757576; cv=none; b=Dwoula2l8csKVL0148pUeZg2SNM8ZJwZbP1YtJa8ax4ERYJcDhPanQ/4GdQw3EZHyypB0q+9FK3cBBEKX63SgDGlcFwNDSX2+X8ULtwgc/BjVB25o7dHnvK8RZgnzwSzengjX87j8UoereTSWHH+v4V6xA8K6r18xK6sAwgu+AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757757576; c=relaxed/simple;
	bh=PjmoHIJXygklQpC2w2l154zFlm3St2KmqGnvXDJLij8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FHalPBesgYogob+2tJAWz/+HQSDv1VqoAC+U9/4+51cXPDA8Cc5W2UBEALz7jJULQpMCHc1EvwYp260iCGTI5f+//hp0H3NrmXYeVa6L7nABqw1WvcXlzYaeQ9cq8dM6oa3klaEHUYCVwNHjyWmycI/Y60nEZ43j68hkcnIeU3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grhh0SiN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grhh0SiN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757757575; x=1789293575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PjmoHIJXygklQpC2w2l154zFlm3St2KmqGnvXDJLij8=;
  b=grhh0SiN3q0to6h8ki2r7xKqFuX3JzOputGcDOhty0rAVk3pwy4UD6PL
   Lm3wGEuZ28p4z7P3fKE6ORestnttLq0za0A6FYezVjSLOnK/DwFdIZihV
   cGLpZUZlZY4GYHj/5fFjn0BX1X1bySxtiKdRdlBb+l4O43Zf3rqi5BpVi
   goDP1KOPe8QWkWubdqmywGORYo4Kqv9iYNXkWZQ4v5JfG95fGTAWgYZY/
   uc7Iz2cbJfl6htrW/n0EiktMyNTFhZSV6DyFbJpIhiG29bQVeU2UAEkTP
   hxRwuL1q2twwlP7/+ftR+LPHGZw1rHogYB8jWEXm/CYEC/tGeeYnBO8Sv
   Q==;
X-CSE-ConnectionGUID: VEC8q+E1SV+ZtklA/K1MfQ==
X-CSE-MsgGUID: SWgZct2ETUiPFqiueYqrRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="59317224"
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="59317224"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 02:59:34 -0700
X-CSE-ConnectionGUID: +gJqNGKVTaGfFGxQPA1P6Q==
X-CSE-MsgGUID: KaBzAzJ0SyuBrhbQM/50nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="173485621"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 13 Sep 2025 02:59:32 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxN2Y-0001Ru-0k;
	Sat, 13 Sep 2025 09:59:30 +0000
Date: Sat, 13 Sep 2025 17:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cel:nfsd-testing 45/50] fs/nfsd/nfs4recover.c:406 purge_old()
 error: uninitialized symbol 'child'.
Message-ID: <202509131751.4STnDcZg-lkp@intel.com>
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
TO: NeilBrown <neil@brown.name>
CC: Chuck Lever <chuck.lever@oracle.com>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   454e99ac23dc63c1472eb5df8f97c961c0f178c9
commit: 30424fb94b7bea14e27922669924948d6320e991 [45/50] nfsd: move name lookup out of nfsd4_list_rec_dir()
:::::: branch date: 19 hours ago
:::::: commit date: 5 days ago
config: sparc64-randconfig-r072-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131751.4STnDcZg-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509131751.4STnDcZg-lkp@intel.com/

smatch warnings:
fs/nfsd/nfs4recover.c:406 purge_old() error: uninitialized symbol 'child'.

vim +/child +406 fs/nfsd/nfs4recover.c

c7b9a45927e74c8 NeilBrown         2005-06-23  397  
c7b9a45927e74c8 NeilBrown         2005-06-23  398  static int
30424fb94b7bea1 NeilBrown         2025-09-08  399  purge_old(struct dentry *parent, char *cname, struct nfsd_net *nn)
c7b9a45927e74c8 NeilBrown         2005-06-23  400  {
c7b9a45927e74c8 NeilBrown         2005-06-23  401  	int status;
30424fb94b7bea1 NeilBrown         2025-09-08  402  	struct dentry *child;
6b1891052a3f8e3 Scott Mayhew      2019-03-26  403  	struct xdr_netobj name;
c7b9a45927e74c8 NeilBrown         2005-06-23  404  
30424fb94b7bea1 NeilBrown         2025-09-08  405  	if (strlen(cname) != HEXDIR_LEN - 1) {
6b1891052a3f8e3 Scott Mayhew      2019-03-26 @406  		printk("%s: illegal name %pd in recovery directory\n",
6b1891052a3f8e3 Scott Mayhew      2019-03-26  407  				__func__, child);
6b1891052a3f8e3 Scott Mayhew      2019-03-26  408  		/* Keep trying; maybe the others are OK: */
b37ad28bcaa7c48 Al Viro           2006-10-19  409  		return 0;
6b1891052a3f8e3 Scott Mayhew      2019-03-26  410  	}
30424fb94b7bea1 NeilBrown         2025-09-08  411  	name.data = kstrdup(cname, GFP_KERNEL);
6b1891052a3f8e3 Scott Mayhew      2019-03-26  412  	if (!name.data) {
6b1891052a3f8e3 Scott Mayhew      2019-03-26  413  		dprintk("%s: failed to allocate memory for name.data!\n",
6b1891052a3f8e3 Scott Mayhew      2019-03-26  414  			__func__);
6b1891052a3f8e3 Scott Mayhew      2019-03-26  415  		goto out;
6b1891052a3f8e3 Scott Mayhew      2019-03-26  416  	}
6b1891052a3f8e3 Scott Mayhew      2019-03-26  417  	name.len = HEXDIR_LEN;
6b1891052a3f8e3 Scott Mayhew      2019-03-26  418  	if (nfs4_has_reclaimed_state(name, nn))
6b1891052a3f8e3 Scott Mayhew      2019-03-26  419  		goto out_free;
c7b9a45927e74c8 NeilBrown         2005-06-23  420  
30424fb94b7bea1 NeilBrown         2025-09-08  421  	inode_lock_nested(d_inode(parent), I_MUTEX_PARENT);
30424fb94b7bea1 NeilBrown         2025-09-08  422  	child = lookup_one(&nop_mnt_idmap, &QSTR(cname), parent);
30424fb94b7bea1 NeilBrown         2025-09-08  423  	if (!IS_ERR(child)) {
abf08576afe3150 Christian Brauner 2023-01-13  424  		status = vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child);
c7b9a45927e74c8 NeilBrown         2005-06-23  425  		if (status)
a6a9f18f0a9f943 Al Viro           2013-09-16  426  			printk("failed to remove client recovery directory %pd\n",
a6a9f18f0a9f943 Al Viro           2013-09-16  427  			       child);
30424fb94b7bea1 NeilBrown         2025-09-08  428  		dput(child);
30424fb94b7bea1 NeilBrown         2025-09-08  429  	}
30424fb94b7bea1 NeilBrown         2025-09-08  430  	inode_unlock(d_inode(parent));
30424fb94b7bea1 NeilBrown         2025-09-08  431  
6b1891052a3f8e3 Scott Mayhew      2019-03-26  432  out_free:
6b1891052a3f8e3 Scott Mayhew      2019-03-26  433  	kfree(name.data);
6b1891052a3f8e3 Scott Mayhew      2019-03-26  434  out:
c7b9a45927e74c8 NeilBrown         2005-06-23  435  	/* Keep trying, success or failure: */
b37ad28bcaa7c48 Al Viro           2006-10-19  436  	return 0;
c7b9a45927e74c8 NeilBrown         2005-06-23  437  }
c7b9a45927e74c8 NeilBrown         2005-06-23  438  

:::::: The code at line 406 was first introduced by commit
:::::: 6b1891052a3f8e3c3217e8512bbed2fd6252977b nfsd: make nfs4_client_reclaim use an xdr_netobj instead of a fixed char array

:::::: TO: Scott Mayhew <smayhew@redhat.com>
:::::: CC: J. Bruce Fields <bfields@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
