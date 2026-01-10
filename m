Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E01723A99E
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 01:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768010167; cv=none; b=jlnO9gFJSR7UXnPDl/rnpLRakp82Jm/GsxeZK345lOesYrAbNhJd9OWn/EcQ66slESSCzB/1I/FFBcTbEcs+EgbWqp+pxDIKCK6WnOAmJrParvTSQKSPajEaNsdgXwHgaB0g7AposibBLWS3BuqC4XCZYyljm6xJMwL1t0kpjZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768010167; c=relaxed/simple;
	bh=5N+AMrUg/V8xf40NFJUOQDkeRv82jSmsUPROLw+GeeM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jjag5Kg/Qh569RzT+fKk2WZey5OO7Trm7YceI426q3TXOllFLxSl3+rL0jOfaH0qFG2KWQ9DUR5KMTePzvJPQCaebbhOeI7qw6TtNXMnwp/A4I+oO1/RrsvQSZbu3vw/YkVjM2gZ8+R83GeAhcv79t3dJ2g6ibKaTmd4PO9JmOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvjhrBeQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvjhrBeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768010166; x=1799546166;
  h=date:from:to:cc:subject:message-id;
  bh=5N+AMrUg/V8xf40NFJUOQDkeRv82jSmsUPROLw+GeeM=;
  b=hvjhrBeQRhRdbaQ1LdrGONQAMI3jf5yxAXsr6DO3Y/x0uH6U2J92KKJz
   zzDnpHMCiQV/JVx9mmcJy2TR5m6p7kjhJYlROdiq7RSwbYyHLuy5zxjdE
   R6OY61VTgSiALWbzQgTWcuhP+1t8WuoOmW45NRJsCNRGLyDt5c3bf5X4B
   xN5goP9YQrB7z7Yuu/SeTq+b21ADp8QxHjzN5b+K081tv7Bb7QxBmj81I
   fEIzHrAiK1rs95rpMH9KPrhuB3Qfezk+zaMbUl7G6OphPhQSypofnB3Mo
   Oxdw87uk3eawhuf5Tme5cio3iyqLKRV+nTgCmWHVOBlTf+J7fxc34Hywg
   A==;
X-CSE-ConnectionGUID: 0sLocsg6QIe58yXpKm/VgQ==
X-CSE-MsgGUID: wDBTYvBbQsakILkGJSuraw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69461723"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69461723"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 17:56:05 -0800
X-CSE-ConnectionGUID: 6y/6zzC2Sfytts1FezC0gg==
X-CSE-MsgGUID: 1B10NH9bTMez1ZQQIPlGoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="234811185"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Jan 2026 17:56:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veOCv-000000007wg-2rai;
	Sat, 10 Jan 2026 01:56:01 +0000
Date: Sat, 10 Jan 2026 09:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:master 6/16] drivers/net/ethernet/smsc/smc91x.c:551
 smc_hardware_send_pkt() error: uninitialized symbol 'flags'.
Message-ID: <202601100959.bvpKZvdM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
head:   b7dccac786071bba98b0d834c517fd44a22c50f9
commit: ebf5a1884d1992b18e29f93e758387957bb68fe5 [6/16] Merge branch into tip/master: 'locking/core'
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-r071-20260109 (https://download.01.org/0day-ci/archive/20260110/202601100959.bvpKZvdM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601100959.bvpKZvdM-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/smsc/smc91x.c:551 smc_hardware_send_pkt() error: uninitialized symbol 'flags'.

Old smatch warnings:
drivers/net/ethernet/smsc/smc91x.c:561 smc_hardware_send_pkt() error: uninitialized symbol 'flags'.
drivers/net/ethernet/smsc/smc91x.c:601 smc_hardware_send_pkt() error: uninitialized symbol 'flags'.
drivers/net/ethernet/smsc/smc91x.c:2044 smc_probe() warn: 'dev->irq' from request_irq() not released on lines: 2044.

vim +/flags +551 drivers/net/ethernet/smsc/smc91x.c

^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  527  
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  528  /*
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  529   * This is called to actually send a packet to the chip.
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  530   */
7961fb1089f826 drivers/net/ethernet/smsc/smc91x.c Allen Pais       2020-09-14  531  static void smc_hardware_send_pkt(struct tasklet_struct *t)
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  532  {
7961fb1089f826 drivers/net/ethernet/smsc/smc91x.c Allen Pais       2020-09-14  533  	struct smc_local *lp = from_tasklet(lp, t, tx_task);
7961fb1089f826 drivers/net/ethernet/smsc/smc91x.c Allen Pais       2020-09-14  534  	struct net_device *dev = lp->dev;
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  535  	void __iomem *ioaddr = lp->base;
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  536  	struct sk_buff *skb;
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  537  	unsigned int packet_no, len;
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  538  	unsigned char *buf;
8ff499e43c5376 drivers/net/smc91x.c               Dongdong Deng    2009-08-23  539  	unsigned long flags;
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  540  
6389aa458ed995 drivers/net/ethernet/smsc/smc91x.c Ben Boeckel      2013-11-01  541  	DBG(3, dev, "%s\n", __func__);
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  542  
8ff499e43c5376 drivers/net/smc91x.c               Dongdong Deng    2009-08-23  543  	if (!smc_special_trylock(&lp->lock, flags)) {
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  544  		netif_stop_queue(dev);
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  545  		tasklet_schedule(&lp->tx_task);
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  546  		return;
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  547  	}
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  548  
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  549  	skb = lp->pending_tx_skb;
be83668a253149 drivers/net/smc91x.c               Nicolas Pitre    2005-06-19  550  	if (unlikely(!skb)) {
8ff499e43c5376 drivers/net/smc91x.c               Dongdong Deng    2009-08-23 @551  		smc_special_unlock(&lp->lock, flags);
be83668a253149 drivers/net/smc91x.c               Nicolas Pitre    2005-06-19  552  		return;
be83668a253149 drivers/net/smc91x.c               Nicolas Pitre    2005-06-19  553  	}
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  554  	lp->pending_tx_skb = NULL;
be83668a253149 drivers/net/smc91x.c               Nicolas Pitre    2005-06-19  555  
cfdfa86536d2fb drivers/net/smc91x.c               Magnus Damm      2008-02-22  556  	packet_no = SMC_GET_AR(lp);
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  557  	if (unlikely(packet_no & AR_FAILED)) {
6389aa458ed995 drivers/net/ethernet/smsc/smc91x.c Ben Boeckel      2013-11-01  558  		netdev_err(dev, "Memory allocation failed.\n");
09f75cd7bf1372 drivers/net/smc91x.c               Jeff Garzik      2007-10-03  559  		dev->stats.tx_errors++;
09f75cd7bf1372 drivers/net/smc91x.c               Jeff Garzik      2007-10-03  560  		dev->stats.tx_fifo_errors++;
8ff499e43c5376 drivers/net/smc91x.c               Dongdong Deng    2009-08-23  561  		smc_special_unlock(&lp->lock, flags);
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  562  		goto done;
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  563  	}
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  564  
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  565  	/* point to the beginning of the packet */
cfdfa86536d2fb drivers/net/smc91x.c               Magnus Damm      2008-02-22  566  	SMC_SET_PN(lp, packet_no);
cfdfa86536d2fb drivers/net/smc91x.c               Magnus Damm      2008-02-22  567  	SMC_SET_PTR(lp, PTR_AUTOINC);
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  568  
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  569  	buf = skb->data;
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  570  	len = skb->len;
6389aa458ed995 drivers/net/ethernet/smsc/smc91x.c Ben Boeckel      2013-11-01  571  	DBG(2, dev, "TX PNR 0x%x LENGTH 0x%04x (%d) BUF 0x%p\n",
6389aa458ed995 drivers/net/ethernet/smsc/smc91x.c Ben Boeckel      2013-11-01  572  	    packet_no, len, len, buf);
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  573  	PRINT_PKT(buf, len);
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  574  
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  575  	/*
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  576  	 * Send the packet length (+6 for status words, length, and ctl.
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  577  	 * The card will pad to 64 bytes with zeroes if packet is too small.
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  578  	 */
cfdfa86536d2fb drivers/net/smc91x.c               Magnus Damm      2008-02-22  579  	SMC_PUT_PKT_HDR(lp, 0, len + 6);
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  580  
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  581  	/* send the actual data */
cfdfa86536d2fb drivers/net/smc91x.c               Magnus Damm      2008-02-22  582  	SMC_PUSH_DATA(lp, buf, len & ~1);
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  583  
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  584  	/* Send final ctl word with the last byte if there is one */
d09d747ae4c25a drivers/net/ethernet/smsc/smc91x.c Robert Jarzmik   2016-10-17  585  	SMC_outw(lp, ((len & 1) ? (0x2000 | buf[len - 1]) : 0), ioaddr,
d09d747ae4c25a drivers/net/ethernet/smsc/smc91x.c Robert Jarzmik   2016-10-17  586  		 DATA_REG(lp));
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  587  
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  588  	/*
ea9375607f8b31 drivers/net/smc91x.c               Nicolas Pitre    2005-04-12  589  	 * If THROTTLE_TX_PKTS is set, we stop the queue here. This will
ea9375607f8b31 drivers/net/smc91x.c               Nicolas Pitre    2005-04-12  590  	 * have the effect of having at most one packet queued for TX
ea9375607f8b31 drivers/net/smc91x.c               Nicolas Pitre    2005-04-12  591  	 * in the chip's memory at all time.
ea9375607f8b31 drivers/net/smc91x.c               Nicolas Pitre    2005-04-12  592  	 *
ea9375607f8b31 drivers/net/smc91x.c               Nicolas Pitre    2005-04-12  593  	 * If THROTTLE_TX_PKTS is not set then the queue is stopped only
ea9375607f8b31 drivers/net/smc91x.c               Nicolas Pitre    2005-04-12  594  	 * when memory allocation (MC_ALLOC) does not succeed right away.
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  595  	 */
ea9375607f8b31 drivers/net/smc91x.c               Nicolas Pitre    2005-04-12  596  	if (THROTTLE_TX_PKTS)
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  597  		netif_stop_queue(dev);
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  598  
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  599  	/* queue the packet for TX */
cfdfa86536d2fb drivers/net/smc91x.c               Magnus Damm      2008-02-22  600  	SMC_SET_MMU_CMD(lp, MC_ENQUEUE);
8ff499e43c5376 drivers/net/smc91x.c               Dongdong Deng    2009-08-23  601  	smc_special_unlock(&lp->lock, flags);
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  602  
860e9538a9482b drivers/net/ethernet/smsc/smc91x.c Florian Westphal 2016-05-03  603  	netif_trans_update(dev);
09f75cd7bf1372 drivers/net/smc91x.c               Jeff Garzik      2007-10-03  604  	dev->stats.tx_packets++;
09f75cd7bf1372 drivers/net/smc91x.c               Jeff Garzik      2007-10-03  605  	dev->stats.tx_bytes += len;
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  606  
cfdfa86536d2fb drivers/net/smc91x.c               Magnus Damm      2008-02-22  607  	SMC_ENABLE_INT(lp, IM_TX_INT | IM_TX_EMPTY_INT);
^1da177e4c3f41 drivers/net/smc91x.c               Linus Torvalds   2005-04-16  608  

:::::: The code at line 551 was first introduced by commit
:::::: 8ff499e43c537648399fca8ba39d24c0768b3fab smc91x: let smc91x work well under netpoll

:::::: TO: Dongdong Deng <dongdong.deng@windriver.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
