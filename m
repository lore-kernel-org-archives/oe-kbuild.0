Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6100C274FFD
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 06:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769408585; cv=none; b=glUeSNdDjkYBcuZEg8rDf4WPq3VuXU+d1SowwpJyIUGgiQJErfWrv/hfNr4L0FzMSWMwQ5VH3OAJIveycp8y4qrK9426UhH/2jG63X+58IOT+zY1H3GaiPOIpqPP+FL+4I1+k8ihz0166Vkw7QydD/M7xunDqh2OGf52727SOnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769408585; c=relaxed/simple;
	bh=4DnHksNQlP9b1DIzqw4xSEUSqJfLHDL7hEF/80wyVXk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aVQoirvtLdL9S0kY++UKQp6Rr8dfeyWxS2C+KSud/XhOkVUtaDFq4KI+HlnIjR7eS1tsyLF4a8AoIYNQcGiXG8vociHsUcTsVrQGIhbLWKz6LGvPzWaUXbFqD4vX6qaMvPtD0iVlIUTvgoLXsmVX+s/8nqmI2MSsdK5mr3x0fgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aj0wvwgM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aj0wvwgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769408583; x=1800944583;
  h=date:from:to:cc:subject:message-id;
  bh=4DnHksNQlP9b1DIzqw4xSEUSqJfLHDL7hEF/80wyVXk=;
  b=aj0wvwgMsFpFHrvt+jM1RtmUpa3YJGJBDKN5mUZvigE23JlMDEQrp53J
   NSevPKsuaP+3BicW2XdeQS8kl+Jyw1NT8jUh0we9sgI57DCBEkexNBEVd
   NBqRgayiluhS6nch9nNySPe1/VTpePe5b3Bg13Af7PQD29D/+QrAVM1dg
   6URYQr14m9+JFFrdX9J0G0vpFkWEd+qo7DY0z9nsm3p2IAAQ9v+t3gflD
   smHnNEdR35nwRhTiLnbJXOIWl8sE2q8G+1A+95TYumYOlaMSY2SVNuT9S
   nh96hs283lXJjDo6CnwH20w1/1+l1BVegkb39tBNDH8Ec5Vqunz9Fzhv1
   Q==;
X-CSE-ConnectionGUID: vf9nuHBPT0qjmxxN1BLzFA==
X-CSE-MsgGUID: OJXje4BJRmeEEYmDzZXFMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="73170713"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="73170713"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 22:23:03 -0800
X-CSE-ConnectionGUID: +4oEd6MpRpOAMpTw1wVWsA==
X-CSE-MsgGUID: f+uXerJNTZassNYhGFNb+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="212582071"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Jan 2026 22:23:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkG02-00000000X04-3ndf;
	Mon, 26 Jan 2026 06:22:58 +0000
Date: Mon, 26 Jan 2026 14:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 1/1] fs/fuse/readdir.c:601
 fuse_readdir() warn: passing zero to 'PTR_ERR'
Message-ID: <202601261459.9u38Xu0b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   5b3c238664a9e4ff294071a48ce7292e325e2be2
commit: 57f3ff9648991998d008ecf32f2f9e78a08bfb8b [1/1] ANDROID: fuse-bpf v1.1
:::::: branch date: 22 hours ago
:::::: commit date: 3 years ago
config: x86_64-randconfig-161-20260125 (https://download.01.org/0day-ci/archive/20260126/202601261459.9u38Xu0b-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601261459.9u38Xu0b-lkp@intel.com/

smatch warnings:
fs/fuse/readdir.c:601 fuse_readdir() warn: passing zero to 'PTR_ERR'
fs/fuse/backing.c:1169 fuse_handle_backing() error: we previously assumed 'backing_inode' could be null (see line 1167)
fs/fuse/backing.c:1287 fuse_revalidate_backing() warn: inconsistent indenting
fs/fuse/backing.c:1935 fuse_getattr_finalize() warn: passing zero to 'ERR_PTR'

vim +/PTR_ERR +601 fs/fuse/readdir.c

5d7bc7e8680c7c Miklos Szeredi   2018-10-01  577  
5d7bc7e8680c7c Miklos Szeredi   2018-10-01  578  int fuse_readdir(struct file *file, struct dir_context *ctx)
5d7bc7e8680c7c Miklos Szeredi   2018-10-01  579  {
5d7bc7e8680c7c Miklos Szeredi   2018-10-01  580  	struct fuse_file *ff = file->private_data;
5d7bc7e8680c7c Miklos Szeredi   2018-10-01  581  	struct inode *inode = file_inode(file);
5d7bc7e8680c7c Miklos Szeredi   2018-10-01  582  	int err;
5d7bc7e8680c7c Miklos Szeredi   2018-10-01  583  
57f3ff96489919 Daniel Rosenberg 2021-12-02  584  #ifdef CONFIG_FUSE_BPF
57f3ff96489919 Daniel Rosenberg 2021-12-02  585  	struct fuse_err_ret fer;
57f3ff96489919 Daniel Rosenberg 2021-12-02  586  	bool allow_force;
57f3ff96489919 Daniel Rosenberg 2021-12-02  587  	bool force_again = false;
57f3ff96489919 Daniel Rosenberg 2021-12-02  588  	bool is_continued = false;
57f3ff96489919 Daniel Rosenberg 2021-12-02  589  
57f3ff96489919 Daniel Rosenberg 2021-12-02  590  again:
57f3ff96489919 Daniel Rosenberg 2021-12-02  591  	fer = fuse_bpf_backing(inode, struct fuse_read_io,
57f3ff96489919 Daniel Rosenberg 2021-12-02  592  			       fuse_readdir_initialize, fuse_readdir_backing,
57f3ff96489919 Daniel Rosenberg 2021-12-02  593  			       fuse_readdir_finalize,
57f3ff96489919 Daniel Rosenberg 2021-12-02  594  			       file, ctx, &force_again, &allow_force, is_continued);
57f3ff96489919 Daniel Rosenberg 2021-12-02  595  	if (force_again && !IS_ERR(fer.result)) {
57f3ff96489919 Daniel Rosenberg 2021-12-02  596  		is_continued = true;
57f3ff96489919 Daniel Rosenberg 2021-12-02  597  		goto again;
57f3ff96489919 Daniel Rosenberg 2021-12-02  598  	}
57f3ff96489919 Daniel Rosenberg 2021-12-02  599  
57f3ff96489919 Daniel Rosenberg 2021-12-02  600  	if (fer.ret)
57f3ff96489919 Daniel Rosenberg 2021-12-02 @601  		return PTR_ERR(fer.result);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
