Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EA62222AF
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Sep 2025 18:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757182576; cv=none; b=iQwP2VDshkqeiT0VJ/xfJc/aSq8JLRVGxjYjsLjDpHTc2SLjOPeo1ppCsks7o+dryYgL7e67qb4Z4KBA89Yojf3Pbj7FKzrhJeUDaDVlxuZbl/RyAAUJfPE7Dwg4vosBj5nFc5REOuPE4QJuhBkbL2M0STrAAZoxqwy0sHbap6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757182576; c=relaxed/simple;
	bh=G0wra2sfCGeCGfjW2V5Gz3QoAMKgdEYclX3CJGL1y3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uW/cpZ0qQstYT0UyMFWAiRT6E8CV4feGJbyEFhbAHjTvn1G/AwvM8ZfnhGdLgE58YoRffWSVTgGO8wNm+v26Ktw704KCHaIHKiVhMXPXR5SPjTqamch0ja8Ku15fRCpBAOJxzqwfDiQfeXfETNU4lx6YQw5pGQQM3/n2Ue4hTZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMx905VL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMx905VL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757182574; x=1788718574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G0wra2sfCGeCGfjW2V5Gz3QoAMKgdEYclX3CJGL1y3s=;
  b=BMx905VLlEoSBGkCaHnzblQM/YYMQMIe+WlRXMAuz8P8mx7OWdWh0CxB
   tc91ZXWdYwURG8fgTDx+r688xgGPavvzBRWS7qC3a+ai+z0ZXddGV2vhD
   VDF0Ldi8iEljlrRxxPwigBuIr5Nt8le9K8pocRfp+rWoFWIkIk0ulsBKS
   CGaLQNoJJzYc5l0WvS9Ryp2hMgDRjHBGBp1Y4fMDlrWhibd7DS6Ubggf4
   UBwOy0Wm9o46JKArFumACinQ09/QBgMdeK0F5h9BKMfeng6O6Ny/jZ+HC
   bjPsuFp4pDctm5uMqHyJ7OYu+uNAA6R5KSRCaqjTeO4eBv2qibjv8hpV/
   Q==;
X-CSE-ConnectionGUID: i1syyercS2mdojGH+Rlelw==
X-CSE-MsgGUID: gDaWa5sDS8GEkO2CUM0y7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82091472"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="82091472"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 11:16:13 -0700
X-CSE-ConnectionGUID: Fh8Jz984Q72r4X7OJ4Q2PQ==
X-CSE-MsgGUID: H2gYUY+oQQegN5gVCl+Ieg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="171603336"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Sep 2025 11:16:12 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuxSL-0001jJ-3D;
	Sat, 06 Sep 2025 18:16:10 +0000
Date: Sun, 7 Sep 2025 02:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v9 4/5] riscv: mm: Add soft-dirty page tracking support
Message-ID: <202509070139.swsaf0Uq-lkp@intel.com>
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
In-Reply-To: <20250905103651.489197-5-zhangchunyan@iscas.ac.cn>
References: <20250905103651.489197-5-zhangchunyan@iscas.ac.cn>
TO: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
TO: linux-riscv@lists.infradead.org
TO: linux-mm@kvack.org
TO: linux-fsdevel@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Alexandre Ghiti <alex@ghiti.fr>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Deepak Gupta <debug@rivosinc.com>
CC: Ved Shanbhogue <ved@rivosinc.com>
CC: Peter Xu <peterx@redhat.com>
CC: Alexander Viro <viro@zeniv.linux.org.uk>
CC: Christian Brauner <brauner@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Jan Kara <jack@suse.cz>
CC: Axel Rasmussen <axelrasmussen@google.com>
CC: Wei Xu <weixugc@google.com>
CC: David Hildenbrand <david@redhat.com>
CC: Chunyan Zhang <zhang.lyra@gmail.com>

Hi Chunyan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.17-rc4]
[cannot apply to akpm-mm/mm-everything next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chunyan-Zhang/mm-softdirty-Add-pte_soft_dirty_available/20250905-184138
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250905103651.489197-5-zhangchunyan%40iscas.ac.cn
patch subject: [PATCH v9 4/5] riscv: mm: Add soft-dirty page tracking support
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: riscv-randconfig-r071-20250906 (https://download.01.org/0day-ci/archive/20250907/202509070139.swsaf0Uq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509070139.swsaf0Uq-lkp@intel.com/

New smatch warnings:
arch/riscv/include/asm/pgtable.h:478 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:463 pte_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:478 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:463 pte_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:478 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:463 pte_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:478 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:478 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:463 pte_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:478 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:478 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:478 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:478 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:478 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:478 pte_swp_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:463 pte_soft_dirty() warn: bitwise AND condition is false here
arch/riscv/include/asm/pgtable.h:478 pte_swp_soft_dirty() warn: bitwise AND condition is false here

Old smatch warnings:
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/atomic.h:230 arch_atomic64_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +478 arch/riscv/include/asm/pgtable.h

8425d1de4097fc Chunyan Zhang 2025-09-05  460  
8425d1de4097fc Chunyan Zhang 2025-09-05  461  static inline bool pte_soft_dirty(pte_t pte)
8425d1de4097fc Chunyan Zhang 2025-09-05  462  {
8425d1de4097fc Chunyan Zhang 2025-09-05 @463  	return !!(pte_val(pte) & _PAGE_SOFT_DIRTY);
8425d1de4097fc Chunyan Zhang 2025-09-05  464  }
8425d1de4097fc Chunyan Zhang 2025-09-05  465  
8425d1de4097fc Chunyan Zhang 2025-09-05  466  static inline pte_t pte_mksoft_dirty(pte_t pte)
8425d1de4097fc Chunyan Zhang 2025-09-05  467  {
8425d1de4097fc Chunyan Zhang 2025-09-05  468  	return __pte(pte_val(pte) | _PAGE_SOFT_DIRTY);
8425d1de4097fc Chunyan Zhang 2025-09-05  469  }
8425d1de4097fc Chunyan Zhang 2025-09-05  470  
8425d1de4097fc Chunyan Zhang 2025-09-05  471  static inline pte_t pte_clear_soft_dirty(pte_t pte)
8425d1de4097fc Chunyan Zhang 2025-09-05  472  {
8425d1de4097fc Chunyan Zhang 2025-09-05  473  	return __pte(pte_val(pte) & ~(_PAGE_SOFT_DIRTY));
8425d1de4097fc Chunyan Zhang 2025-09-05  474  }
8425d1de4097fc Chunyan Zhang 2025-09-05  475  
8425d1de4097fc Chunyan Zhang 2025-09-05  476  static inline bool pte_swp_soft_dirty(pte_t pte)
8425d1de4097fc Chunyan Zhang 2025-09-05  477  {
8425d1de4097fc Chunyan Zhang 2025-09-05 @478  	return !!(pte_val(pte) & _PAGE_SWP_SOFT_DIRTY);
8425d1de4097fc Chunyan Zhang 2025-09-05  479  }
8425d1de4097fc Chunyan Zhang 2025-09-05  480  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
