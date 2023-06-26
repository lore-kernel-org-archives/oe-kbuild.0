Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44000AD22
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jun 2023 14:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687788101; x=1719324101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MpBDGsXoFS3a3Pm1L90L6+4uXRz+pZgl/Wwqm7jJ/xI=;
  b=hPZ3ZajfoSdbUETP4lp9SgpRoLQwf1uplVV8Pj8WNjZVN8OdwJdgFXWm
   b4IpCScV6FfPIlPx4axgpbAvABZ+rNiOPMJ4VTwiJHYl7HDBHia8E+pza
   s/E7Peh+2NsahYR8XE2VY95reVK1pkMTzuQLTHuFRwEwaNQ/DyEqfO1tv
   coS8ubadxCYh1ouSJqcPdeRIt3vAJy/JaiYKFEVSTlUV0fJmVWEEv5IIn
   PdxDr6VwGfmJ+tEeHdzk669BpWd02AnEI6xgcIb5IfIGWKv10MJcgcOlb
   CEHwdCWn8GDopLGp5+RJM0O5tsU1tKQVpEGCQdZGTpB5LEhY1SOYTO6kD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="424944456"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="424944456"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 07:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="786164284"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="786164284"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jun 2023 07:01:10 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDmmD-000Aib-1N;
	Mon, 26 Jun 2023 14:01:09 +0000
Date: Mon, 26 Jun 2023 22:00:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 1/5] mm/hotplug: Embed vmem_altmap details in memory
 block
Message-ID: <202306262123.rrNUwDvO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230626102212.119919-2-aneesh.kumar@linux.ibm.com>
References: <20230626102212.119919-2-aneesh.kumar@linux.ibm.com>
TO: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

Hi Aneesh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on powerpc/fixes arm64/for-next/core linus/master v6.4]
[cannot apply to powerpc/next next-20230626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V/mm-hotplug-Embed-vmem_altmap-details-in-memory-block/20230626-182455
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230626102212.119919-2-aneesh.kumar%40linux.ibm.com
patch subject: [RFC PATCH 1/5] mm/hotplug: Embed vmem_altmap details in memory block
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230626/202306262123.rrNUwDvO-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306262123.rrNUwDvO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306262123.rrNUwDvO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/s390/include/asm/mmu_context.h:11,
                    from arch/s390/include/asm/elf.h:173,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/memory.h:19,
                    from include/linux/memremap.h:5,
                    from include/linux/mm.h:31,
                    from include/linux/kvm_host.h:16,
                    from arch/s390/kernel/asm-offsets.c:11:
   arch/s390/include/asm/pgalloc.h: In function 'pmd_alloc_one':
>> arch/s390/include/asm/pgalloc.h:89:14: error: implicit declaration of function 'pgtable_pmd_page_ctor' [-Werror=implicit-function-declaration]
      89 |         if (!pgtable_pmd_page_ctor(virt_to_page(table))) {
         |              ^~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pgalloc.h: In function 'pmd_free':
>> arch/s390/include/asm/pgalloc.h:100:9: error: implicit declaration of function 'pgtable_pmd_page_dtor' [-Werror=implicit-function-declaration]
     100 |         pgtable_pmd_page_dtor(virt_to_page(pmd));
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h: At top level:
>> include/linux/mm.h:2896:20: error: conflicting types for 'pgtable_pmd_page_ctor'; have 'bool(struct page *)' {aka '_Bool(struct page *)'}
    2896 | static inline bool pgtable_pmd_page_ctor(struct page *page)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pgalloc.h:89:14: note: previous implicit declaration of 'pgtable_pmd_page_ctor' with type 'int()'
      89 |         if (!pgtable_pmd_page_ctor(virt_to_page(table))) {
         |              ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/mm.h:2905:20: warning: conflicting types for 'pgtable_pmd_page_dtor'; have 'void(struct page *)'
    2905 | static inline void pgtable_pmd_page_dtor(struct page *page)
         |                    ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/mm.h:2905:20: error: static declaration of 'pgtable_pmd_page_dtor' follows non-static declaration
   arch/s390/include/asm/pgalloc.h:100:9: note: previous implicit declaration of 'pgtable_pmd_page_dtor' with type 'void(struct page *)'
     100 |         pgtable_pmd_page_dtor(virt_to_page(pmd));
         |         ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/s390/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1287: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/pgtable_pmd_page_ctor +89 arch/s390/include/asm/pgalloc.h

190a1d722a5972 include/asm-s390/pgalloc.h      Martin Schwidefsky 2007-10-22   81  
3610cce87af069 include/asm-s390/pgalloc.h      Martin Schwidefsky 2007-10-22   82  static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long vmaddr)
^1da177e4c3f41 include/asm-s390/pgalloc.h      Linus Torvalds     2005-04-16   83  {
043d07084b5347 arch/s390/include/asm/pgalloc.h Martin Schwidefsky 2011-05-23   84  	unsigned long *table = crst_table_alloc(mm);
ec66ad66a0de87 arch/s390/include/asm/pgalloc.h Martin Schwidefsky 2014-02-12   85  
ec66ad66a0de87 arch/s390/include/asm/pgalloc.h Martin Schwidefsky 2014-02-12   86  	if (!table)
ec66ad66a0de87 arch/s390/include/asm/pgalloc.h Martin Schwidefsky 2014-02-12   87  		return NULL;
146e4b3c8b9207 include/asm-s390/pgalloc.h      Martin Schwidefsky 2008-02-09   88  	crst_table_init(table, _SEGMENT_ENTRY_EMPTY);
ec66ad66a0de87 arch/s390/include/asm/pgalloc.h Martin Schwidefsky 2014-02-12  @89  	if (!pgtable_pmd_page_ctor(virt_to_page(table))) {
ec66ad66a0de87 arch/s390/include/asm/pgalloc.h Martin Schwidefsky 2014-02-12   90  		crst_table_free(mm, table);
ec66ad66a0de87 arch/s390/include/asm/pgalloc.h Martin Schwidefsky 2014-02-12   91  		return NULL;
ec66ad66a0de87 arch/s390/include/asm/pgalloc.h Martin Schwidefsky 2014-02-12   92  	}
146e4b3c8b9207 include/asm-s390/pgalloc.h      Martin Schwidefsky 2008-02-09   93  	return (pmd_t *) table;
^1da177e4c3f41 include/asm-s390/pgalloc.h      Linus Torvalds     2005-04-16   94  }
ec66ad66a0de87 arch/s390/include/asm/pgalloc.h Martin Schwidefsky 2014-02-12   95  
ec66ad66a0de87 arch/s390/include/asm/pgalloc.h Martin Schwidefsky 2014-02-12   96  static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
ec66ad66a0de87 arch/s390/include/asm/pgalloc.h Martin Schwidefsky 2014-02-12   97  {
2416cefc504ba8 arch/s390/include/asm/pgalloc.h Gerald Schaefer    2019-10-22   98  	if (mm_pmd_folded(mm))
2416cefc504ba8 arch/s390/include/asm/pgalloc.h Gerald Schaefer    2019-10-22   99  		return;
ec66ad66a0de87 arch/s390/include/asm/pgalloc.h Martin Schwidefsky 2014-02-12 @100  	pgtable_pmd_page_dtor(virt_to_page(pmd));
ec66ad66a0de87 arch/s390/include/asm/pgalloc.h Martin Schwidefsky 2014-02-12  101  	crst_table_free(mm, (unsigned long *) pmd);
ec66ad66a0de87 arch/s390/include/asm/pgalloc.h Martin Schwidefsky 2014-02-12  102  }
^1da177e4c3f41 include/asm-s390/pgalloc.h      Linus Torvalds     2005-04-16  103  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
