Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42F736D512
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 23:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763854756; cv=none; b=RNaW6lnt3efxjDTI/bf8mvWSiIOH9rHy9a64+N3S25r5iqY88FXGADLNpDAeh+VsT0YYe8HudgejBezB78aUj0ljoHp4J1LjQzL5K6D4SACte8R/7OGT9u0mjgOqvvv28ELuUQNqm39zcmisuhuzecQWWfywmh0BrI5bI91axoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763854756; c=relaxed/simple;
	bh=jrmIl/TB5wuC6XJQ9mZsv0TOzED5h7ZfX2pbVpLRKh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qnQdYd7upO390PRBN38FJSPl/qF5L+NCkdQCxTJf4aRGGRL1E377AKPvhvWnnRCQJGcmpNfUX9WFnaLq1cWHm6I7Qb6/7XiCTz1mmECJYJnMhXe1ONZAYlzM4rJTXNjHecYXGBV4YfbPDxsySiV97geK76zB6w7Ib222jNIecz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwpVwlQd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwpVwlQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763854755; x=1795390755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jrmIl/TB5wuC6XJQ9mZsv0TOzED5h7ZfX2pbVpLRKh8=;
  b=SwpVwlQdH64j66Cpqqn7T4VByuR39rj7fMRXO87vUw/sQ8s2hbsB/yLI
   /mi97YpvfxymLusprtwPUncN0Isx8x5J8Lk/I+BbuptAMBNjkwi8Vm1Sj
   F4BmCVsoasKVtXqFN4ObxxcAhaPJwO/ImkgJ4Yd4zsH0gu8ObR1gbQ+uu
   5TUUgdw85Qe0r9hSHEmZtUMFaU6B5NZO+LzRhkzXVUabWLkq+voHcQkYs
   f90UVIIID/L9kVoBxDIP7FiI8wZ4vUrqhsCZD9w6A2b4Cy3diJYsBwUGA
   UTabmMiH7fXiZO6ih32+4ldOUkZQ7dHCvieRw4/vf0dwgAXqSmE0DFI3O
   w==;
X-CSE-ConnectionGUID: OF4pDCEzSdm6q+vxeH2Llg==
X-CSE-MsgGUID: xwKtTUqKTMu2jRQok7L6Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="91388059"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="91388059"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 15:39:14 -0800
X-CSE-ConnectionGUID: p96aDY+lRo6fjRJrThTgag==
X-CSE-MsgGUID: Hawl1yDTQWGy0uRhDSd5Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="192022734"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Nov 2025 15:39:11 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMxC9-0007uL-1Z;
	Sat, 22 Nov 2025 23:39:09 +0000
Date: Sun, 23 Nov 2025 07:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tty:tty-next 26/37] drivers/tty/moxa.c:1044 moxa_board_deinit()
 warn: sleeping in atomic context
Message-ID: <202511230751.YoaUZr5b-lkp@intel.com>
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
CC: linux-serial@vger.kernel.org
TO: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-next
head:   da218406dd50e0ac96bb383de4edd208286efe70
commit: 1c7736dc68d7599e12e6b20c848dfbcbe0d04cdb [26/37] tty: moxa: use guard()s
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: parisc-randconfig-r072-20251123 (https://download.01.org/0day-ci/archive/20251123/202511230751.YoaUZr5b-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511230751.YoaUZr5b-lkp@intel.com/

smatch warnings:
drivers/tty/moxa.c:1044 moxa_board_deinit() warn: sleeping in atomic context

vim +1044 drivers/tty/moxa.c

037182346f09916 drivers/char/moxa.c Jiri Slaby        2008-04-30  1019  
810ab09b2f3a4e9 drivers/char/moxa.c Jiri Slaby        2008-04-30  1020  static void moxa_board_deinit(struct moxa_board_conf *brd)
810ab09b2f3a4e9 drivers/char/moxa.c Jiri Slaby        2008-04-30  1021  {
793be8984fb979a drivers/tty/moxa.c  Jiri Slaby        2012-08-07  1022  	unsigned int a, opened, first_idx;
a8f5cda067e2eee drivers/char/moxa.c Jiri Slaby        2008-04-30  1023  
1c7736dc68d7599 drivers/tty/moxa.c  Jiri Slaby (SUSE  2025-11-19  1024) 	scoped_guard(mutex, &moxa_openlock) {
1c7736dc68d7599 drivers/tty/moxa.c  Jiri Slaby (SUSE  2025-11-19  1025) 		scoped_guard(spinlock_bh, &moxa_lock)
810ab09b2f3a4e9 drivers/char/moxa.c Jiri Slaby        2008-04-30  1026  			brd->ready = 0;
a8f5cda067e2eee drivers/char/moxa.c Jiri Slaby        2008-04-30  1027  
a8f5cda067e2eee drivers/char/moxa.c Jiri Slaby        2008-04-30  1028  		/* pci hot-un-plug support */
a8f5cda067e2eee drivers/char/moxa.c Jiri Slaby        2008-04-30  1029  		for (a = 0; a < brd->numPorts; a++)
d41861ca19c9e96 drivers/tty/moxa.c  Peter Hurley      2016-04-09  1030  			if (tty_port_initialized(&brd->ports[a].port))
aa27a094e2c2e0c drivers/tty/moxa.c  Jiri Slaby        2013-03-07  1031  				tty_port_tty_hangup(&brd->ports[a].port, false);
aa27a094e2c2e0c drivers/tty/moxa.c  Jiri Slaby        2013-03-07  1032  
191c5f10275cfbb drivers/tty/moxa.c  Jiri Slaby        2012-11-15  1033  		for (a = 0; a < MAX_PORTS_PER_BOARD; a++)
191c5f10275cfbb drivers/tty/moxa.c  Jiri Slaby        2012-11-15  1034  			tty_port_destroy(&brd->ports[a].port);
aa27a094e2c2e0c drivers/tty/moxa.c  Jiri Slaby        2013-03-07  1035  
a8f5cda067e2eee drivers/char/moxa.c Jiri Slaby        2008-04-30  1036  		while (1) {
a8f5cda067e2eee drivers/char/moxa.c Jiri Slaby        2008-04-30  1037  			opened = 0;
a8f5cda067e2eee drivers/char/moxa.c Jiri Slaby        2008-04-30  1038  			for (a = 0; a < brd->numPorts; a++)
d41861ca19c9e96 drivers/tty/moxa.c  Peter Hurley      2016-04-09  1039  				if (tty_port_initialized(&brd->ports[a].port))
a8f5cda067e2eee drivers/char/moxa.c Jiri Slaby        2008-04-30  1040  					opened++;
a8f5cda067e2eee drivers/char/moxa.c Jiri Slaby        2008-04-30  1041  			if (!opened)
a8f5cda067e2eee drivers/char/moxa.c Jiri Slaby        2008-04-30  1042  				break;
1c7736dc68d7599 drivers/tty/moxa.c  Jiri Slaby (SUSE  2025-11-19  1043) 			mutex_unlock(&moxa_openlock);
a8f5cda067e2eee drivers/char/moxa.c Jiri Slaby        2008-04-30 @1044  			msleep(50);
a8f5cda067e2eee drivers/char/moxa.c Jiri Slaby        2008-04-30  1045  			mutex_lock(&moxa_openlock);
a8f5cda067e2eee drivers/char/moxa.c Jiri Slaby        2008-04-30  1046  		}
1c7736dc68d7599 drivers/tty/moxa.c  Jiri Slaby (SUSE  2025-11-19  1047) 	}
a8f5cda067e2eee drivers/char/moxa.c Jiri Slaby        2008-04-30  1048  
793be8984fb979a drivers/tty/moxa.c  Jiri Slaby        2012-08-07  1049  	first_idx = (brd - moxa_boards) * MAX_PORTS_PER_BOARD;
793be8984fb979a drivers/tty/moxa.c  Jiri Slaby        2012-08-07  1050  	for (a = 0; a < brd->numPorts; a++)
793be8984fb979a drivers/tty/moxa.c  Jiri Slaby        2012-08-07  1051  		tty_unregister_device(moxaDriver, first_idx + a);
793be8984fb979a drivers/tty/moxa.c  Jiri Slaby        2012-08-07  1052  
810ab09b2f3a4e9 drivers/char/moxa.c Jiri Slaby        2008-04-30  1053  	iounmap(brd->basemem);
810ab09b2f3a4e9 drivers/char/moxa.c Jiri Slaby        2008-04-30  1054  	brd->basemem = NULL;
810ab09b2f3a4e9 drivers/char/moxa.c Jiri Slaby        2008-04-30  1055  	kfree(brd->ports);
810ab09b2f3a4e9 drivers/char/moxa.c Jiri Slaby        2008-04-30  1056  }
810ab09b2f3a4e9 drivers/char/moxa.c Jiri Slaby        2008-04-30  1057  

:::::: The code at line 1044 was first introduced by commit
:::::: a8f5cda067e2eeefe49fe386caf0f61fc5c825e0 Char: moxa, rework open/close

:::::: TO: Jiri Slaby <jirislaby@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
