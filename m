Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51E1364EA6
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 22:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302845; cv=none; b=U9s3Ht4HjqaowvYAa1FTKG7xXqNY4HuTLFUPzMq1FZDZJHZs9kYD9rj4mRl+GpFrpdtVO4uoVXqiwWxdlwJWwYJeTeTc5ozEgcJx/IG1KmjVgDb4WiXylQcA7zN/wy/A3i2fCDf1z/fe7NdLwvlS0lqbBsSgmpfI3qzD+5n16yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302845; c=relaxed/simple;
	bh=N6r5JVqTn0NtHQ/bqC7uFReUz2RNy5WYGnb4tF4UMIM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rkxhPsDHty3Liq96vVwHjIPNpjZCTYYCO6LfrdFsvJJrBcTx7EOveiGvuAS6E/iLXONJM/j32b1bl1rrlJ/4y7Zn3kZztrVht/lyTd/PhzxYhEWLSKu1LtJikVbtJCDjzA8ey9BLPF3sD4cLogDEemdWFPqJRyzvdrt+dpHr9jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOYNYnCs; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOYNYnCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781302842; x=1812838842;
  h=date:from:to:cc:subject:message-id;
  bh=N6r5JVqTn0NtHQ/bqC7uFReUz2RNy5WYGnb4tF4UMIM=;
  b=jOYNYnCs0w9LJFOcKSqz6zfoDpEzbCgC+NfIuq+N2kXHWFVOl+pWBLM2
   k8GtIH7jz/lLmZKof6eaWNOS5JMPsJDjdiNpDucykf/tTaYPHPt07RdO9
   nK0RSCrJ3PQqcOThBeF1CfUdBziMb4t048MuaqhOONnGrjKRHFT2cd/Nh
   3ccHgXOWYjlK9rtKS3ms7Fb1FKn4tDkuviHWPu04oh8+VmAY9dtp9422k
   gNNE9ei7UrIKYHies6U5lupdtF+Ikeu00RxvdvazhHWR+C8VnCsUOkK99
   cXECQZH/NJL46vsXym26tfGnaAssFgUK3Eo8CmulidNNk/yn7S2k3LSjd
   w==;
X-CSE-ConnectionGUID: Ft9a4U12TE6K7ei+VGmt3Q==
X-CSE-MsgGUID: +uceiK3TRrmFP4aMWEzoKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="104813081"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="104813081"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 15:20:42 -0700
X-CSE-ConnectionGUID: TA5o5tTETX2bTahbTYUyBA==
X-CSE-MsgGUID: Pme8r5NpTFeDehdgPy0UEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="245822074"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jun 2026 15:20:41 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYAEw-00000000PNx-3fam;
	Fri, 12 Jun 2026 22:20:38 +0000
Date: Sat, 13 Jun 2026 06:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/cadence/macb_main.c:2060:3: error: call
 to undeclared function 'netdev_warn_ratelimited'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202606130644.whpqnTly-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Andrea-della-Porta/net-macb-add-TX-stall-timeout-callback-to-recover-from-lost-TSTART-write/20260612-165954, commit: 4732b4129ce920cfd0bcb3e8c53b1e1ba663b44c"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Lukasz Raczylo <lukasz@raczylo.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/net-macb-add-TX-stall-timeout-callback-to-recover-from-lost-TSTART-write/20260612-165954
head:   45ee3dba9a71399fea209ce76886eff64f7404db
commit: 4732b4129ce920cfd0bcb3e8c53b1e1ba663b44c net: macb: add TX stall watchdog to recover from lost TCOMP interrupts
date:   4 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 weeks ago
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260613/202606130644.whpqnTly-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 305faf498a4e0b52b40742c927af63ab2082e1a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130644.whpqnTly-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606130644.whpqnTly-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/cadence/macb_main.c:2060:3: error: call to undeclared function 'netdev_warn_ratelimited'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2060 |                 netdev_warn_ratelimited(bp->dev,
         |                 ^
   1 error generated.


vim +/netdev_warn_ratelimited +2060 drivers/net/ethernet/cadence/macb_main.c

4732b4129ce920 Lukasz Raczylo 2026-05-14  2009  
4732b4129ce920 Lukasz Raczylo 2026-05-14  2010  /*
4732b4129ce920 Lukasz Raczylo 2026-05-14  2011   * TX stall watchdog.
4732b4129ce920 Lukasz Raczylo 2026-05-14  2012   *
4732b4129ce920 Lukasz Raczylo 2026-05-14  2013   * Recovers from lost TCOMP interrupts on PCIe-attached macb
4732b4129ce920 Lukasz Raczylo 2026-05-14  2014   * instances.  macb already has a recovery chain
4732b4129ce920 Lukasz Raczylo 2026-05-14  2015   * (txubr_pending -> macb_tx_restart()) that fires on TCOMP; if
4732b4129ce920 Lukasz Raczylo 2026-05-14  2016   * TCOMP itself is lost the TX ring stalls silently until something
4732b4129ce920 Lukasz Raczylo 2026-05-14  2017   * else kicks TSTART.  This watchdog runs once per second per queue
4732b4129ce920 Lukasz Raczylo 2026-05-14  2018   * and calls macb_tx_restart() if the ring is non-empty and
4732b4129ce920 Lukasz Raczylo 2026-05-14  2019   * tx_tail has not advanced since the previous tick.
4732b4129ce920 Lukasz Raczylo 2026-05-14  2020   *
4732b4129ce920 Lukasz Raczylo 2026-05-14  2021   * Movement is tracked via the tx_stall_tail_moved boolean rather
4732b4129ce920 Lukasz Raczylo 2026-05-14  2022   * than a tx_tail snapshot, sidestepping any ring-index aliasing
4732b4129ce920 Lukasz Raczylo 2026-05-14  2023   * concern.  The bool is set by macb_tx_complete() when tx_tail
4732b4129ce920 Lukasz Raczylo 2026-05-14  2024   * advances and cleared here on each tick; both writes are under
4732b4129ce920 Lukasz Raczylo 2026-05-14  2025   * tx_ptr_lock so no atomic is required.
4732b4129ce920 Lukasz Raczylo 2026-05-14  2026   *
4732b4129ce920 Lukasz Raczylo 2026-05-14  2027   * macb_tx_restart() already checks the hardware's TBQP against
4732b4129ce920 Lukasz Raczylo 2026-05-14  2028   * the driver's head index before re-asserting TSTART, so on a
4732b4129ce920 Lukasz Raczylo 2026-05-14  2029   * healthy ring this is a no-op at the hardware level.  The
4732b4129ce920 Lukasz Raczylo 2026-05-14  2030   * watchdog only supplies the missing trigger.
4732b4129ce920 Lukasz Raczylo 2026-05-14  2031   */
4732b4129ce920 Lukasz Raczylo 2026-05-14  2032  static void macb_tx_stall_watchdog(struct work_struct *work)
4732b4129ce920 Lukasz Raczylo 2026-05-14  2033  {
4732b4129ce920 Lukasz Raczylo 2026-05-14  2034  	struct macb_queue *queue = container_of(to_delayed_work(work),
4732b4129ce920 Lukasz Raczylo 2026-05-14  2035  						struct macb_queue,
4732b4129ce920 Lukasz Raczylo 2026-05-14  2036  						tx_stall_watchdog_work);
4732b4129ce920 Lukasz Raczylo 2026-05-14  2037  	struct macb *bp = queue->bp;
4732b4129ce920 Lukasz Raczylo 2026-05-14  2038  	unsigned int cur_tail, cur_head;
4732b4129ce920 Lukasz Raczylo 2026-05-14  2039  	bool stalled = false;
4732b4129ce920 Lukasz Raczylo 2026-05-14  2040  	unsigned long flags;
4732b4129ce920 Lukasz Raczylo 2026-05-14  2041  
4732b4129ce920 Lukasz Raczylo 2026-05-14  2042  	if (!netif_running(bp->dev))
4732b4129ce920 Lukasz Raczylo 2026-05-14  2043  		return;
4732b4129ce920 Lukasz Raczylo 2026-05-14  2044  
4732b4129ce920 Lukasz Raczylo 2026-05-14  2045  	/* No carrier => no completion is possible.  Skip the check
4732b4129ce920 Lukasz Raczylo 2026-05-14  2046  	 * but keep the watchdog ticking for when carrier comes up.
4732b4129ce920 Lukasz Raczylo 2026-05-14  2047  	 */
4732b4129ce920 Lukasz Raczylo 2026-05-14  2048  	if (!netif_carrier_ok(bp->dev))
4732b4129ce920 Lukasz Raczylo 2026-05-14  2049  		goto reschedule;
4732b4129ce920 Lukasz Raczylo 2026-05-14  2050  
4732b4129ce920 Lukasz Raczylo 2026-05-14  2051  	spin_lock_irqsave(&queue->tx_ptr_lock, flags);
4732b4129ce920 Lukasz Raczylo 2026-05-14  2052  	cur_tail = queue->tx_tail;
4732b4129ce920 Lukasz Raczylo 2026-05-14  2053  	cur_head = queue->tx_head;
4732b4129ce920 Lukasz Raczylo 2026-05-14  2054  	if (cur_head != cur_tail && !queue->tx_stall_tail_moved)
4732b4129ce920 Lukasz Raczylo 2026-05-14  2055  		stalled = true;
4732b4129ce920 Lukasz Raczylo 2026-05-14  2056  	queue->tx_stall_tail_moved = false;
4732b4129ce920 Lukasz Raczylo 2026-05-14  2057  	spin_unlock_irqrestore(&queue->tx_ptr_lock, flags);
4732b4129ce920 Lukasz Raczylo 2026-05-14  2058  
4732b4129ce920 Lukasz Raczylo 2026-05-14  2059  	if (stalled) {
4732b4129ce920 Lukasz Raczylo 2026-05-14 @2060  		netdev_warn_ratelimited(bp->dev,
4732b4129ce920 Lukasz Raczylo 2026-05-14  2061  					"TX stall detected on queue %u (tail=%u head=%u); re-kicking TSTART\n",
4732b4129ce920 Lukasz Raczylo 2026-05-14  2062  					(unsigned int)(queue - bp->queues),
4732b4129ce920 Lukasz Raczylo 2026-05-14  2063  					cur_tail, cur_head);
4732b4129ce920 Lukasz Raczylo 2026-05-14  2064  		macb_tx_restart(queue);
4732b4129ce920 Lukasz Raczylo 2026-05-14  2065  	}
4732b4129ce920 Lukasz Raczylo 2026-05-14  2066  
4732b4129ce920 Lukasz Raczylo 2026-05-14  2067  reschedule:
4732b4129ce920 Lukasz Raczylo 2026-05-14  2068  	schedule_delayed_work(&queue->tx_stall_watchdog_work,
4732b4129ce920 Lukasz Raczylo 2026-05-14  2069  			      msecs_to_jiffies(MACB_TX_STALL_INTERVAL_MS));
4732b4129ce920 Lukasz Raczylo 2026-05-14  2070  }
4732b4129ce920 Lukasz Raczylo 2026-05-14  2071  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
