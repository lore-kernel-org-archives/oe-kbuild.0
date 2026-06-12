Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58C2175A7D
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 22:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304707; cv=none; b=BzWOmvznxJzoYrLjhDhibt9gKRFFRAFMJ5nj9fqWe8O1hOX5Urmd5rLD6damgOueKqk07wN166oZfM/7E6qUp/MIPok2NIw53rQ9LD1r34koFrbz8LOGRWtBDUQxnadTzjHQ5l0oWdFB58O1iMYQ3xUdJ9SiiYpCzMvqNrngrl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304707; c=relaxed/simple;
	bh=PDjceWzYaVKlok4JojDvAr7a1zuAsQ9YMyIvnzH91U8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ktfnClBr4NsRMya9rKxpIQS95+UENQ7KGx5q3B6LWJsVGitC7p01xsK1t+LYTdlHOf1aGMKoB6e/E3tFTDbAlHwYrK6+WL19M8NRN2Y4GEC1G7e/ymRgcGUx3GNTix4y/xMN8mZ+doNpcs4nc5gqdLCYWoFgvYi5IRgqnV7JaVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4pSh4Pa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4pSh4Pa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781304705; x=1812840705;
  h=date:from:to:cc:subject:message-id;
  bh=PDjceWzYaVKlok4JojDvAr7a1zuAsQ9YMyIvnzH91U8=;
  b=a4pSh4PaXfRhDTmSh6MBHWmPSSeebq+N1hKp38Jb9YGksdVnas6WEpc+
   fcN0XpCVqiZil3n1H4TRNzcLmf4sNRljA7t/QmV+CfxLUwUUmRXDpdk64
   MFXvfbMHNfBzYfPHfIWTyMikRIEDKPhFF3q+doKwwUYut00MGf9ERGmqi
   Tb0g9Qu7d2ZNq+p/470r+cM+AmkTg7PKeShc7pLeuEX1Hkr/GWRxynPxl
   NR+BQhEeS6+Xj9Q69lMKcS17R2A0gzJmFBv0I7+fTffLLqB/i3C8skJxD
   YZFnGujH5EFvqofX3fOUHAQGA5np8zrtbH1aMvtpedgVkv31dF5TKNmeQ
   Q==;
X-CSE-ConnectionGUID: NA0pYAFVSp6VGDU3LT+KKA==
X-CSE-MsgGUID: 6RG4Ohu1TgeHKdXWybgbyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="85989803"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="85989803"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 15:51:44 -0700
X-CSE-ConnectionGUID: itm1qtKcTWeD35ASNYR68Q==
X-CSE-MsgGUID: yJEh1ZnpSGuvM5QkYr5q+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="242563204"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jun 2026 15:51:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYAiy-00000000PPR-3Xgx;
	Fri, 12 Jun 2026 22:51:40 +0000
Date: Sat, 13 Jun 2026 06:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/cadence/macb_main.c:2060:17: error:
 implicit declaration of function 'netdev_warn_ratelimited'; did you mean
 'dev_warn_ratelimited'?
Message-ID: <202606130648.ZcSwrFiG-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
TO: Lukasz Raczylo <lukasz@raczylo.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/net-macb-add-TX-stall-timeout-callback-to-recover-from-lost-TSTART-write/20260612-165954
head:   45ee3dba9a71399fea209ce76886eff64f7404db
commit: 4732b4129ce920cfd0bcb3e8c53b1e1ba663b44c net: macb: add TX stall watchdog to recover from lost TCOMP interrupts
date:   4 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 weeks ago
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260613/202606130648.ZcSwrFiG-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130648.ZcSwrFiG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606130648.ZcSwrFiG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/cadence/macb_main.c: In function 'macb_tx_stall_watchdog':
>> drivers/net/ethernet/cadence/macb_main.c:2060:17: error: implicit declaration of function 'netdev_warn_ratelimited'; did you mean 'dev_warn_ratelimited'? [-Wimplicit-function-declaration]
    2060 |                 netdev_warn_ratelimited(bp->dev,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 dev_warn_ratelimited
   drivers/net/ethernet/cadence/macb_main.c: In function 'gem_get_ethtool_strings':
   drivers/net/ethernet/cadence/macb_main.c:3456:28: warning: variable 'queue' set but not used [-Wunused-but-set-variable=]
    3456 |         struct macb_queue *queue;
         |                            ^~~~~


vim +2060 drivers/net/ethernet/cadence/macb_main.c

4732b4129ce920c Lukasz Raczylo 2026-05-14  2009  
4732b4129ce920c Lukasz Raczylo 2026-05-14  2010  /*
4732b4129ce920c Lukasz Raczylo 2026-05-14  2011   * TX stall watchdog.
4732b4129ce920c Lukasz Raczylo 2026-05-14  2012   *
4732b4129ce920c Lukasz Raczylo 2026-05-14  2013   * Recovers from lost TCOMP interrupts on PCIe-attached macb
4732b4129ce920c Lukasz Raczylo 2026-05-14  2014   * instances.  macb already has a recovery chain
4732b4129ce920c Lukasz Raczylo 2026-05-14  2015   * (txubr_pending -> macb_tx_restart()) that fires on TCOMP; if
4732b4129ce920c Lukasz Raczylo 2026-05-14  2016   * TCOMP itself is lost the TX ring stalls silently until something
4732b4129ce920c Lukasz Raczylo 2026-05-14  2017   * else kicks TSTART.  This watchdog runs once per second per queue
4732b4129ce920c Lukasz Raczylo 2026-05-14  2018   * and calls macb_tx_restart() if the ring is non-empty and
4732b4129ce920c Lukasz Raczylo 2026-05-14  2019   * tx_tail has not advanced since the previous tick.
4732b4129ce920c Lukasz Raczylo 2026-05-14  2020   *
4732b4129ce920c Lukasz Raczylo 2026-05-14  2021   * Movement is tracked via the tx_stall_tail_moved boolean rather
4732b4129ce920c Lukasz Raczylo 2026-05-14  2022   * than a tx_tail snapshot, sidestepping any ring-index aliasing
4732b4129ce920c Lukasz Raczylo 2026-05-14  2023   * concern.  The bool is set by macb_tx_complete() when tx_tail
4732b4129ce920c Lukasz Raczylo 2026-05-14  2024   * advances and cleared here on each tick; both writes are under
4732b4129ce920c Lukasz Raczylo 2026-05-14  2025   * tx_ptr_lock so no atomic is required.
4732b4129ce920c Lukasz Raczylo 2026-05-14  2026   *
4732b4129ce920c Lukasz Raczylo 2026-05-14  2027   * macb_tx_restart() already checks the hardware's TBQP against
4732b4129ce920c Lukasz Raczylo 2026-05-14  2028   * the driver's head index before re-asserting TSTART, so on a
4732b4129ce920c Lukasz Raczylo 2026-05-14  2029   * healthy ring this is a no-op at the hardware level.  The
4732b4129ce920c Lukasz Raczylo 2026-05-14  2030   * watchdog only supplies the missing trigger.
4732b4129ce920c Lukasz Raczylo 2026-05-14  2031   */
4732b4129ce920c Lukasz Raczylo 2026-05-14  2032  static void macb_tx_stall_watchdog(struct work_struct *work)
4732b4129ce920c Lukasz Raczylo 2026-05-14  2033  {
4732b4129ce920c Lukasz Raczylo 2026-05-14  2034  	struct macb_queue *queue = container_of(to_delayed_work(work),
4732b4129ce920c Lukasz Raczylo 2026-05-14  2035  						struct macb_queue,
4732b4129ce920c Lukasz Raczylo 2026-05-14  2036  						tx_stall_watchdog_work);
4732b4129ce920c Lukasz Raczylo 2026-05-14  2037  	struct macb *bp = queue->bp;
4732b4129ce920c Lukasz Raczylo 2026-05-14  2038  	unsigned int cur_tail, cur_head;
4732b4129ce920c Lukasz Raczylo 2026-05-14  2039  	bool stalled = false;
4732b4129ce920c Lukasz Raczylo 2026-05-14  2040  	unsigned long flags;
4732b4129ce920c Lukasz Raczylo 2026-05-14  2041  
4732b4129ce920c Lukasz Raczylo 2026-05-14  2042  	if (!netif_running(bp->dev))
4732b4129ce920c Lukasz Raczylo 2026-05-14  2043  		return;
4732b4129ce920c Lukasz Raczylo 2026-05-14  2044  
4732b4129ce920c Lukasz Raczylo 2026-05-14  2045  	/* No carrier => no completion is possible.  Skip the check
4732b4129ce920c Lukasz Raczylo 2026-05-14  2046  	 * but keep the watchdog ticking for when carrier comes up.
4732b4129ce920c Lukasz Raczylo 2026-05-14  2047  	 */
4732b4129ce920c Lukasz Raczylo 2026-05-14  2048  	if (!netif_carrier_ok(bp->dev))
4732b4129ce920c Lukasz Raczylo 2026-05-14  2049  		goto reschedule;
4732b4129ce920c Lukasz Raczylo 2026-05-14  2050  
4732b4129ce920c Lukasz Raczylo 2026-05-14  2051  	spin_lock_irqsave(&queue->tx_ptr_lock, flags);
4732b4129ce920c Lukasz Raczylo 2026-05-14  2052  	cur_tail = queue->tx_tail;
4732b4129ce920c Lukasz Raczylo 2026-05-14  2053  	cur_head = queue->tx_head;
4732b4129ce920c Lukasz Raczylo 2026-05-14  2054  	if (cur_head != cur_tail && !queue->tx_stall_tail_moved)
4732b4129ce920c Lukasz Raczylo 2026-05-14  2055  		stalled = true;
4732b4129ce920c Lukasz Raczylo 2026-05-14  2056  	queue->tx_stall_tail_moved = false;
4732b4129ce920c Lukasz Raczylo 2026-05-14  2057  	spin_unlock_irqrestore(&queue->tx_ptr_lock, flags);
4732b4129ce920c Lukasz Raczylo 2026-05-14  2058  
4732b4129ce920c Lukasz Raczylo 2026-05-14  2059  	if (stalled) {
4732b4129ce920c Lukasz Raczylo 2026-05-14 @2060  		netdev_warn_ratelimited(bp->dev,
4732b4129ce920c Lukasz Raczylo 2026-05-14  2061  					"TX stall detected on queue %u (tail=%u head=%u); re-kicking TSTART\n",
4732b4129ce920c Lukasz Raczylo 2026-05-14  2062  					(unsigned int)(queue - bp->queues),
4732b4129ce920c Lukasz Raczylo 2026-05-14  2063  					cur_tail, cur_head);
4732b4129ce920c Lukasz Raczylo 2026-05-14  2064  		macb_tx_restart(queue);
4732b4129ce920c Lukasz Raczylo 2026-05-14  2065  	}
4732b4129ce920c Lukasz Raczylo 2026-05-14  2066  
4732b4129ce920c Lukasz Raczylo 2026-05-14  2067  reschedule:
4732b4129ce920c Lukasz Raczylo 2026-05-14  2068  	schedule_delayed_work(&queue->tx_stall_watchdog_work,
4732b4129ce920c Lukasz Raczylo 2026-05-14  2069  			      msecs_to_jiffies(MACB_TX_STALL_INTERVAL_MS));
4732b4129ce920c Lukasz Raczylo 2026-05-14  2070  }
4732b4129ce920c Lukasz Raczylo 2026-05-14  2071  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
