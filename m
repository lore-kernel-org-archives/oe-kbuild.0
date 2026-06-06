Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BBD4071C3
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jun 2026 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780756926; cv=none; b=h8ywydATuKTRnffp16Oe0iGkpCIfoR11zGucVx+YxsYQ2kA+QzYyMIRUt/LuXz94+wvO19fifnatJVaP7fHfQOr9XjijRy+Ae2WzLIcc4yaMzTHIkwC/fgVJKyrZhDhrfdpXBKFs88GfFWQCdhM+HT/VwhnZJKrA2ofRaz9EGBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780756926; c=relaxed/simple;
	bh=Lh+a8uPKKUfn9E0xHYp7RWcf8dWzhIyF5s5wz73tECI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FtN6zNjn3ndAblFgmKo8/wWvmpM7szbf1AkmuDmRbZmtnaRao6ash3m32ldWXtxsurIPbRxqVD8BvuekTbrw7PTqleLlh5510E8CZrhpGfm2Y/b3xkFcq5PhsiJPuHRTO6sq342UIOxdKPwH7J5OcNWjBYa0rS4oM42IdTBKsTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDNXb/3H; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDNXb/3H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780756905; x=1812292905;
  h=date:from:to:cc:subject:message-id;
  bh=Lh+a8uPKKUfn9E0xHYp7RWcf8dWzhIyF5s5wz73tECI=;
  b=FDNXb/3Hy2vV1OWKktT+i8G/9W5rREiPvbq3G72Ktka4TOaj3vh5yepp
   6/S3j2uO+im34LuurYC/6gHyEWQiyRUPcGWtoMCXVeeyP0KXzk37M9Wrs
   whX0dHfeZqZfmfEqFMVwu99iLIQYlznnVjfyiVBUuP2ht1zINfpWePdgj
   kNje9Fa6a1hk0nQv53bcla6KoGre1GH6/Svt0d9O8S0VaHAWqVH+l+aBm
   +KfXHM+Rrgu+EbO+F9cVpEg0GWYLgnfrYhxaRnZW52O5BCagzZoAXa0Xd
   mpRWSD4rLWUnYKUyNA68G1oU66LDL5F5MtTCVUvqtoG/6BioyT/b68Zcd
   w==;
X-CSE-ConnectionGUID: 9n8wegXKTe+jSi7jJiOuiw==
X-CSE-MsgGUID: cu1zLM1SRkegVWIDknKqFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="93050265"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="93050265"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 07:41:44 -0700
X-CSE-ConnectionGUID: Ikhgg1bkT6SqCb+jlRATOw==
X-CSE-MsgGUID: JHpNzSK2QOmY4Bz+hqSwDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="250031405"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Jun 2026 07:41:42 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVsDT-00000000H4k-11V4;
	Sat, 06 Jun 2026 14:41:39 +0000
Date: Sat, 06 Jun 2026 22:41:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11684/11755] include/linux/hwmon.h:500:1:
 sparse: sparse: an expression is expected before ')'
Message-ID: <202606062219.vAKIVaVo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ingo Molnar <mingo@kernel.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6e845bcb78c95af935094040bd4edc3c2b6dd784
commit: bf2f2ad04c7d25a690b0e4bcabf05e6f3a80c598 [11684/11755] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
:::::: branch date: 25 hours ago
:::::: commit date: 26 hours ago
config: sh-randconfig-r132-20260606 (https://download.01.org/0day-ci/archive/20260606/202606062219.vAKIVaVo-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606062219.vAKIVaVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606062219.vAKIVaVo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hwmon/intel-m10-bmc-hwmon.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/intel-m10-bmc-hwmon.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/intel-m10-bmc-hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/intel-m10-bmc-hwmon.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/intel-m10-bmc-hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/intel-m10-bmc-hwmon.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/intel-m10-bmc-hwmon.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/intel-m10-bmc-hwmon.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/adt7x10.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7x10.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7x10.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7x10.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7x10.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7x10.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7x10.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7x10.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7x10.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/irq_work.h, include/linux/irqdesc.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7x10.c: note: in included file:
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/ad7314.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7314.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7314.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7314.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7314.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7314.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7314.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7314.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/linux/spi/spi.h):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7314.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/mm.h, include/linux/scatterlist.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7314.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/huge_mm.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7314.c: note: in included file (through include/linux/fs.h, include/linux/huge_mm.h, include/linux/mm.h, include/linux/scatterlist.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7314.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/iio_hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/iio_hwmon.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/iio_hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/iio_hwmon.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/iio_hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/iio_hwmon.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/iio_hwmon.c: note: in included file (through include/linux/platform_device.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/iio_hwmon.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/lm70.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm70.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm70.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm70.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm70.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm70.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm70.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm70.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm70.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/linux/spi/spi.h):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm70.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/mm.h, include/linux/scatterlist.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm70.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/huge_mm.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm70.c: note: in included file (through include/linux/fs.h, include/linux/huge_mm.h, include/linux/mm.h, include/linux/scatterlist.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/ads7828.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ads7828.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ads7828.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ads7828.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ads7828.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ads7828.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ads7828.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ads7828.c: note: in included file (through include/linux/hwmon-sysfs.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ads7828.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ads7828.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ads7828.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ads7828.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ads7828.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/ltc2947-core.c: note: in included file (through include/linux/notifier.h, include/linux/clk.h):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2947-core.c: note: in included file (through include/linux/rwsem.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2947-core.c: note: in included file (through include/linux/notifier.h, include/linux/clk.h):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2947-core.c: note: in included file (through include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2947-core.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2947-core.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2947-core.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2947-core.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/ad7414.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7414.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7414.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7414.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7414.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7414.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7414.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7414.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7414.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7414.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7414.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7414.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ad7414.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/adm1029.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1029.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1029.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1029.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1029.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1029.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1029.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1029.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1029.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1029.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1029.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1029.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1029.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/w83773g.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83773g.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83773g.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83773g.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83773g.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83773g.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83773g.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83773g.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83773g.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83773g.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83773g.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83773g.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83773g.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/aht10.c: note: in included file (through include/linux/sched.h, include/linux/delay.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/aht10.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/aht10.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/aht10.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/aht10.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/aht10.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/aht10.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/aht10.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/aht10.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/aht10.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/aht10.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/aht10.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/aht10.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/atxp1.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/atxp1.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/atxp1.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/atxp1.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/atxp1.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/atxp1.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/atxp1.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/atxp1.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/atxp1.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/atxp1.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/atxp1.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/atxp1.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/atxp1.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/hih6130.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hih6130.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hih6130.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hih6130.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hih6130.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hih6130.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hih6130.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hih6130.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hih6130.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hih6130.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hih6130.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hih6130.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hih6130.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/hs3001.c: note: in included file (through include/linux/sched.h, include/linux/delay.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hs3001.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hs3001.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hs3001.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hs3001.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hs3001.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hs3001.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hs3001.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hs3001.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hs3001.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hs3001.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hs3001.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hs3001.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/da9052-hwmon.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/da9052-hwmon.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/da9052-hwmon.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/da9052-hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/da9052-hwmon.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/da9052-hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/da9052-hwmon.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/da9052-hwmon.c: note: in included file (through include/linux/hwmon-sysfs.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/da9052-hwmon.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/irq_work.h, include/linux/irqdesc.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/da9052-hwmon.c: note: in included file (through include/linux/mfd/da9052/da9052.h):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/da9052-hwmon.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/da9052-hwmon.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/da9052-hwmon.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/lm73.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm73.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm73.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm73.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm73.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm73.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm73.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm73.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm73.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm73.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm73.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm73.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm73.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/ltc4215.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4215.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4215.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4215.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4215.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4215.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4215.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4215.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4215.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4215.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4215.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4215.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4215.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/adm1025.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1025.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1025.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1025.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1025.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1025.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1025.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1025.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1025.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1025.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1025.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1025.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1025.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/adm9240.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm9240.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm9240.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm9240.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm9240.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm9240.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm9240.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm9240.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm9240.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm9240.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm9240.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm9240.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm9240.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/ds1621.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ds1621.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ds1621.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ds1621.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ds1621.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ds1621.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ds1621.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ds1621.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ds1621.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ds1621.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ds1621.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ds1621.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ds1621.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/emc1403.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc1403.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc1403.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc1403.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc1403.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc1403.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc1403.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc1403.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc1403.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc1403.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc1403.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc1403.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc1403.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/ltc4260.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4260.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4260.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4260.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4260.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4260.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4260.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4260.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4260.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4260.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4260.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4260.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4260.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/f71805f.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/f71805f.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/f71805f.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/f71805f.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/f71805f.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/f71805f.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/f71805f.c: note: in included file (through include/linux/platform_device.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/f71805f.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/jc42.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/jc42.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/jc42.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/jc42.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/jc42.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/jc42.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/jc42.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/jc42.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/jc42.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/jc42.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/jc42.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/jc42.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/jc42.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/lm83.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm83.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm83.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm83.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm83.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm83.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm83.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm83.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm83.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm83.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm83.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm83.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm83.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/lm95245.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95245.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95245.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95245.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95245.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95245.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95245.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95245.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95245.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95245.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95245.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95245.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95245.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/ltc2945.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2945.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2945.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2945.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2945.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2945.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2945.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2945.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2945.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2945.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2945.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2945.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc2945.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/lm75.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm75.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm75.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm75.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm75.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm75.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm75.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/irq_work.h, include/linux/irqdesc.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm75.c: note: in included file:
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm75.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm75.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm75.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm75.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm75.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/lm77.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm77.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm77.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm77.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm77.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm77.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm77.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm77.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm77.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm77.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm77.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm77.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm77.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/ltc4222.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4222.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4222.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4222.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4222.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4222.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4222.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4222.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4222.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4222.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4222.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4222.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4222.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/ibmpex.c: note: in included file (through include/linux/swait.h, include/linux/completion.h, include/linux/shrinker.h, include/linux/list_lru.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ibmpex.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ibmpex.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ibmpex.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ibmpex.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ibmpex.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ibmpex.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ibmpex.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/proc_fs.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ibmpex.c: note: in included file (through include/linux/fs.h, include/linux/proc_fs.h, include/linux/ipmi.h):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ibmpex.c: note: in included file (through include/linux/acpi.h, include/linux/ipmi.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ibmpex.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/isl28022.c: note: in included file (through include/linux/swait.h, include/linux/completion.h, include/linux/shrinker.h, include/linux/list_lru.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/isl28022.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/isl28022.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/isl28022.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/isl28022.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/isl28022.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/isl28022.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/isl28022.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/debugfs.h):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/isl28022.c: note: in included file (through include/linux/fs.h, include/linux/debugfs.h):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/isl28022.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/isl28022.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/isl28022.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/isl28022.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/adt7470.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7470.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7470.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7470.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7470.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7470.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7470.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7470.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7470.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7470.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7470.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7470.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7470.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/lineage-pem.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lineage-pem.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lineage-pem.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lineage-pem.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lineage-pem.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lineage-pem.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lineage-pem.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lineage-pem.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lineage-pem.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lineage-pem.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lineage-pem.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lineage-pem.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lineage-pem.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/gl518sm.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/gl518sm.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/gl518sm.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/gl518sm.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/gl518sm.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/gl518sm.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/gl518sm.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/gl518sm.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/gl518sm.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/gl518sm.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/gl518sm.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/gl518sm.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/gl518sm.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/lm95241.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95241.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95241.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95241.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95241.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95241.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95241.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95241.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95241.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95241.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95241.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95241.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95241.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/ltc4245.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4245.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4245.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4245.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4245.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4245.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4245.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4245.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4245.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4245.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4245.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4245.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4245.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/max1619.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1619.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1619.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1619.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1619.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1619.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1619.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1619.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1619.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1619.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1619.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1619.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1619.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/w83791d.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83791d.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83791d.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83791d.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83791d.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83791d.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83791d.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83791d.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83791d.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83791d.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83791d.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83791d.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83791d.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/ina209.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina209.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina209.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina209.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina209.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina209.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina209.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina209.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina209.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina209.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina209.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina209.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina209.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/lm80.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm80.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm80.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm80.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm80.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm80.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm80.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm80.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm80.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm80.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm80.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm80.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm80.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/max127.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max127.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max127.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max127.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max127.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max127.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max127.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max127.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max127.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max127.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max127.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max127.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max127.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/menf21bmc_hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/menf21bmc_hwmon.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/menf21bmc_hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/menf21bmc_hwmon.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/menf21bmc_hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/menf21bmc_hwmon.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/menf21bmc_hwmon.c: note: in included file (through include/linux/platform_device.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/menf21bmc_hwmon.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/menf21bmc_hwmon.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/menf21bmc_hwmon.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/menf21bmc_hwmon.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/menf21bmc_hwmon.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/menf21bmc_hwmon.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/lm95234.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95234.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95234.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95234.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95234.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95234.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95234.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95234.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95234.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95234.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95234.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95234.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm95234.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/lm63.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm63.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm63.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm63.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm63.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm63.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm63.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm63.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm63.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm63.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm63.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm63.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm63.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/max31790.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31790.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31790.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31790.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31790.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31790.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31790.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31790.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31790.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31790.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31790.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31790.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31790.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/lm92.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm92.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm92.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm92.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm92.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm92.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm92.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm92.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm92.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm92.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm92.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm92.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm92.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pc87360.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pc87360.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pc87360.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pc87360.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pc87360.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pc87360.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pc87360.c: note: in included file (through include/linux/platform_device.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pc87360.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/emc2103.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc2103.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc2103.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc2103.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc2103.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc2103.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc2103.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc2103.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc2103.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc2103.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc2103.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc2103.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/emc2103.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/ina2xx.c: note: in included file (through include/linux/sched.h, include/linux/delay.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina2xx.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina2xx.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina2xx.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina2xx.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina2xx.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina2xx.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina2xx.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina2xx.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina2xx.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina2xx.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina2xx.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina2xx.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/ina238.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina238.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina238.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina238.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina238.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina238.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina238.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina238.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina238.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina238.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina238.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina238.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ina238.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/smsc47b397.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47b397.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47b397.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47b397.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47b397.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47b397.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47b397.c: note: in included file (through include/linux/platform_device.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47b397.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/adm1026.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1026.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1026.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1026.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1026.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1026.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1026.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1026.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1026.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1026.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1026.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1026.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adm1026.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/adt7462.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7462.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7462.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7462.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7462.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7462.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7462.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7462.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7462.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7462.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7462.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7462.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7462.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/mcp3021.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp3021.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp3021.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp3021.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp3021.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp3021.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp3021.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp3021.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp3021.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp3021.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp3021.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp3021.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp3021.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/dme1737.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/dme1737.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/dme1737.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/dme1737.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/dme1737.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/dme1737.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/dme1737.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/dme1737.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/dme1737.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/dme1737.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/dme1737.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/dme1737.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/dme1737.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/max31730.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31730.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31730.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31730.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31730.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31730.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31730.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31730.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31730.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31730.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31730.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31730.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31730.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/max6650.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6650.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6650.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6650.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6650.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6650.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6650.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6650.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6650.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6650.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6650.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6650.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6650.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6650.c: note: in included file:
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/hwmon.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hwmon.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hwmon.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hwmon.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hwmon.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hwmon.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hwmon.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hwmon.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hwmon.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hwmon.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hwmon.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hwmon.c: note: in included file:
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/hwmon.c: note: in included file (through include/linux/trace_events.h, include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/hwmon.h):
   include/linux/ring_buffer.h:147:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/max16065.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max16065.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max16065.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max16065.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max16065.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max16065.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max16065.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max16065.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max16065.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max16065.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max16065.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max16065.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max16065.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/max31827.c: note: in included file (through include/linux/sched.h, include/linux/delay.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31827.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31827.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31827.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31827.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31827.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31827.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31827.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31827.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31827.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31827.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31827.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31827.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pcf8591.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pcf8591.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pcf8591.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pcf8591.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pcf8591.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pcf8591.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pcf8591.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pcf8591.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pcf8591.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pcf8591.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pcf8591.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pcf8591.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pcf8591.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/nct6775-i2c.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-i2c.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-i2c.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-i2c.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-i2c.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-i2c.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-i2c.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-i2c.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-i2c.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-i2c.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-i2c.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-i2c.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-i2c.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/max31760.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31760.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31760.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31760.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31760.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31760.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31760.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31760.c: note: in included file (through include/linux/hwmon-sysfs.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31760.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31760.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31760.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31760.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max31760.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/max1668.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1668.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1668.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1668.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1668.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1668.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1668.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1668.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1668.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1668.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1668.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1668.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max1668.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/sht21.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht21.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht21.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht21.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht21.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht21.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht21.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht21.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht21.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht21.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht21.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht21.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht21.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/adt7475.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7475.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7475.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7475.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7475.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7475.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7475.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7475.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7475.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7475.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7475.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7475.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/adt7475.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/nct6683.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6683.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6683.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6683.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6683.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6683.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6683.c: note: in included file (through include/linux/acpi.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6683.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/max6697.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6697.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6697.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6697.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6697.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6697.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6697.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6697.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6697.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6697.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6697.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6697.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6697.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/w83795.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83795.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83795.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83795.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83795.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83795.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83795.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83795.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83795.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83795.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83795.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83795.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83795.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/lm85.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm85.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm85.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm85.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm85.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm85.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm85.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm85.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm85.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm85.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm85.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm85.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm85.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/max6639.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6639.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6639.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6639.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6639.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6639.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6639.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6639.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6639.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6639.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6639.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6639.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/max6639.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/sht15.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, include/linux/context_tracking_state.h, include/linux/hardirq.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht15.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht15.c: note: in included file (through include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht15.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht15.c: note: in included file (through include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht15.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/topology.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht15.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/irq_work.h, include/linux/irqdesc.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht15.c: note: in included file:
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht15.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht15.c: note: in included file (through include/linux/hwmon-sysfs.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht15.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht15.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht15.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/ltc4282.c: note: in included file (through include/linux/notifier.h, include/linux/clk.h):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4282.c: note: in included file (through include/linux/rwsem.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4282.c: note: in included file (through include/linux/notifier.h, include/linux/clk.h):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4282.c: note: in included file (through include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4282.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4282.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4282.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4282.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/debugfs.h):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4282.c: note: in included file (through include/linux/fs.h, include/linux/debugfs.h):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4282.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4282.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4282.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/ltc4282.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/mcp9982.c: note: in included file (through include/linux/sched.h, include/linux/delay.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp9982.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp9982.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp9982.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp9982.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp9982.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp9982.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp9982.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp9982.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp9982.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp9982.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp9982.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/mcp9982.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/nct7802.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct7802.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct7802.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct7802.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct7802.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct7802.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct7802.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct7802.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct7802.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct7802.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct7802.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct7802.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct7802.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pwm-fan.c: note: in included file (through include/linux/sched.h, include/linux/delay.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pwm-fan.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pwm-fan.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pwm-fan.c: note: in included file (through include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pwm-fan.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pwm-fan.c: note: in included file (through include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pwm-fan.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/topology.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pwm-fan.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/irq_work.h, include/linux/irqdesc.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pwm-fan.c: note: in included file:
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pwm-fan.c: note: in included file (through include/linux/platform_device.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pwm-fan.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pwm-fan.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pwm-fan.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pwm-fan.c: note: in included file:
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/sht4x.c: note: in included file (through include/linux/sched.h, include/linux/delay.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht4x.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht4x.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht4x.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht4x.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht4x.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht4x.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht4x.c: note: in included file (through include/linux/hwmon-sysfs.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht4x.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht4x.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht4x.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht4x.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sht4x.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/lm90.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm90.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm90.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm90.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm90.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm90.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm90.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm90.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm90.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm90.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm90.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm90.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm90.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/lm93.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm93.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm93.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm93.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm93.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm93.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm93.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm93.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm93.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm93.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm93.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm93.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/lm93.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/smsc47m1.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m1.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m1.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m1.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m1.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m1.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m1.c: note: in included file (through include/linux/platform_device.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m1.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/thmc50.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/thmc50.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/thmc50.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/thmc50.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/thmc50.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/thmc50.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/thmc50.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/thmc50.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/thmc50.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/thmc50.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/thmc50.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/thmc50.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/thmc50.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/wm8350-hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/wm8350-hwmon.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/wm8350-hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/wm8350-hwmon.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/wm8350-hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/wm8350-hwmon.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/wm8350-hwmon.c: note: in included file (through include/linux/platform_device.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/wm8350-hwmon.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/wm8350-hwmon.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/irq_work.h, include/linux/irqdesc.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/wm8350-hwmon.c: note: in included file (through include/linux/mfd/wm8350/core.h):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/wm8350-hwmon.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/wm8350-hwmon.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/wm8350-hwmon.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/sy7636a-hwmon.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sy7636a-hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sy7636a-hwmon.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sy7636a-hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sy7636a-hwmon.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sy7636a-hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sy7636a-hwmon.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sy7636a-hwmon.c: note: in included file (through include/linux/platform_device.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sy7636a-hwmon.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sy7636a-hwmon.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sy7636a-hwmon.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sy7636a-hwmon.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/sy7636a-hwmon.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/spd5118.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/spd5118.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/spd5118.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/spd5118.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/spd5118.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/spd5118.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/spd5118.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/spd5118.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/spd5118.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/spd5118.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/spd5118.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/spd5118.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/spd5118.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/tmp102.c: note: in included file (through include/linux/sched.h, include/linux/delay.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp102.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp102.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp102.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp102.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp102.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp102.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp102.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp102.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp102.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp102.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp102.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp102.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/tmp108.c: note: in included file (through include/linux/sched.h, include/linux/delay.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp108.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp108.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp108.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp108.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp108.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp108.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp108.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp108.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp108.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp108.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp108.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp108.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/tmp421.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp421.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp421.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp421.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp421.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp421.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp421.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp421.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp421.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp421.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp421.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp421.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp421.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/vt1211.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/vt1211.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/vt1211.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/vt1211.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/vt1211.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/vt1211.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/vt1211.c: note: in included file (through include/linux/platform_device.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/vt1211.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/tmp401.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp401.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp401.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp401.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp401.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp401.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp401.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp401.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp401.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp401.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp401.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp401.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp401.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/tmp513.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp513.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp513.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp513.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp513.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp513.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp513.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp513.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp513.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp513.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp513.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp513.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/tmp513.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/stts751.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/stts751.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/stts751.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/stts751.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/stts751.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/stts751.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/stts751.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/stts751.c: note: in included file (through include/linux/hwmon-sysfs.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/stts751.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/stts751.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/stts751.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/stts751.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/stts751.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/smsc47m192.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m192.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m192.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m192.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m192.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m192.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m192.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m192.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m192.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m192.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m192.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m192.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/smsc47m192.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/w83l785ts.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83l785ts.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83l785ts.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83l785ts.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83l785ts.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83l785ts.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83l785ts.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83l785ts.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83l785ts.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83l785ts.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83l785ts.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83l785ts.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83l785ts.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/amc6821.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/amc6821.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/amc6821.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/amc6821.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/amc6821.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/amc6821.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/amc6821.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/amc6821.c: note: in included file (through include/linux/hwmon-sysfs.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/amc6821.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/amc6821.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/amc6821.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/amc6821.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/amc6821.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/amc6821.c: note: in included file:
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/nct6775-core.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-core.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-core.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-core.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-core.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/nct6775-core.c: note: in included file (through include/linux/hwmon-sysfs.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/w83627ehf.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83627ehf.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83627ehf.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83627ehf.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83627ehf.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83627ehf.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83627ehf.c: note: in included file (through include/linux/platform_device.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/w83627ehf.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/occ/common.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/occ/common.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/occ/common.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/occ/common.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/occ/common.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/occ/common.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/occ/common.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/occ/common.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file (through include/linux/swait.h, include/linux/completion.h, include/linux/shrinker.h, include/linux/list_lru.h, ...):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/debugfs.h):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file (through include/linux/fs.h, include/linux/debugfs.h):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file (through include/linux/mm.h, include/linux/memcontrol.h, include/linux/swap.h, include/linux/suspend.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file:
>> include/linux/hwmon.h:500:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file:
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file:
   drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'

vim +500 include/linux/hwmon.h

3ad2a7b9b15d50 Guenter Roeck 2025-06-05  499  
66e09dab4c1276 Guenter Roeck 2026-05-13 @500  DEFINE_GUARD(hwmon_lock, struct device *, hwmon_lock(_T), hwmon_unlock(_T))
66e09dab4c1276 Guenter Roeck 2026-05-13  501  

:::::: The code at line 500 was first introduced by commit
:::::: 66e09dab4c1276577d5cf2de369855881a54c8ca hwmon: Support guard() and scoped_guard for subsystem locks

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
