Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B17314B91
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 11:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822965; cv=none; b=LAAKPP1tUigIu4FLkYBHbkcLYbpXe7Nfh4rqvnFsx9Ffunr8g+tdea8vuAj9EFVyBW+TvqNH8sfc/8yJlyAWFAosQFdhTmII2uG6ANVtJjVVeegu3PvDw/zfucS4m+RwuEpqrKrfj71lNHJExTmpQv84DCxSI1kyb/WGbXcpB8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822965; c=relaxed/simple;
	bh=NIAtMYV9EvRAzdxMYrIdimOKj9BkDVus9LqH70++Dhg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YXkqktEXO8ZESR2irQQa1p85cxpxlbmmAtkbXJKuK+JbDFdR3bgyCkTNv8Y2TzsNDl7zqrdil+Qc2kGZMfjsgKOegMw68SWrkaUDfxE/gd4rfXGPd6CweIpngz17KpughRDd5sH77cJcuy8MV7mL2aABbZdOKD/VrF/eXLE18j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KedAzpOx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KedAzpOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768822954; x=1800358954;
  h=date:from:to:cc:subject:message-id;
  bh=NIAtMYV9EvRAzdxMYrIdimOKj9BkDVus9LqH70++Dhg=;
  b=KedAzpOxzXZkOcEee0x9xNpt2BkAfo3oaf5Z556Lto5pHe1Bj7a/O6bf
   QNX0sFfHQrkByNRBEsRrTuvSFFk0gKdqvQnjotqjSsnYYDaUqRborNzJg
   YohH0xQxt9FO6/U2+5HhZdg/cPl2K9pXxQtiBish9wUSIlkvl4Nbdjace
   Ve32LZzbBFXz8WuPJ8NLcqFDm9z9fRPXbJVS9a1Rgh+3oIwKWavx06Xve
   VzpBGJodn+My25r9F6M5E78dgwLY2O1Ifb6cDdOeP9JGu3hIc1Q14H/PI
   UTh5JKsUBRV9E6OLgQn66Q+CitfWeXGhHmJAiatvElP3gxLcSO6MVxr9p
   g==;
X-CSE-ConnectionGUID: Hqu6dF1xTSiApvJgkooSOg==
X-CSE-MsgGUID: SIrxOGXoSmKVIIT2Q6lg0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70195587"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70195587"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 03:42:34 -0800
X-CSE-ConnectionGUID: u+oYMLU8QwKW1b3UaZ6jQw==
X-CSE-MsgGUID: 7UqcEveCQg6OiX8OuA4pvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="236521871"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Jan 2026 03:42:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhneP-00000000Nk3-22Uo;
	Mon, 19 Jan 2026 11:42:29 +0000
Date: Mon, 19 Jan 2026 19:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 27/43] drivers/tty/serial/sunsu.c:1298
 sunsu_console_write() error: uninitialized symbol 'flags'.
Message-ID: <202601191907.iuREuENT-lkp@intel.com>
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
TO: Marco Elver <elver@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   ccf9e070116a81d29aae30db501d562c8efd1ed8
commit: e4588c25c9d122b5847b88e18b184404b6959160 [27/43] compiler-context-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 9 days ago
:::::: commit date: 2 weeks ago
config: sparc-randconfig-r071-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191907.iuREuENT-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601191907.iuREuENT-lkp@intel.com/

smatch warnings:
drivers/tty/serial/sunsu.c:1298 sunsu_console_write() error: uninitialized symbol 'flags'.

vim +/flags +1298 drivers/tty/serial/sunsu.c

d358788f3f3011 drivers/serial/sunsu.c     Russell King    2006-03-20  1264  
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1265  /*
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1266   *	Print a string to the serial port trying not to disturb
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1267   *	any possible real use of the port...
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1268   */
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1269  static void sunsu_console_write(struct console *co, const char *s,
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1270  				unsigned int count)
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1271  {
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1272  	struct uart_sunsu_port *up = &sunsu_ports[co->index];
f3c681c028846b drivers/serial/sunsu.c     David S. Miller 2007-07-15  1273  	unsigned long flags;
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1274  	unsigned int ier;
f3c681c028846b drivers/serial/sunsu.c     David S. Miller 2007-07-15  1275  	int locked = 1;
f3c681c028846b drivers/serial/sunsu.c     David S. Miller 2007-07-15  1276  
e58e241c178885 drivers/tty/serial/sunsu.c David Miller    2014-03-04  1277  	if (up->port.sysrq || oops_in_progress)
f610d445ff1a0e drivers/tty/serial/sunsu.c Thomas Gleixner 2023-09-14  1278  		locked = uart_port_trylock_irqsave(&up->port, &flags);
e58e241c178885 drivers/tty/serial/sunsu.c David Miller    2014-03-04  1279  	else
f610d445ff1a0e drivers/tty/serial/sunsu.c Thomas Gleixner 2023-09-14  1280  		uart_port_lock_irqsave(&up->port, &flags);
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1281  
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1282  	/*
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1283  	 *	First save the UER then disable the interrupts
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1284  	 */
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1285  	ier = serial_in(up, UART_IER);
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1286  	serial_out(up, UART_IER, 0);
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1287  
d358788f3f3011 drivers/serial/sunsu.c     Russell King    2006-03-20  1288  	uart_console_write(&up->port, s, count, sunsu_console_putchar);
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1289  
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1290  	/*
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1291  	 *	Finally, wait for transmitter to become empty
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1292  	 *	and restore the IER
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1293  	 */
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1294  	wait_for_xmitr(up);
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1295  	serial_out(up, UART_IER, ier);
f3c681c028846b drivers/serial/sunsu.c     David S. Miller 2007-07-15  1296  
f3c681c028846b drivers/serial/sunsu.c     David S. Miller 2007-07-15  1297  	if (locked)
f610d445ff1a0e drivers/tty/serial/sunsu.c Thomas Gleixner 2023-09-14 @1298  		uart_port_unlock_irqrestore(&up->port, flags);
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1299  }
^1da177e4c3f41 drivers/serial/sunsu.c     Linus Torvalds  2005-04-16  1300  

:::::: The code at line 1298 was first introduced by commit
:::::: f610d445ff1a0e812656f7f9cb8498d4d9b0cae2 serial: sunsu: Use port lock wrappers

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
