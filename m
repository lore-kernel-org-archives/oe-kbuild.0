Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27CC3C5DDB
	for <oe-kbuild@lists.linux.dev>; Fri, 29 May 2026 08:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044487; cv=none; b=lVfudwFpFp4XuD8B/1R7b39gFehd0/3mF9493L5B0+R2na9NfjUCP+xtUA+aQ/I4JQ0TmT2L7ax/RkQu5w/XCchhB2t+Iaan3wxipeQeyIWMvdXgFI0UxZyUPjYQfTlECAOb3hpQdUd2p3raTxUZaraSKfQ28K5vUON0AR9czzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044487; c=relaxed/simple;
	bh=wLTFmurOfam9BCo7FGGB1vPoMcmUpUXaz+X2I0PQY1M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fC7mh5/PIxeblEMKEN8jMgNabP93jUsqi97CimkvigUDViFm2Gy3/F56SY7qhPy5+qUT5WE9SMHfyO+WhRAe9uIG821nlGOulGmSpHdJ7EXJ0otgfIe9QD+UA/Nx7BJicO+fq/8qGAE89Oz8iiaxa1Y0vCQWM7iGgbYOCCDPHK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CudnYW1w; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CudnYW1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780044484; x=1811580484;
  h=date:from:to:cc:subject:message-id;
  bh=wLTFmurOfam9BCo7FGGB1vPoMcmUpUXaz+X2I0PQY1M=;
  b=CudnYW1wQJu1KpBvjh9bY2WEm12u22aPKKspGqGGtY6T2bex7iMt9WGT
   +2XZS52Se8Rc9lSZ+VDRuFnli5HlCT0SYMqggRkZPWl0jF/LHx7LI9ybu
   kIziwckcfJB885dnEnTL4tTbOR50e1TbMNs3ivhIuqWej2dkN7E0G0+JC
   bKhvIGRr4sJnXyG4ux0u/EcTvquPwYMbxqqjTUxWwPcDZ8Phzo1ZnQfXz
   JIoUJpMCq5+r+W/8MfGeLQW/+kz0jiU8FLweGNgU5ifI3tqg3fqShjNAT
   +ZAU04HPXKvArbZg4W0kQz/uipv+Efjk/D00qTMIXb5DUOhvJRZb0IJeb
   A==;
X-CSE-ConnectionGUID: ScSDMb/yQFSEl5alMP4nnA==
X-CSE-MsgGUID: 0ebovElzS76/089PzFgg9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="98310078"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="98310078"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 01:48:00 -0700
X-CSE-ConnectionGUID: IPcYg91jQqOmyGVxPN86Aw==
X-CSE-MsgGUID: ezcgQWUMR1qH4p3zxheNVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="280915190"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 May 2026 01:47:58 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSssm-00000000706-1c8R;
	Fri, 29 May 2026 08:47:56 +0000
Date: Fri, 29 May 2026 16:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hare-scsi-devel:configfs-ns.v5 18/26]
 fs/configfs/mount.c:206 configfs_init() warn: missing error code 'err'
Message-ID: <202605291604.0ixc9ROU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v5
head:   ef344c27d4d9d0e8ba46f599a08ab287a95e132b
commit: c799a72504df6236d949d8c65ab1d39ea4dc0ccd [18/26] fs/configfs: dynamically allocate super_info
:::::: branch date: 6 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-r073-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291604.0ixc9ROU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605291604.0ixc9ROU-lkp@intel.com/

New smatch warnings:
fs/configfs/mount.c:206 configfs_init() warn: missing error code 'err'

Old smatch warnings:
fs/configfs/mount.c:205 configfs_init() warn: 'configfs_root' is an error pointer or valid

vim +/err +206 fs/configfs/mount.c

7063fbf2261194f Joel Becker       2005-12-15  184  
7063fbf2261194f Joel Becker       2005-12-15  185  
7063fbf2261194f Joel Becker       2005-12-15  186  static int __init configfs_init(void)
7063fbf2261194f Joel Becker       2005-12-15  187  {
3d0f89bb169482d Joel Becker       2006-01-25  188  	int err = -ENOMEM;
3d0f89bb169482d Joel Becker       2006-01-25  189  
3d0f89bb169482d Joel Becker       2006-01-25  190  	configfs_dir_cachep = kmem_cache_create("configfs_dir_cache",
3d0f89bb169482d Joel Becker       2006-01-25  191  						sizeof(struct configfs_dirent),
20c2df83d25c6a9 Paul Mundt        2007-07-20  192  						0, 0, NULL);
3d0f89bb169482d Joel Becker       2006-01-25  193  	if (!configfs_dir_cachep)
3d0f89bb169482d Joel Becker       2006-01-25  194  		goto out;
7063fbf2261194f Joel Becker       2005-12-15  195  
f9bb48825a6b5d0 Eric W. Biederman 2015-05-13  196  	err = sysfs_create_mount_point(kernel_kobj, "config");
f9bb48825a6b5d0 Eric W. Biederman 2015-05-13  197  	if (err)
7c6455e368bc87e Al Viro           2011-12-13  198  		goto out2;
7c6455e368bc87e Al Viro           2011-12-13  199  
7063fbf2261194f Joel Becker       2005-12-15  200  	err = register_filesystem(&configfs_fs_type);
7c6455e368bc87e Al Viro           2011-12-13  201  	if (err)
b4caecd48005fbe Christoph Hellwig 2015-01-14  202  		goto out3;
7063fbf2261194f Joel Becker       2005-12-15  203  
c799a72504df623 Hannes Reinecke   2026-05-22  204  	configfs_root = configfs_get_root(NULL);
c799a72504df623 Hannes Reinecke   2026-05-22  205  	if (!configfs_root)
c799a72504df623 Hannes Reinecke   2026-05-22 @206  		goto out4;
c799a72504df623 Hannes Reinecke   2026-05-22  207  
7c6455e368bc87e Al Viro           2011-12-13  208  	return 0;
c799a72504df623 Hannes Reinecke   2026-05-22  209  out4:
c799a72504df623 Hannes Reinecke   2026-05-22  210  	pr_err("Unable to get initlal root context\n");
c799a72504df623 Hannes Reinecke   2026-05-22  211  	unregister_filesystem(&configfs_fs_type);
7c6455e368bc87e Al Viro           2011-12-13  212  out3:
b4caecd48005fbe Christoph Hellwig 2015-01-14  213  	pr_err("Unable to register filesystem!\n");
f9bb48825a6b5d0 Eric W. Biederman 2015-05-13  214  	sysfs_remove_mount_point(kernel_kobj, "config");
7c6455e368bc87e Al Viro           2011-12-13  215  out2:
e0bf68ddec4f4f9 Peter Zijlstra    2007-10-16  216  	kmem_cache_destroy(configfs_dir_cachep);
e0bf68ddec4f4f9 Peter Zijlstra    2007-10-16  217  	configfs_dir_cachep = NULL;
3d0f89bb169482d Joel Becker       2006-01-25  218  out:
7063fbf2261194f Joel Becker       2005-12-15  219  	return err;
7063fbf2261194f Joel Becker       2005-12-15  220  }
7063fbf2261194f Joel Becker       2005-12-15  221  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
