Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F302A12B94
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Nov 2025 18:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762539067; cv=none; b=SX0yjgYHSI2DBr1M1T1De/Af/6B1//Bc0k5CpS7s1nB0q/mIsxpWYa9kDbBGgFWKDMgzpXZoRbhugiYHKR+vwZB9wWJq57KPeYy3xIN6D1eI30FSO6C/1XTGas2EiIo5smi+PJwGQS87/yxZ8XEa7gDAF8X4XtGNH17A9oqseWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762539067; c=relaxed/simple;
	bh=/Yd5RyPKTDy6PXZqj+75yphV7lulfyEe7lwTBQVfk0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YUPbcENVmaelNpcNUrKDPNepSL+NfrECV57xPVA1aQIURctyLL/pJr7cD2ifailpOH5fLENznMAw2yT68Zq1Dmy/8ccCMq1am4MFwREdhv9ey/xVTDMDkvGLafDhrarWmQcQNSC1dMQB5uTuXcISf8pjqAY+7h/FJ2sW14rTtpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBDvC0h+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBDvC0h+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762539066; x=1794075066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Yd5RyPKTDy6PXZqj+75yphV7lulfyEe7lwTBQVfk0w=;
  b=jBDvC0h+xpAwz7VcbsoeondHCE87nEJe/yafToeXVJWR5FiiQx4aUE0M
   z/P7LccE1UL++NRliXUKoypQ7FteG1BJJBi1OH4nNWL23hZ2Uqs+a9LQn
   OXeU3TemmIAS8Iky1avGtRENQrNjvbABAg2iw8JxYl+vOUrHTdA67Bi/l
   MRbs4fZFT5eyLy0YAKlUUVdymJnjtrerFxmuAyCGN9XzFvbWOAqfDakIQ
   gKan528Oh/HvhzS5tv3ZZX6Evbe5EMQKGQ76Jl3M+MnSOHIimumCZZAL3
   ya2LNxquo9FyFZDmHtpt74Y2hS0p4g4xN3R6r7XzzPAr2grcPCf+1l4g1
   g==;
X-CSE-ConnectionGUID: E+XlAtR7R/OtoM13kNzXYA==
X-CSE-MsgGUID: dZ+8AHf6SyaJa+V6B8QC6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64729991"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="64729991"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 10:11:05 -0800
X-CSE-ConnectionGUID: hutY+ZVrR2aISHNj+SpfpA==
X-CSE-MsgGUID: 12JlLSwbQ0+IdHxfP+svWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="192356990"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Nov 2025 10:11:04 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHQvO-0000Cd-13;
	Fri, 07 Nov 2025 18:11:02 +0000
Date: Sat, 8 Nov 2025 02:10:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] tee: fix illegal pointer dereference in tee_shm_put()
Message-ID: <202511080047.CQvRMz0N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/tee/tee_shm.c:729:42: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251106102008.1310234-1-yangzhao@kylinos.cn>
References: <20251106102008.1310234-1-yangzhao@kylinos.cn>
TO: yangzhao <yangzhao@kylinos.cn>
TO: op-tee@lists.trustedfirmware.org
TO: linux-kernel@vger.kernel.org
CC: Jens Wiklander <jens.wiklander@linaro.org>
CC: Sumit Garg <sumit.garg@kernel.org>
CC: yangzhao <yangzhao@kylinos.cn>

Hi yangzhao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18-rc4 next-20251107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/yangzhao/tee-fix-illegal-pointer-dereference-in-tee_shm_put/20251106-182801
base:   linus/master
patch link:    https://lore.kernel.org/r/20251106102008.1310234-1-yangzhao%40kylinos.cn
patch subject: [PATCH] tee: fix illegal pointer dereference in tee_shm_put()
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: m68k-randconfig-r134-20251107 (https://download.01.org/0day-ci/archive/20251108/202511080047.CQvRMz0N-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511080047.CQvRMz0N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511080047.CQvRMz0N-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tee/tee_shm.c:729:42: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/tee/tee_shm.c:729:28: sparse: signed value source
   drivers/tee/tee_shm.c:732:50: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/tee/tee_shm.c:732:50: sparse: signed value source

vim +729 drivers/tee/tee_shm.c

967c9cca2cc505 Jens Wiklander 2015-03-11  715  
967c9cca2cc505 Jens Wiklander 2015-03-11  716  /**
967c9cca2cc505 Jens Wiklander 2015-03-11  717   * tee_shm_put() - Decrease reference count on a shared memory handle
967c9cca2cc505 Jens Wiklander 2015-03-11  718   * @shm:	Shared memory handle
967c9cca2cc505 Jens Wiklander 2015-03-11  719   */
967c9cca2cc505 Jens Wiklander 2015-03-11  720  void tee_shm_put(struct tee_shm *shm)
967c9cca2cc505 Jens Wiklander 2015-03-11  721  {
e4a718a3a47e89 Pei Xiao       2025-07-23  722  	struct tee_device *teedev;
dfd0743f1d9ea7 Jens Wiklander 2021-12-09  723  	bool do_release = false;
dfd0743f1d9ea7 Jens Wiklander 2021-12-09  724  
b97c44a95a6f39 yangzhao       2025-11-06  725  	/* checking pointer */
b97c44a95a6f39 yangzhao       2025-11-06  726  	if (IS_ERR_OR_NULL(shm) || !virt_addr_valid(shm))
b97c44a95a6f39 yangzhao       2025-11-06  727  		return;
b97c44a95a6f39 yangzhao       2025-11-06  728  
b97c44a95a6f39 yangzhao       2025-11-06 @729  	if (IS_ERR_OR_NULL(shm->ctx) || !virt_addr_valid(shm->ctx))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
