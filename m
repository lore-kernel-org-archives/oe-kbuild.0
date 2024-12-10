Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E68635
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Dec 2024 00:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733789615; cv=none; b=psaV34DWS5kPzWGc7hVxJ+HNBO7nTrY6s+Z3sjMn7jRgI5kv9GmPny9XvMN9gLEDqBE60vJAu9VSTi9RuFTJdkqZjEmFpRLh4aN8Q4mSr037wYpFDdPGT6ZBdhyKcGCA9rmBGNyUIvLfREYcZ8Vxj736Awta/BmHhV/2GJBP15Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733789615; c=relaxed/simple;
	bh=6NuqrjdlAdADF7bmD4d0yV62s4KIRleczpGwWnmtZLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pjp3kKrfeLVG9bDsyWIQTyxV71XJCtPAU/NERpsNLgj/OxLxsRMd0OClCoLDVP/cv6htwMGrOJsUsa1P2FNgIEGVjpuhqWpn2TpMahExan7dlRFFoNo39nuoXOWHlKXtzQc6GpZON8OBCR9k/yhqdYvE+8e97SU7riQBOpFtkE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpcM/9et; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpcM/9et"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733789613; x=1765325613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6NuqrjdlAdADF7bmD4d0yV62s4KIRleczpGwWnmtZLM=;
  b=DpcM/9etg54QGN+0hKQkUYhxHt7u5VsZ2bIOxYqDNMxiB5H3Jkb+FSmG
   2m0DTl71idX1RZo4Nhs2grRDycoQU04ig3OnEUfGiP7fB2uOVC5OVhIGH
   JMtRneR7saRwp/ldfDzX5iaTgszVnhkaJMeXn7W63RrbZSW3v++keLArz
   myz9IZ7bPFiBXStCKoKV9TkZKH+MMwkxL9vx4o8CbxbPVJlW4SRfB7Cts
   M7SAXhM7Hm4kLlNtpqFCU9SfZmPV4nLxz45zryk4xpJWadzX9qh0b/hBe
   d/azjCc6eWyGpq5B3HjsKBh2KaDXc8e33TqeRcZLI31xWA+CZlYJbO6UX
   w==;
X-CSE-ConnectionGUID: WzZrO0PjQtmHf97WfI7TQQ==
X-CSE-MsgGUID: PPcQP7mnRLSLwOPndKHxdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="37800807"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="37800807"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 16:13:31 -0800
X-CSE-ConnectionGUID: 4Sn+UWlxTMSDsklalYH8SA==
X-CSE-MsgGUID: bwuGbpeIRKy9RzP0M0Q32g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="126128187"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2024 16:13:29 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKnsV-0004xv-0r;
	Tue, 10 Dec 2024 00:13:27 +0000
Date: Tue, 10 Dec 2024 08:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH bpf-next v1 2/4] bpf: Fix narrow scalar spill onto 64-bit
 spilled scalar slots
Message-ID: <202412100844.9OZw7n63-lkp@intel.com>
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
In-Reply-To: <20241127185135.2753982-3-memxor@gmail.com>
References: <20241127185135.2753982-3-memxor@gmail.com>
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>

Hi Kumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c8d02b547363880d996f80c38cc8b997c7b90725]

url:    https://github.com/intel-lab-lkp/linux/commits/Kumar-Kartikeya-Dwivedi/bpf-Don-t-relax-STACK_INVALID-to-STACK_MISC-when-not-allow_ptr_leaks/20241128-120420
base:   c8d02b547363880d996f80c38cc8b997c7b90725
patch link:    https://lore.kernel.org/r/20241127185135.2753982-3-memxor%40gmail.com
patch subject: [PATCH bpf-next v1 2/4] bpf: Fix narrow scalar spill onto 64-bit spilled scalar slots
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: riscv-randconfig-r071-20241208 (https://download.01.org/0day-ci/archive/20241210/202412100844.9OZw7n63-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412100844.9OZw7n63-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-thead-c900-aclint-sswi.c:168 thead_aclint_sswi_probe() warn: 'reg' from of_iomap() not released on lines: 129,139,145,153.

vim +/reg +168 drivers/irqchip/irq-thead-c900-aclint-sswi.c

25caea955cc9505 Inochi Amaoto 2024-10-31  107  
25caea955cc9505 Inochi Amaoto 2024-10-31  108  static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
25caea955cc9505 Inochi Amaoto 2024-10-31  109  {
25caea955cc9505 Inochi Amaoto 2024-10-31  110  	struct irq_domain *domain;
25caea955cc9505 Inochi Amaoto 2024-10-31  111  	void __iomem *reg;
25caea955cc9505 Inochi Amaoto 2024-10-31  112  	int virq, rc;
25caea955cc9505 Inochi Amaoto 2024-10-31  113  
25caea955cc9505 Inochi Amaoto 2024-10-31  114  	/* If it is T-HEAD CPU, check whether SSWI is enabled */
25caea955cc9505 Inochi Amaoto 2024-10-31  115  	if (riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
25caea955cc9505 Inochi Amaoto 2024-10-31  116  	    !(csr_read(THEAD_C9XX_CSR_SXSTATUS) & THEAD_C9XX_SXSTATUS_CLINTEE))
25caea955cc9505 Inochi Amaoto 2024-10-31  117  		return -ENOTSUPP;
25caea955cc9505 Inochi Amaoto 2024-10-31  118  
25caea955cc9505 Inochi Amaoto 2024-10-31  119  	if (!is_of_node(fwnode))
25caea955cc9505 Inochi Amaoto 2024-10-31  120  		return -EINVAL;
25caea955cc9505 Inochi Amaoto 2024-10-31  121  
25caea955cc9505 Inochi Amaoto 2024-10-31  122  	reg = of_iomap(to_of_node(fwnode), 0);
25caea955cc9505 Inochi Amaoto 2024-10-31  123  	if (!reg)
25caea955cc9505 Inochi Amaoto 2024-10-31  124  		return -ENOMEM;
25caea955cc9505 Inochi Amaoto 2024-10-31  125  
25caea955cc9505 Inochi Amaoto 2024-10-31  126  	/* Parse SSWI setting */
25caea955cc9505 Inochi Amaoto 2024-10-31  127  	rc = thead_aclint_sswi_parse_irq(fwnode, reg);
25caea955cc9505 Inochi Amaoto 2024-10-31  128  	if (rc < 0)
25caea955cc9505 Inochi Amaoto 2024-10-31  129  		return rc;
25caea955cc9505 Inochi Amaoto 2024-10-31  130  
25caea955cc9505 Inochi Amaoto 2024-10-31  131  	/* If mulitple SSWI devices are present, do not register irq again */
25caea955cc9505 Inochi Amaoto 2024-10-31  132  	if (sswi_ipi_virq)
25caea955cc9505 Inochi Amaoto 2024-10-31  133  		return 0;
25caea955cc9505 Inochi Amaoto 2024-10-31  134  
25caea955cc9505 Inochi Amaoto 2024-10-31  135  	/* Find riscv intc domain and create IPI irq mapping */
25caea955cc9505 Inochi Amaoto 2024-10-31  136  	domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(), DOMAIN_BUS_ANY);
25caea955cc9505 Inochi Amaoto 2024-10-31  137  	if (!domain) {
25caea955cc9505 Inochi Amaoto 2024-10-31  138  		pr_err("%pfwP: Failed to find INTC domain\n", fwnode);
25caea955cc9505 Inochi Amaoto 2024-10-31  139  		return -ENOENT;
25caea955cc9505 Inochi Amaoto 2024-10-31  140  	}
25caea955cc9505 Inochi Amaoto 2024-10-31  141  
25caea955cc9505 Inochi Amaoto 2024-10-31  142  	sswi_ipi_virq = irq_create_mapping(domain, RV_IRQ_SOFT);
25caea955cc9505 Inochi Amaoto 2024-10-31  143  	if (!sswi_ipi_virq) {
25caea955cc9505 Inochi Amaoto 2024-10-31  144  		pr_err("unable to create ACLINT SSWI IRQ mapping\n");
25caea955cc9505 Inochi Amaoto 2024-10-31  145  		return -ENOMEM;
25caea955cc9505 Inochi Amaoto 2024-10-31  146  	}
25caea955cc9505 Inochi Amaoto 2024-10-31  147  
25caea955cc9505 Inochi Amaoto 2024-10-31  148  	/* Register SSWI irq and handler */
25caea955cc9505 Inochi Amaoto 2024-10-31  149  	virq = ipi_mux_create(BITS_PER_BYTE, thead_aclint_sswi_ipi_send);
25caea955cc9505 Inochi Amaoto 2024-10-31  150  	if (virq <= 0) {
25caea955cc9505 Inochi Amaoto 2024-10-31  151  		pr_err("unable to create muxed IPIs\n");
25caea955cc9505 Inochi Amaoto 2024-10-31  152  		irq_dispose_mapping(sswi_ipi_virq);
25caea955cc9505 Inochi Amaoto 2024-10-31  153  		return virq < 0 ? virq : -ENOMEM;
25caea955cc9505 Inochi Amaoto 2024-10-31  154  	}
25caea955cc9505 Inochi Amaoto 2024-10-31  155  
25caea955cc9505 Inochi Amaoto 2024-10-31  156  	irq_set_chained_handler(sswi_ipi_virq, thead_aclint_sswi_ipi_handle);
25caea955cc9505 Inochi Amaoto 2024-10-31  157  
25caea955cc9505 Inochi Amaoto 2024-10-31  158  	cpuhp_setup_state(CPUHP_AP_IRQ_THEAD_ACLINT_SSWI_STARTING,
25caea955cc9505 Inochi Amaoto 2024-10-31  159  			  "irqchip/thead-aclint-sswi:starting",
25caea955cc9505 Inochi Amaoto 2024-10-31  160  			  thead_aclint_sswi_starting_cpu,
25caea955cc9505 Inochi Amaoto 2024-10-31  161  			  thead_aclint_sswi_dying_cpu);
25caea955cc9505 Inochi Amaoto 2024-10-31  162  
25caea955cc9505 Inochi Amaoto 2024-10-31  163  	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
25caea955cc9505 Inochi Amaoto 2024-10-31  164  
25caea955cc9505 Inochi Amaoto 2024-10-31  165  	/* Announce that SSWI is providing IPIs */
25caea955cc9505 Inochi Amaoto 2024-10-31  166  	pr_info("providing IPIs using THEAD ACLINT SSWI\n");
25caea955cc9505 Inochi Amaoto 2024-10-31  167  
25caea955cc9505 Inochi Amaoto 2024-10-31 @168  	return 0;
25caea955cc9505 Inochi Amaoto 2024-10-31  169  }
25caea955cc9505 Inochi Amaoto 2024-10-31  170  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
