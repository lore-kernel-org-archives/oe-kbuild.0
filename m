Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B612F23A9AD
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Feb 2026 03:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770955095; cv=none; b=pXCIge3XjMJJZtEtenl0aKUlSJf3z55ChYd0Gu2/dL65G/BnoyoHfqkRYu2dDmzmhsBayHr88pjmiv9vHx5GuX+bZGf0hXHLjfBFEvWY0YyMNrSEgObrPnDpWTd2tHFvV8TXKiwd/72WikqkUFDgqL12uTI0xkj8ecQEtN0jYAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770955095; c=relaxed/simple;
	bh=7y+WDlhqhc84YwmI7wP2feg6lew41CglAVw/WWYyJ7I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FBI2dPOYY24vh96asSA8Rj38PE6FBzAotYsVg0/LCPDGUSghDJaUZ670Q1RxE2J/gFma4o5OBdWZvkS+ys5COePOI0sua+nxZQM5lP+fQDDtvuR6Qp9IVRSvayZKUqoKKJxGhNauc7spy8FVuXFsrn4Nd6w3M11FNQPfMHouXaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DymlXOM4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DymlXOM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770955094; x=1802491094;
  h=date:from:to:cc:subject:message-id;
  bh=7y+WDlhqhc84YwmI7wP2feg6lew41CglAVw/WWYyJ7I=;
  b=DymlXOM4P2/cIQduwYRzxcjrsp7rSY3N0+LfE4eELjS1EBfCRc8lgTee
   zwxFR2pm3Nt2hOwCNSTMGVizHr1ikI7S3ZypcTRQt0cPKgeJiPSvodRpl
   R6DG7u12hk0PgKPcIRD0SgGt8axfJyqfqmMWc/wU91DKfNvRDmQkI/6ZG
   X/QF6oDROdPKP5vUB11q5Epl5Mcyn77NH+NardqLjux9UhxKcUHqjrl8H
   Se0GXBEJthwrCs1EDqSUzjkSzgxQL3Ep6ECfmIERJdXkXd5b1PRshIC/J
   sAEcxSHR5WIjRp9x2CanKU+Zi5yt9X+/FCw3YOkQUTyQXF9frckFAnTtQ
   w==;
X-CSE-ConnectionGUID: x834rxN1RBKWpoXEuVXOqg==
X-CSE-MsgGUID: RgaMNhtmR3Soa1BcRwUlJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83235482"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="83235482"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 19:58:14 -0800
X-CSE-ConnectionGUID: nu3sc5LHTViGnFn1jdtvxA==
X-CSE-MsgGUID: kgtDV7zTS/OZjVCDwx14yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="235783985"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Feb 2026 19:58:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqkJl-00000000v1w-3SSs;
	Fri, 13 Feb 2026 03:58:09 +0000
Date: Fri, 13 Feb 2026 11:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.xattr.socket 4/15]
 fs/kernfs/inode.c:326 kernfs_xattr_set() warn: passing zero to 'PTR_ERR'
Message-ID: <202602131125.RYCkZZz8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.xattr.socket
head:   71497e95abd2418d5b924ce01a3c395b9fa08932
commit: b83158f757eac1bea50a3b8274f811d1ecc0faed [4/15] kernfs: adapt to rhashtable-based simple_xattrs with lazy allocation
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: m68k-randconfig-r073-20260213 (https://download.01.org/0day-ci/archive/20260213/202602131125.RYCkZZz8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602131125.RYCkZZz8-lkp@intel.com/

smatch warnings:
fs/kernfs/inode.c:326 kernfs_xattr_set() warn: passing zero to 'PTR_ERR'
fs/kernfs/inode.c:441 kernfs_vfs_user_xattr_set() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +326 fs/kernfs/inode.c

e72a1a8b3a5a2a Andreas Gruenbacher 2016-09-29  312  
1537ad15c9c59c Ondrej Mosnacek     2019-04-03  313  int kernfs_xattr_set(struct kernfs_node *kn, const char *name,
b230d5aba2d1a7 Ondrej Mosnacek     2019-02-22  314  		     const void *value, size_t size, int flags)
e72a1a8b3a5a2a Andreas Gruenbacher 2016-09-29  315  {
5de75970c9fd72 Hugh Dickins        2023-08-08  316  	struct simple_xattr *old_xattr;
b83158f757eac1 Christian Brauner   2026-02-10  317  	struct simple_xattrs *xattrs;
d1f4e9026007d5 Christian Brauner   2025-06-22  318  	struct kernfs_iattrs *attrs;
d1f4e9026007d5 Christian Brauner   2025-06-22  319  
d1f4e9026007d5 Christian Brauner   2025-06-22  320  	attrs = kernfs_iattrs(kn);
e72a1a8b3a5a2a Andreas Gruenbacher 2016-09-29  321  	if (!attrs)
e72a1a8b3a5a2a Andreas Gruenbacher 2016-09-29  322  		return -ENOMEM;
e72a1a8b3a5a2a Andreas Gruenbacher 2016-09-29  323  
b83158f757eac1 Christian Brauner   2026-02-10  324  	xattrs = simple_xattrs_lazy_alloc(&attrs->xattrs, value, flags);
b83158f757eac1 Christian Brauner   2026-02-10  325  	if (IS_ERR_OR_NULL(xattrs))
b83158f757eac1 Christian Brauner   2026-02-10 @326  		return PTR_ERR(xattrs);
b83158f757eac1 Christian Brauner   2026-02-10  327  
b83158f757eac1 Christian Brauner   2026-02-10  328  	old_xattr = simple_xattr_set(xattrs, name, value, size, flags);
5de75970c9fd72 Hugh Dickins        2023-08-08  329  	if (IS_ERR(old_xattr))
5de75970c9fd72 Hugh Dickins        2023-08-08  330  		return PTR_ERR(old_xattr);
5de75970c9fd72 Hugh Dickins        2023-08-08  331  
b83158f757eac1 Christian Brauner   2026-02-10  332  	simple_xattr_free_rcu(old_xattr);
5de75970c9fd72 Hugh Dickins        2023-08-08  333  	return 0;
e72a1a8b3a5a2a Andreas Gruenbacher 2016-09-29  334  }
e72a1a8b3a5a2a Andreas Gruenbacher 2016-09-29  335  
1537ad15c9c59c Ondrej Mosnacek     2019-04-03  336  static int kernfs_vfs_xattr_get(const struct xattr_handler *handler,
b230d5aba2d1a7 Ondrej Mosnacek     2019-02-22  337  				struct dentry *unused, struct inode *inode,
b230d5aba2d1a7 Ondrej Mosnacek     2019-02-22  338  				const char *suffix, void *value, size_t size)
b230d5aba2d1a7 Ondrej Mosnacek     2019-02-22  339  {
1537ad15c9c59c Ondrej Mosnacek     2019-04-03  340  	const char *name = xattr_full_name(handler, suffix);
b230d5aba2d1a7 Ondrej Mosnacek     2019-02-22  341  	struct kernfs_node *kn = inode->i_private;
b230d5aba2d1a7 Ondrej Mosnacek     2019-02-22  342  
1537ad15c9c59c Ondrej Mosnacek     2019-04-03  343  	return kernfs_xattr_get(kn, name, value, size);
b230d5aba2d1a7 Ondrej Mosnacek     2019-02-22  344  }
b230d5aba2d1a7 Ondrej Mosnacek     2019-02-22  345  
1537ad15c9c59c Ondrej Mosnacek     2019-04-03  346  static int kernfs_vfs_xattr_set(const struct xattr_handler *handler,
39f60c1ccee72c Christian Brauner   2023-01-13  347  				struct mnt_idmap *idmap,
b230d5aba2d1a7 Ondrej Mosnacek     2019-02-22  348  				struct dentry *unused, struct inode *inode,
b230d5aba2d1a7 Ondrej Mosnacek     2019-02-22  349  				const char *suffix, const void *value,
b230d5aba2d1a7 Ondrej Mosnacek     2019-02-22  350  				size_t size, int flags)
b230d5aba2d1a7 Ondrej Mosnacek     2019-02-22  351  {
1537ad15c9c59c Ondrej Mosnacek     2019-04-03  352  	const char *name = xattr_full_name(handler, suffix);
b230d5aba2d1a7 Ondrej Mosnacek     2019-02-22  353  	struct kernfs_node *kn = inode->i_private;
b230d5aba2d1a7 Ondrej Mosnacek     2019-02-22  354  
1537ad15c9c59c Ondrej Mosnacek     2019-04-03  355  	return kernfs_xattr_set(kn, name, value, size, flags);
b230d5aba2d1a7 Ondrej Mosnacek     2019-02-22  356  }
b230d5aba2d1a7 Ondrej Mosnacek     2019-02-22  357  
0c47383ba3bd10 Daniel Xu           2020-03-12  358  static int kernfs_vfs_user_xattr_add(struct kernfs_node *kn,
0c47383ba3bd10 Daniel Xu           2020-03-12  359  				     const char *full_name,
0c47383ba3bd10 Daniel Xu           2020-03-12  360  				     struct simple_xattrs *xattrs,
0c47383ba3bd10 Daniel Xu           2020-03-12  361  				     const void *value, size_t size, int flags)
0c47383ba3bd10 Daniel Xu           2020-03-12  362  {
d1f4e9026007d5 Christian Brauner   2025-06-22  363  	struct kernfs_iattrs *attr = kernfs_iattrs_noalloc(kn);
d1f4e9026007d5 Christian Brauner   2025-06-22  364  	atomic_t *sz = &attr->user_xattr_size;
d1f4e9026007d5 Christian Brauner   2025-06-22  365  	atomic_t *nr = &attr->nr_user_xattrs;
5de75970c9fd72 Hugh Dickins        2023-08-08  366  	struct simple_xattr *old_xattr;
0c47383ba3bd10 Daniel Xu           2020-03-12  367  	int ret;
0c47383ba3bd10 Daniel Xu           2020-03-12  368  
0c47383ba3bd10 Daniel Xu           2020-03-12  369  	if (atomic_inc_return(nr) > KERNFS_MAX_USER_XATTRS) {
0c47383ba3bd10 Daniel Xu           2020-03-12  370  		ret = -ENOSPC;
0c47383ba3bd10 Daniel Xu           2020-03-12  371  		goto dec_count_out;
0c47383ba3bd10 Daniel Xu           2020-03-12  372  	}
0c47383ba3bd10 Daniel Xu           2020-03-12  373  
0c47383ba3bd10 Daniel Xu           2020-03-12  374  	if (atomic_add_return(size, sz) > KERNFS_USER_XATTR_SIZE_LIMIT) {
0c47383ba3bd10 Daniel Xu           2020-03-12  375  		ret = -ENOSPC;
0c47383ba3bd10 Daniel Xu           2020-03-12  376  		goto dec_size_out;
0c47383ba3bd10 Daniel Xu           2020-03-12  377  	}
0c47383ba3bd10 Daniel Xu           2020-03-12  378  
5de75970c9fd72 Hugh Dickins        2023-08-08  379  	old_xattr = simple_xattr_set(xattrs, full_name, value, size, flags);
5de75970c9fd72 Hugh Dickins        2023-08-08  380  	if (!old_xattr)
0c47383ba3bd10 Daniel Xu           2020-03-12  381  		return 0;
5de75970c9fd72 Hugh Dickins        2023-08-08  382  
5de75970c9fd72 Hugh Dickins        2023-08-08  383  	if (IS_ERR(old_xattr)) {
5de75970c9fd72 Hugh Dickins        2023-08-08  384  		ret = PTR_ERR(old_xattr);
5de75970c9fd72 Hugh Dickins        2023-08-08  385  		goto dec_size_out;
5de75970c9fd72 Hugh Dickins        2023-08-08  386  	}
5de75970c9fd72 Hugh Dickins        2023-08-08  387  
5de75970c9fd72 Hugh Dickins        2023-08-08  388  	ret = 0;
5de75970c9fd72 Hugh Dickins        2023-08-08  389  	size = old_xattr->size;
b83158f757eac1 Christian Brauner   2026-02-10  390  	simple_xattr_free_rcu(old_xattr);
0c47383ba3bd10 Daniel Xu           2020-03-12  391  dec_size_out:
0c47383ba3bd10 Daniel Xu           2020-03-12  392  	atomic_sub(size, sz);
0c47383ba3bd10 Daniel Xu           2020-03-12  393  dec_count_out:
0c47383ba3bd10 Daniel Xu           2020-03-12  394  	atomic_dec(nr);
0c47383ba3bd10 Daniel Xu           2020-03-12  395  	return ret;
0c47383ba3bd10 Daniel Xu           2020-03-12  396  }
0c47383ba3bd10 Daniel Xu           2020-03-12  397  
0c47383ba3bd10 Daniel Xu           2020-03-12  398  static int kernfs_vfs_user_xattr_rm(struct kernfs_node *kn,
0c47383ba3bd10 Daniel Xu           2020-03-12  399  				    const char *full_name,
0c47383ba3bd10 Daniel Xu           2020-03-12  400  				    struct simple_xattrs *xattrs,
0c47383ba3bd10 Daniel Xu           2020-03-12  401  				    const void *value, size_t size, int flags)
0c47383ba3bd10 Daniel Xu           2020-03-12  402  {
d1f4e9026007d5 Christian Brauner   2025-06-22  403  	struct kernfs_iattrs *attr = kernfs_iattrs_noalloc(kn);
d1f4e9026007d5 Christian Brauner   2025-06-22  404  	atomic_t *sz = &attr->user_xattr_size;
d1f4e9026007d5 Christian Brauner   2025-06-22  405  	atomic_t *nr = &attr->nr_user_xattrs;
5de75970c9fd72 Hugh Dickins        2023-08-08  406  	struct simple_xattr *old_xattr;
0c47383ba3bd10 Daniel Xu           2020-03-12  407  
5de75970c9fd72 Hugh Dickins        2023-08-08  408  	old_xattr = simple_xattr_set(xattrs, full_name, value, size, flags);
5de75970c9fd72 Hugh Dickins        2023-08-08  409  	if (!old_xattr)
5de75970c9fd72 Hugh Dickins        2023-08-08  410  		return 0;
0c47383ba3bd10 Daniel Xu           2020-03-12  411  
5de75970c9fd72 Hugh Dickins        2023-08-08  412  	if (IS_ERR(old_xattr))
5de75970c9fd72 Hugh Dickins        2023-08-08  413  		return PTR_ERR(old_xattr);
0c47383ba3bd10 Daniel Xu           2020-03-12  414  
5de75970c9fd72 Hugh Dickins        2023-08-08  415  	atomic_sub(old_xattr->size, sz);
5de75970c9fd72 Hugh Dickins        2023-08-08  416  	atomic_dec(nr);
b83158f757eac1 Christian Brauner   2026-02-10  417  	simple_xattr_free_rcu(old_xattr);
5de75970c9fd72 Hugh Dickins        2023-08-08  418  	return 0;
0c47383ba3bd10 Daniel Xu           2020-03-12  419  }
0c47383ba3bd10 Daniel Xu           2020-03-12  420  
0c47383ba3bd10 Daniel Xu           2020-03-12  421  static int kernfs_vfs_user_xattr_set(const struct xattr_handler *handler,
39f60c1ccee72c Christian Brauner   2023-01-13  422  				     struct mnt_idmap *idmap,
0c47383ba3bd10 Daniel Xu           2020-03-12  423  				     struct dentry *unused, struct inode *inode,
0c47383ba3bd10 Daniel Xu           2020-03-12  424  				     const char *suffix, const void *value,
0c47383ba3bd10 Daniel Xu           2020-03-12  425  				     size_t size, int flags)
0c47383ba3bd10 Daniel Xu           2020-03-12  426  {
0c47383ba3bd10 Daniel Xu           2020-03-12  427  	const char *full_name = xattr_full_name(handler, suffix);
0c47383ba3bd10 Daniel Xu           2020-03-12  428  	struct kernfs_node *kn = inode->i_private;
b83158f757eac1 Christian Brauner   2026-02-10  429  	struct simple_xattrs *xattrs;
0c47383ba3bd10 Daniel Xu           2020-03-12  430  	struct kernfs_iattrs *attrs;
0c47383ba3bd10 Daniel Xu           2020-03-12  431  
0c47383ba3bd10 Daniel Xu           2020-03-12  432  	if (!(kernfs_root(kn)->flags & KERNFS_ROOT_SUPPORT_USER_XATTR))
0c47383ba3bd10 Daniel Xu           2020-03-12  433  		return -EOPNOTSUPP;
0c47383ba3bd10 Daniel Xu           2020-03-12  434  
0c47383ba3bd10 Daniel Xu           2020-03-12  435  	attrs = kernfs_iattrs(kn);
0c47383ba3bd10 Daniel Xu           2020-03-12  436  	if (!attrs)
0c47383ba3bd10 Daniel Xu           2020-03-12  437  		return -ENOMEM;
0c47383ba3bd10 Daniel Xu           2020-03-12  438  
b83158f757eac1 Christian Brauner   2026-02-10  439  	xattrs = simple_xattrs_lazy_alloc(&attrs->xattrs, value, flags);
b83158f757eac1 Christian Brauner   2026-02-10  440  	if (IS_ERR_OR_NULL(xattrs))
b83158f757eac1 Christian Brauner   2026-02-10 @441  		return PTR_ERR(xattrs);
b83158f757eac1 Christian Brauner   2026-02-10  442  
0c47383ba3bd10 Daniel Xu           2020-03-12  443  	if (value)
b83158f757eac1 Christian Brauner   2026-02-10  444  		return kernfs_vfs_user_xattr_add(kn, full_name, xattrs,
0c47383ba3bd10 Daniel Xu           2020-03-12  445  						 value, size, flags);
0c47383ba3bd10 Daniel Xu           2020-03-12  446  	else
b83158f757eac1 Christian Brauner   2026-02-10  447  		return kernfs_vfs_user_xattr_rm(kn, full_name, xattrs,
0c47383ba3bd10 Daniel Xu           2020-03-12  448  						value, size, flags);
0c47383ba3bd10 Daniel Xu           2020-03-12  449  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
