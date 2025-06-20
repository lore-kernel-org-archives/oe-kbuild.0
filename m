Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA19B2EA143
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jun 2025 17:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750441250; cv=none; b=hT/YHFgpFI+v9UEifLRuiYvYz0krx/ExToRjM78jNlVL7i6MjDM8sJTz3Ox5gohiihuamBDmo/0S0MQmW51YYoX0Exsf4blr9tj4301frVZZfxPTRLFHnTW+8tm/30jeqb+8nA6Jv36a1T9TCTVVUykjlY/SIu47JHoNNNqk8oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750441250; c=relaxed/simple;
	bh=y4rimwHw1nsEDbql5Ge/Pvkqgit5TtDFLoIid9knFHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+BVh2HvmYLczUydyORqeOIjVgqCPRwCwguzMTSr9tO6fHK79jhuQJmPmPoT1fk6RKj66HZO2clERB4VPPcgwu/6SAnAzABzjGQYrUkS44SBiKkvfMnX7twEeZZ/iDfjwZ9fZjnMv9w7yrYn+jYgN3FZlRFNA/myxlKSUG7r9fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zu5plceN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zu5plceN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750441248; x=1781977248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y4rimwHw1nsEDbql5Ge/Pvkqgit5TtDFLoIid9knFHs=;
  b=Zu5plceNLQBSym2mGlv8eypmI+BGDbeKUBEEWlwWDAYnC8AZ9JmUmoTS
   WWLJE94U1GcRtINtY9MdzY71LaPGmhlKuE+MQVGnc1XX91woD9ztgmcAE
   gI871zJMnpxRrpXe8ar5hCQ+Ru+KcWiiYVGwl3RT0xaTdu7lF2D0lly4X
   /k0C5UTTPC5TmkJ818lCZ6F2K2bvdQFnBqxUZb0bCS5EcUFI0S2YYUIdK
   34RNZniGIMrw3XgK58nOqpCAR7LOZrwDZlqvi//jx0niFTgcB76RwLnAU
   WFNVl25UjikCBTWe9jGr04a7LoHUtIbK/kusg7A2r7VS+Q6H4fiFoYqKR
   g==;
X-CSE-ConnectionGUID: XfpaRdxOTBa2pVNm9Krg+w==
X-CSE-MsgGUID: ZANTVISdTiyo72OWPvkrlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="51828519"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="51828519"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 10:40:47 -0700
X-CSE-ConnectionGUID: AVK8X9q4R+KpWdSbKgrEdw==
X-CSE-MsgGUID: zOqaRmfeTMqOGh5h5LgNeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="151270713"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jun 2025 10:40:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSfjI-000M1O-0M;
	Fri, 20 Jun 2025 17:40:44 +0000
Date: Sat, 21 Jun 2025 01:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] bitops: rotate: Add riscv implementation using Zbb
 extension
Message-ID: <202506210147.ur3sfq5j-lkp@intel.com>
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
In-Reply-To: <20250620111610.52750-3-cp0613@linux.alibaba.com>
References: <20250620111610.52750-3-cp0613@linux.alibaba.com>
TO: cp0613@linux.alibaba.com
TO: yury.norov@gmail.com
TO: linux@rasmusvillemoes.dk
TO: arnd@arndb.de
TO: paul.walmsley@sifive.com
TO: palmer@dabbelt.com
TO: aou@eecs.berkeley.edu
TO: alex@ghiti.fr
CC: linux-riscv@lists.infradead.org
CC: linux-arch@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Chen Pei <cp0613@linux.alibaba.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arnd-asm-generic/master]
[also build test WARNING on linus/master v6.16-rc2 next-20250620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cp0613-linux-alibaba-com/bitops-generic-rotate/20250620-192016
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20250620111610.52750-3-cp0613%40linux.alibaba.com
patch subject: [PATCH 2/2] bitops: rotate: Add riscv implementation using Zbb extension
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506210147.ur3sfq5j-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   arch/riscv/include/asm/bitops.h: asm-generic/bitops/ffs.h is included more than once.
   arch/riscv/include/asm/bitops.h: asm-generic/bitops/fls.h is included more than once.
   arch/riscv/include/asm/bitops.h: asm-generic/bitops/__fls.h is included more than once.
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/rotate.h is included more than once.
   arch/riscv/include/asm/bitops.h: asm-generic/bitops/__ffs.h is included more than once.

vim +23 arch/riscv/include/asm/bitops.h

    17	
    18	#if !(defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)) || defined(NO_ALTERNATIVE)
    19	#include <asm-generic/bitops/__ffs.h>
    20	#include <asm-generic/bitops/__fls.h>
    21	#include <asm-generic/bitops/ffs.h>
    22	#include <asm-generic/bitops/fls.h>
  > 23	#include <asm-generic/bitops/rotate.h>
    24	
    25	#else
    26	#define __HAVE_ARCH___FFS
    27	#define __HAVE_ARCH___FLS
    28	#define __HAVE_ARCH_FFS
    29	#define __HAVE_ARCH_FLS
    30	#define __HAVE_ARCH_ROTATE
    31	
    32	#include <asm-generic/bitops/__ffs.h>
    33	#include <asm-generic/bitops/__fls.h>
    34	#include <asm-generic/bitops/ffs.h>
    35	#include <asm-generic/bitops/fls.h>
  > 36	#include <asm-generic/bitops/rotate.h>
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
