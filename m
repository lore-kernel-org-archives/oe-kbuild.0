Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4E413AD1C
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Apr 2025 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744451519; cv=none; b=Fcnqgx8DvSr7Fp3UAeN5RS+7QLs2rg8NH6D5E3l8/Enk2BqO16gDLLFIflBWOhmSUyYoZmGhDk773Z0U+GcY7gY8Fjlz0DMa91tfR1P/i0XwW673CVwuIItDxVm4CP59HrM/gEe+ezXa/onknUCeHl4va6mZB0aWJHzGClFoFFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744451519; c=relaxed/simple;
	bh=5GIHIOIyZoYfjxXTq+uIKMFVeWpibzSMKLdxbNCySdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iCHAEs4j7J/aRbX7ZxeindKuIp5UOJRv7In0+/3OvyvcDe/NNsfsVIPmNMINkq1HNWco0rhiUG7qQulVrWnsMWTL3vuWpUMPcbq4JiSeEGh4fYcw9xLmMj13Kc5f0XfpXgvLZLiccxQHdhWWfUe+8YIjT1EBOrqvvJkB9rqp4vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXvZfoA2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXvZfoA2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744451517; x=1775987517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5GIHIOIyZoYfjxXTq+uIKMFVeWpibzSMKLdxbNCySdU=;
  b=YXvZfoA2FSGU1pF5pg6AgtF2mInRkEdauWk2URi0anP9rfIpxHnjajIx
   Ku2UoPHMIN9CIQKfRtye05/bRyZf80cn/y7RPnSazG6224xV7yQpHJU+W
   SBmSIwFWUj5efwX/txNY2/d014xOOQSQSDK/OCfEJ1ONcjvKUi8VfivBV
   w0T5aQ8cW8NHB17m4sQ/c+U1qN9VM2si+KNVbZ2QxF7tiUOmTZhU6uc68
   ily/Nx8tR+h7MCDFBOCDsAbAK1ugQjTGMLyCyYz1jU/bGjW0TtHwVhMB6
   g2SgPvutpYyg+5c2tnJ6p9ZjAS7TtvfRv0H4Vw9+JEzbg6c+jUvog5MX0
   g==;
X-CSE-ConnectionGUID: MFJt+ZBFSW2XP1mlj3ksCA==
X-CSE-MsgGUID: nhsvfuhiS7uyWWd06No3BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="49823161"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="49823161"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 02:51:56 -0700
X-CSE-ConnectionGUID: k4+weDkASTeNRtNWmFwPgA==
X-CSE-MsgGUID: 2cvd1ZYPR3GRJA3ICQBYTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="129961907"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Apr 2025 02:51:55 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3XWj-000BhK-0F;
	Sat, 12 Apr 2025 09:51:53 +0000
Date: Sat, 12 Apr 2025 17:50:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v14 08/11] powerpc: mm: Add pud_pfn() stub
Message-ID: <202504121736.QD3fqVR7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250411054354.511145-9-ajd@linux.ibm.com>
References: <20250411054354.511145-9-ajd@linux.ibm.com>
TO: Andrew Donnellan <ajd@linux.ibm.com>
TO: linuxppc-dev@lists.ozlabs.org
CC: x86@kernel.org
CC: linux-mm@kvack.org
CC: linux-riscv@lists.infradead.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: pasha.tatashin@soleen.com
CC: sweettea-kernel@dorminy.me
CC: christophe.leroy@csgroup.eu

Hi Andrew,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes akpm-mm/mm-everything arm64/for-next/core tip/x86/core linus/master v6.15-rc1 next-20250411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Donnellan/mm-page_table_check-Reinstate-address-parameter-in-__-page_table_check_pud_set/20250411-134526
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250411054354.511145-9-ajd%40linux.ibm.com
patch subject: [PATCH v14 08/11] powerpc: mm: Add pud_pfn() stub
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: powerpc64-randconfig-003-20250412 (https://download.01.org/0day-ci/archive/20250412/202504121736.QD3fqVR7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504121736.QD3fqVR7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504121736.QD3fqVR7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:42:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:30:
   In file included from include/linux/pgtable.h:6:
>> arch/powerpc/include/asm/pgtable.h:222:2: error: call to '__compiletime_assert_357' declared with 'error' attribute: BUILD_BUG failed
     222 |         BUILD_BUG();
         |         ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:100:1: note: expanded from here
     100 | __compiletime_assert_357
         | ^
   1 error generated.


vim +222 arch/powerpc/include/asm/pgtable.h

368a0590d954a6 Aneesh Kumar K.V 2023-07-25  217  
18d2c68702b64d Rohan McLure     2025-04-11  218  #ifndef pud_pfn
18d2c68702b64d Rohan McLure     2025-04-11  219  #define pud_pfn pud_pfn
18d2c68702b64d Rohan McLure     2025-04-11  220  static inline int pud_pfn(pud_t pud)
18d2c68702b64d Rohan McLure     2025-04-11  221  {
18d2c68702b64d Rohan McLure     2025-04-11 @222  	BUILD_BUG();
18d2c68702b64d Rohan McLure     2025-04-11  223  	return 0;
18d2c68702b64d Rohan McLure     2025-04-11  224  }
18d2c68702b64d Rohan McLure     2025-04-11  225  #endif
18d2c68702b64d Rohan McLure     2025-04-11  226  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
