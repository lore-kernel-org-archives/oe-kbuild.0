Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B56C17166F
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Apr 2024 17:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713374178; cv=none; b=HRldoH4ppHpHOi+PQA4sKrEuzupJj2KdhKG7/nnsJkG/gNJw95tv3bac81MsiPB9rGDyB4Q0VVgozXHUCpaFbn3KS80TSRskxcR7wPwz5a0sPcxbSt66Vrg0xsi+kU4x43bbyucdrN6xhtVc9han7wNtPXUTbGjl1xLquwcFpF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713374178; c=relaxed/simple;
	bh=8FH/LGLU5O6eOt5CfzkCVzbRklGCEErG7XgxxnFJiqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=abz20ayO3YJRvMOyYQsvCvwV+WH3zoffKYUpcfXL2+D6XHZDkqUVflJXeAIXVzdXdFdvMq38e3kUsyqvkgnjXTjJ40e4wCKHFtLlz9smw2lUOycHux8+F1tu+scxgOPQbBENKqfxSjOTK6Tm9cd2HRf8B/uqmmgzOWViN4ZRxbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+mjBesf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+mjBesf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713374173; x=1744910173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8FH/LGLU5O6eOt5CfzkCVzbRklGCEErG7XgxxnFJiqI=;
  b=D+mjBesfK5R36bXCmxybwszxcBmOL5NDKij5/7M9OyKu0AUVefm3J6LI
   OX1g9UB4NTObpDCtoDa/GZHR4g12qgxuHZZr/ILorUXgQ5YTeGO2NDfPU
   Z64AoGb5RJiB17f1KtPLg/ulYVTVDzxQqGMoOT4HVepKSdbTYQtMi5mhr
   1fwzBiuq0239stDyWzzMw6ePRsqo5nknIAIc04oVMhT46zoFmjMP44PMe
   V05SA6GPbBQLJhB66JdUUYt/FwHy78fABDkH+Fa21mNCy1o+6s8fl2oCz
   GpuDqcFbHEbQ3Dj1hjZUx+3t9U3RwgTA5uFuUQgr3TJ301Owa8zShb+om
   A==;
X-CSE-ConnectionGUID: jehxEP3rSKSy/8qrrutOrQ==
X-CSE-MsgGUID: ma6amfBOTsyyQZZCWnS5Cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12719571"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="12719571"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:16:13 -0700
X-CSE-ConnectionGUID: 6Tz/z+QyTYmKsQcPUb3xiQ==
X-CSE-MsgGUID: 6lpdw5lTT42EUx3TtiVt0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="22703743"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Apr 2024 10:16:12 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx8tF-0006pe-0k;
	Wed, 17 Apr 2024 17:16:09 +0000
Date: Thu, 18 Apr 2024 01:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5679/6705] fs/9p/vfs_inode.c:513 v9fs_remove()
 error: uninitialized symbol 'v9fid'.
Message-ID: <202404180119.5AIBXYfG-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Eric Van Hensbergen <ericvh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4eab358930711bbeb85bf5ee267d0d42d3394c2c
commit: 6ae7784008d9f8a48fdce5609ce795e470a1ddc7 [5679/6705]  fs/9p: mitigate inode collisions
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: alpha-randconfig-r081-20240417 (https://download.01.org/0day-ci/archive/20240418/202404180119.5AIBXYfG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404180119.5AIBXYfG-lkp@intel.com/

smatch warnings:
fs/9p/vfs_inode.c:513 v9fs_remove() error: uninitialized symbol 'v9fid'.

vim +/v9fid +513 fs/9p/vfs_inode.c

ac89b2ef9b55924 Eryu Guan           2018-04-05  461  
2bad8471511ce5c Eric Van Hensbergen 2005-09-09  462  /**
2bad8471511ce5c Eric Van Hensbergen 2005-09-09  463   * v9fs_remove - helper function to remove files and directories
73c592b9b844cc3 Eric Van Hensbergen 2005-09-09  464   * @dir: directory inode that is being deleted
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  465   * @dentry:  dentry that is being deleted
fd2916bd77109b6 Fabian Frederick    2014-06-04  466   * @flags: removing a directory
2bad8471511ce5c Eric Van Hensbergen 2005-09-09  467   *
2bad8471511ce5c Eric Van Hensbergen 2005-09-09  468   */
2bad8471511ce5c Eric Van Hensbergen 2005-09-09  469  
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  470  static int v9fs_remove(struct inode *dir, struct dentry *dentry, int flags)
2bad8471511ce5c Eric Van Hensbergen 2005-09-09  471  {
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  472  	struct inode *inode;
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  473  	int retval = -EOPNOTSUPP;
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  474  	struct p9_fid *v9fid, *dfid;
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  475  	struct v9fs_session_info *v9ses;
2bad8471511ce5c Eric Van Hensbergen 2005-09-09  476  
5d3851530d6d685 Joe Perches         2011-11-28  477  	p9_debug(P9_DEBUG_VFS, "inode: %p dentry: %p rmdir: %x\n",
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  478  		 dir, dentry, flags);
2bad8471511ce5c Eric Van Hensbergen 2005-09-09  479  
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  480  	v9ses = v9fs_inode2v9ses(dir);
2b0143b5c986be1 David Howells       2015-03-17  481  	inode = d_inode(dentry);
77d5a6b7d9924e2 Al Viro             2016-05-29  482  	dfid = v9fs_parent_fid(dentry);
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  483  	if (IS_ERR(dfid)) {
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  484  		retval = PTR_ERR(dfid);
5d3851530d6d685 Joe Perches         2011-11-28  485  		p9_debug(P9_DEBUG_VFS, "fid lookup failed %d\n", retval);
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  486  		return retval;
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  487  	}
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  488  	if (v9fs_proto_dotl(v9ses))
f88657ce3f9713a Aneesh Kumar K.V    2011-08-03  489  		retval = p9_client_unlinkat(dfid, dentry->d_name.name,
f88657ce3f9713a Aneesh Kumar K.V    2011-08-03  490  					    v9fs_at_to_dotl_flags(flags));
b48dbb998d70b7f Dominique Martinet  2022-06-12  491  	p9_fid_put(dfid);
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  492  	if (retval == -EOPNOTSUPP) {
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  493  		/* Try the one based on path */
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  494  		v9fid = v9fs_fid_clone(dentry);
da977b2c7eb4d63 Eric Van Hensbergen 2007-01-26  495  		if (IS_ERR(v9fid))
da977b2c7eb4d63 Eric Van Hensbergen 2007-01-26  496  			return PTR_ERR(v9fid);
d994f4058d9f9be Aneesh Kumar K.V    2010-03-29  497  		retval = p9_client_remove(v9fid);
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  498  	}
b271ec47bc11dea Aneesh Kumar K.V    2011-02-28  499  	if (!retval) {
b271ec47bc11dea Aneesh Kumar K.V    2011-02-28  500  		/*
b271ec47bc11dea Aneesh Kumar K.V    2011-02-28  501  		 * directories on unlink should have zero
b271ec47bc11dea Aneesh Kumar K.V    2011-02-28  502  		 * link count
b271ec47bc11dea Aneesh Kumar K.V    2011-02-28  503  		 */
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  504  		if (flags & AT_REMOVEDIR) {
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  505  			clear_nlink(inode);
ac89b2ef9b55924 Eryu Guan           2018-04-05  506  			v9fs_dec_count(dir);
b271ec47bc11dea Aneesh Kumar K.V    2011-02-28  507  		} else
ac89b2ef9b55924 Eryu Guan           2018-04-05  508  			v9fs_dec_count(inode);
d28c61f0e08aab9 Aneesh Kumar K.V    2011-02-28  509  
6ae7784008d9f8a Eric Van Hensbergen 2024-04-15  510  		if (inode->i_nlink <= 0) { /* no more refs unhash it */
6ae7784008d9f8a Eric Van Hensbergen 2024-04-15  511  			remove_inode_hash(inode);
6ae7784008d9f8a Eric Van Hensbergen 2024-04-15  512  		} else {
6ae7784008d9f8a Eric Van Hensbergen 2024-04-15 @513  			p9_debug(P9_DEBUG_ERROR,
6ae7784008d9f8a Eric Van Hensbergen 2024-04-15  514  			"WARNING: unlink inode %lx %s qid->path=%llx w/i_nlink==%d\n",
6ae7784008d9f8a Eric Van Hensbergen 2024-04-15  515  			inode->i_ino, dentry->d_name.name, v9fid->qid.path, inode->i_nlink);
6ae7784008d9f8a Eric Van Hensbergen 2024-04-15  516  		}
6ae7784008d9f8a Eric Van Hensbergen 2024-04-15  517  
48e370ff93769ee Aneesh Kumar K.V    2011-06-28  518  		v9fs_invalidate_inode_attr(inode);
d28c61f0e08aab9 Aneesh Kumar K.V    2011-02-28  519  		v9fs_invalidate_inode_attr(dir);
154372e67d4053e Eric Van Hensbergen 2020-09-23  520  
154372e67d4053e Eric Van Hensbergen 2020-09-23  521  		/* invalidate all fids associated with dentry */
154372e67d4053e Eric Van Hensbergen 2020-09-23  522  		/* NOTE: This will not include open fids */
154372e67d4053e Eric Van Hensbergen 2020-09-23  523  		dentry->d_op->d_release(dentry);
b271ec47bc11dea Aneesh Kumar K.V    2011-02-28  524  	}
d994f4058d9f9be Aneesh Kumar K.V    2010-03-29  525  	return retval;
2bad8471511ce5c Eric Van Hensbergen 2005-09-09  526  }
2bad8471511ce5c Eric Van Hensbergen 2005-09-09  527  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
