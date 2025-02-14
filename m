Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA7B264A80
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 17:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739555093; cv=none; b=uxEh9Ex9kBRnh3MF69rxpcOuNWFPwwi0LtIYgC8GbhJnBR9zRr7p2HHcfAN0aUbEvTXNho+FEkl7POxnuRgmlzfMAS4xfkvbHMEdyE7+1zo/KX+WefrpsBfmKWYFL35Q84fART+uU/LNGKuW+KPMLeYIfMFrEs6+ZOF/VbgOC+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739555093; c=relaxed/simple;
	bh=gdX6P0SoQT7e7t3dGxQXKmK7DSUOL3nwdIztP6o307k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rI0VuW9Yo8XOOj2/CV+mzGqig6zdt1FjEXlDdSiiNT7faYaB9bbeHqTBCJutgGm+QP09LJor03qQoE+nBKBi8HxfLxBBkriWLnVTpyxdht0KnuRUqSe8OTVr9gbqtFHLSFHTYEOepLZt4z0hK6JfoYDFBviKZh0HZ+30tjoUW7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kg1PecX/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kg1PecX/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739555092; x=1771091092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gdX6P0SoQT7e7t3dGxQXKmK7DSUOL3nwdIztP6o307k=;
  b=kg1PecX/4cDmoqRThGnhyzhaJWtygxaFr7lyKWJ9qUHoDMewu15cb0j1
   3SzHh7OTYnDeaEsaRpr3qpIHh/Ax6V/21b/OW+2oU2BTZ3Cj0As852mUz
   WTf4fbjtDActBvcCaj6l7+s5Xk19L+xBt9PYa5Ee9WpIaHKb/8SE6RXZc
   R9LaGyyz2XXNF6nTKTGV90O1SdbKJU0SlTRVCjeTL6Zqkg4UTuiFkPyJv
   zw6wrY8z2HVv4PwDMAZXP51I0DYt4Ftf486JkugIb9qf7KU1euaIwZaI7
   sJCuWzwT2eqNPmXCqnv+YYsiAtLU79vDMxJaNIfSYg5RM/l4U5ZdACt8C
   A==;
X-CSE-ConnectionGUID: Ofyflpb6RjOWqkZBGA0NvQ==
X-CSE-MsgGUID: rBRUjEnMT7yBYCAIouOKgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40183729"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40183729"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 09:44:51 -0800
X-CSE-ConnectionGUID: 1DAd8VHBQQmLq1JRd1Aiag==
X-CSE-MsgGUID: Zr0PqxXnTeO5TTlc8YeCww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="113492228"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Feb 2025 09:44:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tizk8-0019yU-1s;
	Fri, 14 Feb 2025 17:44:48 +0000
Date: Sat, 15 Feb 2025 01:44:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 8/26] arch/um/kernel/kmsg_dump.c:53
 kmsg_dumper_stdout() error: uninitialized symbol 'flags'.
Message-ID: <202502150115.sbzAMjJG-lkp@intel.com>
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
commit: 48b99ad277deff4607b8ad80f53a9bdd57bb0055 [8/26] locking/rwlock, spinlock: Support Clang's capability analysis
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: um-randconfig-r073-20250214 (https://download.01.org/0day-ci/archive/20250215/202502150115.sbzAMjJG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502150115.sbzAMjJG-lkp@intel.com/

New smatch warnings:
arch/um/kernel/kmsg_dump.c:53 kmsg_dumper_stdout() error: uninitialized symbol 'flags'.
drivers/tty/serial/bcm63xx_uart.c:724 bcm_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/esp32_acm.c:305 esp32s3_acm_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/fsl_linflexuart.c:657 linflex_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/msm_serial.c:1671 __msm_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/fsl_lpuart.c:2512 lpuart_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/fsl_lpuart.c:2542 lpuart32_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/omap-serial.c:1244 serial_omap_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/pch_uart.c:1581 pch_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/rda-uart.c:607 rda_uart_port_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/sh-sci.c:3132 serial_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/digicolor-usart.c:408 digicolor_uart_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/stm32-usart.c:1956 stm32_usart_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/esp32_uart.c:549 esp32_uart_console_write() error: uninitialized symbol 'flags'.

Old smatch warnings:
drivers/tty/serial/fsl_linflexuart.c:613 linflex_earlycon_putchar() error: we previously assumed 'earlycon_buf.content' could be null (see line 601)
drivers/tty/serial/fsl_linflexuart.c:746 linflex_console_setup() error: we previously assumed 'earlycon_port' could be null (see line 720)
drivers/tty/serial/fsl_lpuart.c:1336 lpuart_timer_func() error: uninitialized symbol 'flags'.
drivers/tty/serial/sh-sci.c:2839 sci_request_port() warn: 'port->mapbase' from __request_region() not released on lines: 2836.

vim +/flags +53 arch/um/kernel/kmsg_dump.c

04a418495e0852 Thomas Meyer    2015-03-28   9  
04a418495e0852 Thomas Meyer    2015-03-28  10  static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
e1a261ba599eec Jocelyn Falempe 2024-07-02  11  				struct kmsg_dump_detail *detail)
04a418495e0852 Thomas Meyer    2015-03-28  12  {
f9f3f02db98bbe John Ogness     2021-03-03  13  	static struct kmsg_dump_iter iter;
fdd2c1f4e2c2e2 John Ogness     2021-03-03  14  	static DEFINE_SPINLOCK(lock);
04a418495e0852 Thomas Meyer    2015-03-28  15  	static char line[1024];
7d7c0568285d6f Andy Shevchenko 2020-02-12  16  	struct console *con;
fdd2c1f4e2c2e2 John Ogness     2021-03-03  17  	unsigned long flags;
04a418495e0852 Thomas Meyer    2015-03-28  18  	size_t len = 0;
12335446e06f1b John Ogness     2022-11-16  19  	int cookie;
04a418495e0852 Thomas Meyer    2015-03-28  20  
3860e7c57fd23e John Ogness     2022-11-16  21  	/*
3860e7c57fd23e John Ogness     2022-11-16  22  	 * If no consoles are available to output crash information, dump
3860e7c57fd23e John Ogness     2022-11-16  23  	 * the kmsg buffer to stdout.
3860e7c57fd23e John Ogness     2022-11-16  24  	 */
3860e7c57fd23e John Ogness     2022-11-16  25  
12335446e06f1b John Ogness     2022-11-16  26  	cookie = console_srcu_read_lock();
12335446e06f1b John Ogness     2022-11-16  27  	for_each_console_srcu(con) {
3860e7c57fd23e John Ogness     2022-11-16  28  		/*
3860e7c57fd23e John Ogness     2022-11-16  29  		 * The ttynull console and disabled consoles are ignored
3860e7c57fd23e John Ogness     2022-11-16  30  		 * since they cannot output. All other consoles are
3860e7c57fd23e John Ogness     2022-11-16  31  		 * expected to output the crash information.
3860e7c57fd23e John Ogness     2022-11-16  32  		 */
3860e7c57fd23e John Ogness     2022-11-16  33  		if (strcmp(con->name, "ttynull") != 0 &&
12335446e06f1b John Ogness     2022-11-16  34  		    (console_srcu_read_flags(con) & CON_ENABLED)) {
7d7c0568285d6f Andy Shevchenko 2020-02-12  35  			break;
e23fe90dec286c Thomas Meyer    2021-01-07  36  		}
e23fe90dec286c Thomas Meyer    2021-01-07  37  	}
12335446e06f1b John Ogness     2022-11-16  38  	console_srcu_read_unlock(cookie);
7d7c0568285d6f Andy Shevchenko 2020-02-12  39  	if (con)
04a418495e0852 Thomas Meyer    2015-03-28  40  		return;
04a418495e0852 Thomas Meyer    2015-03-28  41  
fdd2c1f4e2c2e2 John Ogness     2021-03-03  42  	if (!spin_trylock_irqsave(&lock, flags))
fdd2c1f4e2c2e2 John Ogness     2021-03-03  43  		return;
fdd2c1f4e2c2e2 John Ogness     2021-03-03  44  
f9f3f02db98bbe John Ogness     2021-03-03  45  	kmsg_dump_rewind(&iter);
f9f3f02db98bbe John Ogness     2021-03-03  46  
04a418495e0852 Thomas Meyer    2015-03-28  47  	printf("kmsg_dump:\n");
f9f3f02db98bbe John Ogness     2021-03-03  48  	while (kmsg_dump_get_line(&iter, true, line, sizeof(line), &len)) {
04a418495e0852 Thomas Meyer    2015-03-28  49  		line[len] = '\0';
04a418495e0852 Thomas Meyer    2015-03-28  50  		printf("%s", line);
04a418495e0852 Thomas Meyer    2015-03-28  51  	}
fdd2c1f4e2c2e2 John Ogness     2021-03-03  52  
fdd2c1f4e2c2e2 John Ogness     2021-03-03 @53  	spin_unlock_irqrestore(&lock, flags);
04a418495e0852 Thomas Meyer    2015-03-28  54  }
04a418495e0852 Thomas Meyer    2015-03-28  55  

:::::: The code at line 53 was first introduced by commit
:::::: fdd2c1f4e2c2e2fee1d95d18b4b06bc0d15c368a um: synchronize kmsg_dumper

:::::: TO: John Ogness <john.ogness@linutronix.de>
:::::: CC: Petr Mladek <pmladek@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
