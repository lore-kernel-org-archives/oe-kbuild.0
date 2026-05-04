Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A19C1A680A
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 01:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777859496; cv=none; b=IZiF0QD+Am/bgkxJi3TJWLtgfnni8RkEC1juIPfT89IYqThPjVo9LqIalQWns73tBtrFExQSJASOtCmxm9Hz4T6usgqOzbi5tU//oQ3ikZpAhYxunqak1Te3Ag/QkvMrRyzQgMTKSDIinQ8wrX6c7XOK3YsvHaAiPazRe2Lw54c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777859496; c=relaxed/simple;
	bh=5f+B/6z0nYbSMDSr/TLTxyaisKlYOxzbXhqQKDwqwac=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xsge2/Uxx/a7td8X4AkslvzGfjA5NUTt12qtN/jV6wcRRJWyV0lqtwQaN6KNpp9E6mvknxkhwTqeu3jR31T/3zLonScf7l+Z1un6bZduWnNiY7UMS9V52TM5BrB8FRfyWPNOLCPSzS5zfVSXgiKRvwtyDq4ohv20KWIV4VAK9ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWuXp+wE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWuXp+wE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777859493; x=1809395493;
  h=date:from:to:cc:subject:message-id;
  bh=5f+B/6z0nYbSMDSr/TLTxyaisKlYOxzbXhqQKDwqwac=;
  b=FWuXp+wEmXaI2lcQbABvTP/SR9EzqpitzfpkcLFYJ2jrBU2t7s2dGnmo
   y4buNoABL8sF9Ex4BEcfx3K5krLNM0TuqvXtLOasxSmFUvEb8/hUjkhhf
   EOttZZwv9hUaNiittKAEJ3pZ1QVQcwx6Mx33eLdOGgdM+rrYk+ljI0c4T
   mxztFVzphqrkt0FaUg3a6eu1UzG8zZZqjX9VyqrslYQHGCx6KgJ+CEsZc
   RrYzHjhVXVPnjabiHnB4j6Ucl8hNGmMa0SKlUgyXsnz1uUjrQMfKksL2x
   lpgqoRg/s2zxR5NwrNm/aqxoJ3saiD7geYRF1tuouZX0jvYqQT+SWxXwz
   A==;
X-CSE-ConnectionGUID: 6q31a9jIQgaLToSgSw6QOQ==
X-CSE-MsgGUID: o500qAwMQQ2vi0rVrW4pMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96285513"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="96285513"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 18:51:33 -0700
X-CSE-ConnectionGUID: +fnh5Q5HSYSLCK0td6HGug==
X-CSE-MsgGUID: H62nTM4PRLqPxjxvjMj9Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="235446971"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 May 2026 18:51:32 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJiSt-000000003M5-3lea;
	Mon, 04 May 2026 01:51:22 +0000
Date: Mon, 04 May 2026 09:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/acpi/riscv/irq.c:161:24-28: ERROR: invalid reference
 to the index variable of the iterator on line 155
Message-ID: <202605040952.mqtlmoev-lkp@intel.com>
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
head:   6d35786de28116ecf78797a62b84e6bf3c45aa5a
commit: 4d185fdeef67d0c2c5d4a142392cf1ade3786dd2 ACPI: RISC-V: Add support to update gsi range
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-r064-20260504 (https://download.01.org/0day-ci/archive/20260504/202605040952.mqtlmoev-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4d185fdeef67 ("ACPI: RISC-V: Add support to update gsi range")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605040952.mqtlmoev-lkp@intel.com/

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
