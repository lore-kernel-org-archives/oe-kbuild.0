Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7088818BC3D
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765630907; cv=none; b=L577no9ZJvrNF4FxsY/uotpAkY+NUjvrvBY0tErkWv5NU1mCo2WN2S6PU/sxLSgWN+JzQKFe8/SxCX/H6QiAzz/mbOYmyqO4+ZzH6okSGkvCR43T/6tkCowry0MaWMGrxIfuQ0tdFRPimG2eqBJcEy6wGvqh5GSBf1Gw0Syt67g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765630907; c=relaxed/simple;
	bh=cFDaKoTsU1MPT40FXsy8/kJdl7tVfWiOP5Gmp66nfAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m6CjK+jQt31yK8KvrWUJsNZNJ+aIAStgZl7/TMyGRcCfYY3b8mUEU5trtmR9C9FwdeM1bpqgy2bTBdAZyYiF9PPw4gEqGZ9JvLvYwifS+XoFNpsaX9FLr/sOW2NqqdCsiiPIQ2eMzPtKwWIHpjAAiDimK2ak0GA8mdHt8zjGihs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ab2j/dHI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ab2j/dHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765630905; x=1797166905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cFDaKoTsU1MPT40FXsy8/kJdl7tVfWiOP5Gmp66nfAk=;
  b=ab2j/dHIrWxrRrOSgc9mAqMaOW5bHuUy56aoWcueNw2Xzw4obGppCxOn
   vf1x/OPHTh1DTjjdbvHAHQGxLSvRzb67+ZUJg4Q3m2WILCzKYuwlBAa6m
   59Y86+HxXMlodENY28c8ZW+KKEYwMGB2xX5DpVIMHZf7pvap13mi97PFO
   NqEo6/ffSvyQLRj99RO4e0R8VgMMA90pubmLLNRAGhQVtrPO3QnkHg5B4
   VsTiTaXiBhKwiWidMEMYHH7WgsKj3kZoHCdC/0tWDa2IHwasp/V3/ynJ6
   CCGBQsojpqNSVNEQh4Z2gfxuCPMthF4N4J7qShHRDZmFusPp/5TRMZ+wy
   w==;
X-CSE-ConnectionGUID: HwfZZs5nRJaDAi+wAeG9yg==
X-CSE-MsgGUID: zgZtscWgQiON/pU+02APNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="85018461"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="85018461"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 05:01:43 -0800
X-CSE-ConnectionGUID: znrX2rXZQWmL5FJ2ELk3sA==
X-CSE-MsgGUID: G9Nd5boTSs2l5qtrXS1NRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196593807"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 05:01:42 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUPFj-000000007ek-3SWG;
	Sat, 13 Dec 2025 13:01:39 +0000
Date: Sat, 13 Dec 2025 21:01:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/i3c/master/svc-i3c-master.c:566 svc_i3c_master_ibi_isr()
 error: we previously assumed 'dev' could be null (see line 541)
Message-ID: <202512132153.wkAQAXzD-lkp@intel.com>
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
TO: Stanley Chu <yschu@nuvoton.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 8d29fa6d921ca4f9f63f73598833e53ece1d3b4e i3c: master: svc: Receive IBI requests in interrupt context
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: m68k-randconfig-r073-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132153.wkAQAXzD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512132153.wkAQAXzD-lkp@intel.com/

New smatch warnings:
drivers/i3c/master/svc-i3c-master.c:566 svc_i3c_master_ibi_isr() error: we previously assumed 'dev' could be null (see line 541)

Old smatch warnings:
drivers/i3c/master/svc-i3c-master.c:566 svc_i3c_master_ibi_isr() error: uninitialized symbol 'dev'.
drivers/i3c/master/svc-i3c-master.c:1476 svc_i3c_master_start_xfer_locked() error: uninitialized symbol 'ret'.

vim +/dev +566 drivers/i3c/master/svc-i3c-master.c

e22405a812a11e5 Frank Li          2024-10-02  487  
8d29fa6d921ca4f Stanley Chu       2025-04-15  488  static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
dd3c52846d5954a Miquel Raynal     2021-01-21  489  {
dd3c52846d5954a Miquel Raynal     2021-01-21  490  	struct svc_i3c_i2c_dev_data *data;
dd3c52846d5954a Miquel Raynal     2021-01-21  491  	unsigned int ibitype, ibiaddr;
dd3c52846d5954a Miquel Raynal     2021-01-21  492  	struct i3c_dev_desc *dev;
dd3c52846d5954a Miquel Raynal     2021-01-21  493  	u32 status, val;
dd3c52846d5954a Miquel Raynal     2021-01-21  494  	int ret;
dd3c52846d5954a Miquel Raynal     2021-01-21  495  
f36f6624cbacb31 Frank Li          2024-10-02  496  	/*
f36f6624cbacb31 Frank Li          2024-10-02  497  	 * According to I3C spec ver 1.1, 09-Jun-2021, section 5.1.2.5:
f36f6624cbacb31 Frank Li          2024-10-02  498  	 *
f36f6624cbacb31 Frank Li          2024-10-02  499  	 * The I3C Controller shall hold SCL low while the Bus is in ACK/NACK Phase of I3C/I2C
f36f6624cbacb31 Frank Li          2024-10-02  500  	 * transfer. But maximum stall time is 100us. The IRQs have to be disabled to prevent
f36f6624cbacb31 Frank Li          2024-10-02  501  	 * schedule during the whole I3C transaction, otherwise, the I3C bus timeout may happen if
f36f6624cbacb31 Frank Li          2024-10-02  502  	 * any irq or schedule happen during transaction.
f36f6624cbacb31 Frank Li          2024-10-02  503  	 */
8d29fa6d921ca4f Stanley Chu       2025-04-15  504  	guard(spinlock)(&master->xferqueue.lock);
f36f6624cbacb31 Frank Li          2024-10-02  505  
38baed9b8600008 Frank Li          2024-05-06  506  	/*
38baed9b8600008 Frank Li          2024-05-06  507  	 * IBIWON may be set before SVC_I3C_MCTRL_REQUEST_AUTO_IBI, causing
38baed9b8600008 Frank Li          2024-05-06  508  	 * readl_relaxed_poll_timeout() to return immediately. Consequently,
38baed9b8600008 Frank Li          2024-05-06  509  	 * ibitype will be 0 since it was last updated only after the 8th SCL
38baed9b8600008 Frank Li          2024-05-06  510  	 * cycle, leading to missed client IBI handlers.
38baed9b8600008 Frank Li          2024-05-06  511  	 *
38baed9b8600008 Frank Li          2024-05-06  512  	 * A typical scenario is when IBIWON occurs and bus arbitration is lost
38baed9b8600008 Frank Li          2024-05-06  513  	 * at svc_i3c_master_priv_xfers().
38baed9b8600008 Frank Li          2024-05-06  514  	 *
38baed9b8600008 Frank Li          2024-05-06  515  	 * Clear SVC_I3C_MINT_IBIWON before sending SVC_I3C_MCTRL_REQUEST_AUTO_IBI.
38baed9b8600008 Frank Li          2024-05-06  516  	 */
38baed9b8600008 Frank Li          2024-05-06  517  	writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
38baed9b8600008 Frank Li          2024-05-06  518  
dd3c52846d5954a Miquel Raynal     2021-01-21  519  	/* Acknowledge the incoming interrupt with the AUTOIBI mechanism */
dd3c52846d5954a Miquel Raynal     2021-01-21  520  	writel(SVC_I3C_MCTRL_REQUEST_AUTO_IBI |
dd3c52846d5954a Miquel Raynal     2021-01-21  521  	       SVC_I3C_MCTRL_IBIRESP_AUTO,
dd3c52846d5954a Miquel Raynal     2021-01-21  522  	       master->regs + SVC_I3C_MCTRL);
dd3c52846d5954a Miquel Raynal     2021-01-21  523  
dd3c52846d5954a Miquel Raynal     2021-01-21  524  	/* Wait for IBIWON, should take approximately 100us */
f36f6624cbacb31 Frank Li          2024-10-02  525  	ret = readl_relaxed_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS, val,
f36f6624cbacb31 Frank Li          2024-10-02  526  					 SVC_I3C_MSTATUS_IBIWON(val), 0, 100);
dd3c52846d5954a Miquel Raynal     2021-01-21  527  	if (ret) {
dd3c52846d5954a Miquel Raynal     2021-01-21  528  		dev_err(master->dev, "Timeout when polling for IBIWON\n");
dfd7cd6aafdb1f5 Frank Li          2023-10-23  529  		svc_i3c_master_emit_stop(master);
8d29fa6d921ca4f Stanley Chu       2025-04-15  530  		return;
dd3c52846d5954a Miquel Raynal     2021-01-21  531  	}
dd3c52846d5954a Miquel Raynal     2021-01-21  532  
dd3c52846d5954a Miquel Raynal     2021-01-21  533  	status = readl(master->regs + SVC_I3C_MSTATUS);
dd3c52846d5954a Miquel Raynal     2021-01-21  534  	ibitype = SVC_I3C_MSTATUS_IBITYPE(status);
dd3c52846d5954a Miquel Raynal     2021-01-21  535  	ibiaddr = SVC_I3C_MSTATUS_IBIADDR(status);
dd3c52846d5954a Miquel Raynal     2021-01-21  536  
dd3c52846d5954a Miquel Raynal     2021-01-21  537  	/* Handle the critical responses to IBI's */
dd3c52846d5954a Miquel Raynal     2021-01-21  538  	switch (ibitype) {
dd3c52846d5954a Miquel Raynal     2021-01-21  539  	case SVC_I3C_MSTATUS_IBITYPE_IBI:
dd3c52846d5954a Miquel Raynal     2021-01-21  540  		dev = svc_i3c_master_dev_from_addr(master, ibiaddr);
05b26c31a4859af Frank Li          2023-12-01 @541  		if (!dev || !is_events_enabled(master, SVC_I3C_EVENT_IBI))
dd3c52846d5954a Miquel Raynal     2021-01-21  542  			svc_i3c_master_nack_ibi(master);
dd3c52846d5954a Miquel Raynal     2021-01-21  543  		else
dd3c52846d5954a Miquel Raynal     2021-01-21  544  			svc_i3c_master_handle_ibi(master, dev);
dd3c52846d5954a Miquel Raynal     2021-01-21  545  		break;
dd3c52846d5954a Miquel Raynal     2021-01-21  546  	case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
05b26c31a4859af Frank Li          2023-12-01  547  		if (is_events_enabled(master, SVC_I3C_EVENT_HOTJOIN))
dd3c52846d5954a Miquel Raynal     2021-01-21  548  			svc_i3c_master_ack_ibi(master, false);
05b26c31a4859af Frank Li          2023-12-01  549  		else
05b26c31a4859af Frank Li          2023-12-01  550  			svc_i3c_master_nack_ibi(master);
dd3c52846d5954a Miquel Raynal     2021-01-21  551  		break;
dd3c52846d5954a Miquel Raynal     2021-01-21  552  	case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
dd3c52846d5954a Miquel Raynal     2021-01-21  553  		svc_i3c_master_nack_ibi(master);
dd3c52846d5954a Miquel Raynal     2021-01-21  554  		break;
dd3c52846d5954a Miquel Raynal     2021-01-21  555  	default:
dd3c52846d5954a Miquel Raynal     2021-01-21  556  		break;
dd3c52846d5954a Miquel Raynal     2021-01-21  557  	}
dd3c52846d5954a Miquel Raynal     2021-01-21  558  
dd3c52846d5954a Miquel Raynal     2021-01-21  559  	/*
dd3c52846d5954a Miquel Raynal     2021-01-21  560  	 * If an error happened, we probably got interrupted and the exchange
dd3c52846d5954a Miquel Raynal     2021-01-21  561  	 * timedout. In this case we just drop everything, emit a stop and wait
dd3c52846d5954a Miquel Raynal     2021-01-21  562  	 * for the slave to interrupt again.
dd3c52846d5954a Miquel Raynal     2021-01-21  563  	 */
dd3c52846d5954a Miquel Raynal     2021-01-21  564  	if (svc_i3c_master_error(master)) {
dd3c52846d5954a Miquel Raynal     2021-01-21  565  		if (master->ibi.tbq_slot) {
dd3c52846d5954a Miquel Raynal     2021-01-21 @566  			data = i3c_dev_get_master_data(dev);
dd3c52846d5954a Miquel Raynal     2021-01-21  567  			i3c_generic_ibi_recycle_slot(data->ibi_pool,
dd3c52846d5954a Miquel Raynal     2021-01-21  568  						     master->ibi.tbq_slot);
dd3c52846d5954a Miquel Raynal     2021-01-21  569  			master->ibi.tbq_slot = NULL;
dd3c52846d5954a Miquel Raynal     2021-01-21  570  		}
dd3c52846d5954a Miquel Raynal     2021-01-21  571  
dd3c52846d5954a Miquel Raynal     2021-01-21  572  		svc_i3c_master_emit_stop(master);
dd3c52846d5954a Miquel Raynal     2021-01-21  573  
8d29fa6d921ca4f Stanley Chu       2025-04-15  574  		return;
dd3c52846d5954a Miquel Raynal     2021-01-21  575  	}
dd3c52846d5954a Miquel Raynal     2021-01-21  576  
dd3c52846d5954a Miquel Raynal     2021-01-21  577  	/* Handle the non critical tasks */
dd3c52846d5954a Miquel Raynal     2021-01-21  578  	switch (ibitype) {
dd3c52846d5954a Miquel Raynal     2021-01-21  579  	case SVC_I3C_MSTATUS_IBITYPE_IBI:
dd3c52846d5954a Miquel Raynal     2021-01-21  580  		if (dev) {
dd3c52846d5954a Miquel Raynal     2021-01-21  581  			i3c_master_queue_ibi(dev, master->ibi.tbq_slot);
dd3c52846d5954a Miquel Raynal     2021-01-21  582  			master->ibi.tbq_slot = NULL;
dd3c52846d5954a Miquel Raynal     2021-01-21  583  		}
dd3c52846d5954a Miquel Raynal     2021-01-21  584  		svc_i3c_master_emit_stop(master);
dd3c52846d5954a Miquel Raynal     2021-01-21  585  		break;
dd3c52846d5954a Miquel Raynal     2021-01-21  586  	case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
05b26c31a4859af Frank Li          2023-12-01  587  		svc_i3c_master_emit_stop(master);
05b26c31a4859af Frank Li          2023-12-01  588  		if (is_events_enabled(master, SVC_I3C_EVENT_HOTJOIN))
dd3c52846d5954a Miquel Raynal     2021-01-21  589  			queue_work(master->base.wq, &master->hj_work);
dd3c52846d5954a Miquel Raynal     2021-01-21  590  		break;
dd3c52846d5954a Miquel Raynal     2021-01-21  591  	case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
0430bf9bc1ac068 Stanley Chu       2025-03-18  592  		svc_i3c_master_emit_stop(master);
e8d2d287e26d9bd Nathan Chancellor 2025-03-19  593  		break;
dd3c52846d5954a Miquel Raynal     2021-01-21  594  	default:
dd3c52846d5954a Miquel Raynal     2021-01-21  595  		break;
dd3c52846d5954a Miquel Raynal     2021-01-21  596  	}
dd3c52846d5954a Miquel Raynal     2021-01-21  597  }
dd3c52846d5954a Miquel Raynal     2021-01-21  598  

:::::: The code at line 566 was first introduced by commit
:::::: dd3c52846d5954acd43f0e771689302f27dadc28 i3c: master: svc: Add Silvaco I3C master driver

:::::: TO: Miquel Raynal <miquel.raynal@bootlin.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
