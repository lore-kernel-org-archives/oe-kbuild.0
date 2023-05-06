Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A4415B6
	for <oe-kbuild@lists.linux.dev>; Sat,  6 May 2023 01:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683336635; x=1714872635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q0ZRPgPVmlSY6dpKNBQFzgRLKxYbdTx73nBqDef/It4=;
  b=kAwN8tggRFsj7YbU8z4NvJSQrzf1RstSX/647nKW6Z58Kcx+PpDCOHXt
   O98r19X5afpJhG/bBAJ+fCyVSa8fELOrwkL4t1PaWdYtNd23BhrjJ76Xf
   8RUvKZBfeFKCR0taD5shccxCImKJDj+pZ8E9XCYbREhdHd0xmRoxcF5/r
   ri7iy4njBN6hml5skqhBHPszttxB/Ydczzq2RYG7+5mZhafuwiBfGXdEs
   JecCfartxS9QVlo7/gETC4Zx07GUpBkgVBrCc/lK3ZtfsP6jdFpROc+Gc
   5wmNzUQatx0hjZT8Q1nKgheJ6OEPshhD4UraTczir9iK/1VuGwG4najku
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="349366735"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="349366735"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 18:30:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="872092576"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="872092576"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 May 2023 18:30:33 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv6kr-00011d-00;
	Sat, 06 May 2023 01:30:33 +0000
Date: Sat, 6 May 2023 09:30:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/rcu/srcutree.c:1644 srcu_advance_state() warn: inconsistent
 returns '&ssp->srcu_sup->srcu_gp_mutex'.
Message-ID: <202305060951.I8mz6eHt-lkp@intel.com>
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
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   418d5c98319f67b9ae651babea031b5394425c18
commit: e3a6ab25cfa0fcdcb31c346b9871a566d440980d srcu: Move ->srcu_gp_mutex from srcu_struct to srcu_usage
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-m001-20230501 (https://download.01.org/0day-ci/archive/20230506/202305060951.I8mz6eHt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305060951.I8mz6eHt-lkp@intel.com/

smatch warnings:
kernel/rcu/srcutree.c:1644 srcu_advance_state() warn: inconsistent returns '&ssp->srcu_sup->srcu_gp_mutex'.

vim +1644 kernel/rcu/srcutree.c

dad81a2026841b Paul E. McKenney 2017-03-25  1578  
dad81a2026841b Paul E. McKenney 2017-03-25  1579  /*
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1580   * Core SRCU state machine.  Push state bits of ->srcu_gp_seq
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1581   * to SRCU_STATE_SCAN2, and invoke srcu_gp_end() when scan has
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1582   * completed in that state.
dad81a2026841b Paul E. McKenney 2017-03-25  1583   */
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1584  static void srcu_advance_state(struct srcu_struct *ssp)
dad81a2026841b Paul E. McKenney 2017-03-25  1585  {
dad81a2026841b Paul E. McKenney 2017-03-25  1586  	int idx;
dad81a2026841b Paul E. McKenney 2017-03-25  1587  
e3a6ab25cfa0fc Paul E. McKenney 2023-03-17  1588  	mutex_lock(&ssp->srcu_sup->srcu_gp_mutex);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1589  
dad81a2026841b Paul E. McKenney 2017-03-25  1590  	/*
dad81a2026841b Paul E. McKenney 2017-03-25  1591  	 * Because readers might be delayed for an extended period after
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1592  	 * fetching ->srcu_idx for their index, at any point in time there
dad81a2026841b Paul E. McKenney 2017-03-25  1593  	 * might well be readers using both idx=0 and idx=1.  We therefore
dad81a2026841b Paul E. McKenney 2017-03-25  1594  	 * need to wait for readers to clear from both index values before
dad81a2026841b Paul E. McKenney 2017-03-25  1595  	 * invoking a callback.
dad81a2026841b Paul E. McKenney 2017-03-25  1596  	 *
dad81a2026841b Paul E. McKenney 2017-03-25  1597  	 * The load-acquire ensures that we see the accesses performed
dad81a2026841b Paul E. McKenney 2017-03-25  1598  	 * by the prior grace period.
dad81a2026841b Paul E. McKenney 2017-03-25  1599  	 */
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1600  	idx = rcu_seq_state(smp_load_acquire(&ssp->srcu_gp_seq)); /* ^^^ */
dad81a2026841b Paul E. McKenney 2017-03-25  1601  	if (idx == SRCU_STATE_IDLE) {
b3fb11f7e9c3c6 Paul E. McKenney 2023-03-17  1602  		spin_lock_irq_rcu_node(ssp->srcu_sup);
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1603  		if (ULONG_CMP_GE(ssp->srcu_gp_seq, ssp->srcu_gp_seq_needed)) {
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1604  			WARN_ON_ONCE(rcu_seq_state(ssp->srcu_gp_seq));
b3fb11f7e9c3c6 Paul E. McKenney 2023-03-17  1605  			spin_unlock_irq_rcu_node(ssp->srcu_sup);
e3a6ab25cfa0fc Paul E. McKenney 2023-03-17  1606  			mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex);
dad81a2026841b Paul E. McKenney 2017-03-25  1607  			return;
dad81a2026841b Paul E. McKenney 2017-03-25  1608  		}
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1609  		idx = rcu_seq_state(READ_ONCE(ssp->srcu_gp_seq));
dad81a2026841b Paul E. McKenney 2017-03-25  1610  		if (idx == SRCU_STATE_IDLE)
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1611  			srcu_gp_start(ssp);
b3fb11f7e9c3c6 Paul E. McKenney 2023-03-17  1612  		spin_unlock_irq_rcu_node(ssp->srcu_sup);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1613  		if (idx != SRCU_STATE_IDLE) {
e3a6ab25cfa0fc Paul E. McKenney 2023-03-17  1614  			mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex);
dad81a2026841b Paul E. McKenney 2017-03-25  1615  			return; /* Someone else started the grace period. */
dad81a2026841b Paul E. McKenney 2017-03-25  1616  		}
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1617  	}
dad81a2026841b Paul E. McKenney 2017-03-25  1618  
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1619  	if (rcu_seq_state(READ_ONCE(ssp->srcu_gp_seq)) == SRCU_STATE_SCAN1) {
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1620  		idx = 1 ^ (ssp->srcu_idx & 1);
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1621  		if (!try_check_zero(ssp, idx, 1)) {
e3a6ab25cfa0fc Paul E. McKenney 2023-03-17  1622  			mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex);
dad81a2026841b Paul E. McKenney 2017-03-25  1623  			return; /* readers present, retry later. */
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1624  		}
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1625  		srcu_flip(ssp);
b3fb11f7e9c3c6 Paul E. McKenney 2023-03-17  1626  		spin_lock_irq_rcu_node(ssp->srcu_sup);
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1627  		rcu_seq_set_state(&ssp->srcu_gp_seq, SRCU_STATE_SCAN2);
282d8998e9979c Paul E. McKenney 2022-03-08  1628  		ssp->srcu_n_exp_nodelay = 0;
b3fb11f7e9c3c6 Paul E. McKenney 2023-03-17  1629  		spin_unlock_irq_rcu_node(ssp->srcu_sup);
dad81a2026841b Paul E. McKenney 2017-03-25  1630  	}
dad81a2026841b Paul E. McKenney 2017-03-25  1631  
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1632  	if (rcu_seq_state(READ_ONCE(ssp->srcu_gp_seq)) == SRCU_STATE_SCAN2) {
dad81a2026841b Paul E. McKenney 2017-03-25  1633  
dad81a2026841b Paul E. McKenney 2017-03-25  1634  		/*
dad81a2026841b Paul E. McKenney 2017-03-25  1635  		 * SRCU read-side critical sections are normally short,
dad81a2026841b Paul E. McKenney 2017-03-25  1636  		 * so check at least twice in quick succession after a flip.
dad81a2026841b Paul E. McKenney 2017-03-25  1637  		 */
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1638  		idx = 1 ^ (ssp->srcu_idx & 1);
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1639  		if (!try_check_zero(ssp, idx, 2)) {
e3a6ab25cfa0fc Paul E. McKenney 2023-03-17  1640  			mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1641  			return; /* readers present, retry later. */
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1642  		}
282d8998e9979c Paul E. McKenney 2022-03-08  1643  		ssp->srcu_n_exp_nodelay = 0;
aacb5d91ab1bfb Paul E. McKenney 2018-10-28 @1644  		srcu_gp_end(ssp);  /* Releases ->srcu_gp_mutex. */
dad81a2026841b Paul E. McKenney 2017-03-25  1645  	}
dad81a2026841b Paul E. McKenney 2017-03-25  1646  }
dad81a2026841b Paul E. McKenney 2017-03-25  1647  

:::::: The code at line 1644 was first introduced by commit
:::::: aacb5d91ab1bfbb0e8123da59a2e333d52ba7f60 srcu: Use "ssp" instead of "sp" for srcu_struct pointer

:::::: TO: Paul E. McKenney <paulmck@linux.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
