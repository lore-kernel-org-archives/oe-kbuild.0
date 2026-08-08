Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C75F7E105
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Aug 2026 01:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786151954; cv=none; b=ZnkWrmCAH2ZBqrtMLgdOAXupDFTNZKD+WmsD18a+lLJCX2RmbBXN3q+BGQSbISlqwiT7QSR6O01J7qjN7c1jfSLHb6UsqF/rX4VMdl+TirdMNMKIn/JV6zzp/LXoKCgIsJnhMkPYdCyXcx86LP82LzJYvBPT5da00xa20qKBKAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786151954; c=relaxed/simple;
	bh=lzLsQzOAHZKtJgIKf6Y3OoFcZxGuhPJDHvzkm/FkHwM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pNL3c7cUI1tq7NYaB0fcGDtFPJfm5CTraSb1BEf1VRD8mnmIiwRu3NBwKyVrpgdwRkUrwkQlarjsHuSFD0hUYHc//Tt+OY+O6GxtQvFJeDj/dvf6Svy7CkCx9Gc/o7kf71xHiHsEeVEPB7JFuDz3xFVWONgCNLrLGvRDRjkWYFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcvI2nQW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcvI2nQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786151952; x=1817687952;
  h=date:from:to:cc:subject:message-id;
  bh=lzLsQzOAHZKtJgIKf6Y3OoFcZxGuhPJDHvzkm/FkHwM=;
  b=mcvI2nQW+6vRXcVIfHUArMTqu/k1Ni0w3iqebmzs61JvIa+EausBamSb
   TrlI1OoTFBF/wlY5fvFsrQrW2OOsbfwqJTEcxS+cWtBheTtvfDsIDx1/o
   /0vK6dJ7njGYlBdNvPoO+RGDqILHwk/Cd14vNN2+rG5wP5XFrncRKgMro
   Zwq3eDct1QCupb/VM97kPF80kHdI2xeKtuHUg6l+9fC2c7YA/cVAaZjpm
   2rqqmWIaQsiIMsx4TMv/X5z0+rTSAqzxcI2SW7y3SDsJftvDMuS42GNq6
   MYUDw6amvPTLzYOX77rNRk4zkRgQN47DZzQbmYH58VI9yDrajzkUB8anp
   g==;
X-CSE-ConnectionGUID: FxbJbkwFRoCNZBZTBoPBnQ==
X-CSE-MsgGUID: v1DE55xuTZ28ktu/iGm5/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86705155"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="86705155"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 18:19:11 -0700
X-CSE-ConnectionGUID: 9xF7NxjZS2iwo0xvLESePQ==
X-CSE-MsgGUID: whORS/xbRfy9BJZp92MbaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="260788603"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Aug 2026 18:19:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsViN-00000000Jbb-4011;
	Sat, 08 Aug 2026 01:19:07 +0000
Date: Sat, 08 Aug 2026 09:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/acpi/riscv/irq.c:161:24-28: ERROR: invalid reference
 to the index variable of the iterator on line 155
Message-ID: <202608080854.TQ2iA4Di-lkp@intel.com>
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
head:   bcc44b6785f216eb939226ade6e3910baa30516b
commit: 4d185fdeef67d0c2c5d4a142392cf1ade3786dd2 ACPI: RISC-V: Add support to update gsi range
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-r063-20260807 (https://download.01.org/0day-ci/archive/20260808/202608080854.TQ2iA4Di-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4d185fdeef67 ("ACPI: RISC-V: Add support to update gsi range")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608080854.TQ2iA4Di-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/acpi/riscv/irq.c:161:24-28: ERROR: invalid reference to the index variable of the iterator on line 155

vim +161 drivers/acpi/riscv/irq.c

e77b8dc02a1ca22 Sunil V L 2024-08-12  133  
e77b8dc02a1ca22 Sunil V L 2024-08-12  134  static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
e77b8dc02a1ca22 Sunil V L 2024-08-12  135  					       u32 id, u32 type)
e77b8dc02a1ca22 Sunil V L 2024-08-12  136  {
4d185fdeef67d0c Sunil V L 2025-08-18  137  	struct riscv_ext_intc_list *ext_intc_element, *node, *prev;
e77b8dc02a1ca22 Sunil V L 2024-08-12  138  
e77b8dc02a1ca22 Sunil V L 2024-08-12  139  	ext_intc_element = kzalloc(sizeof(*ext_intc_element), GFP_KERNEL);
e77b8dc02a1ca22 Sunil V L 2024-08-12  140  	if (!ext_intc_element)
e77b8dc02a1ca22 Sunil V L 2024-08-12  141  		return -ENOMEM;
e77b8dc02a1ca22 Sunil V L 2024-08-12  142  
e77b8dc02a1ca22 Sunil V L 2024-08-12  143  	ext_intc_element->gsi_base = gsi_base;
4d185fdeef67d0c Sunil V L 2025-08-18  144  
4d185fdeef67d0c Sunil V L 2025-08-18  145  	/* If nr_irqs is zero, indicate it in flag and set to max range possible */
4d185fdeef67d0c Sunil V L 2025-08-18  146  	if (nr_irqs) {
e77b8dc02a1ca22 Sunil V L 2024-08-12  147  		ext_intc_element->nr_irqs = nr_irqs;
4d185fdeef67d0c Sunil V L 2025-08-18  148  	} else {
4d185fdeef67d0c Sunil V L 2025-08-18  149  		ext_intc_element->flag |= RISCV_ACPI_INTC_FLAG_PENDING;
4d185fdeef67d0c Sunil V L 2025-08-18  150  		ext_intc_element->nr_irqs = U32_MAX - ext_intc_element->gsi_base;
4d185fdeef67d0c Sunil V L 2025-08-18  151  	}
4d185fdeef67d0c Sunil V L 2025-08-18  152  
e77b8dc02a1ca22 Sunil V L 2024-08-12  153  	ext_intc_element->nr_idcs = nr_idcs;
e77b8dc02a1ca22 Sunil V L 2024-08-12  154  	ext_intc_element->id = id;
694b2ef1e73c5ee Sunil V L 2025-08-18 @155  	list_for_each_entry(node, &ext_intc_list, list) {
694b2ef1e73c5ee Sunil V L 2025-08-18  156  		if (node->gsi_base < ext_intc_element->gsi_base)
694b2ef1e73c5ee Sunil V L 2025-08-18  157  			break;
694b2ef1e73c5ee Sunil V L 2025-08-18  158  	}
694b2ef1e73c5ee Sunil V L 2025-08-18  159  
4d185fdeef67d0c Sunil V L 2025-08-18  160  	/* Adjust the previous node's GSI range if that has pending registration */
4d185fdeef67d0c Sunil V L 2025-08-18 @161  	prev = list_prev_entry(node, list);
4d185fdeef67d0c Sunil V L 2025-08-18  162  	if (!list_entry_is_head(prev, &ext_intc_list, list)) {
4d185fdeef67d0c Sunil V L 2025-08-18  163  		if (prev->flag & RISCV_ACPI_INTC_FLAG_PENDING)
4d185fdeef67d0c Sunil V L 2025-08-18  164  			prev->nr_irqs = ext_intc_element->gsi_base - prev->gsi_base;
4d185fdeef67d0c Sunil V L 2025-08-18  165  	}
4d185fdeef67d0c Sunil V L 2025-08-18  166  
694b2ef1e73c5ee Sunil V L 2025-08-18  167  	list_add_tail(&ext_intc_element->list, &node->list);
e77b8dc02a1ca22 Sunil V L 2024-08-12  168  	return 0;
e77b8dc02a1ca22 Sunil V L 2024-08-12  169  }
e77b8dc02a1ca22 Sunil V L 2024-08-12  170  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
