Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0CA3C3437
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Oct 2026 05:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791608683; cv=none; b=TW7uz5hMJjQ857uaiGl1NFYp7S2smizOAYz/2UIeQ97QWzV1xObkvxDC+M4+tlQR06fOElX/+GjATjXK6oBmwu7hMU5FA2B7FRiW6q8bu0BZBJRHMIWrl5HjMiLGlPGyj+E10pDewKd+aysABSG9RP1kd8ceiAI6lSxDXRkFocs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791608683; c=relaxed/simple;
	bh=qY3NoPKts59Z83zB8qBbpYrNibGhn1lLQiGwaVWl/Yg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zqv6hvhU6EIrfFfWdGKOyi4NKd9Gloi1mPM7GHvdrp1HVm+8j59pJDSpI5+Kg2S4gNKCC0y24/ha9bomW26v6LkPPnVOeUQ6/crot3qFUCtbihomGqboukWWFlBvxVrPXJ9gOugqKpv/uwYh9NGaMUfAUU7ebjq92dSHggP42/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuyuFqRf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuyuFqRf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791608681; x=1823144681;
  h=date:from:to:cc:subject:message-id;
  bh=qY3NoPKts59Z83zB8qBbpYrNibGhn1lLQiGwaVWl/Yg=;
  b=SuyuFqRf3bJAU+BJFLDQg9FWWJV6vYz/gvFrCgc1KdT5t5fX6ZQm8gBK
   jaTMGCDVrQJvyTpVhyo8UJb3p2B4/Oqo1G6Atkeon7gYwIC8JaVVmuEEG
   sBnMUGwZomIqjyOcFM/Gifyr5mTBMBL1Zn72eFqTTgGbjX4diwRpTYRyO
   40G/WOzshfnM19kcvBrXyvIx29ZoXLd6WLq3BnoyrzN2zZ2MLAUCmAzZN
   P3HvvOXut0/lFHsxZ+7X+5dVDv2vX/QdMqP5rBvqbOBFHn+ooIgOvFC9Q
   DiHYJYbOCzEh+ofbfBZPDhDEqHyd68E4qSJ+FSvRQgu/HkpY58ELw9GJU
   Q==;
X-CSE-ConnectionGUID: NS5D4gLmSBaUU31qvCxeWg==
X-CSE-MsgGUID: njymqdQFSmmIGNx/bodvpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="398633"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="398633"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 22:04:40 -0700
X-CSE-ConnectionGUID: DW5YxdvTToGBuGo7QmiU8Q==
X-CSE-MsgGUID: Hu5ial34SPmEOUCsfW81AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="473315"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Oct 2026 22:04:39 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFPG8-000000007Zt-2jpS;
	Sat, 10 Oct 2026 05:04:36 +0000
Date: Sat, 10 Oct 2026 07:04:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tty/amiserial.c:456 rs_startup() warn: missing error
 code 'retval'
Message-ID: <202610100610.G565RJsp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

Hi Josh,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
commit: 845c09e4744f111eae894ad3b67a369bb43d50fb tty: amiserial: Fix namespace collision and startup() section placement with -ffunction-sections
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: m68k-randconfig-r2201-20261010 (https://download.01.org/0day-ci/archive/20261010/202610100610.G565RJsp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 845c09e4744f ("tty: amiserial: Fix namespace collision and startup() section placement with -ffunction-sections")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610100610.G565RJsp-lkp@intel.com/

New smatch warnings:
drivers/tty/amiserial.c:456 rs_startup() warn: missing error code 'retval'

Old smatch warnings:
drivers/tty/amiserial.c:343 check_modem_status() error: we previously assumed 'port->tty' could be null (see line 338)
drivers/tty/amiserial.c:687 change_speed() warn: inconsistent indenting

vim +/retval +456 drivers/tty/amiserial.c

^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  425  
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  426  /*
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  427   * -------------------------------------------------------------------
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  428   * Here ends the serial interrupt routines.
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  429   * -------------------------------------------------------------------
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  430   */
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  431  
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  432  /*
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  433   * ---------------------------------------------------------------
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  434   * Low level utility subroutines for the serial driver:  routines to
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  435   * figure out the appropriate timeout for an interrupt chain, routines
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  436   * to initialize and startup a serial port, and routines to shutdown a
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  437   * serial port.  Useful stuff like that.
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  438   * ---------------------------------------------------------------
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  439   */
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  440  
845c09e4744f111 drivers/tty/amiserial.c  Josh Poimboeuf 2025-11-20  441  static int rs_startup(struct tty_struct *tty, struct serial_state *info)
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  442  {
01bd730d92bd002 drivers/tty/amiserial.c  Jiri Slaby     2012-03-05  443  	struct tty_port *port = &info->tport;
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  444  	unsigned long flags;
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  445  	int	retval=0;
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  446  	unsigned long page;
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  447  
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  448  	page = get_zeroed_page(GFP_KERNEL);
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  449  	if (!page)
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  450  		return -ENOMEM;
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  451  
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  452  	local_irq_save(flags);
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  453  
d41861ca19c9e96 drivers/tty/amiserial.c  Peter Hurley   2016-04-09  454  	if (tty_port_initialized(port)) {
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  455  		free_page(page);
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16 @456  		goto errout;
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  457  	}
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  458  
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  459  	if (info->xmit.buf)
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  460  		free_page(page);
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  461  	else
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  462  		info->xmit.buf = (unsigned char *) page;
^1da177e4c3f415 drivers/char/amiserial.c Linus Torvalds 2005-04-16  463  

:::::: The code at line 456 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
