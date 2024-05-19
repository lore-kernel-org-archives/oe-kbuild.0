Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320B38825
	for <oe-kbuild@lists.linux.dev>; Sun, 19 May 2024 06:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716099273; cv=none; b=rE+NRfciMwKbSD579/TC6amMBqfXXQx/kvCmYC3N0WFMpi2IaQBE2BKnr8PRf2GxK5Z8+Ai0twZ8RC1vV+zXtefNQV0oKMOZY/v0QoFW+/jhW6Io9vbXJs5bDoZUdgydLwqBscxRkOdj7SqtWY3SNykN7K3fusWB85oCofh7A6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716099273; c=relaxed/simple;
	bh=Enol+tLn3ipd1+Dx/wYZthVTVWGeRnxFwfuMnp/Op/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oMqUwt+q3zBEFMyPrRwheWh+M/9aTAH8/L66SZ2p+bb4JrvHThY8i/7RTFPlHtqJZ37M/eCm/66UZQeEySc06s1AHErWzOInmbdkpe51NjEsvAmtTsX9/stChCLvPTHjxIbKkjuK4hllnrLboYMLcC56iE60K0KKceUJb3G1Z+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVjKNI4f; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVjKNI4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716099271; x=1747635271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Enol+tLn3ipd1+Dx/wYZthVTVWGeRnxFwfuMnp/Op/I=;
  b=fVjKNI4f6J8l3kURcuLmivtChaXx+5/HZg+DEvEC76MuUdOth91OkbRM
   0zCXe7ITd/9P4O5lzOlAscxHiAnP0WVoCUfMldWrtkbEqDdc/5H6oJ3+3
   MiDMeuzyX9SOH+0D/uXpjH5/XnwrdCSG+JiH76KUJ30I6Id/TJc5TzE1l
   VYv2xVV8BwGgrj3FnHDvYHytXeNQBav/mSN4WBcNDNYb9n6ibvIdXxPY5
   5hhBFO7mH/EWF5WYev5LJ0x3s1C4oWJi5vFAdGyk+fxOlykfHMsDIo6Bj
   r0mDQ/+Zd3ixbK/UufZb16BNrsH+g5Nfn5sJ1WyvHJey4YIyhIgbI60Ja
   Q==;
X-CSE-ConnectionGUID: 9hDGbYp2SbaG6aA9bIkEBQ==
X-CSE-MsgGUID: JOnJmP4SRz+lQyq4duw0ug==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12114109"
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="12114109"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 23:14:30 -0700
X-CSE-ConnectionGUID: q4L4HESSSoWpt0zN3+VMxw==
X-CSE-MsgGUID: 82TcR2fKSbKpPID+i0vrZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="32196417"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 May 2024 23:14:29 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8ZoQ-0003DG-31;
	Sun, 19 May 2024 06:14:26 +0000
Date: Sun, 19 May 2024 14:13:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cip:linux-4.4.y-st-rt 2126/22961] kernel/sched/swork.c:63
 swork_kthread() warn: test_and_clear_bit() takes a bit number
Message-ID: <202405191432.mwRo2VNl-lkp@intel.com>
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
TO: Ben Hutchings <bwh@kernel.org>

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rt
head:   9addf64126a0035adf546b88a6519e544b3c0f16
commit: 6e24e49bf39d3d991503abafd28ac01d50c17994 [2126/22961] work-simple: Rename work-simple.[ch] to swork.[ch] for consistency
:::::: branch date: 6 days ago
:::::: commit date: 8 years ago
config: i386-randconfig-141-20240513 (https://download.01.org/0day-ci/archive/20240519/202405191432.mwRo2VNl-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405191432.mwRo2VNl-lkp@intel.com/

smatch warnings:
kernel/sched/swork.c:63 swork_kthread() warn: test_and_clear_bit() takes a bit number
kernel/sched/swork.c:113 swork_queue() warn: test_and_set_bit() takes a bit number

vim +63 kernel/sched/swork.c

d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   43  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   44  static int swork_kthread(void *arg)
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   45  {
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   46  	struct sworker *worker = arg;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   47  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   48  	for (;;) {
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   49  		swait_event_interruptible(worker->wq,
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   50  					swork_readable(worker));
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   51  		if (kthread_should_stop())
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   52  			break;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   53  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   54  		raw_spin_lock_irq(&worker->lock);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   55  		while (!list_empty(&worker->events)) {
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   56  			struct swork_event *sev;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   57  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   58  			sev = list_first_entry(&worker->events,
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   59  					struct swork_event, item);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   60  			list_del(&sev->item);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   61  			raw_spin_unlock_irq(&worker->lock);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   62  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  @63  			WARN_ON_ONCE(!test_and_clear_bit(SWORK_EVENT_PENDING,
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   64  							 &sev->flags));
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   65  			sev->func(sev);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   66  			raw_spin_lock_irq(&worker->lock);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   67  		}
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   68  		raw_spin_unlock_irq(&worker->lock);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   69  	}
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   70  	return 0;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   71  }
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   72  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   73  static struct sworker *swork_create(void)
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   74  {
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   75  	struct sworker *worker;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   76  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   77  	worker = kzalloc(sizeof(*worker), GFP_KERNEL);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   78  	if (!worker)
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   79  		return ERR_PTR(-ENOMEM);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   80  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   81  	INIT_LIST_HEAD(&worker->events);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   82  	raw_spin_lock_init(&worker->lock);
ad64c64a8f7ac0 kernel/sched/work-simple.c Sebastian Andrzej Siewior 2016-03-09   83  	init_swait_queue_head(&worker->wq);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   84  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   85  	worker->task = kthread_run(swork_kthread, worker, "kswork");
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   86  	if (IS_ERR(worker->task)) {
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   87  		kfree(worker);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   88  		return ERR_PTR(-ENOMEM);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   89  	}
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   90  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   91  	return worker;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   92  }
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   93  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   94  static void swork_destroy(struct sworker *worker)
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   95  {
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   96  	kthread_stop(worker->task);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   97  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   98  	WARN_ON(!list_empty(&worker->events));
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   99  	kfree(worker);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  100  }
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  101  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  102  /**
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  103   * swork_queue - queue swork
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  104   *
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  105   * Returns %false if @work was already on a queue, %true otherwise.
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  106   *
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  107   * The work is queued and processed on a random CPU
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  108   */
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  109  bool swork_queue(struct swork_event *sev)
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  110  {
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  111  	unsigned long flags;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  112  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11 @113  	if (test_and_set_bit(SWORK_EVENT_PENDING, &sev->flags))
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  114  		return false;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  115  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  116  	raw_spin_lock_irqsave(&glob_worker->lock, flags);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  117  	list_add_tail(&sev->item, &glob_worker->events);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  118  	raw_spin_unlock_irqrestore(&glob_worker->lock, flags);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  119  
ad64c64a8f7ac0 kernel/sched/work-simple.c Sebastian Andrzej Siewior 2016-03-09  120  	swake_up(&glob_worker->wq);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  121  	return true;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  122  }
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  123  EXPORT_SYMBOL_GPL(swork_queue);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  124  

:::::: The code at line 63 was first introduced by commit
:::::: d19fa60f5d71b664a15bda5abf26939ec5724ce1 work-simple: Simple work queue implemenation

:::::: TO: Daniel Wagner <daniel.wagner@bmw-carit.de>
:::::: CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
