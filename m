Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3135C38BF8F
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 23:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768433329; cv=none; b=TRxbFqINaG5jKvETmN+I7l1nwupa8pSsp70XyPt5pcoAz9z6mNX6TEVwFhxWJddlvvoJCG9s2MQje1PVkpvtlgSwbq4DmzP/AZZ3eFT7wi6iZVF02DwIv08HnSy9gnpTj4h5aBt2mavHKWzPsusZBlWXIBGlBc1TjxeMmNELbL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768433329; c=relaxed/simple;
	bh=SE3oUv1zpmWQmUhoJLvoGbRARbkxv1atNT90NoEoDow=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YmB5yGftnXyNMkHP0zYBPr98wsXRlsBmArgZ7UaRfhtd8EVyzLvnhoWzOMtXKWNtnlHqSM6psX4oAHIK7ArZg0oTHsJ4WjPmK8EZpbxYmXx9CYR9jZHNIuKF0Uq/IRmuQAY6R3YEeY8bwix1FZlvPJslRE0rhOIYCCgI8vF//nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVRgw+Kv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVRgw+Kv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768433317; x=1799969317;
  h=date:from:to:cc:subject:message-id;
  bh=SE3oUv1zpmWQmUhoJLvoGbRARbkxv1atNT90NoEoDow=;
  b=XVRgw+Kvh68RgDmliGIyqIGAZeyuVeFwVbqBcSkBCYrgDaKLaBuMzIkM
   A3kIQh3L1tG3Txgo+hMgKts8jEpS6tNtxpxlZaL+M/ClSH86sZiklu7IE
   y8884pY7yoauyun8haT6oAFswdQHkKoaM3w/esNARPR9uLJntBdA+OW8d
   H6aDxm+WjATrBbLs17V4OPFJZV4WJf7EXoETvQxCsXmuIXXD8L+7ersbP
   Ts3lYLXRrJsQLpkUy54ym3hA8t5EceU58ZD445m6bD6J56KJ5EbqNZ0Ha
   6ZQjFfDCLnpg7wOBz+QL96zCoF15p91JOoQ5B9YfDMhVNJME2YbHBbGHS
   g==;
X-CSE-ConnectionGUID: DGYwMw9gT/2iDCiytTkAtg==
X-CSE-MsgGUID: zuYY1c6xQuOlkyKzDpwGtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69717336"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69717336"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 15:28:33 -0800
X-CSE-ConnectionGUID: tFR8S+HrQGG0fLntgoiRVg==
X-CSE-MsgGUID: FseriaQjR7io6FutfO7mGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="205221834"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jan 2026 15:28:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgAHs-00000000HCK-3os9;
	Wed, 14 Jan 2026 23:28:28 +0000
Date: Thu, 15 Jan 2026 07:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 81/81]
 drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: no generic selection
 for 'unsigned long long virtio_cread_v'
Message-ID: <202601150746.g0sUDKQW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: no generic selection for 'unsigned long long virtio_cread_v'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   a62fd0551c62a282d1d60a0eb31e539cd533fa04
commit: bf3f6f01039f7f03350da296935c1f2e2fca7550 [81/81] ANDROID: virtio: virtio_pvclock: initial driver impl
:::::: branch date: 21 hours ago
:::::: commit date: 1 year, 4 months ago
config: i386-randconfig-r122-20260115 (https://download.01.org/0day-ci/archive/20260115/202601150746.g0sUDKQW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150746.g0sUDKQW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601150746.g0sUDKQW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: no generic selection for 'unsigned long long virtio_cread_v'
>> drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/virtio/virtio_pvclock.c:58:9: sparse:    bad type *
   drivers/virtio/virtio_pvclock.c:58:9: sparse:    unsigned long long *
>> drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: no generic selection for 'unsigned long long [addressable] virtio_cread_v'

vim +58 drivers/virtio/virtio_pvclock.c

bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  48  
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  49  void update_suspend_time(struct work_struct *work)
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  50  {
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  51  	u64 suspend_ns, suspend_time_delta = 0;
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  52  	struct timespec64 inject_time;
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  53  	struct virtio_pvclock *vp;
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  54  
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  55  	vp = container_of(work, struct virtio_pvclock,
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  56  			  update_suspend_time_work);
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  57  
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07 @58  	virtio_cread(vp->vdev, struct virtio_pvclock_config, suspend_time_ns,
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  59  		     &suspend_ns);
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  60  
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  61  	mutex_lock(&vp->inject_suspend_lock);
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  62  	if (suspend_ns > vp->injected_suspend_ns) {
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  63  		suspend_time_delta = suspend_ns - vp->injected_suspend_ns;
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  64  		vp->injected_suspend_ns = suspend_ns;
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  65  	}
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  66  	mutex_unlock(&vp->inject_suspend_lock);
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  67  
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  68  	if (suspend_time_delta == 0) {
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  69  		dev_err(&vp->vdev->dev,
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  70  			"%s: suspend_time_ns is less than injected_suspend_ns\n",
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  71  			__func__);
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  72  		return;
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  73  	}
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  74  
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  75  	inject_time = ns_to_timespec64(suspend_time_delta);
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  76  
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  77  	timekeeping_inject_sleeptime64(&inject_time);
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  78  
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  79  	dev_info(&vp->vdev->dev, "injected sleeptime: %llu ns\n",
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  80  		 suspend_time_delta);
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  81  }
bf3f6f01039f7f Colin Downs-Razouk 2021-09-07  82  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
