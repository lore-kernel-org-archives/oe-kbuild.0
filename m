Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223AAD50F
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Jan 2024 08:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706428884; cv=none; b=NFjMKOiA/HdDRU9sxe7sxz2vGLOVKc9oO5ZU2RH/JtYUOMw6IrUoWeRbPKJWCmkJJkL7fKZmOpFREY9VQ4shMl0si2xwKUOZOlxXNDjoePV08a3S5PH+YlRPF9J4bzUCSuoH7qzoGMHH++OlYwyX8KW1eVw3Cl1ih6qv9KmZT2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706428884; c=relaxed/simple;
	bh=Ty4oAUj1jBx3x4GLI77TU4IeJK6d02BQ2+/o0kdS8FU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U9b/LW0eXrrHgqWpTmpMJZ76JHbPc4EQksVBwT/vbJOVnE4VE88v2FUAJyLPwXB7mPdS3fLdVCi3KMtQbZ/mh2bMwiKfZsjGReRMG8D5ulPOO9u+RNYWY4EdH4kc01ejUfLZtaQIWTjSyZdhY/18JkrY6RKvcj45vz/Js95CySY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8gbewKn; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8gbewKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706428882; x=1737964882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ty4oAUj1jBx3x4GLI77TU4IeJK6d02BQ2+/o0kdS8FU=;
  b=H8gbewKnURtkhnM8Ay5Dmc39UGud3yzvxWZbgR6pNSlny7c3SUDxzC3L
   u1YPn1FkO+SoD9o9456YR1S7ofT/unPYkPXVY1Vm0nVyVWGyTcomE17W4
   OyxHk9otWv1JdepRZCL6x9BM9W7MqhMD34V4X+gR8Qz5bXTeH210xFxFE
   gQEXqp8R99MiftOGDRafVgXPKE73VyLbxmjsjDpU310DCnnfAa3MybGRm
   nGPW7Xe/hbfV8DApboLgfH0xixFbEKJNcRy/SVyjPvlHUxyql3WKYedbJ
   A61WiM6LT6/Fqyb1o4r+wGdIVivJlpGHZQX60WJI2nj8gLcssZShi4dph
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="393181315"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="393181315"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 00:01:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="960604788"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="960604788"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Jan 2024 00:01:20 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU06P-0003ES-2f;
	Sun, 28 Jan 2024 08:01:17 +0000
Date: Sun, 28 Jan 2024 16:01:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC v2 3/4] overlayfs: Optimize credentials usage
Message-ID: <202401281540.6nl399om-lkp@intel.com>
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
In-Reply-To: <20240125235723.39507-4-vinicius.gomes@intel.com>
References: <20240125235723.39507-4-vinicius.gomes@intel.com>
TO: Vinicius Costa Gomes <vinicius.gomes@intel.com>

Hi Vinicius,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.8-rc1 next-20240125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vinicius-Costa-Gomes/cleanup-Fix-discarded-const-warning-when-defining-guards/20240126-080128
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20240125235723.39507-4-vinicius.gomes%40intel.com
patch subject: [RFC v2 3/4] overlayfs: Optimize credentials usage
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240128 (https://download.01.org/0day-ci/archive/20240128/202401281540.6nl399om-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401281540.6nl399om-lkp@intel.com/

New smatch warnings:
fs/overlayfs/readdir.c:990 ovl_check_empty_dir() error: uninitialized symbol 'err'.
fs/overlayfs/inode.c:506 ovl_set_or_remove_acl() error: uninitialized symbol 'real_acl'.
fs/overlayfs/xattrs.c:51 ovl_xattr_set() error: uninitialized symbol 'err'.
fs/overlayfs/xattrs.c:126 ovl_listxattr() error: uninitialized symbol 'res'.

Old smatch warnings:
fs/overlayfs/readdir.c:922 ovl_dir_fsync() warn: 'realfile' is an error pointer or valid
fs/overlayfs/inode.c:1221 ovl_get_inode() error: we previously assumed 'lowerpath' could be null (see line 1218)

vim +/err +990 fs/overlayfs/readdir.c

e9be9d5e76e348 Miklos Szeredi       2014-10-24   979  
e9be9d5e76e348 Miklos Szeredi       2014-10-24   980  int ovl_check_empty_dir(struct dentry *dentry, struct list_head *list)
e9be9d5e76e348 Miklos Szeredi       2014-10-24   981  {
e9be9d5e76e348 Miklos Szeredi       2014-10-24   982  	int err;
95e598e7ace2d8 zhangyi (F           2017-10-31   983) 	struct ovl_cache_entry *p, *n;
4edb83bb1041e2 Miklos Szeredi       2017-07-27   984  	struct rb_root root = RB_ROOT;
6d0a8a90a5bbfd Amir Goldstein       2017-11-10   985  	const struct cred *old_cred;
e9be9d5e76e348 Miklos Szeredi       2014-10-24   986  
659396b09f494f Vinicius Costa Gomes 2024-01-25   987  	old_cred = ovl_creds(dentry->d_sb);
659396b09f494f Vinicius Costa Gomes 2024-01-25   988  	scoped_guard(cred, old_cred)
4edb83bb1041e2 Miklos Szeredi       2017-07-27   989  		err = ovl_dir_read_merged(dentry, list, &root);
e9be9d5e76e348 Miklos Szeredi       2014-10-24  @990  	if (err)
e9be9d5e76e348 Miklos Szeredi       2014-10-24   991  		return err;
e9be9d5e76e348 Miklos Szeredi       2014-10-24   992  
e9be9d5e76e348 Miklos Szeredi       2014-10-24   993  	err = 0;
e9be9d5e76e348 Miklos Szeredi       2014-10-24   994  
95e598e7ace2d8 zhangyi (F           2017-10-31   995) 	list_for_each_entry_safe(p, n, list, l_node) {
95e598e7ace2d8 zhangyi (F           2017-10-31   996) 		/*
95e598e7ace2d8 zhangyi (F           2017-10-31   997) 		 * Select whiteouts in upperdir, they should
95e598e7ace2d8 zhangyi (F           2017-10-31   998) 		 * be cleared when deleting this directory.
95e598e7ace2d8 zhangyi (F           2017-10-31   999) 		 */
95e598e7ace2d8 zhangyi (F           2017-10-31  1000) 		if (p->is_whiteout) {
95e598e7ace2d8 zhangyi (F           2017-10-31  1001) 			if (p->is_upper)
e9be9d5e76e348 Miklos Szeredi       2014-10-24  1002  				continue;
95e598e7ace2d8 zhangyi (F           2017-10-31  1003) 			goto del_entry;
95e598e7ace2d8 zhangyi (F           2017-10-31  1004) 		}
e9be9d5e76e348 Miklos Szeredi       2014-10-24  1005  
e9be9d5e76e348 Miklos Szeredi       2014-10-24  1006  		if (p->name[0] == '.') {
e9be9d5e76e348 Miklos Szeredi       2014-10-24  1007  			if (p->len == 1)
95e598e7ace2d8 zhangyi (F           2017-10-31  1008) 				goto del_entry;
e9be9d5e76e348 Miklos Szeredi       2014-10-24  1009  			if (p->len == 2 && p->name[1] == '.')
95e598e7ace2d8 zhangyi (F           2017-10-31  1010) 				goto del_entry;
e9be9d5e76e348 Miklos Szeredi       2014-10-24  1011  		}
e9be9d5e76e348 Miklos Szeredi       2014-10-24  1012  		err = -ENOTEMPTY;
e9be9d5e76e348 Miklos Szeredi       2014-10-24  1013  		break;
95e598e7ace2d8 zhangyi (F           2017-10-31  1014) 
95e598e7ace2d8 zhangyi (F           2017-10-31  1015) del_entry:
95e598e7ace2d8 zhangyi (F           2017-10-31  1016) 		list_del(&p->l_node);
95e598e7ace2d8 zhangyi (F           2017-10-31  1017) 		kfree(p);
e9be9d5e76e348 Miklos Szeredi       2014-10-24  1018  	}
e9be9d5e76e348 Miklos Szeredi       2014-10-24  1019  
e9be9d5e76e348 Miklos Szeredi       2014-10-24  1020  	return err;
e9be9d5e76e348 Miklos Szeredi       2014-10-24  1021  }
e9be9d5e76e348 Miklos Szeredi       2014-10-24  1022  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
