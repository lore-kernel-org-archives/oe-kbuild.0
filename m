Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288513D4139
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768996900; cv=none; b=fzMtFKLpUTgerC0Hd9r95DiXEDSRHlFTLUn2gUloqhzOYU+L2yQMP+v6opxd2WRpyUuQLN91AilMse65e8jUW27d8m/GjfWZGDvRa3fOHTNIwM+FJPP7sxFBc51N8sC7yqUwODxl6nCOSjmDL2IFqCO08dN3nwtcAegepTXEmkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768996900; c=relaxed/simple;
	bh=kKcQvhZF5N6dtLKJgOOkc4WzDE+LlR/uBk8bX14Xgb4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=coyQOPYDfDVkqoqNkhe5zyzbFxHW8Ng2Gzss/KFuThH2qCKwgipj3+sLN8Z4slNqMY+pPAq0UdIPzn6zzDgbniQ0xTMBTzl1z+sxQ30qbgV/buV4O0knwoUzvREv/k9EB9VqKSFWX2qFxKtxzRrvTlKQYudjDaFLyDhpHF+5lq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BudYtDAS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BudYtDAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768996897; x=1800532897;
  h=date:from:to:cc:subject:message-id;
  bh=kKcQvhZF5N6dtLKJgOOkc4WzDE+LlR/uBk8bX14Xgb4=;
  b=BudYtDASid62Zj/M+7EkK5eePBg769rcjgyaz6CyrBgKrTlNec307JKZ
   Uifwps8G4UgGnuxKg8/0JrMLzHLjPrVDD5XNTW6XXcblf7nvDCgwXXr06
   FpSzVtLFiu4yU9XPswjT0JO/Vi++6L76LrjANJN30kmMkqvelErFdDSC8
   IsLPezW2Xr8vD+N5fQ1ppTFw9xWwJ11OXAfI3mGBbiGviXE4V2S3n+LJD
   ixUJUhmG5AviAu4mkra3g1ei3DtNuEm3A3MaZN0QRAzAmuJfGy8eOXnDt
   hlJevvtcP/iTdPU7BLF2SZ7ohcU3eYqMEIOWSuF6m5GanJx3cWFg5/z7r
   w==;
X-CSE-ConnectionGUID: x4E0XYvYRw+s1NLOM8cKtA==
X-CSE-MsgGUID: h8zW8INBS8qBHIdWuPAIcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69239019"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="69239019"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 04:01:35 -0800
X-CSE-ConnectionGUID: flHrbM+uSTOouwma+3KH9Q==
X-CSE-MsgGUID: LRMD1AtqS4G4J3DD0QVtAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="210873290"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jan 2026 04:01:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viWtw-00000000RDN-0k2i;
	Wed, 21 Jan 2026 12:01:32 +0000
Date: Wed, 21 Jan 2026 20:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 27/43] drivers/tty/serial/sunhv.c:478
 sunhv_console_write_paged() error: uninitialized symbol 'flags'.
Message-ID: <202601211945.39NbF7Jl-lkp@intel.com>
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
:::::: branch date: 11 days ago
:::::: commit date: 2 weeks ago
config: sparc64-randconfig-r071-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211945.39NbF7Jl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601211945.39NbF7Jl-lkp@intel.com/

smatch warnings:
drivers/tty/serial/sunhv.c:478 sunhv_console_write_paged() error: uninitialized symbol 'flags'.
drivers/tty/serial/sunhv.c:511 sunhv_console_write_bychar() error: uninitialized symbol 'flags'.

vim +/flags +478 drivers/tty/serial/sunhv.c

c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  437  
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  438  static void sunhv_console_write_paged(struct console *con, const char *s, unsigned n)
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  439  {
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  440  	struct uart_port *port = sunhv_port;
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  441  	unsigned long flags;
f3c681c028846b drivers/serial/sunhv.c     David S. Miller 2007-07-15  442  	int locked = 1;
f3c681c028846b drivers/serial/sunhv.c     David S. Miller 2007-07-15  443  
e58e241c178885 drivers/tty/serial/sunhv.c David Miller    2014-03-04  444  	if (port->sysrq || oops_in_progress)
71007c5e7851e8 drivers/tty/serial/sunhv.c Thomas Gleixner 2023-09-14  445  		locked = uart_port_trylock_irqsave(port, &flags);
e58e241c178885 drivers/tty/serial/sunhv.c David Miller    2014-03-04  446  	else
71007c5e7851e8 drivers/tty/serial/sunhv.c Thomas Gleixner 2023-09-14  447  		uart_port_lock_irqsave(port, &flags);
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  448  
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  449  	while (n > 0) {
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  450  		unsigned long ra = __pa(con_write_page);
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  451  		unsigned long page_bytes;
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  452  		unsigned int cpy = fill_con_write_page(s, n,
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  453  						       &page_bytes);
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  454  
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  455  		n -= cpy;
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  456  		s += cpy;
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  457  		while (page_bytes > 0) {
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  458  			unsigned long written;
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  459  			int limit = 1000000;
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  460  
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  461  			while (limit--) {
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  462  				unsigned long stat;
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  463  
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  464  				stat = sun4v_con_write(ra, page_bytes,
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  465  						       &written);
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  466  				if (stat == HV_EOK)
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  467  					break;
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  468  				udelay(1);
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  469  			}
52e3632ea603ef drivers/serial/sunhv.c     Roel Kluin      2009-06-22  470  			if (limit < 0)
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  471  				break;
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  472  			page_bytes -= written;
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  473  			ra += written;
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  474  		}
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  475  	}
f3c681c028846b drivers/serial/sunhv.c     David S. Miller 2007-07-15  476  
f3c681c028846b drivers/serial/sunhv.c     David S. Miller 2007-07-15  477  	if (locked)
71007c5e7851e8 drivers/tty/serial/sunhv.c Thomas Gleixner 2023-09-14 @478  		uart_port_unlock_irqrestore(port, flags);
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  479  }
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  480  
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  481  static inline void sunhv_console_putchar(struct uart_port *port, char c)
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  482  {
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  483  	int limit = 1000000;
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  484  
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  485  	while (limit-- > 0) {
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  486  		long status = sun4v_con_putchar(c);
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  487  		if (status == HV_EOK)
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  488  			break;
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  489  		udelay(1);
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  490  	}
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  491  }
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  492  
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  493  static void sunhv_console_write_bychar(struct console *con, const char *s, unsigned n)
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  494  {
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  495  	struct uart_port *port = sunhv_port;
c7754d465b1fea drivers/serial/sunhv.c     David S. Miller 2007-05-15  496  	unsigned long flags;
f3c681c028846b drivers/serial/sunhv.c     David S. Miller 2007-07-15  497  	int i, locked = 1;
f3c681c028846b drivers/serial/sunhv.c     David S. Miller 2007-07-15  498  
e58e241c178885 drivers/tty/serial/sunhv.c David Miller    2014-03-04  499  	if (port->sysrq || oops_in_progress)
71007c5e7851e8 drivers/tty/serial/sunhv.c Thomas Gleixner 2023-09-14  500  		locked = uart_port_trylock_irqsave(port, &flags);
e58e241c178885 drivers/tty/serial/sunhv.c David Miller    2014-03-04  501  	else
71007c5e7851e8 drivers/tty/serial/sunhv.c Thomas Gleixner 2023-09-14  502  		uart_port_lock_irqsave(port, &flags);
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  503  
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  504  	for (i = 0; i < n; i++) {
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  505  		if (*s == '\n')
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  506  			sunhv_console_putchar(port, '\r');
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  507  		sunhv_console_putchar(port, *s++);
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  508  	}
f3c681c028846b drivers/serial/sunhv.c     David S. Miller 2007-07-15  509  
f3c681c028846b drivers/serial/sunhv.c     David S. Miller 2007-07-15  510  	if (locked)
71007c5e7851e8 drivers/tty/serial/sunhv.c Thomas Gleixner 2023-09-14 @511  		uart_port_unlock_irqrestore(port, flags);
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  512  }
02fd473bd4844b drivers/serial/sunhv.c     David S. Miller 2006-02-11  513  

:::::: The code at line 478 was first introduced by commit
:::::: 71007c5e7851e880dc23c141d0708794bc3bbf9e serial: sunhv: Use port lock wrappers

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
