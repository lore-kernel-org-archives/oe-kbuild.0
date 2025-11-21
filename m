Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216A429D29C
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 05:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763703560; cv=none; b=FPV+Zd7O3bGas2N1BosHar3AF5pKGEYq1ga71HxyqZ89XxzvnXM9O3eqAB7hRtQBEZbJOkqd4nFVTBJ2gIM9bSj22NsvtKdwEZBqfPUcZsU6jR31ZpzvSguWwoAOaZf03CAInwlTW9BvJAB/xe54b5qIU2vv7dDT1VdwhmmHsmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763703560; c=relaxed/simple;
	bh=hnx8jY9gV3c3HzUeKxxvHHsoRQE7Wh1dROfIY0Lj1PA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u3dmmCE6P1Xu5dVvqmVWrBrq71kDaitGqdpT/VFqjpKv4CASmnlXwBFF10PsQ9GZJCwarmJZ7CM1vjb6G+wqu4iq/d45gs3lPs8gWA7DSZidvV/TLerz0soQ6Qw3W/72i94eBbQHesJ48NYAHv2LyXnKqpOvGtpK0zFPMD9VWfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7Kcf+U9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7Kcf+U9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763703558; x=1795239558;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hnx8jY9gV3c3HzUeKxxvHHsoRQE7Wh1dROfIY0Lj1PA=;
  b=H7Kcf+U9t/Wsl14VFPTNnRmILsLtmbQneTK+vzQskchNqWVumdswRyH+
   PvReiP+bfNd1d7mBCC4RDQHsaOew23/QTJggfoPyBrXSxMyrNtfXvL4Iq
   pqlQy47WPcddu5vhR2qPITSSwiKE8eRs0WIx/1sFiaWblvc85M3bZ93S8
   OOGV24ojcvSlY3LM+Z7v28Ypk98cAY4oXEsWbJSrf1tevF3BVk6cMkZWi
   es8ewBv9Ymy0et8ggv7OHLkYlJdeq/tuZF8TK9eZrtm2+ZEKmcs97tRca
   z4Wr//LBGBqHFF2rMixYZD9WSVoa/5t0G8Jl00Q4vssU2mGWo/nG9DL+S
   Q==;
X-CSE-ConnectionGUID: qByF5LLsRISSzx0v2EAGVw==
X-CSE-MsgGUID: MgSHVUinRHeWT6Q53Qfmxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65821031"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65821031"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 21:39:16 -0800
X-CSE-ConnectionGUID: G+7SsMeVT8W9GnqvtWOk1w==
X-CSE-MsgGUID: R34EDe04Qt2iegyhwVuEQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191846157"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Nov 2025 21:39:14 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMJrU-00050V-25;
	Fri, 21 Nov 2025 05:39:12 +0000
Date: Fri, 21 Nov 2025 13:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:for-test 8/36] drivers/tty/serial/owl-uart.c:540
 owl_uart_port_write() error: uninitialized symbol 'flags'.
Message-ID: <202511211350.DUhO4SYn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git for-test
head:   10da1cb636df659be0b839e78c48037968cc5cc6
commit: 95dae231300ad907c90a55449c7f540180af1e86 [8/36] locking/rwlock, spinlock: Support Clang's context analysis
:::::: branch date: 8 hours ago
:::::: commit date: 18 hours ago
config: arm-randconfig-r072-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211350.DUhO4SYn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511211350.DUhO4SYn-lkp@intel.com/

smatch warnings:
drivers/tty/serial/owl-uart.c:540 owl_uart_port_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/owl-uart.c:719 owl_uart_probe() warn: 'owl_port->clk' from clk_prepare_enable() not released on lines: 719.

vim +/flags +540 drivers/tty/serial/owl-uart.c

e36361d70e9729 Andreas Färber            2017-06-19  507  
e36361d70e9729 Andreas Färber            2017-06-19  508  static void owl_uart_port_write(struct uart_port *port, const char *s,
e36361d70e9729 Andreas Färber            2017-06-19  509  				u_int count)
e36361d70e9729 Andreas Färber            2017-06-19  510  {
e36361d70e9729 Andreas Färber            2017-06-19  511  	u32 old_ctl, val;
e36361d70e9729 Andreas Färber            2017-06-19  512  	unsigned long flags;
2af521486761f6 Sebastian Andrzej Siewior 2024-03-01  513  	int locked = 1;
e36361d70e9729 Andreas Färber            2017-06-19  514  
2af521486761f6 Sebastian Andrzej Siewior 2024-03-01  515  	if (oops_in_progress)
2af521486761f6 Sebastian Andrzej Siewior 2024-03-01  516  		locked = uart_port_trylock_irqsave(port, &flags);
2af521486761f6 Sebastian Andrzej Siewior 2024-03-01  517  	else
2af521486761f6 Sebastian Andrzej Siewior 2024-03-01  518  		uart_port_lock_irqsave(port, &flags);
e36361d70e9729 Andreas Färber            2017-06-19  519  
e36361d70e9729 Andreas Färber            2017-06-19  520  	old_ctl = owl_uart_read(port, OWL_UART_CTL);
e36361d70e9729 Andreas Färber            2017-06-19  521  	val = old_ctl | OWL_UART_CTL_TRFS_TX;
e36361d70e9729 Andreas Färber            2017-06-19  522  	/* disable IRQ */
e36361d70e9729 Andreas Färber            2017-06-19  523  	val &= ~(OWL_UART_CTL_RXIE | OWL_UART_CTL_TXIE);
e36361d70e9729 Andreas Färber            2017-06-19  524  	owl_uart_write(port, val, OWL_UART_CTL);
e36361d70e9729 Andreas Färber            2017-06-19  525  
e36361d70e9729 Andreas Färber            2017-06-19  526  	uart_console_write(port, s, count, owl_console_putchar);
e36361d70e9729 Andreas Färber            2017-06-19  527  
e36361d70e9729 Andreas Färber            2017-06-19  528  	/* wait until all contents have been sent out */
e36361d70e9729 Andreas Färber            2017-06-19  529  	while (owl_uart_read(port, OWL_UART_STAT) & OWL_UART_STAT_TRFL_MASK)
e36361d70e9729 Andreas Färber            2017-06-19  530  		cpu_relax();
e36361d70e9729 Andreas Färber            2017-06-19  531  
e36361d70e9729 Andreas Färber            2017-06-19  532  	/* clear IRQ pending */
e36361d70e9729 Andreas Färber            2017-06-19  533  	val = owl_uart_read(port, OWL_UART_STAT);
e36361d70e9729 Andreas Färber            2017-06-19  534  	val |= OWL_UART_STAT_TIP | OWL_UART_STAT_RIP;
e36361d70e9729 Andreas Färber            2017-06-19  535  	owl_uart_write(port, val, OWL_UART_STAT);
e36361d70e9729 Andreas Färber            2017-06-19  536  
e36361d70e9729 Andreas Färber            2017-06-19  537  	owl_uart_write(port, old_ctl, OWL_UART_CTL);
e36361d70e9729 Andreas Färber            2017-06-19  538  
e36361d70e9729 Andreas Färber            2017-06-19  539  	if (locked)
2af521486761f6 Sebastian Andrzej Siewior 2024-03-01 @540  		uart_port_unlock_irqrestore(port, flags);
e36361d70e9729 Andreas Färber            2017-06-19  541  }
e36361d70e9729 Andreas Färber            2017-06-19  542  
fc60a8b675bd94 Andreas Färber            2017-07-09  543  static void owl_uart_console_write(struct console *co, const char *s,
fc60a8b675bd94 Andreas Färber            2017-07-09  544  				   u_int count)
fc60a8b675bd94 Andreas Färber            2017-07-09  545  {
fc60a8b675bd94 Andreas Färber            2017-07-09  546  	struct owl_uart_port *owl_port;
fc60a8b675bd94 Andreas Färber            2017-07-09  547  
fc60a8b675bd94 Andreas Färber            2017-07-09  548  	owl_port = owl_uart_ports[co->index];
fc60a8b675bd94 Andreas Färber            2017-07-09  549  	if (!owl_port)
fc60a8b675bd94 Andreas Färber            2017-07-09  550  		return;
fc60a8b675bd94 Andreas Färber            2017-07-09  551  
fc60a8b675bd94 Andreas Färber            2017-07-09  552  	owl_uart_port_write(&owl_port->port, s, count);
fc60a8b675bd94 Andreas Färber            2017-07-09  553  }
fc60a8b675bd94 Andreas Färber            2017-07-09  554  
fc60a8b675bd94 Andreas Färber            2017-07-09  555  static int owl_uart_console_setup(struct console *co, char *options)
fc60a8b675bd94 Andreas Färber            2017-07-09  556  {
fc60a8b675bd94 Andreas Färber            2017-07-09  557  	struct owl_uart_port *owl_port;
fc60a8b675bd94 Andreas Färber            2017-07-09  558  	int baud = 115200;
fc60a8b675bd94 Andreas Färber            2017-07-09  559  	int bits = 8;
fc60a8b675bd94 Andreas Färber            2017-07-09  560  	int parity = 'n';
fc60a8b675bd94 Andreas Färber            2017-07-09  561  	int flow = 'n';
fc60a8b675bd94 Andreas Färber            2017-07-09  562  
fc60a8b675bd94 Andreas Färber            2017-07-09  563  	if (co->index < 0 || co->index >= OWL_UART_PORT_NUM)
fc60a8b675bd94 Andreas Färber            2017-07-09  564  		return -EINVAL;
fc60a8b675bd94 Andreas Färber            2017-07-09  565  
fc60a8b675bd94 Andreas Färber            2017-07-09  566  	owl_port = owl_uart_ports[co->index];
fc60a8b675bd94 Andreas Färber            2017-07-09  567  	if (!owl_port || !owl_port->port.membase)
fc60a8b675bd94 Andreas Färber            2017-07-09  568  		return -ENODEV;
fc60a8b675bd94 Andreas Färber            2017-07-09  569  
fc60a8b675bd94 Andreas Färber            2017-07-09  570  	if (options)
fc60a8b675bd94 Andreas Färber            2017-07-09  571  		uart_parse_options(options, &baud, &parity, &bits, &flow);
fc60a8b675bd94 Andreas Färber            2017-07-09  572  
fc60a8b675bd94 Andreas Färber            2017-07-09  573  	return uart_set_options(&owl_port->port, co, baud, parity, bits, flow);
fc60a8b675bd94 Andreas Färber            2017-07-09  574  }
fc60a8b675bd94 Andreas Färber            2017-07-09  575  
fc60a8b675bd94 Andreas Färber            2017-07-09  576  static struct console owl_uart_console = {
fc60a8b675bd94 Andreas Färber            2017-07-09  577  	.name = OWL_UART_DEV_NAME,
fc60a8b675bd94 Andreas Färber            2017-07-09  578  	.write = owl_uart_console_write,
fc60a8b675bd94 Andreas Färber            2017-07-09  579  	.device = uart_console_device,
fc60a8b675bd94 Andreas Färber            2017-07-09  580  	.setup = owl_uart_console_setup,
fc60a8b675bd94 Andreas Färber            2017-07-09  581  	.flags = CON_PRINTBUFFER,
fc60a8b675bd94 Andreas Färber            2017-07-09  582  	.index = -1,
fc60a8b675bd94 Andreas Färber            2017-07-09  583  	.data = &owl_uart_driver,
fc60a8b675bd94 Andreas Färber            2017-07-09  584  };
fc60a8b675bd94 Andreas Färber            2017-07-09  585  
fc60a8b675bd94 Andreas Färber            2017-07-09  586  static int __init owl_uart_console_init(void)
fc60a8b675bd94 Andreas Färber            2017-07-09  587  {
fc60a8b675bd94 Andreas Färber            2017-07-09  588  	register_console(&owl_uart_console);
fc60a8b675bd94 Andreas Färber            2017-07-09  589  
fc60a8b675bd94 Andreas Färber            2017-07-09  590  	return 0;
fc60a8b675bd94 Andreas Färber            2017-07-09  591  }
fc60a8b675bd94 Andreas Färber            2017-07-09  592  console_initcall(owl_uart_console_init);
fc60a8b675bd94 Andreas Färber            2017-07-09  593  
e36361d70e9729 Andreas Färber            2017-06-19  594  static void owl_uart_early_console_write(struct console *co,
e36361d70e9729 Andreas Färber            2017-06-19  595  					 const char *s,
e36361d70e9729 Andreas Färber            2017-06-19  596  					 u_int count)
e36361d70e9729 Andreas Färber            2017-06-19  597  {
e36361d70e9729 Andreas Färber            2017-06-19  598  	struct earlycon_device *dev = co->data;
e36361d70e9729 Andreas Färber            2017-06-19  599  
e36361d70e9729 Andreas Färber            2017-06-19  600  	owl_uart_port_write(&dev->port, s, count);
e36361d70e9729 Andreas Färber            2017-06-19  601  }
e36361d70e9729 Andreas Färber            2017-06-19  602  
e36361d70e9729 Andreas Färber            2017-06-19  603  static int __init
e36361d70e9729 Andreas Färber            2017-06-19  604  owl_uart_early_console_setup(struct earlycon_device *device, const char *opt)
e36361d70e9729 Andreas Färber            2017-06-19  605  {
e36361d70e9729 Andreas Färber            2017-06-19  606  	if (!device->port.membase)
e36361d70e9729 Andreas Färber            2017-06-19  607  		return -ENODEV;
e36361d70e9729 Andreas Färber            2017-06-19  608  
e36361d70e9729 Andreas Färber            2017-06-19  609  	device->con->write = owl_uart_early_console_write;
e36361d70e9729 Andreas Färber            2017-06-19  610  
e36361d70e9729 Andreas Färber            2017-06-19  611  	return 0;
e36361d70e9729 Andreas Färber            2017-06-19  612  }
e36361d70e9729 Andreas Färber            2017-06-19  613  OF_EARLYCON_DECLARE(owl, "actions,owl-uart",
e36361d70e9729 Andreas Färber            2017-06-19  614  		    owl_uart_early_console_setup);
e36361d70e9729 Andreas Färber            2017-06-19  615  
fc60a8b675bd94 Andreas Färber            2017-07-09  616  #define OWL_UART_CONSOLE (&owl_uart_console)
fc60a8b675bd94 Andreas Färber            2017-07-09  617  #else
fc60a8b675bd94 Andreas Färber            2017-07-09  618  #define OWL_UART_CONSOLE NULL
fc60a8b675bd94 Andreas Färber            2017-07-09  619  #endif
fc60a8b675bd94 Andreas Färber            2017-07-09  620  
fc60a8b675bd94 Andreas Färber            2017-07-09  621  static struct uart_driver owl_uart_driver = {
fc60a8b675bd94 Andreas Färber            2017-07-09  622  	.owner = THIS_MODULE,
fc60a8b675bd94 Andreas Färber            2017-07-09  623  	.driver_name = "owl-uart",
fc60a8b675bd94 Andreas Färber            2017-07-09  624  	.dev_name = OWL_UART_DEV_NAME,
fc60a8b675bd94 Andreas Färber            2017-07-09  625  	.nr = OWL_UART_PORT_NUM,
fc60a8b675bd94 Andreas Färber            2017-07-09  626  	.cons = OWL_UART_CONSOLE,
fc60a8b675bd94 Andreas Färber            2017-07-09  627  };
fc60a8b675bd94 Andreas Färber            2017-07-09  628  
fc60a8b675bd94 Andreas Färber            2017-07-09  629  static const struct owl_uart_info owl_s500_info = {
fc60a8b675bd94 Andreas Färber            2017-07-09  630  	.tx_fifosize = 16,
fc60a8b675bd94 Andreas Färber            2017-07-09  631  };
fc60a8b675bd94 Andreas Färber            2017-07-09  632  
fc60a8b675bd94 Andreas Färber            2017-07-09  633  static const struct owl_uart_info owl_s900_info = {
fc60a8b675bd94 Andreas Färber            2017-07-09  634  	.tx_fifosize = 32,
fc60a8b675bd94 Andreas Färber            2017-07-09  635  };
fc60a8b675bd94 Andreas Färber            2017-07-09  636  
fc60a8b675bd94 Andreas Färber            2017-07-09  637  static const struct of_device_id owl_uart_dt_matches[] = {
fc60a8b675bd94 Andreas Färber            2017-07-09  638  	{ .compatible = "actions,s500-uart", .data = &owl_s500_info },
fc60a8b675bd94 Andreas Färber            2017-07-09  639  	{ .compatible = "actions,s900-uart", .data = &owl_s900_info },
fc60a8b675bd94 Andreas Färber            2017-07-09  640  	{ }
fc60a8b675bd94 Andreas Färber            2017-07-09  641  };
fc60a8b675bd94 Andreas Färber            2017-07-09  642  MODULE_DEVICE_TABLE(of, owl_uart_dt_matches);
fc60a8b675bd94 Andreas Färber            2017-07-09  643  
fc60a8b675bd94 Andreas Färber            2017-07-09  644  static int owl_uart_probe(struct platform_device *pdev)
fc60a8b675bd94 Andreas Färber            2017-07-09  645  {
fc60a8b675bd94 Andreas Färber            2017-07-09  646  	const struct of_device_id *match;
fc60a8b675bd94 Andreas Färber            2017-07-09  647  	const struct owl_uart_info *info = NULL;
fc60a8b675bd94 Andreas Färber            2017-07-09  648  	struct resource *res_mem;
fc60a8b675bd94 Andreas Färber            2017-07-09  649  	struct owl_uart_port *owl_port;
fc60a8b675bd94 Andreas Färber            2017-07-09  650  	int ret, irq;
fc60a8b675bd94 Andreas Färber            2017-07-09  651  
fc60a8b675bd94 Andreas Färber            2017-07-09  652  	if (pdev->dev.of_node) {
fc60a8b675bd94 Andreas Färber            2017-07-09  653  		pdev->id = of_alias_get_id(pdev->dev.of_node, "serial");
fc60a8b675bd94 Andreas Färber            2017-07-09  654  		match = of_match_node(owl_uart_dt_matches, pdev->dev.of_node);
fc60a8b675bd94 Andreas Färber            2017-07-09  655  		if (match)
fc60a8b675bd94 Andreas Färber            2017-07-09  656  			info = match->data;
fc60a8b675bd94 Andreas Färber            2017-07-09  657  	}
fc60a8b675bd94 Andreas Färber            2017-07-09  658  
fc60a8b675bd94 Andreas Färber            2017-07-09  659  	if (pdev->id < 0 || pdev->id >= OWL_UART_PORT_NUM) {
fc60a8b675bd94 Andreas Färber            2017-07-09  660  		dev_err(&pdev->dev, "id %d out of range\n", pdev->id);
fc60a8b675bd94 Andreas Färber            2017-07-09  661  		return -EINVAL;
fc60a8b675bd94 Andreas Färber            2017-07-09  662  	}
fc60a8b675bd94 Andreas Färber            2017-07-09  663  
fc60a8b675bd94 Andreas Färber            2017-07-09  664  	res_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
fc60a8b675bd94 Andreas Färber            2017-07-09  665  	if (!res_mem) {
fc60a8b675bd94 Andreas Färber            2017-07-09  666  		dev_err(&pdev->dev, "could not get mem\n");
fc60a8b675bd94 Andreas Färber            2017-07-09  667  		return -ENODEV;
fc60a8b675bd94 Andreas Färber            2017-07-09  668  	}
fc60a8b675bd94 Andreas Färber            2017-07-09  669  
fc60a8b675bd94 Andreas Färber            2017-07-09  670  	irq = platform_get_irq(pdev, 0);
1df217868178bd Stephen Boyd              2019-07-30  671  	if (irq < 0)
fc60a8b675bd94 Andreas Färber            2017-07-09  672  		return irq;
fc60a8b675bd94 Andreas Färber            2017-07-09  673  
fc60a8b675bd94 Andreas Färber            2017-07-09  674  	if (owl_uart_ports[pdev->id]) {
fc60a8b675bd94 Andreas Färber            2017-07-09  675  		dev_err(&pdev->dev, "port %d already allocated\n", pdev->id);
fc60a8b675bd94 Andreas Färber            2017-07-09  676  		return -EBUSY;
fc60a8b675bd94 Andreas Färber            2017-07-09  677  	}
fc60a8b675bd94 Andreas Färber            2017-07-09  678  
fc60a8b675bd94 Andreas Färber            2017-07-09  679  	owl_port = devm_kzalloc(&pdev->dev, sizeof(*owl_port), GFP_KERNEL);
fc60a8b675bd94 Andreas Färber            2017-07-09  680  	if (!owl_port)
fc60a8b675bd94 Andreas Färber            2017-07-09  681  		return -ENOMEM;
fc60a8b675bd94 Andreas Färber            2017-07-09  682  
fc60a8b675bd94 Andreas Färber            2017-07-09  683  	owl_port->clk = devm_clk_get(&pdev->dev, NULL);
fc60a8b675bd94 Andreas Färber            2017-07-09  684  	if (IS_ERR(owl_port->clk)) {
fc60a8b675bd94 Andreas Färber            2017-07-09  685  		dev_err(&pdev->dev, "could not get clk\n");
fc60a8b675bd94 Andreas Färber            2017-07-09  686  		return PTR_ERR(owl_port->clk);
fc60a8b675bd94 Andreas Färber            2017-07-09  687  	}
fc60a8b675bd94 Andreas Färber            2017-07-09  688  
abf42d2f333b21 Amit Singh Tomar          2020-04-17  689  	ret = clk_prepare_enable(owl_port->clk);
abf42d2f333b21 Amit Singh Tomar          2020-04-17  690  	if (ret) {
abf42d2f333b21 Amit Singh Tomar          2020-04-17  691  		dev_err(&pdev->dev, "could not enable clk\n");
abf42d2f333b21 Amit Singh Tomar          2020-04-17  692  		return ret;
abf42d2f333b21 Amit Singh Tomar          2020-04-17  693  	}
abf42d2f333b21 Amit Singh Tomar          2020-04-17  694  
fc60a8b675bd94 Andreas Färber            2017-07-09  695  	owl_port->port.dev = &pdev->dev;
fc60a8b675bd94 Andreas Färber            2017-07-09  696  	owl_port->port.line = pdev->id;
fc60a8b675bd94 Andreas Färber            2017-07-09  697  	owl_port->port.type = PORT_OWL;
fc60a8b675bd94 Andreas Färber            2017-07-09  698  	owl_port->port.iotype = UPIO_MEM;
fc60a8b675bd94 Andreas Färber            2017-07-09  699  	owl_port->port.mapbase = res_mem->start;
fc60a8b675bd94 Andreas Färber            2017-07-09  700  	owl_port->port.irq = irq;
fc60a8b675bd94 Andreas Färber            2017-07-09  701  	owl_port->port.uartclk = clk_get_rate(owl_port->clk);
fc60a8b675bd94 Andreas Färber            2017-07-09  702  	if (owl_port->port.uartclk == 0) {
fc60a8b675bd94 Andreas Färber            2017-07-09  703  		dev_err(&pdev->dev, "clock rate is zero\n");
bcea0f547ec1a2 Miaoqian Lin              2022-03-07  704  		clk_disable_unprepare(owl_port->clk);
fc60a8b675bd94 Andreas Färber            2017-07-09  705  		return -EINVAL;
fc60a8b675bd94 Andreas Färber            2017-07-09  706  	}
fc60a8b675bd94 Andreas Färber            2017-07-09  707  	owl_port->port.flags = UPF_BOOT_AUTOCONF | UPF_IOREMAP | UPF_LOW_LATENCY;
fc60a8b675bd94 Andreas Färber            2017-07-09  708  	owl_port->port.x_char = 0;
fc60a8b675bd94 Andreas Färber            2017-07-09  709  	owl_port->port.fifosize = (info) ? info->tx_fifosize : 16;
fc60a8b675bd94 Andreas Färber            2017-07-09  710  	owl_port->port.ops = &owl_uart_ops;
fc60a8b675bd94 Andreas Färber            2017-07-09  711  
fc60a8b675bd94 Andreas Färber            2017-07-09  712  	owl_uart_ports[pdev->id] = owl_port;
fc60a8b675bd94 Andreas Färber            2017-07-09  713  	platform_set_drvdata(pdev, owl_port);
fc60a8b675bd94 Andreas Färber            2017-07-09  714  
fc60a8b675bd94 Andreas Färber            2017-07-09  715  	ret = uart_add_one_port(&owl_uart_driver, &owl_port->port);
fc60a8b675bd94 Andreas Färber            2017-07-09  716  	if (ret)
fc60a8b675bd94 Andreas Färber            2017-07-09  717  		owl_uart_ports[pdev->id] = NULL;
fc60a8b675bd94 Andreas Färber            2017-07-09  718  
fc60a8b675bd94 Andreas Färber            2017-07-09 @719  	return ret;
fc60a8b675bd94 Andreas Färber            2017-07-09  720  }
fc60a8b675bd94 Andreas Färber            2017-07-09  721  

:::::: The code at line 540 was first introduced by commit
:::::: 2af521486761f6f40ff00faa0cd3d52465dfd461 serial: owl: Use uart_prepare_sysrq_char() to handle sysrq.

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
