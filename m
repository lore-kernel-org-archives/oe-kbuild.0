Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2671BF3A
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jun 2024 07:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719472907; cv=none; b=OM+AZmgnzBnJ7O6mSY6z8hJhDWzZaCnaurkubo9iYbMSU4kKKoHmrshNYn+5h2lnv8HZN7Sfxw7/c9RoH5ba09r0Zklr8UYLHT180KwaZq6sNlA5dCsvUjSOI2S4ckQWdI+XEGGj8rgEMEXEHp2ywMrpN+CzKw/ldZrS/ZuSHoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719472907; c=relaxed/simple;
	bh=P+VzldfZd7GgSXjs19KzGhdU5qRTsecUf2Hjremj2AA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bjFupc2sgEBo4YB0dyQ+uNP9aFF3tQJYOz2n83lRfVGFG6DsTPaiI46impBu4MHN7oRGYoxvB318K0feCb41rtxzGpTikVXSlYuRsvn6z03jG5kSTpc1QxLNSc6AF6DrHUJxk/uwWghLhbK876q1FAfc+/VcRiT7evk0zCSpzMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WNYxbBr4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNYxbBr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719472903; x=1751008903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P+VzldfZd7GgSXjs19KzGhdU5qRTsecUf2Hjremj2AA=;
  b=WNYxbBr4XcBlR/53bIcGpE74hVmMPVzOVltXmYZHpTxgD70LRcKViM9O
   N0gWrv4uzJ4/C77//8glZHUu7kvQ3Xt2FErGf5zFzyjYxG7cgTTmG+JcK
   PJAoLHXv2mMovVLetNJvW1nC/84AbU8mG2u3vpZZo8qw3OWEajUjI721h
   4mfhJAL9uEq6RBx1P3/9r060fB+OrFCMUxdAWBW8LjY7HSRdPrDV73tAM
   FuM78/o4uxW/S16RrDJanFb9HFZoCarAcL/sqHO4wZ1CbT0G/uDTRv9cq
   e0Za1AY7FSd4exdKmRSIKAlLnXV/cNMzSiC9vHLeTjOFAf1e3monV4d9h
   Q==;
X-CSE-ConnectionGUID: Hy0LxkyoRlGCw0WUaYQcdg==
X-CSE-MsgGUID: J40l2FYsTvKkdAejlPSrkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27717363"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="27717363"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 00:21:43 -0700
X-CSE-ConnectionGUID: m2OQcnppQ5y7Wvff2R5GyQ==
X-CSE-MsgGUID: Wp243y/xS9CnIhnja0kJnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45030899"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 00:21:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMjRs-000G0i-26;
	Thu, 27 Jun 2024 07:21:40 +0000
Date: Thu, 27 Jun 2024 15:21:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 10/10] riscv: Add qspinlock support based on Zabha
 extension
Message-ID: <202406271442.V29TPfzy-lkp@intel.com>
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
In-Reply-To: <20240626130347.520750-11-alexghiti@rivosinc.com>
References: <20240626130347.520750-11-alexghiti@rivosinc.com>
TO: Alexandre Ghiti <alexghiti@rivosinc.com>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Andrea Parri <parri.andrea@gmail.com>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Will Deacon <will@kernel.org>
TO: Waiman Long <longman@redhat.com>
TO: Boqun Feng <boqun.feng@gmail.com>
TO: Arnd Bergmann <arnd@arndb.de>
TO: Leonardo Bras <leobras@redhat.com>
TO: Guo Ren <guoren@kernel.org>
TO: linux-doc@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-riscv@lists.infradead.org
TO: linux-arch@vger.kernel.org
CC: Alexandre Ghiti <alexghiti@rivosinc.com>

Hi Alexandre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.10-rc5]
[cannot apply to arnd-asm-generic/master robh/for-next tip/locking/core next-20240626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Implement-cmpxchg32-64-using-Zacas/20240627-034946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20240626130347.520750-11-alexghiti%40rivosinc.com
patch subject: [PATCH v2 10/10] riscv: Add qspinlock support based on Zabha extension
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406271442.V29TPfzy-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/riscv/include/asm/spinlock.h: asm/ticket_spinlock.h is included more than once.

vim +10 arch/riscv/include/asm/spinlock.h

     8	
     9	#define __no_arch_spinlock_redefine
  > 10	#include <asm/ticket_spinlock.h>
    11	#include <asm/qspinlock.h>
    12	#include <asm/alternative.h>
    13	
    14	DECLARE_STATIC_KEY_TRUE(qspinlock_key);
    15	
    16	#define SPINLOCK_BASE_DECLARE(op, type, type_lock)			\
    17	static __always_inline type arch_spin_##op(type_lock lock)		\
    18	{									\
    19		if (static_branch_unlikely(&qspinlock_key))			\
    20			return queued_spin_##op(lock);				\
    21		return ticket_spin_##op(lock);					\
    22	}
    23	
    24	SPINLOCK_BASE_DECLARE(lock, void, arch_spinlock_t *)
    25	SPINLOCK_BASE_DECLARE(unlock, void, arch_spinlock_t *)
    26	SPINLOCK_BASE_DECLARE(is_locked, int, arch_spinlock_t *)
    27	SPINLOCK_BASE_DECLARE(is_contended, int, arch_spinlock_t *)
    28	SPINLOCK_BASE_DECLARE(trylock, bool, arch_spinlock_t *)
    29	SPINLOCK_BASE_DECLARE(value_unlocked, int, arch_spinlock_t)
    30	
    31	#else
    32	
  > 33	#include <asm/ticket_spinlock.h>
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
