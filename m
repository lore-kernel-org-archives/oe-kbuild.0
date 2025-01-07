Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F471F03E2
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 11:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249850; cv=none; b=nOACsVSaXaWHE4FOg4Hu8I97HDsanGhaqpIMCNJWyRIC9/KXhNVhpYo9ZZraYZiCrlGOFwTE+ud9oM/j1H+yfoiMDM4hOjABnwuWHQC8BD+NdmidYWhoUyacOkq71jphNmpfDmscdcfoNt96sJRYmHP1bIwdYVgqWV2ffKBjRXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249850; c=relaxed/simple;
	bh=6WpBHg5Y+CbCwmbELbhKiXmTrF3Xq+Y3k8yg951L59A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U8K/1Stl6GhewwioTS0WtzTmyji7HmN+j1NvI0XlHqMuvw49iuSvG2NGG3+hsRMot0sSgUUOoEupA+zk2s3HzaC38RKdPtlzJZHPaLxoVL3ZbtJJb2NrC7PTb/Yrer0CCrc8W1PXPQ2KTUbsqBNtixMlQF1/tVePA+z6LgREvSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nM5UzOSg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nM5UzOSg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736249847; x=1767785847;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6WpBHg5Y+CbCwmbELbhKiXmTrF3Xq+Y3k8yg951L59A=;
  b=nM5UzOSgk/Yi3ts0/smW2InlYL83mOPPf4tEG9SxfZqCQ1kdRE70BnpY
   B+aUZHGodi8A8fOYeVXJLaAErARDF0AfUBhMpOlk6ASSCK89GGJ7AlSFy
   EFfAjArutTSEGAjfyRPLIiVKYrQabayaFUSlRlLAA/voodXAv780H6zEE
   jckhfQ/ckc0VCZ6VDAUodNflgZ27obAKOIMAhjoUd7Mia7hIpPtjSAJlD
   CvCUBLktfyrlSxAVc97bfwq47glQoVHY8lW0TXReqWUItORxQEZed+5UD
   QkCmtRSYmBccVfv64vqr4JsqHFnE7RUReY1o9YwoB3oA5SlzmpNLqv+Mu
   g==;
X-CSE-ConnectionGUID: hSvBDKH+R6WHz5VqSOGsgw==
X-CSE-MsgGUID: nJaAgSYVSqet+apveXAqzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36124578"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="36124578"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 03:37:25 -0800
X-CSE-ConnectionGUID: T0c1lPDdS66JTSOnVXrOFA==
X-CSE-MsgGUID: wjx5Q+5NSV+wc6FsTveRaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="107623006"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Jan 2025 03:37:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV7th-000EcR-31;
	Tue, 07 Jan 2025 11:37:21 +0000
Date: Tue, 7 Jan 2025 19:36:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 1/2] drm/panthor: Expose size of driver internal BO's
 over fdinfo
Message-ID: <202501071913.nic4FTbo-lkp@intel.com>
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
In-Reply-To: <20250102203817.956790-2-adrian.larumbe@collabora.com>
References: <20250102203817.956790-2-adrian.larumbe@collabora.com>
TO: "Adrián Larumbe" <adrian.larumbe@collabora.com>
TO: Boris Brezillon <bbrezillon@kernel.org>
TO: Steven Price <steven.price@arm.com>
TO: Liviu Dudau <liviu.dudau@arm.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
CC: kernel@collabora.com
CC: "Adrián Larumbe" <adrian.larumbe@collabora.com>
CC: Mihail Atanassov <mihail.atanassov@arm.com>
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org

Hi Adrián,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20250107]
[cannot apply to linus/master v6.13-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panthor-Expose-size-of-driver-internal-BO-s-over-fdinfo/20250103-044151
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250102203817.956790-2-adrian.larumbe%40collabora.com
patch subject: [PATCH v6 1/2] drm/panthor: Expose size of driver internal BO's over fdinfo
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-r072-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071913.nic4FTbo-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501071913.nic4FTbo-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/panthor/panthor_heap.c:624 panthor_heap_pool_size() warn: iterator 'i' not incremented
drivers/gpu/drm/panthor/panthor_mmu.c:1961 panthor_vm_heaps_sizes() warn: iterator 'i' not incremented
drivers/gpu/drm/panthor/panthor_sched.c:3669 panthor_group_kbo_sizes() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/gpu/drm/panthor/panthor_heap.c:594 panthor_heap_pool_destroy() warn: iterator 'i' not incremented
drivers/gpu/drm/panthor/panthor_mmu.c:1609 panthor_vm_pool_destroy() warn: iterator 'i' not incremented
drivers/gpu/drm/panthor/panthor_sched.c:2884 panthor_fdinfo_gather_group_samples() warn: iterator 'i' not incremented
drivers/gpu/drm/panthor/panthor_sched.c:3646 panthor_group_pool_destroy() warn: iterator 'i' not incremented

vim +/i +624 drivers/gpu/drm/panthor/panthor_heap.c

1026b1b65955e8 Adrián Larumbe 2025-01-02  606  
1026b1b65955e8 Adrián Larumbe 2025-01-02  607  /**
1026b1b65955e8 Adrián Larumbe 2025-01-02  608   * panthor_heap_pool_size() - Calculate size of all chunks across all heaps in a pool
1026b1b65955e8 Adrián Larumbe 2025-01-02  609   * @pool: Pool whose total chunk size to calculate.
1026b1b65955e8 Adrián Larumbe 2025-01-02  610   *
1026b1b65955e8 Adrián Larumbe 2025-01-02  611   * This function adds the size of all heap chunks across all heaps in the
1026b1b65955e8 Adrián Larumbe 2025-01-02  612   * argument pool. It also adds the size of the gpu contexts kernel bo.
1026b1b65955e8 Adrián Larumbe 2025-01-02  613   * It is meant to be used by fdinfo for displaying the size of internal
1026b1b65955e8 Adrián Larumbe 2025-01-02  614   * driver BO's that aren't exposed to userspace through a GEM handle.
1026b1b65955e8 Adrián Larumbe 2025-01-02  615   *
1026b1b65955e8 Adrián Larumbe 2025-01-02  616   */
1026b1b65955e8 Adrián Larumbe 2025-01-02  617  size_t panthor_heap_pool_size(struct panthor_heap_pool *pool)
1026b1b65955e8 Adrián Larumbe 2025-01-02  618  {
1026b1b65955e8 Adrián Larumbe 2025-01-02  619  	struct panthor_heap *heap;
1026b1b65955e8 Adrián Larumbe 2025-01-02  620  	unsigned long i;
1026b1b65955e8 Adrián Larumbe 2025-01-02  621  	size_t size = 0;
1026b1b65955e8 Adrián Larumbe 2025-01-02  622  
1026b1b65955e8 Adrián Larumbe 2025-01-02  623  	down_read(&pool->lock);
1026b1b65955e8 Adrián Larumbe 2025-01-02 @624  	xa_for_each(&pool->xa, i, heap)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
