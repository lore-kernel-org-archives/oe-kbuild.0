Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA762F6162
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 22:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765577981; cv=none; b=XGyEVNB530U7qEJzvNrqXI6+qOKLUdfRU844Y0tU34ezWz0H9HZ1FXGTgRpegWStjcoZUtbZYvU7WqFK+sxfy9bPK6NfkKh7xZwC6QhBxPsi6f8jT6ZL0qnEdr/9ODy1+BMYhfFdg53nkLvvV2yGdJJ8fhCmQE0STow++Ytu+MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765577981; c=relaxed/simple;
	bh=2gXoBSzSqAzgbAddISy8uwIaS9UP3zEt00PpoVeeIUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l5gjlrhX+XnaCLc5CJI7GT9ovgoqiHO3HyEEvCyLvx8mVF7VMO53hyGg39VnUaUtdYQRKrkK9FF7MF4ZJJqgGt/K5FnZkFJEKtOpV+wPQVzZhQomzM9q/CW/erdljH6Q3qyzSb9PTaoVJyDnx2s4ecp6ZkVrcfXMbuqZSSAFjbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7hE49q+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7hE49q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765577979; x=1797113979;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2gXoBSzSqAzgbAddISy8uwIaS9UP3zEt00PpoVeeIUI=;
  b=S7hE49q+SCs4wuKCCDmfaO9weM+YVfAuZmMUay+xbgLnUl8KpdPMGAz4
   fhNzGOg/VfU5TvwlkhH3uoGhUqwVZxfSy9cv6UtKTwXu08MXZSHOhjdwF
   /wUdXyp0Xw6s91Mf5f0bRxKpAZGDeQRh6ywnAC3SWwXUbA2KNIdjP9wjX
   3Y3adwWu1+RVz8S16NMXHvR36GSRYDP5XNbJuIk8a8gfyWS0Duvzaz1nP
   A1Y2xsWw3hLEwjRxPbaA/9U4jzzY0C9FljHwX/xIqLeK022utnRJxSV37
   vWOXX7+dETb16o/f/Ol6fdVOASD9G+/0rk1DEUJ2M1IB/r07FpsP+w5V7
   g==;
X-CSE-ConnectionGUID: xU9SITTvSjagVGZxS2d3Ng==
X-CSE-MsgGUID: DknQFpg/QEuWCI+vpUq0rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="77901768"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="77901768"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 14:19:35 -0800
X-CSE-ConnectionGUID: uidl5oejRIKXPtAgTFvjHg==
X-CSE-MsgGUID: MU2BbeBgTMK5mtYPfCBwnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="198016233"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2025 14:19:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUBU3-000000006gr-1ruW;
	Fri, 12 Dec 2025 22:19:31 +0000
Date: Sat, 13 Dec 2025 06:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tty/serial/8250/8250_port.c:2221 serial8250_init_mctrl()
 warn: bitwise AND condition is false here
Message-ID: <202512130625.94kAagsj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 7bdf59c79cf3757fc25c00800f73093cdd6323d4 serial: 8250: extract serial8250_init_mctrl()
date:   6 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 months ago
config: m68k-randconfig-r072-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130625.94kAagsj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130625.94kAagsj-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/8250/8250_port.c:2221 serial8250_init_mctrl() warn: bitwise AND condition is false here

Old smatch warnings:
drivers/tty/serial/8250/8250_port.c:1221 autoconfig_irq() warn: bitwise AND condition is false here
drivers/tty/serial/8250/8250_port.c:1240 autoconfig_irq() warn: bitwise AND condition is false here
drivers/tty/serial/8250/8250_port.c:1261 autoconfig_irq() warn: bitwise AND condition is false here
drivers/tty/serial/8250/8250_port.c:2361 serial8250_do_startup() warn: bitwise AND condition is false here
drivers/tty/serial/8250/8250_port.c:2406 serial8250_do_shutdown() warn: bitwise AND condition is false here

vim +2221 drivers/tty/serial/8250/8250_port.c

a194597c0cd35a Jiri Slaby (SUSE  2025-06-11  2218) 
7bdf59c79cf375 Jiri Slaby (SUSE  2025-06-24  2219) static void serial8250_init_mctrl(struct uart_port *port)
75f8abe8bee53a Jiri Slaby (SUSE  2025-06-11  2220) {
795158691cc024 Jiri Slaby (SUSE  2025-06-11 @2221) 	if (port->flags & UPF_FOURPORT) {
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2222) 		if (!port->irq)
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2223) 			port->mctrl |= TIOCM_OUT1;
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2224) 	} else {
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2225) 		/* Most PC uarts need OUT2 raised to enable interrupts. */
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2226) 		if (port->irq)
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2227) 			port->mctrl |= TIOCM_OUT2;
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2228) 	}
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2229) 
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2230) 	serial8250_set_mctrl(port, port->mctrl);
7bdf59c79cf375 Jiri Slaby (SUSE  2025-06-24  2231) }
7bdf59c79cf375 Jiri Slaby (SUSE  2025-06-24  2232) 

:::::: The code at line 2221 was first introduced by commit
:::::: 795158691cc02488264a59398fc6d8ce930d60ac serial: 8250: extract serial8250_initialize()

:::::: TO: Jiri Slaby (SUSE) <jirislaby@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
