Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C162D2E3E9
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Oct 2023 18:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FeJkWW8Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698343596; x=1729879596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w6WgHIEc/T0okg2mBQc4WMOBLmr7PE18sWoNBwgyBK4=;
  b=FeJkWW8YWTA/2kANDQK7pnxAEmgIkdCnUkl26s5lpP22NSquo4GPHaj0
   D6bU21kZoUApA98CXjYqh9rh16xGxPQS3tbsT7CUMqwtgIMLupSfc9d9z
   0VXbpxy1sVtG2Es73QhXl6u7BpBwIttAJYHGX5s7KSsUFpvyrk0U/W7Ue
   hhRPSiYnM5+jMOGrpY2oWKOHdUFDQ4Mu4GOKPAU3NT+2QM71g6TcACGG8
   03mwc5QHq2MmAROBirfFWrKr6AWNK1yU/Sg+m6yzmZ0eH2Lgrxr9FwrJ8
   eBAMxhSkMMMvouPKsqLj4wa47EJPs8aTggjJE9RQCSs9KLY5biMl3Qn0d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="418729662"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="418729662"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 11:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="825083211"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="825083211"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Oct 2023 11:06:34 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw4ka-000A19-2j;
	Thu, 26 Oct 2023 18:06:32 +0000
Date: Fri, 27 Oct 2023 02:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is
 included more than once.
Message-ID: <202310270227.J7UV7HBm-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   611da07b89fdd53f140d7b33013f255bf0ed8f34
commit: c94b1a012f93327a4fe16ab9455331f37e69242f arm64: memory: Make virt_to_pfn() a static inline
date:   5 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 5 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231027/202310270227.J7UV7HBm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310270227.J7UV7HBm-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is included more than once.

vim +335 arch/arm64/include/asm/memory.h

   333	
   334	/* Needed already here for resolving __phys_to_pfn() in virt_to_pfn() */
 > 335	#include <asm-generic/memory_model.h>
   336	
   337	static inline unsigned long virt_to_pfn(const void *kaddr)
   338	{
   339		return __phys_to_pfn(virt_to_phys(kaddr));
   340	}
   341	
   342	/*
   343	 * Drivers should NOT use these either.
   344	 */
   345	#define __pa(x)			__virt_to_phys((unsigned long)(x))
   346	#define __pa_symbol(x)		__phys_addr_symbol(RELOC_HIDE((unsigned long)(x), 0))
   347	#define __pa_nodebug(x)		__virt_to_phys_nodebug((unsigned long)(x))
   348	#define __va(x)			((void *)__phys_to_virt((phys_addr_t)(x)))
   349	#define pfn_to_kaddr(pfn)	__va((pfn) << PAGE_SHIFT)
   350	#define sym_to_pfn(x)		__phys_to_pfn(__pa_symbol(x))
   351	
   352	/*
   353	 *  virt_to_page(x)	convert a _valid_ virtual address to struct page *
   354	 *  virt_addr_valid(x)	indicates whether a virtual address is valid
   355	 */
   356	#define ARCH_PFN_OFFSET		((unsigned long)PHYS_PFN_OFFSET)
   357	
   358	#if defined(CONFIG_DEBUG_VIRTUAL)
   359	#define page_to_virt(x)	({						\
   360		__typeof__(x) __page = x;					\
   361		void *__addr = __va(page_to_phys(__page));			\
   362		(void *)__tag_set((const void *)__addr, page_kasan_tag(__page));\
   363	})
   364	#define virt_to_page(x)		pfn_to_page(virt_to_pfn(x))
   365	#else
   366	#define page_to_virt(x)	({						\
   367		__typeof__(x) __page = x;					\
   368		u64 __idx = ((u64)__page - VMEMMAP_START) / sizeof(struct page);\
   369		u64 __addr = PAGE_OFFSET + (__idx * PAGE_SIZE);			\
   370		(void *)__tag_set((const void *)__addr, page_kasan_tag(__page));\
   371	})
   372	
   373	#define virt_to_page(x)	({						\
   374		u64 __idx = (__tag_reset((u64)x) - PAGE_OFFSET) / PAGE_SIZE;	\
   375		u64 __addr = VMEMMAP_START + (__idx * sizeof(struct page));	\
   376		(struct page *)__addr;						\
   377	})
   378	#endif /* CONFIG_DEBUG_VIRTUAL */
   379	
   380	#define virt_addr_valid(addr)	({					\
   381		__typeof__(addr) __addr = __tag_reset(addr);			\
   382		__is_lm_address(__addr) && pfn_is_map_memory(virt_to_pfn(__addr));	\
   383	})
   384	
   385	void dump_mem_limit(void);
   386	#endif /* !ASSEMBLY */
   387	
   388	/*
   389	 * Given that the GIC architecture permits ITS implementations that can only be
   390	 * configured with a LPI table address once, GICv3 systems with many CPUs may
   391	 * end up reserving a lot of different regions after a kexec for their LPI
   392	 * tables (one per CPU), as we are forced to reuse the same memory after kexec
   393	 * (and thus reserve it persistently with EFI beforehand)
   394	 */
   395	#if defined(CONFIG_EFI) && defined(CONFIG_ARM_GIC_V3_ITS)
   396	# define INIT_MEMBLOCK_RESERVED_REGIONS	(INIT_MEMBLOCK_REGIONS + NR_CPUS + 1)
   397	#endif
   398	
   399	/*
   400	 * memory regions which marked with flag MEMBLOCK_NOMAP(for example, the memory
   401	 * of the EFI_UNUSABLE_MEMORY type) may divide a continuous memory block into
   402	 * multiple parts. As a result, the number of memory regions is large.
   403	 */
   404	#ifdef CONFIG_EFI
   405	#define INIT_MEMBLOCK_MEMORY_REGIONS	(INIT_MEMBLOCK_REGIONS * 8)
   406	#endif
   407	
 > 408	#include <asm-generic/memory_model.h>
   409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
