Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469F73019AB
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Oct 2025 13:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761311175; cv=none; b=TPh0cX+GyOy6PqPLFnboc3xH2pQuQOW5tqDbEFUsS4zgcHhFLsxxJvtF+HsMkxtDOGZqfbiI9wu97fvxY/o2t5jSFU5SwjP0Uf/d02JY43JYNgeGbywa5k2BHm8kl2Y3lLRzrqSPLcbo+HZlUEI1In5UQ8G/WStfsaCmzXY0w/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761311175; c=relaxed/simple;
	bh=mHo1TMRXquNaEPl78Kof8IS965aTqUQAzBlv9yaTtws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WpXdWhsWsgxC6qfjawWA5ftWkiEGGgg2IPomkLXaPIdabKvbj/ZVDcYjzpKUbanbxyadJwgZe4NC8m9MoY1fekcSEuTst8gSXXIbwqS7oKSbWqzVoYdR+kXqWu0j4shpOjEECQTkj18EXvXrmx3c/85vFITUh8j9aP6+jIue3cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jV+4SM4w; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jV+4SM4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761311173; x=1792847173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mHo1TMRXquNaEPl78Kof8IS965aTqUQAzBlv9yaTtws=;
  b=jV+4SM4w/bJHn5GOsPd9xLnFAXTP/l8+Z3okpPi2U6HR8R5q4zA6bSWT
   6XSPqALkACoTSiN+tOicLRctBwQKnjCNcqFR0WaB7HsoqiOEFewKFuFCs
   olaMOoBKjizh52vOi/lx4O3YzVQcZEKzEDToSDObnObJh8bElzkErErX4
   d2wdHfmQ7XwM9Ny5a3VvtFfYkBVCgMhv4tWV/nmCCpwnFc+pAKS+fJGYc
   sToivvfWdVqhRQ05K75FxB5zJxHfJm1zvgoqst8EeV2mNpGctanXoKiBv
   e7OgG9Iu9AytahigjmRDHb14OJU5HHNGC9S3lUnvsXtMA0ls4bnqkNWsg
   A==;
X-CSE-ConnectionGUID: SRT2cGB1RLyDG761woF6bg==
X-CSE-MsgGUID: cXc7I1MJQJGYx0qO3LraEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67357925"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="67357925"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 06:06:12 -0700
X-CSE-ConnectionGUID: 3QXL8R/VRPi5gHDYB1l+IA==
X-CSE-MsgGUID: 1/Lld41NT12PI3nWriTWgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="184497619"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Oct 2025 06:06:11 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCHUe-000EW5-34;
	Fri, 24 Oct 2025 13:06:08 +0000
Date: Fri, 24 Oct 2025 21:05:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [tip:irq/drivers 12/19] drivers/irqchip/irq-bcm7038-l1.c:411:7-10:
 ERROR: iterator variable bound on line 408 cannot be NULL
Message-ID: <202510242125.YULJbI93-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Johan Hovold <johan@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Florian Fainelli <florian.fainelli@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
head:   a7f25e00c4c97d4842117fba06b4c6064ba1e354
commit: 1230fbb225abf3f04c64697c6b0f8dfb473b3790 [12/19] irqchip: Enable compile testing of Broadcom drivers
:::::: branch date: 7 days ago
:::::: commit date: 8 days ago
config: riscv-randconfig-r054-20251024 (https://download.01.org/0day-ci/archive/20251024/202510242125.YULJbI93-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510242125.YULJbI93-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-bcm7038-l1.c:411:7-10: ERROR: iterator variable bound on line 408 cannot be NULL

vim +411 drivers/irqchip/irq-bcm7038-l1.c

5f7f0317ed28b8 Kevin Cernekee    2014-12-25  396  
1e3e330c07076a Johan Hovold      2025-10-13  397  static int bcm7038_l1_probe(struct platform_device *pdev, struct device_node *parent)
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  398  {
1e3e330c07076a Johan Hovold      2025-10-13  399  	struct device_node *dn = pdev->dev.of_node;
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  400  	struct bcm7038_l1_chip *intc;
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  401  	int idx, ret;
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  402  
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  403  	intc = kzalloc(sizeof(*intc), GFP_KERNEL);
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  404  	if (!intc)
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  405  		return -ENOMEM;
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  406  
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  407  	raw_spin_lock_init(&intc->lock);
5f7f0317ed28b8 Kevin Cernekee    2014-12-25 @408  	for_each_possible_cpu(idx) {
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  409  		ret = bcm7038_l1_init_one(dn, idx, intc);
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  410  		if (ret < 0) {
5f7f0317ed28b8 Kevin Cernekee    2014-12-25 @411  			if (idx)
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  412  				break;
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  413  			pr_err("failed to remap intc L1 registers\n");
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  414  			goto out_free;
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  415  		}
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  416  	}
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  417  
affdc0d1bdfa54 Jiri Slaby (SUSE  2025-03-19  418) 	intc->domain = irq_domain_create_linear(of_fwnode_handle(dn), IRQS_PER_WORD * intc->n_words,
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  419  					     &bcm7038_l1_domain_ops,
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  420  					     intc);
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  421  	if (!intc->domain) {
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  422  		ret = -ENOMEM;
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  423  		goto out_unmap;
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  424  	}
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  425  

:::::: The code at line 411 was first introduced by commit
:::::: 5f7f0317ed28b86bdae9baf65bb72d405b6f79ee IRQCHIP: Add new driver for BCM7038-style level 1 interrupt controllers

:::::: TO: Kevin Cernekee <cernekee@gmail.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
