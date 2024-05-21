Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BFD23775
	for <oe-kbuild@lists.linux.dev>; Tue, 21 May 2024 18:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716314659; cv=none; b=akKHSrjXAJttIcd6JMzEJSz4zIyDB9QGQVuzck2aICxzEmMSNaWg1T5iZObMXLhboynwVyZz1tGLmvTCjdJOb1/m+uKylp4Fl4NYPM77RVkorUKtvMj1WtEJZkyTPSNfYbdFqPHEBfF35a0c1eWoCXl3ZhriBCw69UupzoCNZZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716314659; c=relaxed/simple;
	bh=8VsmEdieGw17B1q/1bbfQErZQIT6pL/yjSUDtU1+Ecw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VejvSf3jHuf9VR8aqlG2e0qLqb4l9KBQKrCQggFcTYAPw+XczRIDnxgrap4p+Hver+7RGMCAEBP0fzdxRgfYypIifM1Ia1QAoht+kqrBN9ZXuknb7RaJnnfBgTJEN3KaWIkUKd1RDVQXRw/tOmS6ekZyWevfC55kmqJKyKgWIqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hg0jTTY0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hg0jTTY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716314658; x=1747850658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8VsmEdieGw17B1q/1bbfQErZQIT6pL/yjSUDtU1+Ecw=;
  b=Hg0jTTY0OP27iDAyYU6jau3hgK2X2ARoB8ggJHP7uNcO+Aoz0I5h+A9h
   d8q+3cayKIeUe49E05HRJX7YrCZImNA7Wc671vE2ADtq2IKpdfuZmx/Fs
   twXYvMSWOg8qNEi9hyEA/wCNdEHOFU2n/erVFlENskmCyDFAapoJPEPhN
   HPMWc2va4lce4mTH/7S8vzrJ7PhAo11IECSO6aqD+26e/9HfA35Z28/Wn
   gX4+I30zezLk9we9Me5dip3PqwDA2StGDnRs/mUt816AYSdoFX9Pw7xcI
   U3hwHTwE+43c84/jMpm7jJ2Fbps9qMPDmFvEuqOEyl4rYmhURSVCOSmwU
   A==;
X-CSE-ConnectionGUID: v7oSHolsTVOJLMb4Nj21Cg==
X-CSE-MsgGUID: MVq5odV2QNWvg8KdNDEdeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="23935450"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="23935450"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 11:04:17 -0700
X-CSE-ConnectionGUID: zZcMGi+ETi6DHSxpJZWF4w==
X-CSE-MsgGUID: jcaVpN2MTcaIVhqz4vcayw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="63840102"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 May 2024 11:04:16 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9TqP-0000bA-1G;
	Tue, 21 May 2024 18:04:13 +0000
Date: Wed, 22 May 2024 02:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cip:linux-4.4.y-st-rt 2126/22961] kernel/sched/swork.c:63
 swork_kthread() warn: test_and_clear_bit() takes a bit number
Message-ID: <202405220239.gP1tEjd3-lkp@intel.com>
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
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
TO: Pavel Machek <pavel@denx.de>

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rt
head:   9addf64126a0035adf546b88a6519e544b3c0f16
commit: 6e24e49bf39d3d991503abafd28ac01d50c17994 [2126/22961] work-simple: Rename work-simple.[ch] to swork.[ch] for consistency
:::::: branch date: 9 days ago
:::::: commit date: 8 years ago
config: i386-randconfig-141-20240513 (https://download.01.org/0day-ci/archive/20240522/202405220239.gP1tEjd3-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405220239.gP1tEjd3-lkp@intel.com/

smatch warnings:
kernel/sched/swork.c:63 swork_kthread() warn: test_and_clear_bit() takes a bit number
kernel/sched/swork.c:113 swork_queue() warn: test_and_set_bit() takes a bit number

vim +63 kernel/sched/swork.c

d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   43  
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   44  static int swork_kthread(void *arg)
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   45  {
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   46  	struct sworker *worker = arg;
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   47  
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   48  	for (;;) {
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   49  		swait_event_interruptible(worker->wq,
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   50  					swork_readable(worker));
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   51  		if (kthread_should_stop())
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   52  			break;
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   53  
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   54  		raw_spin_lock_irq(&worker->lock);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   55  		while (!list_empty(&worker->events)) {
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   56  			struct swork_event *sev;
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   57  
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   58  			sev = list_first_entry(&worker->events,
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   59  					struct swork_event, item);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   60  			list_del(&sev->item);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   61  			raw_spin_unlock_irq(&worker->lock);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   62  
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  @63  			WARN_ON_ONCE(!test_and_clear_bit(SWORK_EVENT_PENDING,
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   64  							 &sev->flags));
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   65  			sev->func(sev);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   66  			raw_spin_lock_irq(&worker->lock);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   67  		}
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   68  		raw_spin_unlock_irq(&worker->lock);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   69  	}
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   70  	return 0;
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   71  }
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   72  
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   73  static struct sworker *swork_create(void)
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   74  {
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   75  	struct sworker *worker;
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   76  
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   77  	worker = kzalloc(sizeof(*worker), GFP_KERNEL);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   78  	if (!worker)
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   79  		return ERR_PTR(-ENOMEM);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   80  
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   81  	INIT_LIST_HEAD(&worker->events);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   82  	raw_spin_lock_init(&worker->lock);
ad64c64a8f7ac0c kernel/sched/work-simple.c Sebastian Andrzej Siewior 2016-03-09   83  	init_swait_queue_head(&worker->wq);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   84  
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   85  	worker->task = kthread_run(swork_kthread, worker, "kswork");
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   86  	if (IS_ERR(worker->task)) {
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   87  		kfree(worker);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   88  		return ERR_PTR(-ENOMEM);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   89  	}
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   90  
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   91  	return worker;
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   92  }
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   93  
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   94  static void swork_destroy(struct sworker *worker)
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   95  {
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   96  	kthread_stop(worker->task);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   97  
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   98  	WARN_ON(!list_empty(&worker->events));
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   99  	kfree(worker);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  100  }
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  101  
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  102  /**
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  103   * swork_queue - queue swork
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  104   *
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  105   * Returns %false if @work was already on a queue, %true otherwise.
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  106   *
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  107   * The work is queued and processed on a random CPU
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  108   */
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  109  bool swork_queue(struct swork_event *sev)
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  110  {
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  111  	unsigned long flags;
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  112  
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11 @113  	if (test_and_set_bit(SWORK_EVENT_PENDING, &sev->flags))
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  114  		return false;
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  115  
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  116  	raw_spin_lock_irqsave(&glob_worker->lock, flags);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  117  	list_add_tail(&sev->item, &glob_worker->events);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  118  	raw_spin_unlock_irqrestore(&glob_worker->lock, flags);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  119  
ad64c64a8f7ac0c kernel/sched/work-simple.c Sebastian Andrzej Siewior 2016-03-09  120  	swake_up(&glob_worker->wq);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  121  	return true;
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  122  }
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  123  EXPORT_SYMBOL_GPL(swork_queue);
d19fa60f5d71b66 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  124  

:::::: The code at line 63 was first introduced by commit
:::::: d19fa60f5d71b664a15bda5abf26939ec5724ce1 work-simple: Simple work queue implemenation

:::::: TO: Daniel Wagner <daniel.wagner@bmw-carit.de>
:::::: CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
