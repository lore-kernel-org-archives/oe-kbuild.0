Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E96C1945B
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Nov 2023 23:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pn8HwwM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699658074; x=1731194074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cw7mmr5biPy7XprIaZZdsyNxOrxAI/a7L8KlQ+5wIGU=;
  b=Pn8HwwM0Uo1M7BmgTSuy0AFLW+KxTxyWU2JRewba9zvlDaIcv3MYjKxf
   eTrY2Rxd8HEUYnvJJlRWiNZpTTy0FfyUSGY7p/8V7Vq+M1daokd+AH5Cp
   gG8bwSK6uG8cRlaBEJmPn2iCLdYPVJ/H2m/EVIfjIYjPtQiIzaotrLR7D
   QwSI62E5rnep9fnzagQFNILYWDdKHeY6OJJuAtOul0LvLT9szyf2xDTJg
   dBKenYE8vMtdyfgXRn9wAMDpYn7pcrUOANscATlMi6G9UUU3KxZPZ25nG
   ABDPCrLLB+Oeng2srTw9nxLFFWMVuVwlYeCV0XG5itn+VbZpxqDV4n3Ye
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="454543657"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="454543657"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 15:14:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="1011051948"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="1011051948"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Nov 2023 15:14:32 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ahp-000A0E-2z;
	Fri, 10 Nov 2023 23:14:29 +0000
Date: Sat, 11 Nov 2023 07:12:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH 1/6] debugfs: fix automount d_fsdata usage
Message-ID: <202311110653.cItFLCy6-lkp@intel.com>
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
In-Reply-To: <20231109222251.9e54cb55c700.I64fe5615568e87f9ae2d7fb2ac4e5fa96924cb50@changeid>
References: <20231109222251.9e54cb55c700.I64fe5615568e87f9ae2d7fb2ac4e5fa96924cb50@changeid>
TO: Johannes Berg <johannes@sipsolutions.net>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus wireless-next/main wireless/main linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/debugfs-fix-automount-d_fsdata-usage/20231110-054024
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231109222251.9e54cb55c700.I64fe5615568e87f9ae2d7fb2ac4e5fa96924cb50%40changeid
patch subject: [RFC PATCH 1/6] debugfs: fix automount d_fsdata usage
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: i386-randconfig-141-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110653.cItFLCy6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110653.cItFLCy6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311110653.cItFLCy6-lkp@intel.com/

New smatch warnings:
fs/debugfs/inode.c:655 debugfs_create_automount() warn: possible memory leak of 'fsd'

Old smatch warnings:
fs/debugfs/inode.c:662 debugfs_create_automount() warn: possible memory leak of 'fsd'

vim +/fsd +655 fs/debugfs/inode.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  621  
77b3da6e3232d3 Al Viro            2015-01-25  622  /**
77b3da6e3232d3 Al Viro            2015-01-25  623   * debugfs_create_automount - create automount point in the debugfs filesystem
77b3da6e3232d3 Al Viro            2015-01-25  624   * @name: a pointer to a string containing the name of the file to create.
77b3da6e3232d3 Al Viro            2015-01-25  625   * @parent: a pointer to the parent dentry for this file.  This should be a
77b3da6e3232d3 Al Viro            2015-01-25  626   *          directory dentry if set.  If this parameter is NULL, then the
77b3da6e3232d3 Al Viro            2015-01-25  627   *          file will be created in the root of the debugfs filesystem.
77b3da6e3232d3 Al Viro            2015-01-25  628   * @f: function to be called when pathname resolution steps on that one.
77b3da6e3232d3 Al Viro            2015-01-25  629   * @data: opaque argument to pass to f().
77b3da6e3232d3 Al Viro            2015-01-25  630   *
77b3da6e3232d3 Al Viro            2015-01-25  631   * @f should return what ->d_automount() would.
77b3da6e3232d3 Al Viro            2015-01-25  632   */
77b3da6e3232d3 Al Viro            2015-01-25  633  struct dentry *debugfs_create_automount(const char *name,
77b3da6e3232d3 Al Viro            2015-01-25  634  					struct dentry *parent,
93faccbbfa958a Eric W. Biederman  2017-02-01  635  					debugfs_automount_t f,
77b3da6e3232d3 Al Viro            2015-01-25  636  					void *data)
77b3da6e3232d3 Al Viro            2015-01-25  637  {
77b3da6e3232d3 Al Viro            2015-01-25  638  	struct dentry *dentry = start_creating(name, parent);
3e1dead436f419 Johannes Berg      2023-11-09  639  	struct debugfs_fsdata *fsd;
77b3da6e3232d3 Al Viro            2015-01-25  640  	struct inode *inode;
77b3da6e3232d3 Al Viro            2015-01-25  641  
77b3da6e3232d3 Al Viro            2015-01-25  642  	if (IS_ERR(dentry))
ff9fb72bc07705 Greg Kroah-Hartman 2019-01-23  643  		return dentry;
77b3da6e3232d3 Al Viro            2015-01-25  644  
3e1dead436f419 Johannes Berg      2023-11-09  645  	fsd = kzalloc(sizeof(*fsd), GFP_KERNEL);
3e1dead436f419 Johannes Berg      2023-11-09  646  	if (!fsd) {
3e1dead436f419 Johannes Berg      2023-11-09  647  		failed_creating(dentry);
3e1dead436f419 Johannes Berg      2023-11-09  648  		return ERR_PTR(-ENOMEM);
3e1dead436f419 Johannes Berg      2023-11-09  649  	}
3e1dead436f419 Johannes Berg      2023-11-09  650  
3e1dead436f419 Johannes Berg      2023-11-09  651  	fsd->automount = f;
3e1dead436f419 Johannes Berg      2023-11-09  652  
a24c6f7bc923d5 Peter Enderborg    2020-07-16  653  	if (!(debugfs_allow & DEBUGFS_ALLOW_API)) {
a24c6f7bc923d5 Peter Enderborg    2020-07-16  654  		failed_creating(dentry);
a24c6f7bc923d5 Peter Enderborg    2020-07-16 @655  		return ERR_PTR(-EPERM);
a24c6f7bc923d5 Peter Enderborg    2020-07-16  656  	}
a24c6f7bc923d5 Peter Enderborg    2020-07-16  657  
77b3da6e3232d3 Al Viro            2015-01-25  658  	inode = debugfs_get_inode(dentry->d_sb);
43e23b6c0b0151 Greg Kroah-Hartman 2019-07-03  659  	if (unlikely(!inode)) {
43e23b6c0b0151 Greg Kroah-Hartman 2019-07-03  660  		pr_err("out of free dentries, can not create automount '%s'\n",
43e23b6c0b0151 Greg Kroah-Hartman 2019-07-03  661  		       name);
77b3da6e3232d3 Al Viro            2015-01-25  662  		return failed_creating(dentry);
43e23b6c0b0151 Greg Kroah-Hartman 2019-07-03  663  	}
77b3da6e3232d3 Al Viro            2015-01-25  664  
87243deb88671f Seth Forshee       2016-03-09  665  	make_empty_dir_inode(inode);
77b3da6e3232d3 Al Viro            2015-01-25  666  	inode->i_flags |= S_AUTOMOUNT;
77b3da6e3232d3 Al Viro            2015-01-25  667  	inode->i_private = data;
3e1dead436f419 Johannes Berg      2023-11-09  668  	dentry->d_fsdata = fsd;
a8f324a46fbe54 Roman Pen          2016-02-09  669  	/* directory inodes start off with i_nlink == 2 (for "." entry) */
a8f324a46fbe54 Roman Pen          2016-02-09  670  	inc_nlink(inode);
77b3da6e3232d3 Al Viro            2015-01-25  671  	d_instantiate(dentry, inode);
a8f324a46fbe54 Roman Pen          2016-02-09  672  	inc_nlink(d_inode(dentry->d_parent));
a8f324a46fbe54 Roman Pen          2016-02-09  673  	fsnotify_mkdir(d_inode(dentry->d_parent), dentry);
77b3da6e3232d3 Al Viro            2015-01-25  674  	return end_creating(dentry);
77b3da6e3232d3 Al Viro            2015-01-25  675  }
77b3da6e3232d3 Al Viro            2015-01-25  676  EXPORT_SYMBOL(debugfs_create_automount);
77b3da6e3232d3 Al Viro            2015-01-25  677  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
