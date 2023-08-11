Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E786BA40
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Aug 2023 02:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691722171; x=1723258171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZxX4G7PtRKZnYfXyIOIPFaeF+A92AyQPhPhcSqkvvqc=;
  b=eu5lrQnDd8OcrbIiXgjz1rPs81oXcr767HvosKOugCYo4SJp5swHDBPK
   zWHr25fZbT/07Jc1keNKpS95gUjcg2Z8aWNg2yzHZn6KKfltdGQwMDR9s
   8R949Xckl4WOPRVtUtjTL550OmmwlpcXisuO1UWIGaxHIHEw/PVDX+wd4
   mIEgtZHQ/32ZIKZyxg2g1+9yTz0gKMS6le9j6PVBy7ql/1gMzyCs7ldcm
   iv33O6/+3t+kt+mQQ9T8NR2jxFlJjUBqdH9eF8PIr3t2m5jWhVN1DhWkh
   sz0D2m4wSOHwflg8xoW+6kuFgvP8WHgAlqCRg2E/QMajFrEH8nHfRpy+M
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="369050268"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="369050268"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 19:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="726086707"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="726086707"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Aug 2023 19:49:27 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUIDO-0007RO-3A;
	Fri, 11 Aug 2023 02:49:26 +0000
Date: Fri, 11 Aug 2023 10:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-vfs:vfs.tmpfs 15/19] mm/shmem.c:3611
 shmem_xattr_handler_set() warn: passing zero to 'PTR_ERR'
Message-ID: <202308111016.rximb8Ah-lkp@intel.com>
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
head:   3a3c2ca1fb82b27073db2ae1f3eb06820e8d6143
commit: 46170cc50828c33897d192668884d570b2c4e79b [15/19] xattr: simple_xattr_set() return old_xattr to be freed
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: mips-randconfig-m031-20230809 (https://download.01.org/0day-ci/archive/20230811/202308111016.rximb8Ah-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111016.rximb8Ah-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308111016.rximb8Ah-lkp@intel.com/

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
