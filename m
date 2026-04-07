Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3681129B77C
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 03:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533763; cv=none; b=S/eqjbwMy96Hle0NgA3uBF8hf+WY63avXlHa7/XmILRWCjwR4Po4Hq1neKWHHIJV0Miuh4ygnBQSAAT+aNvyuN0aeqTidnCngOo0viG9bXtMg9dgwZeFeBKOKcz9BFe5hyCDPE+1o2aJKecJbKSzoLgGIjOlr2Kk/eSfdqUq04c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533763; c=relaxed/simple;
	bh=rPRE2qqzufHcQleIe3MRYp3EGaPLHMqeQsC6YKADuFc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VKNhIWCQHU/EsSWZli4VcJNV62w8YCerjxrURCGRWoNsD743FpCZZpk4b9LR9PUmOdNPodI0A+FdupxbkVQhB/frIeYc6KzBPRgSCJuKf+ZrJX1urvImxWRofZK2ae8RSTCAs0St0OjtLoFIDlG0L6AUY3pFLVMTsPbnz4npQ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BElzpJS9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BElzpJS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533762; x=1807069762;
  h=date:from:to:cc:subject:message-id;
  bh=rPRE2qqzufHcQleIe3MRYp3EGaPLHMqeQsC6YKADuFc=;
  b=BElzpJS9z7Ti6f40KPhlDBnKib8hV2InnjjL8YyEQ1pVFkzFZ2/9MezI
   7hE3X8qrW7SOLYPBMUYWYt1fqiIsH6gTB4Htf61u1Zhion0/UStr1vm5+
   RtB6jlcjq/yr9be7oIuNEgU3B6+YxxvmoM/xEW0FC5ul5vc03DpsFVy9X
   e6fIf+P1UPYE9D5Bj+rGynjWZNUXE3j8riggVNsBRspcPyfm3e/gpMKnD
   gkMmlSppKBXN44vlXwm7L43ksy2mZfQeF9mjk3RMEKjYv9MbdvMAhGHCC
   GDIJYJUZtcRszvxcvv5GtXrPKfgliKOrjUFjCvvmOdEpRxBwG5GXRYITD
   g==;
X-CSE-ConnectionGUID: oB8jz83KQ7m2A60iwW57gA==
X-CSE-MsgGUID: zzZ2sD6ASPKIwibb8iQ1Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87191970"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87191970"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:49:21 -0700
X-CSE-ConnectionGUID: JTSdTbPTRL6dsSE1VIL1hw==
X-CSE-MsgGUID: rrW2ZIJ5TbKSzbbbMlzB7Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Apr 2026 20:49:21 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xRG-0000000001W-1NoB;
	Tue, 07 Apr 2026 03:49:18 +0000
Date: Tue, 07 Apr 2026 11:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tty/serial/sh-sci.c:2850 sci_request_port() warn:
 'port->mapbase' from __request_region() not released on lines: 2847.
Message-ID: <202604032356.SzEjYkBC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d8a9a4b11a137909e306e50346148fc5c3b63f9d
commit: 2667bd6673eb49c9c299c1202bab5a3fc04586de serial: 8250_port: simplify serial8250_request_std_resource()
date:   1 year ago
:::::: branch date: 11 hours ago
:::::: commit date: 1 year ago
config: alpha-randconfig-r071-20260403 (https://download.01.org/0day-ci/archive/20260403/202604032356.SzEjYkBC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2667bd6673eb ("serial: 8250_port: simplify serial8250_request_std_resource()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604032356.SzEjYkBC-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/sh-sci.c:2850 sci_request_port() warn: 'port->mapbase' from __request_region() not released on lines: 2847.

Old smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:12 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:12 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

vim +2850 drivers/tty/serial/sh-sci.c

e2651647080930 drivers/serial/sh-sci.c     Paul Mundt     2011-01-20  2830  
e2651647080930 drivers/serial/sh-sci.c     Paul Mundt     2011-01-20  2831  static int sci_request_port(struct uart_port *port)
^1da177e4c3f41 drivers/serial/sh-sci.c     Linus Torvalds 2005-04-16  2832  {
e2651647080930 drivers/serial/sh-sci.c     Paul Mundt     2011-01-20  2833  	struct resource *res;
e4d6f911a7cea1 drivers/tty/serial/sh-sci.c Yoshinori Sato 2015-05-16  2834  	struct sci_port *sport = to_sci_port(port);
f6e9495d68b911 drivers/serial/sh-sci.c     Paul Mundt     2011-01-21  2835  	int ret;
^1da177e4c3f41 drivers/serial/sh-sci.c     Linus Torvalds 2005-04-16  2836  
e4d6f911a7cea1 drivers/tty/serial/sh-sci.c Yoshinori Sato 2015-05-16  2837  	res = request_mem_region(port->mapbase, sport->reg_size,
e4d6f911a7cea1 drivers/tty/serial/sh-sci.c Yoshinori Sato 2015-05-16  2838  				 dev_name(port->dev));
e4d6f911a7cea1 drivers/tty/serial/sh-sci.c Yoshinori Sato 2015-05-16  2839  	if (unlikely(res == NULL)) {
e4d6f911a7cea1 drivers/tty/serial/sh-sci.c Yoshinori Sato 2015-05-16  2840  		dev_err(port->dev, "request_mem_region failed.");
e2651647080930 drivers/serial/sh-sci.c     Paul Mundt     2011-01-20  2841  		return -EBUSY;
e4d6f911a7cea1 drivers/tty/serial/sh-sci.c Yoshinori Sato 2015-05-16  2842  	}
^1da177e4c3f41 drivers/serial/sh-sci.c     Linus Torvalds 2005-04-16  2843  
f6e9495d68b911 drivers/serial/sh-sci.c     Paul Mundt     2011-01-21  2844  	ret = sci_remap_port(port);
f6e9495d68b911 drivers/serial/sh-sci.c     Paul Mundt     2011-01-21  2845  	if (unlikely(ret != 0)) {
e2651647080930 drivers/serial/sh-sci.c     Paul Mundt     2011-01-20  2846  		release_resource(res);
f6e9495d68b911 drivers/serial/sh-sci.c     Paul Mundt     2011-01-21  2847  		return ret;
7ff731aeba1cda drivers/serial/sh-sci.c     Paul Mundt     2008-10-01  2848  	}
e2651647080930 drivers/serial/sh-sci.c     Paul Mundt     2011-01-20  2849  
e2651647080930 drivers/serial/sh-sci.c     Paul Mundt     2011-01-20 @2850  	return 0;
e2651647080930 drivers/serial/sh-sci.c     Paul Mundt     2011-01-20  2851  }
e2651647080930 drivers/serial/sh-sci.c     Paul Mundt     2011-01-20  2852  

:::::: The code at line 2850 was first introduced by commit
:::::: e2651647080930a1846196c3b79f4de662100388 serial: sh-sci: Handle port memory region reservations.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
