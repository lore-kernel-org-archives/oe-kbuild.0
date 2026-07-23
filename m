Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DF4385D7F
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jul 2026 16:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825801; cv=none; b=qTU5pCjMOY8nsmSaHqd0PbL+jN5yR66C560FkvxI9EXPfo3IV7ircz/bj52vVZB2B0EuyUn96J0SjfV5+gZwYt6tfzYR8qONuySF55UoS2UJyCN+oAFCvvlZtSigfFyeOIFNzKx3YS040EjPI+MRavhAxtFfh+60wVzegMdIXRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825801; c=relaxed/simple;
	bh=yBtcwGQO/UYU/jWU2GWvdh3DU02EQtTlaextuqHdUb0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j+kNh2enFPM3s+qVhqn7sHTL7ctWmgGSBmuF/kRWtIzpMU939AILra/KVhyzwr023DD0Z9Z14xAyk+j5f+xUcncfECtJ5ZvdinhS41b12BvFKIKegdogBPf3Ocm0yZOo3GqyoyW6LSHdFIBIe7vIiV6Ct6sevb+0njtL+od2yVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkfpvZHq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkfpvZHq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784825799; x=1816361799;
  h=date:from:to:cc:subject:message-id;
  bh=yBtcwGQO/UYU/jWU2GWvdh3DU02EQtTlaextuqHdUb0=;
  b=NkfpvZHqnlizKDZAuaQk/FhvePwS7xDHYcm5cNWJVHgv69Ge4X0zJqqo
   ACf5qdv5hbj8uDsNwQwasQrzAI+N/pzT2gbf7FFqhu1MisTUGfZnxoTP+
   14fYSTsITomlPvKVHPfKREMBE+4g/P/yymakdNmzS7I+g5UJMyL+OlkTA
   RZ3ai+RzFK8MQ1V55p5mIDgu6lgOCoY9tkYqu8T/UwZyh8INQZXOYtOrE
   wDYg6is6PlUj0PY0f5RlnMC6NC0S1YYRDImzPXbvrCsFs4j+tMRuATNnj
   ZuZtUqTAdNdX5BrdJbTalMaKjLWEXFIID4lALgmvKKwj3BmOXQQUgWTD2
   A==;
X-CSE-ConnectionGUID: XXVKYAqYThe/17hywjg3ZA==
X-CSE-MsgGUID: GB7xqlZ5TTS217jJIU/IYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85340144"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="85340144"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 09:56:38 -0700
X-CSE-ConnectionGUID: +Ky0xxKwSu2Xp+P4u3AaMw==
X-CSE-MsgGUID: Pib7qR/TQTK+hOPBPkG00A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="256670842"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Jul 2026 09:56:37 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmwio-00000000ZvY-22yT;
	Thu, 23 Jul 2026 16:56:34 +0000
Date: Fri, 24 Jul 2026 00:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [axboe:block-7.2 42/44] drivers/block/ublk_drv.c:4433:3-9:
 preceding lock on line 4431
Message-ID: <202607240051.mmC9T4aB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ming Lei <tom.leiming@gmail.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git block-7.2
head:   432a9b2780c0a01caf547bd1fc2fcf28aeb8d173
commit: 432a9b2780c0a01caf547bd1fc2fcf28aeb8d173 [42/44] ublk: wait on ublk_dev_ready() instead of ub->completion
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: openrisc-randconfig-r053-20260723 (https://download.01.org/0day-ci/archive/20260724/202607240051.mmC9T4aB-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607240051.mmC9T4aB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/block/ublk_drv.c:4433:3-9: preceding lock on line 4431

vim +4433 drivers/block/ublk_drv.c

47bdf1d29caec72 Seamus Connor 2026-01-14  4417  
432a9b2780c0a01 Ming Lei      2026-07-19  4418  /*
432a9b2780c0a01 Ming Lei      2026-07-19  4419   * Wait until all queues have fetched their I/O commands, and return with
432a9b2780c0a01 Ming Lei      2026-07-19  4420   * ub->mutex held and readiness guaranteed: then every queue's ->canceling
432a9b2780c0a01 Ming Lei      2026-07-19  4421   * is cleared. Ready may regress between wakeup and mutex_lock() (F_BATCH
432a9b2780c0a01 Ming Lei      2026-07-19  4422   * UNPREP, daemon death), so re-check it under the mutex and wait again.
432a9b2780c0a01 Ming Lei      2026-07-19  4423   */
432a9b2780c0a01 Ming Lei      2026-07-19  4424  static int ublk_wait_dev_ready_and_lock(struct ublk_device *ub)
432a9b2780c0a01 Ming Lei      2026-07-19  4425  {
432a9b2780c0a01 Ming Lei      2026-07-19  4426  	while (true) {
432a9b2780c0a01 Ming Lei      2026-07-19  4427  		if (wait_var_event_interruptible(&ub->nr_queue_ready,
432a9b2780c0a01 Ming Lei      2026-07-19  4428  						 ublk_dev_ready(ub)))
432a9b2780c0a01 Ming Lei      2026-07-19  4429  			return -EINTR;
432a9b2780c0a01 Ming Lei      2026-07-19  4430  
432a9b2780c0a01 Ming Lei      2026-07-19 @4431  		mutex_lock(&ub->mutex);
432a9b2780c0a01 Ming Lei      2026-07-19  4432  		if (ublk_dev_ready(ub))
432a9b2780c0a01 Ming Lei      2026-07-19 @4433  			return 0;
432a9b2780c0a01 Ming Lei      2026-07-19  4434  		mutex_unlock(&ub->mutex);
432a9b2780c0a01 Ming Lei      2026-07-19  4435  	}
432a9b2780c0a01 Ming Lei      2026-07-19  4436  }
432a9b2780c0a01 Ming Lei      2026-07-19  4437  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
