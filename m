Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D59287246
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 04:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009424; cv=none; b=aeF6TOfcNU7c+rlUongKDhRaPWVURs5VqTHqsnKsLl9/8LerGQmEtqN3Hbcz5Gmq/byGx5bo+TaanxhUGnuh+EkadtlOyESLZa6drgIPBdAgDTz3O1TUpF1Cjzv43+h0Asm2+CysQOmt2wAPbE+0JS8fBzkVRzhALMNQzZKz5B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009424; c=relaxed/simple;
	bh=toNfXEXW8heWRtPzIC8lFazNNvzq5tXjdmdYxixTnfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QPnuSaSHVXUXpLjMS0yk5nf8DtLalsA5SIIO5n2YHB+matnhUmJnfCZZxjHrRwMIFe7oLVrQeb19HivNVFPZvk1i65VqmY9zexvJzYZ9D5gYfPo4J5rLf2lk1ELFvsH7fnIMPXEiCciRZDWJ8+Z0/dHHwewe/3uz0bG2Tc5IqBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Stm/yqj7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Stm/yqj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009423; x=1794545423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=toNfXEXW8heWRtPzIC8lFazNNvzq5tXjdmdYxixTnfU=;
  b=Stm/yqj73TJITERaP1z3BROWnLuCqK9bvC6XdAuWYOJB91tnyyjQRrKe
   A7qucgvaKVeMCxkyPh1f6uiaFTmX1vit060L7chu68zF8WJqgKgNsInTL
   l9Hmif6G4Gr+yvjI/ErYzlo44mzt4TP2KWyhP3kqktUq9jalA7xjqCeIR
   hih6vdVw5kqyZyq3PPxQifaVyRbsmWlxa8S/o7YtOe+AgkLHrT6Qkisx2
   9aQHYVBgNFUkmVD2M7lgOUpihFn7c9Z5PuUzYD0OkKWeFT4eimIgyL4Rp
   CGMyVh7COIwbH7H5Vc8wdJOJMlOZ53zGy5OV23CtzNvYb5BHLM375bayQ
   Q==;
X-CSE-ConnectionGUID: Aan28OaIQC22Qc39RgvNmQ==
X-CSE-MsgGUID: vVuk7X2lSxC2A0+HgO1mVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="67681463"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="67681463"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:50:22 -0800
X-CSE-ConnectionGUID: Get8AhLRTw6gsR3JmD/g8w==
X-CSE-MsgGUID: pAtT9CgqQqaBNPIwWX6QlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="188653340"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Nov 2025 20:50:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPHm-0004t3-2o;
	Thu, 13 Nov 2025 04:50:18 +0000
Date: Thu, 13 Nov 2025 12:49:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:ctx-analysis/dev 23/35] drivers/tty/serial/lpc32xx_hs.c:148
 lpc32xx_hsuart_console_write() error: uninitialized symbol 'flags'.
Message-ID: <202511122112.A6iMxAab-lkp@intel.com>
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
head:   a5e647f51df9e4ab2bb1f4321e95362a72d2a5e1
commit: e6405909f26757d5cf56346039e501cc194e3b9f [23/35] compiler-context-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: microblaze-randconfig-r072-20251112 (https://download.01.org/0day-ci/archive/20251112/202511122112.A6iMxAab-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511122112.A6iMxAab-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/lpc32xx_hs.c:148 lpc32xx_hsuart_console_write() error: uninitialized symbol 'flags'.
mm/slub.c:3460 alloc_single_from_new_slab() error: uninitialized symbol 'flags'.
mm/slub.c:3530 get_partial_node() error: uninitialized symbol 'flags'.
drivers/tty/serial/sunplus-uart.c:526 sunplus_console_write() error: uninitialized symbol 'flags'.

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: uninitialized symbol 'sp'.

vim +/flags +148 drivers/tty/serial/lpc32xx_hs.c

596f93f50e2d1a Roland Stigge             2012-06-11  130  
596f93f50e2d1a Roland Stigge             2012-06-11  131  static void lpc32xx_hsuart_console_write(struct console *co, const char *s,
596f93f50e2d1a Roland Stigge             2012-06-11  132  					 unsigned int count)
596f93f50e2d1a Roland Stigge             2012-06-11  133  {
596f93f50e2d1a Roland Stigge             2012-06-11  134  	struct lpc32xx_hsuart_port *up = &lpc32xx_hs_ports[co->index];
596f93f50e2d1a Roland Stigge             2012-06-11  135  	unsigned long flags;
596f93f50e2d1a Roland Stigge             2012-06-11  136  	int locked = 1;
596f93f50e2d1a Roland Stigge             2012-06-11  137  
596f93f50e2d1a Roland Stigge             2012-06-11  138  	touch_nmi_watchdog();
6ba52968601ad3 Sebastian Andrzej Siewior 2024-03-01  139  	if (oops_in_progress)
6ba52968601ad3 Sebastian Andrzej Siewior 2024-03-01  140  		locked = uart_port_trylock_irqsave(&up->port, &flags);
596f93f50e2d1a Roland Stigge             2012-06-11  141  	else
6ba52968601ad3 Sebastian Andrzej Siewior 2024-03-01  142  		uart_port_lock_irqsave(&up->port, &flags);
596f93f50e2d1a Roland Stigge             2012-06-11  143  
596f93f50e2d1a Roland Stigge             2012-06-11  144  	uart_console_write(&up->port, s, count, lpc32xx_hsuart_console_putchar);
596f93f50e2d1a Roland Stigge             2012-06-11  145  	wait_for_xmit_empty(&up->port);
596f93f50e2d1a Roland Stigge             2012-06-11  146  
596f93f50e2d1a Roland Stigge             2012-06-11  147  	if (locked)
6ba52968601ad3 Sebastian Andrzej Siewior 2024-03-01 @148  		uart_port_unlock_irqrestore(&up->port, flags);
596f93f50e2d1a Roland Stigge             2012-06-11  149  }
596f93f50e2d1a Roland Stigge             2012-06-11  150  

:::::: The code at line 148 was first introduced by commit
:::::: 6ba52968601ad3851d0b1da7dbe227b47a7dc918 serial: lpc32xx_hs: Use uart_prepare_sysrq_char() to handle sysrq.

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
