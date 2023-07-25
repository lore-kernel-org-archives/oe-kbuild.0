Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAE94C71
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Jul 2023 03:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690254770; x=1721790770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MOpt2vf7MZoerF1xfMNJf/cQxxqYA9H1lvdodAP9k4w=;
  b=h7yLB65np6DRp0oqUyEzb6iR6UE9JBcQfS1ddE6lQT0nLzWrBwBjdakc
   ubEHx9vnITLMXSRUFAkgjfXjyWTXXduTrL+t5fFDzCytFcygmNOLAZQl5
   o/tcUwZOgY5XAmP2r5Bn5C4sQNeYb5EnwkzbUJsLAU6Ye4XYkiuen3K8q
   DJTtLFmSSrVqBKAL30cjpKVfsXvidVTKPOsHnEgX7gGFq2TvxfC1jD+Ra
   lnlJZDmtP6+Y2ZTJoYcXpbPOYqz06EkQbx2N+PInlnDgEXxa2lY706iUV
   SiqfE2I5hQzLuXG1Or0ThF3yDOGCmsfNRBL+/l0qVV/DLLdt1sJyE22Mn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347211479"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="347211479"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 20:12:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="839693829"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="839693829"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2023 20:12:48 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO8T9-000AG8-1n;
	Tue, 25 Jul 2023 03:12:34 +0000
Date: Tue, 25 Jul 2023 11:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v2 5/41]
 arch/riscv/include/asm/spinlock.h: asm-generic/ticket_spinlock.h is included
 more than once.
Message-ID: <202307251136.1zSYBf0x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Guo Ren <guoren@linux.alibaba.com>

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v2
head:   9ea0b1232c44dbd3cbca95097cf4bea099764d2c
commit: f1f72f77c9e8cc273bfb44cb928f5787abe50cd8 [5/41] riscv: Add combo spinlock support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251136.1zSYBf0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307251136.1zSYBf0x-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/riscv/include/asm/spinlock.h: asm-generic/ticket_spinlock.h is included more than once.

vim +11 arch/riscv/include/asm/spinlock.h

     9	
    10	#ifdef CONFIG_RISCV_COMBO_SPINLOCKS
  > 11	#include <asm-generic/ticket_spinlock.h>
    12	
    13	#undef arch_spin_is_locked
    14	#undef arch_spin_is_contended
    15	#undef arch_spin_value_unlocked
    16	#undef arch_spin_lock
    17	#undef arch_spin_trylock
    18	#undef arch_spin_unlock
    19	
    20	#include <asm-generic/qspinlock.h>
    21	#include <linux/jump_label.h>
    22	
    23	#undef arch_spin_is_locked
    24	#undef arch_spin_is_contended
    25	#undef arch_spin_value_unlocked
    26	#undef arch_spin_lock
    27	#undef arch_spin_trylock
    28	#undef arch_spin_unlock
    29	
    30	DECLARE_STATIC_KEY_TRUE(qspinlock_key);
    31	
    32	static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
    33	{
    34		if (static_branch_likely(&qspinlock_key))
    35			queued_spin_lock(lock);
    36		else
    37			ticket_spin_lock(lock);
    38	}
    39	
    40	static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)
    41	{
    42		if (static_branch_likely(&qspinlock_key))
    43			return queued_spin_trylock(lock);
    44		return ticket_spin_trylock(lock);
    45	}
    46	
    47	static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
    48	{
    49		if (static_branch_likely(&qspinlock_key))
    50			queued_spin_unlock(lock);
    51		else
    52			ticket_spin_unlock(lock);
    53	}
    54	
    55	static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
    56	{
    57		if (static_branch_likely(&qspinlock_key))
    58			return queued_spin_value_unlocked(lock);
    59		else
    60			return ticket_spin_value_unlocked(lock);
    61	}
    62	
    63	static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
    64	{
    65		if (static_branch_likely(&qspinlock_key))
    66			return queued_spin_is_locked(lock);
    67		return ticket_spin_is_locked(lock);
    68	}
    69	
    70	static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
    71	{
    72		if (static_branch_likely(&qspinlock_key))
    73			return queued_spin_is_contended(lock);
    74		return ticket_spin_is_contended(lock);
    75	}
    76	#else /* CONFIG_RISCV_COMBO_SPINLOCKS */
    77	
    78	#ifdef CONFIG_QUEUED_SPINLOCKS
    79	#include <asm/qspinlock.h>
    80	#else
  > 81	#include <asm-generic/ticket_spinlock.h>
    82	#endif
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
