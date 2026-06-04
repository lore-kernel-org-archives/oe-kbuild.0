Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B843B2FFB
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jun 2026 04:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780547387; cv=none; b=O1pzc7HhkKUoEMHhgwWYJWM+rDbYIjnfujI+RlMZ7dXyY4h+KdCslDdddYTUC8yHHasIScO+RrRG0jhUXk/jzQQDJojEI3VOjypUKTcq6AeCSvhaCf7e193ogZVU+Y2gRx3d23yI+mKpGd3ESLZCY2B4N0YM3loibxD5WVX3SRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780547387; c=relaxed/simple;
	bh=jHrl36CUuXpOrssM4sudTOb5PGHQx4OeTnHad1ogSng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mR/J0tFeBWvn3TOJfhafDrchYtPRxRUPo08lueCK9TfGMNVHh1hbA3tFTkGeL87IqB4Sz0ST6Eo5tJ6qINVqr3x1bWrjbOZfh1VY1G1xXzX38vS9w45M2JhdBN1GvKzccoIr3lR2GtEZmkIBMdZ2amz0baE7JZoPubExP4T98pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DICL+17t; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DICL+17t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780547386; x=1812083386;
  h=date:from:to:cc:subject:message-id;
  bh=jHrl36CUuXpOrssM4sudTOb5PGHQx4OeTnHad1ogSng=;
  b=DICL+17tDDGCzhxwomlZjRvNcA1L+c6URRL/nyBmat2W3PtOIOOVCHJI
   oLElm2ZetaQ4Yn9YrQ5MKhXQiz3iediFD6Zz5abXWm+BukBpYVG2YLSr8
   75kGFsu3RUPNvCCi9ClZuiV9uwmQ9epfHznjdcp3XCWD1Bzu1pG7DjDf+
   ho9nZrcMjOEFGNKkGwVK2iikCvJgBXl1OkFj157PvXHLxuaIVxlsyyFZZ
   ThhVzY4F/0OH+HRwT2dXa5XrJIDhvWj5JWt57KQUR74KsEz1TwBv6vM5r
   5DQJ5NU+yPIX2fuL5Aiungf9la33K9hRqgjQDwtXBifCd4FYPTRUYB16L
   w==;
X-CSE-ConnectionGUID: b/QwNRfaSFW8qdcbTRDZBg==
X-CSE-MsgGUID: XWvnID3oR5+3h3kqQcanpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="80404499"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="80404499"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 21:29:45 -0700
X-CSE-ConnectionGUID: Ed+usbEpTw+6vumNrFVI+g==
X-CSE-MsgGUID: 1Bz077aRR3K6b04e1XqtBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="268343338"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jun 2026 21:29:44 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUziA-00000000EHG-0fqV;
	Thu, 04 Jun 2026 04:29:42 +0000
Date: Thu, 04 Jun 2026 12:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/dcache.c:3015 d_splice_alias_ops() warn: inconsistent
 returns '&inode->i_lock'.
Message-ID: <202606041231.bOWVxyfp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Al Viro <viro@zeniv.linux.org.uk>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
commit: 790fa81b8c43cda9fe25c1b564d0afe3ddeeb370 new helper: d_splice_alias_ops()
date:   12 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 12 months ago
config: sparc-randconfig-r073-20260604 (https://download.01.org/0day-ci/archive/20260604/202606041231.bOWVxyfp-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 790fa81b8c43 ("new helper: d_splice_alias_ops()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606041231.bOWVxyfp-lkp@intel.com/

smatch warnings:
fs/dcache.c:3015 d_splice_alias_ops() warn: inconsistent returns '&inode->i_lock'.

vim +3015 fs/dcache.c

^1da177e4c3f415 Linus Torvalds    2005-04-16  2966  
790fa81b8c43cda Al Viro           2025-02-24  2967  struct dentry *d_splice_alias_ops(struct inode *inode, struct dentry *dentry,
790fa81b8c43cda Al Viro           2025-02-24  2968  				  const struct dentry_operations *ops)
3f70bd51cb4405d J. Bruce Fields   2014-02-18  2969  {
3f70bd51cb4405d J. Bruce Fields   2014-02-18  2970  	if (IS_ERR(inode))
3f70bd51cb4405d J. Bruce Fields   2014-02-18  2971  		return ERR_CAST(inode);
3f70bd51cb4405d J. Bruce Fields   2014-02-18  2972  
770bfad846ab662 David Howells     2006-08-22  2973  	BUG_ON(!d_unhashed(dentry));
770bfad846ab662 David Howells     2006-08-22  2974  
de689f5e3663736 Al Viro           2016-03-09  2975  	if (!inode)
b5ae6b15bd73e35 Al Viro           2014-10-12  2976  		goto out;
de689f5e3663736 Al Viro           2016-03-09  2977  
b96809173e94ea2 Al Viro           2016-04-11  2978  	security_d_instantiate(dentry, inode);
873feea09ebc980 Nicholas Piggin   2011-01-07  2979  	spin_lock(&inode->i_lock);
9eaef27b36a6b71 Trond Myklebust   2006-10-21  2980  	if (S_ISDIR(inode->i_mode)) {
b5ae6b15bd73e35 Al Viro           2014-10-12  2981  		struct dentry *new = __d_find_any_alias(inode);
b5ae6b15bd73e35 Al Viro           2014-10-12  2982  		if (unlikely(new)) {
a03e283bf5c3d48 Eric W. Biederman 2015-08-15  2983  			/* The reference to new ensures it remains an alias */
a03e283bf5c3d48 Eric W. Biederman 2015-08-15  2984  			spin_unlock(&inode->i_lock);
1836750115f20b7 Al Viro           2011-07-12  2985  			write_seqlock(&rename_lock);
b5ae6b15bd73e35 Al Viro           2014-10-12  2986  			if (unlikely(d_ancestor(new, dentry))) {
1836750115f20b7 Al Viro           2011-07-12  2987  				write_sequnlock(&rename_lock);
b5ae6b15bd73e35 Al Viro           2014-10-12  2988  				dput(new);
b5ae6b15bd73e35 Al Viro           2014-10-12  2989  				new = ERR_PTR(-ELOOP);
dd179946db24936 David Howells     2011-08-16  2990  				pr_warn_ratelimited(
dd179946db24936 David Howells     2011-08-16  2991  					"VFS: Lookup of '%s' in %s %s"
dd179946db24936 David Howells     2011-08-16  2992  					" would have caused loop\n",
dd179946db24936 David Howells     2011-08-16  2993  					dentry->d_name.name,
dd179946db24936 David Howells     2011-08-16  2994  					inode->i_sb->s_type->name,
dd179946db24936 David Howells     2011-08-16  2995  					inode->i_sb->s_id);
b5ae6b15bd73e35 Al Viro           2014-10-12  2996  			} else if (!IS_ROOT(new)) {
076515fc926793e Al Viro           2018-03-10  2997  				struct dentry *old_parent = dget(new->d_parent);
ef69f0506d8f3a2 Al Viro           2023-11-23  2998  				int err = __d_unalias(dentry, new);
b5ae6b15bd73e35 Al Viro           2014-10-12  2999  				write_sequnlock(&rename_lock);
b5ae6b15bd73e35 Al Viro           2014-10-12  3000  				if (err) {
b5ae6b15bd73e35 Al Viro           2014-10-12  3001  					dput(new);
b5ae6b15bd73e35 Al Viro           2014-10-12  3002  					new = ERR_PTR(err);
dd179946db24936 David Howells     2011-08-16  3003  				}
076515fc926793e Al Viro           2018-03-10  3004  				dput(old_parent);
b5ae6b15bd73e35 Al Viro           2014-10-12  3005  			} else {
b5ae6b15bd73e35 Al Viro           2014-10-12  3006  				__d_move(new, dentry, false);
b5ae6b15bd73e35 Al Viro           2014-10-12  3007  				write_sequnlock(&rename_lock);
9eaef27b36a6b71 Trond Myklebust   2006-10-21  3008  			}
b5ae6b15bd73e35 Al Viro           2014-10-12  3009  			iput(inode);
b5ae6b15bd73e35 Al Viro           2014-10-12  3010  			return new;
770bfad846ab662 David Howells     2006-08-22  3011  		}
b5ae6b15bd73e35 Al Viro           2014-10-12  3012  	}
b5ae6b15bd73e35 Al Viro           2014-10-12  3013  out:
790fa81b8c43cda Al Viro           2025-02-24  3014  	__d_add(dentry, inode, ops);
770bfad846ab662 David Howells     2006-08-22 @3015  	return NULL;
770bfad846ab662 David Howells     2006-08-22  3016  }
790fa81b8c43cda Al Viro           2025-02-24  3017  

:::::: The code at line 3015 was first introduced by commit
:::::: 770bfad846ab6628444428467b11fa6773ae9ea1 NFS: Add dentry materialisation op

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Trond Myklebust <Trond.Myklebust@netapp.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
