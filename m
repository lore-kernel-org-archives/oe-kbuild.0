Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DE71C5D6A
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 23:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766101539; cv=none; b=mFxe3pClFXE+wV/vh7LnI0IwX+i0E93/o6E8vVWj1hBI27J+9v0Esxjt7b88Jow1LmScMCfIJxl94BB2c3wJ24LT/KsOg6uzmwO46uzZm/4PA8t6YPHPGlxa1F72YF0FJv3LznSBBVhxzWQufJu/TxPzfJBFlWpWkGhBSH6OdL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766101539; c=relaxed/simple;
	bh=4Qej/4orpHQTu+NmwVPf6ko+X406IDSUKfkeXwn1yf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HzYz3mHAzwPzp0BlbbaBXwXuI/Sla5wRVQBoi2eVrEWfIRGRzkH+6C18qMl2cTBy8g+aOrxsH09gr6ioJ+Mirtc6QqzshroiX6/mUTUtgEGPQMSNAzyUnzRLlR/3e/O8c8r0VMS8jrYoqabsxlx1gSVGPQ1fK9iwbHmBkg4QCJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kxq/m1Kn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kxq/m1Kn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766101537; x=1797637537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Qej/4orpHQTu+NmwVPf6ko+X406IDSUKfkeXwn1yf8=;
  b=Kxq/m1Kn0TTtAmuBiyFapmzODtXWM47crr6RVTXtaih3YTOyZS4MZ1kb
   PLzl8rNzAagW/MXZdeCp6hGy598IA/6yr1JyKGEYSZ2m2ZgPrZhpRlgRS
   cRoLQMLwNK8Z4mF7oObZTn8k/sfzm59DIhtiKEbS6W23YEGiQROEiG5Ol
   zZqLEyGsrNx17wEhmET+bEcB2DoUr50vUafhul8/2eJXFw8usLLBS4POn
   9C4el9BJmLTuP16XhX3qu10it2VN+iCJu0I1BACmTufqFsh9E0ft8+osF
   2p5Y4Bcr0SJ5nGiiBWsxK7vQcoCL+1Af/qCKaSITC0QTL3uq/KIsHP8Lz
   Q==;
X-CSE-ConnectionGUID: xUPWvMDPST+vIDJGM+Lw2w==
X-CSE-MsgGUID: cVNpiykIQO+IBEv9Kmcnmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78381108"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="78381108"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 15:45:36 -0800
X-CSE-ConnectionGUID: HzwZgzH/QPaMai/SvadAqA==
X-CSE-MsgGUID: pz4nkKy4QXqPl7H3R/Kn0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="203803084"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Dec 2025 15:45:34 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWNga-000000002lq-2bFp;
	Thu, 18 Dec 2025 23:45:32 +0000
Date: Fri, 19 Dec 2025 07:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/include/asm/pgtable.h:481 pte_swp_soft_dirty() warn:
 bitwise AND condition is false here
Message-ID: <202512190721.gzPIti0c-lkp@intel.com>
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
TO: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Deepak Gupta <debug@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: 2a3ebad4db63e86a9443d6bff4a5977320dc09f6 riscv: mm: add soft-dirty page tracking support
date:   3 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-r071-20251219 (https://download.01.org/0day-ci/archive/20251219/202512190721.gzPIti0c-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512190721.gzPIti0c-lkp@intel.com/

New smatch warnings:
arch/riscv/include/asm/pgtable.h:481 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:466 pte_soft_dirty() warn: bitwise AND condition is false here

Old smatch warnings:
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +481 arch/riscv/include/asm/pgtable.h

9e953cda5cdf1c Alexandre Ghiti 2019-05-26  458  
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  459  #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  460  #define pgtable_supports_soft_dirty()				\
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  461  	(IS_ENABLED(CONFIG_MEM_SOFT_DIRTY) &&			\
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  462  	 riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B))
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  463  
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  464  static inline bool pte_soft_dirty(pte_t pte)
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  465  {
2a3ebad4db63e8 Chunyan Zhang   2025-11-13 @466  	return !!(pte_val(pte) & _PAGE_SOFT_DIRTY);
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  467  }
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  468  
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  469  static inline pte_t pte_mksoft_dirty(pte_t pte)
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  470  {
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  471  	return __pte(pte_val(pte) | _PAGE_SOFT_DIRTY);
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  472  }
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  473  
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  474  static inline pte_t pte_clear_soft_dirty(pte_t pte)
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  475  {
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  476  	return __pte(pte_val(pte) & ~(_PAGE_SOFT_DIRTY));
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  477  }
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  478  
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  479  static inline bool pte_swp_soft_dirty(pte_t pte)
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  480  {
2a3ebad4db63e8 Chunyan Zhang   2025-11-13 @481  	return !!(pte_val(pte) & _PAGE_SWP_SOFT_DIRTY);
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  482  }
2a3ebad4db63e8 Chunyan Zhang   2025-11-13  483  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
