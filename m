Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FBFA943
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Aug 2024 06:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722666699; cv=none; b=s2A6Y3S1gVmTUYPxdLJtYbKS+hUrmuLBPNt0QhTY6pz9hSbYLUlyYJca96R5eCplAN4FRso2N22gTA9It3Vw7T882Sb9qYowcgQWGpipjdgUZhi1nq64ydN2Wzw9CryEZmtTENoSPLmR+xUeM1diriAe04V6LJu/P1eDgAGahqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722666699; c=relaxed/simple;
	bh=awskhnYUz9KeRWUgDBqXrOKSXzRoOarJDLIyjfOIjAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cdsfCJW+4H3B1Xd9Sy6eXVyHgqfQa8DfnX5ou1OLydRaAyqzVPKqLUnrHB3gN2h82uiPn+uWfoSMPGaaJ/mtF/paNyKeAHBasJcg+FcMlqZS+TQ6ZemHvseth5y5nTjzU5Kq6lkHwDpGHgURcHQnM15KFoWgjoQe9V1jyKihkeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkOKHYCd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkOKHYCd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722666698; x=1754202698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=awskhnYUz9KeRWUgDBqXrOKSXzRoOarJDLIyjfOIjAc=;
  b=kkOKHYCdKsDYrVNHbcSYpaPrbUQJ1MsxIrBsPV3lLvvs6ZeHG+p51taU
   K2TvaEQTZoWaBEEAwRbc0ukNqFWQb0L1Cx97gNRQ5St7qEffOpv/otm8M
   6AxK79kFDnPPL2KU2eVQK6I5r94PHPabd6LSPM0lgErYeuHRoSS7L1OZT
   dJlm1YGplSKLbm6xY3Vlcm5tF/5wCbBfw/L3y/5ltjL/9oU4CfcqHi2uG
   G6CqxZNyFwPrLNYd45Xbhefs2SS+h1L4xaHIOD3jQ5oeOWiQinDdtF6/o
   tm0HEVHjuAajjd870B7Oj4kkOAe+JlS1o+0EOui379lICiigvpVocrybp
   g==;
X-CSE-ConnectionGUID: /2H7igcTQfuFjbRbog5AZQ==
X-CSE-MsgGUID: zGOTHoS/T6yKqYUKS5xImg==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31342446"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="31342446"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 23:31:31 -0700
X-CSE-ConnectionGUID: QlPaq90TS+OGsJGFiNyPzw==
X-CSE-MsgGUID: XSqcOt15QEKudpMLYKO5oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60651989"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Aug 2024 23:31:30 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa8IY-0000BW-33;
	Sat, 03 Aug 2024 06:31:26 +0000
Date: Sat, 3 Aug 2024 14:31:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 13/13] riscv: Add qspinlock support
Message-ID: <202408031335.lQtE1M1j-lkp@intel.com>
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
In-Reply-To: <20240731072405.197046-14-alexghiti@rivosinc.com>
References: <20240731072405.197046-14-alexghiti@rivosinc.com>
TO: Alexandre Ghiti <alexghiti@rivosinc.com>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Conor Dooley <conor@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
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
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-riscv@lists.infradead.org
TO: linux-arch@vger.kernel.org
CC: Alexandre Ghiti <alexghiti@rivosinc.com>

Hi Alexandre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arnd-asm-generic/master]
[also build test WARNING on robh/for-next linus/master v6.11-rc1 next-20240802]
[cannot apply to tip/locking/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Move-cpufeature-h-macros-into-their-own-header/20240802-012858
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20240731072405.197046-14-alexghiti%40rivosinc.com
patch subject: [PATCH v4 13/13] riscv: Add qspinlock support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408031335.lQtE1M1j-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   arch/riscv/include/asm/spinlock.h: asm/ticket_spinlock.h is included more than once.
>> arch/riscv/include/asm/spinlock.h: asm/qspinlock.h is included more than once.

vim +11 arch/riscv/include/asm/spinlock.h

     8	
     9	#define __no_arch_spinlock_redefine
    10	#include <asm/ticket_spinlock.h>
  > 11	#include <asm/qspinlock.h>
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
    31	#elif defined(CONFIG_RISCV_QUEUED_SPINLOCKS)
    32	
  > 33	#include <asm/qspinlock.h>
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
