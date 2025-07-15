Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9212E266C
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Jul 2025 13:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585498; cv=none; b=p+9JceNoSGkZ+vUE0i1H/OtUtaIZK4OydlnmgXgSU8tEDD/U0LwRUqPNmL/2C/hqaOjuqZt4WfLEJPK2YNYlwAAjsmPwWBqIxpwYSkKQ8fjtD1S6Rlxvuf6rH5qm1piVRARqbzYq0SCRnKSN7KV9/BwBC5BYPMSca4YanC3NpSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585498; c=relaxed/simple;
	bh=7Im+14pf0QD3zlHvrbPtvTAKYE0CZerUSd5PlQGtYgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q6Tkcl9h555Lze7cf29WVd/6Byh4AW7h6qc7FJ/IbZtQNnd1gW4zUbF5mDG2wNE6DPzyTD/W5ChfQnoUfMZYJyEWrJrQt6EL+7CvsxDudZnk0/vVd4O9yQNUGuYYdvMTcv4g88oJBjPfBHtORI8Dstye8UXrvE6cFzlFAtwr7xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lTFXDgp5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTFXDgp5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752585496; x=1784121496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Im+14pf0QD3zlHvrbPtvTAKYE0CZerUSd5PlQGtYgU=;
  b=lTFXDgp5J6Cj0XU/lpKrImKhlqv78aTTvxbwt+3EGj9Hp1gmU2meiOE7
   VOw0eRZe3le1ydByqVTsfGcL3cgi/lf0N4VMB0P5HFqY/adeClCtU0rS2
   p5tYwpLA28VQD9GWoM6hoxPt07XVF1u5G8uNJuXme01jMbGZmbzv3HLgl
   Kc7It63ed5v2CBOhb7HBlJLErbYz4t28rLQ/njMgmzVu3tghEcSEGLt+X
   xLOpOJvJ+4q1ij42nVEQQhgI4bGyfUW+B9Zfz2sIXO8BrpdtDUj8gp+no
   OUwY/hUx1xiIvGi+Ow/j4XjSLF10vzribNMj9Gmnqsbvb57TNPeFGNg6C
   w==;
X-CSE-ConnectionGUID: f3Vx4FqvSL6H+bwwPkOHGw==
X-CSE-MsgGUID: v0QvrIE/TEOXlEa2jdNAcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65374723"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="65374723"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 06:18:16 -0700
X-CSE-ConnectionGUID: Gg6oune7TQ+VlPrStNuwvg==
X-CSE-MsgGUID: DSZNdrHKRfiv4reKfDeYnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="180921467"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jul 2025 06:18:14 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubfXw-000A6Z-0m;
	Tue, 15 Jul 2025 13:18:12 +0000
Date: Tue, 15 Jul 2025 21:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [avpatel:riscv_trace_support_v1 36/79]
 drivers/acpi/riscv/irq.c:161:24-28: ERROR: invalid reference to the index
 variable of the iterator on line 155
Message-ID: <202507152118.FLICKYbg-lkp@intel.com>
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
TO: Sunil V L <sunilvl@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   bbedafbba85a78dae84bbf5a5844aaab3934e316
commit: 688a6330c159913886ab2536f0aa076f97a31ee6 [36/79] ACPI: RISC-V: Add support to update gsi range
:::::: branch date: 29 hours ago
:::::: commit date: 4 days ago
config: riscv-randconfig-r064-20250715 (https://download.01.org/0day-ci/archive/20250715/202507152118.FLICKYbg-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202507152118.FLICKYbg-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/acpi/riscv/irq.c:161:24-28: ERROR: invalid reference to the index variable of the iterator on line 155

vim +161 drivers/acpi/riscv/irq.c

e77b8dc02a1ca2 Sunil V L 2024-08-12  133  
e77b8dc02a1ca2 Sunil V L 2024-08-12  134  static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
e77b8dc02a1ca2 Sunil V L 2024-08-12  135  					       u32 id, u32 type)
e77b8dc02a1ca2 Sunil V L 2024-08-12  136  {
688a6330c15991 Sunil V L 2025-05-09  137  	struct riscv_ext_intc_list *ext_intc_element, *node, *prev;
e77b8dc02a1ca2 Sunil V L 2024-08-12  138  
e77b8dc02a1ca2 Sunil V L 2024-08-12  139  	ext_intc_element = kzalloc(sizeof(*ext_intc_element), GFP_KERNEL);
e77b8dc02a1ca2 Sunil V L 2024-08-12  140  	if (!ext_intc_element)
e77b8dc02a1ca2 Sunil V L 2024-08-12  141  		return -ENOMEM;
e77b8dc02a1ca2 Sunil V L 2024-08-12  142  
e77b8dc02a1ca2 Sunil V L 2024-08-12  143  	ext_intc_element->gsi_base = gsi_base;
688a6330c15991 Sunil V L 2025-05-09  144  
688a6330c15991 Sunil V L 2025-05-09  145  	/* If nr_irqs is zero, indicate it in flag and set to max range possible */
688a6330c15991 Sunil V L 2025-05-09  146  	if (nr_irqs) {
e77b8dc02a1ca2 Sunil V L 2024-08-12  147  		ext_intc_element->nr_irqs = nr_irqs;
688a6330c15991 Sunil V L 2025-05-09  148  	} else {
688a6330c15991 Sunil V L 2025-05-09  149  		ext_intc_element->flag |= RISCV_ACPI_INTC_FLAG_PENDING;
688a6330c15991 Sunil V L 2025-05-09  150  		ext_intc_element->nr_irqs = U32_MAX - ext_intc_element->gsi_base;
688a6330c15991 Sunil V L 2025-05-09  151  	}
688a6330c15991 Sunil V L 2025-05-09  152  
e77b8dc02a1ca2 Sunil V L 2024-08-12  153  	ext_intc_element->nr_idcs = nr_idcs;
e77b8dc02a1ca2 Sunil V L 2024-08-12  154  	ext_intc_element->id = id;
5ef5284c87865c Sunil V L 2025-06-10 @155  	list_for_each_entry(node, &ext_intc_list, list) {
5ef5284c87865c Sunil V L 2025-06-10  156  		if (node->gsi_base < ext_intc_element->gsi_base)
5ef5284c87865c Sunil V L 2025-06-10  157  			break;
5ef5284c87865c Sunil V L 2025-06-10  158  	}
5ef5284c87865c Sunil V L 2025-06-10  159  
688a6330c15991 Sunil V L 2025-05-09  160  	/* Adjust the previous node's GSI range if that has pending registration */
688a6330c15991 Sunil V L 2025-05-09 @161  	prev = list_prev_entry(node, list);
688a6330c15991 Sunil V L 2025-05-09  162  	if (!list_entry_is_head(prev, &ext_intc_list, list)) {
688a6330c15991 Sunil V L 2025-05-09  163  		if (prev->flag & RISCV_ACPI_INTC_FLAG_PENDING)
688a6330c15991 Sunil V L 2025-05-09  164  			prev->nr_irqs = ext_intc_element->gsi_base - prev->gsi_base;
688a6330c15991 Sunil V L 2025-05-09  165  	}
688a6330c15991 Sunil V L 2025-05-09  166  
5ef5284c87865c Sunil V L 2025-06-10  167  	list_add_tail(&ext_intc_element->list, &node->list);
e77b8dc02a1ca2 Sunil V L 2024-08-12  168  	return 0;
e77b8dc02a1ca2 Sunil V L 2024-08-12  169  }
e77b8dc02a1ca2 Sunil V L 2024-08-12  170  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
