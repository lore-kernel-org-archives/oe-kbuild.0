Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B3136402D
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jun 2026 11:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732762; cv=none; b=obTbmotOCw/16GRbS3xod8hSAarkEsFl8h6/v8QtdRjH0KrYQiqyxlkMe32lK11BA6+engUDUJ+KfXAFqT/aC51SfK/UyoqX1WLuvIhhiZigI+p5cMB8jLtaXuHmWy+OjWis1talegHyl5KCsZtmtfq4THCaKQmZlG35VDeDZl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732762; c=relaxed/simple;
	bh=BgGA6nbozNx+39HK4Xbo1+hWSDPRXFo8GKXZQo0/puM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fFJXkvx4npPQbtNJdJjl/azqNLLcrjr5FWYw13Q42JxZ6jM6oeonaS3GmD7nXAzFK1tFrJrfwzCT67QvV5DwiRzVD1FivngVRMuMe2+b1ry3tftkbZR+TPtVtSDd6rjv2xPEihYNs/PxTLzUT/AXTwWmPCx3SiSB6gOzihFFoO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RRehzp+O; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RRehzp+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782732760; x=1814268760;
  h=date:from:to:cc:subject:message-id;
  bh=BgGA6nbozNx+39HK4Xbo1+hWSDPRXFo8GKXZQo0/puM=;
  b=RRehzp+OHFn8iUb8yyX9Ov2EFiqBeUMu4zm61avLINhKoxnRKsTcR7qQ
   AJckmVeit9L0NY18ZFjxGsc9cJRH+V15GLpoNJkdklQQmpPZIK0tPfA8m
   E/RO/6MLaWZvTDX4yT/NsP8E8fHjvyNMVSf671pGeMczBR8hVPJBmFWF4
   Epa1zDdXrcrcRdyaKRH1GQtsIq6eU9UZaOubTUDcKRzkYqsgJ3E6x6C4z
   mCXOCHDCCnNIwAK+QQn9icOUAfKE3Vm+U7a/4n4P4e2xMiEjoCjXAieU8
   Rr9E2bZ1wrQxmlvJV9xYbuvSYMy+B+SoYq0Dhwm/VROPyEmB18FXshYZE
   Q==;
X-CSE-ConnectionGUID: U4nnIw4zQNySz1Bgz9e7FQ==
X-CSE-MsgGUID: XWUK5sRyTreiI+qUjqvxNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="85966230"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="85966230"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:32:40 -0700
X-CSE-ConnectionGUID: +4xRmPo9RHGR4uTMjvl1pw==
X-CSE-MsgGUID: EmYeHRaBSQuPNYNqYypw9A==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jun 2026 04:32:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weAE8-000000007Lv-2Xl6;
	Mon, 29 Jun 2026 11:32:36 +0000
Date: Mon, 29 Jun 2026 19:31:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/acpi/riscv/irq.c:161:24-28: ERROR: invalid reference
 to the index variable of the iterator on line 155
Message-ID: <202606291919.3qKk5h1d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sunil V L <sunilvl@ventanamicro.com>
CC: Paul Walmsley <pjw@kernel.org>
CC: Anup Patel <apatel@ventanamicro.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: 4d185fdeef67d0c2c5d4a142392cf1ade3786dd2 ACPI: RISC-V: Add support to update gsi range
date:   9 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 months ago
config: riscv-randconfig-r062-20260629 (https://download.01.org/0day-ci/archive/20260629/202606291919.3qKk5h1d-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4d185fdeef67 ("ACPI: RISC-V: Add support to update gsi range")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606291919.3qKk5h1d-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/acpi/riscv/irq.c:161:24-28: ERROR: invalid reference to the index variable of the iterator on line 155

vim +161 drivers/acpi/riscv/irq.c

e77b8dc02a1ca2 Sunil V L 2024-08-12  133  
e77b8dc02a1ca2 Sunil V L 2024-08-12  134  static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
e77b8dc02a1ca2 Sunil V L 2024-08-12  135  					       u32 id, u32 type)
e77b8dc02a1ca2 Sunil V L 2024-08-12  136  {
4d185fdeef67d0 Sunil V L 2025-08-18  137  	struct riscv_ext_intc_list *ext_intc_element, *node, *prev;
e77b8dc02a1ca2 Sunil V L 2024-08-12  138  
e77b8dc02a1ca2 Sunil V L 2024-08-12  139  	ext_intc_element = kzalloc(sizeof(*ext_intc_element), GFP_KERNEL);
e77b8dc02a1ca2 Sunil V L 2024-08-12  140  	if (!ext_intc_element)
e77b8dc02a1ca2 Sunil V L 2024-08-12  141  		return -ENOMEM;
e77b8dc02a1ca2 Sunil V L 2024-08-12  142  
e77b8dc02a1ca2 Sunil V L 2024-08-12  143  	ext_intc_element->gsi_base = gsi_base;
4d185fdeef67d0 Sunil V L 2025-08-18  144  
4d185fdeef67d0 Sunil V L 2025-08-18  145  	/* If nr_irqs is zero, indicate it in flag and set to max range possible */
4d185fdeef67d0 Sunil V L 2025-08-18  146  	if (nr_irqs) {
e77b8dc02a1ca2 Sunil V L 2024-08-12  147  		ext_intc_element->nr_irqs = nr_irqs;
4d185fdeef67d0 Sunil V L 2025-08-18  148  	} else {
4d185fdeef67d0 Sunil V L 2025-08-18  149  		ext_intc_element->flag |= RISCV_ACPI_INTC_FLAG_PENDING;
4d185fdeef67d0 Sunil V L 2025-08-18  150  		ext_intc_element->nr_irqs = U32_MAX - ext_intc_element->gsi_base;
4d185fdeef67d0 Sunil V L 2025-08-18  151  	}
4d185fdeef67d0 Sunil V L 2025-08-18  152  
e77b8dc02a1ca2 Sunil V L 2024-08-12  153  	ext_intc_element->nr_idcs = nr_idcs;
e77b8dc02a1ca2 Sunil V L 2024-08-12  154  	ext_intc_element->id = id;
694b2ef1e73c5e Sunil V L 2025-08-18 @155  	list_for_each_entry(node, &ext_intc_list, list) {
694b2ef1e73c5e Sunil V L 2025-08-18  156  		if (node->gsi_base < ext_intc_element->gsi_base)
694b2ef1e73c5e Sunil V L 2025-08-18  157  			break;
694b2ef1e73c5e Sunil V L 2025-08-18  158  	}
694b2ef1e73c5e Sunil V L 2025-08-18  159  
4d185fdeef67d0 Sunil V L 2025-08-18  160  	/* Adjust the previous node's GSI range if that has pending registration */
4d185fdeef67d0 Sunil V L 2025-08-18 @161  	prev = list_prev_entry(node, list);
4d185fdeef67d0 Sunil V L 2025-08-18  162  	if (!list_entry_is_head(prev, &ext_intc_list, list)) {
4d185fdeef67d0 Sunil V L 2025-08-18  163  		if (prev->flag & RISCV_ACPI_INTC_FLAG_PENDING)
4d185fdeef67d0 Sunil V L 2025-08-18  164  			prev->nr_irqs = ext_intc_element->gsi_base - prev->gsi_base;
4d185fdeef67d0 Sunil V L 2025-08-18  165  	}
4d185fdeef67d0 Sunil V L 2025-08-18  166  
694b2ef1e73c5e Sunil V L 2025-08-18  167  	list_add_tail(&ext_intc_element->list, &node->list);
e77b8dc02a1ca2 Sunil V L 2024-08-12  168  	return 0;
e77b8dc02a1ca2 Sunil V L 2024-08-12  169  }
e77b8dc02a1ca2 Sunil V L 2024-08-12  170  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
