Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998F6385D88
	for <oe-kbuild@lists.linux.dev>; Thu, 21 May 2026 04:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779338444; cv=none; b=oKZb30sjXIlt6LbuFUSurucYdyTraIfMoa39lpJjrvjdxmiw6qHXOxQuagjoiyOVQLWvi8G94wkelPn8f9OLe6p6E0jnwsjAK6LlLqkRkh5eNZKnfZh6LF5dBwE/1z9J8ETrwnfIsBk5HQmAip6I+I3IaFD/gVq4hHLDXzR36PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779338444; c=relaxed/simple;
	bh=xWeAuIzlPqQ+Z1ZQSozy1X45BJRRx6V9fxLVSqfFADs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M4YOtMibqGEDsrthtSa2MYn7s1Pd/xCGW43U6KFd9H7f7Ywu4NFwQjVnxwTSsbdUKGilLnSdu6m4wZYl4eXiEm8hOYaV7Fbg+oEV/xlXU0TF9BhipYIMEFmhFb4yn6O80dR3e1GAV1n/X7N+a3jDWf0oI6t0eepgenOpe6zzWyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C553UU5k; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C553UU5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779338443; x=1810874443;
  h=date:from:to:cc:subject:message-id;
  bh=xWeAuIzlPqQ+Z1ZQSozy1X45BJRRx6V9fxLVSqfFADs=;
  b=C553UU5kKM/w6guhEJmAIEZfWA89IUnzbhSswJ77fH3J+tIZe7RIhnRJ
   6rcIeUsotnkcQvX+7fwYFMPROIrL+7z/GIg9PmkPFw1FTh2M+rmrO/VaO
   KvOVr3iYug2qPcu08YQSEKp+gIUT8g6tYEdwCFoXBwN4bu9Ttp6HKVr1X
   V8tBEVxcTeJL1B+5E1Dfrw/88fw7oBGl3ljeADXbCgJVFAVf94AowKzke
   8DXmpXmmfjXHpX5Iv9dReQuwtxHYbXWl97rA4P+8KdHMbmlZ2DEayPByy
   e/1RUea3Rii9KF1IbbeMff+kZlNQJk+HPq3SYFl1oeqW0nMsEyUXXRzcC
   g==;
X-CSE-ConnectionGUID: Vn3a6/jZSwO4qfINav/etQ==
X-CSE-MsgGUID: CWvaHQ3fRQajtEyHl9EVSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90550276"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="90550276"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 21:40:42 -0700
X-CSE-ConnectionGUID: HBKNLejTRGOdNhysA3GkfQ==
X-CSE-MsgGUID: yIYDK9wHRumuSHBD96OyaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="234066071"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 20 May 2026 21:40:41 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPvD4-000000004PF-2Ttb;
	Thu, 21 May 2026 04:40:38 +0000
Date: Thu, 21 May 2026 12:40:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-nvme:nvme-7.2 2/7] drivers/nvme/host/core.c:5259
 nvme_wait_freeze_timeout() warn: 'timeout' unsigned <= 0
Message-ID: <202605211257.STzj2Ujv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-nvme@lists.infradead.org
TO: Maurizio Lombardi <mlombard@redhat.com>
CC: Keith Busch <kbusch@kernel.org>
CC: Daniel Wagner <dwagner@suse.de>
CC: Mohamed Khalfella <mkhalfella@purestorage.com>
CC: Hannes Reinecke <hare@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/nvme.git nvme-7.2
head:   00d7b33351aac0ea55d17167561e12bbeca73138
commit: 23b6d2cbf75ff15647efbb7c0e5c03bd7ed1fe1a [2/7] nvme: remove redundant timeout argument from nvme_wait_freeze_timeout
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: s390-randconfig-r073-20260521 (https://download.01.org/0day-ci/archive/20260521/202605211257.STzj2Ujv-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605211257.STzj2Ujv-lkp@intel.com/

smatch warnings:
drivers/nvme/host/core.c:5259 nvme_wait_freeze_timeout() warn: 'timeout' unsigned <= 0

vim +/timeout +5259 drivers/nvme/host/core.c

302ad8cc09339ea Keith Busch       2017-03-01  5248  
23b6d2cbf75ff15 Maurizio Lombardi 2026-05-14  5249  int nvme_wait_freeze_timeout(struct nvme_ctrl *ctrl)
302ad8cc09339ea Keith Busch       2017-03-01  5250  {
23b6d2cbf75ff15 Maurizio Lombardi 2026-05-14  5251  	unsigned long timeout = NVME_IO_TIMEOUT;
302ad8cc09339ea Keith Busch       2017-03-01  5252  	struct nvme_ns *ns;
be647e2c76b27f4 Keith Busch       2024-05-21  5253  	int srcu_idx;
302ad8cc09339ea Keith Busch       2017-03-01  5254  
be647e2c76b27f4 Keith Busch       2024-05-21  5255  	srcu_idx = srcu_read_lock(&ctrl->srcu);
6d1c69945ce63a9 Breno Leitao      2024-11-04  5256  	list_for_each_entry_srcu(ns, &ctrl->namespaces, list,
6d1c69945ce63a9 Breno Leitao      2024-11-04  5257  				 srcu_read_lock_held(&ctrl->srcu)) {
302ad8cc09339ea Keith Busch       2017-03-01  5258  		timeout = blk_mq_freeze_queue_wait_timeout(ns->queue, timeout);
302ad8cc09339ea Keith Busch       2017-03-01 @5259  		if (timeout <= 0)
302ad8cc09339ea Keith Busch       2017-03-01  5260  			break;
302ad8cc09339ea Keith Busch       2017-03-01  5261  	}
be647e2c76b27f4 Keith Busch       2024-05-21  5262  	srcu_read_unlock(&ctrl->srcu, srcu_idx);
7cf0d7c0f3c3b02 Sagi Grimberg     2020-07-30  5263  	return timeout;
302ad8cc09339ea Keith Busch       2017-03-01  5264  }
302ad8cc09339ea Keith Busch       2017-03-01  5265  EXPORT_SYMBOL_GPL(nvme_wait_freeze_timeout);
302ad8cc09339ea Keith Busch       2017-03-01  5266  

:::::: The code at line 5259 was first introduced by commit
:::::: 302ad8cc09339ea261eef58a8d5f4a116a8ffda5 nvme: Complete all stuck requests

:::::: TO: Keith Busch <keith.busch@intel.com>
:::::: CC: Jens Axboe <axboe@fb.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
