Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C17182D2
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 04:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768193279; cv=none; b=RJEO89M7UJo35bAg5YUWdaOhvq9iLiNc2IHz5meo2VZ0vonVnlBGDgt2Ooy2Cgb2ik4tmGExN8OduZEOgDxQoi+GR14CoI+uxznFBLGZAmbkL8ylVxagVcO94PyV17SobcC+citaGW7qoxG2ZwUvXFekltqPOPWjbNBumeMw+74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768193279; c=relaxed/simple;
	bh=bzfiw/HehQUDy7OtLtxWnrBigJ4MA9d5q05YJ2XPFAw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u6otmyrd/UVQ4etq8S15qlB/U0RhD+ZjGMHF/s4EtNultoPd/XZCGRJg1kt5jv3rOkmY3hqkx6AdJv5f6n4eTgMnHFk5bB4x09aB5Sfm3vbH+3jC1dCdQZ96SIv4I6PaCUGjm5m7zzevtJqg6BDVzPIZZjAKJVU9QhUfXMpmXfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnWAjBz4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnWAjBz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768193277; x=1799729277;
  h=date:from:to:cc:subject:message-id;
  bh=bzfiw/HehQUDy7OtLtxWnrBigJ4MA9d5q05YJ2XPFAw=;
  b=GnWAjBz4W6Mp9TVrtyVdIjvB81O9+S89vMC/yLVJ1jQ6mub9jaGBW9RG
   thOaftWGcjdM5fWE4nbZ2NOiesSp+jwUil7VzHBy+IrnD9VjCdzWKOXT+
   Ev3GolR0fLUAlDMF1ucc/XA9gTJ1eJKT9myqzXP61AS0OQNJofNGUqXPH
   6Y5wXNEHcWO0zkf4jva7/aELRmLqF805MAtX1m6Y9lVXQmby5QgtSqpkA
   K82qRl+hwZ5QmbpMKN3umaMsMP4SYroQklX6pR68J/zFcvwOxfcy8HIAW
   PU+JufHZpPNotFP7TeopozwutUXOys9jPNNzqQ/5v2GJvKcJoYCPKZv7C
   g==;
X-CSE-ConnectionGUID: toUt3GxZRKuvxOJtC3qOIw==
X-CSE-MsgGUID: V++nH90xSHi6zwpC5UGLOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="73095929"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="73095929"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 20:47:57 -0800
X-CSE-ConnectionGUID: C7iRIc73SMSJnwveamcOsg==
X-CSE-MsgGUID: iT84e0dJR1OkljXkWPyGrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208521793"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jan 2026 20:47:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf9qK-00000000Cza-2pjS;
	Mon, 12 Jan 2026 04:47:52 +0000
Date: Mon, 12 Jan 2026 12:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:irq/drivers 5/9]
 drivers/irqchip/irq-renesas-rzt2h.c:278:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601121239.jRlmJFIl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/irqchip/irq-renesas-rzt2h.c:278:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
head:   95a8ddde36601d0a645475fb080ed118db59c8c3
commit: 13e7b3305b647cf58c47c979fe8a04e08caa6098 [5/9] irqchip: Add RZ/{T2H,N2H} Interrupt Controller (ICU) driver
:::::: branch date: 4 weeks ago
:::::: commit date: 4 weeks ago
config: powerpc64-randconfig-r111-20260112 (https://download.01.org/0day-ci/archive/20260112/202601121239.jRlmJFIl-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121239.jRlmJFIl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601121239.jRlmJFIl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-renesas-rzt2h.c:278:1: sparse: sparse: bad integer constant expression
   drivers/irqchip/irq-renesas-rzt2h.c:278:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/irqchip/irq-renesas-rzt2h.c:279:1: sparse: sparse: bad integer constant expression
   drivers/irqchip/irq-renesas-rzt2h.c:279:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/irqchip/irq-renesas-rzt2h.c:280:1: sparse: sparse: bad integer constant expression
   drivers/irqchip/irq-renesas-rzt2h.c:280:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/irqchip/irq-renesas-rzt2h.c:280:1: sparse: sparse: bad integer constant expression
   drivers/irqchip/irq-renesas-rzt2h.c:280:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +278 drivers/irqchip/irq-renesas-rzt2h.c

13e7b3305b647c Cosmin Tanislav 2025-12-01  274  
13e7b3305b647c Cosmin Tanislav 2025-12-01  275  IRQCHIP_PLATFORM_DRIVER_BEGIN(rzt2h_icu)
13e7b3305b647c Cosmin Tanislav 2025-12-01  276  IRQCHIP_MATCH("renesas,r9a09g077-icu", rzt2h_icu_init)
13e7b3305b647c Cosmin Tanislav 2025-12-01  277  IRQCHIP_PLATFORM_DRIVER_END(rzt2h_icu)
13e7b3305b647c Cosmin Tanislav 2025-12-01 @278  MODULE_AUTHOR("Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
