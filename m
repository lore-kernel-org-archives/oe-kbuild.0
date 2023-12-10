Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E251CFAC
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 21:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7qj2YaL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702244654; x=1733780654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hEBl7jJsDz0wdDOxS/33pyX79USobljUnwGgmCFHUk4=;
  b=R7qj2YaLIFkvW2UYAtTqbqDCbngrTBguqmXGRAsugcI+t4wGZQd2B2j+
   Fw9T8Z306UYOny9DWdMsaWiUvTeb7wBJWv3UpCrW0hHzbnECkiYxoIq51
   9yRM3iUeJfCBVhXBbqTFutyJgLkviUoj9cTxsfJPP4Nuf5EhzRTZSAaRo
   4YrDPIXxS8vN5YB5WGock0yOz4/LSoDyHJTz9bHw0U+tPeTP9aaN7WhOp
   /xVGND0mrbsCBDWUnNIsMk1Vhwd6RmH4aJT+XO+mz4CKBePT1gOWCs5ZF
   jAfuYgQvA7zwEbZQ2sYMQ1qnQe3Fwzag2J2SAAgfb4mN63M5WWWYtZC5Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="397362714"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="397362714"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 13:44:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="890856181"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="890856181"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2023 13:44:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCRap-000HIJ-1a;
	Sun, 10 Dec 2023 21:44:07 +0000
Date: Mon, 11 Dec 2023 05:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/nfsd/nfs4proc.c:382 nfsd4_create_file() warn: 'child' is an error
 pointer or valid
Message-ID: <202312110533.g6F1gwPn-lkp@intel.com>
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
head:   3a87498869d6d1e7347cd01f337a77984604eb5e
commit: 254454a5aa4a9f696d6bae080c08d5863e650f49 NFSD: Refactor NFSv4 OPEN(CREATE)
date:   1 year, 7 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 1 year, 7 months ago
config: i386-randconfig-141-20231010 (https://download.01.org/0day-ci/archive/20231211/202312110533.g6F1gwPn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312110533.g6F1gwPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312110533.g6F1gwPn-lkp@intel.com/

smatch warnings:
fs/nfsd/nfs4proc.c:382 nfsd4_create_file() warn: 'child' is an error pointer or valid

vim +/child +382 fs/nfsd/nfs4proc.c

254454a5aa4a9f Chuck Lever 2022-03-28  245  
254454a5aa4a9f Chuck Lever 2022-03-28  246  /*
254454a5aa4a9f Chuck Lever 2022-03-28  247   * Implement NFSv4's unchecked, guarded, and exclusive create
254454a5aa4a9f Chuck Lever 2022-03-28  248   * semantics for regular files. Open state for this new file is
254454a5aa4a9f Chuck Lever 2022-03-28  249   * subsequently fabricated in nfsd4_process_open2().
254454a5aa4a9f Chuck Lever 2022-03-28  250   *
254454a5aa4a9f Chuck Lever 2022-03-28  251   * Upon return, caller must release @fhp and @resfhp.
254454a5aa4a9f Chuck Lever 2022-03-28  252   */
254454a5aa4a9f Chuck Lever 2022-03-28  253  static __be32
254454a5aa4a9f Chuck Lever 2022-03-28  254  nfsd4_create_file(struct svc_rqst *rqstp, struct svc_fh *fhp,
254454a5aa4a9f Chuck Lever 2022-03-28  255  		  struct svc_fh *resfhp, struct nfsd4_open *open)
254454a5aa4a9f Chuck Lever 2022-03-28  256  {
254454a5aa4a9f Chuck Lever 2022-03-28  257  	struct iattr *iap = &open->op_iattr;
254454a5aa4a9f Chuck Lever 2022-03-28  258  	struct dentry *parent, *child;
254454a5aa4a9f Chuck Lever 2022-03-28  259  	__u32 v_mtime, v_atime;
254454a5aa4a9f Chuck Lever 2022-03-28  260  	struct inode *inode;
254454a5aa4a9f Chuck Lever 2022-03-28  261  	__be32 status;
254454a5aa4a9f Chuck Lever 2022-03-28  262  	int host_err;
254454a5aa4a9f Chuck Lever 2022-03-28  263  
254454a5aa4a9f Chuck Lever 2022-03-28  264  	if (isdotent(open->op_fname, open->op_fnamelen))
254454a5aa4a9f Chuck Lever 2022-03-28  265  		return nfserr_exist;
254454a5aa4a9f Chuck Lever 2022-03-28  266  	if (!(iap->ia_valid & ATTR_MODE))
254454a5aa4a9f Chuck Lever 2022-03-28  267  		iap->ia_mode = 0;
254454a5aa4a9f Chuck Lever 2022-03-28  268  
254454a5aa4a9f Chuck Lever 2022-03-28  269  	status = fh_verify(rqstp, fhp, S_IFDIR, NFSD_MAY_EXEC);
254454a5aa4a9f Chuck Lever 2022-03-28  270  	if (status != nfs_ok)
254454a5aa4a9f Chuck Lever 2022-03-28  271  		return status;
254454a5aa4a9f Chuck Lever 2022-03-28  272  	parent = fhp->fh_dentry;
254454a5aa4a9f Chuck Lever 2022-03-28  273  	inode = d_inode(parent);
254454a5aa4a9f Chuck Lever 2022-03-28  274  
254454a5aa4a9f Chuck Lever 2022-03-28  275  	host_err = fh_want_write(fhp);
254454a5aa4a9f Chuck Lever 2022-03-28  276  	if (host_err)
254454a5aa4a9f Chuck Lever 2022-03-28  277  		return nfserrno(host_err);
254454a5aa4a9f Chuck Lever 2022-03-28  278  
254454a5aa4a9f Chuck Lever 2022-03-28  279  	fh_lock_nested(fhp, I_MUTEX_PARENT);
254454a5aa4a9f Chuck Lever 2022-03-28  280  
254454a5aa4a9f Chuck Lever 2022-03-28  281  	child = lookup_one_len(open->op_fname, parent, open->op_fnamelen);
254454a5aa4a9f Chuck Lever 2022-03-28  282  	if (IS_ERR(child)) {
254454a5aa4a9f Chuck Lever 2022-03-28  283  		status = nfserrno(PTR_ERR(child));
254454a5aa4a9f Chuck Lever 2022-03-28  284  		goto out;
254454a5aa4a9f Chuck Lever 2022-03-28  285  	}
254454a5aa4a9f Chuck Lever 2022-03-28  286  
254454a5aa4a9f Chuck Lever 2022-03-28  287  	if (d_really_is_negative(child)) {
254454a5aa4a9f Chuck Lever 2022-03-28  288  		status = fh_verify(rqstp, fhp, S_IFDIR, NFSD_MAY_CREATE);
254454a5aa4a9f Chuck Lever 2022-03-28  289  		if (status != nfs_ok)
254454a5aa4a9f Chuck Lever 2022-03-28  290  			goto out;
254454a5aa4a9f Chuck Lever 2022-03-28  291  	}
254454a5aa4a9f Chuck Lever 2022-03-28  292  
254454a5aa4a9f Chuck Lever 2022-03-28  293  	status = fh_compose(resfhp, fhp->fh_export, child, fhp);
254454a5aa4a9f Chuck Lever 2022-03-28  294  	if (status != nfs_ok)
254454a5aa4a9f Chuck Lever 2022-03-28  295  		goto out;
254454a5aa4a9f Chuck Lever 2022-03-28  296  
254454a5aa4a9f Chuck Lever 2022-03-28  297  	v_mtime = 0;
254454a5aa4a9f Chuck Lever 2022-03-28  298  	v_atime = 0;
254454a5aa4a9f Chuck Lever 2022-03-28  299  	if (nfsd4_create_is_exclusive(open->op_createmode)) {
254454a5aa4a9f Chuck Lever 2022-03-28  300  		u32 *verifier = (u32 *)open->op_verf.data;
254454a5aa4a9f Chuck Lever 2022-03-28  301  
254454a5aa4a9f Chuck Lever 2022-03-28  302  		/*
254454a5aa4a9f Chuck Lever 2022-03-28  303  		 * Solaris 7 gets confused (bugid 4218508) if these have
254454a5aa4a9f Chuck Lever 2022-03-28  304  		 * the high bit set, as do xfs filesystems without the
254454a5aa4a9f Chuck Lever 2022-03-28  305  		 * "bigtime" feature. So just clear the high bits. If this
254454a5aa4a9f Chuck Lever 2022-03-28  306  		 * is ever changed to use different attrs for storing the
254454a5aa4a9f Chuck Lever 2022-03-28  307  		 * verifier, then do_open_lookup() will also need to be
254454a5aa4a9f Chuck Lever 2022-03-28  308  		 * fixed accordingly.
254454a5aa4a9f Chuck Lever 2022-03-28  309  		 */
254454a5aa4a9f Chuck Lever 2022-03-28  310  		v_mtime = verifier[0] & 0x7fffffff;
254454a5aa4a9f Chuck Lever 2022-03-28  311  		v_atime = verifier[1] & 0x7fffffff;
254454a5aa4a9f Chuck Lever 2022-03-28  312  	}
254454a5aa4a9f Chuck Lever 2022-03-28  313  
254454a5aa4a9f Chuck Lever 2022-03-28  314  	if (d_really_is_positive(child)) {
254454a5aa4a9f Chuck Lever 2022-03-28  315  		status = nfs_ok;
254454a5aa4a9f Chuck Lever 2022-03-28  316  
254454a5aa4a9f Chuck Lever 2022-03-28  317  		switch (open->op_createmode) {
254454a5aa4a9f Chuck Lever 2022-03-28  318  		case NFS4_CREATE_UNCHECKED:
254454a5aa4a9f Chuck Lever 2022-03-28  319  			if (!d_is_reg(child))
254454a5aa4a9f Chuck Lever 2022-03-28  320  				break;
254454a5aa4a9f Chuck Lever 2022-03-28  321  
254454a5aa4a9f Chuck Lever 2022-03-28  322  			/*
254454a5aa4a9f Chuck Lever 2022-03-28  323  			 * In NFSv4, we don't want to truncate the file
254454a5aa4a9f Chuck Lever 2022-03-28  324  			 * now. This would be wrong if the OPEN fails for
254454a5aa4a9f Chuck Lever 2022-03-28  325  			 * some other reason. Furthermore, if the size is
254454a5aa4a9f Chuck Lever 2022-03-28  326  			 * nonzero, we should ignore it according to spec!
254454a5aa4a9f Chuck Lever 2022-03-28  327  			 */
254454a5aa4a9f Chuck Lever 2022-03-28  328  			open->op_truncate = (iap->ia_valid & ATTR_SIZE) &&
254454a5aa4a9f Chuck Lever 2022-03-28  329  						!iap->ia_size;
254454a5aa4a9f Chuck Lever 2022-03-28  330  			break;
254454a5aa4a9f Chuck Lever 2022-03-28  331  		case NFS4_CREATE_GUARDED:
254454a5aa4a9f Chuck Lever 2022-03-28  332  			status = nfserr_exist;
254454a5aa4a9f Chuck Lever 2022-03-28  333  			break;
254454a5aa4a9f Chuck Lever 2022-03-28  334  		case NFS4_CREATE_EXCLUSIVE:
254454a5aa4a9f Chuck Lever 2022-03-28  335  			if (d_inode(child)->i_mtime.tv_sec == v_mtime &&
254454a5aa4a9f Chuck Lever 2022-03-28  336  			    d_inode(child)->i_atime.tv_sec == v_atime &&
254454a5aa4a9f Chuck Lever 2022-03-28  337  			    d_inode(child)->i_size == 0) {
254454a5aa4a9f Chuck Lever 2022-03-28  338  				open->op_created = true;
254454a5aa4a9f Chuck Lever 2022-03-28  339  				break;		/* subtle */
254454a5aa4a9f Chuck Lever 2022-03-28  340  			}
254454a5aa4a9f Chuck Lever 2022-03-28  341  			status = nfserr_exist;
254454a5aa4a9f Chuck Lever 2022-03-28  342  			break;
254454a5aa4a9f Chuck Lever 2022-03-28  343  		case NFS4_CREATE_EXCLUSIVE4_1:
254454a5aa4a9f Chuck Lever 2022-03-28  344  			if (d_inode(child)->i_mtime.tv_sec == v_mtime &&
254454a5aa4a9f Chuck Lever 2022-03-28  345  			    d_inode(child)->i_atime.tv_sec == v_atime &&
254454a5aa4a9f Chuck Lever 2022-03-28  346  			    d_inode(child)->i_size == 0) {
254454a5aa4a9f Chuck Lever 2022-03-28  347  				open->op_created = true;
254454a5aa4a9f Chuck Lever 2022-03-28  348  				goto set_attr;	/* subtle */
254454a5aa4a9f Chuck Lever 2022-03-28  349  			}
254454a5aa4a9f Chuck Lever 2022-03-28  350  			status = nfserr_exist;
254454a5aa4a9f Chuck Lever 2022-03-28  351  		}
254454a5aa4a9f Chuck Lever 2022-03-28  352  		goto out;
254454a5aa4a9f Chuck Lever 2022-03-28  353  	}
254454a5aa4a9f Chuck Lever 2022-03-28  354  
254454a5aa4a9f Chuck Lever 2022-03-28  355  	if (!IS_POSIXACL(inode))
254454a5aa4a9f Chuck Lever 2022-03-28  356  		iap->ia_mode &= ~current_umask();
254454a5aa4a9f Chuck Lever 2022-03-28  357  
254454a5aa4a9f Chuck Lever 2022-03-28  358  	host_err = vfs_create(&init_user_ns, inode, child, iap->ia_mode, true);
254454a5aa4a9f Chuck Lever 2022-03-28  359  	if (host_err < 0) {
254454a5aa4a9f Chuck Lever 2022-03-28  360  		status = nfserrno(host_err);
254454a5aa4a9f Chuck Lever 2022-03-28  361  		goto out;
254454a5aa4a9f Chuck Lever 2022-03-28  362  	}
254454a5aa4a9f Chuck Lever 2022-03-28  363  	open->op_created = true;
254454a5aa4a9f Chuck Lever 2022-03-28  364  
254454a5aa4a9f Chuck Lever 2022-03-28  365  	/* A newly created file already has a file size of zero. */
254454a5aa4a9f Chuck Lever 2022-03-28  366  	if ((iap->ia_valid & ATTR_SIZE) && (iap->ia_size == 0))
254454a5aa4a9f Chuck Lever 2022-03-28  367  		iap->ia_valid &= ~ATTR_SIZE;
254454a5aa4a9f Chuck Lever 2022-03-28  368  	if (nfsd4_create_is_exclusive(open->op_createmode)) {
254454a5aa4a9f Chuck Lever 2022-03-28  369  		iap->ia_valid = ATTR_MTIME | ATTR_ATIME |
254454a5aa4a9f Chuck Lever 2022-03-28  370  				ATTR_MTIME_SET|ATTR_ATIME_SET;
254454a5aa4a9f Chuck Lever 2022-03-28  371  		iap->ia_mtime.tv_sec = v_mtime;
254454a5aa4a9f Chuck Lever 2022-03-28  372  		iap->ia_atime.tv_sec = v_atime;
254454a5aa4a9f Chuck Lever 2022-03-28  373  		iap->ia_mtime.tv_nsec = 0;
254454a5aa4a9f Chuck Lever 2022-03-28  374  		iap->ia_atime.tv_nsec = 0;
254454a5aa4a9f Chuck Lever 2022-03-28  375  	}
254454a5aa4a9f Chuck Lever 2022-03-28  376  
254454a5aa4a9f Chuck Lever 2022-03-28  377  set_attr:
254454a5aa4a9f Chuck Lever 2022-03-28  378  	status = nfsd_create_setattr(rqstp, fhp, resfhp, iap);
254454a5aa4a9f Chuck Lever 2022-03-28  379  
254454a5aa4a9f Chuck Lever 2022-03-28  380  out:
254454a5aa4a9f Chuck Lever 2022-03-28  381  	fh_unlock(fhp);
254454a5aa4a9f Chuck Lever 2022-03-28 @382  	if (child && !IS_ERR(child))
254454a5aa4a9f Chuck Lever 2022-03-28  383  		dput(child);
254454a5aa4a9f Chuck Lever 2022-03-28  384  	fh_drop_write(fhp);
254454a5aa4a9f Chuck Lever 2022-03-28  385  	return status;
254454a5aa4a9f Chuck Lever 2022-03-28  386  }
254454a5aa4a9f Chuck Lever 2022-03-28  387  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
