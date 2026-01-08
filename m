Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C9C3093B5
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 23:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767915635; cv=none; b=RppIGLrUDTpnpMCJ6fqU7BjBNWdlc8FOhq/X3G4MMK2Znz2VMVM2TofJS3TR6rYVYB5P3PnF3HgK7BKaI/SFkO/0R+mkJAbXJ4jTJS7zrd1weNAjNJcuq3KNr03bxNYtTKsQYVNqh+n7CKYiuZwLB7ufqzgbDNAbAXFY4b7DTiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767915635; c=relaxed/simple;
	bh=mL5Im6sPlwdFskXRdQBa1dAkjjwYzg6MH+PUxWJvdgo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fQV1Km7BeNneunNDbh+7O0nLuuj6rLUx7Y7brOk+4iRuvUfdIHhNwIGWa+MwFjwTs+IN6ySYkPZ1dKfz/7p6hivFXL1oQ2SYUb595A6zixiMlTxzqdXtUvceQ9alkHgAS2FOFv7rLtNyQXrl8brM4fZ5/xcLbLykLKStU8poD5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDkvlRmm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDkvlRmm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767915634; x=1799451634;
  h=date:from:to:cc:subject:message-id;
  bh=mL5Im6sPlwdFskXRdQBa1dAkjjwYzg6MH+PUxWJvdgo=;
  b=oDkvlRmm2yGXT9DYqnaVTiLc5fdcF0/OgZ5G7JNekN6YaJcbyMDpBURT
   4HVOfSDH2oawuW09Zc05Kt4mX8lXAVStGFr9ylAhY1HDEpLgma4MgjOZP
   oDpoGWY1HAeuzhh/c5KeZc4wVj0Ruiyfn98r3M7rvdLuj06ZH/J20zv4L
   Brmd7iwTmcd4TrSW8M50fNo5p6fYaUP6wG6vr7BA0Vtqj/CMnFAdt/oFW
   enp4xXDFBV+4UharcptKCNIfFdeDF+xvWDhUmVEwIomnPVFtZMJA60uo6
   lxYAMa4sJmH8DPUTEhXo31VEafvQnuPKSc1URz51kIrA3it+mJBqGlajp
   g==;
X-CSE-ConnectionGUID: yb5Dnt/bS4+usg6u8gBSTg==
X-CSE-MsgGUID: 9Nw3r6xmT5esxtsdwHgK9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69284135"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69284135"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 15:40:33 -0800
X-CSE-ConnectionGUID: C+/iD89lRi+7jHjdchIocw==
X-CSE-MsgGUID: 9Q7970XhT7i08FF3H55tyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="207472075"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Jan 2026 15:40:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdzcD-000000005G2-1F3w;
	Thu, 08 Jan 2026 23:40:29 +0000
Date: Fri, 09 Jan 2026 07:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 27/43] drivers/tty/serial/st-asc.c:875
 asc_console_write() error: uninitialized symbol 'flags'.
Message-ID: <202601090732.b9JDsjGs-lkp@intel.com>
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
head:   a45026cef17d1080c985adf28234d6c8475ad66f
commit: e4588c25c9d122b5847b88e18b184404b6959160 [27/43] compiler-context-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 13 hours ago
:::::: commit date: 3 days ago
config: powerpc-randconfig-r071-20260108 (https://download.01.org/0day-ci/archive/20260109/202601090732.b9JDsjGs-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601090732.b9JDsjGs-lkp@intel.com/

smatch warnings:
drivers/tty/serial/st-asc.c:875 asc_console_write() error: uninitialized symbol 'flags'.

vim +/flags +875 drivers/tty/serial/st-asc.c

c4b058560762ec Srinivas Kandagatla 2013-07-15  838  
c4b058560762ec Srinivas Kandagatla 2013-07-15  839  /*
c4b058560762ec Srinivas Kandagatla 2013-07-15  840   *  Print a string to the serial port trying not to disturb
c4b058560762ec Srinivas Kandagatla 2013-07-15  841   *  any possible real use of the port...
c4b058560762ec Srinivas Kandagatla 2013-07-15  842   */
c4b058560762ec Srinivas Kandagatla 2013-07-15  843  
c4b058560762ec Srinivas Kandagatla 2013-07-15  844  static void asc_console_write(struct console *co, const char *s, unsigned count)
c4b058560762ec Srinivas Kandagatla 2013-07-15  845  {
c4b058560762ec Srinivas Kandagatla 2013-07-15  846  	struct uart_port *port = &asc_ports[co->index].port;
c4b058560762ec Srinivas Kandagatla 2013-07-15  847  	unsigned long flags;
c4b058560762ec Srinivas Kandagatla 2013-07-15  848  	unsigned long timeout = 1000000;
c4b058560762ec Srinivas Kandagatla 2013-07-15  849  	int locked = 1;
c4b058560762ec Srinivas Kandagatla 2013-07-15  850  	u32 intenable;
c4b058560762ec Srinivas Kandagatla 2013-07-15  851  
c4b058560762ec Srinivas Kandagatla 2013-07-15  852  	if (port->sysrq)
c4b058560762ec Srinivas Kandagatla 2013-07-15  853  		locked = 0; /* asc_interrupt has already claimed the lock */
c4b058560762ec Srinivas Kandagatla 2013-07-15  854  	else if (oops_in_progress)
47d4dfd9acb737 Thomas Gleixner     2023-09-14  855  		locked = uart_port_trylock_irqsave(port, &flags);
c4b058560762ec Srinivas Kandagatla 2013-07-15  856  	else
47d4dfd9acb737 Thomas Gleixner     2023-09-14  857  		uart_port_lock_irqsave(port, &flags);
c4b058560762ec Srinivas Kandagatla 2013-07-15  858  
c4b058560762ec Srinivas Kandagatla 2013-07-15  859  	/*
c4b058560762ec Srinivas Kandagatla 2013-07-15  860  	 * Disable interrupts so we don't get the IRQ line bouncing
c4b058560762ec Srinivas Kandagatla 2013-07-15  861  	 * up and down while interrupts are disabled.
c4b058560762ec Srinivas Kandagatla 2013-07-15  862  	 */
c4b058560762ec Srinivas Kandagatla 2013-07-15  863  	intenable = asc_in(port, ASC_INTEN);
c4b058560762ec Srinivas Kandagatla 2013-07-15  864  	asc_out(port, ASC_INTEN, 0);
c4b058560762ec Srinivas Kandagatla 2013-07-15  865  	(void)asc_in(port, ASC_INTEN);	/* Defeat bus write posting */
c4b058560762ec Srinivas Kandagatla 2013-07-15  866  
c4b058560762ec Srinivas Kandagatla 2013-07-15  867  	uart_console_write(port, s, count, asc_console_putchar);
c4b058560762ec Srinivas Kandagatla 2013-07-15  868  
c4b058560762ec Srinivas Kandagatla 2013-07-15  869  	while (--timeout && !asc_txfifo_is_empty(port))
c4b058560762ec Srinivas Kandagatla 2013-07-15  870  		udelay(1);
c4b058560762ec Srinivas Kandagatla 2013-07-15  871  
c4b058560762ec Srinivas Kandagatla 2013-07-15  872  	asc_out(port, ASC_INTEN, intenable);
c4b058560762ec Srinivas Kandagatla 2013-07-15  873  
c4b058560762ec Srinivas Kandagatla 2013-07-15  874  	if (locked)
47d4dfd9acb737 Thomas Gleixner     2023-09-14 @875  		uart_port_unlock_irqrestore(port, flags);
c4b058560762ec Srinivas Kandagatla 2013-07-15  876  }
c4b058560762ec Srinivas Kandagatla 2013-07-15  877  

:::::: The code at line 875 was first introduced by commit
:::::: 47d4dfd9acb7375ead238bf85aceff94999e956f serial: st-asc: Use port lock wrappers

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
