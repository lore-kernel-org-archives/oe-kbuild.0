Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887A835E551
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 15:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405922; cv=none; b=fC0HSjHqvHuB2cYeS0N9ZkPSTAjOTZj87CAqNfZPjl1y3hRe8X+Wc1T+l0T1+QmeIcGrePvQY2H3vd0zqWbtOuaHO4xiCT4zEyCpbk2V0gJJpOCDNZM2m+KM2f9aBX9wQowWEwMV/d0s9L+ANG5xiEqxUljDEV8jqFKwJ4aDn2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405922; c=relaxed/simple;
	bh=zkDXNQZGlhq/1T4fdh2Jb+yggzldYx81Ee2Ro1AvHxQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=htkid45+rmIX+wU5dNPHV5SdVbW2LtYmUGpXONy8NU0mFnzLF+w4rCjY+A7bhKcEoUd+B0/Fk1TFok7wvKfwgKa9LxU/QAc4jzIfTlW3ZJnmabH1orEncHRCwW+LwxFcLb1qOevtkU+wYl77lqKDsKINUIWzKleYyn2OyuYMsxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kkk14ynl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kkk14ynl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768405919; x=1799941919;
  h=date:from:to:cc:subject:message-id;
  bh=zkDXNQZGlhq/1T4fdh2Jb+yggzldYx81Ee2Ro1AvHxQ=;
  b=Kkk14ynlz0g0TviMO+s1Vl0k4N82fNdbYfDXMDatqxXD359flMLUisFG
   jRl2DdpL0Y2qaO1xQW4hO2GJcjslAnm+08NjKK6G0XCxE7jF+24eceB9u
   bZo4y+LsN0fMXbeEszsWirU4i4l44tIYO1hwiit2gL+wWgMjfzre57ZmG
   E/3Rjcik/9Unfw/9WwAe7GPEixcskqEXygpB7xoe08yPM17k3iUxPU4Fu
   yAjNY0r6ktg3p9mqeGV9x9g49jev9A7nE3dAjRZCbo/Sxq/tU8rG3bCSb
   C3ZELZ6rCDI1qf7NG6R3peMnCyWHyuT0RkdbrnoK3P9pRscx5FO7dJNMj
   g==;
X-CSE-ConnectionGUID: YDuf7bHsSYiuLv964nUSag==
X-CSE-MsgGUID: lADzEQhMRQy4G2zQFKkksA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92376964"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="92376964"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 07:51:58 -0800
X-CSE-ConnectionGUID: HddyV0V+TaOLttmTiOVvpg==
X-CSE-MsgGUID: HW+FoOCVT1WNrN5OdAA9xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="203845862"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Jan 2026 07:51:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg3A2-00000000GZq-1vJr;
	Wed, 14 Jan 2026 15:51:54 +0000
Date: Wed, 14 Jan 2026 23:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tty/amiserial.c:456 rs_startup() warn: missing error
 code 'retval'
Message-ID: <202601142357.wl3rZxBW-lkp@intel.com>
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
head:   c537e12daeecaecdcd322c56a5f70659d2de7bde
commit: 845c09e4744f111eae894ad3b67a369bb43d50fb tty: amiserial: Fix namespace collision and startup() section placement with -ffunction-sections
date:   8 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 weeks ago
config: m68k-randconfig-r072-20260114 (https://download.01.org/0day-ci/archive/20260114/202601142357.wl3rZxBW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601142357.wl3rZxBW-lkp@intel.com/

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
