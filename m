Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7043922A811
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 23:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746746583; cv=none; b=XXJMdhiGI2fmUocHpVM/WiOcMS1Si7Xv1y8FA5BdV4HsMp1uZ92NXKfbMlL5Qa7vW7sD+455ag5BdUKHQAOK/N+OGNjskv8pMMSW4I3KTqBi1dyt9a8QvQzfZruhUreM3p0UWZ+VhN4utlvj4aHc1SBSjFvjtYFdqFjE5oB2S8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746746583; c=relaxed/simple;
	bh=kIEf2FQbYN33/jQGgaV2eescRF0VOpRQMuMUlY+rd0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gfjtWnk985zdEeKHyDLI11G2DwE3XvvCGXENM7n8eMetuXgZcT4WCBiJGyGkAlgfHulStMEdv+GPK4hiAE0kzo5+qJ6BEmbXOrsxp/X4DXdHfmjVgWYhsnGVwrcoMxKEK/Mu4h0DKbuh8YNrjTx52IVoDV9w2Xhs0194Xs8JvY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgBoIxAR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgBoIxAR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746746582; x=1778282582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kIEf2FQbYN33/jQGgaV2eescRF0VOpRQMuMUlY+rd0s=;
  b=kgBoIxARPbYNHNRfQ0J3uR4kYXjmep3FtTx51PXcj3NbMmAnzm3qe96P
   6R4n0PKTuO95i+WzfUGU944PRRrwKwNSCrk98Ze1S1lyqQ2DrLrnModCw
   izjDMZGaaDVDtGqhCzYYMpWvyko0Z3j7bjp2hLE1vNz1bjjJ3Jx4k1FLz
   1XOIK8Fv9KbG2HOH9vdXkzAQ4C50e4NaivRevOkRb75Fw2Senz15QIh3Z
   N/daTSnoKB6qF6c2scBSjf+yQxIAkxABKifZlLqNfy9Y26xy5luZmMwh5
   eT3Y5GeMHz++Wl/D/3rIFxGyJhd2oq+SHTfvKsj9AOnWbTbB2VpQNsobv
   g==;
X-CSE-ConnectionGUID: lyXtJmbDSpqc06meOZqHGA==
X-CSE-MsgGUID: 7pB1AIjvQFCEnBhm2n7ocQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="36184675"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="36184675"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 16:22:59 -0700
X-CSE-ConnectionGUID: 4WP4/oQhRTeo3QVmhzFyog==
X-CSE-MsgGUID: H82wzcPxSR+tyUiK2duk5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136400991"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 May 2025 16:22:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDAZr-000BSj-0F;
	Thu, 08 May 2025 23:22:55 +0000
Date: Fri, 9 May 2025 07:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-desktop 4/4]
 arch/x86/include/asm/io.h: asm/paravirt.h is included more than once.
Message-ID: <202505090708.3omaRzov-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   3d787fbb81fafa82ef096a45908185c6c4ab2ebc
commit: 7acb4f6bcac9871c147dc6652266b3ec4235d0a8 [4/4] ANDROID: x86/paravirt: Add pv_mmio_ops
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505090708.3omaRzov-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/include/asm/io.h: asm/paravirt.h is included more than once.

vim +45 arch/x86/include/asm/io.h

     4	
     5	/*
     6	 * This file contains the definitions for the x86 IO instructions
     7	 * inb/inw/inl/outb/outw/outl and the "string versions" of the same
     8	 * (insb/insw/insl/outsb/outsw/outsl). You can also use "pausing"
     9	 * versions of the single-IO instructions (inb_p/inw_p/..).
    10	 *
    11	 * This file is not meant to be obfuscating: it's just complicated
    12	 * to (a) handle it all in a way that makes gcc able to optimize it
    13	 * as well as possible and (b) trying to avoid writing the same thing
    14	 * over and over again with slight variations and possibly making a
    15	 * mistake somewhere.
    16	 */
    17	
    18	/*
    19	 * Thanks to James van Artsdalen for a better timing-fix than
    20	 * the two short jumps: using outb's to a nonexistent port seems
    21	 * to guarantee better timings even on fast machines.
    22	 *
    23	 * On the other hand, I'd like to be sure of a non-existent port:
    24	 * I feel a bit unsafe about using 0x80 (should be safe, though)
    25	 *
    26	 *		Linus
    27	 */
    28	
    29	 /*
    30	  *  Bit simplified and optimized by Jan Hubicka
    31	  *  Support of BIGMEM added by Gerhard Wichert, Siemens AG, July 1999.
    32	  *
    33	  *  isa_memset_io, isa_memcpy_fromio, isa_memcpy_toio added,
    34	  *  isa_read[wl] and isa_write[wl] fixed
    35	  *  - Arnaldo Carvalho de Melo <acme@conectiva.com.br>
    36	  */
    37	
    38	#include <linux/string.h>
    39	#include <linux/compiler.h>
    40	#include <linux/cc_platform.h>
    41	#include <asm/page.h>
    42	#include <asm/early_ioremap.h>
    43	#include <asm/pgtable_types.h>
    44	#include <asm/shared/io.h>
  > 45	#include <asm/paravirt.h>
    46	
    47	#define build_mmio_read(name, size, type, reg, barrier) \
    48	static inline type name(const volatile void __iomem *addr) \
    49	{ type ret; asm volatile("mov" size " %1,%0":reg (ret) \
    50	:"m" (*(volatile type __force *)addr) barrier); return ret; }
    51	
    52	#define build_mmio_write(name, size, type, reg, barrier) \
    53	static inline void name(type val, volatile void __iomem *addr) \
    54	{ asm volatile("mov" size " %0,%1": :reg (val), \
    55	"m" (*(volatile type __force *)addr) barrier); }
    56	
    57	build_mmio_read(raw_readb, "b", unsigned char, "=q", : "memory")
    58	build_mmio_read(raw_readw, "w", unsigned short, "=r", : "memory")
    59	build_mmio_read(raw_readl, "l", unsigned int, "=r", : "memory")
    60	
    61	build_mmio_read(raw_readb_relaxed, "b", unsigned char, "=q", )
    62	build_mmio_read(raw_readw_relaxed, "w", unsigned short, "=r", )
    63	build_mmio_read(raw_readl_relaxed, "l", unsigned int, "=r", )
    64	
    65	build_mmio_write(raw_writeb, "b", unsigned char, "q", : "memory")
    66	build_mmio_write(raw_writew, "w", unsigned short, "r", : "memory")
    67	build_mmio_write(raw_writel, "l", unsigned int, "r", : "memory")
    68	
    69	build_mmio_write(raw_writeb_relaxed, "b", unsigned char, "q", )
    70	build_mmio_write(raw_writew_relaxed, "w", unsigned short, "r", )
    71	build_mmio_write(raw_writel_relaxed, "l", unsigned int, "r", )
    72	
    73	#ifdef CONFIG_PARAVIRT
    74	#define readb pv_readb
    75	#define readw pv_readw
    76	#define readl pv_readl
    77	#define __raw_readb pv_readb_relaxed
    78	#define __raw_readw pv_readw_relaxed
    79	#define __raw_readl pv_readl_relaxed
    80	#define writeb pv_writeb
    81	#define writew pv_writew
    82	#define writel pv_writel
    83	#define __raw_writeb pv_writeb_relaxed
    84	#define __raw_writew pv_writew_relaxed
    85	#define __raw_writel pv_writel_relaxed
    86	#else
    87	#define readb raw_readb
    88	#define readw raw_readw
    89	#define readl raw_readl
    90	#define __raw_readb raw_readb_relaxed
    91	#define __raw_readw raw_readw_relaxed
    92	#define __raw_readl raw_readl_relaxed
    93	#define writeb raw_writeb
    94	#define writew raw_writew
    95	#define writel raw_writel
    96	#define __raw_writeb raw_writeb_relaxed
    97	#define __raw_writew raw_writew_relaxed
    98	#define __raw_writel raw_writel_relaxed
    99	#endif
   100	
   101	#define readb_relaxed(a) __raw_readb(a)
   102	#define readw_relaxed(a) __raw_readw(a)
   103	#define readl_relaxed(a) __raw_readl(a)
   104	
   105	#define writeb_relaxed(v, a) __raw_writeb(v, a)
   106	#define writew_relaxed(v, a) __raw_writew(v, a)
   107	#define writel_relaxed(v, a) __raw_writel(v, a)
   108	
   109	#ifdef CONFIG_X86_64
   110	
   111	build_mmio_read(raw_readq, "q", u64, "=r", : "memory")
   112	build_mmio_read(raw_readq_relaxed, "q", u64, "=r", )
   113	build_mmio_write(raw_writeq, "q", u64, "r", : "memory")
   114	build_mmio_write(raw_writeq_relaxed, "q", u64, "r", )
   115	
   116	#ifdef CONFIG_PARAVIRT
   117	#define readq			pv_readq
   118	#define __raw_readq		pv_readq_relaxed
   119	#define writeq			pv_writeq
   120	#define __raw_writeq		pv_writeq_relaxed
   121	#else
   122	#define readq			raw_readq
   123	#define __raw_readq		raw_readq_relaxed
   124	#define writeq			raw_writeq
   125	#define __raw_writeq		raw_writeq_relaxed
   126	#endif
   127	
   128	#define readq_relaxed(a)	__raw_readq(a)
   129	#define writeq_relaxed(v, a)	__raw_writeq(v, a)
   130	
   131	#endif
   132	
   133	#define ARCH_HAS_VALID_PHYS_ADDR_RANGE
   134	extern int valid_phys_addr_range(phys_addr_t addr, size_t size);
   135	extern int valid_mmap_phys_addr_range(unsigned long pfn, size_t size);
   136	
   137	/**
   138	 *	virt_to_phys	-	map virtual addresses to physical
   139	 *	@address: address to remap
   140	 *
   141	 *	The returned physical address is the physical (CPU) mapping for
   142	 *	the memory address given. It is only valid to use this function on
   143	 *	addresses directly mapped or allocated via kmalloc.
   144	 *
   145	 *	This function does not give bus mappings for DMA transfers. In
   146	 *	almost all conceivable cases a device driver should not be using
   147	 *	this function
   148	 */
   149	
   150	static inline phys_addr_t virt_to_phys(volatile void *address)
   151	{
   152		return __pa(address);
   153	}
   154	#define virt_to_phys virt_to_phys
   155	
   156	/**
   157	 *	phys_to_virt	-	map physical address to virtual
   158	 *	@address: address to remap
   159	 *
   160	 *	The returned virtual address is a current CPU mapping for
   161	 *	the memory address given. It is only valid to use this function on
   162	 *	addresses that have a kernel mapping
   163	 *
   164	 *	This function does not handle bus mappings for DMA transfers. In
   165	 *	almost all conceivable cases a device driver should not be using
   166	 *	this function
   167	 */
   168	
   169	static inline void *phys_to_virt(phys_addr_t address)
   170	{
   171		return __va(address);
   172	}
   173	#define phys_to_virt phys_to_virt
   174	
   175	/*
   176	 * Change "struct page" to physical address.
   177	 */
   178	#define page_to_phys(page)    ((dma_addr_t)page_to_pfn(page) << PAGE_SHIFT)
   179	
   180	/*
   181	 * ISA I/O bus memory addresses are 1:1 with the physical address.
   182	 * However, we truncate the address to unsigned int to avoid undesirable
   183	 * promotions in legacy drivers.
   184	 */
   185	static inline unsigned int isa_virt_to_bus(volatile void *address)
   186	{
   187		return (unsigned int)virt_to_phys(address);
   188	}
   189	#define isa_bus_to_virt		phys_to_virt
   190	
   191	/*
   192	 * The default ioremap() behavior is non-cached; if you need something
   193	 * else, you probably want one of the following.
   194	 */
   195	extern void __iomem *ioremap_uc(resource_size_t offset, unsigned long size);
   196	#define ioremap_uc ioremap_uc
   197	extern void __iomem *ioremap_cache(resource_size_t offset, unsigned long size);
   198	#define ioremap_cache ioremap_cache
   199	extern void __iomem *ioremap_prot(resource_size_t offset, unsigned long size, unsigned long prot_val);
   200	#define ioremap_prot ioremap_prot
   201	extern void __iomem *ioremap_encrypted(resource_size_t phys_addr, unsigned long size);
   202	#define ioremap_encrypted ioremap_encrypted
   203	
   204	/**
   205	 * ioremap     -   map bus memory into CPU space
   206	 * @offset:    bus address of the memory
   207	 * @size:      size of the resource to map
   208	 *
   209	 * ioremap performs a platform specific sequence of operations to
   210	 * make bus memory CPU accessible via the readb/readw/readl/writeb/
   211	 * writew/writel functions and the other mmio helpers. The returned
   212	 * address is not guaranteed to be usable directly as a virtual
   213	 * address.
   214	 *
   215	 * If the area you are trying to map is a PCI BAR you should have a
   216	 * look at pci_iomap().
   217	 */
   218	void __iomem *ioremap(resource_size_t offset, unsigned long size);
   219	#define ioremap ioremap
   220	
   221	extern void iounmap(volatile void __iomem *addr);
   222	#define iounmap iounmap
   223	
   224	#ifdef __KERNEL__
   225	
   226	void memcpy_fromio(void *, const volatile void __iomem *, size_t);
   227	void memcpy_toio(volatile void __iomem *, const void *, size_t);
   228	void memset_io(volatile void __iomem *, int, size_t);
   229	
   230	#define memcpy_fromio memcpy_fromio
   231	#define memcpy_toio memcpy_toio
   232	#define memset_io memset_io
   233	
   234	/*
   235	 * ISA space is 'always mapped' on a typical x86 system, no need to
   236	 * explicitly ioremap() it. The fact that the ISA IO space is mapped
   237	 * to PAGE_OFFSET is pure coincidence - it does not mean ISA values
   238	 * are physical addresses. The following constant pointer can be
   239	 * used as the IO-area pointer (it can be iounmapped as well, so the
   240	 * analogy with PCI is quite large):
   241	 */
   242	#define __ISA_IO_base ((char __iomem *)(PAGE_OFFSET))
   243	
   244	#endif /* __KERNEL__ */
   245	
   246	extern void native_io_delay(void);
   247	
   248	extern int io_delay_type;
   249	extern void io_delay_init(void);
   250	
   251	#if defined(CONFIG_PARAVIRT)
 > 252	#include <asm/paravirt.h>
   253	#else
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
