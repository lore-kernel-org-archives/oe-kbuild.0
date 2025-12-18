Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6962C1597
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766068753; cv=none; b=YoIbRBJvkgzVThPj5g80Cb1FdHBm24kkHk3wNioSvl+vuIjZ+obWgpCDmVtt08TAXF7UDFoCooTVcyOmhP7criUwkVde0V3ZRQg5vHRwkXyeWEkpYf9xFKc8Phg3KKzspO8Je6frT9AdcPaVVUyaGb4ka2EcHiZ80RDOA9NUa20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766068753; c=relaxed/simple;
	bh=JgkZZwgAhg0NbNtBhxIdeOzb/lFHGe+ZRszQgGrYwKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WET1kxsf+Uzk5PZGPfGPDMtVlv7676YXrAIO17diQ5RG1OPVLcYS3GNvrZrfma2Uir3Bb5gvreDPYreajEzKe6e0sfQy3Sk5JAlxq+/SVUXlAdnHjFKNt4NW++IqGppsAECjQRamd0mSAn3svdOuCeCDAR3LPfxHIpFNLU7z7DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7TN6pEx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7TN6pEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766068751; x=1797604751;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JgkZZwgAhg0NbNtBhxIdeOzb/lFHGe+ZRszQgGrYwKc=;
  b=D7TN6pExHtD58XeJuSf6ZZHw7RXJlTYG73ltV/Q228HOTqU7zGLOlFW1
   Vb3G1lZRnwTvsOV0npRsZknXMzY4Di4dvd2B6aTO4CiDvc9AVbM2BJoLX
   WIz939bmQ6n1ymT13gdwZfFffMf591DfEUZu8eyXVP33b7Ui+iLGXHEfO
   aozGU5Ip4upzIO2dZABYkHFr5rKOsaoHMclvURi64N9zKGCDJD321wNpE
   CDEwMHTbOmupLOloPXwalS+BtiFr4e3IQxOTNieiuc1t6KV105GQzccV0
   ib/A6e4WvC+PUqs5YF0bnFF9V5eTnvFCNff3k1kmGSRU7H8fQu5mYKhhq
   w==;
X-CSE-ConnectionGUID: 9F/AXKrtQS+XTH6lhTApdg==
X-CSE-MsgGUID: 0+11YJDFSzyCNKIgjZd53w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="85440667"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="85440667"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 06:39:10 -0800
X-CSE-ConnectionGUID: ZBxqtI9pRhykfn0AAIojOQ==
X-CSE-MsgGUID: RaOGmgxvS2udd6AyXd/FoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="198602578"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Dec 2025 06:39:08 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWF9l-000000002C1-4Bad;
	Thu, 18 Dec 2025 14:39:05 +0000
Date: Thu, 18 Dec 2025 22:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:ctx-analysis/dev 24/36]
 drivers/tty/serial/8250/8250_port.c:3371 serial8250_console_write() error:
 uninitialized symbol 'flags'.
Message-ID: <202512182240.MBq0PFT8-lkp@intel.com>
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
head:   5950df0508b3b151758cb1d1d965713d93200c47
commit: 752b5e42738a61eaad41dd5c0b9352f7a123b43b [24/36] compiler-context-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: i386-randconfig-141-20251218 (https://download.01.org/0day-ci/archive/20251218/202512182240.MBq0PFT8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512182240.MBq0PFT8-lkp@intel.com/

smatch warnings:
drivers/tty/serial/8250/8250_port.c:3371 serial8250_console_write() error: uninitialized symbol 'flags'.
drivers/net/wireless/ti/wlcore/main.c:662 wlcore_irq_locked() error: uninitialized symbol 'flags'.
drivers/net/wireless/ti/wlcore/main.c:761 wlcore_irq() error: uninitialized symbol 'flags'.

vim +/flags +3371 drivers/tty/serial/8250/8250_port.c

8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3277  
b6830f6df8914f Peter Hurley         2015-06-27  3278  /*
b6830f6df8914f Peter Hurley         2015-06-27  3279   *	Print a string to the serial port trying not to disturb
b6830f6df8914f Peter Hurley         2015-06-27  3280   *	any possible real use of the port...
b6830f6df8914f Peter Hurley         2015-06-27  3281   *
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3282   *	The console_lock must be held when we get here.
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3283   *
bedb404e91bb29 Andy Shevchenko      2020-02-17  3284   *	Doing runtime PM is really a bad idea for the kernel console.
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3285   *	Thus, we assume the function is called when device is powered up.
b6830f6df8914f Peter Hurley         2015-06-27  3286   */
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3287  void serial8250_console_write(struct uart_8250_port *up, const char *s,
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3288  			      unsigned int count)
b6830f6df8914f Peter Hurley         2015-06-27  3289  {
7f9803072ff636 Lukas Wunner         2020-02-28  3290  	struct uart_8250_em485 *em485 = up->em485;
b6830f6df8914f Peter Hurley         2015-06-27  3291  	struct uart_port *port = &up->port;
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3292  	unsigned long flags;
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3293  	unsigned int ier, use_fifo;
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3294  	int locked = 1;
b6830f6df8914f Peter Hurley         2015-06-27  3295  
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3296  	touch_nmi_watchdog();
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3297  
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3298  	if (oops_in_progress)
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3299  		locked = uart_port_trylock_irqsave(port, &flags);
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3300  	else
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3301  		uart_port_lock_irqsave(port, &flags);
b6830f6df8914f Peter Hurley         2015-06-27  3302  
b6830f6df8914f Peter Hurley         2015-06-27  3303  	/*
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3304  	 *	First save the IER then disable the interrupts
b6830f6df8914f Peter Hurley         2015-06-27  3305  	 */
b6830f6df8914f Peter Hurley         2015-06-27  3306  	ier = serial_port_in(port, UART_IER);
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3307  	serial8250_clear_IER(up);
b6830f6df8914f Peter Hurley         2015-06-27  3308  
b6830f6df8914f Peter Hurley         2015-06-27  3309  	/* check scratch reg to see if port powered off during system sleep */
b6830f6df8914f Peter Hurley         2015-06-27  3310  	if (up->canary && (up->canary != serial_port_in(port, UART_SCR))) {
10791233e98fbd Peter Hurley         2015-09-25  3311  		serial8250_console_restore(up);
b6830f6df8914f Peter Hurley         2015-06-27  3312  		up->canary = 0;
b6830f6df8914f Peter Hurley         2015-06-27  3313  	}
b6830f6df8914f Peter Hurley         2015-06-27  3314  
7f9803072ff636 Lukas Wunner         2020-02-28  3315  	if (em485) {
7f9803072ff636 Lukas Wunner         2020-02-28  3316  		if (em485->tx_stopped)
910ef438e93cd2 John Ogness          2025-01-07  3317  			up->rs485_start_tx(up, false);
7f9803072ff636 Lukas Wunner         2020-02-28  3318  		mdelay(port->rs485.delay_rts_before_send);
7f9803072ff636 Lukas Wunner         2020-02-28  3319  	}
7f9803072ff636 Lukas Wunner         2020-02-28  3320  
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3321  	use_fifo = (up->capabilities & UART_CAP_FIFO) &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3322  		/*
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3323  		 * BCM283x requires to check the fifo
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3324  		 * after each byte.
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3325  		 */
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3326  		!(up->capabilities & UART_CAP_MINI) &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3327  		/*
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3328  		 * tx_loadsz contains the transmit fifo size
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3329  		 */
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3330  		up->tx_loadsz > 1 &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3331  		(up->fcr & UART_FCR_ENABLE_FIFO) &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3332  		port->state &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3333  		test_bit(TTY_PORT_INITIALIZED, &port->state->port.iflags) &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3334  		/*
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3335  		 * After we put a data in the fifo, the controller will send
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3336  		 * it regardless of the CTS state. Therefore, only use fifo
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3337  		 * if we don't use control flow.
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3338  		 */
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3339  		!(up->port.flags & UPF_CONS_FLOW);
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3340  
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3341  	if (likely(use_fifo))
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3342  		serial8250_console_fifo_write(up, s, count);
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3343  	else
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3344  		uart_console_write(port, s, count, serial8250_console_wait_putchar);
b6830f6df8914f Peter Hurley         2015-06-27  3345  
b6830f6df8914f Peter Hurley         2015-06-27  3346  	/*
b6830f6df8914f Peter Hurley         2015-06-27  3347  	 *	Finally, wait for transmitter to become empty
b6830f6df8914f Peter Hurley         2015-06-27  3348  	 *	and restore the IER
b6830f6df8914f Peter Hurley         2015-06-27  3349  	 */
34619de1b8cb52 Ilpo Järvinen        2022-06-24  3350  	wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
b6830f6df8914f Peter Hurley         2015-06-27  3351  
7f9803072ff636 Lukas Wunner         2020-02-28  3352  	if (em485) {
4e36f94e996ebe Lukas Wunner         2020-03-27  3353  		mdelay(port->rs485.delay_rts_after_send);
7f9803072ff636 Lukas Wunner         2020-02-28  3354  		if (em485->tx_stopped)
910ef438e93cd2 John Ogness          2025-01-07  3355  			up->rs485_stop_tx(up, false);
7f9803072ff636 Lukas Wunner         2020-02-28  3356  	}
7f9803072ff636 Lukas Wunner         2020-02-28  3357  
8d5b305484e8a3 Lukas Wunner         2020-03-27  3358  	serial_port_out(port, UART_IER, ier);
8d5b305484e8a3 Lukas Wunner         2020-03-27  3359  
b6830f6df8914f Peter Hurley         2015-06-27  3360  	/*
b6830f6df8914f Peter Hurley         2015-06-27  3361  	 *	The receive handling will happen properly because the
b6830f6df8914f Peter Hurley         2015-06-27  3362  	 *	receive ready bit will still be set; it is not cleared
b6830f6df8914f Peter Hurley         2015-06-27  3363  	 *	on read.  However, modem control will not, we must
b6830f6df8914f Peter Hurley         2015-06-27  3364  	 *	call it if we have saved something in the saved flags
b6830f6df8914f Peter Hurley         2015-06-27  3365  	 *	while processing with interrupts off.
b6830f6df8914f Peter Hurley         2015-06-27  3366  	 */
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3367  	if (up->msr_saved_flags)
b6830f6df8914f Peter Hurley         2015-06-27  3368  		serial8250_modem_status(up);
b6830f6df8914f Peter Hurley         2015-06-27  3369  
f79b163c42314a Greg Kroah-Hartman   2025-01-22  3370  	if (locked)
f79b163c42314a Greg Kroah-Hartman   2025-01-22 @3371  		uart_port_unlock_irqrestore(port, flags);
b6830f6df8914f Peter Hurley         2015-06-27  3372  }
b6830f6df8914f Peter Hurley         2015-06-27  3373  

:::::: The code at line 3371 was first introduced by commit
:::::: f79b163c42314a1f46f4bcc40a19c8a75cf1e7a3 Revert "serial: 8250: Switch to nbcon console"

:::::: TO: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
