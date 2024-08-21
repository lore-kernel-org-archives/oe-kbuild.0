Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF513B28D
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Aug 2024 16:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724256769; cv=none; b=Jgk4odJt1lFL+ti6L5XRG8oErLXn5MeBukAHeQahOYVs/T9RocEYc+Gv0JJo/9IlhVvd7nvc9L9Hgrt6Pw2Kl92jO+9zvTZxBOdMz0IA53CouMdJueH0iqWvNQr8zUn3ERliBb+EixcdHWoNVFOmCkTIOLptjER+nE+NMfGfsL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724256769; c=relaxed/simple;
	bh=l+UUwUiw2YCQ2MAjqkHi8u9N4zcOZRwJ5EEMSb6eQNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OKwqqb3z3c9phD9KcalkZAwtC5Lr0HAsu9S37RK7AP9rmCCKR0QOcYHeodTN4tY/fl7dH4BD/+hItSkYzuegr8swLgI7jGJ2HV2XHHC6cvqPx4JxVmKgY55EBqudRxKBBvEypO/PJZmNZ+p7Hl6n+C5zWKwifcfAKo5+fop+eVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ddxilam9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ddxilam9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724256767; x=1755792767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l+UUwUiw2YCQ2MAjqkHi8u9N4zcOZRwJ5EEMSb6eQNs=;
  b=Ddxilam9rXmq8RYDqUQA5XIzB6Ip7SV9EfOoOVy7Y2TyoGlXOsaT2d3/
   0u5qPfJPc6b34frFvb5xmOo4eQykHkIqz9QsRD27gNFFY7o/ijAIPC+iF
   KFHW8UEvOr73WqWSpHX3rbos1Zly7ENvenv+Ad5EwqGEyMB7ZmGcOhtfx
   +IHLD9KA24Xf9o2orq//1UEJsl6DXxxHI9lS/jgoJkcH4vROCkpeXLSP4
   21p2TKJsi0+WG0dRQrNxH7ONRZ+oSqMxw89Prq1JD6et4B/WfElh/l+CE
   SlNdRUzyu/zcwcB8gDv6I8L9AN2esS4joKa/jZcgeYpGFgacfb7aNMFpw
   Q==;
X-CSE-ConnectionGUID: evWwvk7hSXOOWJEdHddCuQ==
X-CSE-MsgGUID: Zk4GQ09nQhWEoPieAdi1eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26422830"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="26422830"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 09:12:45 -0700
X-CSE-ConnectionGUID: L/xsXPF+RoqwKdg1r8dhFw==
X-CSE-MsgGUID: zpPSMDeyQP+AnQlxn3Lotg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="98622151"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Aug 2024 09:12:45 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgnwv-000BgE-38;
	Wed, 21 Aug 2024 16:12:41 +0000
Date: Thu, 22 Aug 2024 00:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5385/5728] fs/bcachefs/rcu_pending.c:455
 __rcu_pending_enqueue() error: we previously assumed 'head' could be null
 (see line 408)
Message-ID: <202408220053.oErzwP8D-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eb8c5ca373cbb018a84eb4db25c863302c9b6314
commit: d8eb83cb1c8fddbdd56cf2ff44cf69238bed0df3 [5385/5728] bcachefs: rcu_pending
:::::: branch date: 12 hours ago
:::::: commit date: 25 hours ago
config: i386-randconfig-141-20240821 (https://download.01.org/0day-ci/archive/20240822/202408220053.oErzwP8D-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408220053.oErzwP8D-lkp@intel.com/

smatch warnings:
fs/bcachefs/rcu_pending.c:455 __rcu_pending_enqueue() error: we previously assumed 'head' could be null (see line 408)

vim +/head +455 fs/bcachefs/rcu_pending.c

d8eb83cb1c8fdd Kent Overstreet 2024-06-10  364  
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  365  	struct rcu_pending_pcpu *p;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  366  	struct rcu_pending_seq *objs;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  367  	struct genradix_node *new_node = NULL;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  368  	unsigned long seq, flags;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  369  	bool start_gp = false;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  370  
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  371  	BUG_ON((ptr != NULL) != (pending->process == RCU_PENDING_KVFREE_FN));
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  372  
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  373  	local_irq_save(flags);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  374  	p = this_cpu_ptr(pending->p);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  375  	spin_lock(&p->lock);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  376  	seq = __get_state_synchronize_rcu(pending->srcu);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  377  restart:
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  378  	if (may_sleep &&
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  379  	    unlikely(process_finished_items(pending, p, flags)))
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  380  		goto check_expired;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  381  
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  382  	/*
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  383  	 * In kvfree_rcu() mode, the radix tree is only for slab pointers so
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  384  	 * that we can do kfree_bulk() - vmalloc pointers always use the linked
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  385  	 * list:
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  386  	 */
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  387  	if (ptr && unlikely(is_vmalloc_addr(ptr)))
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  388  		goto list_add;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  389  
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  390  	objs = get_object_radix(p, seq);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  391  	if (unlikely(!objs))
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  392  		goto list_add;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  393  
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  394  	if (unlikely(!objs->cursor)) {
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  395  		/*
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  396  		 * New radix tree nodes must be added under @p->lock because the
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  397  		 * tree root is in a darray that can be resized (typically,
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  398  		 * genradix supports concurrent unlocked allocation of new
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  399  		 * nodes) - hence preallocation and the retry loop:
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  400  		 */
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  401  		objs->cursor = genradix_ptr_alloc_preallocated_inlined(&objs->objs,
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  402  						objs->nr, &new_node, GFP_ATOMIC|__GFP_NOWARN);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  403  		if (unlikely(!objs->cursor)) {
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  404  			if (may_sleep) {
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  405  				spin_unlock_irqrestore(&p->lock, flags);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  406  
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  407  				gfp_t gfp = GFP_KERNEL;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10 @408  				if (!head)
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  409  					gfp |= __GFP_NOFAIL;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  410  
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  411  				new_node = genradix_alloc_node(gfp);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  412  				if (!new_node)
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  413  					may_sleep = false;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  414  				goto check_expired;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  415  			}
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  416  list_add:
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  417  			start_gp = rcu_pending_enqueue_list(p, seq, head, ptr, &flags);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  418  			goto start_gp;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  419  		}
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  420  	}
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  421  
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  422  	*objs->cursor++ = ptr ?: head;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  423  	/* zero cursor if we hit the end of a radix tree node: */
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  424  	if (!(((ulong) objs->cursor) & (GENRADIX_NODE_SIZE - 1)))
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  425  		objs->cursor = NULL;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  426  	start_gp = !objs->nr;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  427  	objs->nr++;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  428  start_gp:
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  429  	if (unlikely(start_gp)) {
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  430  		/*
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  431  		 * We only have one callback (ideally, we would have one for
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  432  		 * every outstanding graceperiod) - so if our callback is
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  433  		 * already in flight, we may still have to start a grace period
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  434  		 * (since we used get_state() above, not start_poll())
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  435  		 */
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  436  		if (!p->cb_armed) {
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  437  			p->cb_armed = true;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  438  			__call_rcu(pending->srcu, &p->cb, rcu_pending_rcu_cb);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  439  		} else {
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  440  			__start_poll_synchronize_rcu(pending->srcu);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  441  		}
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  442  	}
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  443  	spin_unlock_irqrestore(&p->lock, flags);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  444  free_node:
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  445  	if (new_node)
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  446  		genradix_free_node(new_node);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  447  	return;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  448  check_expired:
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  449  	if (unlikely(__poll_state_synchronize_rcu(pending->srcu, seq))) {
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  450  		switch ((ulong) pending->process) {
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  451  		case RCU_PENDING_KVFREE:
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  452  			kvfree(ptr);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  453  			break;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  454  		case RCU_PENDING_CALL_RCU:
d8eb83cb1c8fdd Kent Overstreet 2024-06-10 @455  			head->func(head);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  456  			break;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  457  		default:
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  458  			pending->process(pending, head);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  459  			break;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  460  		}
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  461  		goto free_node;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  462  	}
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  463  
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  464  	local_irq_save(flags);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  465  	p = this_cpu_ptr(pending->p);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  466  	spin_lock(&p->lock);
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  467  	goto restart;
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  468  }
d8eb83cb1c8fdd Kent Overstreet 2024-06-10  469  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
