Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58FD1353E1
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Apr 2024 17:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713115753; cv=none; b=BYpb4YIEoOOmDF50DBVoJMaNbVP7KxXzkSpP9P8MVkICCXTSUQG0FAN1tTmqHuAnSaYJnl2AtopzjlZgWKIvJttGB6vN1LVCf776o49AVLN/yzjOf7ttn+hO9oYUOpeHYakCsKyY6k5g5FyvH05aWsCjuUKFg+PZ0G+XCfudVLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713115753; c=relaxed/simple;
	bh=fvOpnJ/fQKrGQDdpN7zZiGJM2bHXZaqL4Z6xnjpMP4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VSx3cAi9S9zvlyQ1WuyN2Tfu0EwT5xtqdqqursXg8g/CXkVwCEbeIDXZhLcmTCL5sgiIXSTND9zWJbFvrMik85m0R9b7BK6908mZN0cYkEYDwUynGSIz761nTXeImewZhC517rUZ/L+3YTSeHsydqApoqP6zGiG/cf8y3SDkE20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f57KdchP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f57KdchP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713115752; x=1744651752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fvOpnJ/fQKrGQDdpN7zZiGJM2bHXZaqL4Z6xnjpMP4M=;
  b=f57KdchP5E4T9Qa+/x9M3WlTCCYQH0kEYnsIffCRVWJQHNXUt+5/fPNc
   EQ5taJHDh4JVVWO2G0EELPxS102JgwtJFq6KtzHnVp/RLwUHSs5/b85uH
   D7/1aIopWqpd/3AD1jdVavc68z/UpGUiQ+Qj9Y3VtUrz9PW6t2YTipgg3
   OFfJ7xlKODQD0+yQ3KW1gSt/YmDtNXnjivvorR5VD+5zlvLN7xG3FB3QF
   vNOAWRrclKJyZM7zoDNO5+3KnGYj3TNRaQpKDr4iRbtxNmvJO1vflUDyT
   6A+lsx0oZ611BVwc0v6S6dxNysymR6uPhAtCbCAvwOGFoEuub0REx5zLc
   g==;
X-CSE-ConnectionGUID: x6VONkUgTT6W/cjOeg5Rhg==
X-CSE-MsgGUID: 9tmA3qjiSdSRYusVF7h1VQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8723656"
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="8723656"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 10:29:11 -0700
X-CSE-ConnectionGUID: 7Ve1v5vOQTmMLeFryBU4Mw==
X-CSE-MsgGUID: 927s0HyzScenKXbgump0OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="22275938"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 Apr 2024 10:29:09 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rw3f9-0003jI-1J;
	Sun, 14 Apr 2024 17:29:07 +0000
Date: Mon, 15 Apr 2024 01:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [ti:ti-linux-6.6.y-wip 16/18]
 drivers/remoteproc/remoteproc_cdev.c:167:6-16: ERROR: reference preceded by
 free on line 165
Message-ID: <202404150107.gJtdbKtX-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Andrew Davis <afd@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   6b3bec4539bd706892be36c3b481b9aa7cbe27a8
commit: cde91a89becee656867b8c8a86e627241dc91449 [16/18] remoteproc: core: Add DMA-BUF attachment interface to cdev
:::::: branch date: 3 days ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-101-20240414 (https://download.01.org/0day-ci/archive/20240415/202404150107.gJtdbKtX-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404150107.gJtdbKtX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/remoteproc/remoteproc_cdev.c:167:6-16: ERROR: reference preceded by free on line 165

vim +167 drivers/remoteproc/remoteproc_cdev.c

a4dac51a55b795 Andrew Davis    2024-02-21  150  
a4dac51a55b795 Andrew Davis    2024-02-21  151  static int rproc_cdev_release(struct inode *inode, struct file *filp)
a4dac51a55b795 Andrew Davis    2024-02-21  152  {
a4dac51a55b795 Andrew Davis    2024-02-21  153  	struct rproc_cdev *rproc_cdev = filp->private_data;
a4dac51a55b795 Andrew Davis    2024-02-21  154  	struct rproc *rproc = rproc_cdev->rproc;
6e71d2b2a2b717 Mathieu Poirier 2021-03-12  155  	int ret = 0;
6e71d2b2a2b717 Mathieu Poirier 2021-03-12  156  
cde91a89becee6 Andrew Davis    2024-02-21  157  	/* Release all buffers attached with this file */
cde91a89becee6 Andrew Davis    2024-02-21  158  	struct rproc_cdev_attach *attach, *atmp;
cde91a89becee6 Andrew Davis    2024-02-21  159  	list_for_each_entry_safe(attach, atmp, &rproc_cdev->attachments, node) {
cde91a89becee6 Andrew Davis    2024-02-21  160  		rproc_detach_dmabuf(rproc, attach->dmabuf);
cde91a89becee6 Andrew Davis    2024-02-21  161  		dma_buf_put(attach->dmabuf);
cde91a89becee6 Andrew Davis    2024-02-21  162  		kfree(attach);
cde91a89becee6 Andrew Davis    2024-02-21  163  	}
cde91a89becee6 Andrew Davis    2024-02-21  164  	mutex_destroy(&rproc_cdev->mutex);
cde91a89becee6 Andrew Davis    2024-02-21 @165  	kfree(rproc_cdev);
cde91a89becee6 Andrew Davis    2024-02-21  166  
a4dac51a55b795 Andrew Davis    2024-02-21 @167  	if (!rproc_cdev->cdev_put_on_release)
6e71d2b2a2b717 Mathieu Poirier 2021-03-12  168  		return 0;
4476770881d7ac Siddharth Gupta 2020-07-29  169  
6e71d2b2a2b717 Mathieu Poirier 2021-03-12  170  	if (rproc->state == RPROC_RUNNING)
4476770881d7ac Siddharth Gupta 2020-07-29  171  		rproc_shutdown(rproc);
6e71d2b2a2b717 Mathieu Poirier 2021-03-12  172  	else if (rproc->state == RPROC_ATTACHED)
6e71d2b2a2b717 Mathieu Poirier 2021-03-12  173  		ret = rproc_detach(rproc);
4476770881d7ac Siddharth Gupta 2020-07-29  174  
6e71d2b2a2b717 Mathieu Poirier 2021-03-12  175  	return ret;
4476770881d7ac Siddharth Gupta 2020-07-29  176  }
4476770881d7ac Siddharth Gupta 2020-07-29  177  

:::::: The code at line 167 was first introduced by commit
:::::: a4dac51a55b7950e8e3fdd71db15b8c1686a8a28 remoteproc: core: Make shutdown-on-release per-file handle

:::::: TO: Andrew Davis <afd@ti.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
