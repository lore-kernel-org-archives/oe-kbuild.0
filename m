Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6068829B0
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Apr 2025 04:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745642855; cv=none; b=smKCOuITdQ47zD+jvvo5ImA93/m59SNjq+hKNLbUI8l/cvPI3b8UhGWLl5o3TRlaJ3NlyhwGG2vWfwh5Ah8ws7KST/4CrcfZ+pIM38JXGmnkeK0wf6t+WiWGRNqsQ+bwnP1BgxAChRFd6uWmaHS9J1e92lhI4/1Bq2/qoLUe2zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745642855; c=relaxed/simple;
	bh=tOJ6FcAZN6UP/OTHqyF8aESzuL1EiNNury0bIJw3v1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBJ3z4/8RVr9nYzpQlvtbBQCG0gMYQuZTs4vsTE2B6XjC1YexCNzLYexx7OyCwGC51+c+VqyP4yS7CdT778RFpYODLDYO1DHyR88BQQFMVfJ8aQ7WxmK7pPMopwx4gxCpqaOGZRA1x6rX7dmWPMzgMTAR/hB49f6r1utIEwkJs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+Gt6Neo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+Gt6Neo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745642853; x=1777178853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tOJ6FcAZN6UP/OTHqyF8aESzuL1EiNNury0bIJw3v1k=;
  b=a+Gt6NeoySfqcmeh4k1AXhSs0N3j2fLiKwkqzEEg7DMzXSQICYqwCO+R
   YaQttJyad4UDRqOOYIHBDr4X660J3GPw38pSaPMtsyaRzk3MeR3qh9DMn
   vPgd48UShA/JUf2p5G8Ycp9fKz0oPt0jDJ0LWeePgtKXc3bLgCEHRBqSd
   S7CH0H9AbHvL/6E8zAOQ4rdA+2KmwWhyYWfUC82204+brt1s1RZDRyd8u
   dBQjnpJqroByAABw+tL76v2T9SfJvG91HjIS0hJgHsgFV4IR2e5xrNYza
   hpuTL+v/bmlDm7x22T/0i8LLYIjf/osNSrF6zmVecfHrAGLy8bRUugPnx
   Q==;
X-CSE-ConnectionGUID: s8ON4avtSVucFqpKgJeWeQ==
X-CSE-MsgGUID: OGmVLEx+TU2CckrcwDt3XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47217061"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="47217061"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 21:47:32 -0700
X-CSE-ConnectionGUID: B7fFGZX7QBymIdy9eeLgVQ==
X-CSE-MsgGUID: LFkWFHI1SC2brpeUIGj0Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="138165799"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Apr 2025 21:47:31 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8XRp-0005hT-0d;
	Sat, 26 Apr 2025 04:47:29 +0000
Date: Sat, 26 Apr 2025 12:47:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-vfs:vfs.fixes 5/7] drivers/base/devtmpfs.c:358
 handle_remove() error: uninitialized symbol 'err'.
Message-ID: <202504261201.An2vRIlC-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christoph Hellwig <hch@lst.de>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.fixes
head:   9664179186fb2ae576315b0e22b0e21f5de1a0e2
commit: 5a876a5097fed90a4742438fbc22357d67d9ea60 [5/7] devtmpfs: don't use vfs_getattr_nosec to query i_mode
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250426 (https://download.01.org/0day-ci/archive/20250426/202504261201.An2vRIlC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504261201.An2vRIlC-lkp@intel.com/

smatch warnings:
drivers/base/devtmpfs.c:358 handle_remove() error: uninitialized symbol 'err'.

vim +/err +358 drivers/base/devtmpfs.c

2b2af54a5bb6f7 Kay Sievers       2009-04-30  319  
2780f1ff6aec0c Al Viro           2011-06-27  320  static int handle_remove(const char *nodename, struct device *dev)
2b2af54a5bb6f7 Kay Sievers       2009-04-30  321  {
79714f72d3b964 Al Viro           2012-06-15  322  	struct path parent;
2b2af54a5bb6f7 Kay Sievers       2009-04-30  323  	struct dentry *dentry;
5a876a5097fed9 Christoph Hellwig 2025-04-23  324  	struct inode *inode;
fbde7c6119f99a Axel Lin          2013-11-16  325  	int deleted = 0;
2b2af54a5bb6f7 Kay Sievers       2009-04-30  326  	int err;
2b2af54a5bb6f7 Kay Sievers       2009-04-30  327  
79714f72d3b964 Al Viro           2012-06-15  328  	dentry = kern_path_locked(nodename, &parent);
79714f72d3b964 Al Viro           2012-06-15  329  	if (IS_ERR(dentry))
79714f72d3b964 Al Viro           2012-06-15  330  		return PTR_ERR(dentry);
2b2af54a5bb6f7 Kay Sievers       2009-04-30  331  
5a876a5097fed9 Christoph Hellwig 2025-04-23  332  	inode = d_inode(dentry);
5a876a5097fed9 Christoph Hellwig 2025-04-23  333  	if (dev_mynode(dev, inode)) {
5e31d76f2817bd Kay Sievers       2010-01-13  334  		struct iattr newattrs;
5e31d76f2817bd Kay Sievers       2010-01-13  335  		/*
5e31d76f2817bd Kay Sievers       2010-01-13  336  		 * before unlinking this node, reset permissions
5e31d76f2817bd Kay Sievers       2010-01-13  337  		 * of possible references like hardlinks
5e31d76f2817bd Kay Sievers       2010-01-13  338  		 */
91fa2ccaa87368 Eric W. Biederman 2012-04-25  339  		newattrs.ia_uid = GLOBAL_ROOT_UID;
91fa2ccaa87368 Eric W. Biederman 2012-04-25  340  		newattrs.ia_gid = GLOBAL_ROOT_GID;
5a876a5097fed9 Christoph Hellwig 2025-04-23  341  		newattrs.ia_mode = inode->i_mode & ~0777;
5e31d76f2817bd Kay Sievers       2010-01-13  342  		newattrs.ia_valid =
5e31d76f2817bd Kay Sievers       2010-01-13  343  			ATTR_UID|ATTR_GID|ATTR_MODE;
5955102c9984fa Al Viro           2016-01-22  344  		inode_lock(d_inode(dentry));
abf08576afe315 Christian Brauner 2023-01-13  345  		notify_change(&nop_mnt_idmap, dentry, &newattrs, NULL);
5955102c9984fa Al Viro           2016-01-22  346  		inode_unlock(d_inode(dentry));
abf08576afe315 Christian Brauner 2023-01-13  347  		err = vfs_unlink(&nop_mnt_idmap, d_inode(parent.dentry),
6521f891708292 Christian Brauner 2021-01-21  348  				 dentry, NULL);
2b2af54a5bb6f7 Kay Sievers       2009-04-30  349  		if (!err || err == -ENOENT)
2b2af54a5bb6f7 Kay Sievers       2009-04-30  350  			deleted = 1;
2b2af54a5bb6f7 Kay Sievers       2009-04-30  351  	}
2b2af54a5bb6f7 Kay Sievers       2009-04-30  352  	dput(dentry);
5955102c9984fa Al Viro           2016-01-22  353  	inode_unlock(d_inode(parent.dentry));
2b2af54a5bb6f7 Kay Sievers       2009-04-30  354  
79714f72d3b964 Al Viro           2012-06-15  355  	path_put(&parent);
2b2af54a5bb6f7 Kay Sievers       2009-04-30  356  	if (deleted && strchr(nodename, '/'))
2b2af54a5bb6f7 Kay Sievers       2009-04-30  357  		delete_path(nodename);
2b2af54a5bb6f7 Kay Sievers       2009-04-30 @358  	return err;
2b2af54a5bb6f7 Kay Sievers       2009-04-30  359  }
2b2af54a5bb6f7 Kay Sievers       2009-04-30  360  

:::::: The code at line 358 was first introduced by commit
:::::: 2b2af54a5bb6f7e80ccf78f20084b93c398c3a8b Driver Core: devtmpfs - kernel-maintained tmpfs-based /dev

:::::: TO: Kay Sievers <kay.sievers@vrfy.org>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
