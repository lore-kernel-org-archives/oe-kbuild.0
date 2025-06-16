Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BC08488
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Jun 2025 14:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082654; cv=none; b=MbSrNSExbqTsOmCJgI3kler0wr5xq1UXkm41AjI2ff2nINNDHOqqKsStsYwADKFD5ClsW45B1Ox06iFn7Yi2RQQd9FRsLWQLlQGEkTEcr6fC/HZ3lAZ7rf7SJKSq29T4kkMB+nUbN2vIJuo2sl9+rhLU+wvBYTwHfjV8Iww2o98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082654; c=relaxed/simple;
	bh=zeMFsNJOEJMdtSChFb3SYCBauyw1p0MghqVPg/WOmLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RA3tA5Y1RcmhsBHnld38XTFSCj/tEeXjfFFmZRI2leTMycQmymOCz4ukJ9dShzGWLWEhWuZ+0dB71O6ULPoYbpaEXMGfRZIEsWaF/VSjBaDyBDkrbwu+WBb7SSYo77Yv1wfNB1V2DAOziqAkqe2itZPM7DvcsW58LysM87gNYGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6/DlWJc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6/DlWJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750082652; x=1781618652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zeMFsNJOEJMdtSChFb3SYCBauyw1p0MghqVPg/WOmLw=;
  b=j6/DlWJckV2Nggh4cnIHLTd2D4q5QUYkTGNBCTo6hd+qCQBxiYmRlL/S
   3Fd0aGOuM/NSSgOeZjuejxsE01jbHlZjNIsx3RBPqyINlEqk62E8KOCff
   95CNF1CF79fy7YFguusLckBQjYG+x+LD/CqhrQN1eP7nQ3eZv2hCic7i5
   8NrtzZmPW/09JxzHQyUl1xBTuRXseeWAWj1aso+n1xyxm5p/BqLoqaLpi
   SKAA5UOfn1yjCVtdEnf7+WNO6UOMX+Gn9ofibLX0/GAQ0r7+UCFh4DRFF
   jub3yzGodHEgIQ7RuDOh6arNUjk7vz7qc5sJoW1opaJeHbTnr7FsDEom5
   w==;
X-CSE-ConnectionGUID: rV72VbQ1R6idNy/LHmNYlQ==
X-CSE-MsgGUID: 1YAkj82cToGfdd6hTa7qGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63259873"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="63259873"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 07:04:10 -0700
X-CSE-ConnectionGUID: DDgpvq2uS0ejdKTgX1StLw==
X-CSE-MsgGUID: ynP8o1P+S8u+XolnMCI4mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148853029"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Jun 2025 07:04:09 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRARS-000F4C-30;
	Mon, 16 Jun 2025 14:04:06 +0000
Date: Mon, 16 Jun 2025 22:03:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1665/2828] fs/dcache.c:3015 d_splice_alias_ops()
 warn: inconsistent returns '&inode->i_lock'.
Message-ID: <202506162154.z0OrePAP-lkp@intel.com>
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
TO: Al Viro <viro@zeniv.linux.org.uk>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   050f8ad7b58d9079455af171ac279c4b9b828c11
commit: 790fa81b8c43cda9fe25c1b564d0afe3ddeeb370 [1665/2828] new helper: d_splice_alias_ops()
:::::: branch date: 8 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-161-20250616 (https://download.01.org/0day-ci/archive/20250616/202506162154.z0OrePAP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506162154.z0OrePAP-lkp@intel.com/

smatch warnings:
fs/dcache.c:3015 d_splice_alias_ops() warn: inconsistent returns '&inode->i_lock'.

vim +3015 fs/dcache.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  2966  
790fa81b8c43cd Al Viro           2025-02-24  2967  struct dentry *d_splice_alias_ops(struct inode *inode, struct dentry *dentry,
790fa81b8c43cd Al Viro           2025-02-24  2968  				  const struct dentry_operations *ops)
3f70bd51cb4405 J. Bruce Fields   2014-02-18  2969  {
3f70bd51cb4405 J. Bruce Fields   2014-02-18  2970  	if (IS_ERR(inode))
3f70bd51cb4405 J. Bruce Fields   2014-02-18  2971  		return ERR_CAST(inode);
3f70bd51cb4405 J. Bruce Fields   2014-02-18  2972  
770bfad846ab66 David Howells     2006-08-22  2973  	BUG_ON(!d_unhashed(dentry));
770bfad846ab66 David Howells     2006-08-22  2974  
de689f5e366373 Al Viro           2016-03-09  2975  	if (!inode)
b5ae6b15bd73e3 Al Viro           2014-10-12  2976  		goto out;
de689f5e366373 Al Viro           2016-03-09  2977  
b96809173e94ea Al Viro           2016-04-11  2978  	security_d_instantiate(dentry, inode);
873feea09ebc98 Nicholas Piggin   2011-01-07  2979  	spin_lock(&inode->i_lock);
9eaef27b36a6b7 Trond Myklebust   2006-10-21  2980  	if (S_ISDIR(inode->i_mode)) {
b5ae6b15bd73e3 Al Viro           2014-10-12  2981  		struct dentry *new = __d_find_any_alias(inode);
b5ae6b15bd73e3 Al Viro           2014-10-12  2982  		if (unlikely(new)) {
a03e283bf5c3d4 Eric W. Biederman 2015-08-15  2983  			/* The reference to new ensures it remains an alias */
a03e283bf5c3d4 Eric W. Biederman 2015-08-15  2984  			spin_unlock(&inode->i_lock);
1836750115f20b Al Viro           2011-07-12  2985  			write_seqlock(&rename_lock);
b5ae6b15bd73e3 Al Viro           2014-10-12  2986  			if (unlikely(d_ancestor(new, dentry))) {
1836750115f20b Al Viro           2011-07-12  2987  				write_sequnlock(&rename_lock);
b5ae6b15bd73e3 Al Viro           2014-10-12  2988  				dput(new);
b5ae6b15bd73e3 Al Viro           2014-10-12  2989  				new = ERR_PTR(-ELOOP);
dd179946db2493 David Howells     2011-08-16  2990  				pr_warn_ratelimited(
dd179946db2493 David Howells     2011-08-16  2991  					"VFS: Lookup of '%s' in %s %s"
dd179946db2493 David Howells     2011-08-16  2992  					" would have caused loop\n",
dd179946db2493 David Howells     2011-08-16  2993  					dentry->d_name.name,
dd179946db2493 David Howells     2011-08-16  2994  					inode->i_sb->s_type->name,
dd179946db2493 David Howells     2011-08-16  2995  					inode->i_sb->s_id);
b5ae6b15bd73e3 Al Viro           2014-10-12  2996  			} else if (!IS_ROOT(new)) {
076515fc926793 Al Viro           2018-03-10  2997  				struct dentry *old_parent = dget(new->d_parent);
ef69f0506d8f3a Al Viro           2023-11-23  2998  				int err = __d_unalias(dentry, new);
b5ae6b15bd73e3 Al Viro           2014-10-12  2999  				write_sequnlock(&rename_lock);
b5ae6b15bd73e3 Al Viro           2014-10-12  3000  				if (err) {
b5ae6b15bd73e3 Al Viro           2014-10-12  3001  					dput(new);
b5ae6b15bd73e3 Al Viro           2014-10-12  3002  					new = ERR_PTR(err);
dd179946db2493 David Howells     2011-08-16  3003  				}
076515fc926793 Al Viro           2018-03-10  3004  				dput(old_parent);
b5ae6b15bd73e3 Al Viro           2014-10-12  3005  			} else {
b5ae6b15bd73e3 Al Viro           2014-10-12  3006  				__d_move(new, dentry, false);
b5ae6b15bd73e3 Al Viro           2014-10-12  3007  				write_sequnlock(&rename_lock);
9eaef27b36a6b7 Trond Myklebust   2006-10-21  3008  			}
b5ae6b15bd73e3 Al Viro           2014-10-12  3009  			iput(inode);
b5ae6b15bd73e3 Al Viro           2014-10-12  3010  			return new;
770bfad846ab66 David Howells     2006-08-22  3011  		}
b5ae6b15bd73e3 Al Viro           2014-10-12  3012  	}
b5ae6b15bd73e3 Al Viro           2014-10-12  3013  out:
790fa81b8c43cd Al Viro           2025-02-24  3014  	__d_add(dentry, inode, ops);
770bfad846ab66 David Howells     2006-08-22 @3015  	return NULL;
770bfad846ab66 David Howells     2006-08-22  3016  }
790fa81b8c43cd Al Viro           2025-02-24  3017  

:::::: The code at line 3015 was first introduced by commit
:::::: 770bfad846ab6628444428467b11fa6773ae9ea1 NFS: Add dentry materialisation op

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Trond Myklebust <Trond.Myklebust@netapp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
