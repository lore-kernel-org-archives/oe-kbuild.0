Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DA73E1231
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034377; cv=none; b=TzXl1lr7eE8n6pEWTGAWZTa6egFmmUXktAjsntzT0noCyM2B4zbWEgeKwAwtLVDNxyln9ougjFyW/IWkntQO58vXNWn7UcA9/ZH3kzceDPy8nRv6oqFzMFty8A0jBdkWgQhlrsbSL1T2/3X3ShxATfFXKMdIkL+Qydz9Y7VadLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034377; c=relaxed/simple;
	bh=y8qixBYgjC/Ysm/ccZANmSNs2Q8pOmLBJUmXVdgDNTc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aLQQpZ/vvW1Cy/SLJwGFs8mG5u0GU873uCnABQKQtm/tV/o6rs1YmV0SH6u4jonmRv+mStfr5Xtk4ME1RI8ozEacZJAQh0jxlNsxcCwQILa08i5RiBMQQhSu7FRd+7rxU7OuIx3M5TQAZLC8tAtSQCCBiIixy72UzelgT8I0fus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S59o+Rae; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S59o+Rae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789034376; x=1820570376;
  h=date:from:to:cc:subject:message-id;
  bh=y8qixBYgjC/Ysm/ccZANmSNs2Q8pOmLBJUmXVdgDNTc=;
  b=S59o+RaeZRbEeIHvEKUaQTsR83hvaE9ikDUDB2qcd5Cf0sUfn2OxB422
   HT9Z3j/ad1VI3qR1xtnA5i5lm2h4CdMWbSpU/xDv3LoeIogF7xrahIS/I
   zCGVB8ex2IKivvSZ+e8khftH3yLeSoN9VnrgDBw6xR/++vmkuOcVedbHD
   DUzkmFpyHOj5V/f6JUFLfZTGMNjNf4lFEVMxzkU3SucM6AEcezl7DMa0u
   CmXaVEBQMJX6BKa0ZtVZPaBqKD8/FIvKOTFjJbkSfFWD5e2B58Wyd9+gX
   ebb16LWb26kflZv8N3AtOODIfpmm/GPwljottyBroSSMC6ZdyhH+5DGxb
   A==;
X-CSE-ConnectionGUID: IwRGnY0RRjufv++e1dJ+VA==
X-CSE-MsgGUID: 4rxwFiGmRvyqxaMWRHvixw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88424319"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="88424319"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 02:59:35 -0700
X-CSE-ConnectionGUID: 0p5wx5lWQmu9aWlsEC0LlQ==
X-CSE-MsgGUID: duQpfcD1QpCB4J2ASZEpQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="296540769"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Sep 2026 02:59:34 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4bZ5-000000001eN-40O6;
	Thu, 10 Sep 2026 09:59:31 +0000
Date: Thu, 10 Sep 2026 17:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android-mainline 12/12] fs/incfs/vfs.c:1129
 dir_mkdir() warn: passing zero to 'ERR_PTR'
Message-ID: <202609101719.QdywMsrB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Tudor,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   c9692a371ad73c176aa0f66e06dddd0cec6c20f9
commit: 86898b81492d8fbd0efd2ecfcad0b759f1d9ffc1 [12/12] ANDROID: incfs: prepend incfs_super_ops with "incfs_"
:::::: branch date: 21 hours ago
:::::: commit date: 1 year, 5 months ago
config: x86_64-randconfig-r073-20260910 (https://download.01.org/0day-ci/archive/20260910/202609101719.QdywMsrB-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609101719.QdywMsrB-lkp@intel.com/

New smatch warnings:
fs/incfs/vfs.c:1129 dir_mkdir() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/incfs/vfs.c:1062 dir_lookup() warn: passing zero to 'ERR_PTR'
fs/incfs/vfs.c:1926 incfs_mount_fs() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +1129 fs/incfs/vfs.c

c6819dd77861f2 Eugene Zemtsov  2019-11-18  1064  
488f75a4566943 Tudor Ambarus   2025-04-07  1065  static struct dentry *dir_mkdir(struct mnt_idmap *idmap, struct inode *dir, struct dentry *dentry, umode_t mode)
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1066  {
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1067  	struct mount_info *mi = get_mount_info(dir->i_sb);
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1068  	struct inode_info *dir_node = get_incfs_node(dir);
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1069  	struct dentry *backing_dentry = NULL;
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1070  	struct path backing_path = {};
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1071  	int err = 0;
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1072  
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1073  
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1074  	if (!mi || !dir_node || !dir_node->n_backing_inode)
488f75a4566943 Tudor Ambarus   2025-04-07  1075  		return ERR_PTR(-EBADF);
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1076  
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1077  	err = mutex_lock_interruptible(&mi->mi_dir_struct_mutex);
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1078  	if (err)
488f75a4566943 Tudor Ambarus   2025-04-07  1079  		return ERR_PTR(err);
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1080  
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1081  	get_incfs_backing_path(dentry, &backing_path);
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1082  	backing_dentry = backing_path.dentry;
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1083  
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1084  	if (!backing_dentry) {
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1085  		err = -EBADF;
000d95ac2d250b Akilesh Kailash 2020-07-17  1086  		goto path_err;
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1087  	}
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1088  
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1089  	if (backing_dentry->d_parent == mi->mi_index_dir) {
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1090  		/* Can't create a subdir inside .index */
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1091  		err = -EBUSY;
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1092  		goto out;
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1093  	}
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1094  
7e7bfa94e5ecd9 Paul Lawrence   2020-09-09  1095  	if (backing_dentry->d_parent == mi->mi_incomplete_dir) {
7e7bfa94e5ecd9 Paul Lawrence   2020-09-09  1096  		/* Can't create a subdir inside .incomplete */
7e7bfa94e5ecd9 Paul Lawrence   2020-09-09  1097  		err = -EBUSY;
7e7bfa94e5ecd9 Paul Lawrence   2020-09-09  1098  		goto out;
7e7bfa94e5ecd9 Paul Lawrence   2020-09-09  1099  	}
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1100  	inode_lock_nested(dir_node->n_backing_inode, I_MUTEX_PARENT);
488f75a4566943 Tudor Ambarus   2025-04-07  1101  	backing_dentry = vfs_mkdir(idmap, dir_node->n_backing_inode, backing_dentry, mode | 0222);
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1102  	inode_unlock(dir_node->n_backing_inode);
488f75a4566943 Tudor Ambarus   2025-04-07  1103  	if (!IS_ERR(backing_dentry)) {
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1104  		struct inode *inode = NULL;
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1105  
22b27c439f54c5 Akilesh Kailash 2020-07-18  1106  		if (d_really_is_negative(backing_dentry) ||
22b27c439f54c5 Akilesh Kailash 2020-07-18  1107  			unlikely(d_unhashed(backing_dentry))) {
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1108  			err = -EINVAL;
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1109  			goto out;
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1110  		}
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1111  
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1112  		inode = fetch_regular_inode(dir->i_sb, backing_dentry);
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1113  		if (IS_ERR(inode)) {
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1114  			err = PTR_ERR(inode);
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1115  			goto out;
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1116  		}
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1117  		d_instantiate(dentry, inode);
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1118  	}
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1119  
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1120  out:
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1121  	if (d_really_is_negative(dentry))
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1122  		d_drop(dentry);
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1123  	path_put(&backing_path);
000d95ac2d250b Akilesh Kailash 2020-07-17  1124  
000d95ac2d250b Akilesh Kailash 2020-07-17  1125  path_err:
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1126  	mutex_unlock(&mi->mi_dir_struct_mutex);
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1127  	if (err)
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1128  		pr_debug("incfs: %s err:%d\n", __func__, err);
488f75a4566943 Tudor Ambarus   2025-04-07 @1129  	return ERR_PTR(err);
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1130  }
c6819dd77861f2 Eugene Zemtsov  2019-11-18  1131  

:::::: The code at line 1129 was first introduced by commit
:::::: 488f75a4566943a9de893addc760f468555c25a4 ANDROID: incfs: comply with vfs_mkdir() to return the dentry

:::::: TO: Tudor Ambarus <tudordana@google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
