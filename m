Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DF27E9
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Mar 2023 10:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679222527; x=1710758527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6n6o7aEQRIkMSfRA24T1IvRE6RCmdyCVrvPxHg1KZ6o=;
  b=PLvjnvvVEM2xbEneiFER9FxGDUIh/vCIQLig7q9J36vq/MAWGPu+S/1v
   qIo+rfomjlUhyx3IT20X7jgOBs0fHndjoUHh2IFHc42EIeYTDNCnarlx/
   y12L83fgAlFE1faVMv+kOzYaIrlZowoa6Q2eB77kiq0Opa73Jgm4ojYUz
   s/cBwZi4fPO0Q8i/6c5MgwMTRx8KGv032QnwPCW7dcz9sDIxxf6vSEDbJ
   +ic4vwDXPhuCv9JqdDl6JW/+cOaf9surZwyqr7fr//mRa1VMJ9rG6FUUf
   bSebJjpgPeKjB9e2FwBA9WxUG+3GygnoX+QCA79A787yAVMNagY0OBTHd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="337210146"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="337210146"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 03:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="1010176025"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="1010176025"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Mar 2023 03:42:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdqUH-000AUy-02;
	Sun, 19 Mar 2023 10:42:05 +0000
Date: Sun, 19 Mar 2023 18:41:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [paulmck-rcu:dev.2023.03.17a 28/38] kernel/rcu/srcutree.c:1662
 srcu_advance_state() warn: inconsistent returns
 '&ssp->srcu_sup->srcu_gp_mutex'.
Message-ID: <202303191802.HhQqb7Dd-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.03.17a
head:   19d218a4b125a4dce12eb88097a9c55f7126ce8c
commit: ae3326ae476fcd96be4d0e9833cfce07505cea59 [28/38] srcu: Move ->srcu_gp_mutex from srcu_struct to srcu_usage
:::::: branch date: 14 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230319/202303191802.HhQqb7Dd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303191802.HhQqb7Dd-lkp@intel.com/

smatch warnings:
kernel/rcu/srcutree.c:1662 srcu_advance_state() warn: inconsistent returns '&ssp->srcu_sup->srcu_gp_mutex'.

vim +1662 kernel/rcu/srcutree.c

dad81a2026841b Paul E. McKenney 2017-03-25  1596  
dad81a2026841b Paul E. McKenney 2017-03-25  1597  /*
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1598   * Core SRCU state machine.  Push state bits of ->srcu_gp_seq
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1599   * to SRCU_STATE_SCAN2, and invoke srcu_gp_end() when scan has
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1600   * completed in that state.
dad81a2026841b Paul E. McKenney 2017-03-25  1601   */
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1602  static void srcu_advance_state(struct srcu_struct *ssp)
dad81a2026841b Paul E. McKenney 2017-03-25  1603  {
dad81a2026841b Paul E. McKenney 2017-03-25  1604  	int idx;
dad81a2026841b Paul E. McKenney 2017-03-25  1605  
ae3326ae476fcd Paul E. McKenney 2023-03-17  1606  	mutex_lock(&ssp->srcu_sup->srcu_gp_mutex);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1607  
dad81a2026841b Paul E. McKenney 2017-03-25  1608  	/*
dad81a2026841b Paul E. McKenney 2017-03-25  1609  	 * Because readers might be delayed for an extended period after
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1610  	 * fetching ->srcu_idx for their index, at any point in time there
dad81a2026841b Paul E. McKenney 2017-03-25  1611  	 * might well be readers using both idx=0 and idx=1.  We therefore
dad81a2026841b Paul E. McKenney 2017-03-25  1612  	 * need to wait for readers to clear from both index values before
dad81a2026841b Paul E. McKenney 2017-03-25  1613  	 * invoking a callback.
dad81a2026841b Paul E. McKenney 2017-03-25  1614  	 *
dad81a2026841b Paul E. McKenney 2017-03-25  1615  	 * The load-acquire ensures that we see the accesses performed
dad81a2026841b Paul E. McKenney 2017-03-25  1616  	 * by the prior grace period.
dad81a2026841b Paul E. McKenney 2017-03-25  1617  	 */
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1618  	idx = rcu_seq_state(smp_load_acquire(&ssp->srcu_gp_seq)); /* ^^^ */
dad81a2026841b Paul E. McKenney 2017-03-25  1619  	if (idx == SRCU_STATE_IDLE) {
a40cd3c096b80b Paul E. McKenney 2023-03-17  1620  		spin_lock_irq_rcu_node(ssp->srcu_sup);
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1621  		if (ULONG_CMP_GE(ssp->srcu_gp_seq, ssp->srcu_gp_seq_needed)) {
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1622  			WARN_ON_ONCE(rcu_seq_state(ssp->srcu_gp_seq));
a40cd3c096b80b Paul E. McKenney 2023-03-17  1623  			spin_unlock_irq_rcu_node(ssp->srcu_sup);
ae3326ae476fcd Paul E. McKenney 2023-03-17  1624  			mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex);
dad81a2026841b Paul E. McKenney 2017-03-25  1625  			return;
dad81a2026841b Paul E. McKenney 2017-03-25  1626  		}
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1627  		idx = rcu_seq_state(READ_ONCE(ssp->srcu_gp_seq));
dad81a2026841b Paul E. McKenney 2017-03-25  1628  		if (idx == SRCU_STATE_IDLE)
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1629  			srcu_gp_start(ssp);
a40cd3c096b80b Paul E. McKenney 2023-03-17  1630  		spin_unlock_irq_rcu_node(ssp->srcu_sup);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1631  		if (idx != SRCU_STATE_IDLE) {
ae3326ae476fcd Paul E. McKenney 2023-03-17  1632  			mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex);
dad81a2026841b Paul E. McKenney 2017-03-25  1633  			return; /* Someone else started the grace period. */
dad81a2026841b Paul E. McKenney 2017-03-25  1634  		}
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1635  	}
dad81a2026841b Paul E. McKenney 2017-03-25  1636  
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1637  	if (rcu_seq_state(READ_ONCE(ssp->srcu_gp_seq)) == SRCU_STATE_SCAN1) {
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1638  		idx = 1 ^ (ssp->srcu_idx & 1);
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1639  		if (!try_check_zero(ssp, idx, 1)) {
ae3326ae476fcd Paul E. McKenney 2023-03-17  1640  			mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex);
dad81a2026841b Paul E. McKenney 2017-03-25  1641  			return; /* readers present, retry later. */
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1642  		}
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1643  		srcu_flip(ssp);
a40cd3c096b80b Paul E. McKenney 2023-03-17  1644  		spin_lock_irq_rcu_node(ssp->srcu_sup);
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1645  		rcu_seq_set_state(&ssp->srcu_gp_seq, SRCU_STATE_SCAN2);
282d8998e9979c Paul E. McKenney 2022-03-08  1646  		ssp->srcu_n_exp_nodelay = 0;
a40cd3c096b80b Paul E. McKenney 2023-03-17  1647  		spin_unlock_irq_rcu_node(ssp->srcu_sup);
dad81a2026841b Paul E. McKenney 2017-03-25  1648  	}
dad81a2026841b Paul E. McKenney 2017-03-25  1649  
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1650  	if (rcu_seq_state(READ_ONCE(ssp->srcu_gp_seq)) == SRCU_STATE_SCAN2) {
dad81a2026841b Paul E. McKenney 2017-03-25  1651  
dad81a2026841b Paul E. McKenney 2017-03-25  1652  		/*
dad81a2026841b Paul E. McKenney 2017-03-25  1653  		 * SRCU read-side critical sections are normally short,
dad81a2026841b Paul E. McKenney 2017-03-25  1654  		 * so check at least twice in quick succession after a flip.
dad81a2026841b Paul E. McKenney 2017-03-25  1655  		 */
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1656  		idx = 1 ^ (ssp->srcu_idx & 1);
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1657  		if (!try_check_zero(ssp, idx, 2)) {
ae3326ae476fcd Paul E. McKenney 2023-03-17  1658  			mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1659  			return; /* readers present, retry later. */
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1660  		}
282d8998e9979c Paul E. McKenney 2022-03-08  1661  		ssp->srcu_n_exp_nodelay = 0;
aacb5d91ab1bfb Paul E. McKenney 2018-10-28 @1662  		srcu_gp_end(ssp);  /* Releases ->srcu_gp_mutex. */
dad81a2026841b Paul E. McKenney 2017-03-25  1663  	}
dad81a2026841b Paul E. McKenney 2017-03-25  1664  }
dad81a2026841b Paul E. McKenney 2017-03-25  1665  

:::::: The code at line 1662 was first introduced by commit
:::::: aacb5d91ab1bfbb0e8123da59a2e333d52ba7f60 srcu: Use "ssp" instead of "sp" for srcu_struct pointer

:::::: TO: Paul E. McKenney <paulmck@linux.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
