Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D91146D78
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jun 2024 20:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717531513; cv=none; b=VyLl5xwTV42RKlv97bB1LshU/S14DbWHarAoFZxarTgBALcIAWjkbz2A8lHNSieef3f2q626+vvk2kADdtlCa+sTWmofADSnfECP0jYJ6gVCOKDUiCu+HY4JQBL+94r/73AXup6WmhRc9B6aVrzeJdP+gzCQ71topNnrYFNKI1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717531513; c=relaxed/simple;
	bh=Tz5GTxadTtDK3VEfd/GIicl/jw6+TojjLz6BcjgMs44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pYsecYUu16Cy9w5QTUzHqa4sq3crMsZRl54wguQ8QUamgSTi4e8PwlcgOwbP4SseQ9C00fQmYTEzHg2fvcxX7T/U16JoXMUaLhLR0zycjqrTtYgBtFY6I4SeTyuE7Le/g5TorYrWUT+DHnYZ3AcFrUBRLmKRjWIczZs4s1Wuse4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxgKmhDx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxgKmhDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717531511; x=1749067511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tz5GTxadTtDK3VEfd/GIicl/jw6+TojjLz6BcjgMs44=;
  b=HxgKmhDxxV2oHq2C8cSK7rWI+/YpokLwdJfOTXzCOZS0+apAsYe++8Ju
   fI4DB7lYIszhpegsKoV2n7mkpTPRfXHfYJwDchUAVZm9MxuoOZ57a6ujH
   CqM35s/PMLOWw9Ka/SAF0PrT3gbirN28Wuqs3MhA9QbhMiGfyqIOTbrIr
   q/iL05Z+G3iLxrWzS8Emd16Aq2EP07sjgGT+15wn2sLCbNO4HnLar3v9E
   77L6pCsxlIcbfjIBlRByRheQzPNoVJ8JYBQ1pBLxCfQDH867dsvne8VOM
   Uu1iV+Ohq27kTbbLdJUeJlehxSmbc6NGOZ1OMxvLuULrWAEzPdkN7cr7D
   A==;
X-CSE-ConnectionGUID: ISaJADa1SxikTXpw6ZoCCQ==
X-CSE-MsgGUID: oSSRoEPgQUChFZJL7KdBYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14291737"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="14291737"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 13:05:10 -0700
X-CSE-ConnectionGUID: BT+/pSYDTNeCclc6i1AZlQ==
X-CSE-MsgGUID: G5pgXFVMR8+Ixs0KlHBSWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="37412328"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Jun 2024 13:05:09 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEaP3-0000Up-0e;
	Tue, 04 Jun 2024 20:05:05 +0000
Date: Wed, 5 Jun 2024 04:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: [axboe-block:for-6.11/io_uring 4/4] io_uring/eventfd.c:80:5-24:
 WARNING: atomic_dec_and_test variation before object free at line 81.
Message-ID: <202406050442.k3qjSHNT-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.11/io_uring
head:   ff802a9f35cfe5f5ce003504b9bb803fd0d361c3
commit: ff802a9f35cfe5f5ce003504b9bb803fd0d361c3 [4/4] io_uring/eventfd: move eventfd handling to separate file
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-103-20240605 (https://download.01.org/0day-ci/archive/20240605/202406050442.k3qjSHNT-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202406050442.k3qjSHNT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/eventfd.c:80:5-24: WARNING: atomic_dec_and_test variation before object free at line 81.
   io_uring/eventfd.c:154:6-25: WARNING: atomic_dec_and_test variation before object free at line 155.

vim +80 io_uring/eventfd.c

ff802a9f35cfe5f Jens Axboe 2024-06-03  43  
ff802a9f35cfe5f Jens Axboe 2024-06-03  44  void io_eventfd_signal(struct io_ring_ctx *ctx)
ff802a9f35cfe5f Jens Axboe 2024-06-03  45  {
ff802a9f35cfe5f Jens Axboe 2024-06-03  46  	struct io_ev_fd *ev_fd = NULL;
ff802a9f35cfe5f Jens Axboe 2024-06-03  47  
ff802a9f35cfe5f Jens Axboe 2024-06-03  48  	if (READ_ONCE(ctx->rings->cq_flags) & IORING_CQ_EVENTFD_DISABLED)
ff802a9f35cfe5f Jens Axboe 2024-06-03  49  		return;
ff802a9f35cfe5f Jens Axboe 2024-06-03  50  
ff802a9f35cfe5f Jens Axboe 2024-06-03  51  	guard(rcu)();
ff802a9f35cfe5f Jens Axboe 2024-06-03  52  
ff802a9f35cfe5f Jens Axboe 2024-06-03  53  	/*
ff802a9f35cfe5f Jens Axboe 2024-06-03  54  	 * rcu_dereference ctx->io_ev_fd once and use it for both for checking
ff802a9f35cfe5f Jens Axboe 2024-06-03  55  	 * and eventfd_signal
ff802a9f35cfe5f Jens Axboe 2024-06-03  56  	 */
ff802a9f35cfe5f Jens Axboe 2024-06-03  57  	ev_fd = rcu_dereference(ctx->io_ev_fd);
ff802a9f35cfe5f Jens Axboe 2024-06-03  58  
ff802a9f35cfe5f Jens Axboe 2024-06-03  59  	/*
ff802a9f35cfe5f Jens Axboe 2024-06-03  60  	 * Check again if ev_fd exists incase an io_eventfd_unregister call
ff802a9f35cfe5f Jens Axboe 2024-06-03  61  	 * completed between the NULL check of ctx->io_ev_fd at the start of
ff802a9f35cfe5f Jens Axboe 2024-06-03  62  	 * the function and rcu_read_lock.
ff802a9f35cfe5f Jens Axboe 2024-06-03  63  	 */
ff802a9f35cfe5f Jens Axboe 2024-06-03  64  	if (unlikely(!ev_fd))
ff802a9f35cfe5f Jens Axboe 2024-06-03  65  		return;
ff802a9f35cfe5f Jens Axboe 2024-06-03  66  	if (!atomic_inc_not_zero(&ev_fd->refs))
ff802a9f35cfe5f Jens Axboe 2024-06-03  67  		return;
ff802a9f35cfe5f Jens Axboe 2024-06-03  68  	if (ev_fd->eventfd_async && !io_wq_current_is_worker())
ff802a9f35cfe5f Jens Axboe 2024-06-03  69  		goto out;
ff802a9f35cfe5f Jens Axboe 2024-06-03  70  
ff802a9f35cfe5f Jens Axboe 2024-06-03  71  	if (likely(eventfd_signal_allowed())) {
ff802a9f35cfe5f Jens Axboe 2024-06-03  72  		eventfd_signal_mask(ev_fd->cq_ev_fd, EPOLL_URING_WAKE);
ff802a9f35cfe5f Jens Axboe 2024-06-03  73  	} else {
ff802a9f35cfe5f Jens Axboe 2024-06-03  74  		if (!atomic_fetch_or(BIT(IO_EVENTFD_OP_SIGNAL_BIT), &ev_fd->ops)) {
ff802a9f35cfe5f Jens Axboe 2024-06-03  75  			call_rcu_hurry(&ev_fd->rcu, io_eventfd_do_signal);
ff802a9f35cfe5f Jens Axboe 2024-06-03  76  			return;
ff802a9f35cfe5f Jens Axboe 2024-06-03  77  		}
ff802a9f35cfe5f Jens Axboe 2024-06-03  78  	}
ff802a9f35cfe5f Jens Axboe 2024-06-03  79  out:
ff802a9f35cfe5f Jens Axboe 2024-06-03 @80  	if (atomic_dec_and_test(&ev_fd->refs))
ff802a9f35cfe5f Jens Axboe 2024-06-03 @81  		call_rcu(&ev_fd->rcu, io_eventfd_free);
ff802a9f35cfe5f Jens Axboe 2024-06-03  82  }
ff802a9f35cfe5f Jens Axboe 2024-06-03  83  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
