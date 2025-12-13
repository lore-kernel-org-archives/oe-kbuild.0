Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EAA288514
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 22:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765663527; cv=none; b=jjGvkVWQDCVtVX6qeHRPN5sgUfSyPRAOcGRToBBYgzU9Mq/dlZz4WVT3WnU55KeTlDn9w54Yj2mIrKPn18lLgb/YrXwFxsBqQXhuD/gehwkUrgqBYaWZ0/WaVV3UXZSg5o45dH1H6MihiKYQhfoAttlZlL4H/qSOiq6bi693uIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765663527; c=relaxed/simple;
	bh=3eweciAlU5AwfN6E7qzVRrgQUFpQ7PF8W+9IFdQDvoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ggX4xPUvhf4uhVUsD7tUk6wrBigNJYcP8UxdeciV+qGHtLusXxrnl6v03mcNhxHEDDm7hZcsSZWsF6QB+Co9XGBtgJGIpNf1j7rRxnV/9eA1iDVsFhNwizNb3WVbLUQ0IYnV+r8wZMHtDedLWJlN5M3mdsuEY+sVCF59IAbxNG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+LsSRjw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+LsSRjw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765663526; x=1797199526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3eweciAlU5AwfN6E7qzVRrgQUFpQ7PF8W+9IFdQDvoA=;
  b=T+LsSRjwjyugEhe55UC8a7PEucwF6hvlcpFP7qSRaFgEQtIa0dJoidtT
   kNWalcUswAY2axYdEUq1B1aujdNpVArlF0SzhJ2X1hJEQZWZvFIgLTyjf
   2j6Auy5qBxPAda6PU31YHaCXRmk57ZFoUH4pbLdTyZbPQDV3tqSZNAzoV
   Oc0zU5laT/ZV05TF6lwqnWam9cUjXUIbBVRoz1eQ9VW/b5VtU6p43/W/k
   VHuWyyI83rMdwLv6slwUkJmcjMAssJzGyOxVbC2FX73woepKh0YKiSkPo
   Y438auUuhTF7jHihatugiZfChL88MMiTxAAM/wMw22PvfzdcFCDf1jUdW
   g==;
X-CSE-ConnectionGUID: LWxP6jlrRbeDfJTHILnDTQ==
X-CSE-MsgGUID: y0e0hjE2TMOLcmsUorSGVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67662935"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67662935"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 14:05:25 -0800
X-CSE-ConnectionGUID: /IrZf+H4S42DwxKrbPlTeg==
X-CSE-MsgGUID: /CYbN9D8RWCmupcDulDcKw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Dec 2025 14:05:24 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUXju-000000008Fz-1KNk;
	Sat, 13 Dec 2025 22:05:22 +0000
Date: Sun, 14 Dec 2025 06:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tee/tee_heap.c:327 tee_device_put_all_dma_heaps() warn:
 iterator 'i' not incremented
Message-ID: <202512140600.8QizINFP-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Jens Wiklander <jens.wiklander@linaro.org>
CC: Sumit Garg <sumit.garg@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: c924c65f52c300ba36373e140a43a8e723c3abdd tee: implement protected DMA-heap
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140600.8QizINFP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140600.8QizINFP-lkp@intel.com/

smatch warnings:
drivers/tee/tee_heap.c:327 tee_device_put_all_dma_heaps() warn: iterator 'i' not incremented

vim +/i +327 drivers/tee/tee_heap.c

c924c65f52c300 Jens Wiklander 2025-08-13  321  
c924c65f52c300 Jens Wiklander 2025-08-13  322  void tee_device_put_all_dma_heaps(struct tee_device *teedev)
c924c65f52c300 Jens Wiklander 2025-08-13  323  {
c924c65f52c300 Jens Wiklander 2025-08-13  324  	struct tee_dma_heap *h;
c924c65f52c300 Jens Wiklander 2025-08-13  325  	u_long i;
c924c65f52c300 Jens Wiklander 2025-08-13  326  
c924c65f52c300 Jens Wiklander 2025-08-13 @327  	xa_for_each(&tee_dma_heap, i, h) {
c924c65f52c300 Jens Wiklander 2025-08-13  328  		if (h) {
c924c65f52c300 Jens Wiklander 2025-08-13  329  			mutex_lock(&h->mu);
c924c65f52c300 Jens Wiklander 2025-08-13  330  			if (h->teedev == teedev && !h->shutting_down) {
c924c65f52c300 Jens Wiklander 2025-08-13  331  				h->shutting_down = true;
c924c65f52c300 Jens Wiklander 2025-08-13  332  				put_tee_heap(h);
c924c65f52c300 Jens Wiklander 2025-08-13  333  			}
c924c65f52c300 Jens Wiklander 2025-08-13  334  			mutex_unlock(&h->mu);
c924c65f52c300 Jens Wiklander 2025-08-13  335  		}
c924c65f52c300 Jens Wiklander 2025-08-13  336  	}
c924c65f52c300 Jens Wiklander 2025-08-13  337  }
c924c65f52c300 Jens Wiklander 2025-08-13  338  EXPORT_SYMBOL_GPL(tee_device_put_all_dma_heaps);
c924c65f52c300 Jens Wiklander 2025-08-13  339  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
