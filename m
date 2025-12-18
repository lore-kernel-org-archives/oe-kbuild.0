Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D1732E72D
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 12:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766061128; cv=none; b=C1ZzByL9lnzfUmvKypSCQjZUwM3Zmhie9JJ/oP28HBMjD1kC9xfiNr9YgjzZgLNM7Z4xkvvPD7iexfhRXtUVNQlMBWwzoWNv0K94UlQRD9BlW9Cxdqg3kmz2tdabuaoo2u+wj48rg1jvRSVbUoIMJbGIUfrMu8hUzMTFza5fnzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766061128; c=relaxed/simple;
	bh=oJYAgYY25chF+6AHkohjYpbjPwyP3HIMWq/eZHwtpT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DEDpa7SaOWee/RIkvLY7uVK7MnRILL/KUUqTzHG/Q5OHTsO7ez8/cSvffpKXV0f1wDGHBeXdqW08h15kUvcurUvHiLM4G5YoMRpIGzdCw1WBzi6HBox4huKbHf731ZdHJltBbfXh6xa2PRz5uEQE5v7a+p5ze5p/Ff7rBTpbQnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJGfYQVb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJGfYQVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766061125; x=1797597125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oJYAgYY25chF+6AHkohjYpbjPwyP3HIMWq/eZHwtpT0=;
  b=LJGfYQVbF3u5hvPt3ozvgtQHn49oLK4bNd8bwTOV+VSBi/fpqIiBVcZx
   s+JEeoROk7MvxF8rJ7sE/XrGV3xOi9e5jT4RpRn3KN5mGqfqPfarN0rAh
   DF51lvJhV8EKuEmSPTUjfqIfIOkNiefodXvp6q9r2KMY+KEzfKgVgWxcT
   V8TxXTDwSIuqPtnucFvaa3zLDBFfQmUa46gK0qCCNH+Us41lyHoOEGCq6
   JS8LpvwD9C1B72qGACUP/S6u1kSG5EZRaKGOY3Op1SlWXhOlEp1CMDtIU
   IZOL6jW5zQw8AxE8OeZS5LEfjv0XfBht7IGf3W1vDtvNARHENJ4BPVVwU
   w==;
X-CSE-ConnectionGUID: KT0PaJmjSyGxoZ2mgLtacA==
X-CSE-MsgGUID: OUVJFZlwRyOVZHahW29mIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="55587787"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="55587787"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 04:32:02 -0800
X-CSE-ConnectionGUID: /+eHhStlTlmULzO3qi7mWg==
X-CSE-MsgGUID: 1VXzYK/KQ0uAGfS57JUucw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="203469731"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Dec 2025 04:32:01 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWDAl-0000000024H-11dK;
	Thu, 18 Dec 2025 12:31:59 +0000
Date: Thu, 18 Dec 2025 20:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:ctx-analysis/dev 8/36]
 drivers/tty/serial/fsl_linflexuart.c:657 linflex_console_write() error:
 uninitialized symbol 'flags'.
Message-ID: <202512182003.gapcsWar-lkp@intel.com>
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
head:   5950df0508b3b151758cb1d1d965713d93200c47
commit: 5f1642c5f2075d5dc42bfc1f5978ce33356417fa [8/36] locking/rwlock, spinlock: Support Clang's context analysis
:::::: branch date: 21 hours ago
:::::: commit date: 22 hours ago
config: nios2-randconfig-r073-20251218 (https://download.01.org/0day-ci/archive/20251218/202512182003.gapcsWar-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512182003.gapcsWar-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/fsl_linflexuart.c:657 linflex_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/digicolor-usart.c:408 digicolor_uart_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/uartlite.c:523 ulite_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/fsl_lpuart.c:1336 lpuart_timer_func() error: uninitialized symbol 'flags'.

Old smatch warnings:
drivers/tty/serial/fsl_linflexuart.c:613 linflex_earlycon_putchar() error: we previously assumed 'earlycon_buf.content' could be null (see line 601)
drivers/tty/serial/fsl_linflexuart.c:746 linflex_console_setup() error: we previously assumed 'earlycon_port' could be null (see line 720)

vim +/flags +657 drivers/tty/serial/fsl_linflexuart.c

09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  639  
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  640  static void
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  641  linflex_console_write(struct console *co, const char *s, unsigned int count)
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  642  {
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  643  	struct uart_port *sport = linflex_ports[co->index];
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  644  	unsigned long flags;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  645  	int locked = 1;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  646  
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  647  	if (sport->sysrq)
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  648  		locked = 0;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  649  	else if (oops_in_progress)
7c6725ffd58133 Thomas Gleixner      2023-09-14  650  		locked = uart_port_trylock_irqsave(sport, &flags);
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  651  	else
7c6725ffd58133 Thomas Gleixner      2023-09-14  652  		uart_port_lock_irqsave(sport, &flags);
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  653  
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  654  	linflex_string_write(sport, s, count);
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  655  
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  656  	if (locked)
7c6725ffd58133 Thomas Gleixner      2023-09-14 @657  		uart_port_unlock_irqrestore(sport, flags);
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  658  }
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  659  

:::::: The code at line 657 was first introduced by commit
:::::: 7c6725ffd58133536b372bdb3559e7da0c89e492 serial: linflexuart: Use port lock wrappers

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
