Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37991A83F2
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 23:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739574450; cv=none; b=j1gPeittkVQ143IkdfA1L3bMprbBKZL94JyAxcr6hWCp3rkdqh6/MHtTS57+54uvVExCfDYY3Bc91EsGfE1QVC/4HKKlm7XxgR5gqFOwY7D4V6c5SllYEJMkYnX3zpr/ZuoIq69q3tsLONWu/rOyKFSqSYx6hGv4ruFMXdtn+5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739574450; c=relaxed/simple;
	bh=VMSQe1TuTdLvHZUMNAGZgZ6gs4jIYdWmCfbhF2eH5Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gl0ih2vTHuTTaR37Vh39JF0cPstEd/d548rcB2TClQ6gucRKVzTBsyNw7XvHo9rEfpjPfEBmnDS9u+XzJPLagEcNppsc5H3KsYr9H2sqidGyKFIIp5RYSxjge3gFppXWfrRvTpJetwGitG8/yV9Rb+eFPALKXcQTQvMeN0c52xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APuCN9Bl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APuCN9Bl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739574448; x=1771110448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VMSQe1TuTdLvHZUMNAGZgZ6gs4jIYdWmCfbhF2eH5Ys=;
  b=APuCN9BlDANYlerRRZysdQC6xLgXtpT7qrrTCYCddbUJw2QWq2ZG7yxD
   E6xCvqLeEVLSYZSmiAmodwcwjYv2GG9ftvztFiLIR3gYjf1Z74bp28919
   zPJnV32gfeZrQI5MFttSoRb+Hom2UKAWoc7rfdASn/NcCUqDqg5F/7D2/
   OffHAE6sjVvhWdyujp2b0lafuJK9tbAjzJN/qLvuhpTLUjZcvS9BzW47u
   TFWvCZxcCY1hdY08l1LfrAsq6YLif3hxtlYKQR9wjudRMzC/PDFJyUsIe
   JrzGqxJKaGEwbAhT5QspicvCT9b+Qqx8H7jwHD+cnM3V6OBMG7fqCZ9g9
   A==;
X-CSE-ConnectionGUID: mfTI0G7yROa4sKm2ffaujw==
X-CSE-MsgGUID: bgovgL9cTGanvpeSuo34+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50982870"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="50982870"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 15:07:28 -0800
X-CSE-ConnectionGUID: X4mvv71DTjmmHg9+cWULCw==
X-CSE-MsgGUID: QnqgPAtIRxmw4HHVADuU2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="113776305"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Feb 2025 15:07:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj4mK-001AGd-31;
	Fri, 14 Feb 2025 23:07:24 +0000
Date: Sat, 15 Feb 2025 07:06:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 26/26]
 drivers/tty/serial/xilinx_uartps.c:1409 cdns_uart_console_write() error:
 uninitialized symbol 'flags'.
Message-ID: <202502150724.g0DxkwJl-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   9c8d14ce8aff2d38bf494f5d5436a302e3236842
commit: 9c8d14ce8aff2d38bf494f5d5436a302e3236842 [26/26] compiler-capability-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-r071-20250215 (https://download.01.org/0day-ci/archive/20250215/202502150724.g0DxkwJl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502150724.g0DxkwJl-lkp@intel.com/

smatch warnings:
drivers/tty/serial/xilinx_uartps.c:1409 cdns_uart_console_write() error: uninitialized symbol 'flags'.

vim +/flags +1409 drivers/tty/serial/xilinx_uartps.c

0413fe045dda45 Michal Simek       2018-04-23  1368  
61ec9016988f5c John Linn          2011-04-30  1369  /**
d9bb3fb1268520 Soren Brinkmann    2014-04-04  1370   * cdns_uart_console_write - perform write operation
489810a1a6efa0 Michal Simek       2014-04-04  1371   * @co: Console handle
61ec9016988f5c John Linn          2011-04-30  1372   * @s: Pointer to character array
61ec9016988f5c John Linn          2011-04-30  1373   * @count: No of characters
489810a1a6efa0 Michal Simek       2014-04-04  1374   */
d9bb3fb1268520 Soren Brinkmann    2014-04-04  1375  static void cdns_uart_console_write(struct console *co, const char *s,
61ec9016988f5c John Linn          2011-04-30  1376  				unsigned int count)
61ec9016988f5c John Linn          2011-04-30  1377  {
0413fe045dda45 Michal Simek       2018-04-23  1378  	struct uart_port *port = console_port;
18ee37e1382a7c Johan Hovold       2021-05-19  1379  	unsigned long flags;
d3755f5e6cd222 Lars-Peter Clausen 2013-10-17  1380  	unsigned int imr, ctrl;
61ec9016988f5c John Linn          2011-04-30  1381  	int locked = 1;
61ec9016988f5c John Linn          2011-04-30  1382  
b06f3889945002 Sean Anderson      2025-01-10  1383  	if (oops_in_progress)
c980248179d655 Thomas Gleixner    2023-09-14  1384  		locked = uart_port_trylock_irqsave(port, &flags);
61ec9016988f5c John Linn          2011-04-30  1385  	else
c980248179d655 Thomas Gleixner    2023-09-14  1386  		uart_port_lock_irqsave(port, &flags);
61ec9016988f5c John Linn          2011-04-30  1387  
61ec9016988f5c John Linn          2011-04-30  1388  	/* save and disable interrupt */
a8df6a51600a93 Soren Brinkmann    2016-01-11  1389  	imr = readl(port->membase + CDNS_UART_IMR);
a8df6a51600a93 Soren Brinkmann    2016-01-11  1390  	writel(imr, port->membase + CDNS_UART_IDR);
61ec9016988f5c John Linn          2011-04-30  1391  
d3755f5e6cd222 Lars-Peter Clausen 2013-10-17  1392  	/*
d3755f5e6cd222 Lars-Peter Clausen 2013-10-17  1393  	 * Make sure that the tx part is enabled. Set the TX enable bit and
d3755f5e6cd222 Lars-Peter Clausen 2013-10-17  1394  	 * clear the TX disable bit to enable the transmitter.
d3755f5e6cd222 Lars-Peter Clausen 2013-10-17  1395  	 */
a8df6a51600a93 Soren Brinkmann    2016-01-11  1396  	ctrl = readl(port->membase + CDNS_UART_CR);
e3538c37ee3832 Soren Brinkmann    2015-12-26  1397  	ctrl &= ~CDNS_UART_CR_TX_DIS;
e3538c37ee3832 Soren Brinkmann    2015-12-26  1398  	ctrl |= CDNS_UART_CR_TX_EN;
a8df6a51600a93 Soren Brinkmann    2016-01-11  1399  	writel(ctrl, port->membase + CDNS_UART_CR);
d3755f5e6cd222 Lars-Peter Clausen 2013-10-17  1400  
d9bb3fb1268520 Soren Brinkmann    2014-04-04  1401  	uart_console_write(port, s, count, cdns_uart_console_putchar);
a8e7346b7c0a3b Raviteja Narayanam 2020-04-09  1402  	while (cdns_uart_tx_empty(port) != TIOCSER_TEMT)
de4ed391ae98fa Helmut Grohne      2018-06-04  1403  		cpu_relax();
61ec9016988f5c John Linn          2011-04-30  1404  
b494a5fae452fc Soren Brinkmann    2014-04-04  1405  	/* restore interrupt state */
a8df6a51600a93 Soren Brinkmann    2016-01-11  1406  	writel(imr, port->membase + CDNS_UART_IER);
61ec9016988f5c John Linn          2011-04-30  1407  
61ec9016988f5c John Linn          2011-04-30  1408  	if (locked)
c980248179d655 Thomas Gleixner    2023-09-14 @1409  		uart_port_unlock_irqrestore(port, flags);
61ec9016988f5c John Linn          2011-04-30  1410  }
61ec9016988f5c John Linn          2011-04-30  1411  

:::::: The code at line 1409 was first introduced by commit
:::::: c980248179d655d33af47f0b0bec1ce8660994c6 serial: xilinx_uartps: Use port lock wrappers

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
