Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361B0346AF1
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Aug 2026 12:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788178621; cv=none; b=EdWynSsMlOBEiRL8Cexf03OYfrUF5qIgVcN9LJdzi3/IiFSFNhRiXai5vEOrark03gaY96SOuAWsWiklC+wwYbYRTqb+exFwdIut88IOTHZmTBg9uWeXdnlri2RXnI/mBvmpQsk9QWHoNZIhOfF7nRbgEm3tCW6cnNYh9CvZ4LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788178621; c=relaxed/simple;
	bh=sFzHtptPg8YXY91BiWqGhBOATPA9DBeWCs3Jw4cX3SY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SEiV4B6MFnlJ8DuQ2dmDgnOLzuK6q6rt+nZpafiVwnVB2uV4WpKPyHcd4TJJ9zy1NVjkflWRIGZaAaC5o2XEYirWRXzaIdoDIqhg9UDZB7vfjM8Ji3+T31UCCJ2sQIpSPGN711I0SCq0JhoAQQoFbL4F/bzBu2SBH3jRXD3CZ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZ8AahVS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZ8AahVS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788178619; x=1819714619;
  h=date:from:to:cc:subject:message-id;
  bh=sFzHtptPg8YXY91BiWqGhBOATPA9DBeWCs3Jw4cX3SY=;
  b=PZ8AahVSdpVjkFKL8NsGyhk23IdA78BLPXSm7NCiwBN8hryNfqOhLGio
   uS3CHHSDjdIUFOsGPgm8AEN2gvKZx8+VmRHZ6UhVDTMFq4RyUQm/JmkvT
   sKxDwjG51TDHAl3I20swwK2CjtlQ7A4AKndBFTQh2teeQcD0kfPFHl87L
   zNvmbhXijwvb9XmTfeV057PBkpDykvSmXJ5w+zkwoJBrAXfmDw37qiYQC
   q2XoI9ZKAhs1BP7N0Grh36NI9ZhnKjwhpNWvTHu+3Ld07dDNrLraUpaa3
   YU2CL3kdD0LIHhg+aDGtYXemhNmyHMlIplRdrHha0QjR6xjfno20bphOg
   w==;
X-CSE-ConnectionGUID: EcPjus8MRhOsQBNm2NYUpg==
X-CSE-MsgGUID: mGJ0RcqdSUKdP1bk/qcavA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92451206"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="92451206"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 05:16:58 -0700
X-CSE-ConnectionGUID: ngkpkn//T8ylpbYrg0ZY9w==
X-CSE-MsgGUID: seHYqH4hSyK5XSR/J+anNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="265541565"
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2026 05:16:57 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x10wY-000000000c3-2LcG;
	Mon, 31 Aug 2026 12:16:54 +0000
Date: Mon, 31 Aug 2026 20:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [boqun:irqflags 11/20] drivers/input/joystick/analog.c:192
 analog_cooked_read() warn: mixing irqsave and irq
Message-ID: <202608312037.GqxvSjEL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@kernel.org>
CC: Boqun Feng <boqun@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git irqflags
head:   d5c6783a39c9f3ae4513eb61038d5306e4ba5f5b
commit: fb509c0abd8483ea55b22d00a0e0f4b3d0a91ecb [11/20] irqflags: Cleanup wrappers
:::::: branch date: 21 hours ago
:::::: commit date: 22 hours ago
config: i386-randconfig-141-20260831 (https://download.01.org/0day-ci/archive/20260831/202608312037.GqxvSjEL-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608312037.GqxvSjEL-lkp@intel.com/

New smatch warnings:
drivers/input/joystick/analog.c:192 analog_cooked_read() warn: mixing irqsave and irq
drivers/usb/early/xhci-dbc.c:875 xdbc_bulk_write() warn: inconsistent returns 'flags'.

Old smatch warnings:
drivers/usb/early/xhci-dbc.c:979 xdbc_init() warn: missing error code 'ret'

vim +192 drivers/input/joystick/analog.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  162  
^1da177e4c3f41 Linus Torvalds 2005-04-16  163  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  164   * analog_cooked_read() reads analog joystick data.
^1da177e4c3f41 Linus Torvalds 2005-04-16  165   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  166  
^1da177e4c3f41 Linus Torvalds 2005-04-16  167  static int analog_cooked_read(struct analog_port *port)
^1da177e4c3f41 Linus Torvalds 2005-04-16  168  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  169  	struct gameport *gameport = port->gameport;
0c5483a5778fa9 Guenter Roeck  2021-09-07  170  	ktime_t time[4], start, loop, now;
76460a7becadbd Takashi Iwai   2014-09-11  171  	unsigned int loopout, timeout;
^1da177e4c3f41 Linus Torvalds 2005-04-16  172  	unsigned char data[4], this, last;
^1da177e4c3f41 Linus Torvalds 2005-04-16  173  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds 2005-04-16  174  	int i, j;
^1da177e4c3f41 Linus Torvalds 2005-04-16  175  
^1da177e4c3f41 Linus Torvalds 2005-04-16  176  	loopout = (ANALOG_LOOP_TIME * port->loop) / 1000;
0c5483a5778fa9 Guenter Roeck  2021-09-07  177  	timeout = ANALOG_MAX_TIME * NSEC_PER_MSEC;
^1da177e4c3f41 Linus Torvalds 2005-04-16  178  
^1da177e4c3f41 Linus Torvalds 2005-04-16  179  	local_irq_save(flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  180  	gameport_trigger(gameport);
0c5483a5778fa9 Guenter Roeck  2021-09-07  181  	now = ktime_get();
^1da177e4c3f41 Linus Torvalds 2005-04-16  182  	local_irq_restore(flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  183  
^1da177e4c3f41 Linus Torvalds 2005-04-16  184  	start = now;
^1da177e4c3f41 Linus Torvalds 2005-04-16  185  	this = port->mask;
^1da177e4c3f41 Linus Torvalds 2005-04-16  186  	i = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  187  
^1da177e4c3f41 Linus Torvalds 2005-04-16  188  	do {
^1da177e4c3f41 Linus Torvalds 2005-04-16  189  		loop = now;
^1da177e4c3f41 Linus Torvalds 2005-04-16  190  		last = this;
^1da177e4c3f41 Linus Torvalds 2005-04-16  191  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @192  		local_irq_disable();
^1da177e4c3f41 Linus Torvalds 2005-04-16  193  		this = gameport_read(gameport) & port->mask;
0c5483a5778fa9 Guenter Roeck  2021-09-07  194  		now = ktime_get();
^1da177e4c3f41 Linus Torvalds 2005-04-16  195  		local_irq_restore(flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  196  
0c5483a5778fa9 Guenter Roeck  2021-09-07  197  		if ((last ^ this) && (ktime_sub(now, loop) < loopout)) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  198  			data[i] = last ^ this;
^1da177e4c3f41 Linus Torvalds 2005-04-16  199  			time[i] = now;
^1da177e4c3f41 Linus Torvalds 2005-04-16  200  			i++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  201  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  202  
0c5483a5778fa9 Guenter Roeck  2021-09-07  203  	} while (this && (i < 4) && (ktime_sub(now, start) < timeout));
^1da177e4c3f41 Linus Torvalds 2005-04-16  204  
^1da177e4c3f41 Linus Torvalds 2005-04-16  205  	this <<= 4;
^1da177e4c3f41 Linus Torvalds 2005-04-16  206  
^1da177e4c3f41 Linus Torvalds 2005-04-16  207  	for (--i; i >= 0; i--) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  208  		this |= data[i];
^1da177e4c3f41 Linus Torvalds 2005-04-16  209  		for (j = 0; j < 4; j++)
^1da177e4c3f41 Linus Torvalds 2005-04-16  210  			if (data[i] & (1 << j))
0c5483a5778fa9 Guenter Roeck  2021-09-07  211  				port->axes[j] = ((u32)ktime_sub(time[i], start) << ANALOG_FUZZ_BITS) / port->loop;
^1da177e4c3f41 Linus Torvalds 2005-04-16  212  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  213  
^1da177e4c3f41 Linus Torvalds 2005-04-16  214  	return -(this != port->mask);
^1da177e4c3f41 Linus Torvalds 2005-04-16  215  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  216  

:::::: The code at line 192 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
