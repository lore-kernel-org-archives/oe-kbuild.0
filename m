Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454D4203710
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 17:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729272778; cv=none; b=XJL0glLLzB4cn7lauwcs+SjHMvCi952YDjb03Vu9aOsdKcMZSAxsoI+xEhL+R5mg2lAfrlG+9UfIz3P4AuDsQwiGlwer82N4owmtcVAlrnkX6TV63rpKlmhuyFjyo8MnO9roNap/MoyMpk7EqrZLQz1rlNmvNXrQEGpfqs3yM7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729272778; c=relaxed/simple;
	bh=lmemv8epIO7JLXqQigpQyHeFnB2uhm6E7rFZnPIhXxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JTenDC6m3w7T2o1+zkNwblW+ge+0o1gtj/H1zeN9lZDOd2i0i5lp0jzAAAzMMiWuHRJeWXTjzK8M1bNTIoKCO0iM+dhGFKfr9lXoXjA214w0zCOshuMP+hPr3/cGb+gqmnQW0nN3IiePIMTQRon3oh3EyqePFK5fW0Cr6JrzF4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GV0cw/tu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GV0cw/tu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729272776; x=1760808776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lmemv8epIO7JLXqQigpQyHeFnB2uhm6E7rFZnPIhXxk=;
  b=GV0cw/tusVN3tgzwBx14Q9wRVbX9wBl/qYFOkxIvwaTFhzqEQchpS8YS
   s2iaPD2qLJPuS53bUjDzsnBZVBhQrPH5hVIhhG7nvZx/cwvyUp5TQVNze
   8qkqFC0vf1Pw6zh9q/y5ZnzQimF3bGv7u7bO60Q2RKo9yNzrcYCZcLvPE
   dGrp0vmvQG1ZoEb7gYqLV6z9Z6hYjlFsMkaVp+dVXP2icdRhjQkHJdZMa
   iK5bwoAhvC3DXOv4xUvM0r//Gcj1eQpaIEnkDTsf9eHd9ZkYBwrzWlpN4
   XZ510Pa7D/onOgdAsqGIKzYpwpzOmI1WNVJwcR6NXBtRjSKKXLvOVAy46
   w==;
X-CSE-ConnectionGUID: luLI3ePqTvqwqziRtsdzFQ==
X-CSE-MsgGUID: bM99NtqnRd2Stb/5DROXBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="40175961"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="40175961"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 10:32:55 -0700
X-CSE-ConnectionGUID: OoXqvIhaT0izE6JvykH4bQ==
X-CSE-MsgGUID: qRNW5dWET7+ihBvBctLtKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="78883187"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Oct 2024 10:32:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1qqJ-000O86-1f;
	Fri, 18 Oct 2024 17:32:51 +0000
Date: Sat, 19 Oct 2024 01:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/irqchip/irq-orion.c:202 orion_bridge_irq_init() warn:
 'r.start' from __request_region() not released on lines: 178,185.
Message-ID: <202410190147.7tWpWcx2-lkp@intel.com>
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
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   75aa74d52f43e75d0beb20572f98529071b700e5
commit: af73483f4e8b6f5c68c9aa63257bdd929a9c194a ida: Fix crash in ida_free when the bitmap is empty
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-r072-20241016 (https://download.01.org/0day-ci/archive/20241019/202410190147.7tWpWcx2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410190147.7tWpWcx2-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-orion.c:202 orion_bridge_irq_init() warn: 'r.start' from __request_region() not released on lines: 178,185.

vim +202 drivers/irqchip/irq-orion.c

e0318ec3bf3f15 Sebastian Hesselbarth 2014-01-24  136  
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  137  static int __init orion_bridge_irq_init(struct device_node *np,
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  138  					struct device_node *parent)
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  139  {
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  140  	unsigned int clr = IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN;
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  141  	struct resource r;
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  142  	struct irq_domain *domain;
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  143  	struct irq_chip_generic *gc;
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  144  	int ret, irq, nrirqs = 32;
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  145  
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  146  	/* get optional number of interrupts provided */
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  147  	of_property_read_u32(np, "marvell,#interrupts", &nrirqs);
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  148  
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  149  	domain = irq_domain_add_linear(np, nrirqs,
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  150  				       &irq_generic_chip_ops, NULL);
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  151  	if (!domain) {
2ef790dc443a25 Rob Herring           2018-08-27  152  		pr_err("%pOFn: unable to add irq domain\n", np);
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  153  		return -ENOMEM;
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  154  	}
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  155  
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  156  	ret = irq_alloc_domain_generic_chips(domain, nrirqs, 1, np->name,
5f40067fc86f0e Sebastian Hesselbarth 2014-01-23  157  			     handle_edge_irq, clr, 0, IRQ_GC_INIT_MASK_CACHE);
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  158  	if (ret) {
2ef790dc443a25 Rob Herring           2018-08-27  159  		pr_err("%pOFn: unable to alloc irq domain gc\n", np);
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  160  		return ret;
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  161  	}
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  162  
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  163  	ret = of_address_to_resource(np, 0, &r);
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  164  	if (ret) {
2ef790dc443a25 Rob Herring           2018-08-27  165  		pr_err("%pOFn: unable to get resource\n", np);
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  166  		return ret;
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  167  	}
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  168  
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  169  	if (!request_mem_region(r.start, resource_size(&r), np->name)) {
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  170  		pr_err("%s: unable to request mem region\n", np->name);
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  171  		return -ENOMEM;
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  172  	}
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  173  
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  174  	/* Map the parent interrupt for the chained handler */
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  175  	irq = irq_of_parse_and_map(np, 0);
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  176  	if (irq <= 0) {
2ef790dc443a25 Rob Herring           2018-08-27  177  		pr_err("%pOFn: unable to parse irq\n", np);
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  178  		return -EINVAL;
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  179  	}
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  180  
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  181  	gc = irq_get_domain_generic_chip(domain, 0);
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  182  	gc->reg_base = ioremap(r.start, resource_size(&r));
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  183  	if (!gc->reg_base) {
2ef790dc443a25 Rob Herring           2018-08-27  184  		pr_err("%pOFn: unable to map resource\n", np);
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  185  		return -ENOMEM;
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  186  	}
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  187  
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  188  	gc->chip_types[0].regs.ack = ORION_BRIDGE_IRQ_CAUSE;
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  189  	gc->chip_types[0].regs.mask = ORION_BRIDGE_IRQ_MASK;
e0318ec3bf3f15 Sebastian Hesselbarth 2014-01-24  190  	gc->chip_types[0].chip.irq_startup = orion_bridge_irq_startup;
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  191  	gc->chip_types[0].chip.irq_ack = irq_gc_ack_clr_bit;
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  192  	gc->chip_types[0].chip.irq_mask = irq_gc_mask_clr_bit;
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  193  	gc->chip_types[0].chip.irq_unmask = irq_gc_mask_set_bit;
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  194  
7b119fd1bdc59a Sebastian Hesselbarth 2014-01-23  195  	/* mask and clear all interrupts */
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  196  	writel(0, gc->reg_base + ORION_BRIDGE_IRQ_MASK);
7b119fd1bdc59a Sebastian Hesselbarth 2014-01-23  197  	writel(0, gc->reg_base + ORION_BRIDGE_IRQ_CAUSE);
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  198  
07d22c23d63a3d Thomas Gleixner       2015-06-21  199  	irq_set_chained_handler_and_data(irq, orion_bridge_irq_handler,
07d22c23d63a3d Thomas Gleixner       2015-06-21  200  					 domain);
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06  201  
9dbd90f17e4f38 Sebastian Hesselbarth 2013-06-06 @202  	return 0;

:::::: The code at line 202 was first introduced by commit
:::::: 9dbd90f17e4f380593ec5194c2a4d5e52c5f72d1 irqchip: Add support for Marvell Orion SoCs

:::::: TO: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
