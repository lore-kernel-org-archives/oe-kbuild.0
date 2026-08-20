Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B8B345EDE
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Aug 2026 06:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787206030; cv=none; b=QJLUrph7Uql97rBri4k4NlJ/jkUUlL0wth6B5mT8jI2bJxRFI5bLOJ8sFVtNbMQdmJ5TziOdUiwOtnI9W1aNGhF22XAmlhVggzTJHpOymeAbUAws18CBXtOCqIVlgV/0xK8ZBjGXktB0L02ccbcMx10Zd1Zh7xirXxxPxGXAneM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787206030; c=relaxed/simple;
	bh=/fInnxkf/0hrhE6BNyaMrj8aLp5NsHI5L18W8GMYbJ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C+86oy2nPjTmEWmeoe6I1DXfbxSari7iYRiTOTgW+lSFQSFQDW1y2xnzLR3cC370lhKasAlzlcj3IB2YGRqWwV/XL8Tl4RuVcbcWFng8Gvz58M2A2RXVvWMqH1KZFN4IwYb+AHRbl+SEYCsMr6qiYf1jtZtcIis7vpLT7AMwqQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Re0HRkux; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Re0HRkux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787206028; x=1818742028;
  h=date:from:to:cc:subject:message-id;
  bh=/fInnxkf/0hrhE6BNyaMrj8aLp5NsHI5L18W8GMYbJ4=;
  b=Re0HRkuxN0s/M+sCpY5wbkdtBVvIxjifixH2HM5Qkw80qoozoU7lmc7E
   UAgmsiyoF0Fvk6V3u/jBAiXSPDGb/PQIon2XIiL+bnlbWD61M+KZtbHcy
   XT+5ylv6cn2LZpI85okRPBP0xfI0wJQLiX8rTv1jXcEv7yWo1eFXeTMff
   9/GRGXF/TA0uGnE2hLZiVZN4rnqkiNUfRPAhSCgbkR8epRZ9aCY1qd6TH
   XxwgNFb5FkvEdILTWuVH1I20X4hqODbMrKD42swB80YGpf+TI+xQswH7e
   GGVdVv7e3moC1CDvsntvsmwjIZuGXav5fkDS1RMQ1e8YnB+YcaAf5Z9iJ
   g==;
X-CSE-ConnectionGUID: qWfyGyzbQJOHVRiQmTQYVQ==
X-CSE-MsgGUID: tce6um9GSIGulkA0SEpKyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98325709"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="98325709"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 23:07:07 -0700
X-CSE-ConnectionGUID: s9biLh8FQ12SLZTC399MXA==
X-CSE-MsgGUID: mcdi9DdmS9yESQfJOl/HUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="267794591"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Aug 2026 23:07:06 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwvvc-00000000i2V-1LLn;
	Thu, 20 Aug 2026 06:07:04 +0000
Date: Thu, 20 Aug 2026 14:07:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/include/asm/pgtable.h:481 pte_swp_soft_dirty()
 warn: bitwise AND condition is false here
Message-ID: <202608201443.LQag9LUQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Deepak Gupta <debug@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb8a75eec0877810b50aa1c5a833f929525cd2ee
commit: 2a3ebad4db63e86a9443d6bff4a5977320dc09f6 riscv: mm: add soft-dirty page tracking support
date:   9 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 months ago
config: riscv-randconfig-r072-20260820 (https://download.01.org/0day-ci/archive/20260820/202608201443.LQag9LUQ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2a3ebad4db63 ("riscv: mm: add soft-dirty page tracking support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608201443.LQag9LUQ-lkp@intel.com/

New smatch warnings:
arch/riscv/include/asm/pgtable.h:481 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:481 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:481 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:481 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:481 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:481 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:481 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:481 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:481 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:481 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:481 pte_swp_soft_dirty() warn: bitwise AND condition is false here

Old smatch warnings:
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/pgtable.h:466 pte_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/atomic.h:230 arch_atomic64_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/pgtable.h:466 pte_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/pgtable.h:466 pte_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:466 pte_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +481 arch/riscv/include/asm/pgtable.h

2a3ebad4db63e86 Chunyan Zhang 2025-11-13  478  
2a3ebad4db63e86 Chunyan Zhang 2025-11-13  479  static inline bool pte_swp_soft_dirty(pte_t pte)
2a3ebad4db63e86 Chunyan Zhang 2025-11-13  480  {
2a3ebad4db63e86 Chunyan Zhang 2025-11-13 @481  	return !!(pte_val(pte) & _PAGE_SWP_SOFT_DIRTY);
2a3ebad4db63e86 Chunyan Zhang 2025-11-13  482  }
2a3ebad4db63e86 Chunyan Zhang 2025-11-13  483  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
