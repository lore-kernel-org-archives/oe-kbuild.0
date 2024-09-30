Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D6321105
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Sep 2024 02:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727662965; cv=none; b=sQwxSe6a86bL8RjniQNkOI/fM6dypMW6rJObeoIOZS9ol9Mlzrd7QJa4hw98XsT8ecIYenRKvJaYYECziG7iAvTd41BuVBjcVXFx96cpJs7WPuKI+ICtNG/O1zTSpUfKc+1stiEuIJstJlLuel4hog8RZGlXVjBuMQbGg+HdjOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727662965; c=relaxed/simple;
	bh=Gdf9aNiFplKI2Ag1LR4FVZp/g55qmVwal52oIC325Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ww8pJuMbgeCuqyPSXnTrcigf9Mfd71QVyfy/aGIN1GR3BH5Hm/0MppAusTx/Zgo84AGBZvPuJvVxfDKFpJt6M3YGQo4xLZh3gzLk8xoq8LS3Q0QVP6T2dnaSncTTd9rh6ZaY1CdGIPISwv20z0a/+cgWi1438lTiYgTZfTTz+SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VVAwy4Hd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VVAwy4Hd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727662964; x=1759198964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gdf9aNiFplKI2Ag1LR4FVZp/g55qmVwal52oIC325Yw=;
  b=VVAwy4HdxrqV3J1+eexK2JnidVAyjJPqiSQDz6yel2PBIV4z5mFXpG2D
   w+INxje+diQXC0476nxluCEek/WhvBzLNVgoaZ8TZpdyg9yGLGVHIVNUk
   2krlH4VNPQ7UbaldqTCc3j2LI9Uaj/89977nl6ZFB+EzXqi7IeTjBwRD3
   Xnqulr/G7FYaV7TfR5PsTO4wC9YV+3r/OWyHQ2IoLmq9Uc6CIaz+8vFWm
   zLYL+/qvW6Qb809hEauKrBV4LKe3pOhtWSshDYoCbhE9uEDb75LWxn1ip
   PC3G7/fwEa7nmzu7sLorl8K1PsDHy0Z1uiGFr7iIMeetfQqn8wsi+UUU9
   Q==;
X-CSE-ConnectionGUID: 7dqmBaC/R5SIyeTnpgqIDQ==
X-CSE-MsgGUID: ZkixtoiIRKqDJNmnx4epWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37870084"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="37870084"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 19:22:44 -0700
X-CSE-ConnectionGUID: g30oQR9eQDyaDzkkkklb+Q==
X-CSE-MsgGUID: GdtbDdl0Q3GHRWgis8CvTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="78089294"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Sep 2024 19:22:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv63b-000OvB-30;
	Mon, 30 Sep 2024 02:22:39 +0000
Date: Mon, 30 Sep 2024 10:22:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/bcachefs/rcu_pending.c:447:1-7: preceding lock on line 375
Message-ID: <202409301038.O38IqQVc-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9852d85ec9d492ebef56dc5f229416c925758edc
commit: 8e973a4f3c74824ef03ed06006726321bc2346d6 bcachefs: rcu_pending
date:   3 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
config: m68k-randconfig-r053-20240930 (https://download.01.org/0day-ci/archive/20240930/202409301038.O38IqQVc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409301038.O38IqQVc-lkp@intel.com/

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
