Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BE5111AD
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Aug 2025 00:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754354369; cv=none; b=uFGnGJ9mUI/zs3+qtZSgl1urzjMEIQsaY0/GD9RsEu+KmDZk27ctK3i5dmAt5PZ6CCY0iHVxpJ60xV8TfdQM1UPvk7AOwB2qtlJm1X9RMMUwtOiUZ6G6q23nmVAZNdALDRkJGJqyNlkB11Tqumx8hWj9aHhUH68zAlYmnN4IYU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754354369; c=relaxed/simple;
	bh=ncBqzeaucV/V0hHyLs3g/nc1FfskOYqrzMQB9ATihEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jry5V+uBpV0wnRxV/Ap+yLKdybyAc086rdFJQRBUz4GjRpA0JTCl0v7DqEAqOAYQqRYs/9+HccvRX1N9SVtq56tDlree8b/yVL6x8y7R6L+MRrK+gP3OLguxJfx2b83HDJ8hi0O9VQG0iN9G73CQSMUgj2MWGAT1AkE7KK9N17w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DooVxAt0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DooVxAt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754354368; x=1785890368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ncBqzeaucV/V0hHyLs3g/nc1FfskOYqrzMQB9ATihEY=;
  b=DooVxAt0EQxjM4wP4bdRmgk2iPZjOcswXZp2tQUR+GRPwjCBGHiaPlmI
   BvWS1T6gkeO/5xe6Cdpq4l2VLYlibWF//BAi6YirtJnVstkqmHGG1Q+QG
   NcvDrnOkD/PqVHcCuKrthD504dt8j1ODOtWpie3I1AMqJIjaYh6w0zBAp
   y5ongzdLzgl+SgJdaIi30m7oAE5h40ECZxYCMiS59Xoo+32vWn0o6DFhX
   NjGLOgQ1uRbnAZk7VroT40Z7CZipuh0IyKkOzsghLXJzmBOZzZBHyte/6
   MQaRUKgctuapfDi7y1RImmAZCcjpngZZ51eeDxndQ0OZcQfJLQJKYKR3T
   w==;
X-CSE-ConnectionGUID: aXecHEgqToClE9nWY60eQA==
X-CSE-MsgGUID: nIMrzdghTMqZzbQ9AZejGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56522615"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="56522615"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:39:27 -0700
X-CSE-ConnectionGUID: CnQ9XMKxSJOGWo+nYGAbkA==
X-CSE-MsgGUID: kliUoNhiSP+1o+Ynkrd5cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="169604042"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 04 Aug 2025 17:39:25 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uj5i7-0000LJ-0l;
	Tue, 05 Aug 2025 00:39:23 +0000
Date: Tue, 5 Aug 2025 08:39:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 23/34] drivers/tty/serial/uartlite.c:523
 ulite_console_write() error: uninitialized symbol 'flags'.
Message-ID: <202508050813.ouRV08aN-lkp@intel.com>
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
head:   84b025a0f61636d7599b175d0a8186de719087e4
commit: 6d0c29522d626fe956a6abdb892b99baeaff211e [23/34] compiler-capability-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-161-20250805 (https://download.01.org/0day-ci/archive/20250805/202508050813.ouRV08aN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508050813.ouRV08aN-lkp@intel.com/

smatch warnings:
drivers/tty/serial/uartlite.c:523 ulite_console_write() error: uninitialized symbol 'flags'.

vim +/flags +523 drivers/tty/serial/uartlite.c

238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  496  
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  497  static void ulite_console_write(struct console *co, const char *s,
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  498  				unsigned int count)
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  499  {
deeb33e8fdd834 drivers/tty/serial/uartlite.c Shubhrajyoti Datta 2018-08-06  500  	struct uart_port *port = console_port;
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  501  	unsigned long flags;
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  502  	unsigned int ier;
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  503  	int locked = 1;
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  504  
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  505  	if (oops_in_progress) {
de71068b6a0678 drivers/tty/serial/uartlite.c Thomas Gleixner    2023-09-14  506  		locked = uart_port_trylock_irqsave(port, &flags);
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  507  	} else
de71068b6a0678 drivers/tty/serial/uartlite.c Thomas Gleixner    2023-09-14  508  		uart_port_lock_irqsave(port, &flags);
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  509  
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  510  	/* save and disable interrupt */
6d53c3b71d32da drivers/tty/serial/uartlite.c Michal Simek       2013-02-11  511  	ier = uart_in32(ULITE_STATUS, port) & ULITE_STATUS_IE;
6d53c3b71d32da drivers/tty/serial/uartlite.c Michal Simek       2013-02-11  512  	uart_out32(0, ULITE_CONTROL, port);
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  513  
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  514  	uart_console_write(port, s, count, ulite_console_putchar);
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  515  
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  516  	ulite_console_wait_tx(port);
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  517  
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  518  	/* restore interrupt state */
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  519  	if (ier)
6d53c3b71d32da drivers/tty/serial/uartlite.c Michal Simek       2013-02-11  520  		uart_out32(ULITE_CONTROL_IE, ULITE_CONTROL, port);
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  521  
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  522  	if (locked)
de71068b6a0678 drivers/tty/serial/uartlite.c Thomas Gleixner    2023-09-14 @523  		uart_port_unlock_irqrestore(port, flags);
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  524  }
238b8721a554a3 drivers/serial/uartlite.c     Peter Korsgaard    2006-12-06  525  

:::::: The code at line 523 was first introduced by commit
:::::: de71068b6a06788dd179136f43d2d873e6fd14a9 serial: uartlite: Use port lock wrappers

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
