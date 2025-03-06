Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AA67FD
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Mar 2025 04:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741236420; cv=none; b=Tz5jVvVaV6aUFkfxq6Rp/1xagphefOxvosXo4vcM4eOkUzgOeCn+fCPUSAnd5KLjTBvfA283XJNfmuLuSAjLbybVaNEqENxwpsNkHcv9kSk+iSNv1JoYKs9GsfQxC0BCkY7gdiZ48QeLx5Ya1prKtVK6uPUOObwTiQWqllusTYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741236420; c=relaxed/simple;
	bh=oVb8nmGl8AY8IzqNlRJFNhjlkNP6RsjLSdecaq3UJek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lFvwjPlRvCkuXfJYxGnjvyZxd89SBAMkK+tkRtC5OZdSa35BjDYExbU3lN2Cbg7CAyAVOg/BcvFzQRtesWunuOp+FhSK5E4m/pvyt77YlbBv0WmKCabRRF3D2sRfjAb8jHLGNsIXuw3KTNjxbNA8PWBJc9CSZM8FCmkSUDm9K5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xqs2g3uy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xqs2g3uy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741236418; x=1772772418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oVb8nmGl8AY8IzqNlRJFNhjlkNP6RsjLSdecaq3UJek=;
  b=Xqs2g3uyKqbaXFZalIqDbRrRa2hk8dmVA5YLJBYUBajG/s49iPIo27Fu
   bVNUVBjmbDB2+mQgzHr/hwTmUAjngyZB0ilMdjOsefziXNrlPt+xodaLh
   WZA4GF+SRf3R2hPJg1B2mzNKUq3U4fz3r3gL33CIcA22tB07BDpnzJKCH
   /l21lsJ8I5PfpGiNOq8GI5dJjV9vm8qqO77qkafOmyHzXEQ7bRKxLOJO2
   rxJmLeegsO8wq8K+nzypQU336+fYMEV/hr5/SXYrmnNvhep6UslihhvZn
   N0+JsBDCTb949nZnwLKWDbdCUek80XgN4fcU9kjTxMHG1h7d4BMIki8PA
   Q==;
X-CSE-ConnectionGUID: g4KT0/V+RdKTZeci4lyDjA==
X-CSE-MsgGUID: 7FbVc2yIR5KIjY39OqRlrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42429949"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="42429949"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 20:46:57 -0800
X-CSE-ConnectionGUID: wBqDwfZCR128DeRvsFmhUQ==
X-CSE-MsgGUID: iWkZ+/V5RYmvU6wYGe5dtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="123824890"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 05 Mar 2025 20:46:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq38I-000MXq-18;
	Thu, 06 Mar 2025 04:46:54 +0000
Date: Thu, 6 Mar 2025 12:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:locking/core 24/35] drivers/block/rnbd/rnbd-clt.c:231
 rnbd_rerun_if_needed() error: uninitialized symbol 'flags'.
Message-ID: <202503061203.iz30ovn7-lkp@intel.com>
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
TO: Marco Elver <elver@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   c90cac58f80cc4268e8799fe51a0ced91220428a
commit: 810bdf94357610e2f9fb997a486a16a0acc0efd2 [24/35] compiler-capability-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061203.iz30ovn7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503061203.iz30ovn7-lkp@intel.com/

New smatch warnings:
drivers/block/rnbd/rnbd-clt.c:231 rnbd_rerun_if_needed() error: uninitialized symbol 'flags'.

Old smatch warnings:
drivers/block/rnbd/rnbd-clt.c:1241 find_and_get_or_create_sess() error: 'sess' dereferencing possible ERR_PTR()
drivers/block/rnbd/rnbd-clt.c:1324 rnbd_init_mq_hw_queues() warn: iterator 'i' not incremented

vim +/flags +231 drivers/block/rnbd/rnbd-clt.c

f7a7a5c228d45e Jack Wang 2020-05-11  183  
f7a7a5c228d45e Jack Wang 2020-05-11  184  /**
f7a7a5c228d45e Jack Wang 2020-05-11  185   * rnbd_rerun_if_needed() - rerun next queue marked as stopped
f7a7a5c228d45e Jack Wang 2020-05-11  186   * @sess:	Session to rerun a queue on
f7a7a5c228d45e Jack Wang 2020-05-11  187   *
f7a7a5c228d45e Jack Wang 2020-05-11  188   * Description:
f7a7a5c228d45e Jack Wang 2020-05-11  189   *     Each CPU has it's own list of HW queues, which should be rerun.
f7a7a5c228d45e Jack Wang 2020-05-11  190   *     Function finds such list with HW queues, takes a list lock, picks up
f7a7a5c228d45e Jack Wang 2020-05-11  191   *     the first HW queue out of the list and requeues it.
f7a7a5c228d45e Jack Wang 2020-05-11  192   *
f7a7a5c228d45e Jack Wang 2020-05-11  193   * Return:
f7a7a5c228d45e Jack Wang 2020-05-11  194   *     True if the queue was requeued, false otherwise.
f7a7a5c228d45e Jack Wang 2020-05-11  195   *
f7a7a5c228d45e Jack Wang 2020-05-11  196   * Context:
f7a7a5c228d45e Jack Wang 2020-05-11  197   *     Does not matter.
f7a7a5c228d45e Jack Wang 2020-05-11  198   */
f7a7a5c228d45e Jack Wang 2020-05-11  199  static bool rnbd_rerun_if_needed(struct rnbd_clt_session *sess)
f7a7a5c228d45e Jack Wang 2020-05-11  200  {
f7a7a5c228d45e Jack Wang 2020-05-11  201  	struct rnbd_queue *q = NULL;
f7a7a5c228d45e Jack Wang 2020-05-11  202  	struct rnbd_cpu_qlist *cpu_q;
f7a7a5c228d45e Jack Wang 2020-05-11  203  	unsigned long flags;
f7a7a5c228d45e Jack Wang 2020-05-11  204  	int *cpup;
f7a7a5c228d45e Jack Wang 2020-05-11  205  
f7a7a5c228d45e Jack Wang 2020-05-11  206  	/*
f7a7a5c228d45e Jack Wang 2020-05-11  207  	 * To keep fairness and not to let other queues starve we always
f7a7a5c228d45e Jack Wang 2020-05-11  208  	 * try to wake up someone else in round-robin manner.  That of course
f7a7a5c228d45e Jack Wang 2020-05-11  209  	 * increases latency but queues always have a chance to be executed.
f7a7a5c228d45e Jack Wang 2020-05-11  210  	 */
f7a7a5c228d45e Jack Wang 2020-05-11  211  	cpup = get_cpu_ptr(sess->cpu_rr);
f7a7a5c228d45e Jack Wang 2020-05-11  212  	for (cpu_q = rnbd_get_cpu_qlist(sess, nxt_cpu(*cpup)); cpu_q;
f7a7a5c228d45e Jack Wang 2020-05-11  213  	     cpu_q = rnbd_get_cpu_qlist(sess, nxt_cpu(cpu_q->cpu))) {
f7a7a5c228d45e Jack Wang 2020-05-11  214  		if (!spin_trylock_irqsave(&cpu_q->requeue_lock, flags))
f7a7a5c228d45e Jack Wang 2020-05-11  215  			continue;
1e31016b6926c9 Gioh Kim  2021-04-28  216  		if (!test_bit(cpu_q->cpu, sess->cpu_queues_bm))
f7a7a5c228d45e Jack Wang 2020-05-11  217  			goto unlock;
f7a7a5c228d45e Jack Wang 2020-05-11  218  		q = list_first_entry_or_null(&cpu_q->requeue_list,
f7a7a5c228d45e Jack Wang 2020-05-11  219  					     typeof(*q), requeue_list);
f7a7a5c228d45e Jack Wang 2020-05-11  220  		if (WARN_ON(!q))
f7a7a5c228d45e Jack Wang 2020-05-11  221  			goto clear_bit;
f7a7a5c228d45e Jack Wang 2020-05-11  222  		list_del_init(&q->requeue_list);
f7a7a5c228d45e Jack Wang 2020-05-11  223  		clear_bit_unlock(0, &q->in_list);
f7a7a5c228d45e Jack Wang 2020-05-11  224  
f7a7a5c228d45e Jack Wang 2020-05-11  225  		if (list_empty(&cpu_q->requeue_list)) {
f7a7a5c228d45e Jack Wang 2020-05-11  226  			/* Clear bit if nothing is left */
f7a7a5c228d45e Jack Wang 2020-05-11  227  clear_bit:
f7a7a5c228d45e Jack Wang 2020-05-11  228  			clear_bit(cpu_q->cpu, sess->cpu_queues_bm);
f7a7a5c228d45e Jack Wang 2020-05-11  229  		}
f7a7a5c228d45e Jack Wang 2020-05-11  230  unlock:
f7a7a5c228d45e Jack Wang 2020-05-11 @231  		spin_unlock_irqrestore(&cpu_q->requeue_lock, flags);
f7a7a5c228d45e Jack Wang 2020-05-11  232  
f7a7a5c228d45e Jack Wang 2020-05-11  233  		if (q)
f7a7a5c228d45e Jack Wang 2020-05-11  234  			break;
f7a7a5c228d45e Jack Wang 2020-05-11  235  	}
f7a7a5c228d45e Jack Wang 2020-05-11  236  
f7a7a5c228d45e Jack Wang 2020-05-11  237  	/**
f7a7a5c228d45e Jack Wang 2020-05-11  238  	 * Saves the CPU that is going to be requeued on the per-cpu var. Just
f7a7a5c228d45e Jack Wang 2020-05-11  239  	 * incrementing it doesn't work because rnbd_get_cpu_qlist() will
f7a7a5c228d45e Jack Wang 2020-05-11  240  	 * always return the first CPU with something on the queue list when the
f7a7a5c228d45e Jack Wang 2020-05-11  241  	 * value stored on the var is greater than the last CPU with something
f7a7a5c228d45e Jack Wang 2020-05-11  242  	 * on the list.
f7a7a5c228d45e Jack Wang 2020-05-11  243  	 */
f7a7a5c228d45e Jack Wang 2020-05-11  244  	if (cpu_q)
f7a7a5c228d45e Jack Wang 2020-05-11  245  		*cpup = cpu_q->cpu;
94dace8c857175 Gioh Kim  2021-07-26  246  	put_cpu_ptr(sess->cpu_rr);
f7a7a5c228d45e Jack Wang 2020-05-11  247  
f7a7a5c228d45e Jack Wang 2020-05-11  248  	if (q)
f7a7a5c228d45e Jack Wang 2020-05-11  249  		rnbd_clt_dev_requeue(q);
f7a7a5c228d45e Jack Wang 2020-05-11  250  
f7a7a5c228d45e Jack Wang 2020-05-11  251  	return q;
f7a7a5c228d45e Jack Wang 2020-05-11  252  }
f7a7a5c228d45e Jack Wang 2020-05-11  253  

:::::: The code at line 231 was first introduced by commit
:::::: f7a7a5c228d45efc45d6e26a199a3ea13d2f8754 block/rnbd: client: main functionality

:::::: TO: Jack Wang <jinpu.wang@cloud.ionos.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
