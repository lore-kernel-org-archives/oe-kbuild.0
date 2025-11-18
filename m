Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F1636B048
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Nov 2025 16:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481890; cv=none; b=l1blb4KMBWNhJvvpxmXWktxi/q+38A90DwBDCml9nyJEMNYQpxV4ogo/3/03Iz3d2hwUwbUOW+MGPBu4WRslNDAtZueG4BEJbHbECxktHCZ4KT8whpv6VkqdBAaDBiqmMJnWEPDv3LOTwqp3JTDfRkx7gaykthdRMOusAEthVMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481890; c=relaxed/simple;
	bh=8RI6Dilalvo1Zvbyt53p0mmTmpoIca9XNhnpg+dQHBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fhQGwjR/I9JPJKjCZ2BWxg9uWReVsWzMNTFGWWvN4RM8xPBDZx4DjF4Wm92NZQd9iuciNMhZI2wxTx+vXeFdXCGyJscPJYslbu51QDMUeM2gGaTXt9RUL5q7/96kw1uLvjxTXT+RQrS0hRcjnid85bfT7XJzatZYUXSBGjaPyM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aO2x/Urm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aO2x/Urm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763481888; x=1795017888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8RI6Dilalvo1Zvbyt53p0mmTmpoIca9XNhnpg+dQHBo=;
  b=aO2x/UrmwZfJc0PvK5SCq9jQI/+cO1PLuQzHJEvWvLtP3Bpv0ZUTbAG3
   VW8Egs6tz+hPBsxt/ieyrOHvGTC9dSSvgTCjVQ8AsGR5p/zINJhnNy0Ow
   LCs8j9foFykPrb5RGO4Z0lHETiotRsWobAHj25Hkw+EbRLXOgwo4F6HZf
   tqnljsHNaCkgGpcRRKyVefrQ8rJLRa8UK2OFU6E8yiad49IYSQ0eLsHJ6
   wxv7a2uI+iv51lDbCAjRTy5nRMMAM4+TX5VJPk1vSq/1TL4b/RgoKkp/J
   A8+fDLL7rycWWChaj7x7C7JB7X7QaKb8GX2T6TnbhQdcuI7bS7KoIhpN6
   A==;
X-CSE-ConnectionGUID: HbSb24VzSlKGDT3GgEpbow==
X-CSE-MsgGUID: nENDJtZ4SWy/BM1M1HOsow==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="90983213"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="90983213"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:04:47 -0800
X-CSE-ConnectionGUID: J/+GCpCUTyCIKF5yXdJSGA==
X-CSE-MsgGUID: cP67jdBBTLaIQ4jRKi68pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195101966"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Nov 2025 08:04:46 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLOCB-0001uh-2o;
	Tue, 18 Nov 2025 16:04:43 +0000
Date: Wed, 19 Nov 2025 00:04:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [boqun:shazptr-v2 4/8] kernel/locking/shazptr.c:134:25-30: WARNING
 use flexible-array member instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202511190017.SU1AkQK2-lkp@intel.com>
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
TO: Boqun Feng <boqun.feng@gmail.com>
CC: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git shazptr-v2
head:   904b8eaf21a993852b97d086d8d7a21916090cb9
commit: 31a43aa06d630ad79d471b02aee3348e369e6ba8 [4/8] shazptr: Avoid synchronize_shaptr() busy waiting
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: xtensa-randconfig-r053-20251118 (https://download.01.org/0day-ci/archive/20251119/202511190017.SU1AkQK2-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202511190017.SU1AkQK2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/locking/shazptr.c:134:25-30: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +134 kernel/locking/shazptr.c

31a43aa06d630a Boqun Feng 2025-04-13  122  
31a43aa06d630a Boqun Feng 2025-04-13  123  /* Scan structure for synchronize_shazptr(). */
31a43aa06d630a Boqun Feng 2025-04-13  124  struct shazptr_scan {
31a43aa06d630a Boqun Feng 2025-04-13  125  	struct task_struct *thread;
31a43aa06d630a Boqun Feng 2025-04-13  126  	struct swait_queue_head wq;
31a43aa06d630a Boqun Feng 2025-04-13  127  	struct list_head scanning;
31a43aa06d630a Boqun Feng 2025-04-13  128  	int cpu_grp_size;
31a43aa06d630a Boqun Feng 2025-04-13  129  
31a43aa06d630a Boqun Feng 2025-04-13  130  	struct mutex lock;
31a43aa06d630a Boqun Feng 2025-04-13  131  	struct list_head queued;		/* __guard_by(lock) */
31a43aa06d630a Boqun Feng 2025-04-13  132  	bool scheduled;				/* __guard_by(lock) */
31a43aa06d630a Boqun Feng 2025-04-13  133  
31a43aa06d630a Boqun Feng 2025-04-13 @134  	struct shazptr_snapshot snaps[0];	/* __counted_by(nr_cpu_ids) */
31a43aa06d630a Boqun Feng 2025-04-13  135  };
31a43aa06d630a Boqun Feng 2025-04-13  136  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
