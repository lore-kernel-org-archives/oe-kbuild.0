Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D2C2BF00B
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Jul 2025 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753960662; cv=none; b=g2XH/fZqL9Lt2xk9luZjFS/fZK9Yer81J3DTayS2mDu2kt9PO5MzZXu+aJWcPp1bvmFVg62BN2B+FkjcIgrjZPSbTRaKO01ZX+G9ZlDtv7H7zhdDqjlIJ8BbYkUp9KpLBkL35tWlZb7GOJpPjybt8v7+H/7hVw7uFzD3bt7fLIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753960662; c=relaxed/simple;
	bh=ahiQ76Rx9KpnV4BeFR85pK+/hxZVbFdJZf7aMRU6d6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IoUx5nau8RLAPRcwR5SMhcIv0PlJR4oTarKrL3oxUYgUTZKql5Kw4MBLMbQ4XSdG6sZHWN8kvjNob++gQTx4Orc1dRXhW56zbPPiSLOwSQAQDTHQSjrbERU0Vl1ph0hR0I8VsiF4myffQIJyMtvEZMnRiZXtZRClGFzxo6WEqd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6hIEXop; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6hIEXop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753960661; x=1785496661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ahiQ76Rx9KpnV4BeFR85pK+/hxZVbFdJZf7aMRU6d6Q=;
  b=Q6hIEXopLsDHMGOtPPu3d7f5eIMC3sO1vu2S5ZwE1nW2P7cYcv+OCkUC
   /WQ/1O9iXr2Ij4H9CzI88RKbndfdw7oPdrHYqia8yORlToW8yFYoqN958
   BlZJsDD7e0NpHCGIp0++2h/27np8rqFYVWrHNc9SDDh/sEOBFD+b2mY7H
   eoWfPTxFA2X0dNRRSWClnvPATeTpEF2s3tiHg69JDUQcKq8yw2giWbgck
   r1WwT985SGtPjV127GuidFfJlcxNzbFurcFNQqOr+/7EkSsYmZ6jBBb6A
   oKzdSO3Zzyka3xApWC/zL7mU23xR0WqQWgyAo6BusfvV5WbFWLidR0C3/
   g==;
X-CSE-ConnectionGUID: Hdh2Np66SAiKTUH6I6gEYQ==
X-CSE-MsgGUID: uqAlq9xFS82QtQfufjqNag==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56146625"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="56146625"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 04:17:40 -0700
X-CSE-ConnectionGUID: Ds9C+c+bRgeIUq9lKP1VmQ==
X-CSE-MsgGUID: 7qCaqqeUTgSFBNvP9qt6Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="163258506"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Jul 2025 04:17:39 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhRI0-0003iU-1n;
	Thu, 31 Jul 2025 11:17:36 +0000
Date: Thu, 31 Jul 2025 19:17:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/irqchip/irq-riscv-imsic-platform.c:317
 imsic_irqdomain_init() warn: variable dereferenced before check 'imsic' (see
 line 311)
Message-ID: <202507311953.NFVZkr0a-lkp@intel.com>
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
TO: Marc Zyngier <maz@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   260f6f4fda93c8485c8037865c941b42b9cba5d2
commit: 59422904dd9855f94d00dc66598bef1bd2663894 irqchip/riscv-imsic: Convert to msi_create_parent_irq_domain() helper
date:   4 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-r073-20250731 (https://download.01.org/0day-ci/archive/20250731/202507311953.NFVZkr0a-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507311953.NFVZkr0a-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-riscv-imsic-platform.c:317 imsic_irqdomain_init() warn: variable dereferenced before check 'imsic' (see line 311)

vim +/imsic +317 drivers/irqchip/irq-riscv-imsic-platform.c

027e125acdbad7 Anup Patel   2024-03-07  307  
027e125acdbad7 Anup Patel   2024-03-07  308  int imsic_irqdomain_init(void)
027e125acdbad7 Anup Patel   2024-03-07  309  {
59422904dd9855 Marc Zyngier 2025-06-26  310  	struct irq_domain_info info = {
59422904dd9855 Marc Zyngier 2025-06-26 @311  		.fwnode		= imsic->fwnode,
59422904dd9855 Marc Zyngier 2025-06-26  312  		.ops		= &imsic_base_domain_ops,
59422904dd9855 Marc Zyngier 2025-06-26  313  		.host_data	= imsic,
59422904dd9855 Marc Zyngier 2025-06-26  314  	};
027e125acdbad7 Anup Patel   2024-03-07  315  	struct imsic_global_config *global;
027e125acdbad7 Anup Patel   2024-03-07  316  
027e125acdbad7 Anup Patel   2024-03-07 @317  	if (!imsic || !imsic->fwnode) {
027e125acdbad7 Anup Patel   2024-03-07  318  		pr_err("early driver not probed\n");
027e125acdbad7 Anup Patel   2024-03-07  319  		return -ENODEV;
027e125acdbad7 Anup Patel   2024-03-07  320  	}
027e125acdbad7 Anup Patel   2024-03-07  321  
027e125acdbad7 Anup Patel   2024-03-07  322  	if (imsic->base_domain) {
027e125acdbad7 Anup Patel   2024-03-07  323  		pr_err("%pfwP: irq domain already created\n", imsic->fwnode);
027e125acdbad7 Anup Patel   2024-03-07  324  		return -ENODEV;
027e125acdbad7 Anup Patel   2024-03-07  325  	}
027e125acdbad7 Anup Patel   2024-03-07  326  
027e125acdbad7 Anup Patel   2024-03-07  327  	/* Create Base IRQ domain */
59422904dd9855 Marc Zyngier 2025-06-26  328  	imsic->base_domain = msi_create_parent_irq_domain(&info, &imsic_msi_parent_ops);
027e125acdbad7 Anup Patel   2024-03-07  329  	if (!imsic->base_domain) {
027e125acdbad7 Anup Patel   2024-03-07  330  		pr_err("%pfwP: failed to create IMSIC base domain\n", imsic->fwnode);
027e125acdbad7 Anup Patel   2024-03-07  331  		return -ENOMEM;
027e125acdbad7 Anup Patel   2024-03-07  332  	}
027e125acdbad7 Anup Patel   2024-03-07  333  
027e125acdbad7 Anup Patel   2024-03-07  334  	global = &imsic->global;
027e125acdbad7 Anup Patel   2024-03-07  335  	pr_info("%pfwP:  hart-index-bits: %d,  guest-index-bits: %d\n",
027e125acdbad7 Anup Patel   2024-03-07  336  		imsic->fwnode, global->hart_index_bits, global->guest_index_bits);
027e125acdbad7 Anup Patel   2024-03-07  337  	pr_info("%pfwP: group-index-bits: %d, group-index-shift: %d\n",
027e125acdbad7 Anup Patel   2024-03-07  338  		imsic->fwnode, global->group_index_bits, global->group_index_shift);
4a1361e9a5c5db Andrew Jones 2024-09-09  339  	pr_info("%pfwP: per-CPU IDs %d at base address %pa\n",
027e125acdbad7 Anup Patel   2024-03-07  340  		imsic->fwnode, global->nr_ids, &global->base_addr);
027e125acdbad7 Anup Patel   2024-03-07  341  	pr_info("%pfwP: total %d interrupts available\n",
027e125acdbad7 Anup Patel   2024-03-07  342  		imsic->fwnode, num_possible_cpus() * (global->nr_ids - 1));
027e125acdbad7 Anup Patel   2024-03-07  343  
027e125acdbad7 Anup Patel   2024-03-07  344  	return 0;
027e125acdbad7 Anup Patel   2024-03-07  345  }
027e125acdbad7 Anup Patel   2024-03-07  346  

:::::: The code at line 317 was first introduced by commit
:::::: 027e125acdbad79e9a7274940e8bf92299b208af irqchip/riscv-imsic: Add device MSI domain support for platform devices

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
