Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E53811700
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Aug 2023 21:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691788568; x=1723324568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XwEJ3qCetRC59QImME24eTCRBmlDYR4nstdxLFugpow=;
  b=nlrURcX8YElcErt/wCjCEs6uSdJx/quAuRENQgwxYB5QF4OvE+Ajp47U
   3ALE4fG/mrH+BnqT6pN0dc4W1n54IP4tFxG+8Zd7eGCtlr/Z7gVflcuFQ
   QCPQdZ0zQAdUkSi0Y/5ZeH1WhW5IVZBlwfcvYLCJEx5YwfPVX7ctEq6qx
   w07J9bNwr2gUQNUVDNmMyUAzqgGuGeOdsYzxjJLl+XR4eqE3/HcsEqwe7
   3Z6CPuBUgixZdhU5ZubFmJXwzK10pcHD4u8nm8GbPrAS7y6vr/D4nTFr1
   jGDixoFzt/4Dh/iJbh7Djsr/IEfwc4dSHmrvCw/xPkzfggnBypOofPehA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="374533184"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="374533184"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 14:15:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="735900295"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="735900295"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Aug 2023 14:15:52 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUZU8-00082w-09;
	Fri, 11 Aug 2023 21:15:52 +0000
Date: Sat, 12 Aug 2023 05:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-vfs:vfs.tmpfs 15/19] mm/shmem.c:3611
 shmem_xattr_handler_set() warn: passing zero to 'PTR_ERR'
Message-ID: <202308120509.hkikGgvH-lkp@intel.com>
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
TO: Hugh Dickins <hughd@google.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.tmpfs
head:   aa5b9178c01905d7691512b366cf2886dfe2680c
commit: 46170cc50828c33897d192668884d570b2c4e79b [15/19] xattr: simple_xattr_set() return old_xattr to be freed
:::::: branch date: 9 hours ago
:::::: commit date: 3 days ago
config: mips-randconfig-m031-20230809 (https://download.01.org/0day-ci/archive/20230812/202308120509.hkikGgvH-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120509.hkikGgvH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308120509.hkikGgvH-lkp@intel.com/

smatch warnings:
mm/shmem.c:3611 shmem_xattr_handler_set() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +3611 mm/shmem.c

b09e0fa4b4ea66 Eric Paris          2011-05-24  3593  
aa7c5241c380ad Andreas Gruenbacher 2015-12-02  3594  static int shmem_xattr_handler_set(const struct xattr_handler *handler,
39f60c1ccee72c Christian Brauner   2023-01-13  3595  				   struct mnt_idmap *idmap,
5930122683dff5 Al Viro             2016-05-27  3596  				   struct dentry *unused, struct inode *inode,
5930122683dff5 Al Viro             2016-05-27  3597  				   const char *name, const void *value,
5930122683dff5 Al Viro             2016-05-27  3598  				   size_t size, int flags)
b09e0fa4b4ea66 Eric Paris          2011-05-24  3599  {
5930122683dff5 Al Viro             2016-05-27  3600  	struct shmem_inode_info *info = SHMEM_I(inode);
46170cc50828c3 Hugh Dickins        2023-08-08  3601  	struct simple_xattr *old_xattr;
b09e0fa4b4ea66 Eric Paris          2011-05-24  3602  
aa7c5241c380ad Andreas Gruenbacher 2015-12-02  3603  	name = xattr_full_name(handler, name);
46170cc50828c3 Hugh Dickins        2023-08-08  3604  	old_xattr = simple_xattr_set(&info->xattrs, name, value, size, flags);
46170cc50828c3 Hugh Dickins        2023-08-08  3605  	if (!IS_ERR(old_xattr)) {
46170cc50828c3 Hugh Dickins        2023-08-08  3606  		simple_xattr_free(old_xattr);
46170cc50828c3 Hugh Dickins        2023-08-08  3607  		old_xattr = NULL;
36f05cab0a2c97 Jeff Layton         2022-09-09  3608  		inode->i_ctime = current_time(inode);
36f05cab0a2c97 Jeff Layton         2022-09-09  3609  		inode_inc_iversion(inode);
36f05cab0a2c97 Jeff Layton         2022-09-09  3610  	}
46170cc50828c3 Hugh Dickins        2023-08-08 @3611  	return PTR_ERR(old_xattr);
b09e0fa4b4ea66 Eric Paris          2011-05-24  3612  }
b09e0fa4b4ea66 Eric Paris          2011-05-24  3613  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
