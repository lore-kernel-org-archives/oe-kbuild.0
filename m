Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453E94CB5B
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 01:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766365773; cv=none; b=NHuIs5SpxzPlDKaOteFjaUXjIMhHF2hlXd7l/dp8dwzXgZ31vvL9tLUTA29j+FtrB/GiQl0/aAhBnD3k6jaTDbiHfFlfPeVfROS6xHDi7vsPCVD6tQzLv4oDVLc70Z6paeZOBLfl8MzMEuex1a57Yc28aJgvWfkGSJCWPN2dV4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766365773; c=relaxed/simple;
	bh=BOeaOdktqtIG3TGvQsTO56JHuPZeeB7/YTQ1yRQ3xY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BsrMzx9+O/yTRiURcbeM41RbyfVCrlUvd1PDhqwhO2du8bhB/3swrWp7i9uISziFbF9mIYwcQPLC7VWHiMBIsdSwxMrTWRnHIuQocnHzYalUS2BWG6VGDug2Uv/lDhQglVq4G+XNk2alHGbI45nx+S+wFbQeCgyUTibqYKODZTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9yfCSEU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9yfCSEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766365770; x=1797901770;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BOeaOdktqtIG3TGvQsTO56JHuPZeeB7/YTQ1yRQ3xY8=;
  b=W9yfCSEUd1htoutQD4RE3AWmmnluA3HJV1Yc2mfdSPvUfjnpSIBHSV9j
   XvBU3PjURwgm26AtzaHuypGDdExDS7ub3cp3DRqYF8g2aZYolCwRFmVes
   CtY6bopVcDXj5/80s4slpUeoqyiRBwK8+KN+et6ipewU8EuHCDJv4TAOu
   ifeDAypITqrNqKZwE+CYcEJIKdIBUI44ELJe1BQsmtWEPB/UitSxEXWm3
   jnn6oZuoZ1u05hLxXXt9mp1rq9bkGlmjEORGfqMoKF2PoviXJsylA6WVe
   dQNrq5Jke7dXw+4TvNaEeknUow7dPDcfTg4O/Wuu0E22Lqfl662BnvnV8
   A==;
X-CSE-ConnectionGUID: DzNXVoLKRcOcckOM3CjuCg==
X-CSE-MsgGUID: 7oDpDufBSGC8n9PJM2xOqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68205311"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68205311"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 17:09:29 -0800
X-CSE-ConnectionGUID: 1Cs72WY4Tk2DYFiD4/qu2g==
X-CSE-MsgGUID: iZLD6u5UTqiFVOGDShv4jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="230420428"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Dec 2025 17:09:28 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXUQQ-000000000MT-1ugF;
	Mon, 22 Dec 2025 01:09:26 +0000
Date: Mon, 22 Dec 2025 09:09:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:ctx-analysis/dev 24/36] drivers/tty/serial/pch_uart.c:1580
 pch_console_write() error: uninitialized symbol 'flags'.
Message-ID: <202512220939.O8nwSkDv-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   716611610a85ff05508277ffc92888daae793783
commit: 0dc9f525e4453407edb250e4be6cab8a0422bcb2 [24/36] compiler-context-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251222 (https://download.01.org/0day-ci/archive/20251222/202512220939.O8nwSkDv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512220939.O8nwSkDv-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/pch_uart.c:1580 pch_console_write() error: uninitialized symbol 'flags'.
drivers/scsi/aacraid/commsup.c:1631 aac_reset_adapter() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/scsi/aacraid/commsup.c:1524 _aac_reset_adapter() warn: mixing irq and irqsave
drivers/scsi/aacraid/commsup.c:1635 aac_reset_adapter() error: calling 'spin_unlock_irqrestore()' with bogus flags

vim +/flags +1580 drivers/tty/serial/pch_uart.c

e30f867d402d6d Alexander Stein           2011-11-15  1539  
e30f867d402d6d Alexander Stein           2011-11-15  1540  /*
e30f867d402d6d Alexander Stein           2011-11-15  1541   *	Print a string to the serial port trying not to disturb
e30f867d402d6d Alexander Stein           2011-11-15  1542   *	any possible real use of the port...
e30f867d402d6d Alexander Stein           2011-11-15  1543   *
e30f867d402d6d Alexander Stein           2011-11-15  1544   *	The console_lock must be held when we get here.
e30f867d402d6d Alexander Stein           2011-11-15  1545   */
e30f867d402d6d Alexander Stein           2011-11-15  1546  static void
e30f867d402d6d Alexander Stein           2011-11-15  1547  pch_console_write(struct console *co, const char *s, unsigned int count)
e30f867d402d6d Alexander Stein           2011-11-15  1548  {
e30f867d402d6d Alexander Stein           2011-11-15  1549  	struct eg20t_port *priv;
e30f867d402d6d Alexander Stein           2011-11-15  1550  	unsigned long flags;
d47dd323bf959d Sebastian Andrzej Siewior 2024-03-01  1551  	int locked = 1;
e30f867d402d6d Alexander Stein           2011-11-15  1552  	u8 ier;
e30f867d402d6d Alexander Stein           2011-11-15  1553  
e30f867d402d6d Alexander Stein           2011-11-15  1554  	priv = pch_uart_ports[co->index];
e30f867d402d6d Alexander Stein           2011-11-15  1555  
e30f867d402d6d Alexander Stein           2011-11-15  1556  	touch_nmi_watchdog();
e30f867d402d6d Alexander Stein           2011-11-15  1557  
d47dd323bf959d Sebastian Andrzej Siewior 2024-03-01  1558  	if (oops_in_progress)
d47dd323bf959d Sebastian Andrzej Siewior 2024-03-01  1559  		locked = uart_port_trylock_irqsave(&priv->port, &flags);
d47dd323bf959d Sebastian Andrzej Siewior 2024-03-01  1560  	else
d47dd323bf959d Sebastian Andrzej Siewior 2024-03-01  1561  		uart_port_lock_irqsave(&priv->port, &flags);
e30f867d402d6d Alexander Stein           2011-11-15  1562  
e30f867d402d6d Alexander Stein           2011-11-15  1563  	/*
e30f867d402d6d Alexander Stein           2011-11-15  1564  	 *	First save the IER then disable the interrupts
e30f867d402d6d Alexander Stein           2011-11-15  1565  	 */
e30f867d402d6d Alexander Stein           2011-11-15  1566  	ier = ioread8(priv->membase + UART_IER);
e30f867d402d6d Alexander Stein           2011-11-15  1567  
e30f867d402d6d Alexander Stein           2011-11-15  1568  	pch_uart_hal_disable_interrupt(priv, PCH_UART_HAL_ALL_INT);
e30f867d402d6d Alexander Stein           2011-11-15  1569  
e30f867d402d6d Alexander Stein           2011-11-15  1570  	uart_console_write(&priv->port, s, count, pch_console_putchar);
e30f867d402d6d Alexander Stein           2011-11-15  1571  
e30f867d402d6d Alexander Stein           2011-11-15  1572  	/*
e30f867d402d6d Alexander Stein           2011-11-15  1573  	 *	Finally, wait for transmitter to become empty
e30f867d402d6d Alexander Stein           2011-11-15  1574  	 *	and restore the IER
e30f867d402d6d Alexander Stein           2011-11-15  1575  	 */
34619de1b8cb52 Ilpo Järvinen             2022-06-24  1576  	wait_for_xmitr(priv, UART_LSR_BOTH_EMPTY);
e30f867d402d6d Alexander Stein           2011-11-15  1577  	iowrite8(ier, priv->membase + UART_IER);
e30f867d402d6d Alexander Stein           2011-11-15  1578  
d47dd323bf959d Sebastian Andrzej Siewior 2024-03-01  1579  	if (locked)
d47dd323bf959d Sebastian Andrzej Siewior 2024-03-01 @1580  		uart_port_unlock_irqrestore(&priv->port, flags);
e30f867d402d6d Alexander Stein           2011-11-15  1581  }
e30f867d402d6d Alexander Stein           2011-11-15  1582  

:::::: The code at line 1580 was first introduced by commit
:::::: d47dd323bf959dbf5f3e7f83373c8ed5f3bec9c0 serial: pch: Use uart_prepare_sysrq_char().

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
