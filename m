Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D5B154B0
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEVlHhkU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699861392; x=1731397392;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=67ZqT4nXvUTCpoKQU2TMpAhFuZ1InlvaO6jBI5PWFkQ=;
  b=LEVlHhkUP/Mgg/IPdvLlgpLp1EnjqPxI8hPveXMlCqjtP55Zva+JyVX2
   ma9Pg0ZQGZBJlf6/kycfGO+73jaqr68ADNBBZzcrzA2JZEPofMw/Ps6Nv
   hvOusralHZRCwmaUQDRCYnZejmtYa8IjAvQQT7KugXxy1FLC2+ot+A9du
   HqxGBLt/dzrTZ6WsRgpg71KXfFZOshOvSVvu3E9ZjTlx849XkgEWFohoI
   m19yz+jrZxgiVEZA2T25YCC1FveH3dw7czCrGEd7K1auVS9VHsW6xApvn
   LlZwQ5Jak49iEB6rLLZ0AZpX4U56/7tSNNWu2mIG8qHThHb+2pJKgzFGE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="370591048"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="370591048"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 23:43:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="12024018"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Nov 2023 23:43:11 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2RbA-000Bvy-2A;
	Mon, 13 Nov 2023 07:43:08 +0000
Date: Mon, 13 Nov 2023 15:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH v2 10/19] KVM: x86: Implement per-guest-page
 permissions
Message-ID: <202311131527.nBtS1Ewn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "fbc e677181e18929a5506e046fcb60f660060216505 and parent dd628ea6472ca6fefaaa3d84baab96270832e7e8 have different kconfig"
:::::: Manual check reason: "has kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231113022326.24388-11-mic@digikod.net>
References: <20231113022326.24388-11-mic@digikod.net>
TO: "Mickaël Salaün" <mic@digikod.net>

Hi Mickaël,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 881375a408c0f4ea451ff14545b59216d2923881]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/virt-Introduce-Hypervisor-Enforced-Kernel-Integrity-Heki/20231113-102847
base:   881375a408c0f4ea451ff14545b59216d2923881
patch link:    https://lore.kernel.org/r/20231113022326.24388-11-mic%40digikod.net
patch subject: [RFC PATCH v2 10/19] KVM: x86: Implement per-guest-page permissions
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: i386-randconfig-002-20231113 (https://download.01.org/0day-ci/archive/20231113/202311131527.nBtS1Ewn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311131527.nBtS1Ewn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311131527.nBtS1Ewn-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARNING: unmet direct dependencies detected for SPARSEMEM
   Depends on [n]: !SELECT_MEMORY_MODEL [=y] && ARCH_SPARSEMEM_ENABLE [=y] || SPARSEMEM_MANUAL [=n]
   Selected by [y]:
   - KVM [=y] && VIRTUALIZATION [=y] && HAVE_KVM [=y] && HIGH_RES_TIMERS [=y] && X86_LOCAL_APIC [=y]
   In file included from arch/x86/include/asm/page.h:85,
   from arch/x86/include/asm/thread_info.h:12,
   from include/linux/thread_info.h:60,
   from arch/x86/include/asm/preempt.h:9,
   from include/linux/preempt.h:79,
   from include/linux/spinlock.h:56,
   from include/linux/swait.h:7,
   from include/linux/completion.h:12,
   from include/linux/crypto.h:15,
   from arch/x86/kernel/asm-offsets.c:9:
>> include/asm-generic/memory_model.h:31:19: error: redefinition of 'pfn_valid'
   31 | #define pfn_valid pfn_valid
   |                   ^~~~~~~~~
   include/linux/mmzone.h:1987:19: note: in expansion of macro 'pfn_valid'
   1987 | static inline int pfn_valid(unsigned long pfn)
   |                   ^~~~~~~~~
   include/asm-generic/memory_model.h:23:19: note: previous definition of 'pfn_valid' with type 'int(long unsigned int)'
   23 | static inline int pfn_valid(unsigned long pfn)
   |                   ^~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=912718013
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2 shuffle=912718013
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=912718013
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=912718013
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SPARSEMEM
   Depends on [n]: !SELECT_MEMORY_MODEL [=y] && ARCH_SPARSEMEM_ENABLE [=y] || SPARSEMEM_MANUAL [=n]
   Selected by [y]:
   - KVM [=y] && VIRTUALIZATION [=y] && HAVE_KVM [=y] && HIGH_RES_TIMERS [=y] && X86_LOCAL_APIC [=y]


vim +/pfn_valid +31 include/asm-generic/memory_model.h

a117e66ed45ac0 KAMEZAWA Hiroyuki   2006-03-27  17  
67de648211fa04 Andy Whitcroft      2006-06-23  18  #define __pfn_to_page(pfn)	(mem_map + ((pfn) - ARCH_PFN_OFFSET))
67de648211fa04 Andy Whitcroft      2006-06-23  19  #define __page_to_pfn(page)	((unsigned long)((page) - mem_map) + \
a117e66ed45ac0 KAMEZAWA Hiroyuki   2006-03-27  20  				 ARCH_PFN_OFFSET)
a117e66ed45ac0 KAMEZAWA Hiroyuki   2006-03-27  21  
e5080a9677854b Mike Rapoport (IBM  2023-01-29  22) #ifndef pfn_valid
e5080a9677854b Mike Rapoport (IBM  2023-01-29  23) static inline int pfn_valid(unsigned long pfn)
e5080a9677854b Mike Rapoport (IBM  2023-01-29  24) {
e5080a9677854b Mike Rapoport (IBM  2023-01-29  25) 	/* avoid <linux/mm.h> include hell */
e5080a9677854b Mike Rapoport (IBM  2023-01-29  26) 	extern unsigned long max_mapnr;
e5080a9677854b Mike Rapoport (IBM  2023-01-29  27) 	unsigned long pfn_offset = ARCH_PFN_OFFSET;
e5080a9677854b Mike Rapoport (IBM  2023-01-29  28) 
e5080a9677854b Mike Rapoport (IBM  2023-01-29  29) 	return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
e5080a9677854b Mike Rapoport (IBM  2023-01-29  30) }
e5080a9677854b Mike Rapoport (IBM  2023-01-29 @31) #define pfn_valid pfn_valid
e5080a9677854b Mike Rapoport (IBM  2023-01-29  32) #endif
e5080a9677854b Mike Rapoport (IBM  2023-01-29  33) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
