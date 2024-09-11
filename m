Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112BF185B7B
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Sep 2024 10:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726051371; cv=none; b=adDl7f+EOm+mB2jpZnRWiU50YZWZCidpRd1/Zn1GgXI3xhZaAfG3mrJPrhIBQILySsfAqpYYS3fwTE/XmOJdrEenqFzPjfMmg8ZBmnvJmd2jjZi6yNHdFd/wet51c/rQnC0UsajaqfZyDrxQImV3VrF+B/iHq66AV3CKYMPHEDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726051371; c=relaxed/simple;
	bh=MpCMYvbj167Q07qBjh7YlkueHj/CdOCNbEiDp1c672U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Izxgsu4pGRMr0KfOk84baJsFwyy8zyQwUhbqnYJc2vSYvhpGL1U2PqtD/fGTZy0GJwvLo+MSrPY/PB4BtdCNuBeKeBsJKqd5xAz+HJbKNrOGJgY7D5HoSh3PI+NNRZeFvU4qil4qkYDLNJclsoVkb0z3tykepP+RPDwg1eIivto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9KTA+sX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9KTA+sX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726051369; x=1757587369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MpCMYvbj167Q07qBjh7YlkueHj/CdOCNbEiDp1c672U=;
  b=Y9KTA+sXOh4o3E6Hl3ovUgUoHhurwwQBcSnpcee3o/zgu2W944ABaMzw
   BhJA9IG5r5aR07eTgonBP8MtMCBFKR9XXFqyOvQTEjd6Pxv3vHam36Rth
   4MyDPrvKo0SAJxTdJBOEZXEh4xPMdsYG5+AplqBKTpeZ55OUHOiriis5o
   r1mN6PA6hWJ+6jp3NNmGqVdlCu9W7EXKF2rdDjwj6oojxaCobytCh2qy8
   aDFRTHNbQTgKSaXHp89oAjuk68eEESgS2i41H9yDHOnlGaJfPWODyNJAs
   ko78tZfvVn/CE8V6XCVQqsYngWJEFwcXpVsWWg9JnH3D4+MjDmgwOzQ2e
   g==;
X-CSE-ConnectionGUID: 4yYg/gcLSquP4ibCPlVm0Q==
X-CSE-MsgGUID: pptweE/iQn60baAI/PINsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24778750"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24778750"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 03:42:48 -0700
X-CSE-ConnectionGUID: bYQOVwQaQI2VmI1YphXUCg==
X-CSE-MsgGUID: 4Hlw3wYzQC+4AQ3xSiHimQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="71936115"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Sep 2024 03:42:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soKo8-0003P4-2u;
	Wed, 11 Sep 2024 10:42:44 +0000
Date: Wed, 11 Sep 2024 18:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:fs-next 622/909] fs/bcachefs/rcu_pending.c:447:1-7:
 preceding lock on line 375
Message-ID: <202409111842.m5F3l3m3-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git fs-next
head:   812a5e57015292f971bbdf945d1dc688d25d1005
commit: 8e973a4f3c74824ef03ed06006726321bc2346d6 [622/909] bcachefs: rcu_pending
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r063-20240911 (https://download.01.org/0day-ci/archive/20240911/202409111842.m5F3l3m3-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409111842.m5F3l3m3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/rcu_pending.c:447:1-7: preceding lock on line 375
>> fs/bcachefs/rcu_pending.c:447:1-7: preceding lock on line 375
   fs/bcachefs/rcu_pending.c:447:1-7: preceding lock on line 466

vim +447 fs/bcachefs/rcu_pending.c

8e973a4f3c7482 Kent Overstreet 2024-06-10  364  
8e973a4f3c7482 Kent Overstreet 2024-06-10  365  	struct rcu_pending_pcpu *p;
8e973a4f3c7482 Kent Overstreet 2024-06-10  366  	struct rcu_pending_seq *objs;
8e973a4f3c7482 Kent Overstreet 2024-06-10  367  	struct genradix_node *new_node = NULL;
8e973a4f3c7482 Kent Overstreet 2024-06-10  368  	unsigned long seq, flags;
8e973a4f3c7482 Kent Overstreet 2024-06-10  369  	bool start_gp = false;
8e973a4f3c7482 Kent Overstreet 2024-06-10  370  
8e973a4f3c7482 Kent Overstreet 2024-06-10  371  	BUG_ON((ptr != NULL) != (pending->process == RCU_PENDING_KVFREE_FN));
8e973a4f3c7482 Kent Overstreet 2024-06-10  372  
8e973a4f3c7482 Kent Overstreet 2024-06-10  373  	local_irq_save(flags);
8e973a4f3c7482 Kent Overstreet 2024-06-10  374  	p = this_cpu_ptr(pending->p);
8e973a4f3c7482 Kent Overstreet 2024-06-10 @375  	spin_lock(&p->lock);
8e973a4f3c7482 Kent Overstreet 2024-06-10  376  	seq = __get_state_synchronize_rcu(pending->srcu);
8e973a4f3c7482 Kent Overstreet 2024-06-10  377  restart:
8e973a4f3c7482 Kent Overstreet 2024-06-10  378  	if (may_sleep &&
8e973a4f3c7482 Kent Overstreet 2024-06-10  379  	    unlikely(process_finished_items(pending, p, flags)))
8e973a4f3c7482 Kent Overstreet 2024-06-10  380  		goto check_expired;
8e973a4f3c7482 Kent Overstreet 2024-06-10  381  
8e973a4f3c7482 Kent Overstreet 2024-06-10  382  	/*
8e973a4f3c7482 Kent Overstreet 2024-06-10  383  	 * In kvfree_rcu() mode, the radix tree is only for slab pointers so
8e973a4f3c7482 Kent Overstreet 2024-06-10  384  	 * that we can do kfree_bulk() - vmalloc pointers always use the linked
8e973a4f3c7482 Kent Overstreet 2024-06-10  385  	 * list:
8e973a4f3c7482 Kent Overstreet 2024-06-10  386  	 */
8e973a4f3c7482 Kent Overstreet 2024-06-10  387  	if (ptr && unlikely(is_vmalloc_addr(ptr)))
8e973a4f3c7482 Kent Overstreet 2024-06-10  388  		goto list_add;
8e973a4f3c7482 Kent Overstreet 2024-06-10  389  
8e973a4f3c7482 Kent Overstreet 2024-06-10  390  	objs = get_object_radix(p, seq);
8e973a4f3c7482 Kent Overstreet 2024-06-10  391  	if (unlikely(!objs))
8e973a4f3c7482 Kent Overstreet 2024-06-10  392  		goto list_add;
8e973a4f3c7482 Kent Overstreet 2024-06-10  393  
8e973a4f3c7482 Kent Overstreet 2024-06-10  394  	if (unlikely(!objs->cursor)) {
8e973a4f3c7482 Kent Overstreet 2024-06-10  395  		/*
8e973a4f3c7482 Kent Overstreet 2024-06-10  396  		 * New radix tree nodes must be added under @p->lock because the
8e973a4f3c7482 Kent Overstreet 2024-06-10  397  		 * tree root is in a darray that can be resized (typically,
8e973a4f3c7482 Kent Overstreet 2024-06-10  398  		 * genradix supports concurrent unlocked allocation of new
8e973a4f3c7482 Kent Overstreet 2024-06-10  399  		 * nodes) - hence preallocation and the retry loop:
8e973a4f3c7482 Kent Overstreet 2024-06-10  400  		 */
8e973a4f3c7482 Kent Overstreet 2024-06-10  401  		objs->cursor = genradix_ptr_alloc_preallocated_inlined(&objs->objs,
8e973a4f3c7482 Kent Overstreet 2024-06-10  402  						objs->nr, &new_node, GFP_ATOMIC|__GFP_NOWARN);
8e973a4f3c7482 Kent Overstreet 2024-06-10  403  		if (unlikely(!objs->cursor)) {
8e973a4f3c7482 Kent Overstreet 2024-06-10  404  			if (may_sleep) {
8e973a4f3c7482 Kent Overstreet 2024-06-10  405  				spin_unlock_irqrestore(&p->lock, flags);
8e973a4f3c7482 Kent Overstreet 2024-06-10  406  
8e973a4f3c7482 Kent Overstreet 2024-06-10  407  				gfp_t gfp = GFP_KERNEL;
8e973a4f3c7482 Kent Overstreet 2024-06-10  408  				if (!head)
8e973a4f3c7482 Kent Overstreet 2024-06-10  409  					gfp |= __GFP_NOFAIL;
8e973a4f3c7482 Kent Overstreet 2024-06-10  410  
8e973a4f3c7482 Kent Overstreet 2024-06-10  411  				new_node = genradix_alloc_node(gfp);
8e973a4f3c7482 Kent Overstreet 2024-06-10  412  				if (!new_node)
8e973a4f3c7482 Kent Overstreet 2024-06-10  413  					may_sleep = false;
8e973a4f3c7482 Kent Overstreet 2024-06-10  414  				goto check_expired;
8e973a4f3c7482 Kent Overstreet 2024-06-10  415  			}
8e973a4f3c7482 Kent Overstreet 2024-06-10  416  list_add:
8e973a4f3c7482 Kent Overstreet 2024-06-10  417  			start_gp = rcu_pending_enqueue_list(p, seq, head, ptr, &flags);
8e973a4f3c7482 Kent Overstreet 2024-06-10  418  			goto start_gp;
8e973a4f3c7482 Kent Overstreet 2024-06-10  419  		}
8e973a4f3c7482 Kent Overstreet 2024-06-10  420  	}
8e973a4f3c7482 Kent Overstreet 2024-06-10  421  
8e973a4f3c7482 Kent Overstreet 2024-06-10  422  	*objs->cursor++ = ptr ?: head;
8e973a4f3c7482 Kent Overstreet 2024-06-10  423  	/* zero cursor if we hit the end of a radix tree node: */
8e973a4f3c7482 Kent Overstreet 2024-06-10  424  	if (!(((ulong) objs->cursor) & (GENRADIX_NODE_SIZE - 1)))
8e973a4f3c7482 Kent Overstreet 2024-06-10  425  		objs->cursor = NULL;
8e973a4f3c7482 Kent Overstreet 2024-06-10  426  	start_gp = !objs->nr;
8e973a4f3c7482 Kent Overstreet 2024-06-10  427  	objs->nr++;
8e973a4f3c7482 Kent Overstreet 2024-06-10  428  start_gp:
8e973a4f3c7482 Kent Overstreet 2024-06-10  429  	if (unlikely(start_gp)) {
8e973a4f3c7482 Kent Overstreet 2024-06-10  430  		/*
8e973a4f3c7482 Kent Overstreet 2024-06-10  431  		 * We only have one callback (ideally, we would have one for
8e973a4f3c7482 Kent Overstreet 2024-06-10  432  		 * every outstanding graceperiod) - so if our callback is
8e973a4f3c7482 Kent Overstreet 2024-06-10  433  		 * already in flight, we may still have to start a grace period
8e973a4f3c7482 Kent Overstreet 2024-06-10  434  		 * (since we used get_state() above, not start_poll())
8e973a4f3c7482 Kent Overstreet 2024-06-10  435  		 */
8e973a4f3c7482 Kent Overstreet 2024-06-10  436  		if (!p->cb_armed) {
8e973a4f3c7482 Kent Overstreet 2024-06-10  437  			p->cb_armed = true;
8e973a4f3c7482 Kent Overstreet 2024-06-10  438  			__call_rcu(pending->srcu, &p->cb, rcu_pending_rcu_cb);
8e973a4f3c7482 Kent Overstreet 2024-06-10  439  		} else {
8e973a4f3c7482 Kent Overstreet 2024-06-10  440  			__start_poll_synchronize_rcu(pending->srcu);
8e973a4f3c7482 Kent Overstreet 2024-06-10  441  		}
8e973a4f3c7482 Kent Overstreet 2024-06-10  442  	}
8e973a4f3c7482 Kent Overstreet 2024-06-10  443  	spin_unlock_irqrestore(&p->lock, flags);
8e973a4f3c7482 Kent Overstreet 2024-06-10  444  free_node:
8e973a4f3c7482 Kent Overstreet 2024-06-10  445  	if (new_node)
8e973a4f3c7482 Kent Overstreet 2024-06-10  446  		genradix_free_node(new_node);
8e973a4f3c7482 Kent Overstreet 2024-06-10 @447  	return;
8e973a4f3c7482 Kent Overstreet 2024-06-10  448  check_expired:
8e973a4f3c7482 Kent Overstreet 2024-06-10  449  	if (unlikely(__poll_state_synchronize_rcu(pending->srcu, seq))) {
8e973a4f3c7482 Kent Overstreet 2024-06-10  450  		switch ((ulong) pending->process) {
8e973a4f3c7482 Kent Overstreet 2024-06-10  451  		case RCU_PENDING_KVFREE:
8e973a4f3c7482 Kent Overstreet 2024-06-10  452  			kvfree(ptr);
8e973a4f3c7482 Kent Overstreet 2024-06-10  453  			break;
8e973a4f3c7482 Kent Overstreet 2024-06-10  454  		case RCU_PENDING_CALL_RCU:
8e973a4f3c7482 Kent Overstreet 2024-06-10  455  			head->func(head);
8e973a4f3c7482 Kent Overstreet 2024-06-10  456  			break;
8e973a4f3c7482 Kent Overstreet 2024-06-10  457  		default:
8e973a4f3c7482 Kent Overstreet 2024-06-10  458  			pending->process(pending, head);
8e973a4f3c7482 Kent Overstreet 2024-06-10  459  			break;
8e973a4f3c7482 Kent Overstreet 2024-06-10  460  		}
8e973a4f3c7482 Kent Overstreet 2024-06-10  461  		goto free_node;
8e973a4f3c7482 Kent Overstreet 2024-06-10  462  	}
8e973a4f3c7482 Kent Overstreet 2024-06-10  463  
8e973a4f3c7482 Kent Overstreet 2024-06-10  464  	local_irq_save(flags);
8e973a4f3c7482 Kent Overstreet 2024-06-10  465  	p = this_cpu_ptr(pending->p);
8e973a4f3c7482 Kent Overstreet 2024-06-10  466  	spin_lock(&p->lock);
8e973a4f3c7482 Kent Overstreet 2024-06-10  467  	goto restart;
8e973a4f3c7482 Kent Overstreet 2024-06-10  468  }
8e973a4f3c7482 Kent Overstreet 2024-06-10  469  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
