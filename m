Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082AABE79
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGBrxz49"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702219175; x=1733755175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9oDod8MjhgEjfCxBvGNvd0gY/a5o8NoBI6Y34RtDR7s=;
  b=AGBrxz49MLFLvs2999Qurw8eM2UNs3GQ6fJGyCZtsauAzDKd/VykACes
   iOOmMlPLMYLsVEqLFl/uECaMQrIdYnnhiCqD3wvbjV7JvmsGmJCbitidT
   B78PYhJgfn0ZeMmlRmWfSggr/WYZPUC58emwv0zhJoOGFX5vlX+vQfDpO
   HniC/jeivK7zmdWdQwZ+85CwFlBgvNOHaSQpL3+HKRcqNKnFULWOLFCbz
   GmrKVTqf9wZ2nhFYdIjWtIup8wNpr7fLsdyGzlbaMyd4mTd9NP5Dc/yf+
   Ic5hYA7Yo2KD7URBIq8DTSMw0FPCHdrGu8UrIFfX6VaHcDFtO+xfUG+Bt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1655694"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="1655694"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 06:39:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="14087940"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 10 Dec 2023 06:39:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCKxu-000Gvw-1f;
	Sun, 10 Dec 2023 14:39:30 +0000
Date: Sun, 10 Dec 2023 22:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/nfsd/nfs3proc.c:338 nfsd3_create_file() warn: 'child' is an error
 pointer or valid
Message-ID: <202312102247.1hd6dKNT-lkp@intel.com>
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
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: df9606abddfb01090d5ece7dcc2441d848f690f0 NFSD: Refactor NFSv3 CREATE
date:   1 year, 7 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 7 months ago
config: i386-randconfig-141-20231010 (https://download.01.org/0day-ci/archive/20231210/202312102247.1hd6dKNT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312102247.1hd6dKNT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312102247.1hd6dKNT-lkp@intel.com/

smatch warnings:
fs/nfsd/nfs3proc.c:338 nfsd3_create_file() warn: 'child' is an error pointer or valid

vim +/child +338 fs/nfsd/nfs3proc.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  222  
^1da177e4c3f41 Linus Torvalds 2005-04-16  223  /*
df9606abddfb01 Chuck Lever    2022-03-28  224   * Implement NFSv3's unchecked, guarded, and exclusive CREATE
df9606abddfb01 Chuck Lever    2022-03-28  225   * semantics for regular files. Except for the created file,
df9606abddfb01 Chuck Lever    2022-03-28  226   * this operation is stateless on the server.
df9606abddfb01 Chuck Lever    2022-03-28  227   *
df9606abddfb01 Chuck Lever    2022-03-28  228   * Upon return, caller must release @fhp and @resfhp.
df9606abddfb01 Chuck Lever    2022-03-28  229   */
df9606abddfb01 Chuck Lever    2022-03-28  230  static __be32
df9606abddfb01 Chuck Lever    2022-03-28  231  nfsd3_create_file(struct svc_rqst *rqstp, struct svc_fh *fhp,
df9606abddfb01 Chuck Lever    2022-03-28  232  		  struct svc_fh *resfhp, struct nfsd3_createargs *argp)
df9606abddfb01 Chuck Lever    2022-03-28  233  {
df9606abddfb01 Chuck Lever    2022-03-28  234  	struct iattr *iap = &argp->attrs;
df9606abddfb01 Chuck Lever    2022-03-28  235  	struct dentry *parent, *child;
df9606abddfb01 Chuck Lever    2022-03-28  236  	__u32 v_mtime, v_atime;
df9606abddfb01 Chuck Lever    2022-03-28  237  	struct inode *inode;
df9606abddfb01 Chuck Lever    2022-03-28  238  	__be32 status;
df9606abddfb01 Chuck Lever    2022-03-28  239  	int host_err;
df9606abddfb01 Chuck Lever    2022-03-28  240  
df9606abddfb01 Chuck Lever    2022-03-28  241  	if (isdotent(argp->name, argp->len))
df9606abddfb01 Chuck Lever    2022-03-28  242  		return nfserr_exist;
df9606abddfb01 Chuck Lever    2022-03-28  243  	if (!(iap->ia_valid & ATTR_MODE))
df9606abddfb01 Chuck Lever    2022-03-28  244  		iap->ia_mode = 0;
df9606abddfb01 Chuck Lever    2022-03-28  245  
df9606abddfb01 Chuck Lever    2022-03-28  246  	status = fh_verify(rqstp, fhp, S_IFDIR, NFSD_MAY_EXEC);
df9606abddfb01 Chuck Lever    2022-03-28  247  	if (status != nfs_ok)
df9606abddfb01 Chuck Lever    2022-03-28  248  		return status;
df9606abddfb01 Chuck Lever    2022-03-28  249  
df9606abddfb01 Chuck Lever    2022-03-28  250  	parent = fhp->fh_dentry;
df9606abddfb01 Chuck Lever    2022-03-28  251  	inode = d_inode(parent);
df9606abddfb01 Chuck Lever    2022-03-28  252  
df9606abddfb01 Chuck Lever    2022-03-28  253  	host_err = fh_want_write(fhp);
df9606abddfb01 Chuck Lever    2022-03-28  254  	if (host_err)
df9606abddfb01 Chuck Lever    2022-03-28  255  		return nfserrno(host_err);
df9606abddfb01 Chuck Lever    2022-03-28  256  
df9606abddfb01 Chuck Lever    2022-03-28  257  	fh_lock_nested(fhp, I_MUTEX_PARENT);
df9606abddfb01 Chuck Lever    2022-03-28  258  
df9606abddfb01 Chuck Lever    2022-03-28  259  	child = lookup_one_len(argp->name, parent, argp->len);
df9606abddfb01 Chuck Lever    2022-03-28  260  	if (IS_ERR(child)) {
df9606abddfb01 Chuck Lever    2022-03-28  261  		status = nfserrno(PTR_ERR(child));
df9606abddfb01 Chuck Lever    2022-03-28  262  		goto out;
df9606abddfb01 Chuck Lever    2022-03-28  263  	}
df9606abddfb01 Chuck Lever    2022-03-28  264  
df9606abddfb01 Chuck Lever    2022-03-28  265  	if (d_really_is_negative(child)) {
df9606abddfb01 Chuck Lever    2022-03-28  266  		status = fh_verify(rqstp, fhp, S_IFDIR, NFSD_MAY_CREATE);
df9606abddfb01 Chuck Lever    2022-03-28  267  		if (status != nfs_ok)
df9606abddfb01 Chuck Lever    2022-03-28  268  			goto out;
df9606abddfb01 Chuck Lever    2022-03-28  269  	}
df9606abddfb01 Chuck Lever    2022-03-28  270  
df9606abddfb01 Chuck Lever    2022-03-28  271  	status = fh_compose(resfhp, fhp->fh_export, child, fhp);
df9606abddfb01 Chuck Lever    2022-03-28  272  	if (status != nfs_ok)
df9606abddfb01 Chuck Lever    2022-03-28  273  		goto out;
df9606abddfb01 Chuck Lever    2022-03-28  274  
df9606abddfb01 Chuck Lever    2022-03-28  275  	v_mtime = 0;
df9606abddfb01 Chuck Lever    2022-03-28  276  	v_atime = 0;
df9606abddfb01 Chuck Lever    2022-03-28  277  	if (argp->createmode == NFS3_CREATE_EXCLUSIVE) {
df9606abddfb01 Chuck Lever    2022-03-28  278  		u32 *verifier = (u32 *)argp->verf;
df9606abddfb01 Chuck Lever    2022-03-28  279  
df9606abddfb01 Chuck Lever    2022-03-28  280  		/*
df9606abddfb01 Chuck Lever    2022-03-28  281  		 * Solaris 7 gets confused (bugid 4218508) if these have
df9606abddfb01 Chuck Lever    2022-03-28  282  		 * the high bit set, as do xfs filesystems without the
df9606abddfb01 Chuck Lever    2022-03-28  283  		 * "bigtime" feature. So just clear the high bits.
^1da177e4c3f41 Linus Torvalds 2005-04-16  284  		 */
df9606abddfb01 Chuck Lever    2022-03-28  285  		v_mtime = verifier[0] & 0x7fffffff;
df9606abddfb01 Chuck Lever    2022-03-28  286  		v_atime = verifier[1] & 0x7fffffff;
df9606abddfb01 Chuck Lever    2022-03-28  287  	}
df9606abddfb01 Chuck Lever    2022-03-28  288  
df9606abddfb01 Chuck Lever    2022-03-28  289  	if (d_really_is_positive(child)) {
df9606abddfb01 Chuck Lever    2022-03-28  290  		status = nfs_ok;
df9606abddfb01 Chuck Lever    2022-03-28  291  
df9606abddfb01 Chuck Lever    2022-03-28  292  		switch (argp->createmode) {
df9606abddfb01 Chuck Lever    2022-03-28  293  		case NFS3_CREATE_UNCHECKED:
df9606abddfb01 Chuck Lever    2022-03-28  294  			if (!d_is_reg(child))
df9606abddfb01 Chuck Lever    2022-03-28  295  				break;
df9606abddfb01 Chuck Lever    2022-03-28  296  			iap->ia_valid &= ATTR_SIZE;
df9606abddfb01 Chuck Lever    2022-03-28  297  			goto set_attr;
df9606abddfb01 Chuck Lever    2022-03-28  298  		case NFS3_CREATE_GUARDED:
df9606abddfb01 Chuck Lever    2022-03-28  299  			status = nfserr_exist;
df9606abddfb01 Chuck Lever    2022-03-28  300  			break;
df9606abddfb01 Chuck Lever    2022-03-28  301  		case NFS3_CREATE_EXCLUSIVE:
df9606abddfb01 Chuck Lever    2022-03-28  302  			if (d_inode(child)->i_mtime.tv_sec == v_mtime &&
df9606abddfb01 Chuck Lever    2022-03-28  303  			    d_inode(child)->i_atime.tv_sec == v_atime &&
df9606abddfb01 Chuck Lever    2022-03-28  304  			    d_inode(child)->i_size == 0) {
df9606abddfb01 Chuck Lever    2022-03-28  305  				break;
df9606abddfb01 Chuck Lever    2022-03-28  306  			}
df9606abddfb01 Chuck Lever    2022-03-28  307  			status = nfserr_exist;
df9606abddfb01 Chuck Lever    2022-03-28  308  		}
df9606abddfb01 Chuck Lever    2022-03-28  309  		goto out;
df9606abddfb01 Chuck Lever    2022-03-28  310  	}
df9606abddfb01 Chuck Lever    2022-03-28  311  
df9606abddfb01 Chuck Lever    2022-03-28  312  	if (!IS_POSIXACL(inode))
df9606abddfb01 Chuck Lever    2022-03-28  313  		iap->ia_mode &= ~current_umask();
df9606abddfb01 Chuck Lever    2022-03-28  314  
df9606abddfb01 Chuck Lever    2022-03-28  315  	host_err = vfs_create(&init_user_ns, inode, child, iap->ia_mode, true);
df9606abddfb01 Chuck Lever    2022-03-28  316  	if (host_err < 0) {
df9606abddfb01 Chuck Lever    2022-03-28  317  		status = nfserrno(host_err);
df9606abddfb01 Chuck Lever    2022-03-28  318  		goto out;
df9606abddfb01 Chuck Lever    2022-03-28  319  	}
df9606abddfb01 Chuck Lever    2022-03-28  320  
df9606abddfb01 Chuck Lever    2022-03-28  321  	/* A newly created file already has a file size of zero. */
df9606abddfb01 Chuck Lever    2022-03-28  322  	if ((iap->ia_valid & ATTR_SIZE) && (iap->ia_size == 0))
df9606abddfb01 Chuck Lever    2022-03-28  323  		iap->ia_valid &= ~ATTR_SIZE;
df9606abddfb01 Chuck Lever    2022-03-28  324  	if (argp->createmode == NFS3_CREATE_EXCLUSIVE) {
df9606abddfb01 Chuck Lever    2022-03-28  325  		iap->ia_valid = ATTR_MTIME | ATTR_ATIME |
df9606abddfb01 Chuck Lever    2022-03-28  326  				ATTR_MTIME_SET | ATTR_ATIME_SET;
df9606abddfb01 Chuck Lever    2022-03-28  327  		iap->ia_mtime.tv_sec = v_mtime;
df9606abddfb01 Chuck Lever    2022-03-28  328  		iap->ia_atime.tv_sec = v_atime;
df9606abddfb01 Chuck Lever    2022-03-28  329  		iap->ia_mtime.tv_nsec = 0;
df9606abddfb01 Chuck Lever    2022-03-28  330  		iap->ia_atime.tv_nsec = 0;
df9606abddfb01 Chuck Lever    2022-03-28  331  	}
df9606abddfb01 Chuck Lever    2022-03-28  332  
df9606abddfb01 Chuck Lever    2022-03-28  333  set_attr:
df9606abddfb01 Chuck Lever    2022-03-28  334  	status = nfsd_create_setattr(rqstp, fhp, resfhp, iap);
df9606abddfb01 Chuck Lever    2022-03-28  335  
df9606abddfb01 Chuck Lever    2022-03-28  336  out:
df9606abddfb01 Chuck Lever    2022-03-28  337  	fh_unlock(fhp);
df9606abddfb01 Chuck Lever    2022-03-28 @338  	if (child && !IS_ERR(child))
df9606abddfb01 Chuck Lever    2022-03-28  339  		dput(child);
df9606abddfb01 Chuck Lever    2022-03-28  340  	fh_drop_write(fhp);
df9606abddfb01 Chuck Lever    2022-03-28  341  	return status;
df9606abddfb01 Chuck Lever    2022-03-28  342  }
df9606abddfb01 Chuck Lever    2022-03-28  343  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
