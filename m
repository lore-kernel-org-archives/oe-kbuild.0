Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E88C309EE1
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Nov 2025 11:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118767; cv=none; b=JhAWz+EQvkQ+Wv0DJ3OkBKN3bJ19ePPn57Z+agRlW6Hzl/cI43F3myDLhy22+NedDL2OM2Rx559KgBD1P8JmJpE3WQShC6Ne4leEsCI4Fvgtf9NROIbnY0VXCRCG9h5M5o8vY1PC0McEycvbfMAuzuKFU85jiqDrIAHeTumtNi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118767; c=relaxed/simple;
	bh=az133tpb+FSOAMFPzVHnAEJNj4Tpey335p6HOV1/rnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uKN8ZklQG7q/cF3CZWv7/xoKAsebQ5vEd9aHCQgSt02jPEqycrmkb/4PYetyr8k3IGPKk4AG5SQGR8caJPugfjy1Y2jkNzFH5Ngjgodom4bNu6ztqmK6886RV9EXU4DfTHFQ6Ki0NVL+6JkEYGOfuhkiPD0kszPDJUOpRLTB4Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FxueA8Oz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FxueA8Oz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763118765; x=1794654765;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=az133tpb+FSOAMFPzVHnAEJNj4Tpey335p6HOV1/rnE=;
  b=FxueA8OzzdMrf4WfRkVpvwVrlb2lWa3/mB6K72cilB9nlV/L6blnb+a2
   R8QYl0se8kdNO3ebhUiAW+O0nrN20u18N5fa6QM3NpAJN7uhA9Zw2IlLH
   4F6xlw5LUBwc7AgCT9ausN+SgrUYg2eSRVAryW7EWrRRjFLYYxz8zlEtE
   5JdLURB1vbjnHyT4gLTAwbqUZyNhJgHrAjTs50Rh2w8IOMnCKYatXexyr
   VSek1lZKZ+u978LUi9vpqP5FoJOVqP26E7H5g+HsSUtUvp1wRy3zl6O6E
   y9laymQcQkJlZEZHaI7CXuhVOK8jWEIv7XfHpJyOVLGH/6Q6C4mqjrTSf
   Q==;
X-CSE-ConnectionGUID: xtmwBDEBQzOOocdaB1M15Q==
X-CSE-MsgGUID: AL1xeFxSSMKewKZ4uzGWmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65143091"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65143091"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 03:12:28 -0800
X-CSE-ConnectionGUID: vNB/Xo5AQUGWwRyn5EnANw==
X-CSE-MsgGUID: WUpjir3kSyy3HcS4nGdd0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="189050130"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Nov 2025 03:12:27 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJrj6-0006Vj-2a;
	Fri, 14 Nov 2025 11:12:24 +0000
Date: Fri, 14 Nov 2025 19:12:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.ovl.cred.guard 31/46]
 fs/overlayfs/readdir.c:1064 ovl_check_empty_dir() error: uninitialized
 symbol 'err'.
Message-ID: <202511141911.1rOxtjIq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.ovl.cred.guard
head:   74fa97e66e24a79a77ee469a7e8305f2013edd1f
commit: 1213dbacbec9c1d7cca7fc09a82b71c9f4c4f3e5 [31/46] ovl: port ovl_check_empty_dir() to cred guard
:::::: branch date: 14 hours ago
:::::: commit date: 24 hours ago
config: parisc-randconfig-r072-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141911.1rOxtjIq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511141911.1rOxtjIq-lkp@intel.com/

New smatch warnings:
fs/overlayfs/readdir.c:1064 ovl_check_empty_dir() error: uninitialized symbol 'err'.

Old smatch warnings:
fs/overlayfs/readdir.c:893 ovl_iterate() error: uninitialized symbol 'err'.
fs/overlayfs/readdir.c:998 ovl_dir_fsync() warn: 'realfile' is an error pointer or valid

vim +/err +1064 fs/overlayfs/readdir.c

e9be9d5e76e348 Miklos Szeredi    2014-10-24  1055  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1056  int ovl_check_empty_dir(struct dentry *dentry, struct list_head *list)
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1057  {
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1058  	int err;
95e598e7ace2d8 zhangyi (F        2017-10-31  1059) 	struct ovl_cache_entry *p, *n;
4edb83bb1041e2 Miklos Szeredi    2017-07-27  1060  	struct rb_root root = RB_ROOT;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1061  
1213dbacbec9c1 Christian Brauner 2025-11-12  1062  	with_ovl_creds(dentry->d_sb)
4edb83bb1041e2 Miklos Szeredi    2017-07-27  1063  		err = ovl_dir_read_merged(dentry, list, &root);
e9be9d5e76e348 Miklos Szeredi    2014-10-24 @1064  	if (err)
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1065  		return err;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1066  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1067  	err = 0;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1068  
95e598e7ace2d8 zhangyi (F        2017-10-31  1069) 	list_for_each_entry_safe(p, n, list, l_node) {
95e598e7ace2d8 zhangyi (F        2017-10-31  1070) 		/*
95e598e7ace2d8 zhangyi (F        2017-10-31  1071) 		 * Select whiteouts in upperdir, they should
95e598e7ace2d8 zhangyi (F        2017-10-31  1072) 		 * be cleared when deleting this directory.
95e598e7ace2d8 zhangyi (F        2017-10-31  1073) 		 */
95e598e7ace2d8 zhangyi (F        2017-10-31  1074) 		if (p->is_whiteout) {
95e598e7ace2d8 zhangyi (F        2017-10-31  1075) 			if (p->is_upper)
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1076  				continue;
95e598e7ace2d8 zhangyi (F        2017-10-31  1077) 			goto del_entry;
95e598e7ace2d8 zhangyi (F        2017-10-31  1078) 		}
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1079  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1080  		if (p->name[0] == '.') {
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1081  			if (p->len == 1)
95e598e7ace2d8 zhangyi (F        2017-10-31  1082) 				goto del_entry;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1083  			if (p->len == 2 && p->name[1] == '.')
95e598e7ace2d8 zhangyi (F        2017-10-31  1084) 				goto del_entry;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1085  		}
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1086  		err = -ENOTEMPTY;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1087  		break;
95e598e7ace2d8 zhangyi (F        2017-10-31  1088) 
95e598e7ace2d8 zhangyi (F        2017-10-31  1089) del_entry:
95e598e7ace2d8 zhangyi (F        2017-10-31  1090) 		list_del(&p->l_node);
ee95c5fc86ddd1 André Almeida     2025-08-22  1091  		ovl_cache_entry_free(p);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1092  	}
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1093  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1094  	return err;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1095  }
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1096  

:::::: The code at line 1064 was first introduced by commit
:::::: e9be9d5e76e34872f0c37d72e25bc27fe9e2c54c overlay filesystem

:::::: TO: Miklos Szeredi <mszeredi@suse.cz>
:::::: CC: Miklos Szeredi <mszeredi@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
