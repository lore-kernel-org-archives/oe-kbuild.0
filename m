Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FAA326D4A
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Nov 2025 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132571; cv=none; b=M9BroAP2ugwVzsk58tabgsk+UPUv24cEwCMVY5157xFLN/0wVXrgz8sAPqdr+vHFvQViiPZKYbqV5ZnOP1OdKTSw/S81tspVV8CR6eSVbffRBjjgc5dzs4qLstVsFEd1aOZaFMqAQmW6VgMz+l1VPXzOgRxErUODCKYnYHXQ76w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132571; c=relaxed/simple;
	bh=vo3GHOqXnsKNip8ibWsz5zR5qo4DtnGmLQP04/I7nw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=flMM+LXg4oUVuaLYnm2UrSFUfyGCXYnIEiUZ0Fo2u/1Ap8VU4fb+CKyDy3Rxtljuob7LE/i738rZy7LZ2HgYj91xajZtiP5YIhogOp8jBE8WKcKXdzecxJt9Ny/LakJ/S4dt49CLTD2AHqjj8NXQUqVsqiOYBwSuaKMCko24EZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvveRbJK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvveRbJK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763132569; x=1794668569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vo3GHOqXnsKNip8ibWsz5zR5qo4DtnGmLQP04/I7nw0=;
  b=PvveRbJKXSoSTgzJ2Y4g269EYpjCS8w8ma9Blm/K+77deHE5Dua71ov5
   EU7dYvUg1DGFuUE8E/AspNOdXhZDxKCPS/SgRz4Mi6e10rw0xk27m1FVS
   KdEb0IvXbvnY6uOI8n+PvO6Yltd/L1q/fSP6ztGPEiFo7hJRo2DtFGPbF
   4s+bReuSvu9N7xNs2ISqKqkwxpPNpsRsj3Q9pWjk+w50EiZO8CVwCsGMj
   /HAXM61pz7P0C6KTQHrWeFr1/EO1+H/0afS/OUvThlld9gzQz0o7TVRLu
   PlEk521XspdPqzWF9+MumhP/C73b0YZja3Cu4WkvhPVjpwU3+h7jFQsFw
   Q==;
X-CSE-ConnectionGUID: g/h+3DKnSsSWuzcualkXOg==
X-CSE-MsgGUID: X3YgHFrqT9qqMsWNpZZQqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76688682"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="76688682"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 07:02:49 -0800
X-CSE-ConnectionGUID: iGVqYMpbRj+MO3FSKhpP7A==
X-CSE-MsgGUID: GdCfd/CrSlqhS540I33p6Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Nov 2025 07:02:48 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJvK1-0006gx-1x;
	Fri, 14 Nov 2025 15:02:45 +0000
Date: Fri, 14 Nov 2025 23:02:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android14-kiwi-6.1 0/24] mm/userfaultfd.c:806:13-14:
 WARNING opportunity for swap()
Message-ID: <202511142239.aNPhAVn2-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   2c86a387b0237cd5ce34ef10bd2c404debac3955
commit: 5025ad140e977654afb4896e2882bfc7fd6e48a5 [0/24] BACKPORT: userfaultfd: UFFDIO_MOVE uABI
:::::: branch date: 27 hours ago
:::::: commit date: 1 year, 7 months ago
config: i386-randconfig-053-20251114 (https://download.01.org/0day-ci/archive/20251114/202511142239.aNPhAVn2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202511142239.aNPhAVn2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/userfaultfd.c:806:13-14: WARNING opportunity for swap()

vim +806 mm/userfaultfd.c

5025ad140e9776 Andrea Arcangeli 2023-12-06  794  
5025ad140e9776 Andrea Arcangeli 2023-12-06  795  
5025ad140e9776 Andrea Arcangeli 2023-12-06  796  void double_pt_lock(spinlock_t *ptl1,
5025ad140e9776 Andrea Arcangeli 2023-12-06  797  		    spinlock_t *ptl2)
5025ad140e9776 Andrea Arcangeli 2023-12-06  798  	__acquires(ptl1)
5025ad140e9776 Andrea Arcangeli 2023-12-06  799  	__acquires(ptl2)
5025ad140e9776 Andrea Arcangeli 2023-12-06  800  {
5025ad140e9776 Andrea Arcangeli 2023-12-06  801  	spinlock_t *ptl_tmp;
5025ad140e9776 Andrea Arcangeli 2023-12-06  802  
5025ad140e9776 Andrea Arcangeli 2023-12-06  803  	if (ptl1 > ptl2) {
5025ad140e9776 Andrea Arcangeli 2023-12-06  804  		/* exchange ptl1 and ptl2 */
5025ad140e9776 Andrea Arcangeli 2023-12-06  805  		ptl_tmp = ptl1;
5025ad140e9776 Andrea Arcangeli 2023-12-06 @806  		ptl1 = ptl2;
5025ad140e9776 Andrea Arcangeli 2023-12-06  807  		ptl2 = ptl_tmp;
5025ad140e9776 Andrea Arcangeli 2023-12-06  808  	}
5025ad140e9776 Andrea Arcangeli 2023-12-06  809  	/* lock in virtual address order to avoid lock inversion */
5025ad140e9776 Andrea Arcangeli 2023-12-06  810  	spin_lock(ptl1);
5025ad140e9776 Andrea Arcangeli 2023-12-06  811  	if (ptl1 != ptl2)
5025ad140e9776 Andrea Arcangeli 2023-12-06  812  		spin_lock_nested(ptl2, SINGLE_DEPTH_NESTING);
5025ad140e9776 Andrea Arcangeli 2023-12-06  813  	else
5025ad140e9776 Andrea Arcangeli 2023-12-06  814  		__acquire(ptl2);
5025ad140e9776 Andrea Arcangeli 2023-12-06  815  }
5025ad140e9776 Andrea Arcangeli 2023-12-06  816  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
