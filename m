Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FB1184E
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Mar 2023 00:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678320309; x=1709856309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dRIlbZbagq0Ni223e6j6kuUZ/VH4Tka8yRt0shPpQas=;
  b=BdSq+3pEkuNnPkUpELZh+5Hidtl/Qu6D0NQWTJ2Zi/6Scz95pg9Wwg1T
   +mWvYB7vikRXnIuD0ERVmBmgaAR1tcHynDH69PvdKSvslE66Sm/AEuKYr
   6k3ZxKhLi3OuTevMXwBnOSGVE/gcp1hx9fPDY9l0p7BYtw9pn4s8vWt9o
   EuXdWB0mufwqc/eKxHRhpWhY5AuQ9OUxeC4Pdbe1OCbnEmoIJMmMER/3A
   SBBkh6anbNX5UlVvMTXJdhvoaAi7HO2a50ngdqmtRKm20dV/t6J49xpCI
   55uM/Psmhdofi0+fsLNfvZvabLQ+QpSQBkzC0wDDk4fSXVfACLyRZvQQh
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333780752"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="333780752"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 16:05:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="741320943"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="741320943"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Mar 2023 16:05:04 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa3mJ-0002Vd-1c;
	Thu, 09 Mar 2023 00:05:03 +0000
Date: Thu, 9 Mar 2023 08:04:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ardb:efi-x86-nx 13/24] arch/x86/boot/compressed/pgtable_64.c:207:1:
 sparse: sparse: unused label 'out'
Message-ID: <202303090704.0UgYxcej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/boot/compressed/pgtable_64.c:207:1: sparse: sparse: unused label 'out'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Evgeniy Baskov <baskov@ispras.ru>
CC: Ard Biesheuvel <ardb@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-x86-nx
head:   8171142f3e4c96f6be75a6195de59d1607f1bd4b
commit: dcc510e8b8a879e2d3ebc0271ca61ec76efc5aa3 [13/24] x86/boot: Split trampoline and pt init code
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/20230309/202303090704.0UgYxcej-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=dcc510e8b8a879e2d3ebc0271ca61ec76efc5aa3
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb efi-x86-nx
        git checkout dcc510e8b8a879e2d3ebc0271ca61ec76efc5aa3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303090704.0UgYxcej-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/boot/compressed/pgtable_64.c:207:1: sparse: sparse: unused label 'out'

vim +/out +207 arch/x86/boot/compressed/pgtable_64.c

dcc510e8b8a879 Evgeniy Baskov     2022-10-25  171  
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  172  struct paging_config paging_prepare(void *rmode)
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  173  {
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  174  	struct paging_config paging_config = {};
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  175  	bool early_trampoline_alloc = 0;
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  176  
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  177  	/* Initialize boot_params. Required for cmdline_find_option_bool(). */
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  178  	boot_params = rmode;
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  179  
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  180  	/*
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  181  	 * We only need to find trampoline placement, if we have
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  182  	 * not already done it from libstub.
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  183  	 */
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  184  
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  185  	paging_config.trampoline_start = find_trampoline_placement();
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  186  	trampoline_32bit = (unsigned long *)paging_config.trampoline_start;
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  187  	early_trampoline_alloc = 0;
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  188  
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  189  	/*
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  190  	 * Preserve trampoline memory.
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  191  	 * When trampoline is located in memory
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  192  	 * owned by us, i.e. allocated in EFISTUB,
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  193  	 * we don't care about previous contents
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  194  	 * of this memory so copying can also be skipped.
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  195  	 */
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  196  	memcpy(trampoline_save, trampoline_32bit, TRAMPOLINE_32BIT_SIZE);
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  197  
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  198  	/* Clear trampoline memory first */
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  199  	memset(trampoline_32bit, 0, TRAMPOLINE_32BIT_SIZE);
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  200  
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  201  	/* Copy trampoline code in place */
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  202  	memcpy(trampoline_32bit + TRAMPOLINE_32BIT_CODE_OFFSET / sizeof(unsigned long),
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  203  			&trampoline_32bit_src, TRAMPOLINE_32BIT_CODE_SIZE);
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  204  
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  205  	paging_config.l5_required = trampoline_pgtable_init(boot_params);
dcc510e8b8a879 Evgeniy Baskov     2022-10-25  206  
e9d0e6330eb81c Kirill A. Shutemov 2018-02-26 @207  out:
4440977be1347d Kirill A. Shutemov 2018-02-09  208  	return paging_config;
08529078d8d9ad Kirill A. Shutemov 2017-12-04  209  }
fb5268354d20b8 Kirill A. Shutemov 2018-02-26  210  

:::::: The code at line 207 was first introduced by commit
:::::: e9d0e6330eb81ca49bdd8849cc52b3b0f70ed5cb x86/boot/compressed/64: Prepare new top-level page table for trampoline

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
