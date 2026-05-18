Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EF23DEAD0
	for <oe-kbuild@lists.linux.dev>; Mon, 18 May 2026 07:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088391; cv=none; b=NCCVzBZ6n//BZ3Hfyg+uvhh7QP4k2h1QKWIMesH8cfN7nWWX85VjkqWOHYargfyUBOO3Qhb5Pq3kxfRfJNTOSWXCvK0wusRO3u3R+rJbZOMyXF93Me0tPxRh2VinT37lLMfYZLeM8XUlb5fE5X/LsK8unsbQ2GBJXMMotxUQ8As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088391; c=relaxed/simple;
	bh=Gan9CHv+Ei/ZY+LcrpHqIQ+YGKzuHsLbqGoj/TGR7NA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tb4LO+nLeOt3IJBhXewj3F0nDA3JEPYVw3KtQWnVvJny86Bkjy6qA0Gu6CDlwiRaYxBnhtBM344yhXGY7vC4UJcJD+3LXg4F8QWgRCHDTTLXBQ6jB/w7PY5VBDgdtUQY8dIIak16WyG8P2wio7PBB2OppgIcbAJWdFnGYLv6MhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBGRkHXQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBGRkHXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779088390; x=1810624390;
  h=date:from:to:cc:subject:message-id;
  bh=Gan9CHv+Ei/ZY+LcrpHqIQ+YGKzuHsLbqGoj/TGR7NA=;
  b=UBGRkHXQfmnrhfxxx/TKStoToLNbKyPwZcq8M/xzKXhhlVpF1jVx6fv6
   1CIOoN7sl718Ra/WNUHmeC95LfFx8Rpj968ZLAVTcH4LZdP7TB7xMcElU
   cQjAxFNnMUBBImkGhNmJx0FGuRIqFB4lHBTOxoSSjhDU7yLtWXK+GMof7
   MjyAZ9rudQQmUdrKOrF56Yc0lHD9o5odG/zg67zJqtJXa+QoFz8Gv+o5y
   DNn1R0MWl6z3MHT9pu4AM1C/aZiF6uxBcVG7eOOKIEsRTdDGRBUDcmuST
   AcogKut0kByVdjNrMte9n7R30hVzqqjlC6DIVfUnY1A7oAZnqU6GRGXa4
   g==;
X-CSE-ConnectionGUID: KOyBlxUDSTOrpZXe7WoD3w==
X-CSE-MsgGUID: RoK5I8HfQEKz+vKDUfad8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79787930"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79787930"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:13:05 -0700
X-CSE-ConnectionGUID: DZENQ8DlSr6XrF2C+w13yg==
X-CSE-MsgGUID: NJlZ8QDqQLmqEH/UjWOfGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="239598428"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 May 2026 00:13:03 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOs9s-000000002Sc-1hGS;
	Mon, 18 May 2026 07:13:00 +0000
Date: Mon, 18 May 2026 15:12:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/char/hpet.c:483:45: warning: '%d' directive writing
 between 1 and 9 bytes into a region of size 3
Message-ID: <202605181530.3bRAIVeO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Nathan-Chancellor/kbuild-Bump-minimum-version-of-LLVM-for-building-the-kernel-to-17-0-1/20260518-071448, commit: efe6a2a0073c5db6aaa2d79dd68bde98dc335112"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nathan Chancellor <nathan@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Nathan-Chancellor/kbuild-Bump-minimum-version-of-LLVM-for-building-the-kernel-to-17-0-1/20260518-071448
head:   5b11b4afdc532a7c1d022b5f572c17428b613f0f
commit: efe6a2a0073c5db6aaa2d79dd68bde98dc335112 x86/build: Drop unnecessary '-ffreestanding' addition to KBUILD_CFLAGS
date:   8 hours ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-buildonly-randconfig-003-20260518 (https://download.01.org/0day-ci/archive/20260518/202605181530.3bRAIVeO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605181530.3bRAIVeO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605181530.3bRAIVeO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/hpet.c: In function 'hpet_ioctl_ieon':
>> drivers/char/hpet.c:483:45: warning: '%d' directive writing between 1 and 9 bytes into a region of size 3 [-Wformat-overflow=]
     483 |                 sprintf(devp->hd_name, "hpet%d", (int)(devp - hpetp->hp_dev));
         |                                             ^~
   drivers/char/hpet.c:483:40: note: directive argument in the range [-22369621, 22369621]
     483 |                 sprintf(devp->hd_name, "hpet%d", (int)(devp - hpetp->hp_dev));
         |                                        ^~~~~~~~
   drivers/char/hpet.c:483:17: note: 'sprintf' output between 6 and 14 bytes into a destination of size 7
     483 |                 sprintf(devp->hd_name, "hpet%d", (int)(devp - hpetp->hp_dev));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +483 drivers/char/hpet.c

^1da177e4c3f4152 Linus Torvalds     2005-04-16  433  
^1da177e4c3f4152 Linus Torvalds     2005-04-16  434  static int hpet_ioctl_ieon(struct hpet_dev *devp)
^1da177e4c3f4152 Linus Torvalds     2005-04-16  435  {
^1da177e4c3f4152 Linus Torvalds     2005-04-16  436  	struct hpet_timer __iomem *timer;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  437  	struct hpet __iomem *hpet;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  438  	struct hpets *hpetp;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  439  	int irq;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  440  	unsigned long g, v, t, m;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  441  	unsigned long flags, isr;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  442  
^1da177e4c3f4152 Linus Torvalds     2005-04-16  443  	timer = devp->hd_timer;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  444  	hpet = devp->hd_hpet;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  445  	hpetp = devp->hd_hpets;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  446  
9090e6db87e3bdb2 Clemens Ladisch    2005-10-30  447  	if (!devp->hd_ireqfreq)
9090e6db87e3bdb2 Clemens Ladisch    2005-10-30  448  		return -EIO;
9090e6db87e3bdb2 Clemens Ladisch    2005-10-30  449  
^1da177e4c3f4152 Linus Torvalds     2005-04-16  450  	spin_lock_irq(&hpet_lock);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  451  
^1da177e4c3f4152 Linus Torvalds     2005-04-16  452  	if (devp->hd_flags & HPET_IE) {
^1da177e4c3f4152 Linus Torvalds     2005-04-16  453  		spin_unlock_irq(&hpet_lock);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  454  		return -EBUSY;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  455  	}
^1da177e4c3f4152 Linus Torvalds     2005-04-16  456  
^1da177e4c3f4152 Linus Torvalds     2005-04-16  457  	devp->hd_flags |= HPET_IE;
0d29086177aaa1e7 Clemens Ladisch    2005-10-30  458  
0d29086177aaa1e7 Clemens Ladisch    2005-10-30  459  	if (readl(&timer->hpet_config) & Tn_INT_TYPE_CNF_MASK)
0d29086177aaa1e7 Clemens Ladisch    2005-10-30  460  		devp->hd_flags |= HPET_SHARED_IRQ;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  461  	spin_unlock_irq(&hpet_lock);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  462  
^1da177e4c3f4152 Linus Torvalds     2005-04-16  463  	irq = devp->hd_hdwirq;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  464  
^1da177e4c3f4152 Linus Torvalds     2005-04-16  465  	if (irq) {
0d29086177aaa1e7 Clemens Ladisch    2005-10-30  466  		unsigned long irq_flags;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  467  
96e9694df446d115 Clemens Ladisch    2010-10-26  468  		if (devp->hd_flags & HPET_SHARED_IRQ) {
96e9694df446d115 Clemens Ladisch    2010-10-26  469  			/*
96e9694df446d115 Clemens Ladisch    2010-10-26  470  			 * To prevent the interrupt handler from seeing an
96e9694df446d115 Clemens Ladisch    2010-10-26  471  			 * unwanted interrupt status bit, program the timer
96e9694df446d115 Clemens Ladisch    2010-10-26  472  			 * so that it will not fire in the near future ...
96e9694df446d115 Clemens Ladisch    2010-10-26  473  			 */
96e9694df446d115 Clemens Ladisch    2010-10-26  474  			writel(readl(&timer->hpet_config) & ~Tn_TYPE_CNF_MASK,
96e9694df446d115 Clemens Ladisch    2010-10-26  475  			       &timer->hpet_config);
96e9694df446d115 Clemens Ladisch    2010-10-26  476  			write_counter(read_counter(&hpet->hpet_mc),
96e9694df446d115 Clemens Ladisch    2010-10-26  477  				      &timer->hpet_compare);
96e9694df446d115 Clemens Ladisch    2010-10-26  478  			/* ... and clear any left-over status. */
96e9694df446d115 Clemens Ladisch    2010-10-26  479  			isr = 1 << (devp - devp->hd_hpets->hp_dev);
96e9694df446d115 Clemens Ladisch    2010-10-26  480  			writel(isr, &hpet->hpet_isr);
96e9694df446d115 Clemens Ladisch    2010-10-26  481  		}
96e9694df446d115 Clemens Ladisch    2010-10-26  482  
0d29086177aaa1e7 Clemens Ladisch    2005-10-30 @483  		sprintf(devp->hd_name, "hpet%d", (int)(devp - hpetp->hp_dev));
158f0bb005fc7fdb Michael Opdenacker 2013-10-13  484  		irq_flags = devp->hd_flags & HPET_SHARED_IRQ ? IRQF_SHARED : 0;
0d29086177aaa1e7 Clemens Ladisch    2005-10-30  485  		if (request_irq(irq, hpet_interrupt, irq_flags,
0d29086177aaa1e7 Clemens Ladisch    2005-10-30  486  				devp->hd_name, (void *)devp)) {
^1da177e4c3f4152 Linus Torvalds     2005-04-16  487  			printk(KERN_ERR "hpet: IRQ %d is not free\n", irq);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  488  			irq = 0;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  489  		}
^1da177e4c3f4152 Linus Torvalds     2005-04-16  490  	}
^1da177e4c3f4152 Linus Torvalds     2005-04-16  491  
^1da177e4c3f4152 Linus Torvalds     2005-04-16  492  	if (irq == 0) {
^1da177e4c3f4152 Linus Torvalds     2005-04-16  493  		spin_lock_irq(&hpet_lock);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  494  		devp->hd_flags ^= HPET_IE;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  495  		spin_unlock_irq(&hpet_lock);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  496  		return -EIO;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  497  	}
^1da177e4c3f4152 Linus Torvalds     2005-04-16  498  
^1da177e4c3f4152 Linus Torvalds     2005-04-16  499  	devp->hd_irq = irq;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  500  	t = devp->hd_ireqfreq;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  501  	v = readq(&timer->hpet_config);
64a76f667d987a55 David Brownell     2008-07-29  502  
64a76f667d987a55 David Brownell     2008-07-29  503  	/* 64-bit comparators are not yet supported through the ioctls,
64a76f667d987a55 David Brownell     2008-07-29  504  	 * so force this into 32-bit mode if it supports both modes
64a76f667d987a55 David Brownell     2008-07-29  505  	 */
64a76f667d987a55 David Brownell     2008-07-29  506  	g = v | Tn_32MODE_CNF_MASK | Tn_INT_ENB_CNF_MASK;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  507  
^1da177e4c3f4152 Linus Torvalds     2005-04-16  508  	if (devp->hd_flags & HPET_PERIODIC) {
^1da177e4c3f4152 Linus Torvalds     2005-04-16  509  		g |= Tn_TYPE_CNF_MASK;
ae21cf9248584d9b Nils Carlson       2009-09-23  510  		v |= Tn_TYPE_CNF_MASK | Tn_VAL_SET_CNF_MASK;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  511  		writeq(v, &timer->hpet_config);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  512  		local_irq_save(flags);
64a76f667d987a55 David Brownell     2008-07-29  513  
ae21cf9248584d9b Nils Carlson       2009-09-23  514  		/*
ae21cf9248584d9b Nils Carlson       2009-09-23  515  		 * NOTE: First we modify the hidden accumulator
64a76f667d987a55 David Brownell     2008-07-29  516  		 * register supported by periodic-capable comparators.
64a76f667d987a55 David Brownell     2008-07-29  517  		 * We never want to modify the (single) counter; that
ae21cf9248584d9b Nils Carlson       2009-09-23  518  		 * would affect all the comparators. The value written
ae21cf9248584d9b Nils Carlson       2009-09-23  519  		 * is the counter value when the first interrupt is due.
64a76f667d987a55 David Brownell     2008-07-29  520  		 */
^1da177e4c3f4152 Linus Torvalds     2005-04-16  521  		m = read_counter(&hpet->hpet_mc);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  522  		write_counter(t + m + hpetp->hp_delta, &timer->hpet_compare);
ae21cf9248584d9b Nils Carlson       2009-09-23  523  		/*
ae21cf9248584d9b Nils Carlson       2009-09-23  524  		 * Then we modify the comparator, indicating the period
ae21cf9248584d9b Nils Carlson       2009-09-23  525  		 * for subsequent interrupt.
ae21cf9248584d9b Nils Carlson       2009-09-23  526  		 */
ae21cf9248584d9b Nils Carlson       2009-09-23  527  		write_counter(t, &timer->hpet_compare);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  528  	} else {
^1da177e4c3f4152 Linus Torvalds     2005-04-16  529  		local_irq_save(flags);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  530  		m = read_counter(&hpet->hpet_mc);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  531  		write_counter(t + m + hpetp->hp_delta, &timer->hpet_compare);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  532  	}
^1da177e4c3f4152 Linus Torvalds     2005-04-16  533  
0d29086177aaa1e7 Clemens Ladisch    2005-10-30  534  	if (devp->hd_flags & HPET_SHARED_IRQ) {
3d5640d1c7584689 Clemens Ladisch    2005-10-30  535  		isr = 1 << (devp - devp->hd_hpets->hp_dev);
0d29086177aaa1e7 Clemens Ladisch    2005-10-30  536  		writel(isr, &hpet->hpet_isr);
0d29086177aaa1e7 Clemens Ladisch    2005-10-30  537  	}
^1da177e4c3f4152 Linus Torvalds     2005-04-16  538  	writeq(g, &timer->hpet_config);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  539  	local_irq_restore(flags);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  540  
^1da177e4c3f4152 Linus Torvalds     2005-04-16  541  	return 0;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  542  }
^1da177e4c3f4152 Linus Torvalds     2005-04-16  543  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
