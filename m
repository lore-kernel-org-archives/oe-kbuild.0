Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF52C221F1F
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678132; cv=none; b=oU2hN7tq8fmtWrEhNbsznBNHZ8unIAFQm3KZIuPcg/n5pFcMk31Lvie7Z/nxD2WH9bD3GdQjKevqoN6BZTSXwXyLa5fS5NdYtlUznIC1FUvcZ7oZlL62QhnxhlBqr/OWoFHeYNxql1xv83GlRFYJ+P2NRuZrskgQT71GlBApmBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678132; c=relaxed/simple;
	bh=xREIJLKh+3ysG8SFBjgysa7mJHrmJXladgghnX8njL4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EEct+PO4tvmnGldTI4F2NqNIStC0+Ysppb1W2zw9ooxZ0X1LdvPxXvs8Tdi9LUuecaaPV7+k54YFY8IDogd7AKIYBai+a2ooS8NuLH00bw2mWutA7HrGeIyHFiiuYAgaM055dp0HL7Mn/gmx29U6n5P8j6JP98ek75457/qaLY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lTw9URC8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTw9URC8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778678130; x=1810214130;
  h=date:from:to:cc:subject:message-id;
  bh=xREIJLKh+3ysG8SFBjgysa7mJHrmJXladgghnX8njL4=;
  b=lTw9URC8+LW9/dtauPwL83dMRkmLF37Wdi3PrXBz5pRuOBPwRx0WxGIn
   3yo8phpNSx3ZttjTO3SVeDO99P2NojZT0QJS0zW4iLz7Djs2d40s1+BLs
   XtNO5dn+GSp81mp9s5P6lAHRSsVGJdTzo/jHyxo4eyFCkDRT3jwzdkrt7
   yS1O/42fC7N/reShc3gryM2nzM+71/SZrUyLnr3GCUHn2xd2V4o1UVTFV
   G8OZhawiN/Wj73NTT9O5RGKyPXziMyTVPxnAq2kFz9X6KFSaMs59LuvlM
   D1SWV0npxrZWbBcPupze+epQNhi0I3PEqiYWFpcatw4Ou82/IMunfuugi
   g==;
X-CSE-ConnectionGUID: 2qUUTSN6QJOCu2oWFqDJ1A==
X-CSE-MsgGUID: PcEgLFW5TZWGfG08vvgqxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79318886"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79318886"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 06:15:29 -0700
X-CSE-ConnectionGUID: sBziHa5OQ/Ota8sysqYyog==
X-CSE-MsgGUID: PQZbYtTtSgmbyyS+krrPhA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 May 2026 06:15:28 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN9Qr-0000000049V-2r1t;
	Wed, 13 May 2026 13:15:25 +0000
Date: Wed, 13 May 2026 21:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tty/amiserial.c:456 rs_startup() warn: missing error
 code 'retval'
Message-ID: <202605132134.mBpVmwOp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

Hi Josh,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1d5dcaa3bd65f2e8c9baa14a393d3a2dc5db7524
commit: 845c09e4744f111eae894ad3b67a369bb43d50fb tty: amiserial: Fix namespace collision and startup() section placement with -ffunction-sections
date:   6 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 6 months ago
config: m68k-randconfig-r071-20260513 (https://download.01.org/0day-ci/archive/20260513/202605132134.mBpVmwOp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 845c09e4744f ("tty: amiserial: Fix namespace collision and startup() section placement with -ffunction-sections")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605132134.mBpVmwOp-lkp@intel.com/

New smatch warnings:
drivers/tty/amiserial.c:456 rs_startup() warn: missing error code 'retval'

Old smatch warnings:
drivers/tty/amiserial.c:343 check_modem_status() error: we previously assumed 'port->tty' could be null (see line 338)
drivers/tty/amiserial.c:687 change_speed() warn: inconsistent indenting

vim +/retval +456 drivers/tty/amiserial.c

^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  425  
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  426  /*
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  427   * -------------------------------------------------------------------
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  428   * Here ends the serial interrupt routines.
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  429   * -------------------------------------------------------------------
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  430   */
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  431  
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  432  /*
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  433   * ---------------------------------------------------------------
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  434   * Low level utility subroutines for the serial driver:  routines to
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  435   * figure out the appropriate timeout for an interrupt chain, routines
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  436   * to initialize and startup a serial port, and routines to shutdown a
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  437   * serial port.  Useful stuff like that.
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  438   * ---------------------------------------------------------------
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  439   */
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  440  
845c09e4744f11 drivers/tty/amiserial.c  Josh Poimboeuf 2025-11-20  441  static int rs_startup(struct tty_struct *tty, struct serial_state *info)
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  442  {
01bd730d92bd00 drivers/tty/amiserial.c  Jiri Slaby     2012-03-05  443  	struct tty_port *port = &info->tport;
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  444  	unsigned long flags;
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  445  	int	retval=0;
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  446  	unsigned long page;
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  447  
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  448  	page = get_zeroed_page(GFP_KERNEL);
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  449  	if (!page)
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  450  		return -ENOMEM;
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  451  
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  452  	local_irq_save(flags);
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  453  
d41861ca19c9e9 drivers/tty/amiserial.c  Peter Hurley   2016-04-09  454  	if (tty_port_initialized(port)) {
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  455  		free_page(page);
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16 @456  		goto errout;
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  457  	}
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  458  
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  459  	if (info->xmit.buf)
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  460  		free_page(page);
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  461  	else
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  462  		info->xmit.buf = (unsigned char *) page;
^1da177e4c3f41 drivers/char/amiserial.c Linus Torvalds 2005-04-16  463  

:::::: The code at line 456 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
