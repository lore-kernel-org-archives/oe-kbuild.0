Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A4B38332D
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 12:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779540003; cv=none; b=NTe13qMfIxtbSgAd3ZkmUuE5CIbffLsBMnIan2Y+dDfH83565CntLFbcXL/S3//l5tNyyc/i2ej2AkbeusiWqMJ3wpN46pamjLe2jvxQ2kr0EtXeaxKuXvQv99/IXFp7OnOSDJgtSPLN7AD+24NXy4YtRcbrHWp974MC6ONaNjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779540003; c=relaxed/simple;
	bh=NEQO5A+53JP/wo6s3qwz05+B21cQXhV5wbPxFalAZes=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fRKAFKaHu6lhy/vd/fdU7xbKxfjkU+Pbbu4UufTUpgar47lL0dzfm5bKBrS4rW2h5U8JuXuBIEp936Jb6nOggR4x3xwi/Epvg4IRMIQmPJuyQFystbUw2MWbbJCHaUZvm0RApiAYZxHMCq3+MI9LEIZpWmBel3uDk04/HCHAfz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U21YIYRE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U21YIYRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779539986; x=1811075986;
  h=date:from:to:cc:subject:message-id;
  bh=NEQO5A+53JP/wo6s3qwz05+B21cQXhV5wbPxFalAZes=;
  b=U21YIYRE5UoCQyJb67ye+2QN65vFTiTXCvutJz+npNTGxTY/NW/n58nG
   bso+tRLrjGBEBFytSIOKQyM3q55N5Y5nwniOzKGajG5VoaKUsrde5Lc4h
   SpDSd06q1X8wZ3lVe99j8C0hcQgv3Y9cohNScYxqUZwbPQOzXBIzuIiW8
   U2Otdxn1SoBuf8eQnJ/UyWuQy1mCzW4ZAUn8H1pu9e7r/Fd+zOKSd1GIO
   ffNAUHo7ioAgwo0GcGmGx2DfUsGU+R0qmiD3BV+VnkSBz1wHdv8RJEUKr
   vTB2/+Lbt9WY0qP8UvOEVp9UXv57fcUY2NZW4fJgDEHsYOK1H7lA/Hm9q
   A==;
X-CSE-ConnectionGUID: ff/yMitFQuC39cQCiGsaOw==
X-CSE-MsgGUID: uQywA/QkQIu+W9EPujjCRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84063417"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="84063417"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 05:39:45 -0700
X-CSE-ConnectionGUID: GXS5fihDRBmbzL5ZJ5Mv/w==
X-CSE-MsgGUID: D0A4lSy1RVy8s8s0Zalvkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="245194114"
Received: from lkp-server02.sh.intel.com (HELO 4bc6da68457b) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 23 May 2026 05:39:42 -0700
Received: from kbuild by 4bc6da68457b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQlcc-000000000IU-2t9Z;
	Sat, 23 May 2026 12:38:39 +0000
Date: Sat, 23 May 2026 20:34:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peterz-queue:locking/core 10/11]
 arch/x86/kvm/vmx/vmx.c:1599:1: sparse: sparse: an expression is expected
 before ')'
Message-ID: <202605232009.xk619cGG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/x86/kvm/vmx/vmx.c:1599:1: sparse: sparse: an expression is expected before ')'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dmitry Ilvokhin <d@ilvokhin.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   f6b7770edc4a637c416f4cfb201214e40362d05c
commit: 087823f2faa752ac115b05a355521c06210535ae [10/11] cleanup: Annotate guard constructors with __nonnull()
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-r131-20260523 (https://download.01.org/0day-ci/archive/20260523/202605232009.xk619cGG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605232009.xk619cGG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605232009.xk619cGG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/vmx/vmx.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   arch/x86/kvm/vmx/vmx.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/vmx/vmx.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/vmx/vmx.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/vmx/vmx.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/vmx/vmx.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/vmx/vmx.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/vmx/vmx.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/vmx/vmx.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/highmem.h):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/vmx/vmx.c: note: in included file (through include/linux/fs.h, include/linux/highmem.h):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/vmx/vmx.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/resume_user_mode.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/vmx/vmx.c: note: in included file (through include/linux/blk_types.h, include/linux/writeback.h, include/linux/memcontrol.h, include/linux/resume_user_mode.h, ...):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/vmx/vmx.c: note: in included file (through include/linux/trace_events.h, include/trace/syscall.h, include/linux/syscalls.h, include/linux/entry-virt.h, ...):
   include/linux/ring_buffer.h:147:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/vmx/vmx.c: note: in included file (through include/linux/kvm_host.h):
   include/linux/msi.h:236:1: sparse: sparse: an expression is expected before ')'
>> arch/x86/kvm/vmx/vmx.c:1599:1: sparse: sparse: an expression is expected before ')'
--
   arch/x86/kvm/x86.c: note: in included file (through include/linux/sched.h, include/linux/resume_user_mode.h, include/linux/entry-virt.h, include/linux/kvm_host.h):
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
   arch/x86/kvm/x86.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/x86.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/x86.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/x86.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/x86.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/x86.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/x86.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/x86.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/cgroup.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/x86.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/resume_user_mode.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/x86.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/resume_user_mode.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/x86.c: note: in included file (through include/linux/blk_types.h, include/linux/writeback.h, include/linux/memcontrol.h, include/linux/resume_user_mode.h, ...):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/x86.c: note: in included file (through include/linux/trace_events.h, include/trace/syscall.h, include/linux/syscalls.h, include/linux/entry-virt.h, ...):
   include/linux/ring_buffer.h:147:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/x86.c: note: in included file (through include/linux/kvm_host.h):
   include/linux/msi.h:236:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/x86.c: note: in included file:
   include/linux/cpufreq.h:172:1: sparse: sparse: an expression is expected before ')'
   include/linux/cpufreq.h:175:1: sparse: sparse: an expression is expected before ')'
   arch/x86/kvm/x86.c: note: in included file:
>> include/linux/pci.h:2014:1: sparse: sparse: an expression is expected before ')'
--
   drivers/thermal/gov_user_space.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
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
   drivers/thermal/gov_user_space.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_user_space.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_user_space.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_user_space.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_user_space.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_user_space.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_user_space.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_user_space.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_user_space.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_user_space.c: note: in included file (through include/linux/thermal.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_user_space.c: note: in included file:
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_user_space.c: note: in included file:
>> drivers/thermal/thermal_core.h:158:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.h:161:1: sparse: sparse: an expression is expected before ')'
--
   drivers/thermal/thermal_hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
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
   drivers/thermal/thermal_hwmon.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_hwmon.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_hwmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_hwmon.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_hwmon.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_hwmon.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_hwmon.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_hwmon.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_hwmon.c: note: in included file (through include/linux/thermal.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_hwmon.c: note: in included file:
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_hwmon.c: note: in included file:
>> drivers/thermal/thermal_core.h:158:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.h:161:1: sparse: sparse: an expression is expected before ')'
--
   drivers/thermal/thermal_trip.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h, ...):
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
   drivers/thermal/thermal_trip.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_trip.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_trip.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_trip.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_trip.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_trip.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_trip.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_trip.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_trip.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_trip.c: note: in included file (through drivers/thermal/thermal_core.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_trip.c: note: in included file (through drivers/thermal/thermal_core.h):
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_trip.c: note: in included file:
>> drivers/thermal/thermal_core.h:158:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.h:161:1: sparse: sparse: an expression is expected before ')'
--
   drivers/thermal/devfreq_cooling.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h, ...):
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
   drivers/thermal/devfreq_cooling.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/devfreq_cooling.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/devfreq_cooling.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/devfreq_cooling.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/devfreq_cooling.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/devfreq_cooling.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/devfreq_cooling.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/devfreq_cooling.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/devfreq_cooling.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/devfreq_cooling.c: note: in included file (through include/linux/devfreq.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/devfreq_cooling.c: note: in included file (through include/linux/devfreq_cooling.h):
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/devfreq_cooling.c: note: in included file (through drivers/thermal/thermal_trace.h):
>> drivers/thermal/thermal_core.h:158:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.h:161:1: sparse: sparse: an expression is expected before ')'
--
   drivers/thermal/thermal_thresholds.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
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
   drivers/thermal/thermal_thresholds.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_thresholds.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_thresholds.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_thresholds.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_thresholds.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_thresholds.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_thresholds.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_thresholds.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_thresholds.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_thresholds.c: note: in included file (through drivers/thermal/thermal_core.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_thresholds.c: note: in included file (through drivers/thermal/thermal_core.h):
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_thresholds.c: note: in included file:
>> drivers/thermal/thermal_core.h:158:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.h:161:1: sparse: sparse: an expression is expected before ')'
--
   drivers/thermal/gov_fair_share.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/of.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_fair_share.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
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
   drivers/thermal/gov_fair_share.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_fair_share.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_fair_share.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_fair_share.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_fair_share.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_fair_share.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_fair_share.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_fair_share.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_fair_share.c: note: in included file (through include/linux/thermal.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_fair_share.c: note: in included file:
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/gov_fair_share.c: note: in included file (through drivers/thermal/thermal_trace.h):
>> drivers/thermal/thermal_core.h:158:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.h:161:1: sparse: sparse: an expression is expected before ')'
--
   drivers/thermal/thermal_helpers.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h):
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
   drivers/thermal/thermal_helpers.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_helpers.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_helpers.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_helpers.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_helpers.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_helpers.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_helpers.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_helpers.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_helpers.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_helpers.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_helpers.c: note: in included file (through drivers/thermal/thermal_core.h):
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_helpers.c: note: in included file:
>> drivers/thermal/thermal_core.h:158:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.h:161:1: sparse: sparse: an expression is expected before ')'
--
   drivers/thermal/thermal_sysfs.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_sysfs.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
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
   drivers/thermal/thermal_sysfs.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_sysfs.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_sysfs.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_sysfs.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_sysfs.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_sysfs.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_sysfs.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_sysfs.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_sysfs.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_sysfs.c: note: in included file (through drivers/thermal/thermal_core.h):
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_sysfs.c: note: in included file:
>> drivers/thermal/thermal_core.h:158:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.h:161:1: sparse: sparse: an expression is expected before ')'
--
   drivers/thermal/thermal_debugfs.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/thermal/thermal_debugfs.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_debugfs.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_debugfs.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_debugfs.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_debugfs.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_debugfs.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_debugfs.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_debugfs.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/debugfs.h):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_debugfs.c: note: in included file (through include/linux/fs.h, include/linux/debugfs.h):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_debugfs.c: note: in included file (through include/linux/thermal.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_debugfs.c: note: in included file:
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_debugfs.c: note: in included file:
>> drivers/thermal/thermal_core.h:158:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.h:161:1: sparse: sparse: an expression is expected before ')'
--
   drivers/thermal/thermal_netlink.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/thermal/thermal_netlink.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_netlink.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_netlink.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_netlink.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_netlink.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_netlink.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_netlink.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_netlink.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_netlink.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_netlink.c: note: in included file (through include/linux/dma-mapping.h, include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h, ...):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_netlink.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/net/netprio_cgroup.h, include/linux/netdevice.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_netlink.c: note: in included file (through drivers/thermal/thermal_core.h):
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_netlink.c: note: in included file:
>> drivers/thermal/thermal_core.h:158:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.h:161:1: sparse: sparse: an expression is expected before ')'
--
   drivers/thermal/thermal_core.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h):
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
   drivers/thermal/thermal_core.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.c: note: in included file:
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.c: note: in included file (through drivers/thermal/thermal_trace.h):
>> drivers/thermal/thermal_core.h:158:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.h:161:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/thermal_core.c: note: in included file (through include/linux/trace_events.h, include/trace/trace_events.h, include/trace/define_trace.h, drivers/thermal/thermal_trace.h):
   include/linux/ring_buffer.h:147:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/mp5023.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/mp5023.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5023.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5023.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5023.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5023.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5023.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5023.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5023.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5023.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5023.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5023.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5023.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/irps5401.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/irps5401.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/irps5401.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/irps5401.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/irps5401.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/irps5401.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/irps5401.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/irps5401.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/irps5401.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/irps5401.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/irps5401.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/irps5401.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/irps5401.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/bpa-rs600.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/bpa-rs600.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bpa-rs600.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bpa-rs600.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bpa-rs600.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bpa-rs600.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bpa-rs600.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bpa-rs600.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bpa-rs600.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bpa-rs600.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bpa-rs600.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bpa-rs600.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bpa-rs600.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/lt3074.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/lt3074.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lt3074.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lt3074.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lt3074.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lt3074.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lt3074.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lt3074.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lt3074.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lt3074.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lt3074.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lt3074.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lt3074.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/delta-ahe50dc-fan.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/delta-ahe50dc-fan.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/delta-ahe50dc-fan.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/delta-ahe50dc-fan.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/delta-ahe50dc-fan.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/delta-ahe50dc-fan.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/delta-ahe50dc-fan.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/delta-ahe50dc-fan.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/delta-ahe50dc-fan.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/delta-ahe50dc-fan.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/delta-ahe50dc-fan.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/delta-ahe50dc-fan.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/delta-ahe50dc-fan.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/ina233.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/ina233.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ina233.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ina233.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ina233.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ina233.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ina233.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ina233.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ina233.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ina233.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ina233.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ina233.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ina233.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/mp29502.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/mp29502.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp29502.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp29502.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp29502.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp29502.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp29502.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp29502.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp29502.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp29502.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp29502.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp29502.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp29502.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/ltc4286.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/ltc4286.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc4286.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc4286.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc4286.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc4286.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc4286.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc4286.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc4286.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc4286.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc4286.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc4286.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc4286.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/pm6764tr.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/pm6764tr.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pm6764tr.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pm6764tr.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pm6764tr.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pm6764tr.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pm6764tr.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pm6764tr.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pm6764tr.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pm6764tr.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pm6764tr.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pm6764tr.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pm6764tr.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/adp1050.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/adp1050.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/adp1050.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/adp1050.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/adp1050.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/adp1050.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/adp1050.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/adp1050.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/adp1050.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/adp1050.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/adp1050.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/adp1050.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/adp1050.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/ir38064.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/ir38064.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ir38064.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ir38064.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ir38064.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ir38064.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ir38064.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ir38064.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ir38064.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ir38064.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ir38064.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ir38064.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ir38064.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/max17616.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/max17616.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max17616.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max17616.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max17616.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max17616.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max17616.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max17616.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max17616.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max17616.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max17616.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max17616.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max17616.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/mp2925.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/mp2925.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2925.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2925.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2925.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2925.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2925.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2925.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2925.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2925.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2925.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2925.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2925.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/bel-pfe.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/bel-pfe.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bel-pfe.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bel-pfe.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bel-pfe.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bel-pfe.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bel-pfe.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bel-pfe.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bel-pfe.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bel-pfe.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bel-pfe.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bel-pfe.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/bel-pfe.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/mp5990.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/mp5990.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5990.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5990.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5990.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5990.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5990.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5990.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5990.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5990.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5990.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5990.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5990.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/mp9941.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/mp9941.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9941.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9941.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9941.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9941.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9941.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9941.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9941.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9941.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9941.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9941.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9941.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/mp2856.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/mp2856.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2856.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2856.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2856.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2856.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2856.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2856.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2856.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2856.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2856.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2856.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2856.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/ltc3815.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/ltc3815.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc3815.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc3815.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc3815.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc3815.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc3815.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc3815.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc3815.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc3815.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc3815.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc3815.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ltc3815.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/dps920ab.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/hwmon/pmbus/dps920ab.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/dps920ab.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/dps920ab.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/dps920ab.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/dps920ab.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/dps920ab.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/dps920ab.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/dps920ab.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/debugfs.h):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/dps920ab.c: note: in included file (through include/linux/fs.h, include/linux/debugfs.h):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/dps920ab.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/dps920ab.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/dps920ab.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/max16064.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/hwmon/pmbus/max16064.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16064.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16064.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16064.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16064.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16064.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16064.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16064.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16064.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16064.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16064.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16064.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/max34440.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/hwmon/pmbus/max34440.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max34440.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max34440.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max34440.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max34440.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max34440.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max34440.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max34440.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max34440.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max34440.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max34440.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max34440.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/max20751.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/hwmon/pmbus/max20751.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20751.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20751.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20751.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20751.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20751.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20751.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20751.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20751.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20751.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20751.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20751.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/max31785.c: note: in included file (through include/linux/sched.h, include/linux/delay.h):
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
   drivers/hwmon/pmbus/max31785.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max31785.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max31785.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max31785.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max31785.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max31785.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max31785.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max31785.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max31785.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max31785.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max31785.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max31785.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/ibm-cffps.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/hwmon/pmbus/ibm-cffps.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ibm-cffps.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ibm-cffps.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ibm-cffps.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ibm-cffps.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ibm-cffps.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ibm-cffps.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ibm-cffps.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/debugfs.h):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ibm-cffps.c: note: in included file (through include/linux/fs.h, include/linux/debugfs.h):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ibm-cffps.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ibm-cffps.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ibm-cffps.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/mp5920.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/mp5920.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5920.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5920.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5920.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5920.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5920.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5920.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5920.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5920.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5920.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5920.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5920.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/mp9945.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/mp9945.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9945.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9945.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9945.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9945.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9945.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9945.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9945.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9945.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9945.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9945.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp9945.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/pli1209bc.c: note: in included file (through include/linux/sched.h, include/linux/delay.h):
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
   drivers/hwmon/pmbus/pli1209bc.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pli1209bc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pli1209bc.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pli1209bc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pli1209bc.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pli1209bc.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pli1209bc.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pli1209bc.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pli1209bc.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pli1209bc.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pli1209bc.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pli1209bc.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/max15301.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/hwmon/pmbus/max15301.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max15301.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max15301.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max15301.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max15301.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max15301.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max15301.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max15301.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max15301.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max15301.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max15301.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max15301.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/tda38640.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/tda38640.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tda38640.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tda38640.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tda38640.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tda38640.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tda38640.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tda38640.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tda38640.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tda38640.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tda38640.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tda38640.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tda38640.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/tps25990.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/hwmon/pmbus/tps25990.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps25990.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps25990.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps25990.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps25990.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps25990.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps25990.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps25990.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/debugfs.h):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps25990.c: note: in included file (through include/linux/fs.h, include/linux/debugfs.h):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps25990.c: note: in included file (through include/linux/hwmon-sysfs.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps25990.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps25990.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/lm25066.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/hwmon/pmbus/lm25066.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lm25066.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lm25066.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lm25066.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lm25066.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lm25066.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lm25066.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lm25066.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lm25066.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lm25066.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lm25066.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/lm25066.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/acbel-fsg032.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/hwmon/pmbus/acbel-fsg032.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/acbel-fsg032.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/acbel-fsg032.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/acbel-fsg032.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/acbel-fsg032.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/acbel-fsg032.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/acbel-fsg032.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/acbel-fsg032.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/debugfs.h):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/acbel-fsg032.c: note: in included file (through include/linux/fs.h, include/linux/debugfs.h):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/acbel-fsg032.c: note: in included file:
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/acbel-fsg032.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/acbel-fsg032.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/mpq7932.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/mpq7932.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mpq7932.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mpq7932.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mpq7932.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mpq7932.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mpq7932.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mpq7932.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mpq7932.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mpq7932.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mpq7932.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mpq7932.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mpq7932.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/hac300s.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/hac300s.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/hac300s.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/hac300s.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/hac300s.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/hac300s.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/hac300s.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/hac300s.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/hac300s.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/hac300s.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/hac300s.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/hac300s.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/hac300s.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/ucd9000.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/hwmon/pmbus/ucd9000.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ucd9000.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ucd9000.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ucd9000.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ucd9000.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ucd9000.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ucd9000.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ucd9000.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/debugfs.h):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ucd9000.c: note: in included file (through include/linux/fs.h, include/linux/debugfs.h):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ucd9000.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ucd9000.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/ucd9000.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/mp2869.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/mp2869.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2869.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2869.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2869.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2869.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2869.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2869.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2869.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2869.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2869.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2869.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2869.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/stpddc60.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/hwmon/pmbus/stpddc60.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/stpddc60.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/stpddc60.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/stpddc60.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/stpddc60.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/stpddc60.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/stpddc60.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/stpddc60.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/stpddc60.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/stpddc60.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/stpddc60.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/stpddc60.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/max16601.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/max16601.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16601.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16601.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16601.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16601.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16601.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16601.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16601.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16601.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16601.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16601.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max16601.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/tps40422.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/hwmon/pmbus/tps40422.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps40422.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps40422.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps40422.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps40422.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps40422.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps40422.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps40422.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps40422.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps40422.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps40422.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/tps40422.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/mp5926.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/mp5926.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5926.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5926.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5926.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5926.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5926.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5926.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5926.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5926.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5926.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5926.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp5926.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/xdpe152c4.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/xdpe152c4.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe152c4.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe152c4.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe152c4.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe152c4.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe152c4.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe152c4.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe152c4.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe152c4.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe152c4.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe152c4.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe152c4.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/mp2993.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/mp2993.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2993.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2993.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2993.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2993.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2993.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2993.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2993.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2993.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2993.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2993.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2993.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/zl6100.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/hwmon/pmbus/zl6100.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/zl6100.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/zl6100.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/zl6100.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/zl6100.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/zl6100.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/zl6100.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/zl6100.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/zl6100.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/zl6100.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/zl6100.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/zl6100.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/mp2891.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/mp2891.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2891.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2891.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2891.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2891.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2891.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2891.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2891.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2891.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2891.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2891.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/mp2891.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/max20730.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/hwmon/pmbus/max20730.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20730.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20730.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20730.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20730.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20730.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20730.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20730.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/debugfs.h):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20730.c: note: in included file (through include/linux/fs.h, include/linux/debugfs.h):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20730.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20730.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/max20730.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/xdpe1a2g7b.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/hwmon/pmbus/xdpe1a2g7b.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe1a2g7b.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe1a2g7b.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe1a2g7b.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe1a2g7b.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe1a2g7b.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe1a2g7b.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe1a2g7b.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe1a2g7b.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe1a2g7b.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe1a2g7b.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/xdpe1a2g7b.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
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
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file:
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file:
>> drivers/hwmon/pmbus/pmbus.h:576:1: sparse: sparse: an expression is expected before ')'
--
   drivers/media/tuners/mc44s803.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/media/tuners/mc44s803.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mc44s803.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mc44s803.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mc44s803.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mc44s803.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mc44s803.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mc44s803.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mc44s803.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mc44s803.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mc44s803.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mc44s803.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mc44s803.c: note: in included file (through include/media/media-device.h, include/media/dvbdev.h, include/media/dvb_frontend.h):
>> include/linux/pci.h:2014:1: sparse: sparse: an expression is expected before ')'
--
   drivers/media/tuners/tuner-types.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/media/tuners/tuner-types.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-types.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-types.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-types.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-types.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-types.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-types.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-types.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-types.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-types.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-types.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-types.c: note: in included file (through include/media/media-device.h, include/media/v4l2-mc.h, include/media/tuner.h):
>> include/linux/pci.h:2014:1: sparse: sparse: an expression is expected before ')'
--
   drivers/media/tuners/tda18271-maps.c: note: in included file (through drivers/media/tuners/tda18271-priv.h):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-maps.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/media/tuners/tda18271-maps.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-maps.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-maps.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-maps.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-maps.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-maps.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-maps.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-maps.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-maps.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h, drivers/media/tuners/tuner-i2c.h, drivers/media/tuners/tda18271-priv.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-maps.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-maps.c: note: in included file (through include/media/media-device.h, include/media/dvbdev.h, include/media/dvb_frontend.h, drivers/media/tuners/tda18271.h, ...):
>> include/linux/pci.h:2014:1: sparse: sparse: an expression is expected before ')'
--
   drivers/media/tuners/tea5761.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/media/tuners/tea5761.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5761.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5761.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5761.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5761.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5761.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5761.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5761.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5761.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5761.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5761.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5761.c: note: in included file (through include/media/media-device.h, include/media/v4l2-mc.h, include/media/tuner.h):
>> include/linux/pci.h:2014:1: sparse: sparse: an expression is expected before ')'
--
   drivers/media/tuners/xc5000.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/media/tuners/xc5000.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc5000.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc5000.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc5000.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc5000.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc5000.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc5000.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc5000.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc5000.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc5000.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc5000.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc5000.c: note: in included file (through include/media/media-device.h, include/media/dvbdev.h, include/media/dvb_frontend.h):
>> include/linux/pci.h:2014:1: sparse: sparse: an expression is expected before ')'
--
   drivers/media/tuners/tda827x.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/media/tuners/tda827x.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda827x.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda827x.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda827x.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda827x.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda827x.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda827x.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda827x.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda827x.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda827x.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h, drivers/media/tuners/tda827x.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda827x.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda827x.c: note: in included file (through include/media/media-device.h, include/media/dvbdev.h, include/media/dvb_frontend.h, drivers/media/tuners/tda827x.h):
>> include/linux/pci.h:2014:1: sparse: sparse: an expression is expected before ')'
--
   drivers/media/tuners/mt20xx.c: note: in included file (through include/linux/sched.h, include/linux/delay.h):
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
   drivers/media/tuners/mt20xx.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mt20xx.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mt20xx.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mt20xx.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mt20xx.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mt20xx.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mt20xx.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mt20xx.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mt20xx.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mt20xx.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mt20xx.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/mt20xx.c: note: in included file (through include/media/media-device.h, include/media/dvbdev.h, include/media/dvb_frontend.h, drivers/media/tuners/mt20xx.h):
>> include/linux/pci.h:2014:1: sparse: sparse: an expression is expected before ')'
--
   drivers/media/tuners/tda8290.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/media/tuners/tda8290.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda8290.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda8290.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda8290.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda8290.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda8290.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda8290.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda8290.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda8290.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda8290.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda8290.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda8290.c: note: in included file (through include/media/media-device.h, include/media/dvbdev.h, include/media/dvb_frontend.h, drivers/media/tuners/tda8290.h):
>> include/linux/pci.h:2014:1: sparse: sparse: an expression is expected before ')'
--
   drivers/media/tuners/tea5767.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/media/tuners/tea5767.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5767.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5767.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5767.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5767.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5767.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5767.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5767.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5767.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5767.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5767.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tea5767.c: note: in included file (through include/media/media-device.h, include/media/dvbdev.h, include/media/dvb_frontend.h, drivers/media/tuners/tea5767.h):
>> include/linux/pci.h:2014:1: sparse: sparse: an expression is expected before ')'
--
   drivers/media/tuners/tda9887.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/media/tuners/tda9887.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda9887.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda9887.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda9887.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda9887.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda9887.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda9887.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda9887.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda9887.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda9887.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda9887.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda9887.c: note: in included file (through include/media/media-device.h, include/media/v4l2-mc.h, include/media/tuner.h):
>> include/linux/pci.h:2014:1: sparse: sparse: an expression is expected before ')'
--
   drivers/media/tuners/tda18271-common.c: note: in included file (through drivers/media/tuners/tda18271-priv.h):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-common.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/media/tuners/tda18271-common.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-common.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-common.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-common.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-common.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-common.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-common.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-common.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-common.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h, drivers/media/tuners/tuner-i2c.h, drivers/media/tuners/tda18271-priv.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-common.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-common.c: note: in included file (through include/media/media-device.h, include/media/dvbdev.h, include/media/dvb_frontend.h, drivers/media/tuners/tda18271.h, ...):
>> include/linux/pci.h:2014:1: sparse: sparse: an expression is expected before ')'
--
   drivers/media/tuners/xc4000.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/media/tuners/xc4000.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc4000.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc4000.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc4000.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc4000.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc4000.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc4000.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc4000.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc4000.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc4000.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc4000.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc4000.c: note: in included file (through include/media/media-device.h, include/media/dvbdev.h, include/media/dvb_frontend.h):
>> include/linux/pci.h:2014:1: sparse: sparse: an expression is expected before ')'
--
   drivers/media/tuners/tda18271-fe.c: note: in included file (through drivers/media/tuners/tda18271-priv.h):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-fe.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/media/tuners/tda18271-fe.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-fe.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-fe.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-fe.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-fe.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-fe.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-fe.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-fe.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-fe.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h, drivers/media/tuners/tuner-i2c.h, drivers/media/tuners/tda18271-priv.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-fe.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tda18271-fe.c: note: in included file (through include/media/media-device.h, include/media/dvbdev.h, include/media/dvb_frontend.h, drivers/media/tuners/tda18271.h, ...):
>> include/linux/pci.h:2014:1: sparse: sparse: an expression is expected before ')'
--
   drivers/media/tuners/tuner-simple.c: note: in included file (through include/linux/sched.h, include/linux/delay.h):
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
   drivers/media/tuners/tuner-simple.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-simple.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-simple.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-simple.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-simple.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-simple.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-simple.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-simple.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-simple.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-simple.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-simple.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/tuner-simple.c: note: in included file (through include/media/media-device.h, include/media/v4l2-mc.h, include/media/tuner.h):
>> include/linux/pci.h:2014:1: sparse: sparse: an expression is expected before ')'
--
   drivers/media/tuners/xc2028.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
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
   drivers/media/tuners/xc2028.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc2028.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc2028.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc2028.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, include/linux/resource_ext.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc2028.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc2028.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc2028.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc2028.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc2028.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc2028.c: note: in included file (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc2028.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/media/tuners/xc2028.c: note: in included file (through include/media/media-device.h, include/media/v4l2-mc.h, include/media/tuner.h):
>> include/linux/pci.h:2014:1: sparse: sparse: an expression is expected before ')'
--
   drivers/thermal/testing/zone.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, arch/x86/include/asm/tsc.h, ...):
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
   drivers/thermal/testing/zone.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/testing/zone.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/testing/zone.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/testing/zone.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/testing/zone.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/testing/zone.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/testing/zone.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/testing/zone.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/debugfs.h):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/testing/zone.c: note: in included file (through include/linux/fs.h, include/linux/debugfs.h):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/testing/zone.c: note: in included file (through include/linux/thermal.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/thermal/testing/zone.c: note: in included file:
   include/linux/thermal.h:141:1: sparse: sparse: an expression is expected before ')'
>> drivers/thermal/testing/zone.c:54:1: sparse: sparse: an expression is expected before ')'
--
   drivers/gpu/drm/bridge/tda998x_drv.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h, ...):
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
   drivers/gpu/drm/bridge/tda998x_drv.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, include/linux/energy_model.h, ...):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/bridge/tda998x_drv.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/bridge/tda998x_drv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/bridge/tda998x_drv.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/bridge/tda998x_drv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/bridge/tda998x_drv.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/bridge/tda998x_drv.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/bridge/tda998x_drv.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/compat.h, ...):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/bridge/tda998x_drv.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/x86/include/asm/ia32.h, arch/x86/include/asm/elf.h, ...):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/bridge/tda998x_drv.c: note: in included file (through include/linux/hdmi.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/bridge/tda998x_drv.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/bridge/tda998x_drv.c: note: in included file (through include/sound/ac97_codec.h, include/sound/soc.h, include/sound/hdmi-codec.h):
>> include/sound/pcm.h:676:1: sparse: sparse: an expression is expected before ')'
   include/sound/pcm.h:679:1: sparse: sparse: an expression is expected before ')'
   include/sound/pcm.h:682:1: sparse: sparse: an expression is expected before ')'

vim +1599 arch/x86/kvm/vmx/vmx.c

3e013d0a70994d Sean Christopherson 2026-01-08  1591  
3e013d0a70994d Sean Christopherson 2026-01-08  1592  static void vmx_put_vmcs01(struct kvm_vcpu *vcpu)
3e013d0a70994d Sean Christopherson 2026-01-08  1593  {
3e013d0a70994d Sean Christopherson 2026-01-08  1594  	if (!is_guest_mode(vcpu))
3e013d0a70994d Sean Christopherson 2026-01-08  1595  		return;
3e013d0a70994d Sean Christopherson 2026-01-08  1596  
3e013d0a70994d Sean Christopherson 2026-01-08  1597  	vmx_switch_loaded_vmcs(vcpu, &to_vmx(vcpu)->nested.vmcs02);
3e013d0a70994d Sean Christopherson 2026-01-08  1598  }
3e013d0a70994d Sean Christopherson 2026-01-08 @1599  DEFINE_GUARD(vmx_vmcs01, struct kvm_vcpu *,
3e013d0a70994d Sean Christopherson 2026-01-08  1600  	     vmx_load_vmcs01(_T), vmx_put_vmcs01(_T))
3e013d0a70994d Sean Christopherson 2026-01-08  1601  

:::::: The code at line 1599 was first introduced by commit
:::::: 3e013d0a70994df2c2ba78d599a6c039ab0977a5 KVM: nVMX: Switch to vmcs01 to update PML controls on-demand if L2 is active

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
