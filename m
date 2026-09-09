Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A86449DB9C
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954537; cv=none; b=aAwnNR99Ke92AY6W+7V1gpIluvmXOC5ppAH8u+HN3l1yzjloy+a1h60Cj5Bz+caF4xbuhE0CjUZ1AkD9iqZXcqSCdULE4umFHYOLwVC2kAw1/7Gqdtuidf/9kf2yBkn86F5jTLzA7Mj15WfC/BTE/xHGlCgJRUQnWocik4VtoqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954537; c=relaxed/simple;
	bh=6LYwol3PUMQDbQQZ68QLtd5CFCQk581QlrEViveK7qk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GgcjVQ0r+Fved377ZPWKYyDT2DJTxQmb8H/tJwQ3kTUCG5IQ9RsXm1/88E8ZFghyQP4Qz5/P6TgUt7jt4vtXXa6tOVZCuDmpigSu6DUzHM1mRmUpumguQYF028HH+OqAclS+bIvu3fQdJ7hMZ6ChdOhA1sd0PJNkp1dYytrgP3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOlMrnaj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOlMrnaj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788954535; x=1820490535;
  h=date:from:to:cc:subject:message-id;
  bh=6LYwol3PUMQDbQQZ68QLtd5CFCQk581QlrEViveK7qk=;
  b=FOlMrnajDjVZdR+jRbWtnwmMVcynaOT3klHYlvEAJ8GJlLK5BqXjVBZF
   +mW1IknEjeSQw5+kIZYJtuqDTZXekz5Bu53+IXrIzZMyzGhDku5EtHW78
   Pko1kAAAiGOsOPcQb9G7dz0Fz1pDIbCFM8DXcs8L9xGX5XGNHicpkfMA6
   l7x+sdesnkJ6SGT2afOzduthFMFTZ6VdJSjOLlqNOzEsAVgRFXxHHZHXk
   GEw7lMaZD0ERA+qaGWzGvH7okiOxke1baijCNmvs1rGDQswNYkQKGSM5N
   0XkdHxDljsNjJyLzuiDZ/JCUGnW06MAw+YIogCeLBLlTvWs4EtZj6LTeI
   w==;
X-CSE-ConnectionGUID: seU4j20mQVG4tndF72lLzg==
X-CSE-MsgGUID: t/+gM4UFQSyNQU6un4xTSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89216111"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89216111"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 04:48:54 -0700
X-CSE-ConnectionGUID: Og7udGlxQJO5dU05cVCsuw==
X-CSE-MsgGUID: vd8sWE6DTO24lobZpw2mdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="296230823"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 04:48:53 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4GnK-000000000Gi-3aHI;
	Wed, 09 Sep 2026 11:48:50 +0000
Date: Wed, 09 Sep 2026 19:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/infiniband/hw/mlx5/devx.c:2544 deliver_event()
 error: __builtin_memcpy() 'event_data->hdr.out_data' too small (8 vs 64)
Message-ID: <202609091953.6LeOXTCj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
CC: "Harry Yoo (Oracle)" <harry@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   893e11787f78e43b534e252249ac3fff4d1333f8
commit: feb662d9168b63e1d4c02671ec96005410c6f3ce slab: support for compiler-assisted type-based slab cache partitioning
date:   4 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 months ago
config: m68k-randconfig-r072-20260909 (https://download.01.org/0day-ci/archive/20260909/202609091953.6LeOXTCj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: feb662d9168b ("slab: support for compiler-assisted type-based slab cache partitioning")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609091953.6LeOXTCj-lkp@intel.com/

New smatch warnings:
drivers/infiniband/hw/mlx5/devx.c:2544 deliver_event() error: __builtin_memcpy() 'event_data->hdr.out_data' too small (8 vs 64)

Old smatch warnings:
drivers/infiniband/hw/mlx5/devx.c:2890 devx_async_event_read() error: copy_to_user() 'event_data' too small (8 vs 72)

vim +2544 drivers/infiniband/hw/mlx5/devx.c

5ec9d8ee87c627 Yishai Hadas    2019-06-30  2510  
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2511  static int deliver_event(struct devx_event_subscription *event_sub,
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2512  			 const void *data)
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2513  {
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2514  	struct devx_async_event_file *ev_file;
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2515  	struct devx_async_event_data *event_data;
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2516  	unsigned long flags;
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2517  
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2518  	ev_file = event_sub->ev_file;
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2519  
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2520  	if (ev_file->omit_data) {
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2521  		spin_lock_irqsave(&ev_file->lock, flags);
a8af8694a5e8dd Yishai Hadas    2020-02-12  2522  		if (!list_empty(&event_sub->event_list) ||
a8af8694a5e8dd Yishai Hadas    2020-02-12  2523  		    ev_file->is_destroyed) {
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2524  			spin_unlock_irqrestore(&ev_file->lock, flags);
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2525  			return 0;
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2526  		}
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2527  
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2528  		list_add_tail(&event_sub->event_list, &ev_file->event_list);
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2529  		spin_unlock_irqrestore(&ev_file->lock, flags);
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2530  		wake_up_interruptible(&ev_file->poll_wait);
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2531  		return 0;
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2532  	}
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2533  
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2534  	event_data = kzalloc(sizeof(*event_data) + sizeof(struct mlx5_eqe),
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2535  			     GFP_ATOMIC);
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2536  	if (!event_data) {
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2537  		spin_lock_irqsave(&ev_file->lock, flags);
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2538  		ev_file->is_overflow_err = 1;
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2539  		spin_unlock_irqrestore(&ev_file->lock, flags);
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2540  		return -ENOMEM;
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2541  	}
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2542  
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2543  	event_data->hdr.cookie = event_sub->cookie;
5ec9d8ee87c627 Yishai Hadas    2019-06-30 @2544  	memcpy(event_data->hdr.out_data, data, sizeof(struct mlx5_eqe));
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2545  
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2546  	spin_lock_irqsave(&ev_file->lock, flags);
f7c8416ccea52b Jason Gunthorpe 2020-01-08  2547  	if (!ev_file->is_destroyed)
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2548  		list_add_tail(&event_data->list, &ev_file->event_list);
f7c8416ccea52b Jason Gunthorpe 2020-01-08  2549  	else
f7c8416ccea52b Jason Gunthorpe 2020-01-08  2550  		kfree(event_data);
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2551  	spin_unlock_irqrestore(&ev_file->lock, flags);
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2552  	wake_up_interruptible(&ev_file->poll_wait);
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2553  
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2554  	return 0;
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2555  }
5ec9d8ee87c627 Yishai Hadas    2019-06-30  2556  

:::::: The code at line 2544 was first introduced by commit
:::::: 5ec9d8ee87c627a2c981d871e41f6e2a942f53fd IB/mlx5: Implement DEVX dispatching event

:::::: TO: Yishai Hadas <yishaih@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
