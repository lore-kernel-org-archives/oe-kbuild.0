Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466BF2E973F
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 03:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769399117; cv=none; b=f8V9rgCz8IOBCpcEB2SB65z3HntRjGHxYcKy/EEbV0hOZHj8WGatnS3974wRkJ0J6CHwtpKnRXFJ7tHY0troZtepvd1stm8n1pcwWL1fL2Bg0FucOglih2C10RwSEEjivtIe8wdq6HwLc+TAcdGpxh5CVPlBVNouI/xy91SGECE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769399117; c=relaxed/simple;
	bh=OvXX5uIII1L3v0B0x5quQ94s1rg1wnZmv51UFVeU3ro=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u6u4wOAYuJe+sCFvJEuaMn7paPXgcXkJih+afG70gXDzXM9sOKxnAzamTDCaexiZx0tvM1hsly1Wi3JGuhp8z2nDCWumue40PzSPXU4F5vag2lUSoliidTtTY8OV9DDDCf8iwhT7T4G3uXqTPTj3QKuLnPmLHU4lmesuo78pfd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpXohblv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpXohblv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769399115; x=1800935115;
  h=date:from:to:cc:subject:message-id;
  bh=OvXX5uIII1L3v0B0x5quQ94s1rg1wnZmv51UFVeU3ro=;
  b=fpXohblvr21MK6rgXN6KcI4QOwhEI7+t7TsokAo+DgipswHSg4zG9unB
   QA62rg9cBCzVen2xci/DbvqXpTo12mdksZvEoPe5PVxsYMYfCBeadzgdS
   NR7+OvhGCrnsfWIrgst71Ik1UC/hcgQui4i89Xnm+6REREB5ZiVjj56cj
   MBvpY3NL/B72Ejiglh+PhI806VbtUEDFutt1n07rBNPDUsODqcqfyx/nd
   ARg9lVE+uwdiOW0s2EVmlo+u5hwped9JW2iYQ4i0A4jfBWG9wGIzC09m5
   qZfbxbT2Qm71PESHBu127djqtsvDnkbjXxJT5XXuG3w7hXT18fLfXzZI7
   w==;
X-CSE-ConnectionGUID: fJmJwvtWT6u5SRZ1PhxEJg==
X-CSE-MsgGUID: 25i7fkXOSnmgLO3+NQzDEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="73164738"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="73164738"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 19:45:15 -0800
X-CSE-ConnectionGUID: YuNpo26/TRyjCXqTG/TtnQ==
X-CSE-MsgGUID: PuGc0p5VRmm0BYk7NHebEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207471766"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jan 2026 19:45:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkDXK-00000000WrK-1OG5;
	Mon, 26 Jan 2026 03:45:10 +0000
Date: Mon, 26 Jan 2026 11:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 461/799]
 fs/bcachefs/util/rcu_pending.c:515 __rcu_pending_enqueue() error: we
 previously assumed 'head' could be null (see line 468)
Message-ID: <202601261157.wUkDyh4i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: a5c2f21bff6a883e2a0fc96e4f0127350186665e [461/799] bcachefs: move utility code to subdir
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-r073-20260126 (https://download.01.org/0day-ci/archive/20260126/202601261157.wUkDyh4i-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601261157.wUkDyh4i-lkp@intel.com/

smatch warnings:
fs/bcachefs/util/rcu_pending.c:515 __rcu_pending_enqueue() error: we previously assumed 'head' could be null (see line 468)

vim +/head +515 fs/bcachefs/util/rcu_pending.c

8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  418  
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  419  	struct rcu_pending_pcpu *p;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  420  	struct rcu_pending_seq *objs;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  421  	struct genradix_node *new_node = NULL;
ad0b2544ec827e fs/bcachefs/rcu_pending.c Kent Overstreet 2024-12-03  422  	unsigned long flags;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  423  	bool start_gp = false;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  424  
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  425  	BUG_ON((ptr != NULL) != (pending->process == RCU_PENDING_KVFREE_FN));
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  426  
54aacfe3976893 fs/bcachefs/rcu_pending.c Kent Overstreet 2025-06-08  427  	/* We could technically be scheduled before taking the lock and end up
54aacfe3976893 fs/bcachefs/rcu_pending.c Kent Overstreet 2025-06-08  428  	 * using a different cpu's rcu_pending_pcpu: that's ok, it needs a lock
54aacfe3976893 fs/bcachefs/rcu_pending.c Kent Overstreet 2025-06-08  429  	 * anyways
54aacfe3976893 fs/bcachefs/rcu_pending.c Kent Overstreet 2025-06-08  430  	 *
54aacfe3976893 fs/bcachefs/rcu_pending.c Kent Overstreet 2025-06-08  431  	 * And we have to do it this way to avoid breaking PREEMPT_RT, which
54aacfe3976893 fs/bcachefs/rcu_pending.c Kent Overstreet 2025-06-08  432  	 * redefines how spinlocks work:
54aacfe3976893 fs/bcachefs/rcu_pending.c Kent Overstreet 2025-06-08  433  	 */
54aacfe3976893 fs/bcachefs/rcu_pending.c Kent Overstreet 2025-06-08  434  	p = raw_cpu_ptr(pending->p);
54aacfe3976893 fs/bcachefs/rcu_pending.c Kent Overstreet 2025-06-08  435  	spin_lock_irqsave(&p->lock, flags);
ad0b2544ec827e fs/bcachefs/rcu_pending.c Kent Overstreet 2024-12-03  436  	rcu_gp_poll_state_t seq = __get_state_synchronize_rcu(pending->srcu);
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  437  restart:
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  438  	if (may_sleep &&
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  439  	    unlikely(process_finished_items(pending, p, flags)))
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  440  		goto check_expired;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  441  
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  442  	/*
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  443  	 * In kvfree_rcu() mode, the radix tree is only for slab pointers so
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  444  	 * that we can do kfree_bulk() - vmalloc pointers always use the linked
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  445  	 * list:
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  446  	 */
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  447  	if (ptr && unlikely(is_vmalloc_addr(ptr)))
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  448  		goto list_add;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  449  
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  450  	objs = get_object_radix(p, seq);
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  451  	if (unlikely(!objs))
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  452  		goto list_add;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  453  
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  454  	if (unlikely(!objs->cursor)) {
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  455  		/*
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  456  		 * New radix tree nodes must be added under @p->lock because the
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  457  		 * tree root is in a darray that can be resized (typically,
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  458  		 * genradix supports concurrent unlocked allocation of new
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  459  		 * nodes) - hence preallocation and the retry loop:
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  460  		 */
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  461  		objs->cursor = genradix_ptr_alloc_preallocated_inlined(&objs->objs,
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  462  						objs->nr, &new_node, GFP_ATOMIC|__GFP_NOWARN);
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  463  		if (unlikely(!objs->cursor)) {
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  464  			if (may_sleep) {
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  465  				spin_unlock_irqrestore(&p->lock, flags);
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  466  
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  467  				gfp_t gfp = GFP_KERNEL;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10 @468  				if (!head)
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  469  					gfp |= __GFP_NOFAIL;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  470  
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  471  				new_node = genradix_alloc_node(gfp);
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  472  				if (!new_node)
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  473  					may_sleep = false;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  474  				goto check_expired;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  475  			}
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  476  list_add:
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  477  			start_gp = rcu_pending_enqueue_list(p, seq, head, ptr, &flags);
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  478  			goto start_gp;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  479  		}
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  480  	}
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  481  
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  482  	*objs->cursor++ = ptr ?: head;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  483  	/* zero cursor if we hit the end of a radix tree node: */
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  484  	if (!(((ulong) objs->cursor) & (GENRADIX_NODE_SIZE - 1)))
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  485  		objs->cursor = NULL;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  486  	start_gp = !objs->nr;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  487  	objs->nr++;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  488  start_gp:
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  489  	if (unlikely(start_gp)) {
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  490  		/*
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  491  		 * We only have one callback (ideally, we would have one for
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  492  		 * every outstanding graceperiod) - so if our callback is
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  493  		 * already in flight, we may still have to start a grace period
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  494  		 * (since we used get_state() above, not start_poll())
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  495  		 */
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  496  		if (!p->cb_armed) {
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  497  			p->cb_armed = true;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  498  			__call_rcu(pending->srcu, &p->cb, rcu_pending_rcu_cb);
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  499  		} else {
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  500  			__start_poll_synchronize_rcu(pending->srcu);
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  501  		}
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  502  	}
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  503  	spin_unlock_irqrestore(&p->lock, flags);
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  504  free_node:
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  505  	if (new_node)
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  506  		genradix_free_node(new_node);
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  507  	return;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  508  check_expired:
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  509  	if (unlikely(__poll_state_synchronize_rcu(pending->srcu, seq))) {
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  510  		switch ((ulong) pending->process) {
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  511  		case RCU_PENDING_KVFREE:
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  512  			kvfree(ptr);
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  513  			break;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  514  		case RCU_PENDING_CALL_RCU:
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10 @515  			head->func(head);
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  516  			break;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  517  		default:
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  518  			pending->process(pending, head);
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  519  			break;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  520  		}
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  521  		goto free_node;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  522  	}
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  523  
54aacfe3976893 fs/bcachefs/rcu_pending.c Kent Overstreet 2025-06-08  524  	p = raw_cpu_ptr(pending->p);
54aacfe3976893 fs/bcachefs/rcu_pending.c Kent Overstreet 2025-06-08  525  	spin_lock_irqsave(&p->lock, flags);
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  526  	goto restart;
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  527  }
8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  528  

:::::: The code at line 515 was first introduced by commit
:::::: 8e973a4f3c74824ef03ed06006726321bc2346d6 bcachefs: rcu_pending

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
