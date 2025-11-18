Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A4F3009C7
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Nov 2025 08:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455687; cv=none; b=E1csca/SVzAC/qxZsF7bSTUdQuOZksqDr8ZZnGq+vbFp2aeodWbs5ARUNlQC6ED62WSk4p39OSgos8dwP7gVZfUAooyRc39kR1RhN0uk1nesnsMq1NQaGhbui6dF6MNAkzqtLUMm+pwcAi59NHv4V1dC2xnmVyKSluD/kLx3Lz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455687; c=relaxed/simple;
	bh=NLTzyaM3Hw+UKIYCQ3VvKfYBLvHU2w8ZuSkhz4o8f44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=huWxxMmqEzbvwCmbsjM1TPwQ/AzoSFeCrmBgQhl//+tSKshLZHswtGn4ZdzN6By8aoTkrq8W2IP6Xaa7rKukin/NCCF17hEG5XB5A36D5+CHbSUSJ3OKiIt2XxNR9OI5dS8SmAmyTsW0FOuOBzW6ta1wkbbAwggAsQEIW0NxfOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OEQXK9NK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OEQXK9NK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763455685; x=1794991685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NLTzyaM3Hw+UKIYCQ3VvKfYBLvHU2w8ZuSkhz4o8f44=;
  b=OEQXK9NKUb/iN11RSD+orBKdJ14w5Tk1/6j99F/5GEtM5mOIx+IKEcpu
   WZ8Tr2kxGUXSEGCw2sIW/vBL+TO5gGqX2euxVJc9HZxmieOhzx7CfpWud
   PNLg89hI9XUIkx1/E/npnzdG16d26SPqpSr78t/UIK6bKRvm1lH4Kl1AC
   ZWQN73aHTsgvxNVueet680801a+vawQbuhoyOQiWxfTdSVZ0RVItzktFq
   e7hza1eNjKtsqwjHMKtRwbFBQYrjregl56K9SGV06kus088EW60triulB
   5cNIohgyktQ15uZsd1upi39DxYQ2988k3in0GhQhlXOvU+6Iv7AXrpNkV
   g==;
X-CSE-ConnectionGUID: OVRGwR/XQjGh2IpyhPYQsA==
X-CSE-MsgGUID: DUF2whvFQSuTriWUIAaT+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76573727"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76573727"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 00:48:02 -0800
X-CSE-ConnectionGUID: obXEVJpYRJSCC2tJWMbSlw==
X-CSE-MsgGUID: u09KhfqPR0yC1a7gE42fcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195615252"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Nov 2025 00:48:02 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLHNX-0001W7-1y;
	Tue, 18 Nov 2025 08:47:59 +0000
Date: Tue, 18 Nov 2025 16:47:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:ctx-analysis/dev 8/35]
 drivers/tty/serial/ma35d1_serial.c:587 ma35d1serial_console_write() error:
 uninitialized symbol 'flags'.
Message-ID: <202511181637.6QISxcYm-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   171c60881ab1f2e223402792a86f1241143252ad
commit: 54cae7211bb4787e86543044548efc1daccddedb [8/35] locking/rwlock, spinlock: Support Clang's context analysis
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: m68k-randconfig-r071-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181637.6QISxcYm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511181637.6QISxcYm-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/ma35d1_serial.c:587 ma35d1serial_console_write() error: uninitialized symbol 'flags'.

Old smatch warnings:
arch/m68k/include/asm/io_no.h:50 __cf_internalio() warn: always true condition '(addr <= 3758096384 + 536870912 - 1) => (0-u32max <= u32max)'

vim +/flags +587 drivers/tty/serial/ma35d1_serial.c

930cbf92db0184 Jacky Huang     2023-06-19  546  
930cbf92db0184 Jacky Huang     2023-06-19  547  /*
930cbf92db0184 Jacky Huang     2023-06-19  548   *  Print a string to the serial port trying not to disturb
930cbf92db0184 Jacky Huang     2023-06-19  549   *  any possible real use of the port...
930cbf92db0184 Jacky Huang     2023-06-19  550   *
930cbf92db0184 Jacky Huang     2023-06-19  551   *  The console_lock must be held when we get here.
930cbf92db0184 Jacky Huang     2023-06-19  552   */
930cbf92db0184 Jacky Huang     2023-06-19  553  static void ma35d1serial_console_write(struct console *co, const char *s, u32 count)
930cbf92db0184 Jacky Huang     2023-06-19  554  {
f0b9d97a77fa8f Andi Shyti      2023-12-04  555  	struct uart_ma35d1_port *up;
930cbf92db0184 Jacky Huang     2023-06-19  556  	unsigned long flags;
930cbf92db0184 Jacky Huang     2023-06-19  557  	int locked = 1;
930cbf92db0184 Jacky Huang     2023-06-19  558  	u32 ier;
930cbf92db0184 Jacky Huang     2023-06-19  559  
f0b9d97a77fa8f Andi Shyti      2023-12-04  560  	if ((co->index < 0) || (co->index >= MA35_UART_NR)) {
6b64f8e360c00f Colin Ian King  2023-12-08  561  		pr_warn("Failed to write on console port %x, out of range\n",
f0b9d97a77fa8f Andi Shyti      2023-12-04  562  			co->index);
f0b9d97a77fa8f Andi Shyti      2023-12-04  563  		return;
f0b9d97a77fa8f Andi Shyti      2023-12-04  564  	}
f0b9d97a77fa8f Andi Shyti      2023-12-04  565  
f0b9d97a77fa8f Andi Shyti      2023-12-04  566  	up = &ma35d1serial_ports[co->index];
f0b9d97a77fa8f Andi Shyti      2023-12-04  567  
930cbf92db0184 Jacky Huang     2023-06-19  568  	if (up->port.sysrq)
930cbf92db0184 Jacky Huang     2023-06-19  569  		locked = 0;
930cbf92db0184 Jacky Huang     2023-06-19  570  	else if (oops_in_progress)
1b42626add3950 Thomas Gleixner 2023-09-14  571  		locked = uart_port_trylock_irqsave(&up->port, &flags);
930cbf92db0184 Jacky Huang     2023-06-19  572  	else
1b42626add3950 Thomas Gleixner 2023-09-14  573  		uart_port_lock_irqsave(&up->port, &flags);
930cbf92db0184 Jacky Huang     2023-06-19  574  
930cbf92db0184 Jacky Huang     2023-06-19  575  	/*
930cbf92db0184 Jacky Huang     2023-06-19  576  	 *  First save the IER then disable the interrupts
930cbf92db0184 Jacky Huang     2023-06-19  577  	 */
930cbf92db0184 Jacky Huang     2023-06-19  578  	ier = serial_in(up, MA35_IER_REG);
930cbf92db0184 Jacky Huang     2023-06-19  579  	serial_out(up, MA35_IER_REG, 0);
930cbf92db0184 Jacky Huang     2023-06-19  580  
930cbf92db0184 Jacky Huang     2023-06-19  581  	uart_console_write(&up->port, s, count, ma35d1serial_console_putchar);
930cbf92db0184 Jacky Huang     2023-06-19  582  
930cbf92db0184 Jacky Huang     2023-06-19  583  	wait_for_xmitr(up);
930cbf92db0184 Jacky Huang     2023-06-19  584  	serial_out(up, MA35_IER_REG, ier);
930cbf92db0184 Jacky Huang     2023-06-19  585  
930cbf92db0184 Jacky Huang     2023-06-19  586  	if (locked)
1b42626add3950 Thomas Gleixner 2023-09-14 @587  		uart_port_unlock_irqrestore(&up->port, flags);
930cbf92db0184 Jacky Huang     2023-06-19  588  }
930cbf92db0184 Jacky Huang     2023-06-19  589  

:::::: The code at line 587 was first introduced by commit
:::::: 1b42626add395027818ad8bfd45f5bdf6e063107 serial: ma35d1: Use port lock wrappers

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
