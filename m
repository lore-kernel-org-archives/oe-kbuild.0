Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2627F42AA3
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jan 2026 08:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767688975; cv=none; b=Uh6c/Uo3R5Gf1tLr7ehL9q2kAABcsuMfZx33bg8SN4oB6o/geugHUwNJsP5jCkVieIvx0tpkCL1n2m1uXSQQFYFp2XVxPMsovvRVrxPhAOT2Bak0fPJnGam0JbLFdmdxM4ff+jO9nF6prEi50kvhxLkgc61iF1ZJfLrt4y0Ba1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767688975; c=relaxed/simple;
	bh=E/z8CFC2Z6txgsJw/zaOebGU9+VtlCBickTu24gP4Jg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MmY7k/J7r9NSdIQPuXVNAMu/n4Q5U3p922LWLtcidYtB2RxR1hkZfbudW9DUpb8FVkIhXjabPH+hDMLNB3zjjdH/abqPKUKbL8xKRC6EGI+1UXqn3A1OQp20RbcAB06LO6dAXAP27O/R0hZ5dBHrAbhCBm0wFoU+1lFZrLgjMYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMvk9CMF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMvk9CMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767688973; x=1799224973;
  h=date:from:to:cc:subject:message-id;
  bh=E/z8CFC2Z6txgsJw/zaOebGU9+VtlCBickTu24gP4Jg=;
  b=KMvk9CMFWcxWQByiGV1vzVlkQPD8df2QtzmGdl06URW37aOH5thpVMeJ
   kiUZII/7ymc7hXGusAjExF4GJMFWtRL6cKXNZ+1DZwEgiuacA7DkDXErB
   YfsQR3YYy2/q4wcog96H3tlEvPvQUtXEjxwSQ/Ms2Hetmmg4RrdU5MbCd
   tEW4NyDKo9qJhonVKceqlpcyGL0OK9AgBAo69x8tq3ciTRi4D6t/XZe6k
   AGsXL7dHiFrxzIckEFPwr2EXD7OAMCxv4wR60a+xxsY3Kr6ardmwcVa3I
   tDhl/ftfjzcHgJ4OeX16/WXQERQp6EZhq32EiAJYIWnaf73BQAS0PxJ/o
   Q==;
X-CSE-ConnectionGUID: 1Vz0PTxrSTC0Ke30g8O3ew==
X-CSE-MsgGUID: 2QtdNIgFRiiVJGG17F9Uqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="56618131"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="56618131"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 00:42:52 -0800
X-CSE-ConnectionGUID: yY25E4bjQiKC+2FC23UKmw==
X-CSE-MsgGUID: 2ieYA844RRew88Ai5sMFzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202499124"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jan 2026 00:42:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd2eO-000000001mb-3Yvm;
	Tue, 06 Jan 2026 08:42:48 +0000
Date: Tue, 06 Jan 2026 16:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 27/40]
 drivers/tty/serial/fsl_lpuart.c:2523 lpuart_console_write() error:
 uninitialized symbol 'flags'.
Message-ID: <202601061645.CMlL0qao-lkp@intel.com>
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
head:   c10d860e0baae0853773dc90a94b26adc5687380
commit: e4588c25c9d122b5847b88e18b184404b6959160 [27/40] compiler-context-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-141-20260106 (https://download.01.org/0day-ci/archive/20260106/202601061645.CMlL0qao-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601061645.CMlL0qao-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/fsl_lpuart.c:2523 lpuart_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/fsl_lpuart.c:2553 lpuart32_console_write() error: uninitialized symbol 'flags'.

Old smatch warnings:
drivers/tty/serial/fsl_lpuart.c:1336 lpuart_timer_func() error: uninitialized symbol 'flags'.

vim +/flags +2523 drivers/tty/serial/fsl_lpuart.c

380c966c093e72 Jingchang Lu    2014-07-14  2495  
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2496  static void
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2497  lpuart_console_write(struct console *co, const char *s, unsigned int count)
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2498  {
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2499  	struct lpuart_port *sport = lpuart_ports[co->index];
b6a8f6ab2c53e5 Sherry Sun      2025-03-12  2500  	u8  old_cr2, cr2;
abf1e0a98083fd Stefan Agner    2017-03-24  2501  	unsigned long flags;
abf1e0a98083fd Stefan Agner    2017-03-24  2502  	int locked = 1;
abf1e0a98083fd Stefan Agner    2017-03-24  2503  
5697df7322fe0a Michael Walle   2021-05-12  2504  	if (oops_in_progress)
92f4e05bcc7bd3 Thomas Gleixner 2023-09-14  2505  		locked = uart_port_trylock_irqsave(&sport->port, &flags);
abf1e0a98083fd Stefan Agner    2017-03-24  2506  	else
92f4e05bcc7bd3 Thomas Gleixner 2023-09-14  2507  		uart_port_lock_irqsave(&sport->port, &flags);
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2508  
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2509  	/* first save CR2 and then disable interrupts */
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2510  	cr2 = old_cr2 = readb(sport->port.membase + UARTCR2);
bcfa46bfb9b7c6 Andrey Smirnov  2019-07-29  2511  	cr2 |= UARTCR2_TE | UARTCR2_RE;
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2512  	cr2 &= ~(UARTCR2_TIE | UARTCR2_TCIE | UARTCR2_RIE);
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2513  	writeb(cr2, sport->port.membase + UARTCR2);
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2514  
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2515  	uart_console_write(&sport->port, s, count, lpuart_console_putchar);
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2516  
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2517  	/* wait for transmitter finish complete and restore CR2 */
56dd627fb223d1 Andrey Smirnov  2019-07-29  2518  	lpuart_wait_bit_set(&sport->port, UARTSR1, UARTSR1_TC);
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2519  
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2520  	writeb(old_cr2, sport->port.membase + UARTCR2);
abf1e0a98083fd Stefan Agner    2017-03-24  2521  
abf1e0a98083fd Stefan Agner    2017-03-24  2522  	if (locked)
92f4e05bcc7bd3 Thomas Gleixner 2023-09-14 @2523  		uart_port_unlock_irqrestore(&sport->port, flags);
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2524  }
c9e2e946fb0ba5 Jingchang Lu    2013-06-07  2525  
380c966c093e72 Jingchang Lu    2014-07-14  2526  static void
380c966c093e72 Jingchang Lu    2014-07-14  2527  lpuart32_console_write(struct console *co, const char *s, unsigned int count)
380c966c093e72 Jingchang Lu    2014-07-14  2528  {
380c966c093e72 Jingchang Lu    2014-07-14  2529  	struct lpuart_port *sport = lpuart_ports[co->index];
b6a8f6ab2c53e5 Sherry Sun      2025-03-12  2530  	u32 old_cr, cr;
abf1e0a98083fd Stefan Agner    2017-03-24  2531  	unsigned long flags;
abf1e0a98083fd Stefan Agner    2017-03-24  2532  	int locked = 1;
abf1e0a98083fd Stefan Agner    2017-03-24  2533  
5697df7322fe0a Michael Walle   2021-05-12  2534  	if (oops_in_progress)
92f4e05bcc7bd3 Thomas Gleixner 2023-09-14  2535  		locked = uart_port_trylock_irqsave(&sport->port, &flags);
abf1e0a98083fd Stefan Agner    2017-03-24  2536  	else
92f4e05bcc7bd3 Thomas Gleixner 2023-09-14  2537  		uart_port_lock_irqsave(&sport->port, &flags);
380c966c093e72 Jingchang Lu    2014-07-14  2538  
380c966c093e72 Jingchang Lu    2014-07-14  2539  	/* first save CR2 and then disable interrupts */
a0204f25e15cb5 Dong Aisheng    2017-06-13  2540  	cr = old_cr = lpuart32_read(&sport->port, UARTCTRL);
bcfa46bfb9b7c6 Andrey Smirnov  2019-07-29  2541  	cr |= UARTCTRL_TE | UARTCTRL_RE;
380c966c093e72 Jingchang Lu    2014-07-14  2542  	cr &= ~(UARTCTRL_TIE | UARTCTRL_TCIE | UARTCTRL_RIE);
a0204f25e15cb5 Dong Aisheng    2017-06-13  2543  	lpuart32_write(&sport->port, cr, UARTCTRL);
380c966c093e72 Jingchang Lu    2014-07-14  2544  
380c966c093e72 Jingchang Lu    2014-07-14  2545  	uart_console_write(&sport->port, s, count, lpuart32_console_putchar);
380c966c093e72 Jingchang Lu    2014-07-14  2546  
380c966c093e72 Jingchang Lu    2014-07-14  2547  	/* wait for transmitter finish complete and restore CR2 */
56dd627fb223d1 Andrey Smirnov  2019-07-29  2548  	lpuart32_wait_bit_set(&sport->port, UARTSTAT, UARTSTAT_TC);
380c966c093e72 Jingchang Lu    2014-07-14  2549  
a0204f25e15cb5 Dong Aisheng    2017-06-13  2550  	lpuart32_write(&sport->port, old_cr, UARTCTRL);
abf1e0a98083fd Stefan Agner    2017-03-24  2551  
abf1e0a98083fd Stefan Agner    2017-03-24  2552  	if (locked)
92f4e05bcc7bd3 Thomas Gleixner 2023-09-14 @2553  		uart_port_unlock_irqrestore(&sport->port, flags);
380c966c093e72 Jingchang Lu    2014-07-14  2554  }
380c966c093e72 Jingchang Lu    2014-07-14  2555  

:::::: The code at line 2523 was first introduced by commit
:::::: 92f4e05bcc7bd3af7591d7abaab8f8c9470c1e7b serial: fsl_lpuart: Use port lock wrappers

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
